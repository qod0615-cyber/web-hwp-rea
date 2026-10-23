import React, { useEffect, useRef } from 'react';

export interface ReferenceMenu {
  asset: string; x: number; y: number; w: number; h: number;
  items: { name: string; enabled: boolean; x: number; y: number; w: number; h: number }[];
}

export function ReferenceDropdown({ menu, label, onClose, onCommand }: {
  menu: ReferenceMenu; label: string; onClose: () => void; onCommand: (name: string) => void;
}) {
  const ref = useRef<HTMLDivElement>(null);
  useEffect(() => {
    const previous = document.activeElement as HTMLElement | null;
    ref.current?.focus({ preventScroll: true });
    return () => { if (previous?.isConnected) previous.focus(); };
  }, [menu]);
  return <div ref={ref} tabIndex={-1} role="menu" aria-label={`${label} 명령 메뉴`} data-native-dropdown={label}
    style={{ position: 'absolute', left: menu.x, top: menu.y - 32, width: menu.w, height: menu.h, backgroundImage: `url("${menu.asset}")`, zIndex: 9999, outline: 'none' }}
    onKeyDown={event => {
      const buttons = Array.from(ref.current?.querySelectorAll<HTMLButtonElement>('button:not(:disabled)') || []);
      const index = buttons.indexOf(document.activeElement as HTMLButtonElement);
      if (['ArrowDown','ArrowUp','Home','End'].includes(event.key)) {
        event.preventDefault();
        const next = event.key === 'Home' ? 0 : event.key === 'End' ? buttons.length - 1 : index < 0 ? (event.key === 'ArrowDown' ? 0 : buttons.length - 1) : (index + (event.key === 'ArrowDown' ? 1 : -1) + buttons.length) % buttons.length;
        buttons[next]?.focus();
      } else if (event.key === 'Tab' || event.key === 'Escape') { event.preventDefault(); onClose(); }
    }}>
    {menu.items.map(item => <button key={item.name} type="button" role="menuitem" title={item.name} aria-label={item.name} disabled={!item.enabled}
      data-native-menu-item={item.name} className="hwp-btn"
      style={{ position: 'absolute', left: item.x - menu.x, top: item.y - menu.y, width: item.w, height: item.h, padding: 0, background: 'transparent' }}
      onClick={() => { onClose(); onCommand(item.name); }} />)}
  </div>;
}
