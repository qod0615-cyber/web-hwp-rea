// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 121021-121127
//==== 1008eaa0 FUN_1008eaa0

void __thiscall FUN_1008eaa0(void *this,int param_1)

{
  int *this_00;
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  ushort uVar5;
  int iVar6;
  int iVar7;
  wchar_t *pwVar8;
  int iVar9;
  undefined2 *puVar10;
  undefined4 in_stack_ffffff70;
  ushort uVar12;
  ushort *puVar11;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  uVar12 = (ushort)((uint)in_stack_ffffff70 >> 0x10);
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac559;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  this_00 = *(int **)((int)this + 0x74);
  uVar5 = *(ushort *)((int)this_00 + 0xe) & 1;
  *(ushort *)((int)this_00 + 0xe) = uVar5;
  if (uVar5 != 0) {
    this_00[0x214] = 0;
  }
  iVar6 = MulDiv(*(int *)((int)this + 8),*(int *)((int)this + 0x84),100);
  pwVar8 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar8 = *(wchar_t **)pwVar8;
  }
  FUN_10084560(this_00,iVar6,pwVar8);
  iVar6 = *(int *)((int)this + 0x50);
  iVar7 = *(int *)((int)this + 0x58);
  iVar9 = *(int *)(*(int *)((int)this + 0x68) + 0x80);
  iVar1 = *(int *)((int)this + 0x88);
  iVar2 = *(int *)(*(int *)((int)this + 0x7c) + 0x58);
  iVar3 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  iVar4 = *(int *)((int)this + 0x8c);
  puVar11 = (ushort *)((uint)uVar12 << 0x10);
  if (*(int *)((int)this + 0x80) == 1) {
    puVar10 = &DAT_100b0640;
  }
  else {
    puVar10 = (undefined2 *)&DAT_100b0668;
  }
  FUN_10005ad0(&stack0xffffff70,puVar10,3);
  FUN_10084cf0(this_00,((iVar7 - iVar2) / 2 - iVar1 / 2) + iVar6 + iVar9,iVar3 - iVar4 / 2,puVar11);
  if (uVar5 != 0) {
    this_00[0x214] = 1;
  }
  iVar7 = *(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50);
  iVar9 = *(int *)((int)this + 0x58) - *(int *)(*(int *)((int)this + 0x7c) + 0x58);
  iVar6 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)(*(int *)((int)this + 0x78) + 0x80) =
       (iVar9 / 2 + iVar7) - *(int *)(*(int *)((int)this + 0x78) + 0x58) / 2;
  *(int *)(*(int *)((int)this + 0x78) + 0x7c) =
       (*(int *)((int)this + 0x8c) / 2 - *(int *)(*(int *)((int)this + 0x78) + 0x54)) + iVar6;
  (**(code **)(**(int **)((int)this + 0x78) + 4))();
  *(int *)(*(int *)((int)this + 0x7c) + 0x80) = iVar9 + iVar7;
  *(int *)(*(int *)((int)this + 0x7c) + 0x7c) = iVar6;
  (**(code **)(**(int **)((int)this + 0x7c) + 4))();
  pwVar8 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar8 = *(wchar_t **)pwVar8;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar8);
  if ((void *)param_1 == this) {
    iVar6 = *(int *)((int)this + 0x58);
    iVar9 = *(int *)((int)this + 0x5c);
    iVar1 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    iVar2 = *(int *)((int)this + 0x54);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_48);
      this_00[0x21d] = iVar2 + iVar1;
      this_00[0x21f] = iVar9;
      this_00[0x21c] = iVar7;
      this_00[0x21e] = iVar6;
      CHncPen::~CHncPen(local_48);
    }
  }
  iVar6 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = iVar7;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar6;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


