import hyhwpMetricsRaw from './hyhwpeq_metrics.json';
import kwtabRaw from './kwtab.json';
import { mulDiv } from './muldiv';
import { FontMetrics } from './types';

export const METRICS = hyhwpMetricsRaw as unknown as FontMetrics;
export const KWTAB = kwtabRaw as unknown as Record<string, [number, number]>;

export const PUA_ASCII_MAP: Record<string, number> = {
  A: 0xe000, B: 0xe001, C: 0xe002, D: 0xe003, E: 0xe004, F: 0xe005, G: 0xe006, H: 0xe007,
  I: 0xe008, J: 0xe009, K: 0xe00a, L: 0xe00b, M: 0xe00c, N: 0xe00d, O: 0xe00e, P: 0xe00f,
  Q: 0xe010, R: 0xe011, S: 0xe012, T: 0xe013, U: 0xe014, V: 0xe015, W: 0xe016, X: 0xe017,
  Y: 0xe018, Z: 0xe019,
  a: 0xe0e5, b: 0xe0e6, c: 0xe0e7, d: 0xe0e8, e: 0xe0e9, f: 0xe0ea, g: 0xe0eb, h: 0xe0ec,
  i: 0xe0ed, j: 0xe0ee, k: 0xe0ef, l: 0xe0f0, m: 0xe0f1, n: 0xe0f2, o: 0xe0f3, p: 0xe0f4,
  q: 0xe0f5, r: 0xe0f6, s: 0xe0f7, t: 0xe0f8, u: 0xe0f9, v: 0xe0fa, w: 0xe0fb, x: 0xe0fc,
  y: 0xe0fd, z: 0xe0fe,
  '1': 0xe034, '2': 0xe035, '3': 0xe036, '4': 0xe037, '5': 0xe038, '6': 0xe039, '7': 0xe03a,
  '8': 0xe03b, '9': 0xe03c, '0': 0xe03d,
  '!': 0xe03e, '*': 0xe043, '(': 0xe044, ')': 0xe045, '-': 0xe046, '=': 0xe047, '+': 0xe048,
  '[': 0xe049, ']': 0xe04a, '|': 0xe04d, ';': 0xe04e, ':': 0xe04f, "'": 0xe050, ',': 0xe052,
  '.': 0xe053, '/': 0xe054, '<': 0xe055, '>': 0xe056, '?': 0xe057,
};

export const ASCII_CLS: Record<string, number> = {
  ',': 7, '+': 3, '-': 3, '=': 4, '<': 4, '>': 4, '*': 7,
  '(': 5, ')': 6, '{': 5, '}': 6, '[': 5, ']': 6, ':': 4, '~': 4
};

export function getGlyphAdvance(code: number): number | null {
  const hex = 'U+' + code.toString(16).toUpperCase().padStart(4, '0');
  const glyphName = METRICS.best_cmap_mapping[hex];
  if (!glyphName) return null;
  const g = METRICS.glyphs[glyphName];
  return g ? g.advance_width : null;
}

/**
 * Native glyph advance HU calculation:
 * hp = 2 * mulDiv(fw, 96, 7200)
 * advance_hu = Math.floor(advance * hp / 1024 + 0.5) * 75
 */
export function getGlyphWidthHU(code: number, s: number, fw?: number): number {
  if (fw === undefined) fw = Math.floor(s / 2);
  const hp = 2 * mulDiv(fw, 96, 7200);
  const adv = getGlyphAdvance(code);
  if (adv !== null) {
    return Math.floor((adv * hp) / 1024 + 0.5) * 75;
  }
  // Fallback for non-HYhwpEQ characters
  return Math.floor((512 * hp) / 1024 + 0.5) * 75;
}

export function getCellHeightHU(s: number): number {
  return mulDiv(s, 96, 7200) * 75;
}
