// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 112818-112865
//==== 10084610 FUN_10084610

int __thiscall FUN_10084610(void *this,ushort param_1)

{
  short *psVar1;
  uint uVar2;
  ushort *puVar3;
  int iVar4;
  ushort *puVar5;
  
  if (param_1 == 0xac) {
    return 0;
  }
  uVar2 = *(uint *)((int)this + 0x86c);
  puVar3 = (ushort *)((int)this + 0x858);
  puVar5 = puVar3;
  if (7 < uVar2) {
    puVar5 = *(ushort **)puVar3;
  }
  if (*(int *)((int)this + 0x868) == 7) {
    psVar1 = &DAT_100bf2b0;
    iVar4 = 7;
    do {
      if (*(short *)((int)(puVar5 + -0x805f958) + (int)psVar1) != *psVar1) {
        uVar2 = *(uint *)((int)this + 0x86c);
        goto LAB_10084698;
      }
      psVar1 = psVar1 + 1;
      iVar4 = iVar4 + -1;
    } while (iVar4 != 0);
  }
  else {
LAB_10084698:
    if (7 < uVar2) {
      puVar3 = *(ushort **)puVar3;
    }
    iVar4 = CHncDrawContext::GlyphExist(*(CHncDrawContext **)this,puVar3,1,(uint)param_1);
    if (iVar4 != 0) {
      return 1;
    }
  }
  iVar4 = CHncDrawContext::GlyphExist(*(CHncDrawContext **)this,&DAT_100bf2b0,1,(uint)param_1);
  return iVar4;
}


