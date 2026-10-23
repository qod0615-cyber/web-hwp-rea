"""Retrieve Windows capture evidence over the private Orca/Tailscale connection.

The companion HTTP server must expose only the native-baseline output directory.
Retrieval is not visual validation. Capture acceptance belongs in review.json.
"""
import argparse
import hashlib
import json
from pathlib import Path
from urllib.parse import quote
from urllib.request import ProxyHandler, build_opener

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--url', default='http://100.105.111.56:18976')
parser.add_argument('--output', type=Path, default=Path(__file__).resolve().parents[1] / 'verification/native-baseline/2026-10-22')
parser.add_argument('--extra', nargs='*', default=[], help='Additional plain filenames from the same evidence directory')
parser.add_argument('--manifest', default='manifest.json', help='Plain filename of the run manifest to retrieve')
args = parser.parse_args()
args.output.mkdir(parents=True, exist_ok=True)
opener = build_opener(ProxyHandler({}))


def fetch(name):
    if Path(name).name != name or name in ('.', '..') or '\\' in name:
        raise ValueError(f'Expected a plain capture filename: {name!r}')
    with opener.open(args.url.rstrip('/') + '/' + quote(name), timeout=15) as response:
        data = response.read()
    (args.output / name).write_bytes(data)
    return data


manifest_bytes = fetch(args.manifest)
manifest = json.loads(manifest_bytes.decode('utf-8-sig'))
names = set(args.extra)
if manifest.get('font_inventory'):
    names.add(manifest['font_inventory'])
captures = list(manifest.get('captures', []))
for value in manifest.values():
    if isinstance(value, dict) and isinstance(value.get('captures'), list):
        captures.extend(value['captures'])
for capture in captures:
    if capture.get('raw'):
        names.add(capture['raw'])
    for key in ('white', 'black', 'composite'):
        if capture.get('cursor', {}).get(key):
            names.add(capture['cursor'][key])
receipt = {'source': args.url, 'files': {}, 'note': 'downloaded evidence; not a visual acceptance report'}
receipt['files'][args.manifest] = hashlib.sha256(manifest_bytes).hexdigest()
for name in sorted(names):
    data = fetch(name)
    receipt['files'][name] = hashlib.sha256(data).hexdigest()
(args.output / 'collection-receipt.json').write_text(json.dumps(receipt, indent=2) + '\n')
print(json.dumps({'output': str(args.output), 'downloaded_files': len(receipt['files']), 'capture_names': [item.get('name') for item in captures]}, indent=2))
