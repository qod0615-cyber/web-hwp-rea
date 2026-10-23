; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10090ff0 <= VA < 0x100911b0 (next decompiler entry; may include padding/thunks)
10090ff0  55                             push ebp
10090ff1  8bec                           mov ebp, esp
10090ff3  83e4f8                         and esp, 0xfffffff8
10090ff6  83ec2c                         sub esp, 0x2c
10090ff9  53                             push ebx
10090ffa  56                             push esi
10090ffb  8b750c                         mov esi, dword ptr [ebp + 0xc]
10090ffe  8bd9                           mov ebx, ecx
10091000  57                             push edi
10091001  85f6                           test esi, esi
10091003  741d                           je 0x10091022
10091005  837b4400                       cmp dword ptr [ebx + 0x44], 0
10091009  7517                           jne 0x10091022
1009100b  8b4508                         mov eax, dword ptr [ebp + 8]
1009100e  8b5358                         mov edx, dword ptr [ebx + 0x58]
10091011  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
10091014  8910                           mov dword ptr [eax], edx
10091016  894804                         mov dword ptr [eax + 4], ecx
10091019  5f                             pop edi
1009101a  5e                             pop esi
1009101b  5b                             pop ebx
1009101c  8be5                           mov esp, ebp
1009101e  5d                             pop ebp
1009101f  c20800                         ret 8
10091022  c7434400000000                 mov dword ptr [ebx + 0x44], 0
10091029  e8c273ffff                     call 0x100883f0
1009102e  8b8b80000000                   mov ecx, dword ptr [ebx + 0x80]
10091034  8b4308                         mov eax, dword ptr [ebx + 8]
10091037  56                             push esi
10091038  894108                         mov dword ptr [ecx + 8], eax
1009103b  8d442424                       lea eax, [esp + 0x24]
1009103f  8b8b80000000                   mov ecx, dword ptr [ebx + 0x80]
10091045  50                             push eax
10091046  8b01                           mov eax, dword ptr [ecx]
10091048  ff5008                         call dword ptr [eax + 8]
1009104b  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
1009104e  8d542428                       lea edx, [esp + 0x28]
10091052  56                             push esi
10091053  52                             push edx
10091054  8b38                           mov edi, dword ptr [eax]
10091056  8b4004                         mov eax, dword ptr [eax + 4]
10091059  89442424                       mov dword ptr [esp + 0x24], eax
1009105d  8b4308                         mov eax, dword ptr [ebx + 8]
10091060  894108                         mov dword ptr [ecx + 8], eax
10091063  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
10091066  897c2420                       mov dword ptr [esp + 0x20], edi
1009106a  8b01                           mov eax, dword ptr [ecx]
1009106c  ff5008                         call dword ptr [eax + 8]
1009106f  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
10091072  8d542430                       lea edx, [esp + 0x30]
10091076  8b4308                         mov eax, dword ptr [ebx + 8]
10091079  56                             push esi
1009107a  52                             push edx
1009107b  894108                         mov dword ptr [ecx + 8], eax
1009107e  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
10091081  8b01                           mov eax, dword ptr [ecx]
10091083  ff5008                         call dword ptr [eax + 8]
10091086  8b7374                         mov esi, dword ptr [ebx + 0x74]
10091089  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
10091090  8d8658080000                   lea eax, [esi + 0x858]
10091096  89742410                       mov dword ptr [esp + 0x10], esi
1009109a  7202                           jb 0x1009109e
1009109c  8b00                           mov eax, dword ptr [eax]
1009109e  50                             push eax
1009109f  ff7308                         push dword ptr [ebx + 8]
100910a2  8bce                           mov ecx, esi
100910a4  e8b734ffff                     call 0x10084560
100910a9  33c0                           xor eax, eax
100910ab  c744242000000000               mov dword ptr [esp + 0x20], 0
100910b3  89442424                       mov dword ptr [esp + 0x24], eax
100910b7  c74424140fe10000               mov dword ptr [esp + 0x14], 0xe10f
100910bf  3906                           cmp dword ptr [esi], eax
100910c1  7456                           je 0x10091119
100910c3  81ec20040000                   sub esp, 0x420
100910c9  83c604                         add esi, 4
100910cc  8bfc                           mov edi, esp
100910ce  b908010000                     mov ecx, 0x108
100910d3  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
100910d5  8bb42430040000                 mov esi, dword ptr [esp + 0x430]
100910dc  8bce                           mov ecx, esi
100910de  e83d37ffff                     call 0x10084820
100910e3  8b0e                           mov ecx, dword ptr [esi]
100910e5  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
100910eb  50                             push eax
100910ec  ffd7                           call edi
100910ee  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
100910f2  8bf0                           mov esi, eax
100910f4  8d442420                       lea eax, [esp + 0x20]
100910f8  50                             push eax
100910f9  6a01                           push 1
100910fb  8b09                           mov ecx, dword ptr [ecx]
100910fd  8d44241c                       lea eax, [esp + 0x1c]
10091101  50                             push eax
10091102  ff1508fe0d10                   call dword ptr [0x100dfe08]
10091108  8b442410                       mov eax, dword ptr [esp + 0x10]
1009110c  56                             push esi
1009110d  8b08                           mov ecx, dword ptr [eax]
1009110f  ffd7                           call edi
10091111  8b442424                       mov eax, dword ptr [esp + 0x24]
10091115  8b7c2418                       mov edi, dword ptr [esp + 0x18]
10091119  8b35c8e20a10                   mov esi, dword ptr [0x100ae2c8]
1009111f  6a64                           push 0x64
10091121  6a14                           push 0x14
10091123  50                             push eax
10091124  ffd6                           call esi
10091126  8b4c2420                       mov ecx, dword ptr [esp + 0x20]
1009112a  6a64                           push 0x64
1009112c  6a14                           push 0x14
1009112e  ff7308                         push dword ptr [ebx + 8]
10091131  898b84000000                   mov dword ptr [ebx + 0x84], ecx
10091137  898388000000                   mov dword ptr [ebx + 0x88], eax
1009113d  ffd6                           call esi
1009113f  8b742428                       mov esi, dword ptr [esp + 0x28]
10091143  3bfe                           cmp edi, esi
10091145  8b9388000000                   mov edx, dword ptr [ebx + 0x88]
1009114b  0f4ff7                         cmovg esi, edi
1009114e  8b7c242c                       mov edi, dword ptr [esp + 0x2c]
10091152  03b384000000                   add esi, dword ptr [ebx + 0x84]
10091158  03742430                       add esi, dword ptr [esp + 0x30]
1009115c  03f0                           add esi, eax
1009115e  8d043a                         lea eax, [edx + edi]
10091161  0344241c                       add eax, dword ptr [esp + 0x1c]
10091165  89442410                       mov dword ptr [esp + 0x10], eax
10091169  3bc2                           cmp eax, edx
1009116b  750f                           jne 0x1009117c
1009116d  8b4b74                         mov ecx, dword ptr [ebx + 0x74]
10091170  8b8948080000                   mov ecx, dword ptr [ecx + 0x848]
10091176  03c1                           add eax, ecx
10091178  89442410                       mov dword ptr [esp + 0x10], eax
1009117c  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
10091180  8bc2                           mov eax, edx
10091182  99                             cdq 
10091183  f7df                           neg edi
10091185  2bc2                           sub eax, edx
10091187  897358                         mov dword ptr [ebx + 0x58], esi
1009118a  d1f8                           sar eax, 1
1009118c  2bf8                           sub edi, eax
1009118e  894b5c                         mov dword ptr [ebx + 0x5c], ecx
10091191  8b4508                         mov eax, dword ptr [ebp + 8]
10091194  897b54                         mov dword ptr [ebx + 0x54], edi
10091197  5f                             pop edi
10091198  8930                           mov dword ptr [eax], esi
1009119a  5e                             pop esi
1009119b  894804                         mov dword ptr [eax + 4], ecx
1009119e  5b                             pop ebx
1009119f  8be5                           mov esp, ebp
100911a1  5d                             pop ebp
100911a2  c20800                         ret 8
100911a5  cc                             int3 
100911a6  cc                             int3 
100911a7  cc                             int3 
100911a8  cc                             int3 
100911a9  cc                             int3 
100911aa  cc                             int3 
100911ab  cc                             int3 
100911ac  cc                             int3 
100911ad  cc                             int3 
100911ae  cc                             int3 
100911af  cc                             int3 
