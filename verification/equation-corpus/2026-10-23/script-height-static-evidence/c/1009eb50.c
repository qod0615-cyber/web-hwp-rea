// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 133740-133808
//==== 1009eb50 FUN_1009eb50

void __fastcall FUN_1009eb50(int param_1)

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
  int iVar9;
  wchar_t *pwVar10;
  int iVar11;
  int nNumber;
  int nDenominator;
  
  iVar11 = *(int *)(*(int *)(*(int *)(param_1 + 0x78) + 0x8c) + 100);
  if ((*(int *)(iVar11 + 4) == 0x6f) && ((ushort)(*(short *)(iVar11 + 0x9c) + 0x2000U) < 0x1a)) {
    puVar1 = (ushort *)(*(int *)(iVar11 + 0x74) + 0xe);
    *puVar1 = *puVar1 & 1;
    if (*puVar1 != 0) {
      iVar11 = 0;
      goto LAB_1009eb95;
    }
  }
  iVar11 = 1;
LAB_1009eb95:
  this = *(void **)(param_1 + 0x74);
  pwVar10 = (wchar_t *)((int)this + 0x858);
  if (7 < *(uint *)((int)this + 0x86c)) {
    pwVar10 = *(wchar_t **)((int)this + 0x858);
  }
  FUN_10084560(this,*(int *)(param_1 + 8),pwVar10);
  iVar2 = *(int *)(param_1 + 0x58);
  iVar3 = *(int *)(*(int *)(param_1 + 0x68) + 0x80);
  iVar4 = *(int *)(param_1 + 8);
  iVar5 = *(int *)(param_1 + 0x50);
  if (*(int *)((int)this + 0x84c) < *(int *)(param_1 + 0x58)) {
    nNumber = *(int *)((int)this + 0x84c) * 6;
    if (*(int *)(param_1 + 0x58) <= nNumber) {
      nNumber = *(int *)(param_1 + 0x58);
    }
  }
  else {
    nNumber = *(int *)(param_1 + 0x80);
  }
  iVar8 = MulDiv(nNumber,10,100);
  iVar6 = *(int *)(param_1 + 0x54);
  iVar7 = *(int *)(*(int *)(param_1 + 0x68) + 0x7c);
  nDenominator = 100;
  iVar9 = FUN_1009b0e0(*(int *)(param_1 + 0x78));
  iVar9 = MulDiv(*(int *)(param_1 + 0x84),(-(uint)(iVar9 != 0) & 0xffffffdd) + 0x2d,nDenominator);
  FUN_100844d0(this,*(undefined4 *)((int)this + 0x848),nNumber);
  FUN_10084930(this,((iVar4 / (iVar11 * 0x10 + 4) - nNumber / 2) + iVar3 + iVar2 / 2 + iVar5) -
                    iVar8,(iVar6 + iVar7) - iVar9,0xe065);
  pwVar10 = (wchar_t *)((int)this + 0x858);
  if (7 < *(uint *)((int)this + 0x86c)) {
    pwVar10 = *(wchar_t **)pwVar10;
  }
  FUN_10084560(this,*(int *)(param_1 + 8),pwVar10);
  return;
}


