// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 120124-120180
//==== 1008d980 FUN_1008d980

void __thiscall FUN_1008d980(void *this,int *param_1,int param_2)

{
  int iVar1;
  void *this_00;
  wchar_t *pwVar2;
  int iVar3;
  int iVar4;
  int unaff_EBX;
  int iStack_20;
  int iStack_1c;
  undefined1 auStack_10 [12];
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar1 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar1;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  this_00 = *(void **)((int)this + 0x74);
  pwVar2 = (wchar_t *)((int)this_00 + 0x858);
  iVar1 = *(int *)((int)this + 8);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10084560(this_00,iVar1,pwVar2);
  FUN_100851d0(this_00,(tagSIZE *)&iStack_20,0xe05b);
  *(int *)((int)this + 0x84) = iStack_20;
  *(int *)((int)this + 0x88) = iStack_1c / 10;
  *(int *)(*(int *)((int)this + 0x78) + 8) = iVar1;
  (**(code **)(**(int **)((int)this + 0x78) + 8))(auStack_10,param_2);
  *(int *)(*(int *)((int)this + 0x7c) + 8) = iVar1;
  (**(code **)(**(int **)((int)this + 0x7c) + 8))(&iStack_20,param_2);
  iVar4 = *(int *)((int)this + 0x84);
  iVar3 = iStack_20;
  if (iStack_20 < iVar4) {
    iVar3 = iVar4;
  }
  if ((unaff_EBX < iVar3) && (unaff_EBX = iStack_20, iStack_20 < iVar4)) {
    unaff_EBX = iVar4;
  }
  iVar4 = MulDiv(*(int *)((int)this + 0x88),500,100);
  *(int *)((int)this + 0x58) = unaff_EBX + iVar4;
  iStack_1c = *(int *)((int)this + 0x88) + iVar1 + iStack_1c;
  *(int *)((int)this + 0x5c) = iStack_1c;
  *(int *)((int)this + 0x54) = -(*(int *)((int)this + 0x88) / 2) - iVar1;
  *param_1 = unaff_EBX + iVar4;
  param_1[1] = iStack_1c;
  return;
}


