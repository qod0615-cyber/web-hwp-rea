import os
import sys
import time
import json
from PIL import Image, ImageChops
from playwright.sync_api import sync_playwright

def run_loop():
    html_path = os.path.abspath('dist/index.html')
    native_dlg_path = '/tmp/extracted_native_dialog.png'
    native_half_path = '/tmp/right_native_1916.png' if os.path.exists('/tmp/right_native_1916.png') else '/tmp/right_native.png'
    log_path = '/tmp/infinite_train_status.json'

    iteration = 0
    print("[Runner] Starting infinite autonomous contrast loop...")

    while True:
        iteration += 1
        start_time = time.time()
        try:
            # 1. Dialog Match
            dlg_match = 0.0
            if os.path.exists(native_dlg_path):
                native_dlg = Image.open(native_dlg_path).convert('RGB')
                nw, nh = native_dlg.size
                with sync_playwright() as p:
                    b = p.chromium.launch(headless=True)
                    pg = b.new_page(viewport={'width': 1204, 'height': 662})
                    pg.goto('file://' + html_path)
                    pg.wait_for_timeout(200)
                    pg.keyboard.press('Control+n')
                    pg.wait_for_timeout(100)
                    pg.keyboard.press('t')
                    pg.wait_for_timeout(200)
                    pg.screenshot(path='/tmp/inf_dlg_capture.png')
                    b.close()
                web = Image.open('/tmp/inf_dlg_capture.png').convert('RGB')
                sw, sh = web.size
                best_dlg = 0.0
                for dy in [-1, 0, 1]:
                    top = round((sh - nh) / 2) + dy
                    left = round((sw - nw) / 2)
                    crop = web.crop((left, top, left + nw, top + nh))
                    diff = ImageChops.difference(native_dlg, crop)
                    d = [max(r, g, b) for r, g, b in diff.getdata()]
                    rate = ((len(d) - sum(1 for v in d if v > 15)) / len(d)) * 100
                    if rate > best_dlg:
                        best_dlg = rate
                dlg_match = best_dlg

            # 2. Chrome Match
            chrome_match = 0.0
            if os.path.exists(native_half_path):
                native_screen = Image.open(native_half_path).convert('RGB')
                tw, th = native_screen.size
                with sync_playwright() as p:
                    b = p.chromium.launch(headless=True)
                    pg = b.new_page(viewport={'width': tw, 'height': th})
                    pg.goto('file://' + html_path)
                    pg.wait_for_timeout(200)
                    pg.screenshot(path='/tmp/inf_chrome_capture.png')
                    b.close()
                web = Image.open('/tmp/inf_chrome_capture.png').convert('RGB')
                tb_native = native_screen.crop((0, 0, tw, 219))
                tb_web = web.crop((0, 0, tw, 219))
                diff = ImageChops.difference(tb_native, tb_web)
                d = [max(r, g, b) for r, g, b in diff.getdata()]
                chrome_match = ((len(d) - sum(1 for v in d if v > 15)) / len(d)) * 100

            elapsed = time.time() - start_time
            status = {
                'iteration': iteration,
                'timestamp': time.time(),
                'elapsed_sec': round(elapsed, 2),
                'dialog_match_rate': round(dlg_match, 2),
                'toolbar_match_rate': round(chrome_match, 2),
                'status': 'RUNNING'
            }

            with open(log_path, 'w') as f:
                json.dump(status, f, indent=2)

            print(f"[Loop #{iteration}] Dialog: {dlg_match:.2f}%, Toolbar: {chrome_match:.2f}% ({elapsed:.1f}s)")
        except Exception as e:
            print(f"[Loop #{iteration}] Temporary error: {e}, continuing...")
        time.sleep(2)

if __name__ == '__main__':
    run_loop()
