; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009b580 <= VA < 0x1009b6d0 (next decompiler entry; may include padding/thunks)
1009b580  55                             push ebp
1009b581  8bec                           mov ebp, esp
1009b583  83e4f8                         and esp, 0xfffffff8
1009b586  83ec1c                         sub esp, 0x1c
1009b589  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009b58d  53                             push ebx
1009b58e  56                             push esi
1009b58f  57                             push edi
1009b590  8bd9                           mov ebx, ecx
1009b592  741d                           je 0x1009b5b1
1009b594  837b4400                       cmp dword ptr [ebx + 0x44], 0
1009b598  7517                           jne 0x1009b5b1
1009b59a  8b4508                         mov eax, dword ptr [ebp + 8]
1009b59d  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009b5a0  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009b5a3  8910                           mov dword ptr [eax], edx
1009b5a5  894804                         mov dword ptr [eax + 4], ecx
1009b5a8  5f                             pop edi
1009b5a9  5e                             pop esi
1009b5aa  5b                             pop ebx
1009b5ab  8be5                           mov esp, ebp
1009b5ad  5d                             pop ebp
1009b5ae  c20800                         ret 8
1009b5b1  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1009b5b8  e833cefeff                     call 0x100883f0
1009b5bd  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009b5c0  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009b5c7  8d8658080000                   lea eax, [esi + 0x858]
1009b5cd  89742410                       mov dword ptr [esp + 0x10], esi
1009b5d1  7202                           jb 0x1009b5d5
1009b5d3  8b00                           mov eax, dword ptr [eax]
1009b5d5  50                             push eax
1009b5d6  ff7308                         push dword ptr [ebx + 8]
1009b5d9  8bce                           mov ecx, esi
1009b5db  e8808ffeff                     call 0x10084560
1009b5e0  33c0                           xor eax, eax
1009b5e2  c744241800000000               mov dword ptr [esp + 0x18], 0
1009b5ea  8944241c                       mov dword ptr [esp + 0x1c], eax
1009b5ee  c74424146de00000               mov dword ptr [esp + 0x14], 0xe06d
1009b5f6  3906                           cmp dword ptr [esi], eax
1009b5f8  7452                           je 0x1009b64c
1009b5fa  81ec20040000                   sub esp, 0x420
1009b600  83c604                         add esi, 4
1009b603  8bfc                           mov edi, esp
1009b605  b908010000                     mov ecx, 0x108
1009b60a  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009b60c  8bb42430040000                 mov esi, dword ptr [esp + 0x430]
1009b613  8bce                           mov ecx, esi
1009b615  e80692feff                     call 0x10084820
1009b61a  8b0e                           mov ecx, dword ptr [esi]
1009b61c  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1009b622  50                             push eax
1009b623  ffd7                           call edi
1009b625  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1009b629  8bf0                           mov esi, eax
1009b62b  8d442418                       lea eax, [esp + 0x18]
1009b62f  50                             push eax
1009b630  6a01                           push 1
1009b632  8b09                           mov ecx, dword ptr [ecx]
1009b634  8d44241c                       lea eax, [esp + 0x1c]
1009b638  50                             push eax
1009b639  ff1508fe0d10                   call dword ptr [0x100dfe08]
1009b63f  8b442410                       mov eax, dword ptr [esp + 0x10]
1009b643  56                             push esi
1009b644  8b08                           mov ecx, dword ptr [eax]
1009b646  ffd7                           call edi
1009b648  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1009b64c  8b35c8e20a10                   mov esi, dword ptr [0x100ae2c8]
1009b652  6a64                           push 0x64
1009b654  6a14                           push 0x14
1009b656  50                             push eax
1009b657  ffd6                           call esi
1009b659  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1009b65d  8d542420                       lea edx, [esp + 0x20]
1009b661  ff750c                         push dword ptr [ebp + 0xc]
1009b664  898b80000000                   mov dword ptr [ebx + 0x80], ecx
1009b66a  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009b66d  898384000000                   mov dword ptr [ebx + 0x84], eax
1009b673  8b4308                         mov eax, dword ptr [ebx + 8]
1009b676  52                             push edx
1009b677  894108                         mov dword ptr [ecx + 8], eax
1009b67a  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009b67d  8b01                           mov eax, dword ptr [ecx]
1009b67f  ff5008                         call dword ptr [eax + 8]
1009b682  6a64                           push 0x64
1009b684  6a14                           push 0x14
1009b686  ffb380000000                   push dword ptr [ebx + 0x80]
1009b68c  ffd6                           call esi
1009b68e  8b742420                       mov esi, dword ptr [esp + 0x20]
1009b692  8b8b84000000                   mov ecx, dword ptr [ebx + 0x84]
1009b698  03f0                           add esi, eax
1009b69a  8b8380000000                   mov eax, dword ptr [ebx + 0x80]
1009b6a0  3bf0                           cmp esi, eax
1009b6a2  8b542424                       mov edx, dword ptr [esp + 0x24]
1009b6a6  0f4cf0                         cmovl esi, eax
1009b6a9  03d1                           add edx, ecx
1009b6ab  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009b6ae  5f                             pop edi
1009b6af  8b4054                         mov eax, dword ptr [eax + 0x54]
1009b6b2  2bc1                           sub eax, ecx
1009b6b4  897358                         mov dword ptr [ebx + 0x58], esi
1009b6b7  894354                         mov dword ptr [ebx + 0x54], eax
1009b6ba  8b4508                         mov eax, dword ptr [ebp + 8]
1009b6bd  89535c                         mov dword ptr [ebx + 0x5c], edx
1009b6c0  8930                           mov dword ptr [eax], esi
1009b6c2  5e                             pop esi
1009b6c3  895004                         mov dword ptr [eax + 4], edx
1009b6c6  5b                             pop ebx
1009b6c7  8be5                           mov esp, ebp
1009b6c9  5d                             pop ebp
1009b6ca  c20800                         ret 8
1009b6cd  cc                             int3 
1009b6ce  cc                             int3 
1009b6cf  cc                             int3 
