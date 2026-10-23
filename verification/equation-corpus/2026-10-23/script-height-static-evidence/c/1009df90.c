// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 133124-133195
//==== 1009df90 FUN_1009df90

void __thiscall FUN_1009df90(void *this,int *param_1,int param_2)

{
  int *this_00;
  int iVar1;
  wchar_t *pwVar2;
  CHncFont *pCVar3;
  int iVar4;
  int *piVar5;
  int *piVar6;
  int aiStackY_450 [260];
  undefined4 uStackY_40;
  ushort auStack_1c [2];
  int iStack_18;
  int iStack_14;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar4 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar4;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar2);
  iStack_18 = 0;
  iStack_14 = 0;
  auStack_1c[0] = 0xe063;
  auStack_1c[1] = 0;
  if (*this_00 != 0) {
    piVar6 = aiStackY_450;
    piVar5 = this_00;
    for (iVar4 = 0x108; piVar5 = piVar5 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar6 = *piVar5;
      piVar6 = piVar6 + 1;
    }
    pCVar3 = (CHncFont *)FUN_10084820((int)this_00);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
    uStackY_40 = 0x1009e04f;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
  }
  uStackY_40 = 0x1009e067;
  iVar4 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x80) = iStack_18;
  *(int *)((int)this + 0x84) = iVar4;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  iVar4 = *(int *)((int)this + 0x80);
  if (*(int *)((int)this + 0x80) < iStack_18) {
    iVar4 = iStack_18;
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x78) + 0x54);
  iStack_14 = iStack_14 + *(int *)((int)this + 0x84);
  *(int *)((int)this + 0x58) = iVar4;
  *(int *)((int)this + 0x5c) = iStack_14;
  *(int *)((int)this + 0x54) = iVar1 - *(int *)((int)this + 0x84);
  *param_1 = iVar4;
  param_1[1] = iStack_14;
  return;
}


