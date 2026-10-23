//==== 10064ca0 in 10064ca0 FUN_10064ca0

void __thiscall FUN_10064ca0(void *this,undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  int iVar1;
  int iVar2;
  int iVar3;
  code *pcVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 local_c;
  
  iVar1 = CHncDrawContext::GetMapMode(*(CHncDrawContext **)((int)this + 4));
  *(int *)((int)this + 0x1c) = iVar1;
  CHncDrawContext::GetWindowExt
            (*(CHncDrawContext **)((int)this + 4),(int *)((int)this + 0x20),
             (int *)((int)this + 0x24));
  CHncDrawContext::GetViewportExt
            (*(CHncDrawContext **)((int)this + 4),(int *)((int)this + 0x28),
             (int *)((int)this + 0x2c));
  CHncDrawContext::GetWindowOrg
            (*(CHncDrawContext **)((int)this + 4),(int *)((int)this + 0x30),
             (int *)((int)this + 0x34));
  CHncDrawContext::GetViewportOrg
            (*(CHncDrawContext **)((int)this + 4),(int *)((int)this + 0x38),
             (int *)((int)this + 0x3c));
  pcVar4 = HncIntMulDiv_exref;
  uVar5 = 100;
  if (*(int *)((int)this + 0x1c) == 1) {
    local_c = HncIntMulDiv(0x60,param_1,100);
    iVar1 = HncIntMulDiv(0x60,param_1,100);
  }
  else {
    uVar6 = param_1;
    iVar1 = CHncDrawContext::DxGetDeviceCaps(*(CHncDrawContext **)((int)this + 4),0x58);
    local_c = HncIntMulDiv(iVar1,uVar6,uVar5);
    uVar6 = 100;
    uVar5 = param_1;
    iVar1 = CHncDrawContext::DxGetDeviceCaps(*(CHncDrawContext **)((int)this + 4),0x5a);
    pcVar4 = HncIntMulDiv_exref;
    iVar1 = HncIntMulDiv(iVar1,uVar5,uVar6);
  }
  iVar2 = (*pcVar4)(param_2,param_1,100);
  iVar3 = HncIntMulDiv(param_3,param_1,100);
  CHncDrawContext::SetMapMode(*(CHncDrawContext **)((int)this + 4),8);
  CHncDrawContext::SetWindowExt(*(CHncDrawContext **)((int)this + 4),0x1c20,0x1c20);
  CHncDrawContext::SetWindowOrg(*(CHncDrawContext **)((int)this + 4),0,0);
  CHncDrawContext::SetViewportOrg
            (*(CHncDrawContext **)((int)this + 4),*(int *)((int)this + 0x38) + iVar2,
             *(int *)((int)this + 0x3c) + iVar3);
  CHncDrawContext::SetViewportExt(*(CHncDrawContext **)((int)this + 4),local_c,iVar1);
  CHncDrawContext::SetLogicalDpi(*(CHncDrawContext **)((int)this + 4),0x1c20,0x1c20);
  CHncDrawContext::SetTextAlign(*(CHncDrawContext **)((int)this + 4),0x18);
  CHncDrawContext::SetBkMode(*(CHncDrawContext **)((int)this + 4),1);
  return;
}


