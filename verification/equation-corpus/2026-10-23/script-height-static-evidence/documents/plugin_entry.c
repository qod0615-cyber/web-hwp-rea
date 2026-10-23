//==== 10064ca0 in 10064ca0 FUN_10064ca0

void __thiscall FUN_10064ca0(void *this,undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  code *pcVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 local_c;
  
  iVar1 = CHncDrawContext::GetMapMode(*(CHncDrawContext **)((int)this + 4));
  *(int *)((int)this + 0x1c) = iVar1;
  CHncDrawContext::GetWindowExt
            (*(CHncDrawContext **)((int)this + 4),(int *)((int)this + 0x20),
             (int *)((int)this + 0x24));
  CHncDrawContext::GetViewportExt
            (*(CHncDrawContext **)((int)this + 4),(int *)((int)this + 0x28),
             (int *)((int)this + 0x2c));
  CHncDrawContext::GetWindowOrg
            (*(CHncDrawContext **)((int)this + 4),(int *)((int)this + 0x30),
             (int *)((int)this + 0x34));
  CHncDrawContext::GetViewportOrg
            (*(CHncDrawContext **)((int)this + 4),(int *)((int)this + 0x38),
             (int *)((int)this + 0x3c));
  pcVar4 = HncIntMulDiv_exref;
  uVar5 = 100;
  if (*(int *)((int)this + 0x1c) == 1) {
    local_c = HncIntMulDiv(0x60,param_1,100);
    iVar1 = HncIntMulDiv(0x60,param_1,100);
  }
  else {
    uVar6 = param_1;
    iVar1 = CHncDrawContext::DxGetDeviceCaps(*(CHncDrawContext **)((int)this + 4),0x58);
    local_c = HncIntMulDiv(iVar1,uVar6,uVar5);
    uVar6 = 100;
    uVar5 = param_1;
    iVar1 = CHncDrawContext::DxGetDeviceCaps(*(CHncDrawContext **)((int)this + 4),0x5a);
    pcVar4 = HncIntMulDiv_exref;
    iVar1 = HncIntMulDiv(iVar1,uVar5,uVar6);
  }
  iVar2 = (*pcVar4)(param_2,param_1,100);
  iVar3 = HncIntMulDiv(param_3,param_1,100);
  CHncDrawContext::SetMapMode(*(CHncDrawContext **)((int)this + 4),8);
  CHncDrawContext::SetWindowExt(*(CHncDrawContext **)((int)this + 4),0x1c20,0x1c20);
  CHncDrawContext::SetWindowOrg(*(CHncDrawContext **)((int)this + 4),0,0);
  CHncDrawContext::SetViewportOrg
            (*(CHncDrawContext **)((int)this + 4),*(int *)((int)this + 0x38) + iVar2,
             *(int *)((int)this + 0x3c) + iVar3);
  CHncDrawContext::SetViewportExt(*(CHncDrawContext **)((int)this + 4),local_c,iVar1);
  CHncDrawContext::SetLogicalDpi(*(CHncDrawContext **)((int)this + 4),0x1c20,0x1c20);
  CHncDrawContext::SetTextAlign(*(CHncDrawContext **)((int)this + 4),0x18);
  CHncDrawContext::SetBkMode(*(CHncDrawContext **)((int)this + 4),1);
  return;
}


//==== 10084560 in 10084560 FUN_10084560

void __thiscall FUN_10084560(void *this,int param_1,wchar_t *param_2)

{
  int iVar1;
  
  *(int *)((int)this + 0x38c) = param_1;
  *(int *)((int)this + 0x2f8) = param_1;
  *(int *)((int)this + 0x264) = param_1;
  *(int *)((int)this + 0x1d0) = param_1;
  *(int *)((int)this + 0x13c) = param_1;
  *(int *)((int)this + 0xa8) = param_1;
  *(int *)((int)this + 0x14) = param_1;
  *(int *)((int)this + 0x848) = param_1;
  iVar1 = param_1 / 2;
  *(int *)((int)this + 0x394) = iVar1;
  *(int *)((int)this + 0x300) = iVar1;
  *(int *)((int)this + 0x26c) = iVar1;
  *(int *)((int)this + 0x1d8) = iVar1;
  *(int *)((int)this + 0x144) = iVar1;
  *(int *)((int)this + 0xb0) = iVar1;
  *(int *)((int)this + 0x1c) = iVar1;
  *(int *)((int)this + 0x84c) = iVar1;
  FUN_10084770(this,(int)this + 4,param_2);
  return;
}


//==== 10084f60 in 10084f60 FUN_10084f60

void __thiscall FUN_10084f60(void *this,undefined4 *param_1,undefined4 param_2)

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
  puStack_c = &LAB_100ab63c;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  local_22c = 0;
  local_228 = 0;
  local_220 = this;
  if ((((ushort)param_2 < 0x20) || (*(int *)this == 0)) || ((ushort)param_2 == 0)) {
    *param_1 = 0;
    param_1[1] = 0;
    goto LAB_100851a1;
  }
  if (*(int *)((int)this + 0x850) == 0) {
    if ((ushort)((ushort)param_2 + 0x1f1b) < 0x1a) {
      sVar2 = 0x1f7c;
    }
    else {
      if (0x19 < (ushort)((ushort)param_2 + 0x2000)) goto LAB_10084ff0;
      sVar2 = 0x2041;
    }
    param_2 = CONCAT22(param_2._2_2_,(ushort)param_2 + sVar2);
LAB_10084ff0:
    iVar3 = FUN_10084610(this,(ushort)param_2);
    if (iVar3 == 0) {
      CHncStringW::CHncStringW((CHncStringW *)&local_224);
      local_8 = 0;
      HncLoadStringW((HINSTANCE__ *)0x0,"IDS_EQ_LOG_FONTNAME",(CHncStringW *)&local_224);
      wcscpy_s(local_21c,0x104,(wchar_t *)((int)this + 0x28));
      FUN_10084770(this,(int)this + 4,local_224);
      local_8 = 0xffffffff;
      CHncStringW::~CHncStringW((CHncStringW *)&local_224);
    }
    puVar6 = auStackY_664;
    for (iVar5 = 0x108; puVar1 = local_220, this = (void *)((int)this + 4), iVar5 != 0;
        iVar5 = iVar5 + -1) {
      *puVar6 = *(undefined4 *)this;
      puVar6 = puVar6 + 1;
    }
    pCVar4 = (CHncFont *)FUN_10084820((int)local_220);
    pCVar4 = CHncDrawContext::SelectObject((CHncDrawContext *)*puVar1,pCVar4);
    local_230 = 0;
    uStackY_260 = 0x1008516a;
    CHncDrawContext::GetTextExtentExPointW
              ((CHncDrawContext *)*local_220,(ushort *)&param_2,1,0,(int *)0x0,&local_230,
               (tagSIZE *)&local_22c);
    puVar6 = local_220;
    CHncDrawContext::SelectObject((CHncDrawContext *)*local_220,pCVar4);
    if (iVar3 == 0) {
      FUN_10084770(puVar6,(int)(puVar6 + 1),local_21c);
    }
  }
  else {
    if (0x19 < (ushort)((ushort)param_2 + 0x2000)) goto LAB_10084ff0;
    *(undefined2 *)((int)this + 0xe) = 1;
    puVar6 = auStackY_664;
    for (iVar3 = 0x108; puVar1 = local_220, this = (void *)((int)this + 4), iVar3 != 0;
        iVar3 = iVar3 + -1) {
      *puVar6 = *(undefined4 *)this;
      puVar6 = puVar6 + 1;
    }
    pCVar4 = (CHncFont *)FUN_10084820((int)local_220);
    pCVar4 = CHncDrawContext::SelectObject((CHncDrawContext *)*puVar1,pCVar4);
    CHncDrawContext::GetTextExtentPointW
              ((CHncDrawContext *)*local_220,(ushort *)&param_2,1,(tagSIZE *)&local_22c);
    puVar6 = local_220;
    CHncDrawContext::SelectObject((CHncDrawContext *)*local_220,pCVar4);
    *(undefined2 *)((int)puVar6 + 0xe) = 0;
  }
  *param_1 = local_22c;
  param_1[1] = local_228;
LAB_100851a1:
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


//==== 10091e50 in 10091e50 FUN_10091e50

void __thiscall FUN_10091e50(void *this,int *param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int unaff_ESI;
  int unaff_EDI;
  int iVar4;
  undefined4 in_stack_ffffffd0;
  undefined4 in_stack_ffffffd4;
  undefined1 local_10 [12];
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar3 = *(int *)((int)this + 0x58);
    param_1[1] = *(int *)((int)this + 0x5c);
    *param_1 = iVar3;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  *(undefined4 *)(*(int *)((int)this + 0x78) + 8) = *(undefined4 *)((int)this + 8);
  (**(code **)(**(int **)((int)this + 0x78) + 8))(local_10,param_2);
  FUN_100a16a0(*(void **)((int)this + 0x88),in_stack_ffffffd0,in_stack_ffffffd4,unaff_ESI,
               *(int *)((int)this + 8));
  FUN_100a16a0(*(void **)((int)this + 0x8c),in_stack_ffffffd0,in_stack_ffffffd4,unaff_ESI,
               *(int *)((int)this + 8));
  iVar3 = *(int *)((int)this + 0x88);
  iVar4 = *(int *)(iVar3 + 4);
  if ((iVar4 == 0x13) || ((iVar4 == 4 || (iVar4 == 0xc)))) {
    iVar1 = (int)(*(int *)(iVar3 + 0x10) + (*(int *)(iVar3 + 0x10) >> 0x1f & 3U)) >> 2;
    iVar4 = *(int *)(iVar3 + 0x44);
    if (*(int *)(iVar3 + 0x44) <= iVar1) {
      iVar4 = iVar1;
    }
  }
  else {
    iVar4 = *(int *)(iVar3 + 0x44);
  }
  iVar3 = *(int *)((int)this + 0x8c);
  iVar1 = *(int *)(iVar3 + 4);
  if (((iVar1 == 0x13) || (iVar1 == 4)) || (iVar1 == 0xc)) {
    iVar2 = (int)(*(int *)(iVar3 + 0x10) + (*(int *)(iVar3 + 0x10) >> 0x1f & 3U)) >> 2;
    iVar1 = *(int *)(iVar3 + 0x44);
    if (*(int *)(iVar3 + 0x44) <= iVar2) {
      iVar1 = iVar2;
    }
  }
  else {
    iVar1 = *(int *)(iVar3 + 0x44);
  }
  iVar3 = iVar4 + iVar1 + unaff_EDI;
  *(undefined4 *)((int)this + 0x54) = *(undefined4 *)(*(int *)((int)this + 0x78) + 0x54);
  *(int *)((int)this + 0x58) = iVar3;
  *(int *)((int)this + 0x5c) = unaff_ESI;
  param_1[1] = unaff_ESI;
  *param_1 = iVar3;
  return;
}


