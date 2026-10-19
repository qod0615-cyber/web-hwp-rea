/**
 * Win32 MulDiv: round((a * b) / c) toward nearest integer, with ties away from zero.
 */
export function mulDiv(a: number, b: number, c: number): number {
  if (c === 0) return 0;
  const prod = a * b;
  const half = Math.floor(Math.abs(c) / 2);
  const v = Math.floor((Math.abs(prod) + half) / Math.abs(c));
  return prod >= 0 ? v : -v;
}

/**
 * 600 DPI device coordinate conversion: floor((HU + 10) / 12)
 */
export function devPx(hu: number): number {
  return Math.floor((hu + 10) / 12);
}

/**
 * Hancom baseline calculation percentage
 */
export function calcBaseline(top: number, bot: number, s: number = 1100): number {
  const h = bot - top;
  if (h <= 0) return 85;
  // baseLine = 100 - floor(100 * (bot - 385) / h)
  const normBot = bot - mulDiv(s, 35, 100);
  return 100 - Math.floor((100 * normBot) / h);
}

/**
 * TA_TOP glyph check: 0xe044 <= c <= 0xe084 or 0xe100 <= c <= 0xe105
 */
export function isTaTop(code: number): boolean {
  return (code >= 0xe044 && code <= 0xe084) || (code >= 0xe100 && code <= 0xe105);
}

/**
 * Spacing matrix T(a, b) from HwpPlugin.dll 0x100bf318 (10x10)
 */
const SPACING_TABLE: number[][] = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 2, 3, 1, 1, 0, 1, 0],
  [0, 1, 3, 2, 3, 0, 0, 0, 1, 0],
  [0, 2, 0, 0, 0, 2, 0, 0, 2, 0],
  [0, 3, 3, 0, 0, 3, 0, 0, 3, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 2, 3, 0, 0, 0, 1, 0],
  [0, 1, 1, 0, 1, 1, 1, 1, 1, 0],
  [0, 1, 1, 2, 3, 1, 0, 1, 1, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
];

export function getSpacingT(a: number, b: number): number {
  if (a >= 0 && a < 10 && b >= 0 && b < 10) {
    return SPACING_TABLE[a][b];
  }
  return 0;
}

/**
 * Spacing gap in HU = mulDiv(s, T, 100) * 7 (or * 10 after script node)
 */
export function getGapHU(prevCls: number, nextCls: number, s: number, isAfterScript: boolean = false): number {
  const tVal = getSpacingT(prevCls, nextCls);
  const mult = isAfterScript ? 10 : 7;
  return mulDiv(s, tVal, 100) * mult;
}
