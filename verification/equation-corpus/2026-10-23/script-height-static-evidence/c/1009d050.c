// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 132331-132441
//==== 1009d050 FUN_1009d050

void __thiscall FUN_1009d050(void *this,int param_1)

{
  ushort *puVar1;
  void *this_00;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  undefined4 uVar8;
  int *this_01;
  bool bVar9;
  uint uVar10;
  int iVar11;
  wchar_t *pwVar12;
  int iVar13;
  int iVar14;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac4c9;
  local_10 = ExceptionList;
  uVar10 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  iVar14 = *(int *)(*(int *)(*(int *)((int)this + 0x78) + 0x8c) + 100);
  if ((*(int *)(iVar14 + 4) == 0x6f) && ((ushort)(*(short *)(iVar14 + 0x9c) + 0x2000U) < 0x1a)) {
    puVar1 = (ushort *)(*(int *)(iVar14 + 0x74) + 0xe);
    *puVar1 = *puVar1 & 1;
    if (*puVar1 != 0) {
      bVar9 = true;
      goto LAB_1009d0bd;
    }
  }
  bVar9 = false;
LAB_1009d0bd:
  this_00 = *(void **)((int)this + 0x74);
  iVar14 = *(int *)((int)this + 0x58);
  iVar13 = 0x28;
  iVar2 = *(int *)((int)this + 0x50);
  iVar3 = *(int *)(*(int *)((int)this + 0x68) + 0x80);
  if (bVar9) {
    iVar13 = 9;
  }
  iVar4 = *(int *)((int)this + 8);
  iVar5 = *(int *)((int)this + 0x80);
  local_14 = uVar10;
  iVar11 = FUN_1009b0e0(*(int *)((int)this + 0x78));
  if (iVar11 == 0) {
    iVar11 = *(int *)((int)this + 0x84) / 2;
  }
  else {
    iVar11 = 0;
  }
  iVar6 = *(int *)((int)this + 0x54);
  iVar7 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  pwVar12 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar12 = *(wchar_t **)pwVar12;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar12);
  FUN_10084930(this_00,(iVar4 / iVar13 - iVar5 / 2) + iVar14 / 2 + iVar2 + iVar3,
               (iVar6 - iVar11) + iVar7,0xe05e);
  iVar14 = *(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50);
  uVar8 = *(undefined4 *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)(*(int *)((int)this + 0x78) + 0x80) =
       (*(int *)((int)this + 0x58) / 2 + iVar14) - *(int *)(*(int *)((int)this + 0x78) + 0x58) / 2;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 0x7c) = uVar8;
  (**(code **)(**(int **)((int)this + 0x78) + 4))(param_1,uVar10);
  this_01 = *(int **)((int)this + 0x74);
  pwVar12 = (wchar_t *)(this_01 + 0x216);
  if (7 < (uint)this_01[0x21b]) {
    pwVar12 = *(wchar_t **)pwVar12;
  }
  FUN_10084560(this_01,*(int *)((int)this + 8),pwVar12);
  if ((void *)param_1 == this) {
    iVar2 = *(int *)((int)this + 0x58);
    iVar3 = *(int *)((int)this + 0x5c);
    iVar13 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    iVar4 = *(int *)((int)this + 0x54);
    if ((this_01[0x220] != 1) && (*this_01 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_01,local_48);
      this_01[0x21d] = iVar4 + iVar13;
      this_01[0x21f] = iVar3;
      this_01[0x21c] = iVar14;
      this_01[0x21e] = iVar2;
      CHncPen::~CHncPen(local_48);
    }
  }
  iVar2 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = iVar14;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar2;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


