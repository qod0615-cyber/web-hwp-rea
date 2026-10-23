// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 116163-116219
//==== 100883f0 FUN_100883f0

void __fastcall FUN_100883f0(int param_1)

{
  int iVar1;
  uint uVar2;
  undefined1 auStack_48 [8];
  uint local_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined4 local_30;
  undefined4 uStack_2c;
  uint local_14;
  
  local_14 = DAT_100d100c ^ (uint)auStack_48;
  iVar1 = *(int *)(param_1 + 0x60);
  if (iVar1 == 0) {
    *(undefined4 *)(param_1 + 0x40) = 0;
    *(undefined4 *)(param_1 + 0x3c) = 0;
    *(undefined4 *)(param_1 + 8) = 1000;
    FUN_10005ad0((void *)(param_1 + 0xc),L"HancomEQN",9);
  }
  else {
    *(undefined4 *)(param_1 + 0x3c) = *(undefined4 *)(iVar1 + 0x3c);
    *(undefined4 *)(param_1 + 8) = *(undefined4 *)(iVar1 + 8);
    FUN_10043d00(&local_40,(undefined4 *)(iVar1 + 0xc));
    if ((uint *)(param_1 + 0xc) != &local_40) {
      FUN_10005c10((int *)(param_1 + 0xc));
      uVar2 = local_40;
      local_40 = local_40 & 0xffff0000;
      *(uint *)(param_1 + 0xc) = uVar2;
      *(undefined4 *)(param_1 + 0x10) = uStack_3c;
      *(undefined4 *)(param_1 + 0x14) = uStack_38;
      *(undefined4 *)(param_1 + 0x18) = uStack_34;
      *(ulonglong *)(param_1 + 0x1c) = CONCAT44(uStack_2c,local_30);
      local_30 = 0;
      uStack_2c = 7;
    }
    FUN_10005c10((int *)&local_40);
    if ((*(int *)(param_1 + 4) != 0x1f) && (*(int *)(param_1 + 4) != 0x20)) {
      *(undefined4 *)(param_1 + 0x40) = *(undefined4 *)(iVar1 + 0x40);
    }
    if (*(int *)(iVar1 + 0x60) != 0) {
      *(int *)(param_1 + 0x50) = *(int *)(iVar1 + 0x50) + *(int *)(iVar1 + 0x58);
      __security_check_cookie(local_14 ^ (uint)auStack_48);
      return;
    }
  }
  *(undefined4 *)(param_1 + 0x50) = 0;
  __security_check_cookie(local_14 ^ (uint)auStack_48);
  return;
}


