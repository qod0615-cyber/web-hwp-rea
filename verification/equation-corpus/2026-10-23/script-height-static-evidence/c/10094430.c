// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 125341-125472
//==== 10094430 FUN_10094430

void __thiscall FUN_10094430(void *this,void *param_1)

{
  wchar_t *pwVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  int local_70;
  int local_6c;
  void *local_68;
  int local_64;
  int local_60;
  int local_5c;
  int *local_58;
  int *local_54;
  int local_50;
  int local_4c;
  CHncPen local_48 [52];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100acb89;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  local_68 = param_1;
  local_70 = *(int *)((int)this + 0x58);
  iVar3 = *(int *)((int)this + 0x50) + *(int *)(*(int *)((int)this + 0x68) + 0x80);
  local_5c = *(int *)(*(int *)((int)this + 0x68) + 0x7c) - *(int *)((int)this + 0x5c) / 2;
  local_60 = iVar3;
  FUN_10094720(this,&local_70,1);
  iVar5 = 0;
  if (0 < *(int *)((int)this + 0x78)) {
    do {
      iVar2 = *(int *)((int)this + 0x7c);
      local_50 = iVar3;
      local_4c = iVar3;
      if (1 < iVar2) {
        FUN_10094b70(this,iVar3,iVar5);
        iVar2 = *(int *)((int)this + 0x7c);
      }
      piVar4 = (int *)0x0;
      if (0 < iVar2) {
        do {
          local_54 = (int *)(iVar2 + -1);
          if ((piVar4 == local_54) &&
             (((iVar5 == *(int *)((int)this + 0x78) + -1 && (0 < iVar5)) ||
              ((*(int *)((int)this + 4) == 0x74 && ((iVar5 == 0 && (2 < iVar2)))))))) break;
          if ((iVar5 < *(int *)((int)this + 0x78)) && ((int)piVar4 < iVar2)) {
            local_58 = *(int **)(*(int *)((int)this + 0x90) + (int)(iVar2 * iVar5 + (int)piVar4) * 4
                                );
          }
          else {
            local_58 = (int *)0x0;
          }
          local_64 = local_58[0x16];
          local_6c = local_58[0x17];
          if ((iVar5 == *(int *)((int)this + 0x78) + -1) && (0 < iVar5)) {
            local_54 = (int *)(*(int *)((int)this + 0x84) + (int)piVar4 * 4);
            iVar3 = MulDiv(*(int *)((int)this + 8),0x14,100);
            local_4c = local_4c + iVar3 + *local_54;
            if (((*(int *)((int)this + 4) == 0x74) && (2 < *(int *)((int)this + 0x7c))) &&
               (piVar4 == (int *)(*(int *)((int)this + 0x7c) + -2))) {
              local_4c = local_4c + *(int *)((int)this + 0x94) / 2;
            }
            iVar3 = (local_54[1] - local_64) / 2 + local_4c;
          }
          else {
            if ((*(int *)((int)this + 4) == 0x74) && ((2 < iVar2 && (piVar4 == local_54)))) {
              local_50 = local_50 + *(int *)((int)this + 0x94) / 2;
            }
            iVar3 = (*(int *)(*(int *)((int)this + 0x84) + (int)piVar4 * 4) - local_64) / 2 +
                    local_50;
          }
          local_58[0x20] = iVar3;
          iVar3 = MulDiv(*(int *)((int)this + 8),0x14,100);
          local_50 = local_50 + iVar3 + *(int *)(*(int *)((int)this + 0x84) + (int)piVar4 * 4);
          local_58[0x1f] =
               ((*(int *)(*(int *)((int)this + 0x80) + iVar5 * 4) - local_6c) / 2 - local_58[0x15])
               + local_5c;
          (**(code **)(*local_58 + 4))(local_68);
          iVar2 = *(int *)((int)this + 0x7c);
          piVar4 = (int *)((int)piVar4 + 1);
        } while ((int)piVar4 < iVar2);
      }
      iVar3 = local_5c + *(int *)(*(int *)((int)this + 0x80) + iVar5 * 4);
      local_5c = MulDiv(*(int *)((int)this + 8),0xf,100);
      local_5c = iVar3 + local_5c;
      iVar5 = iVar5 + 1;
      iVar3 = local_60;
    } while (iVar5 < *(int *)((int)this + 0x78));
  }
  piVar4 = *(int **)((int)this + 0x74);
  pwVar1 = (wchar_t *)(piVar4 + 0x216);
  if (7 < (uint)piVar4[0x21b]) {
    pwVar1 = *(wchar_t **)pwVar1;
  }
  FUN_10084560(piVar4,*(int *)((int)this + 8),pwVar1);
  if (local_68 == this) {
    local_54 = *(int **)((int)this + 0x5c);
    iVar3 = *(int *)((int)this + 0x58);
    local_6c = *(int *)((int)this + 0x54) + *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    if ((piVar4[0x220] != 1) && (*piVar4 != 0)) {
      CHncPen::CHncPen(local_48);
      local_8 = 0;
      CHncPen::SetLineStyle(local_48,1);
      CHncPen::SetWidth(local_48,1);
      CHncPen::SetColor(local_48,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*piVar4,local_48);
      piVar4[0x21c] = local_60;
      piVar4[0x21d] = local_6c;
      piVar4[0x21f] = (int)local_54;
      piVar4[0x21e] = iVar3;
      CHncPen::~CHncPen(local_48);
    }
  }
  iVar3 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = local_60;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar3;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


