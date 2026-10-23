; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008f650 <= VA < 0x1008f810 (next decompiler entry; may include padding/thunks)
1008f650  55                             push ebp
1008f651  8bec                           mov ebp, esp
1008f653  83ec18                         sub esp, 0x18
1008f656  53                             push ebx
1008f657  8bd9                           mov ebx, ecx
1008f659  56                             push esi
1008f65a  57                             push edi
1008f65b  895df0                         mov dword ptr [ebp - 0x10], ebx
1008f65e  8b7374                         mov esi, dword ptr [ebx + 0x74]
1008f661  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1008f668  8dbe58080000                   lea edi, [esi + 0x858]
1008f66e  8975f4                         mov dword ptr [ebp - 0xc], esi
1008f671  8bc7                           mov eax, edi
1008f673  7202                           jb 0x1008f677
1008f675  8b07                           mov eax, dword ptr [edi]
1008f677  50                             push eax
1008f678  ff7308                         push dword ptr [ebx + 8]
1008f67b  8bce                           mov ecx, esi
1008f67d  e8de4effff                     call 0x10084560
1008f682  ffb64c080000                   push dword ptr [esi + 0x84c]
1008f688  6a64                           push 0x64
1008f68a  ffb380000000                   push dword ptr [ebx + 0x80]
1008f690  ffb648080000                   push dword ptr [esi + 0x848]
1008f696  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008f69c  50                             push eax
1008f69d  8bce                           mov ecx, esi
1008f69f  e82c4effff                     call 0x100844d0
1008f6a4  8b4368                         mov eax, dword ptr [ebx + 0x68]
1008f6a7  6a64                           push 0x64
1008f6a9  6a05                           push 5
1008f6ab  ff7308                         push dword ptr [ebx + 8]
1008f6ae  8b8080000000                   mov eax, dword ptr [eax + 0x80]
1008f6b4  034350                         add eax, dword ptr [ebx + 0x50]
1008f6b7  8945fc                         mov dword ptr [ebp - 4], eax
1008f6ba  8b8390000000                   mov eax, dword ptr [ebx + 0x90]
1008f6c0  8945f8                         mov dword ptr [ebp - 8], eax
1008f6c3  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008f6c9  3945f8                         cmp dword ptr [ebp - 8], eax
1008f6cc  7e05                           jle 0x1008f6d3
1008f6ce  8b45f8                         mov eax, dword ptr [ebp - 8]
1008f6d1  eb0d                           jmp 0x1008f6e0
1008f6d3  6a64                           push 0x64
1008f6d5  6a05                           push 5
1008f6d7  ff7308                         push dword ptr [ebx + 8]
1008f6da  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008f6e0  8b4b68                         mov ecx, dword ptr [ebx + 0x68]
1008f6e3  685ce00000                     push 0xe05c
1008f6e8  8b497c                         mov ecx, dword ptr [ecx + 0x7c]
1008f6eb  034b54                         add ecx, dword ptr [ebx + 0x54]
1008f6ee  03c8                           add ecx, eax
1008f6f0  8b838c000000                   mov eax, dword ptr [ebx + 0x8c]
1008f6f6  f7d8                           neg eax
1008f6f8  894df8                         mov dword ptr [ebp - 8], ecx
1008f6fb  51                             push ecx
1008f6fc  33c9                           xor ecx, ecx
1008f6fe  85c0                           test eax, eax
1008f700  0f4ec1                         cmovle eax, ecx
1008f703  8bce                           mov ecx, esi
1008f705  0345fc                         add eax, dword ptr [ebp - 4]
1008f708  50                             push eax
1008f709  e82252ffff                     call 0x10084930
1008f70e  8b8b90000000                   mov ecx, dword ptr [ebx + 0x90]
1008f714  33c0                           xor eax, eax
1008f716  8b7378                         mov esi, dword ptr [ebx + 0x78]
1008f719  85c9                           test ecx, ecx
1008f71b  ff7508                         push dword ptr [ebp + 8]
1008f71e  0f49c8                         cmovns ecx, eax
1008f721  8b4368                         mov eax, dword ptr [ebx + 0x68]
1008f724  8b507c                         mov edx, dword ptr [eax + 0x7c]
1008f727  8b838c000000                   mov eax, dword ptr [ebx + 0x8c]
1008f72d  2bd1                           sub edx, ecx
1008f72f  2b5654                         sub edx, dword ptr [esi + 0x54]
1008f732  33c9                           xor ecx, ecx
1008f734  035354                         add edx, dword ptr [ebx + 0x54]
1008f737  85c0                           test eax, eax
1008f739  0f4ec1                         cmovle eax, ecx
1008f73c  0345fc                         add eax, dword ptr [ebp - 4]
1008f73f  898680000000                   mov dword ptr [esi + 0x80], eax
1008f745  8b4378                         mov eax, dword ptr [ebx + 0x78]
1008f748  89507c                         mov dword ptr [eax + 0x7c], edx
1008f74b  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1008f74e  8b01                           mov eax, dword ptr [ecx]
1008f750  ff5004                         call dword ptr [eax + 4]
1008f753  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
1008f759  0145fc                         add dword ptr [ebp - 4], eax
1008f75c  837f1408                       cmp dword ptr [edi + 0x14], 8
1008f760  8b437c                         mov eax, dword ptr [ebx + 0x7c]
1008f763  8b4858                         mov ecx, dword ptr [eax + 0x58]
1008f766  8bc7                           mov eax, edi
1008f768  894d08                         mov dword ptr [ebp + 8], ecx
1008f76b  7202                           jb 0x1008f76f
1008f76d  8b07                           mov eax, dword ptr [edi]
1008f76f  8b75f4                         mov esi, dword ptr [ebp - 0xc]
1008f772  8bce                           mov ecx, esi
1008f774  50                             push eax
1008f775  ff7308                         push dword ptr [ebx + 8]
1008f778  e8e34dffff                     call 0x10084560
1008f77d  8b3dc8e20a10                   mov edi, dword ptr [0x100ae2c8]
1008f783  6a64                           push 0x64
1008f785  6a02                           push 2
1008f787  ff7308                         push dword ptr [ebx + 8]
1008f78a  ffd7                           call edi
1008f78c  6a64                           push 0x64
1008f78e  6a12                           push 0x12
1008f790  ffb648080000                   push dword ptr [esi + 0x848]
1008f796  8bd8                           mov ebx, eax
1008f798  f7db                           neg ebx
1008f79a  ffd7                           call edi
1008f79c  8bb648080000                   mov esi, dword ptr [esi + 0x848]
1008f7a2  8bf8                           mov edi, eax
1008f7a4  8b45f0                         mov eax, dword ptr [ebp - 0x10]
1008f7a7  f7df                           neg edi
1008f7a9  6a64                           push 0x64
1008f7ab  6a11                           push 0x11
1008f7ad  ff7008                         push dword ptr [eax + 8]
1008f7b0  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008f7b6  034508                         add eax, dword ptr [ebp + 8]
1008f7b9  50                             push eax
1008f7ba  56                             push esi
1008f7bb  8b75f4                         mov esi, dword ptr [ebp - 0xc]
1008f7be  8bce                           mov ecx, esi
1008f7c0  e80b4dffff                     call 0x100844d0
1008f7c5  8b45f8                         mov eax, dword ptr [ebp - 8]
1008f7c8  8bce                           mov ecx, esi
1008f7ca  03c7                           add eax, edi
1008f7cc  686de00000                     push 0xe06d
1008f7d1  50                             push eax
1008f7d2  8b45fc                         mov eax, dword ptr [ebp - 4]
1008f7d5  03c3                           add eax, ebx
1008f7d7  50                             push eax
1008f7d8  e85351ffff                     call 0x10084930
1008f7dd  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1008f7e4  8b45f0                         mov eax, dword ptr [ebp - 0x10]
1008f7e7  8b4808                         mov ecx, dword ptr [eax + 8]
1008f7ea  8d8658080000                   lea eax, [esi + 0x858]
1008f7f0  7202                           jb 0x1008f7f4
1008f7f2  8b00                           mov eax, dword ptr [eax]
1008f7f4  50                             push eax
1008f7f5  51                             push ecx
1008f7f6  8bce                           mov ecx, esi
1008f7f8  e8634dffff                     call 0x10084560
1008f7fd  5f                             pop edi
1008f7fe  5e                             pop esi
1008f7ff  5b                             pop ebx
1008f800  8be5                           mov esp, ebp
1008f802  5d                             pop ebp
1008f803  c20400                         ret 4
1008f806  cc                             int3 
1008f807  cc                             int3 
1008f808  cc                             int3 
1008f809  cc                             int3 
1008f80a  cc                             int3 
1008f80b  cc                             int3 
1008f80c  cc                             int3 
1008f80d  cc                             int3 
1008f80e  cc                             int3 
1008f80f  cc                             int3 
