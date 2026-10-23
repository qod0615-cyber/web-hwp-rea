; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008c580 <= VA < 0x1008c7a0 (next decompiler entry; may include padding/thunks)
1008c580  55                             push ebp
1008c581  8bec                           mov ebp, esp
1008c583  83e4f8                         and esp, 0xfffffff8
1008c586  83ec2c                         sub esp, 0x2c
1008c589  53                             push ebx
1008c58a  56                             push esi
1008c58b  8b750c                         mov esi, dword ptr [ebp + 0xc]
1008c58e  8bd9                           mov ebx, ecx
1008c590  57                             push edi
1008c591  85f6                           test esi, esi
1008c593  741d                           je 0x1008c5b2
1008c595  837b4400                       cmp dword ptr [ebx + 0x44], 0
1008c599  7517                           jne 0x1008c5b2
1008c59b  8b4508                         mov eax, dword ptr [ebp + 8]
1008c59e  8b5358                         mov edx, dword ptr [ebx + 0x58]
1008c5a1  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1008c5a4  894804                         mov dword ptr [eax + 4], ecx
1008c5a7  8910                           mov dword ptr [eax], edx
1008c5a9  5f                             pop edi
1008c5aa  5e                             pop esi
1008c5ab  5b                             pop ebx
1008c5ac  8be5                           mov esp, ebp
1008c5ae  5d                             pop ebp
1008c5af  c20800                         ret 8
1008c5b2  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1008c5b9  e832beffff                     call 0x100883f0
1008c5be  8b3dc8e20a10                   mov edi, dword ptr [0x100ae2c8]
1008c5c4  6a64                           push 0x64
1008c5c6  6a44                           push 0x44
1008c5c8  ff7308                         push dword ptr [ebx + 8]
1008c5cb  ffd7                           call edi
1008c5cd  8b4b74                         mov ecx, dword ptr [ebx + 0x74]
1008c5d0  6a64                           push 0x64
1008c5d2  ffb3a0000000                   push dword ptr [ebx + 0xa0]
1008c5d8  89442418                       mov dword ptr [esp + 0x18], eax
1008c5dc  ff7308                         push dword ptr [ebx + 8]
1008c5df  894c2420                       mov dword ptr [esp + 0x20], ecx
1008c5e3  ffd7                           call edi
1008c5e5  8bc8                           mov ecx, eax
1008c5e7  8b442414                       mov eax, dword ptr [esp + 0x14]
1008c5eb  83b86c08000008                 cmp dword ptr [eax + 0x86c], 8
1008c5f2  8d9058080000                   lea edx, [eax + 0x858]
1008c5f8  7202                           jb 0x1008c5fc
1008c5fa  8b12                           mov edx, dword ptr [edx]
1008c5fc  52                             push edx
1008c5fd  51                             push ecx
1008c5fe  8bc8                           mov ecx, eax
1008c600  e85b7fffff                     call 0x10084560
1008c605  0fb7839c000000                 movzx eax, word ptr [ebx + 0x9c]
1008c60c  8b4b74                         mov ecx, dword ptr [ebx + 0x74]
1008c60f  50                             push eax
1008c610  8d44241c                       lea eax, [esp + 0x1c]
1008c614  50                             push eax
1008c615  e8b68bffff                     call 0x100851d0
1008c61a  8b442418                       mov eax, dword ptr [esp + 0x18]
1008c61e  8d542420                       lea edx, [esp + 0x20]
1008c622  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1008c626  8983a4000000                   mov dword ptr [ebx + 0xa4], eax
1008c62c  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1008c630  8983a8000000                   mov dword ptr [ebx + 0xa8], eax
1008c636  8b4378                         mov eax, dword ptr [ebx + 0x78]
1008c639  56                             push esi
1008c63a  52                             push edx
1008c63b  894808                         mov dword ptr [eax + 8], ecx
1008c63e  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1008c641  8b01                           mov eax, dword ptr [ecx]
1008c643  ff5008                         call dword ptr [eax + 8]
1008c646  8b437c                         mov eax, dword ptr [ebx + 0x7c]
1008c649  8d542430                       lea edx, [esp + 0x30]
1008c64d  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1008c651  56                             push esi
1008c652  52                             push edx
1008c653  894808                         mov dword ptr [eax + 8], ecx
1008c656  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
1008c659  8b01                           mov eax, dword ptr [ecx]
1008c65b  ff5008                         call dword ptr [eax + 8]
1008c65e  8b8b80000000                   mov ecx, dword ptr [ebx + 0x80]
1008c664  8d542428                       lea edx, [esp + 0x28]
1008c668  8b4308                         mov eax, dword ptr [ebx + 8]
1008c66b  56                             push esi
1008c66c  52                             push edx
1008c66d  894108                         mov dword ptr [ecx + 8], eax
1008c670  8b8b80000000                   mov ecx, dword ptr [ebx + 0x80]
1008c676  8b01                           mov eax, dword ptr [ecx]
1008c678  ff5008                         call dword ptr [eax + 8]
1008c67b  8b4b74                         mov ecx, dword ptr [ebx + 0x74]
1008c67e  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
1008c685  8d8158080000                   lea eax, [ecx + 0x858]
1008c68b  7202                           jb 0x1008c68f
1008c68d  8b00                           mov eax, dword ptr [eax]
1008c68f  50                             push eax
1008c690  ff7308                         push dword ptr [ebx + 8]
1008c693  e8c87effff                     call 0x10084560
1008c698  8b4374                         mov eax, dword ptr [ebx + 0x74]
1008c69b  6a64                           push 0x64
1008c69d  6a05                           push 5
1008c69f  8bb048080000                   mov esi, dword ptr [eax + 0x848]
1008c6a5  56                             push esi
1008c6a6  ffd7                           call edi
1008c6a8  6a64                           push 0x64
1008c6aa  6a01                           push 1
1008c6ac  56                             push esi
1008c6ad  8983b0000000                   mov dword ptr [ebx + 0xb0], eax
1008c6b3  ffd7                           call edi
1008c6b5  6a64                           push 0x64
1008c6b7  6ace                           push -0x32
1008c6b9  56                             push esi
1008c6ba  8983b4000000                   mov dword ptr [ebx + 0xb4], eax
1008c6c0  ffd7                           call edi
1008c6c2  8983ac000000                   mov dword ptr [ebx + 0xac], eax
1008c6c8  8b83a8000000                   mov eax, dword ptr [ebx + 0xa8]
1008c6ce  99                             cdq 
1008c6cf  6a64                           push 0x64
1008c6d1  2bc2                           sub eax, edx
1008c6d3  6a44                           push 0x44
1008c6d5  d1f8                           sar eax, 1
1008c6d7  56                             push esi
1008c6d8  8983b8000000                   mov dword ptr [ebx + 0xb8], eax
1008c6de  ffd7                           call edi
1008c6e0  8bc8                           mov ecx, eax
1008c6e2  8b7b7c                         mov edi, dword ptr [ebx + 0x7c]
1008c6e5  b8abaaaa2a                     mov eax, 0x2aaaaaab
1008c6ea  f7e9                           imul ecx
1008c6ec  8b83a8000000                   mov eax, dword ptr [ebx + 0xa8]
1008c6f2  8bca                           mov ecx, edx
1008c6f4  c1e91f                         shr ecx, 0x1f
1008c6f7  03ca                           add ecx, edx
1008c6f9  99                             cdq 
1008c6fa  2bc2                           sub eax, edx
1008c6fc  8b93b8000000                   mov edx, dword ptr [ebx + 0xb8]
1008c702  d1f8                           sar eax, 1
1008c704  2bc8                           sub ecx, eax
1008c706  8b4378                         mov eax, dword ptr [ebx + 0x78]
1008c709  898bbc000000                   mov dword ptr [ebx + 0xbc], ecx
1008c70f  8b7054                         mov esi, dword ptr [eax + 0x54]
1008c712  8b475c                         mov eax, dword ptr [edi + 0x5c]
1008c715  03c1                           add eax, ecx
1008c717  034754                         add eax, dword ptr [edi + 0x54]
1008c71a  03f2                           add esi, edx
1008c71c  7908                           jns 0x1008c726
1008c71e  2bd6                           sub edx, esi
1008c720  8993b8000000                   mov dword ptr [ebx + 0xb8], edx
1008c726  85c0                           test eax, eax
1008c728  7e08                           jle 0x1008c732
1008c72a  2bc8                           sub ecx, eax
1008c72c  898bbc000000                   mov dword ptr [ebx + 0xbc], ecx
1008c732  8b7f54                         mov edi, dword ptr [edi + 0x54]
1008c735  8b8380000000                   mov eax, dword ptr [ebx + 0x80]
1008c73b  03f9                           add edi, ecx
1008c73d  8b7378                         mov esi, dword ptr [ebx + 0x78]
1008c740  8b4854                         mov ecx, dword ptr [eax + 0x54]
1008c743  3bf9                           cmp edi, ecx
1008c745  8b7654                         mov esi, dword ptr [esi + 0x54]
1008c748  8b83b0000000                   mov eax, dword ptr [ebx + 0xb0]
1008c74e  0f4df9                         cmovge edi, ecx
1008c751  03442430                       add eax, dword ptr [esp + 0x30]
1008c755  03f2                           add esi, edx
1008c757  03742424                       add esi, dword ptr [esp + 0x24]
1008c75b  8b93ac000000                   mov edx, dword ptr [ebx + 0xac]
1008c761  03542420                       add edx, dword ptr [esp + 0x20]
1008c765  034c242c                       add ecx, dword ptr [esp + 0x2c]
1008c769  3bd0                           cmp edx, eax
1008c76b  897b54                         mov dword ptr [ebx + 0x54], edi
1008c76e  0f4ed0                         cmovle edx, eax
1008c771  8b4508                         mov eax, dword ptr [ebp + 8]
1008c774  03542428                       add edx, dword ptr [esp + 0x28]
1008c778  0393b4000000                   add edx, dword ptr [ebx + 0xb4]
1008c77e  0393a4000000                   add edx, dword ptr [ebx + 0xa4]
1008c784  3bf1                           cmp esi, ecx
1008c786  895358                         mov dword ptr [ebx + 0x58], edx
1008c789  0f4ef1                         cmovle esi, ecx
1008c78c  8910                           mov dword ptr [eax], edx
1008c78e  2bf7                           sub esi, edi
1008c790  5f                             pop edi
1008c791  89735c                         mov dword ptr [ebx + 0x5c], esi
1008c794  897004                         mov dword ptr [eax + 4], esi
1008c797  5e                             pop esi
1008c798  5b                             pop ebx
1008c799  8be5                           mov esp, ebp
1008c79b  5d                             pop ebp
1008c79c  c20800                         ret 8
1008c79f  cc                             int3 
