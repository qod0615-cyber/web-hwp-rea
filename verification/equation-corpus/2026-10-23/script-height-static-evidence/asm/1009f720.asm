; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009f720 <= VA < 0x1009f850 (next decompiler entry; may include padding/thunks)
1009f720  55                             push ebp
1009f721  8bec                           mov ebp, esp
1009f723  6aff                           push -1
1009f725  6869c70a10                     push 0x100ac769
1009f72a  64a100000000                   mov eax, dword ptr fs:[0]
1009f730  50                             push eax
1009f731  83ec44                         sub esp, 0x44
1009f734  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009f739  33c5                           xor eax, ebp
1009f73b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009f73e  53                             push ebx
1009f73f  56                             push esi
1009f740  57                             push edi
1009f741  50                             push eax
1009f742  8d45f4                         lea eax, [ebp - 0xc]
1009f745  64a300000000                   mov dword ptr fs:[0], eax
1009f74b  8bf1                           mov esi, ecx
1009f74d  8b4668                         mov eax, dword ptr [esi + 0x68]
1009f750  8b7e74                         mov edi, dword ptr [esi + 0x74]
1009f753  8b5e50                         mov ebx, dword ptr [esi + 0x50]
1009f756  039880000000                   add ebx, dword ptr [eax + 0x80]
1009f75c  8d8758080000                   lea eax, [edi + 0x858]
1009f762  c7875008000000000000           mov dword ptr [edi + 0x850], 0
1009f76c  83781408                       cmp dword ptr [eax + 0x14], 8
1009f770  7202                           jb 0x1009f774
1009f772  8b00                           mov eax, dword ptr [eax]
1009f774  50                             push eax
1009f775  ff7608                         push dword ptr [esi + 8]
1009f778  8bcf                           mov ecx, edi
1009f77a  e8e14dfeff                     call 0x10084560
1009f77f  397508                         cmp dword ptr [ebp + 8], esi
1009f782  0f8592000000                   jne 0x1009f81a
1009f788  8b4668                         mov eax, dword ptr [esi + 0x68]
1009f78b  8b5658                         mov edx, dword ptr [esi + 0x58]
1009f78e  8955b0                         mov dword ptr [ebp - 0x50], edx
1009f791  8b565c                         mov edx, dword ptr [esi + 0x5c]
1009f794  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009f797  8b4654                         mov eax, dword ptr [esi + 0x54]
1009f79a  03c1                           add eax, ecx
1009f79c  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009f79f  83bf8008000001                 cmp dword ptr [edi + 0x880], 1
1009f7a6  8945b8                         mov dword ptr [ebp - 0x48], eax
1009f7a9  746f                           je 0x1009f81a
1009f7ab  833f00                         cmp dword ptr [edi], 0
1009f7ae  746a                           je 0x1009f81a
1009f7b0  8d4dbc                         lea ecx, [ebp - 0x44]
1009f7b3  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009f7b9  6a01                           push 1
1009f7bb  8d4dbc                         lea ecx, [ebp - 0x44]
1009f7be  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009f7c5  ff1550ff0d10                   call dword ptr [0x100dff50]
1009f7cb  6a01                           push 1
1009f7cd  8d4dbc                         lea ecx, [ebp - 0x44]
1009f7d0  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009f7d6  68ff000000                     push 0xff
1009f7db  8d4dbc                         lea ecx, [ebp - 0x44]
1009f7de  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009f7e4  8b0f                           mov ecx, dword ptr [edi]
1009f7e6  8d45bc                         lea eax, [ebp - 0x44]
1009f7e9  50                             push eax
1009f7ea  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009f7f0  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1009f7f3  8d4dbc                         lea ecx, [ebp - 0x44]
1009f7f6  898774080000                   mov dword ptr [edi + 0x874], eax
1009f7fc  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009f7ff  89877c080000                   mov dword ptr [edi + 0x87c], eax
1009f805  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009f808  899f70080000                   mov dword ptr [edi + 0x870], ebx
1009f80e  898778080000                   mov dword ptr [edi + 0x878], eax
1009f814  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009f81a  8b4668                         mov eax, dword ptr [esi + 0x68]
1009f81d  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009f820  8b4654                         mov eax, dword ptr [esi + 0x54]
1009f823  03c1                           add eax, ecx
1009f825  895e48                         mov dword ptr [esi + 0x48], ebx
1009f828  89464c                         mov dword ptr [esi + 0x4c], eax
1009f82b  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009f82e  64890d00000000                 mov dword ptr fs:[0], ecx
1009f835  59                             pop ecx
1009f836  5f                             pop edi
1009f837  5e                             pop esi
1009f838  5b                             pop ebx
1009f839  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009f83c  33cd                           xor ecx, ebp
1009f83e  e814310000                     call 0x100a2957
1009f843  8be5                           mov esp, ebp
1009f845  5d                             pop ebp
1009f846  c20400                         ret 4
1009f849  cc                             int3 
1009f84a  cc                             int3 
1009f84b  cc                             int3 
1009f84c  cc                             int3 
1009f84d  cc                             int3 
1009f84e  cc                             int3 
1009f84f  cc                             int3 
