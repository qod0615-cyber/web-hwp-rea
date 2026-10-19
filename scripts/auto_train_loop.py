import os
import sys
from PIL import Image, ImageChops
from playwright.sync_api import sync_playwright

def run_auto_train():
    html_path = os.path.abspath('dist/index.html')
    native_dlg_path = '/tmp/extracted_native_dialog.png'
    native_half_path = '/tmp/right_native.png'

    print("=== AUTOMATED PIXEL-PERFECT TRAINING & DIRECT DIFF ===")
    
    # 1. Evaluate Direct Dialog with User Native Capture
    if os.path.exists(native_dlg_path):
        native_dlg = Image.open(native_dlg_path).convert('RGB')
        nw, nh = native_dlg.size
        
        with sync_playwright() as p:
            b = p.chromium.launch(headless=True)
            pg = b.new_page(viewport={'width': 1204, 'height': 662})
            pg.goto('file://' + html_path)
            pg.wait_for_timeout(300)
            pg.keyboard.press('Control+n')
            pg.wait_for_timeout(150)
            pg.keyboard.press('t')
            pg.wait_for_timeout(300)
            pg.screenshot(path='/tmp/eval_modal_direct.png')
            b.close()
            
        web_screen = Image.open('/tmp/eval_modal_direct.png').convert('RGB')
        sw, sh = web_screen.size
        
        # Subpixel-accurate alignment
        best_rate = 0
        best_diff = None
        for dy in [-1, 0, 1]:
            top = round((sh - nh) / 2) + dy
            left = round((sw - nw) / 2)
            crop = web_screen.crop((left, top, left + nw, top + nh))
            diff = ImageChops.difference(native_dlg, crop)
            d = [max(r, g, b) for r, g, b in diff.getdata()]
            mm = sum(1 for v in d if v > 15)
            rate = ((len(d) - mm) / len(d)) * 100
            if rate > best_rate:
                best_rate = rate
                best_diff = diff
                
        print(f"[Direct Modal Compare]: {best_rate:.2f}% Match (User Native Dialog 440x315)")
        if best_diff:
            best_diff.save('/tmp/auto_modal_diff.png')

    # 2. Evaluate Native Workspace & Chrome
    if os.path.exists(native_half_path):
        native_screen = Image.open(native_half_path).convert('RGB')
        tw, th = native_screen.size
        
        with sync_playwright() as p:
            b = p.chromium.launch(headless=True)
            pg = b.new_page(viewport={'width': tw, 'height': th})
            pg.goto('file://' + html_path)
            pg.wait_for_timeout(300)
            pg.screenshot(path='/tmp/eval_chrome_direct.png')
            b.close()
            
        web_screen = Image.open('/tmp/eval_chrome_direct.png').convert('RGB')
        
        # Chrome regions:
        # Toolbar (32..221)
        tb_native = native_screen.crop((0, 32, tw, 221))
        tb_web = web_screen.crop((0, 32, tw, 221))
        tb_diff = ImageChops.difference(tb_native, tb_web)
        d_tb = [max(r, g, b) for r, g, b in tb_diff.getdata()]
        rate_tb = ((len(d_tb) - sum(1 for v in d_tb if v > 15)) / len(d_tb)) * 100
        print(f"[Toolbar & Ribbon (189px)]: {rate_tb:.2f}% Match")

        # Bottom Bar (1005..1036)
        bm_native = native_screen.crop((0, 1005, tw, 1036))
        bm_web = web_screen.crop((0, 1005, tw, 1036))
        bm_diff = ImageChops.difference(bm_native, bm_web)
        d_bm = [max(r, g, b) for r, g, b in bm_diff.getdata()]
        rate_bm = ((len(d_bm) - sum(1 for v in d_bm if v > 15)) / len(d_bm)) * 100
        print(f"[Bottom Status Bar (31px)]: {rate_bm:.2f}% Match")

        # Left Sidebar (0..89, 221..1005)
        ls_native = native_screen.crop((0, 221, 89, 1005))
        ls_web = web_screen.crop((0, 221, 89, 1005))
        ls_diff = ImageChops.difference(ls_native, ls_web)
        d_ls = [max(r, g, b) for r, g, b in ls_diff.getdata()]
        rate_ls = ((len(d_ls) - sum(1 for v in d_ls if v > 15)) / len(d_ls)) * 100
        print(f"[Left Sidebar & Ruler (89px)]: {rate_ls:.2f}% Match")

        # Right Scroll (941..958, 221..1005)
        rs_native = native_screen.crop((941, 221, tw, 1005))
        rs_web = web_screen.crop((941, 221, tw, 1005))
        rs_diff = ImageChops.difference(rs_native, rs_web)
        d_rs = [max(r, g, b) for r, g, b in rs_diff.getdata()]
        rate_rs = ((len(d_rs) - sum(1 for v in d_rs if v > 15)) / len(d_rs)) * 100
        print(f"[Right Scrollbar (17px)]: {rate_rs:.2f}% Match")

    print("======================================================")

if __name__ == '__main__':
    run_auto_train()
