import React, { useState, useEffect, useRef } from 'react';

export default function App() {
  const [docTitle, setDocTitle] = useState('빈 문서 1');
  const [activeMenu, setActiveMenu] = useState('편집');
  const [zoom, setZoom] = useState(100);
  const [contextMenu, setContextMenu] = useState<{ x: number; y: number; visible: boolean }>({ x: 0, y: 0, visible: false });
  const [caret, setCaret] = useState({ page: 1, section: 1, col: 1, line: 1, chars: 0, strokes: 0 });
  const [showEqModal, setShowEqModal] = useState(false);
  const [eqScript, setEqScript] = useState('{a+b} over {c} + sqrt {x^2+y^2}');
  const [isStandalone, setIsStandalone] = useState(false);
  const editorRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    // PWA standalone 감지
    if (window.matchMedia('(display-mode: standalone)').matches || (window.navigator as any).standalone) {
      setIsStandalone(true);
    }

    const handleClickOutside = () => {
      setContextMenu(prev => prev.visible ? { ...prev, visible: false } : prev);
    };
    window.addEventListener('click', handleClickOutside);
    return () => window.removeEventListener('click', handleClickOutside);
  }, []);

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
        fontSize: '12px'
      }}
    >
      {/* 1. 최상단 타이틀바 (PWA 독립창이 아닐 때만 표시, standalone일 땐 OS 타이틀바와 중복 방지) */}
      {!isStandalone && (
        <div style={{
          height: '28px',
          backgroundColor: '#ffffff',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          padding: '0 8px 0 10px',
          borderBottom: '1px solid #f0f0f0',
          fontSize: '12px'
        }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
            <img src="/pwa-192x192.png" alt="logo" style={{ width: '16px', height: '16px' }} />
            <span style={{ color: '#555555', fontSize: '11px' }}>{docTitle} - 한글</span>
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '14px', fontSize: '11px', color: '#666666' }}>
            <span style={{ cursor: 'pointer' }}>로그인</span>
            <span title="최소화" style={{ cursor: 'pointer' }}>─</span>
            <span title="최대화" style={{ cursor: 'pointer' }}>□</span>
            <span title="닫기" style={{ cursor: 'pointer', color: '#e53935' }}>✕</span>
          </div>
        </div>
      )}

      {/* 2. 메인 메뉴바 (한글 2022 원본 정합) */}
      <div style={{
        height: '28px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        padding: '0 8px',
        borderBottom: '1px solid #e0e0e0'
      }}>
        <div style={{ display: 'flex', alignItems: 'center', height: '100%' }}>
          {/* 한글 2022 로고 큐브 */}
          <img
            src="/pwa-192x192.png"
            alt="logo"
            style={{ width: '16px', height: '16px', marginRight: '8px' }}
          />

          {menus.map((m) => {
            const isActive = activeMenu === m.name;
            return (
              <div
                key={m.name}
                onClick={() => setActiveMenu(m.name)}
                style={{
                  padding: '0 9px',
                  height: '100%',
                  display: 'flex',
                  alignItems: 'center',
                  cursor: 'pointer',
                  color: isActive ? '#00b4ff' : '#333333',
                  fontWeight: isActive ? 'bold' : 'normal',
                  borderBottom: isActive ? '2px solid #00b4ff' : '2px solid transparent',
                  fontSize: '12px',
                  letterSpacing: '-0.3px'
                }}
              >
                <span>{m.name}</span>
                {m.hasSub && (
                  <span style={{ fontSize: '7px', marginLeft: '3px', color: isActive ? '#00b4ff' : '#888888' }}>▾</span>
                )}
              </div>
            );
          })}
          <span style={{ cursor: 'pointer', marginLeft: '8px', fontSize: '12px', opacity: 0.8 }}>🚀</span>
        </div>

        {/* 우측 검색 인풋 */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
          <div style={{
            display: 'flex',
            alignItems: 'center',
            backgroundColor: '#ffffff',
            border: '1px solid #d5d5d5',
            borderRadius: '2px',
            padding: '2px 6px',
            width: '135px',
            height: '19px'
          }}>
            <input
              type="text"
              placeholder="찾을 내용"
              style={{ border: 'none', background: 'transparent', outline: 'none', fontSize: '11px', width: '100%', color: '#555555' }}
            />
          </div>
          <span style={{ cursor: 'pointer', fontSize: '9px', color: '#666666' }}>∧</span>
          <span style={{ cursor: 'pointer', fontSize: '10px', color: '#666666' }}>✕</span>
        </div>
      </div>

      {/* 3. 대형 리본 툴바 1행 (한글 2022 편집 탭 원본 1:1 반응형) */}
      <div style={{
        height: '74px',
        backgroundColor: '#ffffff',
        borderBottom: '1px solid #e0e0e0',
        display: 'flex',
        alignItems: 'center',
        padding: '0 6px',
        gap: '2px',
        overflowX: 'auto',
        overflowY: 'hidden'
      }}>
        {/* 클립보드 */}
        <RibbonItem icon={<IconCut />} label="오려두기" disabled />
        <RibbonItem icon={<IconCopy />} label="복사하기" disabled />
        <RibbonItem icon={<IconPaste />} label="붙이기" disabled />
        <RibbonItem icon={<IconFormatPainter />} label="모양 복사" />
        <RibbonItem icon={<IconClearControl />} label="조판 부호 지우기" />

        <RibbonSep />

        {/* 서식 */}
        <RibbonItem icon={<IconFontShape />} label="글자 모양" onClick={() => setContextMenu({ x: 300, y: 200, visible: true })} />
        <RibbonItem icon={<IconParagraphShape />} label="문단 모양" />
        <RibbonItem icon={<IconStyle />} label="스타일" hasArrow />

        <RibbonSep />

        {/* 쪽/단 */}
        <RibbonItem icon={<IconPageVertical />} label="세로" active />
        <RibbonItem icon={<IconPageHorizontal />} label="가로" />
        <RibbonItem icon={<IconPageMargin />} label="쪽 여백" hasArrow />
        <RibbonItem icon={<IconMasterPage />} label="바탕쪽" />
        <RibbonItem icon={<IconColumns />} label="단" hasArrow />

        <RibbonSep />

        {/* 개체 삽입 */}
        <RibbonItem icon={<IconShape />} label="도형" hasArrow />
        <RibbonItem icon={<IconPicture />} label="그림" hasArrow />
        <RibbonItem icon={<IconTable />} label="표" hasArrow />
        <RibbonItem icon={<IconChart />} label="차트" />
        <RibbonItem icon={<IconSelectObject />} label="개체 선택" active hasArrow />
        <RibbonItem icon={<IconProtectObject />} label="개체 보호" hasArrow />

        <RibbonSep />

        {/* 찾기 / 정렬 / 수식 */}
        <RibbonItem icon={<IconEquation />} label="수식" onClick={() => setShowEqModal(true)} />
        <RibbonItem icon={<IconFind />} label="찾기" hasArrow />
        <RibbonItem icon={<IconReplace />} label="글자 바꾸기" />
        <RibbonItem icon={<IconAlign />} label="정렬" />
      </div>

      {/* 4. 빠른 서식 툴바 2행 */}
      <div style={{
        height: '28px',
        backgroundColor: '#ffffff',
        borderBottom: '1px solid #dcdcdc',
        display: 'flex',
        alignItems: 'center',
        padding: '0 8px',
        gap: '4px',
        fontSize: '11px',
        color: '#333333',
        overflowX: 'auto',
        overflowY: 'hidden'
      }}>
        <ToolBtn icon="📄" title="새 문서 (Alt+N)" />
        <ToolBtn icon="📂" title="불러오기 (Alt+O)" />
        <ToolBtn icon="💾" title="저장하기 (Alt+S)" />
        <ToolBtn icon="🖨️" title="인쇄 (Alt+P)" />
        <ToolSep />
        <ToolBtn icon="↩️" title="되돌리기 (Ctrl+Z)" />
        <ToolBtn icon="↪️" title="다시 실행 (Ctrl+Y)" />
        <ToolSep />

        <select style={{ height: '22px', fontSize: '11px', border: '1px solid #d5d5d5', borderRadius: '2px', padding: '0 4px', backgroundColor: '#fff' }}>
          <option>바탕글</option>
          <option>본문</option>
          <option>개요 1</option>
        </select>
        <select style={{ height: '22px', fontSize: '11px', border: '1px solid #d5d5d5', borderRadius: '2px', padding: '0 4px', backgroundColor: '#fff' }}>
          <option>대표</option>
          <option>한글</option>
        </select>
        <select style={{ height: '22px', fontSize: '11px', border: '1px solid #d5d5d5', borderRadius: '2px', padding: '0 4px', backgroundColor: '#fff', width: '105px' }}>
          <option>함초롬바탕</option>
          <option>함초롬돋움</option>
          <option>맑은 고딕</option>
        </select>
        <select style={{ height: '22px', fontSize: '11px', border: '1px solid #d5d5d5', borderRadius: '2px', padding: '0 4px', backgroundColor: '#fff', width: '52px' }}>
          <option>10.0</option>
          <option>9.0</option>
          <option>11.0</option>
          <option>12.0</option>
        </select>
        <span style={{ fontSize: '10px', color: '#666' }}>pt</span>

        <ToolSep />

        <span style={{ fontWeight: 'bold', padding: '2px 5px', cursor: 'pointer' }} title="굵게">가</span>
        <span style={{ fontStyle: 'italic', padding: '2px 5px', cursor: 'pointer' }} title="기울임">가</span>
        <span style={{ textDecoration: 'underline', padding: '2px 5px', cursor: 'pointer' }} title="밑줄">가</span>
        <span style={{ textDecoration: 'line-through', padding: '2px 5px', cursor: 'pointer' }} title="취소선">가</span>
        <span style={{ color: '#d9381e', fontWeight: 'bold', padding: '2px 5px', cursor: 'pointer' }} title="글자 색">가▾</span>

        <ToolSep />

        <span style={{ cursor: 'pointer', padding: '0 3px' }} title="양쪽 정렬">≡</span>
        <span style={{ cursor: 'pointer', padding: '0 3px' }} title="왼쪽 정렬">⫷</span>
        <span style={{ cursor: 'pointer', padding: '0 3px' }} title="가운데 정렬">⩶</span>
        <span style={{ cursor: 'pointer', padding: '0 3px' }} title="오른쪽 정렬">⫸</span>
        <span style={{ cursor: 'pointer', padding: '0 3px' }} title="배분 정렬">⊞</span>

        <ToolSep />

        <input type="text" defaultValue="160" style={{ width: '30px', height: '18px', textAlign: 'center', border: '1px solid #d5d5d5', fontSize: '11px' }} />
        <span style={{ fontSize: '10px', color: '#666' }}>%</span>
      </div>

      {/* 5. 가로 눈금자 (중앙 A4 용지와 연동 정렬) */}
      <div style={{
        height: '20px',
        backgroundColor: '#ffffff',
        borderBottom: '1px solid #dcdcdc',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        position: 'relative',
        fontSize: '9px',
        color: '#666666'
      }}>
        <div style={{ width: '794px', display: 'flex', justifyContent: 'space-between', padding: '0 115px', position: 'relative', boxSizing: 'border-box' }}>
          <span style={{ position: 'absolute', left: '115px', top: '-1px', fontSize: '10px', color: '#0078d7' }}>⌛</span>
          {Array.from({ length: 19 }, (_, i) => (
            <span key={i} style={{ display: 'inline-block', width: '28px', textAlign: 'center' }}>
              {i === 0 ? '' : i}
            </span>
          ))}
          <span style={{ position: 'absolute', right: '112px', top: '-1px', fontSize: '10px', color: '#0078d7' }}>▲</span>
        </div>
      </div>

      {/* 6. 중앙 워크스페이스 (세로 눈금자 + 회색 배경 캔버스 + A4 백지 + 우측 스크롤바) */}
      <div style={{
        flex: 1,
        display: 'flex',
        minHeight: 0,
        backgroundColor: '#f5f5f5',
        position: 'relative',
        overflow: 'hidden'
      }}>
        {/* 세로 눈금자 */}
        <div style={{
          width: '20px',
          backgroundColor: '#ffffff',
          borderRight: '1px solid #dcdcdc',
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          paddingTop: '20px',
          fontSize: '9px',
          color: '#666666',
          flexShrink: 0
        }}>
          {Array.from({ length: 18 }, (_, i) => (
            <span key={i} style={{ height: '42px', display: 'flex', alignItems: 'center' }}>
              {i === 0 ? '' : i}
            </span>
          ))}
        </div>

        {/* 캔버스 (스크롤 영역) */}
        <div style={{
          flex: 1,
          display: 'flex',
          justifyContent: 'center',
          overflowY: 'auto',
          padding: '20px',
          position: 'relative'
        }}>
          {/* A4 백지 (794px x 1123px, border #d0d0d0) */}
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

            {/* 실제 한글 본문 입력 영역 */}
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
                fontSize: '13.33px', // 10pt
                lineHeight: '1.6',   // 160%
                color: '#111827',
                whiteSpace: 'pre-wrap',
                wordBreak: 'break-all',
                cursor: 'text',
                userSelect: 'text'
              }}
            />
          </div>
        </div>

        {/* 우측 스크롤바 */}
        <div style={{
          width: '16px',
          backgroundColor: '#f5f5f5',
          borderLeft: '1px solid #e0e0e0',
          display: 'flex',
          flexDirection: 'column',
          justifyContent: 'space-between',
          alignItems: 'center',
          padding: '2px 0',
          color: '#888',
          flexShrink: 0
        }}>
          <span style={{ fontSize: '9px', cursor: 'pointer' }}>▲</span>
          <div style={{ width: '10px', height: '80px', backgroundColor: '#c8c8c8', borderRadius: '4px' }} />
          <div style={{ display: 'flex', flexDirection: 'column', gap: '2px' }}>
            <span style={{ fontSize: '9px', cursor: 'pointer' }}>▼</span>
            <span style={{ fontSize: '9px', cursor: 'pointer' }}>⏬</span>
          </div>
        </div>
      </div>

      {/* 7. 하단 문서 탭 바 */}
      <div style={{
        height: '24px',
        backgroundColor: '#ffffff',
        borderTop: '1px solid #dcdcdc',
        borderBottom: '1px solid #dcdcdc',
        display: 'flex',
        alignItems: 'center',
        padding: '0 8px',
        fontSize: '11px',
        color: '#555555'
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '6px', marginRight: '8px', fontSize: '9px' }}>
          <span style={{ cursor: 'pointer' }}>⏮</span>
          <span style={{ cursor: 'pointer' }}>◀</span>
          <span style={{ cursor: 'pointer' }}>▶</span>
          <span style={{ cursor: 'pointer' }}>⏭</span>
        </div>
        <div style={{
          backgroundColor: '#ffffff',
          border: '1px solid #00b4ff',
          borderBottom: 'none',
          padding: '3px 14px',
          fontWeight: '500',
          color: '#222222',
          borderRadius: '3px 3px 0 0',
          fontSize: '11px'
        }}>
          {docTitle}
        </div>
        <span style={{ marginLeft: '6px', cursor: 'pointer', fontSize: '13px', color: '#666' }}>+</span>
      </div>

      {/* 8. 최하단 상태표시줄 */}
      <div style={{
        height: '22px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        padding: '0 10px',
        fontSize: '11px',
        color: '#555555',
        borderTop: '1px solid #e5e5e5'
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '14px' }}>
          <span>{caret.page}/1 쪽</span>
          <span>{caret.section}단</span>
          <span>{caret.line}줄</span>
          <span>{caret.col}칸</span>
          <span>{caret.chars}글자</span>
          <span>문자 입력</span>
          <span>1/1 구역</span>
          <span>삽입</span>
          <span style={{ color: '#0078d7', cursor: 'pointer' }}>변경 내용 [기록 중지]</span>
          <span>타수: {caret.strokes}타</span>
        </div>

        {/* 우측 뷰 모드 및 확대 슬라이더 */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
          <span title="쪽 맞춤" style={{ cursor: 'pointer' }}>🗎</span>
          <span title="폭 맞춤" style={{ cursor: 'pointer' }}>↔</span>
          <span title="맞쪽 보기" style={{ cursor: 'pointer' }}>📖</span>
          <input
            type="range"
            min="50"
            max="200"
            value={zoom}
            onChange={(e) => setZoom(Number(e.target.value))}
            style={{ width: '80px', height: '3px', cursor: 'pointer', accentColor: '#0078d7' }}
          />
          <span style={{ width: '38px', textAlign: 'right' }}>{zoom}%</span>
        </div>
      </div>

      {/* 9. 한글 2022 원본 정합 우클릭 컨텍스트 메뉴 (완전 구현) */}
      {contextMenu.visible && (
        <div
          onClick={(e) => e.stopPropagation()}
          style={{
            position: 'fixed',
            top: `${contextMenu.y}px`,
            left: `${contextMenu.x}px`,
            width: '190px',
            backgroundColor: '#ffffff',
            border: '1px solid #c8c8c8',
            borderRadius: '2px',
            boxShadow: '0 4px 12px rgba(0,0,0,0.18)',
            padding: '4px 0',
            zIndex: 9999,
            fontSize: '12px',
            color: '#222222'
          }}
        >
          <ContextMenuItem label="글자 모양(L)..." shortcut="Alt+L" onClick={() => setContextMenu(prev => ({ ...prev, visible: false }))} />
          <ContextMenuItem label="문단 모양(T)..." shortcut="Alt+T" onClick={() => setContextMenu(prev => ({ ...prev, visible: false }))} />
          <ContextMenuItem label="스타일(S)..." shortcut="F6" onClick={() => setContextMenu(prev => ({ ...prev, visible: false }))} />
          <ContextMenuItem label="수식(M)..." shortcut="Ctrl+N,M" onClick={() => { setShowEqModal(true); setContextMenu(prev => ({ ...prev, visible: false })); }} />
          <ContextMenuItem label="표 만들기(T)..." shortcut="Ctrl+N,T" onClick={() => setContextMenu(prev => ({ ...prev, visible: false }))} />
          <ContextMenuDivider />
          <ContextMenuItem label="오려두기(X)" shortcut="Ctrl+X" disabled />
          <ContextMenuItem label="복사하기(C)" shortcut="Ctrl+C" disabled />
          <ContextMenuItem label="붙이기(V)" shortcut="Ctrl+V" />
          <ContextMenuItem label="골라 붙이기(S)..." shortcut="Ctrl+Alt+V" />
          <ContextMenuItem label="모양 복사(C)..." shortcut="Alt+C" />
          <ContextMenuDivider />
          <ContextMenuItem label="블록 지정(B)" shortcut="F4" />
          <ContextMenuItem label="모두 선택(A)" shortcut="Ctrl+A" onClick={() => { document.execCommand('selectAll', false); setContextMenu(prev => ({ ...prev, visible: false })); }} />
          <ContextMenuDivider />
          <ContextMenuItem label="조판 부호 지우기..." />
        </div>
      )}

      {/* 10. 한글 2022 수식 편집기 모달 창 (Ctrl+N,M 또는 수식 클릭 시) */}
      {showEqModal && (
        <div style={{
          position: 'fixed',
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          backgroundColor: 'rgba(0,0,0,0.3)',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          zIndex: 10000
        }}>
          <div style={{
            width: '640px',
            height: '420px',
            backgroundColor: '#ffffff',
            borderRadius: '4px',
            boxShadow: '0 8px 24px rgba(0,0,0,0.2)',
            border: '1px solid #0078d7',
            display: 'flex',
            flexDirection: 'column',
            overflow: 'hidden'
          }}>
            <div style={{
              height: '30px',
              backgroundColor: '#0078d7',
              color: '#ffffff',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'space-between',
              padding: '0 10px',
              fontSize: '12px',
              fontWeight: 'bold'
            }}>
              <span>수식 편집기 - 한글 2022</span>
              <span onClick={() => setShowEqModal(false)} style={{ cursor: 'pointer' }}>✕</span>
            </div>

            {/* 수식 툴바 */}
            <div style={{ height: '34px', backgroundColor: '#f5f5f5', borderBottom: '1px solid #ddd', display: 'flex', alignItems: 'center', padding: '0 6px', gap: '4px' }}>
              <button onClick={() => setEqScript(p => p + ' {a} over {b} ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>분수</button>
              <button onClick={() => setEqScript(p => p + ' sqrt {x} ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>근호</button>
              <button onClick={() => setEqScript(p => p + ' ^{2} ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>위첨자</button>
              <button onClick={() => setEqScript(p => p + ' _{1} ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>아래첨자</button>
              <button onClick={() => setEqScript(p => p + ' sum _{i=1} ^{n} ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>합(sum)</button>
              <button onClick={() => setEqScript(p => p + ' int _{0} ^{1} ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>적분(int)</button>
              <button onClick={() => setEqScript(p => p + ' matrix { a & b # c & d } ')} style={{ padding: '2px 8px', fontSize: '11px', cursor: 'pointer' }}>행렬</button>
            </div>

            {/* 수식 렌더링 뷰어 */}
            <div style={{ flex: 1, display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '16px', backgroundColor: '#fafafa', borderBottom: '1px solid #ddd' }}>
              <div style={{ fontSize: '26px', fontFamily: '"Times New Roman", "Batang", serif', fontStyle: 'italic', color: '#111' }}>
                {eqScript}
              </div>
            </div>

            {/* 수식 스크립트 에디터 */}
            <div style={{ height: '110px', display: 'flex', flexDirection: 'column' }}>
              <textarea
                value={eqScript}
                onChange={(e) => setEqScript(e.target.value)}
                style={{
                  flex: 1,
                  padding: '8px',
                  border: 'none',
                  outline: 'none',
                  fontSize: '13px',
                  fontFamily: 'Consolas, monospace',
                  resize: 'none'
                }}
              />
              <div style={{ height: '34px', backgroundColor: '#f0f0f0', borderTop: '1px solid #ddd', display: 'flex', alignItems: 'center', justifyContent: 'flex-end', padding: '0 8px', gap: '6px' }}>
                <button
                  onClick={() => {
                    // 본문 삽입
                    if (editorRef.current) {
                      editorRef.current.innerText += ` [수식: ${eqScript}] `;
                    }
                    setShowEqModal(false);
                  }}
                  style={{ backgroundColor: '#0078d7', color: '#fff', border: 'none', padding: '4px 12px', borderRadius: '2px', cursor: 'pointer', fontSize: '11px' }}
                >
                  본문에 넣기 (Shift+ESC)
                </button>
                <button
                  onClick={() => setShowEqModal(false)}
                  style={{ backgroundColor: '#ffffff', border: '1px solid #ccc', padding: '4px 12px', borderRadius: '2px', cursor: 'pointer', fontSize: '11px' }}
                >
                  취소 (ESC)
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
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

function ToolBtn({ icon, title }: { icon: string; title: string }) {
  return (
    <span
      title={title}
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
