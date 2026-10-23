; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008b480 <= VA < 0x1008b650 (next decompiler entry; may include padding/thunks)
1008b480  55                             push ebp
1008b481  8bec                           mov ebp, esp
1008b483  83e4f8                         and esp, 0xfffffff8
1008b486  83ec14                         sub esp, 0x14
1008b489  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1008b48d  53                             push ebx
1008b48e  56                             push esi
1008b48f  57                             push edi
1008b490  8bf9                           mov edi, ecx
1008b492  741d                           je 0x1008b4b1
1008b494  837f4400                       cmp dword ptr [edi + 0x44], 0
1008b498  7517                           jne 0x1008b4b1
1008b49a  8b4508                         mov eax, dword ptr [ebp + 8]
1008b49d  8b5758                         mov edx, dword ptr [edi + 0x58]
1008b4a0  8b4f5c                         mov ecx, dword ptr [edi + 0x5c]
1008b4a3  8910                           mov dword ptr [eax], edx
1008b4a5  894804                         mov dword ptr [eax + 4], ecx
1008b4a8  5f                             pop edi
1008b4a9  5e                             pop esi
1008b4aa  5b                             pop ebx
1008b4ab  8be5                           mov esp, ebp
1008b4ad  5d                             pop ebp
1008b4ae  c20800                         ret 8
1008b4b1  c7474400000000                 mov dword ptr [edi + 0x44], 0
1008b4b8  e833cfffff                     call 0x100883f0
1008b4bd  8b5f74                         mov ebx, dword ptr [edi + 0x74]
1008b4c0  33c0                           xor eax, eax
1008b4c2  394740                         cmp dword ptr [edi + 0x40], eax
1008b4c5  0f94c0                         sete al
1008b4c8  83bf9400000000                 cmp dword ptr [edi + 0x94], 0
1008b4cf  89442414                       mov dword ptr [esp + 0x14], eax
1008b4d3  740a                           je 0x1008b4df
1008b4d5  c7835008000000000000           mov dword ptr [ebx + 0x850], 0
1008b4df  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1008b4e6  8d8358080000                   lea eax, [ebx + 0x858]
1008b4ec  7202                           jb 0x1008b4f0
1008b4ee  8b00                           mov eax, dword ptr [eax]
1008b4f0  50                             push eax
1008b4f1  ff7708                         push dword ptr [edi + 8]
1008b4f4  8bcb                           mov ecx, ebx
1008b4f6  e86590ffff                     call 0x10084560
1008b4fb  8b4764                         mov eax, dword ptr [edi + 0x64]
1008b4fe  33f6                           xor esi, esi
1008b500  89742410                       mov dword ptr [esp + 0x10], esi
1008b504  85c0                           test eax, eax
1008b506  7446                           je 0x1008b54e
1008b508  8378047a                       cmp dword ptr [eax + 4], 0x7a
1008b50c  7440                           je 0x1008b54e
1008b50e  8bcf                           mov ecx, edi
1008b510  e81bcaffff                     call 0x10087f30
1008b515  8b4f64                         mov ecx, dword ptr [edi + 0x64]
1008b518  8d3480                         lea esi, [eax + eax*4]
1008b51b  e810caffff                     call 0x10087f30
1008b520  8d0470                         lea eax, [eax + esi*2]
1008b523  8b048518f30b10                 mov eax, dword ptr [eax*4 + 0x100bf318]
1008b52a  85c0                           test eax, eax
1008b52c  741e                           je 0x1008b54c
1008b52e  6a64                           push 0x64
1008b530  50                             push eax
1008b531  ffb348080000                   push dword ptr [ebx + 0x848]
1008b537  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008b53d  8d34c500000000                 lea esi, [eax*8]
1008b544  2bf0                           sub esi, eax
1008b546  89742410                       mov dword ptr [esp + 0x10], esi
1008b54a  eb02                           jmp 0x1008b54e
1008b54c  33f6                           xor esi, esi
1008b54e  0fb7879c000000                 movzx eax, word ptr [edi + 0x9c]
1008b555  83f820                         cmp eax, 0x20
1008b558  7459                           je 0x1008b5b3
1008b55a  83f87e                         cmp eax, 0x7e
1008b55d  7454                           je 0x1008b5b3
1008b55f  83f860                         cmp eax, 0x60
1008b562  744f                           je 0x1008b5b3
1008b564  50                             push eax
1008b565  8d44241c                       lea eax, [esp + 0x1c]
1008b569  8bcb                           mov ecx, ebx
1008b56b  50                             push eax
1008b56c  e8ef99ffff                     call 0x10084f60
1008b571  83bf9400000000                 cmp dword ptr [edi + 0x94], 0
1008b578  740a                           je 0x1008b584
1008b57a  8b442414                       mov eax, dword ptr [esp + 0x14]
1008b57e  898350080000                   mov dword ptr [ebx + 0x850], eax
1008b584  8b4c241c                       mov ecx, dword ptr [esp + 0x1c]
1008b588  8bc1                           mov eax, ecx
1008b58a  8b742418                       mov esi, dword ptr [esp + 0x18]
1008b58e  03742410                       add esi, dword ptr [esp + 0x10]
1008b592  99                             cdq 
1008b593  2bc2                           sub eax, edx
1008b595  897758                         mov dword ptr [edi + 0x58], esi
1008b598  d1f8                           sar eax, 1
1008b59a  f7d8                           neg eax
1008b59c  894f5c                         mov dword ptr [edi + 0x5c], ecx
1008b59f  894754                         mov dword ptr [edi + 0x54], eax
1008b5a2  8b4508                         mov eax, dword ptr [ebp + 8]
1008b5a5  8930                           mov dword ptr [eax], esi
1008b5a7  894804                         mov dword ptr [eax + 4], ecx
1008b5aa  5f                             pop edi
1008b5ab  5e                             pop esi
1008b5ac  5b                             pop ebx
1008b5ad  8be5                           mov esp, ebp
1008b5af  5d                             pop ebp
1008b5b0  c20800                         ret 8
1008b5b3  8b07                           mov eax, dword ptr [edi]
1008b5b5  3df4f40b10                     cmp eax, 0x100bf4f4
1008b5ba  0f8582000000                   jne 0x1008b642
1008b5c0  8b4768                         mov eax, dword ptr [edi + 0x68]
1008b5c3  8b8094000000                   mov eax, dword ptr [eax + 0x94]
1008b5c9  85c0                           test eax, eax
1008b5cb  7427                           je 0x1008b5f4
1008b5cd  8378046d                       cmp dword ptr [eax + 4], 0x6d
1008b5d1  7521                           jne 0x1008b5f4
1008b5d3  b931000000                     mov ecx, 0x31
1008b5d8  e8739cffff                     call 0x10085250
1008b5dd  0fb7c0                         movzx eax, ax
1008b5e0  8bcb                           mov ecx, ebx
1008b5e2  50                             push eax
1008b5e3  8d44241c                       lea eax, [esp + 0x1c]
1008b5e7  50                             push eax
1008b5e8  e87399ffff                     call 0x10084f60
1008b5ed  8b08                           mov ecx, dword ptr [eax]
1008b5ef  8b5804                         mov ebx, dword ptr [eax + 4]
1008b5f2  eb0c                           jmp 0x1008b600
1008b5f4  8b8b4c080000                   mov ecx, dword ptr [ebx + 0x84c]
1008b5fa  8b9b48080000                   mov ebx, dword ptr [ebx + 0x848]
1008b600  0fb7879c000000                 movzx eax, word ptr [edi + 0x9c]
1008b607  83f820                         cmp eax, 0x20
1008b60a  7405                           je 0x1008b611
1008b60c  83f860                         cmp eax, 0x60
1008b60f  750c                           jne 0x1008b61d
1008b611  8bc1                           mov eax, ecx
1008b613  99                             cdq 
1008b614  83e203                         and edx, 3
1008b617  8d0c02                         lea ecx, [edx + eax]
1008b61a  c1f902                         sar ecx, 2
1008b61d  8bc3                           mov eax, ebx
1008b61f  895f5c                         mov dword ptr [edi + 0x5c], ebx
1008b622  99                             cdq 
1008b623  03ce                           add ecx, esi
1008b625  2bc2                           sub eax, edx
1008b627  894f58                         mov dword ptr [edi + 0x58], ecx
1008b62a  d1f8                           sar eax, 1
1008b62c  f7d8                           neg eax
1008b62e  894754                         mov dword ptr [edi + 0x54], eax
1008b631  8b4508                         mov eax, dword ptr [ebp + 8]
1008b634  5f                             pop edi
1008b635  5e                             pop esi
1008b636  895804                         mov dword ptr [eax + 4], ebx
1008b639  8908                           mov dword ptr [eax], ecx
1008b63b  5b                             pop ebx
1008b63c  8be5                           mov esp, ebp
1008b63e  5d                             pop ebp
1008b63f  c20800                         ret 8
1008b642  8bcf                           mov ecx, edi
1008b644  ff5010                         call dword ptr [eax + 0x10]
1008b647  e977ffffff                     jmp 0x1008b5c3
1008b64c  cc                             int3 
1008b64d  cc                             int3 
1008b64e  cc                             int3 
1008b64f  cc                             int3 
