import { FormattedGlyph, LayoutBox } from './types';
import { mulDiv, devPx, calcBaseline, isTaTop, getSpacingT } from './muldiv';
import {
  METRICS,
  KWTAB,
  PUA_ASCII_MAP,
  ASCII_CLS,
  getGlyphWidthHU,
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

export function tokenize(s: string): string[] {
  // Replace tabs and newlines with spaces
  const clean = s.replace(/[\t\r\n]/g, ' ');
  const tokens: string[] = [];
  let i = 0;
  const n = clean.length;

  while (i < n) {
    const c = clean[i];
    if (c === ' ') {
      i++;
      continue;
    }
    if (c === "'") {
      let count = 1;
      while (i + count < n && clean[i + count] === "'") {
        count++;
      }
      tokens.push("'".repeat(count));
      i += count;
      continue;
    }
    if (DELIMS.has(c)) {
      tokens.push(c);
      i++;
      continue;
    }
    if (/[0-9]/.test(c)) {
      let j = i;
      while (j < n && /[0-9]/.test(clean[j])) {
        j++;
      }
      tokens.push(clean.slice(i, j));
      i = j;
      continue;
    }

    // Try finding known keyword prefix (case insensitive or exact from kwtab)
    let foundKw: string | null = null;
    const remaining = clean.slice(i);

    // Check kwtab keys
    for (const kw in KWTAB) {
      if (remaining.startsWith(kw)) {
        if (!foundKw || kw.length > foundKw.length) {
          foundKw = kw;
        }
      }
    }

    // Check common control words
    const controls = ['over', 'sqrt', 'root', 'of', 'left', 'right', 'matrix', 'pmatrix', 'bmatrix',
      'dmatrix', 'cases', 'pile', 'lpile', 'rpile', 'sum', 'prod', 'int', 'dint', 'tint', 'oint',
      'lim', 'Lim', 'bold', 'bar', 'vec', 'hat', 'dot', 'ddot', 'acute', 'grave', 'tilde', 'arch',
      'dyad', 'under', 'sin', 'cos', 'tan', 'log', 'ln', 'exp', 'det', 'max', 'min', 'rm', 'it'];

    for (const ctrl of controls) {
      if (remaining.toLowerCase().startsWith(ctrl.toLowerCase())) {
        if (!foundKw || ctrl.length > foundKw.length) {
          foundKw = remaining.slice(0, ctrl.length);
        }
      }
    }

    if (foundKw && (foundKw.length > 1 || !/[a-zA-Z]/.test(foundKw))) {
      tokens.push(foundKw);
      i += foundKw.length;
      continue;
    }

    if (/[a-zA-Z]/.test(c)) {
      let j = i;
      while (j < n && /[a-zA-Z]/.test(clean[j])) {
        j++;
      }
      tokens.push(clean.slice(i, j));
      i = j;
      continue;
    }

    // Single other character
    tokens.push(c);
    i++;
  }

  return tokens;
}

export class Parser {
  private tokens: string[];
  private idx: number = 0;

  private st: { rm: boolean } = { rm: false };

  constructor(tokens: string[]) {
    this.tokens = tokens;
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
    return this.parseRow();
  }

  parseRow(stops: string[] = ['}']): AstNode[] {
    const nodes: AstNode[] = [];

    while (this.peek() !== null && !stops.includes(this.peek()!)) {
      const t = this.peek()!;
      const tl = t.toLowerCase();

      this.next();

      if (t === '{') {
        const row = this.parseRow(['}']);
        if (this.peek() === '}') this.next();
        nodes.push({ k: 'grp', row });
      } else if (t === '^' || t === '_') {
        const arg = this.parseAtom(t);
        if (nodes.length > 0 && nodes[nodes.length - 1].k === 'scr') {
          const lastScr = nodes[nodes.length - 1];
          if (!lastScr[t]) {
            lastScr[t] = arg;
          } else {
            nodes.push({ k: 'scr', [t]: arg });
          }
        } else {
          nodes.push({ k: 'scr', [t]: arg });
        }
      } else if (tl === 'over') {
        const num = nodes.length > 0 ? [nodes.pop()!] : [];
        const den = this.parseAtom();
        nodes.push({ k: 'frac', num, den });
      } else if (tl === 'sqrt') {
        const body = this.parseAtom();
        nodes.push({ k: 'sqrt', idx: undefined, body });
      } else if (tl === 'root') {
        const idx = this.parseAtom();
        if (this.peek()?.toLowerCase() === 'of') {
          this.next();
        }
        const body = this.parseAtom();
        nodes.push({ k: 'sqrt', idx, body });
      } else if (['bar', 'vec', 'hat', 'dot', 'ddot', 'acute', 'grave', 'tilde', 'arch', 'dyad', 'under'].includes(tl)) {
        const body = this.parseAtom();
        nodes.push({ k: 'deco', d: tl, body });
      } else if (tl === 'left') {
        const dl = this.next();
        const body = this.parseRow(['right', 'RIGHT', '}']);
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
        nodes.push({ k: 'sty' });
      } else if (['it', 'IT'].includes(t)) {
        this.st.rm = false;
        nodes.push({ k: 'sty' });
      } else if (['sin', 'cos', 'tan', 'log', 'ln', 'exp', 'det', 'max', 'min', 'sec', 'csc', 'cot', 'sinh', 'cosh', 'tanh', 'arcsin', 'arccos', 'arctan', 'gcd', 'lcm'].includes(tl)) {
        const prev = nodes.length > 0 ? nodes[nodes.length - 1] : undefined;
        if (prev && prev.k === 'ch' && ((prev.code && prev.code >= 0xe000 && prev.code <= 0xe0fe) || (prev.code && prev.code < 0x80))) {
          nodes.push({ k: 'sp', t: '`' });
        }
        for (const c of t) {
          nodes.push({ k: 'ch', code: c.charCodeAt(0), cls: 1, rm: true });
        }
      } else if (['sum', 'prod'].includes(tl)) {
        nodes.push({ k: 'sum', m: tl, lo: [], hi: [], body: [] });
      } else if (['int', 'dint', 'tint', 'oint'].includes(tl)) {
        nodes.push({ k: 'int', m: tl, lo: [], hi: [], body: [] });
      } else if (tl === 'lim' || t === 'Lim') {
        nodes.push({ k: 'lim', lo: [], hi: [], body: [] });
      } else if (t === '`' || t === '~') {
        nodes.push({ k: 'sp', t });
      } else if (t.startsWith("'")) {
        nodes.push({ k: 'prime', n: t.length });
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
        nodes.push({ k: 'ch', code: t.charCodeAt(0), cls: ASCII_CLS[t] || 1, rm: false });
      }
    }

    return nodes;
  }

  parseAtom(kind?: string): AstNode[] {
    const t = this.peek();
    if (!t) return [];
    if (t === '{') {
      this.next();
      const row = this.parseRow(['}']);
      if (this.peek() === '}') this.next();
      return [{ k: 'grp', row }];
    }
    const single = this.next();
    if (KWTAB[single]) {
      const [code, cls] = KWTAB[single];
      return [{ k: 'ch', code, cls, rm: false }];
    }
    if (/^[A-Za-z0-9]$/.test(single)) {
      const pua = PUA_ASCII_MAP[single];
      return [{ k: 'ch', code: pua || single.charCodeAt(0), cls: 1, rm: false }];
    }
    return [{ k: 'ch', code: single.charCodeAt(0), cls: ASCII_CLS[single] || 1, rm: false }];
  }
}

// ---------------- Layout Engine (Measuring & Formatting) ----------------

function getNodeCls(n: AstNode | null | undefined): number {
  if (!n) return 1;
  if (n.k === 'grp' && n.row && n.row.length > 0) return getNodeCls(n.row[0]);
  if (n.k === 'ch' && n.cls !== undefined) return n.cls;
  return 1;
}

export function layoutRow(nodes: AstNode[], s: number): [number, number, number] {
  let w = 0;
  let top: number | null = null;
  let bot: number | null = null;

  for (let i = 0; i < nodes.length; i++) {
    const cur = nodes[i];
    const prev = i > 0 ? nodes[i - 1] : undefined;
    const next = i + 1 < nodes.length ? nodes[i + 1] : undefined;

    cur._pv = prev;
    cur._nx = next;

    const [nw, nt, nb] = measureNode(cur, s, next, prev);
    cur._w = nw;
    cur._t = nt;
    cur._b = nb;

    w += nw;
    if (nt !== null) {
      top = top === null ? nt : Math.min(top, nt);
      bot = bot === null ? nb : Math.max(bot, nb);
    }
  }

  return [w, top ?? -Math.floor(s / 2), bot ?? Math.floor(s / 2)];
}

export function measureNode(n: AstNode, s: number, next?: AstNode, prev?: AstNode): [number, number, number] {
  const k = n.k;

  if (k === 'ch') {
    const c = getCellHeightHU(s);
    const code = n.code || 0x20;
    const baseW = getGlyphWidthHU(code, s);
    const clsA = n.cls || 1;
    const clsB = getNodeCls(next);
    const tVal = getSpacingT(clsA, clsB);
    const gap = tVal ? mulDiv(s, tVal, 100) * 7 : 0;
    const half = Math.floor(c / 2);
    return [baseW + gap, -half, -half + c];
  }

  if (k === 'sp') {
    const w = n.t === '~' ? Math.floor(s / 2) : Math.floor(s / 8);
    const half = Math.floor(s / 2);
    return [w, -half, -half + s];
  }

  if (k === 'prime') {
    const c = getCellHeightHU(s);
    const count = n.n || 1;
    const w = count * mulDiv(s, 30, 100);
    const half = Math.floor(c / 2);
    return [w, -half, -half + c];
  }

  if (k === 'grp') {
    return layoutRow(n.row || [], s);
  }

  if (k === 'frac') {
    const [nw, nt, nb] = layoutRow(n.num || [], s);
    const [dw, dt, db] = layoutRow(n.den || [], s);
    const g = mulDiv(s, 30, 100);
    const W = Math.max(nw, dw, Math.floor(s / 2)) + mulDiv(s, 50, 100);
    const top = -Math.floor(g / 2) - (nb - nt);
    const bot = top + g + (nb - nt) + (db - dt);
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
    let subW = 0, subT = 0, subB = 0;
    let supW = 0, supT = 0, supB = 0;

    let bt = prev?._t !== undefined ? prev._t : -Math.floor(s / 2);
    let bb = prev?._b !== undefined ? prev._b : Math.floor(s / 2);

    let osub = bb - mulDiv(s, 20, 100);
    let osup = bt + mulDiv(s, 25, 100);

    if (n._) {
      const [w, t, b] = layoutRow(n._, ss);
      subW = w; subT = t; subB = b;
      if (subT + osub < 0) osub -= subT + osub;
    }
    if (n['^']) {
      const [w, t, b] = layoutRow(n['^'], ss);
      supW = w; supT = t; supB = b;
      if (supB + osup > 0) osup -= supB + osup;
    }

    n._osub = osub;
    n._osup = osup;

    let w = Math.max(subW, supW);
    const isUcit = prev && prev.k === 'ch' && prev.code &&
      ((prev.code >= 0xe000 && prev.code <= 0xe019) || (prev.code >= 0x41 && prev.code <= 0x5a));
    if (n['^'] && isUcit) {
      w += mulDiv(s, 15, 100);
    }
    if (next) {
      const clsNext = getNodeCls(next);
      const tVal = getSpacingT(1, clsNext);
      if (tVal) {
        w += mulDiv(s, tVal, 100) * 10;
      }
    }

    const top = n['^'] ? supT + osup : bt;
    const bot = n._ ? subB + osub : bb;
    return [w, top, bot];
  }

  if (k === 'lr') {
    const [cw, ct, cb] = layoutRow(n.body || [], s);
    const h = cb - ct;
    const wl = getGlyphWidthHU(0xe044, s);
    const wr = getGlyphWidthHU(0xe045, s);
    n._wl = wl;
    n._wr = wr;
    n._cw = cw;
    n._h = h;
    n._ct = ct;
    return [wl + cw + wr, ct, cb];
  }

  if (k === 'mat') {
    const rows = n.rows || [];
    const colCount = Math.max(...rows.map(r => r.length), 1);
    const colW: number[] = new Array(colCount).fill(0);
    const rowH: number[] = new Array(rows.length).fill(0);

    for (let i = 0; i < rows.length; i++) {
      for (let j = 0; j < rows[i].length; j++) {
        const [w, t, b] = layoutRow(rows[i][j], s);
        colW[j] = Math.max(colW[j], w);
        rowH[i] = Math.max(rowH[i], b - t);
      }
    }

    const gc = mulDiv(s, 20, 100);
    const gr = mulDiv(s, 20, 100);
    const totalW = colW.reduce((acc, v) => acc + v, 0) + (colCount - 1) * gc;
    const totalH = rowH.reduce((acc, v) => acc + v, 0) + (rows.length - 1) * gr;

    n._colw = colW;
    n._rowh = rowH;
    n._gc = gc;
    n._gr = gr;
    n._H = totalH;

    const half = Math.floor(totalH / 2);
    return [totalW, -half, half];
  }

  const c = getCellHeightHU(s);
  const half = Math.floor(c / 2);
  return [Math.floor(s / 2), -half, half];
}

export function placeGlyphs(nodes: AstNode[], s: number, x: number, ay: number, out: FormattedGlyph[]): void {
  for (const n of nodes) {
    const k = n.k;
    const W = n._w || 0;

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
    } else if (k === 'grp') {
      placeGlyphs(n.row || [], s, x, ay, out);
      x += W;
    } else if (k === 'frac') {
      const num = n.num || [];
      const den = n.den || [];
      const [nw, nt, nb] = layoutRow(num, s);
      const [dw, dt, db] = layoutRow(den, s);
      const g = mulDiv(s, 30, 100);

      // Numerator
      placeGlyphs(num, s, x + Math.floor(W / 2) - Math.floor(nw / 2), ay - Math.floor(g / 2) - nb, out);
      // Denominator
      placeGlyphs(den, s, x + Math.floor(W / 2) - Math.floor(dw / 2), ay + Math.floor(g / 2) - dt, out);

      // Fraction bar: E06D (horizontal bar)
      out.push({
        code: 0xe06d,
        x,
        y: ay,
        kind: 't',
        size: s,
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
        placeGlyphs(n.idx, mulDiv(s, 50, 100), x, top - it, out);
      }

      // Radical body
      placeGlyphs(n.body || [], s, x + (n._off || 0), ay, out);

      // Radical overbar: E06D
      out.push({
        code: 0xe06d,
        x: x + (n._off || 0) - mulDiv(s, 2, 100),
        y: top + (n._e || 0) - mulDiv(s, 18, 100),
        kind: 't',
        size: s,
      });

      x += W;
    } else if (k === 'scr') {
      const ss = mulDiv(s, 68, 100);
      if (n._) {
        placeGlyphs(n._, ss, x, ay + (n._osub || 0), out);
      }
      if (n['^']) {
        placeGlyphs(n['^'], ss, x, ay + (n._osup || 0), out);
      }
      x += W;
    } else if (k === 'lr') {
      const top = ay + (n._ct || 0);
      // Left bracket
      out.push({
        code: 0xe044,
        x,
        y: top,
        kind: 't',
        size: s,
      });
      // Content
      placeGlyphs(n.body || [], s, x + (n._wl || 0), ay, out);
      // Right bracket
      out.push({
        code: 0xe045,
        x: x + (n._wl || 0) + (n._cw || 0),
        y: top,
        kind: 't',
        size: s,
      });
      x += W;
    } else if (k === 'mat') {
      const rows = n.rows || [];
      const colW = n._colw || [];
      const rowH = n._rowh || [];
      const gc = n._gc || 0;
      const gr = n._gr || 0;
      let ytop = ay - Math.floor((n._H || 0) / 2);

      for (let i = 0; i < rows.length; i++) {
        let xc = x;
        for (let j = 0; j < colW.length; j++) {
          if (j < rows[i].length) {
            const [cw, ct, cb] = layoutRow(rows[i][j], s);
            const ch = cb - ct;
            const cty = ytop + Math.floor((rowH[i] - ch) / 2);
            placeGlyphs(rows[i][j], s, xc + Math.floor((colW[j] - cw) / 2), cty - ct, out);
          }
          xc += colW[j] + gc;
        }
        ytop += rowH[i] + gr;
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
export function layoutEquation(script: string, s: number = 1100): LayoutBox {
  const tokens = tokenize(script);
  const parser = new Parser(tokens);
  const ast = parser.parse(s);

  const [w, top, bot] = layoutRow(ast, s);
  const glyphs: FormattedGlyph[] = [];
  placeGlyphs(ast, s, 0, 0, glyphs);

  const h = bot - top;
  const baseLine = calcBaseline(top, bot, s);

  return {
    w,
    top,
    bot,
    h,
    baseLine,
    glyphs,
  };
}
