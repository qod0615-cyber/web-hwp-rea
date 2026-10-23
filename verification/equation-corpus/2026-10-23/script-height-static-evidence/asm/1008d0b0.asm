; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008d0b0 <= VA < 0x1008d380 (next decompiler entry; may include padding/thunks)
1008d0b0  55                             push ebp
1008d0b1  8bec                           mov ebp, esp
1008d0b3  6aff                           push -1
1008d0b5  6829c50a10                     push 0x100ac529
1008d0ba  64a100000000                   mov eax, dword ptr fs:[0]
1008d0c0  50                             push eax
1008d0c1  83ec54                         sub esp, 0x54
1008d0c4  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008d0c9  33c5                           xor eax, ebp
1008d0cb  8945f0                         mov dword ptr [ebp - 0x10], eax
1008d0ce  53                             push ebx
1008d0cf  56                             push esi
1008d0d0  57                             push edi
1008d0d1  50                             push eax
1008d0d2  8d45f4                         lea eax, [ebp - 0xc]
1008d0d5  64a300000000                   mov dword ptr fs:[0], eax
1008d0db  8bf9                           mov edi, ecx
1008d0dd  8b5f74                         mov ebx, dword ptr [edi + 0x74]
1008d0e0  8b4508                         mov eax, dword ptr [ebp + 8]
1008d0e3  8945b0                         mov dword ptr [ebp - 0x50], eax
1008d0e6  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1008d0ed  8d8b58080000                   lea ecx, [ebx + 0x858]
1008d0f3  7206                           jb 0x1008d0fb
1008d0f5  8b8b58080000                   mov ecx, dword ptr [ebx + 0x858]
1008d0fb  51                             push ecx
1008d0fc  ff7708                         push dword ptr [edi + 8]
1008d0ff  8bcb                           mov ecx, ebx
1008d101  e85a74ffff                     call 0x10084560
1008d106  6a64                           push 0x64
1008d108  6a0a                           push 0xa
1008d10a  ffb348080000                   push dword ptr [ebx + 0x848]
1008d110  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008d116  8b7768                         mov esi, dword ptr [edi + 0x68]
1008d119  8b4f7c                         mov ecx, dword ptr [edi + 0x7c]
1008d11c  8945b8                         mov dword ptr [ebp - 0x48], eax
1008d11f  8b4750                         mov eax, dword ptr [edi + 0x50]
1008d122  038680000000                   add eax, dword ptr [esi + 0x80]
1008d128  8945ac                         mov dword ptr [ebp - 0x54], eax
1008d12b  8b415c                         mov eax, dword ptr [ecx + 0x5c]
1008d12e  034754                         add eax, dword ptr [edi + 0x54]
1008d131  03467c                         add eax, dword ptr [esi + 0x7c]
1008d134  8db358080000                   lea esi, [ebx + 0x858]
1008d13a  8b4f58                         mov ecx, dword ptr [edi + 0x58]
1008d13d  8945b4                         mov dword ptr [ebp - 0x4c], eax
1008d140  8b475c                         mov eax, dword ptr [edi + 0x5c]
1008d143  8945a4                         mov dword ptr [ebp - 0x5c], eax
1008d146  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008d149  03c0                           add eax, eax
1008d14b  2bc8                           sub ecx, eax
1008d14d  837e1408                       cmp dword ptr [esi + 0x14], 8
1008d151  894da4                         mov dword ptr [ebp - 0x5c], ecx
1008d154  8bc6                           mov eax, esi
1008d156  7202                           jb 0x1008d15a
1008d158  8b06                           mov eax, dword ptr [esi]
1008d15a  50                             push eax
1008d15b  ff7708                         push dword ptr [edi + 8]
1008d15e  8bcb                           mov ecx, ebx
1008d160  e8fb73ffff                     call 0x10084560
1008d165  ff75a4                         push dword ptr [ebp - 0x5c]
1008d168  8bcb                           mov ecx, ebx
1008d16a  ffb348080000                   push dword ptr [ebx + 0x848]
1008d170  e85b73ffff                     call 0x100844d0
1008d175  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008d178  8bcb                           mov ecx, ebx
1008d17a  0345ac                         add eax, dword ptr [ebp - 0x54]
1008d17d  686de00000                     push 0xe06d
1008d182  ff75b4                         push dword ptr [ebp - 0x4c]
1008d185  50                             push eax
1008d186  e8a577ffff                     call 0x10084930
1008d18b  837e1408                       cmp dword ptr [esi + 0x14], 8
1008d18f  7202                           jb 0x1008d193
1008d191  8b36                           mov esi, dword ptr [esi]
1008d193  56                             push esi
1008d194  ff7708                         push dword ptr [edi + 8]
1008d197  8bcb                           mov ecx, ebx
1008d199  e8c273ffff                     call 0x10084560
1008d19e  8b7768                         mov esi, dword ptr [edi + 0x68]
1008d1a1  8b4f5c                         mov ecx, dword ptr [edi + 0x5c]
1008d1a4  894dac                         mov dword ptr [ebp - 0x54], ecx
1008d1a7  8b8680000000                   mov eax, dword ptr [esi + 0x80]
1008d1ad  034750                         add eax, dword ptr [edi + 0x50]
1008d1b0  8945b8                         mov dword ptr [ebp - 0x48], eax
1008d1b3  8b4758                         mov eax, dword ptr [edi + 0x58]
1008d1b6  99                             cdq 
1008d1b7  2bc2                           sub eax, edx
1008d1b9  d1f8                           sar eax, 1
1008d1bb  0345b8                         add eax, dword ptr [ebp - 0x48]
1008d1be  8945b4                         mov dword ptr [ebp - 0x4c], eax
1008d1c1  8b467c                         mov eax, dword ptr [esi + 0x7c]
1008d1c4  8b7774                         mov esi, dword ptr [edi + 0x74]
1008d1c7  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1008d1ce  8945a4                         mov dword ptr [ebp - 0x5c], eax
1008d1d1  8d8658080000                   lea eax, [esi + 0x858]
1008d1d7  8975ac                         mov dword ptr [ebp - 0x54], esi
1008d1da  7202                           jb 0x1008d1de
1008d1dc  8b00                           mov eax, dword ptr [eax]
1008d1de  50                             push eax
1008d1df  ff7708                         push dword ptr [edi + 8]
1008d1e2  8bce                           mov ecx, esi
1008d1e4  e87773ffff                     call 0x10084560
1008d1e9  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1008d1ec  8bb64c080000                   mov esi, dword ptr [esi + 0x84c]
1008d1f2  6a64                           push 0x64
1008d1f4  6a1e                           push 0x1e
1008d1f6  ffb048080000                   push dword ptr [eax + 0x848]
1008d1fc  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008d202  898788000000                   mov dword ptr [edi + 0x88], eax
1008d208  89b784000000                   mov dword ptr [edi + 0x84], esi
1008d20e  8b7778                         mov esi, dword ptr [edi + 0x78]
1008d211  ff75b0                         push dword ptr [ebp - 0x50]
1008d214  8b4658                         mov eax, dword ptr [esi + 0x58]
1008d217  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1008d21a  99                             cdq 
1008d21b  2bc2                           sub eax, edx
1008d21d  894dac                         mov dword ptr [ebp - 0x54], ecx
1008d220  8b4db4                         mov ecx, dword ptr [ebp - 0x4c]
1008d223  d1f8                           sar eax, 1
1008d225  2bc8                           sub ecx, eax
1008d227  898e80000000                   mov dword ptr [esi + 0x80], ecx
1008d22d  8b8788000000                   mov eax, dword ptr [edi + 0x88]
1008d233  8b4f78                         mov ecx, dword ptr [edi + 0x78]
1008d236  99                             cdq 
1008d237  2bc2                           sub eax, edx
1008d239  d1f8                           sar eax, 1
1008d23b  2b4154                         sub eax, dword ptr [ecx + 0x54]
1008d23e  0345a4                         add eax, dword ptr [ebp - 0x5c]
1008d241  89417c                         mov dword ptr [ecx + 0x7c], eax
1008d244  8b4f78                         mov ecx, dword ptr [edi + 0x78]
1008d247  8b01                           mov eax, dword ptr [ecx]
1008d249  ff5004                         call dword ptr [eax + 4]
1008d24c  8b777c                         mov esi, dword ptr [edi + 0x7c]
1008d24f  8b4658                         mov eax, dword ptr [esi + 0x58]
1008d252  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1008d255  99                             cdq 
1008d256  2bc2                           sub eax, edx
1008d258  894dac                         mov dword ptr [ebp - 0x54], ecx
1008d25b  8b4db4                         mov ecx, dword ptr [ebp - 0x4c]
1008d25e  d1f8                           sar eax, 1
1008d260  2bc8                           sub ecx, eax
1008d262  898e80000000                   mov dword ptr [esi + 0x80], ecx
1008d268  8b8788000000                   mov eax, dword ptr [edi + 0x88]
1008d26e  8b4f7c                         mov ecx, dword ptr [edi + 0x7c]
1008d271  8b75b0                         mov esi, dword ptr [ebp - 0x50]
1008d274  99                             cdq 
1008d275  2bc2                           sub eax, edx
1008d277  8b55a4                         mov edx, dword ptr [ebp - 0x5c]
1008d27a  d1f8                           sar eax, 1
1008d27c  2bd0                           sub edx, eax
1008d27e  2b515c                         sub edx, dword ptr [ecx + 0x5c]
1008d281  2b5154                         sub edx, dword ptr [ecx + 0x54]
1008d284  89517c                         mov dword ptr [ecx + 0x7c], edx
1008d287  8b4f7c                         mov ecx, dword ptr [edi + 0x7c]
1008d28a  56                             push esi
1008d28b  8b01                           mov eax, dword ptr [ecx]
1008d28d  ff5004                         call dword ptr [eax + 4]
1008d290  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1008d297  8d8358080000                   lea eax, [ebx + 0x858]
1008d29d  7202                           jb 0x1008d2a1
1008d29f  8b00                           mov eax, dword ptr [eax]
1008d2a1  50                             push eax
1008d2a2  ff7708                         push dword ptr [edi + 8]
1008d2a5  8bcb                           mov ecx, ebx
1008d2a7  e8b472ffff                     call 0x10084560
1008d2ac  3bf7                           cmp esi, edi
1008d2ae  0f858f000000                   jne 0x1008d343
1008d2b4  8b4768                         mov eax, dword ptr [edi + 0x68]
1008d2b7  8b575c                         mov edx, dword ptr [edi + 0x5c]
1008d2ba  8b7758                         mov esi, dword ptr [edi + 0x58]
1008d2bd  8955b0                         mov dword ptr [ebp - 0x50], edx
1008d2c0  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1008d2c3  8b4754                         mov eax, dword ptr [edi + 0x54]
1008d2c6  03c1                           add eax, ecx
1008d2c8  83bb8008000001                 cmp dword ptr [ebx + 0x880], 1
1008d2cf  8945ac                         mov dword ptr [ebp - 0x54], eax
1008d2d2  746f                           je 0x1008d343
1008d2d4  833b00                         cmp dword ptr [ebx], 0
1008d2d7  746a                           je 0x1008d343
1008d2d9  8d4dbc                         lea ecx, [ebp - 0x44]
1008d2dc  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008d2e2  6a01                           push 1
1008d2e4  8d4dbc                         lea ecx, [ebp - 0x44]
1008d2e7  c745fc00000000                 mov dword ptr [ebp - 4], 0
1008d2ee  ff1550ff0d10                   call dword ptr [0x100dff50]
1008d2f4  6a01                           push 1
1008d2f6  8d4dbc                         lea ecx, [ebp - 0x44]
1008d2f9  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008d2ff  68ff000000                     push 0xff
1008d304  8d4dbc                         lea ecx, [ebp - 0x44]
1008d307  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008d30d  8b0b                           mov ecx, dword ptr [ebx]
1008d30f  8d45bc                         lea eax, [ebp - 0x44]
1008d312  50                             push eax
1008d313  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008d319  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008d31c  8d4dbc                         lea ecx, [ebp - 0x44]
1008d31f  898370080000                   mov dword ptr [ebx + 0x870], eax
1008d325  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1008d328  898374080000                   mov dword ptr [ebx + 0x874], eax
1008d32e  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1008d331  89837c080000                   mov dword ptr [ebx + 0x87c], eax
1008d337  89b378080000                   mov dword ptr [ebx + 0x878], esi
1008d33d  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1008d343  8b4768                         mov eax, dword ptr [edi + 0x68]
1008d346  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1008d349  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008d34c  894748                         mov dword ptr [edi + 0x48], eax
1008d34f  8b4754                         mov eax, dword ptr [edi + 0x54]
1008d352  03c1                           add eax, ecx
1008d354  89474c                         mov dword ptr [edi + 0x4c], eax
1008d357  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1008d35a  64890d00000000                 mov dword ptr fs:[0], ecx
1008d361  59                             pop ecx
1008d362  5f                             pop edi
1008d363  5e                             pop esi
1008d364  5b                             pop ebx
1008d365  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1008d368  33cd                           xor ecx, ebp
1008d36a  e8e8550100                     call 0x100a2957
1008d36f  8be5                           mov esp, ebp
1008d371  5d                             pop ebp
1008d372  c20400                         ret 4
1008d375  cc                             int3 
1008d376  cc                             int3 
1008d377  cc                             int3 
1008d378  cc                             int3 
1008d379  cc                             int3 
1008d37a  cc                             int3 
1008d37b  cc                             int3 
1008d37c  cc                             int3 
1008d37d  cc                             int3 
1008d37e  cc                             int3 
1008d37f  cc                             int3 
