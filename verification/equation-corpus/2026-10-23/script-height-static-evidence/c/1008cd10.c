// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 119554-119612
//==== 1008cd10 FUN_1008cd10

void __thiscall FUN_1008cd10(void *this,undefined4 *param_1,int param_2)

{
  undefined4 uVar1;
  void *pvVar2;
  int iVar3;
  int iVar4;
  void *pvVar5;
  wchar_t *pwVar6;
  void *this_00;
  void *pvStack_20;
  int iStack_1c;
  undefined1 auStack_10 [12];
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    uVar1 = *(undefined4 *)((int)this + 0x5c);
    *param_1 = *(undefined4 *)((int)this + 0x58);
    param_1[1] = uVar1;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  iVar3 = MulDiv(*(int *)((int)this + 8),0x44,100);
  this_00 = *(void **)((int)this + 0x74);
  iVar4 = MulDiv(*(int *)((int)this + 8),*(int *)((int)this + 0x9c),100);
  pwVar6 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar6 = *(wchar_t **)pwVar6;
  }
  FUN_10084560(this_00,iVar4,pwVar6);
  FUN_100851d0(this_00,(tagSIZE *)&pvStack_20,*(ushort *)((int)this + 0x98));
  iVar4 = MulDiv(iStack_1c,0x4b,100);
  *(int *)((int)this + 0xa4) = iVar4;
  *(void **)((int)this + 0xa0) = pvStack_20;
  *(int *)(*(int *)((int)this + 0x78) + 8) = iVar3;
  (**(code **)(**(int **)((int)this + 0x78) + 8))(auStack_10,param_2);
  *(int *)(*(int *)((int)this + 0x7c) + 8) = iVar3;
  (**(code **)(**(int **)((int)this + 0x7c) + 8))(&pvStack_20,param_2);
  pvVar2 = *(void **)((int)this + 0xa0);
  pvVar5 = pvStack_20;
  if ((int)pvStack_20 < (int)pvVar2) {
    pvVar5 = pvVar2;
  }
  if (((int)this_00 < (int)pvVar5) && (this_00 = pvStack_20, (int)pvStack_20 < (int)pvVar2)) {
    this_00 = pvVar2;
  }
  *(void **)((int)this + 0x58) = this_00;
  iStack_1c = *(int *)((int)this + 0xa4) + iVar3 + iStack_1c;
  *(int *)((int)this + 0x5c) = iStack_1c;
  *(int *)((int)this + 0x54) = -(*(int *)((int)this + 0xa4) / 2) - iVar3;
  param_1[1] = iStack_1c;
  *param_1 = this_00;
  return;
}


