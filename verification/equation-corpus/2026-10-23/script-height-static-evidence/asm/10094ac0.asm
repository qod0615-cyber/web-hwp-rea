; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10094ac0 <= VA < 0x10094b70 (next decompiler entry; may include padding/thunks)
10094ac0  55                             push ebp
10094ac1  8bec                           mov ebp, esp
10094ac3  83ec08                         sub esp, 8
10094ac6  53                             push ebx
10094ac7  56                             push esi
10094ac8  8b7174                         mov esi, dword ptr [ecx + 0x74]
10094acb  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
10094ad2  8d8658080000                   lea eax, [esi + 0x858]
10094ad8  57                             push edi
10094ad9  8975fc                         mov dword ptr [ebp - 4], esi
10094adc  7202                           jb 0x10094ae0
10094ade  8b00                           mov eax, dword ptr [eax]
10094ae0  50                             push eax
10094ae1  ff7108                         push dword ptr [ecx + 8]
10094ae4  8bce                           mov ecx, esi
10094ae6  e875fafeff                     call 0x10084560
10094aeb  8b5d08                         mov ebx, dword ptr [ebp + 8]
10094aee  33c0                           xor eax, eax
10094af0  c745f801e10000                 mov dword ptr [ebp - 8], 0xe101
10094af7  c70300000000                   mov dword ptr [ebx], 0
10094afd  c7430400000000                 mov dword ptr [ebx + 4], 0
10094b04  3906                           cmp dword ptr [esi], eax
10094b06  7446                           je 0x10094b4e
10094b08  81ec20040000                   sub esp, 0x420
10094b0e  83c604                         add esi, 4
10094b11  8bfc                           mov edi, esp
10094b13  b908010000                     mov ecx, 0x108
10094b18  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
10094b1a  8b75fc                         mov esi, dword ptr [ebp - 4]
10094b1d  8bce                           mov ecx, esi
10094b1f  e8fcfcfeff                     call 0x10084820
10094b24  8b0e                           mov ecx, dword ptr [esi]
10094b26  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
10094b2c  50                             push eax
10094b2d  ffd7                           call edi
10094b2f  8b4dfc                         mov ecx, dword ptr [ebp - 4]
10094b32  8bf0                           mov esi, eax
10094b34  53                             push ebx
10094b35  6a01                           push 1
10094b37  8d45f8                         lea eax, [ebp - 8]
10094b3a  8b09                           mov ecx, dword ptr [ecx]
10094b3c  50                             push eax
10094b3d  ff1508fe0d10                   call dword ptr [0x100dfe08]
10094b43  8b45fc                         mov eax, dword ptr [ebp - 4]
10094b46  56                             push esi
10094b47  8b08                           mov ecx, dword ptr [eax]
10094b49  ffd7                           call edi
10094b4b  8b4304                         mov eax, dword ptr [ebx + 4]
10094b4e  6a64                           push 0x64
10094b50  6a14                           push 0x14
10094b52  50                             push eax
10094b53  ff15c8e20a10                   call dword ptr [0x100ae2c8]
10094b59  5f                             pop edi
10094b5a  894304                         mov dword ptr [ebx + 4], eax
10094b5d  8bc3                           mov eax, ebx
10094b5f  5e                             pop esi
10094b60  5b                             pop ebx
10094b61  8be5                           mov esp, ebp
10094b63  5d                             pop ebp
10094b64  c20400                         ret 4
10094b67  cc                             int3 
10094b68  cc                             int3 
10094b69  cc                             int3 
10094b6a  cc                             int3 
10094b6b  cc                             int3 
10094b6c  cc                             int3 
10094b6d  cc                             int3 
10094b6e  cc                             int3 
10094b6f  cc                             int3 
