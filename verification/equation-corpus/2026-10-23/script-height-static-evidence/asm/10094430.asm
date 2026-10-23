; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10094430 <= VA < 0x10094720 (next decompiler entry; may include padding/thunks)
10094430  55                             push ebp
10094431  8bec                           mov ebp, esp
10094433  6aff                           push -1
10094435  6889cb0a10                     push 0x100acb89
1009443a  64a100000000                   mov eax, dword ptr fs:[0]
10094440  50                             push eax
10094441  83ec60                         sub esp, 0x60
10094444  a10c100d10                     mov eax, dword ptr [0x100d100c]
10094449  33c5                           xor eax, ebp
1009444b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009444e  53                             push ebx
1009444f  56                             push esi
10094450  57                             push edi
10094451  50                             push eax
10094452  8d45f4                         lea eax, [ebp - 0xc]
10094455  64a300000000                   mov dword ptr fs:[0], eax
1009445b  8bf1                           mov esi, ecx
1009445d  8b5668                         mov edx, dword ptr [esi + 0x68]
10094460  8b4508                         mov eax, dword ptr [ebp + 8]
10094463  8b5e50                         mov ebx, dword ptr [esi + 0x50]
10094466  89459c                         mov dword ptr [ebp - 0x64], eax
10094469  8b4658                         mov eax, dword ptr [esi + 0x58]
1009446c  039a80000000                   add ebx, dword ptr [edx + 0x80]
10094472  8b4a7c                         mov ecx, dword ptr [edx + 0x7c]
10094475  894594                         mov dword ptr [ebp - 0x6c], eax
10094478  8b465c                         mov eax, dword ptr [esi + 0x5c]
1009447b  99                             cdq 
1009447c  2bc2                           sub eax, edx
1009447e  895da4                         mov dword ptr [ebp - 0x5c], ebx
10094481  d1f8                           sar eax, 1
10094483  2bc8                           sub ecx, eax
10094485  8d4594                         lea eax, [ebp - 0x6c]
10094488  6a01                           push 1
1009448a  894da8                         mov dword ptr [ebp - 0x58], ecx
1009448d  8bce                           mov ecx, esi
1009448f  50                             push eax
10094490  e88b020000                     call 0x10094720
10094495  33ff                           xor edi, edi
10094497  397e78                         cmp dword ptr [esi + 0x78], edi
1009449a  0f8e95010000                   jle 0x10094635
100944a0  8b567c                         mov edx, dword ptr [esi + 0x7c]
100944a3  8bcb                           mov ecx, ebx
100944a5  895db4                         mov dword ptr [ebp - 0x4c], ebx
100944a8  894db8                         mov dword ptr [ebp - 0x48], ecx
100944ab  83fa01                         cmp edx, 1
100944ae  7e0c                           jle 0x100944bc
100944b0  57                             push edi
100944b1  51                             push ecx
100944b2  8bce                           mov ecx, esi
100944b4  e8b7060000                     call 0x10094b70
100944b9  8b567c                         mov edx, dword ptr [esi + 0x7c]
100944bc  33db                           xor ebx, ebx
100944be  8bca                           mov ecx, edx
100944c0  85d2                           test edx, edx
100944c2  0f8e42010000                   jle 0x1009460a
100944c8  8d42ff                         lea eax, [edx - 1]
100944cb  8945b0                         mov dword ptr [ebp - 0x50], eax
100944ce  3bd8                           cmp ebx, eax
100944d0  7525                           jne 0x100944f7
100944d2  8b4678                         mov eax, dword ptr [esi + 0x78]
100944d5  48                             dec eax
100944d6  3bf8                           cmp edi, eax
100944d8  7508                           jne 0x100944e2
100944da  85ff                           test edi, edi
100944dc  0f8f28010000                   jg 0x1009460a
100944e2  837e0474                       cmp dword ptr [esi + 4], 0x74
100944e6  8bd1                           mov edx, ecx
100944e8  750d                           jne 0x100944f7
100944ea  85ff                           test edi, edi
100944ec  7509                           jne 0x100944f7
100944ee  83f902                         cmp ecx, 2
100944f1  0f8f13010000                   jg 0x1009460a
100944f7  3b7e78                         cmp edi, dword ptr [esi + 0x78]
100944fa  7d16                           jge 0x10094512
100944fc  3bda                           cmp ebx, edx
100944fe  7d12                           jge 0x10094512
10094500  8b8690000000                   mov eax, dword ptr [esi + 0x90]
10094506  8bca                           mov ecx, edx
10094508  0fafcf                         imul ecx, edi
1009450b  03cb                           add ecx, ebx
1009450d  8b0c88                         mov ecx, dword ptr [eax + ecx*4]
10094510  eb02                           jmp 0x10094514
10094512  33c9                           xor ecx, ecx
10094514  8b4158                         mov eax, dword ptr [ecx + 0x58]
10094517  8945a0                         mov dword ptr [ebp - 0x60], eax
1009451a  8b415c                         mov eax, dword ptr [ecx + 0x5c]
1009451d  894598                         mov dword ptr [ebp - 0x68], eax
10094520  8b4678                         mov eax, dword ptr [esi + 0x78]
10094523  48                             dec eax
10094524  894dac                         mov dword ptr [ebp - 0x54], ecx
10094527  3bf8                           cmp edi, eax
10094529  755b                           jne 0x10094586
1009452b  85ff                           test edi, edi
1009452d  7e57                           jle 0x10094586
1009452f  8b8684000000                   mov eax, dword ptr [esi + 0x84]
10094535  6a64                           push 0x64
10094537  6a14                           push 0x14
10094539  ff7608                         push dword ptr [esi + 8]
1009453c  8d0498                         lea eax, [eax + ebx*4]
1009453f  8945b0                         mov dword ptr [ebp - 0x50], eax
10094542  ff15c8e20a10                   call dword ptr [0x100ae2c8]
10094548  8b4db0                         mov ecx, dword ptr [ebp - 0x50]
1009454b  0301                           add eax, dword ptr [ecx]
1009454d  0145b8                         add dword ptr [ebp - 0x48], eax
10094550  837e0474                       cmp dword ptr [esi + 4], 0x74
10094554  751d                           jne 0x10094573
10094556  8b467c                         mov eax, dword ptr [esi + 0x7c]
10094559  83f802                         cmp eax, 2
1009455c  7e15                           jle 0x10094573
1009455e  83c0fe                         add eax, -2
10094561  3bd8                           cmp ebx, eax
10094563  750e                           jne 0x10094573
10094565  8b8694000000                   mov eax, dword ptr [esi + 0x94]
1009456b  99                             cdq 
1009456c  2bc2                           sub eax, edx
1009456e  d1f8                           sar eax, 1
10094570  0145b8                         add dword ptr [ebp - 0x48], eax
10094573  8b4104                         mov eax, dword ptr [ecx + 4]
10094576  2b45a0                         sub eax, dword ptr [ebp - 0x60]
10094579  8b4dac                         mov ecx, dword ptr [ebp - 0x54]
1009457c  99                             cdq 
1009457d  2bc2                           sub eax, edx
1009457f  d1f8                           sar eax, 1
10094581  0345b8                         add eax, dword ptr [ebp - 0x48]
10094584  eb32                           jmp 0x100945b8
10094586  837e0474                       cmp dword ptr [esi + 4], 0x74
1009458a  7518                           jne 0x100945a4
1009458c  83fa02                         cmp edx, 2
1009458f  7e13                           jle 0x100945a4
10094591  3b5db0                         cmp ebx, dword ptr [ebp - 0x50]
10094594  750e                           jne 0x100945a4
10094596  8b8694000000                   mov eax, dword ptr [esi + 0x94]
1009459c  99                             cdq 
1009459d  2bc2                           sub eax, edx
1009459f  d1f8                           sar eax, 1
100945a1  0145b4                         add dword ptr [ebp - 0x4c], eax
100945a4  8b8684000000                   mov eax, dword ptr [esi + 0x84]
100945aa  8b0498                         mov eax, dword ptr [eax + ebx*4]
100945ad  2b45a0                         sub eax, dword ptr [ebp - 0x60]
100945b0  99                             cdq 
100945b1  2bc2                           sub eax, edx
100945b3  d1f8                           sar eax, 1
100945b5  0345b4                         add eax, dword ptr [ebp - 0x4c]
100945b8  6a64                           push 0x64
100945ba  6a14                           push 0x14
100945bc  898180000000                   mov dword ptr [ecx + 0x80], eax
100945c2  ff7608                         push dword ptr [esi + 8]
100945c5  ff15c8e20a10                   call dword ptr [0x100ae2c8]
100945cb  8b8e84000000                   mov ecx, dword ptr [esi + 0x84]
100945d1  ff759c                         push dword ptr [ebp - 0x64]
100945d4  030499                         add eax, dword ptr [ecx + ebx*4]
100945d7  0145b4                         add dword ptr [ebp - 0x4c], eax
100945da  8b8680000000                   mov eax, dword ptr [esi + 0x80]
100945e0  8b4dac                         mov ecx, dword ptr [ebp - 0x54]
100945e3  8b04b8                         mov eax, dword ptr [eax + edi*4]
100945e6  2b4598                         sub eax, dword ptr [ebp - 0x68]
100945e9  99                             cdq 
100945ea  2bc2                           sub eax, edx
100945ec  d1f8                           sar eax, 1
100945ee  2b4154                         sub eax, dword ptr [ecx + 0x54]
100945f1  0345a8                         add eax, dword ptr [ebp - 0x58]
100945f4  89417c                         mov dword ptr [ecx + 0x7c], eax
100945f7  8b01                           mov eax, dword ptr [ecx]
100945f9  ff5004                         call dword ptr [eax + 4]
100945fc  8b567c                         mov edx, dword ptr [esi + 0x7c]
100945ff  43                             inc ebx
10094600  8bca                           mov ecx, edx
10094602  3bda                           cmp ebx, edx
10094604  0f8cbefeffff                   jl 0x100944c8
1009460a  8b8680000000                   mov eax, dword ptr [esi + 0x80]
10094610  8b5da8                         mov ebx, dword ptr [ebp - 0x58]
10094613  6a64                           push 0x64
10094615  6a0f                           push 0xf
10094617  ff7608                         push dword ptr [esi + 8]
1009461a  031cb8                         add ebx, dword ptr [eax + edi*4]
1009461d  ff15c8e20a10                   call dword ptr [0x100ae2c8]
10094623  03d8                           add ebx, eax
10094625  47                             inc edi
10094626  895da8                         mov dword ptr [ebp - 0x58], ebx
10094629  8b5da4                         mov ebx, dword ptr [ebp - 0x5c]
1009462c  3b7e78                         cmp edi, dword ptr [esi + 0x78]
1009462f  0f8c6bfeffff                   jl 0x100944a0
10094635  8b7e74                         mov edi, dword ptr [esi + 0x74]
10094638  83bf6c08000008                 cmp dword ptr [edi + 0x86c], 8
1009463f  8d8758080000                   lea eax, [edi + 0x858]
10094645  7202                           jb 0x10094649
10094647  8b00                           mov eax, dword ptr [eax]
10094649  50                             push eax
1009464a  ff7608                         push dword ptr [esi + 8]
1009464d  8bcf                           mov ecx, edi
1009464f  e80cfffeff                     call 0x10084560
10094654  39759c                         cmp dword ptr [ebp - 0x64], esi
10094657  0f858f000000                   jne 0x100946ec
1009465d  8b4668                         mov eax, dword ptr [esi + 0x68]
10094660  8b565c                         mov edx, dword ptr [esi + 0x5c]
10094663  8b5e58                         mov ebx, dword ptr [esi + 0x58]
10094666  8955b0                         mov dword ptr [ebp - 0x50], edx
10094669  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009466c  8b4654                         mov eax, dword ptr [esi + 0x54]
1009466f  03c1                           add eax, ecx
10094671  83bf8008000001                 cmp dword ptr [edi + 0x880], 1
10094678  894598                         mov dword ptr [ebp - 0x68], eax
1009467b  746f                           je 0x100946ec
1009467d  833f00                         cmp dword ptr [edi], 0
10094680  746a                           je 0x100946ec
10094682  8d4dbc                         lea ecx, [ebp - 0x44]
10094685  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009468b  6a01                           push 1
1009468d  8d4dbc                         lea ecx, [ebp - 0x44]
10094690  c745fc00000000                 mov dword ptr [ebp - 4], 0
10094697  ff1550ff0d10                   call dword ptr [0x100dff50]
1009469d  6a01                           push 1
1009469f  8d4dbc                         lea ecx, [ebp - 0x44]
100946a2  ff1514fe0d10                   call dword ptr [0x100dfe14]
100946a8  68ff000000                     push 0xff
100946ad  8d4dbc                         lea ecx, [ebp - 0x44]
100946b0  ff1510fe0d10                   call dword ptr [0x100dfe10]
100946b6  8b0f                           mov ecx, dword ptr [edi]
100946b8  8d45bc                         lea eax, [ebp - 0x44]
100946bb  50                             push eax
100946bc  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
100946c2  8b45a4                         mov eax, dword ptr [ebp - 0x5c]
100946c5  8d4dbc                         lea ecx, [ebp - 0x44]
100946c8  898770080000                   mov dword ptr [edi + 0x870], eax
100946ce  8b4598                         mov eax, dword ptr [ebp - 0x68]
100946d1  898774080000                   mov dword ptr [edi + 0x874], eax
100946d7  8b45b0                         mov eax, dword ptr [ebp - 0x50]
100946da  89877c080000                   mov dword ptr [edi + 0x87c], eax
100946e0  899f78080000                   mov dword ptr [edi + 0x878], ebx
100946e6  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
100946ec  8b4668                         mov eax, dword ptr [esi + 0x68]
100946ef  8b487c                         mov ecx, dword ptr [eax + 0x7c]
100946f2  8b45a4                         mov eax, dword ptr [ebp - 0x5c]
100946f5  894648                         mov dword ptr [esi + 0x48], eax
100946f8  8b4654                         mov eax, dword ptr [esi + 0x54]
100946fb  03c1                           add eax, ecx
100946fd  89464c                         mov dword ptr [esi + 0x4c], eax
10094700  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
10094703  64890d00000000                 mov dword ptr fs:[0], ecx
1009470a  59                             pop ecx
1009470b  5f                             pop edi
1009470c  5e                             pop esi
1009470d  5b                             pop ebx
1009470e  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
10094711  33cd                           xor ecx, ebp
10094713  e83fe20000                     call 0x100a2957
10094718  8be5                           mov esp, ebp
1009471a  5d                             pop ebp
1009471b  c20400                         ret 4
1009471e  cc                             int3 
1009471f  cc                             int3 
