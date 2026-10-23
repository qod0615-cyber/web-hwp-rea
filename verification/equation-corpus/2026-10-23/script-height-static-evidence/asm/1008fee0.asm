; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008fee0 <= VA < 0x10090310 (next decompiler entry; may include padding/thunks)
1008fee0  55                             push ebp
1008fee1  8bec                           mov ebp, esp
1008fee3  83e4f8                         and esp, 0xfffffff8
1008fee6  83ec24                         sub esp, 0x24
1008fee9  53                             push ebx
1008feea  56                             push esi
1008feeb  8b750c                         mov esi, dword ptr [ebp + 0xc]
1008feee  8bd9                           mov ebx, ecx
1008fef0  57                             push edi
1008fef1  85f6                           test esi, esi
1008fef3  741d                           je 0x1008ff12
1008fef5  837b4400                       cmp dword ptr [ebx + 0x44], 0
1008fef9  7517                           jne 0x1008ff12
1008fefb  8b4508                         mov eax, dword ptr [ebp + 8]
1008fefe  8b4b58                         mov ecx, dword ptr [ebx + 0x58]
1008ff01  8908                           mov dword ptr [eax], ecx
1008ff03  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1008ff06  894804                         mov dword ptr [eax + 4], ecx
1008ff09  5f                             pop edi
1008ff0a  5e                             pop esi
1008ff0b  5b                             pop ebx
1008ff0c  8be5                           mov esp, ebp
1008ff0e  5d                             pop ebp
1008ff0f  c20800                         ret 8
1008ff12  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1008ff19  e8d284ffff                     call 0x100883f0
1008ff1e  33ff                           xor edi, edi
1008ff20  897c2410                       mov dword ptr [esp + 0x10], edi
1008ff24  39bb90000000                   cmp dword ptr [ebx + 0x90], edi
1008ff2a  7520                           jne 0x1008ff4c
1008ff2c  8b4378                         mov eax, dword ptr [ebx + 0x78]
1008ff2f  8b4b08                         mov ecx, dword ptr [ebx + 8]
1008ff32  56                             push esi
1008ff33  894808                         mov dword ptr [eax + 8], ecx
1008ff36  8d442424                       lea eax, [esp + 0x24]
1008ff3a  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1008ff3d  50                             push eax
1008ff3e  8b01                           mov eax, dword ptr [ecx]
1008ff40  ff5008                         call dword ptr [eax + 8]
1008ff43  8b38                           mov edi, dword ptr [eax]
1008ff45  8b4004                         mov eax, dword ptr [eax + 4]
1008ff48  89442410                       mov dword ptr [esp + 0x10], eax
1008ff4c  8b437c                         mov eax, dword ptr [ebx + 0x7c]
1008ff4f  8b4b08                         mov ecx, dword ptr [ebx + 8]
1008ff52  56                             push esi
1008ff53  894808                         mov dword ptr [eax + 8], ecx
1008ff56  8d442424                       lea eax, [esp + 0x24]
1008ff5a  8b4b7c                         mov ecx, dword ptr [ebx + 0x7c]
1008ff5d  50                             push eax
1008ff5e  8b01                           mov eax, dword ptr [ecx]
1008ff60  ff5008                         call dword ptr [eax + 8]
1008ff63  8b4b74                         mov ecx, dword ptr [ebx + 0x74]
1008ff66  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
1008ff6d  8b30                           mov esi, dword ptr [eax]
1008ff6f  8b4004                         mov eax, dword ptr [eax + 4]
1008ff72  89442420                       mov dword ptr [esp + 0x20], eax
1008ff76  8d8158080000                   lea eax, [ecx + 0x858]
1008ff7c  7202                           jb 0x1008ff80
1008ff7e  8b00                           mov eax, dword ptr [eax]
1008ff80  50                             push eax
1008ff81  ff7308                         push dword ptr [ebx + 8]
1008ff84  e8d745ffff                     call 0x10084560
1008ff89  8b4374                         mov eax, dword ptr [ebx + 0x74]
1008ff8c  6a64                           push 0x64
1008ff8e  6a32                           push 0x32
1008ff90  ffb048080000                   push dword ptr [eax + 0x848]
1008ff96  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1008ff9c  3bfe                           cmp edi, esi
1008ff9e  c7838400000000000000           mov dword ptr [ebx + 0x84], 0
1008ffa8  c7838800000000000000           mov dword ptr [ebx + 0x88], 0
1008ffb2  bad4210000                     mov edx, 0x21d4
1008ffb7  0f4ff7                         cmovg esi, edi
1008ffba  03c6                           add eax, esi
1008ffbc  89442414                       mov dword ptr [esp + 0x14], eax
1008ffc0  0fb7838c000000                 movzx eax, word ptr [ebx + 0x8c]
1008ffc7  8bc8                           mov ecx, eax
1008ffc9  6685c0                         test ax, ax
1008ffcc  7509                           jne 0x1008ffd7
1008ffce  6689938c000000                 mov word ptr [ebx + 0x8c], dx
1008ffd5  8bca                           mov ecx, edx
1008ffd7  0fb7c1                         movzx eax, cx
1008ffda  b990210000                     mov ecx, 0x2190
1008ffdf  663bc1                         cmp ax, cx
1008ffe2  746d                           je 0x10090051
1008ffe4  b992210000                     mov ecx, 0x2192
1008ffe9  663bc1                         cmp ax, cx
1008ffec  7463                           je 0x10090051
1008ffee  b9d0210000                     mov ecx, 0x21d0
1008fff3  663bc1                         cmp ax, cx
1008fff6  7459                           je 0x10090051
1008fff8  b9d2210000                     mov ecx, 0x21d2
1008fffd  663bc1                         cmp ax, cx
10090000  744f                           je 0x10090051
10090002  b994210000                     mov ecx, 0x2194
10090007  663bc1                         cmp ax, cx
1009000a  7445                           je 0x10090051
1009000c  663bc2                         cmp ax, dx
1009000f  7440                           je 0x10090051
10090011  b9c4210000                     mov ecx, 0x21c4
10090016  663bc1                         cmp ax, cx
10090019  7436                           je 0x10090051
1009001b  ff7308                         push dword ptr [ebx + 8]
1009001e  8b4b74                         mov ecx, dword ptr [ebx + 0x74]
10090021  e8ba45ffff                     call 0x100845e0
10090026  0fb7838c000000                 movzx eax, word ptr [ebx + 0x8c]
1009002d  8b4b74                         mov ecx, dword ptr [ebx + 0x74]
10090030  50                             push eax
10090031  8d44241c                       lea eax, [esp + 0x1c]
10090035  50                             push eax
10090036  e89551ffff                     call 0x100851d0
1009003b  8b08                           mov ecx, dword ptr [eax]
1009003d  898b84000000                   mov dword ptr [ebx + 0x84], ecx
10090043  8b4004                         mov eax, dword ptr [eax + 4]
10090046  898388000000                   mov dword ptr [ebx + 0x88], eax
1009004c  e9f7010000                     jmp 0x10090248
10090051  8b8394000000                   mov eax, dword ptr [ebx + 0x94]
10090057  83cfff                         or edi, 0xffffffff
1009005a  85c0                           test eax, eax
1009005c  7415                           je 0x10090073
1009005e  6a34                           push 0x34
10090060  50                             push eax
10090061  e82e2b0100                     call 0x100a2b94
10090066  83c408                         add esp, 8
10090069  c7839400000000000000           mov dword ptr [ebx + 0x94], 0
10090073  6a34                           push 0x34
10090075  e86e2e0100                     call 0x100a2ee8
1009007a  8bf0                           mov esi, eax
1009007c  0f57c0                         xorps xmm0, xmm0
1009007f  8974241c                       mov dword ptr [esp + 0x1c], esi
10090083  33c0                           xor eax, eax
10090085  83c404                         add esp, 4
10090088  89461c                         mov dword ptr [esi + 0x1c], eax
1009008b  66894620                       mov word ptr [esi + 0x20], ax
1009008f  c70600000000                   mov dword ptr [esi], 0
10090095  c7460400000000                 mov dword ptr [esi + 4], 0
1009009c  c7460800000000                 mov dword ptr [esi + 8], 0
100900a3  c7460c00000000                 mov dword ptr [esi + 0xc], 0
100900aa  c7461000000000                 mov dword ptr [esi + 0x10], 0
100900b1  c7461400000000                 mov dword ptr [esi + 0x14], 0
100900b8  c7461800000000                 mov dword ptr [esi + 0x18], 0
100900bf  0f114624                       movups xmmword ptr [esi + 0x24], xmm0
100900c3  0fb7838c000000                 movzx eax, word ptr [ebx + 0x8c]
100900ca  0570deffff                     add eax, 0xffffde70
100900cf  89b394000000                   mov dword ptr [ebx + 0x94], esi
100900d5  83f844                         cmp eax, 0x44
100900d8  773a                           ja 0x10090114
100900da  0fb680a0020910                 movzx eax, byte ptr [eax + 0x100902a0]
100900e1  ff248580020910                 jmp dword ptr [eax*4 + 0x10090280]
100900e8  bf01000000                     mov edi, 1
100900ed  eb25                           jmp 0x10090114
100900ef  33ff                           xor edi, edi
100900f1  eb21                           jmp 0x10090114
100900f3  bf02000000                     mov edi, 2
100900f8  eb1a                           jmp 0x10090114
100900fa  bf04000000                     mov edi, 4
100900ff  eb13                           jmp 0x10090114
10090101  bf03000000                     mov edi, 3
10090106  eb0c                           jmp 0x10090114
10090108  bf05000000                     mov edi, 5
1009010d  eb05                           jmp 0x10090114
1009010f  bf06000000                     mov edi, 6
10090114  8b4b74                         mov ecx, dword ptr [ebx + 0x74]
10090117  8b5308                         mov edx, dword ptr [ebx + 8]
1009011a  894c2418                       mov dword ptr [esp + 0x18], ecx
1009011e  85c9                           test ecx, ecx
10090120  0f84d5000000                   je 0x100901fb
10090126  8b442414                       mov eax, dword ptr [esp + 0x14]
1009012a  894610                         mov dword ptr [esi + 0x10], eax
1009012d  8d8158080000                   lea eax, [ecx + 0x858]
10090133  890e                           mov dword ptr [esi], ecx
10090135  897e04                         mov dword ptr [esi + 4], edi
10090138  c7460c00000000                 mov dword ptr [esi + 0xc], 0
1009013f  c7460800000000                 mov dword ptr [esi + 8], 0
10090146  895618                         mov dword ptr [esi + 0x18], edx
10090149  83781408                       cmp dword ptr [eax + 0x14], 8
1009014d  7202                           jb 0x10090151
1009014f  8b00                           mov eax, dword ptr [eax]
10090151  50                             push eax
10090152  52                             push edx
10090153  e80844ffff                     call 0x10084560
10090158  8b4604                         mov eax, dword ptr [esi + 4]
1009015b  83f806                         cmp eax, 6
1009015e  772c                           ja 0x1009018c
10090160  0fb680f0020910                 movzx eax, byte ptr [eax + 0x100902f0]
10090167  ff2485e8020910                 jmp dword ptr [eax*4 + 0x100902e8]
1009016e  c7461c58e05ae0                 mov dword ptr [esi + 0x1c], 0xe05ae058
10090175  b859e00000                     mov eax, 0xe059
1009017a  eb0c                           jmp 0x10090188
1009017c  c7461c6fe071e0                 mov dword ptr [esi + 0x1c], 0xe071e06f
10090183  b870e00000                     mov eax, 0xe070
10090188  66894620                       mov word ptr [esi + 0x20], ax
1009018c  0fb74620                       movzx eax, word ptr [esi + 0x20]
10090190  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
10090194  50                             push eax
10090195  8d44242c                       lea eax, [esp + 0x2c]
10090199  50                             push eax
1009019a  e83150ffff                     call 0x100851d0
1009019f  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
100901a3  8b10                           mov edx, dword ptr [eax]
100901a5  895624                         mov dword ptr [esi + 0x24], edx
100901a8  8b4004                         mov eax, dword ptr [eax + 4]
100901ab  894628                         mov dword ptr [esi + 0x28], eax
100901ae  0fb7461e                       movzx eax, word ptr [esi + 0x1e]
100901b2  50                             push eax
100901b3  8d44242c                       lea eax, [esp + 0x2c]
100901b7  50                             push eax
100901b8  e81350ffff                     call 0x100851d0
100901bd  8b3dc8e20a10                   mov edi, dword ptr [0x100ae2c8]
100901c3  6a64                           push 0x64
100901c5  6a50                           push 0x50
100901c7  8b08                           mov ecx, dword ptr [eax]
100901c9  894e2c                         mov dword ptr [esi + 0x2c], ecx
100901cc  8b4004                         mov eax, dword ptr [eax + 4]
100901cf  51                             push ecx
100901d0  894630                         mov dword ptr [esi + 0x30], eax
100901d3  ffd7                           call edi
100901d5  8b4e04                         mov ecx, dword ptr [esi + 4]
100901d8  89462c                         mov dword ptr [esi + 0x2c], eax
100901db  83f906                         cmp ecx, 6
100901de  771b                           ja 0x100901fb
100901e0  0fb68900030910                 movzx ecx, byte ptr [ecx + 0x10090300]
100901e7  ff248df8020910                 jmp dword ptr [ecx*4 + 0x100902f8]
100901ee  6a64                           push 0x64
100901f0  6896000000                     push 0x96
100901f5  50                             push eax
100901f6  ffd7                           call edi
100901f8  894614                         mov dword ptr [esi + 0x14], eax
100901fb  8bbb94000000                   mov edi, dword ptr [ebx + 0x94]
10090201  6a64                           push 0x64
10090203  6a05                           push 5
10090205  ff7728                         push dword ptr [edi + 0x28]
10090208  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009020e  8bf0                           mov esi, eax
10090210  8b4710                         mov eax, dword ptr [edi + 0x10]
10090213  3b4714                         cmp eax, dword ptr [edi + 0x14]
10090216  6a64                           push 0x64
10090218  0f4e4714                       cmovle eax, dword ptr [edi + 0x14]
1009021c  6a1e                           push 0x1e
1009021e  ff7728                         push dword ptr [edi + 0x28]
10090221  03c6                           add eax, esi
10090223  89442424                       mov dword ptr [esp + 0x24], eax
10090227  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009022d  837f0406                       cmp dword ptr [edi + 4], 6
10090231  8d0c30                         lea ecx, [eax + esi]
10090234  7502                           jne 0x10090238
10090236  03c9                           add ecx, ecx
10090238  8b442418                       mov eax, dword ptr [esp + 0x18]
1009023c  898384000000                   mov dword ptr [ebx + 0x84], eax
10090242  898b88000000                   mov dword ptr [ebx + 0x88], ecx
10090248  8b8388000000                   mov eax, dword ptr [ebx + 0x88]
1009024e  8b742420                       mov esi, dword ptr [esp + 0x20]
10090252  5f                             pop edi
10090253  8d0c30                         lea ecx, [eax + esi]
10090256  99                             cdq 
10090257  034c240c                       add ecx, dword ptr [esp + 0xc]
1009025b  2bc2                           sub eax, edx
1009025d  8b542410                       mov edx, dword ptr [esp + 0x10]
10090261  f7de                           neg esi
10090263  d1f8                           sar eax, 1
10090265  2bf0                           sub esi, eax
10090267  895358                         mov dword ptr [ebx + 0x58], edx
1009026a  8b4508                         mov eax, dword ptr [ebp + 8]
1009026d  897354                         mov dword ptr [ebx + 0x54], esi
10090270  5e                             pop esi
10090271  894b5c                         mov dword ptr [ebx + 0x5c], ecx
10090274  8910                           mov dword ptr [eax], edx
10090276  894804                         mov dword ptr [eax + 4], ecx
10090279  5b                             pop ebx
1009027a  8be5                           mov esp, ebp
1009027c  5d                             pop ebp
1009027d  c20800                         ret 8
10090280  e8000910ef                     call 0xff190b85
10090285  0009                           add byte ptr [ecx], cl
10090287  10f3                           adc bl, dh
10090289  0009                           add byte ptr [ecx], cl
1009028b  100f                           adc byte ptr [edi], cl
1009028d  0109                           add dword ptr [ecx], ecx
1009028f  10fa                           adc dl, bh
10090291  0009                           add byte ptr [ecx], cl
10090293  1001                           adc byte ptr [ecx], al
10090295  0109                           add dword ptr [ecx], ecx
10090297  1008                           adc byte ptr [eax], cl
10090299  0109                           add dword ptr [ecx], ecx
1009029b  101401                         adc byte ptr [ecx + eax], dl
1009029e  0910                           or dword ptr [eax], edx
100902a0  0007                           add byte ptr [edi], al
100902a2  0107                           add dword ptr [edi], eax
100902a4  0207                           add al, byte ptr [edi]
100902a6  07                             pop es
100902a7  07                             pop es
100902a8  07                             pop es
100902a9  07                             pop es
100902aa  07                             pop es
100902ab  07                             pop es
100902ac  07                             pop es
100902ad  07                             pop es
100902ae  07                             pop es
100902af  07                             pop es
100902b0  07                             pop es
100902b1  07                             pop es
100902b2  07                             pop es
100902b3  07                             pop es
100902b4  07                             pop es
100902b5  07                             pop es
100902b6  07                             pop es
100902b7  07                             pop es
100902b8  07                             pop es
100902b9  07                             pop es
100902ba  07                             pop es
100902bb  07                             pop es
100902bc  07                             pop es
100902bd  07                             pop es
100902be  07                             pop es
100902bf  07                             pop es
100902c0  07                             pop es
100902c1  07                             pop es
100902c2  07                             pop es
100902c3  07                             pop es
100902c4  07                             pop es
100902c5  07                             pop es
100902c6  07                             pop es
100902c7  07                             pop es
100902c8  07                             pop es
100902c9  07                             pop es
100902ca  07                             pop es
100902cb  07                             pop es
100902cc  07                             pop es
100902cd  07                             pop es
100902ce  07                             pop es
100902cf  07                             pop es
100902d0  07                             pop es
100902d1  07                             pop es
100902d2  07                             pop es
100902d3  07                             pop es
100902d4  0307                           add eax, dword ptr [edi]
100902d6  07                             pop es
100902d7  07                             pop es
100902d8  07                             pop es
100902d9  07                             pop es
100902da  07                             pop es
100902db  07                             pop es
100902dc  07                             pop es
100902dd  07                             pop es
100902de  07                             pop es
100902df  07                             pop es
100902e0  0407                           add al, 7
100902e2  0507060f1f                     add eax, 0x1f0f0607
100902e7  006e01                         add byte ptr [esi + 1], ch
100902ea  0910                           or dword ptr [eax], edx
100902ec  7c01                           jl 0x100902ef
100902ee  0910                           or dword ptr [eax], edx
100902f0  0000                           add byte ptr [eax], al
100902f2  0001                           add byte ptr [ecx], al
100902f4  0101                           add dword ptr [ecx], eax
100902f6  0090f8010910                   add byte ptr [eax + 0x100901f8], dl
100902fc  ee                             out dx, al
100902fd  0109                           add dword ptr [ecx], ecx
100902ff  1000                           adc byte ptr [eax], al
10090301  0001                           add byte ptr [ecx], al
10090303  0000                           add byte ptr [eax], al
10090305  0100                           add dword ptr [eax], eax
10090307  cc                             int3 
10090308  cc                             int3 
10090309  cc                             int3 
1009030a  cc                             int3 
1009030b  cc                             int3 
1009030c  cc                             int3 
1009030d  cc                             int3 
1009030e  cc                             int3 
1009030f  cc                             int3 
