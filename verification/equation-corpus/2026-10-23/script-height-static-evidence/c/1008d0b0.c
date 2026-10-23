// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 119732-119842
//==== 1008d0b0 FUN_1008d0b0

void __thiscall FUN_1008d0b0(void *this,int param_1)

{
  int *this_00;
  int iVar1;
  int iVar2;
  int iVar3;
  void *this_01;
  undefined4 uVar4;
  int iVar5;
  wchar_t *pwVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  wchar_t *pwVar10;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac529;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  this_00 = *(int **)((int)this + 0x74);
  pwVar10 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar10 = (wchar_t *)this_00[0x216];
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar10);
  iVar5 = MulDiv(this_00[0x212],10,100);
  iVar1 = *(int *)((int)this + 0x50);
  iVar7 = *(int *)(*(int *)((int)this + 0x68) + 0x80);
  iVar8 = *(int *)(*(int *)((int)this + 0x7c) + 0x5c);
  iVar9 = *(int *)((int)this + 0x54);
  iVar2 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  pwVar10 = (wchar_t *)(this_00 + 0x216);
  iVar3 = *(int *)((int)this + 0x58);
  pwVar6 = pwVar10;
  if (7 < (uint)this_00[0x21b]) {
    pwVar6 = *(wchar_t **)pwVar10;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar6);
  FUN_100844d0(this_00,this_00[0x212],iVar3 + iVar5 * -2);
  FUN_10084930(this_00,iVar5 + iVar1 + iVar7,iVar8 + iVar9 + iVar2,0xe06d);
  if (7 < (uint)this_00[0x21b]) {
    pwVar10 = *(wchar_t **)pwVar10;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar10);
  iVar7 = *(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50);
  iVar8 = *(int *)((int)this + 0x58) / 2 + iVar7;
  iVar1 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  this_01 = *(void **)((int)this + 0x74);
  pwVar10 = (wchar_t *)((int)this_01 + 0x858);
  if (7 < *(uint *)((int)this_01 + 0x86c)) {
    pwVar10 = *(wchar_t **)pwVar10;
  }
  FUN_10084560(this_01,*(int *)((int)this + 8),pwVar10);
  uVar4 = *(undefined4 *)((int)this_01 + 0x84c);
  iVar9 = MulDiv(*(int *)((int)this_01 + 0x848),0x1e,100);
  *(int *)((int)this + 0x88) = iVar9;
  *(undefined4 *)((int)this + 0x84) = uVar4;
  *(int *)(*(int *)((int)this + 0x78) + 0x80) =
       iVar8 - *(int *)(*(int *)((int)this + 0x78) + 0x58) / 2;
  *(int *)(*(int *)((int)this + 0x78) + 0x7c) =
       (*(int *)((int)this + 0x88) / 2 - *(int *)(*(int *)((int)this + 0x78) + 0x54)) + iVar1;
  (**(code **)(**(int **)((int)this + 0x78) + 4))(param_1);
  *(int *)(*(int *)((int)this + 0x7c) + 0x80) =
       iVar8 - *(int *)(*(int *)((int)this + 0x7c) + 0x58) / 2;
  iVar8 = *(int *)((int)this + 0x7c);
  *(int *)(iVar8 + 0x7c) =
       ((iVar1 - *(int *)((int)this + 0x88) / 2) - *(int *)(iVar8 + 0x5c)) - *(int *)(iVar8 + 0x54);
  (**(code **)(**(int **)((int)this + 0x7c) + 4))(param_1);
  pwVar10 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar10 = *(wchar_t **)pwVar10;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar10);
  if ((void *)param_1 == this) {
    iVar1 = *(int *)((int)this + 0x5c);
    iVar8 = *(int *)((int)this + 0x58);
    iVar9 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    iVar2 = *(int *)((int)this + 0x54);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_48);
      this_00[0x21c] = iVar7;
      this_00[0x21d] = iVar2 + iVar9;
      this_00[0x21f] = iVar1;
      this_00[0x21e] = iVar8;
      CHncPen::~CHncPen(local_48);
    }
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = iVar7;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar1;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


