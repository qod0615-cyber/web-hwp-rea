; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008ee80 <= VA < 0x1008f050 (next decompiler entry; may include padding/thunks)
1008ee80  55                             push ebp
1008ee81  8bec                           mov ebp, esp
1008ee83  83ec20                         sub esp, 0x20
1008ee86  53                             push ebx
1008ee87  56                             push esi
1008ee88  8b7508                         mov esi, dword ptr [ebp + 8]
1008ee8b  57                             push edi
1008ee8c  8bf9                           mov edi, ecx
1008ee8e  8b5f74                         mov ebx, dword ptr [edi + 0x74]
1008ee91  668b430e                       mov ax, word ptr [ebx + 0xe]
1008ee95  6683e001                       and ax, 1
1008ee99  0fb7c8                         movzx ecx, ax
1008ee9c  894de8                         mov dword ptr [ebp - 0x18], ecx
1008ee9f  6689430e                       mov word ptr [ebx + 0xe], ax
1008eea3  740a                           je 0x1008eeaf
1008eea5  c7835008000000000000           mov dword ptr [ebx + 0x850], 0
1008eeaf  6a64                           push 0x64
1008eeb1  ffb784000000                   push dword ptr [edi + 0x84]
1008eeb7  ff7708                         push dword ptr [edi + 8]
1008eeba  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008eec0  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1008eec7  8bc8                           mov ecx, eax
1008eec9  8d8358080000                   lea eax, [ebx + 0x858]
1008eecf  7202                           jb 0x1008eed3
1008eed1  8b00                           mov eax, dword ptr [eax]
1008eed3  50                             push eax
1008eed4  51                             push ecx
1008eed5  8bcb                           mov ecx, ebx
1008eed7  e88456ffff                     call 0x10084560
1008eedc  33c9                           xor ecx, ecx
1008eede  8d4304                         lea eax, [ebx + 4]
1008eee1  33d2                           xor edx, edx
1008eee3  8945f8                         mov dword ptr [ebp - 8], eax
1008eee6  83bf8000000001                 cmp dword ptr [edi + 0x80], 1
1008eeed  8b3d08fe0d10                   mov edi, dword ptr [0x100dfe08]
1008eef3  897df0                         mov dword ptr [ebp - 0x10], edi
1008eef6  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1008eefc  894de0                         mov dword ptr [ebp - 0x20], ecx
1008eeff  8955e4                         mov dword ptr [ebp - 0x1c], edx
1008ef02  897df4                         mov dword ptr [ebp - 0xc], edi
1008ef05  7509                           jne 0x1008ef10
1008ef07  c745ec4c000000                 mov dword ptr [ebp - 0x14], 0x4c
1008ef0e  eb0a                           jmp 0x1008ef1a
1008ef10  c745ec6c000000                 mov dword ptr [ebp - 0x14], 0x6c
1008ef17  8945f8                         mov dword ptr [ebp - 8], eax
1008ef1a  390b                           cmp dword ptr [ebx], ecx
1008ef1c  7441                           je 0x1008ef5f
1008ef1e  81ec20040000                   sub esp, 0x420
1008ef24  8bf0                           mov esi, eax
1008ef26  8bfc                           mov edi, esp
1008ef28  b908010000                     mov ecx, 0x108
1008ef2d  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1008ef2f  8bcb                           mov ecx, ebx
1008ef31  e8ea58ffff                     call 0x10084820
1008ef36  8b0b                           mov ecx, dword ptr [ebx]
1008ef38  8b7df4                         mov edi, dword ptr [ebp - 0xc]
1008ef3b  50                             push eax
1008ef3c  ffd7                           call edi
1008ef3e  8b0b                           mov ecx, dword ptr [ebx]
1008ef40  8bf0                           mov esi, eax
1008ef42  8d45e0                         lea eax, [ebp - 0x20]
1008ef45  50                             push eax
1008ef46  6a01                           push 1
1008ef48  8d45ec                         lea eax, [ebp - 0x14]
1008ef4b  50                             push eax
1008ef4c  ff55f0                         call dword ptr [ebp - 0x10]
1008ef4f  8b0b                           mov ecx, dword ptr [ebx]
1008ef51  56                             push esi
1008ef52  ffd7                           call edi
1008ef54  8b7508                         mov esi, dword ptr [ebp + 8]
1008ef57  8b4de0                         mov ecx, dword ptr [ebp - 0x20]
1008ef5a  8b55e4                         mov edx, dword ptr [ebp - 0x1c]
1008ef5d  eb03                           jmp 0x1008ef62
1008ef5f  8945f8                         mov dword ptr [ebp - 8], eax
1008ef62  890e                           mov dword ptr [esi], ecx
1008ef64  895604                         mov dword ptr [esi + 4], edx
1008ef67  8b0b                           mov ecx, dword ptr [ebx]
1008ef69  c745ec69000000                 mov dword ptr [ebp - 0x14], 0x69
1008ef70  c745e000000000                 mov dword ptr [ebp - 0x20], 0
1008ef77  c745e400000000                 mov dword ptr [ebp - 0x1c], 0
1008ef7e  85c9                           test ecx, ecx
1008ef80  7504                           jne 0x1008ef86
1008ef82  33d2                           xor edx, edx
1008ef84  eb44                           jmp 0x1008efca
1008ef86  8d4304                         lea eax, [ebx + 4]
1008ef89  81ec20040000                   sub esp, 0x420
1008ef8f  8bf0                           mov esi, eax
1008ef91  8945f8                         mov dword ptr [ebp - 8], eax
1008ef94  8bfc                           mov edi, esp
1008ef96  b908010000                     mov ecx, 0x108
1008ef9b  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1008ef9d  8bcb                           mov ecx, ebx
1008ef9f  e87c58ffff                     call 0x10084820
1008efa4  8b0b                           mov ecx, dword ptr [ebx]
1008efa6  8b7df4                         mov edi, dword ptr [ebp - 0xc]
1008efa9  50                             push eax
1008efaa  ffd7                           call edi
1008efac  8b0b                           mov ecx, dword ptr [ebx]
1008efae  8bf0                           mov esi, eax
1008efb0  8d45e0                         lea eax, [ebp - 0x20]
1008efb3  50                             push eax
1008efb4  6a01                           push 1
1008efb6  8d45ec                         lea eax, [ebp - 0x14]
1008efb9  50                             push eax
1008efba  ff55f0                         call dword ptr [ebp - 0x10]
1008efbd  8b0b                           mov ecx, dword ptr [ebx]
1008efbf  56                             push esi
1008efc0  ffd7                           call edi
1008efc2  8b55e0                         mov edx, dword ptr [ebp - 0x20]
1008efc5  8b0b                           mov ecx, dword ptr [ebx]
1008efc7  8b7508                         mov esi, dword ptr [ebp + 8]
1008efca  8b06                           mov eax, dword ptr [esi]
1008efcc  03c2                           add eax, edx
1008efce  c745ec6d000000                 mov dword ptr [ebp - 0x14], 0x6d
1008efd5  8906                           mov dword ptr [esi], eax
1008efd7  c745e000000000                 mov dword ptr [ebp - 0x20], 0
1008efde  c745e400000000                 mov dword ptr [ebp - 0x1c], 0
1008efe5  85c9                           test ecx, ecx
1008efe7  743f                           je 0x1008f028
1008efe9  8b75f8                         mov esi, dword ptr [ebp - 8]
1008efec  81ec20040000                   sub esp, 0x420
1008eff2  8bfc                           mov edi, esp
1008eff4  b908010000                     mov ecx, 0x108
1008eff9  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1008effb  8bcb                           mov ecx, ebx
1008effd  e81e58ffff                     call 0x10084820
1008f002  8b0b                           mov ecx, dword ptr [ebx]
1008f004  8b7df4                         mov edi, dword ptr [ebp - 0xc]
1008f007  50                             push eax
1008f008  ffd7                           call edi
1008f00a  8b0b                           mov ecx, dword ptr [ebx]
1008f00c  8bf0                           mov esi, eax
1008f00e  8d45e0                         lea eax, [ebp - 0x20]
1008f011  50                             push eax
1008f012  6a01                           push 1
1008f014  8d45ec                         lea eax, [ebp - 0x14]
1008f017  50                             push eax
1008f018  ff55f0                         call dword ptr [ebp - 0x10]
1008f01b  8b0b                           mov ecx, dword ptr [ebx]
1008f01d  56                             push esi
1008f01e  ffd7                           call edi
1008f020  8b7508                         mov esi, dword ptr [ebp + 8]
1008f023  8b4de0                         mov ecx, dword ptr [ebp - 0x20]
1008f026  8b06                           mov eax, dword ptr [esi]
1008f028  03c8                           add ecx, eax
1008f02a  66837de800                     cmp word ptr [ebp - 0x18], 0
1008f02f  890e                           mov dword ptr [esi], ecx
1008f031  8bc6                           mov eax, esi
1008f033  740a                           je 0x1008f03f
1008f035  c7835008000001000000           mov dword ptr [ebx + 0x850], 1
1008f03f  5f                             pop edi
1008f040  5e                             pop esi
1008f041  5b                             pop ebx
1008f042  8be5                           mov esp, ebp
1008f044  5d                             pop ebp
1008f045  c20400                         ret 4
1008f048  cc                             int3 
1008f049  cc                             int3 
1008f04a  cc                             int3 
1008f04b  cc                             int3 
1008f04c  cc                             int3 
1008f04d  cc                             int3 
1008f04e  cc                             int3 
1008f04f  cc                             int3 
