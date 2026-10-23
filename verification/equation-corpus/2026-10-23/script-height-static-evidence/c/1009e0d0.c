// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 133195-133271
//==== 1009e0d0 FUN_1009e0d0

void __fastcall FUN_1009e0d0(int param_1)

{
  ushort *puVar1;
  int iVar2;
  void *this;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  bool bVar7;
  int iVar8;
  int iVar9;
  wchar_t *pwVar10;
  int iVar11;
  int nNumber;
  int local_c;
  
  iVar2 = *(int *)(*(int *)(*(int *)(param_1 + 0x78) + 0x8c) + 100);
  if ((*(int *)(iVar2 + 4) == 0x6f) && ((ushort)(*(short *)(iVar2 + 0x9c) + 0x2000U) < 0x1a)) {
    puVar1 = (ushort *)(*(int *)(iVar2 + 0x74) + 0xe);
    *puVar1 = *puVar1 & 1;
    if (*puVar1 != 0) {
      bVar7 = true;
      goto LAB_1009e112;
    }
  }
  bVar7 = false;
LAB_1009e112:
  this = *(void **)(param_1 + 0x74);
  pwVar10 = (wchar_t *)((int)this + 0x858);
  if (7 < *(uint *)((int)this + 0x86c)) {
    pwVar10 = *(wchar_t **)((int)this + 0x858);
  }
  FUN_10084560(this,*(int *)(param_1 + 8),pwVar10);
  iVar2 = *(int *)(param_1 + 0x58);
  iVar3 = *(int *)(*(int *)(param_1 + 0x68) + 0x80);
  iVar4 = *(int *)(param_1 + 0x50);
  iVar11 = 0x14;
  if (bVar7) {
    iVar11 = 7;
  }
  iVar5 = *(int *)(param_1 + 8);
  if (*(int *)((int)this + 0x84c) < *(int *)(param_1 + 0x58)) {
    nNumber = *(int *)((int)this + 0x84c) * 8;
    if (*(int *)(param_1 + 0x58) <= nNumber) {
      nNumber = *(int *)(param_1 + 0x58);
    }
  }
  else {
    nNumber = *(int *)(param_1 + 0x80);
  }
  iVar8 = MulDiv(nNumber,10,100);
  iVar9 = FUN_1009b0e0(*(int *)(param_1 + 0x78));
  if (iVar9 == 0) {
    local_c = *(int *)(param_1 + 0x84) / 2;
  }
  else {
    local_c = 0;
  }
  iVar9 = *(int *)(param_1 + 0x54);
  iVar6 = *(int *)(*(int *)(param_1 + 0x68) + 0x7c);
  FUN_100844d0(this,*(undefined4 *)((int)this + 0x848),nNumber);
  FUN_10084930(this,((iVar5 / iVar11 - nNumber / 2) + iVar3 + iVar2 / 2 + iVar4) - iVar8,
               (iVar9 - local_c) + iVar6,0xe063);
  pwVar10 = (wchar_t *)((int)this + 0x858);
  if (7 < *(uint *)((int)this + 0x86c)) {
    pwVar10 = *(wchar_t **)pwVar10;
  }
  FUN_10084560(this,*(int *)(param_1 + 8),pwVar10);
  return;
}


