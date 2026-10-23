; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10084820 <= VA < 0x10084930 (next decompiler entry; may include padding/thunks)
10084820  55                             push ebp
10084821  8bec                           mov ebp, esp
10084823  6aff                           push -1
10084825  6882b50a10                     push 0x100ab582
1008482a  64a100000000                   mov eax, dword ptr fs:[0]
10084830  50                             push eax
10084831  81ec28040000                   sub esp, 0x428
10084837  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008483c  33c5                           xor eax, ebp
1008483e  8945f0                         mov dword ptr [ebp - 0x10], eax
10084841  53                             push ebx
10084842  56                             push esi
10084843  57                             push edi
10084844  50                             push eax
10084845  8d45f4                         lea eax, [ebp - 0xc]
10084848  64a300000000                   mov dword ptr fs:[0], eax
1008484e  8bc1                           mov eax, ecx
10084850  8985ccfbffff                   mov dword ptr [ebp - 0x434], eax
10084856  8b9844080000                   mov ebx, dword ptr [eax + 0x844]
1008485c  8d7508                         lea esi, [ebp + 8]
1008485f  8dbdd0fbffff                   lea edi, [ebp - 0x430]
10084865  b908010000                     mov ecx, 0x108
1008486a  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1008486c  85db                           test ebx, ebx
1008486e  744f                           je 0x100848bf
10084870  8d9024040000                   lea edx, [eax + 0x424]
10084876  bf1c040000                     mov edi, 0x41c
1008487b  8db5d0fbffff                   lea esi, [ebp - 0x430]
10084881  8b0a                           mov ecx, dword ptr [edx]
10084883  3b0e                           cmp ecx, dword ptr [esi]
10084885  750f                           jne 0x10084896
10084887  83c204                         add edx, 4
1008488a  83c604                         add esi, 4
1008488d  83ef04                         sub edi, 4
10084890  73ef                           jae 0x10084881
10084892  8bc3                           mov eax, ebx
10084894  eb7a                           jmp 0x10084910
10084896  85db                           test ebx, ebx
10084898  7425                           je 0x100848bf
1008489a  8bcb                           mov ecx, ebx
1008489c  ff150cff0d10                   call dword ptr [0x100dff0c]
100848a2  6a04                           push 4
100848a4  53                             push ebx
100848a5  e8eae20100                     call 0x100a2b94
100848aa  8bbdccfbffff                   mov edi, dword ptr [ebp - 0x434]
100848b0  83c408                         add esp, 8
100848b3  c7874408000000000000           mov dword ptr [edi + 0x844], 0
100848bd  eb02                           jmp 0x100848c1
100848bf  8bf8                           mov edi, eax
100848c1  6a04                           push 4
100848c3  e820e60100                     call 0x100a2ee8
100848c8  83c404                         add esp, 4
100848cb  8985ccfbffff                   mov dword ptr [ebp - 0x434], eax
100848d1  8bc8                           mov ecx, eax
100848d3  c745fc00000000                 mov dword ptr [ebp - 4], 0
100848da  ff1508ff0d10                   call dword ptr [0x100dff08]
100848e0  8bf0                           mov esi, eax
100848e2  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
100848e9  85f6                           test esi, esi
100848eb  750c                           jne 0x100848f9
100848ed  6a02                           push 2
100848ef  ff15e0e00a10                   call dword ptr [0x100ae0e0]
100848f5  33c0                           xor eax, eax
100848f7  eb17                           jmp 0x10084910
100848f9  8d85d0fbffff                   lea eax, [ebp - 0x430]
100848ff  8bce                           mov ecx, esi
10084901  50                             push eax
10084902  ff1510ff0d10                   call dword ptr [0x100dff10]
10084908  89b744080000                   mov dword ptr [edi + 0x844], esi
1008490e  8bc6                           mov eax, esi
10084910  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
10084913  64890d00000000                 mov dword ptr fs:[0], ecx
1008491a  59                             pop ecx
1008491b  5f                             pop edi
1008491c  5e                             pop esi
1008491d  5b                             pop ebx
1008491e  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
10084921  33cd                           xor ecx, ebp
10084923  e82fe00100                     call 0x100a2957
10084928  8be5                           mov esp, ebp
1008492a  5d                             pop ebp
1008492b  c22004                         ret 0x420
1008492e  cc                             int3 
1008492f  cc                             int3 
