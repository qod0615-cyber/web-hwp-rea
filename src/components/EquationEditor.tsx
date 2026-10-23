import React, { useLayoutEffect, useMemo, useRef, useState } from 'react';
import { EquationRenderer } from '../engine/EquationRenderer';
import { layoutEquation } from '../engine/layout';
import { caretAtSource, hitEquation, insertEquationTemplate, moveEquationCaret, selectedEquationNodes, EquationSelection } from '../engine/equation-editing';
import './equation-editor.css';

type Snapshot = { source: string; selection: EquationSelection };
export function EquationEditor({ source, onChange, onApply, onClose, fontSize, onFontSize }: {
  source: string; onChange: (source: string) => void; onApply: () => void; onClose: () => void;
  fontSize: number; onFontSize: (size: number) => void;
}) {
  const panel = useRef<HTMLDivElement>(null);
  const visual = useRef<HTMLInputElement>(null);
  const command = useRef<HTMLTextAreaElement>(null);
  const visualPane = useRef<HTMLDivElement>(null);
  const [activePane, setActivePane] = useState<'visual' | 'command'>('visual');
  const [selection, setSelection] = useState<EquationSelection>({ start: source.length, end: source.length });
  const initial = useRef({ source, fontSize });
  const [confirmClose, setConfirmClose] = useState(false);
  const requestClose = () => { if (source !== initial.current.source || fontSize !== initial.current.fontSize) setConfirmClose(true); else onClose(); };
  const [previewZoom, setPreviewZoom] = useState(200);
  const [split, setSplit] = useState(175);
  const [height, setHeight] = useState(400);
  const [position, setPosition] = useState(() => ({ x: Math.max(0, (window.innerWidth - 950) / 2), y: Math.max(0, (window.innerHeight - 400) / 2) }));
  const undo = useRef<Snapshot[]>([]);
  const redo = useRef<Snapshot[]>([]);
  const pendingSelection = useRef<{ range: EquationSelection; pane: 'visual' | 'command' } | null>(null);
  const pointer = useRef<{ type: 'selection' | 'split' | 'window'; x: number; y: number; anchor: number; initialX: number; initialY: number } | null>(null);
  const layout = useMemo(() => layoutEquation(source, Math.round(fontSize * 100), { editor: true }), [source, fontSize]);
  const ratio = previewZoom / 100 / 75;
  const caret = caretAtSource(layout, selection.end);
  const selected = selectedEquationNodes(layout, selection);
  const placeSelection = (next: EquationSelection, pane = activePane) => {
    pendingSelection.current = { range: next, pane };
    setSelection({ start: next.start, end: next.end });
  };
  useLayoutEffect(() => {
    const pending = pendingSelection.current;
    if (!pending) return;
    pendingSelection.current = null;
    const input = pending.pane === 'visual' ? visual.current : command.current;
    input?.focus();
    const placeholder = pending.pane === 'visual' && pending.range.start === pending.range.end &&
      source[pending.range.start] === ' ' && source[pending.range.start - 1] === '{' && source[pending.range.start + 1] === '}';
    input?.setSelectionRange(pending.range.start, pending.range.end + (placeholder ? 1 : 0));
  }, [source, selection]);
  const change = (next: string, range: EquationSelection) => {
    if (next !== source) { undo.current.push({ source, selection }); redo.current = []; }
    onChange(next); placeSelection(range);
  };
  const history = (backwards: boolean) => {
    const from = backwards ? undo.current : redo.current;
    const to = backwards ? redo.current : undo.current;
    const previous = from.pop();
    if (!previous) return;
    to.push({ source, selection }); onChange(previous.source); placeSelection(previous.selection);
  };
  const insertTemplate = (kind: 'fraction' | 'sqrt' | 'superscript' | 'subscript') => {
    const inserted = insertEquationTemplate(source, selection, kind);
    setActivePane('visual'); change(inserted.source, inserted.selection); placeSelection(inserted.selection, 'visual');
  };
  const key = (event: React.KeyboardEvent<HTMLInputElement | HTMLTextAreaElement>, pane: 'visual' | 'command') => {
    if ((event.ctrlKey || event.metaKey) && ['z', 'y'].includes(event.key.toLowerCase())) {
      event.preventDefault(); history(event.key.toLowerCase() === 'z' && !event.shiftKey); return;
    }
    if (pane !== 'visual' || event.ctrlKey || event.metaKey || event.altKey) return;
    const direction = ({ ArrowLeft: 'left', ArrowRight: 'right', ArrowUp: 'up', ArrowDown: 'down' } as const)[event.key as 'ArrowLeft'];
    if (direction) {
      event.preventDefault();
      const next = moveEquationCaret(layout, selection.end, direction);
      if (next) placeSelection(event.shiftKey ? { start: Math.min(selection.start, next.start), end: Math.max(selection.start, next.start) } : next, 'visual');
    } else if (event.key === 'Tab') {
      event.preventDefault();
      const slots = layout.nodes?.filter(node => node.kind === 'placeholder') || [];
      const next = (event.shiftKey ? slots.slice().reverse() : slots).find(node => event.shiftKey ? node.sourceStart < selection.start : node.sourceStart > selection.end);
      placeSelection(next ? { start: next.sourceStart, end: next.sourceStart } : { start: source.length, end: source.length }, 'visual');
    }
  };
  const hit = (event: React.PointerEvent<HTMLDivElement>) => {
    const bounds = visualPane.current!.getBoundingClientRect();
    return hitEquation(layout, (event.clientX - bounds.left - 9 + visualPane.current!.scrollLeft) / ratio,
      (event.clientY - bounds.top - 8 + visualPane.current!.scrollTop) / ratio + layout.top);
  };
  useLayoutEffect(() => {
    visual.current?.focus();
    visual.current?.setSelectionRange(source.length, source.length);
    const resize = new ResizeObserver(() => { if (panel.current) setHeight(panel.current.clientHeight + 2); });
    if (panel.current) resize.observe(panel.current);
    return () => resize.disconnect();
  }, []);
  const toolbar = [
    { title: '분수', left: 103, width: 24, run: () => insertTemplate('fraction') },
    { title: '근호', left: 127, width: 27, run: () => insertTemplate('sqrt') },
    { title: '위 첨자', left: 296, width: 24, run: () => insertTemplate('superscript') },
    { title: '아래 첨자', left: 320, width: 24, run: () => insertTemplate('subscript') },
    { title: '실행 취소', left: 648, width: 29, run: () => history(true) },
    { title: '다시 실행', left: 677, width: 28, run: () => history(false) },
    { title: '본문에 넣기 (Shift+ESC)', left: 773, width: 24, run: onApply },
  ];
  return <div className="equation-modal-layer">
    <div ref={panel} role="dialog" aria-label="수식 편집기" aria-modal="true" className="native-equation-editor"
      onKeyDown={event => {
        if (confirmClose) {
          event.stopPropagation();
          if (event.key === 'Escape') { event.preventDefault(); setConfirmClose(false); }
          else if (event.key === 'Enter' || (event.altKey && event.key.toLowerCase() === 'y')) { event.preventDefault(); onApply(); }
          else if (event.altKey && event.key.toLowerCase() === 'n') { event.preventDefault(); onClose(); }
          else if (event.altKey && event.key.toLowerCase() === 'c') { event.preventDefault(); setConfirmClose(false); }
          return;
        }
        if (event.key === 'Escape') {
          event.preventDefault(); event.stopPropagation();
          if (event.shiftKey) onApply(); else requestClose();
        }
      }}
      style={{ left: position.x, top: position.y }}>
      <div className="equation-chrome" aria-hidden="true" />
      <div className="equation-title-drag" onPointerDown={event => {
        event.preventDefault(); pointer.current = { type: 'window', x: event.clientX, y: event.clientY, anchor: 0, initialX: position.x, initialY: position.y };
        event.currentTarget.setPointerCapture(event.pointerId);
      }} onPointerMove={event => {
        const start = pointer.current; if (start?.type !== 'window') return;
        setPosition({ x: Math.max(0, Math.min(window.innerWidth - 80, start.initialX + event.clientX - start.x)), y: Math.max(0, Math.min(window.innerHeight - 32, start.initialY + event.clientY - start.y)) });
      }} onPointerUp={() => { pointer.current = null; }} onLostPointerCapture={() => { pointer.current = null; }} />
      <button className="equation-close" aria-label="취소 (ESC)" onClick={requestClose} />
      {toolbar.map(button => <button key={button.title} className="equation-tool" aria-label={button.title} title={button.title}
        style={{ left: button.left, width: button.width }} onMouseDown={event => event.preventDefault()} onClick={button.run} />)}
      <select className="equation-font-size" aria-label="수식 글자 크기" value={fontSize} onChange={event => onFontSize(Number(event.target.value))}>
        {[8, 9, 10, 11, 12, 14, 16, 18, 20, 24, 36].map(size => <option key={size}>{size}</option>)}
      </select>
      <select className="equation-preview-zoom" aria-label="수식 편집 배율" value={previewZoom} onChange={event => setPreviewZoom(Number(event.target.value))}>
        {[100, 150, 200, 250, 300, 400].map(zoom => <option value={zoom} key={zoom}>{zoom}%</option>)}
      </select>
      <div ref={visualPane} className="equation-visual-pane" style={{ height: Math.min(split, height - 145) }}
        onPointerDown={event => {
          if (event.target === visual.current) return;
          event.preventDefault(); setActivePane('visual');
          const point = hit(event); const index = point?.start ?? source.length;
          pointer.current = { type: 'selection', x: 0, y: 0, anchor: index, initialX: 0, initialY: 0 };
          placeSelection({ start: index, end: index }, 'visual'); event.currentTarget.setPointerCapture(event.pointerId);
        }} onPointerMove={event => {
          if (pointer.current?.type !== 'selection') return;
          const point = hit(event); if (!point) return;
          placeSelection({ start: Math.min(pointer.current.anchor, point.start), end: Math.max(pointer.current.anchor, point.start) }, 'visual');
        }} onPointerUp={() => { pointer.current = null; }} onLostPointerCapture={() => { pointer.current = null; }}>
        <div className="equation-rendered"><EquationRenderer script={source} fontSize={fontSize} scale={previewZoom / 100} editorMode /></div>
        {activePane === 'visual' && selected.map((node, index) => <div key={index} className="equation-selection"
          style={{ left: 9 + node.x * ratio, top: 8 + (node.y - layout.top) * ratio, width: node.width * ratio, height: node.height * ratio }} />)}
        {activePane === 'visual' && selection.start === selection.end && <div className={source ? 'equation-caret' : 'equation-empty-caret'}
          style={{ left: 9 + (caret?.x || 0) * ratio, top: 8 + ((caret?.y ?? layout.top) - layout.top) * ratio, height: caret ? caret.height * ratio : 30 }} />}
        <input ref={visual} className="equation-visual-input" type="text" aria-label="수식 시각 편집" value={source}
          onFocus={() => setActivePane('visual')} onKeyDown={event => key(event, 'visual')}
          onSelect={event => setSelection({ start: event.currentTarget.selectionStart || 0, end: event.currentTarget.selectionEnd || 0 })}
          onChange={event => change(event.target.value, { start: event.target.selectionStart || 0, end: event.target.selectionEnd || 0 })} />
      </div>
      <div className="equation-splitter" role="separator" aria-label="수식 명령 영역 분리선" aria-orientation="horizontal" tabIndex={0}
        style={{ top: 97 + Math.min(split, height - 145) }}
        onPointerDown={event => { event.preventDefault(); pointer.current = { type: 'split', x: 0, y: event.clientY, anchor: 0, initialX: 0, initialY: split }; event.currentTarget.setPointerCapture(event.pointerId); }}
        onPointerMove={event => { const start = pointer.current; if (start?.type === 'split') setSplit(Math.max(50, Math.min(height - 145, start.initialY + event.clientY - start.y))); }}
        onPointerUp={() => { pointer.current = null; }} onLostPointerCapture={() => { pointer.current = null; }}
        onKeyDown={event => { if (['ArrowUp', 'ArrowDown'].includes(event.key)) { event.preventDefault(); setSplit(value => Math.max(50, Math.min(height - 145, value + (event.key === 'ArrowUp' ? -5 : 5)))); } }} />
      <textarea ref={command} className="equation-command-pane" aria-label="수식 명령어" spellCheck={false} value={source}
        style={{ top: 99 + Math.min(split, height - 145) }} onFocus={() => setActivePane('command')} onKeyDown={event => key(event, 'command')}
        onSelect={event => setSelection({ start: event.currentTarget.selectionStart, end: event.currentTarget.selectionEnd })}
        onChange={event => change(event.target.value, { start: event.target.selectionStart, end: event.target.selectionEnd })} />
      {confirmClose && <div className="equation-confirm-blocker">
        <div role="alertdialog" aria-label="수식 넣기 확인" aria-describedby="equation-confirm-description" className="equation-confirm">
          <span id="equation-confirm-description" className="equation-sr-only">달라진 수식 내용이 있습니다. 수식을 넣을까요?</span>
          <button autoFocus aria-label="넣기(Y)" style={{ left: 37 }} onClick={onApply} />
          <button aria-label="나가기(N)" style={{ left: 123 }} onClick={onClose} />
          <button aria-label="취소(C)" style={{ left: 209 }} onClick={() => setConfirmClose(false)} />
          <button aria-label="확인 창 닫기" className="confirm-close" onClick={() => setConfirmClose(false)} />
        </div>
      </div>}
    </div>
  </div>;
}
