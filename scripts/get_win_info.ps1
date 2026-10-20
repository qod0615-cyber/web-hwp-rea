Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public struct RECT { public int Left; public int Top; public int Right; public int Bottom; }
public class WinUtil {
  [DllImport("user32.dll")] public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);
  [DllImport("user32.dll")] public static extern bool GetClientRect(IntPtr hWnd, out RECT lpRect);
}
"@

$proc = Get-Process chrome | Where-Object { $_.MainWindowTitle -like '*빈 문서*' } | Select-Object -First 1
if ($proc) {
  $r = New-Object RECT
  $c = New-Object RECT
  [WinUtil]::GetWindowRect($proc.MainWindowHandle, [ref]$r)
  [WinUtil]::GetClientRect($proc.MainWindowHandle, [ref]$c)
  $w = $r.Right - $r.Left
  $h = $r.Bottom - $r.Top
  $cw = $c.Right - $c.Left
  $ch = $c.Bottom - $c.Top
  Write-Output "CHROME_WINDOW: Width=$w, Height=$h, ClientWidth=$cw, ClientHeight=$ch"
} else {
  Write-Output "CHROME_NOT_FOUND"
}
