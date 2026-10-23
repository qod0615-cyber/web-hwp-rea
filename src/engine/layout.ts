import { FormattedGlyph, LayoutBox, PlacedNode } from './types';
import { measureDelimiter, placeDelimiter } from './delimiters';
import keywordTables from './kwtables9.json';
import { mulDiv, devPx, calcBaseline, isTaTop, getSpacingT } from './muldiv';
import {
  METRICS,
  KWTAB,
  PUA_ASCII_MAP,
  ASCII_CLS,
  getGlyphWidthHU,
  getGlyphAdvance,
  getMeasuredGlyphWidthHU,
  getCellHeightHU,
} from './metrics';

// Common Delimiters in Hangul Equation syntax
const DELIMS = new Set(' ^_#{}&"~`'.split(''));

export interface AstNode {
  k: string;
  code?: number;
  cls?: number;
  rm?: boolean;
  bold?: boolean;
  src?: string;
  t?: string; // sp character: '~' or '`'
  n?: number; // prime count
  row?: AstNode[];
  num?: AstNode[];
  den?: AstNode[];
  idx?: AstNode[];
  body?: AstNode[];
  lo?: AstNode[];
  hi?: AstNode[];
  m?: string;
  rows?: AstNode[][][];
  l?: string;
  r?: string;
  d?: string;
  _w?: number;
  _t?: number;
  _b?: number;
  _pv?: AstNode;
  _nx?: AstNode;
  _osub?: number;
  _osup?: number;
  _rw?: number;
  _p?: number;
  _R?: number;
  _e?: number;
  _off?: number;
  _iw?: number;
  _cw?: number;
  _g?: number;
  _m?: number;
  _wl?: number;
  _wr?: number;
  _dl?: any;
  _dr?: any;
  _h?: number;
  _ct?: number;
  _H?: number;
  _colw?: number[];
  _rowh?: number[];
  _gc?: number;
  _gr?: number;
  _gH?: number;
  _S2?: number;
  _lx?: number;
  _hx?: number;
  _bx?: number;
  _lay?: number;
  _hay?: number;
  _bw?: number;
  [key: string]: any;
}

const TABLE_A = new Map((keywordTables.A as [string, number, number][]).map(row => [row[0], row[1]]));
const TABLE_B = new Map((keywordTables.B as [string, number, number][]).map(row => [row[0], row[1]]));
const SYMBOL_CLASS = new Map(Object.values(KWTAB).map(([code, cls]) => [code, cls]));
// Direct U+25CB is a binary operator in native HWP, including inside BOX.
// Independently observed in job0058: a○b, box{``○``}, and ○~○.
SYMBOL_CLASS.set(0x25cb, 3);
const FUNCTIONS = new Set((keywordTables.A as [string, number, number][]).filter(row => row[1] === 6).map(row => row[0]));
const INTEGRALS: Record<string, number> = { int: 0xe05b, dint: 0xe073, tint: 0xe074, oint: 0xe075, odint: 0xe076, otint: 0xe077 };
const SUMS: Record<string, number> = { sum: 0xe067, prod: 0xe068, coprod: 0xe069, inter: 0xe06a, union: 0xe06b, bigcap: 0xe06a, bigcup: 0xe06b };
const MATRIX_DELIMITERS: Record<string, [string, string]> = { pmatrix: ['(', ')'], bmatrix: ['[', ']'], dmatrix: ['|', '|'], cases: ['{', '.'] };
function longestKeyword(table: Map<string, number>, source: string): string | undefined {
  let best: string | undefined;
  for (const key of table.keys()) if (source.startsWith(key) && (!best || key.length > best.length)) best = key;
  return best;
}
function nativeKeyword(token: string): [number, number] | undefined {
  const code = TABLE_A.get(token) ?? TABLE_B.get(/^[A-Z]+$/.test(token) || !/^[a-zA-Z]+$/.test(token) ? token : token.toUpperCase());
  if (code === undefined || code < 0x20 || code === 0x48 || code === 0x49) return undefined;
  return [code, SYMBOL_CLASS.get(code) ?? KWTAB[token]?.[1] ?? 1];
}

function attachScript(nodes: AstNode[], kind: string, argument: AstNode[]): void {
  const last = nodes[nodes.length - 1];
  if (last?.k === 'scr' && (last._nest || last[kind])) {
    const inner = last._nest || last[last._last || kind];
    attachScript(inner, kind, argument);
    last._nest = inner;
  } else if (last?.k === 'scr') {
    last[kind] = argument; last._last = kind;
  } else nodes.push({ k: 'scr', [kind]: argument, _last: kind });
}

// HwpPlugin's case-sensitive table-A / uppercase table-B longest-prefix lexer.
export function tokenize(source: string): string[] {
  const text = source.replace(/[\t\r\n]/g, ' ');
  const tokens: string[] = [];
  let index = 0;
  while (index < text.length) {
    const char = text[index];
    if (char === "'") { const count = text[index + 1] === "'" ? 2 : 1; tokens.push("'".repeat(count)); index += count; continue; }
    if (char === ' ') { index++; continue; }
    if (DELIMS.has(char)) { tokens.push(char); index++; continue; }
    if (/[0-9]/.test(char)) { let end = index + 1; while (end < text.length && /[0-9]/.test(text[end])) end++; tokens.push(text.slice(index, end)); index = end; continue; }
    const next = text[index + 1];
    if (!next || DELIMS.has(next)) { tokens.push(char); index++; continue; }
    let keyword = longestKeyword(TABLE_A, text.slice(index));
    if (!keyword && /[A-Z]/.test(char) && /[A-Z]/.test(next)) keyword = longestKeyword(TABLE_B, text.slice(index));
    else if (!keyword && /[a-zA-Z]/.test(char) && /[a-z]/.test(next)) {
      let end = index + 1;
      while (end < text.length && end - index < 10 && /[a-z]/.test(text[end])) end++;
      const upper = text.slice(index, end).toUpperCase();
      let match = longestKeyword(TABLE_B, upper);
      if (match && [6, 7].includes(TABLE_B.get(match)!) && match !== upper) match = undefined;
      if (match) keyword = text.slice(index, index + match.length);
    }
    if (keyword) { tokens.push(keyword); index += keyword.length; continue; }
    let end = index + 1;
    if (/[a-zA-Z]/.test(char)) while (end < text.length && /[a-zA-Z]/.test(text[end])) end++;
    tokens.push(text.slice(index, end)); index = end;
  }
  return tokens;
}

export class Parser {
  private tokens: string[];
  private idx: number = 0;

  private spans: { start: number; end: number }[];

  private st = { rm: false, rmc: false };

  constructor(tokens: string[], source?: string) {
    this.tokens = tokens;
    let position = 0;
    this.spans = tokens.map(token => {
      const found = source?.indexOf(token, position) ?? position;
      const start = found < 0 ? position : found;
      position = start + token.length;
      return { start, end: position };
    });
  }

  private sourceSpan(node: AstNode, firstToken: number, lastToken = this.idx - 1): AstNode {
    node.sourceStart = this.spans[firstToken]?.start ?? 0;
    node.sourceEnd = this.spans[lastToken]?.end ?? node.sourceStart;
    return node;
  }

  peek(k: number = 0): string | null {
    const pos = this.idx + k;
    return pos < this.tokens.length ? this.tokens[pos] : null;
  }

  next(): string {
    const t = this.tokens[this.idx];
    this.idx++;
    return t;
  }

  parse(s: number = 1100): AstNode[] {
    const nodes = this.parseRow();
    // The first unmatched close ends HWP's implicit outer EQALIGN wrapper.
    // Remaining tokens form the following outer row; a second close ends it.
    if (this.peek() === '}') { this.next(); nodes.push(...this.parseRow()); }
    return nodes;
  }

  parseRow(stops: string[] = ['}'], one = false): AstNode[] {
    const nodes: AstNode[] = [];

    while (this.peek() !== null && !stops.includes(this.peek()!) && !(one && nodes.length)) {
      const firstToken = this.idx;
      const previousNodes = new Set(nodes);
      const t = this.peek()!;
      const tl = t.toLowerCase();

      const operator = nodes[nodes.length - 1];
      if (operator?.open && ['int', 'lim'].includes(operator.k) && t === '{') {
        operator.body = this.parseAtom();
        operator.open = false;
        operator.sourceEnd = this.spans[this.idx - 1]?.end ?? operator.sourceEnd;
        continue;
      }

      this.next();

      if (t === '{') {
        const romanContext = this.st.rmc;
        const row = this.parseRow(['}']);
        if (this.peek() === '}') this.next();
        this.st.rmc = romanContext;
        nodes.push({ k: 'grp', row });
      } else if (t === '^' || t === '_') {
        const braced = this.peek() === '{';
        const arg = this.parseAtom(t);
        if (operator?.open && ['int', 'sum', 'lim'].includes(operator.k)) {
          operator[t === '_' ? 'lo' : 'hi'] = arg;
          operator.sourceEnd = this.spans[this.idx - 1]?.end ?? operator.sourceEnd;
          continue;
        }
        attachScript(nodes, t, arg);
        const script = nodes[nodes.length - 1];
        script.sourceEnd = this.spans[this.idx - 1]?.end ?? script.sourceEnd;
        if (!braced && arg.length === 1 && arg[0].k === 'sty') {
          nodes.push({ ...arg[0] });
        }
      } else if (tl === 'over') {
        if (operator && ['lim', 'int'].includes(operator.k) && operator.body?.length) {
          operator.body = [{ k: 'frac', num: operator.body, den: this.parseAtom(), sourceStart: operator.body[0].sourceStart,
            sourceEnd: this.spans[this.idx - 1]?.end }];
          operator.sourceEnd = this.spans[this.idx - 1]?.end;
          continue;
        }
        const num = nodes.length > 0 ? [nodes.pop()!] : [];
        const den = this.parseAtom();
        nodes.push({ k: 'frac', num, den });
      } else if (t === '&') {
        nodes.push({ k: 'amp' });
      } else if (tl === 'sqrt') {
        const body = this.parseAtom();
        nodes.push({ k: 'sqrt', idx: undefined, body });
      } else if (tl === 'root') {
        const idx = this.parseAtom();
        if (this.peek()?.toLowerCase() === 'of') {
          this.next();
          nodes.push({ k: 'sqrt', idx, body: this.parseAtom() });
        } else {
          nodes.push({ k: 'sqrt', body: idx });
        }
      } else if (tl === 'box') {
        nodes.push({ k: 'box', body: this.parseAtom() });
      } else if (tl === 'rel' || tl === 'buildrel') {
        const symbol = this.peek() && !['{', '}'].includes(this.peek()!) ? this.next() : null;
        const code = symbol ? (nativeKeyword(symbol)?.[0] ?? symbol.charCodeAt(0)) : 0x21d4;
        const args: AstNode[][] = [];
        for (let i = 0; i < (tl === 'rel' ? 2 : 1); i++) {
          if (this.peek() === '{') args.push(this.parseAtom());
          else { args.push([]); if (this.peek() !== null) this.next(); }
        }
        nodes.push({ k: 'rel', code, hi: args[0], lo: args[1] || [] });
      } else if (tl === 'overbrace' || tl === 'underbrace') {
        const first = this.peek() === '{' ? this.parseAtom() : [];
        const second = this.peek() === '{' ? this.parseAtom() : [];
        nodes.push({ k: 'brace', ov: tl === 'overbrace', body: tl === 'overbrace' ? first : second,
          lab: tl === 'overbrace' ? second : first });
      } else if (tl === 'phantom') {
        nodes.push({ k: 'grp', row: this.parseAtom(), hide: true });
      } else if (['bar', 'vec', 'hat', 'dot', 'ddot', 'acute', 'grave', 'tilde', 'arch', 'dyad', 'under', 'breve', 'check'].includes(tl)) {
        const body = this.parseAtom();
        nodes.push({ k: 'deco', d: tl, body });
      } else if (tl === 'left') {
        const dl = this.next();
        const body = this.parseRow(['right', 'RIGHT', '}']);
        if (this.peek() === '}') {
          let depth = 0, hasRight = false;
          for (let i = this.idx + 1; i < this.tokens.length; i++) {
            const token = this.tokens[i];
            if (token === '{') depth++;
            else if (token === '}' && --depth < 0) break;
            else if (token.toLowerCase() === 'right' && depth === 0) { hasRight = true; break; }
            else if (token.toLowerCase() === 'left') break;
          }
          if (hasRight) { this.next(); body.push(...this.parseRow(['right', 'RIGHT', '}'])); }
        }
        let dr = '.';
        if (this.peek()?.toLowerCase() === 'right') {
          this.next();
          dr = this.next() || '.';
        }
        nodes.push({ k: 'lr', l: dl, r: dr, body });
      } else if (['matrix', 'pmatrix', 'bmatrix', 'dmatrix', 'cases', 'pile', 'lpile', 'rpile'].includes(tl)) {
        if (this.peek() === '{') {
          this.next();
          const rows: AstNode[][][] = [[[]]];
          while (this.peek() !== null && this.peek() !== '}') {
            if (this.peek() === '&') {
              this.next();
              rows[rows.length - 1].push([]);
              continue;
            }
            if (this.peek() === '#') {
              this.next();
              rows.push([[]]);
              continue;
            }
            const cellRow = this.parseRow(['}', '&', '#']);
            rows[rows.length - 1][rows[rows.length - 1].length - 1].push(...cellRow);
          }
          if (this.peek() === '}') this.next();
          nodes.push({ k: 'mat', m: tl, rows });
        }
      } else if (['rm', 'RM'].includes(t)) {
        this.st.rm = true;
        this.st.rmc = true;
        nodes.push({ k: 'sty' });
      } else if (['it', 'IT'].includes(t)) {
        this.st.rm = false;
        this.st.rmc = false;
        nodes.push({ k: 'sty' });
      } else if (FUNCTIONS.has(t)) {
        const prev = nodes.length > 0 ? nodes[nodes.length - 1] : undefined;
        const italic = prev?.k === 'ch' && !prev.rm && prev.code! < 0xe000 &&
          !(prev.code! >= 0x41 && prev.code! <= 0x7a) && !this.st.rm;
        let before: AstNode | undefined = nodes[nodes.length - 2];
        while (before?.k === 'grp') before = before.row?.[before.row.length - 1];
        const romanGap = prev?.k === 'ch' && this.st.rmc && /^[a-zA-Z]+$/.test(prev.src || '') &&
          prev.src !== prev.src?.toUpperCase() && before && !['ch', 'sp', 'sty', 'prime'].includes(before.k);
        const letterGap = prev?.k === 'ch' && ((prev.code! >= 0xe000 && prev.code! <= 0xe019) ||
          (prev.code! >= 0xe0e5 && prev.code! <= 0xe0fe) || (prev.code! < 0x80 && /[A-Za-z]/.test(String.fromCharCode(prev.code!))));
        if (romanGap || letterGap) {
          nodes.push({ k: 'sp', t: '`' });
        }
        for (const c of t) {
          nodes.push({ k: 'ch', code: italic ? PUA_ASCII_MAP[c] : c.charCodeAt(0), cls: 1, rm: !italic });
        }
      } else if (SUMS[tl]) {
        nodes.push({ k: 'sum', code: SUMS[tl], m: tl, lo: [], hi: [], body: [], open: true });
      } else if (INTEGRALS[tl]) {
        nodes.push({ k: 'int', code: INTEGRALS[tl], m: tl, lo: [], hi: [], body: [], open: true });
      } else if (tl === 'lim' || t === 'Lim') {
        nodes.push({ k: 'lim', cap: t === 'Lim', lo: [], hi: [], body: [], open: true });
      } else if (t === '`' || t === '~') {
        nodes.push({ k: 'sp', t });
      } else if (t.startsWith("'") || tl === 'prime') {
        nodes.push({ k: 'prime', n: tl === 'prime' ? 1 : t.length });
      } else if (t.length > 1 && nativeKeyword(t)) {
        const [code, cls] = nativeKeyword(t)!;
        nodes.push({ k: 'ch', code, cls, rm: false, src: t });
      } else if (KWTAB[t]) {
        const [code, cls] = KWTAB[t];
        nodes.push({ k: 'ch', code, cls, rm: false, src: t });
      } else if (KWTAB[tl]) {
        const [code, cls] = KWTAB[tl];
        nodes.push({ k: 'ch', code, cls, rm: false, src: t });
      } else if (/^[A-Za-z]+$/.test(t)) {
        for (const c of t) {
          if (this.st.rm) {
            nodes.push({ k: 'ch', code: c.charCodeAt(0), cls: 1, rm: true });
          } else {
            const pua = PUA_ASCII_MAP[c];
            nodes.push({ k: 'ch', code: pua || c.charCodeAt(0), cls: 1, rm: false });
          }
        }
      } else if (/^[0-9]+$/.test(t)) {
        for (const c of t) {
          const pua = PUA_ASCII_MAP[c];
          nodes.push({ k: 'ch', code: pua || c.charCodeAt(0), cls: 1, rm: false });
        }
      } else if (PUA_ASCII_MAP[t]) {
        nodes.push({ k: 'ch', code: PUA_ASCII_MAP[t], cls: ASCII_CLS[t] || 1, rm: false });
      } else {
        const code = t.charCodeAt(0);
        nodes.push({ k: 'ch', code, cls: ASCII_CLS[t] || SYMBOL_CLASS.get(code) || 1, rm: false });
      }
      const added = nodes.filter(node => !previousNodes.has(node));
      added.forEach((node, index) => {
        if (node.sourceStart !== undefined) return;
        this.sourceSpan(node, firstToken);
        if (node.k === 'ch' && added.length === t.length && t.length > 1) {
          node.sourceStart = (this.spans[firstToken]?.start ?? 0) + index;
          node.sourceEnd = node.sourceStart + 1;
        }
        if (node.k === 'frac' && node.num?.length) node.sourceStart = node.num[0].sourceStart ?? node.sourceStart;
      });
    }

    return nodes;
  }

  parseAtom(kind?: string): AstNode[] {
    const firstToken = this.idx;
    const t = this.peek();
    if (!t) return [];
    if (t === '{') {
      const romanContext = this.st.rmc;
      this.next();
      const row = this.parseRow(['}']);
      if (this.peek() === '}') this.next();
      this.st.rmc = romanContext;
      return [this.sourceSpan({ k: 'grp', row }, firstToken)];
    }
    return this.parseRow([], true);
  }
}

// ---------------- Layout Engine (Measuring & Formatting) ----------------
let lastMeasuredFontSize = 1100;

function getNodeCls(n: AstNode | null | undefined): number {
  if (!n) return 1;
  if (n.k === 'grp' && n.row && n.row.length > 0) return getNodeCls(n.row[0]);
  if (n.k === 'ch' && n.cls !== undefined) return n.cls;
  return 1;
}

function hasBox(node: AstNode): boolean {
  return !['sty', 'amp'].includes(node.k) && (node.k !== 'grp' || (node.row || []).some(hasBox));
}
function hasStyle(nodes: AstNode[]): boolean {
  return nodes.some(node => node.k === 'sty' || (node.k === 'grp' && hasStyle(node.row || [])));
}

function xHeightOnly(nodes: AstNode[]): boolean {
  const flat = nodes.flatMap(node => node.k === 'grp' ? flattenGroup(node.row || []) : [node]);
  return flat.every(node => {
    if (node.k === 'sty') return true;
    if (node.k !== 'ch') return false;
    let code = node.code!;
    if (node.rm && code >= 0x61 && code <= 0x7a) code = code - 0x61 + 0xe0e5;
    return [0xe0e5, 0xe0e7, 0xe0e9, 0xe0eb, 0xe0ed, 0xe0ee, 0xe01a, 0xe01c, 0xe020, 0xe053].includes(code) ||
      (code >= 0xe0f1 && code <= 0xe0fe) || (code >= 0xe026 && code <= 0xe033) ||
      (code >= 0xe09d && code <= 0xe0a3) || (code >= 0xe0a5 && code <= 0xe0b4);
  });
}
function flattenGroup(nodes: AstNode[]): AstNode[] {
  return nodes.flatMap(node => node.k === 'grp' ? flattenGroup(node.row || []) : [node]);
}

export function layoutRow(nodes: AstNode[], s: number, after?: AstNode): [number, number, number] {
  let w = 0;
  let top: number | null = null;
  let bot: number | null = null;

  for (let i = 0; i < nodes.length; i++) {
    const cur = nodes[i];
    const prev = i > 0 ? nodes[i - 1] : undefined;
    const next = i + 1 < nodes.length ? nodes[i + 1] : after;

    cur._pv = prev;
    cur._nx = next;

    const [nw, nt, nb] = measureNode(cur, s, next, prev);
    cur._w = nw;
    cur._t = hasBox(cur) ? nt : undefined;
    cur._b = hasBox(cur) ? nb : undefined;

    w += nw;
    if (hasBox(cur)) {
      top = top === null ? nt : Math.min(top, nt);
      bot = bot === null ? nb : Math.max(bot, nb);
    }
  }

  return [w, top ?? -Math.floor(s / 2), bot ?? Math.floor(s / 2)];
}

export function measureNode(n: AstNode, s: number, next?: AstNode, prev?: AstNode): [number, number, number] {
  const k = n.k;
  if (['ch', 'sp', 'prime'].includes(k)) lastMeasuredFontSize = s;

  if (k === 'sty') return [0, 0, 0];
  if (k === 'amp') return [mulDiv(s, 20, 100), 0, 0];

  if (k === 'placeholder') {
    const height = getCellHeightHU(s);
    return [Math.floor(s / 2), -Math.floor(height / 2), Math.ceil(height / 2)];
  }

  if (k === 'ch') {
    const c = getCellHeightHU(s);
    const code = n.code || 0x20;
    const baseW = getGlyphWidthHU(code, s);
    const clsA = n.cls || 1;
    const clsB = getNodeCls(next);
    const tVal = next ? getSpacingT(clsA, clsB) : 0;
    const gap = tVal ? mulDiv(s, tVal, 100) * 7 : 0;
    const half = Math.floor(c / 2);
    return [baseW + gap, -half, -half + c];
  }

  if (k === 'sp') {
    const w = n.t === '~' ? Math.floor(s / 2) : Math.floor(s / 8);
    const half = Math.floor(s / 2);
    return [w + (next ? mulDiv(s, getSpacingT(1, getNodeCls(next)), 100) * 7 : 0), -half, -half + s];
  }

  if (k === 'prime') {
    const c = getCellHeightHU(s);
    const count = n.n || 1;
    const hp = 2 * mulDiv(Math.floor(s / 2), 96, 7200);
    const single = getMeasuredGlyphWidthHU(0x2032, s) ?? Math.round(300 * hp / 1024) * 75;
    const double = getMeasuredGlyphWidthHU(0x2033, s) ?? Math.round(430 * hp / 1024) * 75;
    const w = Math.floor(count / 2) * double + (count % 2) * single;
    const half = Math.floor(c / 2);
    return [w + (next ? mulDiv(s, getSpacingT(1, getNodeCls(next)), 100) * 7 : 0), -half, -half + c];
  }

  if (k === 'grp') {
    return layoutRow(n.row || [], s, next);
  }

  if (k === 'frac') {
    const [nw, nt, nb] = layoutRow(n.num || [], s);
    const [dw, dt, db] = layoutRow(n.den || [], s);
    const g = mulDiv(s, 30, 100);
    const W = Math.max(nw, dw, Math.floor(s / 2)) + mulDiv(s, 50, 100);
    const top = -Math.floor(g / 2) - (nb - nt);
    const bot = top + g + (nb - nt) + (db - dt);
    lastMeasuredFontSize = s;
    return [W, top, bot];
  }

  if (k === 'sqrt') {
    let iw = 0, ih = 0;
    if (n.idx) {
      const [w, t, b] = layoutRow(n.idx, mulDiv(s, 50, 100));
      iw = w;
      ih = b - t;
    }
    const [cw, ct, cb] = layoutRow(n.body || [], s);
    lastMeasuredFontSize = s;
    const rw = getGlyphWidthHU(0xe05c, s);
    const rh = getCellHeightHU(s);
    const p = Math.max(100, Math.floor(((mulDiv(s, 10, 100) + (cb - ct)) * 100) / rh));
    const R = mulDiv(rh, p, 100);
    const eRaw = ih - mulDiv(R, 52, 100);
    const e = Math.max(eRaw, mulDiv(s, 5, 100));
    const off = rw + Math.max(0, iw - Math.floor(rw / 2));
    n._rw = rw;
    n._p = p;
    n._R = R;
    n._e = e;
    n._off = off;
    n._iw = iw;
    n._cw = cw;
    const top = ct - mulDiv(s, 10, 100) - e;
    return [mulDiv(s, 17, 100) + off + cw, top, top + R + e];
  }

  if (k === 'scr') {
    const ss = mulDiv(s, 68, 100);
    let bt = prev?._t, bb = prev?._b;
    if (prev?.k === 'sty') { bt = -Math.floor(s / 2); bb = -Math.floor(s / 2) + s; }
    lastMeasuredFontSize = s;
    const measureScript = (nodes?: AstNode[]): [number, number, number] | undefined => {
      if (!nodes) return undefined;
      const result = layoutRow(nodes, ss);
      if (nodes.some(hasBox)) return result;
      if (hasStyle(nodes)) return [result[0], -Math.floor(ss / 2), -Math.floor(ss / 2) + ss];
      return undefined;
    };
    const sub = measureScript(n._), sup = measureScript(n['^']);
    const font = lastMeasuredFontSize;
    if (bt === undefined || bb === undefined) {
      bt = -Math.floor(font / 2); bb = Math.floor(font / 2);
      if (prev?.k === 'grp' && !prev.row?.length && prev._pv?._t !== undefined) {
        bt = prev._pv._t; bb = prev._pv._b!;
      }
    }
    let osub = bb - mulDiv(font, 20, 100);
    let osup = bt + mulDiv(font, 25, 100);
    if (sub && sub[1] + osub < 0) osub -= sub[1] + osub;
    if (sup && sup[2] + osup > 0) osup -= sup[2] + osup;
    n._osub = osub; n._osup = osup;
    let width = Math.max(sub?.[0] || 0, sup?.[0] || 0);
    const spacing = next ? getSpacingT(1, getNodeCls(next)) : 0;
    const upperLatin = prev?.k === 'ch' && prev.code && ((prev.code >= 0xe000 && prev.code <= 0xe019) || (prev.code >= 0x41 && prev.code <= 0x5a));
    if (spacing) width += mulDiv(s, spacing, 100) * 10;
    else if (n['^'] && upperLatin) width += mulDiv(s, 15, 100);
    return [width, sup ? sup[1] + osup : bt, sub ? sub[2] + osub : bb];
  }

  if (k === 'deco') {
    lastMeasuredFontSize = s;
    const [cw, ct, cb] = layoutRow(n.body || [], s);
    const g = getGlyphWidthHU(0xe06d, s);
    const m = mulDiv(getCellHeightHU(s), 20, 100);
    n._g = g; n._m = m; n._cw = cw;
    const code: Record<string, number> = { bar: 0xe06d, vec: 0xe06e, hat: 0xe063, dot: 0xe05f, ddot: 0xe060, acute: 0xe05d, grave: 0xe05e, check: 0xe064, tilde: 0xe066, arch: 0xe065, dyad: 0xe06d, under: 0xe06d };
    let width: number;
    if (n.d === 'vec') width = Math.max(cw + mulDiv(g, 20, 100), g);
    else if (['bar', 'dyad', 'under'].includes(n.d || '')) width = Math.max(g, cw) + mulDiv(g, 20, 100);
    else if (n.d === 'breve') return [cw, ct, cb];
    else { n._g = getGlyphWidthHU(code[n.d || 'bar'], s); width = Math.max(n._g, cw); }
    if (n.d === 'under') return [width, ct, cb + m];
    if (n.d === 'arch') return [width, ct - m, cb + Math.floor(m / 3)];
    return [width, ct - m, cb];
  }

  if (k === 'lr') {
    const [cw, ct, cb] = layoutRow(n.body || [], s);
    const h = cb - ct;
    const [wl, dl] = measureDelimiter(n.l || '.', s, h);
    const [wr, dr] = measureDelimiter(n.r || '.', s, h);
    n._dl = dl; n._dr = dr;
    lastMeasuredFontSize = s;
    n._wl = wl;
    n._wr = wr;
    n._cw = cw;
    n._h = h;
    n._ct = ct;
    return [wl + cw + wr, ct, cb];
  }

  if (k === 'box') {
    const [cw, ct, cb] = layoutRow(n.body || [], s);
    const g = getGlyphWidthHU(0xe06d, s), height = getCellHeightHU(s);
    const width = Math.max(g, cw) + mulDiv(g, 20, 100), top = ct - mulDiv(g, 15, 100);
    n._cw = cw;
    lastMeasuredFontSize = s;
    return [width, top, top + cb - ct + mulDiv(height, 20, 100)];
  }

  if (k === 'rel') {
    const measure = (nodes: AstNode[]): [number, number, number] => nodes.some(hasBox) ? layoutRow(nodes, s) : [Math.floor(s / 2), -Math.floor(s / 2), -Math.floor(s / 2) + s];
    const [hw, ht, hb] = measure(n.hi || []), [lw, lt, lb] = measure(n.lo || []);
    const width = Math.max(hw, lw) + mulDiv(s, 50, 100), cell = getCellHeightHU(s);
    const arrow = [0x2190, 0x2192, 0x2194, 0x21d0, 0x21d2, 0x21d4, 0x21c4].includes(n.code!);
    let ah = arrow ? mulDiv(cell, 30, 100) + mulDiv(cell, 5, 100) : cell;
    if (n.code === 0x21c4) ah *= 2;
    Object.assign(n, { _W: width, _ah: ah });
    lastMeasuredFontSize = s;
    const top = -Math.floor(ah / 2) - (hb - ht);
    return [width, top, top + hb - ht + ah + lb - lt];
  }

  if (k === 'brace') {
    const g = getGlyphWidthHU(0xe106, s), ss = mulDiv(s, 68, 100);
    const [bw, bt, bb] = n.body?.some(hasBox) ? layoutRow(n.body, s) : [Math.floor(s / 2), -Math.floor(s / 2), -Math.floor(s / 2) + s];
    const [lw, lt, lb] = n.lab?.some(hasBox) ? layoutRow(n.lab, ss) : [Math.floor(ss / 2), -Math.floor(ss / 2), -Math.floor(ss / 2) + ss];
    const adjustment = xHeightOnly(n.ov ? n.body || [] : n.lab || []) ? mulDiv(s, n.ov ? 15 : 5, 100) : 0;
    const th = mulDiv(getCellHeightHU(s), 35, 100) - adjustment, width = Math.max(bw, lw, 3 * g);
    Object.assign(n, { _W: width, _g: g, _th: th, _bw: bw, _lw: lw, _bt: bt, _bb: bb, _lt: lt, _lb: lb, _ss: ss });
    lastMeasuredFontSize = s;
    return n.ov ? [width, bt - th - (lb - lt), bb] : [width, bt, bb + th + lb - lt];
  }

  if (k === 'mat') {
    const rows = n.rows || [];
    const colCount = Math.max(...rows.map(r => r.length), 1);
    const colW: number[] = new Array(colCount).fill(0);
    const rowH: number[] = new Array(rows.length).fill(0);

    for (let i = 0; i < rows.length; i++) {
      for (let j = 0; j < rows[i].length; j++) {
        const [w, t, b] = rows[i][j].length ? layoutRow(rows[i][j], s) : [Math.floor(s / 2), -Math.floor(s / 2), Math.ceil(s / 2)];
        colW[j] = Math.max(colW[j], w);
        rowH[i] = Math.max(rowH[i], b - t);
      }
    }

    const gc = mulDiv(s, 20, 100);
    const gr = mulDiv(s, 15, 100);
    const totalH = rowH.reduce((acc, v) => acc + v, 0) + (rows.length - 1) * gr;
    const [left, right] = MATRIX_DELIMITERS[n.m || ''] || ['.', '.'];
    const [wl, dl] = measureDelimiter(left, s, totalH);
    const [wr, dr] = measureDelimiter(right, s, totalH);
    n._wl = wl; n._wr = wr; n._dl = dl; n._dr = dr;
    const totalW = wl + colW.reduce((acc, v) => acc + v, 0) + (colCount - 1) * gc + wr;

    n._colw = colW;
    n._rowh = rowH;
    n._gc = gc;
    n._gr = gr;
    n._H = totalH;
    lastMeasuredFontSize = s;

    const half = Math.floor(totalH / 2);
    return [totalW, -half, totalH - half];
  }

  if (k === 'int') {
    const S2 = mulDiv(s, 200, 100), ss = mulDiv(s, 68, 100);
    const gW = getGlyphWidthHU(n.code!, S2), gH = getCellHeightHU(S2);
    const [lw, lt, lb] = n.lo?.length ? layoutRow(n.lo, ss) : [0, 0, 0];
    const [hw, ht, hb] = n.hi?.length ? layoutRow(n.hi, ss) : [0, 0, 0];
    const lx = gW - mulDiv(s, 50, 100), hx = gW + mulDiv(s, 5, 100);
    const lay = Math.floor(gH / 2), hay = Math.floor(ss / 6) - Math.floor(gH / 2);
    const bx = Math.max(lx + lw, hx + hw) + mulDiv(s, 1, 100);
    const [bw, bt, bb] = n.body?.length ? layoutRow(n.body, s) : [0, Infinity, -Infinity];
    Object.assign(n, { _gW: gW, _gH: gH, _lx: lx, _hx: hx, _lay: lay, _hay: hay, _bx: bx, _S2: S2 });
    lastMeasuredFontSize = s;
    return [bx + bw, Math.min(lt + lay, ht + hay, bt), Math.max(lb + lay, hb + hay, bb)];
  }

  if (k === 'sum') {
    const S2 = mulDiv(s, 180, 100), ss = mulDiv(s, 68, 100);
    const gW = getGlyphWidthHU(n.code!, S2), G = mulDiv(getCellHeightHU(S2), 75, 100);
    const [lw, lt, lb] = n.lo?.length ? layoutRow(n.lo, ss) : [0, 0, 0];
    const [hw, ht, hb] = n.hi?.length ? layoutRow(n.hi, ss) : [0, 0, 0];
    const width = Math.max(gW, lw, hw), top = -Math.floor(G / 2) - (hb - ht);
    Object.assign(n, { _gW: gW, _G: G, _S2: S2, _lw: lw, _hw: hw });
    lastMeasuredFontSize = s;
    return [width, top, top + G + (hb - ht) + (lb - lt)];
  }

  if (k === 'lim') {
    const S2 = mulDiv(s, 120, 100), L = getCellHeightHU(S2);
    const word = [n.cap ? 0x4c : 0x6c, 0x69, 0x6d];
    const ww = word.reduce((w, code) => w + getGlyphWidthHU(code, S2), 0);
    const [lw, lt, lb] = n.lo?.length ? layoutRow(n.lo, mulDiv(s, 68, 100)) : [0, 0, 0];
    const width = Math.max(ww, lw);
    const [bw, bt, bb] = n.body?.length ? layoutRow(n.body, s) : [0, Infinity, -Infinity];
    Object.assign(n, { _L: L, _ww: ww, _lw: lw, _W: width, _word: word, _S2: S2, _bw: bw });
    lastMeasuredFontSize = s;
    return [width + bw, Math.min(bt, -Math.floor(L / 2)), Math.max(Math.floor(L / 2) + lb - lt, bb)];
  }

  const c = getCellHeightHU(s);
  const half = Math.floor(c / 2);
  return [Math.floor(s / 2), -half, half];
}

export function placeGlyphs(nodes: AstNode[], s: number, x: number, ay: number, out: FormattedGlyph[], placed: PlacedNode[] = []): void {
  for (const n of nodes) {
    const k = n.k;
    const W = n._w || 0;
    placed.push({ kind: k, sourceStart: n.sourceStart ?? 0, sourceEnd: n.sourceEnd ?? 0,
      x, y: ay + (n._t || 0), width: W, height: Math.max(1, (n._b || 0) - (n._t || 0)) });

    if (k === 'ch') {
      const code = n.code || 0x20;
      const kd = isTaTop(code) ? 't' : 'b';
      const c = getCellHeightHU(s);
      const y = kd === 't' ? ay - Math.floor(c / 2) : ay + Math.floor(mulDiv(s, 35, 100));
      out.push({
        code,
        x,
        y,
        kind: kd,
        size: s,
        char: String.fromCharCode(code),
      });
      x += W;
    } else if (k === 'sp') {
      x += W;
    } else if (k === 'prime') {
      const count = n.n || 1;
      let xx = x;
      for (let i = 0; i < Math.floor(count / 2); i++) {
        out.push({ code: 0x2033, x: xx, y: ay + mulDiv(s, 35, 100), kind: 'b', size: s });
        xx += getMeasuredGlyphWidthHU(0x2033, s) ?? getGlyphWidthHU(0x2033, s);
      }
      if (count % 2) out.push({ code: 0x2032, x: xx, y: ay + mulDiv(s, 35, 100), kind: 'b', size: s });
      x += W;
    } else if (k === 'grp') {
      if (!n.hide) placeGlyphs(n.row || [], s, x, ay, out, placed);
      x += W;
    } else if (k === 'frac') {
      const num = n.num || [];
      const den = n.den || [];
      const [nw, nt, nb] = layoutRow(num, s);
      const [dw, dt, db] = layoutRow(den, s);
      const g = mulDiv(s, 30, 100);

      // Numerator
      placeGlyphs(num, s, x + Math.floor(W / 2) - Math.floor(nw / 2), ay - Math.floor(g / 2) - nb, out, placed);
      // Denominator
      placeGlyphs(den, s, x + Math.floor(W / 2) - Math.floor(dw / 2), ay + Math.floor(g / 2) - dt, out, placed);

      // Fraction bar: E06D (horizontal bar)
      out.push({
        code: 0xe06d,
        x,
        y: ay,
        kind: 't',
        size: s,
        ruleWidth: W,
      });

      x += W;
    } else if (k === 'sqrt') {
      const top = ay + (n._t || 0);
      const fh = mulDiv(s, n._p || 100, 100);

      // Radical symbol
      out.push({
        code: 0xe05c,
        x: x + Math.max(0, (n._iw || 0) - Math.floor((n._rw || 0) / 2)),
        y: top + (n._e || 0),
        kind: 't',
        size: fh,
      });

      // Index if root
      if (n.idx) {
        const [iw, it] = layoutRow(n.idx, mulDiv(s, 50, 100));
        placeGlyphs(n.idx, mulDiv(s, 50, 100), x, top - it, out, placed);
      }

      // Radical body
      placeGlyphs(n.body || [], s, x + (n._off || 0), ay, out, placed);

      // Radical overbar: E06D
      out.push({
        code: 0xe06d,
        x: x + (n._off || 0) - mulDiv(s, 2, 100),
        y: top + (n._e || 0) - mulDiv(s, 18, 100),
        kind: 't',
        size: s,
        ruleWidth: W - (n._off || 0) + mulDiv(s, 2, 100),
      });

      x += W;
    } else if (k === 'scr') {
      const ss = mulDiv(s, 68, 100);
      if (n._) {
        placeGlyphs(n._, ss, x, ay + (n._osub || 0), out, placed);
      }
      if (n['^']) {
        placeGlyphs(n['^'], ss, x, ay + (n._osup || 0), out, placed);
      }
      x += W;
    } else if (k === 'deco') {
      const body = n.body || []; const cw = n._cw || 0; const margin = n._m || 0;
      placeGlyphs(body, s, x + Math.floor(W / 2) - Math.floor(cw / 2), ay, out, placed);
      const top = ay + (n._t || 0);
      const flatten = (nodes: AstNode[]): AstNode[] => nodes.flatMap(node => node.k === 'grp' ? flatten(node.row || []) : [node]);
      const letters = flatten(body).filter(node => node.k !== 'sty');
      const xheight = letters.every(node => node.k === 'ch' && /[acegijm-z.]/.test(String.fromCharCode(node.code! >= 0xe0e5 && node.code! <= 0xe0fe ? node.code! - 0xe0e5 + 97 : node.code!)));
      const offset = xheight ? 0 : Math.floor(margin / 2);
      const codes: Record<string, number> = { vec: 0xe06e, dot: 0xe05f, ddot: 0xe060, acute: 0xe05d, grave: 0xe05e, hat: 0xe063, check: 0xe064, tilde: 0xe066, arch: 0xe065 };
      if (n.d === 'vec') {
        const arrow = mulDiv(n._g || 0, 55, 100); const dx = Math.floor(s / 40);
        if (cw >= arrow) out.push({ code: 0xe06d, x: x + dx, y: top - margin, kind: 't', size: s, ruleWidth: cw - arrow });
        out.push({ code: 0xe06e, x: x + dx + Math.max(0, cw - arrow), y: top - margin, kind: 't', size: s });
      } else if (n.d === 'bar' || n.d === 'under' || n.d === 'dyad') {
        const dx = Math.floor(s / 20);
        const yy = n.d === 'under' ? ay + (n._b || 0) - margin - mulDiv(margin, 80, 100) : top - offset;
        out.push({ code: 0xe06d, x: x + dx, y: yy, kind: 't', size: s, ruleWidth: cw });
      } else if (n.d !== 'breve') {
        const correction = n.d === 'dot' || n.d === 'ddot' ? -Math.trunc(s / 10) : n.d === 'acute' ? Math.trunc(s / 20) : n.d === 'grave' ? Math.trunc(s / 40) : Math.floor(s / 20);
        out.push({ code: codes[n.d || 'hat'] || 0xe063, x: x + Math.floor(W / 2) - Math.floor((n._g || 0) / 2) + correction, y: top - offset, kind: 't', size: s });
      }
      x += W;
    } else if (k === 'box') {
      placeGlyphs(n.body || [], s, x + Math.floor(W / 2) - Math.floor(n._cw! / 2), ay, out, placed);
      x += W;
    } else if (k === 'rel') {
      const ah = n._ah!;
      if (n.hi?.length) {
        const [hw, , hb] = layoutRow(n.hi, s);
        placeGlyphs(n.hi, s, x + Math.floor(W / 2) - Math.floor(hw / 2), ay - Math.floor(ah / 2) - hb, out, placed);
      }
      if (n.lo?.length) {
        const [lw, lt] = layoutRow(n.lo, s);
        placeGlyphs(n.lo, s, x + Math.floor(W / 2) - Math.floor(lw / 2), ay - Math.floor(ah / 2) + ah - lt, out, placed);
      }
      const arrowKinds: Record<number, number> = { 0x2192: 0, 0x2190: 1, 0x2194: 2, 0x21d2: 3, 0x21d0: 4, 0x21d4: 5, 0x21c4: 6 };
      const kind = arrowKinds[n.code!];
      if (kind === undefined) {
        out.push({ code: n.code!, x: x + Math.floor(W / 2) - Math.floor(getGlyphWidthHU(n.code!, s) / 2),
          y: ay - Math.floor(ah / 2) + mulDiv(s, 85, 100), kind: 'b', size: s });
      } else {
        const double = [3, 4, 5].includes(kind), shaft = double ? 0xe070 : 0xe059;
        const left = double ? 0xe06f : 0xe058, right = double ? 0xe071 : 0xe05a;
        const cell = getCellHeightHU(s), shaftWidth = getGlyphWidthHU(shaft, s), headWidth = mulDiv(getGlyphWidthHU(right, s), 80, 100);
        const minimum = [2, 5].includes(kind) ? mulDiv(headWidth, 150, 100) : headWidth;
        const length = Math.max(W, minimum) + mulDiv(cell, 5, 100);
        const x0 = x + Math.floor(W / 2) - Math.floor(length / 2) + mulDiv(cell, 3, 100);
        const y0 = ay - Math.floor(cell / 2) - mulDiv(cell, 5, 100);
        const xl = x0 - (shaftWidth - headWidth), xs = x0 + headWidth - Math.floor(headWidth / 2), xr = x0 - headWidth + W;
        const push = (code: number, xx: number, yy = y0) => out.push({ code, x: xx, y: yy, kind: 't', size: s });
        if ([0, 3].includes(kind)) { if (W >= minimum) push(shaft, x0); push(right, W >= minimum ? xr : x0); }
        else if ([1, 4].includes(kind)) { if (W >= minimum) push(shaft, xs); push(left, xl); }
        else if ([2, 5].includes(kind)) {
          if (W >= minimum) push(shaft, xs);
          push(left, xl); push(right, W >= minimum ? xr : x0 + Math.floor(headWidth / 2));
        } else {
          const delta = Math.floor(mulDiv(cell, 30, 100) / 2);
          if (W >= minimum) { push(shaft, xs, y0 + delta); push(shaft, x0, y0 - delta); }
          push(left, xl, y0 + delta); push(right, W >= minimum ? xr : x0, y0 - delta);
        }
      }
      x += W;
    } else if (k === 'brace') {
      const g = n._g!, ss = n._ss!, th = n._th!;
      const size = out[out.length - 1]?.size ?? (n.ov ? s : ss);
      const e3 = mulDiv(s, 3, 100), cell = getCellHeightHU(s);
      const upperHeight = n.ov ? n._lb - n._lt : n._bb - n._bt;
      const yt = ay + n._t! + upperHeight - mulDiv(cell, 30, 100), bw = n._bw!;
      const x0 = x + (3 * g < W ? Math.floor((W - bw) / 2) : 0);
      const extension = mulDiv(s, 20, 100) + bw - 3 * g;
      const parts = n.ov ? [0xe106, 0xe107, 0xe109, 0xe108] : [0xe10a, 0xe10b, 0xe10d, 0xe10c];
      const push = (code: number, xx: number) => out.push({ code, x: xx, y: yt + mulDiv(size, 85, 100), kind: 'b', size });
      if (extension < 0) { push(parts[0], x0); push(parts[1], x0 - e3 + g); push(parts[2], x0 + 2 * g - 2 * e3); }
      else {
        push(parts[3], x0 - e3 + g); push(parts[3], x0 + Math.floor(extension / 2) - 3 * e3 + 2 * g);
        push(parts[0], x0); push(parts[1], x0 + Math.floor(extension / 2) - 2 * e3 + g);
        push(parts[2], x0 + 2 * g - 4 * e3 + extension - 1);
      }
      placeGlyphs(n.body || [], s, x + Math.floor(W / 2) - Math.floor(bw / 2), ay, out, placed);
      if (n.lab?.length) {
        const yy = n.ov ? ay + n._bt - th - n._lb : ay + n._bb + th - n._lt;
        placeGlyphs(n.lab, ss, x + Math.floor(W / 2) - Math.floor(n._lw! / 2), yy, out, placed);
      }
      x += W;
    } else if (k === 'lr') {
      const top = ay + (n._ct || 0);
      placeDelimiter(n._dl, s, x, top, n._h!, out);
      placeGlyphs(n.body || [], s, x + (n._wl || 0), ay, out, placed);
      placeDelimiter(n._dr, s, x + (n._wl || 0) + (n._cw || 0), top, n._h!, out);
      x += W;
    } else if (k === 'mat') {
      const rows = n.rows || [];
      const colW = n._colw || [];
      const rowH = n._rowh || [];
      const gc = n._gc || 0;
      const gr = n._gr || 0;
      let ytop = ay - Math.floor((n._H || 0) / 2);
      placeDelimiter(n._dl, s, x, ytop, n._H!, out);
      placeDelimiter(n._dr, s, x + W - (n._wr || 0), ytop, n._H!, out);

      for (let i = 0; i < rows.length; i++) {
        let xc = x + (n._wl || 0);
        for (let j = 0; j < colW.length; j++) {
          if (j < rows[i].length) {
            const [cw, ct, cb] = layoutRow(rows[i][j], s);
            const ch = cb - ct;
            const cty = ['pile', 'lpile', 'rpile'].includes(n.m!) ? ytop : ytop + Math.floor((rowH[i] - ch) / 2);
            const align = colW[j] - cw;
            const dx = ['cases', 'lpile'].includes(n.m!) ? 0 : n.m === 'rpile' ? align : Math.floor(align / 2);
            placeGlyphs(rows[i][j], s, xc + dx, cty - ct, out, placed);
          }
          xc += colW[j] + gc;
        }
        ytop += rowH[i] + gr;
      }
      x += W;
    } else if (k === 'int') {
      out.push({ code: n.code!, x, y: ay - Math.floor(n._gH! / 2), kind: 't', size: n._S2! });
      const ss = mulDiv(s, 68, 100);
      if (n.lo?.length) placeGlyphs(n.lo, ss, x + n._lx!, ay + n._lay!, out, placed);
      if (n.hi?.length) placeGlyphs(n.hi, ss, x + n._hx!, ay + n._hay!, out, placed);
      if (n.body?.length) placeGlyphs(n.body, s, x + n._bx!, ay, out, placed);
      x += W;
    } else if (k === 'sum') {
      const ss = mulDiv(s, 68, 100), G = n._G!;
      out.push({ code: n.code!, x: x + Math.floor(W / 2) - Math.floor(n._gW! / 2),
        y: ay - Math.floor(G / 2) - mulDiv(G, 10, 100), kind: 't', size: n._S2! });
      if (n.lo?.length) {
        const [lw, lt] = layoutRow(n.lo, ss);
        placeGlyphs(n.lo, ss, x + Math.floor(W / 2) - Math.floor(lw / 2), ay + Math.floor(G / 2) - lt, out, placed);
      }
      if (n.hi?.length) {
        const [hw, , hb] = layoutRow(n.hi, ss);
        placeGlyphs(n.hi, ss, x + Math.floor(W / 2) - Math.floor(hw / 2), ay - Math.floor(G / 2) - hb, out, placed);
      }
      x += W;
    } else if (k === 'lim') {
      const width = n._W!, L = n._L!, size = n._S2!;
      let xx = x + Math.floor(width / 2) - Math.floor(n._ww! / 2);
      const deviceHeight = 2 * mulDiv(Math.floor(size / 2), 1, 12);
      for (const code of n._word as number[]) {
        out.push({ code, x: xx, y: ay - Math.floor(L / 2) + mulDiv(size, 85, 100), kind: 'b', size });
        xx += 12 * Math.floor((getGlyphAdvance(code) ?? 512) * deviceHeight / 1024 + 0.5);
      }
      if (n.body?.length) placeGlyphs(n.body, s, x + width, ay, out, placed);
      if (n.lo?.length) {
        const ss = mulDiv(s, 68, 100), [lw, lt] = layoutRow(n.lo, ss);
        placeGlyphs(n.lo, ss, x + Math.floor(width / 2) - Math.floor(lw / 2), ay + Math.floor(L / 2) - lt, out, placed);
      }
      x += W;
    } else {
      x += W;
    }
  }
}

/**
 * Public high-level layout function:
 * Takes formula script string and baseUnit (s, default 1100 = 11pt)
 * Returns exact LayoutBox (w, top, bot, h, baseLine, glyphs)
 */
export function layoutEquation(script: string, s: number = 1100, options: { editor?: boolean } = {}): LayoutBox {
  lastMeasuredFontSize = s;
  const tokens = tokenize(script);
  const parser = new Parser(tokens, script);
  const ast = parser.parse(s);
  if (options.editor) {
    const visit = (nodes: AstNode[]) => {
      for (const node of nodes) {
        if (node.k === 'grp' && node.row?.length === 0) {
          node.row.push({ k: 'placeholder', sourceStart: (node.sourceStart ?? 0) + 1, sourceEnd: (node.sourceStart ?? 0) + 1 });
        }
        for (const key of ['row', 'num', 'den', 'idx', 'body', 'lo', 'hi', 'lab', '_', '^']) {
          if (Array.isArray(node[key])) visit(node[key]);
        }
        if (node.rows) for (const row of node.rows) for (const cell of row) visit(cell);
      }
    };
    visit(ast);
  }

  const [w, top, bot] = layoutRow(ast, s);
  const glyphs: FormattedGlyph[] = [];
  const nodes: PlacedNode[] = [];
  placeGlyphs(ast, s, 0, 0, glyphs, nodes);

  const h = bot - top;
  const baseLine = calcBaseline(top, bot, s);

  return {
    w,
    top,
    bot,
    h,
    baseLine,
    glyphs,
    nodes,
  };
}
