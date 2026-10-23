"""Verify saved 결과*.hwpx against 수식목록.json; write 검증.json and 실패.json.
Usage: verify.py LIST_JSON WORK_DIR"""
import html, json, re, sys, zipfile
from pathlib import Path

LIST, WORK = Path(sys.argv[1]), Path(sys.argv[2])
items = {i["n"]: i for i in json.loads(LIST.read_text(encoding="utf-8"))}
PARA = re.compile(r"<hp:p\b[^>]*>(.*?)</hp:p>(?=<hp:p\b|</hs:sec>)", re.S)
NUM = re.compile(r"<hp:t>(\d{5}) </hp:t>")
EQ = re.compile(r"<hp:equation\b([^>]*)>(.*?)</hp:equation>", re.S)


def a(attrs, k):
    m = re.search(rf'\b{k}="([^"]*)"', attrs)
    return m.group(1) if m else None


out = dict(docs=[], control=[], mismatch=[], attr_bad=[], counts={})
fails = []
for doc in sorted(WORK.glob("결과*.hwpx")):
    s = zipfile.ZipFile(doc).read("Contents/section0.xml").decode("utf-8")
    seen, n_eq = [], 0
    for body in PARA.findall(s):
        m = NUM.search(body)
        if not m:
            continue
        n = int(m.group(1))
        seen.append(n)
        it = items[n]
        e = EQ.search(body)
        if not e:
            fails.append(dict(n=n, script=it["script"], doc=doc.name, reason="no equation object in paragraph"))
            continue
        n_eq += 1
        attrs, inner = e.groups()
        raw = re.search(r"<hp:script>(.*?)</hp:script>", inner, re.S)
        raw = raw.group(1) if raw else ""
        sz = re.search(r'<hp:sz width="(\d+)"[^>]*height="(\d+)"', inner)
        tac = re.search(r'treatAsChar="(\d)"', inner).group(1)
        got = dict(w=int(sz.group(1)), h=int(sz.group(2)), baseLine=int(a(attrs, "baseLine")))
        it.setdefault("result", {})[doc.name] = dict(got, baseUnit=int(a(attrs, "baseUnit") or 0))
        base = it.get("baseUnit", (it.get("job_item") or {}).get("baseUnit", 1100))
        if html.unescape(raw).encode("utf-8") != it["script"].encode("utf-8"):
            out["mismatch"].append(dict(n=n, doc=doc.name, put=it["script"], saved_xml=raw))
        if it.get("script_xml") is not None and raw != it["script_xml"]:
            out.setdefault("xml_escape_diff", []).append(dict(n=n, orig_xml=it["script_xml"], saved_xml=raw))
        if a(attrs, "baseUnit") != str(int(base)) or a(attrs, "font") != "HYhwpEQ" or tac != "1":
            out["attr_bad"].append(dict(n=n, doc=doc.name, baseUnit=a(attrs, "baseUnit"), font=a(attrs, "font"), treatAsChar=tac))
        if it["kind"] == "control":
            exp = {k: it["orig"][k] for k in ("w", "h", "baseLine")}
            out["control"].append(dict(n=n, doc=doc.name, script=it["script"], expected=exp, got=got, match=exp == got))
    out["docs"].append(dict(doc=doc.name, paragraphs=len(seen), equations=n_eq, first=seen[0] if seen else None, last=seen[-1] if seen else None))
    out["counts"][doc.name] = n_eq

covered = {n for n, i in items.items() if i.get("result")} | {f["n"] for f in fails}
out["missing_numbers"] = sorted(set(items) - covered)
out["equations_total"] = sum(d["equations"] for d in out["docs"])
out["list_total"] = len(items)
out["fails"] = len(fails)
c1 = [c for c in out["control"] if c["doc"] == "결과.hwpx"]
out["control_match"] = f"{sum(c['match'] for c in c1)}/{len(c1)}"
(WORK / "검증.json").write_text(json.dumps(out, ensure_ascii=False, indent=1), encoding="utf-8")
(WORK / "실패.json").write_text(json.dumps(fails, ensure_ascii=False, indent=1), encoding="utf-8")
(WORK / "수식목록_결과.json").write_text(json.dumps(list(items.values()), ensure_ascii=False, indent=1), encoding="utf-8")
print(json.dumps({k: out[k] for k in ("docs", "equations_total", "list_total", "fails", "control_match")}, ensure_ascii=False))
print("mismatch", len(out["mismatch"]), "attr_bad", len(out["attr_bad"]), "missing", len(out["missing_numbers"]),
      "xml_escape_diff", len(out.get("xml_escape_diff", [])))
for c in c1:
    if not c["match"]:
        print("CTRL DIFF", c["n"], repr(c["script"]), c["expected"], c["got"])
