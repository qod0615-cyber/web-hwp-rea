// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 125472-125655
//==== 10094720 FUN_10094720

void __thiscall FUN_10094720(void *this,int *param_1,int param_2)

{
  uint uVar1;
  wchar_t *pwVar2;
  CHncFont *pCVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  int *piVar7;
  int *piVar8;
  int iVar9;
  int aiStackY_460 [260];
  undefined4 uStackY_50;
  uint uStack_30;
  int iStack_2c;
  int iStack_28;
  int iStack_24;
  int *local_20;
  int iStack_1c;
  int iStack_18;
  int iStack_14;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = *(int *)((int)this + 0x5c);
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  uStackY_50 = 0x10094771;
  memset(*(void **)((int)this + 0x84),0,*(int *)((int)this + 0x7c) << 2);
  *(undefined8 *)((int)this + 0x88) = 0;
  piVar4 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(piVar4 + 0x216);
  if (7 < (uint)piVar4[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  local_20 = piVar4;
  FUN_10084560(piVar4,*(int *)((int)this + 8),pwVar2);
  iStack_18 = 0;
  iStack_14 = 0;
  iStack_24 = 0xe101;
  if (*piVar4 != 0) {
    piVar7 = aiStackY_460;
    for (iVar5 = 0x108; piVar8 = local_20, piVar4 = piVar4 + 1, iVar5 != 0; iVar5 = iVar5 + -1) {
      *piVar7 = *piVar4;
      piVar7 = piVar7 + 1;
    }
    pCVar3 = (CHncFont *)FUN_10084820((int)local_20);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*piVar8,pCVar3);
    uStackY_50 = 0x100947fb;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*piVar8,(ushort *)&iStack_24,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*piVar8,pCVar3);
  }
  uStackY_50 = 0x10094813;
  iVar5 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x88) = iStack_18;
  *(int *)((int)this + 0x8c) = iVar5;
  if (*(int *)((int)this + 4) == 0x74) {
    piVar4 = *(int **)((int)this + 0x74);
    iStack_18 = 0;
    iStack_14 = 0;
    iStack_24 = 0x22ef;
    local_20 = piVar4;
    if (*piVar4 != 0) {
      piVar8 = aiStackY_460;
      piVar7 = piVar4;
      for (iVar5 = 0x108; piVar7 = piVar7 + 1, iVar5 != 0; iVar5 = iVar5 + -1) {
        *piVar8 = *piVar7;
        piVar8 = piVar8 + 1;
      }
      pCVar3 = (CHncFont *)FUN_10084820((int)piVar4);
      piVar4 = local_20;
      pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*local_20,pCVar3);
      uStackY_50 = 0x10094888;
      CHncDrawContext::GetTextExtentPointW
                ((CHncDrawContext *)*piVar4,(ushort *)&iStack_24,1,(tagSIZE *)&iStack_18);
      CHncDrawContext::SelectObject((CHncDrawContext *)*piVar4,pCVar3);
    }
    *(int *)((int)this + 0x94) = iStack_18;
    *(int *)((int)this + 0x98) = iStack_14;
    uStackY_50 = 0x100948b2;
    iVar5 = MulDiv(*(int *)((int)this + 8),0x14,100);
    *(int *)((int)this + 0x94) = *(int *)((int)this + 0x94) + iVar5;
  }
  iVar5 = *(int *)((int)this + 0x78);
  iVar9 = 0;
  iStack_24 = 0;
  iVar6 = 0;
  local_20 = (int *)0x0;
  if (0 < iVar5) {
    do {
      iStack_28 = 0;
      uStack_30 = 0;
      if (iVar9 == iVar5 + -1) {
        uStack_30 = (uint)(0 < iVar9);
      }
      iVar6 = 0;
      iStack_2c = 0;
      if (0 < *(int *)((int)this + 0x7c)) {
        do {
          uStackY_50 = 0x10094914;
          iStack_1c = MulDiv(*(int *)((int)this + 8),0x14,100);
          uVar1 = *(uint *)((int)this + 0x7c);
          iStack_1c = iVar6 + iStack_1c;
          iVar6 = iStack_1c;
          iStack_18 = iStack_1c;
          if (iStack_2c == uVar1 - 1) {
            if ((iVar9 == *(int *)((int)this + 0x78) + -1) && (0 < iVar9)) {
              iVar6 = **(int **)((int)this + 0x84) + iStack_1c;
              break;
            }
            if (((*(int *)((int)this + 4) == 0x74) && (iVar9 == 0)) && (2 < (int)uVar1)) break;
          }
          if (uStack_30 == uVar1) break;
          if ((iVar9 < *(int *)((int)this + 0x78)) && (iStack_2c < (int)uVar1)) {
            iVar5 = *(int *)(*(int *)((int)this + 0x90) + (uVar1 * iVar9 + iStack_2c) * 4);
          }
          else {
            iVar5 = 0;
          }
          *(undefined4 *)(iVar5 + 8) = *(undefined4 *)((int)this + 8);
          if ((iVar9 < *(int *)((int)this + 0x78)) && (iStack_2c < *(int *)((int)this + 0x7c))) {
            piVar4 = *(int **)(*(int *)((int)this + 0x90) +
                              (*(int *)((int)this + 0x7c) * iVar9 + iStack_2c) * 4);
          }
          else {
            piVar4 = (int *)0x0;
          }
          piVar4 = (int *)(**(code **)(*piVar4 + 8))();
          iVar5 = piVar4[1];
          if (piVar4[1] < iStack_28) {
            iVar5 = iStack_28;
          }
          piVar7 = (int *)(*(int *)((int)this + 0x84) + uStack_30 * 4);
          iVar6 = *piVar4;
          if (*piVar4 < *(int *)(*(int *)((int)this + 0x84) + uStack_30 * 4)) {
            iVar6 = *piVar7;
          }
          *piVar7 = iVar6;
          iVar6 = uStack_30 * 4;
          uStack_30 = uStack_30 + 1;
          iVar6 = *(int *)(*(int *)((int)this + 0x84) + iVar6) + iStack_1c;
          iStack_2c = iStack_2c + 1;
          iStack_28 = iVar5;
        } while (iStack_2c < *(int *)((int)this + 0x7c));
      }
      if (iVar6 < iStack_24) {
        iVar6 = iStack_24;
      }
      uStackY_50 = 0x10094a1e;
      iStack_24 = iVar6;
      iVar5 = MulDiv(*(int *)((int)this + 8),0xf,100);
      local_20 = (int *)((int)local_20 + iVar5 + iStack_28);
      *(int *)(*(int *)((int)this + 0x80) + iVar9 * 4) = iStack_28;
      iVar9 = iVar9 + 1;
      iVar5 = *(int *)((int)this + 0x78);
    } while (iVar9 < iVar5);
  }
  if (1 < *(int *)((int)this + 0x7c)) {
    **(int **)((int)this + 0x84) = **(int **)((int)this + 0x84) + *(int *)((int)this + 0x88);
    iVar6 = *(int *)((int)this + 0x88) + iVar6;
    iStack_24 = iVar6;
  }
  if (((*(int *)((int)this + 4) == 0x74) && (2 < *(int *)((int)this + 0x7c))) &&
     (1 < *(int *)((int)this + 0x78))) {
    piVar4 = (int *)(*(int *)((int)this + 0x84) + *(int *)((int)this + 0x7c) * 4 + -4);
    *piVar4 = *piVar4 + *(int *)((int)this + 0x94);
    iStack_24 = *(int *)((int)this + 0x94) + iVar6;
  }
  *(int **)((int)this + 0x5c) = local_20;
  *(int *)((int)this + 0x58) = iStack_24;
  *(int *)((int)this + 0x54) = -((int)local_20 / 2);
  *param_1 = iStack_24;
  param_1[1] = (int)local_20;
  return;
}


