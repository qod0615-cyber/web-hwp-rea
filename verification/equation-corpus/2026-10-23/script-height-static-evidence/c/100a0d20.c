// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 135397-135487
//==== 100a0d20 FUN_100a0d20

void __thiscall FUN_100a0d20(void *this,int param_1)

{
  int *this_00;
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  ulong uVar7;
  wchar_t *pwVar8;
  uint uVar9;
  uint uVar10;
  CHncPen local_60 [52];
  int local_2c [4];
  int local_1c;
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100acf61;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  this_00 = *(int **)((int)this + 0x74);
  iVar5 = *(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50);
  (**(code **)(**(int **)((int)this + 0x78) + 0xc))(local_2c,param_1,local_14);
  uVar6 = 0;
  local_8 = 0;
  uVar10 = 0;
  uVar9 = 0;
  if (local_1c != 0) {
    uVar10 = FUN_100a0f70(local_2c);
    uVar6 = FUN_100a0f70(local_2c);
    uVar9 = FUN_100a0f70(local_2c);
  }
  if ((CHncDrawContext *)*this_00 == (CHncDrawContext *)0x0) {
    uVar7 = 0xffffff;
  }
  else {
    uVar7 = CHncDrawContext::SetTextColor
                      ((CHncDrawContext *)*this_00,
                       ((uVar9 & 0xff) << 8 | uVar6 & 0xff) << 8 | uVar10 & 0xff);
  }
  *(int *)(*(int *)((int)this + 0x7c) + 0x80) = iVar5;
  *(undefined4 *)(*(int *)((int)this + 0x7c) + 0x7c) =
       *(undefined4 *)(*(int *)((int)this + 0x68) + 0x7c);
  (**(code **)(**(int **)((int)this + 0x7c) + 4))(param_1);
  if ((CHncDrawContext *)*this_00 != (CHncDrawContext *)0x0) {
    CHncDrawContext::SetTextColor((CHncDrawContext *)*this_00,uVar7);
  }
  pwVar8 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar8 = *(wchar_t **)pwVar8;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar8);
  if ((void *)param_1 == this) {
    iVar1 = *(int *)((int)this + 0x5c);
    iVar2 = *(int *)((int)this + 0x58);
    iVar3 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    iVar4 = *(int *)((int)this + 0x54);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_60);
      local_8 = CONCAT31(local_8._1_3_,1);
      CHncPen::SetLineStyle(local_60,1);
      CHncPen::SetWidth(local_60,1);
      CHncPen::SetColor(local_60,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_60);
      this_00[0x21c] = iVar5;
      this_00[0x21d] = iVar4 + iVar3;
      this_00[0x21f] = iVar1;
      this_00[0x21e] = iVar2;
      CHncPen::~CHncPen(local_60);
    }
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = iVar5;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar1;
  FUN_10005c10(local_2c);
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


