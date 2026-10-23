; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009bed0 <= VA < 0x1009c130 (next decompiler entry; may include padding/thunks)
1009bed0  55                             push ebp
1009bed1  8bec                           mov ebp, esp
1009bed3  6aff                           push -1
1009bed5  6849c40a10                     push 0x100ac449
1009beda  64a100000000                   mov eax, dword ptr fs:[0]
1009bee0  50                             push eax
1009bee1  83ec50                         sub esp, 0x50
1009bee4  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009bee9  33c5                           xor eax, ebp
1009beeb  8945f0                         mov dword ptr [ebp - 0x10], eax
1009beee  53                             push ebx
1009beef  56                             push esi
1009bef0  57                             push edi
1009bef1  50                             push eax
1009bef2  8d45f4                         lea eax, [ebp - 0xc]
1009bef5  64a300000000                   mov dword ptr fs:[0], eax
1009befb  8bd9                           mov ebx, ecx
1009befd  895db4                         mov dword ptr [ebp - 0x4c], ebx
1009bf00  8b4508                         mov eax, dword ptr [ebp + 8]
1009bf03  8945ac                         mov dword ptr [ebp - 0x54], eax
1009bf06  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009bf09  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
1009bf0f  8b4864                         mov ecx, dword ptr [eax + 0x64]
1009bf12  8379046f                       cmp dword ptr [ecx + 4], 0x6f
1009bf16  7520                           jne 0x1009bf38
1009bf18  b800200000                     mov eax, 0x2000
1009bf1d  6603819c000000                 add ax, word ptr [ecx + 0x9c]
1009bf24  6683f819                       cmp ax, 0x19
1009bf28  770e                           ja 0x1009bf38
1009bf2a  8b4174                         mov eax, dword ptr [ecx + 0x74]
1009bf2d  6683600e01                     and word ptr [eax + 0xe], 1
1009bf32  7404                           je 0x1009bf38
1009bf34  33f6                           xor esi, esi
1009bf36  eb05                           jmp 0x1009bf3d
1009bf38  be01000000                     mov esi, 1
1009bf3d  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009bf40  8b8880000000                   mov ecx, dword ptr [eax + 0x80]
1009bf46  8b4350                         mov eax, dword ptr [ebx + 0x50]
1009bf49  03c1                           add eax, ecx
1009bf4b  8b4b74                         mov ecx, dword ptr [ebx + 0x74]
1009bf4e  8945b0                         mov dword ptr [ebp - 0x50], eax
1009bf51  894db8                         mov dword ptr [ebp - 0x48], ecx
1009bf54  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
1009bf5b  8d9158080000                   lea edx, [ecx + 0x858]
1009bf61  7206                           jb 0x1009bf69
1009bf63  8b9158080000                   mov edx, dword ptr [ecx + 0x858]
1009bf69  52                             push edx
1009bf6a  ff7308                         push dword ptr [ebx + 8]
1009bf6d  e8ee85feff                     call 0x10084560
1009bf72  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009bf75  e866f1ffff                     call 0x1009b0e0
1009bf7a  85c0                           test eax, eax
1009bf7c  7404                           je 0x1009bf82
1009bf7e  33c0                           xor eax, eax
1009bf80  eb0b                           jmp 0x1009bf8d
1009bf82  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
1009bf88  99                             cdq 
1009bf89  2bc2                           sub eax, edx
1009bf8b  d1f8                           sar eax, 1
1009bf8d  8b7b54                         mov edi, dword ptr [ebx + 0x54]
1009bf90  2bf8                           sub edi, eax
1009bf92  c1e604                         shl esi, 4
1009bf95  8b4308                         mov eax, dword ptr [ebx + 8]
1009bf98  83c604                         add esi, 4
1009bf9b  99                             cdq 
1009bf9c  f7fe                           idiv esi
1009bf9e  8b4b68                         mov ecx, dword ptr [ebx + 0x68]
1009bfa1  8bf0                           mov esi, eax
1009bfa3  03797c                         add edi, dword ptr [ecx + 0x7c]
1009bfa6  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009bfa9  ff7158                         push dword ptr [ecx + 0x58]
1009bfac  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
1009bfaf  ffb148080000                   push dword ptr [ecx + 0x848]
1009bfb5  e81685feff                     call 0x100844d0
1009bfba  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009bfbd  686de00000                     push 0xe06d
1009bfc2  03c6                           add eax, esi
1009bfc4  8b75b8                         mov esi, dword ptr [ebp - 0x48]
1009bfc7  57                             push edi
1009bfc8  50                             push eax
1009bfc9  8bce                           mov ecx, esi
1009bfcb  e86089feff                     call 0x10084930
1009bfd0  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009bfd7  8d8658080000                   lea eax, [esi + 0x858]
1009bfdd  7202                           jb 0x1009bfe1
1009bfdf  8b00                           mov eax, dword ptr [eax]
1009bfe1  50                             push eax
1009bfe2  ff7308                         push dword ptr [ebx + 8]
1009bfe5  8bce                           mov ecx, esi
1009bfe7  e87485feff                     call 0x10084560
1009bfec  8b7368                         mov esi, dword ptr [ebx + 0x68]
1009bfef  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009bff2  99                             cdq 
1009bff3  2bc2                           sub eax, edx
1009bff5  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009bffb  037b50                         add edi, dword ptr [ebx + 0x50]
1009bffe  8bd8                           mov ebx, eax
1009c000  d1fb                           sar ebx, 1
1009c002  03df                           add ebx, edi
1009c004  897db8                         mov dword ptr [ebp - 0x48], edi
1009c007  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009c00a  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1009c00d  8b7678                         mov esi, dword ptr [esi + 0x78]
1009c010  8b4658                         mov eax, dword ptr [esi + 0x58]
1009c013  99                             cdq 
1009c014  2bc2                           sub eax, edx
1009c016  d1f8                           sar eax, 1
1009c018  2bd8                           sub ebx, eax
1009c01a  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009c020  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1009c023  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009c026  89787c                         mov dword ptr [eax + 0x7c], edi
1009c029  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009c02c  8b7dac                         mov edi, dword ptr [ebp - 0x54]
1009c02f  57                             push edi
1009c030  8b01                           mov eax, dword ptr [ecx]
1009c032  ff5004                         call dword ptr [eax + 4]
1009c035  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009c038  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009c03f  8d8658080000                   lea eax, [esi + 0x858]
1009c045  7202                           jb 0x1009c049
1009c047  8b00                           mov eax, dword ptr [eax]
1009c049  50                             push eax
1009c04a  ff7308                         push dword ptr [ebx + 8]
1009c04d  8bce                           mov ecx, esi
1009c04f  e80c85feff                     call 0x10084560
1009c054  3bfb                           cmp edi, ebx
1009c056  0f8597000000                   jne 0x1009c0f3
1009c05c  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009c05f  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009c062  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009c065  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009c068  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009c06b  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009c06e  03c1                           add eax, ecx
1009c070  8955b0                         mov dword ptr [ebp - 0x50], edx
1009c073  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009c07a  8945ac                         mov dword ptr [ebp - 0x54], eax
1009c07d  7474                           je 0x1009c0f3
1009c07f  833e00                         cmp dword ptr [esi], 0
1009c082  746f                           je 0x1009c0f3
1009c084  8d4dbc                         lea ecx, [ebp - 0x44]
1009c087  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009c08d  6a01                           push 1
1009c08f  8d4dbc                         lea ecx, [ebp - 0x44]
1009c092  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009c099  ff1550ff0d10                   call dword ptr [0x100dff50]
1009c09f  6a01                           push 1
1009c0a1  8d4dbc                         lea ecx, [ebp - 0x44]
1009c0a4  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009c0aa  68ff000000                     push 0xff
1009c0af  8d4dbc                         lea ecx, [ebp - 0x44]
1009c0b2  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009c0b8  8b0e                           mov ecx, dword ptr [esi]
1009c0ba  8d45bc                         lea eax, [ebp - 0x44]
1009c0bd  50                             push eax
1009c0be  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009c0c4  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1009c0c7  8d4dbc                         lea ecx, [ebp - 0x44]
1009c0ca  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009c0cd  898674080000                   mov dword ptr [esi + 0x874], eax
1009c0d3  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009c0d6  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009c0dc  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009c0df  89be70080000                   mov dword ptr [esi + 0x870], edi
1009c0e5  898678080000                   mov dword ptr [esi + 0x878], eax
1009c0eb  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009c0f1  eb03                           jmp 0x1009c0f6
1009c0f3  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009c0f6  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009c0f9  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009c0fc  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009c0ff  03c1                           add eax, ecx
1009c101  897b48                         mov dword ptr [ebx + 0x48], edi
1009c104  89434c                         mov dword ptr [ebx + 0x4c], eax
1009c107  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009c10a  64890d00000000                 mov dword ptr fs:[0], ecx
1009c111  59                             pop ecx
1009c112  5f                             pop edi
1009c113  5e                             pop esi
1009c114  5b                             pop ebx
1009c115  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009c118  33cd                           xor ecx, ebp
1009c11a  e838680000                     call 0x100a2957
1009c11f  8be5                           mov esp, ebp
1009c121  5d                             pop ebp
1009c122  c20400                         ret 4
1009c125  cc                             int3 
1009c126  cc                             int3 
1009c127  cc                             int3 
1009c128  cc                             int3 
1009c129  cc                             int3 
1009c12a  cc                             int3 
1009c12b  cc                             int3 
1009c12c  cc                             int3 
1009c12d  cc                             int3 
1009c12e  cc                             int3 
1009c12f  cc                             int3 
