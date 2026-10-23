//==== 10062060 in 10062060 GetTextExtentExPointW

/* public: int __thiscall CHncDrawContext::GetTextExtentExPointW(unsigned short const *,int,int,int
   *,int *,struct tagSIZE *) */

int __thiscall
CHncDrawContext::GetTextExtentExPointW
          (CHncDrawContext *this,ushort *param_1,int param_2,int param_3,int *param_4,int *param_5,
          tagSIZE *param_6)

{
  int iVar1;
  
                    /* 0x62060  392
                       ?GetTextExtentExPointW@CHncDrawContext@@QAEHPBGHHPAH1PAUtagSIZE@@@Z */
  iVar1 = FUN_1004df20(*(void **)(this + 0xc),(wchar_t *)param_1,param_2,param_3,param_4,param_5,
                       &param_6->cx);
  return iVar1;
}


//==== 10062040 in 10062040 GetTextExtentPointW

/* public: int __thiscall CHncDrawContext::GetTextExtentPointW(unsigned short const *,int,struct
   tagSIZE *) */

int __thiscall
CHncDrawContext::GetTextExtentPointW
          (CHncDrawContext *this,ushort *param_1,int param_2,tagSIZE *param_3)

{
  int iVar1;
  
                    /* 0x62040  396  ?GetTextExtentPointW@CHncDrawContext@@QAEHPBGHPAUtagSIZE@@@Z */
  iVar1 = FUN_1004df20(*(void **)(this + 0xc),(wchar_t *)param_1,param_2,0,(int *)0x0,(int *)0x0,
                       &param_3->cx);
  return iVar1;
}


//==== 1004df20 in 1004df20 FUN_1004df20

/* WARNING: Function: __alloca_probe replaced with injection: alloca_probe */
/* WARNING: Function: __alloca_probe_16 replaced with injection: alloca_probe */

void __thiscall
FUN_1004df20(void *this,wchar_t *param_1,uint param_2,int param_3,int *param_4,int *param_5,
            int *param_6)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  int iVar3;
  uint uVar4;
  undefined4 *puVar5;
  int iVar6;
  wchar_t *local_2c44;
  uint local_2c40;
  undefined4 local_2c3c;
  undefined1 *local_2c38;
  undefined4 local_2c34;
  undefined8 local_2c30;
  undefined4 *local_2c28;
  undefined8 local_2c24;
  wchar_t *local_2c1c;
  int *local_2c18;
  int *local_2c14;
  int *local_2c10;
  undefined1 local_2c0c [11268];
  uint local_8;
  
  local_8 = DAT_100dc00c ^ (uint)&stack0xfffffffc;
  local_2c18 = param_4;
  local_2c14 = param_5;
  local_2c1c = param_1;
  local_2c10 = param_6;
  if ((((param_1 == (wchar_t *)0x0) || (*param_1 == L'\0')) || ((int)param_2 < 1)) ||
     ((*(int **)((int)this + 0x60) == (int *)0x0 ||
      (iVar6 = **(int **)((int)this + 0x60), iVar6 == 0)))) goto LAB_1004e28f;
  local_2c38 = local_2c0c;
  local_2c3c = 0;
  local_2c30 = 0;
  local_2c24 = 0;
  local_2c40 = param_2;
  local_2c34 = 0x1000100;
  if ((*(int *)((int)this + 100) < 0) ||
     ((-1 < *(short *)(iVar6 + 10) ||
      (local_2c44 = FUN_10082280(param_1,param_2), local_2c44 == (wchar_t *)0x0)))) {
    local_2c44 = param_1;
  }
  uVar4 = param_2 * 4 + 0xc;
  uVar4 = -(uint)(param_2 * 4 + 4 < uVar4) & uVar4;
  if (uVar4 == 0) goto LAB_1004e28f;
  if (uVar4 < 0x401) {
    puVar1 = (undefined4 *)&stack0xffffd3ac;
    puVar5 = (undefined4 *)&stack0xffffd3ac;
    if (&stack0x00000000 != (undefined1 *)0x2c54) {
LAB_1004e03e:
      puVar5 = puVar1 + 2;
    }
  }
  else {
    puVar1 = malloc(uVar4);
    puVar5 = (undefined4 *)0x0;
    if (puVar1 != (undefined4 *)0x0) {
      *puVar1 = 0xdddd;
      goto LAB_1004e03e;
    }
  }
  local_2c28 = puVar5;
  if (uVar4 < 0x401) {
    puVar2 = (undefined4 *)&stack0xffffd3ac;
    puVar1 = (undefined4 *)&stack0xffffd3ac;
    if (&stack0x00000000 != (undefined1 *)0x2c54) {
LAB_1004e078:
      puVar1 = puVar2 + 2;
    }
  }
  else {
    puVar2 = malloc(uVar4);
    puVar1 = (undefined4 *)0x0;
    if (puVar2 != (undefined4 *)0x0) {
      *puVar2 = 0xdddd;
      goto LAB_1004e078;
    }
  }
  local_2c24 = CONCAT44(local_2c24._4_4_,puVar1);
  if ((puVar5 != (undefined4 *)0x0) && (puVar1 != (undefined4 *)0x0)) {
    iVar6 = 0;
    if ((*(byte *)((int)this + 0xa4) & 3) != 0) {
      iVar6 = FUN_10056d10(this);
    }
    FUN_10056520(this,(int *)&local_2c44);
    iVar3 = FUN_100568a0(this,(int *)&local_2c44);
    if (iVar3 != 0) {
      if ((iVar6 != 0) && ((*(byte *)((int)this + 0xa4) & 3) != 0)) {
        iVar6 = **(int **)((int)this + 0x60);
        FUN_1002c8c0(this,*(int *)((int)this + 0xa8));
        if ((*(int *)((int)this + 8) != 0) &&
           ((*(int *)((int)this + 0x24) == 7 || (*(int *)((int)this + 0x24) == 8)))) {
          *(undefined4 *)((int)this + 0x28) = *(undefined4 *)((int)this + 0xac);
          *(undefined4 *)((int)this + 0x2c) = *(undefined4 *)((int)this + 0xb0);
        }
        if (*(int *)((int)this + 8) != 0) {
          if ((*(int *)((int)this + 0x24) == 7) || (*(int *)((int)this + 0x24) == 8)) {
            *(undefined4 *)((int)this + 0x30) = *(undefined4 *)((int)this + 0xb4);
            *(undefined4 *)((int)this + 0x34) = *(undefined4 *)((int)this + 0xb8);
          }
          *(undefined4 *)((int)this + 0x38) = *(undefined4 *)((int)this + 0xbc);
          *(undefined4 *)((int)this + 0x3c) = *(undefined4 *)((int)this + 0xc0);
          *(undefined4 *)((int)this + 0x40) = *(undefined4 *)((int)this + 0xc4);
          *(undefined4 *)((int)this + 0x44) = *(undefined4 *)((int)this + 200);
          *(undefined4 *)((int)this + 0x48) = *(undefined4 *)((int)this + 0xcc);
          *(undefined4 *)((int)this + 0x4c) = *(undefined4 *)((int)this + 0xd0);
        }
        *(undefined1 *)(iVar6 + 0x16) = *(undefined1 *)((int)this + 0xf0);
        *(undefined4 *)(iVar6 + 0x10) = *(undefined4 *)((int)this + 0xd4);
        *(undefined1 *)(iVar6 + 0xaa) = *(undefined1 *)((int)this + 0xf4);
        *(undefined4 *)(iVar6 + 0xa4) = *(undefined4 *)((int)this + 0xd8);
        *(undefined1 *)(iVar6 + 0x13e) = *(undefined1 *)((int)this + 0xf8);
        *(undefined4 *)(iVar6 + 0x138) = *(undefined4 *)((int)this + 0xdc);
        *(undefined1 *)(iVar6 + 0x1d2) = *(undefined1 *)((int)this + 0xfc);
        *(undefined4 *)(iVar6 + 0x1cc) = *(undefined4 *)((int)this + 0xe0);
        *(undefined1 *)(iVar6 + 0x266) = *(undefined1 *)((int)this + 0x100);
        *(undefined4 *)(iVar6 + 0x260) = *(undefined4 *)((int)this + 0xe4);
        *(undefined1 *)(iVar6 + 0x2fa) = *(undefined1 *)((int)this + 0x104);
        *(undefined4 *)(iVar6 + 0x2f4) = *(undefined4 *)((int)this + 0xe8);
        *(undefined1 *)(iVar6 + 0x38e) = *(undefined1 *)((int)this + 0x108);
        *(undefined4 *)(iVar6 + 0x388) = *(undefined4 *)((int)this + 0xec);
      }
      FUN_1004e2b0(this,(int)&local_2c44,param_3,local_2c18,local_2c14,local_2c10);
    }
    if (local_2c44 != local_2c1c) {
      free(local_2c44);
    }
    if (local_2c38 != local_2c0c) {
      free(local_2c38);
    }
    FUN_10001370((int)local_2c28);
    FUN_10001370((int)local_2c24);
  }
LAB_1004e28f:
  __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
  return;
}


//==== 1004e2b0 in 1004e2b0 FUN_1004e2b0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall
FUN_1004e2b0(void *this,int param_1,int param_2,int *param_3,int *param_4,int *param_5)

{
  ushort uVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  uint uVar6;
  double dVar7;
  double dVar8;
  int local_18;
  
  iVar5 = **(int **)((int)this + 0x60);
  uVar1 = *(ushort *)(iVar5 + 10);
  if ((short)uVar1 < 0) {
    param_5[1] = 0;
    if (param_3 != (int *)0x0) {
      *param_3 = 0;
    }
    local_18 = *(int *)(param_1 + 4);
    if (0 < local_18) {
      iVar5 = *(int *)(param_1 + 0x20);
      piVar4 = param_4;
      do {
        iVar2 = param_5[1] + *(int *)((iVar5 - (int)param_4) + (int)piVar4);
        param_5[1] = iVar2;
        if ((param_3 != (int *)0x0) && (iVar2 <= param_2)) {
          *param_3 = *param_3 + 1;
        }
        if (param_4 != (int *)0x0) {
          *piVar4 = param_5[1];
        }
        piVar4 = piVar4 + 1;
        local_18 = local_18 + -1;
      } while (local_18 != 0);
    }
    *param_5 = 0;
    uVar6 = (uint)*(ushort *)(param_1 + 0x14);
    if (uVar6 != 0) {
      piVar4 = (int *)(*(int *)(param_1 + 0xc) + 0x18);
      iVar5 = 0;
      do {
        iVar2 = *piVar4;
        piVar4 = piVar4 + 0xb;
        if (iVar2 <= iVar5) {
          iVar2 = iVar5;
        }
        *param_5 = iVar2;
        uVar6 = uVar6 - 1;
        iVar5 = iVar2;
      } while (uVar6 != 0);
      return;
    }
  }
  else {
    *param_5 = 0;
    if ((uVar1 & 0x4000) != 0) {
      if (param_3 != (int *)0x0) {
        *param_3 = 0;
      }
      local_18 = *(int *)(param_1 + 4);
      if (0 < local_18) {
        iVar2 = *(int *)(param_1 + 0x20);
        piVar4 = param_4;
        do {
          iVar3 = *param_5 + *(int *)((int)piVar4 + (iVar2 - (int)param_4));
          *param_5 = iVar3;
          if ((param_3 != (int *)0x0) && (iVar3 <= param_2)) {
            *param_3 = *param_3 + 1;
            iVar3 = *param_5;
          }
          if (param_4 != (int *)0x0) {
            *piVar4 = iVar3;
          }
          piVar4 = piVar4 + 1;
          local_18 = local_18 + -1;
        } while (local_18 != 0);
      }
      uVar6 = (uint)*(ushort *)(param_1 + 0x14);
      param_5[1] = 0;
      local_18 = 0;
      if (uVar6 != 0) {
        piVar4 = (int *)(*(int *)(param_1 + 0xc) + 0x1c);
        iVar2 = 0;
        do {
          local_18 = *piVar4;
          piVar4 = piVar4 + 0xb;
          if (local_18 <= iVar2) {
            local_18 = iVar2;
          }
          param_5[1] = local_18;
          uVar6 = uVar6 - 1;
          iVar2 = local_18;
        } while (uVar6 != 0);
      }
      dVar7 = (double)(int)*(short *)(iVar5 + 0x41c) * _DAT_100c8b88;
      dVar8 = dVar7;
      libm_sse2_cos_precise();
      iVar5 = (int)((double)CONCAT44((uint)((ulonglong)dVar8 >> 0x20) & _UNK_100c8d44,
                                     SUB84(dVar8,0) & _DAT_100c8d40) * (double)*param_5);
      *param_5 = iVar5;
      libm_sse2_sin_precise();
      param_5[1] = (int)((double)CONCAT44((uint)((ulonglong)dVar7 >> 0x20) & _UNK_100c8d44,
                                          SUB84(dVar7,0) & _DAT_100c8d40) * (double)iVar5 +
                        (double)local_18);
      return;
    }
    if (param_3 != (int *)0x0) {
      *param_3 = 0;
    }
    local_18 = *(int *)(param_1 + 4);
    if (0 < local_18) {
      iVar5 = *(int *)(param_1 + 0x20);
      piVar4 = param_4;
      do {
        iVar2 = *param_5 + *(int *)((iVar5 - (int)param_4) + (int)piVar4);
        *param_5 = iVar2;
        if ((param_3 != (int *)0x0) && (iVar2 <= param_2)) {
          *param_3 = *param_3 + 1;
        }
        if (param_4 != (int *)0x0) {
          *piVar4 = *param_5;
        }
        piVar4 = piVar4 + 1;
        local_18 = local_18 + -1;
      } while (local_18 != 0);
    }
    param_5[1] = 0;
    uVar6 = (uint)*(ushort *)(param_1 + 0x14);
    if (uVar6 != 0) {
      piVar4 = (int *)(*(int *)(param_1 + 0xc) + 0x1c);
      iVar5 = 0;
      do {
        iVar2 = *piVar4;
        piVar4 = piVar4 + 0xb;
        if (iVar2 <= iVar5) {
          iVar2 = iVar5;
        }
        param_5[1] = iVar2;
        uVar6 = uVar6 - 1;
        iVar5 = iVar2;
      } while (uVar6 != 0);
    }
  }
  return;
}


//==== 1005b720 in 1005b720 FUN_1005b720

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_1005b720(void *this,uint param_1)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  uint local_18;
  undefined4 local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_8 = DAT_100dc00c ^ (uint)&stack0xfffffffc;
  iVar1 = FUN_10081930(param_1);
  if (iVar1 == 0) {
    local_14 = *(undefined4 *)((int)this + 0x94);
    local_10 = param_1;
    EnterCriticalSection((LPCRITICAL_SECTION)&DAT_100f006c);
    iVar1 = _HncCacheGet_8(DAT_100efdec,&local_14);
    if (iVar1 == 0) {
      LeaveCriticalSection((LPCRITICAL_SECTION)&DAT_100f006c);
      if (param_1 < 0x10000) {
        iVar1 = (**(code **)(**(int **)((int)this + 8) + 4))(*(undefined4 *)((int)this + 0x8c));
        iVar2 = (**(code **)(**(int **)((int)this + 8) + 0x1b0))(param_1,param_1,&local_18);
        if (iVar2 == 0) {
          local_18 = 0;
        }
        if (iVar1 != 0) {
          (**(code **)(**(int **)((int)this + 8) + 4))(iVar1);
        }
      }
      else {
        iVar1 = FUN_1005bb10(this,param_1,&local_18);
        if (iVar1 == 0) {
          local_18 = 0;
        }
      }
      if ((param_1 < 0x10000) && (*(float *)((int)this + 0x78) != _DAT_100c8b64)) {
        local_18 = (uint)((float)(int)local_18 * *(float *)((int)this + 0x78));
      }
      local_14 = *(undefined4 *)((int)this + 0x94);
      local_10 = param_1;
      local_c = local_18;
      EnterCriticalSection((LPCRITICAL_SECTION)&DAT_100f006c);
      _HncCachePut_8(DAT_100efdec,&local_14);
    }
    else {
      local_18 = *(uint *)(iVar1 + 8);
    }
    LeaveCriticalSection((LPCRITICAL_SECTION)&DAT_100f006c);
    if (*(int *)((int)this + 0x24) != 1) {
      if (*(int *)((int)this + 0x30) != 0) {
        HncIntMulDiv(local_18,*(undefined4 *)((int)this + 0x28),*(int *)((int)this + 0x30));
        __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
        return;
      }
      HncIntMulDiv(local_18,*(undefined4 *)((int)this + 0x28),1);
      __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
      return;
    }
  }
  else {
    uVar3 = (int)*(uint *)((int)this + 0x74) >> 0x1f;
    local_18 = FUN_10081ce0(param_1,(*(uint *)((int)this + 0x74) ^ uVar3) - uVar3);
    if (local_18 == 0) {
      __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
      return;
    }
    if (*(int *)((int)this + 0x24) == 1) {
      if (*(int *)((int)this + 0x30) != 0) {
        HncIntMulDiv(local_18,*(int *)((int)this + 0x30),*(undefined4 *)((int)this + 0x28));
        __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
        return;
      }
      HncIntMulDiv(local_18,0,1);
      __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
      return;
    }
  }
  __security_check_cookie(local_8 ^ (uint)&stack0xfffffffc);
  return;
}


//==== 1005d110 in 1005d110 FUN_1005d110

void __thiscall FUN_1005d110(void *this,uint param_1,int param_2,uint *param_3,undefined4 *param_4)

{
  uint uVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  longlong lVar7;
  longlong lVar8;
  
  iVar5 = **(int **)((int)this + 0x60);
  iVar6 = param_1 * 0x94 + iVar5;
  uVar1 = HncIntMulDiv();
  if ((int)((uVar1 ^ (int)uVar1 >> 0x1f) - ((int)uVar1 >> 0x1f)) < 1) {
    uVar1 = 1;
  }
  *param_3 = uVar1;
  *param_4 = 0;
  if (*(char *)(iVar6 + 0x16) == '\0') {
    if (*(int *)((int)this + 0x30) != 0) {
      uVar2 = HncIntMulDiv();
      *param_4 = uVar2;
      return;
    }
    uVar2 = HncIntMulDiv();
    *param_4 = uVar2;
    return;
  }
  if (*(char *)(iVar6 + 0x16) == 'd') {
    if (*(int *)((int)this + 0x24) != 8) {
      return;
    }
    iVar3 = HncIntMulDiv();
    iVar4 = HncIntMulDiv();
    if (iVar3 == iVar4) {
      return;
    }
  }
  if (param_2 == -1) {
    param_2 = *(int *)(iVar5 + 0x420 + param_1 * 4);
  }
  iVar5 = param_2 * 0xb0 + DAT_100ea9a8;
  if (iVar5 != 0) {
    param_1 = *(uint *)(iVar5 + 0x94);
    if (param_1 == 0) {
      param_1 = 1;
    }
    uVar1 = (int)*(uint *)(iVar6 + 0x10) >> 0x1f;
    uVar1 = (*(uint *)(iVar6 + 0x10) ^ uVar1) - uVar1;
    lVar7 = __allmul(uVar1,(int)uVar1 >> 0x1f,*(uint *)(iVar5 + 0x90),0);
    lVar7 = __allmul((uint)lVar7,(int)((ulonglong)lVar7 >> 0x20),(uint)*(byte *)(iVar6 + 0x16),0);
    uVar1 = (uint)lVar7 * 2;
    lVar8 = __allmul(param_1,0,200,0);
    __alldiv(uVar1 + 1,
             ((int)((ulonglong)lVar7 >> 0x20) << 1 | (uint)lVar7 >> 0x1f) +
             (uint)(0xfffffffe < uVar1),(uint)lVar8,(uint)((ulonglong)lVar8 >> 0x20));
    uVar2 = HncIntMulDiv();
    *param_4 = uVar2;
  }
  return;
}


//==== 1002e840 in 1002e840 GetCharWidthW

/* public: virtual int __thiscall CHncDeviceContext::GetCharWidthW(unsigned int,unsigned int,int
   *)const  */

int __thiscall
CHncDeviceContext::GetCharWidthW(CHncDeviceContext *this,uint param_1,uint param_2,int *param_3)

{
                    /* 0x2e840  284  ?GetCharWidthW@CHncDeviceContext@@UBEHIIPAH@Z */
  return 0;
}


//==== 1002e850 in 1002e850 GetCharABCWidthsW

/* public: virtual int __thiscall CHncDeviceContext::GetCharABCWidthsW(unsigned int,unsigned
   int,struct _ABC *)const  */

int __thiscall
CHncDeviceContext::GetCharABCWidthsW
          (CHncDeviceContext *this,uint param_1,uint param_2,_ABC *param_3)

{
                    /* 0x2e850  281  ?GetCharABCWidthsW@CHncDeviceContext@@UBEHIIPAU_ABC@@@Z */
  return 0;
}


