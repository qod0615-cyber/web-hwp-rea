// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 121181-121299
//==== 1008ee80 FUN_1008ee80

undefined4 * __thiscall FUN_1008ee80(void *this,undefined4 *param_1)

{
  int *this_00;
  code *pcVar1;
  ushort uVar2;
  int iVar3;
  wchar_t *pwVar4;
  undefined4 uVar5;
  int *piVar6;
  int *piVar7;
  int aiStackY_450 [258];
  undefined4 uStackY_48;
  undefined4 uStackY_44;
  undefined4 *puStackY_40;
  undefined4 local_18;
  code *local_14;
  code *local_10;
  int *local_c;
  
  this_00 = *(int **)((int)this + 0x74);
  uVar2 = *(ushort *)((int)this_00 + 0xe) & 1;
  *(ushort *)((int)this_00 + 0xe) = uVar2;
  if (uVar2 != 0) {
    this_00[0x214] = 0;
  }
  puStackY_40 = (undefined4 *)0x1008eec0;
  iVar3 = MulDiv(*(int *)((int)this + 8),*(int *)((int)this + 0x84),100);
  pwVar4 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar4 = *(wchar_t **)pwVar4;
  }
  FUN_10084560(this_00,iVar3,pwVar4);
  local_c = this_00 + 1;
  local_14 = GetTextExtentPointW_exref;
  local_10 = SelectObject_exref;
  if (*(int *)((int)this + 0x80) == 1) {
    local_18 = 0x4c;
  }
  else {
    local_18 = 0x6c;
  }
  if (*this_00 != 0) {
    piVar6 = local_c;
    piVar7 = aiStackY_450;
    for (iVar3 = 0x108; iVar3 != 0; iVar3 = iVar3 + -1) {
      *piVar7 = *piVar6;
      piVar6 = piVar6 + 1;
      piVar7 = piVar7 + 1;
    }
    FUN_10084820((int)this_00);
    pcVar1 = local_10;
    uVar5 = (*local_10)();
    puStackY_40 = &local_18;
    uStackY_44 = 0x1008ef4f;
    (*local_14)();
    uStackY_48 = 0x1008ef54;
    uStackY_44 = uVar5;
    (*pcVar1)();
  }
  *param_1 = 0;
  param_1[1] = 0;
  local_18 = 0x69;
  if (*this_00 == 0) {
    iVar3 = 0;
  }
  else {
    local_c = this_00 + 1;
    piVar6 = local_c;
    piVar7 = aiStackY_450;
    for (iVar3 = 0x108; iVar3 != 0; iVar3 = iVar3 + -1) {
      *piVar7 = *piVar6;
      piVar6 = piVar6 + 1;
      piVar7 = piVar7 + 1;
    }
    FUN_10084820((int)this_00);
    pcVar1 = local_10;
    uVar5 = (*local_10)();
    puStackY_40 = &local_18;
    uStackY_44 = 0x1008efbd;
    (*local_14)();
    uStackY_48 = 0x1008efc2;
    uStackY_44 = uVar5;
    (*pcVar1)();
    iVar3 = *this_00;
  }
  uVar5 = *param_1;
  local_18 = 0x6d;
  *param_1 = uVar5;
  if (iVar3 != 0) {
    piVar6 = local_c;
    piVar7 = aiStackY_450;
    for (iVar3 = 0x108; iVar3 != 0; iVar3 = iVar3 + -1) {
      *piVar7 = *piVar6;
      piVar6 = piVar6 + 1;
      piVar7 = piVar7 + 1;
    }
    FUN_10084820((int)this_00);
    pcVar1 = local_10;
    uVar5 = (*local_10)();
    puStackY_40 = &local_18;
    uStackY_44 = 0x1008f01b;
    (*local_14)();
    uStackY_48 = 0x1008f020;
    uStackY_44 = uVar5;
    (*pcVar1)();
    uVar5 = *param_1;
  }
  *param_1 = uVar5;
  if (uVar2 != 0) {
    this_00[0x214] = 1;
  }
  return param_1;
}


