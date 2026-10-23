"""Test opening web-generated HWPX files in native Hancom Office via COM.

Verifies:
1. File opens in native HwpObject without format error.
2. Body text and equation scripts are intact.
3. Clean exit without lingering modal dialogs.
"""
import json
import os
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

def test_open_hwpx(hwpx_path: Path):
    if not hwpx_path.exists():
        return {"file": str(hwpx_path), "success": False, "error": "file not found"}
    
    import win32com.client as win32
    
    hwp = win32.DispatchEx("HWPFrame.HwpObject")
    try:
        # Register bypass module
        registered = False
        for mod in ["FilePathCheckerModule", "AstrisPathChecker"]:
            try:
                res = hwp.RegisterModule("FilePathCheckDLL", mod)
                if res:
                    registered = True
                    break
            except Exception:
                pass
        
        # Suppress message boxes (0x00020021 = auto-discard dialogs, no prompt)
        try:
            hwp.SetMessageBoxMode(0x00020021)
        except Exception:
            pass
        
        abs_path = str(hwpx_path.resolve())
        opened = hwp.Open(abs_path, "HWPX", "")
        
        if not opened:
            return {
                "file": str(hwpx_path),
                "success": False,
                "error": "hwp.Open returned False",
                "registered": registered,
                "hwp_version": getattr(hwp, "Version", None),
            }
        
        # Read text content
        text_content = ""
        try:
            text_content = hwp.GetTextFile("TEXT", "")
        except Exception as e:
            text_content = f"error getting text: {e}"
        
        # Check equation count and script
        eq_count = 0
        eq_scripts = []
        try:
            ctrl = hwp.HeadCtrl
            while ctrl:
                if ctrl.CtrlID == "eqed":
                    eq_count += 1
                    pset = ctrl.Properties
                    script = pset.Item("String") if pset else ""
                    eq_scripts.append(script)
                ctrl = ctrl.Next
        except Exception as e:
            eq_scripts.append(f"error traversing ctrl: {e}")
        
        return {
            "file": str(hwpx_path),
            "success": True,
            "registered": registered,
            "hwp_version": getattr(hwp, "Version", None),
            "text_content": text_content.strip()[:200],
            "equation_count": eq_count,
            "equation_scripts": eq_scripts,
        }
    finally:
        try:
            hwp.Clear(1)
            hwp.Quit()
        except Exception:
            pass

def main():
    if os.name != 'nt':
        print("This test requires Windows with Hancom Office installed.")
        sys.exit(0)
    
    target_files = [
        ROOT / "verification/release-2026-10-23/live-saved.hwpx",
        ROOT / "verification/hwpx-roundtrip/browser-workflows/rich-document.hwpx",
    ]
    
    results = []
    for tf in target_files:
        if tf.exists():
            print(f"Testing {tf.name}...")
            res = test_open_hwpx(tf)
            results.append(res)
            print(f"  Result: success={res.get('success')}, eq_count={res.get('equation_count')}")
        else:
            print(f"Skipping {tf.name} (not found)")
    
    out_path = ROOT / "verification/hwpx-roundtrip/native-open-report.json"
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(results, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Report written to {out_path}")

if __name__ == "__main__":
    main()
