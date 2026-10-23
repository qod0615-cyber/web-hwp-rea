; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009b3f0 <= VA < 0x1009b580 (next decompiler entry; may include padding/thunks)
1009b3f0  55                             push ebp
1009b3f1  8bec                           mov ebp, esp
1009b3f3  6aff                           push -1
1009b3f5  68c9c40a10                     push 0x100ac4c9
1009b3fa  64a100000000                   mov eax, dword ptr fs:[0]
1009b400  50                             push eax
1009b401  83ec4c                         sub esp, 0x4c
1009b404  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009b409  33c5                           xor eax, ebp
1009b40b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009b40e  53                             push ebx
1009b40f  56                             push esi
1009b410  57                             push edi
1009b411  50                             push eax
1009b412  8d45f4                         lea eax, [ebp - 0xc]
1009b415  64a300000000                   mov dword ptr fs:[0], eax
1009b41b  8bd9                           mov ebx, ecx
1009b41d  895db4                         mov dword ptr [ebp - 0x4c], ebx
1009b420  8b4508                         mov eax, dword ptr [ebp + 8]
1009b423  51                             push ecx
1009b424  8945b0                         mov dword ptr [ebp - 0x50], eax
1009b427  e8a4020000                     call 0x1009b6d0
1009b42c  8b7368                         mov esi, dword ptr [ebx + 0x68]
1009b42f  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009b432  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009b435  99                             cdq 
1009b436  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009b43c  2bc2                           sub eax, edx
1009b43e  037b50                         add edi, dword ptr [ebx + 0x50]
1009b441  8bd8                           mov ebx, eax
1009b443  d1fb                           sar ebx, 1
1009b445  03df                           add ebx, edi
1009b447  897db8                         mov dword ptr [ebp - 0x48], edi
1009b44a  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009b44d  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1009b450  894dac                         mov dword ptr [ebp - 0x54], ecx
1009b453  8b7678                         mov esi, dword ptr [esi + 0x78]
1009b456  8b4658                         mov eax, dword ptr [esi + 0x58]
1009b459  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009b45c  99                             cdq 
1009b45d  2bc2                           sub eax, edx
1009b45f  894dac                         mov dword ptr [ebp - 0x54], ecx
1009b462  d1f8                           sar eax, 1
1009b464  2bd8                           sub ebx, eax
1009b466  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009b46c  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1009b46f  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009b472  89787c                         mov dword ptr [eax + 0x7c], edi
1009b475  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009b478  8b7db0                         mov edi, dword ptr [ebp - 0x50]
1009b47b  57                             push edi
1009b47c  8b01                           mov eax, dword ptr [ecx]
1009b47e  ff5004                         call dword ptr [eax + 4]
1009b481  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009b484  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009b48b  8d8658080000                   lea eax, [esi + 0x858]
1009b491  7202                           jb 0x1009b495
1009b493  8b00                           mov eax, dword ptr [eax]
1009b495  50                             push eax
1009b496  ff7308                         push dword ptr [ebx + 8]
1009b499  8bce                           mov ecx, esi
1009b49b  e8c090feff                     call 0x10084560
1009b4a0  3bfb                           cmp edi, ebx
1009b4a2  0f8597000000                   jne 0x1009b53f
1009b4a8  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009b4ab  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009b4ae  8955ac                         mov dword ptr [ebp - 0x54], edx
1009b4b1  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009b4b4  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009b4b7  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009b4ba  03c1                           add eax, ecx
1009b4bc  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009b4bf  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009b4c6  8945b0                         mov dword ptr [ebp - 0x50], eax
1009b4c9  7474                           je 0x1009b53f
1009b4cb  833e00                         cmp dword ptr [esi], 0
1009b4ce  746f                           je 0x1009b53f
1009b4d0  8d4dbc                         lea ecx, [ebp - 0x44]
1009b4d3  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009b4d9  6a01                           push 1
1009b4db  8d4dbc                         lea ecx, [ebp - 0x44]
1009b4de  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009b4e5  ff1550ff0d10                   call dword ptr [0x100dff50]
1009b4eb  6a01                           push 1
1009b4ed  8d4dbc                         lea ecx, [ebp - 0x44]
1009b4f0  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009b4f6  68ff000000                     push 0xff
1009b4fb  8d4dbc                         lea ecx, [ebp - 0x44]
1009b4fe  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009b504  8b0e                           mov ecx, dword ptr [esi]
1009b506  8d45bc                         lea eax, [ebp - 0x44]
1009b509  50                             push eax
1009b50a  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009b510  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009b513  8d4dbc                         lea ecx, [ebp - 0x44]
1009b516  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009b519  898674080000                   mov dword ptr [esi + 0x874], eax
1009b51f  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009b522  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009b528  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1009b52b  89be70080000                   mov dword ptr [esi + 0x870], edi
1009b531  898678080000                   mov dword ptr [esi + 0x878], eax
1009b537  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009b53d  eb03                           jmp 0x1009b542
1009b53f  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009b542  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009b545  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009b548  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009b54b  03c1                           add eax, ecx
1009b54d  897b48                         mov dword ptr [ebx + 0x48], edi
1009b550  89434c                         mov dword ptr [ebx + 0x4c], eax
1009b553  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009b556  64890d00000000                 mov dword ptr fs:[0], ecx
1009b55d  59                             pop ecx
1009b55e  5f                             pop edi
1009b55f  5e                             pop esi
1009b560  5b                             pop ebx
1009b561  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009b564  33cd                           xor ecx, ebp
1009b566  e8ec730000                     call 0x100a2957
1009b56b  8be5                           mov esp, ebp
1009b56d  5d                             pop ebp
1009b56e  c20400                         ret 4
1009b571  cc                             int3 
1009b572  cc                             int3 
1009b573  cc                             int3 
1009b574  cc                             int3 
1009b575  cc                             int3 
1009b576  cc                             int3 
1009b577  cc                             int3 
1009b578  cc                             int3 
1009b579  cc                             int3 
1009b57a  cc                             int3 
1009b57b  cc                             int3 
1009b57c  cc                             int3 
1009b57d  cc                             int3 
1009b57e  cc                             int3 
1009b57f  cc                             int3 
