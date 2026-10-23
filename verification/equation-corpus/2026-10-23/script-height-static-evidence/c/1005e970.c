// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 80700-81014
//==== 1005e970 FUN_1005e970

undefined4 __thiscall
FUN_1005e970(void *this,undefined4 param_1,uint param_2,undefined4 param_3,int *param_4)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;
  int *extraout_ECX;
  int *extraout_ECX_00;
  int *extraout_ECX_01;
  int *extraout_ECX_02;
  int *extraout_ECX_03;
  int *extraout_ECX_04;
  int *extraout_ECX_05;
  int *extraout_ECX_06;
  int *extraout_ECX_07;
  int *extraout_ECX_08;
  int *extraout_ECX_09;
  int *extraout_ECX_10;
  int *extraout_ECX_11;
  int *extraout_ECX_12;
  int *extraout_ECX_13;
  int *extraout_ECX_14;
  int *extraout_ECX_15;
  int *piVar5;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  uVar2 = param_2;
  local_8 = 0xffffffff;
  puStack_c = &LAB_100aa919;
  local_10 = ExceptionList;
  uVar3 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  iVar1 = *(int *)((int)this + 4);
  *param_4 = 0;
  if (iVar1 != -0xc) {
    *(int *)(iVar1 + 0x28) = *(int *)(iVar1 + 0x28) + 1;
  }
  if (param_2 < 0x8789) {
    if (param_2 != 0x8788) {
      switch(param_2) {
      case 0x8780:
      case 0x8782:
      case 0x8783:
        goto switchD_1005e9c7_caseD_8780;
      case 0x8781:
        break;
      default:
        goto switchD_1005e9c7_default;
      }
    }
switchD_1005e9c7_caseD_8781:
    uVar3 = (**(code **)(**(int **)((int)this + 0xc) + 0x10))();
    if (((uVar3 & 0x800) != 0) ||
       ((((uVar3 = (**(code **)(**(int **)((int)this + 0xc) + 0x10))(), (uVar3 & 0x2000) != 0 ||
          (uVar3 = (**(code **)(**(int **)((int)this + 0xc) + 0x10))(), (uVar3 & 0x20) != 0)) ||
         (uVar3 = (**(code **)(**(int **)((int)this + 0xc) + 0x2c))(), (uVar3 & 0x10) != 0)) ||
        ((uVar3 = (**(code **)(**(int **)((int)this + 0xc) + 0x2c))(), (uVar3 & 8) != 0 ||
         (*param_4 != 0)))))) goto switchD_1005ed0f_caseD_8382;
  }
  else if ((0x87ef < param_2) && ((param_2 < 0x87f2 || (param_2 == 0x8922)))) {
switchD_1005e9c7_caseD_8780:
    uVar3 = (**(code **)(**(int **)((int)this + 0xc) + 0x2c))(uVar3);
    if (((uVar3 & 0x20) != 0) || (*param_4 != 0)) goto switchD_1005ed0f_caseD_8382;
    goto switchD_1005e9c7_caseD_8781;
  }
switchD_1005e9c7_default:
  uVar3 = (**(code **)(**(int **)((int)this + 0xc) + 0x10))();
  piVar5 = extraout_ECX;
  if ((uVar3 & 0x800) == 0) {
    *param_4 = 1;
    if (0x8780 < uVar2) {
      if (uVar2 < 0x8793) {
        if (uVar2 == 0x8792) {
          FUN_10058800(this,param_4,1);
          piVar5 = extraout_ECX_12;
        }
        else {
          switch(uVar2) {
          case 0x8781:
            HimControl(0,0x1408,0x1d2000,0);
            piVar5 = extraout_ECX_10;
            break;
          case 0x8782:
            (**(code **)(**(int **)((int)this + 0xc) + 0x30))(0);
LAB_1005ec04:
            (**(code **)(**(int **)((int)this + 0xc) + 0x28))(0x300,0,0);
            piVar5 = extraout_ECX_07;
            break;
          case 0x8783:
            FUN_10058800(this,param_4,0);
            piVar5 = extraout_ECX_09;
            break;
          default:
            goto switchD_1005eab6_caseD_8482;
          case 0x8788:
            (**(code **)(**(int **)((int)this + 0xc) + 0x3c))();
            piVar5 = extraout_ECX_11;
          }
        }
      }
      else if (uVar2 == 0x87f0) {
        (**(code **)(**(int **)((int)this + 0xc) + 0x38))();
        piVar5 = extraout_ECX_15;
      }
      else if (uVar2 == 0x87f1) {
        (**(code **)(**(int **)((int)this + 0xc) + 0x40))();
        piVar5 = extraout_ECX_14;
      }
      else {
        if (uVar2 != 0x8922) goto switchD_1005eab6_caseD_8482;
        FUN_1005f0b0((int)this);
        piVar5 = extraout_ECX_13;
      }
      goto LAB_1005ecdb;
    }
    if (uVar2 == 0x8780) {
      HimControl(0,0x1408,0x70100,0);
      piVar5 = extraout_ECX_08;
      goto LAB_1005ecdb;
    }
    if (uVar2 < 0x84a1) {
      if (uVar2 == 0x84a0) {
        FUN_1005d4a0(this);
        piVar5 = extraout_ECX_05;
      }
      else {
        switch(uVar2) {
        case 0x8480:
          FUN_1005f5d0(this);
          piVar5 = extraout_ECX_03;
          break;
        case 0x8481:
          FUN_1005f6b0((int)this);
          piVar5 = extraout_ECX_04;
          break;
        default:
          goto switchD_1005eab6_caseD_8482;
        case 0x8490:
          uVar3 = (**(code **)(**(int **)((int)this + 0xc) + 0x10))();
          piVar5 = extraout_ECX_00;
          if ((uVar3 & 0x20) == 0) {
            FUN_1005d410(this);
            piVar5 = extraout_ECX_01;
          }
          break;
        case 0x8492:
          FUN_1005aae0(this,param_4,0,1);
          piVar5 = extraout_ECX_02;
        }
      }
      goto LAB_1005ecdb;
    }
    if (uVar2 == 0x84e4) goto switchD_1005ed0f_caseD_8382;
    if (uVar2 == 0x84e7) {
      *(uint *)((int)this + 0x60) = (uint)(*(int *)((int)this + 0x60) == 0);
      goto switchD_1005ed0f_caseD_8382;
    }
    if (uVar2 == 0x8644) {
      uVar3 = *(uint *)((int)*(void **)((int)this + 8) + 0x30) & 0xf;
      if (((uVar3 == 1) || (uVar3 == 2)) &&
         (iVar4 = FUN_100748c0(*(void **)((int)this + 8),0,1), iVar4 != 0)) {
        *(ushort *)((int)this + 0x94) = *(ushort *)((int)this + 0x94) | 0x400;
        FUN_100578c0(this);
        *(undefined4 *)(*(int *)((int)this + 4) + 0x3c) = 1;
        HimControl(0,0x1408,0x1a0020,0);
      }
      else {
        CHncStringW::CHncStringW((CHncStringW *)&param_2);
        local_8 = 0;
        FUN_1005b130(this,(CHncStringW *)&param_2);
        local_8 = 0xffffffff;
        if (*(uint *)((int)this + 0xb0) <= *(uint *)(param_2 - 8)) {
          CHncStringW::~CHncStringW((CHncStringW *)&param_2);
          piVar5 = extraout_ECX_06;
          goto LAB_1005ecdb;
        }
        CHncStringW::~CHncStringW((CHncStringW *)&param_2);
      }
      FUN_10075790(*(int *)((int)this + 8));
      piVar5 = *(int **)(*(int *)((int)this + 4) + 8);
      iVar4 = (**(code **)(*piVar5 + 0x30))(piVar5);
      if (iVar4 != 0) {
        FUN_1005f5d0(this);
        piVar5 = *(int **)(*(int *)((int)this + 4) + 8);
        (**(code **)(*piVar5 + 0x2c))(piVar5,0);
        piVar5 = *(int **)(*(int *)((int)this + 4) + 8);
        (**(code **)(*piVar5 + 0x5c))(piVar5,0);
      }
      goto LAB_1005ec04;
    }
switchD_1005eab6_caseD_8482:
    *param_4 = 0;
    piVar5 = param_4;
  }
  else {
LAB_1005ecdb:
    if (*param_4 != 0) goto switchD_1005ed0f_caseD_8382;
  }
  if (uVar2 < 0x8492) {
    if (uVar2 == 0x8491) {
      FUN_1005d230(this);
    }
    else {
      switch(uVar2) {
      case 0x8380:
        FUN_100571a0(this,0,0x8380);
        break;
      case 0x8381:
        FUN_100571a0(this,0,0x8381);
        break;
      case 0x8386:
        FUN_100571a0(this,0,0x8386);
        break;
      case 0x8387:
        FUN_100571a0(this,0,0x8387);
        break;
      case 0x8389:
        FUN_100571a0(this,0,0x8389);
        break;
      case 0x838c:
        FUN_100571a0(this,0,0x838c);
        break;
      case 0x838d:
        FUN_100571a0(this,0,0x838d);
        break;
      case 0x838e:
        FUN_100571a0(this,0,0x838e);
        break;
      case 0x838f:
        FUN_100571a0(this,0,0x838f);
        break;
      case 0x8397:
        FUN_100571a0(this,0,0x8397);
        break;
      case 0x8398:
        FUN_100571a0(this,0,0x8398);
        break;
      case 0x83b0:
        FUN_100571a0(this,1,0x8380);
        break;
      case 0x83b1:
        FUN_100571a0(this,1,0x8381);
        break;
      case 0x83b6:
        FUN_100571a0(this,1,0x8386);
        break;
      case 0x83b7:
        FUN_100571a0(this,1,0x8387);
        break;
      case 0x83b9:
        FUN_100571a0(this,1,0x8389);
        break;
      case 0x83bc:
        FUN_100571a0(this,1,0x838c);
        break;
      case 0x83bd:
        FUN_100571a0(this,1,0x838d);
        break;
      case 0x83c7:
        FUN_100571a0(this,1,0x8397);
        break;
      case 0x83c8:
        FUN_100571a0(this,1,0x8398);
        break;
      case 0x83e0:
        FUN_100571a0(this,0,0x83e0);
        break;
      case 0x83e1:
        FUN_100571a0(this,0,0x83e1);
        break;
      case 0x83e2:
        FUN_100571a0(this,0,0x83e2);
        break;
      case 0x83e3:
        FUN_100571a0(this,0,0x83e3);
        break;
      case 0x83f0:
        FUN_100571a0(this,1,0x83e0);
        break;
      case 0x83f1:
        FUN_100571a0(this,1,0x83e1);
        break;
      case 0x83f2:
        FUN_100571a0(this,1,0x83e2);
        break;
      case 0x83f3:
        FUN_100571a0(this,1,0x83e3);
      }
    }
  }
  else if (uVar2 == 0x84b0) {
    FUN_1005cff0(this,0,0xffffffff,piVar5,0);
  }
switchD_1005ed0f_caseD_8382:
  *param_4 = 1;
  if (iVar1 != -0xc) {
    if (*(int *)(iVar1 + 0x28) < 1) {
      *(int *)(iVar1 + 0x24) = *(int *)(iVar1 + 0x24) + -1;
    }
    else {
      *(int *)(iVar1 + 0x28) = *(int *)(iVar1 + 0x28) + -1;
    }
  }
  ExceptionList = local_10;
  return 1;
}


