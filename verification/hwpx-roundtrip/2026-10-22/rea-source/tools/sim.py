"""HwpPlugin spacing simulator (REA 4th round). Usage: python sim.py  -> checks against job 수식목록.json widths."""
import json, glob, os, re, sys
R = os.environ.get('REA_ROOT', r'C:/Users/K/Desktop/Claude/한글 REA')   # job data root (results/한글자동시험/*/수식목록.json)
_here = os.path.dirname(os.path.abspath(__file__))
_mpath = os.path.join(_here, 'hyhwpeq_metrics.json')
M = json.load(open(_mpath if os.path.exists(_mpath) else R + '/R/hyhwpeq_metrics.json', encoding='utf-8'))
CM, GL = M['best_cmap_mapping'], M['glyphs']
def adv(code):
    gn = CM.get('U+%04X' % code)
    return GL[gn]['advance_width'] if gn else None
PUA = dict(x.rsplit(':', 1) for x in ("A:e000 B:e001 C:e002 D:e003 E:e004 F:e005 G:e006 H:e007 I:e008 J:e009 K:e00a L:e00b M:e00c N:e00d O:e00e P:e00f Q:e010 R:e011 S:e012 T:e013 U:e014 V:e015 W:e016 X:e017 Y:e018 Z:e019 a:e0e5 b:e0e6 c:e0e7 d:e0e8 e:e0e9 f:e0ea g:e0eb h:e0ec i:e0ed j:e0ee k:e0ef l:e0f0 m:e0f1 n:e0f2 o:e0f3 p:e0f4 q:e0f5 r:e0f6 s:e0f7 t:e0f8 u:e0f9 v:e0fa w:e0fb x:e0fc y:e0fd z:e0fe 1:e034 2:e035 3:e036 4:e037 5:e038 6:e039 7:e03a 8:e03b 9:e03c 0:e03d !:e03e *:e043 (:e044 ):e045 -:e046 =:e047 +:e048 [:e049 ]:e04a |:e04d ;:e04e ::e04f ':e050 ,:e052 .:e053 /:e054 <:e055 >:e056 ?:e057").split())
PUA = {k: int(v, 16) for k, v in PUA.items()}
ASCLS = {',': 7, '+': 3, '-': 3, '=': 4, '<': 4, '>': 4, '*': 7, '(': 5, ')': 6, '{': 5, '}': 6, '[': 5, ']': 6, ':': 4, '~': 4}
KW = {'times': (0xd7, 3), 'div': (0xf7, 3), '+-': (0xb1, 3), '-+': (0x2213, 3), 'leq': (0x2264, 4), 'geq': (0x2265, 4),
      '<=': (0x2266, 4), '>=': (0x2267, 4), 'cdot': (0x22c5, 1), 'neq': (0x2260, 3), '!=': (0x2260, 3), 'ne': (0x2260, 3),
      'ge': (0x2265, 4), 'le': (0x2264, 4), 'alpha': (0xe09c, 1), 'beta': (0xe09d, 1), 'pi': (0xe0ab, 1), 'theta': (0xe0a3, 1)}
KT = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'kwtab.json')))
def kwl(t):
    for k in (t, t.upper(), t.lower()):
        if k in KT: return KT[k]
        if k.lower() in KW: return KW[k.lower()]
    return None
def md(a, b, c):  # Win32 MulDiv
    v = abs(a * b) + c // 2
    v //= c
    return v if a * b >= 0 else -v
def gw(code, s):
    hp = 2 * md(s // 2, 96, 7200)            # horizontal ppem = 2 x round(width px)
    a = adv(code)
    return int(a * hp / 1024 + 0.5) * 75 if a else None
def T(a, b):
    t = [[0]*10, [0,0,1,2,3,1,1,0,1,0], [0,1,3,2,3,0,0,0,1,0], [0,2,0,0,0,2,0,0,2,0], [0,3,3,0,0,3,0,0,3,0],
         [0]*10, [0,0,1,2,3,0,0,0,1,0], [0,1,1,0,1,1,1,1,1,0], [0,1,1,2,3,1,0,1,1,0], [0]*10]
    return t[a][b]
def tok(s):
    return re.findall(r'\{|\}|\^|_|`|~|[A-Za-z]+|[0-9]+|<->|->|<-|\+-|-\+|<=|>=|!=|\S', s)
class P:
    def __init__(s, t): s.t, s.i = t, 0
    def peek(s): return s.t[s.i] if s.i < len(s.t) else None
    def nxt(s): s.i += 1; return s.t[s.i-1]
def parse_row(p, stop=None):
    nodes = []
    while p.peek() is not None and p.peek() != stop:
        t = p.nxt()
        if t == '{':
            g = parse_row(p, '}'); p.nxt(); nodes.append(('grp', g))
        elif t in ('^', '_'):
            arg = parse_atom(p)
            if nodes and nodes[-1][0] == 'scr':
                nodes[-1][2 if t == '^' else 3].append(arg) if False else None
                sc = nodes[-1]; sc[1][t] = arg
            else:
                nodes.append(['scr', {t: arg}])
        elif t.lower() == 'over':
            num = nodes.pop(); den = parse_atom(p); nodes.append(('frac', num, den))
        elif t.lower() == 'sqrt':
            nodes.append(('sqrt', parse_atom(p)))
        elif t in ('it', 'rm', 'IT', 'RM'):
            nodes.append(('sty', t))
        elif kwl(t) is not None and not (len(t) == 1):
            nodes.append(('ch', kwl(t)[0], kwl(t)[1]))
        elif t in ('`', '~'):
            nodes.append(('sp', t))
        elif re.fullmatch(r'[A-Za-z]+', t):
            for c in t: nodes.append(('ch', PUA[c], 1))
        elif re.fullmatch(r'[0-9]{2,}', t):
            nodes.append(('grp', [('ch', PUA[c], 1) for c in t]))
        elif t in PUA:
            nodes.append(('ch', PUA[t], ASCLS.get(t, 1)))
        else:
            raise ValueError(t)
    return nodes
def parse_atom(p):
    t = p.nxt()
    if t == '{':
        g = parse_row(p, '}'); p.nxt(); return [('grp', g)]
    q = P([t]); return parse_row(q)
def cls(n):
    if n[0] == 'grp' and n[1]: return cls(n[1][0])
    return n[2] if n[0] == 'ch' else 1
def width_row(nodes, s, after=None):
    tot = 0
    for i, n in enumerate(nodes):
        nx = nodes[i+1] if i + 1 < len(nodes) else after
        if nx is not None and nx[0] == 'grp' and not nx[1]: nx = None
        k = n[0]
        if k == 'ch':
            w = gw(n[1], s)
            if w is None: raise ValueError('glyph %x' % n[1])
            if nx is not None: w += md(s, T(n[2], cls(nx)), 100) * 7
        elif k == 'sp':
            w = (s // 2) if n[1] == '~' else (s // 2) // 4
            if nx is not None: w += md(s, T(cls(n), cls(nx)), 100) * 7
        elif k == 'sty':
            w = 0
        elif k == 'grp':
            w = width_row(n[1], s, nx)
        elif k == 'frac':
            w = max(width_row(n[1] if isinstance(n[1], list) else [n[1]], s), width_row(n[2], s), s // 2) + md(s, 50, 100)
        elif k == 'sqrt':
            w = gw(0xe05c, s) + width_row(n[1], s) + md(s, 17, 100)
        elif k == 'scr':
            ss = md(s, 68, 100)
            w = max(width_row(v, ss) for v in n[1].values())
            if nx is not None and T(1, cls(nx)):
                w += md(s, T(1, cls(nx)), 100) * 10
            elif '^' in n[1] and i > 0 and nodes[i-1][0] == 'ch' and 0xe000 <= nodes[i-1][1] <= 0xe019:
                w += md(s, 15, 100)
        tot += w
    return tot
def width(script, s=1100):
    return width_row(parse_row(P(tok(script))), s)
if __name__ == '__main__':
    seen = {}
    for f in glob.glob(R + '/results/한글자동시험/*/수식목록.json'):
        for e in json.load(open(f, encoding='utf-8')):
            o = e.get('orig') or next(iter((e.get('result') or {}).values()), None)
            if o: seen[e['script']] = o['w']
    ok = bad = 0; badl = []
    for sc, w in seen.items():
        if re.search(r'(?i)LEFT|RIGHT|rm|it |bar|vec|hat|dot|prime|root|int|sum|lim|sin|cos|tan|log|ln|exp|pile|cases|matrix|BOX|atop|\'|"|&|#|\.|\||%|[가-힣]', sc): continue
        try: p = width(sc)
        except Exception: continue
        if p == w: ok += 1
        else: bad += 1; badl.append((sc, w, p, w - p))
    print('match', ok, 'mismatch', bad)
    for b in sorted(badl, key=lambda x: len(x[0]))[:int(sys.argv[1]) if len(sys.argv) > 1 else 40]: print(b)
