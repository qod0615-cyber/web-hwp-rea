; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009d970 <= VA < 0x1009dbc0 (next decompiler entry; may include padding/thunks)
1009d970  55                             push ebp
1009d971  8bec                           mov ebp, esp
1009d973  6aff                           push -1
1009d975  68c9c40a10                     push 0x100ac4c9
1009d97a  64a100000000                   mov eax, dword ptr fs:[0]
1009d980  50                             push eax
1009d981  83ec4c                         sub esp, 0x4c
1009d984  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009d989  33c5                           xor eax, ebp
1009d98b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009d98e  53                             push ebx
1009d98f  56                             push esi
1009d990  57                             push edi
1009d991  50                             push eax
1009d992  8d45f4                         lea eax, [ebp - 0xc]
1009d995  64a300000000                   mov dword ptr fs:[0], eax
1009d99b  8bd9                           mov ebx, ecx
1009d99d  895db4                         mov dword ptr [ebp - 0x4c], ebx
1009d9a0  8b4508                         mov eax, dword ptr [ebp + 8]
1009d9a3  8945b0                         mov dword ptr [ebp - 0x50], eax
1009d9a6  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009d9a9  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
1009d9af  8b4864                         mov ecx, dword ptr [eax + 0x64]
1009d9b2  8379046f                       cmp dword ptr [ecx + 4], 0x6f
1009d9b6  7523                           jne 0x1009d9db
1009d9b8  b800200000                     mov eax, 0x2000
1009d9bd  6603819c000000                 add ax, word ptr [ecx + 0x9c]
1009d9c4  6683f819                       cmp ax, 0x19
1009d9c8  7711                           ja 0x1009d9db
1009d9ca  8b4174                         mov eax, dword ptr [ecx + 0x74]
1009d9cd  6683600e01                     and word ptr [eax + 0xe], 1
1009d9d2  7407                           je 0x1009d9db
1009d9d4  bf01000000                     mov edi, 1
1009d9d9  eb02                           jmp 0x1009d9dd
1009d9db  33ff                           xor edi, edi
1009d9dd  8b4374                         mov eax, dword ptr [ebx + 0x74]
1009d9e0  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009d9e3  8945b8                         mov dword ptr [ebp - 0x48], eax
1009d9e6  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009d9e9  99                             cdq 
1009d9ea  2bc2                           sub eax, edx
1009d9ec  894dac                         mov dword ptr [ebp - 0x54], ecx
1009d9ef  8bf0                           mov esi, eax
1009d9f1  b9f6ffffff                     mov ecx, 0xfffffff6
1009d9f6  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009d9f9  d1fe                           sar esi, 1
1009d9fb  037350                         add esi, dword ptr [ebx + 0x50]
1009d9fe  03b080000000                   add esi, dword ptr [eax + 0x80]
1009da04  85ff                           test edi, edi
1009da06  b807000000                     mov eax, 7
1009da0b  0f45c8                         cmovne ecx, eax
1009da0e  8b4308                         mov eax, dword ptr [ebx + 8]
1009da11  99                             cdq 
1009da12  f7f9                           idiv ecx
1009da14  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009da17  8bf8                           mov edi, eax
1009da19  8b8380000000                   mov eax, dword ptr [ebx + 0x80]
1009da1f  99                             cdq 
1009da20  2bc2                           sub eax, edx
1009da22  d1f8                           sar eax, 1
1009da24  2bf8                           sub edi, eax
1009da26  03fe                           add edi, esi
1009da28  e8b3d6ffff                     call 0x1009b0e0
1009da2d  85c0                           test eax, eax
1009da2f  7404                           je 0x1009da35
1009da31  33c0                           xor eax, eax
1009da33  eb0b                           jmp 0x1009da40
1009da35  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
1009da3b  99                             cdq 
1009da3c  2bc2                           sub eax, edx
1009da3e  d1f8                           sar eax, 1
1009da40  8b7354                         mov esi, dword ptr [ebx + 0x54]
1009da43  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
1009da46  2bf0                           sub esi, eax
1009da48  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009da4b  03707c                         add esi, dword ptr [eax + 0x7c]
1009da4e  8d8158080000                   lea eax, [ecx + 0x858]
1009da54  83781408                       cmp dword ptr [eax + 0x14], 8
1009da58  7202                           jb 0x1009da5c
1009da5a  8b00                           mov eax, dword ptr [eax]
1009da5c  50                             push eax
1009da5d  ff7308                         push dword ptr [ebx + 8]
1009da60  e8fb6afeff                     call 0x10084560
1009da65  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
1009da68  6860e00000                     push 0xe060
1009da6d  56                             push esi
1009da6e  57                             push edi
1009da6f  e8bc6efeff                     call 0x10084930
1009da74  8b7368                         mov esi, dword ptr [ebx + 0x68]
1009da77  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009da7a  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009da7d  99                             cdq 
1009da7e  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009da84  2bc2                           sub eax, edx
1009da86  037b50                         add edi, dword ptr [ebx + 0x50]
1009da89  8bd8                           mov ebx, eax
1009da8b  d1fb                           sar ebx, 1
1009da8d  03df                           add ebx, edi
1009da8f  897db8                         mov dword ptr [ebp - 0x48], edi
1009da92  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009da95  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1009da98  894dac                         mov dword ptr [ebp - 0x54], ecx
1009da9b  8b7678                         mov esi, dword ptr [esi + 0x78]
1009da9e  8b4658                         mov eax, dword ptr [esi + 0x58]
1009daa1  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009daa4  99                             cdq 
1009daa5  2bc2                           sub eax, edx
1009daa7  894dac                         mov dword ptr [ebp - 0x54], ecx
1009daaa  d1f8                           sar eax, 1
1009daac  2bd8                           sub ebx, eax
1009daae  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009dab4  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1009dab7  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009daba  89787c                         mov dword ptr [eax + 0x7c], edi
1009dabd  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009dac0  8b7db0                         mov edi, dword ptr [ebp - 0x50]
1009dac3  57                             push edi
1009dac4  8b01                           mov eax, dword ptr [ecx]
1009dac6  ff5004                         call dword ptr [eax + 4]
1009dac9  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009dacc  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009dad3  8d8658080000                   lea eax, [esi + 0x858]
1009dad9  7202                           jb 0x1009dadd
1009dadb  8b00                           mov eax, dword ptr [eax]
1009dadd  50                             push eax
1009dade  ff7308                         push dword ptr [ebx + 8]
1009dae1  8bce                           mov ecx, esi
1009dae3  e8786afeff                     call 0x10084560
1009dae8  3bfb                           cmp edi, ebx
1009daea  0f8597000000                   jne 0x1009db87
1009daf0  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009daf3  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009daf6  8955ac                         mov dword ptr [ebp - 0x54], edx
1009daf9  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009dafc  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009daff  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009db02  03c1                           add eax, ecx
1009db04  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009db07  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009db0e  8945b0                         mov dword ptr [ebp - 0x50], eax
1009db11  7474                           je 0x1009db87
1009db13  833e00                         cmp dword ptr [esi], 0
1009db16  746f                           je 0x1009db87
1009db18  8d4dbc                         lea ecx, [ebp - 0x44]
1009db1b  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009db21  6a01                           push 1
1009db23  8d4dbc                         lea ecx, [ebp - 0x44]
1009db26  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009db2d  ff1550ff0d10                   call dword ptr [0x100dff50]
1009db33  6a01                           push 1
1009db35  8d4dbc                         lea ecx, [ebp - 0x44]
1009db38  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009db3e  68ff000000                     push 0xff
1009db43  8d4dbc                         lea ecx, [ebp - 0x44]
1009db46  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009db4c  8b0e                           mov ecx, dword ptr [esi]
1009db4e  8d45bc                         lea eax, [ebp - 0x44]
1009db51  50                             push eax
1009db52  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009db58  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009db5b  8d4dbc                         lea ecx, [ebp - 0x44]
1009db5e  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009db61  898674080000                   mov dword ptr [esi + 0x874], eax
1009db67  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009db6a  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009db70  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1009db73  89be70080000                   mov dword ptr [esi + 0x870], edi
1009db79  898678080000                   mov dword ptr [esi + 0x878], eax
1009db7f  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009db85  eb03                           jmp 0x1009db8a
1009db87  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009db8a  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009db8d  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009db90  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009db93  03c1                           add eax, ecx
1009db95  897b48                         mov dword ptr [ebx + 0x48], edi
1009db98  89434c                         mov dword ptr [ebx + 0x4c], eax
1009db9b  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009db9e  64890d00000000                 mov dword ptr fs:[0], ecx
1009dba5  59                             pop ecx
1009dba6  5f                             pop edi
1009dba7  5e                             pop esi
1009dba8  5b                             pop ebx
1009dba9  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009dbac  33cd                           xor ecx, ebp
1009dbae  e8a44d0000                     call 0x100a2957
1009dbb3  8be5                           mov esp, ebp
1009dbb5  5d                             pop ebp
1009dbb6  c20400                         ret 4
1009dbb9  cc                             int3 
1009dbba  cc                             int3 
1009dbbb  cc                             int3 
1009dbbc  cc                             int3 
1009dbbd  cc                             int3 
1009dbbe  cc                             int3 
1009dbbf  cc                             int3 
