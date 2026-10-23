import React, { useMemo } from 'react';
import { layoutEquation } from './layout';
import { FormattedGlyph } from './types';
import { METRICS } from './metrics';

interface EquationRendererProps {
  script: string;
  fontSize?: number; // pt, default 11
  scale?: number;    // zoom multiplier, default 1.0
  color?: string;
  showCursor?: boolean;
  cursorPos?: number;
  editorMode?: boolean;
}

export const EquationRenderer: React.FC<EquationRendererProps> = ({
  script,
  fontSize = 11,
  scale = 1.0,
  color = '#000000',
  showCursor = false,
  editorMode = false,
}) => {
  // s in HU: 1pt = 100 HU
  const s = Math.round(fontSize * 100);

  const box = useMemo(() => {
    try {
      return layoutEquation(script, s, { editor: editorMode });
    } catch (e) {
      console.error('Equation layout error:', e);
      return null;
    }
  }, [script, s, editorMode]);

  if (!box || box.w === 0) {
    return (
      <div style={{ display: 'inline-flex', alignItems: 'center', height: '30px', color: '#999', fontSize: '13px' }}>
        {showCursor && <span className="hwp-cursor" style={{ borderLeft: '1.5px solid #0078d7', height: '18px' }} />}
      </div>
    );
  }

  // 1 HU = 1 / 75 px at 96 DPI (or exact 600 DPI: devPx = floor((HU + 10) / 12))
  // For web screen (96 DPI): 1 pt = 96 / 72 px = 1.333 px. 100 HU = 1.333 px -> 1 HU = 0.01333 px = 1 / 75 px
  const pxRatio = (1 / 75) * scale;
  const svgWidth = Math.max(box.w * pxRatio, 10);
  const svgHeight = Math.max(box.h * pxRatio, 14);

  // In our layout, top is negative and bot is positive, with 0 as line axis.
  // Origin (0, 0) of SVG: top = 0 -> shift Y by -box.top * pxRatio
  const offsetY = -box.top * pxRatio;

  return (
    <div style={{ display: 'inline-block', position: 'relative', verticalAlign: 'middle' }}>
      <svg
        width={svgWidth}
        height={svgHeight}
        viewBox={`0 0 ${svgWidth} ${svgHeight}`}
        style={{ overflow: 'visible', display: 'block' }}
      >
        <g transform={`translate(0, ${offsetY})`}>
          {editorMode && box.nodes?.filter(node => node.kind === 'placeholder').map((node, index) =>
            <rect key={`placeholder-${index}`} x={node.x * pxRatio} y={node.y * pxRatio} width={Math.max(8, node.width * pxRatio - 2)}
              height={Math.max(14, node.height * pxRatio - 1)} stroke={color} strokeWidth={1} fill="none" />)}
          {box.glyphs.map((g: FormattedGlyph, idx: number) => {
            const gx = g.x * pxRatio;
            const gy = g.y * pxRatio;
            const glyphPxSize = (g.size / 100) * (96 / 72) * scale;

            // Handle horizontal rule (fraction bar or radical overbar: 0xe06d)
            if (g.code === 0xe06d) {
              const ruleW = Math.max((g.ruleWidth ?? 12) * pxRatio, 1);
              return (
                <line
                  key={idx}
                  x1={gx}
                  y1={gy}
                  x2={gx + ruleW}
                  y2={gy}
                  stroke={color}
                  strokeWidth={Math.max(1 * scale, 1)}
                  strokeLinecap="round"
                />
              );
            }

            // Normal text character with native HYhwpEQ font
            const charStr = String.fromCharCode(g.code);

            return (
              <text
                key={idx}
                x={gx}
                y={gy + (g.kind !== 'b' ? glyphPxSize * METRICS.font_info.ascender / METRICS.font_info.units_per_em : 0)}
                fill={color}
                fontSize={`${glyphPxSize}px`}
                fontFamily="'HYhwpEQ', 'Batang', serif"
                dominantBaseline="alphabetic"
                style={{
                  userSelect: 'none',
                  textAnchor: 'start',
                }}
              >
                {charStr}
              </text>
            );
          })}
        </g>
      </svg>
    </div>
  );
};
