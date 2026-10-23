; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009b6d0 <= VA < 0x1009b860 (next decompiler entry; may include padding/thunks)
1009b6d0  55                             push ebp
1009b6d1  8bec                           mov ebp, esp
1009b6d3  83ec1c                         sub esp, 0x1c
1009b6d6  53                             push ebx
1009b6d7  56                             push esi
1009b6d8  57                             push edi
1009b6d9  8bf9                           mov edi, ecx
1009b6db  b900200000                     mov ecx, 0x2000
1009b6e0  8b7778                         mov esi, dword ptr [edi + 0x78]
1009b6e3  8b868c000000                   mov eax, dword ptr [esi + 0x8c]
1009b6e9  8b5064                         mov edx, dword ptr [eax + 0x64]
1009b6ec  837a046f                       cmp dword ptr [edx + 4], 0x6f
1009b6f0  752c                           jne 0x1009b71e
1009b6f2  8bc1                           mov eax, ecx
1009b6f4  6603829c000000                 add ax, word ptr [edx + 0x9c]
1009b6fb  6683f819                       cmp ax, 0x19
1009b6ff  7711                           ja 0x1009b712
1009b701  8b4274                         mov eax, dword ptr [edx + 0x74]
1009b704  c745fc01000000                 mov dword ptr [ebp - 4], 1
1009b70b  6683600e01                     and word ptr [eax + 0xe], 1
1009b710  7507                           jne 0x1009b719
1009b712  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009b719  8b7778                         mov esi, dword ptr [edi + 0x78]
1009b71c  eb07                           jmp 0x1009b725
1009b71e  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009b725  8b8690000000                   mov eax, dword ptr [esi + 0x90]
1009b72b  8b4060                         mov eax, dword ptr [eax + 0x60]
1009b72e  8378046f                       cmp dword ptr [eax + 4], 0x6f
1009b732  751e                           jne 0x1009b752
1009b734  6603889c000000                 add cx, word ptr [eax + 0x9c]
1009b73b  6683f919                       cmp cx, 0x19
1009b73f  7711                           ja 0x1009b752
1009b741  8b4074                         mov eax, dword ptr [eax + 0x74]
1009b744  6683600e01                     and word ptr [eax + 0xe], 1
1009b749  7407                           je 0x1009b752
1009b74b  be01000000                     mov esi, 1
1009b750  eb02                           jmp 0x1009b754
1009b752  33f6                           xor esi, esi
1009b754  8b4768                         mov eax, dword ptr [edi + 0x68]
1009b757  8b5f74                         mov ebx, dword ptr [edi + 0x74]
1009b75a  6a64                           push 0x64
1009b75c  6a37                           push 0x37
1009b75e  8b8080000000                   mov eax, dword ptr [eax + 0x80]
1009b764  034750                         add eax, dword ptr [edi + 0x50]
1009b767  ffb780000000                   push dword ptr [edi + 0x80]
1009b76d  8945ec                         mov dword ptr [ebp - 0x14], eax
1009b770  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009b776  8b4f68                         mov ecx, dword ptr [edi + 0x68]
1009b779  8945f4                         mov dword ptr [ebp - 0xc], eax
1009b77c  8b417c                         mov eax, dword ptr [ecx + 0x7c]
1009b77f  2b8784000000                   sub eax, dword ptr [edi + 0x84]
1009b785  034754                         add eax, dword ptr [edi + 0x54]
1009b788  8945f0                         mov dword ptr [ebp - 0x10], eax
1009b78b  8b4778                         mov eax, dword ptr [edi + 0x78]
1009b78e  8b5058                         mov edx, dword ptr [eax + 0x58]
1009b791  8b45fc                         mov eax, dword ptr [ebp - 4]
1009b794  8955f8                         mov dword ptr [ebp - 8], edx
1009b797  85c0                           test eax, eax
1009b799  741b                           je 0x1009b7b6
1009b79b  85f6                           test esi, esi
1009b79d  7517                           jne 0x1009b7b6
1009b79f  8b7708                         mov esi, dword ptr [edi + 8]
1009b7a2  8bc6                           mov eax, esi
1009b7a4  99                             cdq 
1009b7a5  83e203                         and edx, 3
1009b7a8  8d0c02                         lea ecx, [edx + eax]
1009b7ab  8b45fc                         mov eax, dword ptr [ebp - 4]
1009b7ae  8b55f8                         mov edx, dword ptr [ebp - 8]
1009b7b1  c1f902                         sar ecx, 2
1009b7b4  eb05                           jmp 0x1009b7bb
1009b7b6  8b7708                         mov esi, dword ptr [edi + 8]
1009b7b9  33c9                           xor ecx, ecx
1009b7bb  2bd1                           sub edx, ecx
1009b7bd  b928000000                     mov ecx, 0x28
1009b7c2  8955f8                         mov dword ptr [ebp - 8], edx
1009b7c5  2b55f4                         sub edx, dword ptr [ebp - 0xc]
1009b7c8  85c0                           test eax, eax
1009b7ca  8955f4                         mov dword ptr [ebp - 0xc], edx
1009b7cd  8bc6                           mov eax, esi
1009b7cf  ba05000000                     mov edx, 5
1009b7d4  0f45ca                         cmovne ecx, edx
1009b7d7  99                             cdq 
1009b7d8  f7f9                           idiv ecx
1009b7da  837df400                       cmp dword ptr [ebp - 0xc], 0
1009b7de  8945fc                         mov dword ptr [ebp - 4], eax
1009b7e1  7c5d                           jl 0x1009b840
1009b7e3  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1009b7ea  8db358080000                   lea esi, [ebx + 0x858]
1009b7f0  8bc6                           mov eax, esi
1009b7f2  7202                           jb 0x1009b7f6
1009b7f4  8b06                           mov eax, dword ptr [esi]
1009b7f6  50                             push eax
1009b7f7  ff7708                         push dword ptr [edi + 8]
1009b7fa  8bcb                           mov ecx, ebx
1009b7fc  e85f8dfeff                     call 0x10084560
1009b801  ff75f8                         push dword ptr [ebp - 8]
1009b804  8bcb                           mov ecx, ebx
1009b806  ffb348080000                   push dword ptr [ebx + 0x848]
1009b80c  e8bf8cfeff                     call 0x100844d0
1009b811  8b45fc                         mov eax, dword ptr [ebp - 4]
1009b814  8bcb                           mov ecx, ebx
1009b816  0345ec                         add eax, dword ptr [ebp - 0x14]
1009b819  686de00000                     push 0xe06d
1009b81e  ff75f0                         push dword ptr [ebp - 0x10]
1009b821  50                             push eax
1009b822  e80991feff                     call 0x10084930
1009b827  837e1408                       cmp dword ptr [esi + 0x14], 8
1009b82b  7202                           jb 0x1009b82f
1009b82d  8b36                           mov esi, dword ptr [esi]
1009b82f  56                             push esi
1009b830  ff7708                         push dword ptr [edi + 8]
1009b833  8bcb                           mov ecx, ebx
1009b835  e8268dfeff                     call 0x10084560
1009b83a  8b45fc                         mov eax, dword ptr [ebp - 4]
1009b83d  0345f4                         add eax, dword ptr [ebp - 0xc]
1009b840  0345ec                         add eax, dword ptr [ebp - 0x14]
1009b843  8bcb                           mov ecx, ebx
1009b845  686ee00000                     push 0xe06e
1009b84a  ff75f0                         push dword ptr [ebp - 0x10]
1009b84d  50                             push eax
1009b84e  e8dd90feff                     call 0x10084930
1009b853  5f                             pop edi
1009b854  5e                             pop esi
1009b855  5b                             pop ebx
1009b856  8be5                           mov esp, ebp
1009b858  5d                             pop ebp
1009b859  c20400                         ret 4
1009b85c  cc                             int3 
1009b85d  cc                             int3 
1009b85e  cc                             int3 
1009b85f  cc                             int3 
