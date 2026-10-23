import React, { useState } from 'react';

/** Keep the measured native frame and arrow, while displaying the real selection. */
export function ToolbarCombo({ title, initial, bounds, children, onChange }: {
  title: string; initial: string; bounds: React.CSSProperties; children: React.ReactNode;
  onChange?: (value: string) => void;
}) {
  const [value, setValue] = useState(initial);
  const options = React.Children.toArray(children) as React.ReactElement<{ value?: string; children: React.ReactNode }>[];
  const selected = options.find(option => String(option.props.value ?? option.props.children) === value);
  const nativeName = title === '글꼴' ? '함초롬바탕' : title;
  return <div data-native-control={`빠른 서식:${nativeName}`} style={bounds}>
    <span aria-hidden="true" style={{ position: 'absolute', left: 4, right: 19, top: 3, bottom: 3, background: 'white', color: '#222', font: '12px/18px "Malgun Gothic",sans-serif', whiteSpace: 'nowrap', overflow: 'hidden', pointerEvents: 'none' }}>{selected?.props.children}</span>
    {title === '글자 크기' && <span aria-hidden="true" style={{ position: 'absolute', right: 34, top: 3, color: '#0078d7', font: '11px/18px "Malgun Gothic",sans-serif', pointerEvents: 'none' }}>pt</span>}
    <select title={title} aria-label={title} value={value} onChange={event => { setValue(event.target.value); onChange?.(event.target.value); }}
      style={{ position: 'absolute', inset: 0, width: '100%', height: '100%', opacity: 0, cursor: 'default' }}>{children}</select>
  </div>;
}
