// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 131837-131955
//==== 1009c6a0 FUN_1009c6a0

void __thiscall FUN_1009c6a0(void *this,int param_1)

{
  undefined4 uVar1;
  int *this_00;
  tagPOINT tVar2;
  tagPOINT tVar3;
  tagPOINT tVar4;
  tagPOINT tVar5;
  uint uVar6;
  wchar_t *pwVar7;
  wchar_t *pwVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  int *piVar13;
  CHncBrush local_84 [4];
  int *local_80;
  CHncPen local_7c [52];
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100aceab;
  local_10 = ExceptionList;
  uVar6 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  local_80 = *(int **)((int)this + 0x74);
  pwVar7 = (wchar_t *)(local_80 + 0x216);
  pwVar8 = pwVar7;
  if (7 < (uint)local_80[0x21b]) {
    pwVar8 = *(wchar_t **)pwVar7;
  }
  local_14 = uVar6;
  FUN_10084560(local_80,*(int *)((int)this + 8),pwVar8);
  iVar10 = *(int *)(*(int *)((int)this + 0x68) + 0x7c) + *(int *)((int)this + 0x54);
  iVar9 = *(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50);
  pwVar8 = (wchar_t *)(local_80 + 0x216);
  if (*local_80 != 0) {
    iVar11 = iVar10 + *(int *)((int)this + 0x5c);
    iVar12 = *(int *)((int)this + 0x58) + iVar9;
    CHncPen::CHncPen(local_48);
    local_8 = 0;
    CHncPen::SetLineStyle(local_48,1);
    CHncPen::SetWidth(local_48,1);
    CHncPen::SetColor(local_48,0);
    CHncBrush::CHncBrush(local_84);
    local_8 = CONCAT31(local_8._1_3_,1);
    CHncBrush::CreateSolidBrush(local_84,0xffffff);
    CHncDrawContext::SelectObject((CHncDrawContext *)*local_80,local_48);
    CHncDrawContext::SelectObject((CHncDrawContext *)*local_80,local_84);
    tVar2.y = iVar10;
    tVar2.x = iVar9;
    tVar3.y = iVar10;
    tVar3.x = iVar12;
    tVar4.y = iVar11;
    tVar4.x = iVar12;
    tVar5.y = iVar11;
    tVar5.x = iVar9;
    CHncDrawContext::DrawRectangle((CHncDrawContext *)*local_80,tVar2,tVar3,tVar4,tVar5,0);
    CHncBrush::~CHncBrush(local_84);
    local_8 = 0xffffffff;
    CHncPen::~CHncPen(local_48);
    pwVar8 = pwVar7;
  }
  if (7 < *(uint *)(pwVar8 + 10)) {
    pwVar8 = *(wchar_t **)pwVar8;
  }
  FUN_10084560(local_80,*(int *)((int)this + 8),pwVar8);
  local_80 = (int *)(*(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50));
  uVar1 = *(undefined4 *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)(*(int *)((int)this + 0x78) + 0x80) =
       (*(int *)((int)this + 0x58) / 2 + (int)local_80) -
       *(int *)(*(int *)((int)this + 0x78) + 0x58) / 2;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 0x7c) = uVar1;
  (**(code **)(**(int **)((int)this + 0x78) + 4))(param_1,uVar6);
  this_00 = *(int **)((int)this + 0x74);
  pwVar7 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar7 = *(wchar_t **)pwVar7;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar7);
  piVar13 = local_80;
  if ((void *)param_1 == this) {
    iVar9 = *(int *)((int)this + 0x58);
    iVar10 = *(int *)((int)this + 0x5c);
    iVar11 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    iVar12 = *(int *)((int)this + 0x54);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_7c);
      local_8 = 2;
      CHncPen::SetLineStyle(local_7c,1);
      CHncPen::SetWidth(local_7c,1);
      CHncPen::SetColor(local_7c,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_7c);
      piVar13 = local_80;
      this_00[0x21d] = iVar12 + iVar11;
      this_00[0x21f] = iVar10;
      this_00[0x21c] = (int)local_80;
      this_00[0x21e] = iVar9;
      CHncPen::~CHncPen(local_7c);
    }
  }
  iVar9 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int **)((int)this + 0x48) = piVar13;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar9;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


