; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009e0d0 <= VA < 0x1009e240 (next decompiler entry; may include padding/thunks)
1009e0d0  55                             push ebp
1009e0d1  8bec                           mov ebp, esp
1009e0d3  83ec14                         sub esp, 0x14
1009e0d6  53                             push ebx
1009e0d7  8bd9                           mov ebx, ecx
1009e0d9  56                             push esi
1009e0da  57                             push edi
1009e0db  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009e0de  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
1009e0e4  8b4864                         mov ecx, dword ptr [eax + 0x64]
1009e0e7  8379046f                       cmp dword ptr [ecx + 4], 0x6f
1009e0eb  7523                           jne 0x1009e110
1009e0ed  b800200000                     mov eax, 0x2000
1009e0f2  6603819c000000                 add ax, word ptr [ecx + 0x9c]
1009e0f9  6683f819                       cmp ax, 0x19
1009e0fd  7711                           ja 0x1009e110
1009e0ff  8b4174                         mov eax, dword ptr [ecx + 0x74]
1009e102  6683600e01                     and word ptr [eax + 0xe], 1
1009e107  7407                           je 0x1009e110
1009e109  bf01000000                     mov edi, 1
1009e10e  eb02                           jmp 0x1009e112
1009e110  33ff                           xor edi, edi
1009e112  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009e115  8975f4                         mov dword ptr [ebp - 0xc], esi
1009e118  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009e11f  8d8e58080000                   lea ecx, [esi + 0x858]
1009e125  7206                           jb 0x1009e12d
1009e127  8b8e58080000                   mov ecx, dword ptr [esi + 0x858]
1009e12d  51                             push ecx
1009e12e  ff7308                         push dword ptr [ebx + 8]
1009e131  8bce                           mov ecx, esi
1009e133  e82864feff                     call 0x10084560
1009e138  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009e13b  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009e13e  894df0                         mov dword ptr [ebp - 0x10], ecx
1009e141  8b4b68                         mov ecx, dword ptr [ebx + 0x68]
1009e144  99                             cdq 
1009e145  2bc2                           sub eax, edx
1009e147  8bb64c080000                   mov esi, dword ptr [esi + 0x84c]
1009e14d  d1f8                           sar eax, 1
1009e14f  8b8980000000                   mov ecx, dword ptr [ecx + 0x80]
1009e155  03c8                           add ecx, eax
1009e157  b807000000                     mov eax, 7
1009e15c  034b50                         add ecx, dword ptr [ebx + 0x50]
1009e15f  85ff                           test edi, edi
1009e161  894df8                         mov dword ptr [ebp - 8], ecx
1009e164  b914000000                     mov ecx, 0x14
1009e169  0f45c8                         cmovne ecx, eax
1009e16c  8b4308                         mov eax, dword ptr [ebx + 8]
1009e16f  99                             cdq 
1009e170  f7f9                           idiv ecx
1009e172  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009e175  8bf8                           mov edi, eax
1009e177  894df0                         mov dword ptr [ebp - 0x10], ecx
1009e17a  397358                         cmp dword ptr [ebx + 0x58], esi
1009e17d  7f08                           jg 0x1009e187
1009e17f  8bb380000000                   mov esi, dword ptr [ebx + 0x80]
1009e185  eb16                           jmp 0x1009e19d
1009e187  c1e603                         shl esi, 3
1009e18a  8bc1                           mov eax, ecx
1009e18c  8945f0                         mov dword ptr [ebp - 0x10], eax
1009e18f  8975fc                         mov dword ptr [ebp - 4], esi
1009e192  397358                         cmp dword ptr [ebx + 0x58], esi
1009e195  7f09                           jg 0x1009e1a0
1009e197  8b7358                         mov esi, dword ptr [ebx + 0x58]
1009e19a  8945f0                         mov dword ptr [ebp - 0x10], eax
1009e19d  8975fc                         mov dword ptr [ebp - 4], esi
1009e1a0  6a64                           push 0x64
1009e1a2  6a0a                           push 0xa
1009e1a4  56                             push esi
1009e1a5  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009e1ab  8bc8                           mov ecx, eax
1009e1ad  8bc6                           mov eax, esi
1009e1af  99                             cdq 
1009e1b0  2bc2                           sub eax, edx
1009e1b2  d1f8                           sar eax, 1
1009e1b4  2bf8                           sub edi, eax
1009e1b6  037df8                         add edi, dword ptr [ebp - 8]
1009e1b9  2bf9                           sub edi, ecx
1009e1bb  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009e1be  897df0                         mov dword ptr [ebp - 0x10], edi
1009e1c1  e81acfffff                     call 0x1009b0e0
1009e1c6  85c0                           test eax, eax
1009e1c8  7409                           je 0x1009e1d3
1009e1ca  c745f800000000                 mov dword ptr [ebp - 8], 0
1009e1d1  eb0e                           jmp 0x1009e1e1
1009e1d3  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
1009e1d9  99                             cdq 
1009e1da  2bc2                           sub eax, edx
1009e1dc  d1f8                           sar eax, 1
1009e1de  8945f8                         mov dword ptr [ebp - 8], eax
1009e1e1  8b4b68                         mov ecx, dword ptr [ebx + 0x68]
1009e1e4  ff75fc                         push dword ptr [ebp - 4]
1009e1e7  8b7b54                         mov edi, dword ptr [ebx + 0x54]
1009e1ea  8b717c                         mov esi, dword ptr [ecx + 0x7c]
1009e1ed  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009e1f0  ffb148080000                   push dword ptr [ecx + 0x848]
1009e1f6  e8d562feff                     call 0x100844d0
1009e1fb  2b7df8                         sub edi, dword ptr [ebp - 8]
1009e1fe  6863e00000                     push 0xe063
1009e203  03fe                           add edi, esi
1009e205  8b75f4                         mov esi, dword ptr [ebp - 0xc]
1009e208  57                             push edi
1009e209  ff75f0                         push dword ptr [ebp - 0x10]
1009e20c  8bce                           mov ecx, esi
1009e20e  e81d67feff                     call 0x10084930
1009e213  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009e21a  8d8658080000                   lea eax, [esi + 0x858]
1009e220  7202                           jb 0x1009e224
1009e222  8b00                           mov eax, dword ptr [eax]
1009e224  50                             push eax
1009e225  ff7308                         push dword ptr [ebx + 8]
1009e228  8bce                           mov ecx, esi
1009e22a  e83163feff                     call 0x10084560
1009e22f  5f                             pop edi
1009e230  5e                             pop esi
1009e231  5b                             pop ebx
1009e232  8be5                           mov esp, ebp
1009e234  5d                             pop ebp
1009e235  c20400                         ret 4
1009e238  cc                             int3 
1009e239  cc                             int3 
1009e23a  cc                             int3 
1009e23b  cc                             int3 
1009e23c  cc                             int3 
1009e23d  cc                             int3 
1009e23e  cc                             int3 
1009e23f  cc                             int3 
