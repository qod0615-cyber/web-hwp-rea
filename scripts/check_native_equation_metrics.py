"""Compare the web TypeScript engine against dimensions stored by native HWP.

This checks document metrics, not glyph pixels or native reopening.
Usage: python3 scripts/check_native_equation_metrics.py [file-or-directory ...]
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import tempfile
from xml.etree import ElementTree as ET
from zipfile import ZipFile

ROOT = Path(__file__).resolve().parents[1]
NS = {'p': 'http://www.hancom.co.kr/hwpml/2011/paragraph'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('paths', nargs='*', type=Path)
    parser.add_argument('--report', type=Path, default=ROOT / 'verification/native-equation-metrics-current.json')
    args = parser.parse_args()
    paths = args.paths or [ROOT / 'verification/hwpx-roundtrip/2026-10-22/existing-native-generated-job-0043.hwpx']
    files = sorted({file.resolve() for path in paths for file in (path.rglob('*.hwpx') if path.is_dir() else [path])})
    rows = []
    sources = []
    for file in files:
        sources.append({'path': str(file.relative_to(ROOT)) if file.is_relative_to(ROOT) else str(file),
                        'sha256': hashlib.sha256(file.read_bytes()).hexdigest()})
        with ZipFile(file) as archive:
            for name in sorted(archive.namelist()):
                if not name.startswith('Contents/section') or not name.endswith('.xml'):
                    continue
                for equation in ET.fromstring(archive.read(name)).findall('.//p:equation', NS):
                    size = equation.find('p:sz', NS)
                    rows.append({'source': sources[-1]['path'], 'section': name,
                                 'script': equation.findtext('p:script', '', NS),
                                 'size': int(equation.get('baseUnit', '1100')),
                                 'expected': {'width': int(size.get('width')), 'height': int(size.get('height')),
                                              'baseline': int(equation.get('baseLine'))}})
    with tempfile.TemporaryDirectory(prefix='web-hwp-metrics-') as tmp:
        bundle = Path(tmp) / 'layout.cjs'
        import os
        esbuild_path = ROOT / ('node_modules/.bin/esbuild.cmd' if os.name == 'nt' else 'node_modules/.bin/esbuild')
        subprocess.run([str(esbuild_path), 'src/engine/layout.ts', '--bundle',
                        '--platform=node', '--format=cjs', f'--outfile={bundle}'], cwd=ROOT, check=True, capture_output=True, shell=(os.name == 'nt'))
        code = '''const {layoutEquation}=require(process.argv[1]);
const rows=JSON.parse(require('fs').readFileSync(0,'utf8'));
process.stdout.write(JSON.stringify(rows.map(r=>{try {
 const b=layoutEquation(r.script,r.size);
 return {width:b.w,height:b.h,baseline:b.baseLine,glyphs:b.glyphs.length};
}catch(e){return {error:String(e)}}})));'''
        actual = json.loads(subprocess.check_output(['node', '-e', code, str(bundle)], input=json.dumps(rows).encode(), cwd=ROOT))
    for row, result in zip(rows, actual):
        row['actual'] = result
        row['matched'] = all(result.get(key) == value for key, value in row['expected'].items())
    matched = sum(row['matched'] for row in rows)
    report = {'validation': 'Native HWPX stored dimensions versus bundled TypeScript engine; glyph pixels not checked',
              'sources': sources, 'native_document_equations': len(rows), 'all_metrics_matched': matched, 'rows': rows}
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
    print(f'{matched}/{len(rows)} exact width/height/baseline; report: {args.report}')
    for row in rows:
        if not row['matched']:
            print(json.dumps({key: row[key] for key in ['script', 'expected', 'actual']}, ensure_ascii=False))
    return 0 if rows and matched == len(rows) else 1


if __name__ == '__main__':
    raise SystemExit(main())
