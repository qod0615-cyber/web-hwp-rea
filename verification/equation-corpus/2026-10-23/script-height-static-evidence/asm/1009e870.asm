; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009e870 <= VA < 0x1009ea00 (next decompiler entry; may include padding/thunks)
1009e870  55                             push ebp
1009e871  8bec                           mov ebp, esp
1009e873  6aff                           push -1
1009e875  68c9c40a10                     push 0x100ac4c9
1009e87a  64a100000000                   mov eax, dword ptr fs:[0]
1009e880  50                             push eax
1009e881  83ec4c                         sub esp, 0x4c
1009e884  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009e889  33c5                           xor eax, ebp
1009e88b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009e88e  53                             push ebx
1009e88f  56                             push esi
1009e890  57                             push edi
1009e891  50                             push eax
1009e892  8d45f4                         lea eax, [ebp - 0xc]
1009e895  64a300000000                   mov dword ptr fs:[0], eax
1009e89b  8bd9                           mov ebx, ecx
1009e89d  895db4                         mov dword ptr [ebp - 0x4c], ebx
1009e8a0  8b4508                         mov eax, dword ptr [ebp + 8]
1009e8a3  51                             push ecx
1009e8a4  8945b0                         mov dword ptr [ebp - 0x50], eax
1009e8a7  e8a4020000                     call 0x1009eb50
1009e8ac  8b7368                         mov esi, dword ptr [ebx + 0x68]
1009e8af  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009e8b2  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009e8b5  99                             cdq 
1009e8b6  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009e8bc  2bc2                           sub eax, edx
1009e8be  037b50                         add edi, dword ptr [ebx + 0x50]
1009e8c1  8bd8                           mov ebx, eax
1009e8c3  d1fb                           sar ebx, 1
1009e8c5  03df                           add ebx, edi
1009e8c7  897db8                         mov dword ptr [ebp - 0x48], edi
1009e8ca  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009e8cd  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1009e8d0  894dac                         mov dword ptr [ebp - 0x54], ecx
1009e8d3  8b7678                         mov esi, dword ptr [esi + 0x78]
1009e8d6  8b4658                         mov eax, dword ptr [esi + 0x58]
1009e8d9  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009e8dc  99                             cdq 
1009e8dd  2bc2                           sub eax, edx
1009e8df  894dac                         mov dword ptr [ebp - 0x54], ecx
1009e8e2  d1f8                           sar eax, 1
1009e8e4  2bd8                           sub ebx, eax
1009e8e6  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009e8ec  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1009e8ef  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009e8f2  89787c                         mov dword ptr [eax + 0x7c], edi
1009e8f5  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009e8f8  8b7db0                         mov edi, dword ptr [ebp - 0x50]
1009e8fb  57                             push edi
1009e8fc  8b01                           mov eax, dword ptr [ecx]
1009e8fe  ff5004                         call dword ptr [eax + 4]
1009e901  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009e904  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009e90b  8d8658080000                   lea eax, [esi + 0x858]
1009e911  7202                           jb 0x1009e915
1009e913  8b00                           mov eax, dword ptr [eax]
1009e915  50                             push eax
1009e916  ff7308                         push dword ptr [ebx + 8]
1009e919  8bce                           mov ecx, esi
1009e91b  e8405cfeff                     call 0x10084560
1009e920  3bfb                           cmp edi, ebx
1009e922  0f8597000000                   jne 0x1009e9bf
1009e928  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009e92b  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009e92e  8955ac                         mov dword ptr [ebp - 0x54], edx
1009e931  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009e934  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009e937  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009e93a  03c1                           add eax, ecx
1009e93c  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009e93f  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009e946  8945b0                         mov dword ptr [ebp - 0x50], eax
1009e949  7474                           je 0x1009e9bf
1009e94b  833e00                         cmp dword ptr [esi], 0
1009e94e  746f                           je 0x1009e9bf
1009e950  8d4dbc                         lea ecx, [ebp - 0x44]
1009e953  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009e959  6a01                           push 1
1009e95b  8d4dbc                         lea ecx, [ebp - 0x44]
1009e95e  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009e965  ff1550ff0d10                   call dword ptr [0x100dff50]
1009e96b  6a01                           push 1
1009e96d  8d4dbc                         lea ecx, [ebp - 0x44]
1009e970  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009e976  68ff000000                     push 0xff
1009e97b  8d4dbc                         lea ecx, [ebp - 0x44]
1009e97e  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009e984  8b0e                           mov ecx, dword ptr [esi]
1009e986  8d45bc                         lea eax, [ebp - 0x44]
1009e989  50                             push eax
1009e98a  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009e990  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009e993  8d4dbc                         lea ecx, [ebp - 0x44]
1009e996  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009e999  898674080000                   mov dword ptr [esi + 0x874], eax
1009e99f  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009e9a2  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009e9a8  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1009e9ab  89be70080000                   mov dword ptr [esi + 0x870], edi
1009e9b1  898678080000                   mov dword ptr [esi + 0x878], eax
1009e9b7  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009e9bd  eb03                           jmp 0x1009e9c2
1009e9bf  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009e9c2  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009e9c5  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009e9c8  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009e9cb  03c1                           add eax, ecx
1009e9cd  897b48                         mov dword ptr [ebx + 0x48], edi
1009e9d0  89434c                         mov dword ptr [ebx + 0x4c], eax
1009e9d3  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009e9d6  64890d00000000                 mov dword ptr fs:[0], ecx
1009e9dd  59                             pop ecx
1009e9de  5f                             pop edi
1009e9df  5e                             pop esi
1009e9e0  5b                             pop ebx
1009e9e1  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009e9e4  33cd                           xor ecx, ebp
1009e9e6  e86c3f0000                     call 0x100a2957
1009e9eb  8be5                           mov esp, ebp
1009e9ed  5d                             pop ebp
1009e9ee  c20400                         ret 4
1009e9f1  cc                             int3 
1009e9f2  cc                             int3 
1009e9f3  cc                             int3 
1009e9f4  cc                             int3 
1009e9f5  cc                             int3 
1009e9f6  cc                             int3 
1009e9f7  cc                             int3 
1009e9f8  cc                             int3 
1009e9f9  cc                             int3 
1009e9fa  cc                             int3 
1009e9fb  cc                             int3 
1009e9fc  cc                             int3 
1009e9fd  cc                             int3 
1009e9fe  cc                             int3 
1009e9ff  cc                             int3 
