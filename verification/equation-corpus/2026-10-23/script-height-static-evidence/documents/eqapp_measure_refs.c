//==== 10011850 FUN_10011850 refs 10012960 from 10011962

void __thiscall
FUN_10011850(void *this,undefined4 param_1,undefined4 param_2,int param_3,int param_4)

{
  void *this_00;
  short sVar1;
  wchar_t *pwVar2;
  tagSIZE *ptVar3;
  undefined4 *puVar4;
  tagSIZE local_c [8];
  
  this_00 = *(void **)this;
  pwVar2 = (wchar_t *)((int)this_00 + 0x858);
  *(undefined4 *)((int)this + 0xc) = 0;
  *(undefined4 *)((int)this + 8) = 0;
  *(int *)((int)this + 0x18) = param_4;
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10011f10(this_00,param_4,pwVar2);
  if (param_3 == 0) {
    param_3 = *(int *)(*(int *)this + 0x848);
  }
  *(int *)((int)this + 0x10) = param_3;
  if (*(int *)((int)this + 4) == 0x13) {
    if (*(ushort *)((int)this + 0x26) != 0) {
      puVar4 = (undefined4 *)
               FUN_10012960(*(void **)this,(undefined4 *)local_c,(uint)*(ushort *)((int)this + 0x26)
                           );
      *(undefined4 *)((int)this + 0x44) = *puVar4;
      *(undefined4 *)((int)this + 0x48) = puVar4[1];
    }
  }
  else {
    if (*(ushort *)((int)this + 0x20) != 0) {
      ptVar3 = FUN_10012bd0(*(void **)this,local_c,*(ushort *)((int)this + 0x20));
      *(undefined4 *)((int)this + 0x2c) = *(undefined4 *)ptVar3;
      *(undefined4 *)((int)this + 0x30) = *(undefined4 *)(ptVar3 + 4);
    }
    if (*(ushort *)((int)this + 0x22) != 0) {
      ptVar3 = FUN_10012bd0(*(void **)this,local_c,*(ushort *)((int)this + 0x22));
      *(undefined4 *)((int)this + 0x34) = *(undefined4 *)ptVar3;
      *(undefined4 *)((int)this + 0x38) = *(undefined4 *)(ptVar3 + 4);
    }
    if (*(ushort *)((int)this + 0x24) != 0) {
      ptVar3 = FUN_10012bd0(*(void **)this,local_c,*(ushort *)((int)this + 0x24));
      *(undefined4 *)((int)this + 0x3c) = *(undefined4 *)ptVar3;
      *(undefined4 *)((int)this + 0x40) = *(undefined4 *)(ptVar3 + 4);
    }
    sVar1 = 0;
    if (*(ushort *)((int)this + 0x26) != 0) {
      ptVar3 = FUN_10012bd0(*(void **)this,local_c,*(ushort *)((int)this + 0x26));
      *(undefined4 *)((int)this + 0x44) = *(undefined4 *)ptVar3;
      *(undefined4 *)((int)this + 0x48) = *(undefined4 *)(ptVar3 + 4);
      sVar1 = *(short *)((int)this + 0x26);
    }
    if ((sVar1 == 0x2329) || (sVar1 == 0x232a)) {
      *(int *)((int)this + 0x44) = (*(int *)((int)this + 0x44) * 2) / 3;
    }
  }
  switch(*(undefined4 *)((int)this + 4)) {
  case 1:
  case 2:
  case 9:
  case 10:
    *(int *)((int)this + 0x14) =
         *(int *)((int)this + 0x48) + *(int *)((int)this + 0x38) + *(int *)((int)this + 0x30);
    return;
  case 3:
  case 0xb:
    *(int *)((int)this + 0x14) = *(int *)((int)this + 0x38) + *(int *)((int)this + 0x30);
    return;
  default:
    *(undefined4 *)((int)this + 0x14) = *(undefined4 *)((int)this + 0x48);
    return;
  }
}


//==== 1000a980 FUN_1000a980 refs 10012960 from 1000ab40

void __thiscall FUN_1000a980(void *this,int *param_1,uint param_2)

{
  uint uVar1;
  ushort ****ppppuVar2;
  char cVar3;
  ushort uVar4;
  uint uVar5;
  uint *puVar6;
  int iVar7;
  ushort *****pppppuVar8;
  wchar_t *pwVar9;
  wchar_t *****pppppwVar10;
  wchar_t *****pppppwVar11;
  short *psVar12;
  int *piVar13;
  int iVar14;
  int iVar15;
  undefined4 *puVar16;
  undefined *local_174 [4];
  undefined *local_164 [2];
  undefined **local_15c [2];
  basic_iostream<unsigned_short,std::char_traits<unsigned_short>_> local_154 [48];
  undefined4 local_124;
  undefined4 local_120;
  basic_ios<unsigned_short,std::char_traits<unsigned_short>_> local_10c [72];
  int *local_c4;
  int local_c0;
  int local_bc;
  uint local_b4;
  uint local_b0;
  int local_ac;
  undefined4 local_a8;
  undefined4 *local_a4;
  int local_a0;
  int local_9c;
  uint local_98;
  undefined4 *local_94;
  char local_8d;
  wchar_t ****local_8c [4];
  undefined4 local_7c;
  uint local_78;
  wchar_t ****local_74 [4];
  uint local_64;
  uint local_60;
  wchar_t ****local_5c [4];
  int local_4c;
  uint local_48;
  undefined4 local_44;
  int local_34;
  uint local_30;
  ushort ****local_2c [4];
  uint local_1c;
  uint local_18;
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8._0_1_ = 0xff;
  local_8._1_3_ = 0xffffff;
  puStack_c = &LAB_10061145;
  local_10 = ExceptionList;
  uVar5 = DAT_1008a054 ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  local_c4 = param_1;
  local_98 = param_2;
  local_94 = (undefined4 *)0x0;
  local_a4 = (undefined4 *)0x0;
  local_14 = uVar5;
  if ((param_2 == 0) || (*(int *)((int)this + 0x44) != 0)) {
    *(undefined4 *)((int)this + 0x44) = 0;
    FUN_1000d3b0((int)this);
    piVar13 = *(int **)((int)this + 0x6c);
    local_c0 = 0;
    local_bc = 0;
    puVar16 = (undefined4 *)0x0;
    if (0 < *(int *)((int)this + 0x70)) {
      iVar15 = 0;
      do {
        piVar13[2] = *(int *)((int)this + 8);
        (**(code **)(*piVar13 + 8))(&local_a8,local_98,uVar5);
        piVar13 = (int *)piVar13[0x19];
        puVar16 = local_94;
        if (piVar13 == (int *)0x0) break;
        iVar15 = iVar15 + 1;
      } while (iVar15 < *(int *)((int)this + 0x70));
    }
    iVar15 = *(int *)((int)this + 0x6c);
    *(undefined1 *)((int)this + 0x88) = 1;
    local_b4 = 0;
    if (0 < *(int *)((int)this + 0x78)) {
      do {
        iVar7 = *(int *)(*(int *)(iVar15 + 0x8c) + 100);
        if ((iVar7 != 0) && (iVar7 != *(int *)(iVar15 + 0x90))) {
          FUN_1000cee0(local_2c,(undefined4 *)(iVar7 + 0x24));
          puVar16 = (undefined4 *)((uint)puVar16 | 1);
          pppppuVar8 = local_2c;
          if (7 < local_18) {
            pppppuVar8 = (ushort *****)local_2c[0];
          }
          uVar4 = *(ushort *)pppppuVar8;
          local_98 = (uint)uVar4;
          local_94 = puVar16;
          if (7 < local_18) {
            pppppuVar8 = (ushort *****)local_2c[0];
            if ((0xfff < local_18 * 2 + 2) &&
               (pppppuVar8 = (ushort *****)local_2c[0][-1],
               0x1f < (uint)((int)local_2c[0] + (-4 - (int)pppppuVar8)))) goto LAB_1000aeb8;
            delete(pppppuVar8);
            uVar4 = (ushort)local_98;
          }
          if (((uVar4 == 0x20) || (uVar4 == 0x7e)) || (uVar4 == 0x60)) {
            *(undefined1 *)((int)this + 0x88) = 0;
            break;
          }
        }
        iVar15 = *(int *)(iVar15 + 100);
        if ((iVar15 == 0) || (local_b4 = local_b4 + 1, *(int *)((int)this + 0x78) <= (int)local_b4))
        break;
      } while( true );
    }
    iVar15 = *(int *)((int)this + 0x6c);
    local_a0 = 0;
    local_9c = iVar15;
    uVar5 = FUN_10012c50(0x31);
    puVar6 = (uint *)FUN_10012960(*(void **)((int)this + 0x74),&local_a8,uVar5 & 0xffff);
    local_98 = *puVar6;
    memset(*(void **)((int)this + 0x8c),0,*(int *)((int)this + 0x78) << 2);
    if ((*(char *)((int)this + 0x88) == '\x01') && (local_b4 = 0, 0 < *(int *)((int)this + 0x78))) {
LAB_1000ab82:
      local_a4 = *(undefined4 **)(iVar15 + 0x60);
      if (local_a4 != (undefined4 *)0x0) {
        if ((local_b4 & 1) != 0) {
          local_b0 = 0;
          local_a0 = 0;
          iVar15 = *(int *)(local_a4[0x23] + 100);
          local_ac = *(int *)(*(int *)(local_9c + 0x8c) + 100);
          local_64 = 0;
          local_60 = 7;
          local_74[0] = (wchar_t ****)((uint)local_74[0] & 0xffff0000);
          local_4c = 0;
          local_48 = 7;
          local_5c[0] = (wchar_t ****)((uint)local_5c[0] & 0xffff0000);
          local_34 = 0;
          local_30 = 7;
          local_44 = (wchar_t *)((uint)local_44._2_2_ << 0x10);
          local_7c = 0;
          local_78 = 7;
          local_8c[0] = (wchar_t ****)((uint)local_8c[0] & 0xffff0000);
          local_8._0_1_ = 3;
          local_8._1_3_ = 0;
          while( true ) {
            if ((iVar15 == 0) || (iVar15 == local_a4[0x24])) goto LAB_1000ad42;
            FUN_1000cee0(local_2c,(undefined4 *)(iVar15 + 0x24));
            ppppuVar2 = local_2c[0];
            local_94 = (undefined4 *)((uint)puVar16 | 2);
            pppppuVar8 = local_2c;
            if (7 < local_18) {
              pppppuVar8 = (ushort *****)local_2c[0];
            }
            iVar7 = isdigit((uint)*(ushort *)pppppuVar8);
            local_8d = iVar7 == 0;
            if (7 < local_18) {
              pppppuVar8 = (ushort *****)ppppuVar2;
              if ((0xfff < local_18 * 2 + 2) &&
                 (pppppuVar8 = (ushort *****)ppppuVar2[-1],
                 0x1f < (uint)((int)ppppuVar2 + (-4 - (int)pppppuVar8)))) goto LAB_1000aeb8;
              delete(pppppuVar8);
            }
            if (local_8d != '\0') break;
            FUN_1000cee0(local_2c,(undefined4 *)(iVar15 + 0x24));
            puVar16 = (undefined4 *)((uint)local_94 | 4);
            local_8._0_1_ = 4;
            pppppuVar8 = local_2c;
            if (7 < local_18) {
              pppppuVar8 = (ushort *****)local_2c[0];
            }
            local_94 = puVar16;
            FUN_1000cb40(local_74,pppppuVar8,local_1c);
            local_8._0_1_ = 3;
            if (7 < local_18) {
              pppppuVar8 = (ushort *****)local_2c[0];
              if ((0xfff < local_18 * 2 + 2) &&
                 (pppppuVar8 = (ushort *****)local_2c[0][-1],
                 0x1f < (uint)((int)local_2c[0] + (-4 - (int)pppppuVar8)))) goto LAB_1000aeb8;
              delete(pppppuVar8);
            }
            iVar15 = *(int *)(iVar15 + 100);
          }
          *(undefined1 *)((int)this + 0x88) = 0;
          puVar16 = local_94;
LAB_1000ad42:
          cVar3 = *(char *)((int)this + 0x88);
          if (cVar3 != '\0') {
            while ((local_ac != 0 && (local_ac != *(int *)(local_9c + 0x90)))) {
              local_a4 = (undefined4 *)(local_ac + 0x24);
              FUN_1000cee0(local_2c,local_a4);
              uVar5 = local_18;
              ppppuVar2 = local_2c[0];
              local_94 = (undefined4 *)((uint)puVar16 | 8);
              pppppuVar8 = local_2c;
              if (7 < local_18) {
                pppppuVar8 = (ushort *****)local_2c[0];
              }
              iVar15 = isdigit((uint)*(ushort *)pppppuVar8);
              local_8d = iVar15 == 0;
              if (7 < uVar5) {
                pppppuVar8 = (ushort *****)ppppuVar2;
                if ((0xfff < uVar5 * 2 + 2) &&
                   (pppppuVar8 = (ushort *****)ppppuVar2[-1],
                   0x1f < (uint)((int)ppppuVar2 + (-4 - (int)pppppuVar8)))) goto LAB_1000aeb8;
                delete(pppppuVar8);
              }
              if (local_8d != '\0') {
                *(undefined1 *)((int)this + 0x88) = 0;
                goto LAB_1000ae7d;
              }
              FUN_1000cee0(local_2c,local_a4);
              puVar16 = (undefined4 *)((uint)local_94 | 0x10);
              local_8._0_1_ = 5;
              pppppuVar8 = local_2c;
              if (7 < local_18) {
                pppppuVar8 = (ushort *****)local_2c[0];
              }
              local_94 = puVar16;
              FUN_1000cb40(local_5c,pppppuVar8,local_1c);
              local_8._0_1_ = 3;
              if (7 < local_18) {
                pppppuVar8 = (ushort *****)local_2c[0];
                if ((0xfff < local_18 * 2 + 2) &&
                   (pppppuVar8 = (ushort *****)local_2c[0][-1],
                   0x1f < (uint)((int)local_2c[0] + (-4 - (int)pppppuVar8)))) goto LAB_1000aeb8;
                delete(pppppuVar8);
              }
              cVar3 = *(char *)((int)this + 0x88);
              local_ac = *(int *)(local_ac + 100);
              if (cVar3 == '\0') goto LAB_1000ae7d;
            }
            if (cVar3 != '\0') {
              if ((local_64 != 0) && (local_4c != 0)) {
                pppppwVar10 = local_74;
                if (7 < local_60) {
                  pppppwVar10 = (wchar_t *****)local_74[0];
                }
                pwVar9 = (wchar_t *)&local_44;
                if (7 < local_30) {
                  pwVar9 = local_44;
                }
                local_34 = 1;
                *pwVar9 = *(wchar_t *)pppppwVar10;
                pwVar9[1] = L'\0';
                pppppwVar10 = local_5c;
                if (7 < local_48) {
                  pppppwVar10 = (wchar_t *****)local_5c[0];
                }
                pppppwVar11 = local_8c;
                if (7 < local_78) {
                  pppppwVar11 = (wchar_t *****)local_8c[0];
                }
                local_7c = 1;
                *(wchar_t *)pppppwVar11 = *(wchar_t *)pppppwVar10;
                *(wchar_t *)((int)pppppwVar11 + 2) = L'\0';
                pwVar9 = (wchar_t *)&local_44;
                if (7 < local_30) {
                  pwVar9 = local_44;
                }
                iVar15 = _wtoi(pwVar9);
                pppppwVar10 = local_8c;
                if (7 < local_78) {
                  pppppwVar10 = (wchar_t *****)local_8c[0];
                }
                iVar7 = _wtoi((wchar_t *)pppppwVar10);
                uVar5 = (uint)(iVar15 < iVar7);
                local_b0 = uVar5;
                if (local_4c + uVar5 < local_64) {
                  do {
                    uVar1 = local_64 - 1;
                    if (local_64 < uVar1) {
                    /* WARNING: Subroutine does not return */
                      FUN_1000c970();
                    }
                    pppppwVar10 = local_74;
                    if (7 < local_60) {
                      pppppwVar10 = (wchar_t *****)local_74[0];
                    }
                    local_64 = uVar1;
                    *(wchar_t *)((int)pppppwVar10 + uVar1 * 2) = L'\0';
                  } while (local_4c + uVar5 < local_64);
                }
                if (local_64 < local_4c + uVar5) {
                  do {
                    FUN_1000cb40(local_74,&DAT_1006b534,1);
                  } while (local_64 < local_4c + uVar5);
                }
                pppppwVar10 = local_74;
                if (7 < local_60) {
                  pppppwVar10 = (wchar_t *****)local_74[0];
                }
                iVar15 = _wtoi((wchar_t *)pppppwVar10);
                pppppwVar10 = local_5c;
                if (7 < local_48) {
                  pppppwVar10 = (wchar_t *****)local_5c[0];
                }
                iVar7 = _wtoi((wchar_t *)pppppwVar10);
                iVar15 = iVar15 - iVar7;
                puVar16 = local_94;
                if (iVar15 < 0) {
                  local_a0 = 0;
                }
                else if (iVar15 == 0) {
                  local_a0 = local_4c;
                }
                else if (0 < iVar15) {
                  local_1c = 0;
                  local_18 = 7;
                  local_2c[0] = (ushort ****)((uint)local_2c[0] & 0xffff0000);
                  local_8._0_1_ = 6;
                  local_174[0] = &DAT_1006b59c;
                  local_164[0] = &DAT_1006b594;
                  std::basic_ios<unsigned_short,std::char_traits<unsigned_short>_>::
                  basic_ios<unsigned_short,std::char_traits<unsigned_short>_>(local_10c);
                  local_8 = CONCAT31(local_8._1_3_,7);
                  puVar16 = (undefined4 *)((uint)local_94 | 0x20);
                  local_a4 = puVar16;
                  local_94 = puVar16;
                  std::basic_iostream<unsigned_short,std::char_traits<unsigned_short>_>::
                  basic_iostream<unsigned_short,std::char_traits<unsigned_short>_>
                            ((basic_iostream<unsigned_short,std::char_traits<unsigned_short>_> *)
                             local_174,
                             (basic_streambuf<unsigned_short,std::char_traits<unsigned_short>_> *)
                             local_15c);
                  local_8 = 8;
                  *(undefined ***)((int)local_174 + *(int *)(local_174[0] + 4)) = &PTR_LAB_1006b5a4;
                  *(int *)((int)local_15c + *(int *)(local_174[0] + 4) + -0x1c) =
                       *(int *)(local_174[0] + 4) + -0x68;
                  std::basic_streambuf<unsigned_short,std::char_traits<unsigned_short>_>::
                  basic_streambuf<unsigned_short,std::char_traits<unsigned_short>_>
                            ((basic_streambuf<unsigned_short,std::char_traits<unsigned_short>_> *)
                             local_15c);
                  local_15c[0] = &PTR__scalar_deleting_destructor__1006b558;
                  local_124 = 0;
                  local_120 = 0;
                  local_8._0_1_ = 9;
                  std::basic_ostream<unsigned_short,std::char_traits<unsigned_short>_>::operator<<
                            ((basic_ostream<unsigned_short,std::char_traits<unsigned_short>_> *)
                             local_164,iVar15);
                  FUN_1000c310((basic_istream<unsigned_short,std::char_traits<unsigned_short>_> *)
                               local_174,local_2c);
                  local_a0 = local_4c - local_1c;
                  *(undefined ***)((int)local_174 + *(int *)(local_174[0] + 4)) = &PTR_LAB_1006b5a4;
                  *(int *)((int)local_15c + *(int *)(local_174[0] + 4) + -0x1c) =
                       *(int *)(local_174[0] + 4) + -0x68;
                  FUN_1000c170((basic_streambuf<unsigned_short,std::char_traits<unsigned_short>_> *)
                               local_15c);
                  std::basic_iostream<unsigned_short,std::char_traits<unsigned_short>_>::
                  ~basic_iostream<unsigned_short,std::char_traits<unsigned_short>_>(local_154);
                  std::basic_ios<unsigned_short,std::char_traits<unsigned_short>_>::
                  ~basic_ios<unsigned_short,std::char_traits<unsigned_short>_>(local_10c);
                  local_8._0_1_ = 3;
                  if (7 < local_18) {
                    pppppuVar8 = (ushort *****)local_2c[0];
                    if ((0xfff < local_18 * 2 + 2) &&
                       (pppppuVar8 = (ushort *****)local_2c[0][-1],
                       0x1f < (uint)((int)local_2c[0] + (-4 - (int)pppppuVar8)))) goto LAB_1000aeb8;
                    delete(pppppuVar8);
                  }
                }
              }
              local_8._0_1_ = 2;
              *(uint *)(*(int *)((int)this + 0x8c) + local_b4 * 4) = local_98 * local_b0;
              if (7 < local_78) {
                pppppwVar10 = (wchar_t *****)local_8c[0];
                if ((0xfff < local_78 * 2 + 2) &&
                   (pppppwVar10 = (wchar_t *****)local_8c[0][-1],
                   0x1f < (uint)((int)local_8c[0] + (-4 - (int)pppppwVar10)))) goto LAB_1000aeb8;
                delete(pppppwVar10);
              }
              local_8._0_1_ = 1;
              local_7c = 0;
              local_78 = 7;
              local_8c[0] = (wchar_t ****)((uint)local_8c[0] & 0xffff0000);
              if (7 < local_30) {
                pwVar9 = local_44;
                if ((0xfff < local_30 * 2 + 2) &&
                   (pwVar9 = *(wchar_t **)(local_44 + -2),
                   0x1f < (uint)((int)local_44 + (-4 - (int)pwVar9)))) goto LAB_1000aeb8;
                delete(pwVar9);
              }
              local_34 = 0;
              local_8._0_1_ = 0;
              local_30 = 7;
              local_44 = (wchar_t *)((uint)local_44 & 0xffff0000);
              if (7 < local_48) {
                pppppwVar10 = (wchar_t *****)local_5c[0];
                if ((0xfff < local_48 * 2 + 2) &&
                   (pppppwVar10 = (wchar_t *****)local_5c[0][-1],
                   0x1f < (uint)((int)local_5c[0] + (-4 - (int)pppppwVar10)))) goto LAB_1000aeb8;
                delete(pppppwVar10);
              }
              local_8._0_1_ = 0xff;
              local_8._1_3_ = 0xffffff;
              local_4c = 0;
              local_48 = 7;
              local_5c[0] = (wchar_t ****)((uint)local_5c[0] & 0xffff0000);
              iVar15 = local_9c;
              if (7 < local_60) {
                pppppwVar10 = (wchar_t *****)local_74[0];
                if ((local_60 * 2 + 2 < 0x1000) ||
                   (pppppwVar10 = (wchar_t *****)local_74[0][-1],
                   (uint)((int)local_74[0] + (-4 - (int)pppppwVar10)) < 0x20)) {
                  delete(pppppwVar10);
                  iVar15 = local_9c;
                  goto LAB_1000b166;
                }
                goto LAB_1000aeb8;
              }
              goto LAB_1000b166;
            }
          }
LAB_1000ae7d:
          if (7 < local_78) {
            pppppwVar10 = (wchar_t *****)local_8c[0];
            if ((0xfff < local_78 * 2 + 2) &&
               (pppppwVar10 = (wchar_t *****)local_8c[0][-1],
               0x1f < (uint)((int)local_8c[0] + (-4 - (int)pppppwVar10)))) {
LAB_1000aeb8:
                    /* WARNING: Subroutine does not return */
              _invalid_parameter_noinfo_noreturn();
            }
            delete(pppppwVar10);
          }
          local_7c = 0;
          local_78 = 7;
          local_8c[0] = (wchar_t ****)((uint)local_8c[0] & 0xffff0000);
          if (7 < local_30) {
            pwVar9 = local_44;
            if ((0xfff < local_30 * 2 + 2) &&
               (pwVar9 = *(wchar_t **)(local_44 + -2),
               0x1f < (uint)((int)local_44 + (-4 - (int)pwVar9)))) {
                    /* WARNING: Subroutine does not return */
              _invalid_parameter_noinfo_noreturn();
            }
            delete(pwVar9);
          }
          local_34 = 0;
          local_30 = 7;
          local_44 = (wchar_t *)((uint)local_44 & 0xffff0000);
          if (7 < local_48) {
            pppppwVar10 = (wchar_t *****)local_5c[0];
            if ((0xfff < local_48 * 2 + 2) &&
               (pppppwVar10 = (wchar_t *****)local_5c[0][-1],
               0x1f < (uint)((int)local_5c[0] + (-4 - (int)pppppwVar10)))) {
                    /* WARNING: Subroutine does not return */
              _invalid_parameter_noinfo_noreturn();
            }
            delete(pppppwVar10);
          }
          local_4c = 0;
          local_48 = 7;
          local_5c[0] = (wchar_t ****)((uint)local_5c[0] & 0xffff0000);
          if (7 < local_60) {
            pppppwVar10 = (wchar_t *****)local_74[0];
            if ((0xfff < local_60 * 2 + 2) &&
               (pppppwVar10 = (wchar_t *****)local_74[0][-1],
               0x1f < (uint)((int)local_74[0] + (-4 - (int)pppppwVar10)))) {
                    /* WARNING: Subroutine does not return */
              _invalid_parameter_noinfo_noreturn();
            }
            delete(pppppwVar10);
          }
          goto LAB_1000b56d;
        }
        iVar7 = *(int *)(*(int *)(iVar15 + 0x8c) + 100);
        local_34 = 0;
        local_30 = 7;
        local_44 = (wchar_t *)((uint)local_44._2_2_ << 0x10);
        local_8 = 10;
        if ((iVar7 != 0) && (iVar7 != *(int *)(iVar15 + 0x90))) {
          FUN_1000cee0(local_2c,(undefined4 *)(iVar7 + 0x24));
          puVar16 = (undefined4 *)((uint)puVar16 | 0x40);
          local_8._0_1_ = 0xb;
          pppppuVar8 = local_2c;
          if (7 < local_18) {
            pppppuVar8 = (ushort *****)local_2c[0];
          }
          local_94 = puVar16;
          FUN_1000cb40(&local_44,pppppuVar8,local_1c);
          local_8._0_1_ = 10;
          if (7 < local_18) {
            pppppuVar8 = (ushort *****)local_2c[0];
            if ((0xfff < local_18 * 2 + 2) &&
               (pppppuVar8 = (ushort *****)local_2c[0][-1],
               0x1f < (uint)((int)local_2c[0] + (-4 - (int)pppppuVar8)))) goto LAB_1000aeb8;
            delete(pppppuVar8);
          }
          pwVar9 = (wchar_t *)&local_44;
          if (7 < local_30) {
            pwVar9 = local_44;
          }
          iVar15 = local_9c;
          if (local_34 == 1) {
            psVar12 = &DAT_1006b534;
            iVar7 = 1;
            do {
              if (*(short *)((int)psVar12 + (int)(pwVar9 + -0x8035a9a)) != *psVar12)
              goto LAB_1000b3fe;
              psVar12 = psVar12 + 1;
              iVar7 = iVar7 + -1;
            } while (iVar7 != 0);
            local_a0 = local_a0 + -1;
          }
        }
LAB_1000b3fe:
        local_8._0_1_ = 0xff;
        local_8._1_3_ = 0xffffff;
        *(uint *)(*(int *)((int)this + 0x8c) + local_b4 * 4) = local_98 * local_a0;
        if (7 < local_30) {
          pwVar9 = local_44;
          if ((0xfff < local_30 * 2 + 2) &&
             (pwVar9 = *(wchar_t **)(local_44 + -2),
             0x1f < (uint)((int)local_44 + (-4 - (int)pwVar9)))) goto LAB_1000aeb8;
          delete(pwVar9);
        }
      }
LAB_1000b166:
      iVar15 = *(int *)(iVar15 + 100);
      local_b4 = local_b4 + 1;
      local_9c = iVar15;
      if (*(int *)((int)this + 0x78) <= (int)local_b4) goto LAB_1000b56d;
      goto LAB_1000ab82;
    }
LAB_1000b56d:
    iVar15 = *(int *)((int)this + 0x6c);
    memset(*(void **)((int)this + 0x84),0,*(int *)((int)this + 0x7c) << 2);
    memset(*(void **)((int)this + 0x80),0,*(int *)((int)this + 0x78) << 2);
    local_b0 = 0;
    if (0 < *(int *)((int)this + 0x78)) {
      do {
        iVar7 = 0;
        if (0 < *(int *)((int)this + 0x7c)) {
          do {
            if ((iVar7 == 0) && (*(char *)((int)this + 0x88) == '\x01')) {
              local_98 = *(uint *)(*(int *)((int)this + 0x8c) + local_b0 * 4);
              iVar14 = **(int **)((int)this + 0x84);
              if (iVar14 <= (int)(local_98 + *(int *)(iVar15 + 0x58))) {
                iVar14 = local_98 + *(int *)(iVar15 + 0x58);
              }
              **(int **)((int)this + 0x84) = iVar14;
            }
            else {
              iVar14 = *(int *)(*(int *)((int)this + 0x84) + iVar7 * 4);
              if (iVar14 <= *(int *)(iVar15 + 0x58)) {
                iVar14 = *(int *)(iVar15 + 0x58);
              }
              *(int *)(*(int *)((int)this + 0x84) + iVar7 * 4) = iVar14;
            }
            piVar13 = (int *)(*(int *)((int)this + 0x80) + local_b0 * 4);
            iVar14 = *piVar13;
            if (iVar14 <= *(int *)(iVar15 + 0x5c)) {
              iVar14 = *(int *)(iVar15 + 0x5c);
            }
            *piVar13 = iVar14;
            iVar15 = *(int *)(iVar15 + 100);
            if (iVar15 == 0) goto LAB_1000b65b;
            iVar7 = iVar7 + 1;
          } while (iVar7 < *(int *)((int)this + 0x7c));
        }
      } while ((iVar15 != 0) &&
              (local_b0 = local_b0 + 1, (int)local_b0 < *(int *)((int)this + 0x78)));
    }
LAB_1000b65b:
    iVar15 = 0;
    if (0 < *(int *)((int)this + 0x78)) {
      iVar7 = 0;
      do {
        if (iVar15 != 0) {
          iVar7 = MulDiv(*(int *)((int)this + 8),0xf,100);
          iVar7 = local_bc + iVar7;
        }
        iVar7 = iVar7 + *(int *)(*(int *)((int)this + 0x80) + iVar15 * 4);
        iVar15 = iVar15 + 1;
        local_bc = iVar7;
      } while (iVar15 < *(int *)((int)this + 0x78));
    }
    iVar7 = 0;
    iVar15 = 0;
    if (0 < *(int *)((int)this + 0x7c)) {
      do {
        if (iVar7 != 0) {
          iVar15 = MulDiv(*(int *)((int)this + 8),0x14,100);
          iVar15 = local_c0 + iVar15;
        }
        iVar15 = iVar15 + *(int *)(*(int *)((int)this + 0x84) + iVar7 * 4);
        iVar7 = iVar7 + 1;
        local_c0 = iVar15;
      } while (iVar7 < *(int *)((int)this + 0x7c));
    }
    *(int *)((int)this + 0x58) = iVar15;
    *(int *)((int)this + 0x5c) = local_bc;
    *(int *)((int)this + 0x54) = -(local_bc / 2);
    *local_c4 = local_c0;
    iVar15 = local_bc;
  }
  else {
    *param_1 = *(int *)((int)this + 0x58);
    iVar15 = *(int *)((int)this + 0x5c);
  }
  local_c4[1] = iVar15;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


//==== 100105d0 FUN_100105d0 refs 10012960 from 100106bc

void __thiscall FUN_100105d0(void *this,int *param_1,int param_2)

{
  void *this_00;
  wchar_t *pwVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  int *piVar6;
  int iStack_18;
  int iStack_10;
  int iStack_c;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar5 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar5;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_1000d3b0((int)this);
  this_00 = *(void **)((int)this + 0x74);
  iVar5 = *(int *)((int)this + 0x40);
  if (*(int *)((int)this + 0x94) != 0) {
    *(undefined4 *)((int)this_00 + 0x850) = 0;
  }
  pwVar1 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar1 = *(wchar_t **)pwVar1;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar1);
  iStack_18 = 0;
  if ((*(int *)((int)this + 100) != 0) && (*(int *)(*(int *)((int)this + 100) + 4) != 0x7a)) {
    iVar2 = FUN_10021070((int)this);
    iVar3 = FUN_10021070(*(int *)((int)this + 100));
    if (*(int *)(&DAT_1006bdf8 + (iVar3 + iVar2 * 10) * 4) != 0) {
      iStack_18 = MulDiv(*(int *)((int)this_00 + 0x848),
                         *(int *)(&DAT_1006bdf8 + (iVar3 + iVar2 * 10) * 4),100);
      iStack_18 = iStack_18 * 7;
    }
  }
  uVar4 = (uint)*(ushort *)((int)this + 0x9c);
  if (((uVar4 != 0x20) && (uVar4 != 0x7e)) && (uVar4 != 0x60)) {
    FUN_10012960(this_00,&iStack_10,uVar4);
    if (*(int *)((int)this + 0x94) != 0) {
      *(uint *)((int)this_00 + 0x850) = (uint)(iVar5 == 0);
    }
    *(int *)((int)this + 0x58) = iStack_10 + iStack_18;
    *(int *)((int)this + 0x5c) = iStack_c;
    *(int *)((int)this + 0x54) = -(iStack_c / 2);
    *param_1 = iStack_10 + iStack_18;
    param_1[1] = iStack_c;
    return;
  }
  iVar5 = (**(code **)(*(int *)this + 0x10))();
  if ((*(int *)(iVar5 + 0x94) == 0) || (*(int *)(*(int *)(iVar5 + 0x94) + 4) != 0x6d)) {
    iVar5 = *(int *)((int)this_00 + 0x84c);
    iVar2 = *(int *)((int)this_00 + 0x848);
  }
  else {
    uVar4 = FUN_10012c50(0x31);
    piVar6 = (int *)FUN_10012960(this_00,&iStack_10,uVar4 & 0xffff);
    iVar5 = *piVar6;
    iVar2 = piVar6[1];
  }
  if ((*(short *)((int)this + 0x9c) == 0x20) || (*(short *)((int)this + 0x9c) == 0x60)) {
    iVar5 = (int)((iVar5 >> 0x1f & 3U) + iVar5) >> 2;
  }
  *(int *)((int)this + 0x5c) = iVar2;
  *(int *)((int)this + 0x58) = iVar5 + iStack_18;
  *(int *)((int)this + 0x54) = -(iVar2 / 2);
  param_1[1] = iVar2;
  *param_1 = iVar5 + iStack_18;
  return;
}


//==== 100122f0 FUN_100122f0 refs 100121e0 from 100124fb

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_100122f0(void *this,int param_1,int param_2,undefined4 param_3)

{
  wchar_t *pwVar1;
  int iVar2;
  CHncFont *pCVar3;
  short *psVar4;
  short sVar5;
  int iVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  undefined4 auStackY_65c [255];
  undefined4 uStackY_260;
  int local_224;
  wchar_t *local_220;
  wchar_t local_21c [260];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_10061cec;
  local_10 = ExceptionList;
  local_14 = DAT_1008a054 ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  local_220 = this;
  if ((((ushort)param_3 < 0x20) || (*(int *)this == 0)) || ((ushort)param_3 == 0))
  goto LAB_1001268f;
  if (((ushort)param_3 != 0xe0ea) && ((ushort)param_3 == 0x2026)) {
    iVar2 = (int)this + 0x858;
    if (7 < *(uint *)((int)this + 0x86c)) {
      iVar2 = *(int *)((int)this + 0x858);
    }
    if (*(int *)((int)this + 0x868) == 7) {
      psVar4 = &DAT_1006b740;
      iVar6 = 7;
      do {
        if (*(short *)(iVar2 + -0x1006b740 + (int)psVar4) != *psVar4) goto LAB_100123b6;
        psVar4 = psVar4 + 1;
        iVar6 = iVar6 + -1;
      } while (iVar6 != 0);
      param_2 = param_2 + (int)((float)*(int *)((int)this + 0x848) * _DAT_1006e370);
    }
  }
LAB_100123b6:
  local_224 = param_2;
  if (*(int *)((int)this + 0x850) == 0) {
    if ((ushort)((ushort)param_3 + 0x1f1b) < 0x1a) {
      sVar5 = (ushort)param_3 + 0x1f7c;
    }
    else {
      if (0x19 < (ushort)((ushort)param_3 + 0x2000)) {
        if ((ushort)param_3 == 0xe05b) {
          param_3 = 0xe072;
        }
        goto LAB_10012404;
      }
      sVar5 = (ushort)param_3 + 0x2041;
    }
    param_3 = CONCAT22(param_3._2_2_,sVar5);
    local_224 = HncIntMulDiv();
    local_224 = param_2 - local_224;
  }
  else if ((ushort)((ushort)param_3 + 0x2000) < 0x1a) {
    *(undefined2 *)((int)this + 0xe) = 1;
    puVar8 = auStackY_65c;
    puVar7 = this;
    for (iVar2 = 0x108; puVar7 = puVar7 + 1, iVar2 != 0; iVar2 = iVar2 + -1) {
      *puVar8 = *puVar7;
      puVar8 = puVar8 + 1;
    }
    pCVar3 = (CHncFont *)FUN_100121e0((int)this);
    pCVar3 = CHncDrawContext::SelectObject(*(CHncDrawContext **)this,pCVar3);
    CHncDrawContext::SetTextAlign(*(CHncDrawContext **)local_220,0x18);
    iVar2 = HncIntMulDiv();
    CHncDrawContext::ExtTextOutW
              (*(CHncDrawContext **)local_220,param_1,param_2 + iVar2,0,(tagRECT *)0x0,
               (ushort *)&param_3,1,(int *)0x0);
    CHncDrawContext::SetTextAlign(*(CHncDrawContext **)local_220,0);
    pwVar1 = local_220;
    CHncDrawContext::SelectObject(*(CHncDrawContext **)local_220,pCVar3);
    pwVar1[7] = L'\0';
    goto LAB_1001268f;
  }
LAB_10012404:
  iVar2 = FUN_10011fd0(this,(ushort)param_3);
  if (iVar2 == 0) {
    CHncStringW::CHncStringW((CHncStringW *)&local_220);
    local_8 = 0;
    HncLoadStringW((HINSTANCE__ *)0x0,"IDS_EQ_LOG_FONTNAME",(CHncStringW *)&local_220);
    wcscpy_s(local_21c,0x104,(wchar_t *)((int)this + 0x28));
    FUN_10012130(this,(int)this + 4,local_220);
    local_8 = 0xffffffff;
    CHncStringW::~CHncStringW((CHncStringW *)&local_220);
  }
  puVar8 = auStackY_65c;
  puVar7 = this;
  for (iVar6 = 0x108; puVar7 = puVar7 + 1, iVar6 != 0; iVar6 = iVar6 + -1) {
    *puVar8 = *puVar7;
    puVar8 = puVar8 + 1;
  }
  pCVar3 = (CHncFont *)FUN_100121e0((int)this);
  pCVar3 = CHncDrawContext::SelectObject(*(CHncDrawContext **)this,pCVar3);
  if ((((ushort)param_3 < 0xe044) || (0xe084 < (ushort)param_3)) &&
     (5 < (ushort)((ushort)param_3 + 0x1f00))) {
    CHncDrawContext::SetTextAlign(*(CHncDrawContext **)this,0x18);
    iVar6 = HncIntMulDiv();
    CHncDrawContext::ExtTextOutW
              (*(CHncDrawContext **)this,param_1,local_224 + iVar6,0,(tagRECT *)0x0,
               (ushort *)&param_3,1,(int *)0x0);
    CHncDrawContext::SetTextAlign(*(CHncDrawContext **)this,0);
  }
  else if ((ushort)param_3 < 0xe078) {
    CHncDrawContext::ExtTextOutW
              (*(CHncDrawContext **)this,param_1,local_224,0,(tagRECT *)0x0,(ushort *)&param_3,1,
               (int *)0x0);
  }
  else {
    HncDRSelectFontQualityType();
    uStackY_260 = 0x1001261f;
    CHncDrawContext::ExtTextOutW
              (*(CHncDrawContext **)this,param_1,local_224,0,(tagRECT *)0x0,(ushort *)&param_3,1,
               (int *)0x0);
    HncDRSelectFontQualityType();
  }
  CHncDrawContext::SelectObject(*(CHncDrawContext **)this,pCVar3);
  if (iVar2 == 0) {
    FUN_10012130(this,(int)this + 4,local_21c);
  }
LAB_1001268f:
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


//==== 10012960 FUN_10012960 refs 100121e0 from 10012ac9

void __thiscall FUN_10012960(void *this,undefined4 *param_1,undefined4 param_2)

{
  undefined4 *puVar1;
  short sVar2;
  int iVar3;
  CHncFont *pCVar4;
  int iVar5;
  undefined4 *puVar6;
  undefined4 auStackY_664 [257];
  undefined4 uStackY_260;
  int local_230;
  undefined4 local_22c;
  undefined4 local_228;
  wchar_t *local_224;
  undefined4 *local_220;
  wchar_t local_21c [260];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_10061d6c;
  local_10 = ExceptionList;
  local_14 = DAT_1008a054 ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  local_22c = 0;
  local_228 = 0;
  local_220 = this;
  if ((((ushort)param_2 < 0x20) || (*(int *)this == 0)) || ((ushort)param_2 == 0)) {
    *param_1 = 0;
    param_1[1] = 0;
    goto LAB_10012ba1;
  }
  if (*(int *)((int)this + 0x850) == 0) {
    if ((ushort)((ushort)param_2 + 0x1f1b) < 0x1a) {
      sVar2 = 0x1f7c;
    }
    else {
      if (0x19 < (ushort)((ushort)param_2 + 0x2000)) goto LAB_100129f0;
      sVar2 = 0x2041;
    }
    param_2 = CONCAT22(param_2._2_2_,(ushort)param_2 + sVar2);
LAB_100129f0:
    iVar3 = FUN_10011fd0(this,(ushort)param_2);
    if (iVar3 == 0) {
      CHncStringW::CHncStringW((CHncStringW *)&local_224);
      local_8 = 0;
      HncLoadStringW((HINSTANCE__ *)0x0,"IDS_EQ_LOG_FONTNAME",(CHncStringW *)&local_224);
      wcscpy_s(local_21c,0x104,(wchar_t *)((int)this + 0x28));
      FUN_10012130(this,(int)this + 4,local_224);
      local_8 = 0xffffffff;
      CHncStringW::~CHncStringW((CHncStringW *)&local_224);
    }
    puVar6 = auStackY_664;
    for (iVar5 = 0x108; puVar1 = local_220, this = (void *)((int)this + 4), iVar5 != 0;
        iVar5 = iVar5 + -1) {
      *puVar6 = *(undefined4 *)this;
      puVar6 = puVar6 + 1;
    }
    pCVar4 = (CHncFont *)FUN_100121e0((int)local_220);
    pCVar4 = CHncDrawContext::SelectObject((CHncDrawContext *)*puVar1,pCVar4);
    local_230 = 0;
    uStackY_260 = 0x10012b6a;
    CHncDrawContext::GetTextExtentExPointW
              ((CHncDrawContext *)*local_220,(ushort *)&param_2,1,0,(int *)0x0,&local_230,
               (tagSIZE *)&local_22c);
    puVar6 = local_220;
    CHncDrawContext::SelectObject((CHncDrawContext *)*local_220,pCVar4);
    if (iVar3 == 0) {
      FUN_10012130(puVar6,(int)(puVar6 + 1),local_21c);
    }
  }
  else {
    if (0x19 < (ushort)((ushort)param_2 + 0x2000)) goto LAB_100129f0;
    *(undefined2 *)((int)this + 0xe) = 1;
    puVar6 = auStackY_664;
    for (iVar3 = 0x108; puVar1 = local_220, this = (void *)((int)this + 4), iVar3 != 0;
        iVar3 = iVar3 + -1) {
      *puVar6 = *(undefined4 *)this;
      puVar6 = puVar6 + 1;
    }
    pCVar4 = (CHncFont *)FUN_100121e0((int)local_220);
    pCVar4 = CHncDrawContext::SelectObject((CHncDrawContext *)*puVar1,pCVar4);
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*local_220,(ushort *)&param_2,1,(tagSIZE *)&local_22c);
    puVar6 = local_220;
    CHncDrawContext::SelectObject((CHncDrawContext *)*local_220,pCVar4);
    *(undefined2 *)((int)puVar6 + 0xe) = 0;
  }
  *param_1 = local_22c;
  param_1[1] = local_228;
LAB_10012ba1:
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


//==== 10012bd0 FUN_10012bd0 refs 100121e0 from 10012c0c

tagSIZE * __thiscall FUN_10012bd0(void *this,tagSIZE *param_1,ushort param_2)

{
  CHncFont *pCVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  undefined4 auStackY_434 [260];
  undefined4 uStackY_24;
  
  *(undefined4 *)param_1 = 0;
  *(undefined4 *)(param_1 + 4) = 0;
  if ((*(int *)this != 0) && (param_2 != 0)) {
    puVar4 = auStackY_434;
    puVar3 = this;
    for (iVar2 = 0x108; puVar3 = puVar3 + 1, iVar2 != 0; iVar2 = iVar2 + -1) {
      *puVar4 = *puVar3;
      puVar4 = puVar4 + 1;
    }
    pCVar1 = (CHncFont *)FUN_100121e0((int)this);
    pCVar1 = CHncDrawContext::SelectObject(*(CHncDrawContext **)this,pCVar1);
    uStackY_24 = 0x10012c33;
    CHncDrawContext::GetTextExtentPointW(*(CHncDrawContext **)this,&param_2,1,param_1);
    CHncDrawContext::SelectObject(*(CHncDrawContext **)this,pCVar1);
  }
  return param_1;
}


//==== 10009480 FUN_10009480 refs 100121e0 from 10009539

void __thiscall FUN_10009480(void *this,int *param_1,int param_2)

{
  uint uVar1;
  undefined4 *puVar2;
  CHncFont *pCVar3;
  int *piVar4;
  int iVar5;
  int *piVar6;
  int iVar7;
  int *piVar8;
  int iVar9;
  int aiStackY_464 [260];
  undefined4 uStackY_54;
  uint uStack_34;
  int iStack_30;
  int iStack_2c;
  int iStack_28;
  int iStack_24;
  int iStack_20;
  int iStack_1c;
  undefined4 local_18;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = *(int *)((int)this + 0x5c);
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_1000d3b0((int)this);
  memset(*(void **)((int)this + 0x84),0,*(int *)((int)this + 0x7c) << 2);
  *(undefined8 *)((int)this + 0x88) = 0;
  puVar2 = (undefined4 *)(**(code **)(*(int *)this + 0x24))();
  *(undefined4 *)((int)this + 0x88) = *puVar2;
  *(undefined4 *)((int)this + 0x8c) = puVar2[1];
  if (*(int *)((int)this + 4) == 0x74) {
    piVar4 = *(int **)((int)this + 0x74);
    iStack_1c = 0;
    local_18 = 0;
    iStack_24 = 0x22ef;
    if (*piVar4 != 0) {
      piVar8 = aiStackY_464;
      piVar6 = piVar4;
      for (iVar5 = 0x108; piVar6 = piVar6 + 1, iVar5 != 0; iVar5 = iVar5 + -1) {
        *piVar8 = *piVar6;
        piVar8 = piVar8 + 1;
      }
      pCVar3 = (CHncFont *)FUN_100121e0((int)piVar4);
      pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*piVar4,pCVar3);
      uStackY_54 = 0x10009567;
      CHncDrawContext::GetTextExtentPointW
                ((CHncDrawContext *)*piVar4,(ushort *)&iStack_24,1,(tagSIZE *)&iStack_1c);
      CHncDrawContext::SelectObject((CHncDrawContext *)*piVar4,pCVar3);
    }
    *(int *)((int)this + 0x94) = iStack_1c;
    *(undefined4 *)((int)this + 0x98) = local_18;
    uStackY_54 = 0x10009592;
    iVar5 = MulDiv(*(int *)((int)this + 8),0x14,100);
    *(int *)((int)this + 0x94) = *(int *)((int)this + 0x94) + iVar5;
  }
  iVar5 = *(int *)((int)this + 0x78);
  iVar9 = 0;
  iStack_28 = 0;
  iStack_24 = 0;
  if (0 < iVar5) {
    do {
      iStack_2c = 0;
      uStack_34 = 0;
      if (iVar9 == iVar5 + -1) {
        uStack_34 = (uint)(0 < iVar9);
      }
      iVar7 = 0;
      iStack_30 = 0;
      if (0 < *(int *)((int)this + 0x7c)) {
        do {
          uStackY_54 = 0x100095f4;
          iStack_20 = MulDiv(*(int *)((int)this + 8),0x14,100);
          uVar1 = *(uint *)((int)this + 0x7c);
          iStack_20 = iVar7 + iStack_20;
          iVar7 = iStack_20;
          iStack_1c = iStack_20;
          if (iStack_30 == uVar1 - 1) {
            if ((iVar9 == *(int *)((int)this + 0x78) + -1) && (0 < iVar9)) {
              iVar7 = **(int **)((int)this + 0x84) + iStack_20;
              break;
            }
            if (((*(int *)((int)this + 4) == 0x74) && (iVar9 == 0)) && (2 < (int)uVar1)) break;
          }
          if (uStack_34 == uVar1) break;
          if ((iVar9 < *(int *)((int)this + 0x78)) && (iStack_30 < (int)uVar1)) {
            iVar5 = *(int *)(*(int *)((int)this + 0x90) + (uVar1 * iVar9 + iStack_30) * 4);
          }
          else {
            iVar5 = 0;
          }
          *(undefined4 *)(iVar5 + 8) = *(undefined4 *)((int)this + 8);
          if ((iVar9 < *(int *)((int)this + 0x78)) && (iStack_30 < *(int *)((int)this + 0x7c))) {
            piVar4 = *(int **)(*(int *)((int)this + 0x90) +
                              (*(int *)((int)this + 0x7c) * iVar9 + iStack_30) * 4);
          }
          else {
            piVar4 = (int *)0x0;
          }
          piVar4 = (int *)(**(code **)(*piVar4 + 8))();
          iVar5 = piVar4[1];
          if (piVar4[1] < iStack_2c) {
            iVar5 = iStack_2c;
          }
          piVar6 = (int *)(*(int *)((int)this + 0x84) + uStack_34 * 4);
          iVar7 = *piVar4;
          if (*piVar4 < *(int *)(*(int *)((int)this + 0x84) + uStack_34 * 4)) {
            iVar7 = *piVar6;
          }
          *piVar6 = iVar7;
          iVar7 = uStack_34 * 4;
          uStack_34 = uStack_34 + 1;
          iVar7 = *(int *)(*(int *)((int)this + 0x84) + iVar7) + iStack_20;
          iStack_30 = iStack_30 + 1;
          iStack_2c = iVar5;
        } while (iStack_30 < *(int *)((int)this + 0x7c));
      }
      if (iVar7 < iStack_28) {
        iVar7 = iStack_28;
      }
      uStackY_54 = 0x100096ff;
      iVar5 = MulDiv(*(int *)((int)this + 8),0xf,100);
      iStack_24 = iStack_24 + iVar5 + iStack_2c;
      *(int *)(*(int *)((int)this + 0x80) + iVar9 * 4) = iStack_2c;
      iVar9 = iVar9 + 1;
      iVar5 = *(int *)((int)this + 0x78);
      iStack_28 = iVar7;
    } while (iVar9 < iVar5);
  }
  if (1 < *(int *)((int)this + 0x7c)) {
    **(int **)((int)this + 0x84) = **(int **)((int)this + 0x84) + *(int *)((int)this + 0x88);
    iStack_28 = *(int *)((int)this + 0x88) + iStack_28;
  }
  if (((*(int *)((int)this + 4) == 0x74) && (2 < *(int *)((int)this + 0x7c))) &&
     (1 < *(int *)((int)this + 0x78))) {
    piVar4 = (int *)(*(int *)((int)this + 0x84) + *(int *)((int)this + 0x7c) * 4 + -4);
    *piVar4 = *piVar4 + *(int *)((int)this + 0x94);
    iStack_28 = *(int *)((int)this + 0x94) + iStack_28;
  }
  *(int *)((int)this + 0x5c) = iStack_24;
  *(int *)((int)this + 0x58) = iStack_28;
  *(int *)((int)this + 0x54) = -(iStack_24 / 2);
  *param_1 = iStack_28;
  param_1[1] = iStack_24;
  return;
}


//==== 100097a0 FUN_100097a0 refs 100121e0 from 100097ff

tagSIZE * __thiscall FUN_100097a0(void *this,tagSIZE *param_1)

{
  int *piVar1;
  wchar_t *pwVar2;
  int iVar3;
  CHncFont *pCVar4;
  int *this_00;
  int *piVar5;
  int aiStackY_438 [260];
  undefined4 uStackY_28;
  ushort local_c [2];
  int *local_8;
  
  this_00 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  local_8 = this_00;
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar2);
  iVar3 = 0;
  local_c[0] = 0xe101;
  local_c[1] = 0;
  *(undefined4 *)param_1 = 0;
  *(undefined4 *)(param_1 + 4) = 0;
  if (*this_00 != 0) {
    piVar5 = aiStackY_438;
    for (iVar3 = 0x108; piVar1 = local_8, this_00 = this_00 + 1, iVar3 != 0; iVar3 = iVar3 + -1) {
      *piVar5 = *this_00;
      piVar5 = piVar5 + 1;
    }
    pCVar4 = (CHncFont *)FUN_100121e0((int)local_8);
    pCVar4 = CHncDrawContext::SelectObject((CHncDrawContext *)*piVar1,pCVar4);
    uStackY_28 = 0x10009823;
    CHncDrawContext::GetTextExtentPointW((CHncDrawContext *)*local_8,local_c,1,param_1);
    CHncDrawContext::SelectObject((CHncDrawContext *)*local_8,pCVar4);
    iVar3 = *(int *)(param_1 + 4);
  }
  uStackY_28 = 0x10009839;
  iVar3 = MulDiv(iVar3,0x14,100);
  *(int *)(param_1 + 4) = iVar3;
  return param_1;
}


//==== 100126b0 FUN_100126b0 refs 100121e0 from 100127bb

void __thiscall FUN_100126b0(void *this,int param_1,int param_2,ushort *param_3)

{
  bool bVar1;
  uint uVar2;
  int iVar3;
  CHncFont *pCVar4;
  ushort **ppuVar5;
  ushort *site;
  uint uVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  uint in_stack_0000001c;
  uint in_stack_00000020;
  undefined4 auStackY_658 [256];
  undefined4 uStackY_258;
  wchar_t *local_224;
  undefined4 *local_220;
  wchar_t local_21c [260];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  int local_8;
  
  uVar2 = in_stack_0000001c;
  puStack_c = &LAB_10061d34;
  local_10 = ExceptionList;
  local_14 = DAT_1008a054 ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  local_8 = 0;
  local_220 = this;
  if (*(int *)this != 0) {
    uVar6 = 0;
    bVar1 = false;
    if (0 < (int)in_stack_0000001c) {
      do {
        if (in_stack_0000001c <= uVar6) {
                    /* WARNING: Subroutine does not return */
          FUN_1000c970();
        }
        ppuVar5 = &param_3;
        if (7 < in_stack_00000020) {
          ppuVar5 = (ushort **)param_3;
        }
        iVar3 = FUN_10011fd0(this,*(ushort *)((int)ppuVar5 + uVar6 * 2));
        if (iVar3 == 0) {
          bVar1 = true;
          CHncStringW::CHncStringW((CHncStringW *)&local_224);
          local_8._0_1_ = 1;
          HncLoadStringW((HINSTANCE__ *)0x0,"IDS_EQ_LOG_FONTNAME",(CHncStringW *)&local_224);
          wcscpy_s(local_21c,0x104,(wchar_t *)((int)this + 0x28));
          FUN_10012130(this,(int)this + 4,local_224);
          local_8 = (uint)local_8._1_3_ << 8;
          CHncStringW::~CHncStringW((CHncStringW *)&local_224);
          break;
        }
        uVar6 = uVar6 + 1;
      } while ((int)uVar6 < (int)uVar2);
    }
    puVar8 = auStackY_658;
    puVar7 = this;
    for (iVar3 = 0x108; puVar7 = puVar7 + 1, iVar3 != 0; iVar3 = iVar3 + -1) {
      *puVar8 = *puVar7;
      puVar8 = puVar8 + 1;
    }
    pCVar4 = (CHncFont *)FUN_100121e0((int)this);
    pCVar4 = CHncDrawContext::SelectObject(*(CHncDrawContext **)this,pCVar4);
    CHncDrawContext::SetTextAlign((CHncDrawContext *)*local_220,0x18);
    iVar3 = HncIntMulDiv();
    ppuVar5 = &param_3;
    if (7 < in_stack_00000020) {
      ppuVar5 = (ushort **)param_3;
    }
    uStackY_258 = 0x10012821;
    CHncDrawContext::ExtTextOutW
              ((CHncDrawContext *)*local_220,param_1,param_2 + iVar3,0,(tagRECT *)0x0,
               (ushort *)ppuVar5,in_stack_0000001c,(int *)0x0);
    CHncDrawContext::SetTextAlign((CHncDrawContext *)*local_220,0);
    puVar7 = local_220;
    CHncDrawContext::SelectObject((CHncDrawContext *)*local_220,pCVar4);
    if (bVar1) {
      FUN_10012130(puVar7,(int)(puVar7 + 1),local_21c);
    }
  }
  if (7 < in_stack_00000020) {
    site = param_3;
    if ((0xfff < in_stack_00000020 * 2 + 2) &&
       (site = *(ushort **)(param_3 + -2), 0x1f < (uint)((int)param_3 + (-4 - (int)site)))) {
                    /* WARNING: Subroutine does not return */
      _invalid_parameter_noinfo_noreturn();
    }
    delete(site);
  }
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


//==== 10016310 FUN_10016310 refs 100121e0 from 100163c1

undefined4 * __thiscall FUN_10016310(void *this,undefined4 *param_1)

{
  int *this_00;
  code *pcVar1;
  ushort uVar2;
  int iVar3;
  wchar_t *pwVar4;
  undefined4 uVar5;
  int *piVar6;
  int *piVar7;
  int aiStackY_450 [258];
  undefined4 uStackY_48;
  undefined4 uStackY_44;
  undefined4 *puStackY_40;
  undefined4 local_18;
  code *local_14;
  code *local_10;
  int *local_c;
  
  this_00 = *(int **)((int)this + 0x74);
  uVar2 = *(ushort *)((int)this_00 + 0xe) & 1;
  *(ushort *)((int)this_00 + 0xe) = uVar2;
  if (uVar2 != 0) {
    this_00[0x214] = 0;
  }
  puStackY_40 = (undefined4 *)0x10016350;
  iVar3 = MulDiv(*(int *)((int)this + 8),*(int *)((int)this + 0x84),100);
  pwVar4 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar4 = *(wchar_t **)pwVar4;
  }
  FUN_10011f10(this_00,iVar3,pwVar4);
  local_c = this_00 + 1;
  local_14 = GetTextExtentPointW_exref;
  local_10 = SelectObject_exref;
  if (*(int *)((int)this + 0x80) == 1) {
    local_18 = 0x4c;
  }
  else {
    local_18 = 0x6c;
  }
  if (*this_00 != 0) {
    piVar6 = local_c;
    piVar7 = aiStackY_450;
    for (iVar3 = 0x108; iVar3 != 0; iVar3 = iVar3 + -1) {
      *piVar7 = *piVar6;
      piVar6 = piVar6 + 1;
      piVar7 = piVar7 + 1;
    }
    FUN_100121e0((int)this_00);
    pcVar1 = local_10;
    uVar5 = (*local_10)();
    puStackY_40 = &local_18;
    uStackY_44 = 0x100163df;
    (*local_14)();
    uStackY_48 = 0x100163e4;
    uStackY_44 = uVar5;
    (*pcVar1)();
  }
  *param_1 = 0;
  param_1[1] = 0;
  local_18 = 0x69;
  if (*this_00 == 0) {
    iVar3 = 0;
  }
  else {
    local_c = this_00 + 1;
    piVar6 = local_c;
    piVar7 = aiStackY_450;
    for (iVar3 = 0x108; iVar3 != 0; iVar3 = iVar3 + -1) {
      *piVar7 = *piVar6;
      piVar6 = piVar6 + 1;
      piVar7 = piVar7 + 1;
    }
    FUN_100121e0((int)this_00);
    pcVar1 = local_10;
    uVar5 = (*local_10)();
    puStackY_40 = &local_18;
    uStackY_44 = 0x1001644d;
    (*local_14)();
    uStackY_48 = 0x10016452;
    uStackY_44 = uVar5;
    (*pcVar1)();
    iVar3 = *this_00;
  }
  uVar5 = *param_1;
  local_18 = 0x6d;
  *param_1 = uVar5;
  if (iVar3 != 0) {
    piVar6 = local_c;
    piVar7 = aiStackY_450;
    for (iVar3 = 0x108; iVar3 != 0; iVar3 = iVar3 + -1) {
      *piVar7 = *piVar6;
      piVar6 = piVar6 + 1;
      piVar7 = piVar7 + 1;
    }
    FUN_100121e0((int)this_00);
    pcVar1 = local_10;
    uVar5 = (*local_10)();
    puStackY_40 = &local_18;
    uStackY_44 = 0x100164ab;
    (*local_14)();
    uStackY_48 = 0x100164b0;
    uStackY_44 = uVar5;
    (*pcVar1)();
    uVar5 = *param_1;
  }
  *param_1 = uVar5;
  if (uVar2 != 0) {
    this_00[0x214] = 1;
  }
  return param_1;
}


//==== 10016990 FUN_10016990 refs 100121e0 from 10016a63

void __thiscall FUN_10016990(void *this,int *param_1,undefined4 *param_2)

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
  FUN_1000d3b0((int)this);
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
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar2);
  if (*this_00 != 0) {
    piVar8 = aiStackY_468;
    for (iVar1 = 0x108; this_00 = this_00 + 1, iVar1 != 0; iVar1 = iVar1 + -1) {
      *piVar8 = *this_00;
      piVar8 = piVar8 + 1;
    }
    puVar9 = param_2;
    pCVar3 = (CHncFont *)FUN_100121e0((int)param_2);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*param_2,pCVar3);
    uStackY_58 = 0x10016a8d;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*puVar9,(ushort *)&stack0xffffffcc,1,(tagSIZE *)&stack0xffffffd0);
    CHncDrawContext::SelectObject((CHncDrawContext *)*puVar9,pCVar3);
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x7c) + 0x5c);
  uStackY_58 = 0x10016ab2;
  iVar4 = MulDiv(*(int *)((int)this + 8),10,100);
  iVar1 = ((iVar4 + iVar1) * 100) / 0;
  *(int *)((int)this + 0x80) = iVar1;
  if (iVar1 < 100) {
    *(undefined4 *)((int)this + 0x80) = 100;
    iVar1 = 100;
  }
  uStackY_58 = 0x10016ade;
  iVar1 = MulDiv(0,iVar1,100);
  *(int *)((int)this + 0x88) = iVar1;
  *(int *)((int)this + 0x8c) = -iStack_28;
  if (iStack_28 < 1) {
    iStack_28 = 0;
  }
  *(int *)((int)this + 0x84) = iStack_28;
  uStackY_58 = 0x10016b15;
  iVar1 = MulDiv(*(int *)((int)this + 8),0x11,100);
  iVar5 = iVar1 + *(int *)((int)this + 0x84) + iStack_20;
  iVar1 = *(int *)(*(int *)((int)this + 0x7c) + 0x54);
  uStackY_58 = 0x10016b32;
  iVar6 = MulDiv(*(int *)((int)this + 8),10,100);
  iVar4 = *(int *)(*(int *)((int)this + 0x78) + 0x5c);
  uStackY_58 = 0x10016b4a;
  iVar7 = MulDiv(*(int *)((int)this + 0x88),0x34,100);
  iVar4 = iVar4 - iVar7;
  *(int *)((int)this + 0x90) = iVar4;
  uStackY_58 = 0x10016b5b;
  iVar7 = MulDiv(*(int *)((int)this + 8),5,100);
  if (iVar4 <= iVar7) {
    uStackY_58 = 0x10016b68;
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


//==== 10018660 FUN_10018660 refs 100121e0 from 1001874e

void __thiscall FUN_10018660(void *this,int *param_1,int param_2)

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
  iStack_44 = 0x1001869e;
  FUN_1000d3b0((int)this);
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
  FUN_10011f10(piVar2,*(int *)((int)this + 8),pwVar3);
  iStack_44 = 0xe10f;
  iVar7 = iVar9;
  if (*piVar2 != 0) {
    piVar10 = aiStackY_478;
    piVar8 = piVar2;
    for (iVar7 = 0x108; piVar8 = piVar8 + 1, iVar7 != 0; iVar7 = iVar7 + -1) {
      *piVar10 = *piVar8;
      piVar10 = piVar10 + 1;
    }
    pCVar4 = (CHncFont *)FUN_100121e0((int)piVar2);
    pCVar4 = CHncDrawContext::SelectObject((CHncDrawContext *)*piVar2,pCVar4);
    uStackY_68 = 0x10018778;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*piVar2,(ushort *)&iStack_44,1,(tagSIZE *)&stack0xffffffc8);
    CHncDrawContext::SelectObject((CHncDrawContext *)*piVar2,pCVar4);
    iVar7 = unaff_EDI;
  }
  uStackY_68 = 0x10018796;
  iVar5 = MulDiv(0,0x14,100);
  *(undefined4 *)((int)this + 0x84) = 0;
  *(int *)((int)this + 0x88) = iVar5;
  uStackY_68 = 0x100187af;
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


//==== 100192e0 FUN_100192e0 refs 100121e0 from 10019375

void __thiscall FUN_100192e0(void *this,int *param_1,int param_2)

{
  int *this_00;
  wchar_t *pwVar1;
  CHncFont *pCVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  int *piVar6;
  int aiStackY_450 [258];
  undefined4 uStackY_48;
  ushort auStack_1c [2];
  int iStack_18;
  int iStack_14;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar4 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar4;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_1000d3b0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar1 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar1 = *(wchar_t **)pwVar1;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar1);
  iStack_18 = 0;
  iStack_14 = 0;
  auStack_1c[0] = 0xe06d;
  auStack_1c[1] = 0;
  if (*this_00 != 0) {
    piVar6 = aiStackY_450;
    piVar5 = this_00;
    for (iVar4 = 0x108; piVar5 = piVar5 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar6 = *piVar5;
      piVar6 = piVar6 + 1;
    }
    pCVar2 = (CHncFont *)FUN_100121e0((int)this_00);
    pCVar2 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
  }
  iVar4 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x80) = iStack_18;
  *(int *)((int)this + 0x84) = iVar4;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  uStackY_48 = 0x100193ee;
  iVar3 = MulDiv(*(int *)((int)this + 0x80),0x14,100);
  iVar4 = iStack_18 + iVar3;
  if (iStack_18 + iVar3 < *(int *)((int)this + 0x80)) {
    iVar4 = *(int *)((int)this + 0x80);
  }
  iStack_14 = iStack_14 + *(int *)((int)this + 0x84);
  iVar3 = *(int *)(*(int *)((int)this + 0x78) + 0x54);
  *(int *)((int)this + 0x58) = iVar4;
  *(int *)((int)this + 0x54) = iVar3 - *(int *)((int)this + 0x84);
  *(int *)((int)this + 0x5c) = iStack_14;
  *param_1 = iVar4;
  param_1[1] = iStack_14;
  return;
}


//==== 10019890 FUN_10019890 refs 100121e0 from 10019925

void __thiscall FUN_10019890(void *this,int *param_1,int param_2)

{
  int *this_00;
  int iVar1;
  wchar_t *pwVar2;
  CHncFont *pCVar3;
  int iVar4;
  int iVar5;
  int *piVar6;
  int iVar7;
  int *piVar8;
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
  FUN_1000d3b0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar2);
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
    pCVar3 = (CHncFont *)FUN_100121e0((int)this_00);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
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
  uStackY_48 = 0x100199aa;
  iVar4 = MulDiv(iVar5,0x14,100);
  iVar5 = *(int *)((int)this + 0x84);
  iStack_14 = iStack_14 + iVar5;
  iVar1 = *(int *)(*(int *)((int)this + 0x78) + 0x54);
  *(int *)((int)this + 0x58) = iVar7 + iVar4;
  *(int *)((int)this + 0x5c) = iStack_14;
  *param_1 = iVar7 + iVar4;
  param_1[1] = iStack_14;
  *(int *)((int)this + 0x54) = iVar1 - iVar5;
  return;
}


//==== 1001a2b0 FUN_1001a2b0 refs 100121e0 from 1001a345

void __thiscall FUN_1001a2b0(void *this,int *param_1,int param_2)

{
  int *this_00;
  undefined4 uVar1;
  wchar_t *pwVar2;
  CHncFont *pCVar3;
  int iVar4;
  int *piVar5;
  int iVar6;
  int *piVar7;
  int aiStackY_450 [258];
  undefined4 uStackY_48;
  ushort auStack_1c [2];
  int iStack_18;
  int iStack_14;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar4 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar4;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_1000d3b0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar2);
  iStack_18 = 0;
  iStack_14 = 0;
  auStack_1c[0] = 0xe06d;
  auStack_1c[1] = 0;
  if (*this_00 != 0) {
    piVar7 = aiStackY_450;
    piVar5 = this_00;
    for (iVar4 = 0x108; piVar5 = piVar5 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar7 = *piVar5;
      piVar7 = piVar7 + 1;
    }
    pCVar3 = (CHncFont *)FUN_100121e0((int)this_00);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
  }
  iVar4 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x80) = iStack_18;
  *(int *)((int)this + 0x84) = iVar4;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  iVar4 = *(int *)((int)this + 0x80);
  iVar6 = iVar4;
  if (iVar4 < iStack_18) {
    iVar6 = iStack_18;
  }
  uStackY_48 = 0x1001a3ca;
  iVar4 = MulDiv(iVar4,0x14,100);
  iStack_14 = *(int *)((int)this + 0x84) + iStack_14;
  uVar1 = *(undefined4 *)(*(int *)((int)this + 0x78) + 0x54);
  *(int *)((int)this + 0x58) = iVar6 + iVar4;
  *(undefined4 *)((int)this + 0x54) = uVar1;
  *param_1 = iVar6 + iVar4;
  *(int *)((int)this + 0x5c) = iStack_14;
  param_1[1] = iStack_14;
  return;
}


//==== 1001a820 FUN_1001a820 refs 100121e0 from 1001a8ae

void __thiscall FUN_1001a820(void *this,int *param_1,int param_2)

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
  FUN_1000d3b0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar1 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar1 = *(wchar_t **)pwVar1;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar1);
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
    pCVar2 = (CHncFont *)FUN_100121e0((int)this_00);
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
  uStackY_48 = 0x1001a92f;
  iVar3 = MulDiv(iVar5,0x14,100);
  iVar9 = *(int *)((int)this + 0x84) + iStack_14;
  iVar5 = *(int *)(*(int *)(unaff_EBX + 0x78) + 0x54);
  uStackY_48 = 0x1001a956;
  iVar4 = MulDiv(*(int *)(unaff_EBX + 0x80),0xf,100);
  *(int *)(unaff_EBX + 0x54) = iVar5 - iVar4;
  *(int *)(unaff_EBX + 0x58) = iVar7 + iVar3;
  *(int *)(unaff_EBX + 0x5c) = iVar9;
  param_1[1] = iVar9;
  *param_1 = iVar7 + iVar3;
  return;
}


//==== 1001ad10 FUN_1001ad10 refs 100121e0 from 1001ada5

void __thiscall FUN_1001ad10(void *this,int *param_1,int param_2)

{
  int *this_00;
  int iVar1;
  wchar_t *pwVar2;
  CHncFont *pCVar3;
  int iVar4;
  int *piVar5;
  int *piVar6;
  int aiStackY_450 [260];
  undefined4 uStackY_40;
  ushort auStack_1c [2];
  int iStack_18;
  int iStack_14;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar4 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar4;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_1000d3b0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar2);
  iStack_18 = 0;
  iStack_14 = 0;
  auStack_1c[0] = 0xe05d;
  auStack_1c[1] = 0;
  if (*this_00 != 0) {
    piVar6 = aiStackY_450;
    piVar5 = this_00;
    for (iVar4 = 0x108; piVar5 = piVar5 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar6 = *piVar5;
      piVar6 = piVar6 + 1;
    }
    pCVar3 = (CHncFont *)FUN_100121e0((int)this_00);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
    uStackY_40 = 0x1001adcf;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
  }
  uStackY_40 = 0x1001ade7;
  iVar4 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x80) = iStack_18;
  *(int *)((int)this + 0x84) = iVar4;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  iVar4 = *(int *)((int)this + 0x80);
  if (*(int *)((int)this + 0x80) < iStack_18) {
    iVar4 = iStack_18;
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x78) + 0x54);
  iStack_14 = iStack_14 + *(int *)((int)this + 0x84);
  *(int *)((int)this + 0x58) = iVar4;
  *(int *)((int)this + 0x5c) = iStack_14;
  *(int *)((int)this + 0x54) = iVar1 - *(int *)((int)this + 0x84);
  *param_1 = iVar4;
  param_1[1] = iStack_14;
  return;
}


//==== 1001b1e0 FUN_1001b1e0 refs 100121e0 from 1001b275

void __thiscall FUN_1001b1e0(void *this,int *param_1,int param_2)

{
  int *this_00;
  int iVar1;
  wchar_t *pwVar2;
  CHncFont *pCVar3;
  int iVar4;
  int *piVar5;
  int *piVar6;
  int aiStackY_450 [260];
  undefined4 uStackY_40;
  ushort auStack_1c [2];
  int iStack_18;
  int iStack_14;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar4 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar4;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_1000d3b0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar2);
  iStack_18 = 0;
  iStack_14 = 0;
  auStack_1c[0] = 0xe05e;
  auStack_1c[1] = 0;
  if (*this_00 != 0) {
    piVar6 = aiStackY_450;
    piVar5 = this_00;
    for (iVar4 = 0x108; piVar5 = piVar5 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar6 = *piVar5;
      piVar6 = piVar6 + 1;
    }
    pCVar3 = (CHncFont *)FUN_100121e0((int)this_00);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
    uStackY_40 = 0x1001b29f;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
  }
  uStackY_40 = 0x1001b2b7;
  iVar4 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x80) = iStack_18;
  *(int *)((int)this + 0x84) = iVar4;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  iVar4 = *(int *)((int)this + 0x80);
  if (*(int *)((int)this + 0x80) < iStack_18) {
    iVar4 = iStack_18;
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x78) + 0x54);
  iStack_14 = iStack_14 + *(int *)((int)this + 0x84);
  *(int *)((int)this + 0x58) = iVar4;
  *(int *)((int)this + 0x5c) = iStack_14;
  *(int *)((int)this + 0x54) = iVar1 - *(int *)((int)this + 0x84);
  *param_1 = iVar4;
  param_1[1] = iStack_14;
  return;
}


//==== 1001b6b0 FUN_1001b6b0 refs 100121e0 from 1001b745

void __thiscall FUN_1001b6b0(void *this,int *param_1,int param_2)

{
  int *this_00;
  int iVar1;
  wchar_t *pwVar2;
  CHncFont *pCVar3;
  int iVar4;
  int *piVar5;
  int *piVar6;
  int aiStackY_450 [260];
  undefined4 uStackY_40;
  ushort auStack_1c [2];
  int iStack_18;
  int iStack_14;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar4 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar4;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_1000d3b0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar2);
  iStack_18 = 0;
  iStack_14 = 0;
  auStack_1c[0] = 0xe05f;
  auStack_1c[1] = 0;
  if (*this_00 != 0) {
    piVar6 = aiStackY_450;
    piVar5 = this_00;
    for (iVar4 = 0x108; piVar5 = piVar5 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar6 = *piVar5;
      piVar6 = piVar6 + 1;
    }
    pCVar3 = (CHncFont *)FUN_100121e0((int)this_00);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
    uStackY_40 = 0x1001b76f;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
  }
  uStackY_40 = 0x1001b787;
  iVar4 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x80) = iStack_18;
  *(int *)((int)this + 0x84) = iVar4;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  iVar4 = *(int *)((int)this + 0x80);
  if (*(int *)((int)this + 0x80) < iStack_18) {
    iVar4 = iStack_18;
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x78) + 0x54);
  iStack_14 = iStack_14 + *(int *)((int)this + 0x84);
  *(int *)((int)this + 0x58) = iVar4;
  *(int *)((int)this + 0x5c) = iStack_14;
  *(int *)((int)this + 0x54) = iVar1 - *(int *)((int)this + 0x84);
  *param_1 = iVar4;
  param_1[1] = iStack_14;
  return;
}


//==== 1001bb80 FUN_1001bb80 refs 100121e0 from 1001bc15

void __thiscall FUN_1001bb80(void *this,int *param_1,int param_2)

{
  int *this_00;
  int iVar1;
  wchar_t *pwVar2;
  CHncFont *pCVar3;
  int iVar4;
  int *piVar5;
  int *piVar6;
  int aiStackY_450 [260];
  undefined4 uStackY_40;
  ushort auStack_1c [2];
  int iStack_18;
  int iStack_14;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar4 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar4;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_1000d3b0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar2);
  iStack_18 = 0;
  iStack_14 = 0;
  auStack_1c[0] = 0xe060;
  auStack_1c[1] = 0;
  if (*this_00 != 0) {
    piVar6 = aiStackY_450;
    piVar5 = this_00;
    for (iVar4 = 0x108; piVar5 = piVar5 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar6 = *piVar5;
      piVar6 = piVar6 + 1;
    }
    pCVar3 = (CHncFont *)FUN_100121e0((int)this_00);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
    uStackY_40 = 0x1001bc3f;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
  }
  uStackY_40 = 0x1001bc57;
  iVar4 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x80) = iStack_18;
  *(int *)((int)this + 0x84) = iVar4;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  iVar4 = *(int *)((int)this + 0x80);
  if (*(int *)((int)this + 0x80) < iStack_18) {
    iVar4 = iStack_18;
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x78) + 0x54);
  iStack_14 = iStack_14 + *(int *)((int)this + 0x84);
  *(int *)((int)this + 0x58) = iVar4;
  *(int *)((int)this + 0x5c) = iStack_14;
  *(int *)((int)this + 0x54) = iVar1 - *(int *)((int)this + 0x84);
  *param_1 = iVar4;
  param_1[1] = iStack_14;
  return;
}


//==== 1001bf80 FUN_1001bf80 refs 100121e0 from 1001c015

void __thiscall FUN_1001bf80(void *this,int *param_1,int param_2)

{
  int *this_00;
  int iVar1;
  wchar_t *pwVar2;
  CHncFont *pCVar3;
  int iVar4;
  int *piVar5;
  int *piVar6;
  int aiStackY_450 [260];
  undefined4 uStackY_40;
  ushort auStack_1c [2];
  int iStack_18;
  int iStack_14;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar4 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar4;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_1000d3b0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar2);
  iStack_18 = 0;
  iStack_14 = 0;
  auStack_1c[0] = 0xe063;
  auStack_1c[1] = 0;
  if (*this_00 != 0) {
    piVar6 = aiStackY_450;
    piVar5 = this_00;
    for (iVar4 = 0x108; piVar5 = piVar5 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar6 = *piVar5;
      piVar6 = piVar6 + 1;
    }
    pCVar3 = (CHncFont *)FUN_100121e0((int)this_00);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
    uStackY_40 = 0x1001c03f;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
  }
  uStackY_40 = 0x1001c057;
  iVar4 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x80) = iStack_18;
  *(int *)((int)this + 0x84) = iVar4;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  iVar4 = *(int *)((int)this + 0x80);
  if (*(int *)((int)this + 0x80) < iStack_18) {
    iVar4 = iStack_18;
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x78) + 0x54);
  iStack_14 = iStack_14 + *(int *)((int)this + 0x84);
  *(int *)((int)this + 0x58) = iVar4;
  *(int *)((int)this + 0x5c) = iStack_14;
  *(int *)((int)this + 0x54) = iVar1 - *(int *)((int)this + 0x84);
  *param_1 = iVar4;
  param_1[1] = iStack_14;
  return;
}


//==== 1001c500 FUN_1001c500 refs 100121e0 from 1001c595

void __thiscall FUN_1001c500(void *this,int *param_1,int param_2)

{
  int *this_00;
  int iVar1;
  wchar_t *pwVar2;
  CHncFont *pCVar3;
  int iVar4;
  int *piVar5;
  int *piVar6;
  int aiStackY_450 [260];
  undefined4 uStackY_40;
  ushort auStack_1c [2];
  int iStack_18;
  int iStack_14;
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar4 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar4;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_1000d3b0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar2);
  iStack_18 = 0;
  iStack_14 = 0;
  auStack_1c[0] = 0xe064;
  auStack_1c[1] = 0;
  if (*this_00 != 0) {
    piVar6 = aiStackY_450;
    piVar5 = this_00;
    for (iVar4 = 0x108; piVar5 = piVar5 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar6 = *piVar5;
      piVar6 = piVar6 + 1;
    }
    pCVar3 = (CHncFont *)FUN_100121e0((int)this_00);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
    uStackY_40 = 0x1001c5bf;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
  }
  uStackY_40 = 0x1001c5d7;
  iVar4 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x80) = iStack_18;
  *(int *)((int)this + 0x84) = iVar4;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  iVar4 = *(int *)((int)this + 0x80);
  if (*(int *)((int)this + 0x80) < iStack_18) {
    iVar4 = iStack_18;
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x78) + 0x54);
  iStack_14 = iStack_14 + *(int *)((int)this + 0x84);
  *(int *)((int)this + 0x58) = iVar4;
  *(int *)((int)this + 0x5c) = iStack_14;
  *(int *)((int)this + 0x54) = iVar1 - *(int *)((int)this + 0x84);
  *param_1 = iVar4;
  param_1[1] = iStack_14;
  return;
}


//==== 1001ca80 FUN_1001ca80 refs 100121e0 from 1001cb15

void __thiscall FUN_1001ca80(void *this,int *param_1,int param_2)

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
  FUN_1000d3b0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar1 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar1 = *(wchar_t **)pwVar1;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar1);
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
    pCVar2 = (CHncFont *)FUN_100121e0((int)this_00);
    pCVar2 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
    uStackY_40 = 0x1001cb3f;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
  }
  uStackY_40 = 0x1001cb57;
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


//==== 1001d010 FUN_1001d010 refs 100121e0 from 1001d0ac

void __thiscall FUN_1001d010(void *this,int *param_1,int param_2)

{
  int *this_00;
  int iVar1;
  wchar_t *pwVar2;
  CHncFont *pCVar3;
  int iVar4;
  int *piVar5;
  int *piVar6;
  int aiStackY_450 [260];
  undefined4 uStackY_40;
  ushort auStack_1c [2];
  int iStack_18;
  int iStack_14;
  
  FUN_1000d3b0((int)this);
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = *(int *)((int)this + 0x5c);
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_1000d3b0((int)this);
  this_00 = *(int **)((int)this + 0x74);
  pwVar2 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar2);
  iStack_18 = 0;
  iStack_14 = 0;
  auStack_1c[0] = 0xe066;
  auStack_1c[1] = 0;
  if (*this_00 != 0) {
    piVar6 = aiStackY_450;
    piVar5 = this_00;
    for (iVar4 = 0x108; piVar5 = piVar5 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar6 = *piVar5;
      piVar6 = piVar6 + 1;
    }
    pCVar3 = (CHncFont *)FUN_100121e0((int)this_00);
    pCVar3 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
    uStackY_40 = 0x1001d0d6;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,auStack_1c,1,(tagSIZE *)&iStack_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar3);
  }
  uStackY_40 = 0x1001d0ee;
  iVar4 = MulDiv(iStack_14,0x14,100);
  *(int *)((int)this + 0x80) = iStack_18;
  *(int *)((int)this + 0x84) = iVar4;
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))();
  iVar4 = *(int *)((int)this + 0x80);
  if (*(int *)((int)this + 0x80) < iStack_18) {
    iVar4 = iStack_18;
  }
  iVar1 = *(int *)(*(int *)((int)this + 0x78) + 0x54);
  iStack_14 = iStack_14 + *(int *)((int)this + 0x84);
  *(int *)((int)this + 0x58) = iVar4;
  *(int *)((int)this + 0x5c) = iStack_14;
  *(int *)((int)this + 0x54) = iVar1 - *(int *)((int)this + 0x84);
  *param_1 = iVar4;
  param_1[1] = iStack_14;
  return;
}


//==== 1001ed20 FUN_1001ed20 refs 100121e0 from 1001ed83

int * __thiscall FUN_1001ed20(void *this,int *param_1)

{
  wchar_t *pwVar1;
  CHncFont *pCVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 uVar5;
  int *piVar6;
  int *this_00;
  int *piVar7;
  int aiStackY_448 [260];
  undefined4 uStackY_38;
  undefined4 local_18;
  undefined4 local_14;
  uint local_10;
  int *local_c;
  
  this_00 = *(int **)((int)this + 0x74);
  pwVar1 = (wchar_t *)(this_00 + 0x216);
  if (7 < (uint)this_00[0x21b]) {
    pwVar1 = *(wchar_t **)pwVar1;
  }
  local_c = this_00;
  FUN_10011f10(this_00,*(int *)((int)this + 8),pwVar1);
  local_10 = (uint)*(ushort *)((int)this + 0xac);
  local_14 = 0;
  local_18 = 0;
  uVar3 = 0;
  uVar5 = 0;
  if ((*this_00 != 0) && (*(ushort *)((int)this + 0xac) != 0)) {
    piVar6 = aiStackY_448;
    piVar7 = this_00;
    for (iVar4 = 0x108; this_00 = local_c, piVar7 = piVar7 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar6 = *piVar7;
      piVar6 = piVar6 + 1;
    }
    pCVar2 = (CHncFont *)FUN_100121e0((int)local_c);
    pCVar2 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
    uStackY_38 = 0x1001eda5;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,(ushort *)&local_10,1,(tagSIZE *)&local_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
    uVar3 = local_18;
    uVar5 = local_14;
  }
  local_10 = (uint)*(ushort *)((int)this + 0xae);
  *(undefined4 *)((int)this + 0x8c) = uVar3;
  *(undefined4 *)((int)this + 0x90) = uVar5;
  local_18 = 0;
  local_14 = 0;
  uVar3 = 0;
  uVar5 = 0;
  if ((*this_00 != 0) && (*(ushort *)((int)this + 0xae) != 0)) {
    piVar6 = aiStackY_448;
    piVar7 = this_00;
    for (iVar4 = 0x108; this_00 = local_c, piVar7 = piVar7 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar6 = *piVar7;
      piVar6 = piVar6 + 1;
    }
    pCVar2 = (CHncFont *)FUN_100121e0((int)local_c);
    pCVar2 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
    uStackY_38 = 0x1001ee18;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,(ushort *)&local_10,1,(tagSIZE *)&local_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
    uVar3 = local_18;
    uVar5 = local_14;
  }
  local_10 = (uint)*(ushort *)((int)this + 0xb2);
  *(undefined4 *)((int)this + 0x94) = uVar3;
  *(undefined4 *)((int)this + 0x98) = uVar5;
  local_18 = 0;
  local_14 = 0;
  uVar3 = 0;
  uVar5 = 0;
  if ((*this_00 != 0) && (*(ushort *)((int)this + 0xb2) != 0)) {
    piVar6 = aiStackY_448;
    piVar7 = this_00;
    for (iVar4 = 0x108; this_00 = local_c, piVar7 = piVar7 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar6 = *piVar7;
      piVar6 = piVar6 + 1;
    }
    pCVar2 = (CHncFont *)FUN_100121e0((int)local_c);
    pCVar2 = CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
    uStackY_38 = 0x1001ee8b;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*this_00,(ushort *)&local_10,1,(tagSIZE *)&local_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*this_00,pCVar2);
    uVar3 = local_18;
    uVar5 = local_14;
  }
  *(undefined4 *)((int)this + 0xa0) = uVar5;
  local_10 = (uint)*(ushort *)((int)this + 0xb0);
  *(undefined4 *)((int)this + 0x9c) = uVar3;
  local_18 = 0;
  local_14 = 0;
  if ((*this_00 != 0) && (*(ushort *)((int)this + 0xb0) != 0)) {
    piVar7 = aiStackY_448;
    for (iVar4 = 0x108; piVar6 = local_c, this_00 = this_00 + 1, iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar7 = *this_00;
      piVar7 = piVar7 + 1;
    }
    pCVar2 = (CHncFont *)FUN_100121e0((int)local_c);
    pCVar2 = CHncDrawContext::SelectObject((CHncDrawContext *)*piVar6,pCVar2);
    uStackY_38 = 0x1001eefe;
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*piVar6,(ushort *)&local_10,1,(tagSIZE *)&local_18);
    CHncDrawContext::SelectObject((CHncDrawContext *)*piVar6,pCVar2);
  }
  *(undefined4 *)((int)this + 0xa8) = local_14;
  *(undefined4 *)((int)this + 0xa4) = local_18;
  *param_1 = *(int *)((int)this + 0x94);
  iVar4 = *(int *)((int)this + 0x98);
  param_1[1] = iVar4;
  uStackY_38 = 0x1001ef38;
  iVar4 = MulDiv(iVar4,0x23,100);
  *param_1 = *param_1 + *(int *)((int)this + 0x9c) + *(int *)((int)this + 0x8c);
  param_1[1] = iVar4;
  return param_1;
}


