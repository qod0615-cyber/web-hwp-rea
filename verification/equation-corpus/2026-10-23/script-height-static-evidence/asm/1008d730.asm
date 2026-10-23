; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008d730 <= VA < 0x1008d980 (next decompiler entry; may include padding/thunks)
1008d730  55                             push ebp
1008d731  8bec                           mov ebp, esp
1008d733  6aff                           push -1
1008d735  6859c50a10                     push 0x100ac559
1008d73a  64a100000000                   mov eax, dword ptr fs:[0]
1008d740  50                             push eax
1008d741  83ec58                         sub esp, 0x58
1008d744  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008d749  33c5                           xor eax, ebp
1008d74b  8945f0                         mov dword ptr [ebp - 0x10], eax
1008d74e  53                             push ebx
1008d74f  56                             push esi
1008d750  57                             push edi
1008d751  50                             push eax
1008d752  8d45f4                         lea eax, [ebp - 0xc]
1008d755  64a300000000                   mov dword ptr fs:[0], eax
1008d75b  8bf9                           mov edi, ecx
1008d75d  8b7768                         mov esi, dword ptr [edi + 0x68]
1008d760  8b4508                         mov eax, dword ptr [ebp + 8]
1008d763  8945b4                         mov dword ptr [ebp - 0x4c], eax
1008d766  8b4f5c                         mov ecx, dword ptr [edi + 0x5c]
1008d769  8b8680000000                   mov eax, dword ptr [esi + 0x80]
1008d76f  034750                         add eax, dword ptr [edi + 0x50]
1008d772  8945b0                         mov dword ptr [ebp - 0x50], eax
1008d775  8b4758                         mov eax, dword ptr [edi + 0x58]
1008d778  99                             cdq 
1008d779  8b5f74                         mov ebx, dword ptr [edi + 0x74]
1008d77c  2bc2                           sub eax, edx
1008d77e  d1f8                           sar eax, 1
1008d780  0345b0                         add eax, dword ptr [ebp - 0x50]
1008d783  8945ac                         mov dword ptr [ebp - 0x54], eax
1008d786  8b467c                         mov eax, dword ptr [esi + 0x7c]
1008d789  8b7778                         mov esi, dword ptr [edi + 0x78]
1008d78c  8945a4                         mov dword ptr [ebp - 0x5c], eax
1008d78f  894da0                         mov dword ptr [ebp - 0x60], ecx
1008d792  8b4658                         mov eax, dword ptr [esi + 0x58]
1008d795  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1008d798  99                             cdq 
1008d799  2bc2                           sub eax, edx
1008d79b  894da0                         mov dword ptr [ebp - 0x60], ecx
1008d79e  8b4dac                         mov ecx, dword ptr [ebp - 0x54]
1008d7a1  d1f8                           sar eax, 1
1008d7a3  2bc8                           sub ecx, eax
1008d7a5  898e80000000                   mov dword ptr [esi + 0x80], ecx
1008d7ab  8b4778                         mov eax, dword ptr [edi + 0x78]
1008d7ae  8b7774                         mov esi, dword ptr [edi + 0x74]
1008d7b1  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1008d7b8  8b4054                         mov eax, dword ptr [eax + 0x54]
1008d7bb  8945b8                         mov dword ptr [ebp - 0x48], eax
1008d7be  8d8658080000                   lea eax, [esi + 0x858]
1008d7c4  7202                           jb 0x1008d7c8
1008d7c6  8b00                           mov eax, dword ptr [eax]
1008d7c8  50                             push eax
1008d7c9  ff7708                         push dword ptr [edi + 8]
1008d7cc  8bce                           mov ecx, esi
1008d7ce  e88d6dffff                     call 0x10084560
1008d7d3  685be00000                     push 0xe05b
1008d7d8  8d459c                         lea eax, [ebp - 0x64]
1008d7db  8bce                           mov ecx, esi
1008d7dd  50                             push eax
1008d7de  e8ed79ffff                     call 0x100851d0
1008d7e3  8b4f78                         mov ecx, dword ptr [edi + 0x78]
1008d7e6  b867666666                     mov eax, 0x66666667
1008d7eb  f76da0                         imul dword ptr [ebp - 0x60]
1008d7ee  ff75b4                         push dword ptr [ebp - 0x4c]
1008d7f1  c1fa02                         sar edx, 2
1008d7f4  8bc2                           mov eax, edx
1008d7f6  c1e81f                         shr eax, 0x1f
1008d7f9  03c2                           add eax, edx
1008d7fb  99                             cdq 
1008d7fc  2bc2                           sub eax, edx
1008d7fe  d1f8                           sar eax, 1
1008d800  2b45b8                         sub eax, dword ptr [ebp - 0x48]
1008d803  0345a4                         add eax, dword ptr [ebp - 0x5c]
1008d806  89417c                         mov dword ptr [ecx + 0x7c], eax
1008d809  8b4f78                         mov ecx, dword ptr [edi + 0x78]
1008d80c  8b01                           mov eax, dword ptr [ecx]
1008d80e  ff5004                         call dword ptr [eax + 4]
1008d811  8b777c                         mov esi, dword ptr [edi + 0x7c]
1008d814  8b4dac                         mov ecx, dword ptr [ebp - 0x54]
1008d817  8b4658                         mov eax, dword ptr [esi + 0x58]
1008d81a  99                             cdq 
1008d81b  2bc2                           sub eax, edx
1008d81d  d1f8                           sar eax, 1
1008d81f  2bc8                           sub ecx, eax
1008d821  898e80000000                   mov dword ptr [esi + 0x80], ecx
1008d827  8b477c                         mov eax, dword ptr [edi + 0x7c]
1008d82a  8b7774                         mov esi, dword ptr [edi + 0x74]
1008d82d  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1008d834  8b4054                         mov eax, dword ptr [eax + 0x54]
1008d837  8945b8                         mov dword ptr [ebp - 0x48], eax
1008d83a  8d8658080000                   lea eax, [esi + 0x858]
1008d840  7202                           jb 0x1008d844
1008d842  8b00                           mov eax, dword ptr [eax]
1008d844  50                             push eax
1008d845  ff7708                         push dword ptr [edi + 8]
1008d848  8bce                           mov ecx, esi
1008d84a  e8116dffff                     call 0x10084560
1008d84f  685be00000                     push 0xe05b
1008d854  8d4da8                         lea ecx, [ebp - 0x58]
1008d857  51                             push ecx
1008d858  8bce                           mov ecx, esi
1008d85a  e87179ffff                     call 0x100851d0
1008d85f  8b777c                         mov esi, dword ptr [edi + 0x7c]
1008d862  b867666666                     mov eax, 0x66666667
1008d867  f76dac                         imul dword ptr [ebp - 0x54]
1008d86a  8b4da4                         mov ecx, dword ptr [ebp - 0x5c]
1008d86d  c1fa02                         sar edx, 2
1008d870  8bc2                           mov eax, edx
1008d872  c1e81f                         shr eax, 0x1f
1008d875  03c2                           add eax, edx
1008d877  8945ac                         mov dword ptr [ebp - 0x54], eax
1008d87a  99                             cdq 
1008d87b  2bc2                           sub eax, edx
1008d87d  d1f8                           sar eax, 1
1008d87f  2bc8                           sub ecx, eax
1008d881  2b4e5c                         sub ecx, dword ptr [esi + 0x5c]
1008d884  2b4db8                         sub ecx, dword ptr [ebp - 0x48]
1008d887  894e7c                         mov dword ptr [esi + 0x7c], ecx
1008d88a  8b4f7c                         mov ecx, dword ptr [edi + 0x7c]
1008d88d  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1008d890  56                             push esi
1008d891  8b01                           mov eax, dword ptr [ecx]
1008d893  ff5004                         call dword ptr [eax + 4]
1008d896  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1008d89d  8d8358080000                   lea eax, [ebx + 0x858]
1008d8a3  7202                           jb 0x1008d8a7
1008d8a5  8b00                           mov eax, dword ptr [eax]
1008d8a7  50                             push eax
1008d8a8  ff7708                         push dword ptr [edi + 8]
1008d8ab  8bcb                           mov ecx, ebx
1008d8ad  e8ae6cffff                     call 0x10084560
1008d8b2  3bf7                           cmp esi, edi
1008d8b4  0f858f000000                   jne 0x1008d949
1008d8ba  8b4768                         mov eax, dword ptr [edi + 0x68]
1008d8bd  8b575c                         mov edx, dword ptr [edi + 0x5c]
1008d8c0  8b7758                         mov esi, dword ptr [edi + 0x58]
1008d8c3  8955b4                         mov dword ptr [ebp - 0x4c], edx
1008d8c6  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1008d8c9  8b4754                         mov eax, dword ptr [edi + 0x54]
1008d8cc  03c1                           add eax, ecx
1008d8ce  83bb8008000001                 cmp dword ptr [ebx + 0x880], 1
1008d8d5  8945b8                         mov dword ptr [ebp - 0x48], eax
1008d8d8  746f                           je 0x1008d949
1008d8da  833b00                         cmp dword ptr [ebx], 0
1008d8dd  746a                           je 0x1008d949
1008d8df  8d4dbc                         lea ecx, [ebp - 0x44]
1008d8e2  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008d8e8  6a01                           push 1
1008d8ea  8d4dbc                         lea ecx, [ebp - 0x44]
1008d8ed  c745fc00000000                 mov dword ptr [ebp - 4], 0
1008d8f4  ff1550ff0d10                   call dword ptr [0x100dff50]
1008d8fa  6a01                           push 1
1008d8fc  8d4dbc                         lea ecx, [ebp - 0x44]
1008d8ff  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008d905  68ff000000                     push 0xff
1008d90a  8d4dbc                         lea ecx, [ebp - 0x44]
1008d90d  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008d913  8b0b                           mov ecx, dword ptr [ebx]
1008d915  8d45bc                         lea eax, [ebp - 0x44]
1008d918  50                             push eax
1008d919  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008d91f  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1008d922  8d4dbc                         lea ecx, [ebp - 0x44]
1008d925  898370080000                   mov dword ptr [ebx + 0x870], eax
1008d92b  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008d92e  898374080000                   mov dword ptr [ebx + 0x874], eax
1008d934  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1008d937  89837c080000                   mov dword ptr [ebx + 0x87c], eax
1008d93d  89b378080000                   mov dword ptr [ebx + 0x878], esi
1008d943  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1008d949  8b4768                         mov eax, dword ptr [edi + 0x68]
1008d94c  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1008d94f  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1008d952  894748                         mov dword ptr [edi + 0x48], eax
1008d955  8b4754                         mov eax, dword ptr [edi + 0x54]
1008d958  03c1                           add eax, ecx
1008d95a  89474c                         mov dword ptr [edi + 0x4c], eax
1008d95d  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1008d960  64890d00000000                 mov dword ptr fs:[0], ecx
1008d967  59                             pop ecx
1008d968  5f                             pop edi
1008d969  5e                             pop esi
1008d96a  5b                             pop ebx
1008d96b  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1008d96e  33cd                           xor ecx, ebp
1008d970  e8e24f0100                     call 0x100a2957
1008d975  8be5                           mov esp, ebp
1008d977  5d                             pop ebp
1008d978  c20400                         ret 4
1008d97b  cc                             int3 
1008d97c  cc                             int3 
1008d97d  cc                             int3 
1008d97e  cc                             int3 
1008d97f  cc                             int3 
