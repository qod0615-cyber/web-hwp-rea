// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 118372-118457
//==== 1008b480 FUN_1008b480

void __thiscall FUN_1008b480(void *this,int *param_1,int param_2)

{
  void *this_00;
  wchar_t *pwVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  int *piVar5;
  int iVar6;
  int iStack_18;
  int iStack_10;
  int iStack_c;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar6 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar6;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  this_00 = *(void **)((int)this + 0x74);
  iVar6 = *(int *)((int)this + 0x40);
  if (*(int *)((int)this + 0x94) != 0) {
    *(undefined4 *)((int)this_00 + 0x850) = 0;
  }
  pwVar1 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar1 = *(wchar_t **)pwVar1;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar1);
  iStack_18 = 0;
  if ((*(int *)((int)this + 100) != 0) && (*(int *)(*(int *)((int)this + 100) + 4) != 0x7a)) {
    iVar2 = FUN_10087f30((int)this);
    iVar3 = FUN_10087f30(*(int *)((int)this + 100));
    if (*(int *)(&DAT_100bf318 + (iVar3 + iVar2 * 10) * 4) != 0) {
      iStack_18 = MulDiv(*(int *)((int)this_00 + 0x848),
                         *(int *)(&DAT_100bf318 + (iVar3 + iVar2 * 10) * 4),100);
      iStack_18 = iStack_18 * 7;
    }
  }
  uVar4 = (uint)*(ushort *)((int)this + 0x9c);
  if (((uVar4 != 0x20) && (uVar4 != 0x7e)) && (uVar4 != 0x60)) {
    FUN_10084f60(this_00,&iStack_10,uVar4);
    if (*(int *)((int)this + 0x94) != 0) {
      *(uint *)((int)this_00 + 0x850) = (uint)(iVar6 == 0);
    }
    *(int *)((int)this + 0x58) = iStack_10 + iStack_18;
    *(int *)((int)this + 0x5c) = iStack_c;
    *(int *)((int)this + 0x54) = -(iStack_c / 2);
    *param_1 = iStack_10 + iStack_18;
    param_1[1] = iStack_c;
    return;
  }
  if (*(undefined ***)this == &PTR_FUN_100bf4f4) {
    iVar6 = *(int *)((int)this + 0x68);
  }
  else {
    iVar6 = (*(code *)(*(undefined ***)this)[4])();
  }
  if ((*(int *)(iVar6 + 0x94) == 0) || (*(int *)(*(int *)(iVar6 + 0x94) + 4) != 0x6d)) {
    iVar6 = *(int *)((int)this_00 + 0x84c);
    iVar2 = *(int *)((int)this_00 + 0x848);
  }
  else {
    uVar4 = FUN_10085250(0x31);
    piVar5 = (int *)FUN_10084f60(this_00,&iStack_10,uVar4 & 0xffff);
    iVar6 = *piVar5;
    iVar2 = piVar5[1];
  }
  if ((*(short *)((int)this + 0x9c) == 0x20) || (*(short *)((int)this + 0x9c) == 0x60)) {
    iVar6 = (int)((iVar6 >> 0x1f & 3U) + iVar6) >> 2;
  }
  *(int *)((int)this + 0x5c) = iVar2;
  *(int *)((int)this + 0x58) = iVar6 + iStack_18;
  *(int *)((int)this + 0x54) = -(iVar2 / 2);
  param_1[1] = iVar2;
  *param_1 = iVar6 + iStack_18;
  return;
}


