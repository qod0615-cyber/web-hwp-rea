; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10095450 <= VA < 0x10095760 (next decompiler entry; may include padding/thunks)
10095450  55                             push ebp
10095451  8bec                           mov ebp, esp
10095453  6aff                           push -1
10095455  6819c80a10                     push 0x100ac819
1009545a  64a100000000                   mov eax, dword ptr fs:[0]
10095460  50                             push eax
10095461  83ec5c                         sub esp, 0x5c
10095464  a10c100d10                     mov eax, dword ptr [0x100d100c]
10095469  33c5                           xor eax, ebp
1009546b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009546e  53                             push ebx
1009546f  56                             push esi
10095470  57                             push edi
10095471  50                             push eax
10095472  8d45f4                         lea eax, [ebp - 0xc]
10095475  64a300000000                   mov dword ptr fs:[0], eax
1009547b  8bf9                           mov edi, ecx
1009547d  8b17                           mov edx, dword ptr [edi]
1009547f  8b4508                         mov eax, dword ptr [ebp + 8]
10095482  8945a0                         mov dword ptr [ebp - 0x60], eax
10095485  8b4210                         mov eax, dword ptr [edx + 0x10]
10095488  3dd0520810                     cmp eax, 0x100852d0
1009548d  0f85a5020000                   jne 0x10095738
10095493  8b4768                         mov eax, dword ptr [edi + 0x68]
10095496  8b9880000000                   mov ebx, dword ptr [eax + 0x80]
1009549c  035f50                         add ebx, dword ptr [edi + 0x50]
1009549f  8b4210                         mov eax, dword ptr [edx + 0x10]
100954a2  895db8                         mov dword ptr [ebp - 0x48], ebx
100954a5  3dd0520810                     cmp eax, 0x100852d0
100954aa  0f8591020000                   jne 0x10095741
100954b0  8b4768                         mov eax, dword ptr [edi + 0x68]
100954b3  8b487c                         mov ecx, dword ptr [eax + 0x7c]
100954b6  8b475c                         mov eax, dword ptr [edi + 0x5c]
100954b9  8b776c                         mov esi, dword ptr [edi + 0x6c]
100954bc  99                             cdq 
100954bd  2bc2                           sub eax, edx
100954bf  c745b000000000                 mov dword ptr [ebp - 0x50], 0
100954c6  d1f8                           sar eax, 1
100954c8  2bc8                           sub ecx, eax
100954ca  c745a400000000                 mov dword ptr [ebp - 0x5c], 0
100954d1  837f7800                       cmp dword ptr [edi + 0x78], 0
100954d5  8b4704                         mov eax, dword ptr [edi + 4]
100954d8  894da8                         mov dword ptr [ebp - 0x58], ecx
100954db  8945ac                         mov dword ptr [ebp - 0x54], eax
100954de  0f8ee7000000                   jle 0x100955cb
100954e4  33c9                           xor ecx, ecx
100954e6  33db                           xor ebx, ebx
100954e8  894db4                         mov dword ptr [ebp - 0x4c], ecx
100954eb  394f7c                         cmp dword ptr [edi + 0x7c], ecx
100954ee  0f8ea7000000                   jle 0x1009559b
100954f4  8b9784000000                   mov edx, dword ptr [edi + 0x84]
100954fa  660f1f440000                   nop word ptr [eax + eax]
10095500  8b465c                         mov eax, dword ptr [esi + 0x5c]
10095503  89459c                         mov dword ptr [ebp - 0x64], eax
10095506  8b45ac                         mov eax, dword ptr [ebp - 0x54]
10095509  83f811                         cmp eax, 0x11
1009550c  750d                           jne 0x1009551b
1009550e  8b45b8                         mov eax, dword ptr [ebp - 0x48]
10095511  03c1                           add eax, ecx
10095513  898680000000                   mov dword ptr [esi + 0x80], eax
10095519  eb35                           jmp 0x10095550
1009551b  83f812                         cmp eax, 0x12
1009551e  8b049a                         mov eax, dword ptr [edx + ebx*4]
10095521  7510                           jne 0x10095533
10095523  2b4658                         sub eax, dword ptr [esi + 0x58]
10095526  03c1                           add eax, ecx
10095528  0345b8                         add eax, dword ptr [ebp - 0x48]
1009552b  898680000000                   mov dword ptr [esi + 0x80], eax
10095531  eb1d                           jmp 0x10095550
10095533  99                             cdq 
10095534  2bc2                           sub eax, edx
10095536  8bc8                           mov ecx, eax
10095538  8b4658                         mov eax, dword ptr [esi + 0x58]
1009553b  99                             cdq 
1009553c  2bc2                           sub eax, edx
1009553e  d1f9                           sar ecx, 1
10095540  d1f8                           sar eax, 1
10095542  2bc8                           sub ecx, eax
10095544  034db4                         add ecx, dword ptr [ebp - 0x4c]
10095547  034db8                         add ecx, dword ptr [ebp - 0x48]
1009554a  898e80000000                   mov dword ptr [esi + 0x80], ecx
10095550  8b45b0                         mov eax, dword ptr [ebp - 0x50]
10095553  8bce                           mov ecx, esi
10095555  2b4654                         sub eax, dword ptr [esi + 0x54]
10095558  0345a8                         add eax, dword ptr [ebp - 0x58]
1009555b  ff75a0                         push dword ptr [ebp - 0x60]
1009555e  89467c                         mov dword ptr [esi + 0x7c], eax
10095561  8b06                           mov eax, dword ptr [esi]
10095563  ff5004                         call dword ptr [eax + 4]
10095566  8b8784000000                   mov eax, dword ptr [edi + 0x84]
1009556c  6a64                           push 0x64
1009556e  6a14                           push 0x14
10095570  ff7708                         push dword ptr [edi + 8]
10095573  89459c                         mov dword ptr [ebp - 0x64], eax
10095576  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009557c  8b559c                         mov edx, dword ptr [ebp - 0x64]
1009557f  8b4db4                         mov ecx, dword ptr [ebp - 0x4c]
10095582  8b7664                         mov esi, dword ptr [esi + 0x64]
10095585  03049a                         add eax, dword ptr [edx + ebx*4]
10095588  03c8                           add ecx, eax
1009558a  894db4                         mov dword ptr [ebp - 0x4c], ecx
1009558d  85f6                           test esi, esi
1009558f  740a                           je 0x1009559b
10095591  43                             inc ebx
10095592  3b5f7c                         cmp ebx, dword ptr [edi + 0x7c]
10095595  0f8c65ffffff                   jl 0x10095500
1009559b  6a64                           push 0x64
1009559d  6a0f                           push 0xf
1009559f  ff7708                         push dword ptr [edi + 8]
100955a2  ff15c8e20a10                   call dword ptr [0x100ae2c8]
100955a8  8b8f80000000                   mov ecx, dword ptr [edi + 0x80]
100955ae  8b55a4                         mov edx, dword ptr [ebp - 0x5c]
100955b1  030491                         add eax, dword ptr [ecx + edx*4]
100955b4  0145b0                         add dword ptr [ebp - 0x50], eax
100955b7  85f6                           test esi, esi
100955b9  740d                           je 0x100955c8
100955bb  42                             inc edx
100955bc  8955a4                         mov dword ptr [ebp - 0x5c], edx
100955bf  3b5778                         cmp edx, dword ptr [edi + 0x78]
100955c2  0f8c1cffffff                   jl 0x100954e4
100955c8  8b5db8                         mov ebx, dword ptr [ebp - 0x48]
100955cb  8b7774                         mov esi, dword ptr [edi + 0x74]
100955ce  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
100955d5  8d8e58080000                   lea ecx, [esi + 0x858]
100955db  8b4708                         mov eax, dword ptr [edi + 8]
100955de  7202                           jb 0x100955e2
100955e0  8b09                           mov ecx, dword ptr [ecx]
100955e2  89868c030000                   mov dword ptr [esi + 0x38c], eax
100955e8  8986f8020000                   mov dword ptr [esi + 0x2f8], eax
100955ee  898664020000                   mov dword ptr [esi + 0x264], eax
100955f4  8986d0010000                   mov dword ptr [esi + 0x1d0], eax
100955fa  89863c010000                   mov dword ptr [esi + 0x13c], eax
10095600  8986a8000000                   mov dword ptr [esi + 0xa8], eax
10095606  894614                         mov dword ptr [esi + 0x14], eax
10095609  898648080000                   mov dword ptr [esi + 0x848], eax
1009560f  99                             cdq 
10095610  2bc2                           sub eax, edx
10095612  d1f8                           sar eax, 1
10095614  898694030000                   mov dword ptr [esi + 0x394], eax
1009561a  898600030000                   mov dword ptr [esi + 0x300], eax
10095620  89866c020000                   mov dword ptr [esi + 0x26c], eax
10095626  8986d8010000                   mov dword ptr [esi + 0x1d8], eax
1009562c  898644010000                   mov dword ptr [esi + 0x144], eax
10095632  8986b0000000                   mov dword ptr [esi + 0xb0], eax
10095638  89461c                         mov dword ptr [esi + 0x1c], eax
1009563b  89864c080000                   mov dword ptr [esi + 0x84c], eax
10095641  8d4604                         lea eax, [esi + 4]
10095644  51                             push ecx
10095645  50                             push eax
10095646  8bce                           mov ecx, esi
10095648  e823f1feff                     call 0x10084770
1009564d  397da0                         cmp dword ptr [ebp - 0x60], edi
10095650  0f85a7000000                   jne 0x100956fd
10095656  8b07                           mov eax, dword ptr [edi]
10095658  8b4010                         mov eax, dword ptr [eax + 0x10]
1009565b  3dd0520810                     cmp eax, 0x100852d0
10095660  0f85e4000000                   jne 0x1009574a
10095666  8b4768                         mov eax, dword ptr [edi + 0x68]
10095669  8b407c                         mov eax, dword ptr [eax + 0x7c]
1009566c  8b5758                         mov edx, dword ptr [edi + 0x58]
1009566f  034754                         add eax, dword ptr [edi + 0x54]
10095672  83be8008000001                 cmp dword ptr [esi + 0x880], 1
10095679  8955ac                         mov dword ptr [ebp - 0x54], edx
1009567c  8b575c                         mov edx, dword ptr [edi + 0x5c]
1009567f  8955a8                         mov dword ptr [ebp - 0x58], edx
10095682  89459c                         mov dword ptr [ebp - 0x64], eax
10095685  7476                           je 0x100956fd
10095687  833e00                         cmp dword ptr [esi], 0
1009568a  7471                           je 0x100956fd
1009568c  8d4dbc                         lea ecx, [ebp - 0x44]
1009568f  ff15f0fe0d10                   call dword ptr [0x100dfef0]
10095695  6a01                           push 1
10095697  8d4dbc                         lea ecx, [ebp - 0x44]
1009569a  c745fc00000000                 mov dword ptr [ebp - 4], 0
100956a1  ff1550ff0d10                   call dword ptr [0x100dff50]
100956a7  6a01                           push 1
100956a9  8d4dbc                         lea ecx, [ebp - 0x44]
100956ac  ff1514fe0d10                   call dword ptr [0x100dfe14]
100956b2  68ff000000                     push 0xff
100956b7  8d4dbc                         lea ecx, [ebp - 0x44]
100956ba  ff1510fe0d10                   call dword ptr [0x100dfe10]
100956c0  8b0e                           mov ecx, dword ptr [esi]
100956c2  8d45bc                         lea eax, [ebp - 0x44]
100956c5  50                             push eax
100956c6  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
100956cc  8b459c                         mov eax, dword ptr [ebp - 0x64]
100956cf  8d4dbc                         lea ecx, [ebp - 0x44]
100956d2  898674080000                   mov dword ptr [esi + 0x874], eax
100956d8  8b45a8                         mov eax, dword ptr [ebp - 0x58]
100956db  89867c080000                   mov dword ptr [esi + 0x87c], eax
100956e1  8b45ac                         mov eax, dword ptr [ebp - 0x54]
100956e4  899e70080000                   mov dword ptr [esi + 0x870], ebx
100956ea  898678080000                   mov dword ptr [esi + 0x878], eax
100956f0  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
100956f7  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
100956fd  8b07                           mov eax, dword ptr [edi]
100956ff  8b4010                         mov eax, dword ptr [eax + 0x10]
10095702  3dd0520810                     cmp eax, 0x100852d0
10095707  754a                           jne 0x10095753
10095709  8b4768                         mov eax, dword ptr [edi + 0x68]
1009570c  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009570f  8b4754                         mov eax, dword ptr [edi + 0x54]
10095712  03c1                           add eax, ecx
10095714  895f48                         mov dword ptr [edi + 0x48], ebx
10095717  89474c                         mov dword ptr [edi + 0x4c], eax
1009571a  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009571d  64890d00000000                 mov dword ptr fs:[0], ecx
10095724  59                             pop ecx
10095725  5f                             pop edi
10095726  5e                             pop esi
10095727  5b                             pop ebx
10095728  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009572b  33cd                           xor ecx, ebp
1009572d  e825d20000                     call 0x100a2957
10095732  8be5                           mov esp, ebp
10095734  5d                             pop ebp
10095735  c20400                         ret 4
10095738  ffd0                           call eax
1009573a  8b17                           mov edx, dword ptr [edi]
1009573c  e955fdffff                     jmp 0x10095496
10095741  8bcf                           mov ecx, edi
10095743  ffd0                           call eax
10095745  e969fdffff                     jmp 0x100954b3
1009574a  8bcf                           mov ecx, edi
1009574c  ffd0                           call eax
1009574e  e916ffffff                     jmp 0x10095669
10095753  8bcf                           mov ecx, edi
10095755  ffd0                           call eax
10095757  ebb3                           jmp 0x1009570c
10095759  cc                             int3 
1009575a  cc                             int3 
1009575b  cc                             int3 
1009575c  cc                             int3 
1009575d  cc                             int3 
1009575e  cc                             int3 
1009575f  cc                             int3 
