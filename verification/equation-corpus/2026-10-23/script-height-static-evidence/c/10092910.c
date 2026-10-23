// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 123982-124081
//==== 10092910 FUN_10092910

void __thiscall FUN_10092910(void *this,int param_1)

{
  int *this_00;
  int iVar1;
  tagPOINT tVar2;
  tagPOINT tVar3;
  tagPOINT tVar4;
  tagPOINT tVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  CHncPen local_7c [52];
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac302;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  iVar6 = *(int *)((int)this + 0x54);
  iVar7 = *(int *)((int)this + 0x80);
  iVar8 = *(int *)((int)this + 0x50) + *(int *)(*(int *)((int)this + 0x68) + 0x80);
  iVar9 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  if (iVar7 == 0) {
    *(int *)(*(int *)((int)this + 0x7c) + 0x7c) = iVar9;
  }
  else {
    *(int *)(iVar7 + 0xc) = iVar8;
    *(int *)(iVar7 + 8) = iVar6 + iVar9;
    FUN_100a1830(*(int **)((int)this + 0x80));
  }
  this_00 = *(int **)((int)this + 0x74);
  FUN_100844d0(this_00,*(undefined4 *)((int)this + 0x5c),*(undefined4 *)((int)this + 0x58));
  iVar6 = *(int *)(*(int *)(*(int *)((int)this + 0x7c) + 0x8c) + 100);
  if (*(int *)(iVar6 + 4) == 0x6f) {
    FUN_10084930(this_00,iVar8,
                 *(int *)((int)this + 0x54) + *(int *)(*(int *)((int)this + 0x68) + 0x7c),
                 (uint)*(ushort *)(iVar6 + 0x9c));
  }
  else {
    iVar6 = *(int *)((int)this + 0x54) + *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      iVar9 = iVar8 + *(int *)((int)this + 0x58);
      iVar7 = *(int *)((int)this + 0x5c) + iVar6;
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_48);
      tVar2.y = iVar6;
      tVar2.x = iVar8;
      tVar3.y = iVar6;
      tVar3.x = iVar9;
      tVar4.y = iVar7;
      tVar4.x = iVar9;
      tVar5.y = iVar7;
      tVar5.x = iVar8;
      CHncDrawContext::DrawRectangle((CHncDrawContext *)*this_00,tVar2,tVar3,tVar4,tVar5,0);
      local_8 = 0xffffffff;
      CHncPen::~CHncPen(local_48);
    }
  }
  if ((void *)param_1 == this) {
    iVar6 = *(int *)((int)this + 0x58);
    iVar7 = *(int *)((int)this + 0x5c);
    iVar9 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    iVar1 = *(int *)((int)this + 0x54);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_7c);
      local_8 = 1;
      CHncPen::SetLineStyle(local_7c,1);
      CHncPen::SetWidth(local_7c,1);
      CHncPen::SetColor(local_7c,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_7c);
      this_00[0x21d] = iVar1 + iVar9;
      this_00[0x21f] = iVar7;
      this_00[0x21c] = iVar8;
      this_00[0x21e] = iVar6;
      CHncPen::~CHncPen(local_7c);
    }
  }
  iVar6 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = iVar8;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar6;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


