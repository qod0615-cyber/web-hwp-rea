"""Memory DC GDI height probe. Never loads HNC DLLs or obtains a screen DC."""
import ctypes
from ctypes import wintypes as w
import datetime
import hashlib
import json
from pathlib import Path
import platform
import sys
from fontTools.ttLib import TTFont

HERE = Path(__file__).resolve().parent
md = lambda a, b, c: (a * b + c // 2) // c
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()

class TEXTMETRICW(ctypes.Structure):
    _fields_ = [(name, w.LONG) for name in (
        'tmHeight', 'tmAscent', 'tmDescent', 'tmInternalLeading',
        'tmExternalLeading', 'tmAveCharWidth', 'tmMaxCharWidth',
        'tmWeight', 'tmOverhang', 'tmDigitizedAspectX', 'tmDigitizedAspectY')]
    _fields_ += [(name, w.WCHAR) for name in (
        'tmFirstChar', 'tmLastChar', 'tmDefaultChar', 'tmBreakChar')]
    _fields_ += [(name, w.BYTE) for name in (
        'tmItalic', 'tmUnderlined', 'tmStruckOut', 'tmPitchAndFamily', 'tmCharSet')]

def main():
    target = HERE / 'results.json'
    assert not target.exists(), 'Existing results are preserved'
    previous = json.loads((HERE.parent / 'gdi-font-widths-full.json').read_text(encoding='utf-8'))
    fonts = previous['metadata']['fonts']
    cmaps = {}
    for info in fonts:
        p = Path(info['path'])
        assert sha(p) == info['sha256']
        with TTFont(p, fontNumber=0) as font:
            cmaps[info['face']] = set().union(*(set(t.cmap) for t in font['cmap'].tables if t.isUnicode()))
    # Existing sim.py PUA map: s=E0E5+(ord('s')-ord('a'))=E0F7, 9=E03C.
    chars = [(c, ord(c)) for c in 'GPQDlm'] + [('PUA_s', 0xE0F7), ('PUA_9', 0xE03C), ('space', 0x20)]
    g = ctypes.WinDLL('gdi32', use_last_error=True)
    declarations = {
        'CreateCompatibleDC': ([w.HDC], w.HDC),
        'CreateFontW': ([ctypes.c_int] * 5 + [w.DWORD] * 8 + [w.LPCWSTR], w.HFONT),
        'SelectObject': ([w.HDC, w.HGDIOBJ], w.HGDIOBJ),
        'GetTextExtentPoint32W': ([w.HDC, w.LPCWSTR, ctypes.c_int, ctypes.POINTER(w.SIZE)], w.BOOL),
        'GetTextExtentExPointW': ([w.HDC, w.LPCWSTR, ctypes.c_int, ctypes.c_int, ctypes.POINTER(ctypes.c_int), ctypes.POINTER(ctypes.c_int), ctypes.POINTER(w.SIZE)], w.BOOL),
        'GetTextMetricsW': ([w.HDC, ctypes.POINTER(TEXTMETRICW)], w.BOOL),
        'DeleteObject': ([w.HGDIOBJ], w.BOOL),
        'DeleteDC': ([w.HDC], w.BOOL),
    }
    for name, (args, ret) in declarations.items():
        getattr(g, name).argtypes = args
        getattr(g, name).restype = ret
    errors, cleanup, rows, metrics = [], [], [], []
    made = deleted = restored_count = 0
    dc = g.CreateCompatibleDC(None)
    if not dc:
        raise RuntimeError('CreateCompatibleDC(NULL): ' + str(ctypes.get_last_error()))
    try:
        for base in [800, 900, 1000, 1100, 1200, 1400, 2000]:
            size = base
            for depth in range(5):
                if depth:
                    size = md(size, 68, 100)
                H, W = md(size, 96, 7200), md(size // 2, 96, 7200)
                for info in fonts:
                    face = info['face']
                    key = {'base_HU': base, 'depth': depth, 'size_HU': size, 'H': H, 'W': W, 'face': face}
                    font, old = None, None
                    try:
                        font = g.CreateFontW(-H, W, 0, 0, 400, 0, 0, 0, 1, 0, 0, 0, 0, face)
                        if not font:
                            raise RuntimeError('CreateFontW: ' + str(ctypes.get_last_error()))
                        made += 1
                        old = g.SelectObject(dc, font)
                        if not old or old == ctypes.c_void_p(-1).value:
                            old = None
                            raise RuntimeError('SelectObject: ' + str(ctypes.get_last_error()))
                        tm = TEXTMETRICW()
                        ctypes.set_last_error(0)
                        ok = bool(g.GetTextMetricsW(dc, ctypes.byref(tm)))
                        mr = {**key, 'success': ok, 'metrics': {n: getattr(tm, n) for n in (
                            'tmHeight', 'tmAscent', 'tmDescent', 'tmInternalLeading', 'tmExternalLeading')} if ok else None}
                        if not ok:
                            errors.append({**key, 'api': 'GetTextMetricsW', 'winerror': ctypes.get_last_error()})
                        metrics.append(mr)
                        for label, code in chars:
                            text = chr(code)
                            row = {**key, 'label': label, 'code': code, 'in_requested_face_cmap': code in cmaps[face], 'model_cy_HU': H * 75}
                            for api in ['GetTextExtentPoint32W', 'GetTextExtentExPointW']:
                                extent = w.SIZE()
                                fit, dx = ctypes.c_int(), ctypes.c_int()
                                ctypes.set_last_error(0)
                                if api == 'GetTextExtentPoint32W':
                                    success = bool(g.GetTextExtentPoint32W(dc, text, 1, ctypes.byref(extent)))
                                else:
                                    success = bool(g.GetTextExtentExPointW(dc, text, 1, 0x7fffffff, ctypes.byref(fit), ctypes.byref(dx), ctypes.byref(extent)))
                                result = {'success': success, 'cx': extent.cx if success else None, 'cy': extent.cy if success else None}
                                if success:
                                    result.update({'cy_HU_at_96dpi': extent.cy * 75, 'delta_from_model_HU': (extent.cy - H) * 75})
                                    if api == 'GetTextExtentExPointW':
                                        result.update({'fit': fit.value, 'dx': dx.value})
                                else:
                                    result['winerror'] = ctypes.get_last_error()
                                    errors.append({**key, 'code': code, 'api': api, 'winerror': result['winerror']})
                                row[api] = result
                            row['text_metrics'] = mr['metrics']
                            rows.append(row)
                    except Exception as exc:
                        errors.append({**key, 'error': str(exc)})
                    finally:
                        if old:
                            restored = g.SelectObject(dc, old)
                            if not restored or restored == ctypes.c_void_p(-1).value:
                                cleanup.append({**key, 'api': 'SelectObject restore', 'winerror': ctypes.get_last_error()})
                            else:
                                restored_count += 1
                        if font:
                            if g.DeleteObject(font):
                                deleted += 1
                            else:
                                cleanup.append({**key, 'api': 'DeleteObject', 'winerror': ctypes.get_last_error()})
    finally:
        dc_deleted = bool(g.DeleteDC(dc))
        if not dc_deleted:
            cleanup.append({'api': 'DeleteDC', 'winerror': ctypes.get_last_error()})
    summary = {
        'row_count': len(rows), 'metric_records': len(metrics),
        'extent_api_calls': len(rows) * 2, 'error_count': len(errors),
        'cleanup_error_count': len(cleanup),
        'point_cy_differs_from_model_count': sum(r['GetTextExtentPoint32W']['success'] and r['GetTextExtentPoint32W']['delta_from_model_HU'] != 0 for r in rows),
        'expoint_cy_differs_from_model_count': sum(r['GetTextExtentExPointW']['success'] and r['GetTextExtentExPointW']['delta_from_model_HU'] != 0 for r in rows),
        'point_vs_expoint_difference_count': sum((r['GetTextExtentPoint32W']['cx'], r['GetTextExtentPoint32W']['cy']) != (r['GetTextExtentExPointW']['cx'], r['GetTextExtentExPointW']['cy']) for r in rows),
        'cleanup': {'fonts_created': made, 'fonts_deleted': deleted, 'original_selection_restored': restored_count, 'DC_created': 1, 'DC_deleted': int(dc_deleted)},
    }
    metadata = {
        'created_at': datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'windows': platform.platform(), 'windows_version': list(sys.getwindowsversion()),
        'fonts': fonts, 'probe_code_sha256': sha(Path(__file__)),
        'formula': 's=base then iterative MulDiv(s,68,100) depths 1..4; H=MulDiv(s,96,7200), W=MulDiv(s//2,96,7200); CreateFontW(-H,W,0,0,400,0,0,0,1,0,0,0,0,face)',
        'units': 'Raw GDI SIZE/TEXTMETRIC are MM_TEXT memory-DC logical pixels; at assumed 96dpi, compare cy*75 against H*75 HU. This is not an HNC wrapper or native-save-context measurement.',
        'scope': 'gdi32 only; CreateCompatibleDC(NULL); no screen DC, rendering, HNC execution, process operations, Hwp, COM, GUI or request creation.',
        'font_realization': 'Requested face only, no new font registration; cmap support flagged. Actual realized face not queried; missing cmap widths/heights may describe default/replacement glyphs.',
        'interpretation': 'No fitted size/script corrections. Equality here does not prove HNC wrapper SIZE.cy equality under native mapping/modes.',
    }
    with target.open('x', encoding='utf-8') as f:
        json.dump({'metadata': metadata, 'summary': summary, 'errors': errors, 'cleanup_errors': cleanup, 'font_metrics': metrics, 'measurements': rows}, f, ensure_ascii=False, indent=2)
    print(json.dumps(summary, indent=2))

if __name__ == '__main__':
    main()
