// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 118164-118372
//==== 1008afa0 FUN_1008afa0

void __thiscall FUN_1008afa0(void *this,int *param_1)

{
  uint uVar1;
  short sVar2;
  ushort uVar3;
  int *this_00;
  int iVar4;
  tagPOINT tVar5;
  tagPOINT tVar6;
  tagPOINT tVar7;
  tagPOINT tVar8;
  tagPOINT tVar9;
  tagPOINT tVar10;
  ushort uVar11;
  wchar_t *pwVar12;
  int iVar13;
  undefined **ppuVar14;
  int iVar15;
  ushort *in_stack_ffffff20;
  HNCDR_LINESTYLE HVar16;
  CHncBrush local_b0 [4];
  CHncBrush local_ac [4];
  int local_a8;
  ushort *local_a4;
  uint local_a0;
  int local_9c;
  undefined4 *local_98;
  CHncPen local_94 [52];
  CHncPen local_60 [52];
  ushort local_2c;
  short local_2a;
  undefined2 local_28;
  undefined4 local_1c;
  undefined4 local_18;
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac1f5;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  this_00 = *(int **)((int)this + 0x74);
  iVar4 = *(int *)((int)this + 0x40);
  if (*(int *)((int)this + 0x94) != 0) {
    this_00[0x214] = 0;
  }
  pwVar12 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar12 = *(wchar_t **)pwVar12;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar12);
  if (*(undefined ***)this == &PTR_FUN_100bf4f4) {
    iVar15 = *(int *)((int)this + 0x68);
    ppuVar14 = &PTR_FUN_100bf4f4;
  }
  else {
    iVar15 = (*(code *)(*(undefined ***)this)[4])();
    ppuVar14 = *(undefined ***)this;
  }
  iVar15 = *(int *)(iVar15 + 0x80) + *(int *)((int)this + 0x50);
  local_9c = iVar15;
  if (ppuVar14 == &PTR_FUN_100bf4f4) {
    iVar13 = *(int *)((int)this + 0x68);
  }
  else {
    iVar13 = (*(code *)ppuVar14[4])();
  }
  local_a4 = (ushort *)(*(int *)((int)this + 0x54) + *(int *)(iVar13 + 0x7c));
  sVar2 = *(short *)((int)this + 0x9c);
  if (((sVar2 == 0x20) || (sVar2 == 0x7e)) || (sVar2 == 0x60)) goto LAB_1008b34c;
  local_a8 = *(int *)((int)this + 0xa0);
  if (local_a8 != 0) {
    if ((this_00[0x220] == 1) || (*this_00 == 0)) goto LAB_1008b215;
    local_98 = (undefined4 *)(*(int *)((int)this + 0x58) + iVar15);
    local_a0 = *(int *)((int)this + 0x5c) + (int)local_a4;
    CHncPen::CHncPen(local_60);
    local_8 = 0;
    CHncBrush::CHncBrush(local_b0);
    local_8._0_1_ = 1;
    CHncBrush::CHncBrush(local_ac);
    local_8 = CONCAT31(local_8._1_3_,2);
    CHncPen::SetWidth(local_60,1);
    switch(local_a8) {
    case 1:
    case 4:
      HVar16 = 3;
      break;
    case 2:
    case 3:
      HVar16 = 1;
      break;
    default:
      goto switchD_1008b0f8_default;
    }
    CHncPen::SetLineStyle(local_60,HVar16);
switchD_1008b0f8_default:
    CHncPen::SetColor(local_60,0xff0000);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_60);
    iVar15 = local_9c;
    if (0 < local_a8) {
      tVar8.y = local_a0;
      tVar8.x = (LONG)local_98;
      tVar10.y = local_a0;
      tVar10.x = local_9c;
      CHncDrawContext::DrawLine((CHncDrawContext *)*this_00,tVar8,tVar10);
    }
    if ((local_a8 == 2) || (local_a8 == 4)) {
      CHncPen::SetLineStyle(local_60,3);
      CHncPen::SetColor(local_60,0xffff00);
      CHncBrush::CreateSolidBrush(local_b0,0xffff00);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_60);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_b0);
      tVar5.y = (LONG)local_a4;
      tVar5.x = iVar15;
      tVar6.y = (LONG)local_a4;
      tVar6.x = (LONG)local_98;
      tVar7.y = local_a0;
      tVar7.x = (LONG)local_98;
      tVar9.y = local_a0;
      tVar9.x = iVar15;
      in_stack_ffffff20 = local_a4;
      CHncDrawContext::DrawRectangle((CHncDrawContext *)*this_00,tVar5,tVar6,tVar7,tVar9,0);
    }
    CHncBrush::CreateSolidBrush(local_ac,0xffffff);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_ac);
    CHncBrush::~CHncBrush(local_ac);
    CHncBrush::~CHncBrush(local_b0);
    local_8 = 0xffffffff;
    CHncPen::~CHncPen(local_60);
  }
LAB_1008b215:
  iVar15 = local_9c;
  if (*(int *)((int)this + 0x78) == 0) {
    uVar3 = *(ushort *)((int)this + 0x9c);
    uVar1 = uVar3 + 0x2800;
    local_a0 = uVar1 & 0xffff;
    local_98 = (undefined4 *)0x3ff;
    uVar11 = (ushort)uVar1;
    if (uVar11 < 0x400) {
      sVar2 = *(short *)(*(int *)((int)this + 100) + 0x9c);
      if ((uVar11 < 0x400) && ((ushort)(sVar2 + 0x2400U) < 0x400)) {
        local_18 = 7;
        local_8 = 3;
        local_28 = 0;
        local_1c = 2;
        local_2c = uVar3;
        local_2a = sVar2;
        FUN_10043d00(&stack0xffffff20,(undefined4 *)&local_2c);
        FUN_10084cf0(this_00,iVar15,(int)local_a4,in_stack_ffffff20);
        local_8 = 0xffffffff;
        FUN_10005c10((int *)&local_2c);
      }
    }
    else if (0x3ff < (ushort)(uVar3 + 0x2400)) {
      FUN_10084930(this_00,local_9c,(int)local_a4,(uint)uVar3);
    }
  }
  else {
    local_a0 = 1;
    if (1 < *(int *)((int)this + 0x8c)) {
      do {
        local_98 = (undefined4 *)((int)this + 0x7c);
        if (7 < *(uint *)((int)this + 0x90)) {
          local_98 = *(undefined4 **)((int)this + 0x7c);
        }
        FUN_10084930(this_00,local_9c + *(int *)((int)this + 0x58),(int)local_a4,
                     (uint)*(ushort *)((int)local_98 + local_a0 * 2));
        local_a0 = local_a0 + 1;
      } while ((int)local_a0 < *(int *)((int)this + 0x8c));
    }
  }
LAB_1008b34c:
  iVar15 = local_9c;
  if (param_1 == this) {
    local_a0 = *(uint *)((int)this + 0x58);
    local_98 = *(undefined4 **)((int)this + 0x5c);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_94);
      local_8 = 4;
      CHncPen::SetLineStyle(local_94,1);
      CHncPen::SetWidth(local_94,1);
      CHncPen::SetColor(local_94,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_94);
      iVar15 = local_9c;
      this_00[0x21d] = (int)local_a4;
      this_00[0x21f] = (int)local_98;
      this_00[0x21c] = local_9c;
      this_00[0x21e] = local_a0;
      CHncPen::~CHncPen(local_94);
    }
  }
  if (*(int *)((int)this + 0x94) != 0) {
    this_00[0x214] = (uint)(iVar4 == 0);
  }
  *(ushort **)((int)this + 0x4c) = local_a4;
  *(int *)((int)this + 0x48) = iVar15;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


