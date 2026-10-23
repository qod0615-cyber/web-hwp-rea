; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008d980 <= VA < 0x1008dab0 (next decompiler entry; may include padding/thunks)
1008d980  55                             push ebp
1008d981  8bec                           mov ebp, esp
1008d983  83e4f8                         and esp, 0xfffffff8
1008d986  83ec1c                         sub esp, 0x1c
1008d989  53                             push ebx
1008d98a  56                             push esi
1008d98b  8b750c                         mov esi, dword ptr [ebp + 0xc]
1008d98e  8bd9                           mov ebx, ecx
1008d990  57                             push edi
1008d991  85f6                           test esi, esi
1008d993  741d                           je 0x1008d9b2
1008d995  837b4400                       cmp dword ptr [ebx + 0x44], 0
1008d999  7517                           jne 0x1008d9b2
1008d99b  8b4508                         mov eax, dword ptr [ebp + 8]
1008d99e  8b5358                         mov edx, dword ptr [ebx + 0x58]
1008d9a1  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1008d9a4  8910                           mov dword ptr [eax], edx
1008d9a6  894804                         mov dword ptr [eax + 4], ecx
1008d9a9  5f                             pop edi
1008d9aa  5e                             pop esi
1008d9ab  5b                             pop ebx
1008d9ac  8be5                           mov esp, ebp
1008d9ae  5d                             pop ebp
1008d9af  c20800                         ret 8
1008d9b2  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1008d9b9  e832aaffff                     call 0x100883f0
1008d9be  8b7b74                         mov edi, dword ptr [ebx + 0x74]
1008d9c1  83bf6c08000008                 cmp dword ptr [edi + 0x86c], 8
1008d9c8  8d8758080000                   lea eax, [edi + 0x858]
1008d9ce  8b4b08                         mov ecx, dword ptr [ebx + 8]
1008d9d1  894c240c                       mov dword ptr [esp + 0xc], ecx
1008d9d5  7202                           jb 0x1008d9d9
1008d9d7  8b00                           mov eax, dword ptr [eax]
1008d9d9  50                             push eax
1008d9da  51                             push ecx
1008d9db  8bcf                           mov ecx, edi
1008d9dd  e87e6bffff                     call 0x10084560
1008d9e2  685be00000                     push 0xe05b
1008d9e7  8d442414                       lea eax, [esp + 0x14]
1008d9eb  8bcf                           mov ecx, edi
1008d9ed  50                             push eax
1008d9ee  e8dd77ffff                     call 0x100851d0
1008d9f3  8b7c240c                       mov edi, dword ptr [esp + 0xc]
1008d9f7  b867666666                     mov eax, 0x66666667
1008d9fc  f76c2414                       imul dword ptr [esp + 0x14]
1008da00  8b442410                       mov eax, dword ptr [esp + 0x10]
1008da04  c1fa02                         sar edx, 2
1008da07  8bca                           mov ecx, edx
1008da09  898384000000                   mov dword ptr [ebx + 0x84], eax
1008da0f  8b4378                         mov eax, dword ptr [ebx + 0x78]
1008da12  c1e91f                         shr ecx, 0x1f
1008da15  03ca                           add ecx, edx
1008da17  8d542420                       lea edx, [esp + 0x20]
1008da1b  898b88000000                   mov dword ptr [ebx + 0x88], ecx
1008da21  897808                         mov dword ptr [eax + 8], edi
1008da24  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1008da27  56                             push esi
1008da28  52                             push edx
1008da29  8b01                           mov eax, dword ptr [ecx]
1008da2b  ff5008                         call dword ptr [eax + 8]
1008da2e  8b437c                         mov eax, dword ptr [ebx + 0x7c]
1008da31  8d542418                       lea edx, [esp + 0x18]
1008da35  56                             push esi
1008da36  52                             push edx
1008da37  897808                         mov dword ptr [eax + 8], edi
1008da3a  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
1008da3d  8b01                           mov eax, dword ptr [ecx]
1008da3f  ff5008                         call dword ptr [eax + 8]
1008da42  8b8b84000000                   mov ecx, dword ptr [ebx + 0x84]
1008da48  8b742420                       mov esi, dword ptr [esp + 0x20]
1008da4c  8bc6                           mov eax, esi
1008da4e  8b542418                       mov edx, dword ptr [esp + 0x18]
1008da52  3bce                           cmp ecx, esi
1008da54  0f4fc1                         cmovg eax, ecx
1008da57  3bc2                           cmp eax, edx
1008da59  7e07                           jle 0x1008da62
1008da5b  3bce                           cmp ecx, esi
1008da5d  0f4ff1                         cmovg esi, ecx
1008da60  eb02                           jmp 0x1008da64
1008da62  8bf2                           mov esi, edx
1008da64  6a64                           push 0x64
1008da66  68f4010000                     push 0x1f4
1008da6b  ffb388000000                   push dword ptr [ebx + 0x88]
1008da71  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008da77  8b4c241c                       mov ecx, dword ptr [esp + 0x1c]
1008da7b  8d3c06                         lea edi, [esi + eax]
1008da7e  8b8388000000                   mov eax, dword ptr [ebx + 0x88]
1008da84  897b58                         mov dword ptr [ebx + 0x58], edi
1008da87  8d3408                         lea esi, [eax + ecx]
1008da8a  99                             cdq 
1008da8b  03742424                       add esi, dword ptr [esp + 0x24]
1008da8f  2bc2                           sub eax, edx
1008da91  d1f8                           sar eax, 1
1008da93  f7d9                           neg ecx
1008da95  2bc8                           sub ecx, eax
1008da97  89735c                         mov dword ptr [ebx + 0x5c], esi
1008da9a  8b4508                         mov eax, dword ptr [ebp + 8]
1008da9d  894b54                         mov dword ptr [ebx + 0x54], ecx
1008daa0  8938                           mov dword ptr [eax], edi
1008daa2  5f                             pop edi
1008daa3  897004                         mov dword ptr [eax + 4], esi
1008daa6  5e                             pop esi
1008daa7  5b                             pop ebx
1008daa8  8be5                           mov esp, ebp
1008daaa  5d                             pop ebp
1008daab  c20800                         ret 8
1008daae  cc                             int3 
1008daaf  cc                             int3 
