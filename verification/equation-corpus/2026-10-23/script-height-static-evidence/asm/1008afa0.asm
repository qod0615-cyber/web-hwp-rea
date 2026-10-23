; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008afa0 <= VA < 0x1008b480 (next decompiler entry; may include padding/thunks)
1008afa0  55                             push ebp
1008afa1  8bec                           mov ebp, esp
1008afa3  6aff                           push -1
1008afa5  68f5c10a10                     push 0x100ac1f5
1008afaa  64a100000000                   mov eax, dword ptr fs:[0]
1008afb0  50                             push eax
1008afb1  81eca8000000                   sub esp, 0xa8
1008afb7  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008afbc  33c5                           xor eax, ebp
1008afbe  8945f0                         mov dword ptr [ebp - 0x10], eax
1008afc1  53                             push ebx
1008afc2  56                             push esi
1008afc3  57                             push edi
1008afc4  50                             push eax
1008afc5  8d45f4                         lea eax, [ebp - 0xc]
1008afc8  64a300000000                   mov dword ptr fs:[0], eax
1008afce  8bf1                           mov esi, ecx
1008afd0  8b5e74                         mov ebx, dword ptr [esi + 0x74]
1008afd3  33c0                           xor eax, eax
1008afd5  394640                         cmp dword ptr [esi + 0x40], eax
1008afd8  0f94c0                         sete al
1008afdb  83be9400000000                 cmp dword ptr [esi + 0x94], 0
1008afe2  89854cffffff                   mov dword ptr [ebp - 0xb4], eax
1008afe8  740a                           je 0x1008aff4
1008afea  c7835008000000000000           mov dword ptr [ebx + 0x850], 0
1008aff4  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1008affb  8d8358080000                   lea eax, [ebx + 0x858]
1008b001  7202                           jb 0x1008b005
1008b003  8b00                           mov eax, dword ptr [eax]
1008b005  50                             push eax
1008b006  ff7608                         push dword ptr [esi + 8]
1008b009  8bcb                           mov ecx, ebx
1008b00b  e85095ffff                     call 0x10084560
1008b010  8b16                           mov edx, dword ptr [esi]
1008b012  8b4210                         mov eax, dword ptr [edx + 0x10]
1008b015  81faf4f40b10                   cmp edx, 0x100bf4f4
1008b01b  0f852e040000                   jne 0x1008b44f
1008b021  8b4668                         mov eax, dword ptr [esi + 0x68]
1008b024  8bb880000000                   mov edi, dword ptr [eax + 0x80]
1008b02a  037e50                         add edi, dword ptr [esi + 0x50]
1008b02d  89bd68ffffff                   mov dword ptr [ebp - 0x98], edi
1008b033  81faf4f40b10                   cmp edx, 0x100bf4f4
1008b039  0f851b040000                   jne 0x1008b45a
1008b03f  8b4668                         mov eax, dword ptr [esi + 0x68]
1008b042  8b4e54                         mov ecx, dword ptr [esi + 0x54]
1008b045  8b407c                         mov eax, dword ptr [eax + 0x7c]
1008b048  03c8                           add ecx, eax
1008b04a  0fb7869c000000                 movzx eax, word ptr [esi + 0x9c]
1008b051  898d60ffffff                   mov dword ptr [ebp - 0xa0], ecx
1008b057  83f820                         cmp eax, 0x20
1008b05a  0f84ec020000                   je 0x1008b34c
1008b060  83f87e                         cmp eax, 0x7e
1008b063  0f84e3020000                   je 0x1008b34c
1008b069  83f860                         cmp eax, 0x60
1008b06c  0f84da020000                   je 0x1008b34c
1008b072  8b86a0000000                   mov eax, dword ptr [esi + 0xa0]
1008b078  89855cffffff                   mov dword ptr [ebp - 0xa4], eax
1008b07e  85c0                           test eax, eax
1008b080  0f848f010000                   je 0x1008b215
1008b086  83bb8008000001                 cmp dword ptr [ebx + 0x880], 1
1008b08d  8b4658                         mov eax, dword ptr [esi + 0x58]
1008b090  8b565c                         mov edx, dword ptr [esi + 0x5c]
1008b093  0f847c010000                   je 0x1008b215
1008b099  833b00                         cmp dword ptr [ebx], 0
1008b09c  0f8473010000                   je 0x1008b215
1008b0a2  03c7                           add eax, edi
1008b0a4  89856cffffff                   mov dword ptr [ebp - 0x94], eax
1008b0aa  8d040a                         lea eax, [edx + ecx]
1008b0ad  8d4da4                         lea ecx, [ebp - 0x5c]
1008b0b0  898564ffffff                   mov dword ptr [ebp - 0x9c], eax
1008b0b6  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008b0bc  c745fc00000000                 mov dword ptr [ebp - 4], 0
1008b0c3  8d8d54ffffff                   lea ecx, [ebp - 0xac]
1008b0c9  8b3de4fe0d10                   mov edi, dword ptr [0x100dfee4]
1008b0cf  ffd7                           call edi
1008b0d1  8d8d58ffffff                   lea ecx, [ebp - 0xa8]
1008b0d7  c645fc01                       mov byte ptr [ebp - 4], 1
1008b0db  ffd7                           call edi
1008b0dd  6a01                           push 1
1008b0df  8d4da4                         lea ecx, [ebp - 0x5c]
1008b0e2  c645fc02                       mov byte ptr [ebp - 4], 2
1008b0e6  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008b0ec  8b855cffffff                   mov eax, dword ptr [ebp - 0xa4]
1008b0f2  48                             dec eax
1008b0f3  83f803                         cmp eax, 3
1008b0f6  7717                           ja 0x1008b10f
1008b0f8  ff248564b40810                 jmp dword ptr [eax*4 + 0x1008b464]
1008b0ff  6a03                           push 3
1008b101  eb02                           jmp 0x1008b105
1008b103  6a01                           push 1
1008b105  a150ff0d10                     mov eax, dword ptr [0x100dff50]
1008b10a  8d4da4                         lea ecx, [ebp - 0x5c]
1008b10d  ffd0                           call eax
1008b10f  680000ff00                     push 0xff0000
1008b114  8d4da4                         lea ecx, [ebp - 0x5c]
1008b117  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008b11d  8b0b                           mov ecx, dword ptr [ebx]
1008b11f  8d45a4                         lea eax, [ebp - 0x5c]
1008b122  50                             push eax
1008b123  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008b129  8b855cffffff                   mov eax, dword ptr [ebp - 0xa4]
1008b12f  8bbd68ffffff                   mov edi, dword ptr [ebp - 0x98]
1008b135  85c0                           test eax, eax
1008b137  7e1d                           jle 0x1008b156
1008b139  8b8564ffffff                   mov eax, dword ptr [ebp - 0x9c]
1008b13f  8b0b                           mov ecx, dword ptr [ebx]
1008b141  50                             push eax
1008b142  57                             push edi
1008b143  50                             push eax
1008b144  ffb56cffffff                   push dword ptr [ebp - 0x94]
1008b14a  ff150cfe0d10                   call dword ptr [0x100dfe0c]
1008b150  8b855cffffff                   mov eax, dword ptr [ebp - 0xa4]
1008b156  83f802                         cmp eax, 2
1008b159  7405                           je 0x1008b160
1008b15b  83f804                         cmp eax, 4
1008b15e  7569                           jne 0x1008b1c9
1008b160  6a03                           push 3
1008b162  8d4da4                         lea ecx, [ebp - 0x5c]
1008b165  ff1550ff0d10                   call dword ptr [0x100dff50]
1008b16b  6800ffff00                     push 0xffff00
1008b170  8d4da4                         lea ecx, [ebp - 0x5c]
1008b173  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008b179  6800ffff00                     push 0xffff00
1008b17e  8d8d54ffffff                   lea ecx, [ebp - 0xac]
1008b184  ff154cff0d10                   call dword ptr [0x100dff4c]
1008b18a  8b0b                           mov ecx, dword ptr [ebx]
1008b18c  8d45a4                         lea eax, [ebp - 0x5c]
1008b18f  50                             push eax
1008b190  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008b196  8b0b                           mov ecx, dword ptr [ebx]
1008b198  8d8554ffffff                   lea eax, [ebp - 0xac]
1008b19e  50                             push eax
1008b19f  ff1564fe0d10                   call dword ptr [0x100dfe64]
1008b1a5  8b8564ffffff                   mov eax, dword ptr [ebp - 0x9c]
1008b1ab  8b8d6cffffff                   mov ecx, dword ptr [ebp - 0x94]
1008b1b1  6a00                           push 0
1008b1b3  50                             push eax
1008b1b4  57                             push edi
1008b1b5  50                             push eax
1008b1b6  8b8560ffffff                   mov eax, dword ptr [ebp - 0xa0]
1008b1bc  51                             push ecx
1008b1bd  50                             push eax
1008b1be  51                             push ecx
1008b1bf  8b0b                           mov ecx, dword ptr [ebx]
1008b1c1  50                             push eax
1008b1c2  57                             push edi
1008b1c3  ff1500fe0d10                   call dword ptr [0x100dfe00]
1008b1c9  68ffffff00                     push 0xffffff
1008b1ce  8d8d58ffffff                   lea ecx, [ebp - 0xa8]
1008b1d4  ff154cff0d10                   call dword ptr [0x100dff4c]
1008b1da  8b0b                           mov ecx, dword ptr [ebx]
1008b1dc  8d8558ffffff                   lea eax, [ebp - 0xa8]
1008b1e2  50                             push eax
1008b1e3  ff1564fe0d10                   call dword ptr [0x100dfe64]
1008b1e9  8b3de0fe0d10                   mov edi, dword ptr [0x100dfee0]
1008b1ef  8d8d58ffffff                   lea ecx, [ebp - 0xa8]
1008b1f5  ffd7                           call edi
1008b1f7  8d8d54ffffff                   lea ecx, [ebp - 0xac]
1008b1fd  ffd7                           call edi
1008b1ff  8d4da4                         lea ecx, [ebp - 0x5c]
1008b202  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
1008b209  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1008b20f  8b8d60ffffff                   mov ecx, dword ptr [ebp - 0xa0]
1008b215  837e7800                       cmp dword ptr [esi + 0x78], 0
1008b219  7475                           je 0x1008b290
1008b21b  ba01000000                     mov edx, 1
1008b220  899564ffffff                   mov dword ptr [ebp - 0x9c], edx
1008b226  39968c000000                   cmp dword ptr [esi + 0x8c], edx
1008b22c  0f8e1a010000                   jle 0x1008b34c
1008b232  8d7e7c                         lea edi, [esi + 0x7c]
1008b235  6666660f1f840000000000         nop word ptr [eax + eax]
1008b240  837f1408                       cmp dword ptr [edi + 0x14], 8
1008b244  89bd6cffffff                   mov dword ptr [ebp - 0x94], edi
1008b24a  7208                           jb 0x1008b254
1008b24c  8b07                           mov eax, dword ptr [edi]
1008b24e  89856cffffff                   mov dword ptr [ebp - 0x94], eax
1008b254  8b856cffffff                   mov eax, dword ptr [ebp - 0x94]
1008b25a  8bcb                           mov ecx, ebx
1008b25c  0fb70450                       movzx eax, word ptr [eax + edx*2]
1008b260  50                             push eax
1008b261  ffb560ffffff                   push dword ptr [ebp - 0xa0]
1008b267  8b8568ffffff                   mov eax, dword ptr [ebp - 0x98]
1008b26d  034658                         add eax, dword ptr [esi + 0x58]
1008b270  50                             push eax
1008b271  e8ba96ffff                     call 0x10084930
1008b276  8b9564ffffff                   mov edx, dword ptr [ebp - 0x9c]
1008b27c  42                             inc edx
1008b27d  899564ffffff                   mov dword ptr [ebp - 0x9c], edx
1008b283  3b968c000000                   cmp edx, dword ptr [esi + 0x8c]
1008b289  7cb5                           jl 0x1008b240
1008b28b  e9bc000000                     jmp 0x1008b34c
1008b290  0fb7969c000000                 movzx edx, word ptr [esi + 0x9c]
1008b297  8d8200280000                   lea eax, [edx + 0x2800]
1008b29d  0fb7f8                         movzx edi, ax
1008b2a0  89bd64ffffff                   mov dword ptr [ebp - 0x9c], edi
1008b2a6  bfff030000                     mov edi, 0x3ff
1008b2ab  89bd6cffffff                   mov dword ptr [ebp - 0x94], edi
1008b2b1  663bc7                         cmp ax, di
1008b2b4  8bbd68ffffff                   mov edi, dword ptr [ebp - 0x98]
1008b2ba  7777                           ja 0x1008b333
1008b2bc  8b4664                         mov eax, dword ptr [esi + 0x64]
1008b2bf  0fb7889c000000                 movzx ecx, word ptr [eax + 0x9c]
1008b2c6  b8ff030000                     mov eax, 0x3ff
1008b2cb  66398564ffffff                 cmp word ptr [ebp - 0x9c], ax
1008b2d2  7778                           ja 0x1008b34c
1008b2d4  8d8100240000                   lea eax, [ecx + 0x2400]
1008b2da  663b856cffffff                 cmp ax, word ptr [ebp - 0x94]
1008b2e1  7769                           ja 0x1008b34c
1008b2e3  c745ec07000000                 mov dword ptr [ebp - 0x14], 7
1008b2ea  c745fc03000000                 mov dword ptr [ebp - 4], 3
1008b2f1  33c0                           xor eax, eax
1008b2f3  83ec18                         sub esp, 0x18
1008b2f6  668945dc                       mov word ptr [ebp - 0x24], ax
1008b2fa  66894dda                       mov word ptr [ebp - 0x26], cx
1008b2fe  8d45d8                         lea eax, [ebp - 0x28]
1008b301  8bcc                           mov ecx, esp
1008b303  668955d8                       mov word ptr [ebp - 0x28], dx
1008b307  c745e802000000                 mov dword ptr [ebp - 0x18], 2
1008b30e  50                             push eax
1008b30f  e8ec89fbff                     call 0x10043d00
1008b314  ffb560ffffff                   push dword ptr [ebp - 0xa0]
1008b31a  8bcb                           mov ecx, ebx
1008b31c  57                             push edi
1008b31d  e8ce99ffff                     call 0x10084cf0
1008b322  8d4dd8                         lea ecx, [ebp - 0x28]
1008b325  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
1008b32c  e8dfa8f7ff                     call 0x10005c10
1008b331  eb19                           jmp 0x1008b34c
1008b333  8d8200240000                   lea eax, [edx + 0x2400]
1008b339  663b856cffffff                 cmp ax, word ptr [ebp - 0x94]
1008b340  760a                           jbe 0x1008b34c
1008b342  52                             push edx
1008b343  51                             push ecx
1008b344  57                             push edi
1008b345  8bcb                           mov ecx, ebx
1008b347  e8e495ffff                     call 0x10084930
1008b34c  397508                         cmp dword ptr [ebp + 8], esi
1008b34f  0f85b5000000                   jne 0x1008b40a
1008b355  83bb8008000001                 cmp dword ptr [ebx + 0x880], 1
1008b35c  8b4658                         mov eax, dword ptr [esi + 0x58]
1008b35f  898564ffffff                   mov dword ptr [ebp - 0x9c], eax
1008b365  8b465c                         mov eax, dword ptr [esi + 0x5c]
1008b368  89856cffffff                   mov dword ptr [ebp - 0x94], eax
1008b36e  0f8496000000                   je 0x1008b40a
1008b374  833b00                         cmp dword ptr [ebx], 0
1008b377  0f848d000000                   je 0x1008b40a
1008b37d  8d8d70ffffff                   lea ecx, [ebp - 0x90]
1008b383  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1008b389  6a01                           push 1
1008b38b  8d8d70ffffff                   lea ecx, [ebp - 0x90]
1008b391  c745fc04000000                 mov dword ptr [ebp - 4], 4
1008b398  ff1550ff0d10                   call dword ptr [0x100dff50]
1008b39e  6a01                           push 1
1008b3a0  8d8d70ffffff                   lea ecx, [ebp - 0x90]
1008b3a6  ff1514fe0d10                   call dword ptr [0x100dfe14]
1008b3ac  68ff000000                     push 0xff
1008b3b1  8d8d70ffffff                   lea ecx, [ebp - 0x90]
1008b3b7  ff1510fe0d10                   call dword ptr [0x100dfe10]
1008b3bd  8b0b                           mov ecx, dword ptr [ebx]
1008b3bf  8d8570ffffff                   lea eax, [ebp - 0x90]
1008b3c5  50                             push eax
1008b3c6  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1008b3cc  8b8560ffffff                   mov eax, dword ptr [ebp - 0xa0]
1008b3d2  8d8d70ffffff                   lea ecx, [ebp - 0x90]
1008b3d8  8bbd68ffffff                   mov edi, dword ptr [ebp - 0x98]
1008b3de  898374080000                   mov dword ptr [ebx + 0x874], eax
1008b3e4  8b856cffffff                   mov eax, dword ptr [ebp - 0x94]
1008b3ea  89837c080000                   mov dword ptr [ebx + 0x87c], eax
1008b3f0  8b8564ffffff                   mov eax, dword ptr [ebp - 0x9c]
1008b3f6  89bb70080000                   mov dword ptr [ebx + 0x870], edi
1008b3fc  898378080000                   mov dword ptr [ebx + 0x878], eax
1008b402  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1008b408  eb06                           jmp 0x1008b410
1008b40a  8bbd68ffffff                   mov edi, dword ptr [ebp - 0x98]
1008b410  83be9400000000                 cmp dword ptr [esi + 0x94], 0
1008b417  740c                           je 0x1008b425
1008b419  8b854cffffff                   mov eax, dword ptr [ebp - 0xb4]
1008b41f  898350080000                   mov dword ptr [ebx + 0x850], eax
1008b425  8b8560ffffff                   mov eax, dword ptr [ebp - 0xa0]
1008b42b  89464c                         mov dword ptr [esi + 0x4c], eax
1008b42e  897e48                         mov dword ptr [esi + 0x48], edi
1008b431  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1008b434  64890d00000000                 mov dword ptr fs:[0], ecx
1008b43b  59                             pop ecx
1008b43c  5f                             pop edi
1008b43d  5e                             pop esi
1008b43e  5b                             pop ebx
1008b43f  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1008b442  33cd                           xor ecx, ebp
1008b444  e80e750100                     call 0x100a2957
1008b449  8be5                           mov esp, ebp
1008b44b  5d                             pop ebp
1008b44c  c20400                         ret 4
1008b44f  8bce                           mov ecx, esi
1008b451  ffd0                           call eax
1008b453  8b16                           mov edx, dword ptr [esi]
1008b455  e9cafbffff                     jmp 0x1008b024
1008b45a  8bce                           mov ecx, esi
1008b45c  ff5210                         call dword ptr [edx + 0x10]
1008b45f  e9defbffff                     jmp 0x1008b042
1008b464  ffb0081003b1                   push dword ptr [eax - 0x4efceff8]
1008b46a  0810                           or byte ptr [eax], dl
1008b46c  03b10810ffb0                   add esi, dword ptr [ecx - 0x4f00eff8]
1008b472  0810                           or byte ptr [eax], dl
1008b474  cc                             int3 
1008b475  cc                             int3 
1008b476  cc                             int3 
1008b477  cc                             int3 
1008b478  cc                             int3 
1008b479  cc                             int3 
1008b47a  cc                             int3 
1008b47b  cc                             int3 
1008b47c  cc                             int3 
1008b47d  cc                             int3 
1008b47e  cc                             int3 
1008b47f  cc                             int3 
