// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 112989-113133
//==== 10084930 FUN_10084930

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


