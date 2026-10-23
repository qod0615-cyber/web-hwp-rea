; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008dfd0 <= VA < 0x1008e270 (next decompiler entry; may include padding/thunks)
1008dfd0  55                             push ebp
1008dfd1  8bec                           mov ebp, esp
1008dfd3  6aff                           push -1
1008dfd5  6868c60a10                     push 0x100ac668
1008dfda  64a100000000                   mov eax, dword ptr fs:[0]
1008dfe0  50                             push eax
1008dfe1  83ec7c                         sub esp, 0x7c
1008dfe4  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008dfe9  33c5                           xor eax, ebp
1008dfeb  8945f0                         mov dword ptr [ebp - 0x10], eax
1008dfee  53                             push ebx
1008dfef  56                             push esi
1008dff0  57                             push edi
1008dff1  50                             push eax
1008dff2  8d45f4                         lea eax, [ebp - 0xc]
1008dff5  64a300000000                   mov dword ptr fs:[0], eax
1008dffb  8bf1                           mov esi, ecx
1008dffd  8b4508                         mov eax, dword ptr [ebp + 8]
1008e000  33db                           xor ebx, ebx
1008e002  899d7cffffff                   mov dword ptr [ebp - 0x84], ebx
1008e008  8b7e74                         mov edi, dword ptr [esi + 0x74]
1008e00b  894580                         mov dword ptr [ebp - 0x80], eax
1008e00e  399e8c000000                   cmp dword ptr [esi + 0x8c], ebx
1008e014  7460                           je 0x1008e076
1008e016  8b4660                         mov eax, dword ptr [esi + 0x60]
1008e019  8378046f                       cmp dword ptr [eax + 4], 0x6f
1008e01d  7557                           jne 0x1008e076
1008e01f  83c024                         add eax, 0x24
1008e022  8d4dc0                         lea ecx, [ebp - 0x40]
1008e025  50                             push eax
1008e026  e8d55cfbff                     call 0x10043d00
1008e02b  895dfc                         mov dword ptr [ebp - 4], ebx
1008e02e  8d45c0                         lea eax, [ebp - 0x40]
1008e031  837dd408                       cmp dword ptr [ebp - 0x2c], 8
1008e035  bb05000000                     mov ebx, 5
1008e03a  899d7cffffff                   mov dword ptr [ebp - 0x84], ebx
1008e040  0f4345c0                       cmovae eax, dword ptr [ebp - 0x40]
1008e044  66833841                       cmp word ptr [eax], 0x41
1008e048  722c                           jb 0x1008e076
1008e04a  8b4660                         mov eax, dword ptr [esi + 0x60]
1008e04d  8d4dd8                         lea ecx, [ebp - 0x28]
1008e050  83c024                         add eax, 0x24
1008e053  50                             push eax
1008e054  e8a75cfbff                     call 0x10043d00
1008e059  837dec08                       cmp dword ptr [ebp - 0x14], 8
1008e05d  8d45d8                         lea eax, [ebp - 0x28]
1008e060  bb0f000000                     mov ebx, 0xf
1008e065  c7458801000000                 mov dword ptr [ebp - 0x78], 1
1008e06c  0f4345d8                       cmovae eax, dword ptr [ebp - 0x28]
1008e070  6683385a                       cmp word ptr [eax], 0x5a
1008e074  7607                           jbe 0x1008e07d
1008e076  c7458800000000                 mov dword ptr [ebp - 0x78], 0
1008e07d  f6c302                         test bl, 2
1008e080  740b                           je 0x1008e08d
1008e082  8d4dd8                         lea ecx, [ebp - 0x28]
1008e085  83e3fd                         and ebx, 0xfffffffd
1008e088  e8837bf7ff                     call 0x10005c10
1008e08d  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
1008e094  f6c301                         test bl, 1
1008e097  7408                           je 0x1008e0a1
1008e099  8d4dc0                         lea ecx, [ebp - 0x40]
1008e09c  e86f7bf7ff                     call 0x10005c10
1008e0a1  837d8800                       cmp dword ptr [ebp - 0x78], 0
1008e0a5  7415                           je 0x1008e0bc
1008e0a7  6a64                           push 0x64
1008e0a9  6a0f                           push 0xf
1008e0ab  ffb748080000                   push dword ptr [edi + 0x848]
1008e0b1  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008e0b7  894588                         mov dword ptr [ebp - 0x78], eax
1008e0ba  eb07                           jmp 0x1008e0c3
1008e0bc  c7458800000000                 mov dword ptr [ebp - 0x78], 0
1008e0c3  8b16                           mov edx, dword ptr [esi]
1008e0c5  8b4210                         mov eax, dword ptr [edx + 0x10]
1008e0c8  81fad8f70b10                   cmp edx, 0x100bf7d8
1008e0ce  0f857a010000                   jne 0x1008e24e
1008e0d4  8b4668                         mov eax, dword ptr [esi + 0x68]
1008e0d7  8b9880000000                   mov ebx, dword ptr [eax + 0x80]
1008e0dd  035e50                         add ebx, dword ptr [esi + 0x50]
1008e0e0  81fad8f70b10                   cmp edx, 0x100bf7d8
1008e0e6  0f856d010000                   jne 0x1008e259
1008e0ec  8b4668                         mov eax, dword ptr [esi + 0x68]
1008e0ef  83bf6c08000008                 cmp dword ptr [edi + 0x86c], 8
1008e0f6  8b407c                         mov eax, dword ptr [eax + 0x7c]
1008e0f9  89857cffffff                   mov dword ptr [ebp - 0x84], eax
1008e0ff  8d8758080000                   lea eax, [edi + 0x858]
1008e105  7202                           jb 0x1008e109
1008e107  8b00                           mov eax, dword ptr [eax]
1008e109  50                             push eax
1008e10a  ff7608                         push dword ptr [esi + 8]
1008e10d  8bcf                           mov ecx, edi
1008e10f  e84c64ffff                     call 0x10084560
1008e114  83be8800000000                 cmp dword ptr [esi + 0x88], 0
1008e11b  7426                           je 0x1008e143
1008e11d  8b4678                         mov eax, dword ptr [esi + 0x78]
1008e120  ff7580                         push dword ptr [ebp - 0x80]
1008e123  899880000000                   mov dword ptr [eax + 0x80], ebx
1008e129  8b4678                         mov eax, dword ptr [esi + 0x78]
1008e12c  8b8e80000000                   mov ecx, dword ptr [esi + 0x80]
1008e132  038d7cffffff                   add ecx, dword ptr [ebp - 0x84]
1008e138  89487c                         mov dword ptr [eax + 0x7c], ecx
1008e13b  8b4e78                         mov ecx, dword ptr [esi + 0x78]
1008e13e  8b01                           mov eax, dword ptr [ecx]
1008e140  ff5004                         call dword ptr [eax + 4]
1008e143  83be8c00000000                 cmp dword ptr [esi + 0x8c], 0
1008e14a  742b                           je 0x1008e177
1008e14c  8b4e7c                         mov ecx, dword ptr [esi + 0x7c]
1008e14f  8b4588                         mov eax, dword ptr [ebp - 0x78]
1008e152  ff7580                         push dword ptr [ebp - 0x80]
1008e155  03c3                           add eax, ebx
1008e157  898180000000                   mov dword ptr [ecx + 0x80], eax
1008e15d  8b467c                         mov eax, dword ptr [esi + 0x7c]
1008e160  8b8e84000000                   mov ecx, dword ptr [esi + 0x84]
1008e166  038d7cffffff                   add ecx, dword ptr [ebp - 0x84]
1008e16c  89487c                         mov dword ptr [eax + 0x7c], ecx
1008e16f  8b4e7c                         mov ecx, dword ptr [esi + 0x7c]
1008e172  8b01                           mov eax, dword ptr [ecx]
1008e174  ff5004                         call dword ptr [eax + 4]
1008e177  8b06                           mov eax, dword ptr [esi]
1008e179  8b5010                         mov edx, dword ptr [eax + 0x10]
1008e17c  3dd8f70b10                     cmp eax, 0x100bf7d8
1008e181  0f85dc000000                   jne 0x1008e263
1008e187  8b4668                         mov eax, dword ptr [esi + 0x68]
1008e18a  8b407c                         mov eax, dword ptr [eax + 0x7c]
1008e18d  034654                         add eax, dword ptr [esi + 0x54]
1008e190  895e48                         mov dword ptr [esi + 0x48], ebx
1008e193  89464c                         mov dword ptr [esi + 0x4c], eax
1008e196  397580                         cmp dword ptr [ebp - 0x80], esi
1008e199  0f8591000000                   jne 0x1008e230
1008e19f  83bf8008000001                 cmp dword ptr [edi + 0x880], 1
1008e1a6  8bc3                           mov eax, ebx
1008e1a8  8b5e4c                         mov ebx, dword ptr [esi + 0x4c]
1008e1ab  89857cffffff                   mov dword ptr [ebp - 0x84], eax
1008e1b1  8bc3                           mov eax, ebx
1008e1b3  894588                         mov dword ptr [ebp - 0x78], eax
1008e1b6  8b4658                         mov eax, dword ptr [esi + 0x58]
1008e1b9  8b765c                         mov esi, dword ptr [esi + 0x5c]
1008e1bc  894588                         mov dword ptr [ebp - 0x78], eax
1008e1bf  746f                           je 0x1008e230
1008e1c1  833f00                         cmp dword ptr [edi], 0
1008e1c4  746a                           je 0x1008e230
1008e1c6  8d4d8c                         lea ecx, [ebp - 0x74]
1008e1c9  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008e1cf  6a01                           push 1
1008e1d1  8d4d8c                         lea ecx, [ebp - 0x74]
1008e1d4  c745fc01000000                 mov dword ptr [ebp - 4], 1
1008e1db  ff1550ff0d10                   call dword ptr [0x100dff50]
1008e1e1  6a01                           push 1
1008e1e3  8d4d8c                         lea ecx, [ebp - 0x74]
1008e1e6  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008e1ec  68ff000000                     push 0xff
1008e1f1  8d4d8c                         lea ecx, [ebp - 0x74]
1008e1f4  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008e1fa  8b0f                           mov ecx, dword ptr [edi]
1008e1fc  8d458c                         lea eax, [ebp - 0x74]
1008e1ff  50                             push eax
1008e200  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008e206  8b857cffffff                   mov eax, dword ptr [ebp - 0x84]
1008e20c  8d4d8c                         lea ecx, [ebp - 0x74]
1008e20f  898770080000                   mov dword ptr [edi + 0x870], eax
1008e215  8b4588                         mov eax, dword ptr [ebp - 0x78]
1008e218  899f74080000                   mov dword ptr [edi + 0x874], ebx
1008e21e  89b77c080000                   mov dword ptr [edi + 0x87c], esi
1008e224  898778080000                   mov dword ptr [edi + 0x878], eax
1008e22a  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1008e230  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1008e233  64890d00000000                 mov dword ptr fs:[0], ecx
1008e23a  59                             pop ecx
1008e23b  5f                             pop edi
1008e23c  5e                             pop esi
1008e23d  5b                             pop ebx
1008e23e  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1008e241  33cd                           xor ecx, ebp
1008e243  e80f470100                     call 0x100a2957
1008e248  8be5                           mov esp, ebp
1008e24a  5d                             pop ebp
1008e24b  c20400                         ret 4
1008e24e  8bce                           mov ecx, esi
1008e250  ffd0                           call eax
1008e252  8b16                           mov edx, dword ptr [esi]
1008e254  e97efeffff                     jmp 0x1008e0d7
1008e259  8bce                           mov ecx, esi
1008e25b  ff5210                         call dword ptr [edx + 0x10]
1008e25e  e98cfeffff                     jmp 0x1008e0ef
1008e263  8bce                           mov ecx, esi
1008e265  ffd2                           call edx
1008e267  e91effffff                     jmp 0x1008e18a
1008e26c  cc                             int3 
1008e26d  cc                             int3 
1008e26e  cc                             int3 
1008e26f  cc                             int3 
