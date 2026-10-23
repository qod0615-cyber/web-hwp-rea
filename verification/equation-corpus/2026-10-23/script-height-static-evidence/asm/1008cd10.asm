; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008cd10 <= VA < 0x1008ce50 (next decompiler entry; may include padding/thunks)
1008cd10  55                             push ebp
1008cd11  8bec                           mov ebp, esp
1008cd13  83e4f8                         and esp, 0xfffffff8
1008cd16  83ec24                         sub esp, 0x24
1008cd19  53                             push ebx
1008cd1a  8b5d0c                         mov ebx, dword ptr [ebp + 0xc]
1008cd1d  56                             push esi
1008cd1e  57                             push edi
1008cd1f  8bf9                           mov edi, ecx
1008cd21  85db                           test ebx, ebx
1008cd23  741d                           je 0x1008cd42
1008cd25  837f4400                       cmp dword ptr [edi + 0x44], 0
1008cd29  7517                           jne 0x1008cd42
1008cd2b  8b4508                         mov eax, dword ptr [ebp + 8]
1008cd2e  8b5758                         mov edx, dword ptr [edi + 0x58]
1008cd31  8b4f5c                         mov ecx, dword ptr [edi + 0x5c]
1008cd34  8910                           mov dword ptr [eax], edx
1008cd36  894804                         mov dword ptr [eax + 4], ecx
1008cd39  5f                             pop edi
1008cd3a  5e                             pop esi
1008cd3b  5b                             pop ebx
1008cd3c  8be5                           mov esp, ebp
1008cd3e  5d                             pop ebp
1008cd3f  c20800                         ret 8
1008cd42  c7474400000000                 mov dword ptr [edi + 0x44], 0
1008cd49  e8a2b6ffff                     call 0x100883f0
1008cd4e  8b35c8e20a10                   mov esi, dword ptr [0x100ae2c8]
1008cd54  6a64                           push 0x64
1008cd56  6a44                           push 0x44
1008cd58  ff7708                         push dword ptr [edi + 8]
1008cd5b  ffd6                           call esi
1008cd5d  8b4f74                         mov ecx, dword ptr [edi + 0x74]
1008cd60  6a64                           push 0x64
1008cd62  ffb79c000000                   push dword ptr [edi + 0x9c]
1008cd68  8944241c                       mov dword ptr [esp + 0x1c], eax
1008cd6c  ff7708                         push dword ptr [edi + 8]
1008cd6f  894c241c                       mov dword ptr [esp + 0x1c], ecx
1008cd73  ffd6                           call esi
1008cd75  8bc8                           mov ecx, eax
1008cd77  8b442410                       mov eax, dword ptr [esp + 0x10]
1008cd7b  83b86c08000008                 cmp dword ptr [eax + 0x86c], 8
1008cd82  8d9058080000                   lea edx, [eax + 0x858]
1008cd88  7202                           jb 0x1008cd8c
1008cd8a  8b12                           mov edx, dword ptr [edx]
1008cd8c  52                             push edx
1008cd8d  51                             push ecx
1008cd8e  8bc8                           mov ecx, eax
1008cd90  e8cb77ffff                     call 0x10084560
1008cd95  0fb78798000000                 movzx eax, word ptr [edi + 0x98]
1008cd9c  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1008cda0  50                             push eax
1008cda1  8d44241c                       lea eax, [esp + 0x1c]
1008cda5  50                             push eax
1008cda6  e82584ffff                     call 0x100851d0
1008cdab  6a64                           push 0x64
1008cdad  6a4b                           push 0x4b
1008cdaf  ff742424                       push dword ptr [esp + 0x24]
1008cdb3  ffd6                           call esi
1008cdb5  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1008cdb9  8d542428                       lea edx, [esp + 0x28]
1008cdbd  8b742414                       mov esi, dword ptr [esp + 0x14]
1008cdc1  8987a4000000                   mov dword ptr [edi + 0xa4], eax
1008cdc7  8b4778                         mov eax, dword ptr [edi + 0x78]
1008cdca  898fa0000000                   mov dword ptr [edi + 0xa0], ecx
1008cdd0  53                             push ebx
1008cdd1  52                             push edx
1008cdd2  897008                         mov dword ptr [eax + 8], esi
1008cdd5  8b4f78                         mov ecx, dword ptr [edi + 0x78]
1008cdd8  8b01                           mov eax, dword ptr [ecx]
1008cdda  ff5008                         call dword ptr [eax + 8]
1008cddd  8b477c                         mov eax, dword ptr [edi + 0x7c]
1008cde0  8d542420                       lea edx, [esp + 0x20]
1008cde4  53                             push ebx
1008cde5  52                             push edx
1008cde6  897008                         mov dword ptr [eax + 8], esi
1008cde9  8b4f7c                         mov ecx, dword ptr [edi + 0x7c]
1008cdec  8b01                           mov eax, dword ptr [ecx]
1008cdee  ff5008                         call dword ptr [eax + 8]
1008cdf1  8b8fa0000000                   mov ecx, dword ptr [edi + 0xa0]
1008cdf7  8b5c2428                       mov ebx, dword ptr [esp + 0x28]
1008cdfb  8bc3                           mov eax, ebx
1008cdfd  8b542420                       mov edx, dword ptr [esp + 0x20]
1008ce01  3bcb                           cmp ecx, ebx
1008ce03  0f4fc1                         cmovg eax, ecx
1008ce06  3bc2                           cmp eax, edx
1008ce08  7e07                           jle 0x1008ce11
1008ce0a  3bcb                           cmp ecx, ebx
1008ce0c  0f4fd9                         cmovg ebx, ecx
1008ce0f  eb02                           jmp 0x1008ce13
1008ce11  8bda                           mov ebx, edx
1008ce13  8b87a4000000                   mov eax, dword ptr [edi + 0xa4]
1008ce19  8b4c2424                       mov ecx, dword ptr [esp + 0x24]
1008ce1d  895f58                         mov dword ptr [edi + 0x58], ebx
1008ce20  8d3408                         lea esi, [eax + ecx]
1008ce23  99                             cdq 
1008ce24  0374242c                       add esi, dword ptr [esp + 0x2c]
1008ce28  2bc2                           sub eax, edx
1008ce2a  d1f8                           sar eax, 1
1008ce2c  f7d9                           neg ecx
1008ce2e  2bc8                           sub ecx, eax
1008ce30  89775c                         mov dword ptr [edi + 0x5c], esi
1008ce33  8b4508                         mov eax, dword ptr [ebp + 8]
1008ce36  894f54                         mov dword ptr [edi + 0x54], ecx
1008ce39  5f                             pop edi
1008ce3a  897004                         mov dword ptr [eax + 4], esi
1008ce3d  5e                             pop esi
1008ce3e  8918                           mov dword ptr [eax], ebx
1008ce40  5b                             pop ebx
1008ce41  8be5                           mov esp, ebp
1008ce43  5d                             pop ebp
1008ce44  c20800                         ret 8
1008ce47  cc                             int3 
1008ce48  cc                             int3 
1008ce49  cc                             int3 
1008ce4a  cc                             int3 
1008ce4b  cc                             int3 
1008ce4c  cc                             int3 
1008ce4d  cc                             int3 
1008ce4e  cc                             int3 
1008ce4f  cc                             int3 
