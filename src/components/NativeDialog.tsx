import React, { useEffect, useRef } from 'react';
import './native-dialog.css';

// Bounds measured from Windows HWP 12.0.0.535 at 96 DPI.
export function NativeDialog({ title, width, height, tabs, onClose, onApply, children }: {
  title: string; width: number; height: number; tabs: string[];
  onClose: () => void; onApply: () => void; children: React.ReactNode;
}) {
  const ref = useRef<HTMLFormElement>(null);
  useEffect(() => {
    const previous = document.activeElement as HTMLElement | null;
    const panel = ref.current;
    panel?.querySelector<HTMLElement>('input, select, button')?.focus();
    function trap(event: KeyboardEvent) {
      if (event.key !== 'Tab' || !panel) return;
      const items = [...panel.querySelectorAll<HTMLElement>('input:not(:disabled), select:not(:disabled), button:not(:disabled)')];
      const index = items.indexOf(document.activeElement as HTMLElement);
      if (event.shiftKey && index <= 0) { event.preventDefault(); items[items.length - 1]?.focus(); }
      else if (!event.shiftKey && index === items.length - 1) { event.preventDefault(); items[0]?.focus(); }
    }
    panel?.addEventListener('keydown', trap);
    return () => { panel?.removeEventListener('keydown', trap); if (previous?.isConnected) previous.focus(); };
  }, []);
  return <div className="native-dialog-backdrop">
    <form ref={ref} className="native-dialog" role="dialog" aria-modal="true" aria-label={title}
      style={{ width, height }} onSubmit={event => { event.preventDefault(); onApply(); }}>
      <div className="native-dialog-title">{title}<button type="button" aria-label="닫기 (ESC)" onClick={onClose}>×</button></div>
      <div className="native-dialog-tabs" role="tablist">{tabs.map((tab, i) => <span key={tab} role="tab" aria-selected={i === 0}>{tab}</span>)}</div>
      <div className="native-dialog-panel">{children}</div>
      <button className="native-dialog-apply" type="submit">설정(Enter)</button>
      <button className="native-dialog-cancel" type="button" onClick={onClose}>취소(ESC)</button>
      <div className="native-dialog-preset"><label>대화 상자 설정 <select aria-label="대화 상자 설정"><option>사용자 지정</option></select></label></div>
    </form>
  </div>;
}

export function NativeField({ label, x, y, width = 90, value, unit, min, max, step = 0.1, onChange }: {
  label: string; x: number; y: number; width?: number; value: number; unit?: string;
  min?: number; max?: number; step?: number; onChange: (value: number) => void;
}) {
  return <label className="native-field" style={{ left: x, top: y, width }}>
    <span className="native-field-label">{label}</span>
    <input type="number" aria-label={label} value={value} min={min} max={max} step={step}
      onChange={event => { if (event.target.value !== '') onChange(Number(event.target.value)); }} />
    {unit && <span className="native-field-unit">{unit}</span>}
  </label>;
}
