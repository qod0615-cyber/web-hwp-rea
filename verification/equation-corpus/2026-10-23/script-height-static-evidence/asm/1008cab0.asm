; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008cab0 <= VA < 0x1008cd10 (next decompiler entry; may include padding/thunks)
1008cab0  55                             push ebp
1008cab1  8bec                           mov ebp, esp
1008cab3  6aff                           push -1
1008cab5  68c9c40a10                     push 0x100ac4c9
1008caba  64a100000000                   mov eax, dword ptr fs:[0]
1008cac0  50                             push eax
1008cac1  83ec4c                         sub esp, 0x4c
1008cac4  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008cac9  33c5                           xor eax, ebp
1008cacb  8945f0                         mov dword ptr [ebp - 0x10], eax
1008cace  53                             push ebx
1008cacf  56                             push esi
1008cad0  57                             push edi
1008cad1  50                             push eax
1008cad2  8d45f4                         lea eax, [ebp - 0xc]
1008cad5  64a300000000                   mov dword ptr fs:[0], eax
1008cadb  8bf1                           mov esi, ecx
1008cadd  8975b8                         mov dword ptr [ebp - 0x48], esi
1008cae0  8b4508                         mov eax, dword ptr [ebp + 8]
1008cae3  8b5e74                         mov ebx, dword ptr [esi + 0x74]
1008cae6  6a64                           push 0x64
1008cae8  ffb69c000000                   push dword ptr [esi + 0x9c]
1008caee  8945b0                         mov dword ptr [ebp - 0x50], eax
1008caf1  ff7608                         push dword ptr [esi + 8]
1008caf4  895db4                         mov dword ptr [ebp - 0x4c], ebx
1008caf7  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008cafd  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1008cb04  8d8b58080000                   lea ecx, [ebx + 0x858]
1008cb0a  7202                           jb 0x1008cb0e
1008cb0c  8b09                           mov ecx, dword ptr [ecx]
1008cb0e  51                             push ecx
1008cb0f  50                             push eax
1008cb10  8bcb                           mov ecx, ebx
1008cb12  e8497affff                     call 0x10084560
1008cb17  8b86a0000000                   mov eax, dword ptr [esi + 0xa0]
1008cb1d  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1008cb20  8b7e68                         mov edi, dword ptr [esi + 0x68]
1008cb23  99                             cdq 
1008cb24  2bc2                           sub eax, edx
1008cb26  894dac                         mov dword ptr [ebp - 0x54], ecx
1008cb29  8bc8                           mov ecx, eax
1008cb2b  8b4658                         mov eax, dword ptr [esi + 0x58]
1008cb2e  99                             cdq 
1008cb2f  2bc2                           sub eax, edx
1008cb31  d1f9                           sar ecx, 1
1008cb33  8bd8                           mov ebx, eax
1008cb35  d1fb                           sar ebx, 1
1008cb37  2bd9                           sub ebx, ecx
1008cb39  035e50                         add ebx, dword ptr [esi + 0x50]
1008cb3c  8bb6a4000000                   mov esi, dword ptr [esi + 0xa4]
1008cb42  8bc6                           mov eax, esi
1008cb44  039f80000000                   add ebx, dword ptr [edi + 0x80]
1008cb4a  8b7f7c                         mov edi, dword ptr [edi + 0x7c]
1008cb4d  99                             cdq 
1008cb4e  2bc2                           sub eax, edx
1008cb50  d1f8                           sar eax, 1
1008cb52  2bf8                           sub edi, eax
1008cb54  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008cb57  0fb78098000000                 movzx eax, word ptr [eax + 0x98]
1008cb5e  50                             push eax
1008cb5f  6a64                           push 0x64
1008cb61  6a0a                           push 0xa
1008cb63  56                             push esi
1008cb64  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008cb6a  8b4db4                         mov ecx, dword ptr [ebp - 0x4c]
1008cb6d  2bf8                           sub edi, eax
1008cb6f  57                             push edi
1008cb70  53                             push ebx
1008cb71  e8ba7dffff                     call 0x10084930
1008cb76  8b55b8                         mov edx, dword ptr [ebp - 0x48]
1008cb79  ff75b0                         push dword ptr [ebp - 0x50]
1008cb7c  8b7268                         mov esi, dword ptr [edx + 0x68]
1008cb7f  8b4a5c                         mov ecx, dword ptr [edx + 0x5c]
1008cb82  8b4258                         mov eax, dword ptr [edx + 0x58]
1008cb85  894dac                         mov dword ptr [ebp - 0x54], ecx
1008cb88  8b9e80000000                   mov ebx, dword ptr [esi + 0x80]
1008cb8e  035a50                         add ebx, dword ptr [edx + 0x50]
1008cb91  99                             cdq 
1008cb92  2bc2                           sub eax, edx
1008cb94  895db4                         mov dword ptr [ebp - 0x4c], ebx
1008cb97  8bf8                           mov edi, eax
1008cb99  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008cb9c  d1ff                           sar edi, 1
1008cb9e  03fb                           add edi, ebx
1008cba0  8b5e7c                         mov ebx, dword ptr [esi + 0x7c]
1008cba3  8b7078                         mov esi, dword ptr [eax + 0x78]
1008cba6  8b4658                         mov eax, dword ptr [esi + 0x58]
1008cba9  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1008cbac  99                             cdq 
1008cbad  2bc2                           sub eax, edx
1008cbaf  894dac                         mov dword ptr [ebp - 0x54], ecx
1008cbb2  d1f8                           sar eax, 1
1008cbb4  8bcf                           mov ecx, edi
1008cbb6  2bc8                           sub ecx, eax
1008cbb8  898e80000000                   mov dword ptr [esi + 0x80], ecx
1008cbbe  8b75b8                         mov esi, dword ptr [ebp - 0x48]
1008cbc1  8b86a4000000                   mov eax, dword ptr [esi + 0xa4]
1008cbc7  8b4e78                         mov ecx, dword ptr [esi + 0x78]
1008cbca  99                             cdq 
1008cbcb  2bc2                           sub eax, edx
1008cbcd  d1f8                           sar eax, 1
1008cbcf  2b4154                         sub eax, dword ptr [ecx + 0x54]
1008cbd2  03c3                           add eax, ebx
1008cbd4  89417c                         mov dword ptr [ecx + 0x7c], eax
1008cbd7  8b4e78                         mov ecx, dword ptr [esi + 0x78]
1008cbda  8b01                           mov eax, dword ptr [ecx]
1008cbdc  ff5004                         call dword ptr [eax + 4]
1008cbdf  8b767c                         mov esi, dword ptr [esi + 0x7c]
1008cbe2  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1008cbe5  8b4658                         mov eax, dword ptr [esi + 0x58]
1008cbe8  894dac                         mov dword ptr [ebp - 0x54], ecx
1008cbeb  99                             cdq 
1008cbec  2bc2                           sub eax, edx
1008cbee  d1f8                           sar eax, 1
1008cbf0  2bf8                           sub edi, eax
1008cbf2  89be80000000                   mov dword ptr [esi + 0x80], edi
1008cbf8  8b75b8                         mov esi, dword ptr [ebp - 0x48]
1008cbfb  8b86a4000000                   mov eax, dword ptr [esi + 0xa4]
1008cc01  8b4e7c                         mov ecx, dword ptr [esi + 0x7c]
1008cc04  99                             cdq 
1008cc05  2bc2                           sub eax, edx
1008cc07  d1f8                           sar eax, 1
1008cc09  2bd8                           sub ebx, eax
1008cc0b  2b595c                         sub ebx, dword ptr [ecx + 0x5c]
1008cc0e  2b5954                         sub ebx, dword ptr [ecx + 0x54]
1008cc11  89597c                         mov dword ptr [ecx + 0x7c], ebx
1008cc14  8b4e7c                         mov ecx, dword ptr [esi + 0x7c]
1008cc17  8b5db0                         mov ebx, dword ptr [ebp - 0x50]
1008cc1a  53                             push ebx
1008cc1b  8b01                           mov eax, dword ptr [ecx]
1008cc1d  ff5004                         call dword ptr [eax + 4]
1008cc20  8b7e74                         mov edi, dword ptr [esi + 0x74]
1008cc23  83bf6c08000008                 cmp dword ptr [edi + 0x86c], 8
1008cc2a  8d8758080000                   lea eax, [edi + 0x858]
1008cc30  7202                           jb 0x1008cc34
1008cc32  8b00                           mov eax, dword ptr [eax]
1008cc34  50                             push eax
1008cc35  ff7608                         push dword ptr [esi + 8]
1008cc38  8bcf                           mov ecx, edi
1008cc3a  e82179ffff                     call 0x10084560
1008cc3f  3bde                           cmp ebx, esi
1008cc41  0f8597000000                   jne 0x1008ccde
1008cc47  8b4668                         mov eax, dword ptr [esi + 0x68]
1008cc4a  8b5658                         mov edx, dword ptr [esi + 0x58]
1008cc4d  8955ac                         mov dword ptr [ebp - 0x54], edx
1008cc50  8b565c                         mov edx, dword ptr [esi + 0x5c]
1008cc53  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1008cc56  8b4654                         mov eax, dword ptr [esi + 0x54]
1008cc59  03c1                           add eax, ecx
1008cc5b  8955b8                         mov dword ptr [ebp - 0x48], edx
1008cc5e  83bf8008000001                 cmp dword ptr [edi + 0x880], 1
1008cc65  8945b0                         mov dword ptr [ebp - 0x50], eax
1008cc68  7474                           je 0x1008ccde
1008cc6a  833f00                         cmp dword ptr [edi], 0
1008cc6d  746f                           je 0x1008ccde
1008cc6f  8d4dbc                         lea ecx, [ebp - 0x44]
1008cc72  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008cc78  6a01                           push 1
1008cc7a  8d4dbc                         lea ecx, [ebp - 0x44]
1008cc7d  c745fc00000000                 mov dword ptr [ebp - 4], 0
1008cc84  ff1550ff0d10                   call dword ptr [0x100dff50]
1008cc8a  6a01                           push 1
1008cc8c  8d4dbc                         lea ecx, [ebp - 0x44]
1008cc8f  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008cc95  68ff000000                     push 0xff
1008cc9a  8d4dbc                         lea ecx, [ebp - 0x44]
1008cc9d  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008cca3  8b0f                           mov ecx, dword ptr [edi]
1008cca5  8d45bc                         lea eax, [ebp - 0x44]
1008cca8  50                             push eax
1008cca9  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008ccaf  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1008ccb2  8d4dbc                         lea ecx, [ebp - 0x44]
1008ccb5  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1008ccb8  898774080000                   mov dword ptr [edi + 0x874], eax
1008ccbe  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008ccc1  89877c080000                   mov dword ptr [edi + 0x87c], eax
1008ccc7  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1008ccca  899f70080000                   mov dword ptr [edi + 0x870], ebx
1008ccd0  898778080000                   mov dword ptr [edi + 0x878], eax
1008ccd6  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1008ccdc  eb03                           jmp 0x1008cce1
1008ccde  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1008cce1  8b4668                         mov eax, dword ptr [esi + 0x68]
1008cce4  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1008cce7  8b4654                         mov eax, dword ptr [esi + 0x54]
1008ccea  03c1                           add eax, ecx
1008ccec  895e48                         mov dword ptr [esi + 0x48], ebx
1008ccef  89464c                         mov dword ptr [esi + 0x4c], eax
1008ccf2  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1008ccf5  64890d00000000                 mov dword ptr fs:[0], ecx
1008ccfc  59                             pop ecx
1008ccfd  5f                             pop edi
1008ccfe  5e                             pop esi
1008ccff  5b                             pop ebx
1008cd00  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1008cd03  33cd                           xor ecx, ebp
1008cd05  e84d5c0100                     call 0x100a2957
1008cd0a  8be5                           mov esp, ebp
1008cd0c  5d                             pop ebp
1008cd0d  c20400                         ret 4
