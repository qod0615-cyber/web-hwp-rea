; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10084770 <= VA < 0x10084820 (next decompiler entry; may include padding/thunks)
10084770  55                             push ebp
10084771  8bec                           mov ebp, esp
10084773  51                             push ecx
10084774  53                             push ebx
10084775  8b5d0c                         mov ebx, dword ptr [ebp + 0xc]
10084778  56                             push esi
10084779  8b3530e60a10                   mov esi, dword ptr [0x100ae630]
1008477f  57                             push edi
10084780  8b7d08                         mov edi, dword ptr [ebp + 8]
10084783  6aff                           push -1
10084785  53                             push ebx
10084786  6a40                           push 0x40
10084788  8d4724                         lea eax, [edi + 0x24]
1008478b  894dfc                         mov dword ptr [ebp - 4], ecx
1008478e  50                             push eax
1008478f  ffd6                           call esi
10084791  6aff                           push -1
10084793  53                             push ebx
10084794  8d87b8000000                   lea eax, [edi + 0xb8]
1008479a  6a40                           push 0x40
1008479c  50                             push eax
1008479d  ffd6                           call esi
1008479f  6aff                           push -1
100847a1  53                             push ebx
100847a2  8d874c010000                   lea eax, [edi + 0x14c]
100847a8  6a40                           push 0x40
100847aa  50                             push eax
100847ab  ffd6                           call esi
100847ad  6aff                           push -1
100847af  53                             push ebx
100847b0  8d87e0010000                   lea eax, [edi + 0x1e0]
100847b6  6a40                           push 0x40
100847b8  50                             push eax
100847b9  ffd6                           call esi
100847bb  83c440                         add esp, 0x40
100847be  8d8774020000                   lea eax, [edi + 0x274]
100847c4  6aff                           push -1
100847c6  53                             push ebx
100847c7  6a40                           push 0x40
100847c9  50                             push eax
100847ca  ffd6                           call esi
100847cc  6aff                           push -1
100847ce  53                             push ebx
100847cf  8d8708030000                   lea eax, [edi + 0x308]
100847d5  6a40                           push 0x40
100847d7  50                             push eax
100847d8  ffd6                           call esi
100847da  6aff                           push -1
100847dc  53                             push ebx
100847dd  8d879c030000                   lea eax, [edi + 0x39c]
100847e3  6a40                           push 0x40
100847e5  50                             push eax
100847e6  ffd6                           call esi
100847e8  8bc3                           mov eax, ebx
100847ea  83c430                         add esp, 0x30
100847ed  8d5002                         lea edx, [eax + 2]
100847f0  668b08                         mov cx, word ptr [eax]
100847f3  83c002                         add eax, 2
100847f6  6685c9                         test cx, cx
100847f9  75f5                           jne 0x100847f0
100847fb  8b4dfc                         mov ecx, dword ptr [ebp - 4]
100847fe  2bc2                           sub eax, edx
10084800  d1f8                           sar eax, 1
10084802  81c158080000                   add ecx, 0x858
10084808  50                             push eax
10084809  53                             push ebx
1008480a  e8c112f8ff                     call 0x10005ad0
1008480f  5f                             pop edi
10084810  5e                             pop esi
10084811  5b                             pop ebx
10084812  8be5                           mov esp, ebp
10084814  5d                             pop ebp
10084815  c20800                         ret 8
10084818  cc                             int3 
10084819  cc                             int3 
1008481a  cc                             int3 
1008481b  cc                             int3 
1008481c  cc                             int3 
1008481d  cc                             int3 
1008481e  cc                             int3 
1008481f  cc                             int3 
