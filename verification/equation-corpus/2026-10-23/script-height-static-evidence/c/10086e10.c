// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 114941-114972
//==== 10086e10 FUN_10086e10

undefined4 * __thiscall FUN_10086e10(void *this,undefined4 *param_1,int param_2)

{
  void *this_00;
  undefined4 uVar1;
  wchar_t *pwVar2;
  undefined4 *puVar3;
  bool bVar4;
  undefined1 local_c [8];
  
  this_00 = *(void **)((int)this + 0x10);
  pwVar2 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10084560(this_00,param_2,pwVar2);
  bVar4 = *(int *)((int)this + 0x58) != param_2;
  if (bVar4) {
    *(int *)((int)this + 0x58) = param_2;
    *(int *)(*(int *)((int)this + 0x30) + 8) = param_2;
  }
  puVar3 = (undefined4 *)(**(code **)(**(int **)((int)this + 0x30) + 8))(local_c,!bVar4);
  uVar1 = puVar3[1];
  *param_1 = *puVar3;
  param_1[1] = uVar1;
  return param_1;
}


