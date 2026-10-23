; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100a03d0 <= VA < 0x100a0590 (next decompiler entry; may include padding/thunks)
100a03d0  55                             push ebp
100a03d1  8bec                           mov ebp, esp
100a03d3  6aff                           push -1
100a03d5  6849c40a10                     push 0x100ac449
100a03da  64a100000000                   mov eax, dword ptr fs:[0]
100a03e0  50                             push eax
100a03e1  83ec50                         sub esp, 0x50
100a03e4  a10c100d10                     mov eax, dword ptr [0x100d100c]
100a03e9  33c5                           xor eax, ebp
100a03eb  8945f0                         mov dword ptr [ebp - 0x10], eax
100a03ee  53                             push ebx
100a03ef  56                             push esi
100a03f0  57                             push edi
100a03f1  50                             push eax
100a03f2  8d45f4                         lea eax, [ebp - 0xc]
100a03f5  64a300000000                   mov dword ptr fs:[0], eax
100a03fb  8bd9                           mov ebx, ecx
100a03fd  8b4508                         mov eax, dword ptr [ebp + 8]
100a0400  51                             push ecx
100a0401  8945b4                         mov dword ptr [ebp - 0x4c], eax
100a0404  e887030000                     call 0x100a0790
100a0409  8b7368                         mov esi, dword ptr [ebx + 0x68]
100a040c  8b4350                         mov eax, dword ptr [ebx + 0x50]
100a040f  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
100a0412  894db0                         mov dword ptr [ebp - 0x50], ecx
100a0415  038680000000                   add eax, dword ptr [esi + 0x80]
100a041b  8945b8                         mov dword ptr [ebp - 0x48], eax
100a041e  8b4358                         mov eax, dword ptr [ebx + 0x58]
100a0421  99                             cdq 
100a0422  2bc2                           sub eax, edx
100a0424  8bf8                           mov edi, eax
100a0426  8b467c                         mov eax, dword ptr [esi + 0x7c]
100a0429  8b737c                         mov esi, dword ptr [ebx + 0x7c]
100a042c  8945b0                         mov dword ptr [ebp - 0x50], eax
100a042f  d1ff                           sar edi, 1
100a0431  037db8                         add edi, dword ptr [ebp - 0x48]
100a0434  8b4658                         mov eax, dword ptr [esi + 0x58]
100a0437  8bcf                           mov ecx, edi
100a0439  99                             cdq 
100a043a  2bc2                           sub eax, edx
100a043c  d1f8                           sar eax, 1
100a043e  2bc8                           sub ecx, eax
100a0440  898e80000000                   mov dword ptr [esi + 0x80], ecx
100a0446  8b7378                         mov esi, dword ptr [ebx + 0x78]
100a0449  8b4658                         mov eax, dword ptr [esi + 0x58]
100a044c  99                             cdq 
100a044d  2bc2                           sub eax, edx
100a044f  d1f8                           sar eax, 1
100a0451  2bf8                           sub edi, eax
100a0453  89be80000000                   mov dword ptr [esi + 0x80], edi
100a0459  837b046c                       cmp dword ptr [ebx + 4], 0x6c
100a045d  8b4378                         mov eax, dword ptr [ebx + 0x78]
100a0460  8b75b0                         mov esi, dword ptr [ebp - 0x50]
100a0463  7519                           jne 0x100a047e
100a0465  89707c                         mov dword ptr [eax + 0x7c], esi
100a0468  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
100a046b  8b535c                         mov edx, dword ptr [ebx + 0x5c]
100a046e  2b515c                         sub edx, dword ptr [ecx + 0x5c]
100a0471  2b5154                         sub edx, dword ptr [ecx + 0x54]
100a0474  035354                         add edx, dword ptr [ebx + 0x54]
100a0477  03d6                           add edx, esi
100a0479  89517c                         mov dword ptr [ecx + 0x7c], edx
100a047c  eb11                           jmp 0x100a048f
100a047e  8b4b54                         mov ecx, dword ptr [ebx + 0x54]
100a0481  2b4854                         sub ecx, dword ptr [eax + 0x54]
100a0484  03ce                           add ecx, esi
100a0486  89487c                         mov dword ptr [eax + 0x7c], ecx
100a0489  8b437c                         mov eax, dword ptr [ebx + 0x7c]
100a048c  89707c                         mov dword ptr [eax + 0x7c], esi
100a048f  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
100a0492  8b7db4                         mov edi, dword ptr [ebp - 0x4c]
100a0495  57                             push edi
100a0496  8b01                           mov eax, dword ptr [ecx]
100a0498  ff5004                         call dword ptr [eax + 4]
100a049b  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
100a049e  57                             push edi
100a049f  8b01                           mov eax, dword ptr [ecx]
100a04a1  ff5004                         call dword ptr [eax + 4]
100a04a4  8b7374                         mov esi, dword ptr [ebx + 0x74]
100a04a7  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
100a04ae  8d8658080000                   lea eax, [esi + 0x858]
100a04b4  7202                           jb 0x100a04b8
100a04b6  8b00                           mov eax, dword ptr [eax]
100a04b8  50                             push eax
100a04b9  ff7308                         push dword ptr [ebx + 8]
100a04bc  8bce                           mov ecx, esi
100a04be  e89d40feff                     call 0x10084560
100a04c3  3bfb                           cmp edi, ebx
100a04c5  0f858f000000                   jne 0x100a055a
100a04cb  8b4368                         mov eax, dword ptr [ebx + 0x68]
100a04ce  8b535c                         mov edx, dword ptr [ebx + 0x5c]
100a04d1  8b7b58                         mov edi, dword ptr [ebx + 0x58]
100a04d4  8955b0                         mov dword ptr [ebp - 0x50], edx
100a04d7  8b487c                         mov ecx, dword ptr [eax + 0x7c]
100a04da  8b4354                         mov eax, dword ptr [ebx + 0x54]
100a04dd  03c1                           add eax, ecx
100a04df  83be8008000001                 cmp dword ptr [esi + 0x880], 1
100a04e6  8945b4                         mov dword ptr [ebp - 0x4c], eax
100a04e9  746f                           je 0x100a055a
100a04eb  833e00                         cmp dword ptr [esi], 0
100a04ee  746a                           je 0x100a055a
100a04f0  8d4dbc                         lea ecx, [ebp - 0x44]
100a04f3  ff15f0fe0d10                   call dword ptr [0x100dfef0]
100a04f9  6a01                           push 1
100a04fb  8d4dbc                         lea ecx, [ebp - 0x44]
100a04fe  c745fc00000000                 mov dword ptr [ebp - 4], 0
100a0505  ff1550ff0d10                   call dword ptr [0x100dff50]
100a050b  6a01                           push 1
100a050d  8d4dbc                         lea ecx, [ebp - 0x44]
100a0510  ff1514fe0d10                   call dword ptr [0x100dfe14]
100a0516  68ff000000                     push 0xff
100a051b  8d4dbc                         lea ecx, [ebp - 0x44]
100a051e  ff1510fe0d10                   call dword ptr [0x100dfe10]
100a0524  8b0e                           mov ecx, dword ptr [esi]
100a0526  8d45bc                         lea eax, [ebp - 0x44]
100a0529  50                             push eax
100a052a  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
100a0530  8b45b8                         mov eax, dword ptr [ebp - 0x48]
100a0533  8d4dbc                         lea ecx, [ebp - 0x44]
100a0536  898670080000                   mov dword ptr [esi + 0x870], eax
100a053c  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
100a053f  898674080000                   mov dword ptr [esi + 0x874], eax
100a0545  8b45b0                         mov eax, dword ptr [ebp - 0x50]
100a0548  89867c080000                   mov dword ptr [esi + 0x87c], eax
100a054e  89be78080000                   mov dword ptr [esi + 0x878], edi
100a0554  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
100a055a  8b4368                         mov eax, dword ptr [ebx + 0x68]
100a055d  8b487c                         mov ecx, dword ptr [eax + 0x7c]
100a0560  8b45b8                         mov eax, dword ptr [ebp - 0x48]
100a0563  894348                         mov dword ptr [ebx + 0x48], eax
100a0566  8b4354                         mov eax, dword ptr [ebx + 0x54]
100a0569  03c1                           add eax, ecx
100a056b  89434c                         mov dword ptr [ebx + 0x4c], eax
100a056e  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
100a0571  64890d00000000                 mov dword ptr fs:[0], ecx
100a0578  59                             pop ecx
100a0579  5f                             pop edi
100a057a  5e                             pop esi
100a057b  5b                             pop ebx
100a057c  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
100a057f  33cd                           xor ecx, ebp
100a0581  e8d1230000                     call 0x100a2957
100a0586  8be5                           mov esp, ebp
100a0588  5d                             pop ebp
100a0589  c20400                         ret 4
100a058c  cc                             int3 
100a058d  cc                             int3 
100a058e  cc                             int3 
100a058f  cc                             int3 
