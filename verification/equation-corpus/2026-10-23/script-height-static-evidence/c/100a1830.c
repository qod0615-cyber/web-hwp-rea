// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 135905-136031
//==== 100a1830 FUN_100a1830

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_100a1830(int *param_1)

{
  void *pvVar1;
  int iVar2;
  wchar_t *pwVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  undefined4 uVar9;
  uint uVar10;
  int iVar11;
  int iVar12;
  
  pvVar1 = (void *)*param_1;
  pwVar3 = (wchar_t *)((int)pvVar1 + 0x858);
  if (7 < *(uint *)((int)pvVar1 + 0x86c)) {
    pwVar3 = *(wchar_t **)pwVar3;
  }
  FUN_10084560(pvVar1,param_1[6],pwVar3);
  pvVar1 = (void *)*param_1;
  iVar11 = *(int *)((int)pvVar1 + 0x848);
  uVar10 = iVar11 >> 0x1f;
  if (param_1[4] < param_1[5]) {
    FUN_100844d0(pvVar1,param_1[4],*(undefined4 *)((int)pvVar1 + 0x84c));
    iVar2 = param_1[1];
    if ((iVar2 == 4) || (iVar2 == 0xc)) {
      iVar11 = param_1[3] - ((int)(iVar11 + (uVar10 & 7)) >> 3);
    }
    else if ((iVar2 == 3) || (iVar2 == 0xb)) {
      iVar11 = ((int)((uVar10 & 7) + iVar11) >> 3) + param_1[3];
    }
    else {
      iVar11 = param_1[3];
    }
    FUN_10084930((void *)*param_1,iVar11,param_1[2],(uint)*(ushort *)(param_1 + 10));
    return;
  }
  iVar2 = *(int *)((int)pvVar1 + 4);
  *(undefined4 *)((int)pvVar1 + 0x854) = 0;
  *(undefined4 *)((int)pvVar1 + 4) = 400;
  iVar8 = param_1[1];
  if ((iVar8 == 1) || (iVar8 == 9)) {
    iVar5 = (param_1[0x12] - param_1[5]) + param_1[4];
    FUN_10084930((void *)*param_1,param_1[3],param_1[2],(uint)*(ushort *)(param_1 + 8));
    FUN_10084930((void *)*param_1,param_1[3],param_1[0xc] + param_1[2] + iVar5,
                 (uint)*(ushort *)((int)param_1 + 0x22));
    iVar4 = MulDiv(param_1[0xc],5,100);
    iVar8 = MulDiv(param_1[0xe],5,100);
    iVar11 = 0;
    for (iVar8 = (int)((float)(iVar8 + iVar4 + iVar5) / _DAT_100bfdd0); 0 < iVar8;
        iVar8 = iVar8 + -50000) {
      iVar5 = 50000;
      if (iVar8 < 50000) {
        iVar5 = iVar8;
      }
      FUN_100844d0((void *)*param_1,iVar5,*(undefined4 *)(*param_1 + 0x84c));
      FUN_10084930((void *)*param_1,param_1[3],(param_1[0xc] - iVar4) + param_1[2] + iVar11,
                   (uint)*(ushort *)((int)param_1 + 0x26));
      iVar11 = iVar11 + 0x1324;
    }
  }
  else if ((iVar8 == 2) || (iVar8 == 10)) {
    iVar5 = MulDiv(*(int *)(*param_1 + 0x848),5,100);
    iVar11 = param_1[0xc];
    iVar6 = (param_1[4] - param_1[5]) / 2;
    iVar8 = param_1[2];
    iVar4 = param_1[0x12];
    iVar7 = (int)(((float)iVar6 * _DAT_100bfdd8) / _DAT_100bfde0);
    FUN_10084930((void *)*param_1,param_1[3],iVar8,(uint)*(ushort *)(param_1 + 8));
    FUN_10084930((void *)*param_1,param_1[3],iVar6 + iVar8 + iVar11,
                 (uint)*(ushort *)((int)param_1 + 0x26));
    FUN_10084930((void *)*param_1,param_1[3],iVar8 + iVar6 * 2 + iVar11 + iVar4,
                 (uint)*(ushort *)((int)param_1 + 0x22));
    iVar12 = iVar5 * 2 - (int)((float)iVar6 / _DAT_100bfe1c);
    FUN_100844d0((void *)*param_1,iVar12,*(undefined4 *)(*param_1 + 0x84c));
    FUN_10084930((void *)*param_1,param_1[3],((iVar8 + iVar11) - iVar7) - iVar5,
                 (uint)*(ushort *)(param_1 + 9));
    FUN_100844d0((void *)*param_1,iVar12,*(undefined4 *)(*param_1 + 0x84c));
    FUN_10084930((void *)*param_1,param_1[3],((iVar8 - iVar7) - iVar5) + iVar11 + iVar4 + iVar6,
                 (uint)*(ushort *)(param_1 + 9));
  }
  else if ((iVar8 == 3) || (iVar8 == 0xb)) {
    iVar11 = param_1[4];
    iVar8 = param_1[5];
    FUN_10084930((void *)*param_1,param_1[3],param_1[2],(uint)*(ushort *)(param_1 + 8));
    FUN_10084930((void *)*param_1,param_1[3],param_1[0xc] + param_1[2] + (iVar11 - iVar8),
                 (uint)*(ushort *)((int)param_1 + 0x22));
    iVar4 = MulDiv(param_1[0xc],0x50,100);
    iVar5 = MulDiv(param_1[0xe],5,100);
    FUN_100844d0((void *)*param_1,iVar5 + iVar4 + (iVar11 - iVar8),*(undefined4 *)(*param_1 + 0x84c)
                );
    FUN_10084930((void *)*param_1,param_1[3],(param_1[0xc] - iVar4) + param_1[2],
                 (uint)*(ushort *)((int)param_1 + 0x26));
  }
  else if ((iVar8 == 4) || (iVar8 == 0xc)) {
    iVar8 = param_1[4];
    iVar4 = *(int *)(*param_1 + 0x84c);
    if (iVar4 * 6 <= iVar8) {
      iVar4 = iVar8 / 6;
    }
    FUN_100844d0((void *)*param_1,iVar8,iVar4);
    FUN_10084930((void *)*param_1,param_1[3] - ((int)(iVar11 + (uVar10 & 7)) >> 3),param_1[2],
                 (uint)*(ushort *)(param_1 + 10));
  }
  else {
    FUN_100844d0((void *)*param_1,param_1[4],*(undefined4 *)(*param_1 + 0x84c));
    FUN_10084930((void *)*param_1,param_1[3],param_1[2],(uint)*(ushort *)(param_1 + 10));
  }
  iVar11 = *param_1;
  *(uint *)(iVar11 + 0x854) = (uint)(iVar2 == 700);
  uVar9 = 400;
  if (iVar2 == 700) {
    uVar9 = 700;
  }
  *(undefined4 *)(iVar11 + 4) = uVar9;
  return;
}


