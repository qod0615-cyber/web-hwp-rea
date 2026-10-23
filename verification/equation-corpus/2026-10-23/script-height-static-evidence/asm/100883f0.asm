; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100883f0 <= VA < 0x100884e0 (next decompiler entry; may include padding/thunks)
100883f0  55                             push ebp
100883f1  8bec                           mov ebp, esp
100883f3  83e4f0                         and esp, 0xfffffff0
100883f6  83ec38                         sub esp, 0x38
100883f9  a10c100d10                     mov eax, dword ptr [0x100d100c]
100883fe  33c4                           xor eax, esp
10088400  89442434                       mov dword ptr [esp + 0x34], eax
10088404  56                             push esi
10088405  8bf1                           mov esi, ecx
10088407  57                             push edi
10088408  8b7e60                         mov edi, dword ptr [esi + 0x60]
1008840b  85ff                           test edi, edi
1008840d  7534                           jne 0x10088443
1008840f  6a09                           push 9
10088411  685c0d0b10                     push 0x100b0d5c
10088416  8d4e0c                         lea ecx, [esi + 0xc]
10088419  897e40                         mov dword ptr [esi + 0x40], edi
1008841c  897e3c                         mov dword ptr [esi + 0x3c], edi
1008841f  c74608e8030000                 mov dword ptr [esi + 8], 0x3e8
10088426  e8a5d6f7ff                     call 0x10005ad0
1008842b  c7465000000000                 mov dword ptr [esi + 0x50], 0
10088432  5f                             pop edi
10088433  5e                             pop esi
10088434  8b4c2434                       mov ecx, dword ptr [esp + 0x34]
10088438  33cc                           xor ecx, esp
1008843a  e818a50100                     call 0x100a2957
1008843f  8be5                           mov esp, ebp
10088441  5d                             pop ebp
10088442  c3                             ret 
10088443  8b473c                         mov eax, dword ptr [edi + 0x3c]
10088446  8d4c2410                       lea ecx, [esp + 0x10]
1008844a  89463c                         mov dword ptr [esi + 0x3c], eax
1008844d  8b4708                         mov eax, dword ptr [edi + 8]
10088450  894608                         mov dword ptr [esi + 8], eax
10088453  8d470c                         lea eax, [edi + 0xc]
10088456  50                             push eax
10088457  e8a4b8fbff                     call 0x10043d00
1008845c  8d442410                       lea eax, [esp + 0x10]
10088460  8d4e0c                         lea ecx, [esi + 0xc]
10088463  3bc8                           cmp ecx, eax
10088465  7430                           je 0x10088497
10088467  e8a4d7f7ff                     call 0x10005c10
1008846c  0f10442410                     movups xmm0, xmmword ptr [esp + 0x10]
10088471  33c0                           xor eax, eax
10088473  6689442410                     mov word ptr [esp + 0x10], ax
10088478  0f11460c                       movups xmmword ptr [esi + 0xc], xmm0
1008847c  f30f7e442420                   movq xmm0, qword ptr [esp + 0x20]
10088482  660fd6461c                     movq qword ptr [esi + 0x1c], xmm0
10088487  c744242000000000               mov dword ptr [esp + 0x20], 0
1008848f  c744242407000000               mov dword ptr [esp + 0x24], 7
10088497  8d4c2410                       lea ecx, [esp + 0x10]
1008849b  e870d7f7ff                     call 0x10005c10
100884a0  8b4604                         mov eax, dword ptr [esi + 4]
100884a3  83f81f                         cmp eax, 0x1f
100884a6  740b                           je 0x100884b3
100884a8  83f820                         cmp eax, 0x20
100884ab  7406                           je 0x100884b3
100884ad  8b4740                         mov eax, dword ptr [edi + 0x40]
100884b0  894640                         mov dword ptr [esi + 0x40], eax
100884b3  837f6000                       cmp dword ptr [edi + 0x60], 0
100884b7  0f846effffff                   je 0x1008842b
100884bd  8b4750                         mov eax, dword ptr [edi + 0x50]
100884c0  034758                         add eax, dword ptr [edi + 0x58]
100884c3  8b4c243c                       mov ecx, dword ptr [esp + 0x3c]
100884c7  5f                             pop edi
100884c8  894650                         mov dword ptr [esi + 0x50], eax
100884cb  5e                             pop esi
100884cc  33cc                           xor ecx, esp
100884ce  e884a40100                     call 0x100a2957
100884d3  8be5                           mov esp, ebp
100884d5  5d                             pop ebp
100884d6  c3                             ret 
100884d7  cc                             int3 
100884d8  cc                             int3 
100884d9  cc                             int3 
100884da  cc                             int3 
100884db  cc                             int3 
100884dc  cc                             int3 
100884dd  cc                             int3 
100884de  cc                             int3 
100884df  cc                             int3 
