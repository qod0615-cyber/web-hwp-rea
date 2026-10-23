; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1008ba00 <= VA < 0x1008bc10 (next decompiler entry; may include padding/thunks)
1008ba00  55                             push ebp
1008ba01  8bec                           mov ebp, esp
1008ba03  6aff                           push -1
1008ba05  68c0c20a10                     push 0x100ac2c0
1008ba0a  64a100000000                   mov eax, dword ptr fs:[0]
1008ba10  50                             push eax
1008ba11  83ec4c                         sub esp, 0x4c
1008ba14  a10c100d10                     mov eax, dword ptr [0x100d100c]
1008ba19  33c5                           xor eax, ebp
1008ba1b  8945f0                         mov dword ptr [ebp - 0x10], eax
1008ba1e  53                             push ebx
1008ba1f  56                             push esi
1008ba20  57                             push edi
1008ba21  50                             push eax
1008ba22  8d45f4                         lea eax, [ebp - 0xc]
1008ba25  64a300000000                   mov dword ptr fs:[0], eax
1008ba2b  8bd9                           mov ebx, ecx
1008ba2d  895db4                         mov dword ptr [ebp - 0x4c], ebx
1008ba30  33c0                           xor eax, eax
1008ba32  c745d407000000                 mov dword ptr [ebp - 0x2c], 7
1008ba39  50                             push eax
1008ba3a  33f6                           xor esi, esi
1008ba3c  668945c0                       mov word ptr [ebp - 0x40], ax
1008ba40  6830ed0a10                     push 0x100aed30
1008ba45  8d4dc0                         lea ecx, [ebp - 0x40]
1008ba48  8975bc                         mov dword ptr [ebp - 0x44], esi
1008ba4b  8975d0                         mov dword ptr [ebp - 0x30], esi
1008ba4e  e87da0f7ff                     call 0x10005ad0
1008ba53  33c9                           xor ecx, ecx
1008ba55  8975fc                         mov dword ptr [ebp - 4], esi
1008ba58  894db8                         mov dword ptr [ebp - 0x48], ecx
1008ba5b  8bfb                           mov edi, ebx
1008ba5d  894db0                         mov dword ptr [ebp - 0x50], ecx
1008ba60  837f046f                       cmp dword ptr [edi + 4], 0x6f
1008ba64  0f856a010000                   jne 0x1008bbd4
1008ba6a  83bf9800000000                 cmp dword ptr [edi + 0x98], 0
1008ba71  0f855d010000                   jne 0x1008bbd4
1008ba77  8d4724                         lea eax, [edi + 0x24]
1008ba7a  50                             push eax
1008ba7b  8d4dd8                         lea ecx, [ebp - 0x28]
1008ba7e  e87d82fbff                     call 0x10043d00
1008ba83  83ce02                         or esi, 2
1008ba86  8975bc                         mov dword ptr [ebp - 0x44], esi
1008ba89  c645fc01                       mov byte ptr [ebp - 4], 1
1008ba8d  8d45d8                         lea eax, [ebp - 0x28]
1008ba90  837dec08                       cmp dword ptr [ebp - 0x14], 8
1008ba94  ff75e8                         push dword ptr [ebp - 0x18]
1008ba97  0f4345d8                       cmovae eax, dword ptr [ebp - 0x28]
1008ba9b  50                             push eax
1008ba9c  51                             push ecx
1008ba9d  8d4dc0                         lea ecx, [ebp - 0x40]
1008baa0  e8cbbeffff                     call 0x10087970
1008baa5  8d4dd8                         lea ecx, [ebp - 0x28]
1008baa8  c645fc00                       mov byte ptr [ebp - 4], 0
1008baac  e85fa1f7ff                     call 0x10005c10
1008bab1  837dd408                       cmp dword ptr [ebp - 0x2c], 8
1008bab5  8d4dc0                         lea ecx, [ebp - 0x40]
1008bab8  0f434dc0                       cmovae ecx, dword ptr [ebp - 0x40]
1008babc  33f6                           xor esi, esi
1008babe  894dac                         mov dword ptr [ebp - 0x54], ecx
1008bac1  3935d4c80d10                   cmp dword ptr [0x100dc8d4], esi
1008bac7  7450                           je 0x1008bb19
1008bac9  33c0                           xor eax, eax
1008bacb  0f1f440000                     nop dword ptr [eax + eax]
1008bad0  8b80d0c80d10                   mov eax, dword ptr [eax + 0x100dc8d0]
1008bad6  668b11                         mov dx, word ptr [ecx]
1008bad9  663b10                         cmp dx, word ptr [eax]
1008badc  751e                           jne 0x1008bafc
1008bade  6685d2                         test dx, dx
1008bae1  7415                           je 0x1008baf8
1008bae3  668b5102                       mov dx, word ptr [ecx + 2]
1008bae7  663b5002                       cmp dx, word ptr [eax + 2]
1008baeb  750f                           jne 0x1008bafc
1008baed  83c104                         add ecx, 4
1008baf0  83c004                         add eax, 4
1008baf3  6685d2                         test dx, dx
1008baf6  75de                           jne 0x1008bad6
1008baf8  33c0                           xor eax, eax
1008bafa  eb05                           jmp 0x1008bb01
1008bafc  1bc0                           sbb eax, eax
1008bafe  83c801                         or eax, 1
1008bb01  85c0                           test eax, eax
1008bb03  745c                           je 0x1008bb61
1008bb05  8b4dac                         mov ecx, dword ptr [ebp - 0x54]
1008bb08  46                             inc esi
1008bb09  8d04f500000000                 lea eax, [esi*8]
1008bb10  83b8d4c80d1000                 cmp dword ptr [eax + 0x100dc8d4], 0
1008bb17  75b7                           jne 0x1008bad0
1008bb19  33c0                           xor eax, eax
1008bb1b  85c0                           test eax, eax
1008bb1d  0f8492000000                   je 0x1008bbb5
1008bb23  8b4760                         mov eax, dword ptr [edi + 0x60]
1008bb26  8d4dd8                         lea ecx, [ebp - 0x28]
1008bb29  83c024                         add eax, 0x24
1008bb2c  50                             push eax
1008bb2d  e8ce81fbff                     call 0x10043d00
1008bb32  8b75bc                         mov esi, dword ptr [ebp - 0x44]
1008bb35  8d45d8                         lea eax, [ebp - 0x28]
1008bb38  83ce05                         or esi, 5
1008bb3b  837dec08                       cmp dword ptr [ebp - 0x14], 8
1008bb3f  0f4345d8                       cmovae eax, dword ptr [ebp - 0x28]
1008bb43  0fb700                         movzx eax, word ptr [eax]
1008bb46  50                             push eax
1008bb47  ff1538e60a10                   call dword ptr [0x100ae638]
1008bb4d  83c404                         add esp, 4
1008bb50  85c0                           test eax, eax
1008bb52  7414                           je 0x1008bb68
1008bb54  8b4760                         mov eax, dword ptr [edi + 0x60]
1008bb57  8378046f                       cmp dword ptr [eax + 4], 0x6f
1008bb5b  750b                           jne 0x1008bb68
1008bb5d  32db                           xor bl, bl
1008bb5f  eb09                           jmp 0x1008bb6a
1008bb61  b801000000                     mov eax, 1
1008bb66  ebb3                           jmp 0x1008bb1b
1008bb68  b301                           mov bl, 1
1008bb6a  8d4dd8                         lea ecx, [ebp - 0x28]
1008bb6d  83e6fe                         and esi, 0xfffffffe
1008bb70  e89ba0f7ff                     call 0x10005c10
1008bb75  84db                           test bl, bl
1008bb77  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1008bb7a  743c                           je 0x1008bbb8
1008bb7c  8bc7                           mov eax, edi
1008bb7e  3bfb                           cmp edi, ebx
1008bb80  741f                           je 0x1008bba1
1008bb82  0f1f4000                       nop dword ptr [eax]
1008bb86  66660f1f840000000000           nop word ptr [eax + eax]
1008bb90  c7809400000001000000           mov dword ptr [eax + 0x94], 1
1008bb9a  8b4064                         mov eax, dword ptr [eax + 0x64]
1008bb9d  3bc3                           cmp eax, ebx
1008bb9f  75ef                           jne 0x1008bb90
1008bba1  b901000000                     mov ecx, 1
1008bba6  c7839400000001000000           mov dword ptr [ebx + 0x94], 1
1008bbb0  894db8                         mov dword ptr [ebp - 0x48], ecx
1008bbb3  eb06                           jmp 0x1008bbbb
1008bbb5  8b75bc                         mov esi, dword ptr [ebp - 0x44]
1008bbb8  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
1008bbbb  8b7f60                         mov edi, dword ptr [edi + 0x60]
1008bbbe  837f6000                       cmp dword ptr [edi + 0x60], 0
1008bbc2  7410                           je 0x1008bbd4
1008bbc4  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1008bbc7  40                             inc eax
1008bbc8  8945b0                         mov dword ptr [ebp - 0x50], eax
1008bbcb  83f806                         cmp eax, 6
1008bbce  0f8c8cfeffff                   jl 0x1008ba60
1008bbd4  85c9                           test ecx, ecx
1008bbd6  7506                           jne 0x1008bbde
1008bbd8  898b94000000                   mov dword ptr [ebx + 0x94], ecx
1008bbde  8d4dc0                         lea ecx, [ebp - 0x40]
1008bbe1  e82aa0f7ff                     call 0x10005c10
1008bbe6  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1008bbe9  64890d00000000                 mov dword ptr fs:[0], ecx
1008bbf0  59                             pop ecx
1008bbf1  5f                             pop edi
1008bbf2  5e                             pop esi
1008bbf3  5b                             pop ebx
1008bbf4  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1008bbf7  33cd                           xor ecx, ebp
1008bbf9  e8596d0100                     call 0x100a2957
1008bbfe  8be5                           mov esp, ebp
1008bc00  5d                             pop ebp
1008bc01  c3                             ret 
1008bc02  cc                             int3 
1008bc03  cc                             int3 
1008bc04  cc                             int3 
1008bc05  cc                             int3 
1008bc06  cc                             int3 
1008bc07  cc                             int3 
1008bc08  cc                             int3 
1008bc09  cc                             int3 
1008bc0a  cc                             int3 
1008bc0b  cc                             int3 
1008bc0c  cc                             int3 
1008bc0d  cc                             int3 
1008bc0e  cc                             int3 
1008bc0f  cc                             int3 
