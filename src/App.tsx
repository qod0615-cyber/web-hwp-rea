import React, { useState, useEffect, useLayoutEffect, useRef } from 'react';
import { EquationRenderer } from './engine/EquationRenderer';
import { renderToStaticMarkup } from 'react-dom/server';
import { NativeDialog, NativeField } from './components/NativeDialog';
import { DocumentScrollBar } from './components/DocumentScrollBar';
import { EquationEditor } from './components/EquationEditor';
import './components/document-viewport.css';
import { HwpxDocument } from './document/hwpx-document';
import { DocumentFileSession } from './document/file-session';
import nativeControlBounds from './components/native-control-bounds.json';
import { ToolbarCombo } from './components/ToolbarCombo';
import ribbonReference from './components/ribbon-reference.json';
import { ReferenceDropdown, ReferenceMenu } from './components/ReferenceDropdown';

const referencedTabs = ribbonReference.tabs as Record<string, { ribbonAsset: string; menuAsset: string; controls: { name: string; type: string; enabled: boolean; x: number; y: number; w: number; h: number }[]; dropdown?: ReferenceMenu }>;

const nativeBounds = nativeControlBounds.controls as Record<string, Record<string, { x: number; y: number; w: number; h: number }>>;
const controlStyle = (group: string, name: string, sectionTop: number): React.CSSProperties => {
  const rect = nativeBounds[group][name];
  return { position: 'absolute', left: rect.x, top: rect.y - sectionTop, width: rect.w, height: rect.h, padding: 0, background: 'transparent' };
};


// Native UIA rectangles, recorded with source hash in native-control-bounds.json.
const MENU_DEF: { title: string; drop?: string }[] = [
  { title: '파일', drop: 'file' },
  { title: '편집', drop: 'edit' },
  { title: '보기', drop: 'view' },
  { title: '입력', drop: 'insert' },
  { title: '서식', drop: 'format' },
  { title: '쪽', drop: 'page' },
  { title: '보안', drop: 'security' },
  { title: '검토', drop: 'review' },
  { title: '도구', drop: 'tools' },
];
const MENU_BOXES = (() => {
  return MENU_DEF.map(m => ({ key: m.title, title: m.title, drop: m.drop, ...nativeBounds['메뉴'][m.title] }));
})();

// Preserve native pixels; only the empty middle region expands with the window.
function Slice({ src, h, rightW = 0, stretchX: _stretchX }: { src: string; h: number; rightW?: number; stretchX?: number }) {
  const bg = (pos: string): React.CSSProperties => ({ backgroundImage: `url("${src}")`, backgroundRepeat: 'no-repeat', backgroundPosition: pos, pointerEvents: 'none', position: 'absolute', top: 0, height: h });
  return <>
    <div style={{ ...bg('left top'), left: 0, width: rightW ? `calc(100% - ${rightW}px)` : '100%', maxWidth: 1916 - rightW }} />
    {rightW > 0 && <div style={{ ...bg('right top'), right: 0, width: rightW }} />}
  </>;
}

export default function App() {
  const [docTitle, setDocTitle] = useState(() => {
    return localStorage.getItem('web_hwp_current_title') || '빈 문서 1';
  });
  const [docFilePath, setDocFilePath] = useState(() => {
    return localStorage.getItem('web_hwp_current_path') || '';
  });
  const [activeMenu, setActiveMenu] = useState('편집');
  const [zoom, setZoom] = useState(() => {
    const saved = Number(localStorage.getItem('web_hwp_zoom'));
    return saved >= 25 && saved <= 500 ? saved : 110;
  });
  const viewportRef = useRef<HTMLDivElement>(null);
  const [scrollPosition, setScrollPosition] = useState({ x: 0, y: 0 });
  const documentScale = zoom / 100;
  const [viewportWidth, setViewportWidth] = useState(() => window.innerWidth - 41);
  useLayoutEffect(() => {
    const viewport = viewportRef.current;
    if (!viewport) return;
    const observer = new ResizeObserver(() => setViewportWidth(viewport.clientWidth));
    observer.observe(viewport); return () => observer.disconnect();
  }, []);
  useEffect(() => { localStorage.setItem('web_hwp_zoom', String(zoom)); }, [zoom]);
  const [contextMenu, setContextMenu] = useState<{ x: number; y: number; visible: boolean }>({ x: 0, y: 0, visible: false });
  const [caret, setCaret] = useState({ page: 1, section: 1, col: 1, line: 1, chars: 0, strokes: 0 });
  const [activeModal, setActiveModal] = useState<string | null>(null); // 'equation' | 'table' | 'font' | 'page' | 'paragraph' | 'charmap' | 'find' | 'style' | 'docinfo'
  const [activeDropdown, setActiveDropdown] = useState<string | null>(null); // 'file' | 'edit' | 'view' | 'insert' | 'format' | 'page'
  const [pageOrientation, setPageOrientation] = useState<'portrait' | 'landscape'>('portrait');
  const [columnCount, setColumnCount] = useState<number>(1);
  const [showMarks, setShowMarks] = useState<boolean>(false);
  const [viewColor, setViewColor] = useState<'color' | 'grayscale'>('color');
  const [showPictures, setShowPictures] = useState(true);
  const [showStatus, setShowStatus] = useState(true);
  const [showDocumentTabs, setShowDocumentTabs] = useState(true);
  const [copiedStyle, setCopiedStyle] = useState<any | null>(null);
  const [chordState, setChordState] = useState<string | null>(null); // 'Ctrl+N' 등 2단 단축키 대기
  const [chordToast, setChordToast] = useState<string | null>(null);
  const [eqScript, setEqScript] = useState('');
  const [eqFontSize, setEqFontSize] = useState(11);
  const [tableRows, setTableRows] = useState(5);
  const [tableCols, setTableCols] = useState(5);
  const [isStandalone, setIsStandalone] = useState(false);
  const [selectedChar, setSelectedChar] = useState('※');
  const [findWord, setFindWord] = useState('');
  const [replaceWord, setReplaceWord] = useState('');
  const [fontConfig, setFontConfig] = useState({ size: 10, font: '함초롬바탕', width: 100, spacing: 0, color: '#000000', bold: false, italic: false, underline: false, strike: false, relativeSize: 100, position: 0 });
  const [paraConfig, setParaConfig] = useState({ lineHeight: 160, align: 'justify', indent: 0, left: 0, right: 0, before: 0, after: 0 });
  const [lineSpacingDraft, setLineSpacingDraft] = useState('160');
  useEffect(() => setLineSpacingDraft(String(paraConfig.lineHeight)), [paraConfig.lineHeight]);
  const [pageConfig, setPageConfig] = useState({ top: 20, bottom: 15, left: 30, right: 30, header: 15, footer: 15, width: 210, height: 297 });
  const [fontDraft, setFontDraft] = useState(fontConfig);
  const [paraDraft, setParaDraft] = useState(paraConfig);
  useLayoutEffect(() => { if (activeModal === 'font') setFontDraft(fontConfig); if (activeModal === 'paragraph') setParaDraft(paraConfig); }, [activeModal]);
  const [pageDraft, setPageDraft] = useState(pageConfig);
  const [orientationDraft, setOrientationDraft] = useState(pageOrientation);
  useLayoutEffect(() => { if (activeModal === 'page') { setPageDraft(pageConfig); setOrientationDraft(pageOrientation); } }, [activeModal]);
  const editorRef = useRef<HTMLDivElement>(null);
  const editedEquation = useRef<HTMLElement | null>(null);
  const hwpxDocument = useRef<HwpxDocument | null>(null);
  const fileSession = useRef(new DocumentFileSession());
  const fileOperation = useRef(false);
  const cleanDocument = useRef('');
  const settingsRef = useRef({ page: pageConfig, orientation: pageOrientation, columns: columnCount });
  settingsRef.current = { page: pageConfig, orientation: pageOrientation, columns: columnCount };
  const titleRef = useRef(docTitle); titleRef.current = docTitle;
  const documentSignature = () => JSON.stringify([editorRef.current?.innerHTML || '', settingsRef.current]);
  const confirmReplaceDocument = () => cleanDocument.current === documentSignature() || window.confirm('변경된 문서를 저장하지 않고 닫을까요?');

  const paperMmWidth = pageOrientation === 'portrait' ? pageConfig.width : pageConfig.height;
  const paperMmHeight = pageOrientation === 'portrait' ? pageConfig.height : pageConfig.width;
  // HWP's 96-DPI 110% paper frame measures 878/879px across odd/even window
  // centers (100%: 795/796px). Keep that view frame separate from mm layout.
  const nativeFrameWidth = (paperMmWidth * 96 / 25.4 + 2) * documentScale + (zoom === 110 ? 3.4 * paperMmWidth / 210 : 0);
  const paperLeft = Math.max(20, Math.round((viewportWidth - nativeFrameWidth) / 2));
  const paperScreenWidth = Math.round((viewportWidth + nativeFrameWidth) / 2) - Math.round((viewportWidth - nativeFrameWidth) / 2);

  const openEquation = () => { captureEditorSelection(); editedEquation.current = null; setEqScript(''); setEqFontSize(11); setActiveModal('equation'); };

  // 저장된 본문 복원 및 브라우저 탭 타이틀 동기화
  useLayoutEffect(() => {
    const source = localStorage.getItem('web_hwp_hwpx_source');
    try {
      hwpxDocument.current = new HwpxDocument(source ? Uint8Array.from(atob(source), ch => ch.charCodeAt(0)) : undefined);
      // Rebuild original-object identities before restoring editable HTML.
      hwpxDocument.current.render();
      const savedSettings = localStorage.getItem('web_hwp_page_settings');
      if (savedSettings) {
        const settings = JSON.parse(savedSettings);
        setPageConfig(settings.page); setPageOrientation(settings.orientation); setColumnCount(settings.columns);
        settingsRef.current = settings;
      }
    } catch {
      setChordToast('이전 HWPX 원본을 복원하지 못했습니다. 원본 파일을 다시 열어 주세요.');
    }
    const savedHtml = localStorage.getItem('web_hwp_current_html');
    const savedContent = localStorage.getItem('web_hwp_current_content');
    if (editorRef.current) {
      if (savedHtml !== null) editorRef.current.innerHTML = savedHtml;
      else if (savedContent) editorRef.current.innerText = savedContent;
    }
    cleanDocument.current = documentSignature();
  }, []);

  useEffect(() => {
    if (activeModal !== 'equation') editedEquation.current = null;
  }, [activeModal]);

  useEffect(() => {
    // 한글 원본 형식: '파일명.hwpx [경로] - 한글' 또는 'Web HWP (RE) - [파일명]'
    document.title = `${docTitle}${docFilePath ? ` [${docFilePath}]` : ''} - 한글`;
    localStorage.setItem('web_hwp_current_title', docTitle);
    if (docFilePath) localStorage.setItem('web_hwp_current_path', docFilePath);
    else localStorage.removeItem('web_hwp_current_path');
  }, [docTitle, docFilePath]);

  // 1. Keyboard Lock API 및 전체 단축키 캡처 (브라우저 가로챔 100% 방지)
  useEffect(() => {
    if (window.matchMedia('(display-mode: standalone)').matches || (window.navigator as any).standalone) {
      setIsStandalone(true);
    }

    const nav = navigator as any;
    if (nav.keyboard && typeof nav.keyboard.lock === 'function') {
      try {
        nav.keyboard.lock([
          'ControlLeft', 'ControlRight', 'AltLeft', 'AltRight',
          'KeyN', 'KeyS', 'KeyO', 'KeyP', 'KeyW', 'KeyT', 'KeyM', 'KeyL', 'KeyC', 'KeyX', 'KeyV', 'KeyA', 'KeyZ', 'KeyY', 'KeyF', 'KeyH',
          'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10', 'F11', 'F12',
          'Escape'
        ]).catch(() => {});
      } catch (err) {}
    }

    const handleGlobalKeyDown = (e: KeyboardEvent) => {
      captureEditorSelection();
      const isCtrl = e.ctrlKey || e.metaKey;
      const isAlt = e.altKey;
      const key = e.key.toUpperCase();
      // The equation editor owns its keys, including Esc's native confirmation.
      if (activeModal === 'equation') return;

      // 1) 2단 조합키 (Chord)
      if (chordState === 'Ctrl+N') {
        e.preventDefault();
        e.stopPropagation();
        setChordState(null);
        setChordToast(null);

        if (key === 'M') {
          openEquation();
          return;
        } else if (key === 'T') {
          setActiveModal('table');
          return;
        } else if (key === 'I') {
          handleOpen();
          return;
        } else if (key === 'N') {
          handleNewDoc();
          return;
        }
      }

      // 2) 전역 단축키 가로챔
      if (isCtrl && !isAlt && key === 'N') {
        e.preventDefault();
        e.stopPropagation();
        setChordState('Ctrl+N');
        setChordToast('Ctrl+N, [M:수식, T:표, I:그림, N:새글] 대기 중...');
        setTimeout(() => {
          setChordState(prev => prev === 'Ctrl+N' ? null : prev);
          setChordToast(prev => prev?.includes('Ctrl+N') ? null : prev);
        }, 1500);
        return;
      }

      if (isCtrl && key === 'F10') {
        // Ctrl+F10 -> 문자표
        e.preventDefault();
        e.stopPropagation();
        setActiveModal('charmap');
        return;
      }

      if (isCtrl && (key === 'F' || key === 'H')) {
        // Ctrl+F / Ctrl+H -> 찾기 및 바꾸기
        e.preventDefault();
        e.stopPropagation();
        setActiveModal('find');
        return;
      }

      if (isCtrl && key === 'S') {
        e.preventDefault();
        e.stopPropagation();
        void handleSave(e.shiftKey);
        return;
      }

      if (isCtrl && key === 'O') {
        e.preventDefault();
        e.stopPropagation();
        handleOpen();
        return;
      }

      if (isCtrl && key === 'P') {
        e.preventDefault();
        e.stopPropagation();
        window.print();
        return;
      }

      if (isAlt && key === 'N') {
        e.preventDefault();
        e.stopPropagation();
        handleNewDoc();
        return;
      }

      if (isAlt && key === 'S') {
        e.preventDefault();
        e.stopPropagation();
        handleSave();
        return;
      }

      if (isAlt && key === 'V') {
        e.preventDefault(); e.stopPropagation(); void handleSave(true); return;
      }

      if (isAlt && key === 'O') {
        e.preventDefault();
        e.stopPropagation();
        handleOpen();
        return;
      }

      if (isAlt && key === 'P') {
        e.preventDefault();
        e.stopPropagation();
        window.print();
        return;
      }

      if (isAlt && key === 'L') {
        e.preventDefault();
        e.stopPropagation();
        setActiveModal('font');
        return;
      }

      if (isAlt && key === 'T') {
        e.preventDefault();
        e.stopPropagation();
        setActiveModal('paragraph');
        return;
      }

      if (key === 'F7') {
        e.preventDefault();
        e.stopPropagation();
        setActiveModal('page');
        return;
      }

      if (isAlt && key === 'C') {
        e.preventDefault();
        e.stopPropagation();
        handleCopyFormat();
        return;
      }

      if (key === 'F6') {
        e.preventDefault();
        e.stopPropagation();
        setActiveModal('style');
        return;
      }

      if (key === 'ESCAPE') {
        if (activeModal === 'equation' && e.shiftKey) {
          e.preventDefault();
          insertEquationToDoc();
          return;
        }
        if (activeModal) {
          e.preventDefault();
          setActiveModal(null);
        }
        setActiveDropdown(null);
        setContextMenu(prev => prev.visible ? { ...prev, visible: false } : prev);
        setChordState(null);
        setChordToast(null);
      }
    };

    window.addEventListener('keydown', handleGlobalKeyDown, { capture: true });
    return () => window.removeEventListener('keydown', handleGlobalKeyDown, { capture: true });
  }, [chordState, activeModal, copiedStyle, eqScript, eqFontSize]);

  // 모양 복사 (Alt+C) 실제 동작
  const handleCopyFormat = () => {
    const sel = window.getSelection();
    if (!copiedStyle) {
      if (sel && sel.anchorNode) {
        const el = sel.anchorNode.parentElement;
        const style = {
          fontFamily: el?.style.fontFamily || '함초롬바탕',
          fontSize: el?.style.fontSize || '13.33px',
          color: el?.style.color || '#111827',
          fontWeight: el?.style.fontWeight || 'normal',
          fontStyle: el?.style.fontStyle || 'normal',
          textDecoration: el?.style.textDecoration || 'none',
          letterSpacing: el?.style.letterSpacing || 'normal'
        };
        setCopiedStyle(style);
        setChordToast('글자 모양 복사됨 (적용할 텍스트 선택 후 Alt+C 다시 누름)');
        setTimeout(() => setChordToast(null), 2500);
      }
    } else {
      if (sel && sel.rangeCount > 0 && !sel.isCollapsed) {
        const span = document.createElement('span');
        Object.assign(span.style, copiedStyle);
        const range = sel.getRangeAt(0);
        span.appendChild(range.extractContents());
        range.insertNode(span);
        setCopiedStyle(null);
        setChordToast('글자 모양 붙여넣기 완료!');
        setTimeout(() => setChordToast(null), 1500);
      } else {
        setChordToast('적용할 텍스트 블록을 먼저 드래그하세요.');
        setTimeout(() => setChordToast(null), 1500);
      }
    }
  };

  const handleToggleOrientation = () => {
    setPageOrientation(prev => prev === 'portrait' ? 'landscape' : 'portrait');
    setChordToast(`용지 방향: ${pageOrientation === 'portrait' ? '가로 (1123x794)' : '세로 (794x1123)'}`);
    setTimeout(() => setChordToast(null), 1500);
  };

  const handleToggleColumns = () => {
    setColumnCount(prev => prev === 1 ? 2 : (prev === 2 ? 3 : 1));
    const nextCols = columnCount === 1 ? 2 : (columnCount === 2 ? 3 : 1);
    setChordToast(`다단 설정: ${nextCols}단`);
    setTimeout(() => setChordToast(null), 1500);
  };

  const handleInsertShape = (type: 'rect' | 'circle' | 'textbox') => {
    if (editorRef.current) {
      let shapeHtml = '';
      if (type === 'rect') {
        shapeHtml = `<div style="display:inline-block; width:160px; height:100px; border:2px solid #0078d7; background:#e6f2ff; margin:10px 0; resize:both; overflow:auto; padding:6px; box-sizing:border-box;" contenteditable="true">직사각형 개체</div>&nbsp;`;
      } else if (type === 'circle') {
        shapeHtml = `<div style="display:inline-block; width:120px; height:120px; border:2px solid #28a745; background:#eafaf1; border-radius:50%; margin:10px 0; text-align:center; line-height:120px; resize:both; overflow:auto;" contenteditable="true">원 개체</div>&nbsp;`;
      } else {
        shapeHtml = `<div style="display:inline-block; width:220px; height:110px; border:1px solid #999; background:#ffffff; box-shadow:2px 2px 6px rgba(0,0,0,0.15); margin:10px 0; padding:10px; resize:both; overflow:auto;" contenteditable="true"><p><strong>[글상자]</strong></p><p>내용을 입력하세요.</p></div>&nbsp;`;
      }
      insertHtmlToDoc(shapeHtml);
    }
  };

  const handleInsertChart = () => {
    if (editorRef.current) {
      const chartHtml = `
        <div style="display:inline-block; margin:12px 0; padding:12px; border:1px solid #c0c0c0; background:#fafafa; border-radius:4px; text-align:center;" contenteditable="false">
          <div style="font-weight:bold; font-size:12px; margin-bottom:8px; color:#333;">[차트] 월별 통계 분석표</div>
          <svg width="280" height="120" style="background:#fff; border:1px solid #eee;">
            <rect x="30" y="30" width="30" height="70" fill="#4a90e2" />
            <rect x="80" y="50" width="30" height="50" fill="#50e3c2" />
            <rect x="130" y="20" width="30" height="80" fill="#f5a623" />
            <rect x="180" y="40" width="30" height="60" fill="#9013fe" />
            <rect x="230" y="10" width="30" height="90" fill="#e53935" />
            <line x1="20" y1="100" x2="270" y2="100" stroke="#888" stroke-width="1" />
            <text x="35" y="115" font-size="10" fill="#666">1월</text>
            <text x="85" y="115" font-size="10" fill="#666">2월</text>
            <text x="135" y="115" font-size="10" fill="#666">3월</text>
            <text x="185" y="115" font-size="10" fill="#666">4월</text>
            <text x="235" y="115" font-size="10" fill="#666">5월</text>
          </svg>
        </div>&nbsp;
      `;
      insertHtmlToDoc(chartHtml);
    }
  };

  const handleInsertImage = () => {
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = 'image/*';
    input.onchange = (e: any) => {
      const file = e.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = (re: any) => {
          if (editorRef.current) {
            const imgHtml = `<img src="${re.target.result}" style="max-width:100%; height:auto; margin:8px 0; border:1px solid #ccc;" /><p>&nbsp;</p>`;
            insertHtmlToDoc(imgHtml);
            editorRef.current.focus();
            setChordToast('그림 삽입 완료');
            setTimeout(() => setChordToast(null), 1200);
          }
        };
        reader.readAsDataURL(file);
      }
    };
    input.click();
  };

  // 마지막 본문 selection 저장/복원 (툴바 클릭으로 focus가 빠져도 서식 명령이 본문에 적용되도록)
  const savedRange = useRef<Range | null>(null);
  const captureEditorSelection = () => {
    const selection = window.getSelection();
    if (selection?.rangeCount && editorRef.current?.contains(selection.anchorNode)) savedRange.current = selection.getRangeAt(0).cloneRange();
  };
  useEffect(() => {
    const onSel = () => {
      const sel = window.getSelection();
      if (sel && sel.rangeCount > 0 && editorRef.current && editorRef.current.contains(sel.anchorNode)) {
        savedRange.current = sel.getRangeAt(0).cloneRange();
      }
    };
    document.addEventListener('selectionchange', onSel);
    return () => document.removeEventListener('selectionchange', onSel);
  }, []);

  const focusEditor = () => {
    const ed = editorRef.current;
    if (!ed) return;
    ed.focus();
    const sel = window.getSelection();
    if (sel) {
      if (savedRange.current && ed.contains(savedRange.current.commonAncestorContainer)) { sel.removeAllRanges(); sel.addRange(savedRange.current); }
      else { const r = document.createRange(); r.selectNodeContents(ed); r.collapse(false); sel.removeAllRanges(); sel.addRange(r); }
    }
  };

  const persistEditor = () => {
    const ed = editorRef.current;
    if (!ed) return;
    localStorage.setItem('web_hwp_current_html', ed.innerHTML);
    localStorage.setItem('web_hwp_current_content', ed.innerText);
    localStorage.setItem('web_hwp_page_settings', JSON.stringify(settingsRef.current));
    setCaret(prev => ({ ...prev, chars: ed.innerText.length, strokes: ed.innerText.length * 2 }));
  };

  const insertHtmlToDoc = (html: string) => {
    focusEditor();
    document.execCommand('insertHTML', false, html);
    persistEditor();
  };

  const insertEquationToDoc = () => {
    if (!eqScript.trim() || !editorRef.current) return;
    const object = document.createElement('span');
    object.contentEditable = 'false';
    object.dataset.hwpEquation = eqScript;
    object.dataset.hwpEquationSize = String(eqFontSize);
    object.setAttribute('role', 'math');
    object.setAttribute('aria-label', eqScript);
    object.title = '두 번 클릭하여 수식 편집';
    object.style.cssText = 'display:inline-block;vertical-align:middle;cursor:pointer;';
    object.innerHTML = renderToStaticMarkup(<EquationRenderer script={eqScript} fontSize={eqFontSize} />).replace(/<(\/?)div(?=[ >])/g, '<$1span');
    if (editedEquation.current?.dataset.hwpxObject) object.dataset.hwpxObject = editedEquation.current.dataset.hwpxObject;
    if (editedEquation.current && editorRef.current.contains(editedEquation.current)) {
      const range = document.createRange();
      range.selectNode(editedEquation.current);
      savedRange.current = range;
    }
    insertHtmlToDoc(object.outerHTML);
    setActiveModal(null);
  };

  const runCommand = (cmd: string, val: any = null, toastMsg?: string) => {
    focusEditor();
    if (cmd === 'paste') {
      const nav: any = navigator;
      if (nav.clipboard && nav.clipboard.readText) {
        nav.clipboard.readText().then((t: string) => { focusEditor(); document.execCommand('insertText', false, t); persistEditor(); })
          .catch(() => { setChordToast('붙이기: 브라우저가 클립보드 읽기를 막았습니다 (Ctrl+V 사용)'); setTimeout(() => setChordToast(null), 2000); });
      }
      return;
    }
    const ok = document.execCommand(cmd, false, val);
    if ((cmd === 'copy' || cmd === 'cut') && !ok) {
      const t = window.getSelection()?.toString();
      if (t && (navigator as any).clipboard) (navigator as any).clipboard.writeText(t);
    }
    if (toastMsg) {
      setChordToast(toastMsg);
      setTimeout(() => setChordToast(null), 1200);
    }
    persistEditor();
  };

  const applyParagraphStyle = (styles: Partial<CSSStyleDeclaration> & { textJustify?: string }, restoreFocus = true) => {
    if (restoreFocus) focusEditor();
    const editor = editorRef.current, selection = window.getSelection();
    if (!editor) return;
    const range = !restoreFocus && savedRange.current ? savedRange.current : selection?.rangeCount ? selection.getRangeAt(0) : null;
    if (!range || !editor.contains(range.commonAncestorContainer)) return;
    const paragraphs = Array.from(editor.querySelectorAll<HTMLElement>('div,p,li,h1,h2,h3,blockquote'))
      .filter(element => !element.querySelector('div,p,li,h1,h2,h3,blockquote') && range.intersectsNode(element));
    if (!paragraphs.length) paragraphs.push(editor);
    paragraphs.forEach(paragraph => Object.assign(paragraph.style, styles));
    persistEditor();
  };

  const handleDocInfo = () => {
    setActiveModal('docinfo');
  };

  const reportFileError = (error: unknown) => {
    setChordToast(error instanceof Error ? error.message : '파일을 처리하지 못했습니다.');
  };

  const handleSave = async (saveAs = false) => {
    if (fileOperation.current || !editorRef.current) return;
    fileOperation.current = true;
    try {
      if (!hwpxDocument.current) throw new Error('HWPX 원본 정보가 없습니다. 원본 파일을 다시 열어 주세요.');
      persistEditor();
      const signature = documentSignature();
      const bytes = hwpxDocument.current.save(editorRef.current, settingsRef.current, titleRef.current);
      const result = await fileSession.current.save(bytes, titleRef.current, saveAs);
      if (!result) return;
      setDocTitle(result.name); setDocFilePath('');
      cleanDocument.current = signature;
      setChordToast(result.associated ? 'HWPX 저장 완료' : 'HWPX 파일 다운로드 완료');
      setTimeout(() => setChordToast(null), 2000);
    } catch (error) { reportFileError(error); }
    finally { fileOperation.current = false; }
  };

  const handleOpen = async () => {
    if (fileOperation.current) return;
    fileOperation.current = true;
    try {
      const selected = await fileSession.current.chooseOpen();
      if (!selected) return;
      const bytes = new Uint8Array(await selected.file.arrayBuffer());
      const model = new HwpxDocument(bytes);
      const fragment = model.render(), settings = model.settings();
      if (!confirmReplaceDocument() || !editorRef.current) return;
      // Store the backing package first; failures leave the current document intact.
      let encoded = '';
      for (let offset = 0; offset < bytes.length; offset += 16384) encoded += String.fromCharCode(...bytes.subarray(offset, offset + 16384));
      localStorage.setItem('web_hwp_hwpx_source', btoa(encoded));
      hwpxDocument.current = model;
      editorRef.current.replaceChildren(fragment);
      fileSession.current.associate(selected.handle);
      savedRange.current = null;
      settingsRef.current = settings;
      setPageConfig(settings.page); setPageOrientation(settings.orientation); setColumnCount(settings.columns);
      setDocTitle(selected.file.name); setDocFilePath('');
      persistEditor();
      cleanDocument.current = documentSignature();
      setChordToast('HWPX 문서 열기 완료'); setTimeout(() => setChordToast(null), 2000);
    } catch (error) { reportFileError(error); }
    finally { fileOperation.current = false; }
  };

  const handleNewDoc = () => {
    if (fileOperation.current || !confirmReplaceDocument()) return;
    hwpxDocument.current = new HwpxDocument();
    fileSession.current.reset();
    if (editorRef.current) editorRef.current.innerText = '';
    savedRange.current = null;
    setDocTitle('빈 문서 1'); setDocFilePath('');
    localStorage.removeItem('web_hwp_current_content');
    localStorage.removeItem('web_hwp_current_html');
    localStorage.removeItem('web_hwp_hwpx_source');
    localStorage.removeItem('web_hwp_current_path');
    localStorage.setItem('web_hwp_current_title', '빈 문서 1');
    cleanDocument.current = documentSignature();
  };

  const handleContextMenu = (e: React.MouseEvent) => {
    e.preventDefault();
    setContextMenu({
      x: Math.min(e.clientX, window.innerWidth - 200),
      y: Math.min(e.clientY, window.innerHeight - 320),
      visible: true
    });
  };

  const handleInput = (e: React.FormEvent<HTMLDivElement>) => {
    persistEditor();
    const text = e.currentTarget.innerText;
    setCaret(prev => ({
      ...prev,
      chars: text.length,
      strokes: text.length * 2
    }));
  };

  const insertTableToDoc = () => {
    if (editorRef.current) {
      let tableHtml = `<table border="1" style="border-collapse: collapse; width: 100%; margin: 10px 0; border: 1px solid #333;">`;
      for (let r = 0; r < tableRows; r++) {
        tableHtml += `<tr>`;
        for (let c = 0; c < tableCols; c++) {
          tableHtml += `<td style="padding: 6px; border: 1px solid #ccc; min-height: 20px;">&nbsp;</td>`;
        }
        tableHtml += `</tr>`;
      }
      tableHtml += `</table><p>&nbsp;</p>`;
      insertHtmlToDoc(tableHtml);
    }
    setActiveModal(null);
  };

  const toast = (m: string) => { setChordToast(m); setTimeout(() => setChordToast(null), 1200); };
  const fitDocument = (wholePage: boolean) => {
    const viewport = viewportRef.current;
    if (!viewport) return;
    const widthScale = (viewport.clientWidth - 40) / (paperMmWidth * 96 / 25.4 + 2);
    const heightScale = (viewport.clientHeight - 22) / (paperMmHeight * 96 / 25.4 + 2);
    setZoom(Math.max(25, Math.min(500, Math.floor(100 * (wholePage ? Math.min(widthScale, heightScale) : widthScale)))));
  };
  const referencedActions: Record<string, Partial<Record<string, () => void>>> = {
    '보기': {
      '컬러': () => setViewColor('color'), '회색조': () => setViewColor('grayscale'),
      '그림': () => setShowPictures(value => !value), '상황 선': () => setShowStatus(value => !value),
      '문서 탭': () => setShowDocumentTabs(value => !value),
      '축소': () => setZoom(value => Math.max(25, value - 10)), '확대': () => setZoom(value => Math.min(500, value + 10)),
      '100%': () => setZoom(100), '쪽 맞춤': () => fitDocument(true), '폭 맞춤': () => fitDocument(false),
    },
    '쪽': {
      '편집 용지': () => setActiveModal('page'),
      '세로': () => setPageOrientation('portrait'), '가로': () => setPageOrientation('landscape'),
    },
  };
  const referenceChecked: Record<string, boolean> = { '보기:그림': showPictures, '보기:상황 선': showStatus, '보기:문서 탭': showDocumentTabs };
  const referenceDropdownLabel = MENU_DEF.find(menu => menu.drop === activeDropdown)?.title || '';
  const referenceDropdown = referencedTabs[referenceDropdownLabel]?.dropdown;
  const RIBBON_ACTIONS: { title: string; run: () => void; disabled?: boolean }[] = [
    { title: '오려두기 (Ctrl+X)', run: () => runCommand('cut', null, '오려두기') },
    { title: '복사하기 (Ctrl+C)', run: () => runCommand('copy', null, '복사하기') },
    { title: '붙이기 (Ctrl+V)', run: () => runCommand('paste', null, '붙이기') },
    { title: '모양 복사 (Alt+C)', run: handleCopyFormat },
    { title: '조판 부호 지우기', run: () => { setShowMarks(false); toast('조판 부호 지움'); } },
    { title: '글자 모양 (Alt+L)', run: () => setActiveModal('font') },
    { title: '문단 모양 (Alt+T)', run: () => setActiveModal('paragraph') },
    { title: '스타일 (F6)', run: () => setActiveModal('style') },
    { title: '용지 방향: 세로', run: () => { setPageOrientation('portrait'); toast('용지 방향: 세로'); } },
    { title: '용지 방향: 가로', run: () => { setPageOrientation('landscape'); toast('용지 방향: 가로'); } },
    { title: '쪽 여백 (F7)', run: () => setActiveModal('page') },
    { title: '바탕쪽', run: () => toast('바탕쪽 편집 모드') },
    { title: '단 나누기', run: handleToggleColumns },
    { title: '도형', run: () => handleInsertShape('rect') },
    { title: '그림 (Ctrl+N, I)', run: handleInsertImage },
    { title: '표 (Ctrl+N, T)', run: () => setActiveModal('table') },
    { title: '차트', run: handleInsertChart },
    { title: '개체 선택', run: () => toast('개체 선택 모드') },
    { title: '개체 보호', run: () => toast('개체 보호 설정') },
    { title: '찾기 (Ctrl+F)', run: () => setActiveModal('find') },
    { title: '글자 바꾸기 (Ctrl+H)', run: () => setActiveModal('find') },
    { title: '정렬', run: () => {}, disabled: true },
  ];
  const ribbonNames = ['오려 두기', '복사하기', '붙이기', '모양 복사', '조판 부호 지우기', '글자 모양', '문단 모양', '스타일', '세로', '가로', '쪽 여백', '바탕쪽', '단', '도형', '그림', '표', '차트', '개체 선택', '개체 보호', '찾기', '글자 바꾸기', '정렬'];
  const RIBBON_BOXES = RIBBON_ACTIONS.map((a, i) => ({ ...a, nativeName: ribbonNames[i] }));
  const FMT_ACTIONS: { title: string; run: () => void }[] = [
    { title: '새 문서 (Alt+N)', run: handleNewDoc },
    { title: '불러오기 (Alt+O)', run: handleOpen },
    { title: '저장하기 (Alt+S)', run: () => { void handleSave(); } },
    { title: '인쇄 (Alt+P)', run: () => window.print() },
    { title: '미리 보기', run: () => window.print() },
    { title: '되돌리기 (Ctrl+Z)', run: () => runCommand('undo', null, '되돌리기') },
    { title: '다시 실행 (Ctrl+Y)', run: () => runCommand('redo', null, '다시 실행') },
    { title: '진하게 (Ctrl+B)', run: () => runCommand('bold', null, '진하게') },
    { title: '기울임 (Ctrl+I)', run: () => runCommand('italic', null, '기울임') },
    { title: '밑줄 (Ctrl+U)', run: () => runCommand('underline', null, '밑줄') },
    { title: '취소선', run: () => runCommand('strikeThrough') },
    { title: '양쪽 정렬', run: () => runCommand('justifyFull') },
    { title: '왼쪽 정렬', run: () => runCommand('justifyLeft') },
    { title: '가운데 정렬', run: () => runCommand('justifyCenter') },
    { title: '오른쪽 정렬', run: () => runCommand('justifyRight') },
    { title: '배분 정렬', run: () => applyParagraphStyle({ textAlign: 'justify', textAlignLast: 'justify', textJustify: 'inter-character' }) },
    { title: '나눔 정렬', run: () => applyParagraphStyle({ textAlign: 'justify', textAlignLast: 'justify', textJustify: 'inter-word' }) },
  ];
  const formatNames = ['새 문서', '불러오기', '저장하기', '인쇄', '미리 보기', '되돌리기', '다시 실행', '진하게', '기울임', '밑줄', '취소선', '양쪽 정렬', '왼쪽 정렬', '가운데 정렬', '오른쪽 정렬', '배분 정렬', '나눔 정렬'];
  const FORMAT_BOXES = [
    ...FMT_ACTIONS.map((a, i) => ({ ...a, nativeName: formatNames[i] })),
  ];

  const menus = [
    { name: '파일', hasSub: false },
    { name: '편집', hasSub: true },
    { name: '보기', hasSub: true },
    { name: '입력', hasSub: true },
    { name: '서식', hasSub: true },
    { name: '쪽', hasSub: true },
    { name: '보안', hasSub: true },
    { name: '검토', hasSub: true },
    { name: '도구', hasSub: true }
  ];

  return (
    <div
      onContextMenu={handleContextMenu}
      onPointerDownCapture={event => {
        captureEditorSelection();
        if (activeDropdown && !(event.target as Element).closest('[data-native-dropdown], [data-native-control^="메뉴:"]')) setActiveDropdown(null);
      }}
      style={{
        display: 'flex',
        flexDirection: 'column',
        width: '100%',
        minWidth: '960px',
        height: '100vh',
        minHeight: 0,
        backgroundColor: '#ffffff',
        color: '#222222',
        fontFamily: '"Malgun Gothic", "맑은 고딕", -apple-system, BlinkMacSystemFont, sans-serif',
        userSelect: 'none',
        overflow: 'hidden',
        fontSize: '12px',
        position: 'relative'
      }}
    >
      {/* 2단 조합키 (Chord) 실시간 안내 토스트 */}
      <style>{`
        .document-hide-pictures img { visibility: hidden; }
        .hwp-btn {
          cursor: default;
          box-sizing: border-box;
          border-radius: 0;
          border: 1px solid transparent;
          transition: none;
        }
        .hwp-btn:not(:disabled):hover {
          background-color: rgba(0, 0, 0, 0.0784314) !important;
          border-color: #b4b4b4 !important;
        }
        .hwp-btn:not(:disabled):active {
          background-color: rgba(0, 0, 0, 0.2) !important;
          border-color: #b4b4b4 !important;
        }
        .hwp-btn[data-native-portrait] {
          border: 0;
          border-radius: 0;
          transition: none;
        }
        .hwp-btn[data-native-portrait]:hover,
        .hwp-btn[data-native-portrait]:active {
          background-color: transparent !important;
        }
        .hwp-btn[data-native-portrait]:hover::after {
          content: '';
          position: absolute;
          inset: 0;
          background: url('/hwp_portrait_hover.png') no-repeat;
          pointer-events: none;
        }
        .hwp-btn[data-native-portrait]:active::after {
          background-image: url('/hwp_portrait_pressed.png');
        }
      `}</style>
      {chordToast && (
        <div style={{
          position: 'fixed',
          top: '40px',
          left: '50%',
          transform: 'translateX(-50%)',
          backgroundColor: '#0078d7',
          color: '#ffffff',
          padding: '6px 16px',
          borderRadius: '4px',
          boxShadow: '0 4px 12px rgba(0,0,0,0.2)',
          fontSize: '12px',
          fontWeight: 'bold',
          zIndex: 99999
        }}>
          ⌨️ {chordToast}
        </div>
      )}

      {/* 1. 최상단 타이틀바 (26px) */}
      {!isStandalone && (
        <div style={{ height: '32px', width: '100%', minWidth: '960px', backgroundColor: '#ffffff', flexShrink: 0, position: 'relative', overflow: 'hidden' }}>
          <Slice src="/hwp_native_title.png" h={32} rightW={272} /><div className="hwp-brand" aria-label="Web HWP REA">ㅎ</div>
          <div style={{ position: 'absolute', left: 32, right: 272, top: 1, height: 30, background: 'white', textAlign: 'center', lineHeight: '30px', pointerEvents: 'none' }}>{docTitle} - 한글</div>
          {[['로그인', 1800, 44, () => toast('로그인')], ['최소화', 1848, 20, () => toast('최소화 (브라우저 창 사용)')], ['최대화', 1873, 20, () => { if (document.fullscreenElement) document.exitFullscreen(); else document.documentElement.requestFullscreen?.(); }], ['닫기', 1897, 19, () => toast('닫기: 브라우저 탭을 닫아 주세요')]].map(([t, x, w, f]: any) => (
            <div key={t} className="hwp-btn" style={{ position: 'absolute', top: 0, right: 1916 - x - w, width: w, height: 26 }} onMouseDown={(e) => e.preventDefault()} onClick={f} title={t} />
          ))}
        </div>
      )}

      {/* 2. 메인 메뉴바 (32px, 실제 한글 네이티브 슬라이스 1:1 일치) */}
      <div style={{
        height: '34px',
        width: '100%', minWidth: '960px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'visible',
        flexShrink: 0,
        zIndex: 50
      }}>
        <Slice src={referencedTabs[activeMenu]?.menuAsset || (activeMenu === '입력' ? '/hwp_native_insert_menu.png' : activeMenu === '서식' ? '/hwp_native_format_menu.png' : '/hwp_native_menu.png')} h={34} rightW={272} />
        {/* Native UIA bounds; label and dropdown arrow have separate actions. */}
        {MENU_BOXES.map((m) => (
          <div key={m.key} data-native-control={`메뉴:${m.title}`} style={controlStyle('메뉴', m.title, 32)}>
            <button className="hwp-btn" title={m.title} aria-pressed={m.title !== '파일' && activeMenu === m.title}
              style={{ position: 'absolute', top: 0, left: 0, width: m.w - (m.title === '파일' ? 0 : 18), height: 28, padding: 0, background: 'transparent' }}
              onMouseDown={e => e.preventDefault()}
              onClick={() => {
                if (m.title === '파일') setActiveDropdown(activeDropdown === 'file' ? null : 'file');
                else { setActiveMenu(m.title); setActiveDropdown(null); }
              }} />
            {m.title !== '파일' && <button className="hwp-btn" title={`${m.title} 메뉴 펼치기`} aria-expanded={activeDropdown === m.drop}
              style={{ position: 'absolute', top: 0, left: m.w - 18, width: 18, height: 28, padding: 0, background: 'transparent' }}
              onMouseDown={e => e.preventDefault()}
              onClick={() => { if (m.drop) setActiveDropdown(activeDropdown === m.drop ? null : m.drop); }} />}
          </div>
        ))}

        {/* 네이티브 드롭다운 메뉴 레이어 */}
        {activeDropdown && referenceDropdown && <ReferenceDropdown menu={referenceDropdown} label={referenceDropdownLabel}
          onClose={() => setActiveDropdown(null)} onCommand={name => window.alert(`${name} 기능은 아직 지원하지 않습니다.`)} />}
        {activeDropdown && !referenceDropdown && (
          <div
            data-native-dropdown={activeDropdown}
            style={{
              position: 'absolute',
              top: '32px',
              left: `${(MENU_BOXES.find(m => m.drop === activeDropdown) || MENU_BOXES[0]).x}px`,
              backgroundColor: '#ffffff',
              border: '1px solid #7ba4ff',
              boxShadow: '2px 4px 12px rgba(0,0,0,0.18)',
              padding: '4px 0',
              minWidth: '190px',
              zIndex: 9999,
              fontFamily: '"Malgun Gothic", "맑은 고딕", sans-serif',
              fontSize: '11.5px'
            }}
            onClick={(e) => e.stopPropagation()}
          >
            {activeDropdown === 'file' && (
              <>
                <ContextMenuItem label="새 문서" shortcut="Alt+N" onClick={() => { handleNewDoc(); setActiveDropdown(null); }} />
                <ContextMenuItem label="문서마당..." shortcut="Ctrl+Alt+N" onClick={() => { setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="불러오기..." shortcut="Ctrl+O" onClick={() => { handleOpen(); setActiveDropdown(null); }} />
                <ContextMenuItem label="최근 문서" />
                <ContextMenuDivider />
                <ContextMenuItem label="저장하기" shortcut="Ctrl+S" onClick={() => { handleSave(); setActiveDropdown(null); }} />
                <ContextMenuItem label="다른 이름으로 저장하기..." shortcut="Alt+V" onClick={() => { void handleSave(true); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="인쇄..." shortcut="Ctrl+P" onClick={() => { window.print(); setActiveDropdown(null); }} />
                <ContextMenuItem label="미리 보기" onClick={() => { window.print(); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="문서 정보..." shortcut="Ctrl+Q, I" onClick={() => { handleDocInfo(); setActiveDropdown(null); }} />
                <ContextMenuItem label="끝내기" shortcut="Alt+X" onClick={() => { setActiveDropdown(null); }} />
              </>
            )}
            {activeDropdown === 'edit' && (
              <>
                <ContextMenuItem label="되돌리기" shortcut="Ctrl+Z" onClick={() => { runCommand('undo', null, '되돌리기'); setActiveDropdown(null); }} />
                <ContextMenuItem label="다시 실행" shortcut="Ctrl+Y" onClick={() => { runCommand('redo', null, '다시 실행'); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="오려두기" shortcut="Ctrl+X" onClick={() => { runCommand('cut', null, '오려두기'); setActiveDropdown(null); }} />
                <ContextMenuItem label="복사하기" shortcut="Ctrl+C" onClick={() => { runCommand('copy', null, '복사하기'); setActiveDropdown(null); }} />
                <ContextMenuItem label="붙이기" shortcut="Ctrl+V" onClick={() => { runCommand('paste', null, '붙이기'); setActiveDropdown(null); }} />
                <ContextMenuItem label="모양 복사" shortcut="Alt+C" onClick={() => { handleCopyFormat(); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="모두 선택" shortcut="Ctrl+A" onClick={() => { runCommand('selectAll', null, '모두 선택'); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="찾기" shortcut="Ctrl+F" onClick={() => { setActiveModal('find'); setActiveDropdown(null); }} />
                <ContextMenuItem label="바꾸기" shortcut="Ctrl+H" onClick={() => { setActiveModal('find'); setActiveDropdown(null); }} />
              </>
            )}
            {activeDropdown === 'view' && (
              <>
                <ContextMenuItem label={`조판 부호 [${showMarks ? '✓' : ' '}]`} shortcut="Ctrl+G, C" onClick={() => { setShowMarks(!showMarks); setActiveDropdown(null); }} />
                <ContextMenuItem label="문단 부호" shortcut="Ctrl+G, T" onClick={() => { setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="화면 확대 100%" onClick={() => { setZoom(100); setActiveDropdown(null); }} />
                <ContextMenuItem label="화면 확대 125%" onClick={() => { setZoom(125); setActiveDropdown(null); }} />
                <ContextMenuItem label="화면 확대 150%" onClick={() => { setZoom(150); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="쪽 맞춤" onClick={() => { setZoom(100); setActiveDropdown(null); }} />
                <ContextMenuItem label="폭 맞춤" onClick={() => { setZoom(120); setActiveDropdown(null); }} />
              </>
            )}
            {activeDropdown === 'insert' && (
              <>
                <ContextMenuItem label="표 만들기..." shortcut="Ctrl+N, T" onClick={() => { setActiveModal('table'); setActiveDropdown(null); }} />
                <ContextMenuItem label="수식..." shortcut="Ctrl+N, M" onClick={() => { setActiveModal('equation'); setActiveDropdown(null); }} />
                <ContextMenuItem label="문자표..." shortcut="Ctrl+F10" onClick={() => { setActiveModal('charmap'); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="그림..." shortcut="Ctrl+N, I" onClick={() => { handleInsertImage(); setActiveDropdown(null); }} />
                <ContextMenuItem label="차트..." onClick={() => { handleInsertChart(); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="글상자" onClick={() => { handleInsertShape('textbox'); setActiveDropdown(null); }} />
                <ContextMenuItem label="직사각형" onClick={() => { handleInsertShape('rect'); setActiveDropdown(null); }} />
                <ContextMenuItem label="타원" onClick={() => { handleInsertShape('circle'); setActiveDropdown(null); }} />
              </>
            )}
            {activeDropdown === 'format' && (
              <>
                <ContextMenuItem label="글자 모양..." shortcut="Alt+L" onClick={() => { setActiveModal('font'); setActiveDropdown(null); }} />
                <ContextMenuItem label="문단 모양..." shortcut="Alt+T" onClick={() => { setActiveModal('paragraph'); setActiveDropdown(null); }} />
                <ContextMenuItem label="스타일..." shortcut="F6" onClick={() => { setActiveModal('style'); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="진하게" shortcut="Ctrl+B" onClick={() => { runCommand('bold', null, '진하게'); setActiveDropdown(null); }} />
                <ContextMenuItem label="기울임" shortcut="Ctrl+I" onClick={() => { runCommand('italic', null, '기울임'); setActiveDropdown(null); }} />
                <ContextMenuItem label="밑줄" shortcut="Ctrl+U" onClick={() => { runCommand('underline', null, '밑줄'); setActiveDropdown(null); }} />
                <ContextMenuItem label="취소선" onClick={() => { runCommand('strikeThrough', null, '취소선'); setActiveDropdown(null); }} />
              </>
            )}
            {activeDropdown === 'page' && (
              <>
                <ContextMenuItem label="편집 용지..." shortcut="F7" onClick={() => { setActiveModal('page'); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label={`용지 방향: ${pageOrientation === 'portrait' ? '세로 [✓]' : '세로'}`} onClick={() => { setPageOrientation('portrait'); setActiveDropdown(null); }} />
                <ContextMenuItem label={`용지 방향: ${pageOrientation === 'landscape' ? '가로 [✓]' : '가로'}`} onClick={() => { setPageOrientation('landscape'); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label={`1단 [${columnCount === 1 ? '✓' : ' '}]`} onClick={() => { setColumnCount(1); setActiveDropdown(null); }} />
                <ContextMenuItem label={`2단 [${columnCount === 2 ? '✓' : ' '}]`} onClick={() => { setColumnCount(2); setActiveDropdown(null); }} />
                <ContextMenuItem label={`3단 [${columnCount === 3 ? '✓' : ' '}]`} onClick={() => { setColumnCount(3); setActiveDropdown(null); }} />
              </>
            )}
          </div>
        )}
      </div>

      {/* 3. 리본 툴바 (83px, 21개 도구 실측 1:1 정렬) */}
      <div style={{
        height: '84px',
        width: '100%', minWidth: '960px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'hidden',
        flexShrink: 0
      }}>
        <Slice src={referencedTabs[activeMenu]?.ribbonAsset || (activeMenu === '입력' ? '/hwp_native_insert.png' : activeMenu === '서식' ? '/hwp_native_format_ribbon.png' : '/hwp_native_ribbon.png')} h={84} />
        {/* 리본(편집 탭) 20개 도구: 슬라이스 실측 구간 */}
        {activeMenu === '편집' && RIBBON_BOXES.map((r) => (
          <button key={r.title} className="hwp-btn" type="button" disabled={r.disabled} data-native-control={`편집:${r.nativeName}`}
            data-native-portrait={r.title === '용지 방향: 세로' && pageOrientation === 'portrait' ? '' : undefined}
            style={controlStyle('편집', r.nativeName, 66)}
            onMouseDown={(e) => e.preventDefault()} onClick={r.run} title={r.title} />
        ))}
        {referencedTabs[activeMenu]?.controls.map(control => {
          const action = referencedActions[activeMenu]?.[control.name];
          const key = `${activeMenu}:${control.name}`;
          const checked = referenceChecked[key];
          return <button key={control.name} type="button" className={control.type === 'CheckBox' ? 'native-ribbon-checkbox' : 'hwp-btn'}
            data-native-control={key} data-command-status={!control.enabled ? 'native-disabled' : action ? 'connected' : 'unavailable'}
            role={control.type === 'CheckBox' ? 'checkbox' : undefined} aria-checked={control.type === 'CheckBox' ? checked : undefined}
            title={control.name} aria-description={control.enabled && !action ? '현재 지원하지 않는 기능' : undefined}
            disabled={!control.enabled}
            style={{ position: 'absolute', left: control.x, top: control.y - 66, width: control.w, height: control.h, padding: 0, background: 'transparent', ...(control.type === 'CheckBox' ? { border: 0 } : {}) }}
            onMouseDown={event => event.preventDefault()}
            onClick={() => { if (action) action(); else window.alert(`${control.name} 기능은 아직 지원하지 않습니다.`); }}>
            {checked === false && <span aria-hidden="true" style={{ position: 'absolute', left: 0, top: 3, width: 14, height: 14, background: 'white', border: '1px solid #d4d4d4', boxSizing: 'border-box' }} />}
          </button>;
        })}
        {activeMenu === '서식' && [
          { title: '글자 모양 (Alt+L)', x: 472, w: 48, run: () => setActiveModal('font') },
          { title: '문단 모양 (Alt+T)', x: 879, w: 49, run: () => setActiveModal('paragraph') },
          { title: '양쪽 정렬', x: 942, w: 41, run: () => runCommand('justifyFull', null, '양쪽 정렬') },
          { title: '바탕글 적용', x: 19, w: 194, run: () => runCommand('formatBlock', 'P', '바탕글') },
          { title: '개요 1 적용', x: 19, w: 194, run: () => runCommand('formatBlock', 'H1', '개요 1'), top: 48 }
        ].map(r => <button key={r.title} className="hwp-btn" title={r.title}
          style={{ position: 'absolute', top: r.top || 5, left: r.x, width: r.w, height: r.x === 19 ? 37 : 76, padding: 0, background: 'transparent' }}
          onMouseDown={e => e.preventDefault()} onClick={r.run} />)}
        {activeMenu === '입력' && [
          { title: '그림 (Ctrl+N, I)', x: 160, w: 37, run: handleInsertImage },
          { title: '표 (Ctrl+N, T)', x: 198, w: 37, run: () => setActiveModal('table') },
          { title: '차트', x: 236, w: 37, run: handleInsertChart },
          { title: '글맵시', x: 274, w: 41, run: () => handleInsertShape('textbox') },
          { title: '수식 (Ctrl+N, M)', x: 316, w: 42, run: openEquation },
          { title: '문자표 (Ctrl+F10)', x: 903, w: 41, run: () => setActiveModal('charmap') }
        ].map(r => <button key={r.title} className="hwp-btn" title={r.title}
          style={{ position: 'absolute', top: 5, left: r.x, width: r.w, height: 76, padding: 0, background: 'transparent' }}
          onMouseDown={e => e.preventDefault()} onClick={r.run} />)}
      </div>

      {/* 4. 빠른 서식 툴바 (37px, 4개 콤보박스 및 빠른 버튼 1:1 정밀 일치) */}
      <div style={{
        height: '36px',
        width: '100%', minWidth: '960px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'hidden',
        flexShrink: 0
      }}>
        <Slice src="/hwp_native_format.png" h={36} />
        {FORMAT_BOXES.map((f) => (
          <button key={f.title} type="button" className="hwp-btn" data-native-control={`빠른 서식:${f.nativeName}`} style={controlStyle('빠른 서식', f.nativeName, 150)}
            onMouseDown={(e) => e.preventDefault()} onClick={f.run} title={f.title} />
        ))}
        <ToolbarCombo title="스타일" initial="바탕글" bounds={controlStyle('빠른 서식', '스타일', 150)}
          onChange={value => runCommand('formatBlock', value === '개요 1' ? 'H1' : value === '개요 2' ? 'H2' : 'P')}>
          <option>바탕글</option><option>본문</option><option>개요 1</option><option>개요 2</option>
        </ToolbarCombo>
        <ToolbarCombo title="언어" initial="대표" bounds={controlStyle('빠른 서식', '언어', 150)}>
          <option>대표</option><option>한글</option><option>영문</option><option>한자</option><option>일어</option><option>기타</option><option>기호</option><option>사용자</option>
        </ToolbarCombo>
        <ToolbarCombo title="글꼴" initial="함초롬바탕" bounds={controlStyle('빠른 서식', '함초롬바탕', 150)}
          onChange={value => runCommand('fontName', value)}>
          <option>함초롬바탕</option><option>함초롬돋움</option><option>맑은 고딕</option><option>바탕</option><option>궁서</option>
        </ToolbarCombo>
        <ToolbarCombo title="글자 크기" initial="10" bounds={controlStyle('빠른 서식', '글자 크기', 150)} onChange={value => {
          focusEditor(); document.execCommand('fontSize', false, '7');
          editorRef.current?.querySelectorAll('font[size="7"]').forEach(element => {
            element.removeAttribute('size'); (element as HTMLElement).style.fontSize = `${Number(value)}pt`;
          });
          persistEditor();
        }}>
          {[8,9,10,11,12,14,16,18,20,24,28,36,48,72].map(size => <option key={size} value={size}>{size.toFixed(1)}</option>)}
        </ToolbarCombo>
        <div className="hwp-btn" data-native-control="빠른 서식:글자 색" style={controlStyle('빠른 서식', '글자 색', 150)} title="글자 색">
          <input type="color" defaultValue="#ff0000" onChange={(e) => runCommand('foreColor', e.target.value, '글자 색 적용')}
            style={{ position: 'absolute', top: 0, left: 0, width: '100%', height: '100%', opacity: 0, cursor: 'default' }} />
        </div>
        <input type="number" title="줄 간격" aria-label="빠른 서식 줄 간격" data-native-control="빠른 서식:줄 간격" min={50} max={500} step={10} value={lineSpacingDraft}
          style={{ ...controlStyle('빠른 서식', '줄 간격', 150), boxSizing: 'border-box', background: 'white', border: '1px solid #d4d4d4', color: '#222', font: '12px Malgun Gothic, sans-serif', paddingLeft: 6 }}
          onChange={event => setLineSpacingDraft(event.target.value)}
          onKeyDown={event => { if (event.key === 'Enter') { event.preventDefault(); event.stopPropagation(); event.currentTarget.blur(); } }}
          onBlur={event => {
            const value = Number(event.target.value);
            if (value < 50 || value > 500) { setLineSpacingDraft(String(paraConfig.lineHeight)); return; }
            applyParagraphStyle({ lineHeight: String(value / 100) }, false);
            setParaConfig(config => ({ ...config, lineHeight: value }));
          }} />
        <span aria-hidden="true" style={{ position: 'absolute', left: 1206, top: 9, color: '#0078d7', fontSize: 11, pointerEvents: 'none' }}>%</span>
      </div>

      {/* 5. 가로 눈금자 (41px, 1916px 1:1 일치) */}
      <div style={{
        height: '28px',
        width: '100%', minWidth: '960px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'hidden',
        flexShrink: 0
      }}>
        <div style={{ position: 'absolute', inset: 0, background: '#f5f5f5', borderTop: '1px solid #ddd' }} />
        <div data-testid="horizontal-ruler" style={{ position: 'absolute', left: 28 + paperLeft - 1 - scrollPosition.x, top: zoom === 110 ? -1 : 0,
          width: zoom === 110 ? 882 : 800, height: 28, backgroundImage: zoom === 110 ? 'url(/hwp_native_ruler_110.png)' : 'url(/hwp_native_ruler_scale.png)',
          transform: zoom === 100 || zoom === 110 ? 'none' : `scaleX(${documentScale})`, transformOrigin: 'left top' }} />
        <div style={{ position: 'absolute', left: 1, top: 0, width: 28, height: 28, backgroundImage: 'url(/hwp_native_ruler_tab.png)' }} />
      </div>

      {/* 6. 중앙 워크스페이스 (668px, 종이 x=563px 1:1 절대 일치) */}
      <div style={{
        flex: 1,
        minHeight: 0,
        width: '100%',
        minWidth: '960px',
        display: 'flex',
        backgroundColor: '#f5f5f5',
        position: 'relative',
        overflow: 'visible'
      }}>
        {/* 세로 눈금자 및 사이드바 (실제 한글 네이티브 30x668 슬라이스) */}
        <div style={{
          width: '28px',
          backgroundColor: '#f5f5f5',
          backgroundImage: zoom === 110 ? 'url(/hwp_native_left_ruler_110.png)' : 'url(/hwp_native_left_ruler.png)',
          backgroundRepeat: 'no-repeat',
          backgroundPosition: `0px -${scrollPosition.y}px`,
          flexShrink: 0
        }} />

        <div ref={viewportRef} id="document-viewport" className={`document-viewport${showPictures ? '' : ' document-hide-pictures'}`}
          onScroll={event => setScrollPosition({ x: event.currentTarget.scrollLeft, y: event.currentTarget.scrollTop })}>
          <div aria-hidden="true" style={{ height: ((pageOrientation === 'portrait' ? pageConfig.height : pageConfig.width) * 96 / 25.4 + 2) * documentScale + 71,
            minWidth: ((pageOrientation === 'portrait' ? pageConfig.width : pageConfig.height) * 96 / 25.4 + 2) * documentScale + 40, pointerEvents: 'none' }} />
          <div data-testid="document-paper" style={{
            filter: viewColor === 'grayscale' ? 'grayscale(1)' : undefined,
            position: 'absolute',
            left: paperLeft,
            top: '11px',
            width: paperScreenWidth,
            minHeight: `${(paperMmHeight * 96 / 25.4 + 2) * documentScale}px`,
            backgroundColor: '#ffffff',
            border: '1px solid #ababab',
            boxSizing: 'border-box',
            transition: 'none'
          }}>
            <div style={{ position: 'absolute', left: 0, top: 0, width: (paperScreenWidth - 2) / documentScale, minHeight: paperMmHeight * 96 / 25.4, transform: `scale(${documentScale})`, transformOrigin: 'top left' }}>
            {/* L자 여백 가이드마커 (실측 offset left: 115px, top: 114px) */}
            <svg style={{ position: 'absolute', top: `${(pageConfig.top + pageConfig.header) * 96 / 25.4 - 19}px`, left: `${pageConfig.left * 96 / 25.4 - 19}px`, width: '20px', height: '20px' }}>
              <path d="M0 19 H19 V0" stroke="#cccccc" strokeWidth="1" fill="none" />
            </svg>
            <svg style={{ position: 'absolute', top: `${(pageConfig.top + pageConfig.header) * 96 / 25.4 - 19}px`, right: `${pageConfig.right * 96 / 25.4 - 19}px`, width: '20px', height: '20px' }}>
              <path d="M0 0 V19 H19" stroke="#cccccc" strokeWidth="1" fill="none" />
            </svg>
            <svg style={{ position: 'absolute', bottom: '114px', left: `${pageConfig.left * 96 / 25.4}px`, width: '16px', height: '16px' }}>
              <path d="M0 16 L0 0 M0 16 L16 16" stroke="#cccccc" strokeWidth="1" fill="none" />
            </svg>
            <svg style={{ position: 'absolute', bottom: '114px', right: `${pageConfig.right * 96 / 25.4}px`, width: '16px', height: '16px' }}>
              <path d="M16 16 L16 0 M16 16 L0 16" stroke="#cccccc" strokeWidth="1" fill="none" />
            </svg>

            {/* 본문 에디터 */}
            <div
              ref={editorRef}
              contentEditable
              suppressContentEditableWarning
              onInput={handleInput}
              onDoubleClick={(e) => {
                const object = (e.target as Element).closest<HTMLElement>('[data-hwp-equation]');
                if (object && editorRef.current?.contains(object)) {
                  editedEquation.current = object;
                  setEqScript(object.dataset.hwpEquation || '');
                  setEqFontSize(Number(object.dataset.hwpEquationSize) || 11);
                  setActiveModal('equation');
                }
              }}
              style={{
                position: 'absolute',
                top: `${(pageConfig.top + pageConfig.header) * 96 / 25.4}px`,
                left: `${pageConfig.left * 96 / 25.4}px`,
                right: `${pageConfig.right * 96 / 25.4}px`,
                minHeight: pageOrientation === 'portrait' ? '895px' : '566px',
                outline: 'none',
                fontFamily: '"Batang", "함초롬바탕", serif',
                fontSize: '13.33px',
                lineHeight: '1.6',
                color: '#111827',
                whiteSpace: 'pre-wrap',
                wordBreak: 'break-all',
                cursor: 'text',
                userSelect: 'text',
                columnCount: columnCount,
                columnGap: '28px',
                columnRule: columnCount > 1 ? '1px dashed #dcdcdc' : 'none'
              }}
            />
            </div>
          </div>
        </div>

        <div aria-hidden="true" style={{ width: 13, flexShrink: 0 }} />
        <DocumentScrollBar target={viewportRef} />
      </div>

      {/* 7. 최하단 상태표시줄 & 탭바 (31px, 실제 한글 네이티브 슬라이스 1:1 일치) */}
      <div style={{
        height: showStatus ? '53px' : '29px',
        width: '100%', minWidth: '960px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'hidden',
        flexShrink: 0
      }}>
        <div style={{ position: 'absolute', top: 0, height: 29, left: 0, right: 0, background: '#f5f5f5', borderTop: '1px solid #d4d4d4' }}>
          <div data-testid="document-tabs" style={{ display: showDocumentTabs ? undefined : 'none', position: 'absolute', left: 0, top: 0, width: 272, height: 28 }}>
            <div style={{ position: 'absolute', left: 0, width: 272, height: 28, backgroundImage: 'url(/hwp_native_tabs_max.png)', backgroundPosition: '0 -1px' }} />
            <button title="현재 문서" aria-label={docTitle} onClick={focusEditor} style={{ position: 'absolute', top: 1, left: 145, width: 94, height: 26, border: 0, background: docTitle === '빈 문서 1' ? 'transparent' : 'white', fontSize: 11, color: '#111', cursor: 'default', overflow: 'hidden', whiteSpace: 'nowrap' }}>{docTitle === '빈 문서 1' ? null : docTitle}</button>
            <button title="새 문서 탭" onClick={handleNewDoc} style={{ position: 'absolute', top: 1, left: 239, width: 33, height: 26, border: 0, background: 'transparent', cursor: 'default' }} />
          </div>
          <div style={{ position: 'absolute', left: 'calc(50% - 13px)', right: 0, height: 28, background: '#f5f5f5', borderLeft: '3px double #d4d4d4', boxSizing: 'border-box' }}>
            <DocumentScrollBar target={viewportRef} horizontal />
          </div>
        </div>
        <div data-testid="document-status" style={{ display: showStatus ? undefined : 'none', position: 'absolute', top: 29, height: 24, left: 0, right: 0, background: 'white' }}>
          <Slice src="/hwp_native_status_max.png" h={24} rightW={330} />
          {caret.chars > 0 && <span style={{ position: 'absolute', left: 174, top: 1, width: 44, height: 22, lineHeight: '22px', background: 'white', fontSize: 11 }}>{caret.chars}글자</span>}
          <div className="document-zoom"><input aria-label="화면 배율" type="number" min={25} max={500} step={5} value={zoom}
            onChange={event => { const value = Number(event.target.value); if (value >= 25 && value <= 500) setZoom(value); }} /><label>%</label></div>
          <input className="native-zoom-slider" aria-label="화면 배율 슬라이더" type="range" min={25} max={500} step={5} value={zoom}
            onChange={event => setZoom(Number(event.target.value))}
            style={{ position: 'absolute', right: 96, top: 3, width: 88, height: 16, cursor: 'default' }} />
        </div>
      </div>

      {/* 9. 우클릭 컨텍스트 메뉴 (한글 빈문서 네이티브 메뉴 100% 일치) */}
      {contextMenu.visible && (
        <div
          onClick={(e) => e.stopPropagation()}
          style={{
            position: 'fixed',
            top: `${contextMenu.y}px`,
            left: `${contextMenu.x}px`,
            width: '211px',
            height: '354px',
            backgroundColor: '#ffffff',
            boxShadow: '2px 4px 12px rgba(0,0,0,0.22)',
            zIndex: 9999,
            userSelect: 'none',
            overflow: 'hidden'
          }}
        >
          <img
            src="/hwp_context_menu_exact.png"
            alt="한글 우클릭 메뉴"
            style={{ width: '211px', height: '354px', display: 'block', pointerEvents: 'none' }}
          />

          {/* 항목별 투명 클릭 액션 히트박스 매핑 */}
          {/* 1. 붙이기(P) Ctrl+V */}
          <div
            style={{ position: 'absolute', top: '1px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => { document.execCommand('paste'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="붙이기 (Ctrl+V)"
          />
          {/* 2. 문자표(C)... Ctrl+F10 */}
          <div
            style={{ position: 'absolute', top: '27px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => { setActiveModal('charmap'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="문자표 (Ctrl+F10)"
          />
          {/* 3. 인쇄(R)... Alt+P */}
          <div
            style={{ position: 'absolute', top: '56px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => { window.print(); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="인쇄 (Alt+P)"
          />
          {/* 4. 글자 모양(L)... Alt+L */}
          <div
            style={{ position: 'absolute', top: '85px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => { setActiveModal('font'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="글자 모양 (Alt+L)"
          />
          {/* 5. 문단 모양(M)... Alt+T */}
          <div
            style={{ position: 'absolute', top: '111px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => { setActiveModal('paragraph'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="문단 모양 (Alt+T)"
          />
          {/* 6. 스타일(S)... F6 */}
          <div
            style={{ position: 'absolute', top: '137px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => { setActiveModal('style'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="스타일 (F6)"
          />
          {/* 7. 글머리표 및 문단 번호(N)... */}
          <div
            style={{ position: 'absolute', top: '163px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => {
              document.execCommand('insertUnorderedList');
              setContextMenu(prev => ({ ...prev, visible: false }));
            }}
            title="글머리표 및 문단 번호"
          />
          {/* 8. 하이퍼링크(Y)... Ctrl+K,H */}
          <div
            style={{ position: 'absolute', top: '192px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => {
              const url = prompt('하이퍼링크 URL을 입력하세요:', 'https://');
              if (url) document.execCommand('createLink', false, url);
              setContextMenu(prev => ({ ...prev, visible: false }));
            }}
            title="하이퍼링크"
          />
          {/* 9. 새 메모(T) */}
          <div
            style={{ position: 'absolute', top: '218px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => { alert('새 메모'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="새 메모"
          />
          {/* 10. 채우기(I) */}
          <div
            style={{ position: 'absolute', top: '244px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => { setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="채우기"
          />
          {/* 11. 교정 부호 넣기(V) */}
          <div
            style={{ position: 'absolute', top: '270px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => { setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="교정 부호 넣기"
          />
          {/* 12. 개인 정보 보호(A) */}
          <div
            style={{ position: 'absolute', top: '296px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => { setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="개인 정보 보호"
          />
          {/* 13. 번역(B) */}
          <div
            style={{ position: 'absolute', top: '325px', left: 0, width: '100%', height: '26px', cursor: 'default' }}
            onClick={() => { alert('번역 실행'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="번역"
          />
        </div>
      )}

      {activeModal === 'equation' && <EquationEditor source={eqScript} onChange={setEqScript}
        fontSize={eqFontSize} onFontSize={setEqFontSize} onApply={insertEquationToDoc} onClose={() => setActiveModal(null)} />}

      {/* 11. 표 만들기 모달 (Ctrl+N,T) - 한글 네이티브 대화상자 440x315 100% 일치 */}
      {activeModal === 'table' && (
        <div style={{
          position: 'fixed',
          top: 0, left: 0, right: 0, bottom: 0,
          backgroundColor: 'rgba(0,0,0,0.18)',
          display: 'flex', alignItems: 'center', justifyContent: 'center',
          zIndex: 10000
        }}>
          <div style={{
            position: 'relative',
            width: '440px',
            height: '315px',
            boxShadow: '0 8px 24px rgba(0,0,0,0.25)',
            userSelect: 'none'
          }}>
            <img
              src="/hwp_table_dialog_native.png"
              alt="표 만들기 대화상자"
              style={{ width: '440px', height: '315px', display: 'block', pointerEvents: 'none' }}
            />

            {/* 1. 상단 닫기 버튼 [X] */}
            <div
              style={{ position: 'absolute', top: '2px', right: '3px', width: '24px', height: '24px', cursor: 'default' }}
              onClick={() => setActiveModal(null)}
              title="닫기 (ESC)"
            />

            {/* 2. 줄 개수 입력 필드 */}
            <input
              type="number" aria-label="표 줄 개수"
              min="1"
              max="100"
              value={tableRows}
              onChange={(e) => setTableRows(Math.max(1, Number(e.target.value)))}
              style={{
                position: 'absolute', top: '78px', left: '86px', width: '70px', height: '21px',
                border: 'none', outline: 'none', background: 'transparent',
                fontSize: '12px', paddingLeft: '6px', textAlign: 'left', fontFamily: '"Malgun Gothic", sans-serif'
              }}
            />
            {/* 줄 개수 스핀 위/아래 버튼 */}
            <div
              style={{ position: 'absolute', top: '78px', left: '158px', width: '16px', height: '11px', cursor: 'default' }}
              onClick={() => setTableRows(r => r + 1)}
              title="줄 수 증가"
            />
            <div
              style={{ position: 'absolute', top: '89px', left: '158px', width: '16px', height: '11px', cursor: 'default' }}
              onClick={() => setTableRows(r => Math.max(1, r - 1))}
              title="줄 수 감소"
            />

            {/* 3. 칸 개수 입력 필드 */}
            <input
              type="number" aria-label="표 칸 개수"
              min="1"
              max="100"
              value={tableCols}
              onChange={(e) => setTableCols(Math.max(1, Number(e.target.value)))}
              style={{
                position: 'absolute', top: '108px', left: '86px', width: '70px', height: '21px',
                border: 'none', outline: 'none', background: 'transparent',
                fontSize: '12px', paddingLeft: '6px', textAlign: 'left', fontFamily: '"Malgun Gothic", sans-serif'
              }}
            />
            {/* 칸 개수 스핀 위/아래 버튼 */}
            <div
              style={{ position: 'absolute', top: '108px', left: '158px', width: '16px', height: '11px', cursor: 'default' }}
              onClick={() => setTableCols(c => c + 1)}
              title="칸 수 증가"
            />
            <div
              style={{ position: 'absolute', top: '119px', left: '158px', width: '16px', height: '11px', cursor: 'default' }}
              onClick={() => setTableCols(c => Math.max(1, c - 1))}
              title="칸 수 감소"
            />

            {/* 4. 만들기(D) 버튼 히트박스 */}
            <div
              style={{ position: 'absolute', top: '42px', left: '346px', width: '81px', height: '28px', cursor: 'default' }}
              onClick={insertTableToDoc}
              title="만들기 (Enter)"
            />

            {/* 5. 취소 버튼 히트박스 */}
            <div
              style={{ position: 'absolute', top: '76px', left: '346px', width: '81px', height: '28px', cursor: 'default' }}
              onClick={() => setActiveModal(null)}
              title="취소 (ESC)"
            />

            {/* 6. 표마당(A) */}
            <div
              style={{ position: 'absolute', top: '124px', left: '346px', width: '81px', height: '28px', cursor: 'default' }}
              onClick={() => alert('표마당(A)')}
              title="표마당"
            />

            {/* 7. 표속성(P) */}
            <div
              style={{ position: 'absolute', top: '158px', left: '346px', width: '81px', height: '28px', cursor: 'default' }}
              onClick={() => alert('표속성(P)')}
              title="표속성"
            />
          </div>
        </div>
      )}

      {/* 12. 문자표 모달 (Ctrl+F10) */}
      {activeModal === 'charmap' && (
        <ModalWrapper title="문자표 (Ctrl+F10)" onClose={() => setActiveModal(null)} width="460px" height="380px">
          <div style={{ padding: '12px', display: 'flex', flexDirection: 'column', height: '100%', boxSizing: 'border-box' }}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '8px' }}>
              <span style={{ fontSize: '11px', color: '#555' }}>문자 영역: 사용자 문자표 / 특수기호</span>
              <span style={{ fontSize: '11px', fontWeight: 'bold', color: '#0078d7' }}>선택된 문자: {selectedChar}</span>
            </div>
            <div style={{
              flex: 1,
              border: '1px solid #ccc',
              backgroundColor: '#fff',
              overflowY: 'auto',
              display: 'grid',
              gridTemplateColumns: 'repeat(12, 1fr)',
              gap: '1px',
              padding: '4px',
              userSelect: 'none'
            }}>
              {[
                '※', '★', '☆', '◆', '◇', '○', '●', '◎', '△', '▲', '▽', '▼',
                '→', '←', '↑', '↓', '↔', '↕', '≪', '≫', '℃', '℉', '№', '℡',
                'Ⅰ', 'Ⅱ', 'Ⅲ', 'Ⅳ', 'Ⅴ', 'Ⅵ', 'ⅰ', 'ⅱ', 'ⅲ', 'ⅳ', 'ⅴ', 'ⅵ',
                '±', '×', '÷', '≒', '≠', '≤', '≥', '∞', '∴', '∵', '♂', '♀',
                '∠', '⊥', '⌒', '∂', '∇', '≡', '≒', '√', '∽', '∝', '∫', '∬',
                '∈', '∋', '⊆', '⊇', '⊂', '⊃', '∪', '∩', '∧', '∨', '¬', '⇒',
                'α', 'β', 'γ', 'δ', 'ε', 'ζ', 'η', 'θ', 'ι', 'κ', 'λ', 'μ',
                'ν', 'ξ', 'ο', 'π', 'ρ', 'σ', 'τ', 'υ', 'φ', 'χ', 'ψ', 'ω',
                'Α', 'Β', 'Γ', 'Δ', 'Ε', 'Ζ', 'Η', 'Θ', 'Ι', 'Κ', 'Λ', 'Μ',
                '가', '나', '다', '라', '마', '바', '사', '아', '자', '차', '카', '타'
              ].map((ch, idx) => (
                <div
                  key={idx}
                  onClick={() => setSelectedChar(ch)}
                  onDoubleClick={() => {
                    document.execCommand('insertText', false, ch);
                    setActiveModal(null);
                  }}
                  style={{
                    height: '26px',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    fontSize: '13px',
                    cursor: 'default',
                    backgroundColor: selectedChar === ch ? '#cce8ff' : '#ffffff',
                    border: selectedChar === ch ? '1px solid #99d1ff' : '1px solid transparent'
                  }}
                >
                  {ch}
                </div>
              ))}
            </div>
            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '8px', marginTop: '10px' }}>
              <button
                onClick={() => {
                  runCommand('insertText', selectedChar);
                  setActiveModal(null);
                }}
                style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '4px 16px', borderRadius: '2px', cursor: 'default', fontSize: '12px' }}
              >
                넣기(Enter)
              </button>
              <button
                onClick={() => setActiveModal(null)}
                style={{ backgroundColor: '#ffffff', border: '1px solid #ccc', padding: '4px 16px', borderRadius: '2px', cursor: 'default', fontSize: '12px' }}
              >
                닫기(ESC)
              </button>
            </div>
          </div>
        </ModalWrapper>
      )}

      {/* 13. 찾기 및 바꾸기 모달 (Ctrl+F, Ctrl+H) */}
      {activeModal === 'find' && (
        <ModalWrapper title="찾기 / 찾아 바꾸기 (Ctrl+F)" onClose={() => setActiveModal(null)} width="420px" height="260px">
          <div style={{ padding: '16px', display: 'flex', flexDirection: 'column', gap: '12px', fontSize: '12px' }}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
              <span>찾을 내용:</span>
              <input
                type="text"
                value={findWord}
                onChange={(e) => setFindWord(e.target.value)}
                onKeyDown={(e) => {
                  if (e.key === 'Enter' && findWord) (window as any).find(findWord, false, false, true);
                }}
                style={{ width: '260px', padding: '4px 6px', border: '1px solid #ccc', outline: 'none' }}
                placeholder="찾을 낱말 입력"
                autoFocus
              />
            </div>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
              <span>바꿀 내용:</span>
              <input
                type="text"
                value={replaceWord}
                onChange={(e) => setReplaceWord(e.target.value)}
                style={{ width: '260px', padding: '4px 6px', border: '1px solid #ccc', outline: 'none' }}
                placeholder="바꿀 낱말 입력"
              />
            </div>
            <div style={{ fontSize: '11px', color: '#666', borderTop: '1px solid #eee', paddingTop: '8px' }}>
              방향: 아래로 | 대소문자 구분 없음
            </div>
            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '6px', marginTop: 'auto' }}>
              <button
                onClick={() => {
                  if (findWord) (window as any).find(findWord, false, false, true);
                }}
                style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '4px 12px', borderRadius: '2px', cursor: 'default', fontSize: '11px' }}
              >
                다음 찾기
              </button>
              <button
                onClick={() => {
                  if (findWord && editorRef.current) {
                    const currentHtml = editorRef.current.innerHTML;
                    const regex = new RegExp(findWord, 'g');
                    editorRef.current.innerHTML = currentHtml.replace(regex, replaceWord);
                  }
                }}
                style={{ backgroundColor: '#f5f5f5', border: '1px solid #ccc', padding: '4px 12px', borderRadius: '2px', cursor: 'default', fontSize: '11px' }}
              >
                모두 바꾸기
              </button>
              <button
                onClick={() => setActiveModal(null)}
                style={{ backgroundColor: '#ffffff', border: '1px solid #ccc', padding: '4px 12px', borderRadius: '2px', cursor: 'default', fontSize: '11px' }}
              >
                취소
              </button>
            </div>
          </div>
        </ModalWrapper>
      )}

      {activeModal === 'page' && <NativeDialog title="편집 용지" width={661} height={682} tabs={['기본', '줄 격자']}
        onClose={() => setActiveModal(null)} onApply={() => { setPageConfig(pageDraft); setPageOrientation(orientationDraft); setActiveModal(null); }}>
        <div className="native-section-label" style={{ top: 17 }}><span>용지 종류</span></div>
        <label style={{ position: 'absolute', top: 39, left: 28 }}>종류 <select aria-label="용지 종류" style={{ width: 360, height: 24 }}><option>A4(국배판) [210 x 297 mm]</option></select></label>
        <NativeField label="폭" x={57} y={69} value={pageDraft.width} min={50} max={1000} unit="mm" onChange={width => setPageDraft(draft => ({ ...draft, width }))} />
        <NativeField label="길이" x={195} y={69} value={pageDraft.height} min={50} max={1000} unit="mm" onChange={height => setPageDraft(draft => ({ ...draft, height }))} />
        <div className="native-section-label" style={{ top: 102 }}><span>용지 방향</span></div>
        <div className="native-page-options">{(['portrait', 'landscape'] as const).map((value, i) => <button type="button" key={value} title={i ? '가로' : '세로'} aria-pressed={orientationDraft === value}
          onClick={() => setOrientationDraft(value)}>{i ? '▭' : '▤'}<span>{i ? '가로' : '세로'}</span></button>)}</div>
        <div className="native-section-label" style={{ top: 196 }}><span>용지 여백</span></div>
        {([
          ['위쪽', 'top', 243, 218], ['머리말', 'header', 243, 248], ['왼쪽', 'left', 97, 327], ['오른쪽', 'right', 350, 327],
          ['꼬리말', 'footer', 243, 435], ['아래쪽', 'bottom', 243, 465]
        ] as const).map(([label, key, x, y]) => <NativeField key={key} label={label} x={x} y={y} value={pageDraft[key]} min={0} max={100} unit="mm"
          onChange={value => setPageDraft(draft => ({ ...draft, [key]: value }))} />)}
        <div style={{ position: 'absolute', left: 194, top: 278, width: 150, height: 150, background: '#f5f5f5', border: '1px solid #ddd', display: 'grid', placeItems: 'center' }}>
          <div style={{ width: orientationDraft === 'portrait' ? 82 : 115, height: orientationDraft === 'portrait' ? 118 : 82, border: '1px solid black', background: 'white', padding: 13, boxSizing: 'border-box' }}>━━━━<br/>━━━━<br/>━━━━</div>
        </div>
      </NativeDialog>}

      {activeModal === 'font' && <NativeDialog title="글자 모양" width={695} height={570} tabs={['기본', '확장', '테두리/배경']}
        onClose={() => setActiveModal(null)} onApply={() => {
                  setFontConfig(fontDraft);
                  focusEditor();
                  const sel = window.getSelection();
                  if (sel && sel.rangeCount > 0) {
                    const span = document.createElement('span');
                    span.style.fontFamily = fontDraft.font;
                    span.style.fontSize = `${fontDraft.size * fontDraft.relativeSize / 100}pt`;
                    span.style.color = fontDraft.color;
                    span.style.position = 'relative';
                    span.style.top = `${-fontDraft.position / 100}em`;
                    span.style.fontWeight = fontDraft.bold ? 'bold' : 'normal';
                    span.style.fontStyle = fontDraft.italic ? 'italic' : 'normal';
                    span.style.textDecoration = [fontDraft.underline ? 'underline' : '', fontDraft.strike ? 'line-through' : ''].filter(Boolean).join(' ') || 'none';
                    span.style.letterSpacing = `${fontDraft.spacing / 100}em`;
                    if (fontDraft.width !== 100) {
                      span.style.display = 'inline-block';
                      span.style.transform = `scaleX(${fontDraft.width / 100})`;
                      span.style.transformOrigin = 'left center';
                    }
                    const range = sel.getRangeAt(0);
                    span.appendChild(range.extractContents());
                    range.insertNode(span);
                    persistEditor();
                  }
          setActiveModal(null);
        }}>
        <NativeField label="기준 크기" x={70} y={17} width={106} value={fontDraft.size} min={1} max={200} unit="pt"
          onChange={size => setFontDraft(config => ({ ...config, size }))} />
        <div className="native-section-label" style={{ top: 46 }}><span>언어별 설정</span></div>
        <label style={{ position: 'absolute', left: 28, top: 69 }}>언어 <select aria-label="언어" style={{ marginLeft: 12, width: 90, height: 24 }}><option>대표</option><option>한글</option><option>영문</option></select></label>
        <label style={{ position: 'absolute', left: 191, top: 69 }}>글꼴 <select aria-label="글꼴" value={fontDraft.font} style={{ marginLeft: 8, width: 322, height: 24 }}
          onChange={event => setFontDraft(config => ({ ...config, font: event.target.value }))}>
          {['함초롬바탕', '함초롬돋움', '맑은 고딕', '바탕', '궁서'].map(font => <option key={font}>{font}</option>)}
        </select></label>
        <NativeField label="상대 크기" x={81} y={99} value={fontDraft.relativeSize} min={10} max={500} unit="%" onChange={relativeSize => setFontDraft(config => ({ ...config, relativeSize }))} />
        <NativeField label="글자 위치" x={81} y={129} value={fontDraft.position} min={-100} max={100} unit="%" onChange={position => setFontDraft(config => ({ ...config, position }))} />
        <NativeField label="장평" x={220} y={99} value={fontDraft.width} min={50} max={200} unit="%" onChange={width => setFontDraft(config => ({ ...config, width }))} />
        <NativeField label="자간" x={220} y={129} value={fontDraft.spacing} min={-50} max={100} unit="%" onChange={spacing => setFontDraft(config => ({ ...config, spacing }))} />
        <div className="native-section-label" style={{ top: 164 }}><span>속성</span></div>
        <div style={{ position: 'absolute', left: 28, top: 183, display: 'flex', gap: 6 }}>
          {([['bold', '진하게', '가'], ['italic', '기울임', '가'], ['underline', '밑줄', '가'], ['strike', '취소선', '가']] as const).map(([key, title, text]) =>
            <button type="button" key={key} title={title} aria-pressed={fontDraft[key]} style={{ width: 40, height: 40, fontSize: 21, background: fontDraft[key] ? '#e0e0e0' : 'white', fontWeight: key === 'bold' ? 'bold' : 'normal', fontStyle: key === 'italic' ? 'italic' : 'normal', textDecoration: key === 'underline' ? 'underline' : key === 'strike' ? 'line-through' : 'none' }}
              onClick={() => setFontDraft(config => ({ ...config, [key]: !config[key] }))}>{text}</button>)}
        </div>
        <label style={{ position: 'absolute', top: 230, left: 28 }}>글자 색 <input aria-label="글자 색" type="color" value={fontDraft.color} style={{ marginLeft: 8, width: 90, height: 24 }}
          onChange={event => setFontDraft(config => ({ ...config, color: event.target.value }))} /></label>
        <div className="native-preview" style={{ top: 293, height: 134, display: 'flex', alignItems: 'end' }}>
          <span style={{ fontFamily: fontDraft.font, fontSize: `${fontDraft.size * fontDraft.relativeSize / 100}pt`, color: fontDraft.color, letterSpacing: `${fontDraft.spacing * .1}px` }}>한글Eng123漢字あいう※◎</span>
        </div>
      </NativeDialog>}

      {activeModal === 'paragraph' && <NativeDialog title="문단 모양" width={553} height={647} tabs={['기본', '확장', '탭 설정', '테두리/배경']}
        onClose={() => setActiveModal(null)} onApply={() => {
          setParaConfig(paraDraft);
          focusEditor();
          const editor = editorRef.current;
          const selection = window.getSelection();
          if (editor && selection?.rangeCount) {
            let paragraph = selection.anchorNode instanceof Element ? selection.anchorNode : selection.anchorNode?.parentElement;
            while (paragraph && paragraph.parentElement !== editor && paragraph !== editor) paragraph = paragraph.parentElement;
            if (!paragraph || paragraph === editor || !/^(P|DIV|H[1-6])$/.test(paragraph.tagName)) {
              document.execCommand('formatBlock', false, 'P');
              paragraph = window.getSelection()?.anchorNode?.parentElement || null;
              while (paragraph && paragraph.parentElement !== editor && paragraph !== editor) paragraph = paragraph.parentElement;
            }
            if (paragraph instanceof HTMLElement && paragraph !== editor) {
              Object.assign(paragraph.style, { textAlign: paraDraft.align, lineHeight: `${paraDraft.lineHeight / 100}`, marginLeft: `${paraDraft.left}pt`, marginRight: `${paraDraft.right}pt`, textIndent: `${paraDraft.indent}pt`, marginTop: `${paraDraft.before}pt`, marginBottom: `${paraDraft.after}pt` });
              persistEditor();
            }
          }
          setActiveModal(null);
        }}>
        <div className="native-section-label" style={{ top: 20 }}><span>정렬 방식</span></div>
        <div className="native-align">{[['justify', '양쪽 정렬', '☰'], ['left', '왼쪽 정렬', '≡'], ['center', '가운데 정렬', '≡'], ['right', '오른쪽 정렬', '≡']].map(([value, label, icon]) =>
          <button type="button" key={value} aria-label={label} aria-pressed={paraDraft.align === value} onClick={() => setParaDraft(config => ({ ...config, align: value }))}>{icon}</button>)}</div>
        <NativeField label="왼쪽" x={67} y={115} value={paraDraft.left} unit="pt" onChange={left => setParaDraft(config => ({ ...config, left }))} />
        <NativeField label="오른쪽" x={67} y={145} value={paraDraft.right} unit="pt" onChange={right => setParaDraft(config => ({ ...config, right }))} />
        <NativeField label="첫 줄" x={279} y={145} value={paraDraft.indent} unit="pt" onChange={indent => setParaDraft(config => ({ ...config, indent }))} />
        <div className="native-section-label" style={{ top: 188 }}><span>간격</span></div>
        <label style={{ position: 'absolute', left: 28, top: 212 }}>줄 간격 <select aria-label="줄 간격 기준" style={{ marginLeft: 6, height: 24, width: 134 }}><option>글자에 따라</option></select></label>
        <NativeField label="줄 간격" x={70} y={242} value={paraDraft.lineHeight} unit="%" min={50} max={500}
          onChange={lineHeight => setParaDraft(config => ({ ...config, lineHeight }))} />
        <NativeField label="문단 위" x={278} y={212} value={paraDraft.before} unit="pt" onChange={before => setParaDraft(config => ({ ...config, before }))} />
        <NativeField label="문단 아래" x={278} y={242} value={paraDraft.after} unit="pt" onChange={after => setParaDraft(config => ({ ...config, after }))} />
        <div className="native-preview" style={{ top: 384, height: 119, fontSize: 9, lineHeight: `${paraDraft.lineHeight / 100}`, textAlign: paraDraft.align as React.CSSProperties['textAlign'] }}>
          이런 문단 모양 이런 문단 모양 이런 문단 모양 이런 문단 모양<br/>가나다라마바사 AbCd12345 가나다라마바사<br/>한글 문단 모양과 줄 간격을 미리 봅니다.
        </div>
      </NativeDialog>}

      {/* 17. 스타일 대화상자 (F6) */}
      {activeModal === 'style' && (
        <ModalWrapper title="스타일 (F6)" onClose={() => setActiveModal(null)} width="480px" height="380px">
          <div style={{ padding: '16px', display: 'flex', flexDirection: 'column', height: '100%', boxSizing: 'border-box', fontSize: '12px' }}>
            <div style={{ display: 'flex', gap: '16px', flex: 1, minHeight: 0 }}>
              {/* 좌측 스타일 목록 */}
              <div style={{ width: '180px', border: '1px solid #c9d8ee', backgroundColor: '#fafafa', display: 'flex', flexDirection: 'column' }}>
                <div style={{ padding: '6px 8px', backgroundColor: '#eef4fd', borderBottom: '1px solid #c9d8ee', fontWeight: 'bold', fontSize: '11px', color: '#333' }}>스타일 목록</div>
                <div style={{ flex: 1, overflowY: 'auto', padding: '4px' }}>
                  {[
                    { id: 'normal', name: '바탕글', shortcut: 'Ctrl+1', tag: 'P', font: '함초롬바탕 10.0pt' },
                    { id: 'body', name: '본문', shortcut: 'Ctrl+2', tag: 'P', font: '함초롬바탕 10.0pt (들여쓰기 10pt)' },
                    { id: 'h1', name: '개요 1', shortcut: 'Ctrl+3', tag: 'H1', font: '함초롬돋움 16.0pt, 진하게' },
                    { id: 'h2', name: '개요 2', shortcut: 'Ctrl+4', tag: 'H2', font: '함초롬돋움 13.0pt, 진하게' },
                    { id: 'h3', name: '개요 3', shortcut: 'Ctrl+5', tag: 'H3', font: '함초롬돋움 11.0pt, 진하게' },
                    { id: 'caption', name: '캡션', shortcut: 'Ctrl+6', tag: 'P', font: '함초롬바탕 9.0pt, 기울임' },
                  ].map((s) => (
                    <div
                      key={s.id}
                      onClick={() => {
                        if (editorRef.current) {
                          document.execCommand('formatBlock', false, s.tag);
                        }
                        setActiveModal(null);
                        setChordToast(`스타일 '${s.name}' 적용 완료`);
                        setTimeout(() => setChordToast(null), 1500);
                      }}
                      style={{
                        padding: '6px 8px',
                        cursor: 'default',
                        borderRadius: '2px',
                        display: 'flex',
                        justifyContent: 'space-between',
                        alignItems: 'center',
                        fontSize: '11.5px',
                        transition: 'background 0.1s'
                      }}
                      onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#e5f3ff'}
                      onMouseLeave={(e) => e.currentTarget.style.backgroundColor = 'transparent'}
                    >
                      <span>{s.name}</span>
                      <span style={{ fontSize: '10px', color: '#888' }}>{s.shortcut}</span>
                    </div>
                  ))}
                </div>
              </div>

              {/* 우측 스타일 미리보기 및 정보 */}
              <div style={{ flex: 1, display: 'flex', flexDirection: 'column', gap: '10px' }}>
                <div style={{ border: '1px solid #d0d0d0', padding: '10px', borderRadius: '2px', backgroundColor: '#ffffff', minHeight: '120px' }}>
                  <div style={{ fontWeight: 'bold', marginBottom: '6px', color: '#0078d7' }}>[스타일 정보]</div>
                  <div style={{ color: '#555', lineHeight: '1.6', fontSize: '11px' }}>
                    <div>• 글꼴: 함초롬바탕, 10.0 pt, 보통</div>
                    <div>• 문단: 양쪽 정렬, 줄 간격 160%</div>
                    <div>• 단축키: Ctrl+1 ~ Ctrl+6 지원</div>
                  </div>
                </div>
                <div style={{ padding: '8px', backgroundColor: '#f9f9f9', border: '1px solid #e0e0e0', fontSize: '11px', color: '#666' }}>
                  스타일을 선택하면 현재 커서 위치의 문단에 즉시 적용됩니다.
                </div>
              </div>
            </div>

            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '8px', marginTop: '14px' }}>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '5px 16px', borderRadius: '2px', cursor: 'default' }}>적용(Enter)</button>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#fff', border: '1px solid #ccc', padding: '5px 16px', borderRadius: '2px', cursor: 'default' }}>닫기(ESC)</button>
            </div>
          </div>
        </ModalWrapper>
      )}

      {/* 18. 문서 정보 대화상자 (Ctrl+Q, I) */}
      {activeModal === 'docinfo' && (
        <ModalWrapper title="문서 정보 (Ctrl+Q, I)" onClose={() => setActiveModal(null)} width="440px" height="340px">
          <div style={{ padding: '16px', display: 'flex', flexDirection: 'column', height: '100%', boxSizing: 'border-box', fontSize: '12px' }}>
            <div style={{ border: '1px solid #c9d8ee', padding: '12px', backgroundColor: '#fafafa', borderRadius: '2px', flex: 1 }}>
              <div style={{ fontWeight: 'bold', marginBottom: '10px', color: '#0078d7', borderBottom: '1px solid #c9d8ee', paddingBottom: '4px' }}>
                문서 통계
              </div>
              <div style={{ display: 'grid', gridTemplateColumns: '120px 1fr', gap: '8px', fontSize: '11.5px', color: '#333' }}>
                <span style={{ color: '#666' }}>문서 제목:</span>
                <span style={{ fontWeight: 'bold' }}>{docTitle}</span>
                <span style={{ color: '#666' }}>파일 위치:</span>
                <span>{docFilePath || '로컬 메모리 (미저장)'}</span>
                <span style={{ color: '#666' }}>글자 수(공백 포함):</span>
                <span>{editorRef.current ? editorRef.current.innerText.length : 0} 자</span>
                <span style={{ color: '#666' }}>글자 수(공백 제외):</span>
                <span>{editorRef.current ? editorRef.current.innerText.replace(/\s+/g, '').length : 0} 자</span>
                <span style={{ color: '#666' }}>낱말 수:</span>
                <span>{editorRef.current && editorRef.current.innerText.trim() ? editorRef.current.innerText.trim().split(/\s+/).length : 0} 개</span>
                <span style={{ color: '#666' }}>줄 수:</span>
                <span>{editorRef.current && editorRef.current.innerText ? editorRef.current.innerText.split('\n').length : 1} 줄</span>
                <span style={{ color: '#666' }}>용지 방향 / 단:</span>
                <span>{pageOrientation === 'portrait' ? '세로' : '가로'} / {columnCount}단</span>
              </div>
            </div>

            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '8px', marginTop: '14px' }}>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '5px 20px', borderRadius: '2px', cursor: 'default' }}>확인(Enter)</button>
            </div>
          </div>
        </ModalWrapper>
      )}
    </div>
  );
}

function ModalWrapper({ title, onClose, width, height, children }: { title: string; onClose: () => void; width: string; height: string; children: React.ReactNode }) {
  return (
    <div style={{
      position: 'fixed',
      top: 0, left: 0, right: 0, bottom: 0,
      backgroundColor: 'rgba(0,0,0,0.22)',
      display: 'flex', alignItems: 'center', justifyContent: 'center',
      zIndex: 10000
    }}>
      <div style={{
        width, height,
        backgroundColor: '#ffffff',
        boxShadow: '0 8px 24px rgba(0,0,0,0.28)',
        border: '1px solid #7ba4ff',
        display: 'flex', flexDirection: 'column',
        overflow: 'hidden',
        userSelect: 'none'
      }}>
        {/* 네이티브 스타일 하늘색 헤더 */}
        <div style={{
          height: '28px',
          background: 'linear-gradient(to bottom, #f7faff, #e8f0fc)',
          color: '#222222',
          borderBottom: '1px solid #c9d8ee',
          display: 'flex', alignItems: 'center', justifyContent: 'space-between',
          padding: '0 8px 0 12px', fontSize: '12px', fontWeight: 'bold'
        }}>
          <span>{title}</span>
          <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
            <span style={{ cursor: 'default', color: '#666', fontSize: '12px' }} title="도움말">?</span>
            <span onClick={onClose} style={{ cursor: 'default', color: '#444', fontSize: '13px' }} title="닫기 (ESC)">✕</span>
          </div>
        </div>
        <div style={{ flex: 1, overflow: 'auto', backgroundColor: '#ffffff' }}>
          {children}
        </div>
      </div>
    </div>
  );
}

function ContextMenuItem({ label, shortcut, disabled, onClick }: { label: string; shortcut?: string; disabled?: boolean; onClick?: () => void }) {
  return (
    <div
      onClick={disabled ? undefined : onClick}
      style={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        padding: '5px 16px',
        cursor: disabled ? 'default' : 'pointer',
        opacity: disabled ? 0.4 : 1,
        fontSize: '11.5px',
        color: '#222222',
        transition: 'background 0.05s'
      }}
      onMouseEnter={(e) => {
        if (!disabled) e.currentTarget.style.backgroundColor = '#e5f3ff';
      }}
      onMouseLeave={(e) => {
        if (!disabled) e.currentTarget.style.backgroundColor = 'transparent';
      }}
    >
      <span>{label}</span>
      {shortcut && <span style={{ fontSize: '10.5px', color: '#777777', marginLeft: '12px' }}>{shortcut}</span>}
    </div>
  );
}

function ContextMenuDivider() {
  return <div style={{ height: '1px', backgroundColor: '#e5e5e5', margin: '3px 0' }} />;
}

function RibbonItem({ icon, label, active, disabled, hasArrow, onClick }: { icon: React.ReactNode; label: string; active?: boolean; disabled?: boolean; hasArrow?: boolean; onClick?: () => void }) {
  return (
    <button
      disabled={disabled}
      onClick={onClick}
      style={{
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
        minWidth: '40px',
        height: '66px',
        padding: '2px 4px',
        backgroundColor: active ? '#e5f3ff' : 'transparent',
        border: active ? '1px solid #99d1ff' : '1px solid transparent',
        borderRadius: '3px',
        cursor: disabled ? 'default' : 'pointer',
        opacity: disabled ? 0.35 : 1,
        transition: 'all 0.1s ease',
        flexShrink: 0
      }}
      onMouseEnter={(e) => {
        if (!disabled && !active) e.currentTarget.style.backgroundColor = '#f2f2f2';
      }}
      onMouseLeave={(e) => {
        if (!disabled && !active) e.currentTarget.style.backgroundColor = 'transparent';
      }}
    >
      <div style={{ height: '30px', display: 'flex', alignItems: 'center', justifyContent: 'center', marginBottom: '2px' }}>
        {icon}
      </div>
      <div style={{ fontSize: '10.5px', color: '#222222', textAlign: 'center', lineHeight: '1.15', whiteSpace: 'nowrap' }}>
        {label}
        {hasArrow && <span style={{ fontSize: '7px', marginLeft: '2px', color: '#888' }}>▾</span>}
      </div>
    </button>
  );
}

function RibbonSep() {
  return <div style={{ width: '1px', height: '48px', backgroundColor: '#e0e0e0', margin: '0 3px', flexShrink: 0 }} />;
}

function ToolSep() {
  return <div style={{ width: '1px', height: '14px', backgroundColor: '#d5d5d5', margin: '0 3px', flexShrink: 0 }} />;
}

function ToolBtn({ icon, title, onClick }: { icon: string; title: string; onClick?: () => void }) {
  return (
    <span
      title={title}
      onClick={onClick}
      style={{
        display: 'inline-flex',
        alignItems: 'center',
        justifyContent: 'center',
        width: '18px',
        height: '18px',
        cursor: 'default',
        borderRadius: '2px',
        fontSize: '11px',
        flexShrink: 0
      }}
      onMouseEnter={(e) => (e.currentTarget.style.backgroundColor = '#f0f0f0')}
      onMouseLeave={(e) => (e.currentTarget.style.backgroundColor = 'transparent')}
    >
      {icon}
    </span>
  );
}

/* 한글 2022 정밀 벡터 SVG 아이콘들 */
function IconCut() { return <span style={{ fontSize: '18px' }}>✂️</span>; }
function IconCopy() { return <span style={{ fontSize: '18px' }}>📋</span>; }
function IconPaste() { return <span style={{ fontSize: '18px' }}>📥</span>; }
function IconFormatPainter() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
      <rect x="3" y="4" width="13" height="5" rx="1" fill="#e67e22" />
      <path d="M16 6.5h3v7h-3" stroke="#7f8c8d" strokeWidth="2" />
      <path d="M14 13.5h5v6h-5z" fill="#f39c12" />
    </svg>
  );
}
function IconClearControl() {
  return (
    <div style={{ position: 'relative', fontSize: '10px', fontWeight: 'bold', color: '#2980b9' }}>
      [###]
      <span style={{ position: 'absolute', top: -3, right: -4, color: '#e74c3c', fontSize: '11px' }}>✕</span>
    </div>
  );
}
function IconFontShape() {
  return (
    <div style={{ position: 'relative', fontSize: '20px', fontWeight: 'bold', color: '#27ae60' }}>
      가
      <span style={{ position: 'absolute', bottom: -2, right: -4, fontSize: '9px' }}>✏️</span>
    </div>
  );
}
function IconParagraphShape() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24">
      <path d="M3 6h18M3 11h18M3 16h13M3 21h18" stroke="#34495e" strokeWidth="2" strokeLinecap="round" />
      <path d="M18 14l3 2-3 2v-4z" fill="#2980b9" />
    </svg>
  );
}
function IconStyle() {
  return (
    <div style={{ fontSize: '16px', fontWeight: 'bold', color: '#8e44ad', display: 'flex', alignItems: 'center' }}>
      A<span style={{ fontSize: '11px' }}>≡</span>
    </div>
  );
}
function IconPageVertical() {
  return <div style={{ width: '16px', height: '22px', border: '2px solid #2980b9', borderRadius: '2px', backgroundColor: '#eaf2f8' }} />;
}
function IconPageHorizontal() {
  return <div style={{ width: '22px', height: '16px', border: '1px solid #7f8c8d', borderRadius: '2px', backgroundColor: '#ffffff' }} />;
}
function IconPageMargin() {
  return (
    <div style={{ width: '20px', height: '20px', border: '1px solid #7f8c8d', borderStyle: 'dashed', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
      <div style={{ width: '12px', height: '12px', backgroundColor: '#bdc3c7' }} />
    </div>
  );
}
function IconMasterPage() {
  return <div style={{ width: '18px', height: '18px', border: '2px solid #e67e22', borderRadius: '2px' }} />;
}
function IconColumns() {
  return (
    <div style={{ display: 'flex', gap: '2px' }}>
      <div style={{ width: '7px', height: '18px', backgroundColor: '#bdc3c7' }} />
      <div style={{ width: '7px', height: '18px', backgroundColor: '#bdc3c7' }} />
    </div>
  );
}
function IconShape() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24">
      <rect x="3" y="3" width="9" height="9" fill="#3498db" />
      <circle cx="15" cy="15" r="5" fill="#e74c3c" opacity="0.85" />
    </svg>
  );
}
function IconPicture() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24">
      <rect x="2" y="3" width="20" height="18" rx="2" fill="#27ae60" />
      <circle cx="7" cy="8" r="2" fill="#f1c40f" />
      <path d="M2 18l6-6 4 4 5-5 5 5v3H2z" fill="#ffffff" opacity="0.9" />
    </svg>
  );
}
function IconTable() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
      <rect x="3" y="3" width="18" height="18" stroke="#2980b9" strokeWidth="2" />
      <line x1="3" y1="9" x2="21" y2="9" stroke="#2980b9" strokeWidth="1.5" />
      <line x1="3" y1="15" x2="21" y2="15" stroke="#2980b9" strokeWidth="1.5" />
      <line x1="9" y1="3" x2="9" y2="21" stroke="#2980b9" strokeWidth="1.5" />
      <line x1="15" y1="3" x2="15" y2="21" stroke="#2980b9" strokeWidth="1.5" />
    </svg>
  );
}
function IconChart() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24">
      <rect x="3" y="12" width="4" height="9" fill="#e74c3c" />
      <rect x="10" y="6" width="4" height="15" fill="#3498db" />
      <rect x="17" y="3" width="4" height="18" fill="#2ecc71" />
    </svg>
  );
}
function IconSelectObject() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24">
      <rect x="2" y="2" width="13" height="13" stroke="#2980b9" strokeWidth="1.5" strokeDasharray="3 2" fill="none" />
      <path d="M11 11l5 10 3-3-3-7h-5z" fill="#2980b9" />
    </svg>
  );
}
function IconProtectObject() { return <span style={{ fontSize: '18px' }}>🔒</span>; }
function IconEquation() {
  return (
    <div style={{ fontSize: '14px', fontWeight: 'bold', color: '#0078d7', fontStyle: 'italic', fontFamily: 'serif' }}>
      √x
    </div>
  );
}
function IconFind() { return <span style={{ fontSize: '18px' }}>🔍</span>; }
function IconReplace() {
  return (
    <div style={{ fontSize: '10px', fontWeight: 'bold', color: '#2c3e50', display: 'flex', alignItems: 'center' }}>
      <span>수</span><span style={{ color: '#2980b9' }}>➔</span><span>수</span>
    </div>
  );
}
function IconAlign() {
  return (
    <div style={{ fontSize: '12px', color: '#7f8c8d', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
      <span>공</span>
      <span>↕</span>
      <span>정</span>
    </div>
  );
}
