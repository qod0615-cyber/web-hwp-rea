; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10092910 <= VA < 0x10092b40 (next decompiler entry; may include padding/thunks)
10092910  55                             push ebp
10092911  8bec                           mov ebp, esp
10092913  6aff                           push -1
10092915  6802c30a10                     push 0x100ac302
1009291a  64a100000000                   mov eax, dword ptr fs:[0]
10092920  50                             push eax
10092921  83ec7c                         sub esp, 0x7c
10092924  a10c100d10                     mov eax, dword ptr [0x100d100c]
10092929  33c5                           xor eax, ebp
1009292b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009292e  53                             push ebx
1009292f  56                             push esi
10092930  57                             push edi
10092931  50                             push eax
10092932  8d45f4                         lea eax, [ebp - 0xc]
10092935  64a300000000                   mov dword ptr fs:[0], eax
1009293b  8bd9                           mov ebx, ecx
1009293d  8b7368                         mov esi, dword ptr [ebx + 0x68]
10092940  8b7b50                         mov edi, dword ptr [ebx + 0x50]
10092943  8b5354                         mov edx, dword ptr [ebx + 0x54]
10092946  8b8380000000                   mov eax, dword ptr [ebx + 0x80]
1009294c  03be80000000                   add edi, dword ptr [esi + 0x80]
10092952  8b4e7c                         mov ecx, dword ptr [esi + 0x7c]
10092955  03d1                           add edx, ecx
10092957  897d84                         mov dword ptr [ebp - 0x7c], edi
1009295a  85c0                           test eax, eax
1009295c  7413                           je 0x10092971
1009295e  89780c                         mov dword ptr [eax + 0xc], edi
10092961  895008                         mov dword ptr [eax + 8], edx
10092964  8b8b80000000                   mov ecx, dword ptr [ebx + 0x80]
1009296a  e8c1ee0000                     call 0x100a1830
1009296f  eb06                           jmp 0x10092977
10092971  8b437c                         mov eax, dword ptr [ebx + 0x7c]
10092974  89487c                         mov dword ptr [eax + 0x7c], ecx
10092977  8b435c                         mov eax, dword ptr [ebx + 0x5c]
1009297a  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009297d  8bce                           mov ecx, esi
1009297f  89857cffffff                   mov dword ptr [ebp - 0x84], eax
10092985  8b4358                         mov eax, dword ptr [ebx + 0x58]
10092988  50                             push eax
10092989  ff735c                         push dword ptr [ebx + 0x5c]
1009298c  897580                         mov dword ptr [ebp - 0x80], esi
1009298f  e83c1bffff                     call 0x100844d0
10092994  8b437c                         mov eax, dword ptr [ebx + 0x7c]
10092997  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
1009299d  8b4064                         mov eax, dword ptr [eax + 0x64]
100929a0  8378046f                       cmp dword ptr [eax + 4], 0x6f
100929a4  7521                           jne 0x100929c7
100929a6  0fb7909c000000                 movzx edx, word ptr [eax + 0x9c]
100929ad  8b4368                         mov eax, dword ptr [ebx + 0x68]
100929b0  52                             push edx
100929b1  8b487c                         mov ecx, dword ptr [eax + 0x7c]
100929b4  8b4354                         mov eax, dword ptr [ebx + 0x54]
100929b7  03c1                           add eax, ecx
100929b9  8bce                           mov ecx, esi
100929bb  50                             push eax
100929bc  57                             push edi
100929bd  e86e1fffff                     call 0x10084930
100929c2  e99f000000                     jmp 0x10092a66
100929c7  8b4368                         mov eax, dword ptr [ebx + 0x68]
100929ca  8b5358                         mov edx, dword ptr [ebx + 0x58]
100929cd  8b7d84                         mov edi, dword ptr [ebp - 0x7c]
100929d0  8b487c                         mov ecx, dword ptr [eax + 0x7c]
100929d3  8b4354                         mov eax, dword ptr [ebx + 0x54]
100929d6  03c1                           add eax, ecx
100929d8  83be8008000001                 cmp dword ptr [esi + 0x880], 1
100929df  89857cffffff                   mov dword ptr [ebp - 0x84], eax
100929e5  747f                           je 0x10092a66
100929e7  833e00                         cmp dword ptr [esi], 0
100929ea  747a                           je 0x10092a66
100929ec  8b735c                         mov esi, dword ptr [ebx + 0x5c]
100929ef  8d4dbc                         lea ecx, [ebp - 0x44]
100929f2  03fa                           add edi, edx
100929f4  03f0                           add esi, eax
100929f6  ff15f0fe0d10                   call dword ptr [0x100dfef0]
100929fc  6a01                           push 1
100929fe  8d4dbc                         lea ecx, [ebp - 0x44]
10092a01  c745fc00000000                 mov dword ptr [ebp - 4], 0
10092a08  ff1550ff0d10                   call dword ptr [0x100dff50]
10092a0e  6a01                           push 1
10092a10  8d4dbc                         lea ecx, [ebp - 0x44]
10092a13  ff1514fe0d10                   call dword ptr [0x100dfe14]
10092a19  68ff000000                     push 0xff
10092a1e  8d4dbc                         lea ecx, [ebp - 0x44]
10092a21  ff1510fe0d10                   call dword ptr [0x100dfe10]
10092a27  8b4d80                         mov ecx, dword ptr [ebp - 0x80]
10092a2a  8d45bc                         lea eax, [ebp - 0x44]
10092a2d  50                             push eax
10092a2e  8b09                           mov ecx, dword ptr [ecx]
10092a30  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
10092a36  8b857cffffff                   mov eax, dword ptr [ebp - 0x84]
10092a3c  6a00                           push 0
10092a3e  56                             push esi
10092a3f  ff7584                         push dword ptr [ebp - 0x7c]
10092a42  56                             push esi
10092a43  8b7580                         mov esi, dword ptr [ebp - 0x80]
10092a46  57                             push edi
10092a47  50                             push eax
10092a48  57                             push edi
10092a49  8b7d84                         mov edi, dword ptr [ebp - 0x7c]
10092a4c  8b0e                           mov ecx, dword ptr [esi]
10092a4e  50                             push eax
10092a4f  57                             push edi
10092a50  ff1500fe0d10                   call dword ptr [0x100dfe00]
10092a56  8d4dbc                         lea ecx, [ebp - 0x44]
10092a59  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
10092a60  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
10092a66  395d08                         cmp dword ptr [ebp + 8], ebx
10092a69  0f8598000000                   jne 0x10092b07
10092a6f  8b4368                         mov eax, dword ptr [ebx + 0x68]
10092a72  8b5358                         mov edx, dword ptr [ebx + 0x58]
10092a75  895584                         mov dword ptr [ebp - 0x7c], edx
10092a78  8b535c                         mov edx, dword ptr [ebx + 0x5c]
10092a7b  8b487c                         mov ecx, dword ptr [eax + 0x7c]
10092a7e  8b4354                         mov eax, dword ptr [ebx + 0x54]
10092a81  03c1                           add eax, ecx
10092a83  895580                         mov dword ptr [ebp - 0x80], edx
10092a86  83be8008000001                 cmp dword ptr [esi + 0x880], 1
10092a8d  89857cffffff                   mov dword ptr [ebp - 0x84], eax
10092a93  7472                           je 0x10092b07
10092a95  833e00                         cmp dword ptr [esi], 0
10092a98  746d                           je 0x10092b07
10092a9a  8d4d88                         lea ecx, [ebp - 0x78]
10092a9d  ff15f0fe0d10                   call dword ptr [0x100dfef0]
10092aa3  6a01                           push 1
10092aa5  8d4d88                         lea ecx, [ebp - 0x78]
10092aa8  c745fc01000000                 mov dword ptr [ebp - 4], 1
10092aaf  ff1550ff0d10                   call dword ptr [0x100dff50]
10092ab5  6a01                           push 1
10092ab7  8d4d88                         lea ecx, [ebp - 0x78]
10092aba  ff1514fe0d10                   call dword ptr [0x100dfe14]
10092ac0  68ff000000                     push 0xff
10092ac5  8d4d88                         lea ecx, [ebp - 0x78]
10092ac8  ff1510fe0d10                   call dword ptr [0x100dfe10]
10092ace  8b0e                           mov ecx, dword ptr [esi]
10092ad0  8d4588                         lea eax, [ebp - 0x78]
10092ad3  50                             push eax
10092ad4  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
10092ada  8b857cffffff                   mov eax, dword ptr [ebp - 0x84]
10092ae0  8d4d88                         lea ecx, [ebp - 0x78]
10092ae3  898674080000                   mov dword ptr [esi + 0x874], eax
10092ae9  8b4580                         mov eax, dword ptr [ebp - 0x80]
10092aec  89867c080000                   mov dword ptr [esi + 0x87c], eax
10092af2  8b4584                         mov eax, dword ptr [ebp - 0x7c]
10092af5  89be70080000                   mov dword ptr [esi + 0x870], edi
10092afb  898678080000                   mov dword ptr [esi + 0x878], eax
10092b01  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
10092b07  8b4368                         mov eax, dword ptr [ebx + 0x68]
10092b0a  8b487c                         mov ecx, dword ptr [eax + 0x7c]
10092b0d  8b4354                         mov eax, dword ptr [ebx + 0x54]
10092b10  03c1                           add eax, ecx
10092b12  897b48                         mov dword ptr [ebx + 0x48], edi
10092b15  89434c                         mov dword ptr [ebx + 0x4c], eax
10092b18  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
10092b1b  64890d00000000                 mov dword ptr fs:[0], ecx
10092b22  59                             pop ecx
10092b23  5f                             pop edi
10092b24  5e                             pop esi
10092b25  5b                             pop ebx
10092b26  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
10092b29  33cd                           xor ecx, ebp
10092b2b  e827fe0000                     call 0x100a2957
10092b30  8be5                           mov esp, ebp
10092b32  5d                             pop ebp
10092b33  c20400                         ret 4
10092b36  cc                             int3 
10092b37  cc                             int3 
10092b38  cc                             int3 
10092b39  cc                             int3 
10092b3a  cc                             int3 
10092b3b  cc                             int3 
10092b3c  cc                             int3 
10092b3d  cc                             int3 
10092b3e  cc                             int3 
10092b3f  cc                             int3 
