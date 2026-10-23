export type GlyphKind = 'b' | 't' | 'top'; // baseline, TA_TOP, or top-aligned fallback font

export interface FormattedGlyph {
  code: number;
  x: number;      // HU (Hwp Units) from left
  y: number;      // HU from line axis
  kind: GlyphKind;
  size: number;   // font height HU (e.g. 1100 for 11pt)
  char?: string;
  ruleWidth?: number; // horizontal rule length in HU
}

export interface PlacedNode {
  kind: string;
  sourceStart: number;
  sourceEnd: number;
  x: number;
  y: number;
  width: number;
  height: number;
}

export interface LayoutBox {
  w: number;      // HU
  top: number;    // HU (negative is up)
  bot: number;    // HU (positive is down)
  h: number;      // bot - top
  baseLine: number; // percentage (0..100)
  glyphs: FormattedGlyph[];
  nodes?: PlacedNode[];
}

export interface MetricItem {
  advance_width: number;
  bbox?: [number, number, number, number];
}

export interface FontMetrics {
  font_info: { units_per_em: number; ascender: number; descender: number };
  best_cmap_mapping: Record<string, string>;
  glyphs: Record<string, MetricItem>;
}
