; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009c230 <= VA < 0x1009c450 (next decompiler entry; may include padding/thunks)
1009c230  55                             push ebp
1009c231  8bec                           mov ebp, esp
1009c233  6aff                           push -1
1009c235  6849c40a10                     push 0x100ac449
1009c23a  64a100000000                   mov eax, dword ptr fs:[0]
1009c240  50                             push eax
1009c241  83ec50                         sub esp, 0x50
1009c244  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009c249  33c5                           xor eax, ebp
1009c24b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009c24e  53                             push ebx
1009c24f  56                             push esi
1009c250  57                             push edi
1009c251  50                             push eax
1009c252  8d45f4                         lea eax, [ebp - 0xc]
1009c255  64a300000000                   mov dword ptr fs:[0], eax
1009c25b  8bd9                           mov ebx, ecx
1009c25d  895db4                         mov dword ptr [ebp - 0x4c], ebx
1009c260  8b4508                         mov eax, dword ptr [ebp + 8]
1009c263  8b4b74                         mov ecx, dword ptr [ebx + 0x74]
1009c266  8945ac                         mov dword ptr [ebp - 0x54], eax
1009c269  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009c26c  894db8                         mov dword ptr [ebp - 0x48], ecx
1009c26f  8b9080000000                   mov edx, dword ptr [eax + 0x80]
1009c275  8b4350                         mov eax, dword ptr [ebx + 0x50]
1009c278  03c2                           add eax, edx
1009c27a  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
1009c281  8945b0                         mov dword ptr [ebp - 0x50], eax
1009c284  8d9158080000                   lea edx, [ecx + 0x858]
1009c28a  7206                           jb 0x1009c292
1009c28c  8b9158080000                   mov edx, dword ptr [ecx + 0x858]
1009c292  52                             push edx
1009c293  ff7308                         push dword ptr [ebx + 8]
1009c296  e8c582feff                     call 0x10084560
1009c29b  6a64                           push 0x64
1009c29d  6a50                           push 0x50
1009c29f  ffb384000000                   push dword ptr [ebx + 0x84]
1009c2a5  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009c2ab  8b4b68                         mov ecx, dword ptr [ebx + 0x68]
1009c2ae  8bf8                           mov edi, eax
1009c2b0  8b7378                         mov esi, dword ptr [ebx + 0x78]
1009c2b3  f7df                           neg edi
1009c2b5  8b517c                         mov edx, dword ptr [ecx + 0x7c]
1009c2b8  8b465c                         mov eax, dword ptr [esi + 0x5c]
1009c2bb  8b4b54                         mov ecx, dword ptr [ebx + 0x54]
1009c2be  8d1c08                         lea ebx, [eax + ecx]
1009c2c1  8b4e58                         mov ecx, dword ptr [esi + 0x58]
1009c2c4  03da                           add ebx, edx
1009c2c6  b867666666                     mov eax, 0x66666667
1009c2cb  03df                           add ebx, edi
1009c2cd  8b7db4                         mov edi, dword ptr [ebp - 0x4c]
1009c2d0  51                             push ecx
1009c2d1  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
1009c2d4  f76f08                         imul dword ptr [edi + 8]
1009c2d7  ffb148080000                   push dword ptr [ecx + 0x848]
1009c2dd  c1fa03                         sar edx, 3
1009c2e0  8bf2                           mov esi, edx
1009c2e2  c1ee1f                         shr esi, 0x1f
1009c2e5  03f2                           add esi, edx
1009c2e7  e8e481feff                     call 0x100844d0
1009c2ec  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009c2ef  686de00000                     push 0xe06d
1009c2f4  53                             push ebx
1009c2f5  8b5db8                         mov ebx, dword ptr [ebp - 0x48]
1009c2f8  03c6                           add eax, esi
1009c2fa  50                             push eax
1009c2fb  8bcb                           mov ecx, ebx
1009c2fd  e82e86feff                     call 0x10084930
1009c302  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1009c309  8d8358080000                   lea eax, [ebx + 0x858]
1009c30f  7202                           jb 0x1009c313
1009c311  8b00                           mov eax, dword ptr [eax]
1009c313  50                             push eax
1009c314  ff7708                         push dword ptr [edi + 8]
1009c317  8bcb                           mov ecx, ebx
1009c319  e84282feff                     call 0x10084560
1009c31e  8b7768                         mov esi, dword ptr [edi + 0x68]
1009c321  8b8680000000                   mov eax, dword ptr [esi + 0x80]
1009c327  034750                         add eax, dword ptr [edi + 0x50]
1009c32a  8945b8                         mov dword ptr [ebp - 0x48], eax
1009c32d  8b4758                         mov eax, dword ptr [edi + 0x58]
1009c330  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009c333  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1009c336  99                             cdq 
1009c337  2bc2                           sub eax, edx
1009c339  8bd8                           mov ebx, eax
1009c33b  8b7678                         mov esi, dword ptr [esi + 0x78]
1009c33e  d1fb                           sar ebx, 1
1009c340  035db8                         add ebx, dword ptr [ebp - 0x48]
1009c343  8b4658                         mov eax, dword ptr [esi + 0x58]
1009c346  99                             cdq 
1009c347  2bc2                           sub eax, edx
1009c349  d1f8                           sar eax, 1
1009c34b  2bd8                           sub ebx, eax
1009c34d  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009c353  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1009c356  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009c359  89787c                         mov dword ptr [eax + 0x7c], edi
1009c35c  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009c35f  8b7dac                         mov edi, dword ptr [ebp - 0x54]
1009c362  57                             push edi
1009c363  8b01                           mov eax, dword ptr [ecx]
1009c365  ff5004                         call dword ptr [eax + 4]
1009c368  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009c36b  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009c372  8d8658080000                   lea eax, [esi + 0x858]
1009c378  7202                           jb 0x1009c37c
1009c37a  8b00                           mov eax, dword ptr [eax]
1009c37c  50                             push eax
1009c37d  ff7308                         push dword ptr [ebx + 8]
1009c380  8bce                           mov ecx, esi
1009c382  e8d981feff                     call 0x10084560
1009c387  3bfb                           cmp edi, ebx
1009c389  0f858f000000                   jne 0x1009c41e
1009c38f  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009c392  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009c395  8b7b58                         mov edi, dword ptr [ebx + 0x58]
1009c398  8955b0                         mov dword ptr [ebp - 0x50], edx
1009c39b  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009c39e  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009c3a1  03c1                           add eax, ecx
1009c3a3  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009c3aa  8945ac                         mov dword ptr [ebp - 0x54], eax
1009c3ad  746f                           je 0x1009c41e
1009c3af  833e00                         cmp dword ptr [esi], 0
1009c3b2  746a                           je 0x1009c41e
1009c3b4  8d4dbc                         lea ecx, [ebp - 0x44]
1009c3b7  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009c3bd  6a01                           push 1
1009c3bf  8d4dbc                         lea ecx, [ebp - 0x44]
1009c3c2  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009c3c9  ff1550ff0d10                   call dword ptr [0x100dff50]
1009c3cf  6a01                           push 1
1009c3d1  8d4dbc                         lea ecx, [ebp - 0x44]
1009c3d4  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009c3da  68ff000000                     push 0xff
1009c3df  8d4dbc                         lea ecx, [ebp - 0x44]
1009c3e2  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009c3e8  8b0e                           mov ecx, dword ptr [esi]
1009c3ea  8d45bc                         lea eax, [ebp - 0x44]
1009c3ed  50                             push eax
1009c3ee  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009c3f4  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1009c3f7  8d4dbc                         lea ecx, [ebp - 0x44]
1009c3fa  898670080000                   mov dword ptr [esi + 0x870], eax
1009c400  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1009c403  898674080000                   mov dword ptr [esi + 0x874], eax
1009c409  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009c40c  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009c412  89be78080000                   mov dword ptr [esi + 0x878], edi
1009c418  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009c41e  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009c421  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009c424  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1009c427  894348                         mov dword ptr [ebx + 0x48], eax
1009c42a  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009c42d  03c1                           add eax, ecx
1009c42f  89434c                         mov dword ptr [ebx + 0x4c], eax
1009c432  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009c435  64890d00000000                 mov dword ptr fs:[0], ecx
1009c43c  59                             pop ecx
1009c43d  5f                             pop edi
1009c43e  5e                             pop esi
1009c43f  5b                             pop ebx
1009c440  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009c443  33cd                           xor ecx, ebp
1009c445  e80d650000                     call 0x100a2957
1009c44a  8be5                           mov esp, ebp
1009c44c  5d                             pop ebp
1009c44d  c20400                         ret 4
