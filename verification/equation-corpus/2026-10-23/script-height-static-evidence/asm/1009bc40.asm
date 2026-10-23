; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009bc40 <= VA < 0x1009bdd0 (next decompiler entry; may include padding/thunks)
1009bc40  55                             push ebp
1009bc41  8bec                           mov ebp, esp
1009bc43  83ec1c                         sub esp, 0x1c
1009bc46  53                             push ebx
1009bc47  56                             push esi
1009bc48  8bf1                           mov esi, ecx
1009bc4a  57                             push edi
1009bc4b  8b4678                         mov eax, dword ptr [esi + 0x78]
1009bc4e  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
1009bc54  8b4864                         mov ecx, dword ptr [eax + 0x64]
1009bc57  8379046f                       cmp dword ptr [ecx + 4], 0x6f
1009bc5b  7520                           jne 0x1009bc7d
1009bc5d  b800200000                     mov eax, 0x2000
1009bc62  6603819c000000                 add ax, word ptr [ecx + 0x9c]
1009bc69  6683f819                       cmp ax, 0x19
1009bc6d  770e                           ja 0x1009bc7d
1009bc6f  8b4174                         mov eax, dword ptr [ecx + 0x74]
1009bc72  6683600e01                     and word ptr [eax + 0xe], 1
1009bc77  7404                           je 0x1009bc7d
1009bc79  33ff                           xor edi, edi
1009bc7b  eb05                           jmp 0x1009bc82
1009bc7d  bf01000000                     mov edi, 1
1009bc82  8b4668                         mov eax, dword ptr [esi + 0x68]
1009bc85  8b5e74                         mov ebx, dword ptr [esi + 0x74]
1009bc88  6a64                           push 0x64
1009bc8a  6a3c                           push 0x3c
1009bc8c  8b8080000000                   mov eax, dword ptr [eax + 0x80]
1009bc92  034650                         add eax, dword ptr [esi + 0x50]
1009bc95  ffb680000000                   push dword ptr [esi + 0x80]
1009bc9b  8945fc                         mov dword ptr [ebp - 4], eax
1009bc9e  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009bca4  8b4e78                         mov ecx, dword ptr [esi + 0x78]
1009bca7  8945f4                         mov dword ptr [ebp - 0xc], eax
1009bcaa  e831f4ffff                     call 0x1009b0e0
1009bcaf  85c0                           test eax, eax
1009bcb1  7404                           je 0x1009bcb7
1009bcb3  33c0                           xor eax, eax
1009bcb5  eb0b                           jmp 0x1009bcc2
1009bcb7  8b8684000000                   mov eax, dword ptr [esi + 0x84]
1009bcbd  99                             cdq 
1009bcbe  2bc2                           sub eax, edx
1009bcc0  d1f8                           sar eax, 1
1009bcc2  8b4e68                         mov ecx, dword ptr [esi + 0x68]
1009bcc5  c1e704                         shl edi, 4
1009bcc8  83c704                         add edi, 4
1009bccb  8b497c                         mov ecx, dword ptr [ecx + 0x7c]
1009bcce  034e54                         add ecx, dword ptr [esi + 0x54]
1009bcd1  2bc8                           sub ecx, eax
1009bcd3  8b4678                         mov eax, dword ptr [esi + 0x78]
1009bcd6  894df8                         mov dword ptr [ebp - 8], ecx
1009bcd9  8b5058                         mov edx, dword ptr [eax + 0x58]
1009bcdc  8b405c                         mov eax, dword ptr [eax + 0x5c]
1009bcdf  8945e8                         mov dword ptr [ebp - 0x18], eax
1009bce2  8b45f4                         mov eax, dword ptr [ebp - 0xc]
1009bce5  8955ec                         mov dword ptr [ebp - 0x14], edx
1009bce8  2bd0                           sub edx, eax
1009bcea  2b8680000000                   sub eax, dword ptr [esi + 0x80]
1009bcf0  8945e8                         mov dword ptr [ebp - 0x18], eax
1009bcf3  8b4608                         mov eax, dword ptr [esi + 8]
1009bcf6  8955f0                         mov dword ptr [ebp - 0x10], edx
1009bcf9  99                             cdq 
1009bcfa  f7ff                           idiv edi
1009bcfc  837df000                       cmp dword ptr [ebp - 0x10], 0
1009bd00  8bf8                           mov edi, eax
1009bd02  7d26                           jge 0x1009bd2a
1009bd04  686ee00000                     push 0xe06e
1009bd09  51                             push ecx
1009bd0a  8b4dfc                         mov ecx, dword ptr [ebp - 4]
1009bd0d  03cf                           add ecx, edi
1009bd0f  51                             push ecx
1009bd10  8bcb                           mov ecx, ebx
1009bd12  e8198cfeff                     call 0x10084930
1009bd17  2bbe80000000                   sub edi, dword ptr [esi + 0x80]
1009bd1d  b86ce00000                     mov eax, 0xe06c
1009bd22  037df4                         add edi, dword ptr [ebp - 0xc]
1009bd25  e981000000                     jmp 0x1009bdab
1009bd2a  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1009bd31  8d8b58080000                   lea ecx, [ebx + 0x858]
1009bd37  7206                           jb 0x1009bd3f
1009bd39  8b8b58080000                   mov ecx, dword ptr [ebx + 0x858]
1009bd3f  51                             push ecx
1009bd40  ff7608                         push dword ptr [esi + 8]
1009bd43  8bcb                           mov ecx, ebx
1009bd45  e81688feff                     call 0x10084560
1009bd4a  ff75ec                         push dword ptr [ebp - 0x14]
1009bd4d  8bcb                           mov ecx, ebx
1009bd4f  ffb348080000                   push dword ptr [ebx + 0x848]
1009bd55  e87687feff                     call 0x100844d0
1009bd5a  8b45fc                         mov eax, dword ptr [ebp - 4]
1009bd5d  8bcb                           mov ecx, ebx
1009bd5f  686de00000                     push 0xe06d
1009bd64  ff75f8                         push dword ptr [ebp - 8]
1009bd67  03c7                           add eax, edi
1009bd69  50                             push eax
1009bd6a  e8c18bfeff                     call 0x10084930
1009bd6f  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1009bd76  8d8358080000                   lea eax, [ebx + 0x858]
1009bd7c  7202                           jb 0x1009bd80
1009bd7e  8b00                           mov eax, dword ptr [eax]
1009bd80  50                             push eax
1009bd81  ff7608                         push dword ptr [esi + 8]
1009bd84  8bcb                           mov ecx, ebx
1009bd86  e8d587feff                     call 0x10084560
1009bd8b  8b45e8                         mov eax, dword ptr [ebp - 0x18]
1009bd8e  8bcb                           mov ecx, ebx
1009bd90  686ce00000                     push 0xe06c
1009bd95  ff75f8                         push dword ptr [ebp - 8]
1009bd98  03c7                           add eax, edi
1009bd9a  0345fc                         add eax, dword ptr [ebp - 4]
1009bd9d  50                             push eax
1009bd9e  e88d8bfeff                     call 0x10084930
1009bda3  037df0                         add edi, dword ptr [ebp - 0x10]
1009bda6  b86ee00000                     mov eax, 0xe06e
1009bdab  50                             push eax
1009bdac  ff75f8                         push dword ptr [ebp - 8]
1009bdaf  8b45fc                         mov eax, dword ptr [ebp - 4]
1009bdb2  8bcb                           mov ecx, ebx
1009bdb4  03c7                           add eax, edi
1009bdb6  50                             push eax
1009bdb7  e8748bfeff                     call 0x10084930
1009bdbc  5f                             pop edi
1009bdbd  5e                             pop esi
1009bdbe  5b                             pop ebx
1009bdbf  8be5                           mov esp, ebp
1009bdc1  5d                             pop ebp
1009bdc2  c20400                         ret 4
1009bdc5  cc                             int3 
1009bdc6  cc                             int3 
1009bdc7  cc                             int3 
1009bdc8  cc                             int3 
1009bdc9  cc                             int3 
1009bdca  cc                             int3 
1009bdcb  cc                             int3 
1009bdcc  cc                             int3 
1009bdcd  cc                             int3 
1009bdce  cc                             int3 
1009bdcf  cc                             int3 
