; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100923e0 <= VA < 0x10092630 (next decompiler entry; may include padding/thunks)
100923e0  55                             push ebp
100923e1  8bec                           mov ebp, esp
100923e3  6aff                           push -1
100923e5  68a9c80a10                     push 0x100ac8a9
100923ea  64a100000000                   mov eax, dword ptr fs:[0]
100923f0  50                             push eax
100923f1  83ec48                         sub esp, 0x48
100923f4  a10c100d10                     mov eax, dword ptr [0x100d100c]
100923f9  33c5                           xor eax, ebp
100923fb  8945f0                         mov dword ptr [ebp - 0x10], eax
100923fe  53                             push ebx
100923ff  56                             push esi
10092400  57                             push edi
10092401  50                             push eax
10092402  8d45f4                         lea eax, [ebp - 0xc]
10092405  64a300000000                   mov dword ptr fs:[0], eax
1009240b  8bf1                           mov esi, ecx
1009240d  8b16                           mov edx, dword ptr [esi]
1009240f  8b7d08                         mov edi, dword ptr [ebp + 8]
10092412  897db4                         mov dword ptr [ebp - 0x4c], edi
10092415  8b4210                         mov eax, dword ptr [edx + 0x10]
10092418  81fa90f80b10                   cmp edx, 0x100bf890
1009241e  0f85e0010000                   jne 0x10092604
10092424  8b4668                         mov eax, dword ptr [esi + 0x68]
10092427  8b9880000000                   mov ebx, dword ptr [eax + 0x80]
1009242d  035e50                         add ebx, dword ptr [esi + 0x50]
10092430  81fa90f80b10                   cmp edx, 0x100bf890
10092436  0f85d1010000                   jne 0x1009260d
1009243c  8b4668                         mov eax, dword ptr [esi + 0x68]
1009243f  8b5678                         mov edx, dword ptr [esi + 0x78]
10092442  8b487c                         mov ecx, dword ptr [eax + 0x7c]
10092445  894db0                         mov dword ptr [ebp - 0x50], ecx
10092448  8b4254                         mov eax, dword ptr [edx + 0x54]
1009244b  03c1                           add eax, ecx
1009244d  837e0436                       cmp dword ptr [esi + 4], 0x36
10092451  8945b8                         mov dword ptr [ebp - 0x48], eax
10092454  7d6a                           jge 0x100924c0
10092456  8b8688000000                   mov eax, dword ptr [esi + 0x88]
1009245c  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
1009245f  89580c                         mov dword ptr [eax + 0xc], ebx
10092462  894808                         mov dword ptr [eax + 8], ecx
10092465  8b8e88000000                   mov ecx, dword ptr [esi + 0x88]
1009246b  e8c0f30000                     call 0x100a1830
10092470  8b8e88000000                   mov ecx, dword ptr [esi + 0x88]
10092476  8b4104                         mov eax, dword ptr [ecx + 4]
10092479  83f813                         cmp eax, 0x13
1009247c  740f                           je 0x1009248d
1009247e  83f804                         cmp eax, 4
10092481  740a                           je 0x1009248d
10092483  83f80c                         cmp eax, 0xc
10092486  7405                           je 0x1009248d
10092488  8b4944                         mov ecx, dword ptr [ecx + 0x44]
1009248b  eb14                           jmp 0x100924a1
1009248d  8b4110                         mov eax, dword ptr [ecx + 0x10]
10092490  8b4944                         mov ecx, dword ptr [ecx + 0x44]
10092493  99                             cdq 
10092494  83e203                         and edx, 3
10092497  03c2                           add eax, edx
10092499  c1f802                         sar eax, 2
1009249c  3bc8                           cmp ecx, eax
1009249e  0f4ec8                         cmovle ecx, eax
100924a1  8b4678                         mov eax, dword ptr [esi + 0x78]
100924a4  03cb                           add ecx, ebx
100924a6  57                             push edi
100924a7  898880000000                   mov dword ptr [eax + 0x80], ecx
100924ad  8b4678                         mov eax, dword ptr [esi + 0x78]
100924b0  8b4db0                         mov ecx, dword ptr [ebp - 0x50]
100924b3  89487c                         mov dword ptr [eax + 0x7c], ecx
100924b6  8b4e78                         mov ecx, dword ptr [esi + 0x78]
100924b9  8b01                           mov eax, dword ptr [ecx]
100924bb  ff5004                         call dword ptr [eax + 4]
100924be  eb3d                           jmp 0x100924fd
100924c0  899a80000000                   mov dword ptr [edx + 0x80], ebx
100924c6  8b4678                         mov eax, dword ptr [esi + 0x78]
100924c9  57                             push edi
100924ca  89487c                         mov dword ptr [eax + 0x7c], ecx
100924cd  8b4e78                         mov ecx, dword ptr [esi + 0x78]
100924d0  8b01                           mov eax, dword ptr [ecx]
100924d2  ff5004                         call dword ptr [eax + 4]
100924d5  8b4678                         mov eax, dword ptr [esi + 0x78]
100924d8  8b4858                         mov ecx, dword ptr [eax + 0x58]
100924db  8b405c                         mov eax, dword ptr [eax + 0x5c]
100924de  03cb                           add ecx, ebx
100924e0  8945b0                         mov dword ptr [ebp - 0x50], eax
100924e3  8b8688000000                   mov eax, dword ptr [esi + 0x88]
100924e9  89480c                         mov dword ptr [eax + 0xc], ecx
100924ec  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
100924ef  894808                         mov dword ptr [eax + 8], ecx
100924f2  8b8e88000000                   mov ecx, dword ptr [esi + 0x88]
100924f8  e833f30000                     call 0x100a1830
100924fd  8b7e74                         mov edi, dword ptr [esi + 0x74]
10092500  83bf6c08000008                 cmp dword ptr [edi + 0x86c], 8
10092507  8d8758080000                   lea eax, [edi + 0x858]
1009250d  7202                           jb 0x10092511
1009250f  8b00                           mov eax, dword ptr [eax]
10092511  50                             push eax
10092512  ff7608                         push dword ptr [esi + 8]
10092515  8bcf                           mov ecx, edi
10092517  e84420ffff                     call 0x10084560
1009251c  3975b4                         cmp dword ptr [ebp - 0x4c], esi
1009251f  0f85a7000000                   jne 0x100925cc
10092525  8b06                           mov eax, dword ptr [esi]
10092527  8b5010                         mov edx, dword ptr [eax + 0x10]
1009252a  3d90f80b10                     cmp eax, 0x100bf890
1009252f  0f85e2000000                   jne 0x10092617
10092535  8b4668                         mov eax, dword ptr [esi + 0x68]
10092538  8b407c                         mov eax, dword ptr [eax + 0x7c]
1009253b  8b5658                         mov edx, dword ptr [esi + 0x58]
1009253e  034654                         add eax, dword ptr [esi + 0x54]
10092541  83bf8008000001                 cmp dword ptr [edi + 0x880], 1
10092548  8955b8                         mov dword ptr [ebp - 0x48], edx
1009254b  8b565c                         mov edx, dword ptr [esi + 0x5c]
1009254e  8955b0                         mov dword ptr [ebp - 0x50], edx
10092551  8945b4                         mov dword ptr [ebp - 0x4c], eax
10092554  7476                           je 0x100925cc
10092556  833f00                         cmp dword ptr [edi], 0
10092559  7471                           je 0x100925cc
1009255b  8d4dbc                         lea ecx, [ebp - 0x44]
1009255e  ff15f0fe0d10                   call dword ptr [0x100dfef0]
10092564  6a01                           push 1
10092566  8d4dbc                         lea ecx, [ebp - 0x44]
10092569  c745fc00000000                 mov dword ptr [ebp - 4], 0
10092570  ff1550ff0d10                   call dword ptr [0x100dff50]
10092576  6a01                           push 1
10092578  8d4dbc                         lea ecx, [ebp - 0x44]
1009257b  ff1514fe0d10                   call dword ptr [0x100dfe14]
10092581  68ff000000                     push 0xff
10092586  8d4dbc                         lea ecx, [ebp - 0x44]
10092589  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009258f  8b0f                           mov ecx, dword ptr [edi]
10092591  8d45bc                         lea eax, [ebp - 0x44]
10092594  50                             push eax
10092595  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009259b  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009259e  8d4dbc                         lea ecx, [ebp - 0x44]
100925a1  898774080000                   mov dword ptr [edi + 0x874], eax
100925a7  8b45b0                         mov eax, dword ptr [ebp - 0x50]
100925aa  89877c080000                   mov dword ptr [edi + 0x87c], eax
100925b0  8b45b8                         mov eax, dword ptr [ebp - 0x48]
100925b3  899f70080000                   mov dword ptr [edi + 0x870], ebx
100925b9  898778080000                   mov dword ptr [edi + 0x878], eax
100925bf  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
100925c6  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
100925cc  8b06                           mov eax, dword ptr [esi]
100925ce  3d90f80b10                     cmp eax, 0x100bf890
100925d3  754b                           jne 0x10092620
100925d5  8b4668                         mov eax, dword ptr [esi + 0x68]
100925d8  8b487c                         mov ecx, dword ptr [eax + 0x7c]
100925db  8b4654                         mov eax, dword ptr [esi + 0x54]
100925de  03c1                           add eax, ecx
100925e0  895e48                         mov dword ptr [esi + 0x48], ebx
100925e3  89464c                         mov dword ptr [esi + 0x4c], eax
100925e6  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
100925e9  64890d00000000                 mov dword ptr fs:[0], ecx
100925f0  59                             pop ecx
100925f1  5f                             pop edi
100925f2  5e                             pop esi
100925f3  5b                             pop ebx
100925f4  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
100925f7  33cd                           xor ecx, ebp
100925f9  e859030100                     call 0x100a2957
100925fe  8be5                           mov esp, ebp
10092600  5d                             pop ebp
10092601  c20400                         ret 4
10092604  ffd0                           call eax
10092606  8b16                           mov edx, dword ptr [esi]
10092608  e91afeffff                     jmp 0x10092427
1009260d  8bce                           mov ecx, esi
1009260f  ff5210                         call dword ptr [edx + 0x10]
10092612  e928feffff                     jmp 0x1009243f
10092617  8bce                           mov ecx, esi
10092619  ffd2                           call edx
1009261b  e918ffffff                     jmp 0x10092538
10092620  8bce                           mov ecx, esi
10092622  ff5010                         call dword ptr [eax + 0x10]
10092625  ebb1                           jmp 0x100925d8
10092627  cc                             int3 
10092628  cc                             int3 
10092629  cc                             int3 
1009262a  cc                             int3 
1009262b  cc                             int3 
1009262c  cc                             int3 
1009262d  cc                             int3 
1009262e  cc                             int3 
1009262f  cc                             int3 
