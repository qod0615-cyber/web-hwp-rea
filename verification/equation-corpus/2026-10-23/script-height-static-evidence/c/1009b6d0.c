// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 131028-131115
//==== 1009b6d0 FUN_1009b6d0

void __fastcall FUN_1009b6d0(int param_1)

{
  ushort *puVar1;
  void *this;
  bool bVar2;
  bool bVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  wchar_t *pwVar8;
  int iVar9;
  int iVar10;
  wchar_t *pwVar11;
  
  iVar5 = *(int *)(param_1 + 0x78);
  iVar4 = *(int *)(*(int *)(iVar5 + 0x8c) + 100);
  if (*(int *)(iVar4 + 4) == 0x6f) {
    if ((ushort)(*(short *)(iVar4 + 0x9c) + 0x2000U) < 0x1a) {
      bVar3 = true;
      puVar1 = (ushort *)(*(int *)(iVar4 + 0x74) + 0xe);
      *puVar1 = *puVar1 & 1;
      if (*puVar1 == 0) goto LAB_1009b712;
    }
    else {
LAB_1009b712:
      bVar3 = false;
    }
    iVar5 = *(int *)(param_1 + 0x78);
  }
  else {
    bVar3 = false;
  }
  iVar4 = *(int *)(*(int *)(iVar5 + 0x90) + 0x60);
  if ((*(int *)(iVar4 + 4) == 0x6f) && ((ushort)(*(short *)(iVar4 + 0x9c) + 0x2000U) < 0x1a)) {
    puVar1 = (ushort *)(*(int *)(iVar4 + 0x74) + 0xe);
    *puVar1 = *puVar1 & 1;
    if (*puVar1 != 0) {
      bVar2 = true;
      goto LAB_1009b754;
    }
  }
  bVar2 = false;
LAB_1009b754:
  this = *(void **)(param_1 + 0x74);
  iVar4 = *(int *)(*(int *)(param_1 + 0x68) + 0x80) + *(int *)(param_1 + 0x50);
  iVar5 = MulDiv(*(int *)(param_1 + 0x80),0x37,100);
  iVar6 = (*(int *)(*(int *)(param_1 + 0x68) + 0x7c) - *(int *)(param_1 + 0x84)) +
          *(int *)(param_1 + 0x54);
  if ((!bVar3) || (bVar2)) {
    iVar7 = *(int *)(param_1 + 8);
    iVar9 = 0;
  }
  else {
    iVar7 = *(int *)(param_1 + 8);
    iVar9 = (int)((iVar7 >> 0x1f & 3U) + iVar7) >> 2;
  }
  iVar9 = *(int *)(*(int *)(param_1 + 0x78) + 0x58) - iVar9;
  iVar10 = 0x28;
  iVar5 = iVar9 - iVar5;
  if (bVar3) {
    iVar10 = 5;
  }
  iVar7 = iVar7 / iVar10;
  if (-1 < iVar5) {
    pwVar11 = (wchar_t *)((int)this + 0x858);
    pwVar8 = pwVar11;
    if (7 < *(uint *)((int)this + 0x86c)) {
      pwVar8 = *(wchar_t **)pwVar11;
    }
    FUN_10084560(this,*(int *)(param_1 + 8),pwVar8);
    FUN_100844d0(this,*(undefined4 *)((int)this + 0x848),iVar9);
    FUN_10084930(this,iVar7 + iVar4,iVar6,0xe06d);
    if (7 < *(uint *)((int)this + 0x86c)) {
      pwVar11 = *(wchar_t **)pwVar11;
    }
    FUN_10084560(this,*(int *)(param_1 + 8),pwVar11);
    iVar7 = iVar7 + iVar5;
  }
  FUN_10084930(this,iVar7 + iVar4,iVar6,0xe06e);
  return;
}


