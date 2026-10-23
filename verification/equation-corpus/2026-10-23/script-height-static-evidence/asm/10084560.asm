; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10084560 <= VA < 0x100845e0 (next decompiler entry; may include padding/thunks)
10084560  55                             push ebp
10084561  8bec                           mov ebp, esp
10084563  8b4508                         mov eax, dword ptr [ebp + 8]
10084566  89818c030000                   mov dword ptr [ecx + 0x38c], eax
1008456c  8981f8020000                   mov dword ptr [ecx + 0x2f8], eax
10084572  898164020000                   mov dword ptr [ecx + 0x264], eax
10084578  8981d0010000                   mov dword ptr [ecx + 0x1d0], eax
1008457e  89813c010000                   mov dword ptr [ecx + 0x13c], eax
10084584  8981a8000000                   mov dword ptr [ecx + 0xa8], eax
1008458a  894114                         mov dword ptr [ecx + 0x14], eax
1008458d  898148080000                   mov dword ptr [ecx + 0x848], eax
10084593  99                             cdq 
10084594  2bc2                           sub eax, edx
10084596  d1f8                           sar eax, 1
10084598  898194030000                   mov dword ptr [ecx + 0x394], eax
1008459e  898100030000                   mov dword ptr [ecx + 0x300], eax
100845a4  89816c020000                   mov dword ptr [ecx + 0x26c], eax
100845aa  8981d8010000                   mov dword ptr [ecx + 0x1d8], eax
100845b0  898144010000                   mov dword ptr [ecx + 0x144], eax
100845b6  8981b0000000                   mov dword ptr [ecx + 0xb0], eax
100845bc  89411c                         mov dword ptr [ecx + 0x1c], eax
100845bf  89814c080000                   mov dword ptr [ecx + 0x84c], eax
100845c5  8d4104                         lea eax, [ecx + 4]
100845c8  894508                         mov dword ptr [ebp + 8], eax
100845cb  5d                             pop ebp
100845cc  e99f010000                     jmp 0x10084770
100845d1  cc                             int3 
100845d2  cc                             int3 
100845d3  cc                             int3 
100845d4  cc                             int3 
100845d5  cc                             int3 
100845d6  cc                             int3 
100845d7  cc                             int3 
100845d8  cc                             int3 
100845d9  cc                             int3 
100845da  cc                             int3 
100845db  cc                             int3 
100845dc  cc                             int3 
100845dd  cc                             int3 
100845de  cc                             int3 
100845df  cc                             int3 
