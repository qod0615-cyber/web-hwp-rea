// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 120029-120124
//==== 1008d730 FUN_1008d730

void __thiscall FUN_1008d730(void *this,int param_1)

{
  int *this_00;
  int iVar1;
  void *pvVar2;
  uint uVar3;
  wchar_t *pwVar4;
  tagSIZE local_68 [4];
  int local_64;
  int local_60;
  tagSIZE local_5c [4];
  int local_58;
  int local_54;
  void *local_50;
  int local_4c;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac559;
  local_10 = ExceptionList;
  uVar3 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  local_50 = (void *)param_1;
  local_54 = *(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50);
  this_00 = *(int **)((int)this + 0x74);
  local_58 = *(int *)((int)this + 0x58) / 2 + local_54;
  local_60 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  iVar1 = *(int *)((int)this + 0x78);
  local_64 = *(int *)(iVar1 + 0x5c);
  *(int *)(iVar1 + 0x80) = local_58 - *(int *)(iVar1 + 0x58) / 2;
  pvVar2 = *(void **)((int)this + 0x74);
  local_4c = *(int *)(*(int *)((int)this + 0x78) + 0x54);
  pwVar4 = (wchar_t *)((int)pvVar2 + 0x858);
  if (7 < *(uint *)((int)pvVar2 + 0x86c)) {
    pwVar4 = *(wchar_t **)pwVar4;
  }
  local_14 = uVar3;
  FUN_10084560(pvVar2,*(int *)((int)this + 8),pwVar4);
  FUN_100851d0(pvVar2,local_68,0xe05b);
  *(int *)(*(int *)((int)this + 0x78) + 0x7c) = (local_64 / 0x14 - local_4c) + local_60;
  (**(code **)(**(int **)((int)this + 0x78) + 4))(local_50,uVar3);
  *(int *)(*(int *)((int)this + 0x7c) + 0x80) =
       local_58 - *(int *)(*(int *)((int)this + 0x7c) + 0x58) / 2;
  pvVar2 = *(void **)((int)this + 0x74);
  local_4c = *(int *)(*(int *)((int)this + 0x7c) + 0x54);
  pwVar4 = (wchar_t *)((int)pvVar2 + 0x858);
  if (7 < *(uint *)((int)pvVar2 + 0x86c)) {
    pwVar4 = *(wchar_t **)pwVar4;
  }
  FUN_10084560(pvVar2,*(int *)((int)this + 8),pwVar4);
  FUN_100851d0(pvVar2,local_5c,0xe05b);
  pvVar2 = local_50;
  local_58 = local_58 / 10;
  *(int *)(*(int *)((int)this + 0x7c) + 0x7c) =
       ((local_60 - local_58 / 2) - *(int *)(*(int *)((int)this + 0x7c) + 0x5c)) - local_4c;
  (**(code **)(**(int **)((int)this + 0x7c) + 4))(local_50);
  pwVar4 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar4 = *(wchar_t **)pwVar4;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar4);
  if (pvVar2 == this) {
    local_50 = *(void **)((int)this + 0x5c);
    iVar1 = *(int *)((int)this + 0x58);
    local_4c = *(int *)((int)this + 0x54) + *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_48);
      this_00[0x21c] = local_54;
      this_00[0x21d] = local_4c;
      this_00[0x21f] = (int)local_50;
      this_00[0x21e] = iVar1;
      CHncPen::~CHncPen(local_48);
    }
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = local_54;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar1;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


