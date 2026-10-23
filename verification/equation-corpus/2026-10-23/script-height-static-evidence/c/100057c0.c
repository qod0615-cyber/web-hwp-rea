// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 3522-3625
//==== 100057c0 FUN_100057c0

/* WARNING: Function: __alloca_probe replaced with injection: alloca_probe */

void FUN_100057c0(undefined4 param_1,wchar_t *param_2,HGDIOBJ param_3,HDC param_4)

{
  wchar_t wVar1;
  HDC hdcSrc;
  wchar_t *pwVar2;
  HBITMAP h;
  int unaff_EBX;
  undefined1 *cy;
  uint uVar3;
  int iVar4;
  bool bVar5;
  ushort uVar6;
  HDC pHStack_1ff4;
  HDC local_1ff0;
  HDC local_1fec;
  HDC local_1fe8;
  wchar_t *local_1fe4;
  HDC pHStack_1fe0;
  HGDIOBJ local_1fdc;
  HDC local_1fd8;
  HBITMAP local_1fd4;
  undefined4 local_1fd0 [4];
  void *local_1fc0;
  int *piStack_1fa0;
  int iStack_1f78;
  wchar_t local_1f50;
  undefined1 local_1f4e [7994];
  uint uStack_14;
  uint local_c;
  
  local_c = DAT_100d100c ^ (uint)&pHStack_1ff4;
  local_1fdc = param_3;
  local_1ff0 = param_4;
  local_1fe8 = GetDC((HWND)0x0);
  local_1fd8 = CreateCompatibleDC(local_1fe8);
  local_1fec = CreateCompatibleDC(local_1fe8);
  cy = (undefined1 *)((int)&local_1ff0[-1].unused + 2);
  local_1fd4 = CreateCompatibleBitmap(local_1fe8,(int)param_3 + -2,(int)cy);
  SelectObject(local_1fec,local_1fd4);
  CHncDrawContext::HFillSolidRect(local_1fec,0,0,(int)param_3 + -2,(int)cy,0xffffff);
  FUN_100852e0(local_1fd0);
  CHncStringW::CHncStringW((CHncStringW *)&local_1fe4);
  CHncStringW::Empty((CHncStringW *)&local_1fe4);
  wcsncpy_s(&local_1f50,4000,param_2,3999);
  pwVar2 = &local_1f50;
  uStack_14 = (uint)(ushort)uStack_14;
  do {
    wVar1 = *pwVar2;
    pwVar2 = pwVar2 + 1;
  } while (wVar1 != L'\0');
  iVar4 = 0;
  uVar3 = (int)pwVar2 - (int)local_1f4e >> 1;
  if (0 < (int)uVar3) {
    do {
      uVar6 = *(ushort *)(local_1f4e + iVar4 * 2 + -2);
      if (uVar6 == 0x2026) {
        uVar6 = 0x22ef;
      }
      else if ((uVar6 < 0x20) && (uVar6 != 0x15)) {
        uVar6 = 0x20;
      }
      CHncStringW::Concat((CHncStringW *)&local_1fe4,uVar6);
      iVar4 = iVar4 + 1;
    } while (iVar4 < (int)uVar3);
  }
  FUN_10087560(local_1fd0,local_1fe4,uVar3);
  CHncStringW::~CHncStringW((CHncStringW *)&local_1fe4);
  hdcSrc = local_1fec;
  FUN_10085510(local_1fd0,local_1fec);
  if (local_1fc0 != (void *)0x0) {
    *(undefined4 *)((int)local_1fc0 + 0x880) = 1;
  }
  pwVar2 = (wchar_t *)((int)local_1fc0 + 0x858);
  if (7 < *(uint *)((int)local_1fc0 + 0x86c)) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10084560(local_1fc0,0x11,pwVar2);
  bVar5 = iStack_1f78 == 0x11;
  if (!bVar5) {
    iStack_1f78 = 0x11;
    piStack_1fa0[2] = 0x11;
  }
  (**(code **)(*piStack_1fa0 + 8))(&local_1fe4,bVar5);
  FUN_10086cb0(&local_1fd8,2,2);
  h = CreateCompatibleBitmap(local_1ff0,(int)local_1fe4,unaff_EBX);
  SelectObject(pHStack_1fe0,h);
  CHncDrawContext::HFillSolidRect(pHStack_1fe0,0,0,(int)local_1fe4,unaff_EBX,0xffffff);
  BitBlt(pHStack_1fe0,0,0,(int)local_1fe4,unaff_EBX,hdcSrc,0,0,0xcc0020);
  DeleteObject(local_1fdc);
  DeleteDC(pHStack_1fe0);
  DeleteDC(pHStack_1ff4);
  ReleaseDC((HWND)0x0,local_1ff0);
  FUN_10085460((int)&local_1fd8);
  __security_check_cookie(uStack_14 ^ (uint)&stack0xffffe004);
  return;
}


