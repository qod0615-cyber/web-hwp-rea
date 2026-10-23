; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10091bf0 <= VA < 0x10091e50 (next decompiler entry; may include padding/thunks)
10091bf0  55                             push ebp
10091bf1  8bec                           mov ebp, esp
10091bf3  6aff                           push -1
10091bf5  68a9c80a10                     push 0x100ac8a9
10091bfa  64a100000000                   mov eax, dword ptr fs:[0]
10091c00  50                             push eax
10091c01  83ec48                         sub esp, 0x48
10091c04  a10c100d10                     mov eax, dword ptr [0x100d100c]
10091c09  33c5                           xor eax, ebp
10091c0b  8945f0                         mov dword ptr [ebp - 0x10], eax
10091c0e  53                             push ebx
10091c0f  56                             push esi
10091c10  57                             push edi
10091c11  50                             push eax
10091c12  8d45f4                         lea eax, [ebp - 0xc]
10091c15  64a300000000                   mov dword ptr fs:[0], eax
10091c1b  8bf1                           mov esi, ecx
10091c1d  8b16                           mov edx, dword ptr [esi]
10091c1f  8b7d08                         mov edi, dword ptr [ebp + 8]
10091c22  897db4                         mov dword ptr [ebp - 0x4c], edi
10091c25  8b4210                         mov eax, dword ptr [edx + 0x10]
10091c28  81fac8f80b10                   cmp edx, 0x100bf8c8
10091c2e  0f85f3010000                   jne 0x10091e27
10091c34  8b4668                         mov eax, dword ptr [esi + 0x68]
10091c37  8b9880000000                   mov ebx, dword ptr [eax + 0x80]
10091c3d  035e50                         add ebx, dword ptr [esi + 0x50]
10091c40  81fac8f80b10                   cmp edx, 0x100bf8c8
10091c46  0f85e4010000                   jne 0x10091e30
10091c4c  8b4668                         mov eax, dword ptr [esi + 0x68]
10091c4f  8b487c                         mov ecx, dword ptr [eax + 0x7c]
10091c52  8b4678                         mov eax, dword ptr [esi + 0x78]
10091c55  894db0                         mov dword ptr [ebp - 0x50], ecx
10091c58  8b4054                         mov eax, dword ptr [eax + 0x54]
10091c5b  03c8                           add ecx, eax
10091c5d  8b8688000000                   mov eax, dword ptr [esi + 0x88]
10091c63  894db8                         mov dword ptr [ebp - 0x48], ecx
10091c66  89580c                         mov dword ptr [eax + 0xc], ebx
10091c69  894808                         mov dword ptr [eax + 8], ecx
10091c6c  8b8e88000000                   mov ecx, dword ptr [esi + 0x88]
10091c72  e8b9fb0000                     call 0x100a1830
10091c77  8b8e88000000                   mov ecx, dword ptr [esi + 0x88]
10091c7d  8b4104                         mov eax, dword ptr [ecx + 4]
10091c80  83f813                         cmp eax, 0x13
10091c83  740f                           je 0x10091c94
10091c85  83f804                         cmp eax, 4
10091c88  740a                           je 0x10091c94
10091c8a  83f80c                         cmp eax, 0xc
10091c8d  7405                           je 0x10091c94
10091c8f  8b4944                         mov ecx, dword ptr [ecx + 0x44]
10091c92  eb14                           jmp 0x10091ca8
10091c94  8b4110                         mov eax, dword ptr [ecx + 0x10]
10091c97  8b4944                         mov ecx, dword ptr [ecx + 0x44]
10091c9a  99                             cdq 
10091c9b  83e203                         and edx, 3
10091c9e  03c2                           add eax, edx
10091ca0  c1f802                         sar eax, 2
10091ca3  3bc8                           cmp ecx, eax
10091ca5  0f4ec8                         cmovle ecx, eax
10091ca8  8b4678                         mov eax, dword ptr [esi + 0x78]
10091cab  03cb                           add ecx, ebx
10091cad  57                             push edi
10091cae  898880000000                   mov dword ptr [eax + 0x80], ecx
10091cb4  8b4678                         mov eax, dword ptr [esi + 0x78]
10091cb7  8b4db0                         mov ecx, dword ptr [ebp - 0x50]
10091cba  89487c                         mov dword ptr [eax + 0x7c], ecx
10091cbd  8b4e78                         mov ecx, dword ptr [esi + 0x78]
10091cc0  8b01                           mov eax, dword ptr [ecx]
10091cc2  ff5004                         call dword ptr [eax + 4]
10091cc5  8b8e88000000                   mov ecx, dword ptr [esi + 0x88]
10091ccb  8b4104                         mov eax, dword ptr [ecx + 4]
10091cce  83f813                         cmp eax, 0x13
10091cd1  740f                           je 0x10091ce2
10091cd3  83f804                         cmp eax, 4
10091cd6  740a                           je 0x10091ce2
10091cd8  83f80c                         cmp eax, 0xc
10091cdb  7405                           je 0x10091ce2
10091cdd  8b5144                         mov edx, dword ptr [ecx + 0x44]
10091ce0  eb14                           jmp 0x10091cf6
10091ce2  8b4110                         mov eax, dword ptr [ecx + 0x10]
10091ce5  99                             cdq 
10091ce6  83e203                         and edx, 3
10091ce9  03c2                           add eax, edx
10091ceb  8b5144                         mov edx, dword ptr [ecx + 0x44]
10091cee  c1f802                         sar eax, 2
10091cf1  3bd0                           cmp edx, eax
10091cf3  0f4ed0                         cmovle edx, eax
10091cf6  8b4678                         mov eax, dword ptr [esi + 0x78]
10091cf9  8b4858                         mov ecx, dword ptr [eax + 0x58]
10091cfc  8b405c                         mov eax, dword ptr [eax + 0x5c]
10091cff  03ca                           add ecx, edx
10091d01  8945b0                         mov dword ptr [ebp - 0x50], eax
10091d04  03cb                           add ecx, ebx
10091d06  8b868c000000                   mov eax, dword ptr [esi + 0x8c]
10091d0c  89480c                         mov dword ptr [eax + 0xc], ecx
10091d0f  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
10091d12  894808                         mov dword ptr [eax + 8], ecx
10091d15  8b8e8c000000                   mov ecx, dword ptr [esi + 0x8c]
10091d1b  e810fb0000                     call 0x100a1830
10091d20  8b7e74                         mov edi, dword ptr [esi + 0x74]
10091d23  83bf6c08000008                 cmp dword ptr [edi + 0x86c], 8
10091d2a  8d8758080000                   lea eax, [edi + 0x858]
10091d30  7202                           jb 0x10091d34
10091d32  8b00                           mov eax, dword ptr [eax]
10091d34  50                             push eax
10091d35  ff7608                         push dword ptr [esi + 8]
10091d38  8bcf                           mov ecx, edi
10091d3a  e82128ffff                     call 0x10084560
10091d3f  3975b4                         cmp dword ptr [ebp - 0x4c], esi
10091d42  0f85a7000000                   jne 0x10091def
10091d48  8b06                           mov eax, dword ptr [esi]
10091d4a  8b5010                         mov edx, dword ptr [eax + 0x10]
10091d4d  3dc8f80b10                     cmp eax, 0x100bf8c8
10091d52  0f85e2000000                   jne 0x10091e3a
10091d58  8b4668                         mov eax, dword ptr [esi + 0x68]
10091d5b  8b407c                         mov eax, dword ptr [eax + 0x7c]
10091d5e  8b5658                         mov edx, dword ptr [esi + 0x58]
10091d61  034654                         add eax, dword ptr [esi + 0x54]
10091d64  83bf8008000001                 cmp dword ptr [edi + 0x880], 1
10091d6b  8955b0                         mov dword ptr [ebp - 0x50], edx
10091d6e  8b565c                         mov edx, dword ptr [esi + 0x5c]
10091d71  8955b8                         mov dword ptr [ebp - 0x48], edx
10091d74  8945b4                         mov dword ptr [ebp - 0x4c], eax
10091d77  7476                           je 0x10091def
10091d79  833f00                         cmp dword ptr [edi], 0
10091d7c  7471                           je 0x10091def
10091d7e  8d4dbc                         lea ecx, [ebp - 0x44]
10091d81  ff15f0fe0d10                   call dword ptr [0x100dfef0]
10091d87  6a01                           push 1
10091d89  8d4dbc                         lea ecx, [ebp - 0x44]
10091d8c  c745fc00000000                 mov dword ptr [ebp - 4], 0
10091d93  ff1550ff0d10                   call dword ptr [0x100dff50]
10091d99  6a01                           push 1
10091d9b  8d4dbc                         lea ecx, [ebp - 0x44]
10091d9e  ff1514fe0d10                   call dword ptr [0x100dfe14]
10091da4  68ff000000                     push 0xff
10091da9  8d4dbc                         lea ecx, [ebp - 0x44]
10091dac  ff1510fe0d10                   call dword ptr [0x100dfe10]
10091db2  8b0f                           mov ecx, dword ptr [edi]
10091db4  8d45bc                         lea eax, [ebp - 0x44]
10091db7  50                             push eax
10091db8  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
10091dbe  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
10091dc1  8d4dbc                         lea ecx, [ebp - 0x44]
10091dc4  898774080000                   mov dword ptr [edi + 0x874], eax
10091dca  8b45b8                         mov eax, dword ptr [ebp - 0x48]
10091dcd  89877c080000                   mov dword ptr [edi + 0x87c], eax
10091dd3  8b45b0                         mov eax, dword ptr [ebp - 0x50]
10091dd6  899f70080000                   mov dword ptr [edi + 0x870], ebx
10091ddc  898778080000                   mov dword ptr [edi + 0x878], eax
10091de2  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
10091de9  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
10091def  8b06                           mov eax, dword ptr [esi]
10091df1  3dc8f80b10                     cmp eax, 0x100bf8c8
10091df6  754b                           jne 0x10091e43
10091df8  8b4668                         mov eax, dword ptr [esi + 0x68]
10091dfb  8b487c                         mov ecx, dword ptr [eax + 0x7c]
10091dfe  8b4654                         mov eax, dword ptr [esi + 0x54]
10091e01  03c1                           add eax, ecx
10091e03  895e48                         mov dword ptr [esi + 0x48], ebx
10091e06  89464c                         mov dword ptr [esi + 0x4c], eax
10091e09  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
10091e0c  64890d00000000                 mov dword ptr fs:[0], ecx
10091e13  59                             pop ecx
10091e14  5f                             pop edi
10091e15  5e                             pop esi
10091e16  5b                             pop ebx
10091e17  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
10091e1a  33cd                           xor ecx, ebp
10091e1c  e8360b0100                     call 0x100a2957
10091e21  8be5                           mov esp, ebp
10091e23  5d                             pop ebp
10091e24  c20400                         ret 4
10091e27  ffd0                           call eax
10091e29  8b16                           mov edx, dword ptr [esi]
10091e2b  e907feffff                     jmp 0x10091c37
10091e30  8bce                           mov ecx, esi
10091e32  ff5210                         call dword ptr [edx + 0x10]
10091e35  e915feffff                     jmp 0x10091c4f
10091e3a  8bce                           mov ecx, esi
10091e3c  ffd2                           call edx
10091e3e  e918ffffff                     jmp 0x10091d5b
10091e43  8bce                           mov ecx, esi
10091e45  ff5010                         call dword ptr [eax + 0x10]
10091e48  ebb1                           jmp 0x10091dfb
10091e4a  cc                             int3 
10091e4b  cc                             int3 
10091e4c  cc                             int3 
10091e4d  cc                             int3 
10091e4e  cc                             int3 
10091e4f  cc                             int3 
