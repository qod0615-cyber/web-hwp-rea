; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008aa20 <= VA < 0x1008acd0 (next decompiler entry; may include padding/thunks)
1008aa20  55                             push ebp
1008aa21  8bec                           mov ebp, esp
1008aa23  83ec30                         sub esp, 0x30
1008aa26  8b4508                         mov eax, dword ptr [ebp + 8]
1008aa29  8945e8                         mov dword ptr [ebp - 0x18], eax
1008aa2c  c745f800000000                 mov dword ptr [ebp - 8], 0
1008aa33  c745f000000000                 mov dword ptr [ebp - 0x10], 0
1008aa3a  c745e400000000                 mov dword ptr [ebp - 0x1c], 0
1008aa41  c745f400000000                 mov dword ptr [ebp - 0xc], 0
1008aa48  c745e000000000                 mov dword ptr [ebp - 0x20], 0
1008aa4f  53                             push ebx
1008aa50  8bd9                           mov ebx, ecx
1008aa52  56                             push esi
1008aa53  57                             push edi
1008aa54  8b8b8c000000                   mov ecx, dword ptr [ebx + 0x8c]
1008aa5a  8b7964                         mov edi, dword ptr [ecx + 0x64]
1008aa5d  85c0                           test eax, eax
1008aa5f  0f85ee000000                   jne 0x1008ab53
1008aa65  8b4308                         mov eax, dword ptr [ebx + 8]
1008aa68  894108                         mov dword ptr [ecx + 8], eax
1008aa6b  8b8b8c000000                   mov ecx, dword ptr [ebx + 0x8c]
1008aa71  8b4340                         mov eax, dword ptr [ebx + 0x40]
1008aa74  894140                         mov dword ptr [ecx + 0x40], eax
1008aa77  8b8b8c000000                   mov ecx, dword ptr [ebx + 0x8c]
1008aa7d  8b433c                         mov eax, dword ptr [ebx + 0x3c]
1008aa80  89413c                         mov dword ptr [ecx + 0x3c], eax
1008aa83  83bb9400000000                 cmp dword ptr [ebx + 0x94], 0
1008aa8a  7514                           jne 0x1008aaa0
1008aa8c  8b4374                         mov eax, dword ptr [ebx + 0x74]
1008aa8f  6683600e01                     and word ptr [eax + 0xe], 1
1008aa94  750a                           jne 0x1008aaa0
1008aa96  c7805008000001000000           mov dword ptr [eax + 0x850], 1
1008aaa0  3bbb90000000                   cmp edi, dword ptr [ebx + 0x90]
1008aaa6  0f85b9000000                   jne 0x1008ab65
1008aaac  8b8394000000                   mov eax, dword ptr [ebx + 0x94]
1008aab2  33d2                           xor edx, edx
1008aab4  8b7374                         mov esi, dword ptr [ebx + 0x74]
1008aab7  33c9                           xor ecx, ecx
1008aab9  8955f4                         mov dword ptr [ebp - 0xc], edx
1008aabc  894df8                         mov dword ptr [ebp - 8], ecx
1008aabf  85c0                           test eax, eax
1008aac1  7452                           je 0x1008ab15
1008aac3  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1008aaca  7549                           jne 0x1008ab15
1008aacc  8b4004                         mov eax, dword ptr [eax + 4]
1008aacf  83f802                         cmp eax, 2
1008aad2  746f                           je 0x1008ab43
1008aad4  83f807                         cmp eax, 7
1008aad7  746a                           je 0x1008ab43
1008aad9  83f803                         cmp eax, 3
1008aadc  7465                           je 0x1008ab43
1008aade  83f805                         cmp eax, 5
1008aae1  7460                           je 0x1008ab43
1008aae3  83f808                         cmp eax, 8
1008aae6  745b                           je 0x1008ab43
1008aae8  83f84d                         cmp eax, 0x4d
1008aaeb  7456                           je 0x1008ab43
1008aaed  83f877                         cmp eax, 0x77
1008aaf0  7451                           je 0x1008ab43
1008aaf2  83f842                         cmp eax, 0x42
1008aaf5  744c                           je 0x1008ab43
1008aaf7  83f844                         cmp eax, 0x44
1008aafa  7447                           je 0x1008ab43
1008aafc  83f845                         cmp eax, 0x45
1008aaff  7442                           je 0x1008ab43
1008ab01  83f843                         cmp eax, 0x43
1008ab04  743d                           je 0x1008ab43
1008ab06  83f846                         cmp eax, 0x46
1008ab09  7438                           je 0x1008ab43
1008ab0b  83f86b                         cmp eax, 0x6b
1008ab0e  7433                           je 0x1008ab43
1008ab10  83f86c                         cmp eax, 0x6c
1008ab13  742e                           je 0x1008ab43
1008ab15  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1008ab1c  8d8658080000                   lea eax, [esi + 0x858]
1008ab22  7202                           jb 0x1008ab26
1008ab24  8b00                           mov eax, dword ptr [eax]
1008ab26  50                             push eax
1008ab27  ff7308                         push dword ptr [ebx + 8]
1008ab2a  8bce                           mov ecx, esi
1008ab2c  e82f9affff                     call 0x10084560
1008ab31  8b8e48080000                   mov ecx, dword ptr [esi + 0x848]
1008ab37  8b964c080000                   mov edx, dword ptr [esi + 0x84c]
1008ab3d  894df8                         mov dword ptr [ebp - 8], ecx
1008ab40  8955f4                         mov dword ptr [ebp - 0xc], edx
1008ab43  8bc1                           mov eax, ecx
1008ab45  99                             cdq 
1008ab46  2bc2                           sub eax, edx
1008ab48  d1f8                           sar eax, 1
1008ab4a  8bd0                           mov edx, eax
1008ab4c  f7da                           neg edx
1008ab4e  8955f0                         mov dword ptr [ebp - 0x10], edx
1008ab51  eb12                           jmp 0x1008ab65
1008ab53  8b4358                         mov eax, dword ptr [ebx + 0x58]
1008ab56  8945e0                         mov dword ptr [ebp - 0x20], eax
1008ab59  8b435c                         mov eax, dword ptr [ebx + 0x5c]
1008ab5c  8945f8                         mov dword ptr [ebp - 8], eax
1008ab5f  8b4354                         mov eax, dword ptr [ebx + 0x54]
1008ab62  8945f0                         mov dword ptr [ebp - 0x10], eax
1008ab65  8bf7                           mov esi, edi
1008ab67  85ff                           test edi, edi
1008ab69  7421                           je 0x1008ab8c
1008ab6b  0f1f440000                     nop dword ptr [eax + eax]
1008ab70  3bbb90000000                   cmp edi, dword ptr [ebx + 0x90]
1008ab76  7414                           je 0x1008ab8c
1008ab78  837f046f                       cmp dword ptr [edi + 4], 0x6f
1008ab7c  7507                           jne 0x1008ab85
1008ab7e  8bcf                           mov ecx, edi
1008ab80  e87b0e0000                     call 0x1008ba00
1008ab85  8b7f64                         mov edi, dword ptr [edi + 0x64]
1008ab88  85ff                           test edi, edi
1008ab8a  75e4                           jne 0x1008ab70
1008ab8c  85f6                           test esi, esi
1008ab8e  7471                           je 0x1008ac01
1008ab90  3bb390000000                   cmp esi, dword ptr [ebx + 0x90]
1008ab96  0f8498000000                   je 0x1008ac34
1008ab9c  837e0464                       cmp dword ptr [esi + 4], 0x64
1008aba0  8b45e8                         mov eax, dword ptr [ebp - 0x18]
1008aba3  750c                           jne 0x1008abb1
1008aba5  85c0                           test eax, eax
1008aba7  0f8487000000                   je 0x1008ac34
1008abad  48                             dec eax
1008abae  8945e8                         mov dword ptr [ebp - 0x18], eax
1008abb1  85c0                           test eax, eax
1008abb3  7545                           jne 0x1008abfa
1008abb5  ff7510                         push dword ptr [ebp + 0x10]
1008abb8  8b06                           mov eax, dword ptr [esi]
1008abba  8d4dd8                         lea ecx, [ebp - 0x28]
1008abbd  51                             push ecx
1008abbe  8bce                           mov ecx, esi
1008abc0  ff5008                         call dword ptr [eax + 8]
1008abc3  8b5654                         mov edx, dword ptr [esi + 0x54]
1008abc6  8b08                           mov ecx, dword ptr [eax]
1008abc8  014df4                         add dword ptr [ebp - 0xc], ecx
1008abcb  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1008abce  3bca                           cmp ecx, edx
1008abd0  8b465c                         mov eax, dword ptr [esi + 0x5c]
1008abd3  0f4dca                         cmovge ecx, edx
1008abd6  03c2                           add eax, edx
1008abd8  894df0                         mov dword ptr [ebp - 0x10], ecx
1008abdb  3945e4                         cmp dword ptr [ebp - 0x1c], eax
1008abde  7f0a                           jg 0x1008abea
1008abe0  8b465c                         mov eax, dword ptr [esi + 0x5c]
1008abe3  03c2                           add eax, edx
1008abe5  8945e4                         mov dword ptr [ebp - 0x1c], eax
1008abe8  eb03                           jmp 0x1008abed
1008abea  8b45e4                         mov eax, dword ptr [ebp - 0x1c]
1008abed  2bc1                           sub eax, ecx
1008abef  8b4df8                         mov ecx, dword ptr [ebp - 8]
1008abf2  3bc8                           cmp ecx, eax
1008abf4  0f4ec8                         cmovle ecx, eax
1008abf7  894df8                         mov dword ptr [ebp - 8], ecx
1008abfa  8b7664                         mov esi, dword ptr [esi + 0x64]
1008abfd  85f6                           test esi, esi
1008abff  758f                           jne 0x1008ab90
1008ac01  8b5508                         mov edx, dword ptr [ebp + 8]
1008ac04  8b7d0c                         mov edi, dword ptr [ebp + 0xc]
1008ac07  397df4                         cmp dword ptr [ebp - 0xc], edi
1008ac0a  8b8b98000000                   mov ecx, dword ptr [ebx + 0x98]
1008ac10  0f4f7df4                       cmovg edi, dword ptr [ebp - 0xc]
1008ac14  85c9                           test ecx, ecx
1008ac16  743d                           je 0x1008ac55
1008ac18  85d2                           test edx, edx
1008ac1a  750c                           jne 0x1008ac28
1008ac1c  8b4308                         mov eax, dword ptr [ebx + 8]
1008ac1f  894108                         mov dword ptr [ecx + 8], eax
1008ac22  8b8b98000000                   mov ecx, dword ptr [ebx + 0x98]
1008ac28  ff7510                         push dword ptr [ebp + 0x10]
1008ac2b  57                             push edi
1008ac2c  52                             push edx
1008ac2d  e8eefdffff                     call 0x1008aa20
1008ac32  eb23                           jmp 0x1008ac57
1008ac34  85f6                           test esi, esi
1008ac36  74c9                           je 0x1008ac01
1008ac38  8b5508                         mov edx, dword ptr [ebp + 8]
1008ac3b  85d2                           test edx, edx
1008ac3d  75c5                           jne 0x1008ac04
1008ac3f  837e0464                       cmp dword ptr [esi + 4], 0x64
1008ac43  75bf                           jne 0x1008ac04
1008ac45  8bcb                           mov ecx, ebx
1008ac47  e8e4dcffff                     call 0x10088930
1008ac4c  c7407801000000                 mov dword ptr [eax + 0x78], 1
1008ac53  ebaf                           jmp 0x1008ac04
1008ac55  33c0                           xor eax, eax
1008ac57  3bf8                           cmp edi, eax
1008ac59  0f4fc7                         cmovg eax, edi
1008ac5c  8b7de0                         mov edi, dword ptr [ebp - 0x20]
1008ac5f  03f8                           add edi, eax
1008ac61  894510                         mov dword ptr [ebp + 0x10], eax
1008ac64  85f6                           test esi, esi
1008ac66  7403                           je 0x1008ac6b
1008ac68  897e50                         mov dword ptr [esi + 0x50], edi
1008ac6b  837d0800                       cmp dword ptr [ebp + 8], 0
1008ac6f  753c                           jne 0x1008acad
1008ac71  8b839c000000                   mov eax, dword ptr [ebx + 0x9c]
1008ac77  8bcb                           mov ecx, ebx
1008ac79  85c0                           test eax, eax
1008ac7b  740f                           je 0x1008ac8c
1008ac7d  0f1f00                         nop dword ptr [eax]
1008ac80  8bc8                           mov ecx, eax
1008ac82  8b819c000000                   mov eax, dword ptr [ecx + 0x9c]
1008ac88  85c0                           test eax, eax
1008ac8a  75f4                           jne 0x1008ac80
1008ac8c  83797800                       cmp dword ptr [ecx + 0x78], 0
1008ac90  741b                           je 0x1008acad
1008ac92  8b4e60                         mov ecx, dword ptr [esi + 0x60]
1008ac95  8b5650                         mov edx, dword ptr [esi + 0x50]
1008ac98  85c9                           test ecx, ecx
1008ac9a  7411                           je 0x1008acad
1008ac9c  0f1f4000                       nop dword ptr [eax]
1008aca0  2b5158                         sub edx, dword ptr [ecx + 0x58]
1008aca3  895150                         mov dword ptr [ecx + 0x50], edx
1008aca6  8b4960                         mov ecx, dword ptr [ecx + 0x60]
1008aca9  85c9                           test ecx, ecx
1008acab  75f3                           jne 0x1008aca0
1008acad  8b45f0                         mov eax, dword ptr [ebp - 0x10]
1008acb0  897b58                         mov dword ptr [ebx + 0x58], edi
1008acb3  894354                         mov dword ptr [ebx + 0x54], eax
1008acb6  8b45f8                         mov eax, dword ptr [ebp - 8]
1008acb9  5f                             pop edi
1008acba  89435c                         mov dword ptr [ebx + 0x5c], eax
1008acbd  8b4510                         mov eax, dword ptr [ebp + 0x10]
1008acc0  5e                             pop esi
1008acc1  5b                             pop ebx
1008acc2  8be5                           mov esp, ebp
1008acc4  5d                             pop ebp
1008acc5  c20c00                         ret 0xc
1008acc8  cc                             int3 
1008acc9  cc                             int3 
1008acca  cc                             int3 
1008accb  cc                             int3 
1008accc  cc                             int3 
1008accd  cc                             int3 
1008acce  cc                             int3 
1008accf  cc                             int3 
