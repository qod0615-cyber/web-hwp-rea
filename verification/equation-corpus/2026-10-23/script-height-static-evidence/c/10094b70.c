// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 125703-125771
//==== 10094b70 FUN_10094b70

void __thiscall FUN_10094b70(void *this,undefined4 param_1,int param_2)

{
  void *this_00;
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  wchar_t *pwVar6;
  int *piVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  
  this_00 = *(void **)((int)this + 0x74);
  pwVar6 = (wchar_t *)((int)this_00 + 0x858);
  if (7 < *(uint *)((int)this_00 + 0x86c)) {
    pwVar6 = *(wchar_t **)((int)this_00 + 0x858);
  }
  FUN_10084560(this_00,*(int *)((int)this + 8),pwVar6);
  iVar1 = MulDiv(*(int *)((int)this + 8),0x14,100);
  iVar2 = MulDiv(*(int *)((int)this + 8),0xf,100);
  iVar3 = *(int *)(*(int *)((int)this + 0x68) + 0x80) + *(int *)((int)this + 0x50) +
          **(int **)((int)this + 0x84);
  iVar9 = *(int *)(*(int *)((int)this + 0x68) + 0x7c) + *(int *)((int)this + 0x54);
  iVar4 = MulDiv(*(int *)((int)this + 8),2,100);
  iVar5 = MulDiv(*(int *)((int)this + 8),6,100);
  if (-1 < param_2) {
    piVar7 = *(int **)((int)this + 0x80);
    iVar8 = param_2 + 1;
    do {
      iVar10 = *piVar7;
      piVar7 = piVar7 + 1;
      iVar9 = iVar9 + iVar10 + iVar2;
      iVar8 = iVar8 + -1;
    } while (iVar8 != 0);
  }
  iVar8 = ((*(int *)((int)this + 0x58) - **(int **)((int)this + 0x84)) - iVar1) + iVar4;
  if ((*(int *)((int)this + 4) == 0x74) && (2 < *(int *)((int)this + 0x7c))) {
    iVar10 = iVar8 - (*(int **)((int)this + 0x84))[*(int *)((int)this + 0x7c) + -1];
    iVar8 = iVar10 - iVar1;
    if (0 < param_2) {
      FUN_10084930(this_00,iVar3 + iVar10,
                   (iVar9 - *(int *)(*(int *)((int)this + 0x80) + param_2 * 4)) - iVar2,0x22ef);
    }
  }
  if ((param_2 != *(int *)((int)this + 0x78) + -1) || (param_2 < 1)) {
    FUN_100844d0(this_00,iVar2 / 2 + *(int *)(*(int *)((int)this + 0x80) + param_2 * 4),
                 *(undefined4 *)((int)this_00 + 0x84c));
    FUN_10084930(this_00,iVar3 - *(int *)((int)this + 0x88) / 2,
                 (iVar9 - *(int *)(*(int *)((int)this + 0x80) + param_2 * 4)) - iVar2,0xe101);
    iVar1 = MulDiv(*(int *)((int)this + 8),0x7d,100);
    FUN_100844d0(this_00,iVar1,iVar8);
    FUN_10084930(this_00,iVar3 - iVar4,((-*(int *)((int)this + 0x8c) - iVar2 / 2) - iVar5) + iVar9,
                 0xe06d);
    pwVar6 = (wchar_t *)((int)this_00 + 0x858);
    if (7 < *(uint *)((int)this_00 + 0x86c)) {
      pwVar6 = *(wchar_t **)pwVar6;
    }
    FUN_10084560(this_00,*(int *)((int)this + 8),pwVar6);
  }
  return;
}


