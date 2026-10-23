//==== 10056520 in 10056520 FUN_10056520

void __thiscall FUN_10056520(void *this,int *param_1)

{
  ushort uVar1;
  int iVar2;
  int *piVar3;
  short sVar4;
  short sVar5;
  int extraout_EAX;
  int iVar6;
  uint uVar7;
  void *this_00;
  uint uVar8;
  int local_18;
  int local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  piVar3 = param_1;
  uVar8 = 0;
  uVar7 = *(uint *)(**(int **)((int)this + 0x60) + 0x438);
  this_00 = this;
  if (param_1[1] != 0) {
    do {
      uVar1 = *(ushort *)(*param_1 + uVar8 * 2);
      if (((ushort)(uVar1 + 0x2000) < 0x1900) &&
         (this_00 = (void *)FUN_100555e0((uint)this_00,6,uVar7,(int *)(uint)uVar1),
         extraout_EAX != 0)) {
        local_8 = 0;
        goto LAB_10056586;
      }
      uVar8 = uVar8 + 1;
    } while (uVar8 < (uint)param_1[1]);
  }
  local_8 = *(uint *)((int)this_00 + 100) & 0x4000000;
LAB_10056586:
  param_1[6] = 0;
  param_1[5] = 0;
  local_c = 0;
  local_14 = 0;
  local_18 = 0;
  local_10 = 0;
  iVar2 = **(int **)((int)this_00 + 0x60);
  sVar5 = 0;
  param_1 = (int *)0x0;
  sVar4 = 0;
  if (piVar3[1] != 0) {
    do {
      iVar6 = FUN_1006f1e0((int)piVar3,sVar5 + 1);
      if (iVar6 == 0) {
        return;
      }
      if ((*(short *)(iVar2 + 0x41c) == 0x1ff) || ((int)*(uint *)((int)this_00 + 100) < 0)) {
        iVar6 = 1;
      }
      else {
        iVar6 = 0;
      }
      uVar7 = FUN_1006ed20(*piVar3,piVar3[1],(int)param_1,*(ushort *)(iVar2 + 10) & 0x8000,
                           *(uint *)((int)this_00 + 100) & 0x20000000,(int *)&local_c,&local_10,
                           &local_14,&local_18,local_8,iVar6);
      iVar6 = sVar5 * 0x2c;
      *(uint *)(iVar6 + piVar3[3]) = uVar7;
      *(short *)(iVar6 + 8 + piVar3[3]) = (short)param_1;
      *(short *)(iVar6 + 10 + piVar3[3]) = (short)local_c;
      *(undefined1 *)(iVar6 + 0xe + piVar3[3]) = (undefined1)local_10;
      *(undefined2 *)(iVar6 + 0xc + piVar3[3]) = (undefined2)local_14;
      *(undefined4 *)(iVar6 + 0x10 + piVar3[3]) = 0xffffffff;
      *(int *)(iVar6 + 4 + piVar3[3]) = local_18;
      *(undefined1 *)(iVar6 + 0x14 + piVar3[3]) = 0;
      piVar3[6] = piVar3[6] | 1 << (uVar7 & 0x1f);
      param_1 = (int *)((int)param_1 + (local_c & 0xffff));
      sVar5 = sVar5 + 1;
      this_00 = this;
      sVar4 = sVar5;
    } while (param_1 < (int *)piVar3[1]);
  }
  *(short *)(piVar3 + 5) = sVar4;
  FUN_10056190(this_00,piVar3);
  if (*(ushort *)((int)piVar3 + 0x16) != 0) {
    qsort((void *)piVar3[3],(uint)*(ushort *)((int)piVar3 + 0x16) + (uint)*(ushort *)(piVar3 + 5),
          0x2c,FUN_1006f270);
    sVar5 = *(short *)((int)piVar3 + 0x16) + -1 + (short)piVar3[5];
    if (-1 < sVar5) {
      do {
        if (*(short *)(sVar5 * 0x2c + 10 + piVar3[3]) != 0) break;
        sVar5 = sVar5 + -1;
      } while (-1 < sVar5);
    }
    *(short *)(piVar3 + 5) = sVar5 + 1;
  }
  return;
}


//==== 100568a0 in 100568a0 FUN_100568a0

undefined4 __thiscall FUN_100568a0(void *this,int *param_1)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  undefined4 uVar7;
  uint local_18;
  int local_14;
  char *local_10;
  uint local_c;
  uint local_8;
  
  piVar2 = param_1;
  iVar6 = **(int **)((int)this + 0x60);
  if (iVar6 == 0) {
    local_8 = 0;
    goto LAB_1005698b;
  }
  iVar3 = FUN_10056b20(this,1,0,(int *)0xffffffff);
  if (*(char *)(iVar6 + 0xa8) == '\x02') {
    iVar4 = FUN_1001f7e0(0x20,-1,*(int *)((int)this + 0x8c),*(uint *)((int)this + 0x90),
                         (int *)&local_10);
    if (*(int *)((int)this + 0x98) == 100) {
      local_8 = HncIntMulDiv(iVar4,*(int *)((int)this + 0x94),local_10);
    }
    else {
      local_8 = (*(int *)((int)this + 0x98) * *(int *)((int)this + 0x94) * iVar4) /
                ((int)local_10 * 100);
    }
    if (local_8 != 0) {
      if (*(int *)((int)this + 0x30) == 0) {
        local_8 = HncIntMulDiv(local_8,*(undefined4 *)((int)this + 0x28),1);
      }
      else {
        local_8 = HncIntMulDiv(local_8,*(undefined4 *)((int)this + 0x28),*(int *)((int)this + 0x30))
        ;
      }
      goto LAB_10056957;
    }
LAB_1005695e:
    if (((*(uint *)((int)this + 100) & 0x10000000) == 0) &&
       (uVar5 = *(uint *)(iVar6 + 0xa4), uVar5 != 0)) {
      local_8 = (int)((uVar5 ^ (int)uVar5 >> 0x1f) - ((int)uVar5 >> 0x1f)) / 2;
    }
  }
  else {
    local_8 = FUN_1005b720(this,0x20);
LAB_10056957:
    if (local_8 == 0) goto LAB_1005695e;
  }
  if (iVar3 != 0) {
    (**(code **)(**(int **)((int)this + 8) + 4))(iVar3);
  }
LAB_1005698b:
  local_10 = (char *)(iVar6 + 0x14);
  local_c = 0;
  local_18 = 1;
  do {
    uVar5 = local_c;
    if (((piVar2[6] & local_18) != 0) && (iVar6 = 0, (short)piVar2[5] != 0)) {
      param_1 = (int *)0x0;
      do {
        iVar3 = piVar2[3];
        if (*(uint *)((int)param_1 + iVar3) == uVar5) {
          piVar1 = *(int **)((int)param_1 + iVar3 + 0x10);
          uVar5 = (uint)*(byte *)((int)param_1 + iVar3 + 0xe);
          if (piVar1 == (int *)0xffffffff) {
            local_14 = FUN_10056b20(this,local_c,uVar5,(int *)0xffffffff);
            if (*local_10 != '\x02') goto LAB_10056a47;
            iVar3 = *(int *)((int)this + 0x30);
            if (iVar3 == 0) {
              uVar7 = 1;
            }
            else {
              uVar7 = *(undefined4 *)((int)this + 0x28);
            }
LAB_10056a2f:
            HncIntMulDiv(local_8,iVar3,uVar7);
            FUN_10057f50(this,piVar2,iVar6);
          }
          else {
            local_14 = FUN_10056b20(this,local_c,uVar5,piVar1);
            if (*(int *)((int)param_1 + piVar2[3] + 0x10) < 0) {
              iVar3 = *(int *)((int)this + 0x30);
              if (iVar3 == 0) {
                uVar7 = 1;
              }
              else {
                uVar7 = *(undefined4 *)((int)this + 0x28);
              }
              goto LAB_10056a2f;
            }
LAB_10056a47:
            FUN_1005c6f0(this,piVar2,iVar6,local_8);
          }
          uVar5 = local_c;
          if (local_14 != 0) {
            (**(code **)(**(int **)((int)this + 8) + 4))(local_14);
            uVar5 = local_c;
          }
        }
        iVar6 = iVar6 + 1;
        param_1 = param_1 + 0xb;
      } while (iVar6 < (int)(uint)*(ushort *)(piVar2 + 5));
    }
    local_c = uVar5 + 1;
    local_18 = local_18 << 1 | (uint)((int)local_18 < 0);
    local_10 = local_10 + 0x94;
    if (6 < (int)local_c) {
      return 1;
    }
  } while( true );
}


//==== 1005c6f0 in 1005c6f0 FUN_1005c6f0

void __thiscall FUN_1005c6f0(void *this,int *param_1,int param_2,uint param_3)

{
  ushort uVar1;
  void *pvVar2;
  ushort uVar3;
  ushort uVar4;
  int iVar5;
  ushort uVar6;
  uint uVar7;
  uint uVar8;
  UINT UVar9;
  uint uVar10;
  undefined4 *puVar11;
  uint *puVar12;
  uint *puVar13;
  longlong lVar14;
  undefined8 uVar15;
  undefined1 auStack_b8 [4];
  void *local_b4;
  int local_b0;
  ushort *puStack_ac;
  uint local_a8;
  uint uStack_a4;
  code *local_a0;
  uint uStack_9c;
  uint local_98;
  uint local_94;
  undefined4 *local_90;
  UINT UStack_8c;
  uint uStack_88;
  int *piStack_84;
  uint *local_80;
  uint local_7c;
  uint uStack_78;
  ushort auStack_74 [2];
  int local_70;
  ushort auStack_6c [2];
  UINT UStack_68;
  int local_64;
  int local_60;
  int *local_5c;
  int local_58;
  uint uStack_54;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  uint uStack_44;
  uint local_40 [9];
  WORD aWStack_1c [4];
  uint local_14;
  
  local_14 = DAT_100dc00c ^ (uint)auStack_b8;
  local_58 = param_2 * 0x2c;
  puVar12 = (uint *)(param_1[3] + local_58);
  local_5c = param_1;
  uVar7 = (uint)(ushort)puVar12[2];
  local_60 = 0;
  local_98 = 0;
  local_70 = *param_1 + uVar7 * 2;
  local_94 = param_1[2] & 1;
  local_b0 = param_1[8] + uVar7 * 4;
  local_7c = *(uint *)((int)this + 100) & 0x2000000;
  local_64 = **(int **)((int)this + 0x60);
  local_a8 = *(ushort *)(local_64 + 10) & 0x8000;
  local_90 = (undefined4 *)(-(uint)(param_1[7] != 0) & param_1[7] + uVar7 * 4);
  local_b4 = this;
  local_80 = puVar12;
  uVar7 = FUN_1005c030(this);
  puVar12[8] = uVar7;
  local_a0 = HncIntMulDiv_exref;
  puVar12[9] = 0;
  puVar12[10] = 0;
  if (local_a8 != 0) {
    local_40[4] = 0;
    local_40[5] = 0;
    local_40[6] = 0;
    local_40[0] = 0;
    local_40[1] = 0;
    local_40[2] = 0;
    local_40[3] = 0;
    iVar5 = FUN_1005bef0(this,local_40);
    if (iVar5 != 0) {
      puVar12[8] = local_40[4] - local_40[5];
      puVar12[9] = local_40[1] - local_40[4];
      if (*(char *)((int)puVar12 + 0xe) != '\0') {
        puVar12[10] = local_40[0];
      }
      if (*(int *)((int)this + 0x24) != 1) {
        uVar7 = (*local_a0)();
        puVar12[8] = uVar7;
        uVar7 = (*local_a0)();
        puVar12[9] = uVar7;
        uVar7 = (*local_a0)();
        puVar12[10] = uVar7;
      }
    }
  }
  uVar7 = (uint)*(byte *)((int)puVar12 + 0xe);
  if ((local_a8 != 0) && (*(byte *)((int)puVar12 + 0xe) != 0)) {
    uVar7 = 0;
  }
  FUN_1005af00(this,*(uint *)(local_58 + local_5c[3]),uVar7,*(uint *)((int)this + 0xa4) & 4,
               *(int **)((int)this + 0x88),0);
  if (((local_94 == 0) || (local_90 != (undefined4 *)0x0)) ||
     ((local_a8 != 0 && (*(char *)((int)puVar12 + 0xe) == '\0')))) {
    iVar5 = *(int *)((int)this + 0x88) * 0xb0 + DAT_100ea9a8;
    if (iVar5 == 0) goto LAB_1005d0ee;
    uStack_44 = *(uint *)(iVar5 + 0xa0);
    uVar7 = (uint)*(ushort *)((int)puVar12 + 10);
    uStack_88 = uStack_44 & 4;
    uStack_54 = uStack_44 & 8;
    uStack_9c = 0;
    uStack_44 = uStack_44 & 2;
    uStack_78 = 0;
    uStack_a4 = 0;
    if (*(ushort *)((int)puVar12 + 10) != 0) {
      uStack_50 = 0xac00;
      uStack_4c = 0xd7a3;
      uStack_48 = 0x3ff;
      do {
        puStack_ac = (ushort *)(local_70 + uStack_a4 * 2);
        uVar4 = *puStack_ac;
        uVar8 = (uint)uVar4;
        uVar10 = param_3;
        if (uVar8 == 0x20) {
LAB_1005cd35:
          if (local_90 != (undefined4 *)0x0) {
            local_90[uStack_a4] = uVar10;
          }
          if (((local_a8 != 0) && (*(char *)((int)puVar12 + 0xe) == '\0')) &&
             (this = local_b4, (int)local_98 < (int)uVar10)) {
            local_98 = uVar10;
          }
          uVar8 = uStack_a4;
          if (local_94 == 0) {
            if (((local_a8 != 0) && (*(char *)((int)puVar12 + 0xe) == '\0')) &&
               ((*puStack_ac != 0x20 && (uVar10 != 0)))) {
              uVar10 = puVar12[8];
            }
            *(uint *)(local_b0 + uStack_a4 * 4) = uVar10;
          }
        }
        else {
          if ((uStack_54 != 0) || (uStack_88 != 0)) {
            uVar10 = uStack_78;
            if ((uVar4 < (ushort)uStack_50) || ((ushort)uStack_4c < uVar4)) {
              if ((uStack_88 == 0) || (0x7e < uVar8)) goto LAB_1005c9eb;
              if (uStack_78 == 0) {
                uVar10 = FUN_1005b720(this,0x41);
                uStack_78 = uVar10;
              }
            }
            else if (uStack_78 == 0) {
              uVar10 = FUN_1005b720(this,0xac00);
              uStack_78 = uVar10;
            }
            goto LAB_1005cd35;
          }
LAB_1005c9eb:
          if ((puVar12[1] & 8) == 0) {
            uStack_9c = uStack_a4 + 1;
            if (uVar7 <= uStack_9c) {
LAB_1005cd19:
              if ((ushort)(uVar4 + 0x2400) < 0x400) {
                uVar10 = 0;
              }
              else {
                uVar10 = FUN_1005b720(this,uVar8);
              }
              goto LAB_1005cd35;
            }
            this = local_b4;
            if (((ushort)uStack_48 < (ushort)(uVar4 + 0x2800)) ||
               (0x3ff < (ushort)(puStack_ac[1] + 0x2400))) goto LAB_1005cd19;
            uVar7 = __MAKE_UCSCHAR_8(uVar8);
            this = local_b4;
            uVar7 = FUN_1005b720(local_b4,uVar7);
            if (local_90 != (undefined4 *)0x0) {
              local_90[uStack_a4] = uVar7;
              local_90[uStack_a4 + 1] = 0;
            }
            if (((local_a8 != 0) && (*(char *)((int)puVar12 + 0xe) == '\0')) &&
               (this = local_b4, (int)local_98 < (int)uVar7)) {
              local_98 = uVar7;
            }
            uVar8 = uStack_9c;
            if (local_94 == 0) {
              if (((local_a8 != 0) && (*(char *)((int)puVar12 + 0xe) == '\0')) &&
                 ((*puStack_ac != 0x20 && (uVar7 != 0)))) {
                uVar7 = puVar12[8];
              }
              *(uint *)(local_b0 + uStack_a4 * 4) = uVar7;
              *(undefined4 *)(local_b0 + 4 + uStack_a4 * 4) = 0;
            }
          }
          else {
            uStack_9c = 0;
            aWStack_1c[0] = 0;
            aWStack_1c[1] = 0;
            aWStack_1c[2] = 0;
            aWStack_1c[3] = 0;
            local_40[0] = 0;
            local_40[1] = 0;
            local_40[2] = 0;
            local_40[3] = 0;
            UStack_8c = HncGetJamoBlock(puStack_ac,uVar7 - uStack_a4,auStack_74,auStack_6c,
                                        (ushort *)&piStack_84);
            uVar4 = (ushort)piStack_84;
            UStack_68 = UStack_8c;
            if (auStack_74[0] == 0) {
              if ((auStack_6c[0] != 0) && (uVar4 != 0)) {
                UStack_68 = UStack_8c + 1;
                auStack_74[0] = 0x115f;
                auStack_74[1] = 0;
                goto LAB_1005ca60;
              }
            }
            else {
LAB_1005ca60:
              if ((auStack_6c[0] == 0) && (uVar4 != 0)) {
                UStack_68 = UStack_68 + 1;
                auStack_6c[0] = 0x1160;
                auStack_6c[1] = 0;
              }
            }
            uVar1 = *puStack_ac;
            uVar6 = auStack_6c[0];
            uVar3 = auStack_74[0];
            if ((char)puVar12[5] == '\0') {
              if (uVar3 == 0) {
                if (uVar6 == 0) goto LAB_1005cab0;
LAB_1005caab:
                if (uVar4 == 0) goto LAB_1005cab0;
              }
              else {
                if (uVar6 == 0) goto LAB_1005caab;
LAB_1005cab0:
                uVar4 = HncJamoToHangulSyllable(uVar3,uVar6,uVar4);
                uVar7 = (uint)uVar4;
                if (uVar4 != 0) goto LAB_1005cb04;
              }
              pvVar2 = local_b4;
              uStack_9c = FUN_1007a560(*(int *)((int)local_b4 + 0x88),auStack_74[0],auStack_6c[0],
                                       (ushort)piStack_84,(short *)aWStack_1c);
              if (uStack_9c == 0) {
                uVar4 = HncJamoToPUAJamo(auStack_74[0]);
                uVar7 = (uint)uVar4;
                goto LAB_1005cb04;
              }
              GetCharWidthI(*(HDC *)(*(int *)((int)pvVar2 + 8) + 4),0,UStack_68,aWStack_1c,
                            (LPINT)local_40);
            }
            else {
              uVar4 = HncJamoToPUASyllable(uVar3,uVar6,uVar4);
              uVar7 = (uint)uVar1;
              if (uVar4 != 0) {
                uVar7 = (uint)uVar4;
              }
LAB_1005cb04:
              local_40[0] = FUN_1005b720(local_b4,uVar7);
              if (1 < (int)UStack_8c) {
                puVar13 = local_40;
                UVar9 = UStack_8c;
                while (puVar13 = puVar13 + 1, UVar9 = UVar9 - 1, puVar12 = local_80, UVar9 != 0) {
                  *puVar13 = 0;
                }
              }
            }
            iVar5 = 0;
            if (0 < (int)UStack_8c) {
              do {
                if ((*(int *)((int)local_b4 + 0x24) != 1) && (uStack_9c != 0)) {
                  uVar7 = (*local_a0)();
                  local_40[iVar5] = uVar7;
                }
                if (((local_a8 != 0) && (*(char *)((int)puVar12 + 0xe) == '\0')) &&
                   ((int)local_98 < (int)local_40[iVar5])) {
                  local_98 = local_40[iVar5];
                }
                uVar7 = local_40[iVar5];
                local_90[uStack_a4 + iVar5] = uVar7;
                if (local_94 == 0) {
                  if (iVar5 == 0) {
                    if (((local_a8 != 0) && (*(char *)((int)puVar12 + 0xe) == '\0')) &&
                       (*puStack_ac != 0x20)) {
                      uVar7 = puVar12[8];
                    }
                    *(uint *)(local_b0 + uStack_a4 * 4) = uVar7;
                  }
                  else {
                    if (((local_a8 != 0) && (*(char *)((int)puVar12 + 0xe) == '\0')) &&
                       (*puStack_ac != 0x20)) {
                      uVar7 = 0;
                    }
                    *(uint *)(local_b0 + (uStack_a4 + iVar5) * 4) = uVar7;
                    puVar12 = local_80;
                  }
                }
                iVar5 = iVar5 + 1;
              } while (iVar5 < (int)UStack_8c);
            }
            uVar8 = (uStack_a4 - 1) + UStack_8c;
            this = local_b4;
          }
        }
        uStack_a4 = uVar8 + 1;
        uVar7 = (uint)*(ushort *)((int)puVar12 + 10);
      } while (uStack_a4 < uVar7);
    }
    if ((((local_94 == 0) && (local_7c != 0)) && ((uStack_44 != 0 && (1 < (ushort)uVar7)))) &&
       ((local_a8 == 0 || (*(char *)((int)puVar12 + 0xe) != '\0')))) {
      if (((*(byte *)((int)this + 0xa4) & 2) == 0) || (*(int *)((int)this + 0xa8) != 8)) {
        FUN_1005b4d0(this,local_70,uVar7,(int)puVar12,local_b0);
      }
      else {
        local_60 = 1;
      }
    }
  }
  if ((*(byte *)((int)this + 0xa4) & 3) != 0) {
    iVar5 = *(int *)((int)this + *puVar12 * 4 + 0xd4);
    iVar5 = iVar5 + (iVar5 >> 0x1f & 3U);
    uVar7 = iVar5 >> 0x1f;
    local_80 = (uint *)((iVar5 >> 2 ^ uVar7) - uVar7);
    puStack_ac = *(ushort **)(*puVar12 * 0x94 + 0x20 + local_64);
    if (puStack_ac == (ushort *)0x0) goto LAB_1005d0ee;
    local_7c = *(uint *)((int)local_b4 + *puVar12 * 4 + 0xf0);
    if ((local_7c == 100) || ((local_a8 != 0 && (*(char *)((int)puVar12 + 0xe) == '\0')))) {
      iVar5 = (*local_a0)();
    }
    else {
      lVar14 = __allmul((uint)((longlong)(int)local_80 * (longlong)(int)puVar12[8]),
                        (int)((ulonglong)((longlong)(int)local_80 * (longlong)(int)puVar12[8]) >>
                             0x20),local_7c,(int)local_7c >> 0x1f);
      uVar15 = __alldiv((uint)lVar14,(uint)((ulonglong)lVar14 >> 0x20),
                        (uint)((longlong)(int)puStack_ac * 100),
                        (uint)((ulonglong)((longlong)(int)puStack_ac * 100) >> 0x20));
      iVar5 = (int)uVar15;
    }
    puVar12[8] = iVar5 << 2;
    uStack_88 = 0;
    this = local_b4;
    if (*(short *)((int)puVar12 + 10) != 0) {
      do {
        if (((*(short *)(local_70 + uStack_88 * 2) == 0x20) &&
            (puStack_ac = *(ushort **)(local_64 + 0xb4), puStack_ac == (ushort *)0x0)) &&
           (puStack_ac = *(ushort **)(*puVar12 * 0x94 + 0x20 + local_64),
           puStack_ac == (ushort *)0x0)) goto LAB_1005d0ee;
        local_7c = *(uint *)((int)local_b4 + *puVar12 * 4 + 0xf0);
        if ((local_7c == 100) || ((local_a8 != 0 && (*(char *)((int)puVar12 + 0xe) == '\0')))) {
          uStack_9c = uStack_88 * 4;
          piStack_84 = (int *)(uStack_9c + local_b0);
          iVar5 = (*local_a0)();
        }
        else {
          uStack_9c = uStack_88 * 4;
          piStack_84 = (int *)(local_b0 + uStack_9c);
          lVar14 = __allmul((uint)((longlong)(int)local_80 * (longlong)*piStack_84),
                            (int)((ulonglong)((longlong)(int)local_80 * (longlong)*piStack_84) >>
                                 0x20),local_7c,(int)local_7c >> 0x1f);
          uVar15 = __alldiv((uint)lVar14,(uint)((ulonglong)lVar14 >> 0x20),
                            (uint)((longlong)(int)puStack_ac * 100),
                            (uint)((ulonglong)((longlong)(int)puStack_ac * 100) >> 0x20));
          iVar5 = (int)uVar15;
        }
        *(int *)(uStack_9c + local_b0) = iVar5;
        *piStack_84 = iVar5 * 4;
        uStack_88 = uStack_88 + 1;
        this = local_b4;
      } while (uStack_88 < *(ushort *)((int)puVar12 + 10));
    }
  }
  if (((((*(byte *)((int)this + 0xa4) & 3) != 0) &&
       ((local_a8 == 0 || (*(char *)((int)puVar12 + 0xe) != '\0')))) &&
      (*(short *)((int)puVar12 + 10) != 0)) &&
     (((((puVar12[1] & 8) == 0 && (local_94 == 0)) &&
       (iVar5 = FUN_1005c240(this,local_70,puVar12,(undefined4 *)(*puVar12 * 0x94 + local_64 + 0x10)
                             ,local_60,local_b0), iVar5 != 0)) &&
      ((local_90 != (undefined4 *)0x0 && (iVar5 = 0, *(short *)((int)puVar12 + 10) != 0)))))) {
    puVar11 = local_90;
    do {
      *puVar11 = *(undefined4 *)((local_b0 - (int)local_90) + (int)puVar11);
      iVar5 = iVar5 + 1;
      this = local_b4;
      puVar11 = puVar11 + 1;
    } while (iVar5 < (int)(uint)*(ushort *)((int)puVar12 + 10));
  }
  uVar7 = 0;
  if (local_a8 == 0) {
    puVar12[6] = 0;
    if (*(short *)((int)puVar12 + 10) != 0) {
      uVar10 = 0;
      do {
        uVar10 = uVar10 + *(int *)(local_b0 + uVar7 * 4);
        uVar7 = uVar7 + 1;
        puVar12[6] = uVar10;
        this = local_b4;
      } while (uVar7 < *(ushort *)((int)puVar12 + 10));
    }
    puVar12[7] = puVar12[8];
  }
  else {
    puVar12[7] = 0;
    if (*(char *)((int)puVar12 + 0xe) == '\0') {
      puVar12[6] = local_98;
      if (*(short *)((int)puVar12 + 10) != 0) {
        uVar10 = puVar12[7];
        do {
          uVar10 = uVar10 + *(int *)(local_b0 + uVar7 * 4);
          uVar7 = uVar7 + 1;
          puVar12[7] = uVar10;
          this = local_b4;
        } while (uVar7 < *(ushort *)((int)puVar12 + 10));
      }
    }
    else {
      puVar12[6] = puVar12[8];
      if (*(short *)((int)puVar12 + 10) != 0) {
        uVar10 = puVar12[7];
        do {
          uVar10 = uVar10 + *(int *)(local_b0 + uVar7 * 4);
          uVar7 = uVar7 + 1;
          puVar12[7] = uVar10;
          this = local_b4;
        } while (uVar7 < *(ushort *)((int)puVar12 + 10));
      }
    }
  }
  FUN_1005af00(this,*(uint *)(local_58 + local_5c[3]),(uint)*(byte *)(local_58 + local_5c[3] + 0xe),
               1,*(int **)((int)this + 0x88),0);
LAB_1005d0ee:
  __security_check_cookie(local_14 ^ (uint)auStack_b8);
  return;
}


//==== 1005c240 in 1005c240 FUN_1005c240

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 __thiscall
FUN_1005c240(void *this,int param_1,uint *param_2,undefined4 *param_3,int param_4,int param_5)

{
  undefined1 uVar1;
  ushort uVar2;
  uint uVar3;
  undefined4 uVar4;
  longlong lVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  uint uVar10;
  undefined4 extraout_ECX;
  uint uVar11;
  int *piVar12;
  int iVar13;
  longlong lVar14;
  undefined8 uVar15;
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  int local_20;
  int local_14;
  void *local_c;
  
  local_14 = 0;
  uVar8 = param_3[4];
  local_44 = 0;
  local_48 = 0;
  local_c = (void *)0x0;
  if (uVar8 == 0) {
    return 0;
  }
  uVar2 = *(ushort *)((int)param_2 + 10);
  uVar10 = (uint)uVar2;
  iVar6 = *(int *)((int)this + *param_2 * 4 + 0xd4);
  iVar6 = iVar6 + (iVar6 >> 0x1f & 3U);
  uVar11 = iVar6 >> 0x1f;
  if (param_4 != 0) {
    local_c = (void *)FUN_100bbda1(uVar10 * 4);
    memset(local_c,0,(uint)uVar2 << 2);
    FUN_1005b4d0(this,param_1,extraout_ECX,(int)param_2,(int)local_c);
    iVar13 = 0;
    if (uVar10 != 0) {
      do {
        uVar3 = *(uint *)((int)this + *param_2 * 4 + 0xf0);
        if (uVar3 == 100) {
          iVar7 = HncIntMulDiv();
        }
        else {
          lVar5 = (longlong)(int)((iVar6 >> 2 ^ uVar11) - uVar11) *
                  (longlong)*(int *)((int)local_c + iVar13 * 4);
          lVar14 = __allmul((uint)lVar5,(int)((ulonglong)lVar5 >> 0x20),uVar3,(int)uVar3 >> 0x1f);
          lVar5 = (ulonglong)uVar8 * 100;
          uVar15 = __alldiv((uint)lVar14,(uint)((ulonglong)lVar14 >> 0x20),(uint)lVar5,
                            (uint)((ulonglong)lVar5 >> 0x20));
          iVar7 = (int)uVar15;
        }
        *(int *)((int)local_c + iVar13 * 4) = iVar7 << 2;
        iVar13 = iVar13 + 1;
      } while (iVar13 < (int)uVar10);
    }
  }
  if (((*(byte *)((int)this + 0xa4) & 1) != 0) || (*(int *)((int)this + 0xa8) != 8)) {
    if (local_c != (void *)0x0) {
      free(local_c);
    }
    return 1;
  }
  if (*(int *)((int)this + 8) == 0) {
    local_40 = 0;
    local_3c = 0;
    local_38 = 0;
    local_34 = 0;
    local_30 = 0;
    local_2c = _UNK_100c8cec;
    local_28 = _UNK_100c8ce8;
    local_24 = _UNK_100c8ce4;
    local_20 = _DAT_100c8ce0;
  }
  else {
    local_20 = *(int *)((int)this + 0x24);
    local_24 = *(undefined4 *)((int)this + 0x28);
    local_28 = *(undefined4 *)((int)this + 0x2c);
    local_2c = *(undefined4 *)((int)this + 0x30);
    local_30 = *(undefined4 *)((int)this + 0x34);
    local_34 = *(undefined4 *)((int)this + 0x38);
    local_38 = *(undefined4 *)((int)this + 0x3c);
    local_3c = *(undefined4 *)((int)this + 0x40);
    local_40 = *(undefined4 *)((int)this + 0x44);
    local_44 = *(undefined4 *)((int)this + 0x48);
    local_48 = *(undefined4 *)((int)this + 0x4c);
  }
  FUN_1002c8c0(this,8);
  if ((*(int *)((int)this + 8) != 0) &&
     ((*(int *)((int)this + 0x24) == 7 || (*(int *)((int)this + 0x24) == 8)))) {
    *(undefined4 *)((int)this + 0x28) = *(undefined4 *)((int)this + 0xac);
    *(undefined4 *)((int)this + 0x2c) = *(undefined4 *)((int)this + 0xb0);
  }
  if (*(int *)((int)this + 8) != 0) {
    if ((*(int *)((int)this + 0x24) == 7) || (*(int *)((int)this + 0x24) == 8)) {
      *(undefined4 *)((int)this + 0x30) = *(undefined4 *)((int)this + 0xb4);
      *(undefined4 *)((int)this + 0x34) = *(undefined4 *)((int)this + 0xb8);
    }
    *(undefined4 *)((int)this + 0x38) = *(undefined4 *)((int)this + 0xbc);
    *(undefined4 *)((int)this + 0x3c) = *(undefined4 *)((int)this + 0xc0);
    *(undefined4 *)((int)this + 0x40) = *(undefined4 *)((int)this + 0xc4);
    *(undefined4 *)((int)this + 0x44) = *(undefined4 *)((int)this + 200);
    *(undefined4 *)((int)this + 0x48) = *(undefined4 *)((int)this + 0xcc);
    *(undefined4 *)((int)this + 0x4c) = *(undefined4 *)((int)this + 0xd0);
  }
  uVar4 = *param_3;
  uVar1 = *(undefined1 *)((int)param_3 + 6);
  *param_3 = *(undefined4 *)((int)this + *param_2 * 4 + 0xd4);
  *(undefined1 *)((int)param_3 + 6) = *(undefined1 *)((int)this + *param_2 * 4 + 0xf0);
  FUN_1005af00(this,*param_2,0,1,*(int **)((int)this + 0x88),0);
  iVar6 = 0;
  if (uVar2 != 0) {
    do {
      if (((iVar6 < (int)(uVar10 - 1)) &&
          ((ushort)(*(short *)(param_1 + iVar6 * 2) + 0x2800U) < 0x400)) &&
         ((ushort)(*(short *)(param_1 + 2 + iVar6 * 2) + 0x2400U) < 0x400)) {
        iVar6 = iVar6 + 1;
      }
      else {
        uVar8 = (uint)*(ushort *)(param_1 + iVar6 * 2);
        if (uVar8 == 0x20) {
          if (0 < iVar6) {
            piVar12 = (int *)(param_5 + -4 + iVar6 * 4);
            *piVar12 = *piVar12 + local_14;
            local_14 = 0;
          }
        }
        else {
          iVar9 = FUN_1005b920(this,uVar8);
          iVar7 = *(int *)(param_5 + iVar6 * 4);
          iVar13 = local_14;
          if (iVar7 != iVar9) {
            uVar8 = iVar7 - iVar9;
            iVar13 = (int)uVar8 / 2;
            uVar8 = uVar8 & 0x80000001;
            if ((int)uVar8 < 0) {
              uVar8 = (uVar8 - 1 | 0xfffffffe) + 1;
            }
            if (iVar6 == 0) {
              iVar9 = iVar9 + iVar13;
              iVar13 = uVar8 + iVar13;
              if (uVar2 != 1) goto LAB_1005c59c;
            }
            else {
              piVar12 = (int *)(param_5 + -4 + iVar6 * 4);
              *piVar12 = *piVar12 + iVar13;
              if (iVar6 < (int)(uVar10 - 1)) {
                iVar13 = uVar8 + iVar13;
              }
              else {
                iVar13 = local_14 + uVar8 + iVar13;
              }
            }
            iVar9 = iVar9 + iVar13;
            iVar13 = local_14;
          }
LAB_1005c59c:
          local_14 = iVar13;
          *(int *)(param_5 + iVar6 * 4) = iVar9;
          if ((param_4 != 0) && (local_c != (void *)0x0)) {
            *(int *)(param_5 + iVar6 * 4) = *(int *)((int)local_c + iVar6 * 4) + iVar9;
          }
        }
      }
      iVar6 = iVar6 + 1;
    } while (iVar6 < (int)uVar10);
  }
  if (local_c != (void *)0x0) {
    free(local_c);
  }
  piVar12 = *(int **)((int)this + 8);
  if (piVar12 != (int *)0x0) {
    if (((*(int *)((int)this + 0x24) != local_20) &&
        (*(int *)((int)this + 0x24) = local_20, local_20 != 7)) && (local_20 != 8)) {
      (**(code **)(*piVar12 + 0x68))();
      (**(code **)(**(int **)((int)this + 8) + 0x78))((int)this + 0x30);
      (**(code **)(**(int **)((int)this + 8) + 0x90))();
      piVar12 = *(int **)((int)this + 8);
    }
    (**(code **)(*piVar12 + 0x68))();
    if (*(int *)((int)this + 8) != 0) {
      iVar6 = *(int *)((int)this + 0x24);
      if ((iVar6 == 7) || (iVar6 == 8)) {
        *(undefined4 *)((int)this + 0x28) = local_24;
        *(undefined4 *)((int)this + 0x2c) = local_28;
      }
      if ((iVar6 == 7) || (iVar6 == 8)) {
        *(undefined4 *)((int)this + 0x30) = local_2c;
        *(undefined4 *)((int)this + 0x34) = local_30;
      }
      *(undefined4 *)((int)this + 0x38) = local_34;
      *(undefined4 *)((int)this + 0x3c) = local_38;
      *(undefined4 *)((int)this + 0x40) = local_3c;
      *(undefined4 *)((int)this + 0x44) = local_40;
      *(undefined4 *)((int)this + 0x48) = local_44;
      *(undefined4 *)((int)this + 0x4c) = local_48;
    }
  }
  *param_3 = uVar4;
  *(undefined1 *)((int)param_3 + 6) = uVar1;
  FUN_1005af00(this,*param_2,(uint)*(byte *)((int)param_2 + 0xe),1,*(int **)((int)this + 0x88),0);
  return 1;
}


//==== 1005b4d0 in 1005b4d0 FUN_1005b4d0

void __thiscall FUN_1005b4d0(void *this,int param_1,undefined4 param_2,int param_3,int param_4)

{
  int *piVar1;
  int iVar2;
  void *pvVar3;
  uint uVar4;
  uint uVar5;
  int iVar6;
  undefined4 local_28;
  void *local_24;
  size_t local_20;
  undefined2 local_1c;
  undefined2 local_1a;
  uint local_14;
  void *local_10;
  void *local_c;
  size_t local_8;
  
  uVar4 = 1;
  local_14 = 1;
  local_28 = *(undefined4 *)((int)this + 0x94);
  iVar2 = _HncCacheGet_8(DAT_100f015c,&local_28);
  if (iVar2 == 0) {
    local_20 = FUN_10076160(*(int **)((int)this + 8),&local_10);
    if (local_20 == 0) {
      return;
    }
    local_28 = *(undefined4 *)((int)this + 0x94);
    local_c = local_10;
    local_24 = local_10;
    local_8 = local_20;
    iVar2 = _HncCachePut_8(DAT_100f015c,&local_28);
    uVar4 = (uint)(iVar2 != 0);
    local_14 = uVar4;
  }
  else {
    local_10 = *(void **)(iVar2 + 4);
    local_8 = *(size_t *)(iVar2 + 8);
    local_c = local_10;
  }
  uVar5 = 0;
  if (*(short *)(param_3 + 10) != 1) {
    do {
      local_1c = *(undefined2 *)(param_1 + uVar5 * 2);
      local_1a = *(undefined2 *)(param_1 + 2 + uVar5 * 2);
      pvVar3 = bsearch(&local_1c,local_10,local_8,8,FUN_10076130);
      if (pvVar3 != (void *)0x0) {
        iVar2 = *(int *)((int)pvVar3 + 4);
        if (*(float *)((int)this + 0x78) != 0.0) {
          iVar2 = (int)((float)iVar2 * *(float *)((int)this + 0x78));
        }
        if (*(int *)((int)this + 0x24) != 1) {
          iVar6 = *(int *)((int)this + 0x30);
          if (iVar6 == 0) {
            iVar6 = 1;
          }
          iVar2 = HncIntMulDiv(iVar2,*(undefined4 *)((int)this + 0x28),iVar6);
        }
        piVar1 = (int *)(param_4 + uVar5 * 4);
        *piVar1 = *piVar1 + iVar2;
      }
      uVar5 = uVar5 + 1;
      local_10 = local_c;
      uVar4 = local_14;
    } while (uVar5 < *(ushort *)(param_3 + 10) - 1);
  }
  if (uVar4 == 0) {
    free(local_c);
  }
  return;
}


