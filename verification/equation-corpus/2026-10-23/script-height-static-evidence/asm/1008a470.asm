; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008a470 <= VA < 0x1008a950 (next decompiler entry; may include padding/thunks)
1008a470  55                             push ebp
1008a471  8bec                           mov ebp, esp
1008a473  6aff                           push -1
1008a475  6854c10a10                     push 0x100ac154
1008a47a  64a100000000                   mov eax, dword ptr fs:[0]
1008a480  50                             push eax
1008a481  81ec94000000                   sub esp, 0x94
1008a487  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008a48c  33c5                           xor eax, ebp
1008a48e  8945f0                         mov dword ptr [ebp - 0x10], eax
1008a491  53                             push ebx
1008a492  56                             push esi
1008a493  57                             push edi
1008a494  50                             push eax
1008a495  8d45f4                         lea eax, [ebp - 0xc]
1008a498  64a300000000                   mov dword ptr fs:[0], eax
1008a49e  8bf1                           mov esi, ecx
1008a4a0  83be9400000000                 cmp dword ptr [esi + 0x94], 0
1008a4a7  8b467c                         mov eax, dword ptr [esi + 0x7c]
1008a4aa  8b4d08                         mov ecx, dword ptr [ebp + 8]
1008a4ad  8b5e74                         mov ebx, dword ptr [esi + 0x74]
1008a4b0  89856cffffff                   mov dword ptr [ebp - 0x94], eax
1008a4b6  8b868c000000                   mov eax, dword ptr [esi + 0x8c]
1008a4bc  898d68ffffff                   mov dword ptr [ebp - 0x98], ecx
1008a4c2  c78574ffffff00000000           mov dword ptr [ebp - 0x8c], 0
1008a4cc  c78578ffffff00000000           mov dword ptr [ebp - 0x88], 0
1008a4d6  8b7864                         mov edi, dword ptr [eax + 0x64]
1008a4d9  895d84                         mov dword ptr [ebp - 0x7c], ebx
1008a4dc  7511                           jne 0x1008a4ef
1008a4de  6683630e01                     and word ptr [ebx + 0xe], 1
1008a4e3  750a                           jne 0x1008a4ef
1008a4e5  c7835008000001000000           mov dword ptr [ebx + 0x850], 1
1008a4ef  3bbe90000000                   cmp edi, dword ptr [esi + 0x90]
1008a4f5  0f8528020000                   jne 0x1008a723
1008a4fb  83bb8008000000                 cmp dword ptr [ebx + 0x880], 0
1008a502  740d                           je 0x1008a511
1008a504  83be9800000000                 cmp dword ptr [esi + 0x98], 0
1008a50b  0f84bd030000                   je 0x1008a8ce
1008a511  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1008a518  8d8358080000                   lea eax, [ebx + 0x858]
1008a51e  7202                           jb 0x1008a522
1008a520  8b00                           mov eax, dword ptr [eax]
1008a522  50                             push eax
1008a523  ff7608                         push dword ptr [esi + 8]
1008a526  8bcb                           mov ecx, ebx
1008a528  e833a0ffff                     call 0x10084560
1008a52d  8b834c080000                   mov eax, dword ptr [ebx + 0x84c]
1008a533  8b8b48080000                   mov ecx, dword ptr [ebx + 0x848]
1008a539  898578ffffff                   mov dword ptr [ebp - 0x88], eax
1008a53f  8b8568ffffff                   mov eax, dword ptr [ebp - 0x98]
1008a545  898d70ffffff                   mov dword ptr [ebp - 0x90], ecx
1008a54b  3b868c000000                   cmp eax, dword ptr [esi + 0x8c]
1008a551  0f85d0000000                   jne 0x1008a627
1008a557  8b8680000000                   mov eax, dword ptr [esi + 0x80]
1008a55d  8bbd6cffffff                   mov edi, dword ptr [ebp - 0x94]
1008a563  898564ffffff                   mov dword ptr [ebp - 0x9c], eax
1008a569  8bc1                           mov eax, ecx
1008a56b  99                             cdq 
1008a56c  2bc2                           sub eax, edx
1008a56e  d1f8                           sar eax, 1
1008a570  2bf8                           sub edi, eax
1008a572  83bb8008000001                 cmp dword ptr [ebx + 0x880], 1
1008a579  897d80                         mov dword ptr [ebp - 0x80], edi
1008a57c  0f845d010000                   je 0x1008a6df
1008a582  833b00                         cmp dword ptr [ebx], 0
1008a585  0f8454010000                   je 0x1008a6df
1008a58b  8b9d78ffffff                   mov ebx, dword ptr [ebp - 0x88]
1008a591  03f9                           add edi, ecx
1008a593  039d64ffffff                   add ebx, dword ptr [ebp - 0x9c]
1008a599  8d4dbc                         lea ecx, [ebp - 0x44]
1008a59c  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008a5a2  6a01                           push 1
1008a5a4  8d4dbc                         lea ecx, [ebp - 0x44]
1008a5a7  c745fc00000000                 mov dword ptr [ebp - 4], 0
1008a5ae  ff1550ff0d10                   call dword ptr [0x100dff50]
1008a5b4  6a01                           push 1
1008a5b6  8d4dbc                         lea ecx, [ebp - 0x44]
1008a5b9  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008a5bf  68ff000000                     push 0xff
1008a5c4  8d4dbc                         lea ecx, [ebp - 0x44]
1008a5c7  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008a5cd  8b4d84                         mov ecx, dword ptr [ebp - 0x7c]
1008a5d0  8d45bc                         lea eax, [ebp - 0x44]
1008a5d3  50                             push eax
1008a5d4  8b09                           mov ecx, dword ptr [ecx]
1008a5d6  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008a5dc  8b8564ffffff                   mov eax, dword ptr [ebp - 0x9c]
1008a5e2  6a00                           push 0
1008a5e4  57                             push edi
1008a5e5  50                             push eax
1008a5e6  57                             push edi
1008a5e7  8b7d80                         mov edi, dword ptr [ebp - 0x80]
1008a5ea  53                             push ebx
1008a5eb  57                             push edi
1008a5ec  53                             push ebx
1008a5ed  8b5d84                         mov ebx, dword ptr [ebp - 0x7c]
1008a5f0  57                             push edi
1008a5f1  50                             push eax
1008a5f2  8b0b                           mov ecx, dword ptr [ebx]
1008a5f4  ff1500fe0d10                   call dword ptr [0x100dfe00]
1008a5fa  8b9564ffffff                   mov edx, dword ptr [ebp - 0x9c]
1008a600  8b8570ffffff                   mov eax, dword ptr [ebp - 0x90]
1008a606  899370080000                   mov dword ptr [ebx + 0x870], edx
1008a60c  89bb74080000                   mov dword ptr [ebx + 0x874], edi
1008a612  89837c080000                   mov dword ptr [ebx + 0x87c], eax
1008a618  c7837808000001000000           mov dword ptr [ebx + 0x878], 1
1008a622  e9a8000000                     jmp 0x1008a6cf
1008a627  8b8570ffffff                   mov eax, dword ptr [ebp - 0x90]
1008a62d  8b8e80000000                   mov ecx, dword ptr [esi + 0x80]
1008a633  99                             cdq 
1008a634  2bc2                           sub eax, edx
1008a636  894d80                         mov dword ptr [ebp - 0x80], ecx
1008a639  8b956cffffff                   mov edx, dword ptr [ebp - 0x94]
1008a63f  d1f8                           sar eax, 1
1008a641  2bd0                           sub edx, eax
1008a643  83bb8008000001                 cmp dword ptr [ebx + 0x880], 1
1008a64a  899564ffffff                   mov dword ptr [ebp - 0x9c], edx
1008a650  8bfa                           mov edi, edx
1008a652  0f848d000000                   je 0x1008a6e5
1008a658  833b00                         cmp dword ptr [ebx], 0
1008a65b  0f8484000000                   je 0x1008a6e5
1008a661  8b9d78ffffff                   mov ebx, dword ptr [ebp - 0x88]
1008a667  8bbd70ffffff                   mov edi, dword ptr [ebp - 0x90]
1008a66d  03d9                           add ebx, ecx
1008a66f  8d4dbc                         lea ecx, [ebp - 0x44]
1008a672  03fa                           add edi, edx
1008a674  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008a67a  6a01                           push 1
1008a67c  8d4dbc                         lea ecx, [ebp - 0x44]
1008a67f  c745fc01000000                 mov dword ptr [ebp - 4], 1
1008a686  ff1550ff0d10                   call dword ptr [0x100dff50]
1008a68c  6a01                           push 1
1008a68e  8d4dbc                         lea ecx, [ebp - 0x44]
1008a691  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008a697  6a00                           push 0
1008a699  8d4dbc                         lea ecx, [ebp - 0x44]
1008a69c  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008a6a2  8b4d84                         mov ecx, dword ptr [ebp - 0x7c]
1008a6a5  8d45bc                         lea eax, [ebp - 0x44]
1008a6a8  50                             push eax
1008a6a9  8b09                           mov ecx, dword ptr [ecx]
1008a6ab  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008a6b1  8b4580                         mov eax, dword ptr [ebp - 0x80]
1008a6b4  6a00                           push 0
1008a6b6  57                             push edi
1008a6b7  50                             push eax
1008a6b8  57                             push edi
1008a6b9  8bbd64ffffff                   mov edi, dword ptr [ebp - 0x9c]
1008a6bf  53                             push ebx
1008a6c0  57                             push edi
1008a6c1  53                             push ebx
1008a6c2  57                             push edi
1008a6c3  50                             push eax
1008a6c4  8b4584                         mov eax, dword ptr [ebp - 0x7c]
1008a6c7  8b08                           mov ecx, dword ptr [eax]
1008a6c9  ff1500fe0d10                   call dword ptr [0x100dfe00]
1008a6cf  8d4dbc                         lea ecx, [ebp - 0x44]
1008a6d2  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
1008a6d9  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1008a6df  8b8e80000000                   mov ecx, dword ptr [esi + 0x80]
1008a6e5  8b868c000000                   mov eax, dword ptr [esi + 0x8c]
1008a6eb  894848                         mov dword ptr [eax + 0x48], ecx
1008a6ee  8b8d78ffffff                   mov ecx, dword ptr [ebp - 0x88]
1008a6f4  89784c                         mov dword ptr [eax + 0x4c], edi
1008a6f7  8b868c000000                   mov eax, dword ptr [esi + 0x8c]
1008a6fd  894858                         mov dword ptr [eax + 0x58], ecx
1008a700  8b8d70ffffff                   mov ecx, dword ptr [ebp - 0x90]
1008a706  89485c                         mov dword ptr [eax + 0x5c], ecx
1008a709  8b8680000000                   mov eax, dword ptr [esi + 0x80]
1008a70f  894648                         mov dword ptr [esi + 0x48], eax
1008a712  8b4654                         mov eax, dword ptr [esi + 0x54]
1008a715  03856cffffff                   add eax, dword ptr [ebp - 0x94]
1008a71b  89464c                         mov dword ptr [esi + 0x4c], eax
1008a71e  e9ab010000                     jmp 0x1008a8ce
1008a723  8bd9                           mov ebx, ecx
1008a725  85ff                           test edi, edi
1008a727  7413                           je 0x1008a73c
1008a729  8b07                           mov eax, dword ptr [edi]
1008a72b  8bcf                           mov ecx, edi
1008a72d  53                             push ebx
1008a72e  ff5004                         call dword ptr [eax + 4]
1008a731  8b7f64                         mov edi, dword ptr [edi + 0x64]
1008a734  3bbe90000000                   cmp edi, dword ptr [esi + 0x90]
1008a73a  75e9                           jne 0x1008a725
1008a73c  8b8680000000                   mov eax, dword ptr [esi + 0x80]
1008a742  894648                         mov dword ptr [esi + 0x48], eax
1008a745  8b856cffffff                   mov eax, dword ptr [ebp - 0x94]
1008a74b  034654                         add eax, dword ptr [esi + 0x54]
1008a74e  3bde                           cmp ebx, esi
1008a750  8b5d84                         mov ebx, dword ptr [ebp - 0x7c]
1008a753  89464c                         mov dword ptr [esi + 0x4c], eax
1008a756  0f85c8000000                   jne 0x1008a824
1008a75c  83bb8008000001                 cmp dword ptr [ebx + 0x880], 1
1008a763  8b4648                         mov eax, dword ptr [esi + 0x48]
1008a766  8bd0                           mov edx, eax
1008a768  8b4e4c                         mov ecx, dword ptr [esi + 0x4c]
1008a76b  8bc1                           mov eax, ecx
1008a76d  8bbea0000000                   mov edi, dword ptr [esi + 0xa0]
1008a773  898564ffffff                   mov dword ptr [ebp - 0x9c], eax
1008a779  8b86a4000000                   mov eax, dword ptr [esi + 0xa4]
1008a77f  894d80                         mov dword ptr [ebp - 0x80], ecx
1008a782  899578ffffff                   mov dword ptr [ebp - 0x88], edx
1008a788  898564ffffff                   mov dword ptr [ebp - 0x9c], eax
1008a78e  0f843a010000                   je 0x1008a8ce
1008a794  833b00                         cmp dword ptr [ebx], 0
1008a797  0f8431010000                   je 0x1008a8ce
1008a79d  8d1c3a                         lea ebx, [edx + edi]
1008a7a0  8d3c01                         lea edi, [ecx + eax]
1008a7a3  8d4dbc                         lea ecx, [ebp - 0x44]
1008a7a6  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008a7ac  6a01                           push 1
1008a7ae  8d4dbc                         lea ecx, [ebp - 0x44]
1008a7b1  c745fc02000000                 mov dword ptr [ebp - 4], 2
1008a7b8  ff1550ff0d10                   call dword ptr [0x100dff50]
1008a7be  6a01                           push 1
1008a7c0  8d4dbc                         lea ecx, [ebp - 0x44]
1008a7c3  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008a7c9  68ff000000                     push 0xff
1008a7ce  8d4dbc                         lea ecx, [ebp - 0x44]
1008a7d1  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008a7d7  8d45bc                         lea eax, [ebp - 0x44]
1008a7da  50                             push eax
1008a7db  8b4584                         mov eax, dword ptr [ebp - 0x7c]
1008a7de  8b08                           mov ecx, dword ptr [eax]
1008a7e0  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008a7e6  8b8578ffffff                   mov eax, dword ptr [ebp - 0x88]
1008a7ec  6a00                           push 0
1008a7ee  57                             push edi
1008a7ef  50                             push eax
1008a7f0  57                             push edi
1008a7f1  8b7d80                         mov edi, dword ptr [ebp - 0x80]
1008a7f4  53                             push ebx
1008a7f5  57                             push edi
1008a7f6  53                             push ebx
1008a7f7  8b5d84                         mov ebx, dword ptr [ebp - 0x7c]
1008a7fa  57                             push edi
1008a7fb  50                             push eax
1008a7fc  8b0b                           mov ecx, dword ptr [ebx]
1008a7fe  ff1500fe0d10                   call dword ptr [0x100dfe00]
1008a804  8b8578ffffff                   mov eax, dword ptr [ebp - 0x88]
1008a80a  8d4dbc                         lea ecx, [ebp - 0x44]
1008a80d  898370080000                   mov dword ptr [ebx + 0x870], eax
1008a813  8b8564ffffff                   mov eax, dword ptr [ebp - 0x9c]
1008a819  89bb74080000                   mov dword ptr [ebx + 0x874], edi
1008a81f  e98d000000                     jmp 0x1008a8b1
1008a824  8b8d68ffffff                   mov ecx, dword ptr [ebp - 0x98]
1008a82a  3b8e8c000000                   cmp ecx, dword ptr [esi + 0x8c]
1008a830  0f8598000000                   jne 0x1008a8ce
1008a836  83bb8008000001                 cmp dword ptr [ebx + 0x880], 1
1008a83d  8b4964                         mov ecx, dword ptr [ecx + 0x64]
1008a840  8b414c                         mov eax, dword ptr [ecx + 0x4c]
1008a843  8b7948                         mov edi, dword ptr [ecx + 0x48]
1008a846  898578ffffff                   mov dword ptr [ebp - 0x88], eax
1008a84c  8b415c                         mov eax, dword ptr [ecx + 0x5c]
1008a84f  894580                         mov dword ptr [ebp - 0x80], eax
1008a852  747a                           je 0x1008a8ce
1008a854  833b00                         cmp dword ptr [ebx], 0
1008a857  7475                           je 0x1008a8ce
1008a859  8d4d88                         lea ecx, [ebp - 0x78]
1008a85c  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008a862  6a01                           push 1
1008a864  8d4d88                         lea ecx, [ebp - 0x78]
1008a867  c745fc03000000                 mov dword ptr [ebp - 4], 3
1008a86e  ff1550ff0d10                   call dword ptr [0x100dff50]
1008a874  6a01                           push 1
1008a876  8d4d88                         lea ecx, [ebp - 0x78]
1008a879  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008a87f  68ff000000                     push 0xff
1008a884  8d4d88                         lea ecx, [ebp - 0x78]
1008a887  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008a88d  8b0b                           mov ecx, dword ptr [ebx]
1008a88f  8d4588                         lea eax, [ebp - 0x78]
1008a892  50                             push eax
1008a893  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008a899  8b8578ffffff                   mov eax, dword ptr [ebp - 0x88]
1008a89f  8d4d88                         lea ecx, [ebp - 0x78]
1008a8a2  898374080000                   mov dword ptr [ebx + 0x874], eax
1008a8a8  8b4580                         mov eax, dword ptr [ebp - 0x80]
1008a8ab  89bb70080000                   mov dword ptr [ebx + 0x870], edi
1008a8b1  89837c080000                   mov dword ptr [ebx + 0x87c], eax
1008a8b7  c7837808000001000000           mov dword ptr [ebx + 0x878], 1
1008a8c1  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
1008a8c8  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1008a8ce  8b8698000000                   mov eax, dword ptr [esi + 0x98]
1008a8d4  85c0                           test eax, eax
1008a8d6  7459                           je 0x1008a931
1008a8d8  8b4054                         mov eax, dword ptr [eax + 0x54]
1008a8db  8bbea4000000                   mov edi, dword ptr [esi + 0xa4]
1008a8e1  8b5e4c                         mov ebx, dword ptr [esi + 0x4c]
1008a8e4  6a64                           push 0x64
1008a8e6  ffb684000000                   push dword ptr [esi + 0x84]
1008a8ec  898578ffffff                   mov dword ptr [ebp - 0x88], eax
1008a8f2  ff7608                         push dword ptr [esi + 8]
1008a8f5  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008a8fb  2b9d78ffffff                   sub ebx, dword ptr [ebp - 0x88]
1008a901  03c7                           add eax, edi
1008a903  ffb568ffffff                   push dword ptr [ebp - 0x98]
1008a909  03d8                           add ebx, eax
1008a90b  8b8698000000                   mov eax, dword ptr [esi + 0x98]
1008a911  89587c                         mov dword ptr [eax + 0x7c], ebx
1008a914  8b8e98000000                   mov ecx, dword ptr [esi + 0x98]
1008a91a  8b8680000000                   mov eax, dword ptr [esi + 0x80]
1008a920  898180000000                   mov dword ptr [ecx + 0x80], eax
1008a926  8b8e98000000                   mov ecx, dword ptr [esi + 0x98]
1008a92c  8b01                           mov eax, dword ptr [ecx]
1008a92e  ff5004                         call dword ptr [eax + 4]
1008a931  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1008a934  64890d00000000                 mov dword ptr fs:[0], ecx
1008a93b  59                             pop ecx
1008a93c  5f                             pop edi
1008a93d  5e                             pop esi
1008a93e  5b                             pop ebx
1008a93f  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1008a942  33cd                           xor ecx, ebp
1008a944  e80e800100                     call 0x100a2957
1008a949  8be5                           mov esp, ebp
1008a94b  5d                             pop ebp
1008a94c  c20400                         ret 4
1008a94f  cc                             int3 
