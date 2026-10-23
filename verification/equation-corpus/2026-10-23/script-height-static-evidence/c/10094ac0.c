// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 125655-125703
//==== 10094ac0 FUN_10094ac0

tagSIZE * __thiscall FUN_10094ac0(void *this,tagSIZE *param_1)

{
  int *piVar1;
  wchar_t *pwVar2;
  int iVar3;
  CHncFont *pCVar4;
  int *this_00;
  int *piVar5;
  int aiStackY_438 [260];
  undefined4 uStackY_28;
  ushort local_c [2];
  int *local_8;
  
  this_00 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  local_8 = this_00;
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar2);
  iVar3 = 0;
  local_c[0] = 0xe101;
  local_c[1] = 0;
  *(undefined4 *)param_1 = 0;
  *(undefined4 *)(param_1 + 4) = 0;
  if (*this_00 != 0) {
    piVar5 = aiStackY_438;
    for (iVar3 = 0x108; piVar1 = local_8, this_00 = this_00 + 1, iVar3 != 0; iVar3 = iVar3 + -1) {
      *piVar5 = *this_00;
      piVar5 = piVar5 + 1;
    }
    pCVar4 = (CHncFont *)FUN_10084820((int)local_8);
    pCVar4 = CHncDrawContext::SelectObject((CHncDrawContext *)*piVar1,pCVar4);
    uStackY_28 = 0x10094b43;
    CHncDrawContext::GetTextExtentPointW((CHncDrawContext *)*local_8,local_c,1,param_1);
    CHncDrawContext::SelectObject((CHncDrawContext *)*local_8,pCVar4);
    iVar3 = *(int *)(param_1 + 4);
  }
  uStackY_28 = 0x10094b59;
  iVar3 = MulDiv(iVar3,0x14,100);
  *(int *)(param_1 + 4) = iVar3;
  return param_1;
}


