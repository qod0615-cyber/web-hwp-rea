; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100057c0 <= VA < 0x10005a40 (next decompiler entry; may include padding/thunks)
100057c0  55                             push ebp
100057c1  8bec                           mov ebp, esp
100057c3  83e4f8                         and esp, 0xfffffff8
100057c6  b8ec1f0000                     mov eax, 0x1fec
100057cb  e850060a00                     call 0x100a5e20
100057d0  a10c100d10                     mov eax, dword ptr [0x100d100c]
100057d5  33c4                           xor eax, esp
100057d7  898424e81f0000                 mov dword ptr [esp + 0x1fe8], eax
100057de  8b4514                         mov eax, dword ptr [ebp + 0x14]
100057e1  53                             push ebx
100057e2  8b5d0c                         mov ebx, dword ptr [ebp + 0xc]
100057e5  56                             push esi
100057e6  57                             push edi
100057e7  8b7d10                         mov edi, dword ptr [ebp + 0x10]
100057ea  6a00                           push 0
100057ec  897c2428                       mov dword ptr [esp + 0x28], edi
100057f0  89442414                       mov dword ptr [esp + 0x14], eax
100057f4  ff1530e40a10                   call dword ptr [0x100ae430]
100057fa  8b3574e00a10                   mov esi, dword ptr [0x100ae074]
10005800  50                             push eax
10005801  8944241c                       mov dword ptr [esp + 0x1c], eax
10005805  ffd6                           call esi
10005807  ff742418                       push dword ptr [esp + 0x18]
1000580b  8944242c                       mov dword ptr [esp + 0x2c], eax
1000580f  ffd6                           call esi
10005811  8b742410                       mov esi, dword ptr [esp + 0x10]
10005815  83c7fe                         add edi, -2
10005818  83c6fe                         add esi, -2
1000581b  89442414                       mov dword ptr [esp + 0x14], eax
1000581f  56                             push esi
10005820  57                             push edi
10005821  ff742420                       push dword ptr [esp + 0x20]
10005825  ff156ce00a10                   call dword ptr [0x100ae06c]
1000582b  50                             push eax
1000582c  ff742418                       push dword ptr [esp + 0x18]
10005830  89442434                       mov dword ptr [esp + 0x34], eax
10005834  ff155ce00a10                   call dword ptr [0x100ae05c]
1000583a  68ffffff00                     push 0xffffff
1000583f  56                             push esi
10005840  57                             push edi
10005841  6a00                           push 0
10005843  6a00                           push 0
10005845  ff742428                       push dword ptr [esp + 0x28]
10005849  ff15f4fe0d10                   call dword ptr [0x100dfef4]
1000584f  83c414                         add esp, 0x14
10005852  8d4c2434                       lea ecx, [esp + 0x34]
10005856  e885fa0700                     call 0x100852e0
1000585b  8d4c241c                       lea ecx, [esp + 0x1c]
1000585f  ff1590e00a10                   call dword ptr [0x100ae090]
10005865  8d4c241c                       lea ecx, [esp + 0x1c]
10005869  ff1534e10a10                   call dword ptr [0x100ae134]
1000586f  689f0f0000                     push 0xf9f
10005874  53                             push ebx
10005875  8d8424b8000000                 lea eax, [esp + 0xb8]
1000587c  68a00f0000                     push 0xfa0
10005881  50                             push eax
10005882  ff1530e60a10                   call dword ptr [0x100ae630]
10005888  83c410                         add esp, 0x10
1000588b  8db424b0000000                 lea esi, [esp + 0xb0]
10005892  33c0                           xor eax, eax
10005894  8d4e02                         lea ecx, [esi + 2]
10005897  66898424ee1f0000               mov word ptr [esp + 0x1fee], ax
1000589f  90                             nop 
100058a0  668b06                         mov ax, word ptr [esi]
100058a3  83c602                         add esi, 2
100058a6  6685c0                         test ax, ax
100058a9  75f5                           jne 0x100058a0
100058ab  2bf1                           sub esi, ecx
100058ad  33ff                           xor edi, edi
100058af  d1fe                           sar esi, 1
100058b1  85f6                           test esi, esi
100058b3  7e32                           jle 0x100058e7
100058b5  8b1d38e10a10                   mov ebx, dword ptr [0x100ae138]
100058bb  b926200000                     mov ecx, 0x2026
100058c0  0fb7847cb0000000               movzx eax, word ptr [esp + edi*2 + 0xb0]
100058c8  663bc1                         cmp ax, cx
100058cb  0f8593000000                   jne 0x10005964
100058d1  b8ef220000                     mov eax, 0x22ef
100058d6  50                             push eax
100058d7  8d4c2420                       lea ecx, [esp + 0x20]
100058db  ffd3                           call ebx
100058dd  47                             inc edi
100058de  b926200000                     mov ecx, 0x2026
100058e3  3bfe                           cmp edi, esi
100058e5  7cd9                           jl 0x100058c0
100058e7  56                             push esi
100058e8  ff742420                       push dword ptr [esp + 0x20]
100058ec  8d4c2438                       lea ecx, [esp + 0x38]
100058f0  e86b1c0800                     call 0x10087560
100058f5  8d4c241c                       lea ecx, [esp + 0x1c]
100058f9  ff1554e20a10                   call dword ptr [0x100ae254]
100058ff  8b742414                       mov esi, dword ptr [esp + 0x14]
10005903  8d4c2430                       lea ecx, [esp + 0x30]
10005907  56                             push esi
10005908  e803fc0700                     call 0x10085510
1000590d  8b4c2440                       mov ecx, dword ptr [esp + 0x40]
10005911  85c9                           test ecx, ecx
10005913  740e                           je 0x10005923
10005915  c7818008000001000000           mov dword ptr [ecx + 0x880], 1
1000591f  8b4c2440                       mov ecx, dword ptr [esp + 0x40]
10005923  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
1000592a  8d8158080000                   lea eax, [ecx + 0x858]
10005930  7202                           jb 0x10005934
10005932  8b00                           mov eax, dword ptr [eax]
10005934  50                             push eax
10005935  6a11                           push 0x11
10005937  e824ec0700                     call 0x10084560
1000593c  83bc248800000011               cmp dword ptr [esp + 0x88], 0x11
10005944  8d54241c                       lea edx, [esp + 0x1c]
10005948  7433                           je 0x1000597d
1000594a  8b442460                       mov eax, dword ptr [esp + 0x60]
1000594e  c784248800000011000000         mov dword ptr [esp + 0x88], 0x11
10005959  6a00                           push 0
1000595b  c7400811000000                 mov dword ptr [eax + 8], 0x11
10005962  eb1b                           jmp 0x1000597f
10005964  83f820                         cmp eax, 0x20
10005967  0f8369ffffff                   jae 0x100058d6
1000596d  83f815                         cmp eax, 0x15
10005970  0f8460ffffff                   je 0x100058d6
10005976  6a20                           push 0x20
10005978  e95affffff                     jmp 0x100058d7
1000597d  6a01                           push 1
1000597f  8b4c2464                       mov ecx, dword ptr [esp + 0x64]
10005983  52                             push edx
10005984  8b01                           mov eax, dword ptr [ecx]
10005986  ff5008                         call dword ptr [eax + 8]
10005989  51                             push ecx
1000598a  6a02                           push 2
1000598c  6a02                           push 2
1000598e  8d4c243c                       lea ecx, [esp + 0x3c]
10005992  e819130800                     call 0x10086cb0
10005997  ff742410                       push dword ptr [esp + 0x10]
1000599b  ff742428                       push dword ptr [esp + 0x28]
1000599f  ff742420                       push dword ptr [esp + 0x20]
100059a3  ff156ce00a10                   call dword ptr [0x100ae06c]
100059a9  8b5c2428                       mov ebx, dword ptr [esp + 0x28]
100059ad  8bf8                           mov edi, eax
100059af  57                             push edi
100059b0  53                             push ebx
100059b1  ff155ce00a10                   call dword ptr [0x100ae05c]
100059b7  68ffffff00                     push 0xffffff
100059bc  ff742414                       push dword ptr [esp + 0x14]
100059c0  ff74242c                       push dword ptr [esp + 0x2c]
100059c4  6a00                           push 0
100059c6  6a00                           push 0
100059c8  53                             push ebx
100059c9  ff15f4fe0d10                   call dword ptr [0x100dfef4]
100059cf  83c418                         add esp, 0x18
100059d2  682000cc00                     push 0xcc0020
100059d7  6a00                           push 0
100059d9  6a00                           push 0
100059db  56                             push esi
100059dc  ff742420                       push dword ptr [esp + 0x20]
100059e0  ff742438                       push dword ptr [esp + 0x38]
100059e4  6a00                           push 0
100059e6  6a00                           push 0
100059e8  53                             push ebx
100059e9  ff1558e00a10                   call dword ptr [0x100ae058]
100059ef  ff74242c                       push dword ptr [esp + 0x2c]
100059f3  ff1554e00a10                   call dword ptr [0x100ae054]
100059f9  8b3550e00a10                   mov esi, dword ptr [0x100ae050]
100059ff  53                             push ebx
10005a00  ffd6                           call esi
10005a02  ff742414                       push dword ptr [esp + 0x14]
10005a06  ffd6                           call esi
10005a08  ff742418                       push dword ptr [esp + 0x18]
10005a0c  6a00                           push 0
10005a0e  ff152ce40a10                   call dword ptr [0x100ae42c]
10005a14  8d4c2430                       lea ecx, [esp + 0x30]
10005a18  e843fa0700                     call 0x10085460
10005a1d  8b8c24f41f0000                 mov ecx, dword ptr [esp + 0x1ff4]
10005a24  8bc7                           mov eax, edi
10005a26  5f                             pop edi
10005a27  5e                             pop esi
10005a28  5b                             pop ebx
10005a29  33cc                           xor ecx, esp
10005a2b  e827cf0900                     call 0x100a2957
10005a30  8be5                           mov esp, ebp
10005a32  5d                             pop ebp
10005a33  c21000                         ret 0x10
10005a36  cc                             int3 
10005a37  cc                             int3 
10005a38  cc                             int3 
10005a39  cc                             int3 
10005a3a  cc                             int3 
10005a3b  cc                             int3 
10005a3c  cc                             int3 
10005a3d  cc                             int3 
10005a3e  cc                             int3 
10005a3f  cc                             int3 
