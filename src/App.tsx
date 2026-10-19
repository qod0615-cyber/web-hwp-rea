import React, { useState, useEffect, useRef } from 'react';

export default function App() {
  const [activeMenu, setActiveMenu] = useState('편집');
  const [zoom, setZoom] = useState(100);
  const [docTitle, setDocTitle] = useState('빈 문서 1');
  const [content, setContent] = useState('');
  const [caretPos, setCaretPos] = useState({ page: 1, section: 1, col: 1, line: 1, char: 1, chars: 0 });
  const editorRef = useRef<HTMLDivElement>(null);

  const menus = ['파일', '편집', '보기', '입력', '서식', '쪽', '보안', '검토', '도구'];

  return (
    <div style={{
      display: 'flex',
      flexDirection: 'column',
      height: '100vh',
      width: '100vw',
      backgroundColor: '#f0f3f6',
      color: '#333333',
      fontFamily: '"Malgun Gothic", "맑은 고딕", -apple-system, sans-serif',
      userSelect: 'none',
      overflow: 'hidden',
      fontSize: '12px'
    }}>
      {/* 1. 최상단 타이틀바 (한글 2022 정합) */}
      <div style={{
        height: '30px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        padding: '0 8px 0 10px',
        borderBottom: '1px solid #e1e4e8',
        fontSize: '12px',
        ...({ WebkitAppRegion: 'drag' } as any)
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
          {/* 한글 2022 로고 아이콘 */}
          <div style={{
            width: '18px',
            height: '18px',
            backgroundColor: '#0078d4',
            color: '#ffffff',
            borderRadius: '3px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            fontWeight: 'bold',
            fontSize: '11px'
          }}>
            한
          </div>
          <span style={{ color: '#24292f', fontWeight: '500' }}>{docTitle} - 한글</span>
        </div>

        {/* 타이틀바 우측 컨트롤 (로그인, 창 조작) */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '14px', ...({ WebkitAppRegion: 'no-drag' } as any) }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '4px', cursor: 'pointer', fontSize: '11px', color: '#57606a' }}>
            <span style={{ display: 'inline-block', width: '12px', height: '12px', borderRadius: '50%', background: 'linear-gradient(45deg, #e53e3e 50%, #3182ce 50%)' }}></span>
            <span>로그인</span>
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '12px', color: '#57606a', fontSize: '13px' }}>
            <span title="화면 확장" style={{ cursor: 'pointer' }}>⤢</span>
            <span title="추천" style={{ cursor: 'pointer' }}>💡</span>
            <span title="도움말" style={{ cursor: 'pointer' }}>?</span>
            <span title="최소화" style={{ cursor: 'pointer', marginLeft: '6px' }}>─</span>
            <span title="최대화" style={{ cursor: 'pointer' }}>□</span>
            <span title="닫기" style={{ cursor: 'pointer', color: '#cf222e' }}>✕</span>
          </div>
        </div>
      </div>

      {/* 2. 메인 메뉴바 */}
      <div style={{
        height: '28px',
        backgroundColor: '#ffffff',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        padding: '0 8px',
        borderBottom: '1px solid #d0d7de'
      }}>
        <div style={{ display: 'flex', alignItems: 'center', height: '100%' }}>
          {menus.map((m) => {
            const isActive = activeMenu === m;
            return (
              <div
                key={m}
                onClick={() => setActiveMenu(m)}
                style={{
                  padding: '0 10px',
                  height: '100%',
                  display: 'flex',
                  alignItems: 'center',
                  cursor: 'pointer',
                  color: isActive ? '#0969da' : '#24292f',
                  fontWeight: isActive ? '600' : 'normal',
                  borderBottom: isActive ? '2px solid #0969da' : '2px solid transparent',
                  transition: 'all 0.1s ease'
                }}
              >
                {m}
              </div>
            );
          })}
          <span style={{ cursor: 'pointer', marginLeft: '4px', opacity: 0.7 }}>🚀</span>
        </div>

        {/* 우측 검색창 */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
          <div style={{
            display: 'flex',
            alignItems: 'center',
            backgroundColor: '#f6f8fa',
            border: '1px solid #d0d7de',
            borderRadius: '3px',
            padding: '2px 6px',
            width: '130px',
            height: '18px'
          }}>
            <input
              type="text"
              placeholder="찾을 내용"
              style={{ border: 'none', background: 'transparent', outline: 'none', fontSize: '11px', width: '100%' }}
            />
          </div>
          <span style={{ cursor: 'pointer', fontSize: '11px', color: '#57606a' }}>∧</span>
          <span style={{ cursor: 'pointer', fontSize: '11px', color: '#57606a' }}>✕</span>
        </div>
      </div>

      {/* 3. 대형 리본 툴바 1행 (한글 2022 편집 탭 원본 1:1) */}
      <div style={{
        height: '74px',
        backgroundColor: '#f8fafc',
        borderBottom: '1px solid #d0d7de',
        display: 'flex',
        alignItems: 'center',
        padding: '0 6px',
        gap: '4px',
        overflowX: 'auto'
      }}>
        {/* 클립보드 그룹 */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '2px' }}>
          <RibbonBigButton icon="✂️" label="오려두기" disabled />
          <RibbonBigButton icon="📋" label="복사하기" disabled />
          <RibbonBigButton icon="📥" label="붙이기" disabled />
          <RibbonBigButton icon="🎨" label="모양 복사" />
          <RibbonBigButton icon="[###]" label="조판 부호 지우기" />
        </div>

        <RibbonDivider />

        {/* 서식 그룹 */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '2px' }}>
          <RibbonBigButton icon="가" label="글자 모양" />
          <RibbonBigButton icon="≣" label="문단 모양" />
          <RibbonBigButton icon="A≡" label="스타일" />
        </div>

        <RibbonDivider />

        {/* 쪽/단 그룹 */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '2px' }}>
          <RibbonBigButton icon="📄" label="세로" active />
          <RibbonBigButton icon="📑" label="가로" />
          <RibbonBigButton icon="◫" label="쪽 여백" />
          <RibbonBigButton icon="🔲" label="바탕쪽" />
          <RibbonBigButton icon="𝄀𝄀" label="단" />
        </div>

        <RibbonDivider />

        {/* 개체 삽입 그룹 */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '2px' }}>
          <RibbonBigButton icon="🔷" label="도형" />
          <RibbonBigButton icon="🖼️" label="그림" />
          <RibbonBigButton icon="▦" label="표" />
          <RibbonBigButton icon="📊" label="차트" />
          <RibbonBigButton icon="⬚" label="개체 선택" active />
          <RibbonBigButton icon="🔒" label="개체 보호" />
        </div>

        <RibbonDivider />

        {/* 찾기 / 정렬 */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '2px' }}>
          <RibbonBigButton icon="🔍" label="찾기" />
          <RibbonBigButton icon="🔤" label="글자 바꾸기" />
          <RibbonBigButton icon="↕" label="정렬" />
        </div>
      </div>

      {/* 4. 빠른 서식 툴바 2행 (글꼴, 크기, 속성, 정렬) */}
      <div style={{
        height: '28px',
        backgroundColor: '#ffffff',
        borderBottom: '1px solid #d0d7de',
        display: 'flex',
        alignItems: 'center',
        padding: '0 8px',
        gap: '4px',
        fontSize: '11px',
        color: '#24292f'
      }}>
        {/* 기본 빠른 명령 */}
        <ToolIcon icon="📄" title="새 문서 (Alt+N)" />
        <ToolIcon icon="📂" title="불러오기 (Alt+O)" />
        <ToolIcon icon="💾" title="저장하기 (Alt+S)" />
        <ToolIcon icon="🖨️" title="인쇄 (Alt+P)" />
        <ToolDivider />
        <ToolIcon icon="↩️" title="되돌리기 (Ctrl+Z)" />
        <ToolIcon icon="↪️" title="다시 실행 (Ctrl+Y)" />
        <ToolDivider />

        {/* 스타일 / 폰트 */}
        <select style={{ height: '22px', fontSize: '11px', border: '1px solid #d0d7de', borderRadius: '2px', padding: '0 4px', backgroundColor: '#fff' }}>
          <option>바탕글</option>
          <option>본문</option>
          <option>개요 1</option>
          <option>개요 2</option>
        </select>
        <select style={{ height: '22px', fontSize: '11px', border: '1px solid #d0d7de', borderRadius: '2px', padding: '0 4px', backgroundColor: '#fff' }}>
          <option>대표</option>
          <option>한글</option>
          <option>영어</option>
        </select>
        <select style={{ height: '22px', fontSize: '11px', border: '1px solid #d0d7de', borderRadius: '2px', padding: '0 4px', backgroundColor: '#fff', width: '105px' }}>
          <option>함초롬바탕</option>
          <option>함초롬돋움</option>
          <option>맑은 고딕</option>
          <option>바탕</option>
        </select>
        <select style={{ height: '22px', fontSize: '11px', border: '1px solid #d0d7de', borderRadius: '2px', padding: '0 4px', backgroundColor: '#fff', width: '52px' }}>
          <option>10.0</option>
          <option>9.0</option>
          <option>11.0</option>
          <option>12.0</option>
        </select>
        <span style={{ fontSize: '10px', color: '#57606a' }}>pt</span>

        <ToolDivider />

        {/* 글자 스타일 B I U S Color */}
        <span style={{ fontWeight: 'bold', padding: '2px 5px', cursor: 'pointer', border: '1px solid transparent' }} title="굵게 (Ctrl+B)">가</span>
        <span style={{ fontStyle: 'italic', padding: '2px 5px', cursor: 'pointer' }} title="기울임 (Ctrl+I)">가</span>
        <span style={{ textDecoration: 'underline', padding: '2px 5px', cursor: 'pointer' }} title="밑줄 (Ctrl+U)">가</span>
        <span style={{ textDecoration: 'line-through', padding: '2px 5px', cursor: 'pointer' }} title="취소선">가</span>
        <span style={{ color: '#d9381e', fontWeight: 'bold', padding: '2px 5px', cursor: 'pointer' }} title="글자 색">가▾</span>

        <ToolDivider />

        {/* 문단 정렬 */}
        <span style={{ cursor: 'pointer', padding: '0 3px' }} title="양쪽 정렬">≡</span>
        <span style={{ cursor: 'pointer', padding: '0 3px' }} title="왼쪽 정렬">⫷</span>
        <span style={{ cursor: 'pointer', padding: '0 3px' }} title="가운데 정렬">⩶</span>
        <span style={{ cursor: 'pointer', padding: '0 3px' }} title="오른쪽 정렬">⫸</span>
        <span style={{ cursor: 'pointer', padding: '0 3px' }} title="배분 정렬">⊞</span>

        <ToolDivider />

        {/* 줄간격 */}
        <input type="text" defaultValue="160" style={{ width: '30px', height: '18px', textAlign: 'center', border: '1px solid #d0d7de', fontSize: '11px' }} />
        <span style={{ fontSize: '10px', color: '#57606a' }}>%</span>
      </div>

      {/* 5. 가로 눈금자 (Ruler Top) */}
      <div style={{
        height: '18px',
        backgroundColor: '#f6f8fa',
        borderBottom: '1px solid #d0d7de',
        display: 'flex',
        alignItems: 'center',
        paddingLeft: '24px',
        position: 'relative',
        fontSize: '9px',
        color: '#8c959f'
      }}>
        {/* 눈금 표시 단위 */}
        <div style={{ display: 'flex', width: '100%', justifyContent: 'center' }}>
          <div style={{ width: '800px', display: 'flex', justifyContent: 'space-between', padding: '0 20px', position: 'relative' }}>
            {Array.from({ length: 19 }, (_, i) => (
              <span key={i} style={{ display: 'inline-block', width: '40px', textAlign: 'center' }}>
                {i === 0 ? '' : i}
              </span>
            ))}
          </div>
        </div>
      </div>

      {/* 6. 중앙 워크스페이스 (세로 눈금자 + A4 용지 캔버스) */}
      <div style={{
        flex: 1,
        display: 'flex',
        backgroundColor: '#e9edf0',
        overflow: 'auto',
        position: 'relative'
      }}>
        {/* 세로 눈금자 (Ruler Left) */}
        <div style={{
          width: '18px',
          backgroundColor: '#f6f8fa',
          borderRight: '1px solid #d0d7de',
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          paddingTop: '30px',
          fontSize: '9px',
          color: '#8c959f',
          userSelect: 'none',
          flexShrink: 0
        }}>
          {Array.from({ length: 18 }, (_, i) => (
            <span key={i} style={{ height: '40px', display: 'flex', alignItems: 'center' }}>
              {i === 0 ? '' : i}
            </span>
          ))}
        </div>

        {/* A4 본문 지면 영역 (210mm x 297mm 픽셀 규격: 800px x 1130px) */}
        <div style={{
          flex: 1,
          display: 'flex',
          justifyContent: 'center',
          padding: '30px 20px',
          overflowY: 'auto'
        }}>
          <div style={{
            width: '800px',
            minHeight: '1130px',
            backgroundColor: '#ffffff',
            boxShadow: '0 4px 12px rgba(0,0,0,0.15)',
            position: 'relative',
            padding: '90px 80px',
            boxSizing: 'border-box'
          }}>
            {/* 한글 2022 사각 모서리 L자 재단/여백 가이드마커 */}
            <div style={{ position: 'absolute', top: '70px', left: '60px', width: '12px', height: '12px', borderTop: '1px solid #c0c4cc', borderLeft: '1px solid #c0c4cc' }} />
            <div style={{ position: 'absolute', top: '70px', right: '60px', width: '12px', height: '12px', borderTop: '1px solid #c0c4cc', borderRight: '1px solid #c0c4cc' }} />
            <div style={{ position: 'absolute', bottom: '70px', left: '60px', width: '12px', height: '12px', borderBottom: '1px solid #c0c4cc', borderLeft: '1px solid #c0c4cc' }} />
            <div style={{ position: 'absolute', bottom: '70px', right: '60px', width: '12px', height: '12px', borderBottom: '1px solid #c0c4cc', borderRight: '1px solid #c0c4cc' }} />

            {/* 실제 한글 본문 입력 영역 */}
            <div
              ref={editorRef}
              contentEditable
              suppressContentEditableWarning
              onInput={(e) => {
                const text = e.currentTarget.innerText;
                setContent(text);
                setCaretPos(prev => ({ ...prev, chars: text.length }));
              }}
              style={{
                outline: 'none',
                minHeight: '800px',
                fontSize: '13px',
                lineHeight: '1.6',
                fontFamily: '"Batang", "함초롬바탕", serif',
                color: '#111827',
                whiteSpace: 'pre-wrap',
                wordBreak: 'break-all',
                cursor: 'text',
                userSelect: 'text'
              }}
            >
            </div>
          </div>
        </div>
      </div>

      {/* 7. 하단 문서 탭 바 */}
      <div style={{
        height: '24px',
        backgroundColor: '#ffffff',
        borderTop: '1px solid #d0d7de',
        borderBottom: '1px solid #d0d7de',
        display: 'flex',
        alignItems: 'center',
        padding: '0 8px',
        fontSize: '11px',
        color: '#57606a'
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '6px', marginRight: '8px' }}>
          <span style={{ cursor: 'pointer' }}>⏮</span>
          <span style={{ cursor: 'pointer' }}>◀</span>
          <span style={{ cursor: 'pointer' }}>▶</span>
          <span style={{ cursor: 'pointer' }}>⏭</span>
        </div>
        <div style={{
          backgroundColor: '#f6f8fa',
          border: '1px solid #d0d7de',
          borderBottom: 'none',
          padding: '3px 12px',
          fontWeight: '500',
          color: '#24292f',
          borderRadius: '3px 3px 0 0'
        }}>
          {docTitle}
        </div>
        <span style={{ marginLeft: '6px', cursor: 'pointer', fontSize: '13px' }}>+</span>
      </div>

      {/* 8. 최하단 상태표시줄 (한글 2022 원본 완전 정합) */}
      <div style={{
        height: '22px',
        backgroundColor: '#f6f8fa',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        padding: '0 10px',
        fontSize: '11px',
        color: '#57606a',
        borderTop: '1px solid #e1e4e8'
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '14px' }}>
          <span>{caretPos.page}/1 쪽</span>
          <span>{caretPos.section}단</span>
          <span>{caretPos.line}줄</span>
          <span>{caretPos.col}칸</span>
          <span>{caretPos.chars}글자</span>
          <span>문자 입력</span>
          <span>1/1 구역</span>
          <span>삽입</span>
          <span style={{ color: '#0969da', cursor: 'pointer' }}>변경 내용 [기록 중지]</span>
          <span>타수: 0타</span>
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
            style={{ width: '80px', height: '4px', cursor: 'pointer' }}
          />
          <span style={{ width: '38px', textAlign: 'right' }}>{zoom}%</span>
        </div>
      </div>
    </div>
  );
}

function RibbonBigButton({ icon, label, active, disabled }: { icon: string; label: string; active?: boolean; disabled?: boolean }) {
  return (
    <button
      disabled={disabled}
      style={{
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
        minWidth: '46px',
        height: '62px',
        padding: '2px 4px',
        backgroundColor: active ? '#ddf4ff' : 'transparent',
        border: active ? '1px solid #54aeff' : '1px solid transparent',
        borderRadius: '3px',
        cursor: disabled ? 'default' : 'pointer',
        opacity: disabled ? 0.4 : 1,
        transition: 'all 0.1s ease'
      }}
      onMouseEnter={(e) => {
        if (!disabled && !active) e.currentTarget.style.backgroundColor = '#f3f4f6';
      }}
      onMouseLeave={(e) => {
        if (!disabled && !active) e.currentTarget.style.backgroundColor = 'transparent';
      }}
    >
      <span style={{ fontSize: '18px', marginBottom: '4px' }}>{icon}</span>
      <span style={{ fontSize: '10.5px', color: '#24292f', textAlign: 'center', lineHeight: '1.2' }}>{label}</span>
    </button>
  );
}

function RibbonDivider() {
  return <div style={{ width: '1px', height: '48px', backgroundColor: '#e1e4e8', margin: '0 4px' }} />;
}

function ToolDivider() {
  return <div style={{ width: '1px', height: '14px', backgroundColor: '#d0d7de', margin: '0 4px' }} />;
}

function ToolIcon({ icon, title }: { icon: string; title: string }) {
  return (
    <span
      title={title}
      style={{
        display: 'inline-flex',
        alignItems: 'center',
        justifyContent: 'center',
        width: '20px',
        height: '20px',
        cursor: 'pointer',
        borderRadius: '2px',
        fontSize: '12px'
      }}
      onMouseEnter={(e) => (e.currentTarget.style.backgroundColor = '#f3f4f6')}
      onMouseLeave={(e) => (e.currentTarget.style.backgroundColor = 'transparent')}
    >
      {icon}
    </span>
  );
}
