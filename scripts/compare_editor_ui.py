"""Compare the local app with an explicit, same-size reference image.

Usage: python3 scripts/compare_editor_ui.py /path/to/reference.png
Reports exact differences separately from differences above 15 per RGB channel.
The caller is responsible for reference provenance; this does not capture native HWP.
"""
import argparse
import hashlib
import json
from pathlib import Path
from PIL import Image, ImageChops
from playwright.sync_api import sync_playwright

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('reference', type=Path)
args = parser.parse_args()
reference = args.reference.resolve()
native = Image.open(reference).convert('RGB')
width, height = native.size
output = ROOT / 'verification'
output.mkdir(exist_ok=True)
with sync_playwright() as runtime:
    browser = runtime.chromium.launch()
    page = browser.new_page(viewport={'width': width, 'height': height})
    page.goto((ROOT / 'index.html').as_uri())
    page.evaluate('()=>document.fonts.ready')
    capture = output / f'editor-{width}.png'
    page.screenshot(path=str(capture))
    browser.close()
web = Image.open(capture).convert('RGB')
report = {'reference': str(reference), 'reference_sha256': hashlib.sha256(reference.read_bytes()).hexdigest()}
for label, rect in [('top_ui', (0, 0, width, 219)), ('whole_page', (0, 0, width, height))]:
    diff = ImageChops.difference(native.crop(rect), web.crop(rect))
    pixels = list(getattr(diff, 'get_flattened_data', diff.getdata)())
    count = sum(max(pixel) > 0 for pixel in pixels)
    report[label] = {
        'pixels': len(pixels),
        'different_pixels': count,
        'different_pixels_above_15': sum(max(pixel) > 15 for pixel in pixels),
        'exact_match_percent': round(100 * (1 - count / len(pixels)), 4),
    }
ImageChops.difference(native, web).save(output / f'native-diff-{width}.png')
(output / 'pixel-comparison.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report, indent=2))
