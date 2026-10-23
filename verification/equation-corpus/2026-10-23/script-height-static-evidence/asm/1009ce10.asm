; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009ce10 <= VA < 0x1009cf50 (next decompiler entry; may include padding/thunks)
1009ce10  55                             push ebp
1009ce11  8bec                           mov ebp, esp
1009ce13  83e4f8                         and esp, 0xfffffff8
1009ce16  83ec1c                         sub esp, 0x1c
1009ce19  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009ce1d  53                             push ebx
1009ce1e  56                             push esi
1009ce1f  57                             push edi
1009ce20  8bd9                           mov ebx, ecx
1009ce22  741d                           je 0x1009ce41
1009ce24  837b4400                       cmp dword ptr [ebx + 0x44], 0
1009ce28  7517                           jne 0x1009ce41
1009ce2a  8b4508                         mov eax, dword ptr [ebp + 8]
1009ce2d  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009ce30  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009ce33  8910                           mov dword ptr [eax], edx
1009ce35  894804                         mov dword ptr [eax + 4], ecx
1009ce38  5f                             pop edi
1009ce39  5e                             pop esi
1009ce3a  5b                             pop ebx
1009ce3b  8be5                           mov esp, ebp
1009ce3d  5d                             pop ebp
1009ce3e  c20800                         ret 8
1009ce41  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1009ce48  e8a3b5feff                     call 0x100883f0
1009ce4d  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009ce50  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009ce57  8d8658080000                   lea eax, [esi + 0x858]
1009ce5d  89742410                       mov dword ptr [esp + 0x10], esi
1009ce61  7202                           jb 0x1009ce65
1009ce63  8b00                           mov eax, dword ptr [eax]
1009ce65  50                             push eax
1009ce66  ff7308                         push dword ptr [ebx + 8]
1009ce69  8bce                           mov ecx, esi
1009ce6b  e8f076feff                     call 0x10084560
1009ce70  33c0                           xor eax, eax
1009ce72  c744241800000000               mov dword ptr [esp + 0x18], 0
1009ce7a  8944241c                       mov dword ptr [esp + 0x1c], eax
1009ce7e  c74424145de00000               mov dword ptr [esp + 0x14], 0xe05d
1009ce86  3906                           cmp dword ptr [esi], eax
1009ce88  7452                           je 0x1009cedc
1009ce8a  81ec20040000                   sub esp, 0x420
1009ce90  83c604                         add esi, 4
1009ce93  8bfc                           mov edi, esp
1009ce95  b908010000                     mov ecx, 0x108
1009ce9a  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009ce9c  8bb42430040000                 mov esi, dword ptr [esp + 0x430]
1009cea3  8bce                           mov ecx, esi
1009cea5  e87679feff                     call 0x10084820
1009ceaa  8b0e                           mov ecx, dword ptr [esi]
1009ceac  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1009ceb2  50                             push eax
1009ceb3  ffd7                           call edi
1009ceb5  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1009ceb9  8bf0                           mov esi, eax
1009cebb  8d442418                       lea eax, [esp + 0x18]
1009cebf  50                             push eax
1009cec0  6a01                           push 1
1009cec2  8b09                           mov ecx, dword ptr [ecx]
1009cec4  8d44241c                       lea eax, [esp + 0x1c]
1009cec8  50                             push eax
1009cec9  ff1508fe0d10                   call dword ptr [0x100dfe08]
1009cecf  8b442410                       mov eax, dword ptr [esp + 0x10]
1009ced3  56                             push esi
1009ced4  8b08                           mov ecx, dword ptr [eax]
1009ced6  ffd7                           call edi
1009ced8  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1009cedc  6a64                           push 0x64
1009cede  6a14                           push 0x14
1009cee0  50                             push eax
1009cee1  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009cee7  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1009ceeb  8d542420                       lea edx, [esp + 0x20]
1009ceef  ff750c                         push dword ptr [ebp + 0xc]
1009cef2  898b80000000                   mov dword ptr [ebx + 0x80], ecx
1009cef8  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009cefb  898384000000                   mov dword ptr [ebx + 0x84], eax
1009cf01  8b4308                         mov eax, dword ptr [ebx + 8]
1009cf04  52                             push edx
1009cf05  894108                         mov dword ptr [ecx + 8], eax
1009cf08  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009cf0b  8b01                           mov eax, dword ptr [ecx]
1009cf0d  ff5008                         call dword ptr [eax + 8]
1009cf10  8bb380000000                   mov esi, dword ptr [ebx + 0x80]
1009cf16  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009cf19  39742420                       cmp dword ptr [esp + 0x20], esi
1009cf1d  8b8b84000000                   mov ecx, dword ptr [ebx + 0x84]
1009cf23  0f4f742420                     cmovg esi, dword ptr [esp + 0x20]
1009cf28  8b4054                         mov eax, dword ptr [eax + 0x54]
1009cf2b  8b542424                       mov edx, dword ptr [esp + 0x24]
1009cf2f  03d1                           add edx, ecx
1009cf31  897358                         mov dword ptr [ebx + 0x58], esi
1009cf34  2bc1                           sub eax, ecx
1009cf36  89535c                         mov dword ptr [ebx + 0x5c], edx
1009cf39  894354                         mov dword ptr [ebx + 0x54], eax
1009cf3c  8b4508                         mov eax, dword ptr [ebp + 8]
1009cf3f  5f                             pop edi
1009cf40  8930                           mov dword ptr [eax], esi
1009cf42  5e                             pop esi
1009cf43  895004                         mov dword ptr [eax + 4], edx
1009cf46  5b                             pop ebx
1009cf47  8be5                           mov esp, ebp
1009cf49  5d                             pop ebp
1009cf4a  c20800                         ret 8
1009cf4d  cc                             int3 
1009cf4e  cc                             int3 
1009cf4f  cc                             int3 
