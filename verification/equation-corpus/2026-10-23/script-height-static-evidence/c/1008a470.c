// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 117621-117810
//==== 1008a470 FUN_1008a470

void __thiscall FUN_1008a470(void *this,int param_1)

{
  ushort *puVar1;
  int *this_00;
  int iVar2;
  int iVar3;
  int iVar4;
  tagPOINT tVar5;
  tagPOINT tVar6;
  tagPOINT tVar7;
  tagPOINT tVar8;
  tagPOINT tVar9;
  tagPOINT tVar10;
  tagPOINT tVar11;
  tagPOINT tVar12;
  tagPOINT tVar13;
  tagPOINT tVar14;
  tagPOINT tVar15;
  uint uVar16;
  wchar_t *pwVar17;
  int iVar18;
  int iVar19;
  CHncPen *this_01;
  int iVar20;
  int *piVar21;
  CHncPen local_7c [52];
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac154;
  local_10 = ExceptionList;
  uVar16 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  iVar18 = *(int *)((int)this + 0x7c);
  this_00 = *(int **)((int)this + 0x74);
  piVar21 = *(int **)(*(int *)((int)this + 0x8c) + 100);
  if (*(int *)((int)this + 0x94) == 0) {
    puVar1 = (ushort *)((int)this_00 + 0xe);
    *puVar1 = *puVar1 & 1;
    if (*puVar1 == 0) {
      this_00[0x214] = 1;
    }
  }
  local_14 = uVar16;
  if (piVar21 != *(int **)((int)this + 0x90)) {
    do {
      if (piVar21 == (int *)0x0) break;
      (**(code **)(*piVar21 + 4))(param_1,uVar16);
      piVar21 = (int *)piVar21[0x19];
    } while (piVar21 != *(int **)((int)this + 0x90));
    *(undefined4 *)((int)this + 0x48) = *(undefined4 *)((int)this + 0x80);
    *(int *)((int)this + 0x4c) = iVar18 + *(int *)((int)this + 0x54);
    if ((void *)param_1 == this) {
      iVar2 = ((tagPOINT *)((int)this + 0x48))->x;
      iVar3 = *(int *)((int)this + 0x4c);
      tVar6 = *(tagPOINT *)((int)this + 0x48);
      iVar18 = *(int *)((int)this + 0xa4);
      if ((this_00[0x220] == 1) || (*this_00 == 0)) goto LAB_1008a8ce;
      iVar19 = iVar2 + *(int *)((int)this + 0xa0);
      CHncPen::CHncPen(local_48);
      local_8 = 2;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_48);
      tVar9.y = iVar3;
      tVar9.x = iVar19;
      tVar12.y = iVar3 + iVar18;
      tVar12.x = iVar19;
      tVar15.y = iVar3 + iVar18;
      tVar15.x = iVar2;
      CHncDrawContext::DrawRectangle((CHncDrawContext *)*this_00,tVar6,tVar9,tVar12,tVar15,0);
      this_01 = local_48;
      this_00[0x21c] = iVar2;
      this_00[0x21d] = iVar3;
    }
    else {
      if (param_1 != *(int *)((int)this + 0x8c)) goto LAB_1008a8ce;
      iVar18 = *(int *)(param_1 + 100);
      iVar2 = *(int *)(iVar18 + 0x4c);
      iVar3 = *(int *)(iVar18 + 0x48);
      iVar18 = *(int *)(iVar18 + 0x5c);
      if ((this_00[0x220] == 1) || (*this_00 == 0)) goto LAB_1008a8ce;
      CHncPen::CHncPen(local_7c);
      local_8 = 3;
      CHncPen::SetLineStyle(local_7c,1);
      CHncPen::SetWidth(local_7c,1);
      CHncPen::SetColor(local_7c,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_7c);
      this_01 = local_7c;
      this_00[0x21d] = iVar2;
      this_00[0x21c] = iVar3;
    }
    this_00[0x21f] = iVar18;
    this_00[0x21e] = 1;
    local_8 = 0xffffffff;
    CHncPen::~CHncPen(this_01);
    goto LAB_1008a8ce;
  }
  if ((this_00[0x220] != 0) && (*(int *)((int)this + 0x98) == 0)) goto LAB_1008a8ce;
  pwVar17 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar17 = *(wchar_t **)pwVar17;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar17);
  iVar2 = this_00[0x213];
  iVar3 = this_00[0x212];
  if (param_1 == *(int *)((int)this + 0x8c)) {
    iVar19 = *(int *)((int)this + 0x80);
    iVar20 = iVar18 - iVar3 / 2;
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_48);
      tVar5.y = iVar20;
      tVar5.x = iVar19;
      tVar7.y = iVar20;
      tVar7.x = iVar2 + iVar19;
      tVar10.y = iVar20 + iVar3;
      tVar10.x = iVar2 + iVar19;
      tVar13.y = iVar20 + iVar3;
      tVar13.x = iVar19;
      CHncDrawContext::DrawRectangle((CHncDrawContext *)*this_00,tVar5,tVar7,tVar10,tVar13,0);
      this_00[0x21c] = iVar19;
      this_00[0x21d] = iVar20;
      this_00[0x21f] = iVar3;
      this_00[0x21e] = 1;
LAB_1008a6cf:
      local_8 = 0xffffffff;
      CHncPen::~CHncPen(local_48);
    }
    iVar19 = *(int *)((int)this + 0x80);
  }
  else {
    iVar19 = *(int *)((int)this + 0x80);
    iVar20 = iVar18 - iVar3 / 2;
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 1;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_48);
      tVar6.y = iVar20;
      tVar6.x = iVar19;
      tVar8.y = iVar20;
      tVar8.x = iVar2 + iVar19;
      tVar11.y = iVar3 + iVar20;
      tVar11.x = iVar2 + iVar19;
      tVar14.y = iVar3 + iVar20;
      tVar14.x = iVar19;
      CHncDrawContext::DrawRectangle((CHncDrawContext *)*this_00,tVar6,tVar8,tVar11,tVar14,0);
      goto LAB_1008a6cf;
    }
  }
  iVar4 = *(int *)((int)this + 0x8c);
  *(int *)(iVar4 + 0x48) = iVar19;
  *(int *)(iVar4 + 0x4c) = iVar20;
  iVar19 = *(int *)((int)this + 0x8c);
  *(int *)(iVar19 + 0x58) = iVar2;
  *(int *)(iVar19 + 0x5c) = iVar3;
  *(undefined4 *)((int)this + 0x48) = *(undefined4 *)((int)this + 0x80);
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar18;
LAB_1008a8ce:
  if (*(int *)((int)this + 0x98) != 0) {
    iVar18 = *(int *)(*(int *)((int)this + 0x98) + 0x54);
    iVar2 = *(int *)((int)this + 0xa4);
    iVar3 = *(int *)((int)this + 0x4c);
    iVar19 = MulDiv(*(int *)((int)this + 8),*(int *)((int)this + 0x84),100);
    *(int *)(*(int *)((int)this + 0x98) + 0x7c) = (iVar3 - iVar18) + iVar19 + iVar2;
    *(undefined4 *)(*(int *)((int)this + 0x98) + 0x80) = *(undefined4 *)((int)this + 0x80);
    (**(code **)(**(int **)((int)this + 0x98) + 4))(param_1);
  }
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


