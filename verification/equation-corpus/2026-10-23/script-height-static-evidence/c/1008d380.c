// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 119842-119909
//==== 1008d380 FUN_1008d380

void __thiscall FUN_1008d380(void *this,int *param_1,int param_2)

{
  void *pvVar1;
  undefined4 uVar2;
  int iVar3;
  wchar_t *pwVar4;
  void *pvVar5;
  int iVar6;
  void *unaff_EBX;
  int iStack_24;
  void *local_20;
  int local_1c;
  undefined1 auStack_10 [12];
  
  if ((param_2 != 0) && (*(int *)((int)this + 0x44) == 0)) {
    iVar6 = *(int *)((int)this + 0x5c);
    *param_1 = *(int *)((int)this + 0x58);
    param_1[1] = iVar6;
    return;
  }
  *(undefined4 *)((int)this + 0x44) = 0;
  FUN_100883f0((int)this);
  pvVar1 = *(void **)((int)this + 0x74);
  pwVar4 = (wchar_t *)((int)pvVar1 + 0x858);
  local_1c = *(int *)((int)this + 8);
  if (7 < *(uint *)((int)pvVar1 + 0x86c)) {
    pwVar4 = *(wchar_t **)pwVar4;
  }
  local_20 = pvVar1;
  FUN_10084560(pvVar1,local_1c,pwVar4);
  uVar2 = *(undefined4 *)((int)pvVar1 + 0x84c);
  iVar3 = MulDiv(*(int *)((int)local_20 + 0x848),0x1e,100);
  iVar6 = local_1c;
  *(int *)((int)this + 0x88) = iVar3;
  *(undefined4 *)((int)this + 0x84) = uVar2;
  *(int *)(*(int *)((int)this + 0x78) + 8) = local_1c;
  (**(code **)(**(int **)((int)this + 0x78) + 8))(auStack_10,param_2);
  *(int *)(*(int *)((int)this + 0x7c) + 8) = iVar6;
  (**(code **)(**(int **)((int)this + 0x7c) + 8))(&local_20,param_2);
  pvVar1 = *(void **)((int)this + 0x74);
  pwVar4 = (wchar_t *)((int)pvVar1 + 0x858);
  if (7 < *(uint *)((int)pvVar1 + 0x86c)) {
    pwVar4 = *(wchar_t **)pwVar4;
  }
  FUN_10084560(pvVar1,*(int *)((int)this + 8),pwVar4);
  pvVar1 = *(void **)((int)this + 0x84);
  pvVar5 = local_20;
  if ((int)local_20 < (int)pvVar1) {
    pvVar5 = pvVar1;
  }
  if (((int)unaff_EBX < (int)pvVar5) && (unaff_EBX = local_20, (int)local_20 < (int)pvVar1)) {
    unaff_EBX = pvVar1;
  }
  iVar6 = MulDiv(*(int *)(*(int *)((int)this + 0x74) + 0x848),0x32,100);
  *(int *)((int)this + 0x58) = (int)unaff_EBX + iVar6;
  local_1c = *(int *)((int)this + 0x88) + iStack_24 + local_1c;
  *(int *)((int)this + 0x5c) = local_1c;
  *(int *)((int)this + 0x54) = -(*(int *)((int)this + 0x88) / 2) - iStack_24;
  *param_1 = (int)unaff_EBX + iVar6;
  param_1[1] = local_1c;
  return;
}


