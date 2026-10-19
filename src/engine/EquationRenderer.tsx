import React, { useMemo } from 'react';
import { layoutEquation } from './layout';
import { FormattedGlyph } from './types';

interface EquationRendererProps {
  script: string;
  fontSize?: number; // pt, default 11
  scale?: number;    // zoom multiplier, default 1.0
  color?: string;
  showCursor?: boolean;
  cursorPos?: number;
}

export const EquationRenderer: React.FC<EquationRendererProps> = ({
  script,
  fontSize = 11,
  scale = 1.0,
  color = '#000000',
  showCursor = false,
}) => {
  // s in HU: 1pt = 100 HU
  const s = Math.round(fontSize * 100);

  const box = useMemo(() => {
    try {
      return layoutEquation(script, s);
    } catch (e) {
      console.error('Equation layout error:', e);
      return null;
    }
  }, [script, s]);

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
          {box.glyphs.map((g: FormattedGlyph, idx: number) => {
            const gx = g.x * pxRatio;
            const gy = g.y * pxRatio;
            const glyphPxSize = (g.size / 100) * (96 / 72) * scale;

            // Handle horizontal rule (fraction bar or radical overbar: 0xe06d)
            if (g.code === 0xe06d) {
              const ruleW = Math.max(12 * pxRatio, 1);
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
                y={gy}
                fill={color}
                fontSize={`${glyphPxSize}px`}
                fontFamily="'HYhwpEQ', 'Batang', serif"
                dominantBaseline={g.kind === 't' ? 'hanging' : 'alphabetic'}
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
