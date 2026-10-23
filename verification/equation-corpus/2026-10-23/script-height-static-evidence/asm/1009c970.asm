; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009c970 <= VA < 0x1009cad0 (next decompiler entry; may include padding/thunks)
1009c970  55                             push ebp
1009c971  8bec                           mov ebp, esp
1009c973  83e4f8                         and esp, 0xfffffff8
1009c976  83ec1c                         sub esp, 0x1c
1009c979  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009c97d  53                             push ebx
1009c97e  56                             push esi
1009c97f  57                             push edi
1009c980  8bf9                           mov edi, ecx
1009c982  897c2410                       mov dword ptr [esp + 0x10], edi
1009c986  741d                           je 0x1009c9a5
1009c988  837f4400                       cmp dword ptr [edi + 0x44], 0
1009c98c  7517                           jne 0x1009c9a5
1009c98e  8b4508                         mov eax, dword ptr [ebp + 8]
1009c991  8b5758                         mov edx, dword ptr [edi + 0x58]
1009c994  8b4f5c                         mov ecx, dword ptr [edi + 0x5c]
1009c997  8910                           mov dword ptr [eax], edx
1009c999  894804                         mov dword ptr [eax + 4], ecx
1009c99c  5f                             pop edi
1009c99d  5e                             pop esi
1009c99e  5b                             pop ebx
1009c99f  8be5                           mov esp, ebp
1009c9a1  5d                             pop ebp
1009c9a2  c20800                         ret 8
1009c9a5  c7474400000000                 mov dword ptr [edi + 0x44], 0
1009c9ac  e83fbafeff                     call 0x100883f0
1009c9b1  8b5f74                         mov ebx, dword ptr [edi + 0x74]
1009c9b4  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1009c9bb  8d8358080000                   lea eax, [ebx + 0x858]
1009c9c1  7202                           jb 0x1009c9c5
1009c9c3  8b00                           mov eax, dword ptr [eax]
1009c9c5  50                             push eax
1009c9c6  ff7708                         push dword ptr [edi + 8]
1009c9c9  8bcb                           mov ecx, ebx
1009c9cb  e8907bfeff                     call 0x10084560
1009c9d0  33c0                           xor eax, eax
1009c9d2  c744241800000000               mov dword ptr [esp + 0x18], 0
1009c9da  8944241c                       mov dword ptr [esp + 0x1c], eax
1009c9de  c74424146de00000               mov dword ptr [esp + 0x14], 0xe06d
1009c9e6  3903                           cmp dword ptr [ebx], eax
1009c9e8  7447                           je 0x1009ca31
1009c9ea  81ec20040000                   sub esp, 0x420
1009c9f0  8d7304                         lea esi, [ebx + 4]
1009c9f3  8bfc                           mov edi, esp
1009c9f5  b908010000                     mov ecx, 0x108
1009c9fa  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009c9fc  8bcb                           mov ecx, ebx
1009c9fe  e81d7efeff                     call 0x10084820
1009ca03  8b0b                           mov ecx, dword ptr [ebx]
1009ca05  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1009ca0b  50                             push eax
1009ca0c  ffd7                           call edi
1009ca0e  8b0b                           mov ecx, dword ptr [ebx]
1009ca10  8bf0                           mov esi, eax
1009ca12  8d442418                       lea eax, [esp + 0x18]
1009ca16  50                             push eax
1009ca17  6a01                           push 1
1009ca19  8d44241c                       lea eax, [esp + 0x1c]
1009ca1d  50                             push eax
1009ca1e  ff1508fe0d10                   call dword ptr [0x100dfe08]
1009ca24  8b0b                           mov ecx, dword ptr [ebx]
1009ca26  56                             push esi
1009ca27  ffd7                           call edi
1009ca29  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1009ca2d  8b7c2410                       mov edi, dword ptr [esp + 0x10]
1009ca31  8b1dc8e20a10                   mov ebx, dword ptr [0x100ae2c8]
1009ca37  6a64                           push 0x64
1009ca39  6a14                           push 0x14
1009ca3b  50                             push eax
1009ca3c  ffd3                           call ebx
1009ca3e  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1009ca42  8d542420                       lea edx, [esp + 0x20]
1009ca46  ff750c                         push dword ptr [ebp + 0xc]
1009ca49  898f80000000                   mov dword ptr [edi + 0x80], ecx
1009ca4f  8b4f78                         mov ecx, dword ptr [edi + 0x78]
1009ca52  898784000000                   mov dword ptr [edi + 0x84], eax
1009ca58  8b4708                         mov eax, dword ptr [edi + 8]
1009ca5b  52                             push edx
1009ca5c  894108                         mov dword ptr [ecx + 8], eax
1009ca5f  8b4f78                         mov ecx, dword ptr [edi + 0x78]
1009ca62  8b01                           mov eax, dword ptr [ecx]
1009ca64  ff5008                         call dword ptr [eax + 8]
1009ca67  8b8f80000000                   mov ecx, dword ptr [edi + 0x80]
1009ca6d  8bf1                           mov esi, ecx
1009ca6f  394c2420                       cmp dword ptr [esp + 0x20], ecx
1009ca73  6a64                           push 0x64
1009ca75  0f4f742424                     cmovg esi, dword ptr [esp + 0x24]
1009ca7a  6a14                           push 0x14
1009ca7c  51                             push ecx
1009ca7d  ffd3                           call ebx
1009ca7f  8bbf84000000                   mov edi, dword ptr [edi + 0x84]
1009ca85  037c2424                       add edi, dword ptr [esp + 0x24]
1009ca89  6a64                           push 0x64
1009ca8b  8d1c06                         lea ebx, [esi + eax]
1009ca8e  8b442414                       mov eax, dword ptr [esp + 0x14]
1009ca92  6a0f                           push 0xf
1009ca94  8b4878                         mov ecx, dword ptr [eax + 0x78]
1009ca97  ffb080000000                   push dword ptr [eax + 0x80]
1009ca9d  8b7154                         mov esi, dword ptr [ecx + 0x54]
1009caa0  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009caa6  2bf0                           sub esi, eax
1009caa8  8b442410                       mov eax, dword ptr [esp + 0x10]
1009caac  897054                         mov dword ptr [eax + 0x54], esi
1009caaf  895858                         mov dword ptr [eax + 0x58], ebx
1009cab2  89785c                         mov dword ptr [eax + 0x5c], edi
1009cab5  8b4508                         mov eax, dword ptr [ebp + 8]
1009cab8  897804                         mov dword ptr [eax + 4], edi
1009cabb  5f                             pop edi
1009cabc  5e                             pop esi
1009cabd  8918                           mov dword ptr [eax], ebx
1009cabf  5b                             pop ebx
1009cac0  8be5                           mov esp, ebp
1009cac2  5d                             pop ebp
1009cac3  c20800                         ret 8
1009cac6  cc                             int3 
1009cac7  cc                             int3 
1009cac8  cc                             int3 
1009cac9  cc                             int3 
1009caca  cc                             int3 
1009cacb  cc                             int3 
1009cacc  cc                             int3 
1009cacd  cc                             int3 
1009cace  cc                             int3 
1009cacf  cc                             int3 
