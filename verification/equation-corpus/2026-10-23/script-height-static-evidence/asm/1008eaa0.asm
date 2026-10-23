; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008eaa0 <= VA < 0x1008ed50 (next decompiler entry; may include padding/thunks)
1008eaa0  55                             push ebp
1008eaa1  8bec                           mov ebp, esp
1008eaa3  6aff                           push -1
1008eaa5  6859c50a10                     push 0x100ac559
1008eaaa  64a100000000                   mov eax, dword ptr fs:[0]
1008eab0  50                             push eax
1008eab1  83ec58                         sub esp, 0x58
1008eab4  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008eab9  33c5                           xor eax, ebp
1008eabb  8945f0                         mov dword ptr [ebp - 0x10], eax
1008eabe  53                             push ebx
1008eabf  56                             push esi
1008eac0  57                             push edi
1008eac1  50                             push eax
1008eac2  8d45f4                         lea eax, [ebp - 0xc]
1008eac5  64a300000000                   mov dword ptr fs:[0], eax
1008eacb  8bf1                           mov esi, ecx
1008eacd  8975b4                         mov dword ptr [ebp - 0x4c], esi
1008ead0  8b5e74                         mov ebx, dword ptr [esi + 0x74]
1008ead3  8b4508                         mov eax, dword ptr [ebp + 8]
1008ead6  8945b0                         mov dword ptr [ebp - 0x50], eax
1008ead9  895da4                         mov dword ptr [ebp - 0x5c], ebx
1008eadc  668b430e                       mov ax, word ptr [ebx + 0xe]
1008eae0  6683e001                       and ax, 1
1008eae4  0fb7c8                         movzx ecx, ax
1008eae7  894db8                         mov dword ptr [ebp - 0x48], ecx
1008eaea  6689430e                       mov word ptr [ebx + 0xe], ax
1008eaee  740a                           je 0x1008eafa
1008eaf0  c7835008000000000000           mov dword ptr [ebx + 0x850], 0
1008eafa  6a64                           push 0x64
1008eafc  ffb684000000                   push dword ptr [esi + 0x84]
1008eb02  ff7608                         push dword ptr [esi + 8]
1008eb05  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008eb0b  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1008eb12  8d8b58080000                   lea ecx, [ebx + 0x858]
1008eb18  7202                           jb 0x1008eb1c
1008eb1a  8b09                           mov ecx, dword ptr [ecx]
1008eb1c  51                             push ecx
1008eb1d  50                             push eax
1008eb1e  8bcb                           mov ecx, ebx
1008eb20  e83b5affff                     call 0x10084560
1008eb25  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1008eb28  83ec18                         sub esp, 0x18
1008eb2b  8b5e68                         mov ebx, dword ptr [esi + 0x68]
1008eb2e  8b7e50                         mov edi, dword ptr [esi + 0x50]
1008eb31  8b7658                         mov esi, dword ptr [esi + 0x58]
1008eb34  8b405c                         mov eax, dword ptr [eax + 0x5c]
1008eb37  8945ac                         mov dword ptr [ebp - 0x54], eax
1008eb3a  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1008eb3d  03bb80000000                   add edi, dword ptr [ebx + 0x80]
1008eb43  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1008eb46  8b8088000000                   mov eax, dword ptr [eax + 0x88]
1008eb4c  8b5158                         mov edx, dword ptr [ecx + 0x58]
1008eb4f  2bf2                           sub esi, edx
1008eb51  8b495c                         mov ecx, dword ptr [ecx + 0x5c]
1008eb54  99                             cdq 
1008eb55  2bc2                           sub eax, edx
1008eb57  894dac                         mov dword ptr [ebp - 0x54], ecx
1008eb5a  8bc8                           mov ecx, eax
1008eb5c  8bc6                           mov eax, esi
1008eb5e  99                             cdq 
1008eb5f  2bc2                           sub eax, edx
1008eb61  d1f9                           sar ecx, 1
1008eb63  8bf0                           mov esi, eax
1008eb65  d1fe                           sar esi, 1
1008eb67  2bf1                           sub esi, ecx
1008eb69  8bcc                           mov ecx, esp
1008eb6b  03f7                           add esi, edi
1008eb6d  8b7b7c                         mov edi, dword ptr [ebx + 0x7c]
1008eb70  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1008eb73  6a03                           push 3
1008eb75  8b838c000000                   mov eax, dword ptr [ebx + 0x8c]
1008eb7b  99                             cdq 
1008eb7c  2bc2                           sub eax, edx
1008eb7e  d1f8                           sar eax, 1
1008eb80  2bf8                           sub edi, eax
1008eb82  33c0                           xor eax, eax
1008eb84  83bb8000000001                 cmp dword ptr [ebx + 0x80], 1
1008eb8b  894110                         mov dword ptr [ecx + 0x10], eax
1008eb8e  c7411407000000                 mov dword ptr [ecx + 0x14], 7
1008eb95  668901                         mov word ptr [ecx], ax
1008eb98  7507                           jne 0x1008eba1
1008eb9a  6840060b10                     push 0x100b0640
1008eb9f  eb05                           jmp 0x1008eba6
1008eba1  6868060b10                     push 0x100b0668
1008eba6  e8256ff7ff                     call 0x10005ad0
1008ebab  57                             push edi
1008ebac  56                             push esi
1008ebad  8b75a4                         mov esi, dword ptr [ebp - 0x5c]
1008ebb0  8bce                           mov ecx, esi
1008ebb2  e83961ffff                     call 0x10084cf0
1008ebb7  66837db800                     cmp word ptr [ebp - 0x48], 0
1008ebbc  740a                           je 0x1008ebc8
1008ebbe  c7865008000001000000           mov dword ptr [esi + 0x850], 1
1008ebc8  8b7368                         mov esi, dword ptr [ebx + 0x68]
1008ebcb  8b5358                         mov edx, dword ptr [ebx + 0x58]
1008ebce  ff75b0                         push dword ptr [ebp - 0x50]
1008ebd1  8b8680000000                   mov eax, dword ptr [esi + 0x80]
1008ebd7  034350                         add eax, dword ptr [ebx + 0x50]
1008ebda  8945b8                         mov dword ptr [ebp - 0x48], eax
1008ebdd  8b437c                         mov eax, dword ptr [ebx + 0x7c]
1008ebe0  8b4858                         mov ecx, dword ptr [eax + 0x58]
1008ebe3  2bd1                           sub edx, ecx
1008ebe5  8b405c                         mov eax, dword ptr [eax + 0x5c]
1008ebe8  8945ac                         mov dword ptr [ebp - 0x54], eax
1008ebeb  8b435c                         mov eax, dword ptr [ebx + 0x5c]
1008ebee  8b5e7c                         mov ebx, dword ptr [esi + 0x7c]
1008ebf1  8945ac                         mov dword ptr [ebp - 0x54], eax
1008ebf4  8bc2                           mov eax, edx
1008ebf6  8955ac                         mov dword ptr [ebp - 0x54], edx
1008ebf9  99                             cdq 
1008ebfa  2bc2                           sub eax, edx
1008ebfc  8bf8                           mov edi, eax
1008ebfe  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1008ec01  d1ff                           sar edi, 1
1008ec03  037db8                         add edi, dword ptr [ebp - 0x48]
1008ec06  8b7078                         mov esi, dword ptr [eax + 0x78]
1008ec09  8b4658                         mov eax, dword ptr [esi + 0x58]
1008ec0c  99                             cdq 
1008ec0d  2bc2                           sub eax, edx
1008ec0f  d1f8                           sar eax, 1
1008ec11  2bf8                           sub edi, eax
1008ec13  89be80000000                   mov dword ptr [esi + 0x80], edi
1008ec19  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1008ec1c  8b868c000000                   mov eax, dword ptr [esi + 0x8c]
1008ec22  8b4e78                         mov ecx, dword ptr [esi + 0x78]
1008ec25  99                             cdq 
1008ec26  2bc2                           sub eax, edx
1008ec28  d1f8                           sar eax, 1
1008ec2a  2b4154                         sub eax, dword ptr [ecx + 0x54]
1008ec2d  03c3                           add eax, ebx
1008ec2f  89417c                         mov dword ptr [ecx + 0x7c], eax
1008ec32  8b4e78                         mov ecx, dword ptr [esi + 0x78]
1008ec35  8b01                           mov eax, dword ptr [ecx]
1008ec37  ff5004                         call dword ptr [eax + 4]
1008ec3a  8b4e7c                         mov ecx, dword ptr [esi + 0x7c]
1008ec3d  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1008ec40  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1008ec43  03c7                           add eax, edi
1008ec45  ff75b0                         push dword ptr [ebp - 0x50]
1008ec48  898180000000                   mov dword ptr [ecx + 0x80], eax
1008ec4e  8b467c                         mov eax, dword ptr [esi + 0x7c]
1008ec51  89587c                         mov dword ptr [eax + 0x7c], ebx
1008ec54  8b4e7c                         mov ecx, dword ptr [esi + 0x7c]
1008ec57  8b01                           mov eax, dword ptr [ecx]
1008ec59  ff5004                         call dword ptr [eax + 4]
1008ec5c  8b5da4                         mov ebx, dword ptr [ebp - 0x5c]
1008ec5f  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1008ec66  8d8358080000                   lea eax, [ebx + 0x858]
1008ec6c  7202                           jb 0x1008ec70
1008ec6e  8b00                           mov eax, dword ptr [eax]
1008ec70  50                             push eax
1008ec71  ff7608                         push dword ptr [esi + 8]
1008ec74  8bcb                           mov ecx, ebx
1008ec76  e8e558ffff                     call 0x10084560
1008ec7b  3975b0                         cmp dword ptr [ebp - 0x50], esi
1008ec7e  0f8592000000                   jne 0x1008ed16
1008ec84  8b4668                         mov eax, dword ptr [esi + 0x68]
1008ec87  8b5658                         mov edx, dword ptr [esi + 0x58]
1008ec8a  8955b0                         mov dword ptr [ebp - 0x50], edx
1008ec8d  8b565c                         mov edx, dword ptr [esi + 0x5c]
1008ec90  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1008ec93  8b4654                         mov eax, dword ptr [esi + 0x54]
1008ec96  03c1                           add eax, ecx
1008ec98  8955b8                         mov dword ptr [ebp - 0x48], edx
1008ec9b  83bb8008000001                 cmp dword ptr [ebx + 0x880], 1
1008eca2  8945ac                         mov dword ptr [ebp - 0x54], eax
1008eca5  746f                           je 0x1008ed16
1008eca7  833b00                         cmp dword ptr [ebx], 0
1008ecaa  746a                           je 0x1008ed16
1008ecac  8d4dbc                         lea ecx, [ebp - 0x44]
1008ecaf  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008ecb5  6a01                           push 1
1008ecb7  8d4dbc                         lea ecx, [ebp - 0x44]
1008ecba  c745fc00000000                 mov dword ptr [ebp - 4], 0
1008ecc1  ff1550ff0d10                   call dword ptr [0x100dff50]
1008ecc7  6a01                           push 1
1008ecc9  8d4dbc                         lea ecx, [ebp - 0x44]
1008eccc  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008ecd2  68ff000000                     push 0xff
1008ecd7  8d4dbc                         lea ecx, [ebp - 0x44]
1008ecda  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008ece0  8b0b                           mov ecx, dword ptr [ebx]
1008ece2  8d45bc                         lea eax, [ebp - 0x44]
1008ece5  50                             push eax
1008ece6  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008ecec  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1008ecef  8d4dbc                         lea ecx, [ebp - 0x44]
1008ecf2  898374080000                   mov dword ptr [ebx + 0x874], eax
1008ecf8  8b45b8                         mov eax, dword ptr [ebp - 0x48]
1008ecfb  89837c080000                   mov dword ptr [ebx + 0x87c], eax
1008ed01  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1008ed04  89bb70080000                   mov dword ptr [ebx + 0x870], edi
1008ed0a  898378080000                   mov dword ptr [ebx + 0x878], eax
1008ed10  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1008ed16  8b4668                         mov eax, dword ptr [esi + 0x68]
1008ed19  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1008ed1c  8b4654                         mov eax, dword ptr [esi + 0x54]
1008ed1f  03c1                           add eax, ecx
1008ed21  897e48                         mov dword ptr [esi + 0x48], edi
1008ed24  89464c                         mov dword ptr [esi + 0x4c], eax
1008ed27  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1008ed2a  64890d00000000                 mov dword ptr fs:[0], ecx
1008ed31  59                             pop ecx
1008ed32  5f                             pop edi
1008ed33  5e                             pop esi
1008ed34  5b                             pop ebx
1008ed35  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1008ed38  33cd                           xor ecx, ebp
1008ed3a  e8183c0100                     call 0x100a2957
1008ed3f  8be5                           mov esp, ebp
1008ed41  5d                             pop ebp
1008ed42  c20400                         ret 4
1008ed45  cc                             int3 
1008ed46  cc                             int3 
1008ed47  cc                             int3 
1008ed48  cc                             int3 
1008ed49  cc                             int3 
1008ed4a  cc                             int3 
1008ed4b  cc                             int3 
1008ed4c  cc                             int3 
1008ed4d  cc                             int3 
1008ed4e  cc                             int3 
1008ed4f  cc                             int3 
