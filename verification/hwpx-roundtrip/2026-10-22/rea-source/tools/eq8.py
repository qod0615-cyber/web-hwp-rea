"""REA 8차: HwpPlugin 수식 배치 시뮬레이터 (정수 HU). 가로·세로 글리프 자리 + 상자(w, top, bottom).
layout(script, s=1100) -> dict(w, top, bot, glyphs=[(code, x, y, kind, size)])
  x  = 글리프 원점 x (식 왼끝 0 기준 HU)
  y  = kind 'b': 기준선 y / kind 't': 글자 위끝 y(TA_TOP 글리프) — 둘 다 줄 축 0 기준, 아래가 +
  장치 px(600dpi) = floor((X_abs + 10) / 12), Y 도 같음.
근거 주소는 structures_8.md. hpos.py(7차)·vsim.py(5차) 의 식을 한곳에 합침."""
import os, re, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import sim
from sim import md, PUA, ASCLS, kwl

M = sim.M; CM, GL = M['best_cmap_mapping'], M['glyphs']
def adv(code):
    gn = CM.get('U+%04X' % code)
    return GL[gn]['advance_width'] if gn else None
def gw(code, s, fw=None):
    """glyph advance HU: 96dpi integer px x75. fw = font width HU (default s/2)."""
    if fw is None: fw = s // 2
    hp = 2 * md(fw, 96, 7200)
    if GDI_W:
        v = gdi_px(code, md(s, 96, 7200), md(fw, 96, 7200))
        if v is not None: return v * 75
    a = adv(code)
    if a is None:
        a = batang_adv(code)                     # 10·13차: HYhwpEQ 에 없는 코드는 Haansoft Batang 으로 재고 찍음
        if a is None: raise ValueError('glyph %x' % code)
    return int(a * hp / 1024 + 0.5) * 75       # Batang 도 xAvgCharWidth 512/1024 라 같은 식
GDI_W = os.environ.get('EQ8_GDI', '1') == '1'
BRELOVER = os.environ.get('EQ8_BRELOVER', '1') == '1'   # 19차
GRPSPLIT = os.environ.get('EQ8_GRPSPLIT', '1') == '1'   # 19차
_GDI = {}
def gdi_px(code, H, W):
    """14차: 글자 폭 = GDI 힌팅 진행폭(px). 한글은 lfHeight = -MulDiv(s,96,7200), lfWidth = MulDiv(s/2,96,7200) 글꼴로 GetTextExtent 로 잼(1차 판독).
    선형식 round(adv·2W/1024) 는 14·15px(11pt)에선 같지만 12px(9pt)에서 D G O Q J B … 가 1px 다름(모의고사 자료)."""
    k = (code, H, W)
    if k not in _GDI:
        try:
            import gdiw14
            face = 'HYhwpEQ' if adv(code) is not None else ('Haansoft Batang' if batang_adv(code) is not None else None)
            _GDI[k] = gdiw14.widths(H, W, [code], face)[code] if face else None
        except Exception: _GDI[k] = None
    return _GDI[k]
def _gdi_face(code, H, W, face):
    k = (code, H, W, face)
    if k not in _GDI:
        try:
            import gdiw14; _GDI[k] = gdiw14.widths(H, W, [code], face)[code]
        except Exception: _GDI[k] = None
    return _GDI[k]
_BAT = None
def batang_adv(code):
    global _BAT
    if _BAT is None:
        try:
            from fontTools.ttLib import TTFont
            t = TTFont(r'C:/Program Files (x86)/HNC/Office 2022/HOffice120/Shared/TTF/All/HBATANG.TTF', fontNumber=0)
            cm = t.getBestCmap(); hm = t['hmtx']; _BAT = {c: hm[g][0] for c, g in cm.items()}
        except Exception: _BAT = {}
    return _BAT.get(code)
def cy(s): return md(s, 96, 7200) * 75          # glyph cell height HU
def half(v): return int(v / 2)                   # C division toward zero
def T(a, b): return sim.T(a, b)
TA_TOP = lambda c: 0xe044 <= c <= 0xe084 or 0xe100 <= c <= 0xe105   # 0x10084930: these codes use TA_TOP (y = glyph top)

FUNCS = set('EXP Exp Ln Pr acos and arccos arcsin arctan arg asin atan cos cosec cosh cot coth csc def deg dim exp for gcd hom if ker lcm lg ln log max min mod sec sin sinh tan tanh'.split()) | {'or '}  # 9차: 표 A 값 6 (대소문자 구분)
ASCII_CLS = {',': 7, '+': 3, '-': 3, '=': 4, '<': 4, '>': 4, '*': 7, '(': 5, ')': 6, '{': 5, '}': 6, '[': 5, ']': 6, ':': 4, '~': 4}
MATS = {'matrix': (None, None), 'pmatrix': ('(', ')'), 'bmatrix': ('[', ']'), 'dmatrix': ('|', '|'),
        'cases': ('{', None), 'pile': None, 'lpile': None, 'rpile': None}
INTS = {'int': 0xe05b, 'dint': 0xe073, 'tint': 0xe074, 'oint': 0xe075, 'odint': 0xe076, 'otint': 0xe077}
SUMS = {'sum': 0xe067, 'prod': 0xe068, 'coprod': 0xe069, 'inter': 0xe06a, 'union': 0xe06b,
        'bigcap': 0xe06a, 'bigcup': 0xe06b,
        # 17차(job-0040 80/80 w·h·bl): BIG… = SUM 과 같은 틀(글자 s·180%, 높이 = 그 칸·75%), 글자만 다름
        'bigsqcap': 0x2293, 'bigsqcup': 0x2294, 'biguplus': 0x228e, 'bigoplus': 0x2295, 'bigominus': 0x2296,
        'bigotimes': 0x2297, 'bigodiv': 0x2298, 'bigodot': 0x2299, 'bigvee': 0x2228, 'bigwedge': 0x2227}
DECOS = {'bar': 0xe06d, 'vec': 0xe06e, 'hat': 0xe063, 'dot': 0xe05f, 'ddot': 0xe060, 'acute': 0xe05d, 'grave': 0xe05e,
         'check': 0xe064, 'tilde': 0xe066, 'arch': 0xe065, 'dyad': 0xe06d, 'under': 0xe06d, 'breve': None}
ARCH_PAD = 300   # 13차: arch 상자 위 여백(11pt 실측 1425-1125). 크기 비례는 미확인 -> MulDiv(cell,80,300) 로 둠

KEYS = None
def split_run(t):
    """letter run that is not itself a keyword: split off the longest known keyword prefix (observed: vecp, rootk, rmP)."""
    global KEYS
    if KEYS is None:
        KEYS = set(k.lower() for k in sim.KT) | set(FUNCS) | set(MATS) | set(INTS) | set(SUMS) | set(DECOS) | {'over', 'sqrt', 'root', 'of', 'left', 'right', 'box', 'lim', 'rm', 'it', 'prime'}
    if t.lower() in KEYS or kwl(t) is not None or len(t) < 3: return [t]
    for L in range(len(t) - 1, 1, -1):
        if t[:L].lower() in KEYS or t[:L] in FUNCS: return [t[:L]] + split_run(t[L:])
    return [t]
EMPTY_ORD = os.environ.get('EQ8_EMPTYORD', '1') == '1'   # 14차: 빈 {} 도 보통 글자(분류 1)처럼 앞뒤 간격을 받음 ({}_4 C 앞 times/=/+)
SCR_NEST = os.environ.get('EQ8_SCRNEST', '1') == '1'
BOLD = os.environ.get('EQ8_BOLD', '1') == '1'
EMPTY_CELL = os.environ.get('EQ8_EMPTYCELL', '1') == '1'
ROOT_NOOF = os.environ.get('EQ8_ROOTNOOF', '1') == '1'
AMP0 = os.environ.get('EQ8_AMP0', '1') == '1'
UNI_CH = os.environ.get('EQ8_UNICH', '1') == '1'
PUA_BAR = os.environ.get('EQ8_PUABAR', '1') == '1'
LIM_OVER = os.environ.get('EQ8_LIMOVER', '1') == '1'
AMP_ROW = os.environ.get('EQ8_AMPROW', '1') == '1'
EMPTY_EQ = os.environ.get('EQ8_EMPTYEQ', '1') == '1'
EMPTY_SCR = os.environ.get('EQ8_EMPTYSCR', '1') == '1'
STRAY_BRACE = os.environ.get('EQ8_STRAY', '1') == '1'
LONE_RIGHT = os.environ.get('EQ8_LONERIGHT', '1') == '1'
RMC_GAP = os.environ.get('EQ8_RMCGAP', '1') == '1'
RMC_GROUP = os.environ.get('EQ8_RMCGROUP', '0') == '1'
BSLASH = os.environ.get('EQ8_BSLASH', '1') == '1'
QUOTE = os.environ.get('EQ8_QUOTE', '1') == '1'
EQROWS = os.environ.get('EQ8_EQROWS', '1') == '1'
NOT0 = os.environ.get('EQ8_NOT0', '1') == '1'
NEW17 = os.environ.get('EQ8_NEW17', '1') == '1'
REL_EAT = os.environ.get('EQ8_RELEAT', '1') == '1'
GLUE = os.environ.get('EQ8_GLUE', '1') == '1'
FN_ITALIC = os.environ.get('EQ8_FNITALIC', '1') == '1'
FN_GAP = os.environ.get('EQ8_FNGAP', '1') == '1'
FNALPHA = os.environ.get('EQ8_FNALPHA', '0') == '1'   # 21차 후보(기본 끔)
_SYMN = None
def symname(code):
    """HwpPlugin 0x100dbf30 표(코드 → 노드 글자열 이름, 0x1008b8a0). 0xB1 미만(0xD7 제외)은 그 글자."""
    global _SYMN
    if code < 0xb1 and code != 0xd7: return chr(code)
    if _SYMN is None:
        _SYMN = {}
        try:
            import pefile, struct
            pe = pefile.PE(r'C:/Program Files (x86)/HNC/Office 2022/HOffice120/Bin/HwpPlugin.dll', fast_load=True); d = pe.__data__; ib = pe.OPTIONAL_HEADER.ImageBase
            o = lambda va: pe.get_offset_from_rva(va - ib)
            for k in range(0x133):
                c, ptr = struct.unpack_from('<HxxI', d, o(0x100dbf30 + 8 * k))
                if ptr:
                    i = o(ptr); e = i
                    while d[e:e + 2] != bytes(2): e += 2
                    _SYMN[c] = d[i:e].decode('utf-16le')
        except Exception: pass
    return _SYMN.get(code, chr(code))
NEST23 = os.environ.get('EQ8_NEST23', '1') == '1'   # 23차
LRSKIP22 = os.environ.get('EQ8_LRSKIP', '1') == '1'   # 22차
SCRGAP22 = os.environ.get('EQ8_SCRGAP', '0')   # 22차 시험(기본 끔: 모의 510→507)
EMPTYH22 = os.environ.get('EQ8_EMPTYH', 'ss')   # 22차: 스타일만 든 빈 첨자 상자 높이 = ss 그대로(칸 반올림 안 함) — 모의고사·기출 134→510/521
EMPTYSCR = os.environ.get('EQ8_EMPTYBASE', '1') == '1'   # 21차
FNIT20 = os.environ.get('EQ8_FNIT20', '0') == '1'   # 20차 후보 규칙(근거 약함, 기본 끔)
ITSEEN = [False]; FNRM = [False, False]
FN_FORCE = None   # 20차 진단용 (dict: 번호 -> True/False)
RM_SCOPE = os.environ.get('EQ8_RMSCOPE', 'global')   # 11차: rm 은 } 로 안 끝남(자료 w 81.1->86.6%). 'group' 은 옛 가정
def _sub(st): return st if RM_SCOPE == 'global' else dict(st)
_KW9 = None
def _kw9():
    global _KW9
    if _KW9 is None:
        j = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'kwtables9.json'), encoding='utf-8'))
        _KW9 = ([e[0] for e in j['A']], {e[0]: e[1] for e in j['B']}, [e[0] for e in j['B']])
    return _KW9
DELIM9 = set(' ^_#{}&"~`')
def _longest(cands, text):
    best = None
    for k in cands:
        if text.startswith(k) and (best is None or len(k) > len(best)): best = k
    return best
_KWC = None
def kwcode(t):
    """13차: 키워드 -> (그릴 코드, 간격 분류). 코드 = 표 A/B 의 값(대소문자 규칙은 tok 과 같음), 분류 = 코드로 찾은 분류(없으면 1).
    표에 없는 이름(SMALLCOPROD 등)은 None -> 글자로 처리."""
    global _KWC
    if _KWC is None:
        j = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'kwtables9.json'), encoding='utf-8'))
        A = {e[0]: e[1] for e in j['A']}; B = {e[0]: e[1] for e in j['B']}
        cls_by_code = {}
        for name, (c, k) in sim.KT.items(): cls_by_code.setdefault(c, k)
        _KWC = (A, B, cls_by_code)
    A, B, CC = _KWC
    v = A.get(t)
    if v is None: v = B.get(t) if t.isupper() or not t.isalpha() else B.get(t.upper())
    if v is None or v < 0x20 or v in (0x48, 0x49): return None      # 구조 키워드(값 < 0x20)는 여기서 다루지 않음
    k = CC.get(v)
    if k is None:
        kk = kwl(t); k = kk[1] if kk and kk[0] == v else 1
    return v, k

class Tk(str):
    """14차: 토큰 + 낱말 번호(.w). 한글 토큰기(0x100a1ec0)는 ' ^_#{}&"~`' 와 공백에서만 낱말을 끊음 —
    한 낱말 안 조각(예: n+1, -2x, 7pi, 2k)은 첨자·over·sqrt 등의 '다음 것' 하나로 통째 들어감 (모의고사 자료)."""
    pass
def tok(s):
    s = "".join(" " if ord(c) in (9, 10, 13) else c for c in s)     # 16차: 줄바꿈·탭은 공백
    out = []; pos = 0; w = 0; prevd = True
    for t in _tok(s):
        j = s.find(t, pos)
        isd = len(t) == 1 and t in DELIM9
        glued = j == pos and not isd and not prevd and j > 0
        if not glued: w += 1
        k = Tk(t); k.w = w; out.append(k)
        pos = j + len(t); prevd = isd
    return out
def _tok(s):
    """9차: HwpPlugin 0x100a1ec0 앞처리와 같은 규칙. 표 A(대소문자 구분, 최장 접두) -> 대문자 둘이면 표 B(최장 접두)
    -> 글자+소문자면 그 소문자 덩어리를 대문자로 바꿔 표 B(최장 접두; FROM/TO 는 전체 일치) -> 아니면 글자 덩어리."""
    if os.environ.get('EQ8_OLDTOK'): 
        out = []
        for t in tok0(s): out += split_run(t) if t.isalpha() else [t]
        return out
    A, Bv, B = _kw9(); out = []; i = 0; n = len(s)
    while i < n:
        c = s[i]
        if c == "'":
            k = 2 if s[i + 1:i + 2] == "'" else 1; out.append("'" * k); i += k; continue
        if c in DELIM9 or c.isdigit():
            if c == ' ': i += 1; continue
            if c.isdigit():
                j = i
                while j < n and s[j].isdigit(): j += 1
                out.append(s[i:j]); i = j; continue
            out.append(c); i += 1; continue
        nx = s[i + 1] if i + 1 < n else ''
        if nx == '' or nx in DELIM9:
            out.append(c); i += 1; continue
        k = _longest(A, s[i:])
        if k is None and c.isupper() and nx.isupper() and c.isascii() and nx.isascii():
            k = _longest(B, s[i:])
        elif k is None and c.isascii() and c.isalpha() and nx.isascii() and nx.islower():
            j = i + 1
            while j < n and j - i < 10 and s[j].isascii() and s[j].islower(): j += 1
            run = s[i:j].upper(); kk = _longest(B, run)
            if kk is not None and Bv.get(kk) in (6, 7) and kk != run: kk = None
            k = s[i:i + len(kk)] if kk else None
        if k:
            out.append(k); i += len(k); continue
        j = i + 1
        if c.isascii() and c.isalpha():
            while j < n and s[j].isascii() and s[j].isalpha(): j += 1
        out.append(s[i:j]); i = j
    return out
def tok0(s):
    return re.findall(r"\{|\}|\^|_|`|~|&|#|'+|[A-Za-z]+|[0-9]+|<->|->|<-|\+-|-\+|<=|>=|!=|\S", s)

class Unsupported(Exception): pass

# ---------------- parser -----------------
class P:
    def __init__(s, t): s.t, s.i = t, 0
    def peek(s, k=0): return s.t[s.i + k] if s.i + k < len(s.t) else None
    def nxt(s): s.i += 1; return s.t[s.i - 1]

def ch(code, cls=1, rm=False): return {'k': 'ch', 'code': code, 'cls': cls, 'rm': rm}
def letters(t, st):
    out = []
    for c in t:
        if st['rm'] or FNRM[1]: out.append(ch(ord(c), 1, True))
        else: out.append(ch(PUA[c], 1, False))
    return out

def _attach(L, t, arg):
    """23차: 목록 L 의 마지막 노드에 첨자 t 를 붙임(찬 자리면 그 안으로 다시 들어감)."""
    if L and L[-1]['k'] == 'scr' and (L[-1].get('_nest') is not None or t in L[-1]):
        T_ = L[-1]; L2 = T_.get('_nest') if T_.get('_nest') is not None else T_[T_.get('_last', t)]
        _attach(L2, t, arg); T_['_nest'] = L2
    elif L and L[-1]['k'] == 'scr': L[-1][t] = arg; L[-1]['_last'] = t
    else: L.append({'k': 'scr', t: arg, '_last': t})

def parse_row(p, st, stops=('}',), one=False):
    nodes = []
    while p.peek() is not None and p.peek() not in stops and not (one and nodes) and not st.get('abort'):
        t = p.peek(); tl = t.lower()
        if tl in ('right',) and 'RIGHT' in stops: break
        if nodes and nodes[-1].get('open') and nodes[-1]['k'] in ('int', 'lim') and t == '{':
            nodes[-1]['body'] = parse_atom(p, st); nodes[-1].pop('open'); continue   # int/lim own their body (0x1008c350 / 0x1008eaa0)
        p.nxt(); n0 = len(nodes)
        FNRM[1] = FNRM[0]; FNRM[0] = False
        if t == '{':
            sv = st.get('rmc'); g = parse_row(p, _sub(st)); p.nxt() if p.peek() == '}' else None
            st['rmc'] = sv      # 16차: 변환기 글꼴 상태(DAT_100e0930)는 { } 끝에서 되돌림 (그리기 문맥 rm 은 남음)
            nodes.append({'k': 'grp', 'row': g})
        elif t in ('^', '_'):
            braced = p.peek() == '{'
            arg = parse_atom(p, st, t)
            if nodes and nodes[-1]['k'] in ('int', 'sum', 'lim') and nodes[-1].get('open'):
                nodes[-1]['lo' if t == '_' else 'hi'] = arg; continue
            if NEST23 and nodes and nodes[-1]['k'] == 'scr' and (nodes[-1].get('_nest') is not None or t in nodes[-1]):
                # 23차(job-0058 eit): 이미 같은 첨자가 찬 노드 뒤의 첨자는 '가장 최근에 붙은 첨자' 안 마지막 노드에 붙음
                # (k^{2}^{it} = k^{2^{it}}, k^{2}_{it}^{it} = k^{2}_{it^{it}}). 한 번 안으로 들어가면 뒤 첨자도 그 안으로 (k^{2}^{it}_{it} = k^{2^{it}_{it}}).
                T_ = nodes[-1]
                L_ = T_.get('_nest') if T_.get('_nest') is not None else T_[T_.get('_last', t)]
                _attach(L_, t, arg); T_['_nest'] = L_
                if braced is False and len(arg) == 1 and arg[0]['k'] == 'sty': nodes.append({'k': 'sty'})
                continue
            if nodes and nodes[-1]['k'] == 'scr' and t not in nodes[-1]: nodes[-1][t] = arg; nodes[-1]['_last'] = t
            else: nodes.append({'k': 'scr', t: arg, '_last': t})
            if NEST23 and braced is False and len(arg) == 1 and arg[0]['k'] == 'sty':
                nodes.append({'k': 'sty'})   # 23차: 괄호 없는 ^it / _it 의 it 는 첨자 인자이면서 바깥 목록에도 스타일 노드로 남음 (k^{2}^it_it = k^{2^{it}} it _{it})
            continue
        elif tl == 'over':
            if LIM_OVER and nodes and nodes[-1]['k'] in ('lim', 'int') and nodes[-1].get('body'):
                # 14차: lim_{…}{A} over {B} = lim_{…}{{A} over {B}} — over 는 lim 이 품은 본문을 분자로 씀 (기출 자료 w·h 일치)
                L_ = nodes[-1]; den = parse_atom(p, st)
                L_['body'] = [{'k': 'frac', 'num': L_['body'], 'den': den}]; continue
            num = [nodes.pop()]
            if GLUE and os.environ.get('EQ8_GLUENUM', '1') == '1' and num[0].get('_wd') is not None:
                while nodes and nodes[-1].get('_wd') == num[0]['_wd']: num.insert(0, nodes.pop())
            den = parse_atom(p, st)
            if BRELOVER and len(num) == 1 and num[0]['k'] == 'grp' and num[0]['row'] and num[0]['row'][-1]['k'] == 'rel'                     and num[0]['row'][-1].get('build') and num[0]['row'][-1]['hi']:
                # 19차(job-0040 2/2 글리프까지): {BUILDREL 화살 {위}} over {X} = 분모 빈 칸(높이 s) + X 가 분수 뒤에 이어짐
                nodes.append({'k': 'frac', 'num': num, 'den': [], 'den_empty': True}); nodes.append({'k': 'grp', 'row': den}); continue
            nodes.append({'k': 'frac', 'num': num if len(num) == 1 else [{'k': 'grp', 'row': num}], 'den': den})
        elif tl == 'sqrt':
            nodes.append({'k': 'sqrt', 'idx': None, 'body': parse_atom(p, st)})
        elif tl == 'root':
            idx = parse_atom(p, st)
            if (p.peek() or '').lower() != 'of':
                if not ROOT_NOOF: raise Unsupported('root')
                nodes.append({'k': 'sqrt', 'idx': None, 'body': idx})     # 14차: of 없는 root X = sqrt X (root4t+1, roote, 2root5)
            else:
                p.nxt(); nodes.append({'k': 'sqrt', 'idx': idx, 'body': parse_atom(p, st)})
        elif tl == 'bold' and BOLD:
            # 14차: BOLD(표 B 값 0x2101, 플래그 192)는 글자가 아니라 굵게 글꼴 — HYhwpEQ 에 굵은 꼴이 없어 GDI 가짜 굵게(lfWeight 700)
            # → 글자마다 진행폭 +1px(75 HU). underbold{+1} = under{bold{+1}} (모의고사 자료 w·h 일치). 범위는 다음 덩이 하나로 둠(미확정)
            body = parse_atom(p, st)
            def _mk(ns):
                for q_ in ns:
                    if q_['k'] == 'ch': q_['bold'] = True
                    for kk in ('row', 'num', 'den', 'body', '_', '^'):
                        if isinstance(q_.get(kk), list): _mk(q_[kk])
            _mk(body)
            nodes.append({'k': 'grp', 'row': body})
        elif tl in DECOS:
            nodes.append({'k': 'deco', 'd': tl, 'body': parse_atom(p, st)})
        elif t in ('rm', 'RM'):
            st['rm'] = True; nodes.append({'k': 'sty'})
            if p.peek() != '{' or not RMC_GROUP: st['rmc'] = True     # 16차: rm{…} 는 변환기 상태를 그 묶음 안에서만 바꿈      # 9차: 폭 0 노드로 남음(앞 글자의 '다음' = 분류 1)
        elif t in ('it', 'IT'): st['rm'] = False; st['rmc'] = False; nodes.append({'k': 'sty'}); ITSEEN[0] = True
        elif tl == 'right' and LONE_RIGHT and p.peek() is not None:
            # 16차: 짝 없는 RIGHT X 는 오른쪽 괄호 하나(늘이지 않음) — 0x10099b40 RIGHT(0x29) 가 혼자서도 괄호 노드를 만듦
            nodes.append({'k': 'lr', 'l': '.', 'r': p.nxt(), 'body': []})
        elif tl == 'left':
            dl = p.nxt(); body = parse_row(p, _sub(st), stops=('RIGHT', 'right', '}'))
            mode = os.environ.get('EQ8_LRSTRAY', 'close')
            if LRSKIP22 and p.peek() == '}':
                # 22차(모의고사 root{b^2 -left( {b} over {2} } right)^2 = root{… right)^2} 2349·70): LEFT 안의 짝 없는 } 뒤에
                # 같은 깊이의 RIGHT 가 있으면 } 를 버리고 괄호를 이어 읽음
                d_ = 0; j_ = p.i + 1; hit = False
                while j_ < len(p.t):
                    x_ = p.t[j_]
                    if x_ == '{': d_ += 1
                    elif x_ == '}':
                        d_ -= 1
                        if d_ < 0: break
                    elif str(x_).lower() == 'right' and d_ == 0: hit = True; break
                    elif str(x_).lower() == 'left': break
                    j_ += 1
                if hit:
                    p.nxt(); body += parse_row(p, _sub(st), stops=('RIGHT', 'right', '}'))
            while mode == 'skip' and p.peek() == '}':      # (시험용 'skip'; 기본 'close' = 16차: RIGHT 없이 } 나 끝을 만나면 오른쪽 괄호 없이 닫힘)
                p.nxt(); body += parse_row(p, _sub(st), stops=('RIGHT', 'right', '}'))
            if mode == 'close' and (p.peek() or '').lower() != 'right':
                nodes.append({'k': 'lr', 'l': dl, 'r': '.', 'body': body}); continue
            if (p.peek() or '').lower() != 'right': raise Unsupported('left')
            p.nxt(); dr = p.nxt()
            nodes.append({'k': 'lr', 'l': dl, 'r': dr, 'body': body})
        elif tl == 'box':
            nodes.append({'k': 'box', 'body': parse_atom(p, st)})
        elif tl == 'not' and NOT0:
            # 16·17차: NOT X = 노드 0x4B 상자(분류 1 = 보통) — X 의 관계·이항 간격이 사라짐 (a not = b 1800)
            if NEW17 and p.peek() is not None:
                q_ = parse_row(p, st, one=True)
                for z_ in q_:
                    if z_['k'] == 'ch': z_['cls'] = 1
                nodes.append({'k': 'grp', 'row': q_, 'slash': True})   # 18차: 빗금 E054 (TA_TOP) 를 X 의 x·상자 위에, X 폭으로 늘여 그림
        elif tl == 'eqalign' and EQROWS and p.peek() == '{':
            p.nxt(); rows = [parse_row(p, _sub(st), stops=('}', '#'))]
            while p.peek() == '#':
                p.nxt(); rows.append(parse_row(p, _sub(st), stops=('}', '#')))
            if p.peek() == '}': p.nxt()
            nodes.append({'k': 'eqrows', 'rows': rows})
        elif tl in MATS:
            if p.nxt() != '{': raise Unsupported('mat')
            rows = [[[]]]; sub = _sub(st)
            while p.peek() not in (None, '}'):
                if p.peek() == '&': p.nxt(); rows[-1].append([]); continue
                if p.peek() == '#': p.nxt(); rows.append([[]]); continue
                rows[-1][-1] += parse_row(p, sub, stops=('}', '&', '#'))
            p.nxt()
            nodes.append({'k': 'mat', 'm': tl, 'rows': rows})
        elif tl in INTS:
            nodes.append({'k': 'int', 'code': INTS[tl], 'lo': [], 'hi': [], 'open': True})
        elif tl in ('rel', 'buildrel') and NEW17:
            # 17차: REL 기호 {위} {아래} / BUILDREL 기호 {위}. 인자 없으면 빈 목록(폭 s/2, 높이 s)
            sym = p.nxt() if p.peek() is not None and p.peek() not in ('{', '}') else None
            kc = kwcode(str(sym)) if sym is not None and len(str(sym)) > 1 else None
            code = kc[0] if kc else (ord(str(sym)) if sym is not None else 0x21d4)
            args = []
            for _ in range(2 if tl == 'rel' else 1):
                if p.peek() == '{': args.append(parse_atom(p, st)); continue
                args.append([])
                if REL_EAT and p.peek() is not None:
                    # 18차(사용자 결정 = 한글 그대로): 인자 자리가 { 가 아니면 다음 토큰을 그냥 먹음.
                    # 먹은 것이 } 이면 바깥 묶음이 닫히지 않아 식 읽기가 거기서 끝남 (u {REL larrow} v = u ←)
                    if p.nxt() == '}': st['abort'] = True; break
            if len(args) == 1: args.append([])
            nodes.append({'k': 'rel', 'code': code, 'hi': args[0], 'lo': args[1], 'build': tl == 'buildrel'})
        elif tl == 'phantom' and NEW17:
            body = parse_atom(p, st)                      # 17차: PHANTOM{…} = 그 상자 크기만 차지, 안 그림 (PHANTOM{abc} x 2025)
            nodes.append({'k': 'grp', 'row': body, 'hide': True})
        elif tl == 'scale' and NEW17:
            if p.peek() is not None and re.fullmatch(r'[0-9.]+', str(p.peek())): p.nxt()   # 17차: SCALE n {…} — 문서 배치는 크기 그대로(SCALE 2 {a} 525)
        elif tl == 'bigg' and NEW17 and p.peek() is not None:
            c_ = str(p.nxt())                            # 17차: BIGG X = 괄호 글자 하나(앞 형제가 없으면 크기 s) — BIGG ( a 900
            nodes.append(ch(PUA[c_], 1, False) if c_ in PUA else ch(ord(c_[0]), 1, False))   # 18차: BIGG 노드는 상자(분류 1) — 앞뒤 간격 없음
        elif tl == 'underover' and NEW17:
            body = parse_atom(p, st) if p.peek() is not None else []
            nodes.append({'k': 'sum', 'code': None, 'body': body, 'lo': [], 'hi': [], 'open': True})
        elif tl in ('overbrace', 'underbrace') and NEW17:
            a1 = parse_atom(p, st) if p.peek() == '{' else []
            a2 = parse_atom(p, st) if p.peek() == '{' else []
            # 17차 실측: OVERBRACE {몸 s}{위 글 68%}, UNDERBRACE {아래 글 68%}{몸 s}
            if tl == 'overbrace': nodes.append({'k': 'brace', 'ov': True, 'body': a1, 'lab': a2})
            else: nodes.append({'k': 'brace', 'ov': False, 'body': a2, 'lab': a1})
        elif t in ('LSUP', 'LSUB') and NEW17 and nodes:
            arg = parse_atom(p, st)
            b_ = nodes[-1]
            if b_['k'] != 'lscr': b_ = {'k': 'lscr', 'base': [nodes.pop()]}; nodes.append(b_)
            b_['^' if t == 'LSUP' else '_'] = arg
            continue
        elif tl in SUMS:
            nodes.append({'k': 'sum', 'code': SUMS[tl], 'lo': [], 'hi': [], 'open': True})
        elif tl == 'lim':
            nodes.append({'k': 'lim', 'cap': t == 'Lim', 'lo': [], 'hi': [], 'open': True})
        elif t in FUNCS:
            # 13차(실측 규칙): 바로 앞 노드가 키워드 기호 글자(유니코드 기호 코드, PUA 아님 — ± × ⋅ ÷ ≠ ≥ ≤ …)이고 rm 상태가 아니면
            # 함수 이름도 이탤릭(PUA)으로 그려지고 잼. (그리기 문맥 플래그 ctx+0x850 이 앞 기호에서 넘어오는 것으로 추정)
            pv = nodes[-1] if nodes else None
            ital = (FN_ITALIC and pv is not None and pv['k'] == 'ch' and not pv['rm'] and pv['code'] < 0xe000
                    and not (0x41 <= pv['code'] <= 0x7a) and not st['rm'])
            if FNALPHA and pv is not None and pv['k'] == 'ch' and pv.get('src') and not st['rm']:
                # 21차 후보(코드 0x1008ba00 판독): 함수 인식은 앞 글자 노드의 글자열 첫 글자가 영문자면 실패 → 이탤릭 그대로
                ital = symname(pv['code'])[:1].isalpha()
            if FNIT20 and ITSEEN[0] and pv is not None and str(pv.get('src', '')).isalpha() and str(pv.get('src', '')).isupper():
                # 20차(job-0042 실측): 식 앞쪽에 it 가 한 번이라도 나온 뒤에는(묶음 밖이어도) 기호 뒤 함수도 로만이고,
                # 함수 바로 다음 글자 토큰 하나도 로만으로 찍힘 (it y `CDOT tan d → t a n d 로만)
                ital = False; FNRM[0] = True
            if FN_FORCE is not None:                     # 20차 진단용: k 번째 함수 이름의 이탤릭 여부를 강제
                FN_FORCE['i'] = FN_FORCE.get('i', -1) + 1; ital = FN_FORCE.get(FN_FORCE['i'], ital); FN_FORCE.setdefault('seen', []).append((str(t), ital))
            pv2 = nodes[-2] if len(nodes) > 1 else None
            while pv2 is not None and pv2['k'] == 'grp':          # 묶음은 안의 마지막 노드로 봄 (rm{OQ} times log: Q 글자 → 틈 없음)
                pv2 = pv2['row'][-1] if pv2['row'] else None
            if FN_GAP and RMC_GAP and pv is not None and pv['k'] == 'ch' and st.get('rmc') and pv.get('src', '').isalpha() and not pv['src'].isupper()                     and (os.environ.get('EQ8_RMCPREV', '1') == '0' or (pv2 is not None and pv2['k'] not in ('ch', 'sp', 'sty', 'prime'))):
                nodes.append({'k': 'sp', 't': '`'})      # 16차 시험: 변환기 rm 상태에서 기호 키워드 뒤 함수 이름 앞 `
            elif FN_GAP and pv is not None and pv['k'] == 'ch' and ((0xe000 <= pv['code'] <= 0xe019) or (0xe0e5 <= pv['code'] <= 0xe0fe) or pv['code'] < 0x80 and chr(pv['code']).isalpha()):
                nodes.append({'k': 'sp', 't': '`'})      # 13차 실측: 글자 바로 뒤 함수 이름 앞에 ` (s/8) 하나가 들어감 (a sin x = a` sin x)
            nodes += [ch(PUA[c], 1, False) if ital else ch(ord(c), 1, True) for c in t]
        elif t in ('`', '~'):
            nodes.append({'k': 'sp', 't': t})
        elif set(t) == {"'"} or tl == 'prime':
            nodes.append({'k': 'prime', 'n': len(t) if t[0] == "'" else 1})
        elif len(t) > 1 and kwcode(t) is not None:
            c, k = kwcode(t); nodes.append(ch(c, k, False)); nodes[-1]['src'] = str(t)
        elif re.fullmatch(r'[A-Za-z]+', t):
            nodes += letters(t, st)
        elif re.fullmatch(r'[0-9]+', t):
            g = [ch(PUA[c], 1, False) if not st['rm'] else ch(PUA[c], 1, False) for c in t]
            nodes.append({'k': 'grp', 'row': g}) if len(g) > 1 else nodes.append(g[0])
        elif t in PUA:
            nodes.append(ch(PUA[t], ASCLS.get(t, 1), False))
        elif t == chr(92) and BSLASH:
            prv = p.t[p.i - 2] if p.i >= 2 else None
            if prv is not None and getattr(prv, 'w', -1) == getattr(t, 'w', -2):
                # 17차: 낱말 안(앞 글자에 붙은) 역빗금 = 역빗금 글자 하나(0x5C, 11pt 375), 뒤 낱말은 보통대로 (job-0040 x\y 1500, y=\A 3012)
                nodes.append(ch(0x5c, 1, False))
            else:
                # 16·17차: 낱말 첫머리 역빗금 = 다음 낱말(공백 건너뜀)을 글자 그대로 로만 (\ADBC` 3062, x \ y 1200)
                if p.peek() is not None and re.fullmatch(r'[A-Za-z]+', str(p.peek())):
                    t2 = p.nxt()
                    for c_ in t2: nodes.append(ch(ord(c_), 1, True))
                    while p.peek() is not None and re.fullmatch(r'[A-Za-z]+', str(p.peek())) and _glued(t2, p.peek()):
                        t2 = p.nxt()
                        for c_ in t2: nodes.append(ch(ord(c_), 1, True))
        elif t == '"' and QUOTE:
            # 16·17차: "…" 안은 글자 그대로(키워드 아님), 안의 공백 = ` (job-0040 "a b" 1112), 그 순간 글꼴 상태(rm 이면 로만). 글자 노드 종류 0xB5
            pw = None
            while p.peek() is not None and p.peek() != '"':
                q_ = p.nxt()
                if pw is not None and getattr(q_, 'w', None) != pw: nodes.append({'k': 'sp', 't': '`'})
                pw = getattr(q_, 'w', None)
                for c_ in str(q_):
                    if c_.isalpha() and c_.isascii(): nodes += letters(c_, st)
                    elif c_ in PUA: nodes.append(ch(PUA[c_], 1, False))
                    elif ord(c_) > 0x7f and UNI_CH: nodes.append(ch(ord(c_), 1, False))   # 20차: 따옴표 안 한글 등 (job-0042 "가" 1050)
            if p.peek() == '"': p.nxt()
        elif t == '&' and AMP0:
            nodes.append({'k': 'amp'})        # 14차: 행렬 밖 & = 칸 나눔 — 폭 MulDiv(s,20,100)(행렬 열 간격), 앞뒤 간격 없음 (모의고사 a+b&<10 +220)
        elif len(t) == 1 and ord(t) > 0x7f and UNI_CH:
            nodes.append(ch(ord(t), 1, False))   # 14차: 그 밖 유니코드 글자(① □ △ ㆍ ＞ ０ …)는 그 코드 그대로, HYhwpEQ 에 없으면 Batang
        else:
            raise Unsupported(t)
        for n in nodes[:-1]: n.pop('open', None)
        wd = getattr(t, 'w', None)
        if wd is not None and t not in ('{',) and not (len(t) == 1 and t in DELIM9):
            for n in nodes[n0:]: n.setdefault('_wd', wd)
    for n in nodes: n.pop('open', None)
    return nodes

def _glued(a, b):
    return getattr(a, 'w', None) is not None and getattr(a, 'w', None) == getattr(b, 'w', -1) or getattr(b, 'g', False)
def parse_atom(p, st, kind=None):
    t = p.peek()
    if t == '{':
        sv = st.get('rmc'); p.nxt(); g = parse_row(p, _sub(st)); st['rmc'] = sv
        if p.peek() == '}': p.nxt()
        return [{'k': 'grp', 'row': g}]
    if t is not None and (t.lower() in DECOS or t.lower() in ('bold', 'sqrt', 'box')):
        return parse_row(p, _sub(st), one=True)      # 14차: 인자를 받는 키워드(under bold … )가 덩이면 그 인자까지 한 덩이
    first = p.nxt(); toks = [first]
    if GLUE and t not in ('^', '_') and t.lower() not in ('over',):
        while p.peek() is not None and getattr(p.peek(), 'w', None) == getattr(first, 'w', -1) and p.peek() not in ('^', '_')                 and p.peek().lower() != 'over': toks.append(p.nxt())
        # 14차: 괄호 없는 첨자 낱말 바로 뒤의 ^/_ 는 그 낱말 안으로 들어감 (e^-2x^2 = e^{-2x^{2}}, 모의고사 자료 w·h 일치)
        while SCR_NEST and p.peek() in ((kind,) if kind else ('^', '_')) and p.peek(1) is not None:
            toks.append(p.nxt()); sub_ = []
            if p.peek() == '{':
                d = 0
                while p.peek() is not None:
                    x_ = p.nxt(); sub_.append(x_); d += (x_ == '{') - (x_ == '}')
                    if d == 0: break
            else:
                f2 = p.nxt(); sub_.append(f2)
                while p.peek() is not None and getattr(p.peek(), 'w', None) == getattr(f2, 'w', -1) and p.peek() not in ('^', '_'): sub_.append(p.nxt())
            toks += sub_
    q = P(toks); return parse_row(q, _sub(st))

def cls(n):
    if n is None: return None
    if n['k'] == 'grp': return cls(n['row'][0]) if n['row'] else (1 if EMPTY_ORD else None)
    if n['k'] == 'amp': return 1
    return n['cls'] if n['k'] == 'ch' else 1
def flat(nodes):
    out = []
    for n in nodes:
        if n['k'] == 'grp': out += flat(n['row'])
        else: out.append(n)
    return out
def ucit(n): return n is not None and n['k'] == 'ch' and (0xe000 <= n['code'] <= 0xe019 or 0x41 <= n['code'] <= 0x5a)

# ---------------- measure (w, top, bot) -----------------
LAST = [1100]
def m_row(nodes, s, after=None, cell=False):
    if cell and not [n for n in nodes if n['k'] != 'sty']:
        return (s // 2 if (EMPTY_CELL and not nodes) else 0), -half(s), -half(s) + s   # empty cell: height s; 14차: 아무것도 없는 칸은 폭 s/2 ({cases{###}} 1075)
    w = 0; top = bot = None
    for i, n in enumerate(nodes):
        nx = nodes[i + 1] if i + 1 < len(nodes) else after
        if nx is not None and nx['k'] == 'grp' and not nx['row'] and not EMPTY_ORD: nx = None
        if i: n['_pv'] = nodes[i - 1]
        nw, t, b = m_node(n, s, nx, nodes[i - 1] if i else None)
        n['_w'] = nw; n['_t'] = t; n['_b'] = b; n['_nx'] = nx
        w += nw
        if t is None: continue
        top = t if top is None else min(top, t); bot = b if bot is None else max(bot, b)
    if AMP_ROW and any(n['k'] == 'amp' for n in nodes):
        # 14차: & 로 나뉜 칸은 각 칸 위끝을 맞춤(pile 처럼) — 상자 위 = 칸 위끝 중 가장 높은 것, 높이 = 가장 큰 칸 높이 (모의고사 v_1(t) & =3t^2 … h 1350)
        segs = [[]]
        for n in nodes:
            if n['k'] == 'amp': segs.append([])
            else: segs[-1].append(n)
        box = []
        for g_ in segs:
            ts = [n['_t'] for n in g_ if n.get('_t') is not None]; bs = [n['_b'] for n in g_ if n.get('_b') is not None]
            if ts: box.append((min(ts), max(bs), g_))
        if box:
            top = min(b_[0] for b_ in box); H = max(b_[1] - b_[0] for b_ in box); bot = top + H
            for t_, b_, g_ in box:
                for n in g_: n['_dy'] = top - t_
    return w, top, bot
def gap(n, s, nx, mult=7):
    if nx is None or cls(nx) is None: return 0
    v = T(cls(n), cls(nx))
    return md(s, v, 100) * mult if v else 0
def delim(c, s, h):
    """LEFT/RIGHT delimiter: (width, kind, pieces) ; 0x100a1500/0x100a13d0/0x100a16a0."""
    tab = {'(': (1, 0xe07c, 0xe07e, 0, 0xe07d, 0xe044), ')': (9, 0xe07f, 0xe081, 0, 0xe080, 0xe045),
           '{': (2, 0xe078, 0xe07a, 0xe07b, 0xe079, 0xe04b), '}': (10, 0xe082, 0xe084, 0xe07b, 0xe083, 0xe04c),
           '[': (3, 0xe100, 0xe103, 0, 0xe101, 0xe049), ']': (11, 0xe102, 0xe104, 0, 0xe105, 0xe04a),
           '|': (5, 0, 0, 0, 0xe101, 0xe101), '<': (4, 0, 0, 0, 0x2329, 0x2329), '>': (12, 0, 0, 0, 0x232a, 0x232a)}
    if c in ('.',) : return 0, None
    if PUA_BAR and c not in tab and len(c) == 1 and ord(c) > 0x7f:
        # 14차: 표에 없는 글자(문서에 직접 넣은 U+E04D 등)를 LEFT/RIGHT 뒤에 쓰면 < > 처럼 폭 = max(글자 폭, h/4), 늘이지 않은 글자 하나
        # (기출 PDF: h 1350 → 337 HU, h 1125 → 281 HU, 글자는 상자 왼끝에 그대로)
        return max(gw(ord(c), s), h // 4), dict(ty=99, single=ord(c), thr=10 ** 9)
    if c not in tab: raise Unsupported('delim ' + c)
    ty, top, bot, ext, mid, single = tab[c]
    wm = gw(mid, s); hm = cy(s)
    if mid in (0x2329, 0x232a): wm = wm * 2 // 3
    if ty in (4, 12): wm = max(wm, h // 4)
    th = {1: 3, 9: 3, 2: 3, 10: 3, 3: 2, 11: 2}.get(ty, 1) * cy(s)
    return wm, dict(ty=ty, top=top, bot=bot, ext=ext, mid=mid, single=single, thr=th)

def m_node(n, s, nx, prev):
    k = n['k']
    if k == 'ch':
        LAST[0] = s; c = cy(s)
        return gw(n['code'], s) + (75 if n.get('bold') else 0) + gap(n, s, nx), -half(c), -half(c) + c
    if k == 'prime':
        # observed: drawn in a non-HYhwpEQ font (not in PDF glyph trace); width ' 300, '' 450 HU at s=1100 (observed)
        LAST[0] = s; c = cy(s)
        hp = 2 * md(s // 2, 96, 7200)          # fitted: '' = one glyph (adv~430/1024), ' = adv~300/1024, same 96dpi px rule
        k2, k1 = divmod(n['n'], 2)
        w = (k2 * int(430 * hp / 1024 + 0.5) + k1 * int(300 * hp / 1024 + 0.5)) * 75
        if GDI_W:   # 14차: ' = Batang U+2032, '' = U+2033 (GDI 진행폭: 11pt 4·6px, 9pt 4·7px — 모의고사 자료 일치)
            H, Wd = md(s, 96, 7200), md(s // 2, 96, 7200)
            a1 = _gdi_face(0x2032, H, Wd, 'Haansoft Batang'); a2 = _gdi_face(0x2033, H, Wd, 'Haansoft Batang')
            if a1 and a2: w = (k2 * a2 + k1 * a1) * 75
        return w + gap(n, s, nx), -half(c), -half(c) + c
    if k == 'sp':
        LAST[0] = s
        w = (s // 2) if n['t'] == '~' else (s // 2) // 4
        return w + gap(n, s, nx), -half(s), -half(s) + s
    if k == 'grp':
        w, t, b = m_row(n['row'], s, nx); return w, t, b
    if k == 'sty':
        return 0, None, None
    if k == 'amp':
        return md(s, 20, 100), None, None
    if k == 'eqrows':
        # 16차: 줄 사이 MulDiv(s,10,100), 첫 줄 기준선이 식 기준선, 폭 = 가장 넓은 줄. 빈 줄은 높이 s
        g = md(s, 10, 100) if n.get('top') else 0; W = 0; y = 0; top = None; bot = None; n['_rdy'] = []   # 18차: 줄 사이 틈은 식 맨 바깥에서만, 안(첨자·분수·cases)에선 0
        for i, r in enumerate(n['rows']):
            w, t_, b_ = m_row(r, s)
            if t_ is None: t_, b_ = -half(s), -half(s) + s
            if i == 0: dy = 0; top = t_
            else: dy = bot + g - t_
            n['_rdy'].append(dy); bot = b_ + dy
        # 18차: & 가 있으면 첫 칸은 오른쪽 맞춤(첫 칸 폭 = 줄들 중 최대), 뒤 칸은 그대로 이어짐 (eqalign{a & = b # c & = d} 2326)
        seg0 = []
        for r in n['rows']:
            w0 = 0
            for q_ in r:
                if q_['k'] == 'amp': break
                w0 += q_.get('_w', 0)
            seg0.append(w0 if any(q_['k'] == 'amp' for q_ in r) else None)
        c0 = max([v for v in seg0 if v is not None], default=0)
        n['_rdx'] = [(c0 - v) if v is not None else 0 for v in seg0]
        for r, dx in zip(n['rows'], n['_rdx']):
            W = max(W, sum(q_.get('_w', 0) for q_ in r) + dx)
        LAST[0] = s
        return W, top, bot
    if k == 'frac':
        nw, nt, nb = m_row(n['num'], s); dw, dt, db = m_row(n['den'], s)
        if n.get('den_empty'): dw, dt, db = 0, -half(s), -half(s) + s     # 19차: 빈 분모 = 높이 s
        g = md(s, 30, 100); LAST[0] = s
        W = max(nw, dw, s // 2) + md(s, 50, 100)
        top = -half(g) - (nb - nt); return W, top, top + g + (nb - nt) + (db - dt)
    if k == 'sqrt':
        iw = ih = 0
        if n['idx'] is not None:
            iw, it_, ib = m_row(n['idx'], md(s, 50, 100)); ih = (ib - it_) if it_ is not None else 0
        cw, ct, cb = m_row(n['body'], s); LAST[0] = s
        rw = gw(0xe05c, s); rh = cy(s)
        p = max(100, ((md(s, 10, 100) + (cb - ct)) * 100) // rh)
        R = md(rh, p, 100); e_raw = ih - md(R, 52, 100); e = max(e_raw, md(s, 5, 100)) if e_raw > md(s, 5, 100) else md(s, 5, 100)
        off = rw + max(0, iw - rw // 2)
        n.update(_rw=rw, _p=p, _R=R, _e=e, _eraw=e_raw, _off=off, _iw=iw, _ct=ct, _cw=cw)
        top = ct - md(s, 10, 100) - e
        return md(s, 17, 100) + off + cw, top, top + R + e
    if k == 'scr':
        bt = bb = None
        if prev is not None and prev.get('_t') is not None: bt, bb = prev['_t'], prev['_b']
        elif EMPTY_SCR and prev is not None and prev['k'] == 'sty':
            bt, bb = -half(s), -half(s) + s                 # 14차: 스타일 노드(it/rm)가 첨자 밑이면 크기 s 빈 상자 (rm A it_{`n} h 1337)
        ss = md(s, 68, 100)
        sub = n.get('_'); sup = n.get('^'); res = {}
        LAST[0] = s
        for key in ('_', '^'):
            if n.get(key) is not None:
                res[key] = m_row(n[key], ss)
                if EMPTY_SCR and res[key][1] is None and any(q_['k'] == 'sty' for q_ in flat(n[key])):      # 14차: 스타일만 든 첨자(^it, _it)도 크기 ss 빈 상자 (빈 ^{} 는 상자 없음)
                    c_ = cy(ss) if EMPTYH22 == 'cy' else (ss if EMPTYH22 == 'ss' else int(EMPTYH22) * ss // 100)
                    res[key] = (res[key][0], -half(c_), -half(c_) + c_)
        f = LAST[0]
        if bt is None:
            bt, bb = -half(f), half(f)
            pp = prev.get('_pv') if prev is not None else None
            if EMPTY_ORD and prev is not None and prev['k'] == 'grp' and not prev['row'] and pp is not None and pp.get('_t') is not None:
                bt, bb = pp['_t'], pp['_b']     # 14차: 빈 {} 의 첨자 기준 = 그 앞 노드 상자 (6 NE {}_{5}C: 5 가 4px 아래). 식 처음이면 옛 기본값
        osub = bb - md(f, 20, 100); osup = bt + md(f, 25, 100)
        if '_' in res and res['_'][1] is not None and res['_'][1] + osub < 0: osub -= res['_'][1] + osub
        if '^' in res and res['^'][2] is not None and res['^'][2] + osup > 0: osup -= res['^'][2] + osup
        n['_osub'], n['_osup'] = osub, osup
        w = max(r[0] for r in res.values())
        _empty = all(r[0] == 0 for r in res.values())
        c1 = 1
        if SCRGAP22 == '1' and _empty:
            # 22차 시험: 스타일만 든 빈 첨자는 간격 분류를 밑 노드에서 물려받음(밑이 없으면 간격 없음)
            c1 = cls(prev) if prev is not None and prev['k'] not in ('sty',) else None
        if c1 is not None and nx is not None and T(c1, cls(nx)): w += md(s, T(c1, cls(nx)), 100) * 10
        elif '^' in res and ucit(prev): w += md(s, 15, 100)
        top = (res['^'][1] + osup) if '^' in res and res['^'][1] is not None else bt
        bot = (res['_'][2] + osub) if '_' in res and res['_'][2] is not None else bb
        return w, top, bot
    if k == 'deco':
        LAST[0] = s; cw, ct, cb = m_row(n['body'], s)   # 10차: 0x1009baf0/0x1009b580 은 내용을 마지막에 잼 -> 마지막 글꼴 = 내용 쪽
        g = gw(0xe06d, s); gh = cy(s); m = md(gh, 20, 100)
        n['_g'], n['_m'], n['_cw'] = g, m, cw
        d = n['d']
        if d == 'vec': W = max(cw + md(g, 20, 100), g)          # 0x1009b580
        elif d in ('bar', 'dyad', 'under'): W = max(g, cw) + md(g, 20, 100)   # 0x1009baf0 / 0x1009c450
        elif d == 'breve': return cw, ct, cb                        # 13차: 그리지 않음, 상자 = 내용
        else:
            gg = gw(DECOS[d], s); n['_g'] = gg; W = max(gg, cw)     # hat 0x1009df90, dot 0x1009d730 ... 
        if d == 'under': return W, ct, cb + m                      # 0x1009c230: 선은 아래
        if d == 'arch':                                             # 13차 실측 맞춤: 위 m, 아래 m/3 (11pt 225+75)
            return W, ct - m, cb + m // 3
        return W, ct - m, cb
    if k == 'lr':
        cw, ct, cb = m_row(n['body'], s); LAST[0] = s
        if ct is None: ct, cb = -half(s), -half(s) + s       # 14차: 빈 LEFT … RIGHT (LEFT . it RIGHT ) 은 높이 s
        h = cb - ct
        wl, dl = delim(n['l'], s, h); wr, dr = delim(n['r'], s, h)
        n.update(_wl=wl, _wr=wr, _dl=dl, _dr=dr, _h=h, _ct=ct, _cw=cw)
        return wl + wr + cw, ct, cb
    if k == 'box':
        cw, ct, cb = m_row(n['body'], s); LAST[0] = s
        g = gw(0xe06d, s); gh = cy(s)
        W = max(g, cw) + md(g, 20, 100); top = ct - md(g, 15, 100); H = (cb - ct) + md(gh, 20, 100)
        n.update(_cw=cw, _W=W)
        return W, top, top + H
    if k == 'mat':
        rows = n['rows']; ncol = max(len(r) for r in rows)
        cells = [[m_row(c, s, cell=True) for c in r] for r in rows]
        colw = [max((cells[i][j][0] if j < len(cells[i]) else 0) for i in range(len(rows))) for j in range(ncol)]
        rowh = [max(((c[2] - c[1]) if c[1] is not None else 0) for c in r) for r in cells]
        gc = md(s, 20, 100); gr = md(s, 15, 100)
        H = sum(rowh) + gr * (len(rows) - 1)
        lp, rp = MATS[n['m']] if MATS[n['m']] else (None, None)
        wl = delim(lp, s, H)[0] if lp else 0; wr = delim(rp, s, H)[0] if rp else 0
        W = wl + sum(colw) + gc * (ncol - 1) + wr
        n.update(_cells=cells, _colw=colw, _rowh=rowh, _H=H, _wl=wl, _wr=wr, _gc=gc, _gr=gr)
        LAST[0] = s
        return W, -half(H), -half(H) + H
    if k == 'int':
        S2 = md(s, 200, 100); gW = gw(n['code'], S2); gH = cy(S2); ss = md(s, 68, 100)
        lw, lt, lb = m_row(n['lo'], ss) if n['lo'] else (0, 0, 0)
        hw, ht, hb = m_row(n['hi'], ss) if n['hi'] else (0, 0, 0)
        if lt is None: lt = lb = 0
        if ht is None: ht = hb = 0
        lx = gW - md(s, 50, 100); hx = gW + md(s, 5, 100)
        lay = half(gH); hay = ss // 6 - half(gH)
        bx = max(lx + lw, hx + hw) + md(s, 1, 100)
        n.update(_gW=gW, _gH=gH, _lx=lx, _hx=hx, _lay=lay, _hay=hay, _bx=bx, _S2=S2)
        t = b = None
        for (tt, bb_, ay) in ((lt, lb, lay), (ht, hb, hay)):
            if tt is None: continue
            t = tt + ay if t is None else min(t, tt + ay); b = bb_ + ay if b is None else max(b, bb_ + ay)
        bw, bt, bb = m_row(n.get('body', []), s) if n.get('body') else (0, None, None)
        if bt is not None: t = min(t, bt); b = max(b, bb)
        LAST[0] = s
        return bx + bw, t, b
    if k == 'rel':
        # 17차: 위·아래 글은 노드 크기 s 그대로, 빈 목록 = 폭 s/2·높이 s. L = max(위, 아래) + MulDiv(s,50,100)
        def mm(r_):
            if not r_: return s // 2, -half(s), -half(s) + s
            w_, t_, b_ = m_row(r_, s)
            return (w_, t_, b_) if t_ is not None else (w_, -half(s), -half(s) + s)
        hw_, ht, hb = mm(n['hi']); lw_, lt, lb = mm(n['lo'])
        W = max(hw_, lw_) + md(s, 50, 100)
        c = n['code']; ARR = {0x2190: 'l', 0x2192: 'r', 0x2194: 'lr', 0x21d0: 'l2', 0x21d2: 'r2', 0x21d4: 'lr2', 0x21c4: 'x'}
        if c in ARR:
            hs = cy(s); ah = md(hs, 30, 100) + md(hs, 5, 100)
            if ARR[c] == 'x': ah *= 2
        else:
            ah = cy(s)
        n.update(_W=W, _ah=ah, _hw=hw_, _lw=lw_, _ht=ht, _hb=hb, _lt=lt, _lb=lb)
        LAST[0] = s
        top = -half(ah) - (hb - ht)
        return W, top, top + (hb - ht) + ah + (lb - lt)
    if k == 'brace':
        # 17차: 괄호 조각 폭 g(11pt 1050), 두께 = MulDiv(칸,35,100), 최소 길이 3g. 글 = s·68/100, 몸 = s
        g = gw(0xe106, s); th = md(cy(s), 35, 100); ss = md(s, 68, 100)
        bw, bt, bb = m_row(n['body'], s) if n['body'] else (s // 2, -half(s), -half(s) + s)
        if bt is None: bt, bb = -half(s), -half(s) + s
        lw, lt, lb = m_row(n['lab'], ss) if n['lab'] else (ss // 2, -half(ss), -half(ss) + ss)
        if lt is None: lt, lb = -half(ss), -half(ss) + ss
        adj = md(s, 15 if n['ov'] else 5, 100) if xheight_only(n['body'] if n['ov'] else n['lab']) else 0   # 18차: UNDERBRACE 는 아래 글(68%) 로 낮은 글자 검사
        W = max(bw, lw, 3 * g)
        n.update(_W=W, _g=g, _th=th - adj, _bw=bw, _lw=lw, _bt=bt, _bb=bb, _lt=lt, _lb=lb, _ss=ss)
        LAST[0] = s
        if n['ov']: return W, bt - (th - adj) - (lb - lt), bb
        return W, bt, bb + (th - adj) + (lb - lt)
    if k == 'lscr':
        bw = 0; bt = bb = None
        for b_ in n['base']:
            w_, t_, b2 = m_node(b_, s, None, None); b_['_w'] = w_; b_['_t'] = t_; b_['_b'] = b2; bw += w_
            bt, bb = t_, b2
        sc = {'k': 'scr'}
        for key in ('^', '_'):
            if n.get(key) is not None: sc[key] = n[key]
        ws, ts, bs = m_node(sc, s, None, {'k': 'grp', 'row': [], '_t': bt, '_b': bb})
        n.update(_sc=sc, _bw=bw, _ws=ws)
        LAST[0] = s
        return ws + bw, min(ts, bt) if bt is not None else ts, max(bs, bb) if bb is not None else bs
    if k == 'sum' and n.get('code') is None:
        # 17차 UNDEROVER: 몸 = 인자 목록(크기 s), 위·아래 끝 s·68%, 몸 상자에 바로 붙음, 모두 가운데
        ss = md(s, 68, 100); bw, bt, bb = m_row(n['body'], s) if n['body'] else (0, None, None)
        if bt is None: bt, bb = -half(s), -half(s) + s
        lw, lt, lb = m_row(n['lo'], ss) if n['lo'] else (0, 0, 0)
        hw, ht, hb = m_row(n['hi'], ss) if n['hi'] else (0, 0, 0)
        W = max(bw, lw, hw); n.update(_bw=bw, _bt=bt, _bb=bb)
        LAST[0] = s
        return W, bt - ((hb - ht) if n['hi'] else 0), bb + ((lb - lt) if n['lo'] else 0)
    if k == 'sum':
        S2 = md(s, 180, 100); gW = gw(n['code'], S2); G = md(cy(S2), 75, 100); ss = md(s, 68, 100)
        lw, lt, lb = m_row(n['lo'], ss) if n['lo'] else (0, 0, 0)
        hw, ht, hb = m_row(n['hi'], ss) if n['hi'] else (0, 0, 0)
        W = max(gW, lw, hw)
        n.update(_gW=gW, _G=G, _S2=S2, _lw=lw, _hw=hw)
        top = -half(G) - ((hb - ht) if n['hi'] else 0)
        LAST[0] = s
        return W, top, top + G + ((hb - ht) if n['hi'] else 0) + ((lb - lt) if n['lo'] else 0)
    if k == 'lim':
        S2 = md(s, 120, 100); L = cy(S2)
        word = [0x4c if n['cap'] else 0x6c, 0x69, 0x6d]
        ww = sum(gw(c, S2) for c in word)
        lw, lt, lb = m_row(n['lo'], md(s, 68, 100)) if n['lo'] else (0, 0, 0)
        W = max(ww, lw)
        bw, bt, bb = m_row(n.get('body', []), s) if n.get('body') else (0, None, None)
        n.update(_L=L, _ww=ww, _lw=lw, _W=W, _word=word, _S2=S2, _bw=bw)
        LAST[0] = s
        top = -half(L) if bt is None else min(bt, -half(L))
        bot = half(L) + ((lb - lt) if n['lo'] else 0)
        if bb is not None: bot = max(bot, bb)
        return W + bw, top, bot
    raise Unsupported(k)

# ---------------- draw -----------------
def d_row(nodes, s, x, ay, out):
    for n in nodes:
        d_node(n, s, x, ay + n.get('_dy', 0), out); x += n['_w']
def glyph(out, code, x, top, fh, rm=False, kind=None):
    if TA_TOP(code): out.append((code, x, top, 't', fh)); return
    y = top + md(fh, 85, 100)
    if rm:
        if 0x61 <= code <= 0x7a: y -= md(fh, 67, 1000)
        elif 0x41 <= code <= 0x5a: y -= md(fh, 65, 1000)
    out.append((code, x, y, 'b', fh))
def d_node(n, s, x, ay, out):
    k = n['k']
    if k == 'ch':
        glyph(out, n['code'], x, ay + n['_t'], s, n['rm'])
    elif k == 'grp':
        if not n.get('hide'): d_row(n['row'], s, x, ay, out)
        if n.get('slash') and n.get('_t') is not None: out.append((0xe054, x, ay + n['_t'] + (12 if LAST[0] >= 1000 else 0), 't', LAST[0]))   # 11pt 는 1px 아래(실측)
    elif k == 'eqrows':
        for r, dy, dx in zip(n['rows'], n['_rdy'], n.get('_rdx') or [0] * len(n['rows'])):
            m_row(r, s); d_row(r, s, x + dx, ay + dy, out)
    elif k == 'frac':
        W = n['_w']; g = md(s, 30, 100)
        out.append((0xe06d, x + md(s, 10, 100), ay - half(g), 't', s))   # fitted below
        num, den = n['num'], n['den']
        nw, nt, nb = m_row(num, s); dw, dt, db = m_row(den, s)
        d_row(num, s, x + W // 2 - nw // 2, ay - half(g) - nb, out)
        if not n.get('den_empty'): d_row(den, s, x + W // 2 - dw // 2, ay + half(g) - dt, out)
    elif k == 'sqrt':
        top = ay + n['_t']
        fh = md(s, n['_p'], 100)
        glyph(out, 0xe05c, x + max(0, n['_iw'] - n['_rw'] // 2), top + n['_e'], fh)
        if n['idx'] is not None:
            iw, it_, ib = m_row(n['idx'], md(s, 50, 100))
            itop = top - min(n['_eraw'], 0)
            d_row(n['idx'], md(s, 50, 100), x + max(0, n['_rw'] // 2 - iw), itop - it_, out)
        m_row(n['body'], s)
        d_row(n['body'], s, x + n['_off'], ay, out)
        out.append((0xe06d, x + n['_off'] - md(s, 2, 100), top + n['_e'] - md(s, 18, 100), 't', s))
    elif k == 'scr':
        ss = md(s, 68, 100)
        for key, off in (('_', n['_osub']), ('^', n['_osup'])):
            if n.get(key) is None: continue
            w, t, b = m_row(n[key], ss)
            xx = x + (md(s, 15, 100) if key == '^' and ucit(n.get('_prev')) else 0)
            if n.get('_prevk') == 'sqrt': xx -= md(s, 17, 100)
            d_row(n[key], ss, xx, ay + off, out)
    elif k == 'deco':
        cw = n['_cw']; W = n['_w']
        d_row(n['body'], s, x + W // 2 - cw // 2, ay, out)
        top = ay + n['_t']
        if n['d'] == 'vec':
            a = md(n['_g'], 55, 100); d = s // 40
            if cw - a >= 0: out.append((0xe06d, x + d, top - n['_m'], 't', s))      # 0x1009b6d0: y = top - MulDiv(cell,20,100)
            out.append((0xe06e, x + d + max(0, cw - a), top - n['_m'], 't', s))
        elif n['d'] in ('dot', 'ddot', 'acute', 'grave'):          # 0x1009d4e0 / d970 / cbd0 / d050
            xh = xheight_only(n['body']); off = 0 if xh else n['_m'] // 2
            D = {'dot': -10, 'ddot': -10, 'acute': 20, 'grave': 40}[n['d']]
            out.append((DECOS[n['d']], x + W // 2 - n['_g'] // 2 + int(s / D), top - off, 't', s))
        elif n['d'] in ('hat', 'check', 'tilde', 'arch'):          # 0x1009e0d0 / e610 / f0a0 / eb50
            xh = xheight_only(n['body'])
            cap = {'hat': 8, 'check': 8, 'tilde': 6, 'arch': 6}[n['d']] * (s // 2)
            L = min(W, cap) if W > s // 2 else n['_g']
            sh = md(L, 20 if n['d'] == 'tilde' else 10, 100)
            dx = s // 20
            if n['d'] == 'arch': off = md(n['_m'], 10 if xh else 45, 100); yy = top - off     # 0x1009eb50
            else: off = 0 if xh else n['_m'] // 2; yy = top - off
            out.append((DECOS[n['d']], x + W // 2 - L // 2 + dx - sh, yy, 't', s))
        elif n['d'] == 'under':                                     # 0x1009c230
            out.append((0xe06d, x + s // 20, ay + n['_t'] + (n['_b'] - n['_t']) - n['_m'] - md(n['_m'], 80, 100), 't', s))
        elif n['d'] == 'dyad':                                      # 0x1009bc40 (화살 양쪽)
            xh = xheight_only(n['body']); off = 0 if xh else n['_m'] // 2
            yy = top - off; a = md(n['_g'], 60, 100); d = s // 20; L = cw
            if L - a >= 0:
                out.append((0xe06d, x + d, yy, 't', s)); out.append((0xe06c, x + d + a - n['_g'], yy, 't', s)); out.append((0xe06e, x + d + L - a, yy, 't', s))
            else:
                out.append((0xe06e, x + d, yy, 't', s)); out.append((0xe06c, x + d - n['_g'] + a, yy, 't', s))
        elif n['d'] == 'breve':
            pass
        else:   # 10차: bar 그리기 0x1009bed0 + 글자 검사 0x1009b0e0
            xh = xheight_only(n['body'])
            off = 0 if xh else n['_m'] // 2
            dx = s // 4 if (n['body'] and flat(n['body']) and n.get('_ucflag')) else s // 20
            out.append((0xe06d, x + dx, top - off, 't', s))
    elif k == 'lr':
        top = ay + n['_ct']; h = n['_h']
        for dd, xx in ((n['_dl'], x), (n['_dr'], x + n['_wl'] + n['_cw'])):
            if dd: draw_delim(out, dd, s, xx, top, h)
        d_row(n['body'], s, x + n['_wl'], ay, out)
    elif k == 'box':
        cw = n['_cw']; W = n['_W']
        d_row(n['body'], s, x + W // 2 - cw // 2, ay, out)
    elif k == 'mat':
        rows = n['rows']; cells = n['_cells']; H = n['_H']
        ytop = ay - half(H)
        lp, rp = MATS[n['m']] if MATS[n['m']] else (None, None)
        if lp: draw_delim(out, delim(lp, s, H)[1], s, x, ytop, H)
        if rp: draw_delim(out, delim(rp, s, H)[1], s, x + n['_w'] - n['_wr'], ytop, H)
        for i, r in enumerate(rows):
            xc = x + n['_wl']
            for j in range(len(n['_colw'])):
                if j < len(r):
                    cw, ct, cb = m_row(r[j], s)
                    if ct is not None:
                        ch_ = cb - ct
                        if n['m'] in ('pile', 'lpile', 'rpile'): cty = ytop
                        else: cty = ytop + (n['_rowh'][i] - ch_) // 2
                        al = n['_colw'][j] - cw
                        if n['m'] in ('cases', 'lpile'): dx = 0
                        elif n['m'] == 'rpile': dx = al
                        elif n['m'] == 'pile': dx = n['_colw'][j] // 2 - cw // 2
                        else: dx = al // 2
                        d_row(r[j], s, xc + dx, cty - ct, out)
                xc += n['_colw'][j] + n['_gc']
            ytop += n['_rowh'][i] + n['_gr']
    elif k == 'int':
        glyph(out, n['code'], x, ay - n['_gH'] // 2, n['_S2'])   # E05B->E072 only in roman mode
        ss = md(s, 68, 100)
        if n['lo']: m_row(n['lo'], ss); d_row(n['lo'], ss, x + n['_lx'], ay + n['_lay'], out)
        if n['hi']: m_row(n['hi'], ss); d_row(n['hi'], ss, x + n['_hx'], ay + n['_hay'], out)
        if n.get('body'): m_row(n['body'], s); d_row(n['body'], s, x + n['_bx'], ay, out)
    elif k == 'sum' and n.get('code') is None:
        W = n['_w']; ss = md(s, 68, 100); m_row(n['body'], s)
        d_row(n['body'], s, x + W // 2 - n['_bw'] // 2, ay, out)
        if n['lo']:
            lw, lt, lb = m_row(n['lo'], ss); d_row(n['lo'], ss, x + W // 2 - lw // 2, ay + n['_bb'] - lt, out)
        if n['hi']:
            hw, ht, hb = m_row(n['hi'], ss); d_row(n['hi'], ss, x + W // 2 - hw // 2, ay + n['_bt'] - hb, out)
    elif k == 'rel':
        W = n['_W']; ah = n['_ah']
        if n['hi']: hw_, ht, hb = m_row(n['hi'], s); d_row(n['hi'], s, x + W // 2 - hw_ // 2, ay - half(ah) - hb, out)
        if n['lo']: lw, lt, lb = m_row(n['lo'], s); d_row(n['lo'], s, x + W // 2 - lw // 2, ay - half(ah) + ah - lt, out)
        c = n['code']; KIND = {0x2192: 0, 0x2190: 1, 0x2194: 2, 0x21d2: 3, 0x21d0: 4, 0x21d4: 5, 0x21c4: 6}
        if c in KIND:
            # 18차(HwpPlugin 0x1008fc20 → 0x100a1100): 화살 조각 자리
            kd = KIND[c]; dbl = kd in (3, 4, 5)
            SH, LH, RH = (0xe070, 0xe06f, 0xe071) if dbl else (0xe059, 0xe058, 0xe05a)
            hs = cy(s); hh = cy(s); gsh = gw(SH, s); hw = md(gw(RH, s), 80, 100)
            p5 = md(hw, 150, 100) if kd in (2, 5) else hw
            A = max(W, p5) + md(hs, 5, 100)
            x0 = x + int(W / 2) - int(A / 2) + md(hs, 3, 100)        # 화살 시작 = 상자 가운데 − A/2 + MulDiv(hs,3,100)
            yt = ay - int(hh / 2) - md(hs, 5, 100)                    # 조각 위끝(TA_TOP) = 축 − 머리높이/2 − MulDiv(hs,5,100)
            xl = x0 - (gsh - hw); xs2 = x0 + (hw - hw // 2); xr = x0 - hw + W
            if kd in (0, 3):
                if W >= p5: out.append((SH, x0, yt, 't', s))
                out.append((RH, xr if W >= p5 else x0, yt, 't', s))
            elif kd in (1, 4):
                if W >= p5: out.append((SH, xs2, yt, 't', s))
                out.append((LH, xl, yt, 't', s))
            elif kd in (2, 5):
                if W >= p5: out.append((SH, xs2, yt, 't', s)); out.append((LH, xl, yt, 't', s)); out.append((RH, xr, yt, 't', s))
                else: out.append((LH, xl, yt, 't', s)); out.append((RH, hw // 2 + x0, yt, 't', s))
            else:
                d6 = md(hs, 30, 100); yu = yt - d6 // 2; yd = yt + d6 // 2
                if W >= p5:
                    out.append((SH, xs2, yd, 't', s)); out.append((SH, x0, yu, 't', s)); out.append((LH, xl, yd, 't', s)); out.append((RH, xr, yu, 't', s))
                else:
                    out.append((LH, xl, yd, 't', s)); out.append((RH, x0, yu, 't', s))
        else:
            glyph(out, c, x + W // 2 - gw(c, s) // 2, ay - half(ah), s)
    elif k == 'brace':
        # 18차(0x100a0790): 조각은 자식보다 먼저 그려지고, 글꼴 높이는 직전에 쓰던 글꼴 그대로(위첨자 속에서도 앞 글자 크기)
        W = n['_W']; g = n['_g']; ss = n['_ss']; th = n['_th']
        fs = out[-1][4] if out else (s if n['ov'] else ss)
        e3 = md(s, 3, 100); hp = cy(s)
        upper_h = (n['_lb'] - n['_lt']) if n['ov'] else (n['_bb'] - n['_bt'])
        top = ay + n['_t']
        yt = top + upper_h - md(hp, 30, 100)                         # 조각 상자 위 = 노드 위 + 윗부분 높이 − MulDiv(조각높이,30,100)
        cw = n['_bw']; x0 = x + ((W - cw) // 2 if 3 * g < W else 0)
        ext = md(s, 20, 100) + (cw - 3 * g)
        P = (0xe106, 0xe107, 0xe109, 0xe108) if n['ov'] else (0xe10a, 0xe10b, 0xe10d, 0xe10c)
        if ext < 0:
            glyph(out, P[0], x0, yt, fs); glyph(out, P[1], x0 - e3 + g, yt, fs); glyph(out, P[2], x0 + g - 2 * e3 + g, yt, fs)
        else:
            glyph(out, P[3], x0 - e3 + g, yt, fs); glyph(out, P[3], x0 + ext // 2 - 3 * e3 + g + g, yt, fs)
            glyph(out, P[0], x0, yt, fs); glyph(out, P[1], x0 + ext // 2 - 2 * e3 + g, yt, fs)
            glyph(out, P[2], x0 + g - 4 * e3 + ext + g - 1, yt, fs)
        m_row(n['body'], s); d_row(n['body'], s, x + W // 2 - n['_bw'] // 2, ay, out)
        if n['ov']:
            if n['lab']: m_row(n['lab'], ss); d_row(n['lab'], ss, x + W // 2 - n['_lw'] // 2, ay + n['_bt'] - th - n['_lb'], out)
        else:
            if n['lab']: m_row(n['lab'], ss); d_row(n['lab'], ss, x + W // 2 - n['_lw'] // 2, ay + n['_bb'] + th - n['_lt'], out)
    elif k == 'lscr':
        sc = n['_sc']; ws = n['_ws']
        d_node(sc, s, x, ay, out)        # 17차: 왼쪽 첨자 = 보통 첨자와 같은 세로 자리, x 0 부터; 밑 글자는 그 뒤
        xb = x + ws
        for b_ in n['base']: d_node(b_, s, xb, ay, out); xb += b_['_w']
    elif k == 'sum':
        G = n['_G']; W = n['_w']; ss = md(s, 68, 100)
        gy = ay - G // 2 - md(G, 10, 100)
        if 0x2200 <= n['code'] < 0xe000 and NEW17: gy -= md(n['_S2'], 5, 100)   # 17차: BIG… 유니코드 글자는 기준선이 MulDiv(S2,5,100) 위 (11pt 8px)
        glyph(out, n['code'], x + W // 2 - n['_gW'] // 2, gy, n['_S2'])
        if n['lo']:
            lw, lt, lb = m_row(n['lo'], ss); d_row(n['lo'], ss, x + W // 2 - lw // 2, ay + G // 2 - lt, out)
        if n['hi']:
            hw, ht, hb = m_row(n['hi'], ss); d_row(n['hi'], ss, x + W // 2 - hw // 2, ay - G // 2 - hb, out)
    elif k == 'lim':
        W = n['_W']; L = n['_L']; xx = x + W // 2 - n['_ww'] // 2
        hpd = 2 * md(n['_S2'] // 2, 1, 12)          # one ExtTextOutW string: later letters advance at device ppem (600dpi)
        for c in n['_word']:
            out.append((c, xx, ay - L // 2 + md(n['_S2'], 85, 100), 'b', n['_S2'])); xx += 12 * int(adv(c) * hpd / 1024 + 0.5)
        if n.get('body'): m_row(n['body'], s); d_row(n['body'], s, x + W, ay, out)
        if n['lo']:
            ss = md(s, 68, 100); lw, lt, lb = m_row(n['lo'], ss)
            d_row(n['lo'], ss, x + W // 2 - lw // 2, ay + L // 2 - lt, out)

def gl_t(out, code, x, top, fh):
    out.append((code, x, top, 't' if TA_TOP(code) else 'tb', fh))
def draw_delim(out, dd, s, x, y, need):
    """0x100a1830: stretched delimiter pieces. y = content top, need = content height."""
    ty = dd['ty']; c = cy(s)
    if need < dd['thr']:
        sh = (s // 8) if ty in (3, 11) else (-(s // 8) if ty in (4, 12) else 0)
        gl_t(out, dd['single'], x + sh, y, need); return
    if ty in (1, 9):
        rest = need - 2 * c
        gl_t(out, dd['top'], x, y, s); gl_t(out, dd['bot'], x, y + c + rest, s)
        e4 = md(c, 5, 100); e8 = md(c, 5, 100); N = int((e8 + e4 + rest) / 0.098); k = 0
        while N > 0:
            gl_t(out, dd['mid'], x, y + c - e4 + k, min(N, 50000)); N -= 50000; k += 0x1324
    elif ty in (2, 10):
        e5 = md(s, 5, 100); hf = (need - dd['thr']) // 2 if need >= dd['thr'] else -((dd['thr'] - need) // 2)
        i7 = int(hf * 0.26 / 0.48); i12 = e5 * 2 - int(hf / -0.48)
        gl_t(out, dd['top'], x, y, s); gl_t(out, dd['mid'], x, y + hf + c, s); gl_t(out, dd['bot'], x, y + 2 * hf + c + c, s)
        gl_t(out, dd['ext'], x, y + c - i7 - e5, i12); gl_t(out, dd['ext'], x, y - i7 - e5 + c + c + hf, i12)
    elif ty in (3, 11):
        rest = need - dd['thr']
        gl_t(out, dd['top'], x, y, s); gl_t(out, dd['bot'], x, y + c + rest, s)
        gl_t(out, dd['mid'], x, y + c - md(c, 80, 100), md(c, 5, 100) + md(c, 80, 100) + rest)
    elif ty in (4, 12):
        gl_t(out, dd['single'], x - s // 8, y, need)
    else:
        gl_t(out, dd['single'], x, y, need)

XH_OK = set([0xe0e5, 0xe0e7, 0xe0e9, 0xe0eb, 0xe0ed, 0xe0ee, 0xe01a, 0xe01c, 0xe020, 0xe053]) | set(range(0xe0f1, 0xe0ff))     | set(range(0xe026, 0xe034)) | set(range(0xe09d, 0xe0a4)) | set(range(0xe0a5, 0xe0b5))
def xheight_only(row):
    """0x1009b0e0: bar 내용이 '위로 안 솟는 글자'(a c e g i j m~z, 일부 그리스 소문자, '.')만이면 1. rm 글자도 PUA 코드로 판정."""
    for n in flat(row):
        if n['k'] == 'sty': continue
        if n['k'] != 'ch': return False
        c = n['code']
        if n['rm'] and 0x61 <= c <= 0x7a: c = c - 0x61 + 0xe0e5
        if c not in XH_OK: return False
    return True

def annotate(nodes):
    for i, n in enumerate(nodes):
        if n['k'] == 'scr' and i:
            n['_prev'] = nodes[i - 1]; n['_prevk'] = nodes[i - 1]['k']
        if n['k'] == 'eqrows':
            for r in n['rows']: annotate(r)
        for key in ('row', 'num', 'den', 'body', 'idx', 'lo', 'hi', '_', '^'):
            v = n.get(key)
            if isinstance(v, list): annotate(v)
        if n['k'] == 'mat':
            for r in n['rows']:
                for c in r: annotate(c)

def baseline(top, bot, s):
    """14차: hwpx baseLine(%) = floor(100·A/h) + 1, A = 상자 위끝 → 글자 기준선(축 + MulDiv(s,35,100)), h = bot − top.
    (옛 식 100 − floor(100·(bot − 0.35s)/h) 는 100·A/h 가 정수일 때 1 작음 — 9pt 한 글자 86 등. 자료 64,656식 전부 일치)"""
    h = bot - top
    if os.environ.get('EQ8_BLOLD') == '1': return 100 - (100 * (bot - md(s, 35, 100))) // h if h else None
    return (100 * (md(s, 35, 100) - top)) // h + 1 if h else None

def layout(script, s=1100):
    ITSEEN[0] = False; FNRM[0] = FNRM[1] = False
    if EMPTYSCR and re.fullmatch(r'\s*\{\s*\}\s*[_^]\s*\{\s*', script):
        # 21차(모의고사 1식 맞춤, 코드 미확인): 빈 밑 + 닫히지 않은 첨자 '{}_{' = w 1, 위끝 −s/2, 높이 MulDiv(s,80,100) (9pt 720·bl 107)
        return dict(w=1, top=-half(s), bot=-half(s) + md(s, 80, 100), glyphs=[], nodes=[])
    p_ = P(tok(script)); st_ = {'rm': False}
    top_stops = ('}', '#') if EQROWS else ('}',)
    nodes = parse_row(p_, st_, stops=top_stops)
    if STRAY_BRACE and p_.peek() == '}' and not st_.get('abort'):
        # 16차: 한글은 식 전체를 "EQALIGN { … }" 로 감싸서 읽음(HwpPlugin 0x100998e0). 짝 없는 첫 } 는 그 EQALIGN 을 닫을 뿐이고
        # 뒤는 바깥 목록에 이어 붙음. 두 번째 짝 없는 } (또는 바깥의 #) 에서 읽기가 끝나고 나머지는 버림.
        p_.nxt(); nodes += parse_row(p_, st_, stops=top_stops)
    if EQROWS and p_.peek() == '#' and not st_.get('abort'):
        # 16차: 바깥 # = 감싼 EQALIGN 의 줄 나눔 (a # b: w 525, h 2360, baseLine 41)
        rows = [nodes]
        while p_.peek() == '#':
            p_.nxt(); rows.append(parse_row(p_, st_, stops=('}', '#')))
        nodes = [{'k': 'eqrows', 'rows': rows}]
    if GRPSPLIT and not (len(nodes) == 1 and nodes[0]['k'] == 'eqrows'):
        # 19차(job-0040 u {eqalign{a # b}} v: w 1125, 2줄 = [u a] / [b v], 줄마다 x 0 에서 시작):
        # 바깥 목록의 { } 안 eqalign 은 식 전체 줄을 나눔 → 앞 노드 + 첫 줄 / … / 끝 줄 + 뒤 노드 로 다시 짬
        def _split(ns):
            for i, q_ in enumerate(ns):
                if q_['k'] == 'grp' and not q_.get('hide'):
                    for j, r_ in enumerate(q_['row']):
                        if r_['k'] == 'eqrows' and len(r_['rows']) > 1:
                            rows = r_['rows']; a = q_['row'][:j]; b = q_['row'][j + 1:]
                            return [ns[:i] + a + rows[0]] + rows[1:-1] + [rows[-1] + b + ns[i + 1:]]
                    r2 = _split(q_['row'])
                    if r2: return [ns[:i] + r2[0]] + r2[1:-1] + [r2[-1] + ns[i + 1:]]
            return None
        sp = _split(nodes)
        if sp: nodes = [{'k': 'eqrows', 'rows': sp}]
    def _mark(ns):
        for q_ in ns:
            if q_['k'] == 'eqrows': q_['top'] = True
            elif q_['k'] == 'grp': _mark(q_['row'])      # 바깥 목록의 { } 안 eqalign 도 바깥 줄 나눔으로 취급
    _mark(nodes)
    annotate(nodes)
    LAST[0] = s
    w, t, b = m_row(nodes, s)
    if EMPTY_EQ:
        if t is None: t, b = -half(s), -half(s) + s      # 14차: 보이는 것이 없는 식(rm, it 만)은 높이 s
        w = max(w, 1)                                    # 14차: 폭 0 인 식은 1 (pile{it#it}, rm → 1)
    out = []
    d_row(nodes, s, 0, 0, out)
    return dict(w=w, top=t, bot=b, glyphs=out, nodes=nodes)

if __name__ == '__main__':
    r = layout(sys.argv[1]); print(r['w'], r['top'], r['bot'])
    for g in r['glyphs']: print(hex(g[0]), g[1:])
