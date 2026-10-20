import React, { useState, useEffect, useRef } from 'react';
import { EquationRenderer } from './engine/EquationRenderer';

export default function App() {
  const [docTitle, setDocTitle] = useState(() => {
    return localStorage.getItem('web_hwp_current_title') || '빈 문서 1';
  });
  const [docFilePath, setDocFilePath] = useState(() => {
    return localStorage.getItem('web_hwp_current_path') || '';
  });
  const [activeMenu, setActiveMenu] = useState('편집');
  const [zoom, setZoom] = useState(100);
  const [contextMenu, setContextMenu] = useState<{ x: number; y: number; visible: boolean }>({ x: 0, y: 0, visible: false });
  const [caret, setCaret] = useState({ page: 1, section: 1, col: 1, line: 1, chars: 0, strokes: 0 });
  const [activeModal, setActiveModal] = useState<string | null>(null); // 'equation' | 'table' | 'font' | 'page' | 'paragraph' | 'charmap' | 'find' | 'style' | 'docinfo'
  const [activeDropdown, setActiveDropdown] = useState<string | null>(null); // 'file' | 'edit' | 'view' | 'insert' | 'format' | 'page'
  const [pageOrientation, setPageOrientation] = useState<'portrait' | 'landscape'>('portrait');
  const [columnCount, setColumnCount] = useState<number>(1);
  const [showMarks, setShowMarks] = useState<boolean>(false);
  const [copiedStyle, setCopiedStyle] = useState<any | null>(null);
  const [chordState, setChordState] = useState<string | null>(null); // 'Ctrl+N' 등 2단 단축키 대기
  const [chordToast, setChordToast] = useState<string | null>(null);
  const [eqScript, setEqScript] = useState('{a+b} over {c} + sqrt {x^2+y^2}');
  const [tableRows, setTableRows] = useState(5);
  const [tableCols, setTableCols] = useState(5);
  const [isStandalone, setIsStandalone] = useState(false);
  const [selectedChar, setSelectedChar] = useState('※');
  const [findWord, setFindWord] = useState('');
  const [replaceWord, setReplaceWord] = useState('');
  const [fontConfig, setFontConfig] = useState({ size: 10, font: '함초롬바탕', width: 100, spacing: 0, color: '#000000' });
  const [paraConfig, setParaConfig] = useState({ lineHeight: 160, align: 'justify', indent: 0 });
  const editorRef = useRef<HTMLDivElement>(null);

  // 저장된 본문 복원 및 브라우저 탭 타이틀 동기화
  useEffect(() => {
    const savedContent = localStorage.getItem('web_hwp_current_content');
    if (savedContent && editorRef.current) {
      editorRef.current.innerText = savedContent;
    }
  }, []);

  useEffect(() => {
    // 한글 원본 형식: '파일명.hwpx [경로] - 한글' 또는 'Web HWP (RE) - [파일명]'
    document.title = `${docTitle}${docFilePath ? ` [${docFilePath}]` : ''} - 한글`;
    localStorage.setItem('web_hwp_current_title', docTitle);
    if (docFilePath) {
      localStorage.setItem('web_hwp_current_path', docFilePath);
    }
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
      const isCtrl = e.ctrlKey || e.metaKey;
      const isAlt = e.altKey;
      const key = e.key.toUpperCase();

      // 1) 2단 조합키 (Chord)
      if (chordState === 'Ctrl+N') {
        e.preventDefault();
        e.stopPropagation();
        setChordState(null);
        setChordToast(null);

        if (key === 'M') {
          setActiveModal('equation');
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
        handleSave();
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
  }, [chordState, activeModal, copiedStyle]);

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
      document.execCommand('insertHTML', false, shapeHtml);
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
      document.execCommand('insertHTML', false, chartHtml);
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
            document.execCommand('insertHTML', false, imgHtml);
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

  const runCommand = (cmd: string, val: any = null, toastMsg?: string) => {
    document.execCommand(cmd, false, val);
    editorRef.current?.focus();
    if (toastMsg) {
      setChordToast(toastMsg);
      setTimeout(() => setChordToast(null), 1200);
    }
  };

  const handleDocInfo = () => {
    setActiveModal('docinfo');
  };

  const handleSave = () => {
    const text = editorRef.current ? editorRef.current.innerText : '';
    localStorage.setItem('web_hwp_current_content', text);
    const blob = new Blob([text], { type: 'text/plain;charset=utf-8' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = docTitle.includes('.') ? docTitle : `${docTitle}.hwpx`;
    a.click();
    URL.revokeObjectURL(url);
  };

  const handleOpen = () => {
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = '.hwp,.hwpx,.txt';
    input.onchange = (e: any) => {
      const file = e.target.files[0];
      if (file) {
        const name = file.name;
        setDocTitle(name);
        setDocFilePath('C:\\Users\\K\\Desktop\\');
        const reader = new FileReader();
        reader.onload = (re: any) => {
          if (editorRef.current) {
            editorRef.current.innerText = re.target.result;
            localStorage.setItem('web_hwp_current_content', re.target.result);
          }
        };
        reader.readAsText(file);
      }
    };
    input.click();
  };

  const handleNewDoc = () => {
    if (editorRef.current) {
      editorRef.current.innerText = '';
    }
    setDocTitle('빈 문서 1');
    setDocFilePath('');
    localStorage.removeItem('web_hwp_current_content');
    localStorage.removeItem('web_hwp_current_path');
    localStorage.setItem('web_hwp_current_title', '빈 문서 1');
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
      document.execCommand('insertHTML', false, tableHtml);
    }
    setActiveModal(null);
  };

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
      style={{
        display: 'flex',
        flexDirection: 'column',
        height: '100vh',
        width: '100vw',
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
        .hwp-btn {
          cursor: pointer;
          box-sizing: border-box;
          border-radius: 2px;
          border: 1px solid transparent;
          transition: background-color 0.08s, border-color 0.08s;
        }
        .hwp-btn:hover {
          background-color: rgba(0, 120, 215, 0.16) !important;
          border-color: rgba(0, 120, 215, 0.45) !important;
        }
        .hwp-btn:active {
          background-color: rgba(0, 120, 215, 0.32) !important;
          border-color: #005fb8 !important;
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

      {/* 1. 최상단 타이틀바 (PWA standalone일 땐 OS 프레임과 겹치지 않게 숨김) */}
      {/* 1. 최상단 타이틀바 (PWA standalone일 땐 OS 프레임과 겹치지 않게 숨김) */}
      {!isStandalone && (
        <div style={{
          height: '26px',
          backgroundColor: '#ffffff',
          backgroundImage: 'url(/hwp_title_exact.png)',
          backgroundRepeat: 'no-repeat',
          backgroundPosition: 'left top',
          backgroundSize: '1916px 26px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'flex-end',
          padding: '0 8px 0 10px',
          fontSize: '12px',
          flexShrink: 0,
          position: 'relative'
        }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '14px', fontSize: '11px', color: '#666666', marginLeft: 'auto', zIndex: 10 }}>
            <span style={{ cursor: 'pointer', opacity: 0 }}>로그인</span>
            <span title="최소화" style={{ cursor: 'pointer', width: '24px', height: '24px', display: 'inline-block', opacity: 0 }}>─</span>
            <span title="최대화" style={{ cursor: 'pointer', width: '24px', height: '24px', display: 'inline-block', opacity: 0 }}>□</span>
            <span title="닫기" style={{ cursor: 'pointer', width: '24px', height: '24px', display: 'inline-block', opacity: 0 }}>✕</span>
          </div>
        </div>
      )}

      {/* 2. 메인 메뉴바 (실제 한글 네이티브 슬라이스 기반, 100% 일치) */}
      <div style={{
        height: '32px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'visible',
        flexShrink: 0,
        zIndex: 50
      }}>
        <img
          src="/hwp_menu_exact.png"
          alt="한글 메뉴바"
          style={{ height: '32px', width: '100%', maxWidth: '1916px', objectFit: 'none', objectPosition: 'left top', pointerEvents: 'none' }}
        />
        {/* 투명 클릭 히트박스 영역 매핑 (1916px 네이티브 1:1 정렬) */}
        <div className="hwp-btn" style={{ position: 'absolute', top: '2px', left: '15px', width: '48px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setActiveDropdown(activeDropdown === 'file' ? null : 'file')} title="파일" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '2px', left: '68px', width: '48px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setActiveDropdown(activeDropdown === 'edit' ? null : 'edit')} title="편집" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '2px', left: '122px', width: '48px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setActiveDropdown(activeDropdown === 'view' ? null : 'view')} title="보기" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '2px', left: '176px', width: '48px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setActiveDropdown(activeDropdown === 'insert' ? null : 'insert')} title="입력" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '2px', left: '230px', width: '48px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setActiveDropdown(activeDropdown === 'format' ? null : 'format')} title="서식" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '2px', left: '284px', width: '48px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setActiveDropdown(activeDropdown === 'page' ? null : 'page')} title="쪽" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '2px', left: '338px', width: '48px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setChordToast('보안 메뉴')} title="보안" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '2px', left: '392px', width: '48px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setChordToast('검토 메뉴')} title="검토" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '2px', left: '446px', width: '48px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setChordToast('도구 메뉴')} title="도구" />

        {/* 네이티브 드롭다운 메뉴 레이어 */}
        {activeDropdown && (
          <div
            style={{
              position: 'absolute',
              top: '32px',
              left: activeDropdown === 'file' ? '15px' :
                    activeDropdown === 'edit' ? '68px' :
                    activeDropdown === 'view' ? '122px' :
                    activeDropdown === 'insert' ? '176px' :
                    activeDropdown === 'format' ? '230px' : '284px',
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
                <ContextMenuItem label="다른 이름으로 저장하기..." shortcut="Alt+V" onClick={() => { handleSave(); setActiveDropdown(null); }} />
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
                <ContextMenuItem label="되돌리기" shortcut="Ctrl+Z" onClick={() => { document.execCommand('undo'); setActiveDropdown(null); }} />
                <ContextMenuItem label="다시 실행" shortcut="Ctrl+Y" onClick={() => { document.execCommand('redo'); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="오려두기" shortcut="Ctrl+X" onClick={() => { document.execCommand('cut'); setActiveDropdown(null); }} />
                <ContextMenuItem label="복사하기" shortcut="Ctrl+C" onClick={() => { document.execCommand('copy'); setActiveDropdown(null); }} />
                <ContextMenuItem label="붙이기" shortcut="Ctrl+V" onClick={() => { document.execCommand('paste'); setActiveDropdown(null); }} />
                <ContextMenuItem label="모양 복사" shortcut="Alt+C" onClick={() => { handleCopyFormat(); setActiveDropdown(null); }} />
                <ContextMenuDivider />
                <ContextMenuItem label="모두 선택" shortcut="Ctrl+A" onClick={() => { document.execCommand('selectAll'); setActiveDropdown(null); }} />
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
                <ContextMenuItem label="그림..." shortcut="Ctrl+N, I" onClick={() => { handleOpen(); setActiveDropdown(null); }} />
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
                <ContextMenuItem label="진하게" shortcut="Ctrl+B" onClick={() => { document.execCommand('bold'); setActiveDropdown(null); }} />
                <ContextMenuItem label="기울임" shortcut="Ctrl+I" onClick={() => { document.execCommand('italic'); setActiveDropdown(null); }} />
                <ContextMenuItem label="밑줄" shortcut="Ctrl+U" onClick={() => { document.execCommand('underline'); setActiveDropdown(null); }} />
                <ContextMenuItem label="취소선" onClick={() => { document.execCommand('strikeThrough'); setActiveDropdown(null); }} />
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

      {/* 3. 리본 툴바 (실제 한글 네이티브 슬라이스 기반, 100% 일치) */}
      <div style={{
        height: '83px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'hidden',
        flexShrink: 0
      }}>
        <img
          src="/hwp_ribbon_exact.png"
          alt="한글 리본 툴바"
          style={{ height: '83px', width: '100%', maxWidth: '1916px', objectFit: 'none', objectPosition: 'left top', pointerEvents: 'none' }}
        />
        {/* 리본 도구 실제 1:1 정렬 히트박스 매핑 (selection 보존 onMouseDown 적용) */}
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '10px', width: '45px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('cut', null, '오려두기')} title="오려두기 (Ctrl+X)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '58px', width: '45px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('copy', null, '복사하기')} title="복사하기 (Ctrl+C)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '106px', width: '48px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('paste', null, '붙이기')} title="붙이기 (Ctrl+V)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '156px', width: '46px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={handleCopyFormat} title="모양 복사 (Alt+C)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '204px', width: '50px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => { setShowMarks(!showMarks); setChordToast(`조판 부호 ${!showMarks ? '표시' : '숨김'}`); setTimeout(() => setChordToast(null), 1200); }} title="조판 부호 토글" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '264px', width: '42px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setActiveModal('font')} title="글자 모양 (Alt+L)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '308px', width: '42px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setActiveModal('paragraph')} title="문단 모양 (Alt+T)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '352px', width: '42px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setActiveModal('style')} title="스타일 (F6)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '398px', width: '42px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => { setPageOrientation('portrait'); setChordToast('용지 방향: 세로'); setTimeout(() => setChordToast(null), 1200); }} title="용지 방향: 세로" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '442px', width: '42px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => { setPageOrientation('landscape'); setChordToast('용지 방향: 가로'); setTimeout(() => setChordToast(null), 1200); }} title="용지 방향: 가로" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '486px', width: '46px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setActiveModal('page')} title="쪽 여백 (F7)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '534px', width: '42px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => { setChordToast('바탕쪽 편집 모드'); setTimeout(() => setChordToast(null), 1200); }} title="바탕쪽" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '578px', width: '42px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={handleToggleColumns} title="다단 설정 (단)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '626px', width: '42px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => handleInsertShape('rect')} title="도형 삽입 (직사각형)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '670px', width: '42px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={handleInsertImage} title="그림 넣기 (Ctrl+N, I)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '712px', width: '40px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setActiveModal('table')} title="표 만들기 (Ctrl+N, T)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '754px', width: '44px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={handleInsertChart} title="차트 삽입" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '802px', width: '46px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => { setChordToast('개체 선택 모드 활성화'); setTimeout(() => setChordToast(null), 1200); }} title="개체 선택" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '850px', width: '46px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => { setChordToast('개체 보호 설정'); setTimeout(() => setChordToast(null), 1200); }} title="개체 보호" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '900px', width: '48px', height: '74px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => setActiveModal('equation')} title="수식 편집기 (Ctrl+N, M)" />
      </div>

      {/* 4. 빠른 서식 툴바 (실제 한글 네이티브 슬라이스 기반, 100% 일치) */}
      <div style={{
        height: '37px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'hidden',
        flexShrink: 0
      }}>
        <img
          src="/hwp_format_exact.png"
          alt="한글 서식줄"
          style={{ height: '37px', width: '100%', maxWidth: '1916px', objectFit: 'none', objectPosition: 'left top', pointerEvents: 'none' }}
        />
        {/* 서식줄 빠른 액션 히트박스 (1:1 정확한 픽셀 정렬) */}
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '18px', width: '32px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={handleNewDoc} title="새 문서 (Alt+N)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '54px', width: '34px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={handleOpen} title="불러오기 (Alt+O)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '92px', width: '34px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={handleSave} title="저장하기 (Alt+S)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '140px', width: '28px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => window.print()} title="인쇄 (Alt+P)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '170px', width: '28px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => window.print()} title="미리보기" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '204px', width: '28px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('undo', null, '되돌리기')} title="되돌리기 (Ctrl+Z)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '4px', left: '234px', width: '28px', height: '28px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('redo', null, '다시 실행')} title="다시 실행 (Ctrl+Y)" />

        {/* 1. 스타일 (바탕글/본문/개요) */}
        <select
          defaultValue="바탕글"
          onChange={(e) => {
            if (e.target.value === '개요 1') runCommand('formatBlock', 'H1', '개요 1 적용');
            else if (e.target.value === '개요 2') runCommand('formatBlock', 'H2', '개요 2 적용');
            else runCommand('formatBlock', 'P', '바탕글 적용');
          }}
          style={{
            position: 'absolute', top: '7px', left: '280px', width: '130px', height: '22px',
            opacity: 0, cursor: 'pointer'
          }}
          title="스타일 (바탕글)"
        >
          <option>바탕글</option>
          <option>본문</option>
          <option>개요 1</option>
          <option>개요 2</option>
        </select>

        {/* 2. 글꼴 (함초롬바탕/맑은고딕/바탕/돋움) */}
        <select
          defaultValue="함초롬바탕"
          onChange={(e) => {
            runCommand('fontName', e.target.value, `글꼴: ${e.target.value}`);
          }}
          style={{
            position: 'absolute', top: '7px', left: '435px', width: '180px', height: '22px',
            opacity: 0, cursor: 'pointer'
          }}
          title="글꼴 선택"
        >
          <option value="함초롬바탕, Batang, serif">함초롬바탕</option>
          <option value="함초롬돋움, Dotum, sans-serif">함초롬돋움</option>
          <option value="'Malgun Gothic', '맑은 고딕', sans-serif">맑은 고딕</option>
          <option value="Batang, 바탕, serif">바탕</option>
          <option value="Gungsuh, 궁서, serif">궁서</option>
        </select>

        {/* 3. 글자 크기 (기준 10.0 pt) */}
        <select
          defaultValue="3"
          onChange={(e) => {
            runCommand('fontSize', e.target.value, '글자 크기 변경');
          }}
          style={{
            position: 'absolute', top: '7px', left: '635px', width: '100px', height: '22px',
            opacity: 0, cursor: 'pointer'
          }}
          title="글자 크기 (pt)"
        >
          <option value="1">8.0 pt</option>
          <option value="2">9.0 pt</option>
          <option value="3">10.0 pt</option>
          <option value="4">11.0 pt</option>
          <option value="5">12.0 pt</option>
          <option value="6">14.0 pt</option>
          <option value="7">16.0 pt</option>
        </select>

        {/* 서식 빠른 스타일 토글 버튼들 */}
        <div className="hwp-btn" style={{ position: 'absolute', top: '6px', left: '780px', width: '26px', height: '25px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('bold', null, '진하게 (Ctrl+B)')} title="굵게 (Ctrl+B)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '6px', left: '808px', width: '26px', height: '25px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('italic', null, '기울임 (Ctrl+I)')} title="기울임 (Ctrl+I)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '6px', left: '836px', width: '26px', height: '25px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('underline', null, '밑줄 (Ctrl+U)')} title="밑줄 (Ctrl+U)" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '6px', left: '864px', width: '26px', height: '25px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('strikeThrough', null, '취소선')} title="취소선" />
        
        {/* 글자색 선택 (컬러 피커 연동) */}
        <div className="hwp-btn" style={{ position: 'absolute', top: '6px', left: '890px', width: '26px', height: '25px' }} title="글자 색">
          <input
            type="color"
            defaultValue="#000000"
            onChange={(e) => runCommand('foreColor', e.target.value, '글자 색 적용')}
            style={{ position: 'absolute', top: 0, left: 0, width: '100%', height: '100%', opacity: 0, cursor: 'pointer' }}
          />
        </div>

        {/* 정렬 버튼들 */}
        <div className="hwp-btn" style={{ position: 'absolute', top: '6px', left: '924px', width: '26px', height: '25px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('justifyFull', null, '양쪽 정렬')} title="양쪽 정렬" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '6px', left: '952px', width: '26px', height: '25px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('justifyLeft', null, '왼쪽 정렬')} title="왼쪽 정렬" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '6px', left: '978px', width: '26px', height: '25px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('justifyCenter', null, '가운데 정렬')} title="가운데 정렬" />
        <div className="hwp-btn" style={{ position: 'absolute', top: '6px', left: '1004px', width: '26px', height: '25px' }} onMouseDown={(e) => e.preventDefault()} onClick={() => runCommand('justifyRight', null, '오른쪽 정렬')} title="오른쪽 정렬" />
      </div>

      {/* 5. 가로 눈금자 (실제 한글 네이티브 슬라이스 기반, 100% 일치) */}
      <div style={{
        height: '41px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'hidden',
        flexShrink: 0
      }}>
        <img
          src="/hwp_ruler_exact.png"
          alt="가로 눈금자"
          style={{ height: '41px', width: '100%', maxWidth: '1916px', objectFit: 'none', objectPosition: 'left top' }}
        />
      </div>

      {/* 6. 중앙 워크스페이스 */}
      <div style={{
        flex: 1,
        display: 'flex',
        minHeight: 0,
        backgroundColor: '#f5f5f5',
        position: 'relative',
        overflow: 'hidden'
      }}>
        {/* 세로 눈금자 및 사이드바 (실제 한글 네이티브 30x668 슬라이스) */}
        <div style={{
          width: '30px',
          backgroundColor: '#f5f5f5',
          backgroundImage: 'url(/hwp_left_ruler_exact.png)',
          backgroundRepeat: 'no-repeat',
          backgroundPosition: 'top left',
          flexShrink: 0
        }} />

        {/* 캔버스 */}
        <div style={{
          flex: 1,
          display: 'flex',
          justifyContent: 'center',
          overflowY: 'auto',
          padding: '22px 0',
          position: 'relative'
        }}>
          <div style={{
            width: pageOrientation === 'portrait' ? '792px' : '1123px',
            minHeight: pageOrientation === 'portrait' ? '1123px' : '792px',
            backgroundColor: '#ffffff',
            border: '1px solid #d0d0d0',
            boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
            position: 'relative',
            boxSizing: 'border-box',
            transition: 'width 0.2s ease, min-height 0.2s ease'
          }}>
            {/* L자 여백 가이드마커 */}
            <svg style={{ position: 'absolute', top: '114px', left: '115px', width: '16px', height: '16px' }}>
              <path d="M0 0 L0 16 M0 0 L16 0" stroke="#cccccc" strokeWidth="1" fill="none" />
            </svg>
            <svg style={{ position: 'absolute', top: '114px', right: '112px', width: '16px', height: '16px' }}>
              <path d="M16 0 L16 16 M16 0 L0 0" stroke="#cccccc" strokeWidth="1" fill="none" />
            </svg>
            <svg style={{ position: 'absolute', bottom: '114px', left: '115px', width: '16px', height: '16px' }}>
              <path d="M0 16 L0 0 M0 16 L16 16" stroke="#cccccc" strokeWidth="1" fill="none" />
            </svg>
            <svg style={{ position: 'absolute', bottom: '114px', right: '112px', width: '16px', height: '16px' }}>
              <path d="M16 16 L16 0 M16 16 L0 16" stroke="#cccccc" strokeWidth="1" fill="none" />
            </svg>

            {/* 본문 에디터 */}
            <div
              ref={editorRef}
              contentEditable
              suppressContentEditableWarning
              onInput={handleInput}
              style={{
                position: 'absolute',
                top: '114px',
                left: '115px',
                right: '112px',
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

        {/* 우측 스크롤바 (실제 한글 네이티브 17x668 슬라이스) */}
        <div style={{
          width: '17px',
          backgroundColor: '#f5f5f5',
          backgroundImage: 'url(/hwp_right_scroll_exact.png)',
          backgroundRepeat: 'no-repeat',
          backgroundPosition: 'top left',
          flexShrink: 0
        }} />
      </div>

      {/* 7. 최하단 상태표시줄 & 탭바 (실제 한글 네이티브 슬라이스, 100% 일치) */}
      <div style={{
        height: '31px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'hidden',
        flexShrink: 0
      }}>
        <img
          src="/hwp_bottom_exact.png"
          alt="하단 상태표시줄"
          style={{ height: '31px', width: '100%', maxWidth: '1916px', objectFit: 'none', objectPosition: 'left top' }}
        />
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
            style={{ position: 'absolute', top: '1px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { document.execCommand('paste'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="붙이기 (Ctrl+V)"
          />
          {/* 2. 문자표(C)... Ctrl+F10 */}
          <div
            style={{ position: 'absolute', top: '27px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { setActiveModal('charmap'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="문자표 (Ctrl+F10)"
          />
          {/* 3. 인쇄(R)... Alt+P */}
          <div
            style={{ position: 'absolute', top: '56px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { window.print(); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="인쇄 (Alt+P)"
          />
          {/* 4. 글자 모양(L)... Alt+L */}
          <div
            style={{ position: 'absolute', top: '85px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { setActiveModal('font'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="글자 모양 (Alt+L)"
          />
          {/* 5. 문단 모양(M)... Alt+T */}
          <div
            style={{ position: 'absolute', top: '111px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { setActiveModal('paragraph'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="문단 모양 (Alt+T)"
          />
          {/* 6. 스타일(S)... F6 */}
          <div
            style={{ position: 'absolute', top: '137px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { setActiveModal('style'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="스타일 (F6)"
          />
          {/* 7. 글머리표 및 문단 번호(N)... */}
          <div
            style={{ position: 'absolute', top: '163px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => {
              document.execCommand('insertUnorderedList');
              setContextMenu(prev => ({ ...prev, visible: false }));
            }}
            title="글머리표 및 문단 번호"
          />
          {/* 8. 하이퍼링크(Y)... Ctrl+K,H */}
          <div
            style={{ position: 'absolute', top: '192px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => {
              const url = prompt('하이퍼링크 URL을 입력하세요:', 'https://');
              if (url) document.execCommand('createLink', false, url);
              setContextMenu(prev => ({ ...prev, visible: false }));
            }}
            title="하이퍼링크"
          />
          {/* 9. 새 메모(T) */}
          <div
            style={{ position: 'absolute', top: '218px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { alert('새 메모'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="새 메모"
          />
          {/* 10. 채우기(I) */}
          <div
            style={{ position: 'absolute', top: '244px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="채우기"
          />
          {/* 11. 교정 부호 넣기(V) */}
          <div
            style={{ position: 'absolute', top: '270px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="교정 부호 넣기"
          />
          {/* 12. 개인 정보 보호(A) */}
          <div
            style={{ position: 'absolute', top: '296px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="개인 정보 보호"
          />
          {/* 13. 번역(B) */}
          <div
            style={{ position: 'absolute', top: '325px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { alert('번역 실행'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="번역"
          />
        </div>
      )}

      {/* 10. 한글 수식 편집기 모달 (Ctrl+N,M) */}
      {activeModal === 'equation' && (
        <ModalWrapper title="수식 편집기" onClose={() => setActiveModal(null)} width="640px" height="420px">
          <div style={{ height: '34px', backgroundColor: '#f5f5f5', borderBottom: '1px solid #ddd', display: 'flex', alignItems: 'center', padding: '0 6px', gap: '4px' }}>
            <button onClick={() => setEqScript(p => p + ' {a} over {b} ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>분수(over)</button>
            <button onClick={() => setEqScript(p => p + ' sqrt {x} ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>근호(sqrt)</button>
            <button onClick={() => setEqScript(p => p + ' ^{2} ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>위첨자(^)</button>
            <button onClick={() => setEqScript(p => p + ' _{1} ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>아래첨자(_)</button>
            <button onClick={() => setEqScript(p => p + ' sum _{i=1} ^{n} ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>합(sum)</button>
            <button onClick={() => setEqScript(p => p + ' int _{0} ^{1} ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>적분(int)</button>
            <button onClick={() => setEqScript(p => p + ' matrix { a & b # c & d } ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>행렬</button>
          </div>
          <div style={{ flex: 1, display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '16px', backgroundColor: '#fafafa', borderBottom: '1px solid #ddd', overflow: 'auto' }}>
            <EquationRenderer script={eqScript} fontSize={18} scale={1.5} color="#111111" showCursor={true} />
          </div>
          <div style={{ height: '110px', display: 'flex', flexDirection: 'column' }}>
            <textarea
              value={eqScript}
              onChange={(e) => setEqScript(e.target.value)}
              style={{ flex: 1, padding: '8px', border: 'none', outline: 'none', fontSize: '13px', fontFamily: 'Consolas, monospace', resize: 'none' }}
            />
            <div style={{ height: '34px', backgroundColor: '#f0f0f0', borderTop: '1px solid #ddd', display: 'flex', alignItems: 'center', justifyContent: 'flex-end', padding: '0 8px', gap: '6px' }}>
              <button
                onClick={() => {
                  if (editorRef.current) {
                    document.execCommand('insertHTML', false, `<span style="display:inline-block; padding: 2px 6px; background:#f0f8ff; border:1px solid #cce5ff; border-radius:3px; font-style:italic;">${eqScript}</span>&nbsp;`);
                  }
                  setActiveModal(null);
                }}
                style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '4px 12px', borderRadius: '2px', cursor: 'pointer', fontSize: '11px' }}
              >
                본문에 넣기 (Shift+ESC)
              </button>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#ffffff', border: '1px solid #ccc', padding: '4px 12px', borderRadius: '2px', cursor: 'pointer', fontSize: '11px' }}>
                취소 (ESC)
              </button>
            </div>
          </div>
        </ModalWrapper>
      )}

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
              style={{ position: 'absolute', top: '2px', right: '3px', width: '24px', height: '24px', cursor: 'pointer' }}
              onClick={() => setActiveModal(null)}
              title="닫기 (ESC)"
            />

            {/* 2. 줄 개수 입력 필드 */}
            <input
              type="number"
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
              style={{ position: 'absolute', top: '78px', left: '158px', width: '16px', height: '11px', cursor: 'pointer' }}
              onClick={() => setTableRows(r => r + 1)}
              title="줄 수 증가"
            />
            <div
              style={{ position: 'absolute', top: '89px', left: '158px', width: '16px', height: '11px', cursor: 'pointer' }}
              onClick={() => setTableRows(r => Math.max(1, r - 1))}
              title="줄 수 감소"
            />

            {/* 3. 칸 개수 입력 필드 */}
            <input
              type="number"
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
              style={{ position: 'absolute', top: '108px', left: '158px', width: '16px', height: '11px', cursor: 'pointer' }}
              onClick={() => setTableCols(c => c + 1)}
              title="칸 수 증가"
            />
            <div
              style={{ position: 'absolute', top: '119px', left: '158px', width: '16px', height: '11px', cursor: 'pointer' }}
              onClick={() => setTableCols(c => Math.max(1, c - 1))}
              title="칸 수 감소"
            />

            {/* 4. 만들기(D) 버튼 히트박스 */}
            <div
              style={{ position: 'absolute', top: '42px', left: '346px', width: '81px', height: '28px', cursor: 'pointer' }}
              onClick={insertTableToDoc}
              title="만들기 (Enter)"
            />

            {/* 5. 취소 버튼 히트박스 */}
            <div
              style={{ position: 'absolute', top: '76px', left: '346px', width: '81px', height: '28px', cursor: 'pointer' }}
              onClick={() => setActiveModal(null)}
              title="취소 (ESC)"
            />

            {/* 6. 표마당(A) */}
            <div
              style={{ position: 'absolute', top: '124px', left: '346px', width: '81px', height: '28px', cursor: 'pointer' }}
              onClick={() => alert('표마당(A)')}
              title="표마당"
            />

            {/* 7. 표속성(P) */}
            <div
              style={{ position: 'absolute', top: '158px', left: '346px', width: '81px', height: '28px', cursor: 'pointer' }}
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
                    cursor: 'pointer',
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
                  document.execCommand('insertText', false, selectedChar);
                  setActiveModal(null);
                }}
                style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '4px 16px', borderRadius: '2px', cursor: 'pointer', fontSize: '12px' }}
              >
                넣기(Enter)
              </button>
              <button
                onClick={() => setActiveModal(null)}
                style={{ backgroundColor: '#ffffff', border: '1px solid #ccc', padding: '4px 16px', borderRadius: '2px', cursor: 'pointer', fontSize: '12px' }}
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
                style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '4px 12px', borderRadius: '2px', cursor: 'pointer', fontSize: '11px' }}
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
                style={{ backgroundColor: '#f5f5f5', border: '1px solid #ccc', padding: '4px 12px', borderRadius: '2px', cursor: 'pointer', fontSize: '11px' }}
              >
                모두 바꾸기
              </button>
              <button
                onClick={() => setActiveModal(null)}
                style={{ backgroundColor: '#ffffff', border: '1px solid #ccc', padding: '4px 12px', borderRadius: '2px', cursor: 'pointer', fontSize: '11px' }}
              >
                취소
              </button>
            </div>
          </div>
        </ModalWrapper>
      )}

      {/* 14. 편집 용지 설정 모달 (F7) */}
      {activeModal === 'page' && (
        <ModalWrapper title="편집 용지 (F7)" onClose={() => setActiveModal(null)} width="400px" height="320px">
          <div style={{ padding: '20px', display: 'flex', flexDirection: 'column', gap: '12px', fontSize: '12px' }}>
            <div style={{ fontWeight: 'bold' }}>용지 종류: A4 (210.0 x 297.0 mm)</div>
            <div style={{ border: '1px solid #eee', padding: '10px', borderRadius: '4px' }}>
              <div style={{ fontWeight: 'bold', marginBottom: '8px' }}>용지 여백 (mm)</div>
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '8px' }}>
                <div>위쪽: <input type="number" defaultValue="20.0" style={{ width: '50px' }} /></div>
                <div>아래쪽: <input type="number" defaultValue="15.0" style={{ width: '50px' }} /></div>
                <div>왼쪽: <input type="number" defaultValue="30.0" style={{ width: '50px' }} /></div>
                <div>오른쪽: <input type="number" defaultValue="30.0" style={{ width: '50px' }} /></div>
              </div>
            </div>
            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '8px', marginTop: '10px' }}>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}>설정(Enter)</button>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#fff', border: '1px solid #ccc', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}>취소(ESC)</button>
            </div>
          </div>
        </ModalWrapper>
      )}

      {/* 15. 글자 모양 설정 모달 (Alt+L) */}
      {activeModal === 'font' && (
        <ModalWrapper title="글자 모양 (Alt+L)" onClose={() => setActiveModal(null)} width="440px" height="360px">
          <div style={{ padding: '16px', display: 'flex', flexDirection: 'column', gap: '12px', fontSize: '12px' }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>기준 크기:</span>
              <div>
                <input
                  type="number"
                  value={fontConfig.size}
                  onChange={(e) => setFontConfig(p => ({ ...p, size: Number(e.target.value) }))}
                  style={{ width: '60px', padding: '2px 4px' }}
                /> pt
              </div>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>글꼴:</span>
              <select
                value={fontConfig.font}
                onChange={(e) => setFontConfig(p => ({ ...p, font: e.target.value }))}
                style={{ width: '160px', padding: '2px 4px' }}
              >
                <option value="함초롬바탕">함초롬바탕</option>
                <option value="함초롬돋움">함초롬돋움</option>
                <option value="맑은 고딕">맑은 고딕</option>
                <option value="바탕">바탕</option>
                <option value="궁서">궁서</option>
              </select>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>장평 (가로비):</span>
              <div>
                <input
                  type="number"
                  value={fontConfig.width}
                  onChange={(e) => setFontConfig(p => ({ ...p, width: Number(e.target.value) }))}
                  style={{ width: '60px', padding: '2px 4px' }}
                /> %
              </div>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>자간 (글자 사이):</span>
              <div>
                <input
                  type="number"
                  value={fontConfig.spacing}
                  onChange={(e) => setFontConfig(p => ({ ...p, spacing: Number(e.target.value) }))}
                  style={{ width: '60px', padding: '2px 4px' }}
                /> %
              </div>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>글자 색:</span>
              <input
                type="color"
                value={fontConfig.color}
                onChange={(e) => setFontConfig(p => ({ ...p, color: e.target.value }))}
                style={{ width: '40px', height: '24px', cursor: 'pointer' }}
              />
            </div>
            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '8px', marginTop: 'auto' }}>
              <button
                onClick={() => {
                  const sel = window.getSelection();
                  if (sel && sel.rangeCount > 0) {
                    const span = document.createElement('span');
                    span.style.fontFamily = fontConfig.font;
                    span.style.fontSize = `${fontConfig.size * 1.33}px`;
                    span.style.color = fontConfig.color;
                    span.style.letterSpacing = `${fontConfig.spacing * 0.1}px`;
                    if (fontConfig.width !== 100) {
                      span.style.display = 'inline-block';
                      span.style.transform = `scaleX(${fontConfig.width / 100})`;
                      span.style.transformOrigin = 'left center';
                    }
                    const range = sel.getRangeAt(0);
                    span.appendChild(range.extractContents());
                    range.insertNode(span);
                  }
                  setActiveModal(null);
                }}
                style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}
              >
                설정(Enter)
              </button>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#fff', border: '1px solid #ccc', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}>취소(ESC)</button>
            </div>
          </div>
        </ModalWrapper>
      )}

      {/* 16. 문단 모양 설정 모달 (Alt+T) */}
      {activeModal === 'paragraph' && (
        <ModalWrapper title="문단 모양 (Alt+T)" onClose={() => setActiveModal(null)} width="400px" height="280px">
          <div style={{ padding: '20px', display: 'flex', flexDirection: 'column', gap: '12px', fontSize: '12px' }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>줄 간격:</span>
              <div>
                <input
                  type="number"
                  value={paraConfig.lineHeight}
                  onChange={(e) => setParaConfig(p => ({ ...p, lineHeight: Number(e.target.value) }))}
                  style={{ width: '60px', padding: '2px 4px' }}
                /> %
              </div>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>정렬 방식:</span>
              <select
                value={paraConfig.align}
                onChange={(e) => setParaConfig(p => ({ ...p, align: e.target.value }))}
                style={{ width: '120px', padding: '2px 4px' }}
              >
                <option value="justify">양쪽 정렬</option>
                <option value="left">왼쪽 정렬</option>
                <option value="center">가운데 정렬</option>
                <option value="right">오른쪽 정렬</option>
              </select>
            </div>
            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '8px', marginTop: 'auto' }}>
              <button
                onClick={() => {
                  if (editorRef.current) {
                    editorRef.current.style.textAlign = paraConfig.align;
                    editorRef.current.style.lineHeight = `${paraConfig.lineHeight / 100}`;
                  }
                  setActiveModal(null);
                }}
                style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}
              >
                설정(Enter)
              </button>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#fff', border: '1px solid #ccc', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}>취소(ESC)</button>
            </div>
          </div>
        </ModalWrapper>
      )}

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
                        cursor: 'pointer',
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
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}>적용(Enter)</button>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#fff', border: '1px solid #ccc', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}>닫기(ESC)</button>
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
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '5px 20px', borderRadius: '2px', cursor: 'pointer' }}>확인(Enter)</button>
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
            <span style={{ cursor: 'pointer', color: '#666', fontSize: '12px' }} title="도움말">?</span>
            <span onClick={onClose} style={{ cursor: 'pointer', color: '#444', fontSize: '13px' }} title="닫기 (ESC)">✕</span>
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
        cursor: 'pointer',
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
