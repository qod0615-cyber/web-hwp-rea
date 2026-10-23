; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10084f60 <= VA < 0x100851d0 (next decompiler entry; may include padding/thunks)
10084f60  55                             push ebp
10084f61  8bec                           mov ebp, esp
10084f63  6aff                           push -1
10084f65  683cb60a10                     push 0x100ab63c
10084f6a  64a100000000                   mov eax, dword ptr fs:[0]
10084f70  50                             push eax
10084f71  81ec24020000                   sub esp, 0x224
10084f77  a10c100d10                     mov eax, dword ptr [0x100d100c]
10084f7c  33c5                           xor eax, ebp
10084f7e  8945f0                         mov dword ptr [ebp - 0x10], eax
10084f81  53                             push ebx
10084f82  56                             push esi
10084f83  57                             push edi
10084f84  50                             push eax
10084f85  8d45f4                         lea eax, [ebp - 0xc]
10084f88  64a300000000                   mov dword ptr fs:[0], eax
10084f8e  8bf1                           mov esi, ecx
10084f90  89b5e4fdffff                   mov dword ptr [ebp - 0x21c], esi
10084f96  668b4d0c                       mov cx, word ptr [ebp + 0xc]
10084f9a  33c0                           xor eax, eax
10084f9c  8b5d08                         mov ebx, dword ptr [ebp + 8]
10084f9f  33d2                           xor edx, edx
10084fa1  8985d8fdffff                   mov dword ptr [ebp - 0x228], eax
10084fa7  8995dcfdffff                   mov dword ptr [ebp - 0x224], edx
10084fad  6683f920                       cmp cx, 0x20
10084fb1  730a                           jae 0x10084fbd
10084fb3  8903                           mov dword ptr [ebx], eax
10084fb5  895304                         mov dword ptr [ebx + 4], edx
10084fb8  e9e4010000                     jmp 0x100851a1
10084fbd  3906                           cmp dword ptr [esi], eax
10084fbf  74f2                           je 0x10084fb3
10084fc1  6685c9                         test cx, cx
10084fc4  74ed                           je 0x10084fb3
10084fc6  398650080000                   cmp dword ptr [esi + 0x850], eax
10084fcc  0f85c2000000                   jne 0x10085094
10084fd2  b81b1f0000                     mov eax, 0x1f1b
10084fd7  6603c1                         add ax, cx
10084fda  6683f819                       cmp ax, 0x19
10084fde  0f8794000000                   ja 0x10085078
10084fe4  b87c1f0000                     mov eax, 0x1f7c
10084fe9  6603c8                         add cx, ax
10084fec  66894d0c                       mov word ptr [ebp + 0xc], cx
10084ff0  ff750c                         push dword ptr [ebp + 0xc]
10084ff3  8bce                           mov ecx, esi
10084ff5  e816f6ffff                     call 0x10084610
10084ffa  33c9                           xor ecx, ecx
10084ffc  85c0                           test eax, eax
10084ffe  0f94c1                         sete cl
10085001  898dd0fdffff                   mov dword ptr [ebp - 0x230], ecx
10085007  85c0                           test eax, eax
10085009  0f85fd000000                   jne 0x1008510c
1008500f  8d8de0fdffff                   lea ecx, [ebp - 0x220]
10085015  ff1590e00a10                   call dword ptr [0x100ae090]
1008501b  8d85e0fdffff                   lea eax, [ebp - 0x220]
10085021  c745fc00000000                 mov dword ptr [ebp - 4], 0
10085028  50                             push eax
10085029  68c0f20b10                     push 0x100bf2c0
1008502e  6a00                           push 0
10085030  ff1538e20a10                   call dword ptr [0x100ae238]
10085036  8d4628                         lea eax, [esi + 0x28]
10085039  50                             push eax
1008503a  8d85e8fdffff                   lea eax, [ebp - 0x218]
10085040  6804010000                     push 0x104
10085045  50                             push eax
10085046  ff1554e60a10                   call dword ptr [0x100ae654]
1008504c  83c40c                         add esp, 0xc
1008504f  8d7e04                         lea edi, [esi + 4]
10085052  8bce                           mov ecx, esi
10085054  ffb5e0fdffff                   push dword ptr [ebp - 0x220]
1008505a  57                             push edi
1008505b  e810f7ffff                     call 0x10084770
10085060  8d8de0fdffff                   lea ecx, [ebp - 0x220]
10085066  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
1008506d  ff1554e20a10                   call dword ptr [0x100ae254]
10085073  e997000000                     jmp 0x1008510f
10085078  b800200000                     mov eax, 0x2000
1008507d  6603c1                         add ax, cx
10085080  6683f819                       cmp ax, 0x19
10085084  0f8766ffffff                   ja 0x10084ff0
1008508a  b841200000                     mov eax, 0x2041
1008508f  e955ffffff                     jmp 0x10084fe9
10085094  b800200000                     mov eax, 0x2000
10085099  6603c1                         add ax, cx
1008509c  6683f819                       cmp ax, 0x19
100850a0  0f874affffff                   ja 0x10084ff0
100850a6  b801000000                     mov eax, 1
100850ab  81ec20040000                   sub esp, 0x420
100850b1  6689460e                       mov word ptr [esi + 0xe], ax
100850b5  8bfc                           mov edi, esp
100850b7  83c604                         add esi, 4
100850ba  b908010000                     mov ecx, 0x108
100850bf  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
100850c1  8bb5e4fdffff                   mov esi, dword ptr [ebp - 0x21c]
100850c7  8bce                           mov ecx, esi
100850c9  e852f7ffff                     call 0x10084820
100850ce  8b0e                           mov ecx, dword ptr [esi]
100850d0  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
100850d6  50                             push eax
100850d7  ffd7                           call edi
100850d9  8b8de4fdffff                   mov ecx, dword ptr [ebp - 0x21c]
100850df  8bf0                           mov esi, eax
100850e1  8d85d8fdffff                   lea eax, [ebp - 0x228]
100850e7  50                             push eax
100850e8  6a01                           push 1
100850ea  8b09                           mov ecx, dword ptr [ecx]
100850ec  8d450c                         lea eax, [ebp + 0xc]
100850ef  50                             push eax
100850f0  ff1508fe0d10                   call dword ptr [0x100dfe08]
100850f6  56                             push esi
100850f7  8bb5e4fdffff                   mov esi, dword ptr [ebp - 0x21c]
100850fd  8b0e                           mov ecx, dword ptr [esi]
100850ff  ffd7                           call edi
10085101  33c0                           xor eax, eax
10085103  6689460e                       mov word ptr [esi + 0xe], ax
10085107  e984000000                     jmp 0x10085190
1008510c  8d7e04                         lea edi, [esi + 4]
1008510f  81ec20040000                   sub esp, 0x420
10085115  8bf7                           mov esi, edi
10085117  8bfc                           mov edi, esp
10085119  b908010000                     mov ecx, 0x108
1008511e  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
10085120  8bb5e4fdffff                   mov esi, dword ptr [ebp - 0x21c]
10085126  8bce                           mov ecx, esi
10085128  e8f3f6ffff                     call 0x10084820
1008512d  8b0e                           mov ecx, dword ptr [esi]
1008512f  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
10085135  50                             push eax
10085136  ffd7                           call edi
10085138  8b8de4fdffff                   mov ecx, dword ptr [ebp - 0x21c]
1008513e  8bf0                           mov esi, eax
10085140  8d85d8fdffff                   lea eax, [ebp - 0x228]
10085146  c785d4fdffff00000000           mov dword ptr [ebp - 0x22c], 0
10085150  50                             push eax
10085151  8d85d4fdffff                   lea eax, [ebp - 0x22c]
10085157  8b09                           mov ecx, dword ptr [ecx]
10085159  50                             push eax
1008515a  6a00                           push 0
1008515c  6a00                           push 0
1008515e  6a01                           push 1
10085160  8d450c                         lea eax, [ebp + 0xc]
10085163  50                             push eax
10085164  ff1540ff0d10                   call dword ptr [0x100dff40]
1008516a  56                             push esi
1008516b  8bb5e4fdffff                   mov esi, dword ptr [ebp - 0x21c]
10085171  8b0e                           mov ecx, dword ptr [esi]
10085173  ffd7                           call edi
10085175  83bdd0fdffff00                 cmp dword ptr [ebp - 0x230], 0
1008517c  7412                           je 0x10085190
1008517e  8d85e8fdffff                   lea eax, [ebp - 0x218]
10085184  8bce                           mov ecx, esi
10085186  50                             push eax
10085187  8d4604                         lea eax, [esi + 4]
1008518a  50                             push eax
1008518b  e8e0f5ffff                     call 0x10084770
10085190  8b85d8fdffff                   mov eax, dword ptr [ebp - 0x228]
10085196  8903                           mov dword ptr [ebx], eax
10085198  8b85dcfdffff                   mov eax, dword ptr [ebp - 0x224]
1008519e  894304                         mov dword ptr [ebx + 4], eax
100851a1  8bc3                           mov eax, ebx
100851a3  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
100851a6  64890d00000000                 mov dword ptr fs:[0], ecx
100851ad  59                             pop ecx
100851ae  5f                             pop edi
100851af  5e                             pop esi
100851b0  5b                             pop ebx
100851b1  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
100851b4  33cd                           xor ecx, ebp
100851b6  e89cd70100                     call 0x100a2957
100851bb  8be5                           mov esp, ebp
100851bd  5d                             pop ebp
100851be  c20800                         ret 8
100851c1  cc                             int3 
100851c2  cc                             int3 
100851c3  cc                             int3 
100851c4  cc                             int3 
100851c5  cc                             int3 
100851c6  cc                             int3 
100851c7  cc                             int3 
100851c8  cc                             int3 
100851c9  cc                             int3 
100851ca  cc                             int3 
100851cb  cc                             int3 
100851cc  cc                             int3 
100851cd  cc                             int3 
100851ce  cc                             int3 
100851cf  cc                             int3 
