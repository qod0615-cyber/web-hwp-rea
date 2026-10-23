// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 127074-127246
//==== 100964c0 FUN_100964c0

void __thiscall FUN_100964c0(void *this,int param_1)

{
  short sVar1;
  int iVar2;
  short ****ppppsVar3;
  int *piVar4;
  int iVar5;
  wchar_t *pwVar6;
  int *piVar7;
  int *piVar8;
  undefined1 local_ac [8];
  uint local_a4;
  void *local_a0;
  int local_98;
  void *local_94;
  int local_90;
  int local_8c;
  int local_88;
  int local_84;
  int local_80;
  int local_78;
  int local_74;
  int *local_70;
  uint local_6c;
  int local_68;
  int local_64;
  CHncPen local_60 [52];
  short ***local_2c [5];
  uint local_18;
  uint local_14;
  void *local_10;
  undefined1 *puStack_c;
  undefined4 local_8;
  
  local_8 = 0xffffffff;
  puStack_c = &LAB_100acd69;
  local_10 = ExceptionList;
  local_14 = DAT_100d100c ^ (uint)&stack0xfffffffc;
  ExceptionList = &local_10;
  piVar7 = *(int **)((int)this + 0x6c);
  local_94 = (void *)param_1;
  local_64 = *(int *)((int)this + 0x50) + *(int *)(*(int *)((int)this + 0x68) + 0x80);
  local_74 = 0;
  local_90 = *(int *)(*(int *)((int)this + 0x68) + 0x7c) - *(int *)((int)this + 0x5c) / 2;
  local_70 = *(int **)((int)this + 0x74);
  local_a0 = this;
  local_8c = MulDiv(*(int *)((int)this + 8),0xf,100);
  local_84 = MulDiv(*(int *)((int)this + 8),0x14,100);
  local_98 = MulDiv(*(int *)((int)this + 8),0x14,100);
  local_6c = 0;
  if (0 < *(int *)((int)this + 0x78)) {
    do {
      local_80 = 0;
      local_78 = 0;
      local_68 = 0;
      local_88 = 0;
      if (0 < *(int *)((int)this + 0x7c)) {
        local_a4 = local_6c & 1;
        do {
          if (local_a4 == 0) {
LAB_10096669:
            if (local_88 == 0) goto LAB_1009666d;
          }
          else {
            local_78 = local_78 + piVar7[0x16];
            if ((*(char *)((int)this + 0x88) != '\0') || (local_88 != 0)) {
              if (0 < local_88) {
                local_78 = local_78 + local_84;
              }
              goto LAB_10096669;
            }
            piVar8 = *(int **)(piVar7[0x23] + 100);
            if (piVar8 == (int *)0x0) {
LAB_10096652:
              local_78 = local_78 - local_68;
            }
            else {
              do {
                this = local_a0;
                if (piVar8 == (int *)piVar7[0x24]) goto LAB_10096652;
                FUN_10043d00(local_2c,piVar8 + 9);
                ppppsVar3 = local_2c;
                if (7 < local_18) {
                  ppppsVar3 = (short ****)local_2c[0];
                }
                sVar1 = *(short *)ppppsVar3;
                FUN_10005c10((int *)local_2c);
                if (((sVar1 != 0x20) && (sVar1 != 0x7e)) && (this = local_a0, sVar1 != 0x60))
                goto LAB_10096652;
                piVar4 = (int *)(**(code **)(*piVar8 + 8))(local_ac,1);
                piVar8 = (int *)piVar8[0x19];
                local_68 = local_68 + *piVar4;
              } while (piVar8 != (int *)0x0);
              local_78 = local_78 - local_68;
              this = local_a0;
            }
LAB_1009666d:
            if (*(char *)((int)this + 0x88) == '\x01') {
              local_64 = local_64 + *(int *)(*(int *)((int)this + 0x8c) + local_6c * 4);
            }
          }
          iVar5 = local_88;
          piVar7[0x20] = local_64 + local_80;
          piVar7[0x1f] = (local_90 - piVar7[0x15]) + local_74;
          (**(code **)(*piVar7 + 4))(local_94);
          piVar7 = (int *)piVar7[0x19];
          local_80 = local_80 + *(int *)(*(int *)((int)this + 0x84) + iVar5 * 4) + local_84;
        } while ((piVar7 != (int *)0x0) &&
                (local_88 = iVar5 + 1, local_88 < *(int *)((int)this + 0x7c)));
      }
      local_74 = local_74 + *(int *)(*(int *)((int)this + 0x80) + local_6c * 4) + local_8c;
      if ((local_6c & 1) != 0) {
        FUN_100844d0(local_70,*(undefined4 *)((int)this + 8),local_78);
        FUN_10084930(local_70,local_68 + local_64,((local_90 - local_8c / 2) - local_98) + local_74,
                     0xe06d);
      }
    } while ((piVar7 != (int *)0x0) &&
            (local_6c = local_6c + 1, (int)local_6c < *(int *)((int)this + 0x78)));
  }
  pwVar6 = (wchar_t *)(local_70 + 0x216);
  iVar5 = *(int *)((int)this + 8);
  if (7 < (uint)local_70[0x21b]) {
    pwVar6 = *(wchar_t **)pwVar6;
  }
  local_70[0xe3] = iVar5;
  local_70[0xbe] = iVar5;
  local_70[0x99] = iVar5;
  local_70[0x74] = iVar5;
  local_70[0x4f] = iVar5;
  local_70[0x2a] = iVar5;
  local_70[5] = iVar5;
  local_70[0x212] = iVar5;
  iVar5 = iVar5 / 2;
  local_70[0xe5] = iVar5;
  local_70[0xc0] = iVar5;
  local_70[0x9b] = iVar5;
  local_70[0x76] = iVar5;
  local_70[0x51] = iVar5;
  local_70[0x2c] = iVar5;
  local_70[7] = iVar5;
  local_70[0x213] = iVar5;
  FUN_10084770(local_70,(int)(local_70 + 1),pwVar6);
  if (local_94 == this) {
    iVar5 = *(int *)((int)this + 0x58);
    iVar2 = *(int *)((int)this + 0x5c);
    local_98 = *(int *)((int)this + 0x54) + *(int *)(*(int *)((int)this + 0x68) + 0x7c);
    if ((local_70[0x220] != 1) && (*local_70 != 0)) {
      CHncPen::CHncPen(local_60);
      local_8 = 0;
      CHncPen::SetLineStyle(local_60,1);
      CHncPen::SetWidth(local_60,1);
      CHncPen::SetColor(local_60,0xff);
      CHncDrawContext::SelectObject((CHncDrawContext *)*local_70,local_60);
      local_70[0x21c] = local_64;
      local_70[0x21d] = local_98;
      local_70[0x21f] = iVar2;
      local_70[0x21e] = iVar5;
      CHncPen::~CHncPen(local_60);
    }
  }
  iVar5 = *(int *)(*(int *)((int)this + 0x68) + 0x7c);
  *(int *)((int)this + 0x48) = local_64;
  *(int *)((int)this + 0x4c) = *(int *)((int)this + 0x54) + iVar5;
  ExceptionList = local_10;
  __security_check_cookie(local_14 ^ (uint)&stack0xfffffffc);
  return;
}


