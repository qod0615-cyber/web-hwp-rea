; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10084610 <= VA < 0x100846d0 (next decompiler entry; may include padding/thunks)
10084610  55                             push ebp
10084611  8bec                           mov ebp, esp
10084613  51                             push ecx
10084614  8bc1                           mov eax, ecx
10084616  b9ac000000                     mov ecx, 0xac
1008461b  53                             push ebx
1008461c  668b5d08                       mov bx, word ptr [ebp + 8]
10084620  8945fc                         mov dword ptr [ebp - 4], eax
10084623  663bd9                         cmp bx, cx
10084626  7509                           jne 0x10084631
10084628  33c0                           xor eax, eax
1008462a  5b                             pop ebx
1008462b  8be5                           mov esp, ebp
1008462d  5d                             pop ebp
1008462e  c20400                         ret 4
10084631  8b886c080000                   mov ecx, dword ptr [eax + 0x86c]
10084637  8d9058080000                   lea edx, [eax + 0x858]
1008463d  57                             push edi
1008463e  8bfa                           mov edi, edx
10084640  83f908                         cmp ecx, 8
10084643  7202                           jb 0x10084647
10084645  8b3a                           mov edi, dword ptr [edx]
10084647  837a1007                       cmp dword ptr [edx + 0x10], 7
1008464b  56                             push esi
1008464c  754a                           jne 0x10084698
1008464e  b9b0f20b10                     mov ecx, 0x100bf2b0
10084653  be07000000                     mov esi, 7
10084658  2bf9                           sub edi, ecx
1008465a  660f1f440000                   nop word ptr [eax + eax]
10084660  668b040f                       mov ax, word ptr [edi + ecx]
10084664  663b01                         cmp ax, word ptr [ecx]
10084667  7529                           jne 0x10084692
10084669  83c102                         add ecx, 2
1008466c  83ee01                         sub esi, 1
1008466f  75ef                           jne 0x10084660
10084671  8b3d5cff0d10                   mov edi, dword ptr [0x100dff5c]
10084677  0fb7f3                         movzx esi, bx
1008467a  8b4dfc                         mov ecx, dword ptr [ebp - 4]
1008467d  56                             push esi
1008467e  6a01                           push 1
10084680  68b0f20b10                     push 0x100bf2b0
10084685  8b09                           mov ecx, dword ptr [ecx]
10084687  ffd7                           call edi
10084689  5e                             pop esi
1008468a  5f                             pop edi
1008468b  5b                             pop ebx
1008468c  8be5                           mov esp, ebp
1008468e  5d                             pop ebp
1008468f  c20400                         ret 4
10084692  8b45fc                         mov eax, dword ptr [ebp - 4]
10084695  8b4a14                         mov ecx, dword ptr [edx + 0x14]
10084698  83f908                         cmp ecx, 8
1008469b  7202                           jb 0x1008469f
1008469d  8b12                           mov edx, dword ptr [edx]
1008469f  8b08                           mov ecx, dword ptr [eax]
100846a1  8b3d5cff0d10                   mov edi, dword ptr [0x100dff5c]
100846a7  0fb7f3                         movzx esi, bx
100846aa  56                             push esi
100846ab  6a01                           push 1
100846ad  52                             push edx
100846ae  ffd7                           call edi
100846b0  85c0                           test eax, eax
100846b2  74c6                           je 0x1008467a
100846b4  5e                             pop esi
100846b5  5f                             pop edi
100846b6  b801000000                     mov eax, 1
100846bb  5b                             pop ebx
100846bc  8be5                           mov esp, ebp
100846be  5d                             pop ebp
100846bf  c20400                         ret 4
100846c2  cc                             int3 
100846c3  cc                             int3 
100846c4  cc                             int3 
100846c5  cc                             int3 
100846c6  cc                             int3 
100846c7  cc                             int3 
100846c8  cc                             int3 
100846c9  cc                             int3 
100846ca  cc                             int3 
100846cb  cc                             int3 
100846cc  cc                             int3 
100846cd  cc                             int3 
100846ce  cc                             int3 
100846cf  cc                             int3 
