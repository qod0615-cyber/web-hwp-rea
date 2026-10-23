// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 3414-3438
//==== 10005610 FUN_10005610

undefined4 * FUN_10005610(undefined4 param_1,undefined4 *param_2,int param_3)

{
  undefined4 uVar1;
  
  *param_2 = 0;
  param_2[1] = 0;
  if (param_3 != 0) {
    if ((*(int *)(param_3 + 0x74) != 0) && (*(int *)(param_3 + 0x78) != 0)) {
      uVar1 = *(undefined4 *)(param_3 + 0x74);
      param_2[1] = *(undefined4 *)(param_3 + 0x78);
      *param_2 = uVar1;
      return param_2;
    }
    uVar1 = *(undefined4 *)(*(int *)(param_3 + 0x10) + 0x848);
    *param_2 = uVar1;
    param_2[1] = uVar1;
  }
  return param_2;
}


