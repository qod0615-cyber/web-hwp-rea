// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 123292-123416
//==== 10091bf0 FUN_10091bf0

void __thiscall FUN_10091bf0(void *this,int *param_1)

{
  int *this_00;
  int iVar1;
  int iVar2;
  wchar_t *pwVar3;
  int iVar4;
  int iVar5;
  undefined **ppuVar6;
  int iVar7;
  int iVar8;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac8a9;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  if (*(undefined ***)this == &PTR_FUN_100bf8c8) {
    iVar8 = *(int *)((int)this + 0x68);
    ppuVar6 = &PTR_FUN_100bf8c8;
  }
  else {
    iVar8 = (*(code *)(*(undefined ***)this)[4])(local_14);
    ppuVar6 = *(undefined ***)this;
  }
  iVar8 = *(int *)(iVar8 + 0x80) + *(int *)((int)this + 0x50);
  if (ppuVar6 == &PTR_FUN_100bf8c8) {
    iVar4 = *(int *)((int)this + 0x68);
  }
  else {
    iVar4 = (*(code *)ppuVar6[4])();
  }
  iVar4 = *(int *)(iVar4 + 0x7c);
  iVar5 = iVar4 + *(int *)(*(int *)((int)this + 0x78) + 0x54);
  iVar7 = *(int *)((int)this + 0x88);
  *(int *)(iVar7 + 0xc) = iVar8;
  *(int *)(iVar7 + 8) = iVar5;
  FUN_100a1830(*(int **)((int)this + 0x88));
  iVar7 = *(int *)((int)this + 0x88);
  iVar2 = *(int *)(iVar7 + 4);
  if (((iVar2 == 0x13) || (iVar2 == 4)) || (iVar2 == 0xc)) {
    iVar1 = (int)(*(int *)(iVar7 + 0x10) + (*(int *)(iVar7 + 0x10) >> 0x1f & 3U)) >> 2;
    iVar2 = *(int *)(iVar7 + 0x44);
    if (*(int *)(iVar7 + 0x44) <= iVar1) {
      iVar2 = iVar1;
    }
  }
  else {
    iVar2 = *(int *)(iVar7 + 0x44);
  }
  *(int *)(*(int *)((int)this + 0x78) + 0x80) = iVar2 + iVar8;
  *(int *)(*(int *)((int)this + 0x78) + 0x7c) = iVar4;
  (**(code **)(**(int **)((int)this + 0x78) + 4))(param_1);
  iVar4 = *(int *)((int)this + 0x88);
  iVar7 = *(int *)(iVar4 + 4);
  if (((iVar7 == 0x13) || (iVar7 == 4)) || (iVar7 == 0xc)) {
    iVar2 = (int)(*(int *)(iVar4 + 0x10) + (*(int *)(iVar4 + 0x10) >> 0x1f & 3U)) >> 2;
    iVar7 = *(int *)(iVar4 + 0x44);
    if (*(int *)(iVar4 + 0x44) <= iVar2) {
      iVar7 = iVar2;
    }
  }
  else {
    iVar7 = *(int *)(iVar4 + 0x44);
  }
  iVar4 = *(int *)((int)this + 0x8c);
  *(int *)(iVar4 + 0xc) = *(int *)(*(int *)((int)this + 0x78) + 0x58) + iVar7 + iVar8;
  *(int *)(iVar4 + 8) = iVar5;
  FUN_100a1830(*(int **)((int)this + 0x8c));
  this_00 = *(int **)((int)this + 0x74);
  pwVar3 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar3 = *(wchar_t **)pwVar3;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar3);
  if (param_1 == this) {
    if (*(undefined ***)this == &PTR_FUN_100bf8c8) {
      iVar4 = *(int *)((int)this + 0x68);
    }
    else {
      iVar4 = (*(code *)(*(undefined ***)this)[4])();
    }
    iVar4 = *(int *)(iVar4 + 0x7c);
    iVar7 = *(int *)((int)this + 0x58);
    iVar2 = *(int *)((int)this + 0x54);
    iVar5 = *(int *)((int)this + 0x5c);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_48);
      this_00[0x21d] = iVar4 + iVar2;
      this_00[0x21f] = iVar5;
      this_00[0x21c] = iVar8;
      this_00[0x21e] = iVar7;
      local_8 = 0xffffffff;
      CHncPen::~CHncPen(local_48);
    }
  }
  if (*(undefined ***)this == &PTR_FUN_100bf8c8) {
    iVar4 = *(int *)((int)this + 0x68);
  }
  else {
    iVar4 = (*(code *)(*(undefined ***)this)[4])();
  }
  iVar4 = *(int *)(iVar4 + 0x7c);
  *(int *)((int)this + 0x48) = iVar8;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar4;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


