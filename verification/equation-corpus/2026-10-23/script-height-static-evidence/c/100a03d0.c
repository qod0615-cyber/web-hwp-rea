// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 134979-135060
//==== 100a03d0 FUN_100a03d0

void __thiscall FUN_100a03d0(void *this,int param_1)

{
  int iVar1;
  int *this_00;
  int iVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  wchar_t *pwVar6;
  int iVar7;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac449;
  local_10 = ExceptionList;
  uVar4 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  local_14 = uVar4;
  FUN_100a0790((int)this);
  iVar5 = *(int *)((int)this + 0x50) + *(int *)(*(int *)((int)this + 0x68) + 0x80);
  iVar1 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  iVar7 = *(int *)((int)this + 0x58) / 2 + iVar5;
  *(int *)(*(int *)((int)this + 0x7c) + 0x80) =
       iVar7 - *(int *)(*(int *)((int)this + 0x7c) + 0x58) / 2;
  *(int *)(*(int *)((int)this + 0x78) + 0x80) =
       iVar7 - *(int *)(*(int *)((int)this + 0x78) + 0x58) / 2;
  iVar7 = *(int *)((int)this + 0x78);
  if (*(int *)((int)this + 4) == 0x6c) {
    *(int *)(iVar7 + 0x7c) = iVar1;
    iVar7 = *(int *)((int)this + 0x7c);
    *(int *)(iVar7 + 0x7c) =
         ((*(int *)((int)this + 0x5c) - *(int *)(iVar7 + 0x5c)) - *(int *)(iVar7 + 0x54)) +
         *(int *)((int)this + 0x54) + iVar1;
  }
  else {
    *(int *)(iVar7 + 0x7c) = (*(int *)((int)this + 0x54) - *(int *)(iVar7 + 0x54)) + iVar1;
    *(int *)(*(int *)((int)this + 0x7c) + 0x7c) = iVar1;
  }
  (**(code **)(**(int **)((int)this + 0x7c) + 4))(param_1,uVar4);
  (**(code **)(**(int **)((int)this + 0x78) + 4))(param_1);
  this_00 = *(int **)((int)this + 0x74);
  pwVar6 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar6 = *(wchar_t **)pwVar6;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar6);
  if ((void *)param_1 == this) {
    iVar1 = *(int *)((int)this + 0x5c);
    iVar7 = *(int *)((int)this + 0x58);
    iVar2 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    iVar3 = *(int *)((int)this + 0x54);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_48);
      this_00[0x21c] = iVar5;
      this_00[0x21d] = iVar3 + iVar2;
      this_00[0x21f] = iVar1;
      this_00[0x21e] = iVar7;
      CHncPen::~CHncPen(local_48);
    }
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = iVar5;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar1;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


