; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009d050 <= VA < 0x1009d2a0 (next decompiler entry; may include padding/thunks)
1009d050  55                             push ebp
1009d051  8bec                           mov ebp, esp
1009d053  6aff                           push -1
1009d055  68c9c40a10                     push 0x100ac4c9
1009d05a  64a100000000                   mov eax, dword ptr fs:[0]
1009d060  50                             push eax
1009d061  83ec4c                         sub esp, 0x4c
1009d064  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009d069  33c5                           xor eax, ebp
1009d06b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009d06e  53                             push ebx
1009d06f  56                             push esi
1009d070  57                             push edi
1009d071  50                             push eax
1009d072  8d45f4                         lea eax, [ebp - 0xc]
1009d075  64a300000000                   mov dword ptr fs:[0], eax
1009d07b  8bd9                           mov ebx, ecx
1009d07d  895db4                         mov dword ptr [ebp - 0x4c], ebx
1009d080  8b4508                         mov eax, dword ptr [ebp + 8]
1009d083  8945b0                         mov dword ptr [ebp - 0x50], eax
1009d086  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009d089  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
1009d08f  8b4864                         mov ecx, dword ptr [eax + 0x64]
1009d092  8379046f                       cmp dword ptr [ecx + 4], 0x6f
1009d096  7523                           jne 0x1009d0bb
1009d098  b800200000                     mov eax, 0x2000
1009d09d  6603819c000000                 add ax, word ptr [ecx + 0x9c]
1009d0a4  6683f819                       cmp ax, 0x19
1009d0a8  7711                           ja 0x1009d0bb
1009d0aa  8b4174                         mov eax, dword ptr [ecx + 0x74]
1009d0ad  6683600e01                     and word ptr [eax + 0xe], 1
1009d0b2  7407                           je 0x1009d0bb
1009d0b4  bf01000000                     mov edi, 1
1009d0b9  eb02                           jmp 0x1009d0bd
1009d0bb  33ff                           xor edi, edi
1009d0bd  8b4374                         mov eax, dword ptr [ebx + 0x74]
1009d0c0  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009d0c3  8945b8                         mov dword ptr [ebp - 0x48], eax
1009d0c6  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009d0c9  99                             cdq 
1009d0ca  2bc2                           sub eax, edx
1009d0cc  894dac                         mov dword ptr [ebp - 0x54], ecx
1009d0cf  8bf0                           mov esi, eax
1009d0d1  b928000000                     mov ecx, 0x28
1009d0d6  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009d0d9  d1fe                           sar esi, 1
1009d0db  037350                         add esi, dword ptr [ebx + 0x50]
1009d0de  03b080000000                   add esi, dword ptr [eax + 0x80]
1009d0e4  85ff                           test edi, edi
1009d0e6  b809000000                     mov eax, 9
1009d0eb  0f45c8                         cmovne ecx, eax
1009d0ee  8b4308                         mov eax, dword ptr [ebx + 8]
1009d0f1  99                             cdq 
1009d0f2  f7f9                           idiv ecx
1009d0f4  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009d0f7  8bf8                           mov edi, eax
1009d0f9  8b8380000000                   mov eax, dword ptr [ebx + 0x80]
1009d0ff  99                             cdq 
1009d100  2bc2                           sub eax, edx
1009d102  d1f8                           sar eax, 1
1009d104  2bf8                           sub edi, eax
1009d106  03fe                           add edi, esi
1009d108  e8d3dfffff                     call 0x1009b0e0
1009d10d  85c0                           test eax, eax
1009d10f  7404                           je 0x1009d115
1009d111  33c0                           xor eax, eax
1009d113  eb0b                           jmp 0x1009d120
1009d115  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
1009d11b  99                             cdq 
1009d11c  2bc2                           sub eax, edx
1009d11e  d1f8                           sar eax, 1
1009d120  8b7354                         mov esi, dword ptr [ebx + 0x54]
1009d123  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
1009d126  2bf0                           sub esi, eax
1009d128  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009d12b  03707c                         add esi, dword ptr [eax + 0x7c]
1009d12e  8d8158080000                   lea eax, [ecx + 0x858]
1009d134  83781408                       cmp dword ptr [eax + 0x14], 8
1009d138  7202                           jb 0x1009d13c
1009d13a  8b00                           mov eax, dword ptr [eax]
1009d13c  50                             push eax
1009d13d  ff7308                         push dword ptr [ebx + 8]
1009d140  e81b74feff                     call 0x10084560
1009d145  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
1009d148  685ee00000                     push 0xe05e
1009d14d  56                             push esi
1009d14e  57                             push edi
1009d14f  e8dc77feff                     call 0x10084930
1009d154  8b7368                         mov esi, dword ptr [ebx + 0x68]
1009d157  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009d15a  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009d15d  99                             cdq 
1009d15e  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009d164  2bc2                           sub eax, edx
1009d166  037b50                         add edi, dword ptr [ebx + 0x50]
1009d169  8bd8                           mov ebx, eax
1009d16b  d1fb                           sar ebx, 1
1009d16d  03df                           add ebx, edi
1009d16f  897db8                         mov dword ptr [ebp - 0x48], edi
1009d172  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009d175  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1009d178  894dac                         mov dword ptr [ebp - 0x54], ecx
1009d17b  8b7678                         mov esi, dword ptr [esi + 0x78]
1009d17e  8b4658                         mov eax, dword ptr [esi + 0x58]
1009d181  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009d184  99                             cdq 
1009d185  2bc2                           sub eax, edx
1009d187  894dac                         mov dword ptr [ebp - 0x54], ecx
1009d18a  d1f8                           sar eax, 1
1009d18c  2bd8                           sub ebx, eax
1009d18e  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009d194  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1009d197  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009d19a  89787c                         mov dword ptr [eax + 0x7c], edi
1009d19d  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009d1a0  8b7db0                         mov edi, dword ptr [ebp - 0x50]
1009d1a3  57                             push edi
1009d1a4  8b01                           mov eax, dword ptr [ecx]
1009d1a6  ff5004                         call dword ptr [eax + 4]
1009d1a9  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009d1ac  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009d1b3  8d8658080000                   lea eax, [esi + 0x858]
1009d1b9  7202                           jb 0x1009d1bd
1009d1bb  8b00                           mov eax, dword ptr [eax]
1009d1bd  50                             push eax
1009d1be  ff7308                         push dword ptr [ebx + 8]
1009d1c1  8bce                           mov ecx, esi
1009d1c3  e89873feff                     call 0x10084560
1009d1c8  3bfb                           cmp edi, ebx
1009d1ca  0f8597000000                   jne 0x1009d267
1009d1d0  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009d1d3  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009d1d6  8955ac                         mov dword ptr [ebp - 0x54], edx
1009d1d9  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009d1dc  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009d1df  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009d1e2  03c1                           add eax, ecx
1009d1e4  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009d1e7  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009d1ee  8945b0                         mov dword ptr [ebp - 0x50], eax
1009d1f1  7474                           je 0x1009d267
1009d1f3  833e00                         cmp dword ptr [esi], 0
1009d1f6  746f                           je 0x1009d267
1009d1f8  8d4dbc                         lea ecx, [ebp - 0x44]
1009d1fb  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009d201  6a01                           push 1
1009d203  8d4dbc                         lea ecx, [ebp - 0x44]
1009d206  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009d20d  ff1550ff0d10                   call dword ptr [0x100dff50]
1009d213  6a01                           push 1
1009d215  8d4dbc                         lea ecx, [ebp - 0x44]
1009d218  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009d21e  68ff000000                     push 0xff
1009d223  8d4dbc                         lea ecx, [ebp - 0x44]
1009d226  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009d22c  8b0e                           mov ecx, dword ptr [esi]
1009d22e  8d45bc                         lea eax, [ebp - 0x44]
1009d231  50                             push eax
1009d232  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009d238  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009d23b  8d4dbc                         lea ecx, [ebp - 0x44]
1009d23e  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009d241  898674080000                   mov dword ptr [esi + 0x874], eax
1009d247  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009d24a  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009d250  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1009d253  89be70080000                   mov dword ptr [esi + 0x870], edi
1009d259  898678080000                   mov dword ptr [esi + 0x878], eax
1009d25f  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009d265  eb03                           jmp 0x1009d26a
1009d267  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009d26a  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009d26d  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009d270  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009d273  03c1                           add eax, ecx
1009d275  897b48                         mov dword ptr [ebx + 0x48], edi
1009d278  89434c                         mov dword ptr [ebx + 0x4c], eax
1009d27b  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009d27e  64890d00000000                 mov dword ptr fs:[0], ecx
1009d285  59                             pop ecx
1009d286  5f                             pop edi
1009d287  5e                             pop esi
1009d288  5b                             pop ebx
1009d289  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009d28c  33cd                           xor ecx, ebp
1009d28e  e8c4560000                     call 0x100a2957
1009d293  8be5                           mov esp, ebp
1009d295  5d                             pop ebp
1009d296  c20400                         ret 4
1009d299  cc                             int3 
1009d29a  cc                             int3 
1009d29b  cc                             int3 
1009d29c  cc                             int3 
1009d29d  cc                             int3 
1009d29e  cc                             int3 
1009d29f  cc                             int3 
