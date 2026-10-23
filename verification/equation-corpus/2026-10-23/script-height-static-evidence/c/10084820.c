// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 112918-112989
//==== 10084820 FUN_10084820

void __fastcall FUN_10084820(int param_1)

{
  uint uVar1;
  CHncFont *pCVar2;
  int iVar3;
  int *piVar4;
  undefined4 *puVar5;
  tagHNCLOGFONT *ptVar6;
  uint uVar7;
  bool bVar8;
  tagHNCLOGFONT local_434 [1056];
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ab582;
  local_10 = ExceptionList;
  uVar1 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  local_14 = uVar1;
  ExceptionList = &local_10;
  pCVar2 = *(CHncFont **)(param_1 + 0x844);
  ptVar6 = local_434;
  puVar5 = (undefined4 *)register0x00000010;
  for (iVar3 = 0x108; puVar5 = puVar5 + 1, iVar3 != 0; iVar3 = iVar3 + -1) {
    *(undefined4 *)ptVar6 = *puVar5;
    ptVar6 = ptVar6 + 4;
  }
  if (pCVar2 == (CHncFont *)0x0) {
LAB_100848c1:
    pCVar2 = (CHncFont *)FUN_100a2ee8(4);
    local_8 = 0;
    pCVar2 = (CHncFont *)CHncFont::CHncFont(pCVar2);
    local_8 = 0xffffffff;
    if (pCVar2 == (CHncFont *)0x0) {
      HncSetError(2,uVar1);
    }
    else {
      CHncFont::CreateFontW(pCVar2,local_434);
      *(CHncFont **)(param_1 + 0x844) = pCVar2;
    }
  }
  else {
    piVar4 = (int *)(param_1 + 0x424);
    uVar7 = 0x41c;
    ptVar6 = local_434;
    do {
      if (*piVar4 != *(int *)ptVar6) {
        if (pCVar2 != (CHncFont *)0x0) {
          CHncFont::~CHncFont(pCVar2);
          FUN_100a2b94(pCVar2);
          *(undefined4 *)(param_1 + 0x844) = 0;
        }
        goto LAB_100848c1;
      }
      piVar4 = piVar4 + 1;
      ptVar6 = ptVar6 + 4;
      bVar8 = 3 < uVar7;
      uVar7 = uVar7 - 4;
    } while (bVar8);
  }
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


