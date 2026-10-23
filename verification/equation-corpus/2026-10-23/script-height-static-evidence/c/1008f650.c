// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 121597-121671
//==== 1008f650 FUN_1008f650

void __thiscall FUN_1008f650(void *this,undefined4 param_1)

{
  void *this_00;
  int iVar1;
  wchar_t *pwVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  wchar_t *pwVar9;
  undefined4 uVar10;
  
  this_00 = *(void **)((int)this + 0x74);
  pwVar9 = (wchar_t *)((int)this_00 + 0x858);
  pwVar2 = pwVar9;
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar2 = *(wchar_t **)pwVar9;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar2);
  uVar10 = *(undefined4 *)((int)this_00 + 0x84c);
  iVar3 = MulDiv(*(int *)((int)this_00 + 0x848),*(int *)((int)this + 0x80),100);
  FUN_100844d0(this_00,iVar3,uVar10);
  iVar4 = *(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50);
  iVar3 = *(int *)((int)this + 0x90);
  iVar5 = MulDiv(*(int *)((int)this + 8),5,100);
  if (iVar3 <= iVar5) {
    iVar3 = MulDiv(*(int *)((int)this + 8),5,100);
  }
  iVar3 = *(int *)(*(int *)((int)this + 0x68) + 0x7c) + *(int *)((int)this + 0x54) + iVar3;
  iVar5 = -*(int *)((int)this + 0x8c);
  if (iVar5 < 1) {
    iVar5 = 0;
  }
  FUN_10084930(this_00,iVar5 + iVar4,iVar3,0xe05c);
  iVar5 = *(int *)((int)this + 0x90);
  iVar1 = *(int *)((int)this + 0x78);
  if (-1 < iVar5) {
    iVar5 = 0;
  }
  iVar7 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  iVar6 = *(int *)((int)this + 0x8c);
  iVar8 = *(int *)((int)this + 0x54);
  if (iVar6 < 1) {
    iVar6 = 0;
  }
  *(int *)(iVar1 + 0x80) = iVar6 + iVar4;
  *(int *)(*(int *)((int)this + 0x78) + 0x7c) = ((iVar7 - iVar5) - *(int *)(iVar1 + 0x54)) + iVar8;
  (**(code **)(**(int **)((int)this + 0x78) + 4))(param_1);
  iVar5 = *(int *)((int)this + 0x84);
  iVar1 = *(int *)(*(int *)((int)this + 0x7c) + 0x58);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar9 = *(wchar_t **)pwVar9;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar9);
  iVar7 = MulDiv(*(int *)((int)this + 8),2,100);
  iVar6 = MulDiv(*(int *)((int)this_00 + 0x848),0x12,100);
  uVar10 = *(undefined4 *)((int)this_00 + 0x848);
  iVar8 = MulDiv(*(int *)((int)this + 8),0x11,100);
  FUN_100844d0(this_00,uVar10,iVar8 + iVar1);
  FUN_10084930(this_00,(iVar4 + iVar5) - iVar7,iVar3 - iVar6,0xe06d);
  pwVar9 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar9 = *(wchar_t **)pwVar9;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar9);
  return;
}


