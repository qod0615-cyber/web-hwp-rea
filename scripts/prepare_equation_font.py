"""Rebuild cmap for Chromium, preserving the original font and glyph outlines.

Requires fonttools: python3 -m pip install fonttools
Run from any directory: python3 scripts/prepare_equation_font.py
"""
from pathlib import Path
from fontTools.ttLib import TTFont
from fontTools.ttLib.tables._c_m_a_p import CmapSubtable

fonts = Path(__file__).resolve().parents[1] / 'public' / 'fonts'
font = TTFont(fonts / 'HYHWPEQ.TTF', recalcTimestamp=False)
valid_glyphs = set(font.getGlyphOrder())
for index, original in enumerate(font['cmap'].tables):
    rebuilt = CmapSubtable.newSubtable(original.format)
    rebuilt.platformID = original.platformID
    rebuilt.platEncID = original.platEncID
    rebuilt.language = original.language
    rebuilt.cmap = {code: name for code, name in original.cmap.items() if name in valid_glyphs}
    font['cmap'].tables[index] = rebuilt
destination = fonts / 'HYHWPEQ.web.ttf'
font.save(destination)
print(destination)
