; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009e610 <= VA < 0x1009e770 (next decompiler entry; may include padding/thunks)
1009e610  55                             push ebp
1009e611  8bec                           mov ebp, esp
1009e613  83ec14                         sub esp, 0x14
1009e616  53                             push ebx
1009e617  8bd9                           mov ebx, ecx
1009e619  56                             push esi
1009e61a  57                             push edi
1009e61b  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009e61e  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
1009e624  8b4864                         mov ecx, dword ptr [eax + 0x64]
1009e627  8379046f                       cmp dword ptr [ecx + 4], 0x6f
1009e62b  7520                           jne 0x1009e64d
1009e62d  b800200000                     mov eax, 0x2000
1009e632  6603819c000000                 add ax, word ptr [ecx + 0x9c]
1009e639  6683f819                       cmp ax, 0x19
1009e63d  770e                           ja 0x1009e64d
1009e63f  8b4174                         mov eax, dword ptr [ecx + 0x74]
1009e642  6683600e01                     and word ptr [eax + 0xe], 1
1009e647  7404                           je 0x1009e64d
1009e649  33ff                           xor edi, edi
1009e64b  eb05                           jmp 0x1009e652
1009e64d  bf01000000                     mov edi, 1
1009e652  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009e655  8975f4                         mov dword ptr [ebp - 0xc], esi
1009e658  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009e65f  8d8e58080000                   lea ecx, [esi + 0x858]
1009e665  7206                           jb 0x1009e66d
1009e667  8b8e58080000                   mov ecx, dword ptr [esi + 0x858]
1009e66d  51                             push ecx
1009e66e  ff7308                         push dword ptr [ebx + 8]
1009e671  8bce                           mov ecx, esi
1009e673  e8e85efeff                     call 0x10084560
1009e678  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009e67b  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009e67e  894df0                         mov dword ptr [ebp - 0x10], ecx
1009e681  8b4b68                         mov ecx, dword ptr [ebx + 0x68]
1009e684  99                             cdq 
1009e685  2bc2                           sub eax, edx
1009e687  c1e704                         shl edi, 4
1009e68a  d1f8                           sar eax, 1
1009e68c  83c704                         add edi, 4
1009e68f  8b8980000000                   mov ecx, dword ptr [ecx + 0x80]
1009e695  03c8                           add ecx, eax
1009e697  8bb64c080000                   mov esi, dword ptr [esi + 0x84c]
1009e69d  8b4308                         mov eax, dword ptr [ebx + 8]
1009e6a0  99                             cdq 
1009e6a1  f7ff                           idiv edi
1009e6a3  034b50                         add ecx, dword ptr [ebx + 0x50]
1009e6a6  8bf8                           mov edi, eax
1009e6a8  894df8                         mov dword ptr [ebp - 8], ecx
1009e6ab  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009e6ae  894df0                         mov dword ptr [ebp - 0x10], ecx
1009e6b1  397358                         cmp dword ptr [ebx + 0x58], esi
1009e6b4  7f08                           jg 0x1009e6be
1009e6b6  8bb380000000                   mov esi, dword ptr [ebx + 0x80]
1009e6bc  eb16                           jmp 0x1009e6d4
1009e6be  c1e603                         shl esi, 3
1009e6c1  8bc1                           mov eax, ecx
1009e6c3  8945f0                         mov dword ptr [ebp - 0x10], eax
1009e6c6  8975fc                         mov dword ptr [ebp - 4], esi
1009e6c9  397358                         cmp dword ptr [ebx + 0x58], esi
1009e6cc  7f09                           jg 0x1009e6d7
1009e6ce  8b7358                         mov esi, dword ptr [ebx + 0x58]
1009e6d1  8945f0                         mov dword ptr [ebp - 0x10], eax
1009e6d4  8975fc                         mov dword ptr [ebp - 4], esi
1009e6d7  6a64                           push 0x64
1009e6d9  6a0a                           push 0xa
1009e6db  56                             push esi
1009e6dc  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009e6e2  8bc8                           mov ecx, eax
1009e6e4  8bc6                           mov eax, esi
1009e6e6  99                             cdq 
1009e6e7  2bc2                           sub eax, edx
1009e6e9  d1f8                           sar eax, 1
1009e6eb  2bf8                           sub edi, eax
1009e6ed  037df8                         add edi, dword ptr [ebp - 8]
1009e6f0  2bf9                           sub edi, ecx
1009e6f2  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009e6f5  897df0                         mov dword ptr [ebp - 0x10], edi
1009e6f8  e8e3c9ffff                     call 0x1009b0e0
1009e6fd  85c0                           test eax, eax
1009e6ff  7409                           je 0x1009e70a
1009e701  c745f800000000                 mov dword ptr [ebp - 8], 0
1009e708  eb0e                           jmp 0x1009e718
1009e70a  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
1009e710  99                             cdq 
1009e711  2bc2                           sub eax, edx
1009e713  d1f8                           sar eax, 1
1009e715  8945f8                         mov dword ptr [ebp - 8], eax
1009e718  8b4b68                         mov ecx, dword ptr [ebx + 0x68]
1009e71b  ff75fc                         push dword ptr [ebp - 4]
1009e71e  8b7b54                         mov edi, dword ptr [ebx + 0x54]
1009e721  8b717c                         mov esi, dword ptr [ecx + 0x7c]
1009e724  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009e727  ffb148080000                   push dword ptr [ecx + 0x848]
1009e72d  e89e5dfeff                     call 0x100844d0
1009e732  2b7df8                         sub edi, dword ptr [ebp - 8]
1009e735  6864e00000                     push 0xe064
1009e73a  03fe                           add edi, esi
1009e73c  8b75f4                         mov esi, dword ptr [ebp - 0xc]
1009e73f  57                             push edi
1009e740  ff75f0                         push dword ptr [ebp - 0x10]
1009e743  8bce                           mov ecx, esi
1009e745  e8e661feff                     call 0x10084930
1009e74a  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009e751  8d8658080000                   lea eax, [esi + 0x858]
1009e757  7202                           jb 0x1009e75b
1009e759  8b00                           mov eax, dword ptr [eax]
1009e75b  50                             push eax
1009e75c  ff7308                         push dword ptr [ebx + 8]
1009e75f  8bce                           mov ecx, esi
1009e761  e8fa5dfeff                     call 0x10084560
1009e766  5f                             pop edi
1009e767  5e                             pop esi
1009e768  5b                             pop ebx
1009e769  8be5                           mov esp, ebp
1009e76b  5d                             pop ebp
1009e76c  c20400                         ret 4
1009e76f  cc                             int3 
