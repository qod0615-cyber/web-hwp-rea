// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 134689-134763
//==== 1009fda0 FUN_1009fda0

void __thiscall FUN_1009fda0(void *this,int param_1)

{
  short sVar1;
  int *this_00;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  wchar_t *pwVar7;
  int iVar8;
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
  iVar8 = *(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50);
  *(int *)(*(int *)((int)this + 0x78) + 0x80) = iVar8;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 0x7c) =
       *(undefined4 *)(*(int *)((int)this + 0x68) + 0x7c);
  (**(code **)(**(int **)((int)this + 0x78) + 4))(param_1,local_14);
  uVar2 = *(undefined4 *)((int)this + 0x5c);
  iVar6 = *(int *)((int)this + 0x58);
  iVar3 = *(int *)(*(int *)(*(int *)((int)this + 0x78) + 0x8c) + 100);
  if ((*(int *)(iVar3 + 4) != 0x6f) ||
     ((sVar1 = *(short *)(iVar3 + 0x9c), sVar1 != -0x1fb9 && (sVar1 != -0x1f1b)))) {
    iVar6 = MulDiv(iVar6,0x78,100);
  }
  FUN_100844d0(this_00,uVar2,iVar6);
  FUN_10084930(this_00,iVar8,
               *(int *)((int)this + 0x54) + *(int *)(*(int *)((int)this + 0x68) + 0x7c),0xe054);
  pwVar7 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar7 = *(wchar_t **)pwVar7;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar7);
  if ((void *)param_1 == this) {
    iVar6 = *(int *)((int)this + 0x58);
    iVar3 = *(int *)((int)this + 0x5c);
    iVar4 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    iVar5 = *(int *)((int)this + 0x54);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_48);
      this_00[0x21d] = iVar5 + iVar4;
      this_00[0x21f] = iVar3;
      this_00[0x21c] = iVar8;
      this_00[0x21e] = iVar6;
      CHncPen::~CHncPen(local_48);
    }
  }
  iVar6 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = iVar8;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar6;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


