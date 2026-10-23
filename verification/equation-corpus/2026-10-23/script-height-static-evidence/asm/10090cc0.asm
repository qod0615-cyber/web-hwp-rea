; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10090cc0 <= VA < 0x10090ff0 (next decompiler entry; may include padding/thunks)
10090cc0  55                             push ebp
10090cc1  8bec                           mov ebp, esp
10090cc3  6aff                           push -1
10090cc5  6829c50a10                     push 0x100ac529
10090cca  64a100000000                   mov eax, dword ptr fs:[0]
10090cd0  50                             push eax
10090cd1  83ec54                         sub esp, 0x54
10090cd4  a10c100d10                     mov eax, dword ptr [0x100d100c]
10090cd9  33c5                           xor eax, ebp
10090cdb  8945f0                         mov dword ptr [ebp - 0x10], eax
10090cde  53                             push ebx
10090cdf  56                             push esi
10090ce0  57                             push edi
10090ce1  50                             push eax
10090ce2  8d45f4                         lea eax, [ebp - 0xc]
10090ce5  64a300000000                   mov dword ptr fs:[0], eax
10090ceb  8bf1                           mov esi, ecx
10090ced  8975b4                         mov dword ptr [ebp - 0x4c], esi
10090cf0  8b4e74                         mov ecx, dword ptr [esi + 0x74]
10090cf3  8b4508                         mov eax, dword ptr [ebp + 8]
10090cf6  8945a8                         mov dword ptr [ebp - 0x58], eax
10090cf9  894db8                         mov dword ptr [ebp - 0x48], ecx
10090cfc  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
10090d03  8d9158080000                   lea edx, [ecx + 0x858]
10090d09  7206                           jb 0x10090d11
10090d0b  8b9158080000                   mov edx, dword ptr [ecx + 0x858]
10090d11  52                             push edx
10090d12  ff7608                         push dword ptr [esi + 8]
10090d15  e84638ffff                     call 0x10084560
10090d1a  8b4668                         mov eax, dword ptr [esi + 0x68]
10090d1d  8b7e50                         mov edi, dword ptr [esi + 0x50]
10090d20  6a64                           push 0x64
10090d22  6a0a                           push 0xa
10090d24  8b9880000000                   mov ebx, dword ptr [eax + 0x80]
10090d2a  8b4678                         mov eax, dword ptr [esi + 0x78]
10090d2d  8b7058                         mov esi, dword ptr [eax + 0x58]
10090d30  8b405c                         mov eax, dword ptr [eax + 0x5c]
10090d33  8945b0                         mov dword ptr [ebp - 0x50], eax
10090d36  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
10090d39  ffb084000000                   push dword ptr [eax + 0x84]
10090d3f  ff15c8e20a10                   call dword ptr [0x100ae2c8]
10090d45  03c6                           add eax, esi
10090d47  03c7                           add eax, edi
10090d49  03c3                           add eax, ebx
10090d4b  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
10090d4e  6a64                           push 0x64
10090d50  6a0c                           push 0xc
10090d52  8945b0                         mov dword ptr [ebp - 0x50], eax
10090d55  8b4b68                         mov ecx, dword ptr [ebx + 0x68]
10090d58  ffb388000000                   push dword ptr [ebx + 0x88]
10090d5e  8b717c                         mov esi, dword ptr [ecx + 0x7c]
10090d61  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
10090d64  8b795c                         mov edi, dword ptr [ecx + 0x5c]
10090d67  037b54                         add edi, dword ptr [ebx + 0x54]
10090d6a  8b1dc8e20a10                   mov ebx, dword ptr [0x100ae2c8]
10090d70  03fe                           add edi, esi
10090d72  ffd3                           call ebx
10090d74  8bf0                           mov esi, eax
10090d76  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
10090d79  6a64                           push 0x64
10090d7b  6a1e                           push 0x1e
10090d7d  ffb084000000                   push dword ptr [eax + 0x84]
10090d83  ffd3                           call ebx
10090d85  8b5db8                         mov ebx, dword ptr [ebp - 0x48]
10090d88  8bcb                           mov ecx, ebx
10090d8a  8945a4                         mov dword ptr [ebp - 0x5c], eax
10090d8d  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
10090d90  ffb34c080000                   push dword ptr [ebx + 0x84c]
10090d96  8b8088000000                   mov eax, dword ptr [eax + 0x88]
10090d9c  99                             cdq 
10090d9d  2bc2                           sub eax, edx
10090d9f  d1f8                           sar eax, 1
10090da1  038348080000                   add eax, dword ptr [ebx + 0x848]
10090da7  50                             push eax
10090da8  e82337ffff                     call 0x100844d0
10090dad  8d043e                         lea eax, [esi + edi]
10090db0  8bcb                           mov ecx, ebx
10090db2  8b75b0                         mov esi, dword ptr [ebp - 0x50]
10090db5  680fe10000                     push 0xe10f
10090dba  50                             push eax
10090dbb  56                             push esi
10090dbc  8945b8                         mov dword ptr [ebp - 0x48], eax
10090dbf  e86c3bffff                     call 0x10084930
10090dc4  8b7db4                         mov edi, dword ptr [ebp - 0x4c]
10090dc7  8b9780000000                   mov edx, dword ptr [edi + 0x80]
10090dcd  8b425c                         mov eax, dword ptr [edx + 0x5c]
10090dd0  8b4a58                         mov ecx, dword ptr [edx + 0x58]
10090dd3  8945b0                         mov dword ptr [ebp - 0x50], eax
10090dd6  8b477c                         mov eax, dword ptr [edi + 0x7c]
10090dd9  8b405c                         mov eax, dword ptr [eax + 0x5c]
10090ddc  8945b0                         mov dword ptr [ebp - 0x50], eax
10090ddf  8b477c                         mov eax, dword ptr [edi + 0x7c]
10090de2  3b4858                         cmp ecx, dword ptr [eax + 0x58]
10090de5  7e05                           jle 0x10090dec
10090de7  8b425c                         mov eax, dword ptr [edx + 0x5c]
10090dea  eb06                           jmp 0x10090df2
10090dec  8b4858                         mov ecx, dword ptr [eax + 0x58]
10090def  8b405c                         mov eax, dword ptr [eax + 0x5c]
10090df2  8945b0                         mov dword ptr [ebp - 0x50], eax
10090df5  8b45a4                         mov eax, dword ptr [ebp - 0x5c]
10090df8  03c1                           add eax, ecx
10090dfa  8bcb                           mov ecx, ebx
10090dfc  99                             cdq 
10090dfd  2bc2                           sub eax, edx
10090dff  d1f8                           sar eax, 1
10090e01  50                             push eax
10090e02  ffb348080000                   push dword ptr [ebx + 0x848]
10090e08  e8c336ffff                     call 0x100844d0
10090e0d  8b8784000000                   mov eax, dword ptr [edi + 0x84]
10090e13  8bcb                           mov ecx, ebx
10090e15  2b45a4                         sub eax, dword ptr [ebp - 0x5c]
10090e18  6810e10000                     push 0xe110
10090e1d  ff75b8                         push dword ptr [ebp - 0x48]
10090e20  03c6                           add eax, esi
10090e22  50                             push eax
10090e23  e8083bffff                     call 0x10084930
10090e28  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
10090e2f  8d8358080000                   lea eax, [ebx + 0x858]
10090e35  7202                           jb 0x10090e39
10090e37  8b00                           mov eax, dword ptr [eax]
10090e39  50                             push eax
10090e3a  ff7708                         push dword ptr [edi + 8]
10090e3d  8bcb                           mov ecx, ebx
10090e3f  e81c37ffff                     call 0x10084560
10090e44  8b5778                         mov edx, dword ptr [edi + 0x78]
10090e47  8b7768                         mov esi, dword ptr [edi + 0x68]
10090e4a  8b4f50                         mov ecx, dword ptr [edi + 0x50]
10090e4d  8b9f84000000                   mov ebx, dword ptr [edi + 0x84]
10090e53  8b425c                         mov eax, dword ptr [edx + 0x5c]
10090e56  038e80000000                   add ecx, dword ptr [esi + 0x80]
10090e5c  035a58                         add ebx, dword ptr [edx + 0x58]
10090e5f  8945b0                         mov dword ptr [ebp - 0x50], eax
10090e62  03d9                           add ebx, ecx
10090e64  8b477c                         mov eax, dword ptr [edi + 0x7c]
10090e67  894da4                         mov dword ptr [ebp - 0x5c], ecx
10090e6a  ff75a8                         push dword ptr [ebp - 0x58]
10090e6d  8b4858                         mov ecx, dword ptr [eax + 0x58]
10090e70  8b405c                         mov eax, dword ptr [eax + 0x5c]
10090e73  8945b0                         mov dword ptr [ebp - 0x50], eax
10090e76  8b8780000000                   mov eax, dword ptr [edi + 0x80]
10090e7c  8b7858                         mov edi, dword ptr [eax + 0x58]
10090e7f  8b405c                         mov eax, dword ptr [eax + 0x5c]
10090e82  2bf9                           sub edi, ecx
10090e84  8945b0                         mov dword ptr [ebp - 0x50], eax
10090e87  03fb                           add edi, ebx
10090e89  8b467c                         mov eax, dword ptr [esi + 0x7c]
10090e8c  3bdf                           cmp ebx, edi
10090e8e  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
10090e91  8945b8                         mov dword ptr [ebp - 0x48], eax
10090e94  0f4ffb                         cmovg edi, ebx
10090e97  8b45a4                         mov eax, dword ptr [ebp - 0x5c]
10090e9a  898280000000                   mov dword ptr [edx + 0x80], eax
10090ea0  8b8688000000                   mov eax, dword ptr [esi + 0x88]
10090ea6  8b4e78                         mov ecx, dword ptr [esi + 0x78]
10090ea9  99                             cdq 
10090eaa  2bc2                           sub eax, edx
10090eac  d1f8                           sar eax, 1
10090eae  2b4154                         sub eax, dword ptr [ecx + 0x54]
10090eb1  0345b8                         add eax, dword ptr [ebp - 0x48]
10090eb4  89417c                         mov dword ptr [ecx + 0x7c], eax
10090eb7  8b4e78                         mov ecx, dword ptr [esi + 0x78]
10090eba  8b01                           mov eax, dword ptr [ecx]
10090ebc  ff5004                         call dword ptr [eax + 4]
10090ebf  8b467c                         mov eax, dword ptr [esi + 0x7c]
10090ec2  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
10090ec5  89b880000000                   mov dword ptr [eax + 0x80], edi
10090ecb  8bfe                           mov edi, esi
10090ecd  8b8788000000                   mov eax, dword ptr [edi + 0x88]
10090ed3  8b777c                         mov esi, dword ptr [edi + 0x7c]
10090ed6  99                             cdq 
10090ed7  2bc2                           sub eax, edx
10090ed9  d1f8                           sar eax, 1
10090edb  2bc8                           sub ecx, eax
10090edd  2b4e5c                         sub ecx, dword ptr [esi + 0x5c]
10090ee0  2b4e54                         sub ecx, dword ptr [esi + 0x54]
10090ee3  894e7c                         mov dword ptr [esi + 0x7c], ecx
10090ee6  8b4f7c                         mov ecx, dword ptr [edi + 0x7c]
10090ee9  8b75a8                         mov esi, dword ptr [ebp - 0x58]
10090eec  56                             push esi
10090eed  8b01                           mov eax, dword ptr [ecx]
10090eef  ff5004                         call dword ptr [eax + 4]
10090ef2  8b8780000000                   mov eax, dword ptr [edi + 0x80]
10090ef8  56                             push esi
10090ef9  899880000000                   mov dword ptr [eax + 0x80], ebx
10090eff  8b8788000000                   mov eax, dword ptr [edi + 0x88]
10090f05  8b8f80000000                   mov ecx, dword ptr [edi + 0x80]
10090f0b  8b5db8                         mov ebx, dword ptr [ebp - 0x48]
10090f0e  99                             cdq 
10090f0f  2bc2                           sub eax, edx
10090f11  d1f8                           sar eax, 1
10090f13  2b4154                         sub eax, dword ptr [ecx + 0x54]
10090f16  03c3                           add eax, ebx
10090f18  89417c                         mov dword ptr [ecx + 0x7c], eax
10090f1b  8b8f80000000                   mov ecx, dword ptr [edi + 0x80]
10090f21  8b01                           mov eax, dword ptr [ecx]
10090f23  ff5004                         call dword ptr [eax + 4]
10090f26  8b7774                         mov esi, dword ptr [edi + 0x74]
10090f29  397da8                         cmp dword ptr [ebp - 0x58], edi
10090f2c  0f858f000000                   jne 0x10090fc1
10090f32  8b4754                         mov eax, dword ptr [edi + 0x54]
10090f35  8b4f58                         mov ecx, dword ptr [edi + 0x58]
10090f38  03c3                           add eax, ebx
10090f3a  83be8008000001                 cmp dword ptr [esi + 0x880], 1
10090f41  894db8                         mov dword ptr [ebp - 0x48], ecx
10090f44  8b4f5c                         mov ecx, dword ptr [edi + 0x5c]
10090f47  894da8                         mov dword ptr [ebp - 0x58], ecx
10090f4a  8945b0                         mov dword ptr [ebp - 0x50], eax
10090f4d  7472                           je 0x10090fc1
10090f4f  833e00                         cmp dword ptr [esi], 0
10090f52  746d                           je 0x10090fc1
10090f54  8d4dbc                         lea ecx, [ebp - 0x44]
10090f57  ff15f0fe0d10                   call dword ptr [0x100dfef0]
10090f5d  6a01                           push 1
10090f5f  8d4dbc                         lea ecx, [ebp - 0x44]
10090f62  c745fc00000000                 mov dword ptr [ebp - 4], 0
10090f69  ff1550ff0d10                   call dword ptr [0x100dff50]
10090f6f  6a01                           push 1
10090f71  8d4dbc                         lea ecx, [ebp - 0x44]
10090f74  ff1514fe0d10                   call dword ptr [0x100dfe14]
10090f7a  68ff000000                     push 0xff
10090f7f  8d4dbc                         lea ecx, [ebp - 0x44]
10090f82  ff1510fe0d10                   call dword ptr [0x100dfe10]
10090f88  8b0e                           mov ecx, dword ptr [esi]
10090f8a  8d45bc                         lea eax, [ebp - 0x44]
10090f8d  50                             push eax
10090f8e  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
10090f94  8b45a4                         mov eax, dword ptr [ebp - 0x5c]
10090f97  8d4dbc                         lea ecx, [ebp - 0x44]
10090f9a  898670080000                   mov dword ptr [esi + 0x870], eax
10090fa0  8b45b0                         mov eax, dword ptr [ebp - 0x50]
10090fa3  898674080000                   mov dword ptr [esi + 0x874], eax
10090fa9  8b45a8                         mov eax, dword ptr [ebp - 0x58]
10090fac  89867c080000                   mov dword ptr [esi + 0x87c], eax
10090fb2  8b45b8                         mov eax, dword ptr [ebp - 0x48]
10090fb5  898678080000                   mov dword ptr [esi + 0x878], eax
10090fbb  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
10090fc1  8b45a4                         mov eax, dword ptr [ebp - 0x5c]
10090fc4  894748                         mov dword ptr [edi + 0x48], eax
10090fc7  8b4754                         mov eax, dword ptr [edi + 0x54]
10090fca  03c3                           add eax, ebx
10090fcc  89474c                         mov dword ptr [edi + 0x4c], eax
10090fcf  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
10090fd2  64890d00000000                 mov dword ptr fs:[0], ecx
10090fd9  59                             pop ecx
10090fda  5f                             pop edi
10090fdb  5e                             pop esi
10090fdc  5b                             pop ebx
10090fdd  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
10090fe0  33cd                           xor ecx, ebp
10090fe2  e870190100                     call 0x100a2957
10090fe7  8be5                           mov esp, ebp
10090fe9  5d                             pop ebp
10090fea  c20400                         ret 4
10090fed  cc                             int3 
10090fee  cc                             int3 
10090fef  cc                             int3 
