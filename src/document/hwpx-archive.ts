import { strFromU8, strToU8, unzipSync, zipSync, Zippable } from 'fflate';

export type HwpxArchive = Record<string, Uint8Array>;
const MAX_PACKAGE_BYTES = 256 * 1024 * 1024;
const MAX_PART_BYTES = 64 * 1024 * 1024;
const MIME = 'application/hwp+zip';

function validPath(name: string): boolean {
  return !!name && !name.startsWith('/') && !name.includes('\\') && !name.split('/').includes('..') && !name.includes('\0');
}

/** Decode the actual ZIP package; never treat binary HWP/HWPX as plain text. */
export function readHwpxArchive(bytes: Uint8Array): HwpxArchive {
  if (bytes[0] !== 0x50 || bytes[1] !== 0x4b) throw new Error('HWPX 형식의 파일을 선택해 주세요.');
  let total = 0;
  let count = 0;
  const archive = unzipSync(bytes, { filter: part => {
    if (!validPath(part.name)) throw new Error('문서 안의 파일 경로를 읽을 수 없습니다.');
    total += part.originalSize; count++;
    if (part.originalSize > MAX_PART_BYTES || total > MAX_PACKAGE_BYTES || count > 10000) throw new Error('문서 크기가 열 수 있는 범위를 초과했습니다.');
    return !part.name.endsWith('/');
  } });
  if (!archive.mimetype || strFromU8(archive.mimetype).trim() !== MIME || !archive['Contents/header.xml'] || !archive['Contents/content.hpf']) {
    throw new Error('올바른 HWPX 문서가 아닙니다.');
  }
  return archive;
}

export function readXmlPart(archive: HwpxArchive, name: string): XMLDocument {
  const bytes = archive[name];
  if (!bytes) throw new Error(`문서의 필수 항목을 찾을 수 없습니다: ${name}`);
  const text = strFromU8(bytes);
  if (/<!DOCTYPE|<!ENTITY/i.test(text)) throw new Error('지원하지 않는 XML 선언이 포함된 문서입니다.');
  const xml = new DOMParser().parseFromString(text, 'application/xml');
  if (xml.getElementsByTagName('parsererror').length) throw new Error('문서 내용을 읽을 수 없습니다.');
  return xml;
}

export function setXmlPart(archive: HwpxArchive, name: string, xml: XMLDocument) {
  archive[name] = strToU8(new XMLSerializer().serializeToString(xml));
}

/** The first ZIP member is the uncompressed mimetype. Preserve all other parts. */
export function writeHwpxArchive(archive: HwpxArchive): Uint8Array {
  const files: Zippable = { mimetype: [strToU8(MIME), { level: 0 }] };
  for (const [name, data] of Object.entries(archive)) {
    if (name === 'mimetype') continue;
    if (!validPath(name)) throw new Error('문서 안의 파일 경로를 저장할 수 없습니다.');
    files[name] = data;
  }
  return zipSync(files, { level: 6 });
}
