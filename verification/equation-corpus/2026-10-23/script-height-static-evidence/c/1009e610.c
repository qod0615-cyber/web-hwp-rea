// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 133470-133541
//==== 1009e610 FUN_1009e610

void __fastcall FUN_1009e610(int param_1)

{
  ushort *puVar1;
  void *this;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  wchar_t *pwVar9;
  int nNumber;
  int iVar10;
  int local_c;
  
  iVar10 = *(int *)(*(int *)(*(int *)(param_1 + 0x78) + 0x8c) + 100);
  if ((*(int *)(iVar10 + 4) == 0x6f) && ((ushort)(*(short *)(iVar10 + 0x9c) + 0x2000U) < 0x1a)) {
    puVar1 = (ushort *)(*(int *)(iVar10 + 0x74) + 0xe);
    *puVar1 = *puVar1 & 1;
    if (*puVar1 != 0) {
      iVar10 = 0;
      goto LAB_1009e652;
    }
  }
  iVar10 = 1;
LAB_1009e652:
  this = *(void **)(param_1 + 0x74);
  pwVar9 = (wchar_t *)((int)this + 0x858);
  if (7 < *(uint *)((int)this + 0x86c)) {
    pwVar9 = *(wchar_t **)((int)this + 0x858);
  }
  FUN_10084560(this,*(int *)(param_1 + 8),pwVar9);
  iVar2 = *(int *)(param_1 + 0x58);
  iVar3 = *(int *)(*(int *)(param_1 + 0x68) + 0x80);
  iVar4 = *(int *)(param_1 + 8);
  iVar5 = *(int *)(param_1 + 0x50);
  if (*(int *)((int)this + 0x84c) < *(int *)(param_1 + 0x58)) {
    nNumber = *(int *)((int)this + 0x84c) * 8;
    if (*(int *)(param_1 + 0x58) <= nNumber) {
      nNumber = *(int *)(param_1 + 0x58);
    }
  }
  else {
    nNumber = *(int *)(param_1 + 0x80);
  }
  iVar7 = MulDiv(nNumber,10,100);
  iVar8 = FUN_1009b0e0(*(int *)(param_1 + 0x78));
  if (iVar8 == 0) {
    local_c = *(int *)(param_1 + 0x84) / 2;
  }
  else {
    local_c = 0;
  }
  iVar8 = *(int *)(param_1 + 0x54);
  iVar6 = *(int *)(*(int *)(param_1 + 0x68) + 0x7c);
  FUN_100844d0(this,*(undefined4 *)((int)this + 0x848),nNumber);
  FUN_10084930(this,((iVar4 / (iVar10 * 0x10 + 4) - nNumber / 2) + iVar3 + iVar2 / 2 + iVar5) -
                    iVar7,(iVar8 - local_c) + iVar6,0xe064);
  pwVar9 = (wchar_t *)((int)this + 0x858);
  if (7 < *(uint *)((int)this + 0x86c)) {
    pwVar9 = *(wchar_t **)pwVar9;
  }
  FUN_10084560(this,*(int *)(param_1 + 8),pwVar9);
  return;
}


