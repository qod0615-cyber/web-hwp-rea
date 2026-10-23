// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 113432-113493
//==== 100852e0 FUN_100852e0

undefined4 * __fastcall FUN_100852e0(undefined4 *param_1)

{
  undefined4 *puVar1;
  void *this;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100ab6b9;
  local_10 = ExceptionList;
  ExceptionList = &local_10;
  CHncDrawContext::CHncDrawContext((CHncDrawContext *)(param_1 + 6));
  param_1[0x1b] = 0;
  param_1[0x1c] = 7;
  *(undefined2 *)(param_1 + 0x17) = 0;
  local_8._0_1_ = 1;
  local_8._1_3_ = 0;
  param_1[5] = 0;
  param_1[4] = 0;
  param_1[0xc] = 0;
  param_1[0xd] = 0;
  *param_1 = 0;
  param_1[1] = 0;
  param_1[0x11] = 0;
  param_1[0x13] = 0;
  param_1[0x14] = 0;
  *(undefined8 *)(param_1 + 0x1d) = 0;
  puVar1 = (undefined4 *)FUN_100a2ee8(0x884);
  puVar1[0x21a] = 0;
  puVar1[0x21b] = 7;
  *(undefined2 *)(puVar1 + 0x216) = 0;
  local_8._0_1_ = 3;
  *puVar1 = 0;
  FUN_100846d0(puVar1,puVar1 + 1);
  puVar1[0x214] = 1;
  puVar1[0x215] = 1;
  puVar1[0x212] = 0;
  puVar1[0x213] = 0;
  FUN_10005ad0(puVar1 + 0x216,L"HancomEQN",9);
  puVar1[0x220] = 0;
  memset(puVar1 + 0x109,0,0x420);
  puVar1[0x211] = 0;
  local_8._0_1_ = 1;
  param_1[4] = puVar1;
  this = (void *)FUN_100a2ee8(0xa8);
  local_8._0_1_ = 4;
  puVar1 = FUN_100886b0(this,0,param_1[4]);
  local_8 = CONCAT31(local_8._1_3_,1);
  param_1[0xc] = puVar1;
  param_1[0xd] = puVar1[0x23];
  param_1[0x16] = 1000;
  FUN_10005ad0(param_1 + 0x17,L"HancomEQN",9);
  ExceptionList = local_10;
  return param_1;
}


