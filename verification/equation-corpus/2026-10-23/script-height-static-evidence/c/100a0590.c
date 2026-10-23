// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 135060-135159
//==== 100a0590 FUN_100a0590

void __thiscall FUN_100a0590(void *this,int *param_1,int param_2)

{
  void *this_00;
  wchar_t *pwVar1;
  tagSIZE *ptVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int unaff_EBX;
  int unaff_ESI;
  int unaff_EDI;
  int iStack_3c;
  undefined1 auStack_38 [16];
  tagSIZE atStack_28 [8];
  tagSIZE atStack_20 [8];
  tagSIZE atStack_18 [8];
  tagSIZE atStack_10 [12];
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar4 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar4;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  this_00 = *(void **)((int)this + 0x74);
  pwVar1 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar1 = *(wchar_t **)pwVar1;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar1);
  ptVar2 = FUN_100851d0(this_00,atStack_28,*(ushort *)((int)this + 0xac));
  *(undefined4 *)((int)this + 0x8c) = *(undefined4 *)ptVar2;
  *(undefined4 *)((int)this + 0x90) = *(undefined4 *)(ptVar2 + 4);
  ptVar2 = FUN_100851d0(this_00,atStack_20,*(ushort *)((int)this + 0xae));
  *(undefined4 *)((int)this + 0x94) = *(undefined4 *)ptVar2;
  *(undefined4 *)((int)this + 0x98) = *(undefined4 *)(ptVar2 + 4);
  ptVar2 = FUN_100851d0(this_00,atStack_18,*(ushort *)((int)this + 0xb2));
  *(undefined4 *)((int)this + 0x9c) = *(undefined4 *)ptVar2;
  *(undefined4 *)((int)this + 0xa0) = *(undefined4 *)(ptVar2 + 4);
  ptVar2 = FUN_100851d0(this_00,atStack_10,*(ushort *)((int)this + 0xb0));
  iVar4 = *(int *)((int)this + 0x94);
  *(undefined4 *)((int)this + 0xa4) = *(undefined4 *)ptVar2;
  *(undefined4 *)((int)this + 0xa8) = *(undefined4 *)(ptVar2 + 4);
  iVar3 = MulDiv(*(int *)((int)this + 0x98),0x23,100);
  *(int *)((int)this + 0x88) = iVar3;
  *(int *)((int)this + 0x84) = iVar4 + *(int *)((int)this + 0x8c) + *(int *)((int)this + 0x9c);
  if (*(int *)((int)this + 4) == 0x6c) {
    *(int *)(*(int *)((int)this + 0x78) + 8) = *(int *)((int)this + 8);
    iVar4 = MulDiv(*(int *)((int)this + 8),0x44,100);
  }
  else {
    iVar4 = MulDiv(*(int *)((int)this + 8),0x44,100);
    *(int *)(*(int *)((int)this + 0x78) + 8) = iVar4;
    iVar4 = *(int *)((int)this + 8);
  }
  *(int *)(*(int *)((int)this + 0x7c) + 8) = iVar4;
  (**(code **)(**(int **)((int)this + 0x78) + 8))(auStack_38,param_2);
  (**(code **)(**(int **)((int)this + 0x7c) + 8))(auStack_38,param_2);
  iVar4 = *(int *)((int)this + 4);
  iVar3 = FUN_1009b0e0(*(int *)((int)this + 0x7c));
  if (iVar3 == 0) {
    iVar3 = 0;
  }
  else {
    iVar3 = 0xf;
    if (iVar4 == 0x6c) {
      iVar3 = 5;
    }
    iVar3 = MulDiv(*(int *)((int)this + 8),iVar3,100);
    iVar4 = *(int *)((int)this + 4);
  }
  if (unaff_EBX < unaff_EDI) {
    unaff_EBX = unaff_EDI;
  }
  if (unaff_EBX < *(int *)((int)this + 0x84)) {
    unaff_EBX = *(int *)((int)this + 0x84);
  }
  iVar5 = (*(int *)((int)this + 0x88) - iVar3) + unaff_ESI + iStack_3c;
  if (iVar4 == 0x6c) {
    iVar3 = *(int *)(*(int *)((int)this + 0x78) + 0x54);
  }
  else {
    iVar3 = ((*(int *)(*(int *)((int)this + 0x7c) + 0x54) - *(int *)((int)this + 0x88)) - unaff_ESI)
            + iVar3;
  }
  *(int *)((int)this + 0x54) = iVar3;
  *(int *)((int)this + 0x58) = unaff_EBX;
  *(int *)((int)this + 0x5c) = iVar5;
  *param_1 = unaff_EBX;
  param_1[1] = iVar5;
  return;
}


