import { HwpxArchive, readHwpxArchive, readXmlPart } from './hwpx-archive';

export const HWP_NS = {
  paragraph: 'http://www.hancom.co.kr/hwpml/2011/paragraph',
  head: 'http://www.hancom.co.kr/hwpml/2011/head',
  core: 'http://www.hancom.co.kr/hwpml/2011/core',
  package: 'http://www.idpf.org/2007/opf/',
};
export interface CharacterStyle {
  id: string; height: number; font: string; color: string; bold: boolean; italic: boolean; underline: boolean; strike: boolean;
}
export interface ParagraphStyle {
  id: string; align: string; lineSpacing: number; lineSpacingType: string; marginLeft: number; marginRight: number; indent: number; before: number; after: number;
}
export interface HwpxSection { path: string; xml: XMLDocument }
export interface ParsedHwpx {
  archive: HwpxArchive; header: XMLDocument; sections: HwpxSection[];
  characters: Map<string, CharacterStyle>; paragraphs: Map<string, ParagraphStyle>;
}
export const elements = (parent: Document | Element, name: string, namespace = '*') => Array.from(parent.getElementsByTagNameNS(namespace, name));
export const children = (parent: Element, name: string) => Array.from(parent.children).filter(child => child.localName === name);
export const first = (parent: Document | Element, name: string) => elements(parent, name)[0];
export const numberAttribute = (element: Element | undefined, name: string, fallback = 0) => {
  const attribute = element?.getAttribute(name);
  const number = attribute === null || attribute === undefined ? NaN : Number(attribute);
  return Number.isFinite(number) ? number : fallback;
};

export function parseHwpx(bytes: Uint8Array): ParsedHwpx {
  const archive = readHwpxArchive(bytes);
  const header = readXmlPart(archive, 'Contents/header.xml');
  const packageXml = readXmlPart(archive, 'Contents/content.hpf');
  const files = new Map(elements(packageXml, 'item').map(item => [item.getAttribute('id'), item.getAttribute('href') || '']));
  const sectionPaths = elements(packageXml, 'itemref').map(item => files.get(item.getAttribute('idref')) || '')
    .filter(path => /(?:^|\/)section\d+\.xml$/i.test(path)).map(path => path.startsWith('Contents/') ? path : 'Contents/' + path);
  if (!sectionPaths.length) throw new Error('문서의 본문 구역을 찾을 수 없습니다.');
  const sections = sectionPaths.map(path => ({ path, xml: readXmlPart(archive, path) }));
  const fontFaces = elements(header, 'fontface');
  const hangulFonts = fontFaces.find(face => face.getAttribute('lang') === 'HANGUL');
  const fonts = new Map((hangulFonts ? elements(hangulFonts, 'font') : []).map(font => [font.getAttribute('id'), font.getAttribute('face') || '함초롬바탕']));
  const characters = new Map<string, CharacterStyle>();
  for (const item of elements(header, 'charPr')) {
    const id = item.getAttribute('id') || '0';
    const fontRef = first(item, 'fontRef');
    const underline = first(item, 'underline');
    const strike = first(item, 'strikeout');
    characters.set(id, { id, height: numberAttribute(item, 'height', 1000), font: fonts.get(fontRef?.getAttribute('hangul') || '0') || '함초롬바탕',
      color: item.getAttribute('textColor') || '#000000', bold: !!first(item, 'bold'), italic: !!first(item, 'italic'),
      underline: !!underline && underline.getAttribute('type') !== 'NONE', strike: !!strike && strike.getAttribute('shape') !== 'NONE' });
  }
  const paragraphs = new Map<string, ParagraphStyle>();
  for (const item of elements(header, 'paraPr')) {
    const id = item.getAttribute('id') || '0';
    const spacing = first(item, 'lineSpacing');
    const margin = first(item, 'margin');
    const marginValue = (name: string) => numberAttribute(margin && first(margin, name), 'value');
    paragraphs.set(id, { id, align: first(item, 'align')?.getAttribute('horizontal') || 'JUSTIFY',
      lineSpacing: numberAttribute(spacing, 'value', 160), lineSpacingType: spacing?.getAttribute('type') || 'PERCENT',
      marginLeft: marginValue('left'), marginRight: marginValue('right'), indent: marginValue('indent'), before: marginValue('prev'), after: marginValue('next') });
  }
  return { archive, header, sections, characters, paragraphs };
}

export function paragraphPlainText(paragraph: Element): string {
  let text = '';
  for (const run of children(paragraph, 'run')) {
    for (const child of Array.from(run.children)) {
      if (child.localName === 't') {
        for (const part of Array.from(child.childNodes)) {
          if (part.nodeType === Node.TEXT_NODE) text += part.textContent;
          else if (part instanceof Element && part.localName === 'lineBreak') text += '\n';
          else if (part instanceof Element && part.localName === 'tab') text += '\t';
        }
      } else if (child.localName === 'equation') text += first(child, 'script')?.textContent || '';
      else if (child.localName === 'tbl') text += elements(child, 'p', HWP_NS.paragraph).map(paragraphPlainText).join('\t');
    }
  }
  return text;
}
