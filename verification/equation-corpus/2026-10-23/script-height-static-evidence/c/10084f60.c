// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 113259-113361
//==== 10084f60 FUN_10084f60

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


