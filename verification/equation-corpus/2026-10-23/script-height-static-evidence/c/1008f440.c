// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 121500-121597
//==== 1008f440 FUN_1008f440

void __thiscall FUN_1008f440(void *this,int *param_1,undefined4 *param_2)

{
  int iVar1;
  wchar_t *pwVar2;
  CHncFont *pCVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int *this_00;
  int *piVar8;
  int aiStackY_468 [260];
  undefined4 uStackY_58;
  undefined4 *puVar9;
  int iStack_28;
  int iStack_20;
  
  if ((param_2 != (undefined4 *)0x0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar1 = *(int *)((int)this + 0x58);
    param_1[1] = *(int *)((int)this + 0x5c);
    *param_1 = iVar1;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  iVar1 = MulDiv(*(int *)((int)this + 8),0x32,100);
  *(undefined4 *)(*(int *)((int)this + 0x7c) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x7c) + 8))();
  *(int *)(*(int *)((int)this + 0x78) + 8) = iVar1;
  this_00 = *(int **)((int)this + 0x74);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar2);
  if (*this_00 != 0) {
    piVar8 = aiStackY_468;
    for (iVar1 = 0x108; this_00 = this_00 + 1, iVar1 != 0; iVar1 = iVar1 + -1) {
      *piVar8 = *this_00;
      piVar8 = piVar8 + 1;
    }
    puVar9 = param_2;
    pCVar3 = (CHncFont *)FUN_10084820((int)param_2);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*param_2,pCVar3);
    uStackY_58 = 0x1008f53d;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*puVar9,(ushort *)&stack0xffffffcc,1,(tagSIZE *)&stack0xffffffd0);
    CHncDrawContext::SelectObject((CHncDrawContext *)*puVar9,pCVar3);
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x7c) + 0x5c);
  uStackY_58 = 0x1008f562;
  iVar4 = MulDiv(*(int *)((int)this + 8),10,100);
  iVar1 = ((iVar4 + iVar1) * 100) / 0;
  *(int *)((int)this + 0x80) = iVar1;
  if (iVar1 < 100) {
    *(undefined4 *)((int)this + 0x80) = 100;
    iVar1 = 100;
  }
  uStackY_58 = 0x1008f58e;
  iVar1 = MulDiv(0,iVar1,100);
  *(int *)((int)this + 0x88) = iVar1;
  *(int *)((int)this + 0x8c) = -iStack_28;
  if (iStack_28 < 1) {
    iStack_28 = 0;
  }
  *(int *)((int)this + 0x84) = iStack_28;
  uStackY_58 = 0x1008f5c5;
  iVar1 = MulDiv(*(int *)((int)this + 8),0x11,100);
  iVar5 = iVar1 + *(int *)((int)this + 0x84) + iStack_20;
  iVar1 = *(int *)(*(int *)((int)this + 0x7c) + 0x54);
  uStackY_58 = 0x1008f5e2;
  iVar6 = MulDiv(*(int *)((int)this + 8),10,100);
  iVar4 = *(int *)(*(int *)((int)this + 0x78) + 0x5c);
  uStackY_58 = 0x1008f5fa;
  iVar7 = MulDiv(*(int *)((int)this + 0x88),0x34,100);
  iVar4 = iVar4 - iVar7;
  *(int *)((int)this + 0x90) = iVar4;
  uStackY_58 = 0x1008f60b;
  iVar7 = MulDiv(*(int *)((int)this + 8),5,100);
  if (iVar4 <= iVar7) {
    uStackY_58 = 0x1008f618;
    iVar4 = MulDiv(*(int *)((int)this + 8),5,100);
  }
  iVar7 = *(int *)((int)this + 0x88) + iVar4;
  *(int *)((int)this + 0x54) = (iVar1 - iVar6) - iVar4;
  *(int *)((int)this + 0x58) = iVar5;
  *(int *)((int)this + 0x5c) = iVar7;
  param_1[1] = iVar7;
  *param_1 = iVar5;
  return;
}


