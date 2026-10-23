"""Build the compact web width table from Windows memory-DC measurements.

Only widths for characters present in the requested font's cmap are included.
HYhwpEQ takes precedence; supported Haansoft Batang glyphs fill the gaps.
"""
import argparse
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('source', type=Path)
args = parser.parse_args()
data = json.loads(args.source.read_text())
if data['metadata']['failed_row_count'] or data['metadata']['cleanup_errors']:
    raise SystemExit('The measurement contains failures; review the source evidence first.')
tables = {}
for face in ['HYhwpEQ', 'Haansoft Batang']:
    for row in data['widths']:
        if row['face'] != face or not row['in_requested_face_cmap']:
            continue
        if not isinstance(row['width_px'], int) or row['width_px'] < 0:
            raise SystemExit(f'Invalid width for {row["code"]}')
        key = f'{row["H"]},{row["W"]}'
        tables.setdefault(key, {}).setdefault(str(row['code']), row['width_px'])
output = ROOT / 'src/engine/gdi-widths.json'
output.write_text(json.dumps(tables, separators=(',', ':')) + '\n')
print(f'{output}: {len(tables)} font size pairs; source SHA256={hashlib.sha256(args.source.read_bytes()).hexdigest()}')
