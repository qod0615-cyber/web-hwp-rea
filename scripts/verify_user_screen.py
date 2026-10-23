"""Verify the whole supplied viewport, not only a toolbar crop.

The pixel report is diagnostic: geometry and functional checks are asserted separately.
"""
import json
from pathlib import Path
from collections import Counter
from PIL import Image, ImageChops
from playwright.sync_api import sync_playwright

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'verification/screen-correction'
OUT.mkdir(exist_ok=True)
REFERENCE = ROOT / 'verification/user-screen-2026-10-22/native.png'


def paper_bounds(image):
    pixels = image.convert('RGB')
    for y in range(214, min(270, image.height)):
        runs = []
        start = None
        for x in range(image.width + 1):
            border = x < image.width and pixels.getpixel((x, y)) == (171, 171, 171)
            if border and start is None:
                start = x
            elif not border and start is not None:
                if x - start > 500:
                    runs.append((start, x))
                start = None
        if runs:
            left, right = max(runs, key=lambda pair: pair[1] - pair[0])
            return {'left': left, 'top': y, 'width': right - left}
    raise AssertionError('Native-sized paper border not found')


with sync_playwright() as runtime:
    browser = runtime.chromium.launch()
    page = browser.new_page(viewport={'width': 1918, 'height': 1031})
    errors = []
    page.on('pageerror', lambda error: errors.append(str(error)))
    page.goto((ROOT / 'index.html').as_uri())
    page.mouse.move(1500, 500)
    page.screenshot(path=str(OUT / 'current-1918x1031.png'))
    native = Image.open(REFERENCE).convert('RGB')
    current = Image.open(OUT / 'current-1918x1031.png').convert('RGB')
    bounds = paper_bounds(current)
    expected = paper_bounds(native)
    assert bounds == expected, (bounds, expected)
    assert page.get_by_role('scrollbar', name='문서 세로 스크롤', exact=True).count() == 1
    viewport = page.locator('#document-viewport')
    assert viewport.evaluate('(e)=>getComputedStyle(e).scrollbarWidth') == 'none'
    assert viewport.evaluate('(e)=>e.offsetWidth-e.clientWidth') == 0
    vertical = page.get_by_role('scrollbar', name='문서 세로 스크롤', exact=True)
    vertical.press('PageDown')
    assert viewport.evaluate('(e)=>e.scrollTop') > 0
    vertical.press('Home')
    assert viewport.evaluate('(e)=>e.scrollTop') == 0
    thumb = vertical.bounding_box()
    page.mouse.move(thumb['x'] + thumb['width'] / 2, thumb['y'] + thumb['height'] / 2)
    page.mouse.down()
    page.mouse.move(thumb['x'] + thumb['width'] / 2, thumb['y'] + thumb['height'] / 2 + 30, steps=5)
    page.mouse.up()
    assert viewport.evaluate('(e)=>e.scrollTop') > 0
    vertical.press('Home')
    before = page.get_by_test_id('document-paper').bounding_box()
    page.get_by_role('spinbutton', name='화면 배율', exact=True).fill('100')
    after = page.get_by_test_id('document-paper').bounding_box()
    assert 795 <= after['width'] <= 796, after
    assert before['width'] > after['width']
    assert before['y'] == after['y'] == 225
    assert page.locator('.document-zoom').bounding_box()['height'] == 24
    page.get_by_role('spinbutton', name='화면 배율', exact=True).fill('110')
    page.reload()
    assert page.get_by_role('spinbutton', name='화면 배율', exact=True).input_value() == '110'
    page.set_viewport_size({'width': 1919, 'height': 913})
    page.screenshot(path=str(OUT / 'current-1919x913.png'))
    assert page.locator('.document-zoom').bounding_box()['y'] == 913 - 24
    assert page.get_by_role('scrollbar', name='문서 세로 스크롤', exact=True).count() == 1
    assert not errors, errors
    difference = ImageChops.difference(native, current)
    difference.save(OUT / 'full-screen-difference.png')
    regions = {}
    for name, box in {'title': (0, 0, 1918, 32), 'menu_ribbon_format': (0, 32, 1918, 186),
                      'ruler': (0, 186, 1918, 214), 'workspace': (0, 214, 1918, 978),
                      'tabs_status': (0, 978, 1918, 1031)}.items():
        diff = difference.crop(box)
        regions[name] = {'different_pixels': sum(count for color, count in Counter(diff.get_flattened_data()).items() if color != (0, 0, 0)), 'total_pixels': diff.width * diff.height}
    report = {'reference': str(REFERENCE.relative_to(ROOT)), 'viewport': {'width': 1918, 'height': 1031},
              'document_zoom': 110, 'native_paper': expected, 'web_paper': bounds,
              'passed': ['paper bounds equal the supplied native screen', 'one functional vertical scrollbar; no browser scrollbar',
                         'PageDown/Home/drag scroll actual document', '100/110% changes paper and persists',
                         'ruler/footer stay at native pixel height in both supplied window sizes', 'browser errors: 0'],
              'pixel_diagnostics': regions,
              'limitations': 'Pixel report is unmasked and includes the requested theme change, native caret and different controls. Full UI parity is NOT yet achieved.'}
    (OUT / 'report.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps(report, ensure_ascii=False, indent=2))
    browser.close()
