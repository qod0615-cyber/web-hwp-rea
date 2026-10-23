// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 133669-133740
//==== 1009ea00 FUN_1009ea00

void __thiscall FUN_1009ea00(void *this,int *param_1,int param_2)

{
  int *this_00;
  wchar_t *pwVar1;
  CHncFont *pCVar2;
  int iVar3;
  int *piVar4;
  int *piVar5;
  int iVar6;
  int aiStackY_450 [260];
  undefined4 uStackY_40;
  ushort auStack_1c [2];
  int iStack_18;
  int iStack_14;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar3 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar3;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar1 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar1 = *(wchar_t **)pwVar1;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar1);
  iStack_18 = 0;
  iStack_14 = 0;
  auStack_1c[0] = 0xe065;
  auStack_1c[1] = 0;
  if (*this_00 != 0) {
    piVar5 = aiStackY_450;
    piVar4 = this_00;
    for (iVar3 = 0x108; piVar4 = piVar4 + 1, iVar3 != 0; iVar3 = iVar3 + -1) {
      *piVar5 = *piVar4;
      piVar5 = piVar5 + 1;
    }
    pCVar2 = (CHncFont *)FUN_10084820((int)this_00);
    pCVar2 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
    uStackY_40 = 0x1009eabf;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
  }
  uStackY_40 = 0x1009ead7;
  iVar3 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x80) = iStack_18;
  *(int *)((int)this + 0x84) = iVar3;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  iVar3 = *(int *)((int)this + 0x84);
  iVar6 = *(int *)((int)this + 0x80);
  if (*(int *)((int)this + 0x80) < iStack_18) {
    iVar6 = iStack_18;
  }
  iStack_14 = iVar3 / 3 + iVar3 + iStack_14;
  *(int *)((int)this + 0x54) = *(int *)(*(int *)((int)this + 0x78) + 0x54) - iVar3;
  *(int *)((int)this + 0x58) = iVar6;
  *(int *)((int)this + 0x5c) = iStack_14;
  *param_1 = iVar6;
  param_1[1] = iStack_14;
  return;
}


