// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 135159-135268
//==== 100a0790 FUN_100a0790

void __fastcall FUN_100a0790(int param_1)

{
  ushort *puVar1;
  void *this;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  bool bVar5;
  bool bVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  
  iVar10 = *(int *)(param_1 + 0x7c);
  iVar9 = *(int *)(*(int *)(iVar10 + 0x8c) + 100);
  if (*(int *)(iVar9 + 4) == 0x6f) {
    if ((ushort)(*(short *)(iVar9 + 0x9c) + 0x2000U) < 0x1a) {
      bVar5 = true;
      puVar1 = (ushort *)(*(int *)(iVar9 + 0x74) + 0xe);
      *puVar1 = *puVar1 & 1;
      if (*puVar1 == 0) goto LAB_100a07d5;
    }
    else {
LAB_100a07d5:
      bVar5 = false;
    }
    iVar10 = *(int *)(param_1 + 0x7c);
  }
  else {
    bVar5 = false;
  }
  iVar9 = *(int *)(*(int *)(iVar10 + 0x90) + 0x60);
  if ((*(int *)(iVar9 + 4) == 0x6f) && ((ushort)(*(short *)(iVar9 + 0x9c) + 0x2000U) < 0x1a)) {
    bVar6 = true;
    puVar1 = (ushort *)(*(int *)(iVar9 + 0x74) + 0xe);
    *puVar1 = *puVar1 & 1;
    if (*puVar1 != 0) goto LAB_100a081c;
  }
  bVar6 = false;
LAB_100a081c:
  this = *(void **)(param_1 + 0x74);
  iVar9 = *(int *)(param_1 + 0x54);
  iVar10 = *(int *)(*(int *)(param_1 + 0x68) + 0x80);
  iVar11 = *(int *)(param_1 + 0x50);
  iVar8 = *(int *)(*(int *)(param_1 + 0x68) + 0x7c);
  iVar2 = *(int *)(param_1 + 0x84);
  iVar3 = *(int *)(*(int *)(param_1 + 0x78) + 0x5c);
  iVar7 = MulDiv(*(int *)(param_1 + 0x98),0x1e,100);
  iVar7 = (iVar3 + iVar9 + iVar8) - iVar7;
  if (*(int *)(param_1 + 4) == 0x6c) {
    iVar9 = *(int *)(param_1 + 0x78);
  }
  else {
    iVar9 = *(int *)(param_1 + 0x7c);
  }
  iVar9 = *(int *)(iVar9 + 0x58);
  if ((!bVar5) || (iVar8 = 7, bVar6)) {
    iVar8 = 0x14;
  }
  iVar8 = MulDiv(*(int *)(param_1 + 8),iVar8,100);
  iVar8 = iVar8 + (iVar9 - iVar2);
  if (bVar5) {
    iVar9 = MulDiv(*(int *)(param_1 + 8),0xf,100);
  }
  else {
    iVar9 = 0;
  }
  iVar9 = iVar10 + iVar11 + iVar9;
  iVar10 = MulDiv(*(int *)(param_1 + 8),3,100);
  if (*(int *)(param_1 + 0x84) < *(int *)(param_1 + 0x58)) {
    if (*(int *)(param_1 + 4) == 0x6c) {
      iVar11 = *(int *)(param_1 + 0x78);
    }
    else {
      iVar11 = *(int *)(param_1 + 0x7c);
    }
    iVar9 = iVar9 + (*(int *)(param_1 + 0x58) - *(int *)(iVar11 + 0x58)) / 2;
  }
  if (iVar8 < 0) {
    FUN_100844d0(this,*(undefined4 *)((int)this + 0x848),*(int *)(param_1 + 0x8c) / 2 + iVar10);
    FUN_10084930(this,iVar9,iVar7,(uint)*(ushort *)(param_1 + 0xac));
    FUN_10084930(this,(iVar9 - iVar10) + *(int *)(param_1 + 0x8c),iVar7,
                 (uint)*(ushort *)(param_1 + 0xae));
    iVar9 = *(int *)(param_1 + 0x94) + iVar10 * -2 + iVar9 + *(int *)(param_1 + 0x8c);
  }
  else {
    uVar4 = *(undefined4 *)((int)this + 0x848);
    iVar11 = MulDiv(iVar8,0x1a,100);
    FUN_100844d0(this,uVar4,iVar11 + iVar10);
    FUN_10084930(this,(iVar9 - iVar10) + *(int *)(param_1 + 0x8c),iVar7,
                 (uint)*(ushort *)(param_1 + 0xb0));
    FUN_10084930(this,iVar8 / 2 + iVar10 * -3 + *(int *)(param_1 + 0x94) + iVar9 +
                      *(int *)(param_1 + 0x8c),iVar7,(uint)*(ushort *)(param_1 + 0xb0));
    FUN_100844d0(this,*(undefined4 *)((int)this + 0x848),*(int *)(param_1 + 0x8c) / 2 + iVar10);
    FUN_10084930(this,iVar9,iVar7,(uint)*(ushort *)(param_1 + 0xac));
    FUN_10084930(this,iVar8 / 2 + iVar10 * -2 + iVar9 + *(int *)(param_1 + 0x8c),iVar7,
                 (uint)*(ushort *)(param_1 + 0xae));
    iVar9 = *(int *)(param_1 + 0x94) + iVar10 * -4 + iVar9 + iVar8 + *(int *)(param_1 + 0x8c) + -1;
  }
  FUN_10084930(this,iVar9,iVar7,(uint)*(ushort *)(param_1 + 0xb2));
  return;
}


