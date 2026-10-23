; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009f0a0 <= VA < 0x1009f210 (next decompiler entry; may include padding/thunks)
1009f0a0  55                             push ebp
1009f0a1  8bec                           mov ebp, esp
1009f0a3  83ec14                         sub esp, 0x14
1009f0a6  53                             push ebx
1009f0a7  8bd9                           mov ebx, ecx
1009f0a9  56                             push esi
1009f0aa  57                             push edi
1009f0ab  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009f0ae  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
1009f0b4  8b4864                         mov ecx, dword ptr [eax + 0x64]
1009f0b7  8379046f                       cmp dword ptr [ecx + 4], 0x6f
1009f0bb  7520                           jne 0x1009f0dd
1009f0bd  b800200000                     mov eax, 0x2000
1009f0c2  6603819c000000                 add ax, word ptr [ecx + 0x9c]
1009f0c9  6683f819                       cmp ax, 0x19
1009f0cd  770e                           ja 0x1009f0dd
1009f0cf  8b4174                         mov eax, dword ptr [ecx + 0x74]
1009f0d2  6683600e01                     and word ptr [eax + 0xe], 1
1009f0d7  7404                           je 0x1009f0dd
1009f0d9  33ff                           xor edi, edi
1009f0db  eb05                           jmp 0x1009f0e2
1009f0dd  bf01000000                     mov edi, 1
1009f0e2  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009f0e5  8975f4                         mov dword ptr [ebp - 0xc], esi
1009f0e8  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009f0ef  8d8e58080000                   lea ecx, [esi + 0x858]
1009f0f5  7206                           jb 0x1009f0fd
1009f0f7  8b8e58080000                   mov ecx, dword ptr [esi + 0x858]
1009f0fd  51                             push ecx
1009f0fe  ff7308                         push dword ptr [ebx + 8]
1009f101  8bce                           mov ecx, esi
1009f103  e85854feff                     call 0x10084560
1009f108  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009f10b  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009f10e  894df0                         mov dword ptr [ebp - 0x10], ecx
1009f111  8b4b68                         mov ecx, dword ptr [ebx + 0x68]
1009f114  99                             cdq 
1009f115  2bc2                           sub eax, edx
1009f117  c1e704                         shl edi, 4
1009f11a  d1f8                           sar eax, 1
1009f11c  83c704                         add edi, 4
1009f11f  8b8980000000                   mov ecx, dword ptr [ecx + 0x80]
1009f125  03c8                           add ecx, eax
1009f127  8b4308                         mov eax, dword ptr [ebx + 8]
1009f12a  99                             cdq 
1009f12b  f7ff                           idiv edi
1009f12d  034b50                         add ecx, dword ptr [ebx + 0x50]
1009f130  894df8                         mov dword ptr [ebp - 8], ecx
1009f133  8bf8                           mov edi, eax
1009f135  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009f138  894df0                         mov dword ptr [ebp - 0x10], ecx
1009f13b  8b8e4c080000                   mov ecx, dword ptr [esi + 0x84c]
1009f141  394b58                         cmp dword ptr [ebx + 0x58], ecx
1009f144  7f08                           jg 0x1009f14e
1009f146  8bb380000000                   mov esi, dword ptr [ebx + 0x80]
1009f14c  eb19                           jmp 0x1009f167
1009f14e  8b435c                         mov eax, dword ptr [ebx + 0x5c]
1009f151  8d3449                         lea esi, [ecx + ecx*2]
1009f154  03f6                           add esi, esi
1009f156  8945f0                         mov dword ptr [ebp - 0x10], eax
1009f159  8975fc                         mov dword ptr [ebp - 4], esi
1009f15c  397358                         cmp dword ptr [ebx + 0x58], esi
1009f15f  7f09                           jg 0x1009f16a
1009f161  8b7358                         mov esi, dword ptr [ebx + 0x58]
1009f164  8945f0                         mov dword ptr [ebp - 0x10], eax
1009f167  8975fc                         mov dword ptr [ebp - 4], esi
1009f16a  6a64                           push 0x64
1009f16c  6a14                           push 0x14
1009f16e  56                             push esi
1009f16f  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009f175  8bc8                           mov ecx, eax
1009f177  8bc6                           mov eax, esi
1009f179  99                             cdq 
1009f17a  2bc2                           sub eax, edx
1009f17c  d1f8                           sar eax, 1
1009f17e  2bf8                           sub edi, eax
1009f180  037df8                         add edi, dword ptr [ebp - 8]
1009f183  2bf9                           sub edi, ecx
1009f185  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009f188  897df0                         mov dword ptr [ebp - 0x10], edi
1009f18b  e850bfffff                     call 0x1009b0e0
1009f190  85c0                           test eax, eax
1009f192  7409                           je 0x1009f19d
1009f194  c745f800000000                 mov dword ptr [ebp - 8], 0
1009f19b  eb0e                           jmp 0x1009f1ab
1009f19d  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
1009f1a3  99                             cdq 
1009f1a4  2bc2                           sub eax, edx
1009f1a6  d1f8                           sar eax, 1
1009f1a8  8945f8                         mov dword ptr [ebp - 8], eax
1009f1ab  8b4b68                         mov ecx, dword ptr [ebx + 0x68]
1009f1ae  ff75fc                         push dword ptr [ebp - 4]
1009f1b1  8b7b54                         mov edi, dword ptr [ebx + 0x54]
1009f1b4  8b717c                         mov esi, dword ptr [ecx + 0x7c]
1009f1b7  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009f1ba  ffb148080000                   push dword ptr [ecx + 0x848]
1009f1c0  e80b53feff                     call 0x100844d0
1009f1c5  2b7df8                         sub edi, dword ptr [ebp - 8]
1009f1c8  6866e00000                     push 0xe066
1009f1cd  03fe                           add edi, esi
1009f1cf  8b75f4                         mov esi, dword ptr [ebp - 0xc]
1009f1d2  57                             push edi
1009f1d3  ff75f0                         push dword ptr [ebp - 0x10]
1009f1d6  8bce                           mov ecx, esi
1009f1d8  e85357feff                     call 0x10084930
1009f1dd  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009f1e4  8d8658080000                   lea eax, [esi + 0x858]
1009f1ea  7202                           jb 0x1009f1ee
1009f1ec  8b00                           mov eax, dword ptr [eax]
1009f1ee  50                             push eax
1009f1ef  ff7308                         push dword ptr [ebx + 8]
1009f1f2  8bce                           mov ecx, esi
1009f1f4  e86753feff                     call 0x10084560
1009f1f9  5f                             pop edi
1009f1fa  5e                             pop esi
1009f1fb  5b                             pop ebx
1009f1fc  8be5                           mov esp, ebp
1009f1fe  5d                             pop ebp
1009f1ff  c20400                         ret 4
1009f202  cc                             int3 
1009f203  cc                             int3 
1009f204  cc                             int3 
1009f205  cc                             int3 
1009f206  cc                             int3 
1009f207  cc                             int3 
1009f208  cc                             int3 
1009f209  cc                             int3 
1009f20a  cc                             int3 
1009f20b  cc                             int3 
1009f20c  cc                             int3 
1009f20d  cc                             int3 
1009f20e  cc                             int3 
1009f20f  cc                             int3 
