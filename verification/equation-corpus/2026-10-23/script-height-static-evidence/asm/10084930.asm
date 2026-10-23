; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10084930 <= VA < 0x10084cf0 (next decompiler entry; may include padding/thunks)
10084930  55                             push ebp
10084931  8bec                           mov ebp, esp
10084933  6aff                           push -1
10084935  68bcb50a10                     push 0x100ab5bc
1008493a  64a100000000                   mov eax, dword ptr fs:[0]
10084940  50                             push eax
10084941  81ec1c020000                   sub esp, 0x21c
10084947  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008494c  33c5                           xor eax, ebp
1008494e  8945f0                         mov dword ptr [ebp - 0x10], eax
10084951  53                             push ebx
10084952  56                             push esi
10084953  57                             push edi
10084954  50                             push eax
10084955  8d45f4                         lea eax, [ebp - 0xc]
10084958  64a300000000                   mov dword ptr fs:[0], eax
1008495e  8bd9                           mov ebx, ecx
10084960  899de4fdffff                   mov dword ptr [ebp - 0x21c], ebx
10084966  668b5510                       mov dx, word ptr [ebp + 0x10]
1008496a  6683fa20                       cmp dx, 0x20
1008496e  0f825b030000                   jb 0x10084ccf
10084974  833b00                         cmp dword ptr [ebx], 0
10084977  0f8452030000                   je 0x10084ccf
1008497d  6685d2                         test dx, dx
10084980  0f8449030000                   je 0x10084ccf
10084986  b8eae00000                     mov eax, 0xe0ea
1008498b  663bd0                         cmp dx, ax
1008498e  7463                           je 0x100849f3
10084990  b826200000                     mov eax, 0x2026
10084995  663bd0                         cmp dx, ax
10084998  7559                           jne 0x100849f3
1008499a  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
100849a1  8dbb58080000                   lea edi, [ebx + 0x858]
100849a7  7206                           jb 0x100849af
100849a9  8bbb58080000                   mov edi, dword ptr [ebx + 0x858]
100849af  83bb6808000007                 cmp dword ptr [ebx + 0x868], 7
100849b6  753b                           jne 0x100849f3
100849b8  b9b0f20b10                     mov ecx, 0x100bf2b0
100849bd  be07000000                     mov esi, 7
100849c2  2bf9                           sub edi, ecx
100849c4  668b040f                       mov ax, word ptr [edi + ecx]
100849c8  663b01                         cmp ax, word ptr [ecx]
100849cb  7526                           jne 0x100849f3
100849cd  83c102                         add ecx, 2
100849d0  83ee01                         sub esi, 1
100849d3  75ef                           jne 0x100849c4
100849d5  660f6e8348080000               movd xmm0, dword ptr [ebx + 0x848]
100849dd  8b750c                         mov esi, dword ptr [ebp + 0xc]
100849e0  0f5bc0                         cvtdq2ps xmm0, xmm0
100849e3  f30f5905dcfd0b10               mulss xmm0, dword ptr [0x100bfddc]
100849eb  f30f2cc0                       cvttss2si eax, xmm0
100849ef  03f0                           add esi, eax
100849f1  eb03                           jmp 0x100849f6
100849f3  8b750c                         mov esi, dword ptr [ebp + 0xc]
100849f6  83bb5008000000                 cmp dword ptr [ebx + 0x850], 0
100849fd  8b0df8e00a10                   mov ecx, dword ptr [0x100ae0f8]
10084a03  89b5e0fdffff                   mov dword ptr [ebp - 0x220], esi
10084a09  0f85fd000000                   jne 0x10084b0c
10084a0f  b81b1f0000                     mov eax, 0x1f1b
10084a14  6603c2                         add ax, dx
10084a17  6683f819                       cmp ax, 0x19
10084a1b  0f87ab000000                   ja 0x10084acc
10084a21  b87c1f0000                     mov eax, 0x1f7c
10084a26  6603d0                         add dx, ax
10084a29  68e8030000                     push 0x3e8
10084a2e  66895510                       mov word ptr [ebp + 0x10], dx
10084a32  6a43                           push 0x43
10084a34  ff7314                         push dword ptr [ebx + 0x14]
10084a37  ffd1                           call ecx
10084a39  83c40c                         add esp, 0xc
10084a3c  2bf0                           sub esi, eax
10084a3e  89b5e0fdffff                   mov dword ptr [ebp - 0x220], esi
10084a44  ff7510                         push dword ptr [ebp + 0x10]
10084a47  8bcb                           mov ecx, ebx
10084a49  e8c2fbffff                     call 0x10084610
10084a4e  33c9                           xor ecx, ecx
10084a50  85c0                           test eax, eax
10084a52  0f94c1                         sete cl
10084a55  898dd8fdffff                   mov dword ptr [ebp - 0x228], ecx
10084a5b  85c0                           test eax, eax
10084a5d  0f855a010000                   jne 0x10084bbd
10084a63  8d8de4fdffff                   lea ecx, [ebp - 0x21c]
10084a69  ff1590e00a10                   call dword ptr [0x100ae090]
10084a6f  8d85e4fdffff                   lea eax, [ebp - 0x21c]
10084a75  c745fc00000000                 mov dword ptr [ebp - 4], 0
10084a7c  50                             push eax
10084a7d  68c0f20b10                     push 0x100bf2c0
10084a82  6a00                           push 0
10084a84  ff1538e20a10                   call dword ptr [0x100ae238]
10084a8a  8d4328                         lea eax, [ebx + 0x28]
10084a8d  50                             push eax
10084a8e  8d85e8fdffff                   lea eax, [ebp - 0x218]
10084a94  6804010000                     push 0x104
10084a99  50                             push eax
10084a9a  ff1554e60a10                   call dword ptr [0x100ae654]
10084aa0  83c40c                         add esp, 0xc
10084aa3  8d7304                         lea esi, [ebx + 4]
10084aa6  8bcb                           mov ecx, ebx
10084aa8  ffb5e4fdffff                   push dword ptr [ebp - 0x21c]
10084aae  56                             push esi
10084aaf  e8bcfcffff                     call 0x10084770
10084ab4  8d8de4fdffff                   lea ecx, [ebp - 0x21c]
10084aba  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
10084ac1  ff1554e20a10                   call dword ptr [0x100ae254]
10084ac7  e9f4000000                     jmp 0x10084bc0
10084acc  b800200000                     mov eax, 0x2000
10084ad1  6603c2                         add ax, dx
10084ad4  6683f819                       cmp ax, 0x19
10084ad8  7718                           ja 0x10084af2
10084ada  b841200000                     mov eax, 0x2041
10084adf  6603d0                         add dx, ax
10084ae2  68e8030000                     push 0x3e8
10084ae7  66895510                       mov word ptr [ebp + 0x10], dx
10084aeb  6a41                           push 0x41
10084aed  e942ffffff                     jmp 0x10084a34
10084af2  b85be00000                     mov eax, 0xe05b
10084af7  663bd0                         cmp dx, ax
10084afa  0f8544ffffff                   jne 0x10084a44
10084b00  c7451072e00000                 mov dword ptr [ebp + 0x10], 0xe072
10084b07  e938ffffff                     jmp 0x10084a44
10084b0c  8b4510                         mov eax, dword ptr [ebp + 0x10]
10084b0f  0500200000                     add eax, 0x2000
10084b14  6683f819                       cmp ax, 0x19
10084b18  0f8726ffffff                   ja 0x10084a44
10084b1e  81ec20040000                   sub esp, 0x420
10084b24  8d7304                         lea esi, [ebx + 4]
10084b27  b801000000                     mov eax, 1
10084b2c  8bfc                           mov edi, esp
10084b2e  6689430e                       mov word ptr [ebx + 0xe], ax
10084b32  b908010000                     mov ecx, 0x108
10084b37  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
10084b39  8bcb                           mov ecx, ebx
10084b3b  e8e0fcffff                     call 0x10084820
10084b40  8b0b                           mov ecx, dword ptr [ebx]
10084b42  8b1d2cff0d10                   mov ebx, dword ptr [0x100dff2c]
10084b48  50                             push eax
10084b49  ffd3                           call ebx
10084b4b  8b8de4fdffff                   mov ecx, dword ptr [ebp - 0x21c]
10084b51  8bf8                           mov edi, eax
10084b53  8b35a4fe0d10                   mov esi, dword ptr [0x100dfea4]
10084b59  6a18                           push 0x18
10084b5b  8b09                           mov ecx, dword ptr [ecx]
10084b5d  ffd6                           call esi
10084b5f  8b85e4fdffff                   mov eax, dword ptr [ebp - 0x21c]
10084b65  6a64                           push 0x64
10084b67  6a55                           push 0x55
10084b69  ff7014                         push dword ptr [eax + 0x14]
10084b6c  ff15f8e00a10                   call dword ptr [0x100ae0f8]
10084b72  8b8de0fdffff                   mov ecx, dword ptr [ebp - 0x220]
10084b78  83c40c                         add esp, 0xc
10084b7b  03c8                           add ecx, eax
10084b7d  8d4510                         lea eax, [ebp + 0x10]
10084b80  6a00                           push 0
10084b82  6a01                           push 1
10084b84  50                             push eax
10084b85  8b85e4fdffff                   mov eax, dword ptr [ebp - 0x21c]
10084b8b  6a00                           push 0
10084b8d  6a00                           push 0
10084b8f  51                             push ecx
10084b90  ff7508                         push dword ptr [ebp + 8]
10084b93  8b08                           mov ecx, dword ptr [eax]
10084b95  ff159cfe0d10                   call dword ptr [0x100dfe9c]
10084b9b  8b85e4fdffff                   mov eax, dword ptr [ebp - 0x21c]
10084ba1  6a00                           push 0
10084ba3  8b08                           mov ecx, dword ptr [eax]
10084ba5  ffd6                           call esi
10084ba7  8bb5e4fdffff                   mov esi, dword ptr [ebp - 0x21c]
10084bad  57                             push edi
10084bae  8b0e                           mov ecx, dword ptr [esi]
10084bb0  ffd3                           call ebx
10084bb2  33c0                           xor eax, eax
10084bb4  6689460e                       mov word ptr [esi + 0xe], ax
10084bb8  e912010000                     jmp 0x10084ccf
10084bbd  8d7304                         lea esi, [ebx + 4]
10084bc0  81ec20040000                   sub esp, 0x420
10084bc6  b908010000                     mov ecx, 0x108
10084bcb  8bfc                           mov edi, esp
10084bcd  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
10084bcf  8bcb                           mov ecx, ebx
10084bd1  e84afcffff                     call 0x10084820
10084bd6  8b0b                           mov ecx, dword ptr [ebx]
10084bd8  50                             push eax
10084bd9  ff152cff0d10                   call dword ptr [0x100dff2c]
10084bdf  668b4d10                       mov cx, word ptr [ebp + 0x10]
10084be3  8985dcfdffff                   mov dword ptr [ebp - 0x224], eax
10084be9  b844e00000                     mov eax, 0xe044
10084bee  663bc8                         cmp cx, ax
10084bf1  720a                           jb 0x10084bfd
10084bf3  b884e00000                     mov eax, 0xe084
10084bf8  663bc8                         cmp cx, ax
10084bfb  760e                           jbe 0x10084c0b
10084bfd  8b4510                         mov eax, dword ptr [ebp + 0x10]
10084c00  05001f0000                     add eax, 0x1f00
10084c05  6683f805                       cmp ax, 5
10084c09  7759                           ja 0x10084c64
10084c0b  b878e00000                     mov eax, 0xe078
10084c10  663bc8                         cmp cx, ax
10084c13  7320                           jae 0x10084c35
10084c15  8b8de0fdffff                   mov ecx, dword ptr [ebp - 0x220]
10084c1b  8d4510                         lea eax, [ebp + 0x10]
10084c1e  6a00                           push 0
10084c20  6a01                           push 1
10084c22  50                             push eax
10084c23  6a00                           push 0
10084c25  6a00                           push 0
10084c27  51                             push ecx
10084c28  ff7508                         push dword ptr [ebp + 8]
10084c2b  8b0b                           mov ecx, dword ptr [ebx]
10084c2d  ff159cfe0d10                   call dword ptr [0x100dfe9c]
10084c33  eb71                           jmp 0x10084ca6
10084c35  8b3d18fe0d10                   mov edi, dword ptr [0x100dfe18]
10084c3b  6a02                           push 2
10084c3d  ffd7                           call edi
10084c3f  8b8de0fdffff                   mov ecx, dword ptr [ebp - 0x220]
10084c45  8bf0                           mov esi, eax
10084c47  6a00                           push 0
10084c49  6a01                           push 1
10084c4b  8d4510                         lea eax, [ebp + 0x10]
10084c4e  50                             push eax
10084c4f  6a00                           push 0
10084c51  6a00                           push 0
10084c53  51                             push ecx
10084c54  ff7508                         push dword ptr [ebp + 8]
10084c57  8b0b                           mov ecx, dword ptr [ebx]
10084c59  ff159cfe0d10                   call dword ptr [0x100dfe9c]
10084c5f  56                             push esi
10084c60  ffd7                           call edi
10084c62  eb42                           jmp 0x10084ca6
10084c64  8b0b                           mov ecx, dword ptr [ebx]
10084c66  8b35a4fe0d10                   mov esi, dword ptr [0x100dfea4]
10084c6c  6a18                           push 0x18
10084c6e  ffd6                           call esi
10084c70  6a64                           push 0x64
10084c72  6a55                           push 0x55
10084c74  ff7314                         push dword ptr [ebx + 0x14]
10084c77  ff15f8e00a10                   call dword ptr [0x100ae0f8]
10084c7d  8b8de0fdffff                   mov ecx, dword ptr [ebp - 0x220]
10084c83  83c40c                         add esp, 0xc
10084c86  03c8                           add ecx, eax
10084c88  8d4510                         lea eax, [ebp + 0x10]
10084c8b  6a00                           push 0
10084c8d  6a01                           push 1
10084c8f  50                             push eax
10084c90  6a00                           push 0
10084c92  6a00                           push 0
10084c94  51                             push ecx
10084c95  ff7508                         push dword ptr [ebp + 8]
10084c98  8b0b                           mov ecx, dword ptr [ebx]
10084c9a  ff159cfe0d10                   call dword ptr [0x100dfe9c]
10084ca0  8b0b                           mov ecx, dword ptr [ebx]
10084ca2  6a00                           push 0
10084ca4  ffd6                           call esi
10084ca6  ffb5dcfdffff                   push dword ptr [ebp - 0x224]
10084cac  8b0b                           mov ecx, dword ptr [ebx]
10084cae  ff152cff0d10                   call dword ptr [0x100dff2c]
10084cb4  83bdd8fdffff00                 cmp dword ptr [ebp - 0x228], 0
10084cbb  7412                           je 0x10084ccf
10084cbd  8d85e8fdffff                   lea eax, [ebp - 0x218]
10084cc3  8bcb                           mov ecx, ebx
10084cc5  50                             push eax
10084cc6  8d4304                         lea eax, [ebx + 4]
10084cc9  50                             push eax
10084cca  e8a1faffff                     call 0x10084770
10084ccf  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
10084cd2  64890d00000000                 mov dword ptr fs:[0], ecx
10084cd9  59                             pop ecx
10084cda  5f                             pop edi
10084cdb  5e                             pop esi
10084cdc  5b                             pop ebx
10084cdd  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
10084ce0  33cd                           xor ecx, ebp
10084ce2  e870dc0100                     call 0x100a2957
10084ce7  8be5                           mov esp, ebp
10084ce9  5d                             pop ebp
10084cea  c20c00                         ret 0xc
10084ced  cc                             int3 
10084cee  cc                             int3 
10084cef  cc                             int3 
