// Source: C:\Users\K\tools\work\r19\plug_all.c
// Original lines: 112865-112893
//==== 100846d0 FUN_100846d0

void __thiscall FUN_100846d0(void *this,undefined4 *param_1)

{
  undefined4 *puVar1;
  int iVar2;
  
  memset(param_1,0,0x420);
  puVar1 = param_1 + 5;
  iVar2 = 7;
  do {
    puVar1[-1] = 1000;
    *(undefined2 *)puVar1 = 1;
    puVar1[1] = 500;
    *(undefined1 *)((int)puVar1 + 2) = 0;
    wcscpy_s((wchar_t *)(puVar1 + 4),0x40,L"HancomEQN");
    puVar1 = puVar1 + 0x25;
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  *(undefined4 *)((int)this + 0x848) = 1000;
  *(undefined4 *)((int)this + 0x84c) = 1000;
  *(undefined2 *)((int)param_1 + 10) = 0;
  *param_1 = 400;
  return;
}


