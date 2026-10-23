; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009b960 <= VA < 0x1009baf0 (next decompiler entry; may include padding/thunks)
1009b960  55                             push ebp
1009b961  8bec                           mov ebp, esp
1009b963  6aff                           push -1
1009b965  68c9c40a10                     push 0x100ac4c9
1009b96a  64a100000000                   mov eax, dword ptr fs:[0]
1009b970  50                             push eax
1009b971  83ec4c                         sub esp, 0x4c
1009b974  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009b979  33c5                           xor eax, ebp
1009b97b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009b97e  53                             push ebx
1009b97f  56                             push esi
1009b980  57                             push edi
1009b981  50                             push eax
1009b982  8d45f4                         lea eax, [ebp - 0xc]
1009b985  64a300000000                   mov dword ptr fs:[0], eax
1009b98b  8bd9                           mov ebx, ecx
1009b98d  895db4                         mov dword ptr [ebp - 0x4c], ebx
1009b990  8b4508                         mov eax, dword ptr [ebp + 8]
1009b993  51                             push ecx
1009b994  8945b0                         mov dword ptr [ebp - 0x50], eax
1009b997  e8a4020000                     call 0x1009bc40
1009b99c  8b7368                         mov esi, dword ptr [ebx + 0x68]
1009b99f  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009b9a2  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009b9a5  99                             cdq 
1009b9a6  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009b9ac  2bc2                           sub eax, edx
1009b9ae  037b50                         add edi, dword ptr [ebx + 0x50]
1009b9b1  8bd8                           mov ebx, eax
1009b9b3  d1fb                           sar ebx, 1
1009b9b5  03df                           add ebx, edi
1009b9b7  897db8                         mov dword ptr [ebp - 0x48], edi
1009b9ba  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009b9bd  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1009b9c0  894dac                         mov dword ptr [ebp - 0x54], ecx
1009b9c3  8b7678                         mov esi, dword ptr [esi + 0x78]
1009b9c6  8b4658                         mov eax, dword ptr [esi + 0x58]
1009b9c9  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009b9cc  99                             cdq 
1009b9cd  2bc2                           sub eax, edx
1009b9cf  894dac                         mov dword ptr [ebp - 0x54], ecx
1009b9d2  d1f8                           sar eax, 1
1009b9d4  2bd8                           sub ebx, eax
1009b9d6  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009b9dc  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1009b9df  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009b9e2  89787c                         mov dword ptr [eax + 0x7c], edi
1009b9e5  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009b9e8  8b7db0                         mov edi, dword ptr [ebp - 0x50]
1009b9eb  57                             push edi
1009b9ec  8b01                           mov eax, dword ptr [ecx]
1009b9ee  ff5004                         call dword ptr [eax + 4]
1009b9f1  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009b9f4  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009b9fb  8d8658080000                   lea eax, [esi + 0x858]
1009ba01  7202                           jb 0x1009ba05
1009ba03  8b00                           mov eax, dword ptr [eax]
1009ba05  50                             push eax
1009ba06  ff7308                         push dword ptr [ebx + 8]
1009ba09  8bce                           mov ecx, esi
1009ba0b  e8508bfeff                     call 0x10084560
1009ba10  3bfb                           cmp edi, ebx
1009ba12  0f8597000000                   jne 0x1009baaf
1009ba18  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009ba1b  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009ba1e  8955ac                         mov dword ptr [ebp - 0x54], edx
1009ba21  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009ba24  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009ba27  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009ba2a  03c1                           add eax, ecx
1009ba2c  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009ba2f  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009ba36  8945b0                         mov dword ptr [ebp - 0x50], eax
1009ba39  7474                           je 0x1009baaf
1009ba3b  833e00                         cmp dword ptr [esi], 0
1009ba3e  746f                           je 0x1009baaf
1009ba40  8d4dbc                         lea ecx, [ebp - 0x44]
1009ba43  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009ba49  6a01                           push 1
1009ba4b  8d4dbc                         lea ecx, [ebp - 0x44]
1009ba4e  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009ba55  ff1550ff0d10                   call dword ptr [0x100dff50]
1009ba5b  6a01                           push 1
1009ba5d  8d4dbc                         lea ecx, [ebp - 0x44]
1009ba60  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009ba66  68ff000000                     push 0xff
1009ba6b  8d4dbc                         lea ecx, [ebp - 0x44]
1009ba6e  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009ba74  8b0e                           mov ecx, dword ptr [esi]
1009ba76  8d45bc                         lea eax, [ebp - 0x44]
1009ba79  50                             push eax
1009ba7a  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009ba80  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009ba83  8d4dbc                         lea ecx, [ebp - 0x44]
1009ba86  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009ba89  898674080000                   mov dword ptr [esi + 0x874], eax
1009ba8f  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009ba92  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009ba98  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1009ba9b  89be70080000                   mov dword ptr [esi + 0x870], edi
1009baa1  898678080000                   mov dword ptr [esi + 0x878], eax
1009baa7  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009baad  eb03                           jmp 0x1009bab2
1009baaf  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009bab2  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009bab5  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009bab8  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009babb  03c1                           add eax, ecx
1009babd  897b48                         mov dword ptr [ebx + 0x48], edi
1009bac0  89434c                         mov dword ptr [ebx + 0x4c], eax
1009bac3  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009bac6  64890d00000000                 mov dword ptr fs:[0], ecx
1009bacd  59                             pop ecx
1009bace  5f                             pop edi
1009bacf  5e                             pop esi
1009bad0  5b                             pop ebx
1009bad1  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009bad4  33cd                           xor ecx, ebp
1009bad6  e87c6e0000                     call 0x100a2957
1009badb  8be5                           mov esp, ebp
1009badd  5d                             pop ebp
1009bade  c20400                         ret 4
1009bae1  cc                             int3 
1009bae2  cc                             int3 
1009bae3  cc                             int3 
1009bae4  cc                             int3 
1009bae5  cc                             int3 
1009bae6  cc                             int3 
1009bae7  cc                             int3 
1009bae8  cc                             int3 
1009bae9  cc                             int3 
1009baea  cc                             int3 
1009baeb  cc                             int3 
1009baec  cc                             int3 
1009baed  cc                             int3 
1009baee  cc                             int3 
1009baef  cc                             int3 
