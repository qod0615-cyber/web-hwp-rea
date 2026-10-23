; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008c350 <= VA < 0x1008c580 (next decompiler entry; may include padding/thunks)
1008c350  55                             push ebp
1008c351  8bec                           mov ebp, esp
1008c353  6aff                           push -1
1008c355  6849c40a10                     push 0x100ac449
1008c35a  64a100000000                   mov eax, dword ptr fs:[0]
1008c360  50                             push eax
1008c361  83ec50                         sub esp, 0x50
1008c364  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008c369  33c5                           xor eax, ebp
1008c36b  8945f0                         mov dword ptr [ebp - 0x10], eax
1008c36e  53                             push ebx
1008c36f  56                             push esi
1008c370  57                             push edi
1008c371  50                             push eax
1008c372  8d45f4                         lea eax, [ebp - 0xc]
1008c375  64a300000000                   mov dword ptr fs:[0], eax
1008c37b  8bf9                           mov edi, ecx
1008c37d  897db4                         mov dword ptr [ebp - 0x4c], edi
1008c380  8b7768                         mov esi, dword ptr [edi + 0x68]
1008c383  8b4508                         mov eax, dword ptr [ebp + 8]
1008c386  8b5f74                         mov ebx, dword ptr [edi + 0x74]
1008c389  8945b8                         mov dword ptr [ebp - 0x48], eax
1008c38c  8b4750                         mov eax, dword ptr [edi + 0x50]
1008c38f  038680000000                   add eax, dword ptr [esi + 0x80]
1008c395  8b767c                         mov esi, dword ptr [esi + 0x7c]
1008c398  8945b0                         mov dword ptr [ebp - 0x50], eax
1008c39b  8b87a8000000                   mov eax, dword ptr [edi + 0xa8]
1008c3a1  6a64                           push 0x64
1008c3a3  ffb7a0000000                   push dword ptr [edi + 0xa0]
1008c3a9  99                             cdq 
1008c3aa  ff7708                         push dword ptr [edi + 8]
1008c3ad  2bc2                           sub eax, edx
1008c3af  d1f8                           sar eax, 1
1008c3b1  2bf0                           sub esi, eax
1008c3b3  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008c3b9  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1008c3c0  8d9358080000                   lea edx, [ebx + 0x858]
1008c3c6  7202                           jb 0x1008c3ca
1008c3c8  8b12                           mov edx, dword ptr [edx]
1008c3ca  52                             push edx
1008c3cb  50                             push eax
1008c3cc  8bcb                           mov ecx, ebx
1008c3ce  e88d81ffff                     call 0x10084560
1008c3d3  0fb7879c000000                 movzx eax, word ptr [edi + 0x9c]
1008c3da  8bcb                           mov ecx, ebx
1008c3dc  50                             push eax
1008c3dd  56                             push esi
1008c3de  ff75b0                         push dword ptr [ebp - 0x50]
1008c3e1  e84a85ffff                     call 0x10084930
1008c3e6  8b5768                         mov edx, dword ptr [edi + 0x68]
1008c3e9  8b9fa4000000                   mov ebx, dword ptr [edi + 0xa4]
1008c3ef  8b8fac000000                   mov ecx, dword ptr [edi + 0xac]
1008c3f5  ff75b8                         push dword ptr [ebp - 0x48]
1008c3f8  8b8280000000                   mov eax, dword ptr [edx + 0x80]
1008c3fe  034750                         add eax, dword ptr [edi + 0x50]
1008c401  8b727c                         mov esi, dword ptr [edx + 0x7c]
1008c404  03d8                           add ebx, eax
1008c406  8945b0                         mov dword ptr [ebp - 0x50], eax
1008c409  03cb                           add ecx, ebx
1008c40b  8b4778                         mov eax, dword ptr [edi + 0x78]
1008c40e  8975ac                         mov dword ptr [ebp - 0x54], esi
1008c411  898880000000                   mov dword ptr [eax + 0x80], ecx
1008c417  8b4778                         mov eax, dword ptr [edi + 0x78]
1008c41a  8b8fb8000000                   mov ecx, dword ptr [edi + 0xb8]
1008c420  03ce                           add ecx, esi
1008c422  89487c                         mov dword ptr [eax + 0x7c], ecx
1008c425  8b4f78                         mov ecx, dword ptr [edi + 0x78]
1008c428  8b01                           mov eax, dword ptr [ecx]
1008c42a  ff5004                         call dword ptr [eax + 4]
1008c42d  8b477c                         mov eax, dword ptr [edi + 0x7c]
1008c430  8b8fb0000000                   mov ecx, dword ptr [edi + 0xb0]
1008c436  ff75b8                         push dword ptr [ebp - 0x48]
1008c439  03cb                           add ecx, ebx
1008c43b  898880000000                   mov dword ptr [eax + 0x80], ecx
1008c441  8b477c                         mov eax, dword ptr [edi + 0x7c]
1008c444  8b8fbc000000                   mov ecx, dword ptr [edi + 0xbc]
1008c44a  03ce                           add ecx, esi
1008c44c  89487c                         mov dword ptr [eax + 0x7c], ecx
1008c44f  8b4f7c                         mov ecx, dword ptr [edi + 0x7c]
1008c452  8b01                           mov eax, dword ptr [ecx]
1008c454  ff5004                         call dword ptr [eax + 4]
1008c457  8b4778                         mov eax, dword ptr [edi + 0x78]
1008c45a  8b55b4                         mov edx, dword ptr [ebp - 0x4c]
1008c45d  8bbfac000000                   mov edi, dword ptr [edi + 0xac]
1008c463  ff75b8                         push dword ptr [ebp - 0x48]
1008c466  8b4858                         mov ecx, dword ptr [eax + 0x58]
1008c469  03f9                           add edi, ecx
1008c46b  8b427c                         mov eax, dword ptr [edx + 0x7c]
1008c46e  8b92b0000000                   mov edx, dword ptr [edx + 0xb0]
1008c474  8d341f                         lea esi, [edi + ebx]
1008c477  8b4858                         mov ecx, dword ptr [eax + 0x58]
1008c47a  03d1                           add edx, ecx
1008c47c  8d041a                         lea eax, [edx + ebx]
1008c47f  3bf0                           cmp esi, eax
1008c481  0f4fd7                         cmovg edx, edi
1008c484  8b7dac                         mov edi, dword ptr [ebp - 0x54]
1008c487  03d3                           add edx, ebx
1008c489  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1008c48c  8b8380000000                   mov eax, dword ptr [ebx + 0x80]
1008c492  8b8bb4000000                   mov ecx, dword ptr [ebx + 0xb4]
1008c498  03ca                           add ecx, edx
1008c49a  898880000000                   mov dword ptr [eax + 0x80], ecx
1008c4a0  8b8380000000                   mov eax, dword ptr [ebx + 0x80]
1008c4a6  89787c                         mov dword ptr [eax + 0x7c], edi
1008c4a9  8b8b80000000                   mov ecx, dword ptr [ebx + 0x80]
1008c4af  8b01                           mov eax, dword ptr [ecx]
1008c4b1  ff5004                         call dword ptr [eax + 4]
1008c4b4  8b7374                         mov esi, dword ptr [ebx + 0x74]
1008c4b7  395db8                         cmp dword ptr [ebp - 0x48], ebx
1008c4ba  0f858f000000                   jne 0x1008c54f
1008c4c0  8b4354                         mov eax, dword ptr [ebx + 0x54]
1008c4c3  8b4b58                         mov ecx, dword ptr [ebx + 0x58]
1008c4c6  03c7                           add eax, edi
1008c4c8  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1008c4cf  894db8                         mov dword ptr [ebp - 0x48], ecx
1008c4d2  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1008c4d5  894db4                         mov dword ptr [ebp - 0x4c], ecx
1008c4d8  8945ac                         mov dword ptr [ebp - 0x54], eax
1008c4db  7472                           je 0x1008c54f
1008c4dd  833e00                         cmp dword ptr [esi], 0
1008c4e0  746d                           je 0x1008c54f
1008c4e2  8d4dbc                         lea ecx, [ebp - 0x44]
1008c4e5  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008c4eb  6a01                           push 1
1008c4ed  8d4dbc                         lea ecx, [ebp - 0x44]
1008c4f0  c745fc00000000                 mov dword ptr [ebp - 4], 0
1008c4f7  ff1550ff0d10                   call dword ptr [0x100dff50]
1008c4fd  6a01                           push 1
1008c4ff  8d4dbc                         lea ecx, [ebp - 0x44]
1008c502  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008c508  68ff000000                     push 0xff
1008c50d  8d4dbc                         lea ecx, [ebp - 0x44]
1008c510  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008c516  8b0e                           mov ecx, dword ptr [esi]
1008c518  8d45bc                         lea eax, [ebp - 0x44]
1008c51b  50                             push eax
1008c51c  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008c522  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1008c525  8d4dbc                         lea ecx, [ebp - 0x44]
1008c528  898670080000                   mov dword ptr [esi + 0x870], eax
1008c52e  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1008c531  898674080000                   mov dword ptr [esi + 0x874], eax
1008c537  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1008c53a  89867c080000                   mov dword ptr [esi + 0x87c], eax
1008c540  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008c543  898678080000                   mov dword ptr [esi + 0x878], eax
1008c549  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1008c54f  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1008c552  894348                         mov dword ptr [ebx + 0x48], eax
1008c555  8b4354                         mov eax, dword ptr [ebx + 0x54]
1008c558  03c7                           add eax, edi
1008c55a  89434c                         mov dword ptr [ebx + 0x4c], eax
1008c55d  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1008c560  64890d00000000                 mov dword ptr fs:[0], ecx
1008c567  59                             pop ecx
1008c568  5f                             pop edi
1008c569  5e                             pop esi
1008c56a  5b                             pop ebx
1008c56b  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1008c56e  33cd                           xor ecx, ebp
1008c570  e8e2630100                     call 0x100a2957
1008c575  8be5                           mov esp, ebp
1008c577  5d                             pop ebp
1008c578  c20400                         ret 4
1008c57b  cc                             int3 
1008c57c  cc                             int3 
1008c57d  cc                             int3 
1008c57e  cc                             int3 
1008c57f  cc                             int3 
