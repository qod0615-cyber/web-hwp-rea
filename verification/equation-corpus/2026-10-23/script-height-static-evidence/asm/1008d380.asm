; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008d380 <= VA < 0x1008d4d0 (next decompiler entry; may include padding/thunks)
1008d380  55                             push ebp
1008d381  8bec                           mov ebp, esp
1008d383  83e4f8                         and esp, 0xfffffff8
1008d386  83ec1c                         sub esp, 0x1c
1008d389  53                             push ebx
1008d38a  56                             push esi
1008d38b  57                             push edi
1008d38c  8b7d0c                         mov edi, dword ptr [ebp + 0xc]
1008d38f  8bd9                           mov ebx, ecx
1008d391  85ff                           test edi, edi
1008d393  741d                           je 0x1008d3b2
1008d395  837b4400                       cmp dword ptr [ebx + 0x44], 0
1008d399  7517                           jne 0x1008d3b2
1008d39b  8b4508                         mov eax, dword ptr [ebp + 8]
1008d39e  8b5358                         mov edx, dword ptr [ebx + 0x58]
1008d3a1  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1008d3a4  8910                           mov dword ptr [eax], edx
1008d3a6  894804                         mov dword ptr [eax + 4], ecx
1008d3a9  5f                             pop edi
1008d3aa  5e                             pop esi
1008d3ab  5b                             pop ebx
1008d3ac  8be5                           mov esp, ebp
1008d3ae  5d                             pop ebp
1008d3af  c20800                         ret 8
1008d3b2  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1008d3b9  e832b0ffff                     call 0x100883f0
1008d3be  8b7374                         mov esi, dword ptr [ebx + 0x74]
1008d3c1  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1008d3c8  8d8658080000                   lea eax, [esi + 0x858]
1008d3ce  8b4b08                         mov ecx, dword ptr [ebx + 8]
1008d3d1  894c2414                       mov dword ptr [esp + 0x14], ecx
1008d3d5  89742410                       mov dword ptr [esp + 0x10], esi
1008d3d9  7202                           jb 0x1008d3dd
1008d3db  8b00                           mov eax, dword ptr [eax]
1008d3dd  50                             push eax
1008d3de  51                             push ecx
1008d3df  8bce                           mov ecx, esi
1008d3e1  e87a71ffff                     call 0x10084560
1008d3e6  8b442410                       mov eax, dword ptr [esp + 0x10]
1008d3ea  8bb64c080000                   mov esi, dword ptr [esi + 0x84c]
1008d3f0  6a64                           push 0x64
1008d3f2  6a1e                           push 0x1e
1008d3f4  ffb048080000                   push dword ptr [eax + 0x848]
1008d3fa  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008d400  898388000000                   mov dword ptr [ebx + 0x88], eax
1008d406  8d542420                       lea edx, [esp + 0x20]
1008d40a  8b4378                         mov eax, dword ptr [ebx + 0x78]
1008d40d  89b384000000                   mov dword ptr [ebx + 0x84], esi
1008d413  8b742414                       mov esi, dword ptr [esp + 0x14]
1008d417  57                             push edi
1008d418  897008                         mov dword ptr [eax + 8], esi
1008d41b  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1008d41e  52                             push edx
1008d41f  8b01                           mov eax, dword ptr [ecx]
1008d421  ff5008                         call dword ptr [eax + 8]
1008d424  8b437c                         mov eax, dword ptr [ebx + 0x7c]
1008d427  8d542418                       lea edx, [esp + 0x18]
1008d42b  57                             push edi
1008d42c  52                             push edx
1008d42d  897008                         mov dword ptr [eax + 8], esi
1008d430  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
1008d433  8b01                           mov eax, dword ptr [ecx]
1008d435  ff5008                         call dword ptr [eax + 8]
1008d438  8b4b74                         mov ecx, dword ptr [ebx + 0x74]
1008d43b  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
1008d442  8d8158080000                   lea eax, [ecx + 0x858]
1008d448  7202                           jb 0x1008d44c
1008d44a  8b00                           mov eax, dword ptr [eax]
1008d44c  50                             push eax
1008d44d  ff7308                         push dword ptr [ebx + 8]
1008d450  e80b71ffff                     call 0x10084560
1008d455  8b8b84000000                   mov ecx, dword ptr [ebx + 0x84]
1008d45b  8b742420                       mov esi, dword ptr [esp + 0x20]
1008d45f  8bc6                           mov eax, esi
1008d461  8b542418                       mov edx, dword ptr [esp + 0x18]
1008d465  3bce                           cmp ecx, esi
1008d467  0f4fc1                         cmovg eax, ecx
1008d46a  3bc2                           cmp eax, edx
1008d46c  7e07                           jle 0x1008d475
1008d46e  3bce                           cmp ecx, esi
1008d470  0f4ff1                         cmovg esi, ecx
1008d473  eb02                           jmp 0x1008d477
1008d475  8bf2                           mov esi, edx
1008d477  8b4374                         mov eax, dword ptr [ebx + 0x74]
1008d47a  6a64                           push 0x64
1008d47c  6a32                           push 0x32
1008d47e  ffb048080000                   push dword ptr [eax + 0x848]
1008d484  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008d48a  8b4c241c                       mov ecx, dword ptr [esp + 0x1c]
1008d48e  8d3c06                         lea edi, [esi + eax]
1008d491  8b8388000000                   mov eax, dword ptr [ebx + 0x88]
1008d497  897b58                         mov dword ptr [ebx + 0x58], edi
1008d49a  8d3408                         lea esi, [eax + ecx]
1008d49d  99                             cdq 
1008d49e  03742424                       add esi, dword ptr [esp + 0x24]
1008d4a2  2bc2                           sub eax, edx
1008d4a4  d1f8                           sar eax, 1
1008d4a6  f7d9                           neg ecx
1008d4a8  2bc8                           sub ecx, eax
1008d4aa  89735c                         mov dword ptr [ebx + 0x5c], esi
1008d4ad  8b4508                         mov eax, dword ptr [ebp + 8]
1008d4b0  894b54                         mov dword ptr [ebx + 0x54], ecx
1008d4b3  8938                           mov dword ptr [eax], edi
1008d4b5  5f                             pop edi
1008d4b6  897004                         mov dword ptr [eax + 4], esi
1008d4b9  5e                             pop esi
1008d4ba  5b                             pop ebx
1008d4bb  8be5                           mov esp, ebp
1008d4bd  5d                             pop ebp
1008d4be  c20800                         ret 8
1008d4c1  cc                             int3 
1008d4c2  cc                             int3 
1008d4c3  cc                             int3 
1008d4c4  cc                             int3 
1008d4c5  cc                             int3 
1008d4c6  cc                             int3 
1008d4c7  cc                             int3 
1008d4c8  cc                             int3 
1008d4c9  cc                             int3 
1008d4ca  cc                             int3 
1008d4cb  cc                             int3 
1008d4cc  cc                             int3 
1008d4cd  cc                             int3 
1008d4ce  cc                             int3 
1008d4cf  cc                             int3 
