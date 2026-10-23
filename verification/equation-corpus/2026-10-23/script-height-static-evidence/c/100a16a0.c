// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 135824-135905
//==== 100a16a0 FUN_100a16a0

void __thiscall
FUN_100a16a0(void *this,undefined4 param_1,undefined4 param_2,int param_3,int param_4)

{
  void *this_00;
  short sVar1;
  wchar_t *pwVar2;
  tagSIZE *ptVar3;
  undefined4 *puVar4;
  tagSIZE local_c [8];
  
  this_00 = *(void **)this;
  pwVar2 = (wchar_t *)((int)this_00 + 0x858);
  *(undefined4 *)((int)this + 0xc) = 0;
  *(undefined4 *)((int)this + 8) = 0;
  *(int *)((int)this + 0x18) = param_4;
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar2 = *(wchar_t **)pwVar2;
  }
  FUN_10084560(this_00,param_4,pwVar2);
  if (param_3 == 0) {
    param_3 = *(int *)(*(int *)this + 0x848);
  }
  *(int *)((int)this + 0x10) = param_3;
  if (*(int *)((int)this + 4) == 0x13) {
    if (*(ushort *)((int)this + 0x26) != 0) {
      puVar4 = (undefined4 *)
               FUN_10084f60(*(void **)this,(undefined4 *)local_c,(uint)*(ushort *)((int)this + 0x26)
                           );
      *(undefined4 *)((int)this + 0x44) = *puVar4;
      *(undefined4 *)((int)this + 0x48) = puVar4[1];
    }
  }
  else {
    if (*(ushort *)((int)this + 0x20) != 0) {
      ptVar3 = FUN_100851d0(*(void **)this,local_c,*(ushort *)((int)this + 0x20));
      *(undefined4 *)((int)this + 0x2c) = *(undefined4 *)ptVar3;
      *(undefined4 *)((int)this + 0x30) = *(undefined4 *)(ptVar3 + 4);
    }
    if (*(ushort *)((int)this + 0x22) != 0) {
      ptVar3 = FUN_100851d0(*(void **)this,local_c,*(ushort *)((int)this + 0x22));
      *(undefined4 *)((int)this + 0x34) = *(undefined4 *)ptVar3;
      *(undefined4 *)((int)this + 0x38) = *(undefined4 *)(ptVar3 + 4);
    }
    if (*(ushort *)((int)this + 0x24) != 0) {
      ptVar3 = FUN_100851d0(*(void **)this,local_c,*(ushort *)((int)this + 0x24));
      *(undefined4 *)((int)this + 0x3c) = *(undefined4 *)ptVar3;
      *(undefined4 *)((int)this + 0x40) = *(undefined4 *)(ptVar3 + 4);
    }
    sVar1 = 0;
    if (*(ushort *)((int)this + 0x26) != 0) {
      ptVar3 = FUN_100851d0(*(void **)this,local_c,*(ushort *)((int)this + 0x26));
      *(undefined4 *)((int)this + 0x44) = *(undefined4 *)ptVar3;
      *(undefined4 *)((int)this + 0x48) = *(undefined4 *)(ptVar3 + 4);
      sVar1 = *(short *)((int)this + 0x26);
    }
    if ((sVar1 == 0x2329) || (sVar1 == 0x232a)) {
      *(int *)((int)this + 0x44) = (*(int *)((int)this + 0x44) * 2) / 3;
    }
  }
  switch(*(undefined4 *)((int)this + 4)) {
  case 1:
  case 2:
  case 9:
  case 10:
    *(int *)((int)this + 0x14) =
         *(int *)((int)this + 0x48) + *(int *)((int)this + 0x38) + *(int *)((int)this + 0x30);
    return;
  case 3:
  case 0xb:
    *(int *)((int)this + 0x14) = *(int *)((int)this + 0x38) + *(int *)((int)this + 0x30);
    return;
  default:
    *(undefined4 *)((int)this + 0x14) = *(undefined4 *)((int)this + 0x48);
    return;
  }
}


