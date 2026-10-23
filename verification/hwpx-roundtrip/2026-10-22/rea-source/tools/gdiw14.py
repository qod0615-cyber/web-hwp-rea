"""REA 14차: GDI 로 HYhwpEQ 글자 진행폭(px) 실측 — lfHeight=-H, lfWidth=W (한글: H = MulDiv(s,96,7200), W = MulDiv(s/2,96,7200)).
python gdiw14.py H W [문자들]   (Hwp.exe 없이 Windows 글꼴 엔진만 씀)"""
import ctypes, sys
from ctypes import wintypes as wt
g = ctypes.WinDLL('gdi32'); u = ctypes.WinDLL('user32')
g.CreateFontW.restype = wt.HFONT
g.CreateFontW.argtypes = [ctypes.c_int] * 5 + [wt.DWORD] * 8 + [wt.LPCWSTR]
g.SelectObject.argtypes = [wt.HDC, wt.HGDIOBJ]; g.SelectObject.restype = wt.HGDIOBJ
g.GetCharWidth32W.argtypes = [wt.HDC, ctypes.c_uint, ctypes.c_uint, ctypes.POINTER(ctypes.c_int)]
g.GetTextExtentPoint32W.argtypes = [wt.HDC, wt.LPCWSTR, ctypes.c_int, ctypes.POINTER(wt.SIZE)]
u.GetDC.restype = wt.HDC
_dc = None; _fonts = {}
def widths(H, W, codes, face='HYhwpEQ'):
    global _dc
    if _dc is None: _dc = g.CreateCompatibleDC(None)
    k = (H, W, face)
    if k not in _fonts: _fonts[k] = g.CreateFontW(-H, W, 0, 0, 400, 0, 0, 0, 1, 0, 0, 0, 0, face)
    g.SelectObject(_dc, _fonts[k]); out = {}
    for c in codes:
        v = ctypes.c_int(); g.GetCharWidth32W(_dc, c, c, ctypes.byref(v)); out[c] = v.value
    return out
if __name__ == '__main__':
    H, W = int(sys.argv[1]), int(sys.argv[2]); cs = sys.argv[3] if len(sys.argv) > 3 else 'ABCDGJOQ'
    print(widths(H, W, [ord(c) for c in cs]))
