"""Build 수식목록.json: C (12 control) -> A (distinct HYhwpEQ examples) -> B (random, seeded).
Usage: gen_list.py SRC_DIR INSTRUCTION_MD OUT_JSON [N_RANDOM] [SEED]"""
import html, json, random, re, sys, zipfile
from collections import OrderedDict
from pathlib import Path

HANGUL = re.compile(r"[가-힣ㄱ-ㅎㅏ-ㅣ]")
EQ_RE = re.compile(r"<hp:equation\b([^>]*)>(.*?)</hp:equation>", re.S)


def attr(a, name):
    m = re.search(rf'\b{name}="([^"]*)"', a)
    return m.group(1) if m else None


def control_rows(md_path):
    rows = []
    for line in Path(md_path).read_text(encoding="utf-8").splitlines():
        m = re.match(r"^\| (`` (.*) ``|`(.*)`) \| (\d+) \| (\d+) \| (\d+) \|$", line)
        if m:
            script = m.group(2) if m.group(2) is not None else m.group(3)
            rows.append(dict(script=script, w=int(m.group(4)), h=int(m.group(5)), baseLine=int(m.group(6))))
    assert len(rows) == 12, rows
    return rows


def examples(src_dir):
    found, korean, blank, other_font = OrderedDict(), OrderedDict(), 0, 0
    files = sorted(Path(src_dir).glob("*.hwpx"))
    for f in files:
        z = zipfile.ZipFile(f)
        secs = sorted((n for n in z.namelist() if re.fullmatch(r"Contents/section\d+\.xml", n)),
                      key=lambda n: int(re.search(r"(\d+)\.xml$", n).group(1)))
        for n in secs:
            for a, body in EQ_RE.findall(z.read(n).decode("utf-8")):
                if attr(a, "font") != "HYhwpEQ":
                    other_font += 1
                    continue
                m = re.search(r"<hp:script>(.*?)</hp:script>", body, re.S)
                raw = m.group(1) if m else ""
                if not raw.strip(" `~\t\r\n"):
                    blank += 1
                    continue
                if HANGUL.search(html.unescape(raw)):
                    korean[raw] = korean.get(raw, 0) + 1
                    continue
                if raw in found:
                    found[raw]["count"] += 1
                    continue
                sz = re.search(r'<hp:sz width="(\d+)"[^>]*height="(\d+)"', body)
                found[raw] = dict(count=1, source=f.name,
                                  orig=dict(baseUnit=int(attr(a, "baseUnit")), w=int(sz.group(1)),
                                            h=int(sz.group(2)), baseLine=int(attr(a, "baseLine"))))
    stats = dict(files=[f.name for f in files], blank_skipped=blank, other_font_skipped=other_font,
                 korean_distinct=len(korean), korean_total=sum(korean.values()))
    return found, stats


# ---------- B: random equations ----------
class Gen:
    LET = list("abcdefghijklmnpqrstuvwxyz") + list("ABCDEFGHKLMNPQRSTUVXYZ")
    GREEK = ["alpha", "beta", "gamma", "theta", "pi", "sigma", "omega", "lambda", "mu", "delta", "epsilon", "phi"]
    REL = ["=", "<", ">", "<=", ">=", "!=", "LEQ", "GEQ", "NE"]
    BIN = ["+", "-", "+-", "times", "div", "cdot", "CDOT"]
    FUN = ["sin", "cos", "tan", "log", "ln", "exp"]

    def __init__(self, rnd):
        self.r = rnd

    def sp(self):
        """Optional quarter (`) / full (~) spacing, sometimes doubled."""
        r = self.r.random()
        if r < 0.72:
            return " "
        return self.r.choice(["`", "~", "``", "` ", " `", "~~", "` `"])

    def num(self):
        r = self.r.random()
        if r < 0.55:
            return str(self.r.randint(0, 12))
        if r < 0.8:
            return str(self.r.randint(10, 999))
        return self.r.choice(["1.96", "0.5", "2.58", "3.14", "0.25", "1.5", "0.01"])

    def var(self):
        r = self.r.random()
        if r < 0.62:
            return self.r.choice(self.LET[:25] if self.r.random() < 0.8 else self.LET)
        if r < 0.8:
            return self.r.choice(self.GREEK)
        if r < 0.9:
            return "rm " + self.r.choice("ABCDEFGHPQO")
        if r < 0.96:
            return "rm{" + "".join(self.r.sample("ABCDEFGHPQO", self.r.randint(2, 3))) + "}"
        return "it " + self.r.choice("abxyk")

    def atom(self, d):
        r = self.r.random()
        if d <= 0 or r < 0.45:
            return self.var() if self.r.random() < 0.6 else self.num()
        if r < 0.55:
            return f"{self.var()} ^{{{self.expr(d-1, short=True)}}}"
        if r < 0.62:
            return f"{self.var()} _{{{self.expr(d-1, short=True)}}}"
        if r < 0.66:
            return f"{self.var()} _{{{self.expr(d-1, short=True)}}} ^{{{self.expr(d-1, short=True)}}}"
        if r < 0.73:
            return f"{{{self.expr(d-1)}}} over {{{self.expr(d-1)}}}"
        if r < 0.78:
            return f"sqrt {{{self.expr(d-1)}}}"
        if r < 0.8:
            return f"root {{{self.r.randint(3, 5)}}} of {{{self.expr(d-1)}}}"
        if r < 0.86:
            return self.paren(self.expr(d-1))
        if r < 0.91:
            f = self.r.choice(self.FUN)
            if f == "log" and self.r.random() < 0.4:
                f = f"log _{{{self.r.choice(['2', '3', '10', 'a'])}}}"
            elif f in ("sin", "cos", "tan") and self.r.random() < 0.3:
                f = f"{f} ^{{2}}"
            return f"{f}{self.sp()}{self.var()}"
        if r < 0.94:
            return f"{self.r.choice(['bar', 'vec'])}{{{self.r.choice(['rm AB', 'rm OP', 'x', 'rm{PQ}', 'a'])}}}"
        if r < 0.96:
            return self.r.choice(["f", "g", "y"]) + self.r.choice(["`'", " prime", "''"]) + self.sp() + self.paren("x")
        return f"{{}}_{{{self.r.randint(2, 9)}}}C_{{{self.r.randint(0, 4)}}}"

    def paren(self, inner):
        o, c = self.r.choice([("(", ")"), ("(", ")"), ("[", "]"), ("{", "}"), ("|", "|")])
        kw = self.r.choice(["LEFT", "LEFT", "left"])
        kw2 = "RIGHT" if kw == "LEFT" else "right"
        return f"{kw} {o} {inner} {kw2} {c}"

    def expr(self, d, short=False):
        n = self.r.randint(1, 2 if short else 4)
        out = self.atom(d)
        for _ in range(n - 1):
            out += self.sp() + self.r.choice(self.BIN) + self.sp() + self.atom(d)
        return out

    def big(self, d):
        r = self.r.random()
        a, b = self.r.choice([("0", "1"), ("1", "2"), ("a", "b"), ("-1", "3"), ("0", "pi")])
        if r < 0.35:
            return f"int _{{{a}}} ^{{{b}}} {self.expr(d)}`dx"
        if r < 0.6:
            return f"sum _{{k=1}} ^{{n}} {self.expr(d)}"
        if r < 0.67:
            return f"prod _{{k=1}} ^{{n}} {self.expr(d)}"
        to = self.r.choice(["a", "0", "INF", "1+", "2-", "-INF", "0+"])
        arrow = self.r.choice(["->", "rarrow"])
        return f"lim _{{x {arrow} {to}}} {self.expr(d)}"

    def one(self):
        d = self.r.choice([0, 1, 1, 2, 2, 3])
        r = self.r.random()
        if r < 0.12:
            return self.atom(0) if self.r.random() < 0.5 else f"{self.var()}{self.sp()}{self.r.choice(self.BIN)}{self.sp()}{self.num()}"
        if r < 0.22:
            return self.big(d) + f" {self.r.choice(self.REL)} {self.expr(min(d, 1))}"
        if r < 0.27:
            return "BOX{" + self.expr(d) + "}"
        if r < 0.32:
            return f"{self.var()} = {{cases{{{self.expr(1)}&{self.var()} {self.r.choice(self.REL)} {self.num()}#{self.expr(1)}&{self.var()} {self.r.choice(self.REL)} {self.num()}}}}}"
        if r < 0.35:
            return "matrix{" + " # ".join(" & ".join(self.atom(0) for _ in range(2)) for _ in range(2)) + "}"
        if r < 0.42:
            return f"{self.r.choice(['f', 'g', 'h'])}{self.sp()}{self.paren('x')} = {self.expr(d)}"
        if r < 0.47:
            return f"{self.expr(1)}{self.r.choice([',', ':', ' , '])}{self.sp()}{self.expr(1)}"
        s = self.expr(d)
        for _ in range(self.r.choice([0, 1, 1, 2])):
            s += f" {self.r.choice(self.REL)} {self.expr(d)}"
        return s


def randoms(n, seed, exclude):
    g = Gen(random.Random(seed))
    out, seen, tries = [], set(exclude), 0
    while len(out) < n:
        tries += 1
        s = g.one().strip()
        if len(s) > 240 or s in seen:
            continue
        seen.add(s)
        out.append(s)
    return out, tries


def main():
    src_dir, md, out_json = sys.argv[1:4]
    n_rand = int(sys.argv[4]) if len(sys.argv) > 4 else 3000
    seed = int(sys.argv[5]) if len(sys.argv) > 5 else 20261017
    ctrl = control_rows(md)
    ex, stats = examples(src_dir)
    items, n = [], 0
    for c in ctrl:
        n += 1
        items.append(dict(n=n, script=c["script"], kind="control", count=0, source="지시문 C",
                          orig=dict(baseUnit=1100, w=c["w"], h=c["h"], baseLine=c["baseLine"])))
    ctrl_set = {c["script"] for c in ctrl}
    for raw, v in ex.items():
        s = html.unescape(raw)
        if s in ctrl_set:
            continue
        n += 1
        items.append(dict(n=n, script=s, script_xml=raw, kind="example", **v))
    rnd, tries = randoms(n_rand, seed, {i["script"] for i in items})
    for s in rnd:
        n += 1
        items.append(dict(n=n, script=s, kind="random", count=0, source=f"seed={seed}", orig=None))
    Path(out_json).write_text(json.dumps(items, ensure_ascii=False, indent=1), encoding="utf-8")
    stats.update(control=len(ctrl), example=sum(i["kind"] == "example" for i in items),
                 random=len(rnd), random_seed=seed, random_tries=tries, total=len(items))
    Path(out_json).with_name("목록통계.json").write_text(json.dumps(stats, ensure_ascii=False, indent=1), encoding="utf-8")
    print(json.dumps(stats, ensure_ascii=False))


if __name__ == "__main__":
    main()
