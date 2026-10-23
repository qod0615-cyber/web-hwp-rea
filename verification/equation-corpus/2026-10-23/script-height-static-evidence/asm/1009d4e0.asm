; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009d4e0 <= VA < 0x1009d730 (next decompiler entry; may include padding/thunks)
1009d4e0  55                             push ebp
1009d4e1  8bec                           mov ebp, esp
1009d4e3  6aff                           push -1
1009d4e5  68c9c40a10                     push 0x100ac4c9
1009d4ea  64a100000000                   mov eax, dword ptr fs:[0]
1009d4f0  50                             push eax
1009d4f1  83ec4c                         sub esp, 0x4c
1009d4f4  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009d4f9  33c5                           xor eax, ebp
1009d4fb  8945f0                         mov dword ptr [ebp - 0x10], eax
1009d4fe  53                             push ebx
1009d4ff  56                             push esi
1009d500  57                             push edi
1009d501  50                             push eax
1009d502  8d45f4                         lea eax, [ebp - 0xc]
1009d505  64a300000000                   mov dword ptr fs:[0], eax
1009d50b  8bd9                           mov ebx, ecx
1009d50d  895db4                         mov dword ptr [ebp - 0x4c], ebx
1009d510  8b4508                         mov eax, dword ptr [ebp + 8]
1009d513  8945b0                         mov dword ptr [ebp - 0x50], eax
1009d516  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009d519  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
1009d51f  8b4864                         mov ecx, dword ptr [eax + 0x64]
1009d522  8379046f                       cmp dword ptr [ecx + 4], 0x6f
1009d526  7523                           jne 0x1009d54b
1009d528  b800200000                     mov eax, 0x2000
1009d52d  6603819c000000                 add ax, word ptr [ecx + 0x9c]
1009d534  6683f819                       cmp ax, 0x19
1009d538  7711                           ja 0x1009d54b
1009d53a  8b4174                         mov eax, dword ptr [ecx + 0x74]
1009d53d  6683600e01                     and word ptr [eax + 0xe], 1
1009d542  7407                           je 0x1009d54b
1009d544  bf01000000                     mov edi, 1
1009d549  eb02                           jmp 0x1009d54d
1009d54b  33ff                           xor edi, edi
1009d54d  8b4374                         mov eax, dword ptr [ebx + 0x74]
1009d550  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009d553  8945b8                         mov dword ptr [ebp - 0x48], eax
1009d556  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009d559  99                             cdq 
1009d55a  2bc2                           sub eax, edx
1009d55c  894dac                         mov dword ptr [ebp - 0x54], ecx
1009d55f  8bf0                           mov esi, eax
1009d561  b9f6ffffff                     mov ecx, 0xfffffff6
1009d566  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009d569  d1fe                           sar esi, 1
1009d56b  037350                         add esi, dword ptr [ebx + 0x50]
1009d56e  03b080000000                   add esi, dword ptr [eax + 0x80]
1009d574  85ff                           test edi, edi
1009d576  b80a000000                     mov eax, 0xa
1009d57b  0f45c8                         cmovne ecx, eax
1009d57e  8b4308                         mov eax, dword ptr [ebx + 8]
1009d581  99                             cdq 
1009d582  f7f9                           idiv ecx
1009d584  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009d587  8bf8                           mov edi, eax
1009d589  8b8380000000                   mov eax, dword ptr [ebx + 0x80]
1009d58f  99                             cdq 
1009d590  2bc2                           sub eax, edx
1009d592  d1f8                           sar eax, 1
1009d594  2bf8                           sub edi, eax
1009d596  03fe                           add edi, esi
1009d598  e843dbffff                     call 0x1009b0e0
1009d59d  85c0                           test eax, eax
1009d59f  7404                           je 0x1009d5a5
1009d5a1  33c0                           xor eax, eax
1009d5a3  eb0b                           jmp 0x1009d5b0
1009d5a5  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
1009d5ab  99                             cdq 
1009d5ac  2bc2                           sub eax, edx
1009d5ae  d1f8                           sar eax, 1
1009d5b0  8b7354                         mov esi, dword ptr [ebx + 0x54]
1009d5b3  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
1009d5b6  2bf0                           sub esi, eax
1009d5b8  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009d5bb  03707c                         add esi, dword ptr [eax + 0x7c]
1009d5be  8d8158080000                   lea eax, [ecx + 0x858]
1009d5c4  83781408                       cmp dword ptr [eax + 0x14], 8
1009d5c8  7202                           jb 0x1009d5cc
1009d5ca  8b00                           mov eax, dword ptr [eax]
1009d5cc  50                             push eax
1009d5cd  ff7308                         push dword ptr [ebx + 8]
1009d5d0  e88b6ffeff                     call 0x10084560
1009d5d5  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
1009d5d8  685fe00000                     push 0xe05f
1009d5dd  56                             push esi
1009d5de  57                             push edi
1009d5df  e84c73feff                     call 0x10084930
1009d5e4  8b7368                         mov esi, dword ptr [ebx + 0x68]
1009d5e7  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009d5ea  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009d5ed  99                             cdq 
1009d5ee  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009d5f4  2bc2                           sub eax, edx
1009d5f6  037b50                         add edi, dword ptr [ebx + 0x50]
1009d5f9  8bd8                           mov ebx, eax
1009d5fb  d1fb                           sar ebx, 1
1009d5fd  03df                           add ebx, edi
1009d5ff  897db8                         mov dword ptr [ebp - 0x48], edi
1009d602  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009d605  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1009d608  894dac                         mov dword ptr [ebp - 0x54], ecx
1009d60b  8b7678                         mov esi, dword ptr [esi + 0x78]
1009d60e  8b4658                         mov eax, dword ptr [esi + 0x58]
1009d611  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009d614  99                             cdq 
1009d615  2bc2                           sub eax, edx
1009d617  894dac                         mov dword ptr [ebp - 0x54], ecx
1009d61a  d1f8                           sar eax, 1
1009d61c  2bd8                           sub ebx, eax
1009d61e  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009d624  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1009d627  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009d62a  89787c                         mov dword ptr [eax + 0x7c], edi
1009d62d  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009d630  8b7db0                         mov edi, dword ptr [ebp - 0x50]
1009d633  57                             push edi
1009d634  8b01                           mov eax, dword ptr [ecx]
1009d636  ff5004                         call dword ptr [eax + 4]
1009d639  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009d63c  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009d643  8d8658080000                   lea eax, [esi + 0x858]
1009d649  7202                           jb 0x1009d64d
1009d64b  8b00                           mov eax, dword ptr [eax]
1009d64d  50                             push eax
1009d64e  ff7308                         push dword ptr [ebx + 8]
1009d651  8bce                           mov ecx, esi
1009d653  e8086ffeff                     call 0x10084560
1009d658  3bfb                           cmp edi, ebx
1009d65a  0f8597000000                   jne 0x1009d6f7
1009d660  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009d663  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009d666  8955ac                         mov dword ptr [ebp - 0x54], edx
1009d669  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009d66c  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009d66f  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009d672  03c1                           add eax, ecx
1009d674  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009d677  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009d67e  8945b0                         mov dword ptr [ebp - 0x50], eax
1009d681  7474                           je 0x1009d6f7
1009d683  833e00                         cmp dword ptr [esi], 0
1009d686  746f                           je 0x1009d6f7
1009d688  8d4dbc                         lea ecx, [ebp - 0x44]
1009d68b  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009d691  6a01                           push 1
1009d693  8d4dbc                         lea ecx, [ebp - 0x44]
1009d696  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009d69d  ff1550ff0d10                   call dword ptr [0x100dff50]
1009d6a3  6a01                           push 1
1009d6a5  8d4dbc                         lea ecx, [ebp - 0x44]
1009d6a8  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009d6ae  68ff000000                     push 0xff
1009d6b3  8d4dbc                         lea ecx, [ebp - 0x44]
1009d6b6  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009d6bc  8b0e                           mov ecx, dword ptr [esi]
1009d6be  8d45bc                         lea eax, [ebp - 0x44]
1009d6c1  50                             push eax
1009d6c2  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009d6c8  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009d6cb  8d4dbc                         lea ecx, [ebp - 0x44]
1009d6ce  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009d6d1  898674080000                   mov dword ptr [esi + 0x874], eax
1009d6d7  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009d6da  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009d6e0  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1009d6e3  89be70080000                   mov dword ptr [esi + 0x870], edi
1009d6e9  898678080000                   mov dword ptr [esi + 0x878], eax
1009d6ef  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009d6f5  eb03                           jmp 0x1009d6fa
1009d6f7  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009d6fa  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009d6fd  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009d700  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009d703  03c1                           add eax, ecx
1009d705  897b48                         mov dword ptr [ebx + 0x48], edi
1009d708  89434c                         mov dword ptr [ebx + 0x4c], eax
1009d70b  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009d70e  64890d00000000                 mov dword ptr fs:[0], ecx
1009d715  59                             pop ecx
1009d716  5f                             pop edi
1009d717  5e                             pop esi
1009d718  5b                             pop ebx
1009d719  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009d71c  33cd                           xor ecx, ebp
1009d71e  e834520000                     call 0x100a2957
1009d723  8be5                           mov esp, ebp
1009d725  5d                             pop ebp
1009d726  c20400                         ret 4
1009d729  cc                             int3 
1009d72a  cc                             int3 
1009d72b  cc                             int3 
1009d72c  cc                             int3 
1009d72d  cc                             int3 
1009d72e  cc                             int3 
1009d72f  cc                             int3 
