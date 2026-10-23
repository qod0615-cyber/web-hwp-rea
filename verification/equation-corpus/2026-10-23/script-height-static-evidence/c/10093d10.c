// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 124943-125108
//==== 10093d10 FUN_10093d10

void __thiscall FUN_10093d10(void *this,int *param_1)

{
  int iVar1;
  wchar_t *pwVar2;
  int iVar3;
  int iVar4;
  undefined **ppuVar5;
  int iVar6;
  int iVar7;
  int *piVar8;
  int local_58;
  int local_50;
  int local_4c;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac559;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  if (*(undefined ***)this == &PTR_FUN_100bfa44) {
    iVar7 = *(int *)((int)this + 0x68);
    ppuVar5 = &PTR_FUN_100bfa44;
  }
  else {
    iVar7 = (*(code *)(*(undefined ***)this)[4])(local_14);
    ppuVar5 = *(undefined ***)this;
  }
  iVar7 = *(int *)(iVar7 + 0x80) + *(int *)((int)this + 0x50);
  if (ppuVar5 == &PTR_FUN_100bfa44) {
    iVar3 = *(int *)((int)this + 0x68);
  }
  else {
    iVar3 = (*(code *)ppuVar5[4])();
  }
  local_58 = *(int *)(iVar3 + 0x7c) - *(int *)((int)this + 0x5c) / 2;
  iVar3 = *(int *)((int)this + 0x98);
  *(int *)(iVar3 + 0xc) = iVar7;
  *(int *)(iVar3 + 8) = local_58;
  iVar3 = *(int *)((int)this + 0x9c);
  iVar4 = *(int *)((int)this + 0x58);
  iVar6 = *(int *)(iVar3 + 4);
  if (((iVar6 == 0x13) || (iVar6 == 4)) || (iVar6 == 0xc)) {
    iVar1 = (int)(*(int *)(iVar3 + 0x10) + (*(int *)(iVar3 + 0x10) >> 0x1f & 3U)) >> 2;
    iVar6 = *(int *)(iVar3 + 0x44);
    if (*(int *)(iVar3 + 0x44) <= iVar1) {
      iVar6 = iVar1;
    }
  }
  else {
    iVar6 = *(int *)(iVar3 + 0x44);
  }
  *(int *)(iVar3 + 8) = local_58;
  *(int *)(iVar3 + 0xc) = (iVar4 - iVar6) + iVar7;
  FUN_100a1830(*(int **)((int)this + 0x98));
  FUN_100a1830(*(int **)((int)this + 0x9c));
  iVar3 = *(int *)((int)this + 0x98);
  iVar4 = *(int *)(iVar3 + 4);
  if (((iVar4 == 0x13) || (iVar4 == 4)) || (iVar4 == 0xc)) {
    iVar6 = (int)(*(int *)(iVar3 + 0x10) + (*(int *)(iVar3 + 0x10) >> 0x1f & 3U)) >> 2;
    iVar4 = *(int *)(iVar3 + 0x44);
    if (*(int *)(iVar3 + 0x44) <= iVar6) {
      iVar4 = iVar6;
    }
  }
  else {
    iVar4 = *(int *)(iVar3 + 0x44);
  }
  local_50 = 0;
  if (0 < *(int *)((int)this + 0x78)) {
    do {
      iVar6 = 0;
      iVar3 = *(int *)((int)this + 0x7c);
      local_4c = iVar4 + iVar7;
      if (0 < iVar3) {
        do {
          if ((local_50 < *(int *)((int)this + 0x78)) && (iVar6 < iVar3)) {
            piVar8 = *(int **)(*(int *)((int)this + 0x90) + (iVar3 * local_50 + iVar6) * 4);
          }
          else {
            piVar8 = (int *)0x0;
          }
          iVar3 = piVar8[0x17];
          if (*(int *)((int)this + 0x94) == 1) {
            piVar8[0x20] = local_4c;
          }
          else {
            iVar1 = *(int *)(*(int *)((int)this + 0x84) + iVar6 * 4);
            if (*(int *)((int)this + 0x94) == 2) {
              iVar1 = iVar1 - piVar8[0x16];
            }
            else {
              iVar1 = (iVar1 - piVar8[0x16]) / 2;
            }
            piVar8[0x20] = iVar1 + local_4c;
          }
          iVar1 = MulDiv(*(int *)((int)this + 8),0x14,100);
          local_4c = local_4c + iVar1 + *(int *)(*(int *)((int)this + 0x84) + iVar6 * 4);
          piVar8[0x1f] = ((*(int *)(*(int *)((int)this + 0x80) + local_50 * 4) - iVar3) / 2 -
                         piVar8[0x15]) + local_58;
          (**(code **)(*piVar8 + 4))(param_1);
          iVar3 = *(int *)((int)this + 0x7c);
          iVar6 = iVar6 + 1;
        } while (iVar6 < iVar3);
      }
      iVar3 = *(int *)(*(int *)((int)this + 0x80) + local_50 * 4);
      iVar6 = MulDiv(*(int *)((int)this + 8),0xf,100);
      local_50 = local_50 + 1;
      local_58 = local_58 + iVar3 + iVar6;
    } while (local_50 < *(int *)((int)this + 0x78));
  }
  piVar8 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(piVar8 + 0x216);
  if (7 < (uint)piVar8[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10084560(piVar8,*(int *)((int)this + 8),pwVar2);
  if (param_1 == this) {
    if (*(undefined ***)this == &PTR_FUN_100bfa44) {
      iVar3 = *(int *)((int)this + 0x68);
    }
    else {
      iVar3 = (*(code *)(*(undefined ***)this)[4])();
    }
    iVar3 = *(int *)(iVar3 + 0x7c);
    iVar4 = *(int *)((int)this + 0x54);
    iVar6 = *(int *)((int)this + 0x5c);
    iVar1 = *(int *)((int)this + 0x58);
    if ((piVar8[0x220] != 1) && (*piVar8 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*piVar8,local_48);
      piVar8[0x21c] = iVar7;
      piVar8[0x21d] = iVar3 + iVar4;
      piVar8[0x21f] = iVar6;
      piVar8[0x21e] = iVar1;
      local_8 = 0xffffffff;
      CHncPen::~CHncPen(local_48);
    }
  }
  if (*(undefined ***)this == &PTR_FUN_100bfa44) {
    iVar3 = *(int *)((int)this + 0x68);
  }
  else {
    iVar3 = (*(code *)(*(undefined ***)this)[4])();
  }
  iVar3 = *(int *)(iVar3 + 0x7c);
  *(int *)((int)this + 0x48) = iVar7;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar3;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


