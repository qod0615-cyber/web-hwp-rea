; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10093d10 <= VA < 0x10094050 (next decompiler entry; may include padding/thunks)
10093d10  55                             push ebp
10093d11  8bec                           mov ebp, esp
10093d13  6aff                           push -1
10093d15  6859c50a10                     push 0x100ac559
10093d1a  64a100000000                   mov eax, dword ptr fs:[0]
10093d20  50                             push eax
10093d21  83ec58                         sub esp, 0x58
10093d24  a10c100d10                     mov eax, dword ptr [0x100d100c]
10093d29  33c5                           xor eax, ebp
10093d2b  8945f0                         mov dword ptr [ebp - 0x10], eax
10093d2e  53                             push ebx
10093d2f  56                             push esi
10093d30  57                             push edi
10093d31  50                             push eax
10093d32  8d45f4                         lea eax, [ebp - 0xc]
10093d35  64a300000000                   mov dword ptr fs:[0], eax
10093d3b  8bf1                           mov esi, ecx
10093d3d  8b16                           mov edx, dword ptr [esi]
10093d3f  8b4508                         mov eax, dword ptr [ebp + 8]
10093d42  8945a4                         mov dword ptr [ebp - 0x5c], eax
10093d45  8b4210                         mov eax, dword ptr [edx + 0x10]
10093d48  81fa44fa0b10                   cmp edx, 0x100bfa44
10093d4e  0f85d0020000                   jne 0x10094024
10093d54  8b4668                         mov eax, dword ptr [esi + 0x68]
10093d57  8bb880000000                   mov edi, dword ptr [eax + 0x80]
10093d5d  037e50                         add edi, dword ptr [esi + 0x50]
10093d60  897db0                         mov dword ptr [ebp - 0x50], edi
10093d63  81fa44fa0b10                   cmp edx, 0x100bfa44
10093d69  0f85be020000                   jne 0x1009402d
10093d6f  8b4668                         mov eax, dword ptr [esi + 0x68]
10093d72  8b587c                         mov ebx, dword ptr [eax + 0x7c]
10093d75  8b465c                         mov eax, dword ptr [esi + 0x5c]
10093d78  99                             cdq 
10093d79  2bc2                           sub eax, edx
10093d7b  d1f8                           sar eax, 1
10093d7d  2bd8                           sub ebx, eax
10093d7f  8b8698000000                   mov eax, dword ptr [esi + 0x98]
10093d85  895dac                         mov dword ptr [ebp - 0x54], ebx
10093d88  89780c                         mov dword ptr [eax + 0xc], edi
10093d8b  895808                         mov dword ptr [eax + 8], ebx
10093d8e  8b8e9c000000                   mov ecx, dword ptr [esi + 0x9c]
10093d94  8b465c                         mov eax, dword ptr [esi + 0x5c]
10093d97  8b7e58                         mov edi, dword ptr [esi + 0x58]
10093d9a  8945a0                         mov dword ptr [ebp - 0x60], eax
10093d9d  8b4104                         mov eax, dword ptr [ecx + 4]
10093da0  83f813                         cmp eax, 0x13
10093da3  740f                           je 0x10093db4
10093da5  83f804                         cmp eax, 4
10093da8  740a                           je 0x10093db4
10093daa  83f80c                         cmp eax, 0xc
10093dad  7405                           je 0x10093db4
10093daf  8b5144                         mov edx, dword ptr [ecx + 0x44]
10093db2  eb14                           jmp 0x10093dc8
10093db4  8b4110                         mov eax, dword ptr [ecx + 0x10]
10093db7  99                             cdq 
10093db8  83e203                         and edx, 3
10093dbb  03c2                           add eax, edx
10093dbd  8b5144                         mov edx, dword ptr [ecx + 0x44]
10093dc0  c1f802                         sar eax, 2
10093dc3  3bd0                           cmp edx, eax
10093dc5  0f4ed0                         cmovle edx, eax
10093dc8  2bfa                           sub edi, edx
10093dca  895908                         mov dword ptr [ecx + 8], ebx
10093dcd  037db0                         add edi, dword ptr [ebp - 0x50]
10093dd0  89790c                         mov dword ptr [ecx + 0xc], edi
10093dd3  8b8e98000000                   mov ecx, dword ptr [esi + 0x98]
10093dd9  e852da0000                     call 0x100a1830
10093dde  8b8e9c000000                   mov ecx, dword ptr [esi + 0x9c]
10093de4  e847da0000                     call 0x100a1830
10093de9  8b8e98000000                   mov ecx, dword ptr [esi + 0x98]
10093def  8b4104                         mov eax, dword ptr [ecx + 4]
10093df2  83f813                         cmp eax, 0x13
10093df5  740f                           je 0x10093e06
10093df7  83f804                         cmp eax, 4
10093dfa  740a                           je 0x10093e06
10093dfc  83f80c                         cmp eax, 0xc
10093dff  7405                           je 0x10093e06
10093e01  8b4944                         mov ecx, dword ptr [ecx + 0x44]
10093e04  eb14                           jmp 0x10093e1a
10093e06  8b4110                         mov eax, dword ptr [ecx + 0x10]
10093e09  8b4944                         mov ecx, dword ptr [ecx + 0x44]
10093e0c  99                             cdq 
10093e0d  83e203                         and edx, 3
10093e10  03c2                           add eax, edx
10093e12  c1f802                         sar eax, 2
10093e15  3bc8                           cmp ecx, eax
10093e17  0f4ec8                         cmovle ecx, eax
10093e1a  034db0                         add ecx, dword ptr [ebp - 0x50]
10093e1d  33ff                           xor edi, edi
10093e1f  894da0                         mov dword ptr [ebp - 0x60], ecx
10093e22  897db4                         mov dword ptr [ebp - 0x4c], edi
10093e25  397e78                         cmp dword ptr [esi + 0x78], edi
10093e28  0f8eef000000                   jle 0x10093f1d
10093e2e  6690                           nop 
10093e30  8bd1                           mov edx, ecx
10093e32  33db                           xor ebx, ebx
10093e34  8b4e7c                         mov ecx, dword ptr [esi + 0x7c]
10093e37  8955b8                         mov dword ptr [ebp - 0x48], edx
10093e3a  85c9                           test ecx, ecx
10093e3c  0f8ead000000                   jle 0x10093eef
10093e42  3b7e78                         cmp edi, dword ptr [esi + 0x78]
10093e45  7d14                           jge 0x10093e5b
10093e47  3bd9                           cmp ebx, ecx
10093e49  7d10                           jge 0x10093e5b
10093e4b  8b8690000000                   mov eax, dword ptr [esi + 0x90]
10093e51  0fafcf                         imul ecx, edi
10093e54  03cb                           add ecx, ebx
10093e56  8b3c88                         mov edi, dword ptr [eax + ecx*4]
10093e59  eb02                           jmp 0x10093e5d
10093e5b  33ff                           xor edi, edi
10093e5d  8b475c                         mov eax, dword ptr [edi + 0x5c]
10093e60  8b4f58                         mov ecx, dword ptr [edi + 0x58]
10093e63  8945a8                         mov dword ptr [ebp - 0x58], eax
10093e66  8b8694000000                   mov eax, dword ptr [esi + 0x94]
10093e6c  83f801                         cmp eax, 1
10093e6f  7508                           jne 0x10093e79
10093e71  899780000000                   mov dword ptr [edi + 0x80], edx
10093e77  eb24                           jmp 0x10093e9d
10093e79  83f802                         cmp eax, 2
10093e7c  8b8684000000                   mov eax, dword ptr [esi + 0x84]
10093e82  8b0498                         mov eax, dword ptr [eax + ebx*4]
10093e85  7506                           jne 0x10093e8d
10093e87  2bc1                           sub eax, ecx
10093e89  03c2                           add eax, edx
10093e8b  eb0a                           jmp 0x10093e97
10093e8d  2bc1                           sub eax, ecx
10093e8f  99                             cdq 
10093e90  2bc2                           sub eax, edx
10093e92  d1f8                           sar eax, 1
10093e94  0345b8                         add eax, dword ptr [ebp - 0x48]
10093e97  898780000000                   mov dword ptr [edi + 0x80], eax
10093e9d  6a64                           push 0x64
10093e9f  6a14                           push 0x14
10093ea1  ff7608                         push dword ptr [esi + 8]
10093ea4  ff15c8e20a10                   call dword ptr [0x100ae2c8]
10093eaa  8b8e84000000                   mov ecx, dword ptr [esi + 0x84]
10093eb0  ff75a4                         push dword ptr [ebp - 0x5c]
10093eb3  030499                         add eax, dword ptr [ecx + ebx*4]
10093eb6  0145b8                         add dword ptr [ebp - 0x48], eax
10093eb9  8b8680000000                   mov eax, dword ptr [esi + 0x80]
10093ebf  8b4db4                         mov ecx, dword ptr [ebp - 0x4c]
10093ec2  8b0488                         mov eax, dword ptr [eax + ecx*4]
10093ec5  8bcf                           mov ecx, edi
10093ec7  2b45a8                         sub eax, dword ptr [ebp - 0x58]
10093eca  99                             cdq 
10093ecb  2bc2                           sub eax, edx
10093ecd  d1f8                           sar eax, 1
10093ecf  2b4754                         sub eax, dword ptr [edi + 0x54]
10093ed2  0345ac                         add eax, dword ptr [ebp - 0x54]
10093ed5  89477c                         mov dword ptr [edi + 0x7c], eax
10093ed8  8b07                           mov eax, dword ptr [edi]
10093eda  ff5004                         call dword ptr [eax + 4]
10093edd  8b4e7c                         mov ecx, dword ptr [esi + 0x7c]
10093ee0  43                             inc ebx
10093ee1  8b7db4                         mov edi, dword ptr [ebp - 0x4c]
10093ee4  8b55b8                         mov edx, dword ptr [ebp - 0x48]
10093ee7  3bd9                           cmp ebx, ecx
10093ee9  0f8c53ffffff                   jl 0x10093e42
10093eef  8b8680000000                   mov eax, dword ptr [esi + 0x80]
10093ef5  8b5dac                         mov ebx, dword ptr [ebp - 0x54]
10093ef8  6a64                           push 0x64
10093efa  6a0f                           push 0xf
10093efc  ff7608                         push dword ptr [esi + 8]
10093eff  031cb8                         add ebx, dword ptr [eax + edi*4]
10093f02  ff15c8e20a10                   call dword ptr [0x100ae2c8]
10093f08  8b4da0                         mov ecx, dword ptr [ebp - 0x60]
10093f0b  47                             inc edi
10093f0c  03d8                           add ebx, eax
10093f0e  897db4                         mov dword ptr [ebp - 0x4c], edi
10093f11  895dac                         mov dword ptr [ebp - 0x54], ebx
10093f14  3b7e78                         cmp edi, dword ptr [esi + 0x78]
10093f17  0f8c13ffffff                   jl 0x10093e30
10093f1d  8b7e74                         mov edi, dword ptr [esi + 0x74]
10093f20  83bf6c08000008                 cmp dword ptr [edi + 0x86c], 8
10093f27  8d8758080000                   lea eax, [edi + 0x858]
10093f2d  7202                           jb 0x10093f31
10093f2f  8b00                           mov eax, dword ptr [eax]
10093f31  50                             push eax
10093f32  ff7608                         push dword ptr [esi + 8]
10093f35  8bcf                           mov ecx, edi
10093f37  e82406ffff                     call 0x10084560
10093f3c  3975a4                         cmp dword ptr [ebp - 0x5c], esi
10093f3f  0f85a4000000                   jne 0x10093fe9
10093f45  8b06                           mov eax, dword ptr [esi]
10093f47  8b5010                         mov edx, dword ptr [eax + 0x10]
10093f4a  3d44fa0b10                     cmp eax, 0x100bfa44
10093f4f  0f85e2000000                   jne 0x10094037
10093f55  8b4668                         mov eax, dword ptr [esi + 0x68]
10093f58  8b407c                         mov eax, dword ptr [eax + 0x7c]
10093f5b  034654                         add eax, dword ptr [esi + 0x54]
10093f5e  83bf8008000001                 cmp dword ptr [edi + 0x880], 1
10093f65  8b565c                         mov edx, dword ptr [esi + 0x5c]
10093f68  8b5e58                         mov ebx, dword ptr [esi + 0x58]
10093f6b  8955a8                         mov dword ptr [ebp - 0x58], edx
10093f6e  8945a0                         mov dword ptr [ebp - 0x60], eax
10093f71  7476                           je 0x10093fe9
10093f73  833f00                         cmp dword ptr [edi], 0
10093f76  7471                           je 0x10093fe9
10093f78  8d4dbc                         lea ecx, [ebp - 0x44]
10093f7b  ff15f0fe0d10                   call dword ptr [0x100dfef0]
10093f81  6a01                           push 1
10093f83  8d4dbc                         lea ecx, [ebp - 0x44]
10093f86  c745fc00000000                 mov dword ptr [ebp - 4], 0
10093f8d  ff1550ff0d10                   call dword ptr [0x100dff50]
10093f93  6a01                           push 1
10093f95  8d4dbc                         lea ecx, [ebp - 0x44]
10093f98  ff1514fe0d10                   call dword ptr [0x100dfe14]
10093f9e  68ff000000                     push 0xff
10093fa3  8d4dbc                         lea ecx, [ebp - 0x44]
10093fa6  ff1510fe0d10                   call dword ptr [0x100dfe10]
10093fac  8b0f                           mov ecx, dword ptr [edi]
10093fae  8d45bc                         lea eax, [ebp - 0x44]
10093fb1  50                             push eax
10093fb2  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
10093fb8  8b45b0                         mov eax, dword ptr [ebp - 0x50]
10093fbb  8d4dbc                         lea ecx, [ebp - 0x44]
10093fbe  898770080000                   mov dword ptr [edi + 0x870], eax
10093fc4  8b45a0                         mov eax, dword ptr [ebp - 0x60]
10093fc7  898774080000                   mov dword ptr [edi + 0x874], eax
10093fcd  8b45a8                         mov eax, dword ptr [ebp - 0x58]
10093fd0  89877c080000                   mov dword ptr [edi + 0x87c], eax
10093fd6  899f78080000                   mov dword ptr [edi + 0x878], ebx
10093fdc  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
10093fe3  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
10093fe9  8b06                           mov eax, dword ptr [esi]
10093feb  3d44fa0b10                     cmp eax, 0x100bfa44
10093ff0  754e                           jne 0x10094040
10093ff2  8b4668                         mov eax, dword ptr [esi + 0x68]
10093ff5  8b487c                         mov ecx, dword ptr [eax + 0x7c]
10093ff8  8b45b0                         mov eax, dword ptr [ebp - 0x50]
10093ffb  894648                         mov dword ptr [esi + 0x48], eax
10093ffe  8b4654                         mov eax, dword ptr [esi + 0x54]
10094001  03c1                           add eax, ecx
10094003  89464c                         mov dword ptr [esi + 0x4c], eax
10094006  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
10094009  64890d00000000                 mov dword ptr fs:[0], ecx
10094010  59                             pop ecx
10094011  5f                             pop edi
10094012  5e                             pop esi
10094013  5b                             pop ebx
10094014  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
10094017  33cd                           xor ecx, ebp
10094019  e839e90000                     call 0x100a2957
1009401e  8be5                           mov esp, ebp
10094020  5d                             pop ebp
10094021  c20400                         ret 4
10094024  ffd0                           call eax
10094026  8b16                           mov edx, dword ptr [esi]
10094028  e92afdffff                     jmp 0x10093d57
1009402d  8bce                           mov ecx, esi
1009402f  ff5210                         call dword ptr [edx + 0x10]
10094032  e93bfdffff                     jmp 0x10093d72
10094037  8bce                           mov ecx, esi
10094039  ffd2                           call edx
1009403b  e918ffffff                     jmp 0x10093f58
10094040  8bce                           mov ecx, esi
10094042  ff5010                         call dword ptr [eax + 0x10]
10094045  ebae                           jmp 0x10093ff5
10094047  cc                             int3 
10094048  cc                             int3 
10094049  cc                             int3 
1009404a  cc                             int3 
1009404b  cc                             int3 
1009404c  cc                             int3 
1009404d  cc                             int3 
1009404e  cc                             int3 
1009404f  cc                             int3 
