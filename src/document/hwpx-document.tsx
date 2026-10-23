/** Editable HWPX bridge. Unchanged native paragraphs and opaque objects retain their XML. */
import React from 'react';
import { renderToStaticMarkup } from 'react-dom/server';
import { strToU8 } from 'fflate';
import template from './templates/default.json';
import { EquationRenderer } from '../engine/EquationRenderer';
import { layoutEquation } from '../engine/layout';
import { HwpxArchive, readXmlPart, setXmlPart, writeHwpxArchive } from './hwpx-archive';
import { ParsedHwpx, HWP_NS, children, elements, first, numberAttribute, parseHwpx } from './hwpx-reader';

export interface PageSettings {
  top: number; bottom: number; left: number; right: number; header: number; footer: number; width: number; height: number;
}
export interface DocumentSettings { page: PageSettings; orientation: 'portrait' | 'landscape'; columns: number }
const hp = HWP_NS.paragraph, hh = HWP_NS.head;
const px = (hu: number) => hu / 75;
const mm = (hu: number) => hu * 25.4 / 7200;
const hu = (mm: number) => Math.round(mm * 7200 / 25.4);
const clone = (element: Element) => element.cloneNode(true) as Element;
const serialize = (element: Element) => new XMLSerializer().serializeToString(element);
const attrs = (node: Element, values: Record<string, string | number>) => {
  Object.entries(values).forEach(([key, value]) => node.setAttribute(key, String(value))); return node;
};
function create(xml: Document, name: string, values: Record<string, string | number> = {}, namespace = hp): Element {
  return attrs(xml.createElementNS(namespace, `${namespace === hh ? 'hh' : 'hp'}:${name}`), values);
}

export class HwpxDocument {
  readonly parsed: ParsedHwpx;
  private originals = new Map<string, { xml: Element; html: string }>();
  private opaque = new Map<string, Element>();
  private sequence = 0;
  constructor(bytes?: Uint8Array) {
    this.parsed = parseHwpx(bytes || writeHwpxArchive(Object.fromEntries(Object.entries(template).map(([key, value]) => [key, strToU8(value)]))));
  }
  private remember(xml: Element, html: HTMLElement) {
    const key = `p${this.originals.size}`;
    html.dataset.hwpxParagraph = key;
    this.originals.set(key, { xml, html: html.outerHTML });
    return html;
  }
  settings(): DocumentSettings {
    const sec = this.parsed.sections[0].xml;
    const page = first(sec, 'pagePr'), margin = page && first(page, 'margin');
    return { page: { width: mm(numberAttribute(page, 'width', 59528)), height: mm(numberAttribute(page, 'height', 84186)),
      top: mm(numberAttribute(margin, 'top', 5669)), bottom: mm(numberAttribute(margin, 'bottom', 4252)),
      left: mm(numberAttribute(margin, 'left', 8504)), right: mm(numberAttribute(margin, 'right', 8504)),
      header: mm(numberAttribute(margin, 'header', 4252)), footer: mm(numberAttribute(margin, 'footer', 4252)) },
      orientation: page?.getAttribute('landscape') === 'NARROWLY' ? 'landscape' : 'portrait',
      columns: numberAttribute(first(sec, 'colPr'), 'colCount', 1) };
  }
  render(): DocumentFragment {
    this.originals.clear(); this.opaque.clear();
    const fragment = document.createDocumentFragment();
    this.parsed.sections.forEach((section, index) => {
      const container = document.createElement('div');
      container.dataset.hwpxSection = String(index);
      for (const paragraph of children(section.xml.documentElement, 'p')) container.append(this.renderParagraph(paragraph));
      fragment.append(container);
    });
    return fragment;
  }
  private renderParagraph(paragraph: Element): HTMLElement {
    const p = document.createElement('div'); p.style.margin = '0';
    p.dataset.hwpxParaRef = paragraph.getAttribute('paraPrIDRef') || '0';
    const format = this.parsed.paragraphs.get(p.dataset.hwpxParaRef);
    if (format) {
      p.style.textAlign = ({ BOTH: 'justify', DISTRIBUTE: 'justify' } as Record<string, string>)[format.align] || format.align.toLowerCase();
      p.style.lineHeight = format.lineSpacingType === 'PERCENT' ? String(format.lineSpacing / 100) : `${px(format.lineSpacing)}px`;
      p.style.marginLeft = `${px(format.marginLeft)}px`; p.style.marginRight = `${px(format.marginRight)}px`;
      p.style.textIndent = `${px(format.indent)}px`; p.style.marginTop = `${px(format.before)}px`; p.style.marginBottom = `${px(format.after)}px`;
    }
    for (const run of children(paragraph, 'run')) {
      const span = document.createElement('span');
      span.dataset.hwpxCharRef = run.getAttribute('charPrIDRef') || '0';
      const style = this.parsed.characters.get(span.dataset.hwpxCharRef);
      if (style) Object.assign(span.style, { fontFamily: style.font, fontSize: `${style.height / 100}pt`, color: style.color,
        fontWeight: style.bold ? 'bold' : 'normal', fontStyle: style.italic ? 'italic' : 'normal',
        textDecoration: [style.underline ? 'underline' : '', style.strike ? 'line-through' : ''].filter(Boolean).join(' ') || 'none' });
      for (const node of Array.from(run.children)) {
        if (node.localName === 'secPr' || (node.localName === 'ctrl' && first(node, 'colPr'))) continue;
        if (node.localName === 't') {
          for (const part of Array.from(node.childNodes)) {
            if (part.nodeType === Node.TEXT_NODE) span.append(document.createTextNode(part.textContent || ''));
            else if (part instanceof Element && part.localName === 'lineBreak') span.append(document.createElement('br'));
            else if (part instanceof Element && part.localName === 'tab') span.append(document.createTextNode('\t'));
            else if (part instanceof Element) span.append(this.renderOpaque(part));
          }
        } else if (node.localName === 'equation') {
          const object = document.createElement('span');
          const script = first(node, 'script')?.textContent || '', size = numberAttribute(node, 'baseUnit', 1100) / 100;
          object.dataset.hwpEquation = script; object.dataset.hwpEquationSize = String(size);
          const key = `o${this.opaque.size}`; this.opaque.set(key, node); object.dataset.hwpxObject = key;
          object.contentEditable = 'false'; object.setAttribute('role', 'math'); object.setAttribute('aria-label', script);
          object.title = '두 번 클릭하여 수식 편집'; object.style.cssText = 'display:inline-block;vertical-align:middle;cursor:pointer;';
          object.innerHTML = renderToStaticMarkup(<EquationRenderer script={script} fontSize={size} color={node.getAttribute('textColor') || '#000000'} />).replace(/<(\/?)div(?=[ >])/g, '<$1span');
          span.append(object);
        } else if (node.localName === 'tbl') span.append(this.renderTable(node));
        else span.append(this.renderOpaque(node));
      }
      if (span.childNodes.length) p.append(span);
    }
    if (!p.childNodes.length) p.append(document.createElement('br'));
    return this.remember(paragraph, p);
  }
  private renderOpaque(xml: Element): HTMLElement {
    const span = document.createElement('span'), key = `o${this.opaque.size}`;
    this.opaque.set(key, xml); span.dataset.hwpxOpaque = key; span.contentEditable = 'false';
    span.textContent = `[${xml.localName}]`; span.title = '원본 개체 보존'; return span;
  }
  private renderTable(xml: Element): HTMLTableElement {
    const table = document.createElement('table'); table.style.cssText = 'border-collapse:collapse;width:100%;';
    const key = `o${this.opaque.size}`; this.opaque.set(key, xml); table.dataset.hwpxObject = key;
    for (const row of children(xml, 'tr')) {
      const tr = table.insertRow();
      for (const cell of children(row, 'tc')) {
        const td = tr.insertCell(), span = first(cell, 'cellSpan');
        const key = `o${this.opaque.size}`; this.opaque.set(key, cell); td.dataset.hwpxObject = key;
        td.colSpan = numberAttribute(span, 'colSpan', 1); td.rowSpan = numberAttribute(span, 'rowSpan', 1);
        td.style.cssText = 'border:1px solid #333;padding:6px;';
        const list = children(cell, 'subList')[0];
        if (list) children(list, 'p').forEach(p => td.append(this.renderParagraph(p)));
      }
    }
    return table;
  }
  private nextId(): number { return 1500000000 + ++this.sequence; }
  private characterRef(html: HTMLElement): string {
    const current = html.closest<HTMLElement>('[data-hwpx-char-ref]')?.dataset.hwpxCharRef || '0';
    const original = elements(this.parsed.header, 'charPr').find(n => n.getAttribute('id') === current) || first(this.parsed.header, 'charPr')!;
    const node = clone(original), css = getComputedStyle(html);
    attrs(node, { height: Math.max(100, Math.round(parseFloat(css.fontSize) * 75)), textColor: this.color(css.color) });
    for (const [tag, enabled] of [['bold', css.fontWeight === 'bold' || Number(css.fontWeight) >= 600], ['italic', css.fontStyle === 'italic']] as const) {
      const old = first(node, tag); if (enabled && !old) node.append(create(this.parsed.header, tag, {}, hh)); else if (!enabled) old?.remove();
    }
    // Decorations can be inherited from several ancestors (e.g. <u><s>text</s></u>).
    let underline = false, strike = false, ancestor: HTMLElement | null = html;
    ancestor = html;
    while (ancestor && ancestor.getAttribute('contenteditable') !== 'true') {
      const decoration = getComputedStyle(ancestor).textDecorationLine;
      underline ||= decoration.includes('underline'); strike ||= decoration.includes('line-through'); ancestor = ancestor.parentElement;
    }
    const u = first(node, 'underline'), s = first(node, 'strikeout');
    if (u) u.setAttribute('type', underline ? 'BOTTOM' : 'NONE');
    if (s) s.setAttribute('shape', strike ? 'SOLID' : 'NONE');
    const font = css.fontFamily.split(',')[0].trim().replace(/^["']|["']$/g, '');
    const fontRef = first(node, 'fontRef');
    if (fontRef) for (const face of elements(this.parsed.header, 'fontface')) {
      let found = elements(face, 'font').find(f => f.getAttribute('face') === font);
      if (!found) {
        found = clone(first(face, 'font')!); attrs(found, { id: this.nextMapId(face, 'font'), face: font }); face.append(found); face.setAttribute('fontCnt', String(children(face, 'font').length));
      }
      fontRef.setAttribute((face.getAttribute('lang') || '').toLowerCase(), found.getAttribute('id')!);
    }
    return this.registerStyle('charProperties', 'charPr', node);
  }
  private color(css: string): string {
    const values = css.match(/[\d.]+/g);
    return css.startsWith('#') ? css : values?.length ? '#' + values.slice(0, 3).map(v => Math.round(Number(v)).toString(16).padStart(2, '0')).join('') : '#000000';
  }
  private nextMapId(parent: Element, tag: string): string { return String(Math.max(-1, ...children(parent, tag).map(n => numberAttribute(n, 'id'))) + 1); }
  private registerStyle(collection: string, tag: string, node: Element): string {
    const parent = first(this.parsed.header, collection)!;
    const signature = (n: Element) => { const c = clone(n); c.removeAttribute('id'); return serialize(c); };
    const match = children(parent, tag).find(n => signature(n) === signature(node));
    if (match) return match.getAttribute('id')!;
    const id = this.nextMapId(parent, tag); node.setAttribute('id', id); parent.append(node); parent.setAttribute('itemCnt', String(children(parent, tag).length)); return id;
  }
  private paragraphRef(html: HTMLElement): string {
    const ref = html.dataset.hwpxParaRef || '0';
    const original = elements(this.parsed.header, 'paraPr').find(n => n.getAttribute('id') === ref) || first(this.parsed.header, 'paraPr')!;
    const node = clone(original), css = getComputedStyle(html), align = first(node, 'align');
    if (align) align.setAttribute('horizontal', ({ start: 'LEFT', end: 'RIGHT', justify: 'JUSTIFY' } as Record<string, string>)[css.textAlign] || css.textAlign.toUpperCase());
    const spacing = first(node, 'lineSpacing');
    if (spacing && css.lineHeight !== 'normal') attrs(spacing, { type: 'PERCENT', value: Math.round(parseFloat(css.lineHeight) / parseFloat(css.fontSize) * 100), unit: 'HWPUNIT' });
    const margin = first(node, 'margin');
    for (const [name, value] of Object.entries({ left: css.marginLeft, right: css.marginRight, indent: css.textIndent, prev: css.marginTop, next: css.marginBottom })) {
      const el = margin && first(margin, name); if (el) el.setAttribute('value', String(Math.round((parseFloat(value) || 0) * 75)));
    }
    return this.registerStyle('paraProperties', 'paraPr', node);
  }
  private equation(html: HTMLElement, xml: Document): Element {
    const script = html.dataset.hwpEquation || '', size = Math.round((Number(html.dataset.hwpEquationSize) || 11) * 100);
    const original = this.opaque.get(html.dataset.hwpxObject || '');
    if (original && first(original, 'script')?.textContent === script && numberAttribute(original, 'baseUnit') === size) return xml.importNode(original, true);
    const equation = original ? xml.importNode(original, true) : create(xml, 'equation', { id: this.nextId(), zOrder: 0, numberingType: 'EQUATION', textWrap: 'TOP_AND_BOTTOM', textFlow: 'BOTH_SIDES', lock: 0, dropcapstyle: 'None', version: 'Equation Version 60', textColor: '#000000', lineMode: 'CHAR', font: 'HYhwpEQ' });
    const layout = layoutEquation(script, size); attrs(equation, { baseUnit: size, baseLine: layout.baseLine });
    let sz = first(equation, 'sz'); if (!sz) { sz = create(xml, 'sz', { widthRelTo: 'ABSOLUTE', heightRelTo: 'ABSOLUTE', protect: 0 }); equation.append(sz); }
    attrs(sz, { width: layout.w, height: layout.h });
    if (!first(equation, 'pos')) equation.append(this.position(xml));
    if (!first(equation, 'outMargin')) equation.append(create(xml, 'outMargin', { left: 56, right: 56, top: 0, bottom: 0 }));
    if (!first(equation, 'shapeComment')) { const comment = create(xml, 'shapeComment'); comment.textContent = '수식입니다.'; equation.append(comment); }
    let text = first(equation, 'script'); if (!text) { text = create(xml, 'script'); equation.append(text); } text.textContent = script;
    return equation;
  }
  private position(xml: Document): Element { return create(xml, 'pos', { treatAsChar: 1, affectLSpacing: 0, flowWithText: 1, allowOverlap: 0, holdAnchorAndSO: 0, vertRelTo: 'PARA', horzRelTo: 'PARA', vertAlign: 'TOP', horzAlign: 'LEFT', vertOffset: 0, horzOffset: 0 }); }
  private paragraph(nodes: Node[], host: HTMLElement, xml: Document): Element {
    const saved = this.originals.get(host.dataset.hwpxParagraph || '');
    if (saved && host.outerHTML === saved.html) return xml.importNode(saved.xml, true);
    const p = saved ? xml.importNode(saved.xml, false) : create(xml, 'p', { id: this.nextId(), styleIDRef: 0, pageBreak: 0, columnBreak: 0, merged: 0 });
    p.setAttribute('paraPrIDRef', this.paragraphRef(host));
    // Section properties and column controls are not visible text, but stay anchored to their paragraph.
    if (saved) for (const oldRun of children(saved.xml, 'run')) {
      const controls = Array.from(oldRun.children).filter(n => n.localName === 'secPr' || (n.localName === 'ctrl' && first(n, 'colPr')));
      if (controls.length) { const run = xml.importNode(oldRun, false); controls.forEach(c => run.append(xml.importNode(c, true))); p.append(run); }
    }
    const append = (node: Node) => {
      const el = node instanceof HTMLElement ? node : node.parentElement || host;
      if (node.nodeType === Node.TEXT_NODE) {
        const run = create(xml, 'run', { charPrIDRef: this.characterRef(el) }), t = create(xml, 't');
        const parts = (node.textContent || '').split(/([\t\n])/);
        for (const part of parts) t.append(part === '\t' ? create(xml, 'tab', { width: 4000, leader: 0, type: 1 }) : part === '\n' ? create(xml, 'lineBreak') : xml.createTextNode(part));
        run.append(t); p.append(run); return;
      }
      if (!(node instanceof HTMLElement)) return;
      const run = () => create(xml, 'run', { charPrIDRef: this.characterRef(node) });
      if (node.dataset.hwpEquation !== undefined) { const r = run(); r.append(this.equation(node, xml)); p.append(r); }
      else if (node.dataset.hwpxOpaque) { const old = this.opaque.get(node.dataset.hwpxOpaque); if (!old) throw new Error('원본 개체 정보가 없어 저장할 수 없습니다.'); const r = run(); r.append(xml.importNode(old, true)); p.append(r); }
      else if (node.tagName === 'TABLE') { const r = run(); r.append(this.table(node as HTMLTableElement, xml)); p.append(r); }
      else if (node.tagName === 'BR') { const r = run(), t = create(xml, 't'); if (nodes.length > 1) t.append(create(xml, 'lineBreak')); r.append(t); p.append(r); }
      else if (['IMG', 'SVG', 'CANVAS'].includes(node.tagName) || node.getAttribute('contenteditable') === 'false') throw new Error('이 개체의 HWPX 저장은 아직 지원하지 않습니다. 문서 내용은 유지됩니다.');
      else Array.from(node.childNodes).forEach(append);
    };
    nodes.forEach(append);
    if (!children(p, 'run').length) { const r = create(xml, 'run', { charPrIDRef: 0 }); r.append(create(xml, 't')); p.append(r); }
    return p;
  }
  private blocks(container: HTMLElement, xml: Document): Element[] {
    const result: Element[] = []; let inline: Node[] = [];
    const flush = () => { if (inline.length) { result.push(this.paragraph(inline, container, xml)); inline = []; } };
    for (const node of Array.from(container.childNodes)) {
      if (node instanceof HTMLElement && ['P', 'DIV', 'H1', 'H2', 'H3', 'BLOCKQUOTE', 'LI'].includes(node.tagName) && node.dataset.hwpEquation === undefined) {
        flush();
        if (Array.from(node.children).some(child => ['P', 'DIV'].includes(child.tagName))) result.push(...this.blocks(node, xml));
        else result.push(this.paragraph(Array.from(node.childNodes), node, xml));
      } else inline.push(node);
    }
    flush();
    return result.length ? result : [this.paragraph([], container, xml)];
  }
  private table(html: HTMLTableElement, xml: Document): Element {
    const original = this.opaque.get(html.dataset.hwpxObject || '');
    const rows = Array.from(html.rows), occupied: number[] = [], addresses = new Map<HTMLTableCellElement, number>();
    let cols = 1;
    rows.forEach((row, r) => {
      let col = 0;
      for (const cell of Array.from(row.cells)) {
        while (Array.from({ length: cell.colSpan }, (_, offset) => occupied[col + offset] > r).some(Boolean)) col++;
        addresses.set(cell, col);
        for (let offset = 0; offset < cell.colSpan; offset++) occupied[col + offset] = r + (cell.rowSpan || rows.length - r);
        col += cell.colSpan; cols = Math.max(cols, col);
      }
    });
    const table = original ? xml.importNode(original, true) : create(xml, 'tbl', { id: this.nextId(), zOrder: 0, numberingType: 'TABLE', textWrap: 'TOP_AND_BOTTOM', textFlow: 'BOTH_SIDES', lock: 0, dropcapstyle: 'None', pageBreak: 'CELL', repeatHeader: 1, rowCnt: rows.length, colCnt: cols, cellSpacing: 0, borderFillIDRef: 1, noAdjust: 0 });
    const oldRows = children(table, 'tr');
    attrs(table, { rowCnt: rows.length, colCnt: cols });
    if (!first(table, 'sz')) table.append(create(xml, 'sz', { width: 42520, widthRelTo: 'ABSOLUTE', height: Math.max(2400, rows.length * 2400), heightRelTo: 'ABSOLUTE', protect: 0 }));
    if (!first(table, 'pos')) table.append(this.position(xml));
    if (!children(table, 'outMargin').length) table.append(create(xml, 'outMargin', { left: 0, right: 0, top: 0, bottom: 0 }));
    if (!children(table, 'inMargin').length) table.append(create(xml, 'inMargin', { left: 510, right: 510, top: 141, bottom: 141 }));
    oldRows.forEach(row => row.remove());
    rows.forEach((row, r) => {
      const tr = create(xml, 'tr');
      Array.from(row.cells).forEach((cell, c) => {
        const col = addresses.get(cell)!;
        const old = this.opaque.get(cell.dataset.hwpxObject || '') || (oldRows[r] && children(oldRows[r], 'tc')[c]);
        const tc = old ? xml.importNode(old, true) : create(xml, 'tc', { name: '', header: 0, hasMargin: 0, protect: 0, editable: 0, dirty: 0, borderFillIDRef: 1 });
        let list = children(tc, 'subList')[0];
        if (!list) { list = create(xml, 'subList', { id: '', textDirection: 'HORIZONTAL', lineWrap: 'BREAK', vertAlign: 'CENTER', linkListIDRef: 0, linkListNextIDRef: 0, textWidth: 0, textHeight: 0, hasTextRef: 0, hasNumRef: 0 }); tc.prepend(list); }
        list.replaceChildren(...this.blocks(cell, xml));
        for (const [name, values] of Object.entries<Record<string, number>>({ cellAddr: { colAddr: col, rowAddr: r }, cellSpan: { colSpan: cell.colSpan, rowSpan: cell.rowSpan || rows.length - r }, cellSz: { width: Math.round(42520 / cols * cell.colSpan), height: 2400 }, cellMargin: { left: 510, right: 510, top: 141, bottom: 141 } })) {
          let child = children(tc, name)[0];
          if (!child) { child = create(xml, name); tc.append(child); }
          // Editing cell text must retain native cell dimensions and margins.
          if (old && (name === 'cellSz' || name === 'cellMargin')) {
            for (const [key, value] of Object.entries(values)) if (!child.hasAttribute(key)) child.setAttribute(key, String(value));
          } else attrs(child, values);
        }
        tr.append(tc);
      });
      table.append(tr);
    });
    return table;
  }
  save(editor: HTMLElement, settings: DocumentSettings, title: string): Uint8Array {
    const archive: HwpxArchive = { ...this.parsed.archive };
    const wrappers = Array.from(editor.children).filter((e): e is HTMLElement => e instanceof HTMLElement && e.dataset.hwpxSection !== undefined);
    if (this.parsed.sections.length > 1 && (wrappers.length !== this.parsed.sections.length || editor.childNodes.length !== wrappers.length)) throw new Error('구역 경계가 변경되어 저장할 수 없습니다. 문서 내용은 유지됩니다.');
    this.parsed.sections.forEach((section, index) => {
      const xml = section.xml.cloneNode(true) as XMLDocument;
      const container = wrappers.length === 1 && editor.childNodes.length === 1 ? wrappers[0] : this.parsed.sections.length > 1 ? wrappers[index] : editor;
      xml.documentElement.replaceChildren(...this.blocks(container, xml));
      if (!first(xml, 'secPr')) {
        const original = first(section.xml, 'secPr');
        if (original) { const run = create(xml, 'run', { charPrIDRef: 0 }); run.append(xml.importNode(original, true)); const col = first(section.xml, 'colPr'); if (col?.parentElement) run.append(xml.importNode(col.parentElement, true)); children(xml.documentElement, 'p')[0].prepend(run); }
      }
      // Only the first section is represented by the current page controls.
      if (index === 0) {
        const page = first(xml, 'pagePr'), margin = page && first(page, 'margin');
        if (page) attrs(page, { width: hu(settings.page.width), height: hu(settings.page.height), landscape: settings.orientation === 'landscape' ? 'NARROWLY' : 'WIDELY' });
        if (margin) for (const key of ['top', 'bottom', 'left', 'right', 'header', 'footer'] as const) margin.setAttribute(key, String(hu(settings.page[key])));
        const col = first(xml, 'colPr'); if (col) col.setAttribute('colCount', String(settings.columns));
      }
      setXmlPart(archive, section.path, xml);
    });
    setXmlPart(archive, 'Contents/header.xml', this.parsed.header);
    const packageXml = readXmlPart(archive, 'Contents/content.hpf'), titleElement = first(packageXml, 'title');
    if (titleElement) titleElement.textContent = title;
    for (const meta of elements(packageXml, 'meta')) if (meta.getAttribute('name') === 'ModifiedDate') meta.textContent = new Date().toISOString();
    setXmlPart(archive, 'Contents/content.hpf', packageXml);
    archive['Preview/PrvText.txt'] = strToU8(editor.innerText);
    // A stale thumbnail must never claim to show the edited document.
    delete archive['Preview/PrvImage.png'];
    return writeHwpxArchive(archive);
  }
}
