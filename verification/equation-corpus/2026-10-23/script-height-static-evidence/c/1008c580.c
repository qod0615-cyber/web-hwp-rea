// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 119204-119303
//==== 1008c580 FUN_1008c580

void __thiscall FUN_1008c580(void *this,int *param_1,int param_2)

{
  void *this_00;
  void *this_01;
  int iVar1;
  int iVar2;
  wchar_t *pwVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int unaff_EBX;
  int iVar7;
  int iStack_34;
  int iStack_28;
  undefined4 uStack_24;
  undefined1 auStack_20 [8];
  undefined1 auStack_18 [20];
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar1 = *(int *)((int)this + 0x58);
    param_1[1] = *(int *)((int)this + 0x5c);
    *param_1 = iVar1;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  iVar1 = MulDiv(*(int *)((int)this + 8),0x44,100);
  this_00 = *(void **)((int)this + 0x74);
  iVar2 = MulDiv(*(int *)((int)this + 8),*(int *)((int)this + 0xa0),100);
  pwVar3 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar3 = *(wchar_t **)pwVar3;
  }
  FUN_10084560(this_00,iVar2,pwVar3);
  FUN_100851d0(*(void **)((int)this + 0x74),(tagSIZE *)&iStack_28,*(ushort *)((int)this + 0x9c));
  *(int *)((int)this + 0xa4) = iStack_28;
  *(undefined4 *)((int)this + 0xa8) = uStack_24;
  *(int *)(*(int *)((int)this + 0x78) + 8) = iVar1;
  (**(code **)(**(int **)((int)this + 0x78) + 8))(auStack_20,param_2);
  *(int *)(*(int *)((int)this + 0x7c) + 8) = unaff_EBX;
  (**(code **)(**(int **)((int)this + 0x7c) + 8))(auStack_18,param_2);
  *(undefined4 *)(*(int *)((int)this + 0x80) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x80) + 8))(&iStack_28,param_2);
  this_01 = *(void **)((int)this + 0x74);
  pwVar3 = (wchar_t *)((int)this_01 + 0x858);
  if (7 < *(uint *)((int)this_01 + 0x86c)) {
    pwVar3 = *(wchar_t **)pwVar3;
  }
  FUN_10084560(this_01,*(int *)((int)this + 8),pwVar3);
  iVar2 = *(int *)(*(int *)((int)this + 0x74) + 0x848);
  iVar4 = MulDiv(iVar2,5,100);
  *(int *)((int)this + 0xb0) = iVar4;
  iVar4 = MulDiv(iVar2,1,100);
  *(int *)((int)this + 0xb4) = iVar4;
  iVar4 = MulDiv(iVar2,-0x32,100);
  *(int *)((int)this + 0xac) = iVar4;
  *(int *)((int)this + 0xb8) = *(int *)((int)this + 0xa8) / 2;
  iVar5 = MulDiv(iVar2,0x44,100);
  iVar2 = *(int *)((int)this + 0x7c);
  iVar4 = *(int *)((int)this + 0xb8);
  iVar5 = iVar5 / 6 - *(int *)((int)this + 0xa8) / 2;
  *(int *)((int)this + 0xbc) = iVar5;
  iVar6 = *(int *)(iVar2 + 0x5c) + iVar5 + *(int *)(iVar2 + 0x54);
  iVar7 = *(int *)(*(int *)((int)this + 0x78) + 0x54) + iVar4;
  if (iVar7 < 0) {
    iVar4 = iVar4 - iVar7;
    *(int *)((int)this + 0xb8) = iVar4;
  }
  if (0 < iVar6) {
    iVar5 = iVar5 - iVar6;
    *(int *)((int)this + 0xbc) = iVar5;
  }
  iVar5 = *(int *)(iVar2 + 0x54) + iVar5;
  iVar2 = *(int *)(*(int *)((int)this + 0x80) + 0x54);
  if (iVar2 <= iVar5) {
    iVar5 = iVar2;
  }
  iStack_28 = *(int *)((int)this + 0xb0) + iStack_28;
  iVar6 = *(int *)(*(int *)((int)this + 0x78) + 0x54) + iVar4 + iStack_34;
  iVar4 = *(int *)((int)this + 0xac) + unaff_EBX;
  *(int *)((int)this + 0x54) = iVar5;
  if (iVar4 <= iStack_28) {
    iVar4 = iStack_28;
  }
  iVar1 = iVar4 + iVar1 + *(int *)((int)this + 0xb4) + *(int *)((int)this + 0xa4);
  *(int *)((int)this + 0x58) = iVar1;
  if (iVar6 <= iVar2 + (int)this_00) {
    iVar6 = iVar2 + (int)this_00;
  }
  *param_1 = iVar1;
  *(int *)((int)this + 0x5c) = iVar6 - iVar5;
  param_1[1] = iVar6 - iVar5;
  return;
}


