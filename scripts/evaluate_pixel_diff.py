import os
import sys
import time
from PIL import Image, ImageChops
from playwright.sync_api import sync_playwright

def run_eval():
    html_path = os.path.abspath('dist/index.html')
    native_path = '/tmp/right_native.png'
    
    if not os.path.exists(native_path):
        print(f"Error: {native_path} not found.")
        return 0, None
        
    native = Image.open(native_path).convert('RGB')
    target_w, target_h = native.size  # 958, 1036
    
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        # Note: in browser viewport, we test without OS titlebar (or with titlebar)
        # In right_native, y=0..31 is OS titlebar.
        page = browser.new_page(viewport={'width': target_w, 'height': target_h})
        page.goto('file://' + html_path)
        page.wait_for_timeout(500)
        
        web_screenshot_path = '/tmp/eval_web_capture.png'
        page.screenshot(path=web_screenshot_path)
        browser.close()
        
    web = Image.open(web_screenshot_path).convert('RGB')
    
    # 1. Titlebar (y=0..32)
    native_title = native.crop((0, 0, target_w, 32))
    web_title = web.crop((0, 0, target_w, 32))
    diff_title = ImageChops.difference(native_title, web_title)
    d_title = [max(r, g, b) for r, g, b in diff_title.getdata()]
    mm_title = sum(1 for v in d_title if v > 15)
    rate_title = ((len(d_title) - mm_title) / len(d_title)) * 100

    # 2. Toolbar (y=32..221, 189px)
    native_toolbar = native.crop((0, 32, target_w, 221))
    web_toolbar = web.crop((0, 32, target_w, 221))
    diff_toolbar = ImageChops.difference(native_toolbar, web_toolbar)
    d_tool = [max(r, g, b) for r, g, b in diff_toolbar.getdata()]
    mm_tool = sum(1 for v in d_tool if v > 15)
    rate_tool = ((len(d_tool) - mm_tool) / len(d_tool)) * 100

    # 3. Bottom Status Bar (y=1005..1036, 31px)
    native_bottom = native.crop((0, 1005, target_w, 1036))
    web_bottom = web.crop((0, 1005, target_w, 1036))
    diff_bottom = ImageChops.difference(native_bottom, web_bottom)
    d_bottom = [max(r, g, b) for r, g, b in diff_bottom.getdata()]
    mm_bottom = sum(1 for v in d_bottom if v > 15)
    rate_bottom = ((len(d_bottom) - mm_bottom) / len(d_bottom)) * 100

    # 4. Left Sidebar (x=0..89, y=221..1005)
    native_left = native.crop((0, 221, 89, 1005))
    web_left = web.crop((0, 221, 89, 1005))
    diff_left = ImageChops.difference(native_left, web_left)
    d_left = [max(r, g, b) for r, g, b in diff_left.getdata()]
    mm_left = sum(1 for v in d_left if v > 15)
    rate_left = ((len(d_left) - mm_left) / len(d_left)) * 100

    # 5. Right Scrollbar (x=941..958, y=221..1005)
    native_right = native.crop((941, 221, target_w, 1005))
    web_right = web.crop((941, 221, target_w, 1005))
    diff_right = ImageChops.difference(native_right, web_right)
    d_right = [max(r, g, b) for r, g, b in diff_right.getdata()]
    mm_right = sum(1 for v in d_right if v > 15)
    rate_right = ((len(d_right) - mm_right) / len(d_right)) * 100

    total_chrome_pixels = len(d_title) + len(d_tool) + len(d_bottom) + len(d_left) + len(d_right)
    total_mismatched = mm_title + mm_tool + mm_bottom + mm_left + mm_right
    overall_match_rate = ((total_chrome_pixels - total_mismatched) / total_chrome_pixels) * 100

    # 6. Table Modal (Ctrl+N, T)
    native_dlg = Image.open('public/hwp_table_dialog_native.png').convert('RGB')
    nw, nh = native_dlg.size
    with sync_playwright() as p:
        b = p.chromium.launch(headless=True)
        pg = b.new_page(viewport={'width': target_w, 'height': target_h})
        pg.goto('file://' + html_path)
        pg.wait_for_timeout(300)
        pg.keyboard.press('Control+n')
        pg.wait_for_timeout(150)
        pg.keyboard.press('t')
        pg.wait_for_timeout(400)
        pg.screenshot(path='/tmp/eval_table_modal_capture.png')
        b.close()
    web_modal_full = Image.open('/tmp/eval_table_modal_capture.png').convert('RGB')
    left = (target_w - nw) // 2
    top = (target_h - nh) // 2
    web_dlg = web_modal_full.crop((left, top, left + nw, top + nh))
    diff_dlg = ImageChops.difference(native_dlg, web_dlg)
    d_dlg = [max(r, g, b) for r, g, b in diff_dlg.getdata()]
    mm_dlg = sum(1 for v in d_dlg if v > 15)
    rate_dlg = ((len(d_dlg) - mm_dlg) / len(d_dlg)) * 100

    print(f"=== FULL UI CHROME EVALUATION REPORT ===")
    print(f"1. Titlebar (32px):           {rate_title:.2f}% ({mm_title}/{len(d_title)} mismatch)")
    print(f"2. Toolbar & Ruler (189px):     {rate_tool:.2f}% ({mm_tool}/{len(d_tool)} mismatch)")
    print(f"3. Bottom Status Bar (31px):  {rate_bottom:.2f}% ({mm_bottom}/{len(d_bottom)} mismatch)")
    print(f"4. Left Sidebar (89px):       {rate_left:.2f}% ({mm_left}/{len(d_left)} mismatch)")
    print(f"5. Right Scrollbar (17px):    {rate_right:.2f}% ({mm_right}/{len(d_right)} mismatch)")
    print(f"6. Table Dialog (426x298):    {rate_dlg:.2f}% ({mm_dlg}/{len(d_dlg)} mismatch)")
    print(f"--------------------------------------------------")
    print(f"OVERALL CHROME MATCH RATE:    {overall_match_rate:.2f}% ({total_mismatched}/{total_chrome_pixels} mismatch)")
    return overall_match_rate, diff_toolbar

if __name__ == '__main__':
    run_eval()
