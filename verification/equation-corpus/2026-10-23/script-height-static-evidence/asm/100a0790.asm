; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100a0790 <= VA < 0x100a0a90 (next decompiler entry; may include padding/thunks)
100a0790  55                             push ebp
100a0791  8bec                           mov ebp, esp
100a0793  83ec28                         sub esp, 0x28
100a0796  8bd1                           mov edx, ecx
100a0798  b900200000                     mov ecx, 0x2000
100a079d  53                             push ebx
100a079e  56                             push esi
100a079f  57                             push edi
100a07a0  8b7a7c                         mov edi, dword ptr [edx + 0x7c]
100a07a3  8955e8                         mov dword ptr [ebp - 0x18], edx
100a07a6  8b878c000000                   mov eax, dword ptr [edi + 0x8c]
100a07ac  8b7064                         mov esi, dword ptr [eax + 0x64]
100a07af  837e046f                       cmp dword ptr [esi + 4], 0x6f
100a07b3  752c                           jne 0x100a07e1
100a07b5  8bc1                           mov eax, ecx
100a07b7  6603869c000000                 add ax, word ptr [esi + 0x9c]
100a07be  6683f819                       cmp ax, 0x19
100a07c2  7711                           ja 0x100a07d5
100a07c4  8b4674                         mov eax, dword ptr [esi + 0x74]
100a07c7  c745f801000000                 mov dword ptr [ebp - 8], 1
100a07ce  6683600e01                     and word ptr [eax + 0xe], 1
100a07d3  7507                           jne 0x100a07dc
100a07d5  c745f800000000                 mov dword ptr [ebp - 8], 0
100a07dc  8b7a7c                         mov edi, dword ptr [edx + 0x7c]
100a07df  eb07                           jmp 0x100a07e8
100a07e1  c745f800000000                 mov dword ptr [ebp - 8], 0
100a07e8  8b8790000000                   mov eax, dword ptr [edi + 0x90]
100a07ee  8b4060                         mov eax, dword ptr [eax + 0x60]
100a07f1  8378046f                       cmp dword ptr [eax + 4], 0x6f
100a07f5  751e                           jne 0x100a0815
100a07f7  6603889c000000                 add cx, word ptr [eax + 0x9c]
100a07fe  6683f919                       cmp cx, 0x19
100a0802  7711                           ja 0x100a0815
100a0804  8b4074                         mov eax, dword ptr [eax + 0x74]
100a0807  c745ec01000000                 mov dword ptr [ebp - 0x14], 1
100a080e  6683600e01                     and word ptr [eax + 0xe], 1
100a0813  7507                           jne 0x100a081c
100a0815  c745ec00000000                 mov dword ptr [ebp - 0x14], 0
100a081c  8b4274                         mov eax, dword ptr [edx + 0x74]
100a081f  8b7a54                         mov edi, dword ptr [edx + 0x54]
100a0822  8945fc                         mov dword ptr [ebp - 4], eax
100a0825  8b4268                         mov eax, dword ptr [edx + 0x68]
100a0828  6a64                           push 0x64
100a082a  6a1e                           push 0x1e
100a082c  ffb298000000                   push dword ptr [edx + 0x98]
100a0832  8b8880000000                   mov ecx, dword ptr [eax + 0x80]
100a0838  034a50                         add ecx, dword ptr [edx + 0x50]
100a083b  8b587c                         mov ebx, dword ptr [eax + 0x7c]
100a083e  894de0                         mov dword ptr [ebp - 0x20], ecx
100a0841  8b8a84000000                   mov ecx, dword ptr [edx + 0x84]
100a0847  894de4                         mov dword ptr [ebp - 0x1c], ecx
100a084a  8b4a78                         mov ecx, dword ptr [edx + 0x78]
100a084d  8b4158                         mov eax, dword ptr [ecx + 0x58]
100a0850  8b715c                         mov esi, dword ptr [ecx + 0x5c]
100a0853  8945f0                         mov dword ptr [ebp - 0x10], eax
100a0856  ff15c8e20a10                   call dword ptr [0x100ae2c8]
100a085c  03f7                           add esi, edi
100a085e  03f3                           add esi, ebx
100a0860  8b5de8                         mov ebx, dword ptr [ebp - 0x18]
100a0863  2bf0                           sub esi, eax
100a0865  8975f4                         mov dword ptr [ebp - 0xc], esi
100a0868  837b046c                       cmp dword ptr [ebx + 4], 0x6c
100a086c  7505                           jne 0x100a0873
100a086e  8b4378                         mov eax, dword ptr [ebx + 0x78]
100a0871  eb03                           jmp 0x100a0876
100a0873  8b437c                         mov eax, dword ptr [ebx + 0x7c]
100a0876  8b4858                         mov ecx, dword ptr [eax + 0x58]
100a0879  8b7df8                         mov edi, dword ptr [ebp - 8]
100a087c  8b405c                         mov eax, dword ptr [eax + 0x5c]
100a087f  8945dc                         mov dword ptr [ebp - 0x24], eax
100a0882  894de8                         mov dword ptr [ebp - 0x18], ecx
100a0885  85ff                           test edi, edi
100a0887  740b                           je 0x100a0894
100a0889  837dec00                       cmp dword ptr [ebp - 0x14], 0
100a088d  b807000000                     mov eax, 7
100a0892  7405                           je 0x100a0899
100a0894  b814000000                     mov eax, 0x14
100a0899  6a64                           push 0x64
100a089b  50                             push eax
100a089c  ff7308                         push dword ptr [ebx + 8]
100a089f  ff15c8e20a10                   call dword ptr [0x100ae2c8]
100a08a5  8bc8                           mov ecx, eax
100a08a7  8b45e8                         mov eax, dword ptr [ebp - 0x18]
100a08aa  2b45e4                         sub eax, dword ptr [ebp - 0x1c]
100a08ad  03c8                           add ecx, eax
100a08af  894dec                         mov dword ptr [ebp - 0x14], ecx
100a08b2  85ff                           test edi, edi
100a08b4  740f                           je 0x100a08c5
100a08b6  6a64                           push 0x64
100a08b8  6a0f                           push 0xf
100a08ba  ff7308                         push dword ptr [ebx + 8]
100a08bd  ff15c8e20a10                   call dword ptr [0x100ae2c8]
100a08c3  eb02                           jmp 0x100a08c7
100a08c5  33c0                           xor eax, eax
100a08c7  8b7de0                         mov edi, dword ptr [ebp - 0x20]
100a08ca  6a64                           push 0x64
100a08cc  6a03                           push 3
100a08ce  ff7308                         push dword ptr [ebx + 8]
100a08d1  03f8                           add edi, eax
100a08d3  ff15c8e20a10                   call dword ptr [0x100ae2c8]
100a08d9  8b5358                         mov edx, dword ptr [ebx + 0x58]
100a08dc  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
100a08df  8945f8                         mov dword ptr [ebp - 8], eax
100a08e2  894ddc                         mov dword ptr [ebp - 0x24], ecx
100a08e5  3b9384000000                   cmp edx, dword ptr [ebx + 0x84]
100a08eb  7e25                           jle 0x100a0912
100a08ed  837b046c                       cmp dword ptr [ebx + 4], 0x6c
100a08f1  8bc2                           mov eax, edx
100a08f3  894ddc                         mov dword ptr [ebp - 0x24], ecx
100a08f6  7505                           jne 0x100a08fd
100a08f8  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
100a08fb  eb03                           jmp 0x100a0900
100a08fd  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
100a0900  8b5158                         mov edx, dword ptr [ecx + 0x58]
100a0903  2bc2                           sub eax, edx
100a0905  8b495c                         mov ecx, dword ptr [ecx + 0x5c]
100a0908  99                             cdq 
100a0909  2bc2                           sub eax, edx
100a090b  894ddc                         mov dword ptr [ebp - 0x24], ecx
100a090e  d1f8                           sar eax, 1
100a0910  03f8                           add edi, eax
100a0912  8b4df8                         mov ecx, dword ptr [ebp - 8]
100a0915  8b55ec                         mov edx, dword ptr [ebp - 0x14]
100a0918  8d0409                         lea eax, [ecx + ecx]
100a091b  8945e8                         mov dword ptr [ebp - 0x18], eax
100a091e  85d2                           test edx, edx
100a0920  7963                           jns 0x100a0985
100a0922  8b838c000000                   mov eax, dword ptr [ebx + 0x8c]
100a0928  99                             cdq 
100a0929  2bc2                           sub eax, edx
100a092b  d1f8                           sar eax, 1
100a092d  03c1                           add eax, ecx
100a092f  50                             push eax
100a0930  8b45fc                         mov eax, dword ptr [ebp - 4]
100a0933  8bc8                           mov ecx, eax
100a0935  ffb048080000                   push dword ptr [eax + 0x848]
100a093b  e8903bfeff                     call 0x100844d0
100a0940  0fb783ac000000                 movzx eax, word ptr [ebx + 0xac]
100a0947  8b4dfc                         mov ecx, dword ptr [ebp - 4]
100a094a  50                             push eax
100a094b  56                             push esi
100a094c  57                             push edi
100a094d  e8de3ffeff                     call 0x10084930
100a0952  0fb783ae000000                 movzx eax, word ptr [ebx + 0xae]
100a0959  8b4dfc                         mov ecx, dword ptr [ebp - 4]
100a095c  50                             push eax
100a095d  8bc7                           mov eax, edi
100a095f  2b45f8                         sub eax, dword ptr [ebp - 8]
100a0962  03838c000000                   add eax, dword ptr [ebx + 0x8c]
100a0968  56                             push esi
100a0969  50                             push eax
100a096a  e8c13ffeff                     call 0x10084930
100a096f  8b8b94000000                   mov ecx, dword ptr [ebx + 0x94]
100a0975  2b4de8                         sub ecx, dword ptr [ebp - 0x18]
100a0978  03cf                           add ecx, edi
100a097a  038b8c000000                   add ecx, dword ptr [ebx + 0x8c]
100a0980  e9eb000000                     jmp 0x100a0a70
100a0985  8b45fc                         mov eax, dword ptr [ebp - 4]
100a0988  6a64                           push 0x64
100a098a  6a1a                           push 0x1a
100a098c  52                             push edx
100a098d  8bb048080000                   mov esi, dword ptr [eax + 0x848]
100a0993  ff15c8e20a10                   call dword ptr [0x100ae2c8]
100a0999  0345f8                         add eax, dword ptr [ebp - 8]
100a099c  8b4dfc                         mov ecx, dword ptr [ebp - 4]
100a099f  50                             push eax
100a09a0  56                             push esi
100a09a1  e82a3bfeff                     call 0x100844d0
100a09a6  0fb783b0000000                 movzx eax, word ptr [ebx + 0xb0]
100a09ad  8b4dfc                         mov ecx, dword ptr [ebp - 4]
100a09b0  50                             push eax
100a09b1  ff75f4                         push dword ptr [ebp - 0xc]
100a09b4  8bc7                           mov eax, edi
100a09b6  2b45f8                         sub eax, dword ptr [ebp - 8]
100a09b9  03838c000000                   add eax, dword ptr [ebx + 0x8c]
100a09bf  50                             push eax
100a09c0  e86b3ffeff                     call 0x10084930
100a09c5  8b45ec                         mov eax, dword ptr [ebp - 0x14]
100a09c8  0fb78bb0000000                 movzx ecx, word ptr [ebx + 0xb0]
100a09cf  99                             cdq 
100a09d0  2bc2                           sub eax, edx
100a09d2  8bf0                           mov esi, eax
100a09d4  8b45f8                         mov eax, dword ptr [ebp - 8]
100a09d7  51                             push ecx
100a09d8  ff75f4                         push dword ptr [ebp - 0xc]
100a09db  d1fe                           sar esi, 1
100a09dd  8d0c40                         lea ecx, [eax + eax*2]
100a09e0  8bd6                           mov edx, esi
100a09e2  2bd1                           sub edx, ecx
100a09e4  8b4dfc                         mov ecx, dword ptr [ebp - 4]
100a09e7  039394000000                   add edx, dword ptr [ebx + 0x94]
100a09ed  03d7                           add edx, edi
100a09ef  03938c000000                   add edx, dword ptr [ebx + 0x8c]
100a09f5  52                             push edx
100a09f6  e8353ffeff                     call 0x10084930
100a09fb  8b838c000000                   mov eax, dword ptr [ebx + 0x8c]
100a0a01  99                             cdq 
100a0a02  2bc2                           sub eax, edx
100a0a04  d1f8                           sar eax, 1
100a0a06  0345f8                         add eax, dword ptr [ebp - 8]
100a0a09  50                             push eax
100a0a0a  8b45fc                         mov eax, dword ptr [ebp - 4]
100a0a0d  8bc8                           mov ecx, eax
100a0a0f  ffb048080000                   push dword ptr [eax + 0x848]
100a0a15  e8b63afeff                     call 0x100844d0
100a0a1a  0fb783ac000000                 movzx eax, word ptr [ebx + 0xac]
100a0a21  8b4dfc                         mov ecx, dword ptr [ebp - 4]
100a0a24  50                             push eax
100a0a25  ff75f4                         push dword ptr [ebp - 0xc]
100a0a28  57                             push edi
100a0a29  e8023ffeff                     call 0x10084930
100a0a2e  0fb783ae000000                 movzx eax, word ptr [ebx + 0xae]
100a0a35  2b75e8                         sub esi, dword ptr [ebp - 0x18]
100a0a38  8b4dfc                         mov ecx, dword ptr [ebp - 4]
100a0a3b  03f7                           add esi, edi
100a0a3d  03b38c000000                   add esi, dword ptr [ebx + 0x8c]
100a0a43  50                             push eax
100a0a44  ff75f4                         push dword ptr [ebp - 0xc]
100a0a47  56                             push esi
100a0a48  e8e33efeff                     call 0x10084930
100a0a4d  8b4df8                         mov ecx, dword ptr [ebp - 8]
100a0a50  8b75f4                         mov esi, dword ptr [ebp - 0xc]
100a0a53  8d048d00000000                 lea eax, [ecx*4]
100a0a5a  8b8b94000000                   mov ecx, dword ptr [ebx + 0x94]
100a0a60  2bc8                           sub ecx, eax
100a0a62  8b838c000000                   mov eax, dword ptr [ebx + 0x8c]
100a0a68  03cf                           add ecx, edi
100a0a6a  48                             dec eax
100a0a6b  034dec                         add ecx, dword ptr [ebp - 0x14]
100a0a6e  03c8                           add ecx, eax
100a0a70  0fb783b2000000                 movzx eax, word ptr [ebx + 0xb2]
100a0a77  50                             push eax
100a0a78  56                             push esi
100a0a79  51                             push ecx
100a0a7a  8b4dfc                         mov ecx, dword ptr [ebp - 4]
100a0a7d  e8ae3efeff                     call 0x10084930
100a0a82  5f                             pop edi
100a0a83  5e                             pop esi
100a0a84  5b                             pop ebx
100a0a85  8be5                           mov esp, ebp
100a0a87  5d                             pop ebp
100a0a88  c20400                         ret 4
100a0a8b  cc                             int3 
100a0a8c  cc                             int3 
100a0a8d  cc                             int3 
100a0a8e  cc                             int3 
100a0a8f  cc                             int3 
