; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009e340 <= VA < 0x1009e4d0 (next decompiler entry; may include padding/thunks)
1009e340  55                             push ebp
1009e341  8bec                           mov ebp, esp
1009e343  6aff                           push -1
1009e345  68c9c40a10                     push 0x100ac4c9
1009e34a  64a100000000                   mov eax, dword ptr fs:[0]
1009e350  50                             push eax
1009e351  83ec4c                         sub esp, 0x4c
1009e354  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009e359  33c5                           xor eax, ebp
1009e35b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009e35e  53                             push ebx
1009e35f  56                             push esi
1009e360  57                             push edi
1009e361  50                             push eax
1009e362  8d45f4                         lea eax, [ebp - 0xc]
1009e365  64a300000000                   mov dword ptr fs:[0], eax
1009e36b  8bd9                           mov ebx, ecx
1009e36d  895db4                         mov dword ptr [ebp - 0x4c], ebx
1009e370  8b4508                         mov eax, dword ptr [ebp + 8]
1009e373  51                             push ecx
1009e374  8945b0                         mov dword ptr [ebp - 0x50], eax
1009e377  e894020000                     call 0x1009e610
1009e37c  8b7368                         mov esi, dword ptr [ebx + 0x68]
1009e37f  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009e382  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009e385  99                             cdq 
1009e386  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009e38c  2bc2                           sub eax, edx
1009e38e  037b50                         add edi, dword ptr [ebx + 0x50]
1009e391  8bd8                           mov ebx, eax
1009e393  d1fb                           sar ebx, 1
1009e395  03df                           add ebx, edi
1009e397  897db8                         mov dword ptr [ebp - 0x48], edi
1009e39a  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009e39d  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1009e3a0  894dac                         mov dword ptr [ebp - 0x54], ecx
1009e3a3  8b7678                         mov esi, dword ptr [esi + 0x78]
1009e3a6  8b4658                         mov eax, dword ptr [esi + 0x58]
1009e3a9  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009e3ac  99                             cdq 
1009e3ad  2bc2                           sub eax, edx
1009e3af  894dac                         mov dword ptr [ebp - 0x54], ecx
1009e3b2  d1f8                           sar eax, 1
1009e3b4  2bd8                           sub ebx, eax
1009e3b6  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009e3bc  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1009e3bf  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009e3c2  89787c                         mov dword ptr [eax + 0x7c], edi
1009e3c5  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009e3c8  8b7db0                         mov edi, dword ptr [ebp - 0x50]
1009e3cb  57                             push edi
1009e3cc  8b01                           mov eax, dword ptr [ecx]
1009e3ce  ff5004                         call dword ptr [eax + 4]
1009e3d1  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009e3d4  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009e3db  8d8658080000                   lea eax, [esi + 0x858]
1009e3e1  7202                           jb 0x1009e3e5
1009e3e3  8b00                           mov eax, dword ptr [eax]
1009e3e5  50                             push eax
1009e3e6  ff7308                         push dword ptr [ebx + 8]
1009e3e9  8bce                           mov ecx, esi
1009e3eb  e87061feff                     call 0x10084560
1009e3f0  3bfb                           cmp edi, ebx
1009e3f2  0f8597000000                   jne 0x1009e48f
1009e3f8  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009e3fb  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009e3fe  8955ac                         mov dword ptr [ebp - 0x54], edx
1009e401  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009e404  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009e407  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009e40a  03c1                           add eax, ecx
1009e40c  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009e40f  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009e416  8945b0                         mov dword ptr [ebp - 0x50], eax
1009e419  7474                           je 0x1009e48f
1009e41b  833e00                         cmp dword ptr [esi], 0
1009e41e  746f                           je 0x1009e48f
1009e420  8d4dbc                         lea ecx, [ebp - 0x44]
1009e423  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009e429  6a01                           push 1
1009e42b  8d4dbc                         lea ecx, [ebp - 0x44]
1009e42e  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009e435  ff1550ff0d10                   call dword ptr [0x100dff50]
1009e43b  6a01                           push 1
1009e43d  8d4dbc                         lea ecx, [ebp - 0x44]
1009e440  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009e446  68ff000000                     push 0xff
1009e44b  8d4dbc                         lea ecx, [ebp - 0x44]
1009e44e  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009e454  8b0e                           mov ecx, dword ptr [esi]
1009e456  8d45bc                         lea eax, [ebp - 0x44]
1009e459  50                             push eax
1009e45a  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009e460  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009e463  8d4dbc                         lea ecx, [ebp - 0x44]
1009e466  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009e469  898674080000                   mov dword ptr [esi + 0x874], eax
1009e46f  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009e472  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009e478  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1009e47b  89be70080000                   mov dword ptr [esi + 0x870], edi
1009e481  898678080000                   mov dword ptr [esi + 0x878], eax
1009e487  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009e48d  eb03                           jmp 0x1009e492
1009e48f  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009e492  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009e495  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009e498  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009e49b  03c1                           add eax, ecx
1009e49d  897b48                         mov dword ptr [ebx + 0x48], edi
1009e4a0  89434c                         mov dword ptr [ebx + 0x4c], eax
1009e4a3  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009e4a6  64890d00000000                 mov dword ptr fs:[0], ecx
1009e4ad  59                             pop ecx
1009e4ae  5f                             pop edi
1009e4af  5e                             pop esi
1009e4b0  5b                             pop ebx
1009e4b1  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009e4b4  33cd                           xor ecx, ebp
1009e4b6  e89c440000                     call 0x100a2957
1009e4bb  8be5                           mov esp, ebp
1009e4bd  5d                             pop ebp
1009e4be  c20400                         ret 4
1009e4c1  cc                             int3 
1009e4c2  cc                             int3 
1009e4c3  cc                             int3 
1009e4c4  cc                             int3 
1009e4c5  cc                             int3 
1009e4c6  cc                             int3 
1009e4c7  cc                             int3 
1009e4c8  cc                             int3 
1009e4c9  cc                             int3 
1009e4ca  cc                             int3 
1009e4cb  cc                             int3 
1009e4cc  cc                             int3 
1009e4cd  cc                             int3 
1009e4ce  cc                             int3 
1009e4cf  cc                             int3 
