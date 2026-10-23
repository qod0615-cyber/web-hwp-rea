; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009f9d0 <= VA < 0x1009fb00 (next decompiler entry; may include padding/thunks)
1009f9d0  55                             push ebp
1009f9d1  8bec                           mov ebp, esp
1009f9d3  6aff                           push -1
1009f9d5  6869c70a10                     push 0x100ac769
1009f9da  64a100000000                   mov eax, dword ptr fs:[0]
1009f9e0  50                             push eax
1009f9e1  83ec44                         sub esp, 0x44
1009f9e4  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009f9e9  33c5                           xor eax, ebp
1009f9eb  8945f0                         mov dword ptr [ebp - 0x10], eax
1009f9ee  53                             push ebx
1009f9ef  56                             push esi
1009f9f0  57                             push edi
1009f9f1  50                             push eax
1009f9f2  8d45f4                         lea eax, [ebp - 0xc]
1009f9f5  64a300000000                   mov dword ptr fs:[0], eax
1009f9fb  8bf1                           mov esi, ecx
1009f9fd  8b4668                         mov eax, dword ptr [esi + 0x68]
1009fa00  8b7e74                         mov edi, dword ptr [esi + 0x74]
1009fa03  8b5e50                         mov ebx, dword ptr [esi + 0x50]
1009fa06  039880000000                   add ebx, dword ptr [eax + 0x80]
1009fa0c  8d8758080000                   lea eax, [edi + 0x858]
1009fa12  c7875008000001000000           mov dword ptr [edi + 0x850], 1
1009fa1c  83781408                       cmp dword ptr [eax + 0x14], 8
1009fa20  7202                           jb 0x1009fa24
1009fa22  8b00                           mov eax, dword ptr [eax]
1009fa24  50                             push eax
1009fa25  ff7608                         push dword ptr [esi + 8]
1009fa28  8bcf                           mov ecx, edi
1009fa2a  e8314bfeff                     call 0x10084560
1009fa2f  397508                         cmp dword ptr [ebp + 8], esi
1009fa32  0f8592000000                   jne 0x1009faca
1009fa38  8b4668                         mov eax, dword ptr [esi + 0x68]
1009fa3b  8b5658                         mov edx, dword ptr [esi + 0x58]
1009fa3e  8955b0                         mov dword ptr [ebp - 0x50], edx
1009fa41  8b565c                         mov edx, dword ptr [esi + 0x5c]
1009fa44  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009fa47  8b4654                         mov eax, dword ptr [esi + 0x54]
1009fa4a  03c1                           add eax, ecx
1009fa4c  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009fa4f  83bf8008000001                 cmp dword ptr [edi + 0x880], 1
1009fa56  8945b8                         mov dword ptr [ebp - 0x48], eax
1009fa59  746f                           je 0x1009faca
1009fa5b  833f00                         cmp dword ptr [edi], 0
1009fa5e  746a                           je 0x1009faca
1009fa60  8d4dbc                         lea ecx, [ebp - 0x44]
1009fa63  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009fa69  6a01                           push 1
1009fa6b  8d4dbc                         lea ecx, [ebp - 0x44]
1009fa6e  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009fa75  ff1550ff0d10                   call dword ptr [0x100dff50]
1009fa7b  6a01                           push 1
1009fa7d  8d4dbc                         lea ecx, [ebp - 0x44]
1009fa80  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009fa86  68ff000000                     push 0xff
1009fa8b  8d4dbc                         lea ecx, [ebp - 0x44]
1009fa8e  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009fa94  8b0f                           mov ecx, dword ptr [edi]
1009fa96  8d45bc                         lea eax, [ebp - 0x44]
1009fa99  50                             push eax
1009fa9a  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009faa0  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1009faa3  8d4dbc                         lea ecx, [ebp - 0x44]
1009faa6  898774080000                   mov dword ptr [edi + 0x874], eax
1009faac  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009faaf  89877c080000                   mov dword ptr [edi + 0x87c], eax
1009fab5  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009fab8  899f70080000                   mov dword ptr [edi + 0x870], ebx
1009fabe  898778080000                   mov dword ptr [edi + 0x878], eax
1009fac4  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009faca  8b4668                         mov eax, dword ptr [esi + 0x68]
1009facd  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009fad0  8b4654                         mov eax, dword ptr [esi + 0x54]
1009fad3  03c1                           add eax, ecx
1009fad5  895e48                         mov dword ptr [esi + 0x48], ebx
1009fad8  89464c                         mov dword ptr [esi + 0x4c], eax
1009fadb  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009fade  64890d00000000                 mov dword ptr fs:[0], ecx
1009fae5  59                             pop ecx
1009fae6  5f                             pop edi
1009fae7  5e                             pop esi
1009fae8  5b                             pop ebx
1009fae9  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009faec  33cd                           xor ecx, ebp
1009faee  e8642e0000                     call 0x100a2957
1009faf3  8be5                           mov esp, ebp
1009faf5  5d                             pop ebp
1009faf6  c20400                         ret 4
1009faf9  cc                             int3 
1009fafa  cc                             int3 
1009fafb  cc                             int3 
1009fafc  cc                             int3 
1009fafd  cc                             int3 
1009fafe  cc                             int3 
1009faff  cc                             int3 
