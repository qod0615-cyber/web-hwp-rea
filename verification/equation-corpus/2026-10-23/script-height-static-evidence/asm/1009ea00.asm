; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009ea00 <= VA < 0x1009eb50 (next decompiler entry; may include padding/thunks)
1009ea00  55                             push ebp
1009ea01  8bec                           mov ebp, esp
1009ea03  83e4f8                         and esp, 0xfffffff8
1009ea06  83ec1c                         sub esp, 0x1c
1009ea09  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009ea0d  53                             push ebx
1009ea0e  56                             push esi
1009ea0f  57                             push edi
1009ea10  8bd9                           mov ebx, ecx
1009ea12  741d                           je 0x1009ea31
1009ea14  837b4400                       cmp dword ptr [ebx + 0x44], 0
1009ea18  7517                           jne 0x1009ea31
1009ea1a  8b4508                         mov eax, dword ptr [ebp + 8]
1009ea1d  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009ea20  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009ea23  8910                           mov dword ptr [eax], edx
1009ea25  894804                         mov dword ptr [eax + 4], ecx
1009ea28  5f                             pop edi
1009ea29  5e                             pop esi
1009ea2a  5b                             pop ebx
1009ea2b  8be5                           mov esp, ebp
1009ea2d  5d                             pop ebp
1009ea2e  c20800                         ret 8
1009ea31  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1009ea38  e8b399feff                     call 0x100883f0
1009ea3d  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009ea40  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009ea47  8d8658080000                   lea eax, [esi + 0x858]
1009ea4d  89742410                       mov dword ptr [esp + 0x10], esi
1009ea51  7202                           jb 0x1009ea55
1009ea53  8b00                           mov eax, dword ptr [eax]
1009ea55  50                             push eax
1009ea56  ff7308                         push dword ptr [ebx + 8]
1009ea59  8bce                           mov ecx, esi
1009ea5b  e8005bfeff                     call 0x10084560
1009ea60  33c0                           xor eax, eax
1009ea62  c744241800000000               mov dword ptr [esp + 0x18], 0
1009ea6a  8944241c                       mov dword ptr [esp + 0x1c], eax
1009ea6e  c744241465e00000               mov dword ptr [esp + 0x14], 0xe065
1009ea76  3906                           cmp dword ptr [esi], eax
1009ea78  7452                           je 0x1009eacc
1009ea7a  81ec20040000                   sub esp, 0x420
1009ea80  83c604                         add esi, 4
1009ea83  8bfc                           mov edi, esp
1009ea85  b908010000                     mov ecx, 0x108
1009ea8a  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009ea8c  8bb42430040000                 mov esi, dword ptr [esp + 0x430]
1009ea93  8bce                           mov ecx, esi
1009ea95  e8865dfeff                     call 0x10084820
1009ea9a  8b0e                           mov ecx, dword ptr [esi]
1009ea9c  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1009eaa2  50                             push eax
1009eaa3  ffd7                           call edi
1009eaa5  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1009eaa9  8bf0                           mov esi, eax
1009eaab  8d442418                       lea eax, [esp + 0x18]
1009eaaf  50                             push eax
1009eab0  6a01                           push 1
1009eab2  8b09                           mov ecx, dword ptr [ecx]
1009eab4  8d44241c                       lea eax, [esp + 0x1c]
1009eab8  50                             push eax
1009eab9  ff1508fe0d10                   call dword ptr [0x100dfe08]
1009eabf  8b442410                       mov eax, dword ptr [esp + 0x10]
1009eac3  56                             push esi
1009eac4  8b08                           mov ecx, dword ptr [eax]
1009eac6  ffd7                           call edi
1009eac8  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1009eacc  6a64                           push 0x64
1009eace  6a14                           push 0x14
1009ead0  50                             push eax
1009ead1  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009ead7  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1009eadb  8d542420                       lea edx, [esp + 0x20]
1009eadf  ff750c                         push dword ptr [ebp + 0xc]
1009eae2  898b80000000                   mov dword ptr [ebx + 0x80], ecx
1009eae8  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009eaeb  898384000000                   mov dword ptr [ebx + 0x84], eax
1009eaf1  8b4308                         mov eax, dword ptr [ebx + 8]
1009eaf4  52                             push edx
1009eaf5  894108                         mov dword ptr [ecx + 8], eax
1009eaf8  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009eafb  8b01                           mov eax, dword ptr [ecx]
1009eafd  ff5008                         call dword ptr [eax + 8]
1009eb00  8bbb80000000                   mov edi, dword ptr [ebx + 0x80]
1009eb06  b856555555                     mov eax, 0x55555556
1009eb0b  397c2420                       cmp dword ptr [esp + 0x20], edi
1009eb0f  8b8b84000000                   mov ecx, dword ptr [ebx + 0x84]
1009eb15  0f4f7c2420                     cmovg edi, dword ptr [esp + 0x20]
1009eb1a  f7e9                           imul ecx
1009eb1c  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009eb1f  8bf2                           mov esi, edx
1009eb21  c1ee1f                         shr esi, 0x1f
1009eb24  03f2                           add esi, edx
1009eb26  8b4054                         mov eax, dword ptr [eax + 0x54]
1009eb29  03f1                           add esi, ecx
1009eb2b  03742424                       add esi, dword ptr [esp + 0x24]
1009eb2f  2bc1                           sub eax, ecx
1009eb31  894354                         mov dword ptr [ebx + 0x54], eax
1009eb34  8b4508                         mov eax, dword ptr [ebp + 8]
1009eb37  897b58                         mov dword ptr [ebx + 0x58], edi
1009eb3a  89735c                         mov dword ptr [ebx + 0x5c], esi
1009eb3d  8938                           mov dword ptr [eax], edi
1009eb3f  5f                             pop edi
1009eb40  897004                         mov dword ptr [eax + 4], esi
1009eb43  5e                             pop esi
1009eb44  5b                             pop ebx
1009eb45  8be5                           mov esp, ebp
1009eb47  5d                             pop ebp
1009eb48  c20800                         ret 8
1009eb4b  cc                             int3 
1009eb4c  cc                             int3 
1009eb4d  cc                             int3 
1009eb4e  cc                             int3 
1009eb4f  cc                             int3 
