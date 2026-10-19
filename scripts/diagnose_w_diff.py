#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os, sys, glob, json, re
from collections import Counter

sys.stdout.reconfigure(encoding='utf-8')

REA_TOOLS = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '한글 REA', 'results', 'rea', 'tools'))
sys.path.insert(0, REA_TOOLS)
import eq8

REA_JOBS_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '한글 REA', 'results', '한글자동시험'))

def main():
    pattern = os.path.join(REA_JOBS_DIR, '*', '수식목록.json')
    files = glob.glob(pattern)
    diffs = []
    causes = Counter()

    for fp in files:
        with open(fp, 'r', encoding='utf-8') as f:
            try: data = json.load(f)
            except: continue
            for item in data:
                sc = item.get('script')
                hwpx = (item.get('result') or {}).get('결과.hwpx') or item.get('orig') or {}
                if 'w' not in hwpx or not sc: continue
                ew = hwpx['w']
                try:
                    res = eq8.layout(sc)
                    if not res or res.get('top') is None: continue
                    w = res['w']
                    dw = w - ew
                    if dw != 0:
                        diffs.append((dw, sc, ew, w))
                        if re.search(r'\b(rm|RM)\b', sc): causes['rm'] += 1
                        elif re.search(r'\b(sin|cos|tan|log|ln|exp|det|max|min)\b', sc): causes['func'] += 1
                        elif re.search(r'\bover\b', sc): causes['frac'] += 1
                        elif re.search(r'[\^_]', sc): causes['scr'] += 1
                        elif re.search(r'(?i)\broot\b', sc): causes['root'] += 1
                        elif re.search(r'(?i)\b(matrix|pmatrix|cases)\b', sc): causes['mat'] += 1
                        else: causes['other'] += 1
                except Exception:
                    causes['unsupported'] += 1

    print(f"Total mismatched: {len(diffs)}")
    print("Mismatched cause categories:")
    for c, cnt in causes.most_common():
        print(f"  {c:15s}: {cnt}")

    print("\nSample discrepancies (dw, script, expected_w, actual_w):")
    for dw, sc, ew, w in diffs[:15]:
        print(f"  dw={dw:+4d} | exp={ew:5d} act={w:5d} | {sc}")

if __name__ == '__main__':
    main()
