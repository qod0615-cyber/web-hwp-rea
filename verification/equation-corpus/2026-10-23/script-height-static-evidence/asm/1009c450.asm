; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009c450 <= VA < 0x1009c5a0 (next decompiler entry; may include padding/thunks)
1009c450  55                             push ebp
1009c451  8bec                           mov ebp, esp
1009c453  83e4f8                         and esp, 0xfffffff8
1009c456  83ec1c                         sub esp, 0x1c
1009c459  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009c45d  53                             push ebx
1009c45e  56                             push esi
1009c45f  57                             push edi
1009c460  8bd9                           mov ebx, ecx
1009c462  741d                           je 0x1009c481
1009c464  837b4400                       cmp dword ptr [ebx + 0x44], 0
1009c468  7517                           jne 0x1009c481
1009c46a  8b4508                         mov eax, dword ptr [ebp + 8]
1009c46d  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009c470  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009c473  8910                           mov dword ptr [eax], edx
1009c475  894804                         mov dword ptr [eax + 4], ecx
1009c478  5f                             pop edi
1009c479  5e                             pop esi
1009c47a  5b                             pop ebx
1009c47b  8be5                           mov esp, ebp
1009c47d  5d                             pop ebp
1009c47e  c20800                         ret 8
1009c481  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1009c488  e863bffeff                     call 0x100883f0
1009c48d  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009c490  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009c497  8d8658080000                   lea eax, [esi + 0x858]
1009c49d  89742410                       mov dword ptr [esp + 0x10], esi
1009c4a1  7202                           jb 0x1009c4a5
1009c4a3  8b00                           mov eax, dword ptr [eax]
1009c4a5  50                             push eax
1009c4a6  ff7308                         push dword ptr [ebx + 8]
1009c4a9  8bce                           mov ecx, esi
1009c4ab  e8b080feff                     call 0x10084560
1009c4b0  33c0                           xor eax, eax
1009c4b2  c744241800000000               mov dword ptr [esp + 0x18], 0
1009c4ba  8944241c                       mov dword ptr [esp + 0x1c], eax
1009c4be  c74424146de00000               mov dword ptr [esp + 0x14], 0xe06d
1009c4c6  3906                           cmp dword ptr [esi], eax
1009c4c8  7452                           je 0x1009c51c
1009c4ca  81ec20040000                   sub esp, 0x420
1009c4d0  83c604                         add esi, 4
1009c4d3  8bfc                           mov edi, esp
1009c4d5  b908010000                     mov ecx, 0x108
1009c4da  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009c4dc  8bb42430040000                 mov esi, dword ptr [esp + 0x430]
1009c4e3  8bce                           mov ecx, esi
1009c4e5  e83683feff                     call 0x10084820
1009c4ea  8b0e                           mov ecx, dword ptr [esi]
1009c4ec  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1009c4f2  50                             push eax
1009c4f3  ffd7                           call edi
1009c4f5  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1009c4f9  8bf0                           mov esi, eax
1009c4fb  8d442418                       lea eax, [esp + 0x18]
1009c4ff  50                             push eax
1009c500  6a01                           push 1
1009c502  8b09                           mov ecx, dword ptr [ecx]
1009c504  8d44241c                       lea eax, [esp + 0x1c]
1009c508  50                             push eax
1009c509  ff1508fe0d10                   call dword ptr [0x100dfe08]
1009c50f  8b442410                       mov eax, dword ptr [esp + 0x10]
1009c513  56                             push esi
1009c514  8b08                           mov ecx, dword ptr [eax]
1009c516  ffd7                           call edi
1009c518  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1009c51c  8b3dc8e20a10                   mov edi, dword ptr [0x100ae2c8]
1009c522  6a64                           push 0x64
1009c524  6a14                           push 0x14
1009c526  50                             push eax
1009c527  ffd7                           call edi
1009c529  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1009c52d  8d542420                       lea edx, [esp + 0x20]
1009c531  ff750c                         push dword ptr [ebp + 0xc]
1009c534  898b80000000                   mov dword ptr [ebx + 0x80], ecx
1009c53a  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009c53d  898384000000                   mov dword ptr [ebx + 0x84], eax
1009c543  8b4308                         mov eax, dword ptr [ebx + 8]
1009c546  52                             push edx
1009c547  894108                         mov dword ptr [ecx + 8], eax
1009c54a  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009c54d  8b01                           mov eax, dword ptr [ecx]
1009c54f  ff5008                         call dword ptr [eax + 8]
1009c552  8b8b80000000                   mov ecx, dword ptr [ebx + 0x80]
1009c558  8bf1                           mov esi, ecx
1009c55a  394c2420                       cmp dword ptr [esp + 0x20], ecx
1009c55e  6a64                           push 0x64
1009c560  0f4f742424                     cmovg esi, dword ptr [esp + 0x24]
1009c565  6a14                           push 0x14
1009c567  51                             push ecx
1009c568  ffd7                           call edi
1009c56a  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009c56d  8b9384000000                   mov edx, dword ptr [ebx + 0x84]
1009c573  03542424                       add edx, dword ptr [esp + 0x24]
1009c577  8d3c06                         lea edi, [esi + eax]
1009c57a  8b4508                         mov eax, dword ptr [ebp + 8]
1009c57d  8b4954                         mov ecx, dword ptr [ecx + 0x54]
1009c580  897b58                         mov dword ptr [ebx + 0x58], edi
1009c583  894b54                         mov dword ptr [ebx + 0x54], ecx
1009c586  8938                           mov dword ptr [eax], edi
1009c588  5f                             pop edi
1009c589  5e                             pop esi
1009c58a  89535c                         mov dword ptr [ebx + 0x5c], edx
1009c58d  895004                         mov dword ptr [eax + 4], edx
1009c590  5b                             pop ebx
1009c591  8be5                           mov esp, ebp
1009c593  5d                             pop ebp
1009c594  c20800                         ret 8
1009c597  cc                             int3 
1009c598  cc                             int3 
1009c599  cc                             int3 
1009c59a  cc                             int3 
1009c59b  cc                             int3 
1009c59c  cc                             int3 
1009c59d  cc                             int3 
1009c59e  cc                             int3 
1009c59f  cc                             int3 
