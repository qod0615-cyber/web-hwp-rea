// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 122704-122792
//==== 10090ff0 FUN_10090ff0

void __thiscall FUN_10090ff0(void *this,int *param_1,int param_2)

{
  int iVar1;
  int *piVar2;
  wchar_t *pwVar3;
  CHncFont *pCVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int unaff_ESI;
  int *piVar8;
  int iVar9;
  int unaff_EDI;
  int *piVar10;
  int aiStackY_478 [260];
  undefined4 uStackY_68;
  int iStack_48;
  int iStack_44;
  int iStack_28;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar9 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar9;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  iStack_44 = 0x1009102e;
  FUN_100883f0((int)this);
  iStack_44 = param_2;
  *(undefined4 *)(*(int *)((int)this + 0x80) + 8) = *(undefined4 *)((int)this + 8);
  piVar2 = (int *)(**(code **)(**(int **)((int)this + 0x80) + 8))();
  iVar9 = *piVar2;
  iVar1 = piVar2[1];
  *(undefined4 *)(*(int *)((int)this + 0x7c) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x7c) + 8))();
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  piVar2 = *(int **)((int)this + 0x74);
  pwVar3 = (wchar_t *)(piVar2 + 0x216);
  if (7 < (uint)piVar2[0x21b]) {
    pwVar3 = *(wchar_t **)pwVar3;
  }
  FUN_10084560(piVar2,*(int *)((int)this + 8),pwVar3);
  iStack_44 = 0xe10f;
  iVar7 = iVar9;
  if (*piVar2 != 0) {
    piVar10 = aiStackY_478;
    piVar8 = piVar2;
    for (iVar7 = 0x108; piVar8 = piVar8 + 1, iVar7 != 0; iVar7 = iVar7 + -1) {
      *piVar10 = *piVar8;
      piVar10 = piVar10 + 1;
    }
    pCVar4 = (CHncFont *)FUN_10084820((int)piVar2);
    pCVar4 = CHncDrawContext::SelectObject((CHncDrawContext *)*piVar2,pCVar4);
    uStackY_68 = 0x10091108;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*piVar2,(ushort *)&iStack_44,1,(tagSIZE *)&stack0xffffffc8);
    CHncDrawContext::SelectObject((CHncDrawContext *)*piVar2,pCVar4);
    iVar7 = unaff_EDI;
  }
  uStackY_68 = 0x10091126;
  iVar5 = MulDiv(0,0x14,100);
  *(undefined4 *)((int)this + 0x84) = 0;
  *(int *)((int)this + 0x88) = iVar5;
  uStackY_68 = 0x1009113f;
  iVar6 = MulDiv(*(int *)((int)this + 8),0x14,100);
  iVar5 = *(int *)((int)this + 0x88);
  if (iVar9 < iVar7) {
    iVar9 = iVar7;
  }
  iVar6 = iVar9 + *(int *)((int)this + 0x84) + iStack_28 + iVar6;
  iStack_48 = iVar5 + iVar1 + unaff_ESI;
  if (iStack_48 == iVar5) {
    iStack_48 = iStack_48 + *(int *)(*(int *)((int)this + 0x74) + 0x848);
  }
  *(int *)((int)this + 0x58) = iVar6;
  *(int *)((int)this + 0x5c) = iStack_48;
  *(int *)((int)this + 0x54) = -(iVar5 / 2) - iVar1;
  *param_1 = iVar6;
  param_1[1] = iStack_48;
  return;
}


