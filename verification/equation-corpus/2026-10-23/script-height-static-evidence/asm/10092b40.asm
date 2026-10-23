; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10092b40 <= VA < 0x10092c70 (next decompiler entry; may include padding/thunks)
10092b40  55                             push ebp
10092b41  8bec                           mov ebp, esp
10092b43  83e4f8                         and esp, 0xfffffff8
10092b46  83ec0c                         sub esp, 0xc
10092b49  837d0c00                       cmp dword ptr [ebp + 0xc], 0
10092b4d  53                             push ebx
10092b4e  56                             push esi
10092b4f  57                             push edi
10092b50  8bd9                           mov ebx, ecx
10092b52  741d                           je 0x10092b71
10092b54  837b4400                       cmp dword ptr [ebx + 0x44], 0
10092b58  7517                           jne 0x10092b71
10092b5a  8b4508                         mov eax, dword ptr [ebp + 8]
10092b5d  8b5358                         mov edx, dword ptr [ebx + 0x58]
10092b60  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
10092b63  8910                           mov dword ptr [eax], edx
10092b65  894804                         mov dword ptr [eax + 4], ecx
10092b68  5f                             pop edi
10092b69  5e                             pop esi
10092b6a  5b                             pop ebx
10092b6b  8be5                           mov esp, ebp
10092b6d  5d                             pop ebp
10092b6e  c20800                         ret 8
10092b71  c7434400000000                 mov dword ptr [ebx + 0x44], 0
10092b78  e87358ffff                     call 0x100883f0
10092b7d  8b4374                         mov eax, dword ptr [ebx + 0x74]
10092b80  8b4b60                         mov ecx, dword ptr [ebx + 0x60]
10092b83  8bb048080000                   mov esi, dword ptr [eax + 0x848]
10092b89  8974240c                       mov dword ptr [esp + 0xc], esi
10092b8d  85c9                           test ecx, ecx
10092b8f  742c                           je 0x10092bbd
10092b91  8b5160                         mov edx, dword ptr [ecx + 0x60]
10092b94  85d2                           test edx, edx
10092b96  7408                           je 0x10092ba0
10092b98  8b4204                         mov eax, dword ptr [edx + 4]
10092b9b  3b4304                         cmp eax, dword ptr [ebx + 4]
10092b9e  7413                           je 0x10092bb3
10092ba0  8b4158                         mov eax, dword ptr [ecx + 0x58]
10092ba3  89442410                       mov dword ptr [esp + 0x10], eax
10092ba7  3b715c                         cmp esi, dword ptr [ecx + 0x5c]
10092baa  7f07                           jg 0x10092bb3
10092bac  8b715c                         mov esi, dword ptr [ecx + 0x5c]
10092baf  89442410                       mov dword ptr [esp + 0x10], eax
10092bb3  8bca                           mov ecx, edx
10092bb5  85c9                           test ecx, ecx
10092bb7  75d8                           jne 0x10092b91
10092bb9  8974240c                       mov dword ptr [esp + 0xc], esi
10092bbd  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
10092bc0  8b918c000000                   mov edx, dword ptr [ecx + 0x8c]
10092bc6  8b5264                         mov edx, dword ptr [edx + 0x64]
10092bc9  837a046f                       cmp dword ptr [edx + 4], 0x6f
10092bcd  7503                           jne 0x10092bd2
10092bcf  8b5264                         mov edx, dword ptr [edx + 0x64]
10092bd2  837a047a                       cmp dword ptr [edx + 4], 0x7a
10092bd6  7458                           je 0x10092c30
10092bd8  8b7b7c                         mov edi, dword ptr [ebx + 0x7c]
10092bdb  8bcf                           mov ecx, edi
10092bdd  8b7260                         mov esi, dword ptr [edx + 0x60]
10092be0  89742410                       mov dword ptr [esp + 0x10], esi
10092be4  8b878c000000                   mov eax, dword ptr [edi + 0x8c]
10092bea  85c0                           test eax, eax
10092bec  7439                           je 0x10092c27
10092bee  3bd0                           cmp edx, eax
10092bf0  7435                           je 0x10092c27
10092bf2  3b9790000000                   cmp edx, dword ptr [edi + 0x90]
10092bf8  742d                           je 0x10092c27
10092bfa  8b4264                         mov eax, dword ptr [edx + 0x64]
10092bfd  894664                         mov dword ptr [esi + 0x64], eax
10092c00  8b7264                         mov esi, dword ptr [edx + 0x64]
10092c03  8b4260                         mov eax, dword ptr [edx + 0x60]
10092c06  894660                         mov dword ptr [esi + 0x60], eax
10092c09  8b4a64                         mov ecx, dword ptr [edx + 0x64]
10092c0c  e8ef58ffff                     call 0x10088500
10092c11  8bcf                           mov ecx, edi
10092c13  e8e858ffff                     call 0x10088500
10092c18  8b02                           mov eax, dword ptr [edx]
10092c1a  8bca                           mov ecx, edx
10092c1c  6a01                           push 1
10092c1e  ff10                           call dword ptr [eax]
10092c20  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
10092c23  8b742410                       mov esi, dword ptr [esp + 0x10]
10092c27  8b5664                         mov edx, dword ptr [esi + 0x64]
10092c2a  837a047a                       cmp dword ptr [edx + 4], 0x7a
10092c2e  75a8                           jne 0x10092bd8
10092c30  8b4308                         mov eax, dword ptr [ebx + 8]
10092c33  ff750c                         push dword ptr [ebp + 0xc]
10092c36  894108                         mov dword ptr [ecx + 8], eax
10092c39  8d442414                       lea eax, [esp + 0x14]
10092c3d  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
10092c40  50                             push eax
10092c41  8b01                           mov eax, dword ptr [ecx]
10092c43  ff5008                         call dword ptr [eax + 8]
10092c46  8b74240c                       mov esi, dword ptr [esp + 0xc]
10092c4a  5f                             pop edi
10092c4b  8b08                           mov ecx, dword ptr [eax]
10092c4d  8bc6                           mov eax, esi
10092c4f  99                             cdq 
10092c50  2bc2                           sub eax, edx
10092c52  89735c                         mov dword ptr [ebx + 0x5c], esi
10092c55  d1f8                           sar eax, 1
10092c57  f7d8                           neg eax
10092c59  894b58                         mov dword ptr [ebx + 0x58], ecx
10092c5c  894354                         mov dword ptr [ebx + 0x54], eax
10092c5f  8b4508                         mov eax, dword ptr [ebp + 8]
10092c62  897004                         mov dword ptr [eax + 4], esi
10092c65  5e                             pop esi
10092c66  8908                           mov dword ptr [eax], ecx
10092c68  5b                             pop ebx
10092c69  8be5                           mov esp, ebp
10092c6b  5d                             pop ebp
10092c6c  c20800                         ret 8
10092c6f  cc                             int3 
