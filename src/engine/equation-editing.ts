import { LayoutBox, PlacedNode } from './types';

export interface EquationSelection { start: number; end: number }
export type EquationCaret = EquationSelection & { x: number; y: number; height: number };
const ATOMIC = new Set(['ch', 'sp', 'prime', 'placeholder']);

export function equationCarets(layout: LayoutBox): EquationCaret[] {
  const points: EquationCaret[] = [];
  for (const node of layout.nodes || []) {
    if (!ATOMIC.has(node.kind)) continue;
    points.push({ start: node.sourceStart, end: node.sourceStart, x: node.x, y: node.y, height: node.height });
    if (node.kind !== 'placeholder') points.push({ start: node.sourceEnd, end: node.sourceEnd, x: node.x + node.width, y: node.y, height: node.height });
  }
  return points;
}

export function caretAtSource(layout: LayoutBox, position: number): EquationCaret | undefined {
  return equationCarets(layout).sort((a, b) => Math.abs(a.start - position) - Math.abs(b.start - position))[0];
}

export function hitEquation(layout: LayoutBox, x: number, y: number): EquationCaret | undefined {
  return equationCarets(layout).sort((a, b) => {
    const distance = (point: EquationCaret) => Math.abs(point.x - x) + Math.abs(point.y + point.height / 2 - y) * 2;
    return distance(a) - distance(b);
  })[0];
}

export function moveEquationCaret(layout: LayoutBox, position: number, direction: 'left' | 'right' | 'up' | 'down'): EquationCaret | undefined {
  const points = equationCarets(layout);
  const current = caretAtSource(layout, position);
  if (!current) return undefined;
  if (direction === 'left' || direction === 'right') {
    const candidates = points.filter(point => direction === 'left' ? point.start < position : point.start > position);
    return candidates.sort((a, b) => Math.abs(a.start - position) - Math.abs(b.start - position))[0];
  }
  const candidates = points.filter(point => direction === 'up' ? point.y < current.y - current.height * .4 : point.y > current.y + current.height * .4);
  return candidates.sort((a, b) => Math.abs(a.x - current.x) - Math.abs(b.x - current.x) || Math.abs(a.y - current.y) - Math.abs(b.y - current.y))[0];
}

export function selectedEquationNodes(layout: LayoutBox, selection: EquationSelection): PlacedNode[] {
  return (layout.nodes || []).filter(node => ATOMIC.has(node.kind) && node.sourceStart < selection.end && node.sourceEnd > selection.start);
}

export function insertEquationTemplate(source: string, selection: EquationSelection, kind: 'fraction' | 'sqrt' | 'superscript' | 'subscript') {
  const selected = source.slice(selection.start, selection.end);
  const templates = {
    fraction: `{${selected || ' '}} over { }`,
    sqrt: `sqrt {${selected || ' '}}`,
    superscript: `${selected}^{ }`,
    subscript: `${selected}_{ }`,
  };
  const template = templates[kind];
  const prefix = source.slice(0, selection.start);
  const spacing = prefix && !/[\s{^_]$/.test(prefix) ? ' ' : '';
  const inserted = spacing + template;
  const start = selection.start + inserted.indexOf('{') + 1;
  return { source: prefix + inserted + source.slice(selection.end), selection: { start, end: start + selected.length } };
}
