// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 114972-115080
//==== 10086e90 FUN_10086e90

void __thiscall FUN_10086e90(void *this,undefined4 *param_1,int param_2,wchar_t *param_3)

{
  wchar_t wVar1;
  uint uVar2;
  undefined4 *puVar3;
  wchar_t *pwVar4;
  undefined4 ***pppuVar5;
  undefined4 ***this_00;
  int iVar6;
  int iVar7;
  undefined1 local_40 [8];
  undefined1 local_38 [4];
  undefined4 *local_34;
  undefined4 **local_30 [4];
  uint local_20;
  uint local_1c;
  uint local_18;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ab8c8;
  local_10 = ExceptionList;
  uVar2 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  local_34 = param_1;
  local_18 = uVar2;
  if (*(int *)(param_3 + 8) == 0) {
    FUN_10086e10(this,param_1,param_2);
    goto LAB_10086ff9;
  }
  pwVar4 = param_3;
  if (7 < *(uint *)(param_3 + 10)) {
    pwVar4 = *(wchar_t **)param_3;
  }
  FUN_10084560(*(void **)((int)this + 0x10),param_2,pwVar4);
  if (*(int *)((int)this + 0x58) == param_2) {
    puVar3 = (undefined4 *)((int)this + 0x5c);
    pwVar4 = param_3;
    if (7 < *(uint *)(param_3 + 10)) {
      pwVar4 = *(wchar_t **)param_3;
    }
    if (7 < *(uint *)((int)this + 0x70)) {
      puVar3 = (undefined4 *)*puVar3;
    }
    iVar6 = *(int *)((int)this + 0x6c);
    param_1 = local_34;
    if (iVar6 != *(int *)(param_3 + 8)) goto LAB_10086f4d;
    if (iVar6 != 0) {
      iVar7 = (int)puVar3 - (int)pwVar4;
      do {
        if (*(wchar_t *)(iVar7 + (int)pwVar4) != *pwVar4) goto LAB_10086f4d;
        pwVar4 = pwVar4 + 1;
        iVar6 = iVar6 + -1;
      } while (iVar6 != 0);
    }
    puVar3 = (undefined4 *)(**(code **)(**(int **)((int)this + 0x30) + 8))(local_40,1,uVar2);
    param_1 = local_34;
  }
  else {
LAB_10086f4d:
    *(int *)((int)this + 0x58) = param_2;
    if ((wchar_t *)((int)this + 0x5c) != param_3) {
      pwVar4 = param_3;
      if (7 < *(uint *)(param_3 + 10)) {
        pwVar4 = *(wchar_t **)param_3;
      }
      FUN_10005ad0((wchar_t *)((int)this + 0x5c),pwVar4,*(uint *)(param_3 + 8));
    }
    *(int *)(*(int *)((int)this + 0x30) + 8) = param_2;
    if (7 < *(uint *)(param_3 + 10)) {
      param_3 = *(wchar_t **)param_3;
    }
    local_20 = 0;
    local_1c = 7;
    local_30[0] = (undefined4 **)((uint)local_30[0] & 0xffff0000);
    pwVar4 = param_3;
    do {
      wVar1 = *pwVar4;
      pwVar4 = pwVar4 + 1;
    } while (wVar1 != L'\0');
    FUN_10005ad0(local_30,param_3,(int)pwVar4 - (int)(param_3 + 1) >> 1);
    local_8 = 0;
    this_00 = (undefined4 ***)(*(int *)((int)this + 0x30) + 0xc);
    if (this_00 != local_30) {
      pppuVar5 = local_30;
      if (7 < local_1c) {
        pppuVar5 = (undefined4 ***)local_30[0];
      }
      FUN_10005ad0(this_00,pppuVar5,local_20);
    }
    local_8 = 0xffffffff;
    FUN_10005c10((int *)local_30);
    puVar3 = (undefined4 *)(**(code **)(**(int **)((int)this + 0x30) + 8))(local_38,0);
  }
  *param_1 = *puVar3;
  param_1[1] = puVar3[1];
LAB_10086ff9:
  ExceptionList = local_10;
  __security_check_cookie(local_18 ^ (uint)&stack0xfffffffc);
  return;
}


