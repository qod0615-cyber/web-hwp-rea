//==== 10004f40 in 10004f40 HncGetEqEditPluginProxy

void HncGetEqEditPluginProxy(void)

{
  undefined4 *puVar1;
  
                    /* 0x4f40  64  HncGetEqEditPluginProxy */
  puVar1 = (undefined4 *)FUN_100a2ee8(0x4c);
  *puVar1 = &PTR_FUN_100b0d80;
  puVar1[1] = 0;
  puVar1[2] = 0;
  puVar1[3] = 0;
  puVar1[4] = 0;
  puVar1[5] = 0;
  puVar1[10] = 0;
  puVar1[0xb] = 7;
  *(undefined2 *)(puVar1 + 6) = 0;
  puVar1[0x10] = 0;
  puVar1[0x11] = 7;
  *(undefined2 *)(puVar1 + 0xc) = 0;
  puVar1[0x12] = 0;
  return;
}


//==== 10060020 in 10060020 FUN_10060020

undefined4 * __thiscall FUN_10060020(void *this,int *param_1,undefined4 param_2)

{
  uint uVar1;
  void *this_00;
  undefined4 *puVar2;
  undefined4 uVar3;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100aaa0f;
  local_10 = ExceptionList;
  uVar1 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  *(undefined ***)this = &PTR_FUN_100bed70;
  *(int **)((int)this + 4) = param_1;
  *(undefined4 *)((int)this + 8) = 0;
  *(undefined4 *)((int)this + 0xc) = 0;
  *(undefined4 *)((int)this + 0x10) = 1;
  if (param_1 != (int *)0x0) {
    this_00 = (void *)FUN_100a2ee8(0x40);
    local_8 = 0;
    if ((undefined **)*param_1 == &PTR_FUN_100be468) {
      if ((undefined **)param_1[-4] == &PTR_FUN_100be948) {
        uVar3 = *(undefined4 *)(param_1[1] + 4);
      }
      else {
        uVar3 = (*(code *)((undefined **)param_1[-4])[0x19])();
      }
    }
    else {
      uVar3 = (*(code *)((undefined **)*param_1)[0xc])(param_1,uVar1);
    }
    puVar2 = FUN_10064a50(this_00,param_2,uVar3);
    *(undefined4 **)((int)this + 0xc) = puVar2;
  }
  ExceptionList = local_10;
  return this;
}


//==== 10084210 in 100840d0 FUN_100840d0

void __thiscall FUN_100840d0(void *this,int *param_1,undefined4 param_2,uint param_3,int *param_4)

{
  uint uVar1;
  int iVar2;
  undefined **local_3c;
  undefined4 local_38;
  uint local_34;
  undefined1 local_30;
  undefined **local_2c;
  undefined4 local_28;
  undefined **local_24;
  undefined4 local_20;
  int *local_18;
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ab540;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  if (param_3 < 0x103) {
    if (param_3 == 0x102) {
      uVar1 = *(uint *)this;
      if (*(code **)(*param_1 + 0x30) == FUN_10059c50) {
        iVar2 = param_1[2];
        local_8 = 0;
        local_3c = &PTR_FUN_100be6c8;
        local_38 = (**(code **)(*(int *)(iVar2 + 0x10) + 4))();
        (**(code **)(*(int *)(iVar2 + 0x10) + 0xc))(&local_34);
        local_8 = 2;
        local_3c = &PTR__scalar_deleting_destructor__100bec20;
        local_2c = &PTR_LAB_100be7f8;
        local_28 = (**(code **)(*(int *)(iVar2 + 0x20) + 0x20))();
        local_8 = 4;
        local_3c = &PTR_FUN_100be3ac;
        local_2c = &PTR_LAB_100be17c;
        local_24 = &PTR_LAB_100be8e8;
        if (*(undefined ***)(iVar2 + 0x28) == &PTR_LAB_100be8e8) {
          local_20 = *(undefined4 *)(iVar2 + 0x2c);
        }
        else {
          local_20 = (*(code *)(*(undefined ***)(iVar2 + 0x28))[0x15])();
        }
        local_8 = 5;
        if ((uVar1 != 0) && (uVar1 <= local_34)) {
          local_18 = (int *)CONCAT31(local_18._1_3_,local_30);
          FUN_10075c10(&local_3c,local_34 - uVar1,local_30);
          local_20 = 0;
          FUN_10074d30((void *)param_1[2],1,(int *)&local_3c,uVar1,(void *)0x0,0);
        }
      }
      else {
        (**(code **)(*param_1 + 0x30))(uVar1);
      }
    }
    else if (param_3 == 0x100) {
      (**(code **)(*param_1 + 0x2c))
                (param_4,0,param_4 + 0xa0,(short)param_4[0x1e0],
                 *(undefined2 *)((int)param_4 + 0x782),*(short *)((int)param_4 + 0x786) == 1);
    }
    else if (param_3 == 0x101) {
      (**(code **)(*param_1 + 0x2c))
                (param_4,1,param_4 + 0xa0,0,((short)param_4[0x1e2] != 1) - 1,
                 *(short *)((int)param_4 + 0x786) == 1);
    }
  }
  else if (param_3 == 0x210) {
    if (*(code **)(*param_1 + 0x20) == FUN_100599d0) {
      FUN_1005ad70(param_1,1,(CHncDrawContext *)0x0);
      local_18 = param_1 + 8;
      FUN_10057980(param_1,param_4,0);
    }
    else {
      (**(code **)(*param_1 + 0x20))(&local_18,param_4,local_14);
    }
    if ((*(byte *)(local_18 + 5) & 1) == 0) {
      param_4[6] = 0;
      param_4[4] = 0;
      param_4[5] = 0;
    }
    else {
      param_4[6] = local_18[3] - local_18[1];
      param_4[4] = *local_18;
      param_4[5] = local_18[1];
    }
  }
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


//==== 10084a00 in 10084930 FUN_10084930

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_10084930(void *this,int param_1,int param_2,undefined4 param_3)

{
  wchar_t *pwVar1;
  int iVar2;
  CHncFont *pCVar3;
  short *psVar4;
  short sVar5;
  int iVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  undefined4 auStackY_65c [256];
  undefined4 uStackY_25c;
  int local_224;
  wchar_t *local_220;
  wchar_t local_21c [260];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ab5bc;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  local_220 = this;
  if ((((ushort)param_3 < 0x20) || (*(int *)this == 0)) || ((ushort)param_3 == 0))
  goto LAB_10084ccf;
  if (((ushort)param_3 != 0xe0ea) && ((ushort)param_3 == 0x2026)) {
    iVar2 = (int)this + 0x858;
    if (7 < *(uint *)((int)this + 0x86c)) {
      iVar2 = *(int *)((int)this + 0x858);
    }
    if (*(int *)((int)this + 0x868) == 7) {
      psVar4 = &DAT_100bf2b0;
      iVar6 = 7;
      do {
        if (*(short *)(iVar2 + -0x100bf2b0 + (int)psVar4) != *psVar4) goto LAB_100849f6;
        psVar4 = psVar4 + 1;
        iVar6 = iVar6 + -1;
      } while (iVar6 != 0);
      param_2 = param_2 + (int)((float)*(int *)((int)this + 0x848) * _DAT_100bfddc);
    }
  }
LAB_100849f6:
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
        goto LAB_10084a44;
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
    pCVar3 = (CHncFont *)FUN_10084820((int)this);
    pCVar3 = CHncDrawContext::SelectObject(*(CHncDrawContext **)this,pCVar3);
    CHncDrawContext::SetTextAlign(*(CHncDrawContext **)local_220,0x18);
    iVar2 = HncIntMulDiv();
    uStackY_25c = 0x10084b9b;
    CHncDrawContext::ExtTextOutW
              (*(CHncDrawContext **)local_220,param_1,param_2 + iVar2,0,(tagRECT *)0x0,
               (ushort *)&param_3,1,(int *)0x0);
    CHncDrawContext::SetTextAlign(*(CHncDrawContext **)local_220,0);
    pwVar1 = local_220;
    CHncDrawContext::SelectObject(*(CHncDrawContext **)local_220,pCVar3);
    pwVar1[7] = L'\0';
    goto LAB_10084ccf;
  }
LAB_10084a44:
  iVar2 = FUN_10084610(this,(ushort)param_3);
  if (iVar2 == 0) {
    CHncStringW::CHncStringW((CHncStringW *)&local_220);
    local_8 = 0;
    HncLoadStringW((HINSTANCE__ *)0x0,"IDS_EQ_LOG_FONTNAME",(CHncStringW *)&local_220);
    wcscpy_s(local_21c,0x104,(wchar_t *)((int)this + 0x28));
    FUN_10084770(this,(int)this + 4,local_220);
    local_8 = 0xffffffff;
    CHncStringW::~CHncStringW((CHncStringW *)&local_220);
  }
  puVar8 = auStackY_65c;
  puVar7 = this;
  for (iVar6 = 0x108; puVar7 = puVar7 + 1, iVar6 != 0; iVar6 = iVar6 + -1) {
    *puVar8 = *puVar7;
    puVar8 = puVar8 + 1;
  }
  pCVar3 = (CHncFont *)FUN_10084820((int)this);
  pCVar3 = CHncDrawContext::SelectObject(*(CHncDrawContext **)this,pCVar3);
  if ((((ushort)param_3 < 0xe044) || (0xe084 < (ushort)param_3)) &&
     (5 < (ushort)((ushort)param_3 + 0x1f00))) {
    CHncDrawContext::SetTextAlign(*(CHncDrawContext **)this,0x18);
    iVar6 = HncIntMulDiv();
    uStackY_25c = 0x10084ca0;
    CHncDrawContext::ExtTextOutW
              (*(CHncDrawContext **)this,param_1,local_224 + iVar6,0,(tagRECT *)0x0,
               (ushort *)&param_3,1,(int *)0x0);
    CHncDrawContext::SetTextAlign(*(CHncDrawContext **)this,0);
  }
  else if ((ushort)param_3 < 0xe078) {
    uStackY_25c = 0x10084c33;
    CHncDrawContext::ExtTextOutW
              (*(CHncDrawContext **)this,param_1,local_224,0,(tagRECT *)0x0,(ushort *)&param_3,1,
               (int *)0x0);
  }
  else {
    HncDRSelectFontQualityType();
    uStackY_25c = 0x10084c5f;
    CHncDrawContext::ExtTextOutW
              (*(CHncDrawContext **)this,param_1,local_224,0,(tagRECT *)0x0,(ushort *)&param_3,1,
               (int *)0x0);
    HncDRSelectFontQualityType();
  }
  CHncDrawContext::SelectObject(*(CHncDrawContext **)this,pCVar3);
  if (iVar2 == 0) {
    FUN_10084770(this,(int)this + 4,local_21c);
  }
LAB_10084ccf:
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


//==== 10084d50 in 10084cf0 FUN_10084cf0

void __thiscall FUN_10084cf0(void *this,int param_1,int param_2,ushort *param_3)

{
  bool bVar1;
  uint uVar2;
  int iVar3;
  CHncFont *pCVar4;
  ushort **ppuVar5;
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
  puStack_c = &LAB_100ab604;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
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
          FUN_1000e530();
        }
        ppuVar5 = &param_3;
        if (7 < in_stack_00000020) {
          ppuVar5 = (ushort **)param_3;
        }
        iVar3 = FUN_10084610(this,*(ushort *)((int)ppuVar5 + uVar6 * 2));
        if (iVar3 == 0) {
          bVar1 = true;
          CHncStringW::CHncStringW((CHncStringW *)&local_224);
          local_8._0_1_ = 1;
          HncLoadStringW((HINSTANCE__ *)0x0,"IDS_EQ_LOG_FONTNAME",(CHncStringW *)&local_224);
          wcscpy_s(local_21c,0x104,(wchar_t *)((int)this + 0x28));
          FUN_10084770(this,(int)this + 4,local_224);
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
    pCVar4 = (CHncFont *)FUN_10084820((int)this);
    pCVar4 = CHncDrawContext::SelectObject(*(CHncDrawContext **)this,pCVar4);
    CHncDrawContext::SetTextAlign((CHncDrawContext *)*local_220,0x18);
    iVar3 = HncIntMulDiv();
    ppuVar5 = &param_3;
    if (7 < in_stack_00000020) {
      ppuVar5 = (ushort **)param_3;
    }
    uStackY_258 = 0x10084e61;
    CHncDrawContext::ExtTextOutW
              ((CHncDrawContext *)*local_220,param_1,param_2 + iVar3,0,(tagRECT *)0x0,
               (ushort *)ppuVar5,in_stack_0000001c,(int *)0x0);
    CHncDrawContext::SetTextAlign((CHncDrawContext *)*local_220,0);
    puVar7 = local_220;
    CHncDrawContext::SelectObject((CHncDrawContext *)*local_220,pCVar4);
    if (bVar1) {
      FUN_10084770(puVar7,(int)(puVar7 + 1),local_21c);
    }
  }
  FUN_10005c10((int *)&param_3);
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


//==== 1008a9a0 in 1008a950 FUN_1008a950

void __thiscall FUN_1008a950(void *this,undefined4 *param_1,int param_2)

{
  int iVar1;
  undefined4 uVar2;
  int unaff_EBX;
  int iVar3;
  undefined4 uStack_1c;
  undefined1 local_10 [12];
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    *param_1 = *(undefined4 *)((int)this + 0x58);
    param_1[1] = *(undefined4 *)((int)this + 0x5c);
    return;
  }
  iVar3 = 0;
  *(undefined4 *)((int)this + 0x44) = 0;
  if (*(int *)((int)this + 0x9c) == 0) {
    *(undefined4 *)((int)this + 0x78) = 0;
    do {
      do {
        iVar1 = FUN_1008aa20(this,iVar3,0,param_2);
        iVar3 = iVar3 + 1;
      } while (iVar1 != 0);
    } while (iVar3 < 2);
  }
  *(undefined4 *)((int)this + 0xa0) = *(undefined4 *)((int)this + 0x58);
  iVar3 = *(int *)((int)this + 0x5c);
  *(int *)((int)this + 0xa4) = iVar3;
  uVar2 = *(undefined4 *)((int)this + 0x58);
  if (*(int **)((int)this + 0x98) != (int *)0x0) {
    iVar3 = (**(code **)(**(int **)((int)this + 0x98) + 8))(local_10,param_2);
    iVar1 = MulDiv(*(int *)((int)this + 8),*(int *)((int)this + 0x84),100);
    iVar3 = unaff_EBX + iVar1 + *(int *)(iVar3 + 4);
    uVar2 = uStack_1c;
  }
  *(undefined4 *)((int)this + 0x58) = uVar2;
  *(int *)((int)this + 0x5c) = iVar3;
  *param_1 = uVar2;
  param_1[1] = iVar3;
  return;
}


//==== 10097af0 in 10097af0 FUN_10097af0

void __thiscall FUN_10097af0(void *this,int param_1,int param_2,int *param_3,int param_4)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  short sVar4;
  ushort uVar5;
  int iVar6;
  undefined2 extraout_var;
  int iVar7;
  short *psVar8;
  ushort *puVar9;
  int local_24;
  short local_20;
  ushort local_1c;
  ushort local_1a [9];
  uint local_8;
  
  local_8 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  iVar1 = param_1 + param_2 * 0x48;
  psVar8 = (short *)*param_3;
  local_20 = 0;
  sVar4 = *psVar8;
  while (sVar4 == 0x20) {
    psVar8 = psVar8 + 1;
    *param_3 = (int)psVar8;
    sVar4 = *psVar8;
  }
  local_24 = 0;
  if (sVar4 != 0x7b) {
    __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
    return;
  }
  psVar8 = psVar8 + 1;
  *param_3 = (int)psVar8;
  iVar6 = *(int *)(param_1 + 0x10);
  puVar2 = (undefined4 *)(param_1 + iVar6 * 0x48);
  *(undefined4 *)(param_1 + 0x10) = puVar2[4];
  puVar2[1] = 0;
  puVar2[2] = 0;
  puVar2[4] = 0;
  puVar2[3] = 0;
  puVar2[6] = 0;
  puVar2[5] = 0;
  puVar2[9] = 0;
  puVar2[10] = 0;
  *puVar2 = 0;
  puVar2[0xb] = 0;
  puVar2[8] = 0;
  puVar2[7] = 0;
  puVar2[0xc] = 0;
  puVar2[0xd] = 0;
  *(int *)(iVar1 + 4) = iVar6;
  do {
    if (iVar6 == 0) {
LAB_10097d92:
      *(short *)(iVar1 + 0x44) = local_20;
      *(short *)(iVar1 + 0x40) = (short)local_24;
      __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
      return;
    }
    local_20 = local_20 + 1;
    puVar2[7] = param_4;
    iVar6 = *(int *)(param_1 + 0x10);
    puVar3 = (undefined4 *)(param_1 + iVar6 * 0x48);
    *(undefined4 *)(param_1 + 0x10) = puVar3[4];
    puVar3[1] = 0;
    puVar3[2] = 0;
    puVar3[4] = 0;
    puVar3[3] = 0;
    puVar3[6] = 0;
    puVar3[5] = 0;
    puVar3[9] = 0;
    puVar3[10] = 0;
    *puVar3 = 0;
    puVar3[0xb] = 0;
    puVar3[8] = 0;
    puVar3[7] = 0;
    puVar3[0xc] = 0;
    puVar3[0xd] = 0;
    puVar2[2] = iVar6;
    if ((iVar6 == 0) || (iVar6 = FUN_10099000(this,param_1,iVar6,param_3,param_4), iVar6 != 0))
    goto LAB_10097d92;
    iVar7 = 0;
    iVar6 = 1;
    if (psVar8 != (short *)0x0) {
      do {
        if (psVar8 == (short *)*param_3) break;
        if ((iVar7 == 0) && (*psVar8 == 0x26)) {
          iVar6 = iVar6 + 1;
        }
        if (*psVar8 == 0x7b) {
          iVar7 = iVar7 + 1;
        }
        else if (*psVar8 == 0x7d) {
          iVar7 = iVar7 + -1;
        }
        psVar8 = psVar8 + 1;
      } while (psVar8 != (short *)0x0);
    }
    puVar9 = (ushort *)*param_3;
    if (iVar6 <= local_24) {
      iVar6 = local_24;
    }
    uVar5 = *puVar9;
    while (uVar5 == 0x20) {
      puVar9 = puVar9 + 1;
      *param_3 = (int)puVar9;
      uVar5 = *puVar9;
    }
    uVar5 = FUN_100977b0(this,&local_1c,puVar9);
    local_24 = iVar6;
    if (CONCAT22(extraout_var,uVar5) != 0x23) {
      if (*puVar9 == 0x7d) {
        *param_3 = *param_3 + 2;
      }
      goto LAB_10097d92;
    }
    iVar6 = 0;
    puVar9 = &local_1c;
    uVar5 = local_1c;
    while (uVar5 != 0) {
      puVar9 = puVar9 + 1;
      iVar6 = iVar6 + 1;
      uVar5 = *puVar9;
    }
    *param_3 = *param_3 + iVar6 * 2;
    iVar6 = *(int *)(param_1 + 0x10);
    psVar8 = (short *)*param_3;
    puVar3 = (undefined4 *)(param_1 + iVar6 * 0x48);
    *(undefined4 *)(param_1 + 0x10) = puVar3[4];
    puVar3[1] = 0;
    puVar3[2] = 0;
    puVar3[4] = 0;
    puVar3[3] = 0;
    puVar3[6] = 0;
    puVar3[5] = 0;
    puVar3[9] = 0;
    puVar3[10] = 0;
    *puVar3 = 0;
    puVar3[0xb] = 0;
    puVar3[8] = 0;
    puVar3[7] = 0;
    puVar3[0xc] = 0;
    puVar3[0xd] = 0;
    puVar2[1] = iVar6;
    puVar2 = puVar3;
  } while( true );
}


//==== 10099000 in 10099000 FUN_10099000

void __thiscall FUN_10099000(void *this,int param_1,int param_2,int *param_3,int param_4)

{
  int *piVar1;
  ushort uVar2;
  ushort uVar3;
  undefined2 extraout_var;
  int iVar4;
  undefined2 extraout_var_00;
  int iVar5;
  int iVar6;
  short *psVar7;
  undefined2 *puVar8;
  ushort *puVar9;
  int local_40;
  ushort *local_3c;
  int local_30;
  int *local_28;
  int local_24;
  ushort local_20 [12];
  uint local_8;
  
  local_8 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  local_30 = param_2;
  puVar9 = (ushort *)*param_3;
  local_28 = (int *)(param_1 + param_2 * 0x48);
  uVar3 = *puVar9;
  local_24 = 0;
  while (uVar3 == 0x20) {
    puVar9 = (ushort *)(*param_3 + 2);
    *param_3 = (int)puVar9;
    uVar3 = *puVar9;
  }
  uVar3 = FUN_100977b0(this,local_20,puVar9);
  iVar4 = CONCAT22(extraout_var,uVar3);
  if ((((((iVar4 == 0x5e) || (iVar4 == 0x5f)) || (iVar4 == 0x2d)) ||
       ((iVar4 == 0x2c || (iVar4 == 6)))) || (iVar4 == 7)) ||
     (((iVar4 == 8 || (iVar4 == 9)) || (iVar4 == 10)))) {
    __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
    return;
  }
  if (*puVar9 != 0) {
    while ((((iVar4 != 0x7d && (iVar4 != 0x23)) && (iVar4 != 0)) && (local_24 == 0))) {
      switch(iVar4) {
      case 1:
      case 3:
      case 4:
      case 0xb:
      case 0xf:
      case 0x10:
      case 0x11:
      case 0x12:
      case 0x13:
      case 0x15:
      case 0x16:
      case 0x17:
      case 0x18:
      case 0x19:
      case 0x1b:
      case 0x1c:
      case 0x1d:
      case 0x1e:
      case 0x1f:
      case 0x20:
      case 0x21:
      case 0x28:
      case 0x29:
      case 0x2b:
      case 0x2e:
      case 0x2f:
      case 0x31:
      case 0x32:
      case 0x4b:
      case 0x6f:
      case 0x75:
        *local_28 = iVar4;
        local_24 = FUN_10098120(this,param_1,local_30,param_3,param_4);
        psVar7 = (short *)*param_3;
        break;
      default:
        __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
        return;
      case 0xc:
      case 0xd:
      case 0xe:
      case 0x26:
        local_28[7] = param_4;
        iVar5 = 0;
        *local_28 = iVar4;
        puVar9 = local_20;
        while (local_20[0] != 0) {
          puVar9 = puVar9 + 1;
          iVar5 = iVar5 + 1;
          local_20[0] = *puVar9;
        }
        *param_3 = *param_3 + iVar5 * 2;
        psVar7 = (short *)*param_3;
        goto LAB_100993a7;
      case 0x2c:
        iVar4 = 0;
        puVar9 = local_20;
        uVar3 = local_20[0];
        while (uVar3 != 0) {
          puVar9 = puVar9 + 1;
          iVar4 = iVar4 + 1;
          uVar3 = *puVar9;
        }
        *param_3 = *param_3 + iVar4 * 2;
        iVar4 = FUN_10099770(param_1);
        local_28[6] = iVar4;
        if (iVar4 == 0) {
LAB_1009966b:
          __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
          return;
        }
        local_24 = FUN_10098120(this,param_1,iVar4,param_3,(param_4 << 6) / 100);
        psVar7 = (short *)*param_3;
        iVar5 = *(int *)(param_1 + 0x14 + iVar4 * 0x48);
        if (iVar5 != 0) {
          local_28[5] = iVar5;
          *(undefined4 *)(param_1 + 0x14 + iVar4 * 0x48) = 0;
        }
        break;
      case 0x2d:
        iVar4 = 0;
        puVar9 = local_20;
        uVar3 = local_20[0];
        while (uVar3 != 0) {
          puVar9 = puVar9 + 1;
          iVar4 = iVar4 + 1;
          uVar3 = *puVar9;
        }
        *param_3 = *param_3 + iVar4 * 2;
        iVar4 = FUN_10099770(param_1);
        local_28[5] = iVar4;
        if (iVar4 == 0) goto LAB_1009966b;
        local_24 = FUN_10098120(this,param_1,iVar4,param_3,(param_4 << 6) / 100);
        psVar7 = (short *)*param_3;
        iVar5 = *(int *)(param_1 + 0x18 + iVar4 * 0x48);
        if (iVar5 != 0) {
          local_28[6] = iVar5;
          *(undefined4 *)(param_1 + 0x18 + iVar4 * 0x48) = 0;
        }
        break;
      case 0x5e:
        iVar4 = 0;
        puVar9 = local_20;
        uVar3 = local_20[0];
        while (uVar3 != 0) {
          puVar9 = puVar9 + 1;
          iVar4 = iVar4 + 1;
          uVar3 = *puVar9;
        }
        *param_3 = *param_3 + iVar4 * 2;
        iVar4 = FUN_10099770(param_1);
        local_28[3] = iVar4;
        if (iVar4 == 0) goto LAB_1009966b;
        local_24 = FUN_10098120(this,param_1,iVar4,param_3,(param_4 << 6) / 100);
        psVar7 = (short *)*param_3;
        iVar5 = *(int *)(param_1 + 0x10 + iVar4 * 0x48);
        if (iVar5 != 0) {
          local_28[4] = iVar5;
          *(undefined4 *)(param_1 + 0x10 + iVar4 * 0x48) = 0;
        }
        break;
      case 0x5f:
        iVar4 = 0;
        puVar9 = local_20;
        uVar3 = local_20[0];
        while (uVar3 != 0) {
          puVar9 = puVar9 + 1;
          iVar4 = iVar4 + 1;
          uVar3 = *puVar9;
        }
        *param_3 = *param_3 + iVar4 * 2;
        iVar4 = FUN_10099770(param_1);
        local_28[4] = iVar4;
        if (iVar4 == 0) goto LAB_1009966b;
        local_24 = FUN_10098120(this,param_1,iVar4,param_3,(param_4 << 6) / 100);
        psVar7 = (short *)*param_3;
        iVar5 = *(int *)(param_1 + 0xc + iVar4 * 0x48);
        if (iVar5 != 0) {
          local_28[3] = iVar5;
          *(undefined4 *)(param_1 + 0xc + iVar4 * 0x48) = 0;
        }
        break;
      case 0x7b:
        *param_3 = *param_3 + 2;
        *local_28 = iVar4;
        iVar4 = FUN_10099770(param_1);
        local_28[1] = iVar4;
        if (iVar4 == 0) goto LAB_1009966b;
        local_28[7] = param_4;
        local_24 = FUN_10099000(this,param_1,iVar4,param_3,param_4);
        if (*(short *)*param_3 != 0x7d) {
          __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
          return;
        }
        psVar7 = (short *)*param_3 + 1;
        *param_3 = (int)psVar7;
      }
      if (local_24 != 0) break;
LAB_100993a7:
      local_20[0] = 0;
      if (*psVar7 == 0) break;
      while( true ) {
        local_3c = (ushort *)FUN_10097490(param_3);
        uVar3 = FUN_100977b0(this,local_20,local_3c);
        iVar4 = CONCAT22(extraout_var_00,uVar3);
        if (((iVar4 == 0x7d) || (iVar4 == 0x23)) || (iVar4 == 0)) goto LAB_1009963c;
        if (((iVar4 != 8) && (iVar4 != 9)) && (iVar4 != 10)) break;
        iVar5 = 0;
        puVar9 = local_20;
        uVar2 = local_20[0];
        while (uVar2 != 0) {
          puVar9 = puVar9 + 1;
          iVar5 = iVar5 + 1;
          uVar2 = *puVar9;
        }
        local_40 = 1;
        *param_3 = *param_3 + iVar5 * 2;
        local_3c = (ushort *)*param_3;
LAB_10099441:
        iVar5 = FUN_10099770(param_1);
        if (iVar5 == 0) {
LAB_10099635:
          local_24 = 1;
          goto LAB_1009963c;
        }
        iVar6 = iVar5 * 0x48;
        piVar1 = (int *)(iVar6 + param_1);
        piVar1[7] = param_4;
        if (local_40 == 2) {
          *(undefined4 *)(iVar6 + param_1) = 0x7b;
LAB_100994da:
          if (((iVar4 == 8) || (iVar4 == 9)) || (iVar4 == 10)) goto LAB_100994a7;
          piVar1[1] = local_30;
        }
        else {
          *(int *)(iVar6 + param_1) = iVar4;
          local_20[1] = 0;
          puVar8 = (undefined2 *)(param_1 + 0x34 + iVar6);
          local_20[0] = uVar3;
          if (iVar4 != 10) {
            FUN_10097470((int)puVar8,(short *)local_20);
            goto LAB_100994da;
          }
          *(undefined4 *)(iVar6 + param_1) = 0xb;
          *puVar8 = 6;
          FUN_10097450((short *)((int)piVar1 + 0x36),"()");
LAB_100994a7:
          piVar1[3] = local_30;
        }
        iVar6 = FUN_100997f0(param_1,*(int *)(param_1 + 8),local_30);
        if (*(int *)(param_1 + 4 + iVar6 * 0x48) == local_30) {
          *(int *)(param_1 + 4 + iVar6 * 0x48) = iVar5;
        }
        else if (*(int *)(param_1 + 8 + iVar6 * 0x48) == local_30) {
          *(int *)(param_1 + 8 + iVar6 * 0x48) = iVar5;
        }
        else if (*(int *)(param_1 + 0xc + iVar6 * 0x48) == local_30) {
          *(int *)(param_1 + 0xc + iVar6 * 0x48) = iVar5;
        }
        else {
          if (*(int *)(param_1 + 0x10 + iVar6 * 0x48) != local_30) {
            local_24 = 10;
            goto LAB_1009963c;
          }
          *(int *)(param_1 + 0x10 + iVar6 * 0x48) = iVar5;
        }
        local_30 = iVar5;
        local_28 = piVar1;
        if (((iVar4 == 8) || (iVar4 == 9)) || (iVar4 == 10)) {
          iVar5 = FUN_10099770(param_1);
          piVar1[4] = iVar5;
          if (iVar5 == 0) goto LAB_10099635;
          local_24 = FUN_10098120(this,param_1,iVar5,param_3,param_4);
          local_3c = (ushort *)*param_3;
          if (local_24 != 0) goto LAB_1009963c;
        }
        if (local_40 == 2) goto LAB_10099592;
        if (*local_3c == 0) goto LAB_1009957a;
      }
      if ((((iVar4 == 0x5e) || (iVar4 == 0x5f)) || (iVar4 == 0x2d)) || (iVar4 == 0x2c)) {
        local_40 = 2;
        goto LAB_10099441;
      }
LAB_10099592:
      if (iVar4 == 0x5e) {
        iVar5 = local_28[3];
LAB_1009960b:
        if (iVar5 == 0) goto LAB_100995d6;
LAB_1009960d:
        local_30 = FUN_10099770(param_1);
        local_28[2] = local_30;
        local_28 = (int *)(param_1 + local_30 * 0x48);
      }
      else if (iVar4 == 0x5f) {
LAB_100995ca:
        iVar5 = local_28[4];
LAB_100995d1:
        if (iVar5 != 0) goto LAB_1009960d;
      }
      else {
        if ((iVar4 == 0x2d) || (iVar4 == 0x2c)) {
          if (iVar4 == 0x5f) goto LAB_100995ca;
          if (iVar4 != 0x2d) {
            if (iVar4 == 0x2c) {
              iVar5 = local_28[6];
              goto LAB_1009960b;
            }
            goto LAB_100995d6;
          }
          iVar5 = local_28[5];
          goto LAB_100995d1;
        }
        local_30 = FUN_10099770(param_1);
        local_28[2] = local_30;
        local_28 = (int *)(param_1 + local_30 * 0x48);
      }
LAB_100995d6:
      if (local_30 == 0) {
        local_24 = 1;
      }
LAB_1009963c:
      if (*local_3c == 0) {
LAB_1009957a:
        __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
        return;
      }
    }
  }
  __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
  return;
}


//==== 1008aa20 in 1008aa20 FUN_1008aa20

int __thiscall FUN_1008aa20(void *this,int param_1,int param_2,undefined4 param_3)

{
  ushort *puVar1;
  int *piVar2;
  int iVar3;
  void *pvVar4;
  void *pvVar5;
  wchar_t *pwVar6;
  int *piVar7;
  int iVar8;
  void *pvVar9;
  int extraout_EDX;
  int iVar10;
  undefined1 local_2c [8];
  int local_24;
  int local_20;
  int local_1c;
  int local_14;
  int local_10;
  int local_c;
  
  local_1c = param_1;
  local_c = 0;
  local_14 = 0;
  local_20 = 0;
  local_10 = 0;
  local_24 = 0;
  piVar2 = *(int **)(*(int *)((int)this + 0x8c) + 100);
  piVar7 = piVar2;
  if (param_1 == 0) {
    *(undefined4 *)(*(int *)((int)this + 0x8c) + 8) = *(undefined4 *)((int)this + 8);
    *(undefined4 *)(*(int *)((int)this + 0x8c) + 0x40) = *(undefined4 *)((int)this + 0x40);
    *(undefined4 *)(*(int *)((int)this + 0x8c) + 0x3c) = *(undefined4 *)((int)this + 0x3c);
    if (*(int *)((int)this + 0x94) == 0) {
      iVar8 = *(int *)((int)this + 0x74);
      puVar1 = (ushort *)(iVar8 + 0xe);
      *puVar1 = *puVar1 & 1;
      if (*puVar1 == 0) {
        *(undefined4 *)(iVar8 + 0x850) = 1;
      }
    }
    if (piVar2 == *(int **)((int)this + 0x90)) {
      pvVar9 = *(void **)((int)this + 0x74);
      local_10 = 0;
      local_c = 0;
      if (((*(int *)((int)this + 0x94) == 0) || (*(int *)((int)pvVar9 + 0x880) != 1)) ||
         ((((iVar8 = *(int *)(*(int *)((int)this + 0x94) + 4), iVar8 != 2 &&
            ((((iVar8 != 7 && (iVar8 != 3)) && (iVar8 != 5)) && ((iVar8 != 8 && (iVar8 != 0x4d))))))
           && ((iVar8 != 0x77 &&
               (((iVar8 != 0x42 && (iVar8 != 0x44)) &&
                ((iVar8 != 0x45 && (((iVar8 != 0x43 && (iVar8 != 0x46)) && (iVar8 != 0x6b))))))))))
          && (iVar8 != 0x6c)))) {
        pwVar6 = (wchar_t *)((int)pvVar9 + 0x858);
        if (7 < *(uint *)((int)pvVar9 + 0x86c)) {
          pwVar6 = *(wchar_t **)pwVar6;
        }
        FUN_10084560(pvVar9,*(int *)((int)this + 8),pwVar6);
        local_c = *(int *)((int)pvVar9 + 0x848);
        local_10 = *(int *)((int)pvVar9 + 0x84c);
      }
      local_14 = -(local_c / 2);
    }
  }
  else {
    local_24 = *(int *)((int)this + 0x58);
    local_c = *(int *)((int)this + 0x5c);
    local_14 = *(int *)((int)this + 0x54);
  }
  for (; (piVar7 != (int *)0x0 && (piVar7 != *(int **)((int)this + 0x90)));
      piVar7 = (int *)piVar7[0x19]) {
    if (piVar7[1] == 0x6f) {
      FUN_1008ba00((int)piVar7);
    }
  }
  do {
    iVar8 = param_1;
    if (piVar2 == (int *)0x0) {
LAB_1008ac04:
      pvVar9 = *(void **)((int)this + 0x98);
      if (param_2 < local_10) {
        param_2 = local_10;
      }
      if (pvVar9 == (void *)0x0) {
        iVar8 = 0;
      }
      else {
        if (iVar8 == 0) {
          *(undefined4 *)((int)pvVar9 + 8) = *(undefined4 *)((int)this + 8);
          pvVar9 = *(void **)((int)this + 0x98);
        }
        iVar8 = FUN_1008aa20(pvVar9,iVar8,param_2,param_3);
      }
      if (iVar8 < param_2) {
        iVar8 = param_2;
      }
      if (piVar2 != (int *)0x0) {
        piVar2[0x14] = local_24 + iVar8;
      }
      if (param_1 == 0) {
        pvVar5 = *(void **)((int)this + 0x9c);
        pvVar9 = this;
        while (pvVar4 = pvVar5, pvVar4 != (void *)0x0) {
          pvVar9 = pvVar4;
          pvVar5 = *(void **)((int)pvVar4 + 0x9c);
        }
        if (*(int *)((int)pvVar9 + 0x78) != 0) {
          iVar10 = piVar2[0x14];
          for (iVar3 = piVar2[0x18]; iVar3 != 0; iVar3 = *(int *)(iVar3 + 0x60)) {
            iVar10 = iVar10 - *(int *)(iVar3 + 0x58);
            *(int *)(iVar3 + 0x50) = iVar10;
          }
        }
      }
      *(int *)((int)this + 0x58) = local_24 + iVar8;
      *(int *)((int)this + 0x54) = local_14;
      *(int *)((int)this + 0x5c) = local_c;
      return iVar8;
    }
    if (piVar2 == *(int **)((int)this + 0x90)) {
LAB_1008ac34:
      if (((piVar2 != (int *)0x0) && (param_1 == 0)) && (piVar2[1] == 100)) {
        iVar8 = FUN_10088930((int)this);
        *(undefined4 *)(iVar8 + 0x78) = 1;
        iVar8 = extraout_EDX;
      }
      goto LAB_1008ac04;
    }
    if (piVar2[1] == 100) {
      if (local_1c == 0) goto LAB_1008ac34;
      local_1c = local_1c + -1;
    }
    if (local_1c == 0) {
      piVar7 = (int *)(**(code **)(*piVar2 + 8))(local_2c,param_3);
      iVar8 = piVar2[0x15];
      local_10 = local_10 + *piVar7;
      if (iVar8 <= local_14) {
        local_14 = iVar8;
      }
      if (local_20 <= piVar2[0x17] + iVar8) {
        local_20 = piVar2[0x17] + iVar8;
      }
      if (local_c <= local_20 - local_14) {
        local_c = local_20 - local_14;
      }
    }
    piVar2 = (int *)piVar2[0x19];
  } while( true );
}


