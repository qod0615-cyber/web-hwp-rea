// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 121972-122161
//==== 1008fee0 FUN_1008fee0

void __thiscall FUN_1008fee0(void *this,int *param_1,int param_2)

{
  void *this_00;
  undefined2 uVar1;
  int *piVar2;
  int iVar3;
  tagSIZE *ptVar4;
  undefined4 *puVar5;
  wchar_t *pwVar6;
  int iVar7;
  int iVar8;
  short sVar9;
  int unaff_EBX;
  int iVar10;
  undefined4 uVar11;
  void *local_28 [2];
  int iStack_20;
  tagSIZE local_18 [20];
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = *(int *)((int)this + 0x5c);
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  iVar10 = 0;
  local_28[0] = (void *)0x0;
  if (*(int *)((int)this + 0x90) == 0) {
    *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
    piVar2 = (int *)(**(code **)(**(int **)((int)this + 0x78) + 8))(local_18,param_2);
    iVar10 = *piVar2;
    local_28[0] = (void *)piVar2[1];
  }
  *(undefined4 *)(*(int *)((int)this + 0x7c) + 8) = *(undefined4 *)((int)this + 8);
  piVar2 = (int *)(**(code **)(**(int **)((int)this + 0x7c) + 8))(local_18,param_2);
  this_00 = *(void **)((int)this + 0x74);
  iVar8 = *piVar2;
  iStack_20 = piVar2[1];
  pwVar6 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar6 = *(wchar_t **)pwVar6;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar6);
  iVar3 = MulDiv(*(int *)(*(int *)((int)this + 0x74) + 0x848),0x32,100);
  *(undefined4 *)((int)this + 0x84) = 0;
  *(undefined4 *)((int)this + 0x88) = 0;
  if (iVar8 < iVar10) {
    iVar8 = iVar10;
  }
  iVar3 = iVar3 + iVar8;
  sVar9 = *(short *)((int)this + 0x8c);
  if (sVar9 == 0) {
    *(undefined2 *)((int)this + 0x8c) = 0x21d4;
    sVar9 = 0x21d4;
  }
  if ((((sVar9 != 0x2190) && (sVar9 != 0x2192)) && (sVar9 != 0x21d0)) &&
     (((sVar9 != 0x21d2 && (sVar9 != 0x2194)) && ((sVar9 != 0x21d4 && (sVar9 != 0x21c4)))))) {
    FUN_100845e0(*(void **)((int)this + 0x74),*(int *)((int)this + 8));
    ptVar4 = FUN_100851d0(*(void **)((int)this + 0x74),(tagSIZE *)local_28,
                          *(ushort *)((int)this + 0x8c));
    *(undefined4 *)((int)this + 0x84) = *(undefined4 *)ptVar4;
    *(undefined4 *)((int)this + 0x88) = *(undefined4 *)(ptVar4 + 4);
    goto LAB_10090248;
  }
  uVar11 = 0xffffffff;
  if (*(void **)((int)this + 0x94) != (void *)0x0) {
    FUN_100a2b94(*(void **)((int)this + 0x94));
    *(undefined4 *)((int)this + 0x94) = 0;
  }
  puVar5 = (undefined4 *)FUN_100a2ee8(0x34);
  puVar5[7] = 0;
  *(undefined2 *)(puVar5 + 8) = 0;
  *puVar5 = 0;
  puVar5[1] = 0;
  puVar5[2] = 0;
  puVar5[3] = 0;
  puVar5[4] = 0;
  puVar5[5] = 0;
  puVar5[6] = 0;
  puVar5[9] = 0;
  puVar5[10] = 0;
  puVar5[0xb] = 0;
  puVar5[0xc] = 0;
  *(undefined4 **)((int)this + 0x94) = puVar5;
  switch(*(undefined2 *)((int)this + 0x8c)) {
  case 0x2190:
    uVar11 = 1;
    break;
  case 0x2192:
    uVar11 = 0;
    break;
  case 0x2194:
    uVar11 = 2;
    break;
  case 0x21c4:
    uVar11 = 6;
    break;
  case 0x21d0:
    uVar11 = 4;
    break;
  case 0x21d2:
    uVar11 = 3;
    break;
  case 0x21d4:
    uVar11 = 5;
  }
  local_28[0] = *(void **)((int)this + 0x74);
  iVar10 = *(int *)((int)this + 8);
  if (local_28[0] != (void *)0x0) {
    puVar5[4] = iVar3;
    pwVar6 = (wchar_t *)((int)local_28[0] + 0x858);
    *puVar5 = local_28[0];
    puVar5[1] = uVar11;
    puVar5[3] = 0;
    puVar5[2] = 0;
    puVar5[6] = iVar10;
    if (7 < *(uint *)((int)local_28[0] + 0x86c)) {
      pwVar6 = *(wchar_t **)pwVar6;
    }
    FUN_10084560(local_28[0],iVar10,pwVar6);
    switch(puVar5[1]) {
    case 0:
    case 1:
    case 2:
    case 6:
      puVar5[7] = 0xe05ae058;
      uVar1 = 0xe059;
      break;
    case 3:
    case 4:
    case 5:
      puVar5[7] = 0xe071e06f;
      uVar1 = 0xe070;
      break;
    default:
      goto switchD_10090167_default;
    }
    *(undefined2 *)(puVar5 + 8) = uVar1;
switchD_10090167_default:
    ptVar4 = FUN_100851d0(local_28[0],local_18,*(ushort *)(puVar5 + 8));
    puVar5[9] = *(undefined4 *)ptVar4;
    puVar5[10] = *(undefined4 *)(ptVar4 + 4);
    ptVar4 = FUN_100851d0(local_28[0],local_18,*(ushort *)((int)puVar5 + 0x1e));
    iVar10 = *(int *)ptVar4;
    puVar5[0xb] = iVar10;
    puVar5[0xc] = *(undefined4 *)(ptVar4 + 4);
    iVar10 = MulDiv(iVar10,0x50,100);
    puVar5[0xb] = iVar10;
    switch(puVar5[1]) {
    case 2:
    case 5:
      iVar10 = MulDiv(iVar10,0x96,100);
    case 0:
    case 1:
    case 3:
    case 4:
    case 6:
      puVar5[5] = iVar10;
    }
  }
  iVar10 = *(int *)((int)this + 0x94);
  iVar7 = MulDiv(*(int *)(iVar10 + 0x28),5,100);
  iVar8 = *(int *)(iVar10 + 0x10);
  if (*(int *)(iVar10 + 0x10) <= *(int *)(iVar10 + 0x14)) {
    iVar8 = *(int *)(iVar10 + 0x14);
  }
  local_28[0] = (void *)(iVar8 + iVar7);
  iVar8 = MulDiv(*(int *)(iVar10 + 0x28),0x1e,100);
  iVar8 = iVar8 + iVar7;
  if (*(int *)(iVar10 + 4) == 6) {
    iVar8 = iVar8 * 2;
  }
  *(void **)((int)this + 0x84) = local_28[0];
  *(int *)((int)this + 0x88) = iVar8;
LAB_10090248:
  iVar10 = *(int *)((int)this + 0x88) + iStack_20 + unaff_EBX;
  *(int *)((int)this + 0x58) = iVar3;
  *(int *)((int)this + 0x54) = -(*(int *)((int)this + 0x88) / 2) - iStack_20;
  *(int *)((int)this + 0x5c) = iVar10;
  *param_1 = iVar3;
  param_1[1] = iVar10;
  return;
}


