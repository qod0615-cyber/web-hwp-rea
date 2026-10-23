; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009f310 <= VA < 0x1009f480 (next decompiler entry; may include padding/thunks)
1009f310  55                             push ebp
1009f311  8bec                           mov ebp, esp
1009f313  6aff                           push -1
1009f315  6869c70a10                     push 0x100ac769
1009f31a  64a100000000                   mov eax, dword ptr fs:[0]
1009f320  50                             push eax
1009f321  83ec44                         sub esp, 0x44
1009f324  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009f329  33c5                           xor eax, ebp
1009f32b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009f32e  53                             push ebx
1009f32f  56                             push esi
1009f330  57                             push edi
1009f331  50                             push eax
1009f332  8d45f4                         lea eax, [ebp - 0xc]
1009f335  64a300000000                   mov dword ptr fs:[0], eax
1009f33b  8bf1                           mov esi, ecx
1009f33d  8b4508                         mov eax, dword ptr [ebp + 8]
1009f340  8b7e74                         mov edi, dword ptr [esi + 0x74]
1009f343  8945b8                         mov dword ptr [ebp - 0x48], eax
1009f346  8b4668                         mov eax, dword ptr [esi + 0x68]
1009f349  ff75b8                         push dword ptr [ebp - 0x48]
1009f34c  8b9880000000                   mov ebx, dword ptr [eax + 0x80]
1009f352  035e50                         add ebx, dword ptr [esi + 0x50]
1009f355  c7875408000001000000           mov dword ptr [edi + 0x854], 1
1009f35f  c74704bc020000                 mov dword ptr [edi + 4], 0x2bc
1009f366  8b4678                         mov eax, dword ptr [esi + 0x78]
1009f369  899880000000                   mov dword ptr [eax + 0x80], ebx
1009f36f  8b4668                         mov eax, dword ptr [esi + 0x68]
1009f372  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009f375  8b4678                         mov eax, dword ptr [esi + 0x78]
1009f378  89487c                         mov dword ptr [eax + 0x7c], ecx
1009f37b  8b4e78                         mov ecx, dword ptr [esi + 0x78]
1009f37e  8b01                           mov eax, dword ptr [ecx]
1009f380  ff5004                         call dword ptr [eax + 4]
1009f383  c7875408000000000000           mov dword ptr [edi + 0x854], 0
1009f38d  8d8758080000                   lea eax, [edi + 0x858]
1009f393  c7470490010000                 mov dword ptr [edi + 4], 0x190
1009f39a  83781408                       cmp dword ptr [eax + 0x14], 8
1009f39e  7202                           jb 0x1009f3a2
1009f3a0  8b00                           mov eax, dword ptr [eax]
1009f3a2  50                             push eax
1009f3a3  ff7608                         push dword ptr [esi + 8]
1009f3a6  8bcf                           mov ecx, edi
1009f3a8  e8b351feff                     call 0x10084560
1009f3ad  3975b8                         cmp dword ptr [ebp - 0x48], esi
1009f3b0  0f8592000000                   jne 0x1009f448
1009f3b6  8b4668                         mov eax, dword ptr [esi + 0x68]
1009f3b9  8b5658                         mov edx, dword ptr [esi + 0x58]
1009f3bc  8955b0                         mov dword ptr [ebp - 0x50], edx
1009f3bf  8b565c                         mov edx, dword ptr [esi + 0x5c]
1009f3c2  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009f3c5  8b4654                         mov eax, dword ptr [esi + 0x54]
1009f3c8  03c1                           add eax, ecx
1009f3ca  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009f3cd  83bf8008000001                 cmp dword ptr [edi + 0x880], 1
1009f3d4  8945b8                         mov dword ptr [ebp - 0x48], eax
1009f3d7  746f                           je 0x1009f448
1009f3d9  833f00                         cmp dword ptr [edi], 0
1009f3dc  746a                           je 0x1009f448
1009f3de  8d4dbc                         lea ecx, [ebp - 0x44]
1009f3e1  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009f3e7  6a01                           push 1
1009f3e9  8d4dbc                         lea ecx, [ebp - 0x44]
1009f3ec  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009f3f3  ff1550ff0d10                   call dword ptr [0x100dff50]
1009f3f9  6a01                           push 1
1009f3fb  8d4dbc                         lea ecx, [ebp - 0x44]
1009f3fe  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009f404  68ff000000                     push 0xff
1009f409  8d4dbc                         lea ecx, [ebp - 0x44]
1009f40c  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009f412  8b0f                           mov ecx, dword ptr [edi]
1009f414  8d45bc                         lea eax, [ebp - 0x44]
1009f417  50                             push eax
1009f418  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009f41e  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1009f421  8d4dbc                         lea ecx, [ebp - 0x44]
1009f424  898774080000                   mov dword ptr [edi + 0x874], eax
1009f42a  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009f42d  89877c080000                   mov dword ptr [edi + 0x87c], eax
1009f433  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009f436  899f70080000                   mov dword ptr [edi + 0x870], ebx
1009f43c  898778080000                   mov dword ptr [edi + 0x878], eax
1009f442  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009f448  8b4668                         mov eax, dword ptr [esi + 0x68]
1009f44b  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009f44e  8b4654                         mov eax, dword ptr [esi + 0x54]
1009f451  03c1                           add eax, ecx
1009f453  895e48                         mov dword ptr [esi + 0x48], ebx
1009f456  89464c                         mov dword ptr [esi + 0x4c], eax
1009f459  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009f45c  64890d00000000                 mov dword ptr fs:[0], ecx
1009f463  59                             pop ecx
1009f464  5f                             pop edi
1009f465  5e                             pop esi
1009f466  5b                             pop ebx
1009f467  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009f46a  33cd                           xor ecx, ebp
1009f46c  e8e6340000                     call 0x100a2957
1009f471  8be5                           mov esp, ebp
1009f473  5d                             pop ebp
1009f474  c20400                         ret 4
1009f477  cc                             int3 
1009f478  cc                             int3 
1009f479  cc                             int3 
1009f47a  cc                             int3 
1009f47b  cc                             int3 
1009f47c  cc                             int3 
1009f47d  cc                             int3 
1009f47e  cc                             int3 
1009f47f  cc                             int3 
