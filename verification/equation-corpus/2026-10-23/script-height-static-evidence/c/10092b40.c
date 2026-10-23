// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 124081-124145
//==== 10092b40 FUN_10092b40

void __thiscall FUN_10092b40(void *this,undefined4 *param_1,int param_2)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  int iVar5;
  undefined4 *extraout_EDX;
  int unaff_ESI;
  int local_10 [3];
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    uVar1 = *(undefined4 *)((int)this + 0x5c);
    *param_1 = *(undefined4 *)((int)this + 0x58);
    param_1[1] = uVar1;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  iVar4 = *(int *)(*(int *)((int)this + 0x74) + 0x848);
  iVar5 = *(int *)((int)this + 0x60);
  while (iVar2 = iVar5, iVar2 != 0) {
    iVar5 = *(int *)(iVar2 + 0x60);
    if (((iVar5 == 0) || (*(int *)(iVar5 + 4) != *(int *)((int)this + 4))) &&
       (local_10[0] = *(int *)(iVar2 + 0x58), iVar4 <= *(int *)(iVar2 + 0x5c))) {
      iVar4 = *(int *)(iVar2 + 0x5c);
    }
  }
  iVar4 = *(int *)((int)this + 0x7c);
  iVar5 = *(int *)(*(int *)(iVar4 + 0x8c) + 100);
  if (*(int *)(iVar5 + 4) == 0x6f) {
    iVar5 = *(int *)(iVar5 + 100);
  }
  iVar2 = *(int *)(iVar5 + 4);
  while (iVar2 != 0x7a) {
    iVar4 = *(int *)((int)this + 0x7c);
    local_10[0] = *(int *)(iVar5 + 0x60);
    if (((*(int *)(iVar4 + 0x8c) != 0) && (iVar5 != *(int *)(iVar4 + 0x8c))) &&
       (iVar5 != *(int *)(iVar4 + 0x90))) {
      *(undefined4 *)(local_10[0] + 100) = *(undefined4 *)(iVar5 + 100);
      *(undefined4 *)(*(int *)(iVar5 + 100) + 0x60) = *(undefined4 *)(iVar5 + 0x60);
      FUN_10088500(*(int *)(iVar5 + 100));
      FUN_10088500(iVar4);
      (**(code **)*extraout_EDX)(1);
      iVar4 = *(int *)((int)this + 0x7c);
    }
    iVar5 = *(int *)(local_10[0] + 100);
    iVar2 = *(int *)(iVar5 + 4);
  }
  *(undefined4 *)(iVar4 + 8) = *(undefined4 *)((int)this + 8);
  puVar3 = (undefined4 *)(**(code **)(**(int **)((int)this + 0x7c) + 8))(local_10,param_2);
  uVar1 = *puVar3;
  *(int *)((int)this + 0x5c) = unaff_ESI;
  *(undefined4 *)((int)this + 0x58) = uVar1;
  *(int *)((int)this + 0x54) = -(unaff_ESI / 2);
  param_1[1] = unaff_ESI;
  *param_1 = uVar1;
  return;
}


