// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 135605-135717
//==== 100a1100 FUN_100a1100

void __fastcall FUN_100a1100(undefined4 *param_1)

{
  void *pvVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  wchar_t *pwVar9;
  int iVar10;
  int local_14;
  
  iVar3 = MulDiv(param_1[10],3,100);
  param_1[3] = param_1[3] + iVar3;
  iVar4 = MulDiv(param_1[10],5,100);
  iVar7 = param_1[9];
  iVar4 = (param_1[2] - (int)param_1[0xc] / 2) - iVar4;
  iVar8 = param_1[0xb];
  iVar3 = iVar8 / 2;
  local_14 = (param_1[3] - iVar8) + param_1[4];
  iVar5 = (iVar8 - iVar3) + param_1[3];
  iVar6 = MulDiv(param_1[10],0x1e,100);
  pvVar1 = (void *)*param_1;
  pwVar9 = (wchar_t *)((int)pvVar1 + 0x858);
  iVar7 = param_1[3] - (iVar7 - iVar8);
  if (7 < *(uint *)((int)pvVar1 + 0x86c)) {
    pwVar9 = *(wchar_t **)pwVar9;
  }
  FUN_10084560(pvVar1,param_1[6],pwVar9);
  pvVar1 = (void *)*param_1;
  iVar8 = param_1[1];
  uVar2 = *(undefined4 *)((int)pvVar1 + 0x848);
  if ((iVar8 == 2) || (iVar8 == 5)) {
    iVar10 = param_1[4];
    iVar3 = iVar10 + (iVar3 - param_1[0xb]) * 2;
  }
  else {
    iVar10 = param_1[4];
    iVar3 = (iVar10 - param_1[0xb]) + iVar3;
  }
  if ((iVar8 == 0) || (iVar8 == 3)) {
    if (iVar10 < (int)param_1[5]) {
      FUN_10084930(pvVar1,param_1[3],iVar4,(uint)*(ushort *)((int)param_1 + 0x1e));
      return;
    }
    FUN_100844d0(pvVar1,uVar2,iVar3);
    FUN_10084930((void *)*param_1,param_1[3],iVar4,(uint)*(ushort *)(param_1 + 8));
    pvVar1 = (void *)*param_1;
    pwVar9 = (wchar_t *)((int)pvVar1 + 0x858);
    if (7 < *(uint *)((int)pvVar1 + 0x86c)) {
      pwVar9 = *(wchar_t **)pwVar9;
    }
    FUN_10084560(pvVar1,param_1[6],pwVar9);
  }
  else {
    if ((iVar8 == 1) || (iVar8 == 4)) {
      if ((int)param_1[5] <= iVar10) {
        FUN_100844d0(pvVar1,uVar2,iVar3);
        FUN_10084930((void *)*param_1,iVar5,iVar4,(uint)*(ushort *)(param_1 + 8));
        pvVar1 = (void *)*param_1;
        pwVar9 = (wchar_t *)((int)pvVar1 + 0x858);
        if (7 < *(uint *)((int)pvVar1 + 0x86c)) {
          pwVar9 = *(wchar_t **)pwVar9;
        }
        FUN_10084560(pvVar1,param_1[6],pwVar9);
        FUN_10084930((void *)*param_1,iVar7,iVar4,(uint)*(ushort *)(param_1 + 7));
        return;
      }
      FUN_10084930(pvVar1,iVar7,iVar4,(uint)*(ushort *)(param_1 + 7));
      return;
    }
    if ((iVar8 == 2) || (iVar8 == 5)) {
      if (iVar10 < (int)param_1[5]) {
        FUN_10084930(pvVar1,iVar7,iVar4,(uint)*(ushort *)(param_1 + 7));
        local_14 = (int)param_1[0xb] / 2 + param_1[3];
      }
      else {
        FUN_100844d0(pvVar1,uVar2,iVar3);
        FUN_10084930((void *)*param_1,iVar5,iVar4,(uint)*(ushort *)(param_1 + 8));
        FUN_100845e0((void *)*param_1,param_1[6]);
        FUN_10084930((void *)*param_1,iVar7,iVar4,(uint)*(ushort *)(param_1 + 7));
      }
    }
    else {
      if (iVar8 != 6) {
        return;
      }
      iVar8 = iVar4 - iVar6 / 2;
      iVar4 = iVar4 + iVar6 / 2;
      if (iVar10 < (int)param_1[5]) {
        FUN_10084930(pvVar1,iVar7,iVar4,(uint)*(ushort *)(param_1 + 7));
        FUN_10084930((void *)*param_1,param_1[3],iVar8,(uint)*(ushort *)((int)param_1 + 0x1e));
        return;
      }
      FUN_100844d0(pvVar1,*(undefined4 *)((int)pvVar1 + 0x848),iVar3);
      FUN_10084930((void *)*param_1,iVar5,iVar4,(uint)*(ushort *)(param_1 + 8));
      FUN_10084930((void *)*param_1,param_1[3],iVar8,(uint)*(ushort *)(param_1 + 8));
      FUN_100845e0((void *)*param_1,param_1[6]);
      FUN_10084930((void *)*param_1,iVar7,iVar4,(uint)*(ushort *)(param_1 + 7));
      iVar4 = iVar8;
    }
  }
  FUN_10084930((void *)*param_1,local_14,iVar4,(uint)*(ushort *)((int)param_1 + 0x1e));
  return;
}


