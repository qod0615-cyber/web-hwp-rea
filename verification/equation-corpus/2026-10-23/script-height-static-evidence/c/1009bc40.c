// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 131318-131388
//==== 1009bc40 FUN_1009bc40

void __fastcall FUN_1009bc40(int param_1)

{
  ushort *puVar1;
  void *this;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined4 uVar7;
  wchar_t *pwVar8;
  int iVar9;
  int iVar10;
  
  iVar10 = *(int *)(*(int *)(*(int *)(param_1 + 0x78) + 0x8c) + 100);
  if ((*(int *)(iVar10 + 4) == 0x6f) && ((ushort)(*(short *)(iVar10 + 0x9c) + 0x2000U) < 0x1a)) {
    puVar1 = (ushort *)(*(int *)(iVar10 + 0x74) + 0xe);
    *puVar1 = *puVar1 & 1;
    if (*puVar1 != 0) {
      iVar10 = 0;
      goto LAB_1009bc82;
    }
  }
  iVar10 = 1;
LAB_1009bc82:
  this = *(void **)(param_1 + 0x74);
  iVar4 = *(int *)(*(int *)(param_1 + 0x68) + 0x80) + *(int *)(param_1 + 0x50);
  iVar5 = MulDiv(*(int *)(param_1 + 0x80),0x3c,100);
  iVar6 = FUN_1009b0e0(*(int *)(param_1 + 0x78));
  if (iVar6 == 0) {
    iVar6 = *(int *)(param_1 + 0x84) / 2;
  }
  else {
    iVar6 = 0;
  }
  iVar6 = (*(int *)(*(int *)(param_1 + 0x68) + 0x7c) + *(int *)(param_1 + 0x54)) - iVar6;
  iVar2 = *(int *)(*(int *)(param_1 + 0x78) + 0x58);
  iVar9 = iVar2 - iVar5;
  iVar3 = *(int *)(param_1 + 0x80);
  iVar10 = *(int *)(param_1 + 8) / (iVar10 * 0x10 + 4);
  if (iVar9 < 0) {
    FUN_10084930(this,iVar4 + iVar10,iVar6,0xe06e);
    uVar7 = 0xe06c;
    iVar5 = (iVar10 - *(int *)(param_1 + 0x80)) + iVar5;
  }
  else {
    pwVar8 = (wchar_t *)((int)this + 0x858);
    if (7 < *(uint *)((int)this + 0x86c)) {
      pwVar8 = *(wchar_t **)((int)this + 0x858);
    }
    FUN_10084560(this,*(int *)(param_1 + 8),pwVar8);
    FUN_100844d0(this,*(undefined4 *)((int)this + 0x848),iVar2);
    FUN_10084930(this,iVar4 + iVar10,iVar6,0xe06d);
    pwVar8 = (wchar_t *)((int)this + 0x858);
    if (7 < *(uint *)((int)this + 0x86c)) {
      pwVar8 = *(wchar_t **)pwVar8;
    }
    FUN_10084560(this,*(int *)(param_1 + 8),pwVar8);
    FUN_10084930(this,(iVar5 - iVar3) + iVar10 + iVar4,iVar6,0xe06c);
    iVar5 = iVar10 + iVar9;
    uVar7 = 0xe06e;
  }
  FUN_10084930(this,iVar4 + iVar5,iVar6,uVar7);
  return;
}


