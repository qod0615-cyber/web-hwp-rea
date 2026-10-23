; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009fda0 <= VA < 0x1009ff60 (next decompiler entry; may include padding/thunks)
1009fda0  55                             push ebp
1009fda1  8bec                           mov ebp, esp
1009fda3  6aff                           push -1
1009fda5  6869c70a10                     push 0x100ac769
1009fdaa  64a100000000                   mov eax, dword ptr fs:[0]
1009fdb0  50                             push eax
1009fdb1  83ec44                         sub esp, 0x44
1009fdb4  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009fdb9  33c5                           xor eax, ebp
1009fdbb  8945f0                         mov dword ptr [ebp - 0x10], eax
1009fdbe  53                             push ebx
1009fdbf  56                             push esi
1009fdc0  57                             push edi
1009fdc1  50                             push eax
1009fdc2  8d45f4                         lea eax, [ebp - 0xc]
1009fdc5  64a300000000                   mov dword ptr fs:[0], eax
1009fdcb  8bf1                           mov esi, ecx
1009fdcd  8b4508                         mov eax, dword ptr [ebp + 8]
1009fdd0  8b7e74                         mov edi, dword ptr [esi + 0x74]
1009fdd3  8945b4                         mov dword ptr [ebp - 0x4c], eax
1009fdd6  8b4668                         mov eax, dword ptr [esi + 0x68]
1009fdd9  ff75b4                         push dword ptr [ebp - 0x4c]
1009fddc  8b9880000000                   mov ebx, dword ptr [eax + 0x80]
1009fde2  8b4678                         mov eax, dword ptr [esi + 0x78]
1009fde5  035e50                         add ebx, dword ptr [esi + 0x50]
1009fde8  899880000000                   mov dword ptr [eax + 0x80], ebx
1009fdee  8b4668                         mov eax, dword ptr [esi + 0x68]
1009fdf1  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009fdf4  8b4678                         mov eax, dword ptr [esi + 0x78]
1009fdf7  89487c                         mov dword ptr [eax + 0x7c], ecx
1009fdfa  8b4e78                         mov ecx, dword ptr [esi + 0x78]
1009fdfd  8b01                           mov eax, dword ptr [ecx]
1009fdff  ff5004                         call dword ptr [eax + 4]
1009fe02  8b4678                         mov eax, dword ptr [esi + 0x78]
1009fe05  8b565c                         mov edx, dword ptr [esi + 0x5c]
1009fe08  8b4e58                         mov ecx, dword ptr [esi + 0x58]
1009fe0b  8955b0                         mov dword ptr [ebp - 0x50], edx
1009fe0e  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
1009fe14  8b4064                         mov eax, dword ptr [eax + 0x64]
1009fe17  8378046f                       cmp dword ptr [eax + 4], 0x6f
1009fe1b  7525                           jne 0x1009fe42
1009fe1d  0fb7809c000000                 movzx eax, word ptr [eax + 0x9c]
1009fe24  c745b847e00000                 mov dword ptr [ebp - 0x48], 0xe047
1009fe2b  663b45b8                       cmp ax, word ptr [ebp - 0x48]
1009fe2f  740d                           je 0x1009fe3e
1009fe31  c745b8e5e00000                 mov dword ptr [ebp - 0x48], 0xe0e5
1009fe38  663b45b8                       cmp ax, word ptr [ebp - 0x48]
1009fe3c  7504                           jne 0x1009fe42
1009fe3e  51                             push ecx
1009fe3f  52                             push edx
1009fe40  eb0f                           jmp 0x1009fe51
1009fe42  6a64                           push 0x64
1009fe44  6a78                           push 0x78
1009fe46  51                             push ecx
1009fe47  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009fe4d  50                             push eax
1009fe4e  ff75b0                         push dword ptr [ebp - 0x50]
1009fe51  8bcf                           mov ecx, edi
1009fe53  e87846feff                     call 0x100844d0
1009fe58  8b4668                         mov eax, dword ptr [esi + 0x68]
1009fe5b  6854e00000                     push 0xe054
1009fe60  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009fe63  8b4654                         mov eax, dword ptr [esi + 0x54]
1009fe66  03c1                           add eax, ecx
1009fe68  8bcf                           mov ecx, edi
1009fe6a  50                             push eax
1009fe6b  53                             push ebx
1009fe6c  e8bf4afeff                     call 0x10084930
1009fe71  83bf6c08000008                 cmp dword ptr [edi + 0x86c], 8
1009fe78  8d8758080000                   lea eax, [edi + 0x858]
1009fe7e  7202                           jb 0x1009fe82
1009fe80  8b00                           mov eax, dword ptr [eax]
1009fe82  50                             push eax
1009fe83  ff7608                         push dword ptr [esi + 8]
1009fe86  8bcf                           mov ecx, edi
1009fe88  e8d346feff                     call 0x10084560
1009fe8d  3975b4                         cmp dword ptr [ebp - 0x4c], esi
1009fe90  0f8592000000                   jne 0x1009ff28
1009fe96  8b4668                         mov eax, dword ptr [esi + 0x68]
1009fe99  8b5658                         mov edx, dword ptr [esi + 0x58]
1009fe9c  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009fe9f  8b565c                         mov edx, dword ptr [esi + 0x5c]
1009fea2  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009fea5  8b4654                         mov eax, dword ptr [esi + 0x54]
1009fea8  03c1                           add eax, ecx
1009feaa  8955b8                         mov dword ptr [ebp - 0x48], edx
1009fead  83bf8008000001                 cmp dword ptr [edi + 0x880], 1
1009feb4  8945b0                         mov dword ptr [ebp - 0x50], eax
1009feb7  746f                           je 0x1009ff28
1009feb9  833f00                         cmp dword ptr [edi], 0
1009febc  746a                           je 0x1009ff28
1009febe  8d4dbc                         lea ecx, [ebp - 0x44]
1009fec1  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009fec7  6a01                           push 1
1009fec9  8d4dbc                         lea ecx, [ebp - 0x44]
1009fecc  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009fed3  ff1550ff0d10                   call dword ptr [0x100dff50]
1009fed9  6a01                           push 1
1009fedb  8d4dbc                         lea ecx, [ebp - 0x44]
1009fede  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009fee4  68ff000000                     push 0xff
1009fee9  8d4dbc                         lea ecx, [ebp - 0x44]
1009feec  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009fef2  8b0f                           mov ecx, dword ptr [edi]
1009fef4  8d45bc                         lea eax, [ebp - 0x44]
1009fef7  50                             push eax
1009fef8  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009fefe  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009ff01  8d4dbc                         lea ecx, [ebp - 0x44]
1009ff04  898774080000                   mov dword ptr [edi + 0x874], eax
1009ff0a  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1009ff0d  89877c080000                   mov dword ptr [edi + 0x87c], eax
1009ff13  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009ff16  899f70080000                   mov dword ptr [edi + 0x870], ebx
1009ff1c  898778080000                   mov dword ptr [edi + 0x878], eax
1009ff22  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009ff28  8b4668                         mov eax, dword ptr [esi + 0x68]
1009ff2b  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009ff2e  8b4654                         mov eax, dword ptr [esi + 0x54]
1009ff31  03c1                           add eax, ecx
1009ff33  895e48                         mov dword ptr [esi + 0x48], ebx
1009ff36  89464c                         mov dword ptr [esi + 0x4c], eax
1009ff39  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009ff3c  64890d00000000                 mov dword ptr fs:[0], ecx
1009ff43  59                             pop ecx
1009ff44  5f                             pop edi
1009ff45  5e                             pop esi
1009ff46  5b                             pop ebx
1009ff47  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009ff4a  33cd                           xor ecx, ebp
1009ff4c  e8062a0000                     call 0x100a2957
1009ff51  8be5                           mov esp, ebp
1009ff53  5d                             pop ebp
1009ff54  c20400                         ret 4
1009ff57  cc                             int3 
1009ff58  cc                             int3 
1009ff59  cc                             int3 
1009ff5a  cc                             int3 
1009ff5b  cc                             int3 
1009ff5c  cc                             int3 
1009ff5d  cc                             int3 
1009ff5e  cc                             int3 
1009ff5f  cc                             int3 
