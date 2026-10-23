; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008f440 <= VA < 0x1008f650 (next decompiler entry; may include padding/thunks)
1008f440  55                             push ebp
1008f441  8bec                           mov ebp, esp
1008f443  83e4f8                         and esp, 0xfffffff8
1008f446  83ec24                         sub esp, 0x24
1008f449  53                             push ebx
1008f44a  56                             push esi
1008f44b  57                             push edi
1008f44c  8b7d0c                         mov edi, dword ptr [ebp + 0xc]
1008f44f  8bd9                           mov ebx, ecx
1008f451  85ff                           test edi, edi
1008f453  741d                           je 0x1008f472
1008f455  837b4400                       cmp dword ptr [ebx + 0x44], 0
1008f459  7517                           jne 0x1008f472
1008f45b  8b4508                         mov eax, dword ptr [ebp + 8]
1008f45e  8b5358                         mov edx, dword ptr [ebx + 0x58]
1008f461  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1008f464  894804                         mov dword ptr [eax + 4], ecx
1008f467  8910                           mov dword ptr [eax], edx
1008f469  5f                             pop edi
1008f46a  5e                             pop esi
1008f46b  5b                             pop ebx
1008f46c  8be5                           mov esp, ebp
1008f46e  5d                             pop ebp
1008f46f  c20800                         ret 8
1008f472  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1008f479  e8728fffff                     call 0x100883f0
1008f47e  6a64                           push 0x64
1008f480  6a32                           push 0x32
1008f482  ff7308                         push dword ptr [ebx + 8]
1008f485  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008f48b  8b537c                         mov edx, dword ptr [ebx + 0x7c]
1008f48e  8bf0                           mov esi, eax
1008f490  8b4b08                         mov ecx, dword ptr [ebx + 8]
1008f493  8d442428                       lea eax, [esp + 0x28]
1008f497  57                             push edi
1008f498  50                             push eax
1008f499  894a08                         mov dword ptr [edx + 8], ecx
1008f49c  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
1008f49f  8b11                           mov edx, dword ptr [ecx]
1008f4a1  ff5208                         call dword ptr [edx + 8]
1008f4a4  8b4378                         mov eax, dword ptr [ebx + 0x78]
1008f4a7  8d542420                       lea edx, [esp + 0x20]
1008f4ab  57                             push edi
1008f4ac  52                             push edx
1008f4ad  897008                         mov dword ptr [eax + 8], esi
1008f4b0  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1008f4b3  8b7374                         mov esi, dword ptr [ebx + 0x74]
1008f4b6  89742414                       mov dword ptr [esp + 0x14], esi
1008f4ba  8b01                           mov eax, dword ptr [ecx]
1008f4bc  ff5008                         call dword ptr [eax + 8]
1008f4bf  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1008f4c6  8d8658080000                   lea eax, [esi + 0x858]
1008f4cc  7202                           jb 0x1008f4d0
1008f4ce  8b00                           mov eax, dword ptr [eax]
1008f4d0  50                             push eax
1008f4d1  ff7308                         push dword ptr [ebx + 8]
1008f4d4  8bce                           mov ecx, esi
1008f4d6  e88550ffff                     call 0x10084560
1008f4db  c744241800000000               mov dword ptr [esp + 0x18], 0
1008f4e3  c744241c00000000               mov dword ptr [esp + 0x1c], 0
1008f4eb  833e00                         cmp dword ptr [esi], 0
1008f4ee  c74424145ce00000               mov dword ptr [esp + 0x14], 0xe05c
1008f4f6  744e                           je 0x1008f546
1008f4f8  81ec20040000                   sub esp, 0x420
1008f4fe  83c604                         add esi, 4
1008f501  8bfc                           mov edi, esp
1008f503  b908010000                     mov ecx, 0x108
1008f508  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1008f50a  8bb4242c040000                 mov esi, dword ptr [esp + 0x42c]
1008f511  8bce                           mov ecx, esi
1008f513  e80853ffff                     call 0x10084820
1008f518  8b0e                           mov ecx, dword ptr [esi]
1008f51a  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1008f520  50                             push eax
1008f521  ffd7                           call edi
1008f523  8b4c240c                       mov ecx, dword ptr [esp + 0xc]
1008f527  8bf0                           mov esi, eax
1008f529  8d442418                       lea eax, [esp + 0x18]
1008f52d  50                             push eax
1008f52e  6a01                           push 1
1008f530  8b09                           mov ecx, dword ptr [ecx]
1008f532  8d44241c                       lea eax, [esp + 0x1c]
1008f536  50                             push eax
1008f537  ff1508fe0d10                   call dword ptr [0x100dfe08]
1008f53d  8b44240c                       mov eax, dword ptr [esp + 0xc]
1008f541  56                             push esi
1008f542  8b08                           mov ecx, dword ptr [eax]
1008f544  ffd7                           call edi
1008f546  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
1008f549  8b3dc8e20a10                   mov edi, dword ptr [0x100ae2c8]
1008f54f  6a64                           push 0x64
1008f551  6a0a                           push 0xa
1008f553  8b4158                         mov eax, dword ptr [ecx + 0x58]
1008f556  ff7308                         push dword ptr [ebx + 8]
1008f559  8b715c                         mov esi, dword ptr [ecx + 0x5c]
1008f55c  89442418                       mov dword ptr [esp + 0x18], eax
1008f560  ffd7                           call edi
1008f562  8b4c241c                       mov ecx, dword ptr [esp + 0x1c]
1008f566  03c6                           add eax, esi
1008f568  6bc064                         imul eax, eax, 0x64
1008f56b  99                             cdq 
1008f56c  f7f9                           idiv ecx
1008f56e  898380000000                   mov dword ptr [ebx + 0x80], eax
1008f574  83f864                         cmp eax, 0x64
1008f577  7d0f                           jge 0x1008f588
1008f579  c7838000000064000000           mov dword ptr [ebx + 0x80], 0x64
1008f583  b864000000                     mov eax, 0x64
1008f588  6a64                           push 0x64
1008f58a  50                             push eax
1008f58b  51                             push ecx
1008f58c  ffd7                           call edi
1008f58e  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1008f592  8bf0                           mov esi, eax
1008f594  8bc1                           mov eax, ecx
1008f596  89b388000000                   mov dword ptr [ebx + 0x88], esi
1008f59c  99                             cdq 
1008f59d  2bc2                           sub eax, edx
1008f59f  33d2                           xor edx, edx
1008f5a1  d1f8                           sar eax, 1
1008f5a3  2b442420                       sub eax, dword ptr [esp + 0x20]
1008f5a7  89838c000000                   mov dword ptr [ebx + 0x8c], eax
1008f5ad  f7d8                           neg eax
1008f5af  85c0                           test eax, eax
1008f5b1  6a64                           push 0x64
1008f5b3  0f4ec2                         cmovle eax, edx
1008f5b6  6a11                           push 0x11
1008f5b8  ff7308                         push dword ptr [ebx + 8]
1008f5bb  03c8                           add ecx, eax
1008f5bd  898b84000000                   mov dword ptr [ebx + 0x84], ecx
1008f5c3  ffd7                           call edi
1008f5c5  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
1008f5c8  038384000000                   add eax, dword ptr [ebx + 0x84]
1008f5ce  03442428                       add eax, dword ptr [esp + 0x28]
1008f5d2  6a64                           push 0x64
1008f5d4  8b7154                         mov esi, dword ptr [ecx + 0x54]
1008f5d7  6a0a                           push 0xa
1008f5d9  ff7308                         push dword ptr [ebx + 8]
1008f5dc  89442418                       mov dword ptr [esp + 0x18], eax
1008f5e0  ffd7                           call edi
1008f5e2  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1008f5e5  2bf0                           sub esi, eax
1008f5e7  6a64                           push 0x64
1008f5e9  6a34                           push 0x34
1008f5eb  ffb388000000                   push dword ptr [ebx + 0x88]
1008f5f1  89742420                       mov dword ptr [esp + 0x20], esi
1008f5f5  8b715c                         mov esi, dword ptr [ecx + 0x5c]
1008f5f8  ffd7                           call edi
1008f5fa  6a64                           push 0x64
1008f5fc  6a05                           push 5
1008f5fe  ff7308                         push dword ptr [ebx + 8]
1008f601  2bf0                           sub esi, eax
1008f603  89b390000000                   mov dword ptr [ebx + 0x90], esi
1008f609  ffd7                           call edi
1008f60b  3bf0                           cmp esi, eax
1008f60d  7f0b                           jg 0x1008f61a
1008f60f  6a64                           push 0x64
1008f611  6a05                           push 5
1008f613  ff7308                         push dword ptr [ebx + 8]
1008f616  ffd7                           call edi
1008f618  8bf0                           mov esi, eax
1008f61a  8b8b88000000                   mov ecx, dword ptr [ebx + 0x88]
1008f620  8b442414                       mov eax, dword ptr [esp + 0x14]
1008f624  03ce                           add ecx, esi
1008f626  8b54240c                       mov edx, dword ptr [esp + 0xc]
1008f62a  2bc6                           sub eax, esi
1008f62c  894354                         mov dword ptr [ebx + 0x54], eax
1008f62f  8b4508                         mov eax, dword ptr [ebp + 8]
1008f632  5f                             pop edi
1008f633  5e                             pop esi
1008f634  895358                         mov dword ptr [ebx + 0x58], edx
1008f637  894b5c                         mov dword ptr [ebx + 0x5c], ecx
1008f63a  894804                         mov dword ptr [eax + 4], ecx
1008f63d  8910                           mov dword ptr [eax], edx
1008f63f  5b                             pop ebx
1008f640  8be5                           mov esp, ebp
1008f642  5d                             pop ebp
1008f643  c20800                         ret 8
1008f646  cc                             int3 
1008f647  cc                             int3 
1008f648  cc                             int3 
1008f649  cc                             int3 
1008f64a  cc                             int3 
1008f64b  cc                             int3 
1008f64c  cc                             int3 
1008f64d  cc                             int3 
1008f64e  cc                             int3 
1008f64f  cc                             int3 
