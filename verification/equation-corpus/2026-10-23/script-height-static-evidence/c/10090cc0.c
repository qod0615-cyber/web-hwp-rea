// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 122600-122704
//==== 10090cc0 FUN_10090cc0

void __thiscall FUN_10090cc0(void *this,int param_1)

{
  void *this_00;
  int iVar1;
  int *piVar2;
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
  puStack_c = &LAB_100ac529;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  this_00 = *(void **)((int)this + 0x74);
  pwVar7 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar7 = *(wchar_t **)((int)this_00 + 0x858);
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar7);
  iVar5 = *(int *)((int)this + 0x50);
  iVar4 = *(int *)(*(int *)((int)this + 0x68) + 0x80);
  iVar8 = *(int *)(*(int *)((int)this + 0x78) + 0x58);
  iVar3 = MulDiv(*(int *)((int)this + 0x84),10,100);
  iVar4 = iVar3 + iVar8 + iVar5 + iVar4;
  iVar8 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  iVar3 = *(int *)(*(int *)((int)this + 0x7c) + 0x5c);
  iVar1 = *(int *)((int)this + 0x54);
  iVar5 = MulDiv(*(int *)((int)this + 0x88),0xc,100);
  iVar6 = MulDiv(*(int *)((int)this + 0x84),0x1e,100);
  FUN_100844d0(this_00,*(int *)((int)this + 0x88) / 2 + *(int *)((int)this_00 + 0x848),
               *(undefined4 *)((int)this_00 + 0x84c));
  iVar5 = iVar5 + iVar3 + iVar1 + iVar8;
  FUN_10084930(this_00,iVar4,iVar5,0xe10f);
  iVar8 = *(int *)(*(int *)((int)this + 0x80) + 0x58);
  if (iVar8 <= *(int *)(*(int *)((int)this + 0x7c) + 0x58)) {
    iVar8 = *(int *)(*(int *)((int)this + 0x7c) + 0x58);
  }
  FUN_100844d0(this_00,*(undefined4 *)((int)this_00 + 0x848),(iVar6 + iVar8) / 2);
  FUN_10084930(this_00,(*(int *)((int)this + 0x84) - iVar6) + iVar4,iVar5,0xe110);
  pwVar7 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar7 = *(wchar_t **)pwVar7;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar7);
  iVar8 = *(int *)((int)this + 0x50) + *(int *)(*(int *)((int)this + 0x68) + 0x80);
  iVar3 = *(int *)((int)this + 0x84) + *(int *)(*(int *)((int)this + 0x78) + 0x58) + iVar8;
  iVar4 = (*(int *)(*(int *)((int)this + 0x80) + 0x58) - *(int *)(*(int *)((int)this + 0x7c) + 0x58)
          ) + iVar3;
  iVar5 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  if (iVar4 < iVar3) {
    iVar4 = iVar3;
  }
  *(int *)(*(int *)((int)this + 0x78) + 0x80) = iVar8;
  *(int *)(*(int *)((int)this + 0x78) + 0x7c) =
       (*(int *)((int)this + 0x88) / 2 - *(int *)(*(int *)((int)this + 0x78) + 0x54)) + iVar5;
  (**(code **)(**(int **)((int)this + 0x78) + 4))(param_1);
  *(int *)(*(int *)((int)this + 0x7c) + 0x80) = iVar4;
  iVar4 = *(int *)((int)this + 0x7c);
  *(int *)(iVar4 + 0x7c) =
       ((iVar5 - *(int *)((int)this + 0x88) / 2) - *(int *)(iVar4 + 0x5c)) - *(int *)(iVar4 + 0x54);
  (**(code **)(**(int **)((int)this + 0x7c) + 4))(param_1);
  *(int *)(*(int *)((int)this + 0x80) + 0x80) = iVar3;
  *(int *)(*(int *)((int)this + 0x80) + 0x7c) =
       (*(int *)((int)this + 0x88) / 2 - *(int *)(*(int *)((int)this + 0x80) + 0x54)) + iVar5;
  (**(code **)(**(int **)((int)this + 0x80) + 4))(param_1);
  piVar2 = *(int **)((int)this + 0x74);
  if ((void *)param_1 == this) {
    iVar4 = *(int *)((int)this + 0x54);
    iVar3 = *(int *)((int)this + 0x58);
    iVar1 = *(int *)((int)this + 0x5c);
    if ((piVar2[0x220] != 1) && (*piVar2 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*piVar2,local_48);
      piVar2[0x21c] = iVar8;
      piVar2[0x21d] = iVar4 + iVar5;
      piVar2[0x21f] = iVar1;
      piVar2[0x21e] = iVar3;
      CHncPen::~CHncPen(local_48);
    }
  }
  *(int *)((int)this + 0x48) = iVar8;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar5;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


