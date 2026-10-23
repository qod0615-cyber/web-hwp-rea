; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009e4d0 <= VA < 0x1009e610 (next decompiler entry; may include padding/thunks)
1009e4d0  55                             push ebp
1009e4d1  8bec                           mov ebp, esp
1009e4d3  83e4f8                         and esp, 0xfffffff8
1009e4d6  83ec1c                         sub esp, 0x1c
1009e4d9  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009e4dd  53                             push ebx
1009e4de  56                             push esi
1009e4df  57                             push edi
1009e4e0  8bd9                           mov ebx, ecx
1009e4e2  741d                           je 0x1009e501
1009e4e4  837b4400                       cmp dword ptr [ebx + 0x44], 0
1009e4e8  7517                           jne 0x1009e501
1009e4ea  8b4508                         mov eax, dword ptr [ebp + 8]
1009e4ed  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009e4f0  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009e4f3  8910                           mov dword ptr [eax], edx
1009e4f5  894804                         mov dword ptr [eax + 4], ecx
1009e4f8  5f                             pop edi
1009e4f9  5e                             pop esi
1009e4fa  5b                             pop ebx
1009e4fb  8be5                           mov esp, ebp
1009e4fd  5d                             pop ebp
1009e4fe  c20800                         ret 8
1009e501  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1009e508  e8e39efeff                     call 0x100883f0
1009e50d  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009e510  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009e517  8d8658080000                   lea eax, [esi + 0x858]
1009e51d  89742410                       mov dword ptr [esp + 0x10], esi
1009e521  7202                           jb 0x1009e525
1009e523  8b00                           mov eax, dword ptr [eax]
1009e525  50                             push eax
1009e526  ff7308                         push dword ptr [ebx + 8]
1009e529  8bce                           mov ecx, esi
1009e52b  e83060feff                     call 0x10084560
1009e530  33c0                           xor eax, eax
1009e532  c744241800000000               mov dword ptr [esp + 0x18], 0
1009e53a  8944241c                       mov dword ptr [esp + 0x1c], eax
1009e53e  c744241464e00000               mov dword ptr [esp + 0x14], 0xe064
1009e546  3906                           cmp dword ptr [esi], eax
1009e548  7452                           je 0x1009e59c
1009e54a  81ec20040000                   sub esp, 0x420
1009e550  83c604                         add esi, 4
1009e553  8bfc                           mov edi, esp
1009e555  b908010000                     mov ecx, 0x108
1009e55a  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009e55c  8bb42430040000                 mov esi, dword ptr [esp + 0x430]
1009e563  8bce                           mov ecx, esi
1009e565  e8b662feff                     call 0x10084820
1009e56a  8b0e                           mov ecx, dword ptr [esi]
1009e56c  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1009e572  50                             push eax
1009e573  ffd7                           call edi
1009e575  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1009e579  8bf0                           mov esi, eax
1009e57b  8d442418                       lea eax, [esp + 0x18]
1009e57f  50                             push eax
1009e580  6a01                           push 1
1009e582  8b09                           mov ecx, dword ptr [ecx]
1009e584  8d44241c                       lea eax, [esp + 0x1c]
1009e588  50                             push eax
1009e589  ff1508fe0d10                   call dword ptr [0x100dfe08]
1009e58f  8b442410                       mov eax, dword ptr [esp + 0x10]
1009e593  56                             push esi
1009e594  8b08                           mov ecx, dword ptr [eax]
1009e596  ffd7                           call edi
1009e598  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1009e59c  6a64                           push 0x64
1009e59e  6a14                           push 0x14
1009e5a0  50                             push eax
1009e5a1  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009e5a7  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1009e5ab  8d542420                       lea edx, [esp + 0x20]
1009e5af  ff750c                         push dword ptr [ebp + 0xc]
1009e5b2  898b80000000                   mov dword ptr [ebx + 0x80], ecx
1009e5b8  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009e5bb  898384000000                   mov dword ptr [ebx + 0x84], eax
1009e5c1  8b4308                         mov eax, dword ptr [ebx + 8]
1009e5c4  52                             push edx
1009e5c5  894108                         mov dword ptr [ecx + 8], eax
1009e5c8  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009e5cb  8b01                           mov eax, dword ptr [ecx]
1009e5cd  ff5008                         call dword ptr [eax + 8]
1009e5d0  8bb380000000                   mov esi, dword ptr [ebx + 0x80]
1009e5d6  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009e5d9  39742420                       cmp dword ptr [esp + 0x20], esi
1009e5dd  8b8b84000000                   mov ecx, dword ptr [ebx + 0x84]
1009e5e3  0f4f742420                     cmovg esi, dword ptr [esp + 0x20]
1009e5e8  8b4054                         mov eax, dword ptr [eax + 0x54]
1009e5eb  8b542424                       mov edx, dword ptr [esp + 0x24]
1009e5ef  03d1                           add edx, ecx
1009e5f1  897358                         mov dword ptr [ebx + 0x58], esi
1009e5f4  2bc1                           sub eax, ecx
1009e5f6  89535c                         mov dword ptr [ebx + 0x5c], edx
1009e5f9  894354                         mov dword ptr [ebx + 0x54], eax
1009e5fc  8b4508                         mov eax, dword ptr [ebp + 8]
1009e5ff  5f                             pop edi
1009e600  8930                           mov dword ptr [eax], esi
1009e602  5e                             pop esi
1009e603  895004                         mov dword ptr [eax + 4], edx
1009e606  5b                             pop ebx
1009e607  8be5                           mov esp, ebp
1009e609  5d                             pop ebp
1009e60a  c20800                         ret 8
1009e60d  cc                             int3 
1009e60e  cc                             int3 
1009e60f  cc                             int3 
