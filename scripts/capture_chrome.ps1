Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public struct RECT { public int Left; public int Top; public int Right; public int Bottom; }
public class WinUtil {
  [DllImport("user32.dll")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);
  [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr hWnd);
}
"@

$proc = Get-Process chrome | Where-Object { $_.MainWindowTitle -ne '' } | Select-Object -First 1
if ($proc) {
  $r = New-Object RECT
  [WinUtil]::GetWindowRect($proc.MainWindowHandle, [ref]$r)
  $w = $r.Right - $r.Left
  $h = $r.Bottom - $r.Top
  Write-Output "CHROME_RECT: Left=$($r.Left), Top=$($r.Top), Width=$w, Height=$h, Title=$($proc.MainWindowTitle)"
  
  if ($w -gt 0 -and $h -gt 0) {
    $bmp = New-Object System.Drawing.Bitmap $w, $h
    $gfx = [System.Drawing.Graphics]::FromImage($bmp)
    $gfx.CopyFromScreen($r.Left, $r.Top, 0, 0, (New-Object System.Drawing.Size $w, $h))
    $bmp.Save("C:\Users\K\Desktop\Claude\Web HWP REA\current_chrome_view.png", [System.Drawing.Imaging.ImageFormat]::Png)
    $gfx.Dispose()
    $bmp.Dispose()
    Write-Output "SAVED: current_chrome_view.png"
  }
} else {
  Write-Output "CHROME_NOT_FOUND"
}
