// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 112893-112918
//==== 10084770 FUN_10084770

void __thiscall FUN_10084770(void *this,int param_1,wchar_t *param_2)

{
  wchar_t wVar1;
  wchar_t *pwVar2;
  
  wcsncpy_s((wchar_t *)(param_1 + 0x24),0x40,param_2,0xffffffff);
  wcsncpy_s((wchar_t *)(param_1 + 0xb8),0x40,param_2,0xffffffff);
  wcsncpy_s((wchar_t *)(param_1 + 0x14c),0x40,param_2,0xffffffff);
  wcsncpy_s((wchar_t *)(param_1 + 0x1e0),0x40,param_2,0xffffffff);
  wcsncpy_s((wchar_t *)(param_1 + 0x274),0x40,param_2,0xffffffff);
  wcsncpy_s((wchar_t *)(param_1 + 0x308),0x40,param_2,0xffffffff);
  wcsncpy_s((wchar_t *)(param_1 + 0x39c),0x40,param_2,0xffffffff);
  pwVar2 = param_2;
  do {
    wVar1 = *pwVar2;
    pwVar2 = pwVar2 + 1;
  } while (wVar1 != L'\0');
  FUN_10005ad0((void *)((int)this + 0x858),param_2,(int)pwVar2 - (int)(param_2 + 1) >> 1);
  return;
}


