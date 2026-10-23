; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100844d0 <= VA < 0x10084560 (next decompiler entry; may include padding/thunks)
100844d0  55                             push ebp
100844d1  8bec                           mov ebp, esp
100844d3  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
100844da  8d9158080000                   lea edx, [ecx + 0x858]
100844e0  7202                           jb 0x100844e4
100844e2  8b12                           mov edx, dword ptr [edx]
100844e4  8b4508                         mov eax, dword ptr [ebp + 8]
100844e7  89818c030000                   mov dword ptr [ecx + 0x38c], eax
100844ed  8981f8020000                   mov dword ptr [ecx + 0x2f8], eax
100844f3  898164020000                   mov dword ptr [ecx + 0x264], eax
100844f9  8981d0010000                   mov dword ptr [ecx + 0x1d0], eax
100844ff  89813c010000                   mov dword ptr [ecx + 0x13c], eax
10084505  8981a8000000                   mov dword ptr [ecx + 0xa8], eax
1008450b  894114                         mov dword ptr [ecx + 0x14], eax
1008450e  898148080000                   mov dword ptr [ecx + 0x848], eax
10084514  8b450c                         mov eax, dword ptr [ebp + 0xc]
10084517  898194030000                   mov dword ptr [ecx + 0x394], eax
1008451d  898100030000                   mov dword ptr [ecx + 0x300], eax
10084523  89816c020000                   mov dword ptr [ecx + 0x26c], eax
10084529  8981d8010000                   mov dword ptr [ecx + 0x1d8], eax
1008452f  898144010000                   mov dword ptr [ecx + 0x144], eax
10084535  8981b0000000                   mov dword ptr [ecx + 0xb0], eax
1008453b  89411c                         mov dword ptr [ecx + 0x1c], eax
1008453e  89814c080000                   mov dword ptr [ecx + 0x84c], eax
10084544  89550c                         mov dword ptr [ebp + 0xc], edx
10084547  8d4104                         lea eax, [ecx + 4]
1008454a  894508                         mov dword ptr [ebp + 8], eax
1008454d  5d                             pop ebp
1008454e  e91d020000                     jmp 0x10084770
10084553  cc                             int3 
10084554  cc                             int3 
10084555  cc                             int3 
10084556  cc                             int3 
10084557  cc                             int3 
10084558  cc                             int3 
10084559  cc                             int3 
1008455a  cc                             int3 
1008455b  cc                             int3 
1008455c  cc                             int3 
1008455d  cc                             int3 
1008455e  cc                             int3 
1008455f  cc                             int3 
