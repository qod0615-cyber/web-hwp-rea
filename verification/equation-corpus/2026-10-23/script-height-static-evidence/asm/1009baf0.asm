; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009baf0 <= VA < 0x1009bc40 (next decompiler entry; may include padding/thunks)
1009baf0  55                             push ebp
1009baf1  8bec                           mov ebp, esp
1009baf3  83e4f8                         and esp, 0xfffffff8
1009baf6  83ec1c                         sub esp, 0x1c
1009baf9  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009bafd  53                             push ebx
1009bafe  56                             push esi
1009baff  57                             push edi
1009bb00  8bd9                           mov ebx, ecx
1009bb02  741d                           je 0x1009bb21
1009bb04  837b4400                       cmp dword ptr [ebx + 0x44], 0
1009bb08  7517                           jne 0x1009bb21
1009bb0a  8b4508                         mov eax, dword ptr [ebp + 8]
1009bb0d  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009bb10  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009bb13  8910                           mov dword ptr [eax], edx
1009bb15  894804                         mov dword ptr [eax + 4], ecx
1009bb18  5f                             pop edi
1009bb19  5e                             pop esi
1009bb1a  5b                             pop ebx
1009bb1b  8be5                           mov esp, ebp
1009bb1d  5d                             pop ebp
1009bb1e  c20800                         ret 8
1009bb21  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1009bb28  e8c3c8feff                     call 0x100883f0
1009bb2d  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009bb30  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009bb37  8d8658080000                   lea eax, [esi + 0x858]
1009bb3d  89742410                       mov dword ptr [esp + 0x10], esi
1009bb41  7202                           jb 0x1009bb45
1009bb43  8b00                           mov eax, dword ptr [eax]
1009bb45  50                             push eax
1009bb46  ff7308                         push dword ptr [ebx + 8]
1009bb49  8bce                           mov ecx, esi
1009bb4b  e8108afeff                     call 0x10084560
1009bb50  33c0                           xor eax, eax
1009bb52  c744241800000000               mov dword ptr [esp + 0x18], 0
1009bb5a  8944241c                       mov dword ptr [esp + 0x1c], eax
1009bb5e  c74424146de00000               mov dword ptr [esp + 0x14], 0xe06d
1009bb66  3906                           cmp dword ptr [esi], eax
1009bb68  7452                           je 0x1009bbbc
1009bb6a  81ec20040000                   sub esp, 0x420
1009bb70  83c604                         add esi, 4
1009bb73  8bfc                           mov edi, esp
1009bb75  b908010000                     mov ecx, 0x108
1009bb7a  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009bb7c  8bb42430040000                 mov esi, dword ptr [esp + 0x430]
1009bb83  8bce                           mov ecx, esi
1009bb85  e8968cfeff                     call 0x10084820
1009bb8a  8b0e                           mov ecx, dword ptr [esi]
1009bb8c  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1009bb92  50                             push eax
1009bb93  ffd7                           call edi
1009bb95  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1009bb99  8bf0                           mov esi, eax
1009bb9b  8d442418                       lea eax, [esp + 0x18]
1009bb9f  50                             push eax
1009bba0  6a01                           push 1
1009bba2  8b09                           mov ecx, dword ptr [ecx]
1009bba4  8d44241c                       lea eax, [esp + 0x1c]
1009bba8  50                             push eax
1009bba9  ff1508fe0d10                   call dword ptr [0x100dfe08]
1009bbaf  8b442410                       mov eax, dword ptr [esp + 0x10]
1009bbb3  56                             push esi
1009bbb4  8b08                           mov ecx, dword ptr [eax]
1009bbb6  ffd7                           call edi
1009bbb8  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1009bbbc  8b3dc8e20a10                   mov edi, dword ptr [0x100ae2c8]
1009bbc2  6a64                           push 0x64
1009bbc4  6a14                           push 0x14
1009bbc6  50                             push eax
1009bbc7  ffd7                           call edi
1009bbc9  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1009bbcd  8d542420                       lea edx, [esp + 0x20]
1009bbd1  ff750c                         push dword ptr [ebp + 0xc]
1009bbd4  898b80000000                   mov dword ptr [ebx + 0x80], ecx
1009bbda  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009bbdd  898384000000                   mov dword ptr [ebx + 0x84], eax
1009bbe3  8b4308                         mov eax, dword ptr [ebx + 8]
1009bbe6  52                             push edx
1009bbe7  894108                         mov dword ptr [ecx + 8], eax
1009bbea  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009bbed  8b01                           mov eax, dword ptr [ecx]
1009bbef  ff5008                         call dword ptr [eax + 8]
1009bbf2  8b8b80000000                   mov ecx, dword ptr [ebx + 0x80]
1009bbf8  8bf1                           mov esi, ecx
1009bbfa  394c2420                       cmp dword ptr [esp + 0x20], ecx
1009bbfe  6a64                           push 0x64
1009bc00  0f4f742424                     cmovg esi, dword ptr [esp + 0x24]
1009bc05  6a14                           push 0x14
1009bc07  51                             push ecx
1009bc08  ffd7                           call edi
1009bc0a  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009bc0d  8b9384000000                   mov edx, dword ptr [ebx + 0x84]
1009bc13  8d3c06                         lea edi, [esi + eax]
1009bc16  8b742424                       mov esi, dword ptr [esp + 0x24]
1009bc1a  8b4508                         mov eax, dword ptr [ebp + 8]
1009bc1d  03f2                           add esi, edx
1009bc1f  8b4954                         mov ecx, dword ptr [ecx + 0x54]
1009bc22  897b58                         mov dword ptr [ebx + 0x58], edi
1009bc25  2bca                           sub ecx, edx
1009bc27  89735c                         mov dword ptr [ebx + 0x5c], esi
1009bc2a  8938                           mov dword ptr [eax], edi
1009bc2c  5f                             pop edi
1009bc2d  897004                         mov dword ptr [eax + 4], esi
1009bc30  5e                             pop esi
1009bc31  894b54                         mov dword ptr [ebx + 0x54], ecx
1009bc34  5b                             pop ebx
1009bc35  8be5                           mov esp, ebp
1009bc37  5d                             pop ebp
1009bc38  c20800                         ret 8
1009bc3b  cc                             int3 
1009bc3c  cc                             int3 
1009bc3d  cc                             int3 
1009bc3e  cc                             int3 
1009bc3f  cc                             int3 
