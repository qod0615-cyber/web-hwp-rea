// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 117856-118009
//==== 1008aa20 FUN_1008aa20

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


