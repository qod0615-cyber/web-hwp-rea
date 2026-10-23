; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008f2e0 <= VA < 0x1008f440 (next decompiler entry; may include padding/thunks)
1008f2e0  55                             push ebp
1008f2e1  8bec                           mov ebp, esp
1008f2e3  6aff                           push -1
1008f2e5  6869c70a10                     push 0x100ac769
1008f2ea  64a100000000                   mov eax, dword ptr fs:[0]
1008f2f0  50                             push eax
1008f2f1  83ec44                         sub esp, 0x44
1008f2f4  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008f2f9  33c5                           xor eax, ebp
1008f2fb  8945f0                         mov dword ptr [ebp - 0x10], eax
1008f2fe  53                             push ebx
1008f2ff  56                             push esi
1008f300  57                             push edi
1008f301  50                             push eax
1008f302  8d45f4                         lea eax, [ebp - 0xc]
1008f305  64a300000000                   mov dword ptr fs:[0], eax
1008f30b  8bf1                           mov esi, ecx
1008f30d  8b4508                         mov eax, dword ptr [ebp + 8]
1008f310  8b7e74                         mov edi, dword ptr [esi + 0x74]
1008f313  50                             push eax
1008f314  8945b8                         mov dword ptr [ebp - 0x48], eax
1008f317  e834030000                     call 0x1008f650
1008f31c  8b4e68                         mov ecx, dword ptr [esi + 0x68]
1008f31f  8b467c                         mov eax, dword ptr [esi + 0x7c]
1008f322  8b9684000000                   mov edx, dword ptr [esi + 0x84]
1008f328  ff75b8                         push dword ptr [ebp - 0x48]
1008f32b  8b9980000000                   mov ebx, dword ptr [ecx + 0x80]
1008f331  035e50                         add ebx, dword ptr [esi + 0x50]
1008f334  8b497c                         mov ecx, dword ptr [ecx + 0x7c]
1008f337  03d3                           add edx, ebx
1008f339  899080000000                   mov dword ptr [eax + 0x80], edx
1008f33f  8b467c                         mov eax, dword ptr [esi + 0x7c]
1008f342  89487c                         mov dword ptr [eax + 0x7c], ecx
1008f345  8b4e7c                         mov ecx, dword ptr [esi + 0x7c]
1008f348  8b01                           mov eax, dword ptr [ecx]
1008f34a  ff5004                         call dword ptr [eax + 4]
1008f34d  83bf6c08000008                 cmp dword ptr [edi + 0x86c], 8
1008f354  8d8758080000                   lea eax, [edi + 0x858]
1008f35a  7202                           jb 0x1008f35e
1008f35c  8b00                           mov eax, dword ptr [eax]
1008f35e  50                             push eax
1008f35f  ff7608                         push dword ptr [esi + 8]
1008f362  8bcf                           mov ecx, edi
1008f364  e8f751ffff                     call 0x10084560
1008f369  3975b8                         cmp dword ptr [ebp - 0x48], esi
1008f36c  0f8592000000                   jne 0x1008f404
1008f372  8b4668                         mov eax, dword ptr [esi + 0x68]
1008f375  8b5658                         mov edx, dword ptr [esi + 0x58]
1008f378  8955b0                         mov dword ptr [ebp - 0x50], edx
1008f37b  8b565c                         mov edx, dword ptr [esi + 0x5c]
1008f37e  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1008f381  8b4654                         mov eax, dword ptr [esi + 0x54]
1008f384  03c1                           add eax, ecx
1008f386  8955b4                         mov dword ptr [ebp - 0x4c], edx
1008f389  83bf8008000001                 cmp dword ptr [edi + 0x880], 1
1008f390  8945b8                         mov dword ptr [ebp - 0x48], eax
1008f393  746f                           je 0x1008f404
1008f395  833f00                         cmp dword ptr [edi], 0
1008f398  746a                           je 0x1008f404
1008f39a  8d4dbc                         lea ecx, [ebp - 0x44]
1008f39d  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008f3a3  6a01                           push 1
1008f3a5  8d4dbc                         lea ecx, [ebp - 0x44]
1008f3a8  c745fc00000000                 mov dword ptr [ebp - 4], 0
1008f3af  ff1550ff0d10                   call dword ptr [0x100dff50]
1008f3b5  6a01                           push 1
1008f3b7  8d4dbc                         lea ecx, [ebp - 0x44]
1008f3ba  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008f3c0  68ff000000                     push 0xff
1008f3c5  8d4dbc                         lea ecx, [ebp - 0x44]
1008f3c8  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008f3ce  8b0f                           mov ecx, dword ptr [edi]
1008f3d0  8d45bc                         lea eax, [ebp - 0x44]
1008f3d3  50                             push eax
1008f3d4  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008f3da  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008f3dd  8d4dbc                         lea ecx, [ebp - 0x44]
1008f3e0  898774080000                   mov dword ptr [edi + 0x874], eax
1008f3e6  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1008f3e9  89877c080000                   mov dword ptr [edi + 0x87c], eax
1008f3ef  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1008f3f2  899f70080000                   mov dword ptr [edi + 0x870], ebx
1008f3f8  898778080000                   mov dword ptr [edi + 0x878], eax
1008f3fe  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1008f404  8b4668                         mov eax, dword ptr [esi + 0x68]
1008f407  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1008f40a  8b4654                         mov eax, dword ptr [esi + 0x54]
1008f40d  03c1                           add eax, ecx
1008f40f  895e48                         mov dword ptr [esi + 0x48], ebx
1008f412  89464c                         mov dword ptr [esi + 0x4c], eax
1008f415  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1008f418  64890d00000000                 mov dword ptr fs:[0], ecx
1008f41f  59                             pop ecx
1008f420  5f                             pop edi
1008f421  5e                             pop esi
1008f422  5b                             pop ebx
1008f423  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1008f426  33cd                           xor ecx, ebp
1008f428  e82a350100                     call 0x100a2957
1008f42d  8be5                           mov esp, ebp
1008f42f  5d                             pop ebp
1008f430  c20400                         ret 4
1008f433  cc                             int3 
1008f434  cc                             int3 
1008f435  cc                             int3 
1008f436  cc                             int3 
1008f437  cc                             int3 
1008f438  cc                             int3 
1008f439  cc                             int3 
1008f43a  cc                             int3 
1008f43b  cc                             int3 
1008f43c  cc                             int3 
1008f43d  cc                             int3 
1008f43e  cc                             int3 
1008f43f  cc                             int3 
