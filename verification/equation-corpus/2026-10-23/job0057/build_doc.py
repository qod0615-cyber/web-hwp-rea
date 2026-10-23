"""Have Hangul create every equation itself (EquationCreate) into numbered paragraphs, save HWPX + PDF.
Usage: build_doc.py LIST_JSON WORK_DIR [MAX_PER_DOC] [LIMIT]
Pauses while the user uses mouse/keyboard (user_mouse_guard); stops on STOP files."""
import json, re, sys, time, zipfile
from pathlib import Path
import win32com.client as w

HERE = Path(__file__).parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, r"C:\Users\K\Desktop\Claude\한글 REA\도구_이전조사")
import dlg_watch
import user_mouse_guard as guard

LIST, WORK = Path(sys.argv[1]), Path(sys.argv[2])
MAX_PER_DOC = int(sys.argv[3]) if len(sys.argv) > 3 else 5000
LIMIT = int(sys.argv[4]) if len(sys.argv) > 4 else None
PROGRESS = WORK / "progress.json"


def chunks(items):
    """Every document starts with the 12 control equations; total per doc <= MAX_PER_DOC."""
    ctrl = [i for i in items if i["kind"] == "control"]
    rest = [i for i in items if i["kind"] != "control"]
    size = MAX_PER_DOC - len(ctrl)
    return [ctrl + rest[k:k + size] for k in range(0, len(rest), size)] or [ctrl]


def act(hwp, name):
    hwp.HAction.Run(name)


def insert_text(hwp, text):
    p = hwp.HParameterSet.HInsertText
    hwp.HAction.GetDefault("InsertText", p.HSet)
    p.Text = text
    hwp.HAction.Execute("InsertText", p.HSet)


def base_unit(it):
    """Per-item size: request item's "baseUnit" (kept under job_item by poll_jobs), else 1100. Controls stay 1100."""
    v = it.get("baseUnit", (it.get("job_item") or {}).get("baseUnit"))
    return int(v) if v is not None else 1100


def create_eq(hwp, script, base=1100):
    p = hwp.HParameterSet.HEqEdit
    hwp.HAction.GetDefault("EquationCreate", p.HSet)
    p.string = script
    p.BaseUnit = base
    p.EqFontName = "HYhwpEQ"
    return hwp.HAction.Execute("EquationCreate", p.HSet)


def check_xml(path, expected):
    """Return problems for the first equations of a saved HWPX."""
    s = zipfile.ZipFile(path).read("Contents/section0.xml").decode("utf-8")
    eqs = re.findall(r"<hp:equation\b([^>]*)>.*?<hp:pos treatAsChar=\"(\d)\".*?<hp:script>(.*?)</hp:script>", s, re.S)
    import html
    probs = []
    for (a, tac, sc), (exp, base) in zip(eqs, expected):
        if html.unescape(sc) != exp:
            probs.append(f"script {sc!r} != {exp!r}")
        if f'baseUnit="{base}"' not in a or 'font="HYhwpEQ"' not in a or tac != "1":
            probs.append(f"attrs {a[:200]} treatAsChar={tac}")
    if len(eqs) < len(expected):
        probs.append(f"only {len(eqs)} equations")
    return probs


def save_progress(**kw):
    PROGRESS.write_text(json.dumps(kw, ensure_ascii=False), encoding="utf-8")


def main():
    items = json.loads(LIST.read_text(encoding="utf-8"))
    if LIMIT:
        items = items[:LIMIT]
    docs = chunks(items)
    WORK.mkdir(parents=True, exist_ok=True)
    total = len({i["n"] for i in items})
    guard.start_guard_thread()
    log, stop = dlg_watch.start()
    hwp = w.DispatchEx("HWPFrame.HwpObject")
    hwp.XHwpWindows.Item(0).Visible = True
    hwp.RegisterModule("FilePathCheckDLL", "AstrisPathChecker")
    hwp.SetMessageBoxMode(0x00020021)
    meta = dict(hwp_version=hwp.Version, docs=[], started=time.strftime("%Y-%m-%d %H:%M:%S"), pauses=0)
    t0 = time.time()
    try:
        for d, doc in enumerate(docs, 1):
            name = "결과" if d == 1 else f"결과_{d}"
            if d > 1:
                hwp.Clear(1)
                act(hwp, "FileNew")
            insert_text(hwp, f"HYhwpEQ 서로 다른 식 {total}개")
            act(hwp, "BreakPara")
            fails = []
            for k, it in enumerate(doc, 1):
                t_wait = time.time()
                guard.wait()
                if time.time() - t_wait > 1:
                    meta["pauses"] += 1
                insert_text(hwp, f"{it['n']:05d} ")
                ok = create_eq(hwp, it["script"], base_unit(it))
                act(hwp, "Cancel")
                act(hwp, "MoveDocEnd")
                if not ok:
                    fails.append(dict(n=it["n"], script=it["script"], reason="EquationCreate returned False", doc=name))
                if k < len(doc):
                    act(hwp, "BreakPara")
                if d == 1 and k == 3:
                    probe = WORK / "probe3.hwpx"
                    hwp.SaveAs(str(probe), "HWPX", "")
                    probs = check_xml(probe, [(i["script"], base_unit(i)) for i in doc[:3]])
                    meta["probe3"] = probs or "ok"
                    if probs:
                        raise SystemExit(f"probe failed: {probs}")
                if k % 100 == 0:
                    save_progress(doc=name, done=k, of=len(doc), elapsed=round(time.time() - t0), fails=len(fails))
            hwpx, pdf = WORK / f"{name}.hwpx", WORK / f"{name}.pdf"
            meta["docs"].append(dict(name=name, count=len(doc), first=doc[0]["n"], last=doc[-1]["n"],
                                     save_hwpx=bool(hwp.SaveAs(str(hwpx), "HWPX", "")),
                                     save_pdf=bool(hwp.SaveAs(str(pdf), "PDF", "")),
                                     pages=hwp.PageCount, fails=fails))
            save_progress(doc=name, done=len(doc), of=len(doc), elapsed=round(time.time() - t0), saved=True)
    finally:
        stop.set()
        meta["dialogs"] = log
        meta["seconds"] = round(time.time() - t0)
        meta["finished"] = time.strftime("%Y-%m-%d %H:%M:%S")
        (WORK / "build_meta.json").write_text(json.dumps(meta, ensure_ascii=False, indent=1), encoding="utf-8")
        try:
            hwp.Clear(1)
            hwp.Quit()
        except Exception:
            pass


if __name__ == "__main__":
    main()
