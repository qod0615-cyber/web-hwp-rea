; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009eb50 <= VA < 0x1009ecc0 (next decompiler entry; may include padding/thunks)
1009eb50  55                             push ebp
1009eb51  8bec                           mov ebp, esp
1009eb53  83ec24                         sub esp, 0x24
1009eb56  53                             push ebx
1009eb57  56                             push esi
1009eb58  8bf1                           mov esi, ecx
1009eb5a  57                             push edi
1009eb5b  8975f0                         mov dword ptr [ebp - 0x10], esi
1009eb5e  8b4678                         mov eax, dword ptr [esi + 0x78]
1009eb61  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
1009eb67  8b4864                         mov ecx, dword ptr [eax + 0x64]
1009eb6a  8379046f                       cmp dword ptr [ecx + 4], 0x6f
1009eb6e  7520                           jne 0x1009eb90
1009eb70  b800200000                     mov eax, 0x2000
1009eb75  6603819c000000                 add ax, word ptr [ecx + 0x9c]
1009eb7c  6683f819                       cmp ax, 0x19
1009eb80  770e                           ja 0x1009eb90
1009eb82  8b4174                         mov eax, dword ptr [ecx + 0x74]
1009eb85  6683600e01                     and word ptr [eax + 0xe], 1
1009eb8a  7404                           je 0x1009eb90
1009eb8c  33ff                           xor edi, edi
1009eb8e  eb05                           jmp 0x1009eb95
1009eb90  bf01000000                     mov edi, 1
1009eb95  8b5e74                         mov ebx, dword ptr [esi + 0x74]
1009eb98  895de4                         mov dword ptr [ebp - 0x1c], ebx
1009eb9b  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1009eba2  8d8b58080000                   lea ecx, [ebx + 0x858]
1009eba8  7206                           jb 0x1009ebb0
1009ebaa  8b8b58080000                   mov ecx, dword ptr [ebx + 0x858]
1009ebb0  51                             push ecx
1009ebb1  ff7608                         push dword ptr [esi + 8]
1009ebb4  8bcb                           mov ecx, ebx
1009ebb6  e8a559feff                     call 0x10084560
1009ebbb  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009ebbe  8b4658                         mov eax, dword ptr [esi + 0x58]
1009ebc1  894dec                         mov dword ptr [ebp - 0x14], ecx
1009ebc4  8b4e68                         mov ecx, dword ptr [esi + 0x68]
1009ebc7  99                             cdq 
1009ebc8  2bc2                           sub eax, edx
1009ebca  c1e704                         shl edi, 4
1009ebcd  d1f8                           sar eax, 1
1009ebcf  83c704                         add edi, 4
1009ebd2  8b8980000000                   mov ecx, dword ptr [ecx + 0x80]
1009ebd8  03c8                           add ecx, eax
1009ebda  8b4608                         mov eax, dword ptr [esi + 8]
1009ebdd  99                             cdq 
1009ebde  f7ff                           idiv edi
1009ebe0  034e50                         add ecx, dword ptr [esi + 0x50]
1009ebe3  894dec                         mov dword ptr [ebp - 0x14], ecx
1009ebe6  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009ebe9  894dfc                         mov dword ptr [ebp - 4], ecx
1009ebec  8b8b4c080000                   mov ecx, dword ptr [ebx + 0x84c]
1009ebf2  8945f4                         mov dword ptr [ebp - 0xc], eax
1009ebf5  394e58                         cmp dword ptr [esi + 0x58], ecx
1009ebf8  7f08                           jg 0x1009ec02
1009ebfa  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009ec00  eb16                           jmp 0x1009ec18
1009ec02  8b465c                         mov eax, dword ptr [esi + 0x5c]
1009ec05  8d3c49                         lea edi, [ecx + ecx*2]
1009ec08  03ff                           add edi, edi
1009ec0a  8945fc                         mov dword ptr [ebp - 4], eax
1009ec0d  897dfc                         mov dword ptr [ebp - 4], edi
1009ec10  397e58                         cmp dword ptr [esi + 0x58], edi
1009ec13  7f06                           jg 0x1009ec1b
1009ec15  8b7e58                         mov edi, dword ptr [esi + 0x58]
1009ec18  897dfc                         mov dword ptr [ebp - 4], edi
1009ec1b  8b1dc8e20a10                   mov ebx, dword ptr [0x100ae2c8]
1009ec21  6a64                           push 0x64
1009ec23  6a0a                           push 0xa
1009ec25  57                             push edi
1009ec26  ffd3                           call ebx
1009ec28  8bc8                           mov ecx, eax
1009ec2a  8bc7                           mov eax, edi
1009ec2c  99                             cdq 
1009ec2d  2bc2                           sub eax, edx
1009ec2f  8b55f4                         mov edx, dword ptr [ebp - 0xc]
1009ec32  d1f8                           sar eax, 1
1009ec34  2bd0                           sub edx, eax
1009ec36  8b4668                         mov eax, dword ptr [esi + 0x68]
1009ec39  0355ec                         add edx, dword ptr [ebp - 0x14]
1009ec3c  8b7654                         mov esi, dword ptr [esi + 0x54]
1009ec3f  2bd1                           sub edx, ecx
1009ec41  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009ec44  8b787c                         mov edi, dword ptr [eax + 0x7c]
1009ec47  6a64                           push 0x64
1009ec49  8955f4                         mov dword ptr [ebp - 0xc], edx
1009ec4c  8b4978                         mov ecx, dword ptr [ecx + 0x78]
1009ec4f  e88cc4ffff                     call 0x1009b0e0
1009ec54  f7d8                           neg eax
1009ec56  1bc0                           sbb eax, eax
1009ec58  83e0dd                         and eax, 0xffffffdd
1009ec5b  83c02d                         add eax, 0x2d
1009ec5e  50                             push eax
1009ec5f  8b45f0                         mov eax, dword ptr [ebp - 0x10]
1009ec62  ffb084000000                   push dword ptr [eax + 0x84]
1009ec68  ffd3                           call ebx
1009ec6a  8b5de4                         mov ebx, dword ptr [ebp - 0x1c]
1009ec6d  03f7                           add esi, edi
1009ec6f  ff75fc                         push dword ptr [ebp - 4]
1009ec72  8bcb                           mov ecx, ebx
1009ec74  2bf0                           sub esi, eax
1009ec76  ffb348080000                   push dword ptr [ebx + 0x848]
1009ec7c  e84f58feff                     call 0x100844d0
1009ec81  8b45f4                         mov eax, dword ptr [ebp - 0xc]
1009ec84  8bcb                           mov ecx, ebx
1009ec86  6865e00000                     push 0xe065
1009ec8b  56                             push esi
1009ec8c  50                             push eax
1009ec8d  e89e5cfeff                     call 0x10084930
1009ec92  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1009ec99  8b45f0                         mov eax, dword ptr [ebp - 0x10]
1009ec9c  8b4808                         mov ecx, dword ptr [eax + 8]
1009ec9f  8d8358080000                   lea eax, [ebx + 0x858]
1009eca5  7202                           jb 0x1009eca9
1009eca7  8b00                           mov eax, dword ptr [eax]
1009eca9  50                             push eax
1009ecaa  51                             push ecx
1009ecab  8bcb                           mov ecx, ebx
1009ecad  e8ae58feff                     call 0x10084560
1009ecb2  5f                             pop edi
1009ecb3  5e                             pop esi
1009ecb4  5b                             pop ebx
1009ecb5  8be5                           mov esp, ebp
1009ecb7  5d                             pop ebp
1009ecb8  c20400                         ret 4
1009ecbb  cc                             int3 
1009ecbc  cc                             int3 
1009ecbd  cc                             int3 
1009ecbe  cc                             int3 
1009ecbf  cc                             int3 
