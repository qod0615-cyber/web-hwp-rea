// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 131615-131703
//==== 1009c230 FUN_1009c230

void __thiscall FUN_1009c230(void *this,int param_1)

{
  void *this_00;
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  undefined4 uVar6;
  int *this_01;
  int iVar7;
  int iVar8;
  wchar_t *pwVar9;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac449;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  this_00 = *(void **)((int)this + 0x74);
  iVar8 = *(int *)(*(int *)((int)this + 0x68) + 0x80);
  iVar1 = *(int *)((int)this + 0x50);
  pwVar9 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar9 = *(wchar_t **)((int)this_00 + 0x858);
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar9);
  iVar7 = MulDiv(*(int *)((int)this + 0x84),0x50,100);
  iVar2 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  iVar3 = *(int *)(*(int *)((int)this + 0x78) + 0x5c);
  iVar4 = *(int *)((int)this + 0x54);
  iVar5 = *(int *)((int)this + 8);
  FUN_100844d0(this_00,*(undefined4 *)((int)this_00 + 0x848),
               *(undefined4 *)(*(int *)((int)this + 0x78) + 0x58));
  FUN_10084930(this_00,iVar1 + iVar8 + iVar5 / 0x14,(iVar3 + iVar4 + iVar2) - iVar7,0xe06d);
  pwVar9 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar9 = *(wchar_t **)pwVar9;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar9);
  iVar8 = *(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50);
  uVar6 = *(undefined4 *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)(*(int *)((int)this + 0x78) + 0x80) =
       (*(int *)((int)this + 0x58) / 2 + iVar8) - *(int *)(*(int *)((int)this + 0x78) + 0x58) / 2;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 0x7c) = uVar6;
  (**(code **)(**(int **)((int)this + 0x78) + 4))(param_1);
  this_01 = *(int **)((int)this + 0x74);
  pwVar9 = (wchar_t *)(this_01 + 0x216);
  if (7 < (uint)this_01[0x21b]) {
    pwVar9 = *(wchar_t **)pwVar9;
  }
  FUN_10084560(this_01,*(int *)((int)this + 8),pwVar9);
  if ((void *)param_1 == this) {
    iVar1 = *(int *)((int)this + 0x5c);
    iVar2 = *(int *)((int)this + 0x58);
    iVar3 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    iVar4 = *(int *)((int)this + 0x54);
    if ((this_01[0x220] != 1) && (*this_01 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_01,local_48);
      this_01[0x21c] = iVar8;
      this_01[0x21d] = iVar4 + iVar3;
      this_01[0x21f] = iVar1;
      this_01[0x21e] = iVar2;
      CHncPen::~CHncPen(local_48);
    }
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = iVar8;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar1;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


