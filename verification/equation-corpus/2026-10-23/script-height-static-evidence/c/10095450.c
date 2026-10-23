// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 126185-126331
//==== 10095450 FUN_10095450

void __thiscall FUN_10095450(void *this,int *param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  wchar_t *pwVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int *piVar9;
  int local_60;
  int local_54;
  int local_50;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac819;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  iVar4 = *(int *)this;
  if (*(code **)(iVar4 + 0x10) == (code *)&LAB_100852d0) {
    iVar7 = *(int *)((int)this + 0x68);
  }
  else {
    iVar7 = (**(code **)(iVar4 + 0x10))(local_14);
    iVar4 = *(int *)this;
  }
  iVar7 = *(int *)(iVar7 + 0x80) + *(int *)((int)this + 0x50);
  if (*(code **)(iVar4 + 0x10) == (code *)&LAB_100852d0) {
    iVar4 = *(int *)((int)this + 0x68);
  }
  else {
    iVar4 = (**(code **)(iVar4 + 0x10))();
  }
  iVar4 = *(int *)(iVar4 + 0x7c);
  iVar1 = *(int *)((int)this + 0x5c);
  piVar9 = *(int **)((int)this + 0x6c);
  local_54 = 0;
  local_60 = 0;
  iVar2 = *(int *)((int)this + 4);
  if (0 < *(int *)((int)this + 0x78)) {
    do {
      iVar8 = 0;
      local_50 = 0;
      if (0 < *(int *)((int)this + 0x7c)) {
        iVar6 = *(int *)((int)this + 0x84);
        do {
          if (iVar2 == 0x11) {
            piVar9[0x20] = iVar7 + local_50;
          }
          else {
            iVar6 = *(int *)(iVar6 + iVar8 * 4);
            if (iVar2 == 0x12) {
              piVar9[0x20] = (iVar6 - piVar9[0x16]) + local_50 + iVar7;
            }
            else {
              piVar9[0x20] = (iVar6 / 2 - piVar9[0x16] / 2) + local_50 + iVar7;
            }
          }
          piVar9[0x1f] = (local_54 - piVar9[0x15]) + (iVar4 - iVar1 / 2);
          (**(code **)(*piVar9 + 4))(param_1);
          iVar6 = *(int *)((int)this + 0x84);
          iVar3 = MulDiv(*(int *)((int)this + 8),0x14,100);
          piVar9 = (int *)piVar9[0x19];
          local_50 = local_50 + iVar3 + *(int *)(iVar6 + iVar8 * 4);
        } while ((piVar9 != (int *)0x0) && (iVar8 = iVar8 + 1, iVar8 < *(int *)((int)this + 0x7c)));
      }
      iVar8 = MulDiv(*(int *)((int)this + 8),0xf,100);
      local_54 = local_54 + iVar8 + *(int *)(*(int *)((int)this + 0x80) + local_60 * 4);
    } while ((piVar9 != (int *)0x0) &&
            (local_60 = local_60 + 1, local_60 < *(int *)((int)this + 0x78)));
  }
  piVar9 = *(int **)((int)this + 0x74);
  pwVar5 = (wchar_t *)(piVar9 + 0x216);
  iVar4 = *(int *)((int)this + 8);
  if (7 < (uint)piVar9[0x21b]) {
    pwVar5 = *(wchar_t **)pwVar5;
  }
  piVar9[0xe3] = iVar4;
  piVar9[0xbe] = iVar4;
  piVar9[0x99] = iVar4;
  piVar9[0x74] = iVar4;
  piVar9[0x4f] = iVar4;
  piVar9[0x2a] = iVar4;
  piVar9[5] = iVar4;
  piVar9[0x212] = iVar4;
  iVar4 = iVar4 / 2;
  piVar9[0xe5] = iVar4;
  piVar9[0xc0] = iVar4;
  piVar9[0x9b] = iVar4;
  piVar9[0x76] = iVar4;
  piVar9[0x51] = iVar4;
  piVar9[0x2c] = iVar4;
  piVar9[7] = iVar4;
  piVar9[0x213] = iVar4;
  FUN_10084770(piVar9,(int)(piVar9 + 1),pwVar5);
  if (param_1 == this) {
    if (*(code **)(*(int *)this + 0x10) == (code *)&LAB_100852d0) {
      iVar4 = *(int *)((int)this + 0x68);
    }
    else {
      iVar4 = (**(code **)(*(int *)this + 0x10))();
    }
    iVar4 = *(int *)(iVar4 + 0x7c);
    iVar1 = *(int *)((int)this + 0x58);
    iVar2 = *(int *)((int)this + 0x54);
    iVar8 = *(int *)((int)this + 0x5c);
    if ((piVar9[0x220] != 1) && (*piVar9 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*piVar9,local_48);
      piVar9[0x21d] = iVar4 + iVar2;
      piVar9[0x21f] = iVar8;
      piVar9[0x21c] = iVar7;
      piVar9[0x21e] = iVar1;
      local_8 = 0xffffffff;
      CHncPen::~CHncPen(local_48);
    }
  }
  if (*(code **)(*(int *)this + 0x10) == (code *)&LAB_100852d0) {
    iVar4 = *(int *)((int)this + 0x68);
  }
  else {
    iVar4 = (**(code **)(*(int *)this + 0x10))();
  }
  iVar4 = *(int *)(iVar4 + 0x7c);
  *(int *)((int)this + 0x48) = iVar7;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar4;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


