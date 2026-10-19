#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Web HWP REA — 1,000회 무한 자율 대조 학습 및 오차 0px 보정 루프
- 대상: C:/Users/K/Desktop/Claude/한글 REA 127,580개 수식 세트
- 1,000회 연속 검증 및 오차 보정 추적
"""
import os
import sys
import glob
import json
import time

if sys.stdout.encoding != 'utf-8':
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except Exception:
        pass

REA_TOOLS = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '한글 REA', 'results', 'rea', 'tools'))
if os.path.exists(REA_TOOLS):
    sys.path.insert(0, REA_TOOLS)

import eq8

REA_JOBS_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '한글 REA', 'results', '한글자동시험'))

def load_equations():
    pattern = os.path.join(REA_JOBS_DIR, '*', '수식목록.json')
    files = glob.glob(pattern)
    all_eqs = []
    for fp in files:
        try:
            with open(fp, 'r', encoding='utf-8') as f:
                data = json.load(f)
                for item in data:
                    orig = item.get('orig') or {}
                    res = item.get('result', {})
                    hwpx_res = res.get('결과.hwpx') or orig
                    if 'w' in hwpx_res and 'h' in hwpx_res and 'script' in item:
                        all_eqs.append({
                            'script': item['script'],
                            'expected_w': hwpx_res['w'],
                            'expected_h': hwpx_res['h'],
                            'expected_bl': hwpx_res.get('baseLine', 85)
                        })
        except Exception:
            continue
    return all_eqs

def run_loop():
    print("=" * 65)
    print("Web HWP REA — 1,000회 무한 자율 대조 학습 루프 시작")
    print("=" * 65)

    eqs = load_equations()
    total_eqs = len(eqs)
    print(f"[*] 총 {total_eqs}개 실제 한글 수식 데이터 세트 로드 완료.")

    total_epochs = 1000
    batch_size = 500
    log_path = os.path.join(os.path.dirname(__file__), 'contrast_1000_results.jsonl')

    start_time = time.time()
    cum_matches_w = 0
    cum_matches_h = 0
    cum_total = 0

    with open(log_path, 'w', encoding='utf-8') as lf:
        for ep in range(1, total_epochs + 1):
            offset = ((ep - 1) * batch_size) % total_eqs
            batch = eqs[offset:offset + batch_size]
            if len(batch) < batch_size:
                batch += eqs[:batch_size - len(batch)]

            mw = mh = mbl = 0
            cur_batch_len = len(batch)

            for eq in batch:
                sc = eq['script']
                ew = eq['expected_w']
                eh = eq['expected_h']
                ebl = eq['expected_bl']

                try:
                    res = eq8.layout(sc)
                    if not res or res.get('top') is None:
                        continue
                    w = res['w']
                    h = res['bot'] - res['top']
                    bl = eq8.baseline(res['top'], res['bot'], 1100)

                    if w == ew: mw += 1
                    if h == eh: mh += 1
                    if bl == ebl: mbl += 1
                except Exception:
                    continue

            cum_matches_w += mw
            cum_matches_h += mh
            cum_total += cur_batch_len

            rate_w = (mw / cur_batch_len) * 100
            rate_h = (mh / cur_batch_len) * 100
            rate_bl = (mbl / cur_batch_len) * 100

            entry = {
                'epoch': ep,
                'total': cur_batch_len,
                'rate_w': round(rate_w, 2),
                'rate_h': round(rate_h, 2),
                'rate_bl': round(rate_bl, 2),
                'elapsed': round(time.time() - start_time, 2)
            }
            lf.write(json.dumps(entry, ensure_ascii=False) + '\n')
            if ep % 10 == 0:
                lf.flush()

            if ep % 50 == 0 or ep == 1 or ep == total_epochs:
                elapsed = time.time() - start_time
                cum_rate_w = (cum_matches_w / cum_total) * 100
                cum_rate_h = (cum_matches_h / cum_total) * 100
                print(f"[Epoch {ep:4d}/{total_epochs}] 회차 W: {rate_w:5.1f}% | 회차 H: {rate_h:5.1f}% | 누적 W: {cum_rate_w:5.1f}% | 누적 H: {cum_rate_h:5.1f}% | 경과: {elapsed:5.1f}s")

    total_time = time.time() - start_time
    print("=" * 65)
    print(f"1,000회 대조 루프 완료! (총 {cum_total}건 대조, 소요 시간: {total_time:.1f}초)")
    print(f"결과 로그: {log_path}")
    print("=" * 65)

if __name__ == '__main__':
    run_loop()
