; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100852e0 <= VA < 0x10085460 (next decompiler entry; may include padding/thunks)
100852e0  55                             push ebp
100852e1  8bec                           mov ebp, esp
100852e3  6aff                           push -1
100852e5  68b9b60a10                     push 0x100ab6b9
100852ea  64a100000000                   mov eax, dword ptr fs:[0]
100852f0  50                             push eax
100852f1  83ec08                         sub esp, 8
100852f4  53                             push ebx
100852f5  56                             push esi
100852f6  57                             push edi
100852f7  a10c100d10                     mov eax, dword ptr [0x100d100c]
100852fc  33c5                           xor eax, ebp
100852fe  50                             push eax
100852ff  8d45f4                         lea eax, [ebp - 0xc]
10085302  64a300000000                   mov dword ptr fs:[0], eax
10085308  8bf1                           mov esi, ecx
1008530a  8975f0                         mov dword ptr [ebp - 0x10], esi
1008530d  8d4e18                         lea ecx, [esi + 0x18]
10085310  ff1518ff0d10                   call dword ptr [0x100dff18]
10085316  8d5e5c                         lea ebx, [esi + 0x5c]
10085319  c745fc00000000                 mov dword ptr [ebp - 4], 0
10085320  33c0                           xor eax, eax
10085322  c7431000000000                 mov dword ptr [ebx + 0x10], 0
10085329  c7431407000000                 mov dword ptr [ebx + 0x14], 7
10085330  668903                         mov word ptr [ebx], ax
10085333  c645fc01                       mov byte ptr [ebp - 4], 1
10085337  0f57c0                         xorps xmm0, xmm0
1008533a  894614                         mov dword ptr [esi + 0x14], eax
1008533d  894610                         mov dword ptr [esi + 0x10], eax
10085340  894630                         mov dword ptr [esi + 0x30], eax
10085343  894634                         mov dword ptr [esi + 0x34], eax
10085346  8906                           mov dword ptr [esi], eax
10085348  894604                         mov dword ptr [esi + 4], eax
1008534b  894644                         mov dword ptr [esi + 0x44], eax
1008534e  89464c                         mov dword ptr [esi + 0x4c], eax
10085351  894650                         mov dword ptr [esi + 0x50], eax
10085354  6884080000                     push 0x884
10085359  660fd64674                     movq qword ptr [esi + 0x74], xmm0
1008535e  e885db0100                     call 0x100a2ee8
10085363  8bf8                           mov edi, eax
10085365  83c404                         add esp, 4
10085368  897dec                         mov dword ptr [ebp - 0x14], edi
1008536b  33c0                           xor eax, eax
1008536d  c7876808000000000000           mov dword ptr [edi + 0x868], 0
10085377  c7876c08000007000000           mov dword ptr [edi + 0x86c], 7
10085381  66898758080000                 mov word ptr [edi + 0x858], ax
10085388  c645fc03                       mov byte ptr [ebp - 4], 3
1008538c  8bcf                           mov ecx, edi
1008538e  8907                           mov dword ptr [edi], eax
10085390  8d4704                         lea eax, [edi + 4]
10085393  50                             push eax
10085394  e837f3ffff                     call 0x100846d0
10085399  6a09                           push 9
1008539b  685c0d0b10                     push 0x100b0d5c
100853a0  8d8f58080000                   lea ecx, [edi + 0x858]
100853a6  c7875008000001000000           mov dword ptr [edi + 0x850], 1
100853b0  c7875408000001000000           mov dword ptr [edi + 0x854], 1
100853ba  c7874808000000000000           mov dword ptr [edi + 0x848], 0
100853c4  c7874c08000000000000           mov dword ptr [edi + 0x84c], 0
100853ce  e8fd06f8ff                     call 0x10005ad0
100853d3  6820040000                     push 0x420
100853d8  8d8724040000                   lea eax, [edi + 0x424]
100853de  c7878008000000000000           mov dword ptr [edi + 0x880], 0
100853e8  6a00                           push 0
100853ea  50                             push eax
100853eb  e85eed0100                     call 0x100a414e
100853f0  c7874408000000000000           mov dword ptr [edi + 0x844], 0
100853fa  c645fc01                       mov byte ptr [ebp - 4], 1
100853fe  68a8000000                     push 0xa8
10085403  897e10                         mov dword ptr [esi + 0x10], edi
10085406  e8ddda0100                     call 0x100a2ee8
1008540b  83c410                         add esp, 0x10
1008540e  8945ec                         mov dword ptr [ebp - 0x14], eax
10085411  c645fc04                       mov byte ptr [ebp - 4], 4
10085415  8bc8                           mov ecx, eax
10085417  ff7610                         push dword ptr [esi + 0x10]
1008541a  6a00                           push 0
1008541c  e88f320000                     call 0x100886b0
10085421  c645fc01                       mov byte ptr [ebp - 4], 1
10085425  8bcb                           mov ecx, ebx
10085427  6a09                           push 9
10085429  894630                         mov dword ptr [esi + 0x30], eax
1008542c  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
10085432  685c0d0b10                     push 0x100b0d5c
10085437  894634                         mov dword ptr [esi + 0x34], eax
1008543a  c74658e8030000                 mov dword ptr [esi + 0x58], 0x3e8
10085441  e88a06f8ff                     call 0x10005ad0
10085446  8bc6                           mov eax, esi
10085448  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1008544b  64890d00000000                 mov dword ptr fs:[0], ecx
10085452  59                             pop ecx
10085453  5f                             pop edi
10085454  5e                             pop esi
10085455  5b                             pop ebx
10085456  8be5                           mov esp, ebp
10085458  5d                             pop ebp
10085459  c20400                         ret 4
1008545c  cc                             int3 
1008545d  cc                             int3 
1008545e  cc                             int3 
1008545f  cc                             int3 
