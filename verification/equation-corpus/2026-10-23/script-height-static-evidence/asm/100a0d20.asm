; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100a0d20 <= VA < 0x100a0ef0 (next decompiler entry; may include padding/thunks)
100a0d20  55                             push ebp
100a0d21  8bec                           mov ebp, esp
100a0d23  6aff                           push -1
100a0d25  6861cf0a10                     push 0x100acf61
100a0d2a  64a100000000                   mov eax, dword ptr fs:[0]
100a0d30  50                             push eax
100a0d31  83ec5c                         sub esp, 0x5c
100a0d34  a10c100d10                     mov eax, dword ptr [0x100d100c]
100a0d39  33c5                           xor eax, ebp
100a0d3b  8945f0                         mov dword ptr [ebp - 0x10], eax
100a0d3e  53                             push ebx
100a0d3f  56                             push esi
100a0d40  57                             push edi
100a0d41  50                             push eax
100a0d42  8d45f4                         lea eax, [ebp - 0xc]
100a0d45  64a300000000                   mov dword ptr fs:[0], eax
100a0d4b  8bf1                           mov esi, ecx
100a0d4d  8b4668                         mov eax, dword ptr [esi + 0x68]
100a0d50  8b4e78                         mov ecx, dword ptr [esi + 0x78]
100a0d53  8b5d08                         mov ebx, dword ptr [ebp + 8]
100a0d56  8b7e74                         mov edi, dword ptr [esi + 0x74]
100a0d59  8b8080000000                   mov eax, dword ptr [eax + 0x80]
100a0d5f  034650                         add eax, dword ptr [esi + 0x50]
100a0d62  89459c                         mov dword ptr [ebp - 0x64], eax
100a0d65  8d45d8                         lea eax, [ebp - 0x28]
100a0d68  53                             push ebx
100a0d69  50                             push eax
100a0d6a  8b01                           mov eax, dword ptr [ecx]
100a0d6c  895da0                         mov dword ptr [ebp - 0x60], ebx
100a0d6f  ff500c                         call dword ptr [eax + 0xc]
100a0d72  33c0                           xor eax, eax
100a0d74  c745fc00000000                 mov dword ptr [ebp - 4], 0
100a0d7b  33db                           xor ebx, ebx
100a0d7d  33c9                           xor ecx, ecx
100a0d7f  3945e8                         cmp dword ptr [ebp - 0x18], eax
100a0d82  7425                           je 0x100a0da9
100a0d84  8d45d8                         lea eax, [ebp - 0x28]
100a0d87  50                             push eax
100a0d88  e8e3010000                     call 0x100a0f70
100a0d8d  8bd8                           mov ebx, eax
100a0d8f  8d45d8                         lea eax, [ebp - 0x28]
100a0d92  50                             push eax
100a0d93  e8d8010000                     call 0x100a0f70
100a0d98  894598                         mov dword ptr [ebp - 0x68], eax
100a0d9b  8d45d8                         lea eax, [ebp - 0x28]
100a0d9e  50                             push eax
100a0d9f  e8cc010000                     call 0x100a0f70
100a0da4  8bc8                           mov ecx, eax
100a0da6  8b4598                         mov eax, dword ptr [ebp - 0x68]
100a0da9  0fb6d1                         movzx edx, cl
100a0dac  8b0f                           mov ecx, dword ptr [edi]
100a0dae  c1e208                         shl edx, 8
100a0db1  0fb6c0                         movzx eax, al
100a0db4  0bd0                           or edx, eax
100a0db6  0fb6c3                         movzx eax, bl
100a0db9  c1e208                         shl edx, 8
100a0dbc  0bd0                           or edx, eax
100a0dbe  85c9                           test ecx, ecx
100a0dc0  740b                           je 0x100a0dcd
100a0dc2  52                             push edx
100a0dc3  ff15b0fe0d10                   call dword ptr [0x100dfeb0]
100a0dc9  8bd8                           mov ebx, eax
100a0dcb  eb05                           jmp 0x100a0dd2
100a0dcd  bbffffff00                     mov ebx, 0xffffff
100a0dd2  8b467c                         mov eax, dword ptr [esi + 0x7c]
100a0dd5  8b4d9c                         mov ecx, dword ptr [ebp - 0x64]
100a0dd8  ff75a0                         push dword ptr [ebp - 0x60]
100a0ddb  898880000000                   mov dword ptr [eax + 0x80], ecx
100a0de1  8b4668                         mov eax, dword ptr [esi + 0x68]
100a0de4  8b487c                         mov ecx, dword ptr [eax + 0x7c]
100a0de7  8b467c                         mov eax, dword ptr [esi + 0x7c]
100a0dea  89487c                         mov dword ptr [eax + 0x7c], ecx
100a0ded  8b4e7c                         mov ecx, dword ptr [esi + 0x7c]
100a0df0  8b01                           mov eax, dword ptr [ecx]
100a0df2  ff5004                         call dword ptr [eax + 4]
100a0df5  8b0f                           mov ecx, dword ptr [edi]
100a0df7  85c9                           test ecx, ecx
100a0df9  7407                           je 0x100a0e02
100a0dfb  53                             push ebx
100a0dfc  ff15b0fe0d10                   call dword ptr [0x100dfeb0]
100a0e02  83bf6c08000008                 cmp dword ptr [edi + 0x86c], 8
100a0e09  8d8758080000                   lea eax, [edi + 0x858]
100a0e0f  7202                           jb 0x100a0e13
100a0e11  8b00                           mov eax, dword ptr [eax]
100a0e13  50                             push eax
100a0e14  ff7608                         push dword ptr [esi + 8]
100a0e17  8bcf                           mov ecx, edi
100a0e19  e84237feff                     call 0x10084560
100a0e1e  3975a0                         cmp dword ptr [ebp - 0x60], esi
100a0e21  0f858c000000                   jne 0x100a0eb3
100a0e27  8b4668                         mov eax, dword ptr [esi + 0x68]
100a0e2a  8b565c                         mov edx, dword ptr [esi + 0x5c]
100a0e2d  8b5e58                         mov ebx, dword ptr [esi + 0x58]
100a0e30  8955a0                         mov dword ptr [ebp - 0x60], edx
100a0e33  8b487c                         mov ecx, dword ptr [eax + 0x7c]
100a0e36  8b4654                         mov eax, dword ptr [esi + 0x54]
100a0e39  03c1                           add eax, ecx
100a0e3b  83bf8008000001                 cmp dword ptr [edi + 0x880], 1
100a0e42  894598                         mov dword ptr [ebp - 0x68], eax
100a0e45  746c                           je 0x100a0eb3
100a0e47  833f00                         cmp dword ptr [edi], 0
100a0e4a  7467                           je 0x100a0eb3
100a0e4c  8d4da4                         lea ecx, [ebp - 0x5c]
100a0e4f  ff15f0fe0d10                   call dword ptr [0x100dfef0]
100a0e55  6a01                           push 1
100a0e57  8d4da4                         lea ecx, [ebp - 0x5c]
100a0e5a  c645fc01                       mov byte ptr [ebp - 4], 1
100a0e5e  ff1550ff0d10                   call dword ptr [0x100dff50]
100a0e64  6a01                           push 1
100a0e66  8d4da4                         lea ecx, [ebp - 0x5c]
100a0e69  ff1514fe0d10                   call dword ptr [0x100dfe14]
100a0e6f  68ff000000                     push 0xff
100a0e74  8d4da4                         lea ecx, [ebp - 0x5c]
100a0e77  ff1510fe0d10                   call dword ptr [0x100dfe10]
100a0e7d  8b0f                           mov ecx, dword ptr [edi]
100a0e7f  8d45a4                         lea eax, [ebp - 0x5c]
100a0e82  50                             push eax
100a0e83  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
100a0e89  8b459c                         mov eax, dword ptr [ebp - 0x64]
100a0e8c  8d4da4                         lea ecx, [ebp - 0x5c]
100a0e8f  898770080000                   mov dword ptr [edi + 0x870], eax
100a0e95  8b4598                         mov eax, dword ptr [ebp - 0x68]
100a0e98  898774080000                   mov dword ptr [edi + 0x874], eax
100a0e9e  8b45a0                         mov eax, dword ptr [ebp - 0x60]
100a0ea1  89877c080000                   mov dword ptr [edi + 0x87c], eax
100a0ea7  899f78080000                   mov dword ptr [edi + 0x878], ebx
100a0ead  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
100a0eb3  8b4668                         mov eax, dword ptr [esi + 0x68]
100a0eb6  8b487c                         mov ecx, dword ptr [eax + 0x7c]
100a0eb9  8b459c                         mov eax, dword ptr [ebp - 0x64]
100a0ebc  894648                         mov dword ptr [esi + 0x48], eax
100a0ebf  8b4654                         mov eax, dword ptr [esi + 0x54]
100a0ec2  03c1                           add eax, ecx
100a0ec4  8d4dd8                         lea ecx, [ebp - 0x28]
100a0ec7  89464c                         mov dword ptr [esi + 0x4c], eax
100a0eca  e8414df6ff                     call 0x10005c10
100a0ecf  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
100a0ed2  64890d00000000                 mov dword ptr fs:[0], ecx
100a0ed9  59                             pop ecx
100a0eda  5f                             pop edi
100a0edb  5e                             pop esi
100a0edc  5b                             pop ebx
100a0edd  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
100a0ee0  33cd                           xor ecx, ebp
100a0ee2  e8701a0000                     call 0x100a2957
100a0ee7  8be5                           mov esp, ebp
100a0ee9  5d                             pop ebp
100a0eea  c20400                         ret 4
100a0eed  cc                             int3 
100a0eee  cc                             int3 
100a0eef  cc                             int3 
