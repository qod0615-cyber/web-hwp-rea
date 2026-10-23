// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 119460-119554
//==== 1008cab0 FUN_1008cab0

void __thiscall FUN_1008cab0(void *this,int param_1)

{
  void *this_00;
  int iVar1;
  int iVar2;
  int iVar3;
  int *this_01;
  uint uVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  wchar_t *pwVar8;
  int iVar9;
  int iVar10;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac4c9;
  local_10 = ExceptionList;
  uVar4 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  this_00 = *(void **)((int)this + 0x74);
  local_14 = uVar4;
  iVar5 = MulDiv(*(int *)((int)this + 8),*(int *)((int)this + 0x9c),100);
  pwVar8 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar8 = *(wchar_t **)pwVar8;
  }
  FUN_10084560(this_00,iVar5,pwVar8);
  iVar5 = *(int *)((int)this + 0xa0);
  iVar10 = *(int *)((int)this + 0x58);
  iVar9 = *(int *)((int)this + 0x50);
  iVar1 = *(int *)((int)this + 0xa4);
  iVar2 = *(int *)(*(int *)((int)this + 0x68) + 0x80);
  iVar3 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  uVar6 = (uint)*(ushort *)((int)this + 0x98);
  iVar7 = MulDiv(iVar1,10,100);
  FUN_10084930(this_00,(iVar10 / 2 - iVar5 / 2) + iVar9 + iVar2,(iVar3 - iVar1 / 2) - iVar7,uVar6);
  iVar9 = *(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50);
  iVar10 = *(int *)((int)this + 0x58) / 2 + iVar9;
  iVar5 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)(*(int *)((int)this + 0x78) + 0x80) =
       iVar10 - *(int *)(*(int *)((int)this + 0x78) + 0x58) / 2;
  *(int *)(*(int *)((int)this + 0x78) + 0x7c) =
       (*(int *)((int)this + 0xa4) / 2 - *(int *)(*(int *)((int)this + 0x78) + 0x54)) + iVar5;
  (**(code **)(**(int **)((int)this + 0x78) + 4))(param_1,uVar4);
  *(int *)(*(int *)((int)this + 0x7c) + 0x80) =
       iVar10 - *(int *)(*(int *)((int)this + 0x7c) + 0x58) / 2;
  iVar10 = *(int *)((int)this + 0x7c);
  *(int *)(iVar10 + 0x7c) =
       ((iVar5 - *(int *)((int)this + 0xa4) / 2) - *(int *)(iVar10 + 0x5c)) -
       *(int *)(iVar10 + 0x54);
  (**(code **)(**(int **)((int)this + 0x7c) + 4))(param_1);
  this_01 = *(int **)((int)this + 0x74);
  pwVar8 = (wchar_t *)(this_01 + 0x216);
  if (7 < (uint)this_01[0x21b]) {
    pwVar8 = *(wchar_t **)pwVar8;
  }
  FUN_10084560(this_01,*(int *)((int)this + 8),pwVar8);
  if ((void *)param_1 == this) {
    iVar5 = *(int *)((int)this + 0x58);
    iVar10 = *(int *)((int)this + 0x5c);
    iVar1 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    iVar2 = *(int *)((int)this + 0x54);
    if ((this_01[0x220] != 1) && (*this_01 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_01,local_48);
      this_01[0x21d] = iVar2 + iVar1;
      this_01[0x21f] = iVar10;
      this_01[0x21c] = iVar9;
      this_01[0x21e] = iVar5;
      CHncPen::~CHncPen(local_48);
    }
  }
  iVar5 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = iVar9;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar5;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


