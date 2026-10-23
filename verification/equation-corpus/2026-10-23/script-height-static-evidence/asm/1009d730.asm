; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009d730 <= VA < 0x1009d870 (next decompiler entry; may include padding/thunks)
1009d730  55                             push ebp
1009d731  8bec                           mov ebp, esp
1009d733  83e4f8                         and esp, 0xfffffff8
1009d736  83ec1c                         sub esp, 0x1c
1009d739  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009d73d  53                             push ebx
1009d73e  56                             push esi
1009d73f  57                             push edi
1009d740  8bd9                           mov ebx, ecx
1009d742  741d                           je 0x1009d761
1009d744  837b4400                       cmp dword ptr [ebx + 0x44], 0
1009d748  7517                           jne 0x1009d761
1009d74a  8b4508                         mov eax, dword ptr [ebp + 8]
1009d74d  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009d750  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009d753  8910                           mov dword ptr [eax], edx
1009d755  894804                         mov dword ptr [eax + 4], ecx
1009d758  5f                             pop edi
1009d759  5e                             pop esi
1009d75a  5b                             pop ebx
1009d75b  8be5                           mov esp, ebp
1009d75d  5d                             pop ebp
1009d75e  c20800                         ret 8
1009d761  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1009d768  e883acfeff                     call 0x100883f0
1009d76d  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009d770  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009d777  8d8658080000                   lea eax, [esi + 0x858]
1009d77d  89742410                       mov dword ptr [esp + 0x10], esi
1009d781  7202                           jb 0x1009d785
1009d783  8b00                           mov eax, dword ptr [eax]
1009d785  50                             push eax
1009d786  ff7308                         push dword ptr [ebx + 8]
1009d789  8bce                           mov ecx, esi
1009d78b  e8d06dfeff                     call 0x10084560
1009d790  33c0                           xor eax, eax
1009d792  c744241800000000               mov dword ptr [esp + 0x18], 0
1009d79a  8944241c                       mov dword ptr [esp + 0x1c], eax
1009d79e  c74424145fe00000               mov dword ptr [esp + 0x14], 0xe05f
1009d7a6  3906                           cmp dword ptr [esi], eax
1009d7a8  7452                           je 0x1009d7fc
1009d7aa  81ec20040000                   sub esp, 0x420
1009d7b0  83c604                         add esi, 4
1009d7b3  8bfc                           mov edi, esp
1009d7b5  b908010000                     mov ecx, 0x108
1009d7ba  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009d7bc  8bb42430040000                 mov esi, dword ptr [esp + 0x430]
1009d7c3  8bce                           mov ecx, esi
1009d7c5  e85670feff                     call 0x10084820
1009d7ca  8b0e                           mov ecx, dword ptr [esi]
1009d7cc  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1009d7d2  50                             push eax
1009d7d3  ffd7                           call edi
1009d7d5  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1009d7d9  8bf0                           mov esi, eax
1009d7db  8d442418                       lea eax, [esp + 0x18]
1009d7df  50                             push eax
1009d7e0  6a01                           push 1
1009d7e2  8b09                           mov ecx, dword ptr [ecx]
1009d7e4  8d44241c                       lea eax, [esp + 0x1c]
1009d7e8  50                             push eax
1009d7e9  ff1508fe0d10                   call dword ptr [0x100dfe08]
1009d7ef  8b442410                       mov eax, dword ptr [esp + 0x10]
1009d7f3  56                             push esi
1009d7f4  8b08                           mov ecx, dword ptr [eax]
1009d7f6  ffd7                           call edi
1009d7f8  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1009d7fc  6a64                           push 0x64
1009d7fe  6a14                           push 0x14
1009d800  50                             push eax
1009d801  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009d807  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1009d80b  8d542420                       lea edx, [esp + 0x20]
1009d80f  ff750c                         push dword ptr [ebp + 0xc]
1009d812  898b80000000                   mov dword ptr [ebx + 0x80], ecx
1009d818  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009d81b  898384000000                   mov dword ptr [ebx + 0x84], eax
1009d821  8b4308                         mov eax, dword ptr [ebx + 8]
1009d824  52                             push edx
1009d825  894108                         mov dword ptr [ecx + 8], eax
1009d828  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009d82b  8b01                           mov eax, dword ptr [ecx]
1009d82d  ff5008                         call dword ptr [eax + 8]
1009d830  8bb380000000                   mov esi, dword ptr [ebx + 0x80]
1009d836  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009d839  39742420                       cmp dword ptr [esp + 0x20], esi
1009d83d  8b8b84000000                   mov ecx, dword ptr [ebx + 0x84]
1009d843  0f4f742420                     cmovg esi, dword ptr [esp + 0x20]
1009d848  8b4054                         mov eax, dword ptr [eax + 0x54]
1009d84b  8b542424                       mov edx, dword ptr [esp + 0x24]
1009d84f  03d1                           add edx, ecx
1009d851  897358                         mov dword ptr [ebx + 0x58], esi
1009d854  2bc1                           sub eax, ecx
1009d856  89535c                         mov dword ptr [ebx + 0x5c], edx
1009d859  894354                         mov dword ptr [ebx + 0x54], eax
1009d85c  8b4508                         mov eax, dword ptr [ebp + 8]
1009d85f  5f                             pop edi
1009d860  8930                           mov dword ptr [eax], esi
1009d862  5e                             pop esi
1009d863  895004                         mov dword ptr [eax + 4], edx
1009d866  5b                             pop ebx
1009d867  8be5                           mov esp, ebp
1009d869  5d                             pop ebp
1009d86a  c20800                         ret 8
1009d86d  cc                             int3 
1009d86e  cc                             int3 
1009d86f  cc                             int3 
