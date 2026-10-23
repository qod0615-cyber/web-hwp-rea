; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10094720 <= VA < 0x10094ac0 (next decompiler entry; may include padding/thunks)
10094720  55                             push ebp
10094721  8bec                           mov ebp, esp
10094723  83e4f8                         and esp, 0xfffffff8
10094726  83ec2c                         sub esp, 0x2c
10094729  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009472d  53                             push ebx
1009472e  56                             push esi
1009472f  57                             push edi
10094730  8bd9                           mov ebx, ecx
10094732  741d                           je 0x10094751
10094734  837b4400                       cmp dword ptr [ebx + 0x44], 0
10094738  7517                           jne 0x10094751
1009473a  8b4508                         mov eax, dword ptr [ebp + 8]
1009473d  8b4b58                         mov ecx, dword ptr [ebx + 0x58]
10094740  8908                           mov dword ptr [eax], ecx
10094742  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
10094745  894804                         mov dword ptr [eax + 4], ecx
10094748  5f                             pop edi
10094749  5e                             pop esi
1009474a  5b                             pop ebx
1009474b  8be5                           mov esp, ebp
1009474d  5d                             pop ebp
1009474e  c20800                         ret 8
10094751  c7434400000000                 mov dword ptr [ebx + 0x44], 0
10094758  e8933cffff                     call 0x100883f0
1009475d  8b437c                         mov eax, dword ptr [ebx + 0x7c]
10094760  c1e002                         shl eax, 2
10094763  50                             push eax
10094764  6a00                           push 0
10094766  ffb384000000                   push dword ptr [ebx + 0x84]
1009476c  e8ddf90000                     call 0x100a414e
10094771  0f57c0                         xorps xmm0, xmm0
10094774  83c40c                         add esp, 0xc
10094777  660fd68388000000               movq qword ptr [ebx + 0x88], xmm0
1009477f  8b7374                         mov esi, dword ptr [ebx + 0x74]
10094782  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
10094789  8d8658080000                   lea eax, [esi + 0x858]
1009478f  89742420                       mov dword ptr [esp + 0x20], esi
10094793  7202                           jb 0x10094797
10094795  8b00                           mov eax, dword ptr [eax]
10094797  50                             push eax
10094798  ff7308                         push dword ptr [ebx + 8]
1009479b  8bce                           mov ecx, esi
1009479d  e8befdfeff                     call 0x10084560
100947a2  33c0                           xor eax, eax
100947a4  c744242800000000               mov dword ptr [esp + 0x28], 0
100947ac  8944242c                       mov dword ptr [esp + 0x2c], eax
100947b0  c744241c01e10000               mov dword ptr [esp + 0x1c], 0xe101
100947b8  3906                           cmp dword ptr [esi], eax
100947ba  744c                           je 0x10094808
100947bc  81ec20040000                   sub esp, 0x420
100947c2  83c604                         add esi, 4
100947c5  8bfc                           mov edi, esp
100947c7  b908010000                     mov ecx, 0x108
100947cc  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
100947ce  8bbc2440040000                 mov edi, dword ptr [esp + 0x440]
100947d5  8bcf                           mov ecx, edi
100947d7  e84400ffff                     call 0x10084820
100947dc  8b0f                           mov ecx, dword ptr [edi]
100947de  50                             push eax
100947df  ff152cff0d10                   call dword ptr [0x100dff2c]
100947e5  8b0f                           mov ecx, dword ptr [edi]
100947e7  8bf0                           mov esi, eax
100947e9  8d442428                       lea eax, [esp + 0x28]
100947ed  50                             push eax
100947ee  6a01                           push 1
100947f0  8d442424                       lea eax, [esp + 0x24]
100947f4  50                             push eax
100947f5  ff1508fe0d10                   call dword ptr [0x100dfe08]
100947fb  8b0f                           mov ecx, dword ptr [edi]
100947fd  56                             push esi
100947fe  ff152cff0d10                   call dword ptr [0x100dff2c]
10094804  8b44242c                       mov eax, dword ptr [esp + 0x2c]
10094808  6a64                           push 0x64
1009480a  6a14                           push 0x14
1009480c  50                             push eax
1009480d  ff15c8e20a10                   call dword ptr [0x100ae2c8]
10094813  837b0474                       cmp dword ptr [ebx + 4], 0x74
10094817  8b4c2428                       mov ecx, dword ptr [esp + 0x28]
1009481b  898b88000000                   mov dword ptr [ebx + 0x88], ecx
10094821  89838c000000                   mov dword ptr [ebx + 0x8c], eax
10094827  0f858b000000                   jne 0x100948b8
1009482d  8b4374                         mov eax, dword ptr [ebx + 0x74]
10094830  33d2                           xor edx, edx
10094832  33f6                           xor esi, esi
10094834  89542428                       mov dword ptr [esp + 0x28], edx
10094838  8974242c                       mov dword ptr [esp + 0x2c], esi
1009483c  89442420                       mov dword ptr [esp + 0x20], eax
10094840  c744241cef220000               mov dword ptr [esp + 0x1c], 0x22ef
10094848  3910                           cmp dword ptr [eax], edx
1009484a  744d                           je 0x10094899
1009484c  81ec20040000                   sub esp, 0x420
10094852  8d7004                         lea esi, [eax + 4]
10094855  8bfc                           mov edi, esp
10094857  b908010000                     mov ecx, 0x108
1009485c  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009485e  8bc8                           mov ecx, eax
10094860  e8bbfffeff                     call 0x10084820
10094865  8b7c2420                       mov edi, dword ptr [esp + 0x20]
10094869  50                             push eax
1009486a  8b0f                           mov ecx, dword ptr [edi]
1009486c  ff152cff0d10                   call dword ptr [0x100dff2c]
10094872  8b0f                           mov ecx, dword ptr [edi]
10094874  8bf0                           mov esi, eax
10094876  8d442428                       lea eax, [esp + 0x28]
1009487a  50                             push eax
1009487b  6a01                           push 1
1009487d  8d442424                       lea eax, [esp + 0x24]
10094881  50                             push eax
10094882  ff1508fe0d10                   call dword ptr [0x100dfe08]
10094888  8b0f                           mov ecx, dword ptr [edi]
1009488a  56                             push esi
1009488b  ff152cff0d10                   call dword ptr [0x100dff2c]
10094891  8b74242c                       mov esi, dword ptr [esp + 0x2c]
10094895  8b542428                       mov edx, dword ptr [esp + 0x28]
10094899  6a64                           push 0x64
1009489b  6a14                           push 0x14
1009489d  ff7308                         push dword ptr [ebx + 8]
100948a0  899394000000                   mov dword ptr [ebx + 0x94], edx
100948a6  89b398000000                   mov dword ptr [ebx + 0x98], esi
100948ac  ff15c8e20a10                   call dword ptr [0x100ae2c8]
100948b2  018394000000                   add dword ptr [ebx + 0x94], eax
100948b8  8b4378                         mov eax, dword ptr [ebx + 0x78]
100948bb  33d2                           xor edx, edx
100948bd  33ff                           xor edi, edi
100948bf  c744241c00000000               mov dword ptr [esp + 0x1c], 0
100948c7  33f6                           xor esi, esi
100948c9  89542420                       mov dword ptr [esp + 0x20], edx
100948cd  85c0                           test eax, eax
100948cf  0f8e6e010000                   jle 0x10094a43
100948d5  33c9                           xor ecx, ecx
100948d7  c744241800000000               mov dword ptr [esp + 0x18], 0
100948df  48                             dec eax
100948e0  894c2410                       mov dword ptr [esp + 0x10], ecx
100948e4  ba01000000                     mov edx, 1
100948e9  3bf8                           cmp edi, eax
100948eb  7509                           jne 0x100948f6
100948ed  85ff                           test edi, edi
100948ef  0f4fca                         cmovg ecx, edx
100948f2  894c2410                       mov dword ptr [esp + 0x10], ecx
100948f6  33c0                           xor eax, eax
100948f8  33f6                           xor esi, esi
100948fa  89442414                       mov dword ptr [esp + 0x14], eax
100948fe  39437c                         cmp dword ptr [ebx + 0x7c], eax
10094901  0f8efb000000                   jle 0x10094a02
10094907  6a64                           push 0x64
10094909  6a14                           push 0x14
1009490b  ff7308                         push dword ptr [ebx + 8]
1009490e  ff15c8e20a10                   call dword ptr [0x100ae2c8]
10094914  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
10094917  03f0                           add esi, eax
10094919  8b542414                       mov edx, dword ptr [esp + 0x14]
1009491d  89742428                       mov dword ptr [esp + 0x28], esi
10094921  89742424                       mov dword ptr [esp + 0x24], esi
10094925  8d41ff                         lea eax, [ecx - 1]
10094928  3bd0                           cmp edx, eax
1009492a  7523                           jne 0x1009494f
1009492c  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009492f  48                             dec eax
10094930  3bf8                           cmp edi, eax
10094932  7508                           jne 0x1009493c
10094934  85ff                           test edi, edi
10094936  0f8fba000000                   jg 0x100949f6
1009493c  837b0474                       cmp dword ptr [ebx + 4], 0x74
10094940  750d                           jne 0x1009494f
10094942  85ff                           test edi, edi
10094944  7509                           jne 0x1009494f
10094946  83f902                         cmp ecx, 2
10094949  0f8fb3000000                   jg 0x10094a02
1009494f  394c2410                       cmp dword ptr [esp + 0x10], ecx
10094953  0f84a9000000                   je 0x10094a02
10094959  8b7308                         mov esi, dword ptr [ebx + 8]
1009495c  3b7b78                         cmp edi, dword ptr [ebx + 0x78]
1009495f  7d14                           jge 0x10094975
10094961  3bd1                           cmp edx, ecx
10094963  7d10                           jge 0x10094975
10094965  8b8390000000                   mov eax, dword ptr [ebx + 0x90]
1009496b  0fafcf                         imul ecx, edi
1009496e  03ca                           add ecx, edx
10094970  8b0488                         mov eax, dword ptr [eax + ecx*4]
10094973  eb02                           jmp 0x10094977
10094975  33c0                           xor eax, eax
10094977  897008                         mov dword ptr [eax + 8], esi
1009497a  3b7b78                         cmp edi, dword ptr [ebx + 0x78]
1009497d  7d17                           jge 0x10094996
1009497f  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
10094982  3bd1                           cmp edx, ecx
10094984  7d10                           jge 0x10094996
10094986  8b8390000000                   mov eax, dword ptr [ebx + 0x90]
1009498c  0fafcf                         imul ecx, edi
1009498f  03ca                           add ecx, edx
10094991  8b0c88                         mov ecx, dword ptr [eax + ecx*4]
10094994  eb02                           jmp 0x10094998
10094996  33c9                           xor ecx, ecx
10094998  ff750c                         push dword ptr [ebp + 0xc]
1009499b  8d442434                       lea eax, [esp + 0x34]
1009499f  50                             push eax
100949a0  8b01                           mov eax, dword ptr [ecx]
100949a2  ff5008                         call dword ptr [eax + 8]
100949a5  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
100949a9  8b10                           mov edx, dword ptr [eax]
100949ab  8b4004                         mov eax, dword ptr [eax + 4]
100949ae  39442418                       cmp dword ptr [esp + 0x18], eax
100949b2  0f4f442418                     cmovg eax, dword ptr [esp + 0x18]
100949b7  89442418                       mov dword ptr [esp + 0x18], eax
100949bb  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
100949c1  391488                         cmp dword ptr [eax + ecx*4], edx
100949c4  8d0c88                         lea ecx, [eax + ecx*4]
100949c7  0f4f11                         cmovg edx, dword ptr [ecx]
100949ca  8911                           mov dword ptr [ecx], edx
100949cc  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
100949d0  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
100949d6  8b3488                         mov esi, dword ptr [eax + ecx*4]
100949d9  41                             inc ecx
100949da  8b442414                       mov eax, dword ptr [esp + 0x14]
100949de  03742424                       add esi, dword ptr [esp + 0x24]
100949e2  40                             inc eax
100949e3  89442414                       mov dword ptr [esp + 0x14], eax
100949e7  894c2410                       mov dword ptr [esp + 0x10], ecx
100949eb  3b437c                         cmp eax, dword ptr [ebx + 0x7c]
100949ee  0f8c13ffffff                   jl 0x10094907
100949f4  eb0c                           jmp 0x10094a02
100949f6  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
100949fc  8b30                           mov esi, dword ptr [eax]
100949fe  03742428                       add esi, dword ptr [esp + 0x28]
10094a02  3974241c                       cmp dword ptr [esp + 0x1c], esi
10094a06  6a64                           push 0x64
10094a08  0f4f742420                     cmovg esi, dword ptr [esp + 0x20]
10094a0d  6a0f                           push 0xf
10094a0f  ff7308                         push dword ptr [ebx + 8]
10094a12  8bc6                           mov eax, esi
10094a14  89442428                       mov dword ptr [esp + 0x28], eax
10094a18  ff15c8e20a10                   call dword ptr [0x100ae2c8]
10094a1e  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
10094a22  03c1                           add eax, ecx
10094a24  8b542420                       mov edx, dword ptr [esp + 0x20]
10094a28  03d0                           add edx, eax
10094a2a  8b8380000000                   mov eax, dword ptr [ebx + 0x80]
10094a30  89542420                       mov dword ptr [esp + 0x20], edx
10094a34  890cb8                         mov dword ptr [eax + edi*4], ecx
10094a37  47                             inc edi
10094a38  8b4378                         mov eax, dword ptr [ebx + 0x78]
10094a3b  3bf8                           cmp edi, eax
10094a3d  0f8c92feffff                   jl 0x100948d5
10094a43  837b7c01                       cmp dword ptr [ebx + 0x7c], 1
10094a47  7e1a                           jle 0x10094a63
10094a49  8b8b84000000                   mov ecx, dword ptr [ebx + 0x84]
10094a4f  8b8388000000                   mov eax, dword ptr [ebx + 0x88]
10094a55  0101                           add dword ptr [ecx], eax
10094a57  8bbb88000000                   mov edi, dword ptr [ebx + 0x88]
10094a5d  03fe                           add edi, esi
10094a5f  8bf7                           mov esi, edi
10094a61  eb04                           jmp 0x10094a67
10094a63  8b7c241c                       mov edi, dword ptr [esp + 0x1c]
10094a67  837b0474                       cmp dword ptr [ebx + 4], 0x74
10094a6b  7528                           jne 0x10094a95
10094a6d  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
10094a70  83f902                         cmp ecx, 2
10094a73  7e20                           jle 0x10094a95
10094a75  837b7801                       cmp dword ptr [ebx + 0x78], 1
10094a79  7e1a                           jle 0x10094a95
10094a7b  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
10094a81  8d0c88                         lea ecx, [eax + ecx*4]
10094a84  8b8394000000                   mov eax, dword ptr [ebx + 0x94]
10094a8a  0141fc                         add dword ptr [ecx - 4], eax
10094a8d  8bbb94000000                   mov edi, dword ptr [ebx + 0x94]
10094a93  03fe                           add edi, esi
10094a95  8b4c2420                       mov ecx, dword ptr [esp + 0x20]
10094a99  8bc2                           mov eax, edx
10094a9b  89535c                         mov dword ptr [ebx + 0x5c], edx
10094a9e  99                             cdq 
10094a9f  2bc2                           sub eax, edx
10094aa1  897b58                         mov dword ptr [ebx + 0x58], edi
10094aa4  d1f8                           sar eax, 1
10094aa6  f7d8                           neg eax
10094aa8  894354                         mov dword ptr [ebx + 0x54], eax
10094aab  8b4508                         mov eax, dword ptr [ebp + 8]
10094aae  8938                           mov dword ptr [eax], edi
10094ab0  5f                             pop edi
10094ab1  5e                             pop esi
10094ab2  894804                         mov dword ptr [eax + 4], ecx
10094ab5  5b                             pop ebx
10094ab6  8be5                           mov esp, ebp
10094ab8  5d                             pop ebp
10094ab9  c20800                         ret 8
10094abc  cc                             int3 
10094abd  cc                             int3 
10094abe  cc                             int3 
10094abf  cc                             int3 
