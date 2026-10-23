; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10086e90 <= VA < 0x10087020 (next decompiler entry; may include padding/thunks)
10086e90  55                             push ebp
10086e91  8bec                           mov ebp, esp
10086e93  6aff                           push -1
10086e95  68c8b80a10                     push 0x100ab8c8
10086e9a  64a100000000                   mov eax, dword ptr fs:[0]
10086ea0  50                             push eax
10086ea1  83ec30                         sub esp, 0x30
10086ea4  a10c100d10                     mov eax, dword ptr [0x100d100c]
10086ea9  33c5                           xor eax, ebp
10086eab  8945ec                         mov dword ptr [ebp - 0x14], eax
10086eae  53                             push ebx
10086eaf  56                             push esi
10086eb0  57                             push edi
10086eb1  50                             push eax
10086eb2  8d45f4                         lea eax, [ebp - 0xc]
10086eb5  64a300000000                   mov dword ptr fs:[0], eax
10086ebb  8bf9                           mov edi, ecx
10086ebd  8b7510                         mov esi, dword ptr [ebp + 0x10]
10086ec0  8b5d08                         mov ebx, dword ptr [ebp + 8]
10086ec3  895dd0                         mov dword ptr [ebp - 0x30], ebx
10086ec6  837e1000                       cmp dword ptr [esi + 0x10], 0
10086eca  750e                           jne 0x10086eda
10086ecc  ff750c                         push dword ptr [ebp + 0xc]
10086ecf  53                             push ebx
10086ed0  e83bffffff                     call 0x10086e10
10086ed5  e91f010000                     jmp 0x10086ff9
10086eda  837e1408                       cmp dword ptr [esi + 0x14], 8
10086ede  8bc6                           mov eax, esi
10086ee0  7202                           jb 0x10086ee4
10086ee2  8b06                           mov eax, dword ptr [esi]
10086ee4  8b4d0c                         mov ecx, dword ptr [ebp + 0xc]
10086ee7  50                             push eax
10086ee8  51                             push ecx
10086ee9  8b4f10                         mov ecx, dword ptr [edi + 0x10]
10086eec  e86fd6ffff                     call 0x10084560
10086ef1  8b450c                         mov eax, dword ptr [ebp + 0xc]
10086ef4  394758                         cmp dword ptr [edi + 0x58], eax
10086ef7  7554                           jne 0x10086f4d
10086ef9  837e1408                       cmp dword ptr [esi + 0x14], 8
10086efd  8d5f5c                         lea ebx, [edi + 0x5c]
10086f00  8bce                           mov ecx, esi
10086f02  7202                           jb 0x10086f06
10086f04  8b0e                           mov ecx, dword ptr [esi]
10086f06  837b1408                       cmp dword ptr [ebx + 0x14], 8
10086f0a  7202                           jb 0x10086f0e
10086f0c  8b1b                           mov ebx, dword ptr [ebx]
10086f0e  8b576c                         mov edx, dword ptr [edi + 0x6c]
10086f11  3b5610                         cmp edx, dword ptr [esi + 0x10]
10086f14  7534                           jne 0x10086f4a
10086f16  85d2                           test edx, edx
10086f18  7417                           je 0x10086f31
10086f1a  2bd9                           sub ebx, ecx
10086f1c  0f1f4000                       nop dword ptr [eax]
10086f20  668b040b                       mov ax, word ptr [ebx + ecx]
10086f24  663b01                         cmp ax, word ptr [ecx]
10086f27  751e                           jne 0x10086f47
10086f29  83c102                         add ecx, 2
10086f2c  83ea01                         sub edx, 1
10086f2f  75ef                           jne 0x10086f20
10086f31  8b4f30                         mov ecx, dword ptr [edi + 0x30]
10086f34  8d45c4                         lea eax, [ebp - 0x3c]
10086f37  6a01                           push 1
10086f39  50                             push eax
10086f3a  8b01                           mov eax, dword ptr [ecx]
10086f3c  ff5008                         call dword ptr [eax + 8]
10086f3f  8b5dd0                         mov ebx, dword ptr [ebp - 0x30]
10086f42  e9a8000000                     jmp 0x10086fef
10086f47  8b450c                         mov eax, dword ptr [ebp + 0xc]
10086f4a  8b5dd0                         mov ebx, dword ptr [ebp - 0x30]
10086f4d  8d4f5c                         lea ecx, [edi + 0x5c]
10086f50  894758                         mov dword ptr [edi + 0x58], eax
10086f53  3bce                           cmp ecx, esi
10086f55  7413                           je 0x10086f6a
10086f57  837e1408                       cmp dword ptr [esi + 0x14], 8
10086f5b  8bc6                           mov eax, esi
10086f5d  7202                           jb 0x10086f61
10086f5f  8b06                           mov eax, dword ptr [esi]
10086f61  ff7610                         push dword ptr [esi + 0x10]
10086f64  50                             push eax
10086f65  e866ebf7ff                     call 0x10005ad0
10086f6a  8b4730                         mov eax, dword ptr [edi + 0x30]
10086f6d  8b4d0c                         mov ecx, dword ptr [ebp + 0xc]
10086f70  894808                         mov dword ptr [eax + 8], ecx
10086f73  837e1408                       cmp dword ptr [esi + 0x14], 8
10086f77  7202                           jb 0x10086f7b
10086f79  8b36                           mov esi, dword ptr [esi]
10086f7b  8bce                           mov ecx, esi
10086f7d  c745e400000000                 mov dword ptr [ebp - 0x1c], 0
10086f84  33c0                           xor eax, eax
10086f86  c745e807000000                 mov dword ptr [ebp - 0x18], 7
10086f8d  668945d4                       mov word ptr [ebp - 0x2c], ax
10086f91  8d5102                         lea edx, [ecx + 2]
10086f94  668b01                         mov ax, word ptr [ecx]
10086f97  83c102                         add ecx, 2
10086f9a  6685c0                         test ax, ax
10086f9d  75f5                           jne 0x10086f94
10086f9f  2bca                           sub ecx, edx
10086fa1  d1f9                           sar ecx, 1
10086fa3  51                             push ecx
10086fa4  56                             push esi
10086fa5  8d4dd4                         lea ecx, [ebp - 0x2c]
10086fa8  e823ebf7ff                     call 0x10005ad0
10086fad  c745fc00000000                 mov dword ptr [ebp - 4], 0
10086fb4  8d45d4                         lea eax, [ebp - 0x2c]
10086fb7  8b4f30                         mov ecx, dword ptr [edi + 0x30]
10086fba  83c10c                         add ecx, 0xc
10086fbd  3bc8                           cmp ecx, eax
10086fbf  7411                           je 0x10086fd2
10086fc1  837de808                       cmp dword ptr [ebp - 0x18], 8
10086fc5  ff75e4                         push dword ptr [ebp - 0x1c]
10086fc8  0f4345d4                       cmovae eax, dword ptr [ebp - 0x2c]
10086fcc  50                             push eax
10086fcd  e8feeaf7ff                     call 0x10005ad0
10086fd2  8d4dd4                         lea ecx, [ebp - 0x2c]
10086fd5  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
10086fdc  e82fecf7ff                     call 0x10005c10
10086fe1  8b4f30                         mov ecx, dword ptr [edi + 0x30]
10086fe4  8d45cc                         lea eax, [ebp - 0x34]
10086fe7  6a00                           push 0
10086fe9  50                             push eax
10086fea  8b01                           mov eax, dword ptr [ecx]
10086fec  ff5008                         call dword ptr [eax + 8]
10086fef  8b08                           mov ecx, dword ptr [eax]
10086ff1  890b                           mov dword ptr [ebx], ecx
10086ff3  8b4004                         mov eax, dword ptr [eax + 4]
10086ff6  894304                         mov dword ptr [ebx + 4], eax
10086ff9  8bc3                           mov eax, ebx
10086ffb  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
10086ffe  64890d00000000                 mov dword ptr fs:[0], ecx
10087005  59                             pop ecx
10087006  5f                             pop edi
10087007  5e                             pop esi
10087008  5b                             pop ebx
10087009  8b4dec                         mov ecx, dword ptr [ebp - 0x14]
1008700c  33cd                           xor ecx, ebp
1008700e  e844b90100                     call 0x100a2957
10087013  8be5                           mov esp, ebp
10087015  5d                             pop ebp
10087016  c20c00                         ret 0xc
10087019  cc                             int3 
1008701a  cc                             int3 
1008701b  cc                             int3 
1008701c  cc                             int3 
1008701d  cc                             int3 
1008701e  cc                             int3 
1008701f  cc                             int3 
