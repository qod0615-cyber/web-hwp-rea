; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008e270 <= VA < 0x1008e670 (next decompiler entry; may include padding/thunks)
1008e270  55                             push ebp
1008e271  8bec                           mov ebp, esp
1008e273  6aff                           push -1
1008e275  68b1c60a10                     push 0x100ac6b1
1008e27a  64a100000000                   mov eax, dword ptr fs:[0]
1008e280  50                             push eax
1008e281  83ec58                         sub esp, 0x58
1008e284  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008e289  33c5                           xor eax, ebp
1008e28b  8945f0                         mov dword ptr [ebp - 0x10], eax
1008e28e  53                             push ebx
1008e28f  56                             push esi
1008e290  57                             push edi
1008e291  50                             push eax
1008e292  8d45f4                         lea eax, [ebp - 0xc]
1008e295  64a300000000                   mov dword ptr fs:[0], eax
1008e29b  8bf9                           mov edi, ecx
1008e29d  8b4508                         mov eax, dword ptr [ebp + 8]
1008e2a0  33db                           xor ebx, ebx
1008e2a2  89459c                         mov dword ptr [ebp - 0x64], eax
1008e2a5  895da8                         mov dword ptr [ebp - 0x58], ebx
1008e2a8  395d0c                         cmp dword ptr [ebp + 0xc], ebx
1008e2ab  7415                           je 0x1008e2c2
1008e2ad  395f44                         cmp dword ptr [edi + 0x44], ebx
1008e2b0  7510                           jne 0x1008e2c2
1008e2b2  8b4f58                         mov ecx, dword ptr [edi + 0x58]
1008e2b5  8908                           mov dword ptr [eax], ecx
1008e2b7  8b4f5c                         mov ecx, dword ptr [edi + 0x5c]
1008e2ba  894804                         mov dword ptr [eax + 4], ecx
1008e2bd  e986030000                     jmp 0x1008e648
1008e2c2  895f44                         mov dword ptr [edi + 0x44], ebx
1008e2c5  e826a1ffff                     call 0x100883f0
1008e2ca  8b4774                         mov eax, dword ptr [edi + 0x74]
1008e2cd  83b86c08000008                 cmp dword ptr [eax + 0x86c], 8
1008e2d4  8db058080000                   lea esi, [eax + 0x858]
1008e2da  8945bc                         mov dword ptr [ebp - 0x44], eax
1008e2dd  8bce                           mov ecx, esi
1008e2df  8975b8                         mov dword ptr [ebp - 0x48], esi
1008e2e2  7202                           jb 0x1008e2e6
1008e2e4  8b0e                           mov ecx, dword ptr [esi]
1008e2e6  51                             push ecx
1008e2e7  ff7708                         push dword ptr [edi + 8]
1008e2ea  8bc8                           mov ecx, eax
1008e2ec  e86f62ffff                     call 0x10084560
1008e2f1  399f8c000000                   cmp dword ptr [edi + 0x8c], ebx
1008e2f7  7461                           je 0x1008e35a
1008e2f9  8b4760                         mov eax, dword ptr [edi + 0x60]
1008e2fc  8378046f                       cmp dword ptr [eax + 4], 0x6f
1008e300  7558                           jne 0x1008e35a
1008e302  83c024                         add eax, 0x24
1008e305  8d4dc0                         lea ecx, [ebp - 0x40]
1008e308  50                             push eax
1008e309  e8f259fbff                     call 0x10043d00
1008e30e  c745fc00000000                 mov dword ptr [ebp - 4], 0
1008e315  8d45c0                         lea eax, [ebp - 0x40]
1008e318  837dd408                       cmp dword ptr [ebp - 0x2c], 8
1008e31c  bb05000000                     mov ebx, 5
1008e321  895da8                         mov dword ptr [ebp - 0x58], ebx
1008e324  0f4345c0                       cmovae eax, dword ptr [ebp - 0x40]
1008e328  66833841                       cmp word ptr [eax], 0x41
1008e32c  722c                           jb 0x1008e35a
1008e32e  8b4760                         mov eax, dword ptr [edi + 0x60]
1008e331  8d4dd8                         lea ecx, [ebp - 0x28]
1008e334  83c024                         add eax, 0x24
1008e337  50                             push eax
1008e338  e8c359fbff                     call 0x10043d00
1008e33d  837dec08                       cmp dword ptr [ebp - 0x14], 8
1008e341  8d45d8                         lea eax, [ebp - 0x28]
1008e344  bb0f000000                     mov ebx, 0xf
1008e349  c745b001000000                 mov dword ptr [ebp - 0x50], 1
1008e350  0f4345d8                       cmovae eax, dword ptr [ebp - 0x28]
1008e354  6683385a                       cmp word ptr [eax], 0x5a
1008e358  7607                           jbe 0x1008e361
1008e35a  c745b000000000                 mov dword ptr [ebp - 0x50], 0
1008e361  f6c302                         test bl, 2
1008e364  740b                           je 0x1008e371
1008e366  8d4dd8                         lea ecx, [ebp - 0x28]
1008e369  83e3fd                         and ebx, 0xfffffffd
1008e36c  e89f78f7ff                     call 0x10005c10
1008e371  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
1008e378  f6c301                         test bl, 1
1008e37b  7408                           je 0x1008e385
1008e37d  8d4dc0                         lea ecx, [ebp - 0x40]
1008e380  e88b78f7ff                     call 0x10005c10
1008e385  837db000                       cmp dword ptr [ebp - 0x50], 0
1008e389  8b5dbc                         mov ebx, dword ptr [ebp - 0x44]
1008e38c  7415                           je 0x1008e3a3
1008e38e  6a64                           push 0x64
1008e390  6a0f                           push 0xf
1008e392  ffb348080000                   push dword ptr [ebx + 0x848]
1008e398  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008e39e  8945b0                         mov dword ptr [ebp - 0x50], eax
1008e3a1  eb07                           jmp 0x1008e3aa
1008e3a3  c745b000000000                 mov dword ptr [ebp - 0x50], 0
1008e3aa  8b4764                         mov eax, dword ptr [edi + 0x64]
1008e3ad  85c0                           test eax, eax
1008e3af  7442                           je 0x1008e3f3
1008e3b1  8378047a                       cmp dword ptr [eax + 4], 0x7a
1008e3b5  743c                           je 0x1008e3f3
1008e3b7  8bcf                           mov ecx, edi
1008e3b9  e8729bffff                     call 0x10087f30
1008e3be  8b4f64                         mov ecx, dword ptr [edi + 0x64]
1008e3c1  8bf0                           mov esi, eax
1008e3c3  e8689bffff                     call 0x10087f30
1008e3c8  8d0cb6                         lea ecx, [esi + esi*4]
1008e3cb  8d0448                         lea eax, [eax + ecx*2]
1008e3ce  8b048518f30b10                 mov eax, dword ptr [eax*4 + 0x100bf318]
1008e3d5  85c0                           test eax, eax
1008e3d7  7417                           je 0x1008e3f0
1008e3d9  6a64                           push 0x64
1008e3db  50                             push eax
1008e3dc  ffb348080000                   push dword ptr [ebx + 0x848]
1008e3e2  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008e3e8  8d0480                         lea eax, [eax + eax*4]
1008e3eb  03c0                           add eax, eax
1008e3ed  8945b0                         mov dword ptr [ebp - 0x50], eax
1008e3f0  8b75b8                         mov esi, dword ptr [ebp - 0x48]
1008e3f3  6a64                           push 0x64
1008e3f5  6a44                           push 0x44
1008e3f7  ff7708                         push dword ptr [edi + 8]
1008e3fa  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008e400  837e1408                       cmp dword ptr [esi + 0x14], 8
1008e404  8945b8                         mov dword ptr [ebp - 0x48], eax
1008e407  c745a800000000                 mov dword ptr [ebp - 0x58], 0
1008e40e  c745ac00000000                 mov dword ptr [ebp - 0x54], 0
1008e415  7202                           jb 0x1008e419
1008e417  8b36                           mov esi, dword ptr [esi]
1008e419  56                             push esi
1008e41a  ff7708                         push dword ptr [edi + 8]
1008e41d  8bcb                           mov ecx, ebx
1008e41f  e83c61ffff                     call 0x10084560
1008e424  83bf8800000000                 cmp dword ptr [edi + 0x88], 0
1008e42b  8b75b8                         mov esi, dword ptr [ebp - 0x48]
1008e42e  741e                           je 0x1008e44e
1008e430  8b4778                         mov eax, dword ptr [edi + 0x78]
1008e433  6a00                           push 0
1008e435  897008                         mov dword ptr [eax + 8], esi
1008e438  8d45a0                         lea eax, [ebp - 0x60]
1008e43b  8b4f78                         mov ecx, dword ptr [edi + 0x78]
1008e43e  50                             push eax
1008e43f  8b01                           mov eax, dword ptr [ecx]
1008e441  ff5008                         call dword ptr [eax + 8]
1008e444  8b18                           mov ebx, dword ptr [eax]
1008e446  8b4004                         mov eax, dword ptr [eax + 4]
1008e449  8945a8                         mov dword ptr [ebp - 0x58], eax
1008e44c  eb02                           jmp 0x1008e450
1008e44e  33db                           xor ebx, ebx
1008e450  83bf8c00000000                 cmp dword ptr [edi + 0x8c], 0
1008e457  741e                           je 0x1008e477
1008e459  8b477c                         mov eax, dword ptr [edi + 0x7c]
1008e45c  6a00                           push 0
1008e45e  897008                         mov dword ptr [eax + 8], esi
1008e461  8d45a0                         lea eax, [ebp - 0x60]
1008e464  8b4f7c                         mov ecx, dword ptr [edi + 0x7c]
1008e467  50                             push eax
1008e468  8b01                           mov eax, dword ptr [ecx]
1008e46a  ff5008                         call dword ptr [eax + 8]
1008e46d  8b08                           mov ecx, dword ptr [eax]
1008e46f  8b4004                         mov eax, dword ptr [eax + 4]
1008e472  8945ac                         mov dword ptr [ebp - 0x54], eax
1008e475  eb02                           jmp 0x1008e479
1008e477  33c9                           xor ecx, ecx
1008e479  3bd9                           cmp ebx, ecx
1008e47b  8d4724                         lea eax, [edi + 0x24]
1008e47e  50                             push eax
1008e47f  0f4fcb                         cmovg ecx, ebx
1008e482  33f6                           xor esi, esi
1008e484  894da4                         mov dword ptr [ebp - 0x5c], ecx
1008e487  33db                           xor ebx, ebx
1008e489  8d4dd8                         lea ecx, [ebp - 0x28]
1008e48c  e86f58fbff                     call 0x10043d00
1008e491  8b45bc                         mov eax, dword ptr [ebp - 0x44]
1008e494  c745fc01000000                 mov dword ptr [ebp - 4], 1
1008e49b  8b4dec                         mov ecx, dword ptr [ebp - 0x14]
1008e49e  83f908                         cmp ecx, 8
1008e4a1  8b55d8                         mov edx, dword ptr [ebp - 0x28]
1008e4a4  8b8048080000                   mov eax, dword ptr [eax + 0x848]
1008e4aa  8945bc                         mov dword ptr [ebp - 0x44], eax
1008e4ad  8d45d8                         lea eax, [ebp - 0x28]
1008e4b0  0f43c2                         cmovae eax, edx
1008e4b3  837de804                       cmp dword ptr [ebp - 0x18], 4
1008e4b7  7529                           jne 0x1008e4e2
1008e4b9  b9d4f20b10                     mov ecx, 0x100bf2d4
1008e4be  8d5604                         lea edx, [esi + 4]
1008e4c1  2bc1                           sub eax, ecx
1008e4c3  8945b8                         mov dword ptr [ebp - 0x48], eax
1008e4c6  668b0408                       mov ax, word ptr [eax + ecx]
1008e4ca  663b01                         cmp ax, word ptr [ecx]
1008e4cd  750d                           jne 0x1008e4dc
1008e4cf  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008e4d2  83c102                         add ecx, 2
1008e4d5  83ea01                         sub edx, 1
1008e4d8  75ec                           jne 0x1008e4c6
1008e4da  eb38                           jmp 0x1008e514
1008e4dc  8b4dec                         mov ecx, dword ptr [ebp - 0x14]
1008e4df  8b55d8                         mov edx, dword ptr [ebp - 0x28]
1008e4e2  83f908                         cmp ecx, 8
1008e4e5  8d45d8                         lea eax, [ebp - 0x28]
1008e4e8  0f43c2                         cmovae eax, edx
1008e4eb  837de804                       cmp dword ptr [ebp - 0x18], 4
1008e4ef  7566                           jne 0x1008e557
1008e4f1  b9e0f20b10                     mov ecx, 0x100bf2e0
1008e4f6  ba04000000                     mov edx, 4
1008e4fb  2bc1                           sub eax, ecx
1008e4fd  8945b8                         mov dword ptr [ebp - 0x48], eax
1008e500  668b0408                       mov ax, word ptr [eax + ecx]
1008e504  663b01                         cmp ax, word ptr [ecx]
1008e507  754e                           jne 0x1008e557
1008e509  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008e50c  83c102                         add ecx, 2
1008e50f  83ea01                         sub edx, 1
1008e512  75ec                           jne 0x1008e500
1008e514  8b4764                         mov eax, dword ptr [edi + 0x64]
1008e517  85c0                           test eax, eax
1008e519  7469                           je 0x1008e584
1008e51b  8bd8                           mov ebx, eax
1008e51d  837b047a                       cmp dword ptr [ebx + 4], 0x7a
1008e521  7518                           jne 0x1008e53b
1008e523  8b45bc                         mov eax, dword ptr [ebp - 0x44]
1008e526  99                             cdq 
1008e527  2bc2                           sub eax, edx
1008e529  8bf0                           mov esi, eax
1008e52b  8b45bc                         mov eax, dword ptr [ebp - 0x44]
1008e52e  99                             cdq 
1008e52f  2bc2                           sub eax, edx
1008e531  d1fe                           sar esi, 1
1008e533  d1f8                           sar eax, 1
1008e535  8bd8                           mov ebx, eax
1008e537  f7db                           neg ebx
1008e539  eb49                           jmp 0x1008e584
1008e53b  8b03                           mov eax, dword ptr [ebx]
1008e53d  8d4db4                         lea ecx, [ebp - 0x4c]
1008e540  6a01                           push 1
1008e542  51                             push ecx
1008e543  8bcb                           mov ecx, ebx
1008e545  ff5008                         call dword ptr [eax + 8]
1008e548  8b735c                         mov esi, dword ptr [ebx + 0x5c]
1008e54b  c7434401000000                 mov dword ptr [ebx + 0x44], 1
1008e552  8b5b54                         mov ebx, dword ptr [ebx + 0x54]
1008e555  eb2b                           jmp 0x1008e582
1008e557  8b4f60                         mov ecx, dword ptr [edi + 0x60]
1008e55a  85c9                           test ecx, ecx
1008e55c  7426                           je 0x1008e584
1008e55e  83796000                       cmp dword ptr [ecx + 0x60], 0
1008e562  7518                           jne 0x1008e57c
1008e564  8b45bc                         mov eax, dword ptr [ebp - 0x44]
1008e567  99                             cdq 
1008e568  2bc2                           sub eax, edx
1008e56a  8bf0                           mov esi, eax
1008e56c  8b45bc                         mov eax, dword ptr [ebp - 0x44]
1008e56f  99                             cdq 
1008e570  2bc2                           sub eax, edx
1008e572  d1fe                           sar esi, 1
1008e574  d1f8                           sar eax, 1
1008e576  8bd8                           mov ebx, eax
1008e578  f7db                           neg ebx
1008e57a  eb08                           jmp 0x1008e584
1008e57c  8b715c                         mov esi, dword ptr [ecx + 0x5c]
1008e57f  8b5954                         mov ebx, dword ptr [ecx + 0x54]
1008e582  03f3                           add esi, ebx
1008e584  6a64                           push 0x64
1008e586  6a14                           push 0x14
1008e588  ff75bc                         push dword ptr [ebp - 0x44]
1008e58b  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008e591  6a64                           push 0x64
1008e593  6a19                           push 0x19
1008e595  ff75bc                         push dword ptr [ebp - 0x44]
1008e598  8bce                           mov ecx, esi
1008e59a  2bc8                           sub ecx, eax
1008e59c  898f80000000                   mov dword ptr [edi + 0x80], ecx
1008e5a2  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008e5a8  8b4f78                         mov ecx, dword ptr [edi + 0x78]
1008e5ab  03c3                           add eax, ebx
1008e5ad  8b9780000000                   mov edx, dword ptr [edi + 0x80]
1008e5b3  898784000000                   mov dword ptr [edi + 0x84], eax
1008e5b9  8b4954                         mov ecx, dword ptr [ecx + 0x54]
1008e5bc  03ca                           add ecx, edx
1008e5be  894db8                         mov dword ptr [ebp - 0x48], ecx
1008e5c1  8b4f7c                         mov ecx, dword ptr [edi + 0x7c]
1008e5c4  8b4954                         mov ecx, dword ptr [ecx + 0x54]
1008e5c7  03c8                           add ecx, eax
1008e5c9  014dac                         add dword ptr [ebp - 0x54], ecx
1008e5cc  8bc8                           mov ecx, eax
1008e5ce  83bf8c00000000                 cmp dword ptr [edi + 0x8c], 0
1008e5d5  740f                           je 0x1008e5e6
1008e5d7  837dac00                       cmp dword ptr [ebp - 0x54], 0
1008e5db  7e09                           jle 0x1008e5e6
1008e5dd  2b4dac                         sub ecx, dword ptr [ebp - 0x54]
1008e5e0  898f84000000                   mov dword ptr [edi + 0x84], ecx
1008e5e6  83bf8800000000                 cmp dword ptr [edi + 0x88], 0
1008e5ed  8bc2                           mov eax, edx
1008e5ef  740f                           je 0x1008e600
1008e5f1  837db800                       cmp dword ptr [ebp - 0x48], 0
1008e5f5  7d09                           jge 0x1008e600
1008e5f7  2b45b8                         sub eax, dword ptr [ebp - 0x48]
1008e5fa  898780000000                   mov dword ptr [edi + 0x80], eax
1008e600  83bf8c00000000                 cmp dword ptr [edi + 0x8c], 0
1008e607  7408                           je 0x1008e611
1008e609  8b5f7c                         mov ebx, dword ptr [edi + 0x7c]
1008e60c  8b5b54                         mov ebx, dword ptr [ebx + 0x54]
1008e60f  03d9                           add ebx, ecx
1008e611  83bf8800000000                 cmp dword ptr [edi + 0x88], 0
1008e618  740b                           je 0x1008e625
1008e61a  8b7778                         mov esi, dword ptr [edi + 0x78]
1008e61d  8b7654                         mov esi, dword ptr [esi + 0x54]
1008e620  03f0                           add esi, eax
1008e622  0375a8                         add esi, dword ptr [ebp - 0x58]
1008e625  8b45a4                         mov eax, dword ptr [ebp - 0x5c]
1008e628  8d4dd8                         lea ecx, [ebp - 0x28]
1008e62b  0345b0                         add eax, dword ptr [ebp - 0x50]
1008e62e  2bf3                           sub esi, ebx
1008e630  895f54                         mov dword ptr [edi + 0x54], ebx
1008e633  894758                         mov dword ptr [edi + 0x58], eax
1008e636  89775c                         mov dword ptr [edi + 0x5c], esi
1008e639  8b7d9c                         mov edi, dword ptr [ebp - 0x64]
1008e63c  8907                           mov dword ptr [edi], eax
1008e63e  897704                         mov dword ptr [edi + 4], esi
1008e641  e8ca75f7ff                     call 0x10005c10
1008e646  8bc7                           mov eax, edi
1008e648  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1008e64b  64890d00000000                 mov dword ptr fs:[0], ecx
1008e652  59                             pop ecx
1008e653  5f                             pop edi
1008e654  5e                             pop esi
1008e655  5b                             pop ebx
1008e656  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1008e659  33cd                           xor ecx, ebp
1008e65b  e8f7420100                     call 0x100a2957
1008e660  8be5                           mov esp, ebp
1008e662  5d                             pop ebp
1008e663  c20800                         ret 8
1008e666  cc                             int3 
1008e667  cc                             int3 
1008e668  cc                             int3 
1008e669  cc                             int3 
1008e66a  cc                             int3 
1008e66b  cc                             int3 
1008e66c  cc                             int3 
1008e66d  cc                             int3 
1008e66e  cc                             int3 
1008e66f  cc                             int3 
