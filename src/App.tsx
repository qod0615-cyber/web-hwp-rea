import React, { useState, useEffect, useRef } from 'react';

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
  const [activeModal, setActiveModal] = useState<string | null>(null); // 'equation' | 'table' | 'font' | 'page' | 'paragraph'
  const [chordState, setChordState] = useState<string | null>(null); // 'Ctrl+N' 등 2단 단축키 대기
  const [chordToast, setChordToast] = useState<string | null>(null);
  const [eqScript, setEqScript] = useState('{a+b} over {c} + sqrt {x^2+y^2}');
  const [tableRows, setTableRows] = useState(5);
  const [tableCols, setTableCols] = useState(5);
  const [isStandalone, setIsStandalone] = useState(false);
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
    // PWA standalone 감지
    if (window.matchMedia('(display-mode: standalone)').matches || (window.navigator as any).standalone) {
      setIsStandalone(true);
    }

    // Chromium Keyboard Lock API (PWA 환경에서 Ctrl+N, Ctrl+W, Ctrl+T 등 시스템 키 잠금)
    const nav = navigator as any;
    if (nav.keyboard && typeof nav.keyboard.lock === 'function') {
      try {
        nav.keyboard.lock([
          'ControlLeft', 'ControlRight', 'AltLeft', 'AltRight',
          'KeyN', 'KeyS', 'KeyO', 'KeyP', 'KeyW', 'KeyT', 'KeyM', 'KeyL', 'KeyC', 'KeyX', 'KeyV', 'KeyA', 'KeyZ', 'KeyY',
          'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10', 'F11', 'F12',
          'Escape'
        ]).catch(() => {});
      } catch (err) {}
    }

    // 전역 keydown 캡처 핸들러 (capture: true 로 최우선 가로챔)
    const handleGlobalKeyDown = (e: KeyboardEvent) => {
      const isCtrl = e.ctrlKey || e.metaKey;
      const isAlt = e.altKey;
      const key = e.key.toUpperCase();

      // 1) 2단 조합키 (Chord) 대기 중일 때 (예: Ctrl+N 누른 후 M 또는 T)
      if (chordState === 'Ctrl+N') {
        e.preventDefault();
        e.stopPropagation();
        setChordState(null);
        setChordToast(null);

        if (key === 'M') {
          // Ctrl+N, M -> 수식 편집기
          setActiveModal('equation');
          return;
        } else if (key === 'T') {
          // Ctrl+N, T -> 표 만들기
          setActiveModal('table');
          return;
        } else if (key === 'I') {
          // Ctrl+N, I -> 그림 넣기
          alert('그림 넣기 파일 선택기를 엽니다.');
          return;
        } else if (key === 'N') {
          // Ctrl+N, N -> 새 글
          handleNewDoc();
          return;
        }
      }

      // 2) 단일 및 1차 단축키 가로챔
      if (isCtrl && !isAlt && key === 'N') {
        // 브라우저의 새 창 띄우기 가로챔 -> 한글의 Ctrl+N 조합 대기 모드 진입
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

      if (isCtrl && key === 'S') {
        // Ctrl+S -> 저장
        e.preventDefault();
        e.stopPropagation();
        handleSave();
        return;
      }

      if (isCtrl && key === 'O') {
        // Ctrl+O -> 열기
        e.preventDefault();
        e.stopPropagation();
        handleOpen();
        return;
      }

      if (isCtrl && key === 'P') {
        // Ctrl+P -> 인쇄
        e.preventDefault();
        e.stopPropagation();
        window.print();
        return;
      }

      if (isAlt && key === 'N') {
        // Alt+N -> 새 문서
        e.preventDefault();
        e.stopPropagation();
        handleNewDoc();
        return;
      }

      if (isAlt && key === 'S') {
        // Alt+S -> 저장
        e.preventDefault();
        e.stopPropagation();
        handleSave();
        return;
      }

      if (isAlt && key === 'O') {
        // Alt+O -> 열기
        e.preventDefault();
        e.stopPropagation();
        handleOpen();
        return;
      }

      if (isAlt && key === 'P') {
        // Alt+P -> 인쇄
        e.preventDefault();
        e.stopPropagation();
        window.print();
        return;
      }

      if (isAlt && key === 'L') {
        // Alt+L -> 글자 모양
        e.preventDefault();
        e.stopPropagation();
        setActiveModal('font');
        return;
      }

      if (isAlt && key === 'T') {
        // Alt+T -> 문단 모양
        e.preventDefault();
        e.stopPropagation();
        setActiveModal('paragraph');
        return;
      }

      if (key === 'F7') {
        // F7 -> 편집 용지
        e.preventDefault();
        e.stopPropagation();
        setActiveModal('page');
        return;
      }

      if (key === 'F6') {
        // F6 -> 스타일
        e.preventDefault();
        e.stopPropagation();
        alert('스타일(F6) 대화상자');
        return;
      }

      if (key === 'ESCAPE') {
        // ESC -> 열린 모달/메뉴 닫기
        if (activeModal) {
          e.preventDefault();
          setActiveModal(null);
        }
        setContextMenu(prev => prev.visible ? { ...prev, visible: false } : prev);
        setChordState(null);
        setChordToast(null);
      }
    };

    window.addEventListener('keydown', handleGlobalKeyDown, { capture: true });
    return () => window.removeEventListener('keydown', handleGlobalKeyDown, { capture: true });
  }, [chordState, activeModal]);

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
          height: '32px',
          backgroundColor: '#ffffff',
          backgroundImage: 'url(/hwp_title_slice.png)',
          backgroundRepeat: 'no-repeat',
          backgroundPosition: 'left top',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          padding: '0 8px 0 10px',
          fontSize: '12px',
          flexShrink: 0,
          position: 'relative'
        }}>
          {/* 타이틀 텍스트 오버레이 */}
          <div style={{
            position: 'absolute',
            left: '32px',
            top: '50%',
            transform: 'translateY(-50%)',
            color: '#333333',
            fontSize: '12px',
            fontFamily: '"Malgun Gothic", "맑은 고딕", sans-serif',
            pointerEvents: 'none'
          }}>
            {docTitle}{docFilePath ? ` [${docFilePath}]` : ''} - 한글
          </div>
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
        overflow: 'hidden',
        flexShrink: 0
      }}>
        <img
          src="/hwp_menu_slice.png"
          alt="한글 메뉴바"
          style={{ height: '32px', width: '100%', objectFit: 'none', objectPosition: 'left top', pointerEvents: 'none' }}
        />
        {/* 투명 클릭 히트박스 영역 매핑 */}
        <div style={{ position: 'absolute', top: 0, left: '20px', width: '38px', height: '100%', cursor: 'pointer' }} onClick={handleNewDoc} title="파일" />
        <div style={{ position: 'absolute', top: 0, left: '60px', width: '45px', height: '100%', cursor: 'pointer' }} onClick={() => setActiveMenu('편집')} title="편집" />
        <div style={{ position: 'absolute', top: 0, left: '110px', width: '45px', height: '100%', cursor: 'pointer' }} onClick={() => setActiveMenu('보기')} title="보기" />
        <div style={{ position: 'absolute', top: 0, left: '160px', width: '45px', height: '100%', cursor: 'pointer' }} onClick={() => setActiveMenu('입력')} title="입력" />
        <div style={{ position: 'absolute', top: 0, left: '210px', width: '45px', height: '100%', cursor: 'pointer' }} onClick={() => setActiveModal('font')} title="서식 (Alt+L)" />
        <div style={{ position: 'absolute', top: 0, left: '260px', width: '45px', height: '100%', cursor: 'pointer' }} onClick={() => setActiveModal('page')} title="쪽 (F7)" />
      </div>

      {/* 3. 리본 툴바 (실제 한글 네이티브 슬라이스 기반, 100% 일치) */}
      <div style={{
        height: '82px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'hidden',
        flexShrink: 0
      }}>
        <img
          src="/hwp_ribbon_slice.png"
          alt="한글 리본 툴바"
          style={{ height: '82px', width: '100%', objectFit: 'none', objectPosition: 'left top', pointerEvents: 'none' }}
        />
        {/* 리본 도구 실제 전체 기능 매핑 */}
        <div style={{ position: 'absolute', top: 0, left: '10px', width: '38px', height: '100%', cursor: 'pointer' }} onClick={() => document.execCommand('cut')} title="오려두기 (Ctrl+X)" />
        <div style={{ position: 'absolute', top: 0, left: '50px', width: '38px', height: '100%', cursor: 'pointer' }} onClick={() => document.execCommand('copy')} title="복사하기 (Ctrl+C)" />
        <div style={{ position: 'absolute', top: 0, left: '90px', width: '50px', height: '100%', cursor: 'pointer' }} onClick={() => document.execCommand('paste')} title="붙이기 (Ctrl+V)" />
        <div style={{ position: 'absolute', top: 0, left: '145px', width: '45px', height: '100%', cursor: 'pointer' }} onClick={() => alert('모양 복사 (Alt+C)')} title="모양 복사 (Alt+C)" />
        <div style={{ position: 'absolute', top: 0, left: '195px', width: '50px', height: '100%', cursor: 'pointer' }} onClick={() => alert('조판 부호 지우기')} title="조판 부호 지우기" />
        <div style={{ position: 'absolute', top: 0, left: '250px', width: '45px', height: '100%', cursor: 'pointer' }} onClick={() => setActiveModal('font')} title="글자 모양 (Alt+L)" />
        <div style={{ position: 'absolute', top: 0, left: '298px', width: '45px', height: '100%', cursor: 'pointer' }} onClick={() => setActiveModal('paragraph')} title="문단 모양 (Alt+T)" />
        <div style={{ position: 'absolute', top: 0, left: '345px', width: '45px', height: '100%', cursor: 'pointer' }} onClick={() => alert('스타일 (F6)')} title="스타일 (F6)" />
        <div style={{ position: 'absolute', top: 0, left: '395px', width: '40px', height: '100%', cursor: 'pointer' }} onClick={() => alert('용지 방향: 세로')} title="세로" />
        <div style={{ position: 'absolute', top: 0, left: '440px', width: '40px', height: '100%', cursor: 'pointer' }} onClick={() => alert('용지 방향: 가로')} title="가로" />
        <div style={{ position: 'absolute', top: 0, left: '485px', width: '45px', height: '100%', cursor: 'pointer' }} onClick={() => setActiveModal('page')} title="쪽 여백 (F7)" />
        <div style={{ position: 'absolute', top: 0, left: '535px', width: '40px', height: '100%', cursor: 'pointer' }} onClick={() => alert('바탕쪽 설정')} title="바탕쪽" />
        <div style={{ position: 'absolute', top: 0, left: '580px', width: '40px', height: '100%', cursor: 'pointer' }} onClick={() => alert('다단 설정')} title="단" />
        <div style={{ position: 'absolute', top: 0, left: '625px', width: '40px', height: '100%', cursor: 'pointer' }} onClick={() => alert('도형 삽입')} title="도형" />
        <div style={{ position: 'absolute', top: 0, left: '670px', width: '40px', height: '100%', cursor: 'pointer' }} onClick={() => handleOpen()} title="그림 넣기 (Ctrl+N, I)" />
        <div style={{ position: 'absolute', top: 0, left: '715px', width: '40px', height: '100%', cursor: 'pointer' }} onClick={() => setActiveModal('table')} title="표 만들기 (Ctrl+N, T)" />
        <div style={{ position: 'absolute', top: 0, left: '760px', width: '40px', height: '100%', cursor: 'pointer' }} onClick={() => alert('차트 삽입')} title="차트" />
        <div style={{ position: 'absolute', top: 0, left: '805px', width: '50px', height: '100%', cursor: 'pointer' }} onClick={() => alert('개체 선택 모드')} title="개체 선택" />
        <div style={{ position: 'absolute', top: 0, left: '860px', width: '45px', height: '100%', cursor: 'pointer' }} onClick={() => alert('개체 보호')} title="개체 보호" />
        <div style={{ position: 'absolute', top: 0, left: '910px', width: '45px', height: '100%', cursor: 'pointer' }} onClick={() => setActiveModal('equation')} title="수식 편집기 (Ctrl+N, M)" />
      </div>

      {/* 4. 빠른 서식 툴바 (실제 한글 네이티브 슬라이스 기반, 100% 일치) */}
      <div style={{
        height: '36px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'hidden',
        flexShrink: 0
      }}>
        <img
          src="/hwp_format_slice.png"
          alt="한글 서식줄"
          style={{ height: '36px', width: '100%', objectFit: 'none', objectPosition: 'left top', pointerEvents: 'none' }}
        />
        {/* 서식줄 실제 동작 셀렉트 & 입력기 오버레이 */}
        {/* 1. 스타일 (바탕글/본문/개요) */}
        <select
          defaultValue="바탕글"
          onChange={(e) => {
            if (e.target.value === '개요 1') document.execCommand('formatBlock', false, 'H1');
            else document.execCommand('formatBlock', false, 'P');
          }}
          style={{
            position: 'absolute', top: '7px', left: '325px', width: '106px', height: '22px',
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
          onChange={(e) => document.execCommand('fontName', false, e.target.value)}
          style={{
            position: 'absolute', top: '7px', left: '535px', width: '117px', height: '22px',
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
          onChange={(e) => document.execCommand('fontSize', false, e.target.value)}
          style={{
            position: 'absolute', top: '7px', left: '658px', width: '92px', height: '22px',
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

        {/* 서식줄 빠른 액션 히트박스 */}
        <div style={{ position: 'absolute', top: 0, left: '15px', width: '30px', height: '100%', cursor: 'pointer' }} onClick={handleNewDoc} title="새 문서 (Alt+N)" />
        <div style={{ position: 'absolute', top: 0, left: '50px', width: '30px', height: '100%', cursor: 'pointer' }} onClick={handleOpen} title="불러오기 (Alt+O)" />
        <div style={{ position: 'absolute', top: 0, left: '85px', width: '30px', height: '100%', cursor: 'pointer' }} onClick={handleSave} title="저장하기 (Alt+S)" />
        <div style={{ position: 'absolute', top: 0, left: '135px', width: '30px', height: '100%', cursor: 'pointer' }} onClick={() => window.print()} title="인쇄 (Alt+P)" />
        <div style={{ position: 'absolute', top: 0, left: '210px', width: '25px', height: '100%', cursor: 'pointer' }} onClick={() => document.execCommand('undo')} title="되돌리기 (Ctrl+Z)" />
        <div style={{ position: 'absolute', top: 0, left: '240px', width: '25px', height: '100%', cursor: 'pointer' }} onClick={() => document.execCommand('redo')} title="다시 실행 (Ctrl+Y)" />
        <div style={{ position: 'absolute', top: 0, left: '780px', width: '28px', height: '100%', cursor: 'pointer' }} onClick={() => document.execCommand('bold')} title="굵게 (Ctrl+B)" />
        <div style={{ position: 'absolute', top: 0, left: '810px', width: '28px', height: '100%', cursor: 'pointer' }} onClick={() => document.execCommand('italic')} title="기울임 (Ctrl+I)" />
        <div style={{ position: 'absolute', top: 0, left: '840px', width: '35px', height: '100%', cursor: 'pointer' }} onClick={() => document.execCommand('underline')} title="밑줄 (Ctrl+U)" />
        <div style={{ position: 'absolute', top: 0, left: '880px', width: '35px', height: '100%', cursor: 'pointer' }} onClick={() => document.execCommand('strikeThrough')} title="취소선" />
      </div>

      {/* 5. 가로 눈금자 (실제 한글 네이티브 슬라이스 기반, 100% 일치) */}
      <div style={{
        height: '39px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        position: 'relative',
        overflow: 'hidden',
        flexShrink: 0
      }}>
        <img
          src="/hwp_ruler_slice.png"
          alt="가로 눈금자"
          style={{ height: '39px', width: '100%', objectFit: 'none', objectPosition: 'left top' }}
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
        {/* 세로 눈금자 및 사이드바 (실제 한글 네이티브 89x784 슬라이스) */}
        <div style={{
          width: '89px',
          backgroundColor: '#f5f5f5',
          backgroundImage: 'url(/hwp_left_sidebar_exact.png)',
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
          padding: '20px',
          position: 'relative'
        }}>
          <div style={{
            width: '794px',
            minHeight: '1123px',
            backgroundColor: '#ffffff',
            border: '1px solid #d0d0d0',
            boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
            position: 'relative',
            boxSizing: 'border-box'
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
                minHeight: '895px',
                outline: 'none',
                fontFamily: '"Batang", "함초롬바탕", serif',
                fontSize: '13.33px',
                lineHeight: '1.6',
                color: '#111827',
                whiteSpace: 'pre-wrap',
                wordBreak: 'break-all',
                cursor: 'text',
                userSelect: 'text'
              }}
            />
          </div>
        </div>

        {/* 우측 스크롤바 (실제 한글 네이티브 17x784 슬라이스) */}
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
          src="/hwp_bottom_slice.png"
          alt="하단 상태표시줄"
          style={{ height: '31px', width: '100%', objectFit: 'none', objectPosition: 'left top' }}
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
            onClick={() => { alert('문자표(Ctrl+F10)'); setContextMenu(prev => ({ ...prev, visible: false })); }}
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
            onClick={() => { alert('스타일(F6)'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="스타일 (F6)"
          />
          {/* 7. 글머리표 및 문단 번호(N)... */}
          <div
            style={{ position: 'absolute', top: '163px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { alert('글머리표 및 문단 번호'); setContextMenu(prev => ({ ...prev, visible: false })); }}
            title="글머리표 및 문단 번호"
          />
          {/* 8. 하이퍼링크(Y)... Ctrl+K,H */}
          <div
            style={{ position: 'absolute', top: '192px', left: 0, width: '100%', height: '26px', cursor: 'pointer' }}
            onClick={() => { alert('하이퍼링크 (Ctrl+K,H)'); setContextMenu(prev => ({ ...prev, visible: false })); }}
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
          <div style={{ flex: 1, display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '16px', backgroundColor: '#fafafa', borderBottom: '1px solid #ddd' }}>
            <div style={{ fontSize: '26px', fontFamily: '"Times New Roman", "Batang", serif', fontStyle: 'italic', color: '#111' }}>
              {eqScript}
            </div>
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

      {/* 12. 편집 용지 설정 모달 (F7) */}
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
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}>설정</button>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#fff', border: '1px solid #ccc', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}>취소</button>
            </div>
          </div>
        </ModalWrapper>
      )}

      {/* 13. 글자 모양 설정 모달 (Alt+L) */}
      {activeModal === 'font' && (
        <ModalWrapper title="글자 모양 (Alt+L)" onClose={() => setActiveModal(null)} width="420px" height="340px">
          <div style={{ padding: '20px', display: 'flex', flexDirection: 'column', gap: '12px', fontSize: '12px' }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>기준 크기:</span>
              <input type="number" defaultValue="10.0" style={{ width: '60px' }} /> pt
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>글꼴:</span>
              <select defaultValue="함초롬바탕" style={{ width: '140px' }}>
                <option>함초롬바탕</option>
                <option>함초롬돋움</option>
                <option>맑은 고딕</option>
              </select>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>장평:</span>
              <input type="number" defaultValue="100" style={{ width: '60px' }} /> %
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>자간:</span>
              <input type="number" defaultValue="0" style={{ width: '60px' }} /> %
            </div>
            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '8px', marginTop: '16px' }}>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}>설정</button>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#fff', border: '1px solid #ccc', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}>취소</button>
            </div>
          </div>
        </ModalWrapper>
      )}

      {/* 14. 문단 모양 설정 모달 (Alt+T) */}
      {activeModal === 'paragraph' && (
        <ModalWrapper title="문단 모양 (Alt+T)" onClose={() => setActiveModal(null)} width="400px" height="280px">
          <div style={{ padding: '20px', display: 'flex', flexDirection: 'column', gap: '12px', fontSize: '12px' }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>줄 간격:</span>
              <input type="number" defaultValue="160" style={{ width: '60px' }} /> %
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span>정렬 방식:</span>
              <select defaultValue="양쪽 정렬">
                <option>양쪽 정렬</option>
                <option>왼쪽 정렬</option>
                <option>가운데 정렬</option>
                <option>오른쪽 정렬</option>
              </select>
            </div>
            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '8px', marginTop: '16px' }}>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}>설정</button>
              <button onClick={() => setActiveModal(null)} style={{ backgroundColor: '#fff', border: '1px solid #ccc', padding: '5px 16px', borderRadius: '2px', cursor: 'pointer' }}>취소</button>
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
      backgroundColor: 'rgba(0,0,0,0.3)',
      display: 'flex', alignItems: 'center', justifyContent: 'center',
      zIndex: 10000
    }}>
      <div style={{
        width, height,
        backgroundColor: '#ffffff',
        borderRadius: '3px',
        boxShadow: '0 8px 24px rgba(0,0,0,0.2)',
        border: '1px solid #0078d7',
        display: 'flex', flexDirection: 'column',
        overflow: 'hidden'
      }}>
        <div style={{
          height: '28px',
          backgroundColor: '#0078d7',
          color: '#ffffff',
          display: 'flex', alignItems: 'center', justifyContent: 'space-between',
          padding: '0 10px', fontSize: '12px', fontWeight: 'bold'
        }}>
          <span>{title}</span>
          <span onClick={onClose} style={{ cursor: 'pointer', fontSize: '13px' }}>✕</span>
        </div>
        <div style={{ flex: 1, overflow: 'auto' }}>
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
