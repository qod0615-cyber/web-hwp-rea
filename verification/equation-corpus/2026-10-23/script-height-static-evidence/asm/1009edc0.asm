; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009edc0 <= VA < 0x1009ef50 (next decompiler entry; may include padding/thunks)
1009edc0  55                             push ebp
1009edc1  8bec                           mov ebp, esp
1009edc3  6aff                           push -1
1009edc5  68c9c40a10                     push 0x100ac4c9
1009edca  64a100000000                   mov eax, dword ptr fs:[0]
1009edd0  50                             push eax
1009edd1  83ec4c                         sub esp, 0x4c
1009edd4  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009edd9  33c5                           xor eax, ebp
1009eddb  8945f0                         mov dword ptr [ebp - 0x10], eax
1009edde  53                             push ebx
1009eddf  56                             push esi
1009ede0  57                             push edi
1009ede1  50                             push eax
1009ede2  8d45f4                         lea eax, [ebp - 0xc]
1009ede5  64a300000000                   mov dword ptr fs:[0], eax
1009edeb  8bd9                           mov ebx, ecx
1009eded  895db4                         mov dword ptr [ebp - 0x4c], ebx
1009edf0  8b4508                         mov eax, dword ptr [ebp + 8]
1009edf3  51                             push ecx
1009edf4  8945b0                         mov dword ptr [ebp - 0x50], eax
1009edf7  e8a4020000                     call 0x1009f0a0
1009edfc  8b7368                         mov esi, dword ptr [ebx + 0x68]
1009edff  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009ee02  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009ee05  99                             cdq 
1009ee06  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009ee0c  2bc2                           sub eax, edx
1009ee0e  037b50                         add edi, dword ptr [ebx + 0x50]
1009ee11  8bd8                           mov ebx, eax
1009ee13  d1fb                           sar ebx, 1
1009ee15  03df                           add ebx, edi
1009ee17  897db8                         mov dword ptr [ebp - 0x48], edi
1009ee1a  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009ee1d  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1009ee20  894dac                         mov dword ptr [ebp - 0x54], ecx
1009ee23  8b7678                         mov esi, dword ptr [esi + 0x78]
1009ee26  8b4658                         mov eax, dword ptr [esi + 0x58]
1009ee29  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009ee2c  99                             cdq 
1009ee2d  2bc2                           sub eax, edx
1009ee2f  894dac                         mov dword ptr [ebp - 0x54], ecx
1009ee32  d1f8                           sar eax, 1
1009ee34  2bd8                           sub ebx, eax
1009ee36  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009ee3c  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1009ee3f  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009ee42  89787c                         mov dword ptr [eax + 0x7c], edi
1009ee45  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009ee48  8b7db0                         mov edi, dword ptr [ebp - 0x50]
1009ee4b  57                             push edi
1009ee4c  8b01                           mov eax, dword ptr [ecx]
1009ee4e  ff5004                         call dword ptr [eax + 4]
1009ee51  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009ee54  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009ee5b  8d8658080000                   lea eax, [esi + 0x858]
1009ee61  7202                           jb 0x1009ee65
1009ee63  8b00                           mov eax, dword ptr [eax]
1009ee65  50                             push eax
1009ee66  ff7308                         push dword ptr [ebx + 8]
1009ee69  8bce                           mov ecx, esi
1009ee6b  e8f056feff                     call 0x10084560
1009ee70  3bfb                           cmp edi, ebx
1009ee72  0f8597000000                   jne 0x1009ef0f
1009ee78  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009ee7b  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009ee7e  8955ac                         mov dword ptr [ebp - 0x54], edx
1009ee81  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009ee84  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009ee87  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009ee8a  03c1                           add eax, ecx
1009ee8c  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009ee8f  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009ee96  8945b0                         mov dword ptr [ebp - 0x50], eax
1009ee99  7474                           je 0x1009ef0f
1009ee9b  833e00                         cmp dword ptr [esi], 0
1009ee9e  746f                           je 0x1009ef0f
1009eea0  8d4dbc                         lea ecx, [ebp - 0x44]
1009eea3  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009eea9  6a01                           push 1
1009eeab  8d4dbc                         lea ecx, [ebp - 0x44]
1009eeae  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009eeb5  ff1550ff0d10                   call dword ptr [0x100dff50]
1009eebb  6a01                           push 1
1009eebd  8d4dbc                         lea ecx, [ebp - 0x44]
1009eec0  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009eec6  68ff000000                     push 0xff
1009eecb  8d4dbc                         lea ecx, [ebp - 0x44]
1009eece  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009eed4  8b0e                           mov ecx, dword ptr [esi]
1009eed6  8d45bc                         lea eax, [ebp - 0x44]
1009eed9  50                             push eax
1009eeda  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009eee0  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009eee3  8d4dbc                         lea ecx, [ebp - 0x44]
1009eee6  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009eee9  898674080000                   mov dword ptr [esi + 0x874], eax
1009eeef  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009eef2  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009eef8  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1009eefb  89be70080000                   mov dword ptr [esi + 0x870], edi
1009ef01  898678080000                   mov dword ptr [esi + 0x878], eax
1009ef07  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009ef0d  eb03                           jmp 0x1009ef12
1009ef0f  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009ef12  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009ef15  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009ef18  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009ef1b  03c1                           add eax, ecx
1009ef1d  897b48                         mov dword ptr [ebx + 0x48], edi
1009ef20  89434c                         mov dword ptr [ebx + 0x4c], eax
1009ef23  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009ef26  64890d00000000                 mov dword ptr fs:[0], ecx
1009ef2d  59                             pop ecx
1009ef2e  5f                             pop edi
1009ef2f  5e                             pop esi
1009ef30  5b                             pop ebx
1009ef31  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009ef34  33cd                           xor ecx, ebp
1009ef36  e81c3a0000                     call 0x100a2957
1009ef3b  8be5                           mov esp, ebp
1009ef3d  5d                             pop ebp
1009ef3e  c20400                         ret 4
1009ef41  cc                             int3 
1009ef42  cc                             int3 
1009ef43  cc                             int3 
1009ef44  cc                             int3 
1009ef45  cc                             int3 
1009ef46  cc                             int3 
1009ef47  cc                             int3 
1009ef48  cc                             int3 
1009ef49  cc                             int3 
1009ef4a  cc                             int3 
1009ef4b  cc                             int3 
1009ef4c  cc                             int3 
1009ef4d  cc                             int3 
1009ef4e  cc                             int3 
1009ef4f  cc                             int3 
