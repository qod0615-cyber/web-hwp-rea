; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100a1830 <= VA < 0x100a1c30 (next decompiler entry; may include padding/thunks)
100a1830  55                             push ebp
100a1831  8bec                           mov ebp, esp
100a1833  83ec20                         sub esp, 0x20
100a1836  53                             push ebx
100a1837  56                             push esi
100a1838  8bf1                           mov esi, ecx
100a183a  8975fc                         mov dword ptr [ebp - 4], esi
100a183d  8b0e                           mov ecx, dword ptr [esi]
100a183f  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
100a1846  8d8158080000                   lea eax, [ecx + 0x858]
100a184c  7202                           jb 0x100a1850
100a184e  8b00                           mov eax, dword ptr [eax]
100a1850  50                             push eax
100a1851  ff7618                         push dword ptr [esi + 0x18]
100a1854  e8072dfeff                     call 0x10084560
100a1859  8b06                           mov eax, dword ptr [esi]
100a185b  8b4e10                         mov ecx, dword ptr [esi + 0x10]
100a185e  8b9848080000                   mov ebx, dword ptr [eax + 0x848]
100a1864  3b4e14                         cmp ecx, dword ptr [esi + 0x14]
100a1867  7d61                           jge 0x100a18ca
100a1869  ffb04c080000                   push dword ptr [eax + 0x84c]
100a186f  51                             push ecx
100a1870  8bc8                           mov ecx, eax
100a1872  e8592cfeff                     call 0x100844d0
100a1877  8b4604                         mov eax, dword ptr [esi + 4]
100a187a  83f804                         cmp eax, 4
100a187d  7424                           je 0x100a18a3
100a187f  83f80c                         cmp eax, 0xc
100a1882  741f                           je 0x100a18a3
100a1884  83f803                         cmp eax, 3
100a1887  740a                           je 0x100a1893
100a1889  83f80b                         cmp eax, 0xb
100a188c  7405                           je 0x100a1893
100a188e  8b560c                         mov edx, dword ptr [esi + 0xc]
100a1891  eb20                           jmp 0x100a18b3
100a1893  8bc3                           mov eax, ebx
100a1895  99                             cdq 
100a1896  83e207                         and edx, 7
100a1899  03d0                           add edx, eax
100a189b  c1fa03                         sar edx, 3
100a189e  03560c                         add edx, dword ptr [esi + 0xc]
100a18a1  eb10                           jmp 0x100a18b3
100a18a3  8bc3                           mov eax, ebx
100a18a5  99                             cdq 
100a18a6  83e207                         and edx, 7
100a18a9  03c2                           add eax, edx
100a18ab  8b560c                         mov edx, dword ptr [esi + 0xc]
100a18ae  c1f803                         sar eax, 3
100a18b1  2bd0                           sub edx, eax
100a18b3  0fb74628                       movzx eax, word ptr [esi + 0x28]
100a18b7  8b4e08                         mov ecx, dword ptr [esi + 8]
100a18ba  50                             push eax
100a18bb  51                             push ecx
100a18bc  8b0e                           mov ecx, dword ptr [esi]
100a18be  52                             push edx
100a18bf  e86c30feff                     call 0x10084930
100a18c4  5e                             pop esi
100a18c5  5b                             pop ebx
100a18c6  8be5                           mov esp, ebp
100a18c8  5d                             pop ebp
100a18c9  c3                             ret 
100a18ca  8b5004                         mov edx, dword ptr [eax + 4]
100a18cd  33c9                           xor ecx, ecx
100a18cf  81fabc020000                   cmp edx, 0x2bc
100a18d5  c7805408000000000000           mov dword ptr [eax + 0x854], 0
100a18df  c7400490010000                 mov dword ptr [eax + 4], 0x190
100a18e6  8b4604                         mov eax, dword ptr [esi + 4]
100a18e9  0f94c1                         sete cl
100a18ec  8955e0                         mov dword ptr [ebp - 0x20], edx
100a18ef  894de4                         mov dword ptr [ebp - 0x1c], ecx
100a18f2  57                             push edi
100a18f3  83f801                         cmp eax, 1
100a18f6  0f844b020000                   je 0x100a1b47
100a18fc  83f809                         cmp eax, 9
100a18ff  0f8442020000                   je 0x100a1b47
100a1905  83f802                         cmp eax, 2
100a1908  0f841b010000                   je 0x100a1a29
100a190e  83f80a                         cmp eax, 0xa
100a1911  0f8412010000                   je 0x100a1a29
100a1917  83f803                         cmp eax, 3
100a191a  0f848a000000                   je 0x100a19aa
100a1920  83f80b                         cmp eax, 0xb
100a1923  0f8481000000                   je 0x100a19aa
100a1929  83f804                         cmp eax, 4
100a192c  742c                           je 0x100a195a
100a192e  83f80c                         cmp eax, 0xc
100a1931  7427                           je 0x100a195a
100a1933  8b0e                           mov ecx, dword ptr [esi]
100a1935  ffb14c080000                   push dword ptr [ecx + 0x84c]
100a193b  ff7610                         push dword ptr [esi + 0x10]
100a193e  e88d2bfeff                     call 0x100844d0
100a1943  0fb74628                       movzx eax, word ptr [esi + 0x28]
100a1947  8b0e                           mov ecx, dword ptr [esi]
100a1949  50                             push eax
100a194a  ff7608                         push dword ptr [esi + 8]
100a194d  ff760c                         push dword ptr [esi + 0xc]
100a1950  e8db2ffeff                     call 0x10084930
100a1955  e9a9020000                     jmp 0x100a1c03
100a195a  8b06                           mov eax, dword ptr [esi]
100a195c  8b7e10                         mov edi, dword ptr [esi + 0x10]
100a195f  8b884c080000                   mov ecx, dword ptr [eax + 0x84c]
100a1965  8d0449                         lea eax, [ecx + ecx*2]
100a1968  03c0                           add eax, eax
100a196a  3bf8                           cmp edi, eax
100a196c  7c0e                           jl 0x100a197c
100a196e  b8abaaaa2a                     mov eax, 0x2aaaaaab
100a1973  f7ef                           imul edi
100a1975  8bca                           mov ecx, edx
100a1977  c1e91f                         shr ecx, 0x1f
100a197a  03ca                           add ecx, edx
100a197c  51                             push ecx
100a197d  8b0e                           mov ecx, dword ptr [esi]
100a197f  57                             push edi
100a1980  e84b2bfeff                     call 0x100844d0
100a1985  0fb74628                       movzx eax, word ptr [esi + 0x28]
100a1989  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
100a198c  50                             push eax
100a198d  ff7608                         push dword ptr [esi + 8]
100a1990  8bc3                           mov eax, ebx
100a1992  99                             cdq 
100a1993  83e207                         and edx, 7
100a1996  03c2                           add eax, edx
100a1998  c1f803                         sar eax, 3
100a199b  2bc8                           sub ecx, eax
100a199d  51                             push ecx
100a199e  8b0e                           mov ecx, dword ptr [esi]
100a19a0  e88b2ffeff                     call 0x10084930
100a19a5  e959020000                     jmp 0x100a1c03
100a19aa  0fb74620                       movzx eax, word ptr [esi + 0x20]
100a19ae  8b5e10                         mov ebx, dword ptr [esi + 0x10]
100a19b1  8b0e                           mov ecx, dword ptr [esi]
100a19b3  2b5e14                         sub ebx, dword ptr [esi + 0x14]
100a19b6  50                             push eax
100a19b7  ff7608                         push dword ptr [esi + 8]
100a19ba  ff760c                         push dword ptr [esi + 0xc]
100a19bd  e86e2ffeff                     call 0x10084930
100a19c2  0fb74622                       movzx eax, word ptr [esi + 0x22]
100a19c6  8b0e                           mov ecx, dword ptr [esi]
100a19c8  50                             push eax
100a19c9  8b4630                         mov eax, dword ptr [esi + 0x30]
100a19cc  034608                         add eax, dword ptr [esi + 8]
100a19cf  03c3                           add eax, ebx
100a19d1  50                             push eax
100a19d2  ff760c                         push dword ptr [esi + 0xc]
100a19d5  e8562ffeff                     call 0x10084930
100a19da  6a64                           push 0x64
100a19dc  6a50                           push 0x50
100a19de  ff7630                         push dword ptr [esi + 0x30]
100a19e1  8b35c8e20a10                   mov esi, dword ptr [0x100ae2c8]
100a19e7  ffd6                           call esi
100a19e9  8bf8                           mov edi, eax
100a19eb  8b45fc                         mov eax, dword ptr [ebp - 4]
100a19ee  6a64                           push 0x64
100a19f0  6a05                           push 5
100a19f2  ff7038                         push dword ptr [eax + 0x38]
100a19f5  ffd6                           call esi
100a19f7  8b75fc                         mov esi, dword ptr [ebp - 4]
100a19fa  03c7                           add eax, edi
100a19fc  03c3                           add eax, ebx
100a19fe  8b0e                           mov ecx, dword ptr [esi]
100a1a00  ffb14c080000                   push dword ptr [ecx + 0x84c]
100a1a06  50                             push eax
100a1a07  e8c42afeff                     call 0x100844d0
100a1a0c  0fb74626                       movzx eax, word ptr [esi + 0x26]
100a1a10  8b0e                           mov ecx, dword ptr [esi]
100a1a12  50                             push eax
100a1a13  8b4630                         mov eax, dword ptr [esi + 0x30]
100a1a16  2bc7                           sub eax, edi
100a1a18  034608                         add eax, dword ptr [esi + 8]
100a1a1b  50                             push eax
100a1a1c  ff760c                         push dword ptr [esi + 0xc]
100a1a1f  e80c2ffeff                     call 0x10084930
100a1a24  e9da010000                     jmp 0x100a1c03
100a1a29  8b06                           mov eax, dword ptr [esi]
100a1a2b  6a64                           push 0x64
100a1a2d  6a05                           push 5
100a1a2f  ffb048080000                   push dword ptr [eax + 0x848]
100a1a35  ff15c8e20a10                   call dword ptr [0x100ae2c8]
100a1a3b  8945f4                         mov dword ptr [ebp - 0xc], eax
100a1a3e  8b4610                         mov eax, dword ptr [esi + 0x10]
100a1a41  2b4614                         sub eax, dword ptr [esi + 0x14]
100a1a44  99                             cdq 
100a1a45  2bc2                           sub eax, edx
100a1a47  8b7630                         mov esi, dword ptr [esi + 0x30]
100a1a4a  d1f8                           sar eax, 1
100a1a4c  8b55fc                         mov edx, dword ptr [ebp - 4]
100a1a4f  8945f8                         mov dword ptr [ebp - 8], eax
100a1a52  8975e8                         mov dword ptr [ebp - 0x18], esi
100a1a55  660f6ec0                       movd xmm0, eax
100a1a59  0f5bc0                         cvtdq2ps xmm0, xmm0
100a1a5c  8b4a08                         mov ecx, dword ptr [edx + 8]
100a1a5f  8b5a48                         mov ebx, dword ptr [edx + 0x48]
100a1a62  894df0                         mov dword ptr [ebp - 0x10], ecx
100a1a65  8d3c31                         lea edi, [ecx + esi]
100a1a68  f30f5905d8fd0b10               mulss xmm0, dword ptr [0x100bfdd8]
100a1a70  f30f5e05e0fd0b10               divss xmm0, dword ptr [0x100bfde0]
100a1a78  f30f2cc0                       cvttss2si eax, xmm0
100a1a7c  8945ec                         mov dword ptr [ebp - 0x14], eax
100a1a7f  0fb74220                       movzx eax, word ptr [edx + 0x20]
100a1a83  50                             push eax
100a1a84  51                             push ecx
100a1a85  ff720c                         push dword ptr [edx + 0xc]
100a1a88  8b0a                           mov ecx, dword ptr [edx]
100a1a8a  e8a12efeff                     call 0x10084930
100a1a8f  8b4dfc                         mov ecx, dword ptr [ebp - 4]
100a1a92  0fb74126                       movzx eax, word ptr [ecx + 0x26]
100a1a96  50                             push eax
100a1a97  8b45f8                         mov eax, dword ptr [ebp - 8]
100a1a9a  03c7                           add eax, edi
100a1a9c  50                             push eax
100a1a9d  ff710c                         push dword ptr [ecx + 0xc]
100a1aa0  8b09                           mov ecx, dword ptr [ecx]
100a1aa2  e8892efeff                     call 0x10084930
100a1aa7  8b55fc                         mov edx, dword ptr [ebp - 4]
100a1aaa  8b4df8                         mov ecx, dword ptr [ebp - 8]
100a1aad  0fb74222                       movzx eax, word ptr [edx + 0x22]
100a1ab1  50                             push eax
100a1ab2  8b45f0                         mov eax, dword ptr [ebp - 0x10]
100a1ab5  8d0448                         lea eax, [eax + ecx*2]
100a1ab8  8b0a                           mov ecx, dword ptr [edx]
100a1aba  03c6                           add eax, esi
100a1abc  03c3                           add eax, ebx
100a1abe  50                             push eax
100a1abf  ff720c                         push dword ptr [edx + 0xc]
100a1ac2  e8692efeff                     call 0x10084930
100a1ac7  660f6e45f8                     movd xmm0, dword ptr [ebp - 8]
100a1acc  0f5bc0                         cvtdq2ps xmm0, xmm0
100a1acf  8b45fc                         mov eax, dword ptr [ebp - 4]
100a1ad2  8b55f4                         mov edx, dword ptr [ebp - 0xc]
100a1ad5  8b08                           mov ecx, dword ptr [eax]
100a1ad7  f30f5e051cfe0b10               divss xmm0, dword ptr [0x100bfe1c]
100a1adf  8d3412                         lea esi, [edx + edx]
100a1ae2  ffb14c080000                   push dword ptr [ecx + 0x84c]
100a1ae8  f30f2cc0                       cvttss2si eax, xmm0
100a1aec  2bf0                           sub esi, eax
100a1aee  56                             push esi
100a1aef  e8dc29feff                     call 0x100844d0
100a1af4  8b4dfc                         mov ecx, dword ptr [ebp - 4]
100a1af7  2b7dec                         sub edi, dword ptr [ebp - 0x14]
100a1afa  2b7df4                         sub edi, dword ptr [ebp - 0xc]
100a1afd  0fb74124                       movzx eax, word ptr [ecx + 0x24]
100a1b01  50                             push eax
100a1b02  57                             push edi
100a1b03  ff710c                         push dword ptr [ecx + 0xc]
100a1b06  8b09                           mov ecx, dword ptr [ecx]
100a1b08  e8232efeff                     call 0x10084930
100a1b0d  8b45fc                         mov eax, dword ptr [ebp - 4]
100a1b10  8b08                           mov ecx, dword ptr [eax]
100a1b12  ffb14c080000                   push dword ptr [ecx + 0x84c]
100a1b18  56                             push esi
100a1b19  e8b229feff                     call 0x100844d0
100a1b1e  8b75fc                         mov esi, dword ptr [ebp - 4]
100a1b21  0fb74624                       movzx eax, word ptr [esi + 0x24]
100a1b25  50                             push eax
100a1b26  8b45f0                         mov eax, dword ptr [ebp - 0x10]
100a1b29  2b45ec                         sub eax, dword ptr [ebp - 0x14]
100a1b2c  2b45f4                         sub eax, dword ptr [ebp - 0xc]
100a1b2f  0345e8                         add eax, dword ptr [ebp - 0x18]
100a1b32  8b0e                           mov ecx, dword ptr [esi]
100a1b34  03c3                           add eax, ebx
100a1b36  0345f8                         add eax, dword ptr [ebp - 8]
100a1b39  50                             push eax
100a1b3a  ff760c                         push dword ptr [esi + 0xc]
100a1b3d  e8ee2dfeff                     call 0x10084930
100a1b42  e9bc000000                     jmp 0x100a1c03
100a1b47  0fb74620                       movzx eax, word ptr [esi + 0x20]
100a1b4b  8b7e48                         mov edi, dword ptr [esi + 0x48]
100a1b4e  2b7e14                         sub edi, dword ptr [esi + 0x14]
100a1b51  8b0e                           mov ecx, dword ptr [esi]
100a1b53  037e10                         add edi, dword ptr [esi + 0x10]
100a1b56  50                             push eax
100a1b57  ff7608                         push dword ptr [esi + 8]
100a1b5a  ff760c                         push dword ptr [esi + 0xc]
100a1b5d  e8ce2dfeff                     call 0x10084930
100a1b62  0fb74622                       movzx eax, word ptr [esi + 0x22]
100a1b66  8b0e                           mov ecx, dword ptr [esi]
100a1b68  50                             push eax
100a1b69  8b4630                         mov eax, dword ptr [esi + 0x30]
100a1b6c  034608                         add eax, dword ptr [esi + 8]
100a1b6f  03c7                           add eax, edi
100a1b71  50                             push eax
100a1b72  ff760c                         push dword ptr [esi + 0xc]
100a1b75  e8b62dfeff                     call 0x10084930
100a1b7a  6a64                           push 0x64
100a1b7c  6a05                           push 5
100a1b7e  ff7630                         push dword ptr [esi + 0x30]
100a1b81  8b35c8e20a10                   mov esi, dword ptr [0x100ae2c8]
100a1b87  ffd6                           call esi
100a1b89  8bd8                           mov ebx, eax
100a1b8b  8b45fc                         mov eax, dword ptr [ebp - 4]
100a1b8e  6a64                           push 0x64
100a1b90  6a05                           push 5
100a1b92  895de8                         mov dword ptr [ebp - 0x18], ebx
100a1b95  ff7038                         push dword ptr [eax + 0x38]
100a1b98  ffd6                           call esi
100a1b9a  03c3                           add eax, ebx
100a1b9c  8b75fc                         mov esi, dword ptr [ebp - 4]
100a1b9f  03c7                           add eax, edi
100a1ba1  33db                           xor ebx, ebx
100a1ba3  660f6ec0                       movd xmm0, eax
100a1ba7  0f5bc0                         cvtdq2ps xmm0, xmm0
100a1baa  f30f5e05d0fd0b10               divss xmm0, dword ptr [0x100bfdd0]
100a1bb2  f30f2cf8                       cvttss2si edi, xmm0
100a1bb6  85ff                           test edi, edi
100a1bb8  7e49                           jle 0x100a1c03
100a1bba  660f1f440000                   nop word ptr [eax + eax]
100a1bc0  8b0e                           mov ecx, dword ptr [esi]
100a1bc2  b850c30000                     mov eax, 0xc350
100a1bc7  3bf8                           cmp edi, eax
100a1bc9  0f4cc7                         cmovl eax, edi
100a1bcc  ffb14c080000                   push dword ptr [ecx + 0x84c]
100a1bd2  50                             push eax
100a1bd3  e8f828feff                     call 0x100844d0
100a1bd8  0fb74626                       movzx eax, word ptr [esi + 0x26]
100a1bdc  8b0e                           mov ecx, dword ptr [esi]
100a1bde  50                             push eax
100a1bdf  8b4630                         mov eax, dword ptr [esi + 0x30]
100a1be2  2b45e8                         sub eax, dword ptr [ebp - 0x18]
100a1be5  034608                         add eax, dword ptr [esi + 8]
100a1be8  03c3                           add eax, ebx
100a1bea  50                             push eax
100a1beb  ff760c                         push dword ptr [esi + 0xc]
100a1bee  e83d2dfeff                     call 0x10084930
100a1bf3  81ef50c30000                   sub edi, 0xc350
100a1bf9  81c324130000                   add ebx, 0x1324
100a1bff  85ff                           test edi, edi
100a1c01  7fbd                           jg 0x100a1bc0
100a1c03  8b0e                           mov ecx, dword ptr [esi]
100a1c05  babc020000                     mov edx, 0x2bc
100a1c0a  8b45e4                         mov eax, dword ptr [ebp - 0x1c]
100a1c0d  3955e0                         cmp dword ptr [ebp - 0x20], edx
100a1c10  5f                             pop edi
100a1c11  898154080000                   mov dword ptr [ecx + 0x854], eax
100a1c17  b890010000                     mov eax, 0x190
100a1c1c  0f44c2                         cmove eax, edx
100a1c1f  5e                             pop esi
100a1c20  894104                         mov dword ptr [ecx + 4], eax
100a1c23  5b                             pop ebx
100a1c24  8be5                           mov esp, ebp
100a1c26  5d                             pop ebp
100a1c27  c3                             ret 
100a1c28  cc                             int3 
100a1c29  cc                             int3 
100a1c2a  cc                             int3 
100a1c2b  cc                             int3 
100a1c2c  cc                             int3 
100a1c2d  cc                             int3 
100a1c2e  cc                             int3 
100a1c2f  cc                             int3 
