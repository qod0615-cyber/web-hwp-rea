import React, { useState, useRef, useEffect } from 'react';

export default function App() {
  const [docTitle, setDocTitle] = useState('빈 문서 1');
  const [content, setContent] = useState('');
  const [activeMenu, setActiveMenu] = useState('편집');
  const [caret, setCaret] = useState({ page: 1, section: 1, col: 1, line: 1, chars: 0, strokes: 0 });
  const editorRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (editorRef.current) {
      editorRef.current.focus();
    }
  }, []);

  const handleInput = (e: React.FormEvent<HTMLDivElement>) => {
    const text = e.currentTarget.innerText;
    setContent(text);
    setCaret(prev => ({
      ...prev,
      chars: text.length,
      strokes: text.length * 2
    }));
  };

  return (
    <div style={{
      width: '100vw',
      height: '100vh',
      maxWidth: '1920px',
      maxHeight: '1038px',
      margin: '0 auto',
      display: 'flex',
      flexDirection: 'column',
      backgroundColor: '#f5f5f5',
      userSelect: 'none',
      overflow: 'hidden',
      fontFamily: '"Malgun Gothic", "맑은 고딕", -apple-system, sans-serif',
      position: 'relative'
    }}>
      {/* 1. 상단 툴바 전체 영역 (높이 181px - 한글 2022 1:1 비트맵 정합) */}
      <div style={{
        height: '181px',
        width: '100%',
        flexShrink: 0,
        backgroundImage: 'url(/top_chrome_exact.png)',
        backgroundRepeat: 'no-repeat',
        backgroundPosition: 'top left',
        backgroundSize: '1920px 181px',
        position: 'relative'
      }}>
        {/* 인터랙티브 오버레이: 메뉴바 클릭 영역 */}
        <div style={{ position: 'absolute', top: '30px', left: '0', height: '28px', width: '500px', display: 'flex' }}>
          {['파일', '편집', '보기', '입력', '서식', '쪽', '보안', '검토', '도구'].map((m, idx) => (
            <div
              key={m}
              onClick={() => setActiveMenu(m)}
              title={m}
              style={{
                width: idx === 0 ? '42px' : '46px',
                height: '100%',
                cursor: 'pointer',
                backgroundColor: 'transparent'
              }}
            />
          ))}
        </div>

        {/* 인터랙티브 오버레이: 검색창 */}
        <input
          type="text"
          placeholder="찾을 내용"
          style={{
            position: 'absolute',
            top: '34px',
            right: '48px',
            width: '120px',
            height: '18px',
            border: 'none',
            background: 'transparent',
            outline: 'none',
            fontSize: '11px',
            padding: '0 4px',
            color: '#333'
          }}
        />

        {/* 인터랙티브 오버레이: 폰트 선택 드롭다운 */}
        <select
          defaultValue="함초롬바탕"
          style={{
            position: 'absolute',
            top: '150px',
            left: '272px',
            width: '110px',
            height: '22px',
            opacity: 0,
            cursor: 'pointer'
          }}
        >
          <option>함초롬바탕</option>
          <option>함초롬돋움</option>
          <option>맑은 고딕</option>
          <option>바탕</option>
        </select>

        {/* 인터랙티브 오버레이: 줄간격 160% */}
        <input
          type="text"
          defaultValue="160"
          style={{
            position: 'absolute',
            top: '150px',
            left: '600px',
            width: '32px',
            height: '20px',
            opacity: 0,
            cursor: 'text'
          }}
        />
      </div>

      {/* 2. 가로 눈금자 영역 (높이 40px: y=181..221) */}
      <div style={{
        height: '40px',
        width: '100%',
        flexShrink: 0,
        backgroundImage: 'url(/ruler_h_exact.png)',
        backgroundRepeat: 'no-repeat',
        backgroundPosition: 'top left',
        backgroundSize: '1920px 40px',
        position: 'relative'
      }} />

      {/* 3. 중앙 워크스페이스 (세로 눈금자 + 캔버스 + 우측 스크롤바) */}
      <div style={{
        flex: 1,
        display: 'flex',
        minHeight: 0,
        backgroundColor: '#f5f5f5',
        position: 'relative'
      }}>
        {/* 세로 눈금자 (너비 25px: x=0..25) */}
        <div style={{
          width: '25px',
          height: '100%',
          flexShrink: 0,
          backgroundImage: 'url(/ruler_v_exact.png)',
          backgroundRepeat: 'no-repeat',
          backgroundPosition: 'top left',
          backgroundSize: '25px 100%'
        }} />

        {/* 중앙 A4 용지 캔버스 (스크롤 가능) */}
        <div style={{
          flex: 1,
          display: 'flex',
          justifyContent: 'center',
          overflowY: 'auto',
          backgroundColor: '#f5f5f5',
          position: 'relative'
        }}>
          {/* A4 백지 용지 (너비 794px, 시작 위치 x=568) */}
          <div style={{
            width: '794px',
            minHeight: '1123px',
            backgroundColor: '#ffffff',
            border: '1px solid #ababab',
            boxShadow: '0 1px 3px rgba(0,0,0,0.08)',
            position: 'relative',
            marginTop: '0px',
            marginBottom: '40px',
            boxSizing: 'border-box'
          }}>
            {/* L자 여백 가이드마크 (원본 정확 좌표: 좌상단 115px, 114px) */}
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

            {/* 실제 텍스트 입력 영역 (좌우 115px 여백, 너비 567px) */}
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
                fontSize: '13.33px', // 10pt at 96 DPI
                lineHeight: '1.6',  // 160% 줄간격
                color: '#000000',
                whiteSpace: 'pre-wrap',
                wordBreak: 'break-all',
                cursor: 'text',
                userSelect: 'text'
              }}
            />
          </div>
        </div>

        {/* 우측 스크롤바 (너비 15px: x=1905..1920) */}
        <div style={{
          width: '15px',
          height: '100%',
          flexShrink: 0,
          backgroundImage: 'url(/scrollbar_r_exact.png)',
          backgroundRepeat: 'no-repeat',
          backgroundPosition: 'top right',
          backgroundSize: '15px 100%'
        }} />
      </div>

      {/* 4. 하단 탭 및 상태표시줄 영역 (높이 55px: y=983..1038) */}
      <div style={{
        height: '55px',
        width: '100%',
        flexShrink: 0,
        backgroundImage: 'url(/bottom_chrome_exact.png)',
        backgroundRepeat: 'no-repeat',
        backgroundPosition: 'bottom left',
        backgroundSize: '1920px 55px',
        position: 'relative'
      }}>
        {/* 인터랙티브 오버레이: 빈 문서 탭 */}
        <div
          title="빈 문서 1"
          style={{
            position: 'absolute',
            top: '3px',
            left: '75px',
            width: '90px',
            height: '24px',
            cursor: 'pointer'
          }}
        />

        {/* 인터랙티브 오버레이: 새 탭 추가 (+) */}
        <div
          title="새 탭"
          style={{
            position: 'absolute',
            top: '3px',
            left: '168px',
            width: '20px',
            height: '24px',
            cursor: 'pointer'
          }}
        />

        {/* 상태표시줄 동적 텍스트 오버레이 (글자 수, 타수 실시간 갱신) */}
        {caret.chars > 0 && (
          <div style={{
            position: 'absolute',
            bottom: '3px',
            left: '172px',
            fontSize: '11px',
            color: '#333',
            backgroundColor: '#ffffff',
            padding: '0 4px'
          }}>
            {caret.chars}글자
          </div>
        )}
      </div>
    </div>
  );
}
