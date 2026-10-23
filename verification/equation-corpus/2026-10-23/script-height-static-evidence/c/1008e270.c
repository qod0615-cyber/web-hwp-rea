// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 120557-120795
//==== 1008e270 FUN_1008e270

void __thiscall FUN_1008e270(void *this,int *param_1,int param_2)

{
  bool bVar1;
  bool bVar2;
  void *this_00;
  int iVar3;
  int iVar4;
  int *piVar5;
  ushort ****ppppuVar6;
  int iVar7;
  wchar_t *pwVar8;
  short *psVar9;
  int iVar10;
  ushort ***pppuVar11;
  undefined1 local_64 [4];
  int local_60;
  int local_5c;
  int local_58;
  int local_54;
  undefined1 local_50 [4];
  ushort ***local_4c;
  void *local_48;
  ushort ***local_44 [5];
  uint local_30;
  ushort ***local_2c [4];
  int local_1c;
  uint local_18;
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac6b1;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  bVar2 = false;
  bVar1 = false;
  local_5c = 0;
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = *(int *)((int)this + 0x5c);
    goto LAB_1008e648;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  local_48 = *(void **)((int)this + 0x74);
  pppuVar11 = (ushort ***)((int)local_48 + 0x858);
  pwVar8 = (wchar_t *)pppuVar11;
  if (7 < *(uint *)((int)local_48 + 0x86c)) {
    pwVar8 = (wchar_t *)*pppuVar11;
  }
  local_4c = pppuVar11;
  FUN_10084560(local_48,*(int *)((int)this + 8),pwVar8);
  if ((*(int *)((int)this + 0x8c) == 0) || (*(int *)(*(int *)((int)this + 0x60) + 4) != 0x6f)) {
LAB_1008e35a:
    local_54 = 0;
  }
  else {
    FUN_10043d00(local_44,(undefined4 *)(*(int *)((int)this + 0x60) + 0x24));
    local_8 = 0;
    bVar2 = true;
    bVar1 = false;
    local_5c = 5;
    ppppuVar6 = local_44;
    if (7 < local_30) {
      ppppuVar6 = (ushort ****)local_44[0];
    }
    if (*(ushort *)ppppuVar6 < 0x41) goto LAB_1008e35a;
    FUN_10043d00(local_2c,(undefined4 *)(*(int *)((int)this + 0x60) + 0x24));
    bVar2 = true;
    bVar1 = true;
    local_54 = 1;
    ppppuVar6 = local_2c;
    if (7 < local_18) {
      ppppuVar6 = (ushort ****)local_2c[0];
    }
    if (0x5a < *(ushort *)ppppuVar6) goto LAB_1008e35a;
  }
  if (bVar1) {
    FUN_10005c10((int *)local_2c);
  }
  local_8 = 0xffffffff;
  if (bVar2) {
    FUN_10005c10((int *)local_44);
  }
  this_00 = local_48;
  if (local_54 == 0) {
    local_54 = 0;
  }
  else {
    local_54 = MulDiv(*(int *)((int)local_48 + 0x848),0xf,100);
  }
  if ((*(int *)((int)this + 100) != 0) && (*(int *)(*(int *)((int)this + 100) + 4) != 0x7a)) {
    iVar3 = FUN_10087f30((int)this);
    iVar4 = FUN_10087f30(*(int *)((int)this + 100));
    pppuVar11 = local_4c;
    if (*(int *)(&DAT_100bf318 + (iVar4 + iVar3 * 10) * 4) != 0) {
      local_54 = MulDiv(*(int *)((int)this_00 + 0x848),
                        *(int *)(&DAT_100bf318 + (iVar4 + iVar3 * 10) * 4),100);
      local_54 = local_54 * 10;
      pppuVar11 = local_4c;
    }
  }
  local_4c = (ushort ***)MulDiv(*(int *)((int)this + 8),0x44,100);
  local_5c = 0;
  local_58 = 0;
  if (7 < *(uint *)((int)pppuVar11 + 0x14)) {
    pppuVar11 = (ushort ***)*pppuVar11;
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),(wchar_t *)pppuVar11);
  pppuVar11 = local_4c;
  if (*(int *)((int)this + 0x88) == 0) {
    iVar3 = 0;
  }
  else {
    *(ushort ****)(*(int *)((int)this + 0x78) + 8) = local_4c;
    piVar5 = (int *)(**(code **)(**(int **)((int)this + 0x78) + 8))(local_64,0);
    iVar3 = *piVar5;
    local_5c = piVar5[1];
  }
  if (*(int *)((int)this + 0x8c) == 0) {
    local_60 = 0;
  }
  else {
    *(ushort ****)(*(int *)((int)this + 0x7c) + 8) = pppuVar11;
    piVar5 = (int *)(**(code **)(**(int **)((int)this + 0x7c) + 8))(local_64,0);
    local_60 = *piVar5;
    local_58 = piVar5[1];
  }
  if (local_60 < iVar3) {
    local_60 = iVar3;
  }
  iVar3 = 0;
  iVar4 = 0;
  FUN_10043d00(local_2c,(undefined4 *)((int)this + 0x24));
  local_8 = 1;
  local_48 = *(void **)((int)local_48 + 0x848);
  ppppuVar6 = local_2c;
  if (7 < local_18) {
    ppppuVar6 = (ushort ****)local_2c[0];
  }
  if (local_1c == 4) {
    psVar9 = &DAT_100bf2d4;
    iVar10 = 4;
    local_4c = (ushort ***)(ppppuVar6 + -0x402fcb5);
    do {
      if (*(short *)((int)local_4c + (int)psVar9) != *psVar9) goto LAB_1008e4e2;
      psVar9 = psVar9 + 1;
      iVar10 = iVar10 + -1;
    } while (iVar10 != 0);
LAB_1008e514:
    piVar5 = *(int **)((int)this + 100);
    if (piVar5 != (int *)0x0) {
      if (piVar5[1] == 0x7a) {
        iVar3 = (int)local_48 / 2;
        iVar4 = -((int)local_48 / 2);
      }
      else {
        (**(code **)(*piVar5 + 8))(local_50,1);
        iVar3 = piVar5[0x17];
        piVar5[0x11] = 1;
        iVar4 = piVar5[0x15];
LAB_1008e582:
        iVar3 = iVar3 + iVar4;
      }
    }
  }
  else {
LAB_1008e4e2:
    ppppuVar6 = local_2c;
    if (7 < local_18) {
      ppppuVar6 = (ushort ****)local_2c[0];
    }
    if (local_1c == 4) {
      psVar9 = &DAT_100bf2e0;
      iVar10 = 4;
      local_4c = (ushort ***)(ppppuVar6 + -0x402fcb8);
      do {
        if (*(short *)((int)local_4c + (int)psVar9) != *psVar9) goto LAB_1008e557;
        psVar9 = psVar9 + 1;
        iVar10 = iVar10 + -1;
      } while (iVar10 != 0);
      goto LAB_1008e514;
    }
LAB_1008e557:
    iVar10 = *(int *)((int)this + 0x60);
    if (iVar10 != 0) {
      if (*(int *)(iVar10 + 0x60) == 0) {
        iVar3 = (int)local_48 / 2;
        iVar4 = -((int)local_48 / 2);
        goto LAB_1008e584;
      }
      iVar3 = *(int *)(iVar10 + 0x5c);
      iVar4 = *(int *)(iVar10 + 0x54);
      goto LAB_1008e582;
    }
  }
LAB_1008e584:
  iVar10 = MulDiv((int)local_48,0x14,100);
  *(int *)((int)this + 0x80) = iVar3 - iVar10;
  iVar7 = MulDiv((int)local_48,0x19,100);
  iVar7 = iVar7 + iVar4;
  iVar10 = *(int *)((int)this + 0x80);
  *(int *)((int)this + 0x84) = iVar7;
  local_4c = (ushort ***)(*(int *)(*(int *)((int)this + 0x78) + 0x54) + iVar10);
  local_58 = local_58 + *(int *)(*(int *)((int)this + 0x7c) + 0x54) + iVar7;
  if ((*(int *)((int)this + 0x8c) != 0) && (0 < local_58)) {
    iVar7 = iVar7 - local_58;
    *(int *)((int)this + 0x84) = iVar7;
  }
  if ((*(int *)((int)this + 0x88) != 0) && ((int)local_4c < 0)) {
    iVar10 = iVar10 - (int)local_4c;
    *(int *)((int)this + 0x80) = iVar10;
  }
  if (*(int *)((int)this + 0x8c) != 0) {
    iVar4 = *(int *)(*(int *)((int)this + 0x7c) + 0x54) + iVar7;
  }
  if (*(int *)((int)this + 0x88) != 0) {
    iVar3 = *(int *)(*(int *)((int)this + 0x78) + 0x54) + iVar10 + local_5c;
  }
  *(int *)((int)this + 0x54) = iVar4;
  *(int *)((int)this + 0x58) = local_60 + local_54;
  *(int *)((int)this + 0x5c) = iVar3 - iVar4;
  *param_1 = local_60 + local_54;
  param_1[1] = iVar3 - iVar4;
  FUN_10005c10((int *)local_2c);
LAB_1008e648:
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


