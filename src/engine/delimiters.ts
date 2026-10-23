import { getCellHeightHU, getGlyphWidthHU } from './metrics';
import { mulDiv, isTaTop } from './muldiv';
import { FormattedGlyph } from './types';

// HwpPlugin 0x100a1500/0x100a13d0/0x100a16a0, captured REA reference.
interface Delimiter { type: number; top: number; bot: number; ext: number; mid: number; single: number; threshold: number }
const PARTS: Record<string, number[]> = {
  '(': [1, 0xe07c, 0xe07e, 0, 0xe07d, 0xe044], ')': [9, 0xe07f, 0xe081, 0, 0xe080, 0xe045],
  '{': [2, 0xe078, 0xe07a, 0xe07b, 0xe079, 0xe04b], '}': [10, 0xe082, 0xe084, 0xe07b, 0xe083, 0xe04c],
  '[': [3, 0xe100, 0xe103, 0, 0xe101, 0xe049], ']': [11, 0xe102, 0xe104, 0, 0xe105, 0xe04a],
  '|': [5, 0, 0, 0, 0xe101, 0xe101], '<': [4, 0, 0, 0, 0x2329, 0x2329], '>': [12, 0, 0, 0, 0x232a, 0x232a],
};

export function measureDelimiter(char: string, size: number, height: number): [number, Delimiter | undefined] {
  if (char === '.') return [0, undefined];
  const parts = PARTS[char];
  if (!parts) {
    const code = char.charCodeAt(0);
    return [Math.max(getGlyphWidthHU(code, size), Math.floor(height / 4)),
      { type: 99, top: 0, bot: 0, ext: 0, mid: code, single: code, threshold: Infinity }];
  }
  const [type, top, bot, ext, mid, single] = parts;
  let width = getGlyphWidthHU(mid, size);
  if ([4, 12].includes(type)) width = Math.max(Math.floor(width * 2 / 3), Math.floor(height / 4));
  const multiple = [1, 9, 2, 10].includes(type) ? 3 : [3, 11].includes(type) ? 2 : 1;
  return [width, { type, top, bot, ext, mid, single, threshold: multiple * getCellHeightHU(size) }];
}

export function placeDelimiter(d: Delimiter | undefined, size: number, x: number, y: number, height: number, out: FormattedGlyph[]): void {
  if (!d) return;
  const push = (code: number, xx: number, yy: number, fontSize: number) => {
    // Non TA_TOP glyphs need the font ascent added to their baseline by the renderer too.
    out.push({ code, x: xx, y: yy, size: fontSize, kind: isTaTop(code) ? 't' : 'top' });
  };
  const cell = getCellHeightHU(size);
  if (height < d.threshold) {
    const shift = [3, 11].includes(d.type) ? Math.floor(size / 8) : [4, 12].includes(d.type) ? -Math.floor(size / 8) : 0;
    push(d.single, x + shift, y, height);
  } else if ([1, 9].includes(d.type)) {
    const rest = height - 2 * cell;
    push(d.top, x, y, size); push(d.bot, x, y + cell + rest, size);
    const overlap = mulDiv(cell, 5, 100);
    let amount = Math.trunc((2 * overlap + rest) / 0.098), offset = 0;
    while (amount > 0) {
      push(d.mid, x, y + cell - overlap + offset, Math.min(amount, 50000));
      amount -= 50000; offset += 0x1324;
    }
  } else if ([2, 10].includes(d.type)) {
    const margin = mulDiv(size, 5, 100), half = Math.trunc((height - d.threshold) / 2);
    const shift = Math.trunc(half * 0.26 / 0.48), extension = margin * 2 - Math.trunc(half / -0.48);
    push(d.top, x, y, size); push(d.mid, x, y + half + cell, size); push(d.bot, x, y + 2 * half + 2 * cell, size);
    push(d.ext, x, y + cell - shift - margin, extension);
    push(d.ext, x, y - shift - margin + 2 * cell + half, extension);
  } else if ([3, 11].includes(d.type)) {
    const rest = height - d.threshold;
    push(d.top, x, y, size); push(d.bot, x, y + cell + rest, size);
    push(d.mid, x, y + cell - mulDiv(cell, 80, 100), mulDiv(cell, 5, 100) + mulDiv(cell, 80, 100) + rest);
  } else {
    push(d.single, x - ([4, 12].includes(d.type) ? Math.floor(size / 8) : 0), y, height);
  }
}
