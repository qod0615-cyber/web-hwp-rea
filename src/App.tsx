import React, { useState, useEffect, useRef } from 'react';

export default function App() {
  const [script, setScript] = useState<string>('{a+b} over {c} + sqrt {x^2 + y^2} = matrix { 1 & 0 # 0 & 1 }');
  const [fontSize, setFontSize] = useState<number>(10);
  const [zoom, setZoom] = useState<number>(100);
  const [isStandalone, setIsStandalone] = useState<boolean>(false);
  const [deferredPrompt, setDeferredPrompt] = useState<any>(null);

  useEffect(() => {
    // PWA 독립 실행 여부 감지
    if (window.matchMedia('(display-mode: standalone)').matches || (window.navigator as any).standalone) {
      setIsStandalone(true);
    }

    const handler = (e: any) => {
      e.preventDefault();
      setDeferredPrompt(e);
    };
    window.addEventListener('beforeinstallprompt', handler);
    return () => window.removeEventListener('beforeinstallprompt', handler);
  }, []);

  const handleInstallClick = () => {
    if (deferredPrompt) {
      deferredPrompt.prompt();
      deferredPrompt.userChoice.then((choiceResult: any) => {
        if (choiceResult.outcome === 'accepted') {
          setIsStandalone(true);
        }
        setDeferredPrompt(null);
      });
    }
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'column', height: '100vh', width: '100vw', backgroundColor: '#eef2f5', userSelect: 'none' }}>
      {/* 한글 2022 수식 편집기 상단 타이틀바 */}
      <header style={{
        height: '32px',
        backgroundColor: '#2b579a',
        color: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        padding: '0 12px',
        fontSize: '12px',
        fontWeight: 'bold',
        boxShadow: '0 1px 3px rgba(0,0,0,0.1)'
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
          <span>한글 2022 수식 편집기 (Web HWP REA)</span>
          <span style={{ fontSize: '10px', backgroundColor: '#4172b8', padding: '2px 6px', borderRadius: '4px' }}>
            {isStandalone ? 'PWA 앱 모드' : '웹 브라우저 모드'}
          </span>
        </div>
        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
          {!isStandalone && deferredPrompt && (
            <button
              onClick={handleInstallClick}
              style={{
                backgroundColor: '#38a169',
                color: '#ffffff',
                border: 'none',
                padding: '3px 8px',
                borderRadius: '3px',
                fontSize: '11px',
                cursor: 'pointer',
                fontWeight: 'normal'
              }}
            >
              📥 데스크톱 앱으로 설치
            </button>
          )}
          <span style={{ fontSize: '11px', opacity: 0.85 }}>Ver 2022.0.1</span>
        </div>
      </header>

      {/* 수식 툴바 (팔레트) */}
      <nav style={{
        height: '42px',
        backgroundColor: '#f6f8fa',
        borderBottom: '1px solid #d0d7de',
        display: 'flex',
        alignItems: 'center',
        padding: '0 8px',
        gap: '4px',
        overflowX: 'auto'
      }}>
        {[
          { label: '분수 (over)', sym: 'a/b', insert: ' {a} over {b} ' },
          { label: '근호 (sqrt)', sym: '√x', insert: ' sqrt {x} ' },
          { label: '위첨자 (^)', sym: 'x²', insert: ' ^{2} ' },
          { label: '아래첨자 (_)', sym: 'x₁', insert: ' _{1} ' },
          { label: '합 (sum)', sym: '∑', insert: ' sum _{i=1} ^{n} ' },
          { label: '적분 (int)', sym: '∫', insert: ' int _{0} ^{1} ' },
          { label: '괄호', sym: '( )', insert: ' left ( x right ) ' },
          { label: '행렬 (matrix)', sym: '[::]', insert: ' matrix { a & b # c & d } ' },
          { label: '화살표', sym: '→', insert: ' -> ' }
        ].map((item, idx) => (
          <button
            key={idx}
            onClick={() => setScript(prev => prev + item.insert)}
            title={item.label}
            style={{
              height: '30px',
              padding: '0 10px',
              backgroundColor: '#ffffff',
              border: '1px solid #d0d7de',
              borderRadius: '4px',
              fontSize: '12px',
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              gap: '4px'
            }}
          >
            <strong>{item.sym}</strong>
            <span style={{ fontSize: '10px', color: '#57606a' }}>{item.label.split(' ')[0]}</span>
          </button>
        ))}
      </nav>

      {/* 중앙 메인 작업 영역: 상단 캔버스 + 하단 스크립트 에디터 */}
      <main style={{ flex: 1, display: 'flex', flexDirection: 'column', padding: '8px', gap: '8px', minHeight: 0 }}>
        {/* 상단: 수식 렌더링 뷰어 캔버스 (600 DPI 가상 영역) */}
        <section style={{
          flex: 1,
          backgroundColor: '#ffffff',
          borderRadius: '4px',
          border: '1px solid #c8d1d9',
          boxShadow: 'inset 0 1px 3px rgba(0,0,0,0.05)',
          display: 'flex',
          flexDirection: 'column',
          overflow: 'hidden'
        }}>
          <div style={{
            height: '24px',
            backgroundColor: '#f3f4f6',
            borderBottom: '1px solid #e5e7eb',
            padding: '0 8px',
            display: 'flex',
            alignItems: 'center',
            fontSize: '11px',
            color: '#6b7280'
          }}>
            수식 렌더링 뷰 (Canvas / SVG 600 DPI 정밀 매핑)
          </div>
          <div style={{
            flex: 1,
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            padding: '20px',
            overflow: 'auto',
            backgroundImage: 'radial-gradient(#d1d5db 1px, transparent 1px)',
            backgroundSize: '20px 20px'
          }}>
            <div style={{
              backgroundColor: '#ffffff',
              padding: '24px 36px',
              borderRadius: '6px',
              boxShadow: '0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -1px rgba(0,0,0,0.06)',
              border: '1px solid #e5e7eb',
              minWidth: '280px',
              textAlign: 'center'
            }}>
              <div style={{ fontSize: '24px', fontFamily: '"Times New Roman", "Batang", serif', fontStyle: 'italic', color: '#111827' }}>
                {/* 1차 시각 렌더링 프로토타입 */}
                {script}
              </div>
              <div style={{ marginTop: '12px', fontSize: '11px', color: '#9ca3af' }}>
                [한글 2022 HYhwpEQ 폰트 메트릭 매핑 엔진 탑재 예정]
              </div>
            </div>
          </div>
        </section>

        {/* 하단: 수식 스크립트 에디터 */}
        <section style={{
          height: '140px',
          backgroundColor: '#ffffff',
          borderRadius: '4px',
          border: '1px solid #c8d1d9',
          display: 'flex',
          flexDirection: 'column',
          overflow: 'hidden'
        }}>
          <div style={{
            height: '24px',
            backgroundColor: '#f3f4f6',
            borderBottom: '1px solid #e5e7eb',
            padding: '0 8px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
            fontSize: '11px',
            color: '#6b7280'
          }}>
            <span>수식 스크립트 입력창 (한글 2022 문법)</span>
            <span>단축키: Shift+ESC (본문 삽입) / Ctrl+Z (되돌리기)</span>
          </div>
          <textarea
            value={script}
            onChange={(e) => setScript(e.target.value)}
            style={{
              flex: 1,
              border: 'none',
              outline: 'none',
              padding: '10px 12px',
              fontSize: '14px',
              fontFamily: 'Consolas, "Courier New", monospace',
              lineHeight: '1.5',
              resize: 'none',
              backgroundColor: '#ffffff',
              color: '#1f2937'
            }}
            placeholder="수식 스크립트를 입력하세요 (예: {a} over {b})"
          />
        </section>
      </main>

      {/* 최하단 상태표시줄 */}
      <footer style={{
        height: '24px',
        backgroundColor: '#e5e7eb',
        borderTop: '1px solid #d1d5db',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        padding: '0 12px',
        fontSize: '11px',
        color: '#4b5563'
      }}>
        <div style={{ display: 'flex', gap: '16px' }}>
          <span>글자 크기: <strong>{fontSize} pt</strong></span>
          <span>화면 배율: <strong>{zoom}%</strong></span>
          <span>스크립트 길이: <strong>{script.length}자</strong></span>
        </div>
        <div>
          <span>기반: 한글 2022 (PC 로컬 페어링 대조 준비됨)</span>
        </div>
      </footer>
    </div>
  );
}
