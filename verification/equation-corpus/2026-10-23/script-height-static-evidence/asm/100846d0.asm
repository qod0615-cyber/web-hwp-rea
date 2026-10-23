; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100846d0 <= VA < 0x10084770 (next decompiler entry; may include padding/thunks)
100846d0  55                             push ebp
100846d1  8bec                           mov ebp, esp
100846d3  51                             push ecx
100846d4  53                             push ebx
100846d5  8b5d08                         mov ebx, dword ptr [ebp + 8]
100846d8  56                             push esi
100846d9  57                             push edi
100846da  6820040000                     push 0x420
100846df  6a00                           push 0
100846e1  53                             push ebx
100846e2  894dfc                         mov dword ptr [ebp - 4], ecx
100846e5  e864fa0100                     call 0x100a414e
100846ea  83c40c                         add esp, 0xc
100846ed  8d7314                         lea esi, [ebx + 0x14]
100846f0  bf07000000                     mov edi, 7
100846f5  6666660f1f840000000000         nop word ptr [eax + eax]
10084700  685c0d0b10                     push 0x100b0d5c
10084705  8d4610                         lea eax, [esi + 0x10]
10084708  c746fce8030000                 mov dword ptr [esi - 4], 0x3e8
1008470f  6a40                           push 0x40
10084711  50                             push eax
10084712  66c7060100                     mov word ptr [esi], 1
10084717  c74604f4010000                 mov dword ptr [esi + 4], 0x1f4
1008471e  c6460200                       mov byte ptr [esi + 2], 0
10084722  ff1554e60a10                   call dword ptr [0x100ae654]
10084728  83c40c                         add esp, 0xc
1008472b  8db694000000                   lea esi, [esi + 0x94]
10084731  83ef01                         sub edi, 1
10084734  75ca                           jne 0x10084700
10084736  8b45fc                         mov eax, dword ptr [ebp - 4]
10084739  5f                             pop edi
1008473a  5e                             pop esi
1008473b  c78048080000e8030000           mov dword ptr [eax + 0x848], 0x3e8
10084745  c7804c080000e8030000           mov dword ptr [eax + 0x84c], 0x3e8
1008474f  33c0                           xor eax, eax
10084751  6689430a                       mov word ptr [ebx + 0xa], ax
10084755  c70390010000                   mov dword ptr [ebx], 0x190
1008475b  5b                             pop ebx
1008475c  8be5                           mov esp, ebp
1008475e  5d                             pop ebp
1008475f  c20400                         ret 4
10084762  cc                             int3 
10084763  cc                             int3 
10084764  cc                             int3 
10084765  cc                             int3 
10084766  cc                             int3 
10084767  cc                             int3 
10084768  cc                             int3 
10084769  cc                             int3 
1008476a  cc                             int3 
1008476b  cc                             int3 
1008476c  cc                             int3 
1008476d  cc                             int3 
1008476e  cc                             int3 
1008476f  cc                             int3 
