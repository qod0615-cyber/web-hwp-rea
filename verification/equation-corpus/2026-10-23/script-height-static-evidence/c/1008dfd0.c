// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 120422-120557
//==== 1008dfd0 FUN_1008dfd0

void __thiscall FUN_1008dfd0(void *this,int *param_1)

{
  int *this_00;
  int iVar1;
  int iVar2;
  bool bVar3;
  bool bVar4;
  bool bVar5;
  ushort ****ppppuVar6;
  wchar_t *pwVar7;
  int iVar8;
  undefined **ppuVar9;
  int iVar10;
  int local_7c;
  CHncPen local_78 [52];
  ushort ***local_44 [5];
  uint local_30;
  ushort ***local_2c [5];
  uint local_18;
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac668;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  bVar4 = false;
  bVar3 = false;
  this_00 = *(int **)((int)this + 0x74);
  if ((*(int *)((int)this + 0x8c) != 0) && (*(int *)(*(int *)((int)this + 0x60) + 4) == 0x6f)) {
    FUN_10043d00(local_44,(undefined4 *)(*(int *)((int)this + 0x60) + 0x24));
    local_8 = 0;
    bVar4 = true;
    bVar3 = false;
    ppppuVar6 = local_44;
    if (7 < local_30) {
      ppppuVar6 = (ushort ****)local_44[0];
    }
    if (0x40 < *(ushort *)ppppuVar6) {
      FUN_10043d00(local_2c,(undefined4 *)(*(int *)((int)this + 0x60) + 0x24));
      bVar4 = true;
      bVar3 = true;
      bVar5 = true;
      ppppuVar6 = local_2c;
      if (7 < local_18) {
        ppppuVar6 = (ushort ****)local_2c[0];
      }
      if (*(ushort *)ppppuVar6 < 0x5b) goto LAB_1008e07d;
    }
  }
  bVar5 = false;
LAB_1008e07d:
  if (bVar3) {
    FUN_10005c10((int *)local_2c);
  }
  local_8 = 0xffffffff;
  if (bVar4) {
    FUN_10005c10((int *)local_44);
  }
  if (bVar5) {
    local_7c = MulDiv(this_00[0x212],0xf,100);
  }
  else {
    local_7c = 0;
  }
  if (*(undefined ***)this == &PTR_FUN_100bf7d8) {
    iVar10 = *(int *)((int)this + 0x68);
    ppuVar9 = &PTR_FUN_100bf7d8;
  }
  else {
    iVar10 = (*(code *)(*(undefined ***)this)[4])();
    ppuVar9 = *(undefined ***)this;
  }
  iVar10 = *(int *)(iVar10 + 0x80) + *(int *)((int)this + 0x50);
  if (ppuVar9 == &PTR_FUN_100bf7d8) {
    iVar8 = *(int *)((int)this + 0x68);
  }
  else {
    iVar8 = (*(code *)ppuVar9[4])();
  }
  iVar8 = *(int *)(iVar8 + 0x7c);
  pwVar7 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar7 = *(wchar_t **)pwVar7;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar7);
  if (*(int *)((int)this + 0x88) != 0) {
    *(int *)(*(int *)((int)this + 0x78) + 0x80) = iVar10;
    *(int *)(*(int *)((int)this + 0x78) + 0x7c) = *(int *)((int)this + 0x80) + iVar8;
    (**(code **)(**(int **)((int)this + 0x78) + 4))(param_1);
  }
  if (*(int *)((int)this + 0x8c) != 0) {
    *(int *)(*(int *)((int)this + 0x7c) + 0x80) = local_7c + iVar10;
    *(int *)(*(int *)((int)this + 0x7c) + 0x7c) = *(int *)((int)this + 0x84) + iVar8;
    (**(code **)(**(int **)((int)this + 0x7c) + 4))(param_1);
  }
  if (*(undefined ***)this == &PTR_FUN_100bf7d8) {
    iVar8 = *(int *)((int)this + 0x68);
  }
  else {
    iVar8 = (*(code *)(*(undefined ***)this)[4])();
  }
  iVar8 = *(int *)(iVar8 + 0x7c);
  *(int *)((int)this + 0x48) = iVar10;
  *(int *)((int)this + 0x4c) = iVar8 + *(int *)((int)this + 0x54);
  if (param_1 == this) {
    iVar8 = *(int *)((int)this + 0x4c);
    iVar1 = *(int *)((int)this + 0x58);
    iVar2 = *(int *)((int)this + 0x5c);
    if ((this_00[0x220] != 1) && (*this_00 != 0)) {
      CHncPen::CHncPen(local_78);
      local_8 = 1;
      CHncPen::SetLineStyle(local_78,1);
      CHncPen::SetWidth(local_78,1);
      CHncPen::SetColor(local_78,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,local_78);
      this_00[0x21c] = iVar10;
      this_00[0x21d] = iVar8;
      this_00[0x21f] = iVar2;
      this_00[0x21e] = iVar1;
      CHncPen::~CHncPen(local_78);
    }
  }
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


