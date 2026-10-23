// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 134489-134548
//==== 1009f9d0 FUN_1009f9d0

void __thiscall FUN_1009f9d0(void *this,int param_1)

{
  int *this_00;
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  wchar_t *pwVar5;
  int iVar6;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac769;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  this_00 = *(int **)((int)this + 0x74);
  iVar6 = *(int *)((int)this + 0x50) + *(int *)(*(int *)((int)this + 0x68) + 0x80);
  pwVar5 = (wchar_t *)(this_00 + 0x216);
  this_00[0x214] = 1;
  if (7 < (uint)this_00[0x21b]) {
    pwVar5 = *(wchar_t **)pwVar5;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar5);
  if ((void *)param_1 == this) {
    iVar1 = *(int *)((int)this + 0x58);
    iVar2 = *(int *)((int)this + 0x5c);
    iVar3 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    iVar4 = *(int *)((int)this + 0x54);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_48);
      this_00[0x21d] = iVar4 + iVar3;
      this_00[0x21f] = iVar2;
      this_00[0x21c] = iVar6;
      this_00[0x21e] = iVar1;
      CHncPen::~CHncPen(local_48);
    }
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = iVar6;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar1;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


