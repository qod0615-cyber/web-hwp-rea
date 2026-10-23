// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 131955-132033
//==== 1009c970 FUN_1009c970

void __thiscall FUN_1009c970(void *this,int *param_1,int param_2)

{
  int *this_00;
  wchar_t *pwVar1;
  CHncFont *pCVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int unaff_EBX;
  int *piVar6;
  int iVar7;
  int *piVar8;
  int iVar9;
  int aiStackY_450 [258];
  undefined4 uStackY_48;
  ushort auStack_1c [2];
  int iStack_18;
  int iStack_14;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar5 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar5;
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
  auStack_1c[0] = 0xe06d;
  auStack_1c[1] = 0;
  if (*this_00 != 0) {
    piVar8 = aiStackY_450;
    piVar6 = this_00;
    for (iVar5 = 0x108; piVar6 = piVar6 + 1, iVar5 != 0; iVar5 = iVar5 + -1) {
      *piVar8 = *piVar6;
      piVar8 = piVar8 + 1;
    }
    pCVar2 = (CHncFont *)FUN_10084820((int)this_00);
    pCVar2 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
  }
  iVar5 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x80) = iStack_18;
  *(int *)((int)this + 0x84) = iVar5;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  iVar5 = *(int *)((int)this + 0x80);
  iVar7 = iVar5;
  if (iVar5 < iStack_18) {
    iVar7 = iStack_18;
  }
  uStackY_48 = 0x1009ca7f;
  iVar3 = MulDiv(iVar5,0x14,100);
  iVar9 = *(int *)((int)this + 0x84) + iStack_14;
  iVar5 = *(int *)(*(int *)(unaff_EBX + 0x78) + 0x54);
  uStackY_48 = 0x1009caa6;
  iVar4 = MulDiv(*(int *)(unaff_EBX + 0x80),0xf,100);
  *(int *)(unaff_EBX + 0x54) = iVar5 - iVar4;
  *(int *)(unaff_EBX + 0x58) = iVar7 + iVar3;
  *(int *)(unaff_EBX + 0x5c) = iVar9;
  param_1[1] = iVar9;
  *param_1 = iVar7 + iVar3;
  return;
}


