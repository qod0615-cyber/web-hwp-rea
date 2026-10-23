// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 118665-118789
//==== 1008ba00 FUN_1008ba00

void __fastcall FUN_1008ba00(int param_1)

{
  ushort uVar1;
  bool bVar2;
  int iVar3;
  ushort *puVar4;
  uint uVar5;
  ushort ******ppppppuVar6;
  undefined4 extraout_ECX;
  ushort ******ppppppuVar7;
  int iVar8;
  int iVar9;
  bool bVar10;
  int local_54;
  ushort *****local_44 [4];
  undefined4 local_34;
  uint local_30;
  ushort *****local_2c [4];
  uint local_1c;
  uint local_18;
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ac2c0;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  local_30 = 7;
  local_44[0] = (ushort *****)((uint)local_44[0] & 0xffff0000);
  local_34 = 0;
  FUN_10005ad0(local_44,&DAT_100aed30,0);
  local_8 = 0;
  bVar2 = false;
  local_54 = 0;
  iVar9 = param_1;
  while ((*(int *)(iVar9 + 4) == 0x6f && (*(int *)(iVar9 + 0x98) == 0))) {
    FUN_10043d00(local_2c,(undefined4 *)(iVar9 + 0x24));
    local_8._0_1_ = 1;
    ppppppuVar6 = local_2c;
    if (7 < local_18) {
      ppppppuVar6 = (ushort ******)local_2c[0];
    }
    FUN_10087970(local_44,extraout_ECX,ppppppuVar6,local_1c);
    local_8 = (uint)local_8._1_3_ << 8;
    FUN_10005c10((int *)local_2c);
    ppppppuVar6 = local_44;
    if (7 < local_30) {
      ppppppuVar6 = (ushort ******)local_44[0];
    }
    iVar8 = 0;
    if (DAT_100dc8d4 != 0) {
      iVar3 = 0;
      do {
        puVar4 = *(ushort **)((int)&PTR_DAT_100dc8d0 + iVar3);
        ppppppuVar7 = ppppppuVar6;
        do {
          uVar1 = *(ushort *)ppppppuVar7;
          bVar10 = uVar1 < *puVar4;
          if (uVar1 != *puVar4) {
LAB_1008bafc:
            uVar5 = -(uint)bVar10 | 1;
            goto LAB_1008bb01;
          }
          if (uVar1 == 0) break;
          uVar1 = *(ushort *)((int)ppppppuVar7 + 2);
          bVar10 = uVar1 < puVar4[1];
          if (uVar1 != puVar4[1]) goto LAB_1008bafc;
          ppppppuVar7 = ppppppuVar7 + 1;
          puVar4 = puVar4 + 2;
        } while (uVar1 != 0);
        uVar5 = 0;
LAB_1008bb01:
        if (uVar5 == 0) {
          bVar10 = true;
          goto LAB_1008bb1b;
        }
        iVar8 = iVar8 + 1;
        iVar3 = iVar8 * 8;
      } while ((&DAT_100dc8d4)[iVar8 * 2] != 0);
    }
    bVar10 = false;
LAB_1008bb1b:
    if (bVar10) {
      FUN_10043d00(local_2c,(undefined4 *)(*(int *)(iVar9 + 0x60) + 0x24));
      ppppppuVar6 = local_2c;
      if (7 < local_18) {
        ppppppuVar6 = (ushort ******)local_2c[0];
      }
      iVar8 = isalpha((uint)*(ushort *)ppppppuVar6);
      if ((iVar8 == 0) || (*(int *)(*(int *)(iVar9 + 0x60) + 4) != 0x6f)) {
        bVar10 = true;
      }
      else {
        bVar10 = false;
      }
      FUN_10005c10((int *)local_2c);
      iVar8 = iVar9;
      if (bVar10) {
        for (; iVar8 != param_1; iVar8 = *(int *)(iVar8 + 100)) {
          *(undefined4 *)(iVar8 + 0x94) = 1;
        }
        *(undefined4 *)(param_1 + 0x94) = 1;
        bVar2 = true;
      }
    }
    iVar9 = *(int *)(iVar9 + 0x60);
    if ((*(int *)(iVar9 + 0x60) == 0) || (local_54 = local_54 + 1, 5 < local_54)) break;
  }
  if (!bVar2) {
    *(undefined4 *)(param_1 + 0x94) = 0;
  }
  FUN_10005c10((int *)local_44);
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


