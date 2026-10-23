; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10086e10 <= VA < 0x10086e90 (next decompiler entry; may include padding/thunks)
10086e10  55                             push ebp
10086e11  8bec                           mov ebp, esp
10086e13  83ec0c                         sub esp, 0xc
10086e16  53                             push ebx
10086e17  8b5d08                         mov ebx, dword ptr [ebp + 8]
10086e1a  56                             push esi
10086e1b  8bf1                           mov esi, ecx
10086e1d  57                             push edi
10086e1e  8b4e10                         mov ecx, dword ptr [esi + 0x10]
10086e21  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
10086e28  8d8158080000                   lea eax, [ecx + 0x858]
10086e2e  7202                           jb 0x10086e32
10086e30  8b00                           mov eax, dword ptr [eax]
10086e32  8b7d0c                         mov edi, dword ptr [ebp + 0xc]
10086e35  50                             push eax
10086e36  57                             push edi
10086e37  e824d7ffff                     call 0x10084560
10086e3c  32c9                           xor cl, cl
10086e3e  397e58                         cmp dword ptr [esi + 0x58], edi
10086e41  7504                           jne 0x10086e47
10086e43  b101                           mov cl, 1
10086e45  eb09                           jmp 0x10086e50
10086e47  8b4630                         mov eax, dword ptr [esi + 0x30]
10086e4a  897e58                         mov dword ptr [esi + 0x58], edi
10086e4d  897808                         mov dword ptr [eax + 8], edi
10086e50  8b5630                         mov edx, dword ptr [esi + 0x30]
10086e53  8b02                           mov eax, dword ptr [edx]
10086e55  8b7008                         mov esi, dword ptr [eax + 8]
10086e58  84c9                           test cl, cl
10086e5a  7406                           je 0x10086e62
10086e5c  0fb6c1                         movzx eax, cl
10086e5f  50                             push eax
10086e60  eb02                           jmp 0x10086e64
10086e62  6a00                           push 0
10086e64  8d45f8                         lea eax, [ebp - 8]
10086e67  8bca                           mov ecx, edx
10086e69  50                             push eax
10086e6a  ffd6                           call esi
10086e6c  5f                             pop edi
10086e6d  5e                             pop esi
10086e6e  8b08                           mov ecx, dword ptr [eax]
10086e70  8b4004                         mov eax, dword ptr [eax + 4]
10086e73  890b                           mov dword ptr [ebx], ecx
10086e75  894304                         mov dword ptr [ebx + 4], eax
10086e78  8bc3                           mov eax, ebx
10086e7a  5b                             pop ebx
10086e7b  8be5                           mov esp, ebp
10086e7d  5d                             pop ebp
10086e7e  c20800                         ret 8
10086e81  cc                             int3 
10086e82  cc                             int3 
10086e83  cc                             int3 
10086e84  cc                             int3 
10086e85  cc                             int3 
10086e86  cc                             int3 
10086e87  cc                             int3 
10086e88  cc                             int3 
10086e89  cc                             int3 
10086e8a  cc                             int3 
10086e8b  cc                             int3 
10086e8c  cc                             int3 
10086e8d  cc                             int3 
10086e8e  cc                             int3 
10086e8f  cc                             int3 
