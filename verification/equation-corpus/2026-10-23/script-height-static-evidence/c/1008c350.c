// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 119122-119204
//==== 1008c350 FUN_1008c350

void __thiscall FUN_1008c350(void *this,int param_1)

{
  void *this_00;
  int iVar1;
  int *piVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  wchar_t *pwVar6;
  int iVar7;
  int iVar8;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac449;
  local_10 = ExceptionList;
  uVar3 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  this_00 = *(void **)((int)this + 0x74);
  iVar1 = *(int *)((int)this + 0x50);
  iVar7 = *(int *)(*(int *)((int)this + 0x68) + 0x80);
  iVar5 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  iVar8 = *(int *)((int)this + 0xa8);
  local_14 = uVar3;
  iVar4 = MulDiv(*(int *)((int)this + 8),*(int *)((int)this + 0xa0),100);
  pwVar6 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar6 = *(wchar_t **)pwVar6;
  }
  FUN_10084560(this_00,iVar4,pwVar6);
  FUN_10084930(this_00,iVar1 + iVar7,iVar5 - iVar8 / 2,(uint)*(ushort *)((int)this + 0x9c));
  iVar5 = *(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50);
  iVar1 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  iVar8 = *(int *)((int)this + 0xa4) + iVar5;
  *(int *)(*(int *)((int)this + 0x78) + 0x80) = *(int *)((int)this + 0xac) + iVar8;
  *(int *)(*(int *)((int)this + 0x78) + 0x7c) = *(int *)((int)this + 0xb8) + iVar1;
  (**(code **)(**(int **)((int)this + 0x78) + 4))(param_1,uVar3);
  *(int *)(*(int *)((int)this + 0x7c) + 0x80) = *(int *)((int)this + 0xb0) + iVar8;
  *(int *)(*(int *)((int)this + 0x7c) + 0x7c) = *(int *)((int)this + 0xbc) + iVar1;
  (**(code **)(**(int **)((int)this + 0x7c) + 4))(param_1);
  iVar4 = *(int *)((int)this + 0xac) + *(int *)(*(int *)((int)this + 0x78) + 0x58);
  iVar7 = *(int *)((int)this + 0xb0) + *(int *)(*(int *)((int)this + 0x7c) + 0x58);
  if (iVar7 + iVar8 < iVar4 + iVar8) {
    iVar7 = iVar4;
  }
  *(int *)(*(int *)((int)this + 0x80) + 0x80) = *(int *)((int)this + 0xb4) + iVar7 + iVar8;
  *(int *)(*(int *)((int)this + 0x80) + 0x7c) = iVar1;
  (**(code **)(**(int **)((int)this + 0x80) + 4))(param_1);
  piVar2 = *(int **)((int)this + 0x74);
  if ((void *)param_1 == this) {
    iVar7 = *(int *)((int)this + 0x54);
    iVar8 = *(int *)((int)this + 0x58);
    iVar4 = *(int *)((int)this + 0x5c);
    if ((piVar2[0x220] != 1) && (*piVar2 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*piVar2,local_48);
      piVar2[0x21c] = iVar5;
      piVar2[0x21d] = iVar7 + iVar1;
      piVar2[0x21f] = iVar4;
      piVar2[0x21e] = iVar8;
      CHncPen::~CHncPen(local_48);
    }
  }
  *(int *)((int)this + 0x48) = iVar5;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar1;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


