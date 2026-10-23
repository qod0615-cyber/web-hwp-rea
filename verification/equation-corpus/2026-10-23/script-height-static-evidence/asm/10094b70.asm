; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10094b70 <= VA < 0x10094d50 (next decompiler entry; may include padding/thunks)
10094b70  55                             push ebp
10094b71  8bec                           mov ebp, esp
10094b73  83ec20                         sub esp, 0x20
10094b76  53                             push ebx
10094b77  56                             push esi
10094b78  8bf1                           mov esi, ecx
10094b7a  57                             push edi
10094b7b  8b4e74                         mov ecx, dword ptr [esi + 0x74]
10094b7e  894dfc                         mov dword ptr [ebp - 4], ecx
10094b81  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
10094b88  8d9158080000                   lea edx, [ecx + 0x858]
10094b8e  7206                           jb 0x10094b96
10094b90  8b9158080000                   mov edx, dword ptr [ecx + 0x858]
10094b96  52                             push edx
10094b97  ff7608                         push dword ptr [esi + 8]
10094b9a  e8c1f9feff                     call 0x10084560
10094b9f  8b1dc8e20a10                   mov ebx, dword ptr [0x100ae2c8]
10094ba5  6a64                           push 0x64
10094ba7  6a14                           push 0x14
10094ba9  ff7608                         push dword ptr [esi + 8]
10094bac  ffd3                           call ebx
10094bae  6a64                           push 0x64
10094bb0  6a0f                           push 0xf
10094bb2  ff7608                         push dword ptr [esi + 8]
10094bb5  8945f0                         mov dword ptr [ebp - 0x10], eax
10094bb8  ffd3                           call ebx
10094bba  8b5668                         mov edx, dword ptr [esi + 0x68]
10094bbd  8bf8                           mov edi, eax
10094bbf  8b8e84000000                   mov ecx, dword ptr [esi + 0x84]
10094bc5  6a64                           push 0x64
10094bc7  6a02                           push 2
10094bc9  8b8280000000                   mov eax, dword ptr [edx + 0x80]
10094bcf  034650                         add eax, dword ptr [esi + 0x50]
10094bd2  0301                           add eax, dword ptr [ecx]
10094bd4  8b5a7c                         mov ebx, dword ptr [edx + 0x7c]
10094bd7  ff7608                         push dword ptr [esi + 8]
10094bda  035e54                         add ebx, dword ptr [esi + 0x54]
10094bdd  897df8                         mov dword ptr [ebp - 8], edi
10094be0  8945f4                         mov dword ptr [ebp - 0xc], eax
10094be3  ff15c8e20a10                   call dword ptr [0x100ae2c8]
10094be9  6a64                           push 0x64
10094beb  6a06                           push 6
10094bed  ff7608                         push dword ptr [esi + 8]
10094bf0  8945ec                         mov dword ptr [ebp - 0x14], eax
10094bf3  ff15c8e20a10                   call dword ptr [0x100ae2c8]
10094bf9  8b550c                         mov edx, dword ptr [ebp + 0xc]
10094bfc  8945e0                         mov dword ptr [ebp - 0x20], eax
10094bff  85d2                           test edx, edx
10094c01  781e                           js 0x10094c21
10094c03  8b8e80000000                   mov ecx, dword ptr [esi + 0x80]
10094c09  42                             inc edx
10094c0a  660f1f440000                   nop word ptr [eax + eax]
10094c10  8b01                           mov eax, dword ptr [ecx]
10094c12  8d4904                         lea ecx, [ecx + 4]
10094c15  03c7                           add eax, edi
10094c17  03d8                           add ebx, eax
10094c19  83ea01                         sub edx, 1
10094c1c  75f2                           jne 0x10094c10
10094c1e  8b550c                         mov edx, dword ptr [ebp + 0xc]
10094c21  8b8e84000000                   mov ecx, dword ptr [esi + 0x84]
10094c27  8b7e58                         mov edi, dword ptr [esi + 0x58]
10094c2a  8b465c                         mov eax, dword ptr [esi + 0x5c]
10094c2d  8945e8                         mov dword ptr [ebp - 0x18], eax
10094c30  2b39                           sub edi, dword ptr [ecx]
10094c32  2b7df0                         sub edi, dword ptr [ebp - 0x10]
10094c35  037dec                         add edi, dword ptr [ebp - 0x14]
10094c38  837e0474                       cmp dword ptr [esi + 4], 0x74
10094c3c  7539                           jne 0x10094c77
10094c3e  8b467c                         mov eax, dword ptr [esi + 0x7c]
10094c41  83f802                         cmp eax, 2
10094c44  7e31                           jle 0x10094c77
10094c46  2b7c81fc                       sub edi, dword ptr [ecx + eax*4 - 4]
10094c4a  897de8                         mov dword ptr [ebp - 0x18], edi
10094c4d  2b7df0                         sub edi, dword ptr [ebp - 0x10]
10094c50  85d2                           test edx, edx
10094c52  7e23                           jle 0x10094c77
10094c54  8b8680000000                   mov eax, dword ptr [esi + 0x80]
10094c5a  8bcb                           mov ecx, ebx
10094c5c  68ef220000                     push 0x22ef
10094c61  2b0c90                         sub ecx, dword ptr [eax + edx*4]
10094c64  2b4df8                         sub ecx, dword ptr [ebp - 8]
10094c67  8b45f4                         mov eax, dword ptr [ebp - 0xc]
10094c6a  0345e8                         add eax, dword ptr [ebp - 0x18]
10094c6d  51                             push ecx
10094c6e  8b4dfc                         mov ecx, dword ptr [ebp - 4]
10094c71  50                             push eax
10094c72  e8b9fcfeff                     call 0x10084930
10094c77  8b4678                         mov eax, dword ptr [esi + 0x78]
10094c7a  8b4d0c                         mov ecx, dword ptr [ebp + 0xc]
10094c7d  48                             dec eax
10094c7e  3bc8                           cmp ecx, eax
10094c80  7508                           jne 0x10094c8a
10094c82  85c9                           test ecx, ecx
10094c84  0f8fb4000000                   jg 0x10094d3e
10094c8a  8b45fc                         mov eax, dword ptr [ebp - 4]
10094c8d  8b8e80000000                   mov ecx, dword ptr [esi + 0x80]
10094c93  ffb04c080000                   push dword ptr [eax + 0x84c]
10094c99  8b45f8                         mov eax, dword ptr [ebp - 8]
10094c9c  99                             cdq 
10094c9d  2bc2                           sub eax, edx
10094c9f  8b550c                         mov edx, dword ptr [ebp + 0xc]
10094ca2  d1f8                           sar eax, 1
10094ca4  030491                         add eax, dword ptr [ecx + edx*4]
10094ca7  8b4dfc                         mov ecx, dword ptr [ebp - 4]
10094caa  50                             push eax
10094cab  e820f8feff                     call 0x100844d0
10094cb0  8b8680000000                   mov eax, dword ptr [esi + 0x80]
10094cb6  8bcb                           mov ecx, ebx
10094cb8  8b550c                         mov edx, dword ptr [ebp + 0xc]
10094cbb  6801e10000                     push 0xe101
10094cc0  2b0c90                         sub ecx, dword ptr [eax + edx*4]
10094cc3  2b4df8                         sub ecx, dword ptr [ebp - 8]
10094cc6  8b8688000000                   mov eax, dword ptr [esi + 0x88]
10094ccc  99                             cdq 
10094ccd  51                             push ecx
10094cce  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
10094cd1  2bc2                           sub eax, edx
10094cd3  d1f8                           sar eax, 1
10094cd5  2bc8                           sub ecx, eax
10094cd7  51                             push ecx
10094cd8  8b4dfc                         mov ecx, dword ptr [ebp - 4]
10094cdb  e850fcfeff                     call 0x10084930
10094ce0  57                             push edi
10094ce1  6a64                           push 0x64
10094ce3  6a7d                           push 0x7d
10094ce5  ff7608                         push dword ptr [esi + 8]
10094ce8  ff15c8e20a10                   call dword ptr [0x100ae2c8]
10094cee  8b7dfc                         mov edi, dword ptr [ebp - 4]
10094cf1  8bcf                           mov ecx, edi
10094cf3  50                             push eax
10094cf4  e8d7f7feff                     call 0x100844d0
10094cf9  8b45f8                         mov eax, dword ptr [ebp - 8]
10094cfc  8bcf                           mov ecx, edi
10094cfe  99                             cdq 
10094cff  2bc2                           sub eax, edx
10094d01  d1f8                           sar eax, 1
10094d03  f7d8                           neg eax
10094d05  2b868c000000                   sub eax, dword ptr [esi + 0x8c]
10094d0b  2b45e0                         sub eax, dword ptr [ebp - 0x20]
10094d0e  03c3                           add eax, ebx
10094d10  686de00000                     push 0xe06d
10094d15  50                             push eax
10094d16  8b45f4                         mov eax, dword ptr [ebp - 0xc]
10094d19  2b45ec                         sub eax, dword ptr [ebp - 0x14]
10094d1c  50                             push eax
10094d1d  e80efcfeff                     call 0x10084930
10094d22  83bf6c08000008                 cmp dword ptr [edi + 0x86c], 8
10094d29  8d8758080000                   lea eax, [edi + 0x858]
10094d2f  7202                           jb 0x10094d33
10094d31  8b00                           mov eax, dword ptr [eax]
10094d33  50                             push eax
10094d34  ff7608                         push dword ptr [esi + 8]
10094d37  8bcf                           mov ecx, edi
10094d39  e822f8feff                     call 0x10084560
10094d3e  5f                             pop edi
10094d3f  5e                             pop esi
10094d40  5b                             pop ebx
10094d41  8be5                           mov esp, ebp
10094d43  5d                             pop ebp
10094d44  c20800                         ret 8
10094d47  cc                             int3 
10094d48  cc                             int3 
10094d49  cc                             int3 
10094d4a  cc                             int3 
10094d4b  cc                             int3 
10094d4c  cc                             int3 
10094d4d  cc                             int3 
10094d4e  cc                             int3 
10094d4f  cc                             int3 
