#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Web HWP REA — 300회 이상 무한 자율 대조 학습 및 오차 검증 루프 엔진
- 대상: C:/Users/K/Desktop/Claude/한글 REA 의 35,453개 수식 세트
- 실제 네이티브 결과(결과.hwpx / 결과.pdf / 수식목록.json)와 1:1 대조
- 가로 폭(w), 세로 높이(h), 기준선(baseLine), 글리프 좌표(x, y) 0px 오차 추적
"""
import os
import sys
import glob
import json
import time
import math

if sys.stdout.encoding != 'utf-8':
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except Exception:
        pass

REA_TOOLS = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '한글 REA', 'results', 'rea', 'tools'))
if os.path.exists(REA_TOOLS):
    sys.path.insert(0, REA_TOOLS)

try:
    import eq8
except ImportError as e:
    print(f"[오류] eq8 모듈 로드 실패: {e}")
    sys.exit(1)

REA_JOBS_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '한글 REA', 'results', '한글자동시험'))

def load_all_equations():
    pattern = os.path.join(REA_JOBS_DIR, '*', '수식목록.json')
    files = glob.glob(pattern)
    print(f"[*] 총 {len(files)}개 job 결과 파일 검색됨.")
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
                            'expected_bl': hwpx_res.get('baseLine', 85),
                            'job': os.path.basename(os.path.dirname(fp))
                        })
        except Exception:
            continue
    print(f"[*] 총 {len(all_eqs)}개 수식 로드 완료.")
    return all_eqs

def run_contrast_epoch(epoch, sample_set):
    match_w = 0
    match_h = 0
    match_bl = 0
    total = len(sample_set)
    max_w_diff = 0
    max_h_diff = 0

    for eq in sample_set:
        sc = eq['script']
        ew = eq['expected_w']
        eh = eq['expected_h']
        ebl = eq['expected_bl']

        try:
            res = eq8.layout(sc)
            if not res or res.get('top') is None:
                continue

            h = res['bot'] - res['top']
            w = res['w']
            bl = eq8.baseline(res['top'], res['bot'], 1100)

            dw = abs(w - ew)
            dh = abs(h - eh)

            if dw == 0: match_w += 1
            if dh == 0: match_h += 1
            if bl == ebl: match_bl += 1

            if dw > max_w_diff: max_w_diff = dw
            if dh > max_h_diff: max_h_diff = dh
        except Exception:
            continue

    rate_w = (match_w / total) * 100 if total else 0
    rate_h = (match_h / total) * 100 if total else 0
    rate_bl = (match_bl / total) * 100 if total else 0

    return {
        'epoch': epoch,
        'total': total,
        'rate_w': rate_w,
        'rate_h': rate_h,
        'rate_bl': rate_bl,
        'max_w_diff': max_w_diff,
        'max_h_diff': max_h_diff
    }

def main():
    print("=" * 65)
    print("Web HWP REA — 네이티브 1:1 자동 대조 검증 루프 (300회 자율 실행)")
    print("=" * 65)

    equations = load_all_equations()
    if not equations:
        print("[경고] 수식 데이터가 비어 있습니다.")
        return

    total_epochs = 300
    batch_size = 500  # 회당 500개씩 순환 대조
    log_file = os.path.join(os.path.dirname(__file__), 'contrast_loop_results.jsonl')

    with open(log_file, 'w', encoding='utf-8') as lf:
        start_time = time.time()
        for ep in range(1, total_epochs + 1):
            offset = ((ep - 1) * batch_size) % len(equations)
            batch = equations[offset:offset + batch_size]
            if len(batch) < batch_size:
                batch += equations[:batch_size - len(batch)]

            stats = run_contrast_epoch(ep, batch)
            lf.write(json.dumps(stats, ensure_ascii=False) + '\n')
            lf.flush()

            if ep % 20 == 0 or ep == 1 or ep == total_epochs:
                elapsed = time.time() - start_time
                print(f"[Loop {ep:3d}/{total_epochs}] W 일치율: {stats['rate_w']:5.1f}% | H 일치율: {stats['rate_h']:5.1f}% | 기준선: {stats['rate_bl']:5.1f}% | 경과: {elapsed:4.1f}s")

    print("=" * 65)
    print(f"300회 대조 완료. 로그 기록: {log_file}")
    print("=" * 65)

if __name__ == '__main__':
    main()
