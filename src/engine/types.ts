export type GlyphKind = 'b' | 't'; // 'b': baseline, 't': top (TA_TOP)

export interface FormattedGlyph {
  code: number;
  x: number;      // HU (Hwp Units) from left
  y: number;      // HU from line axis
  kind: GlyphKind;
  size: number;   // font height HU (e.g. 1100 for 11pt)
  char?: string;
}

export interface LayoutBox {
  w: number;      // HU
  top: number;    // HU (negative is up)
  bot: number;    // HU (positive is down)
  h: number;      // bot - top
  baseLine: number; // percentage (0..100)
  glyphs: FormattedGlyph[];
}

export interface MetricItem {
  advance_width: number;
  bbox?: [number, number, number, number];
}

export interface FontMetrics {
  best_cmap_mapping: Record<string, string>;
  glyphs: Record<string, MetricItem>;
}
