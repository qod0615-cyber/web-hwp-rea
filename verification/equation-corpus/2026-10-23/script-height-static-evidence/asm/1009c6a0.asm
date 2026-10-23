; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009c6a0 <= VA < 0x1009c970 (next decompiler entry; may include padding/thunks)
1009c6a0  55                             push ebp
1009c6a1  8bec                           mov ebp, esp
1009c6a3  6aff                           push -1
1009c6a5  68abce0a10                     push 0x100aceab
1009c6aa  64a100000000                   mov eax, dword ptr fs:[0]
1009c6b0  50                             push eax
1009c6b1  81ec8c000000                   sub esp, 0x8c
1009c6b7  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009c6bc  33c5                           xor eax, ebp
1009c6be  8945f0                         mov dword ptr [ebp - 0x10], eax
1009c6c1  53                             push ebx
1009c6c2  56                             push esi
1009c6c3  57                             push edi
1009c6c4  50                             push eax
1009c6c5  8d45f4                         lea eax, [ebp - 0xc]
1009c6c8  64a300000000                   mov dword ptr fs:[0], eax
1009c6ce  8bd9                           mov ebx, ecx
1009c6d0  899d74ffffff                   mov dword ptr [ebp - 0x8c], ebx
1009c6d6  8b4508                         mov eax, dword ptr [ebp + 8]
1009c6d9  898578ffffff                   mov dword ptr [ebp - 0x88], eax
1009c6df  8b4374                         mov eax, dword ptr [ebx + 0x74]
1009c6e2  83b86c08000008                 cmp dword ptr [eax + 0x86c], 8
1009c6e9  8db858080000                   lea edi, [eax + 0x858]
1009c6ef  894584                         mov dword ptr [ebp - 0x7c], eax
1009c6f2  8bcf                           mov ecx, edi
1009c6f4  89bd70ffffff                   mov dword ptr [ebp - 0x90], edi
1009c6fa  7202                           jb 0x1009c6fe
1009c6fc  8b0f                           mov ecx, dword ptr [edi]
1009c6fe  51                             push ecx
1009c6ff  ff7308                         push dword ptr [ebx + 8]
1009c702  8bc8                           mov ecx, eax
1009c704  e8577efeff                     call 0x10084560
1009c709  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009c70c  8b707c                         mov esi, dword ptr [eax + 0x7c]
1009c70f  8b9080000000                   mov edx, dword ptr [eax + 0x80]
1009c715  8b4584                         mov eax, dword ptr [ebp - 0x7c]
1009c718  037354                         add esi, dword ptr [ebx + 0x54]
1009c71b  035350                         add edx, dword ptr [ebx + 0x50]
1009c71e  89b57cffffff                   mov dword ptr [ebp - 0x84], esi
1009c724  833800                         cmp dword ptr [eax], 0
1009c727  8db858080000                   lea edi, [eax + 0x858]
1009c72d  899568ffffff                   mov dword ptr [ebp - 0x98], edx
1009c733  0f84b5000000                   je 0x1009c7ee
1009c739  8b7b58                         mov edi, dword ptr [ebx + 0x58]
1009c73c  8d4dbc                         lea ecx, [ebp - 0x44]
1009c73f  03735c                         add esi, dword ptr [ebx + 0x5c]
1009c742  03fa                           add edi, edx
1009c744  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009c74a  6a01                           push 1
1009c74c  8d4dbc                         lea ecx, [ebp - 0x44]
1009c74f  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009c756  ff1550ff0d10                   call dword ptr [0x100dff50]
1009c75c  6a01                           push 1
1009c75e  8d4dbc                         lea ecx, [ebp - 0x44]
1009c761  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009c767  6a00                           push 0
1009c769  8d4dbc                         lea ecx, [ebp - 0x44]
1009c76c  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009c772  8d4d80                         lea ecx, [ebp - 0x80]
1009c775  ff15e4fe0d10                   call dword ptr [0x100dfee4]
1009c77b  68ffffff00                     push 0xffffff
1009c780  8d4d80                         lea ecx, [ebp - 0x80]
1009c783  c645fc01                       mov byte ptr [ebp - 4], 1
1009c787  ff154cff0d10                   call dword ptr [0x100dff4c]
1009c78d  8b4d84                         mov ecx, dword ptr [ebp - 0x7c]
1009c790  8d45bc                         lea eax, [ebp - 0x44]
1009c793  50                             push eax
1009c794  8b09                           mov ecx, dword ptr [ecx]
1009c796  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009c79c  8d4580                         lea eax, [ebp - 0x80]
1009c79f  50                             push eax
1009c7a0  8b4584                         mov eax, dword ptr [ebp - 0x7c]
1009c7a3  8b08                           mov ecx, dword ptr [eax]
1009c7a5  ff1564fe0d10                   call dword ptr [0x100dfe64]
1009c7ab  8b8d68ffffff                   mov ecx, dword ptr [ebp - 0x98]
1009c7b1  8b857cffffff                   mov eax, dword ptr [ebp - 0x84]
1009c7b7  6a00                           push 0
1009c7b9  56                             push esi
1009c7ba  51                             push ecx
1009c7bb  56                             push esi
1009c7bc  57                             push edi
1009c7bd  50                             push eax
1009c7be  57                             push edi
1009c7bf  50                             push eax
1009c7c0  8b4584                         mov eax, dword ptr [ebp - 0x7c]
1009c7c3  51                             push ecx
1009c7c4  8b08                           mov ecx, dword ptr [eax]
1009c7c6  ff1500fe0d10                   call dword ptr [0x100dfe00]
1009c7cc  8d4d80                         lea ecx, [ebp - 0x80]
1009c7cf  ff15e0fe0d10                   call dword ptr [0x100dfee0]
1009c7d5  8d4dbc                         lea ecx, [ebp - 0x44]
1009c7d8  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
1009c7df  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009c7e5  8bbd70ffffff                   mov edi, dword ptr [ebp - 0x90]
1009c7eb  8b4584                         mov eax, dword ptr [ebp - 0x7c]
1009c7ee  837f1408                       cmp dword ptr [edi + 0x14], 8
1009c7f2  7202                           jb 0x1009c7f6
1009c7f4  8b3f                           mov edi, dword ptr [edi]
1009c7f6  57                             push edi
1009c7f7  ff7308                         push dword ptr [ebx + 8]
1009c7fa  8bc8                           mov ecx, eax
1009c7fc  e85f7dfeff                     call 0x10084560
1009c801  8b7368                         mov esi, dword ptr [ebx + 0x68]
1009c804  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009c807  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009c80a  99                             cdq 
1009c80b  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009c811  2bc2                           sub eax, edx
1009c813  037b50                         add edi, dword ptr [ebx + 0x50]
1009c816  8bd8                           mov ebx, eax
1009c818  d1fb                           sar ebx, 1
1009c81a  03df                           add ebx, edi
1009c81c  897d84                         mov dword ptr [ebp - 0x7c], edi
1009c81f  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009c822  8bb574ffffff                   mov esi, dword ptr [ebp - 0x8c]
1009c828  898d70ffffff                   mov dword ptr [ebp - 0x90], ecx
1009c82e  8b7678                         mov esi, dword ptr [esi + 0x78]
1009c831  8b4658                         mov eax, dword ptr [esi + 0x58]
1009c834  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009c837  99                             cdq 
1009c838  2bc2                           sub eax, edx
1009c83a  898d70ffffff                   mov dword ptr [ebp - 0x90], ecx
1009c840  d1f8                           sar eax, 1
1009c842  2bd8                           sub ebx, eax
1009c844  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009c84a  8b9d74ffffff                   mov ebx, dword ptr [ebp - 0x8c]
1009c850  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009c853  89787c                         mov dword ptr [eax + 0x7c], edi
1009c856  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009c859  8bbd78ffffff                   mov edi, dword ptr [ebp - 0x88]
1009c85f  57                             push edi
1009c860  8b01                           mov eax, dword ptr [ecx]
1009c862  ff5004                         call dword ptr [eax + 4]
1009c865  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009c868  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009c86f  8d8658080000                   lea eax, [esi + 0x858]
1009c875  7202                           jb 0x1009c879
1009c877  8b00                           mov eax, dword ptr [eax]
1009c879  50                             push eax
1009c87a  ff7308                         push dword ptr [ebx + 8]
1009c87d  8bce                           mov ecx, esi
1009c87f  e8dc7cfeff                     call 0x10084560
1009c884  3bfb                           cmp edi, ebx
1009c886  0f85a9000000                   jne 0x1009c935
1009c88c  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009c88f  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009c892  89957cffffff                   mov dword ptr [ebp - 0x84], edx
1009c898  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009c89b  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009c89e  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009c8a1  03c1                           add eax, ecx
1009c8a3  899570ffffff                   mov dword ptr [ebp - 0x90], edx
1009c8a9  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009c8b0  898578ffffff                   mov dword ptr [ebp - 0x88], eax
1009c8b6  747d                           je 0x1009c935
1009c8b8  833e00                         cmp dword ptr [esi], 0
1009c8bb  7478                           je 0x1009c935
1009c8bd  8d4d88                         lea ecx, [ebp - 0x78]
1009c8c0  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009c8c6  6a01                           push 1
1009c8c8  8d4d88                         lea ecx, [ebp - 0x78]
1009c8cb  c745fc02000000                 mov dword ptr [ebp - 4], 2
1009c8d2  ff1550ff0d10                   call dword ptr [0x100dff50]
1009c8d8  6a01                           push 1
1009c8da  8d4d88                         lea ecx, [ebp - 0x78]
1009c8dd  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009c8e3  68ff000000                     push 0xff
1009c8e8  8d4d88                         lea ecx, [ebp - 0x78]
1009c8eb  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009c8f1  8b0e                           mov ecx, dword ptr [esi]
1009c8f3  8d4588                         lea eax, [ebp - 0x78]
1009c8f6  50                             push eax
1009c8f7  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009c8fd  8b8578ffffff                   mov eax, dword ptr [ebp - 0x88]
1009c903  8d4d88                         lea ecx, [ebp - 0x78]
1009c906  8b7d84                         mov edi, dword ptr [ebp - 0x7c]
1009c909  898674080000                   mov dword ptr [esi + 0x874], eax
1009c90f  8b8570ffffff                   mov eax, dword ptr [ebp - 0x90]
1009c915  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009c91b  8b857cffffff                   mov eax, dword ptr [ebp - 0x84]
1009c921  89be70080000                   mov dword ptr [esi + 0x870], edi
1009c927  898678080000                   mov dword ptr [esi + 0x878], eax
1009c92d  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009c933  eb03                           jmp 0x1009c938
1009c935  8b7d84                         mov edi, dword ptr [ebp - 0x7c]
1009c938  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009c93b  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009c93e  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009c941  03c1                           add eax, ecx
1009c943  897b48                         mov dword ptr [ebx + 0x48], edi
1009c946  89434c                         mov dword ptr [ebx + 0x4c], eax
1009c949  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009c94c  64890d00000000                 mov dword ptr fs:[0], ecx
1009c953  59                             pop ecx
1009c954  5f                             pop edi
1009c955  5e                             pop esi
1009c956  5b                             pop ebx
1009c957  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009c95a  33cd                           xor ecx, ebp
1009c95c  e8f65f0000                     call 0x100a2957
1009c961  8be5                           mov esp, ebp
1009c963  5d                             pop ebp
1009c964  c20400                         ret 4
1009c967  cc                             int3 
1009c968  cc                             int3 
1009c969  cc                             int3 
1009c96a  cc                             int3 
1009c96b  cc                             int3 
1009c96c  cc                             int3 
1009c96d  cc                             int3 
1009c96e  cc                             int3 
1009c96f  cc                             int3 
