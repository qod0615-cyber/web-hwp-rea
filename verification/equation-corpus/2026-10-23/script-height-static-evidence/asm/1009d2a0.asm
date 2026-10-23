; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009d2a0 <= VA < 0x1009d3e0 (next decompiler entry; may include padding/thunks)
1009d2a0  55                             push ebp
1009d2a1  8bec                           mov ebp, esp
1009d2a3  83e4f8                         and esp, 0xfffffff8
1009d2a6  83ec1c                         sub esp, 0x1c
1009d2a9  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009d2ad  53                             push ebx
1009d2ae  56                             push esi
1009d2af  57                             push edi
1009d2b0  8bd9                           mov ebx, ecx
1009d2b2  741d                           je 0x1009d2d1
1009d2b4  837b4400                       cmp dword ptr [ebx + 0x44], 0
1009d2b8  7517                           jne 0x1009d2d1
1009d2ba  8b4508                         mov eax, dword ptr [ebp + 8]
1009d2bd  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009d2c0  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009d2c3  8910                           mov dword ptr [eax], edx
1009d2c5  894804                         mov dword ptr [eax + 4], ecx
1009d2c8  5f                             pop edi
1009d2c9  5e                             pop esi
1009d2ca  5b                             pop ebx
1009d2cb  8be5                           mov esp, ebp
1009d2cd  5d                             pop ebp
1009d2ce  c20800                         ret 8
1009d2d1  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1009d2d8  e813b1feff                     call 0x100883f0
1009d2dd  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009d2e0  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009d2e7  8d8658080000                   lea eax, [esi + 0x858]
1009d2ed  89742410                       mov dword ptr [esp + 0x10], esi
1009d2f1  7202                           jb 0x1009d2f5
1009d2f3  8b00                           mov eax, dword ptr [eax]
1009d2f5  50                             push eax
1009d2f6  ff7308                         push dword ptr [ebx + 8]
1009d2f9  8bce                           mov ecx, esi
1009d2fb  e86072feff                     call 0x10084560
1009d300  33c0                           xor eax, eax
1009d302  c744241800000000               mov dword ptr [esp + 0x18], 0
1009d30a  8944241c                       mov dword ptr [esp + 0x1c], eax
1009d30e  c74424145ee00000               mov dword ptr [esp + 0x14], 0xe05e
1009d316  3906                           cmp dword ptr [esi], eax
1009d318  7452                           je 0x1009d36c
1009d31a  81ec20040000                   sub esp, 0x420
1009d320  83c604                         add esi, 4
1009d323  8bfc                           mov edi, esp
1009d325  b908010000                     mov ecx, 0x108
1009d32a  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009d32c  8bb42430040000                 mov esi, dword ptr [esp + 0x430]
1009d333  8bce                           mov ecx, esi
1009d335  e8e674feff                     call 0x10084820
1009d33a  8b0e                           mov ecx, dword ptr [esi]
1009d33c  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1009d342  50                             push eax
1009d343  ffd7                           call edi
1009d345  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1009d349  8bf0                           mov esi, eax
1009d34b  8d442418                       lea eax, [esp + 0x18]
1009d34f  50                             push eax
1009d350  6a01                           push 1
1009d352  8b09                           mov ecx, dword ptr [ecx]
1009d354  8d44241c                       lea eax, [esp + 0x1c]
1009d358  50                             push eax
1009d359  ff1508fe0d10                   call dword ptr [0x100dfe08]
1009d35f  8b442410                       mov eax, dword ptr [esp + 0x10]
1009d363  56                             push esi
1009d364  8b08                           mov ecx, dword ptr [eax]
1009d366  ffd7                           call edi
1009d368  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1009d36c  6a64                           push 0x64
1009d36e  6a14                           push 0x14
1009d370  50                             push eax
1009d371  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009d377  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1009d37b  8d542420                       lea edx, [esp + 0x20]
1009d37f  ff750c                         push dword ptr [ebp + 0xc]
1009d382  898b80000000                   mov dword ptr [ebx + 0x80], ecx
1009d388  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009d38b  898384000000                   mov dword ptr [ebx + 0x84], eax
1009d391  8b4308                         mov eax, dword ptr [ebx + 8]
1009d394  52                             push edx
1009d395  894108                         mov dword ptr [ecx + 8], eax
1009d398  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009d39b  8b01                           mov eax, dword ptr [ecx]
1009d39d  ff5008                         call dword ptr [eax + 8]
1009d3a0  8bb380000000                   mov esi, dword ptr [ebx + 0x80]
1009d3a6  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009d3a9  39742420                       cmp dword ptr [esp + 0x20], esi
1009d3ad  8b8b84000000                   mov ecx, dword ptr [ebx + 0x84]
1009d3b3  0f4f742420                     cmovg esi, dword ptr [esp + 0x20]
1009d3b8  8b4054                         mov eax, dword ptr [eax + 0x54]
1009d3bb  8b542424                       mov edx, dword ptr [esp + 0x24]
1009d3bf  03d1                           add edx, ecx
1009d3c1  897358                         mov dword ptr [ebx + 0x58], esi
1009d3c4  2bc1                           sub eax, ecx
1009d3c6  89535c                         mov dword ptr [ebx + 0x5c], edx
1009d3c9  894354                         mov dword ptr [ebx + 0x54], eax
1009d3cc  8b4508                         mov eax, dword ptr [ebp + 8]
1009d3cf  5f                             pop edi
1009d3d0  8930                           mov dword ptr [eax], esi
1009d3d2  5e                             pop esi
1009d3d3  895004                         mov dword ptr [eax + 4], edx
1009d3d6  5b                             pop ebx
1009d3d7  8be5                           mov esp, ebp
1009d3d9  5d                             pop ebp
1009d3da  c20800                         ret 8
1009d3dd  cc                             int3 
1009d3de  cc                             int3 
1009d3df  cc                             int3 
