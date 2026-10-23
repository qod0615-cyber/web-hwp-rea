import React, { useLayoutEffect, useRef, useState } from 'react';

export function DocumentScrollBar({ target, horizontal = false }: {
  target: React.RefObject<HTMLDivElement>; horizontal?: boolean;
}) {
  const trackRef = useRef<HTMLDivElement>(null);
  const [metrics, setMetrics] = useState({ position: 0, viewport: 1, content: 1, track: 1 });
  const drag = useRef<{ pointer: number; position: number } | null>(null);
  useLayoutEffect(() => {
    const element = target.current;
    const track = trackRef.current;
    if (!element || !track) return;
    const update = () => setMetrics({
      position: horizontal ? element.scrollLeft : element.scrollTop,
      viewport: horizontal ? element.clientWidth : element.clientHeight,
      content: horizontal ? element.scrollWidth : element.scrollHeight,
      track: horizontal ? track.clientWidth : track.clientHeight
    });
    const resize = new ResizeObserver(update);
    resize.observe(element); resize.observe(track);
    if (element.firstElementChild) resize.observe(element.firstElementChild);
    const mutation = new MutationObserver(update);
    mutation.observe(element, { subtree: true, childList: true, characterData: true, attributes: true, attributeFilter: ['style'] });
    element.addEventListener('scroll', update); update();
    return () => { resize.disconnect(); mutation.disconnect(); element.removeEventListener('scroll', update); };
  }, [target, horizontal]);
  const maximum = Math.max(0, metrics.content - metrics.viewport);
  const thumbSize = Math.min(metrics.track, Math.max(20, metrics.track * metrics.viewport / metrics.content));
  const travel = Math.max(1, metrics.track - thumbSize);
  const thumbPosition = maximum ? metrics.position / maximum * travel : 0;
  const scroll = (position: number) => {
    const element = target.current;
    if (!element) return;
    if (horizontal) element.scrollLeft = Math.min(maximum, Math.max(0, position));
    else element.scrollTop = Math.min(maximum, Math.max(0, position));
  };
  return <div className={`document-scrollbar ${horizontal ? 'horizontal' : 'vertical'}`}>
    <button type="button" tabIndex={-1} className="scroll-arrow start" aria-label={horizontal ? '왼쪽으로 스크롤' : '위로 스크롤'}
      onMouseDown={e => e.preventDefault()} onClick={() => scroll(metrics.position - 40)}>{horizontal ? '‹' : '⌃'}</button>
    <div ref={trackRef} className="scroll-track" onPointerDown={event => {
      if (event.target !== event.currentTarget) return;
      const bounds = event.currentTarget.getBoundingClientRect();
      const point = horizontal ? event.clientX - bounds.left : event.clientY - bounds.top;
      scroll(metrics.position + (point < thumbPosition ? -1 : 1) * metrics.viewport * .9);
    }}>
      <div role="scrollbar" tabIndex={0} aria-label={horizontal ? '문서 가로 스크롤' : '문서 세로 스크롤'}
        aria-controls="document-viewport" aria-orientation={horizontal ? 'horizontal' : 'vertical'}
        aria-valuemin={0} aria-valuemax={Math.round(maximum)} aria-valuenow={Math.round(metrics.position)}
        className="scroll-thumb" style={horizontal ? { left: thumbPosition, width: thumbSize } : { top: thumbPosition, height: thumbSize }}
        onPointerDown={event => {
          event.preventDefault(); event.stopPropagation();
          drag.current = { pointer: horizontal ? event.clientX : event.clientY, position: metrics.position };
          event.currentTarget.setPointerCapture(event.pointerId);
        }}
        onPointerMove={event => {
          if (!drag.current) return;
          const point = horizontal ? event.clientX : event.clientY;
          scroll(drag.current.position + (point - drag.current.pointer) / travel * maximum);
        }}
        onPointerUp={event => { drag.current = null; event.currentTarget.releasePointerCapture(event.pointerId); }}
        onLostPointerCapture={() => { drag.current = null; }}
        onKeyDown={event => {
          const next = horizontal ? 'ArrowRight' : 'ArrowDown';
          const previous = horizontal ? 'ArrowLeft' : 'ArrowUp';
          if ([next, previous, 'PageDown', 'PageUp', 'Home', 'End'].includes(event.key)) {
            event.preventDefault();
            if (event.key === 'Home') scroll(0);
            else if (event.key === 'End') scroll(maximum);
            else scroll(metrics.position + (event.key === next || event.key === 'PageDown' ? 1 : -1) * (event.key.startsWith('Page') ? metrics.viewport : 40));
          }
        }} />
    </div>
    <button type="button" tabIndex={-1} className="scroll-arrow end" aria-label={horizontal ? '오른쪽으로 스크롤' : '아래로 스크롤'}
      onMouseDown={e => e.preventDefault()} onClick={() => scroll(metrics.position + 40)}>{horizontal ? '›' : '⌄'}</button>
  </div>;
}
