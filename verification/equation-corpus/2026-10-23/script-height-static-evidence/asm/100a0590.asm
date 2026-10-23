; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100a0590 <= VA < 0x100a0790 (next decompiler entry; may include padding/thunks)
100a0590  55                             push ebp
100a0591  8bec                           mov ebp, esp
100a0593  83e4f8                         and esp, 0xfffffff8
100a0596  83ec34                         sub esp, 0x34
100a0599  53                             push ebx
100a059a  8b5d0c                         mov ebx, dword ptr [ebp + 0xc]
100a059d  56                             push esi
100a059e  57                             push edi
100a059f  8bf9                           mov edi, ecx
100a05a1  85db                           test ebx, ebx
100a05a3  741d                           je 0x100a05c2
100a05a5  837f4400                       cmp dword ptr [edi + 0x44], 0
100a05a9  7517                           jne 0x100a05c2
100a05ab  8b4508                         mov eax, dword ptr [ebp + 8]
100a05ae  8b5758                         mov edx, dword ptr [edi + 0x58]
100a05b1  8b4f5c                         mov ecx, dword ptr [edi + 0x5c]
100a05b4  8910                           mov dword ptr [eax], edx
100a05b6  894804                         mov dword ptr [eax + 4], ecx
100a05b9  5f                             pop edi
100a05ba  5e                             pop esi
100a05bb  5b                             pop ebx
100a05bc  8be5                           mov esp, ebp
100a05be  5d                             pop ebp
100a05bf  c20800                         ret 8
100a05c2  c7474400000000                 mov dword ptr [edi + 0x44], 0
100a05c9  e8227efeff                     call 0x100883f0
100a05ce  8b7774                         mov esi, dword ptr [edi + 0x74]
100a05d1  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
100a05d8  8d8658080000                   lea eax, [esi + 0x858]
100a05de  7202                           jb 0x100a05e2
100a05e0  8b00                           mov eax, dword ptr [eax]
100a05e2  50                             push eax
100a05e3  ff7708                         push dword ptr [edi + 8]
100a05e6  8bce                           mov ecx, esi
100a05e8  e8733ffeff                     call 0x10084560
100a05ed  0fb787ac000000                 movzx eax, word ptr [edi + 0xac]
100a05f4  8bce                           mov ecx, esi
100a05f6  50                             push eax
100a05f7  8d442424                       lea eax, [esp + 0x24]
100a05fb  50                             push eax
100a05fc  e8cf4bfeff                     call 0x100851d0
100a0601  8b08                           mov ecx, dword ptr [eax]
100a0603  898f8c000000                   mov dword ptr [edi + 0x8c], ecx
100a0609  8bce                           mov ecx, esi
100a060b  8b4004                         mov eax, dword ptr [eax + 4]
100a060e  898790000000                   mov dword ptr [edi + 0x90], eax
100a0614  0fb787ae000000                 movzx eax, word ptr [edi + 0xae]
100a061b  50                             push eax
100a061c  8d44242c                       lea eax, [esp + 0x2c]
100a0620  50                             push eax
100a0621  e8aa4bfeff                     call 0x100851d0
100a0626  8b08                           mov ecx, dword ptr [eax]
100a0628  898f94000000                   mov dword ptr [edi + 0x94], ecx
100a062e  8bce                           mov ecx, esi
100a0630  8b4004                         mov eax, dword ptr [eax + 4]
100a0633  898798000000                   mov dword ptr [edi + 0x98], eax
100a0639  0fb787b2000000                 movzx eax, word ptr [edi + 0xb2]
100a0640  50                             push eax
100a0641  8d442434                       lea eax, [esp + 0x34]
100a0645  50                             push eax
100a0646  e8854bfeff                     call 0x100851d0
100a064b  8bce                           mov ecx, esi
100a064d  8b10                           mov edx, dword ptr [eax]
100a064f  89979c000000                   mov dword ptr [edi + 0x9c], edx
100a0655  8b4004                         mov eax, dword ptr [eax + 4]
100a0658  8987a0000000                   mov dword ptr [edi + 0xa0], eax
100a065e  0fb787b0000000                 movzx eax, word ptr [edi + 0xb0]
100a0665  50                             push eax
100a0666  8d44243c                       lea eax, [esp + 0x3c]
100a066a  50                             push eax
100a066b  e8604bfeff                     call 0x100851d0
100a0670  8bb794000000                   mov esi, dword ptr [edi + 0x94]
100a0676  6a64                           push 0x64
100a0678  6a23                           push 0x23
100a067a  8b08                           mov ecx, dword ptr [eax]
100a067c  ffb798000000                   push dword ptr [edi + 0x98]
100a0682  898fa4000000                   mov dword ptr [edi + 0xa4], ecx
100a0688  8b4004                         mov eax, dword ptr [eax + 4]
100a068b  8987a8000000                   mov dword ptr [edi + 0xa8], eax
100a0691  ff15c8e20a10                   call dword ptr [0x100ae2c8]
100a0697  8b8f8c000000                   mov ecx, dword ptr [edi + 0x8c]
100a069d  038f9c000000                   add ecx, dword ptr [edi + 0x9c]
100a06a3  03f1                           add esi, ecx
100a06a5  898788000000                   mov dword ptr [edi + 0x88], eax
100a06ab  837f046c                       cmp dword ptr [edi + 4], 0x6c
100a06af  8b4f08                         mov ecx, dword ptr [edi + 8]
100a06b2  6a64                           push 0x64
100a06b4  89b784000000                   mov dword ptr [edi + 0x84], esi
100a06ba  8b35c8e20a10                   mov esi, dword ptr [0x100ae2c8]
100a06c0  6a44                           push 0x44
100a06c2  750d                           jne 0x100a06d1
100a06c4  8b4778                         mov eax, dword ptr [edi + 0x78]
100a06c7  894808                         mov dword ptr [eax + 8], ecx
100a06ca  ff7708                         push dword ptr [edi + 8]
100a06cd  ffd6                           call esi
100a06cf  eb0c                           jmp 0x100a06dd
100a06d1  51                             push ecx
100a06d2  ffd6                           call esi
100a06d4  8b4f78                         mov ecx, dword ptr [edi + 0x78]
100a06d7  894108                         mov dword ptr [ecx + 8], eax
100a06da  8b4708                         mov eax, dword ptr [edi + 8]
100a06dd  8b4f7c                         mov ecx, dword ptr [edi + 0x7c]
100a06e0  8d542410                       lea edx, [esp + 0x10]
100a06e4  53                             push ebx
100a06e5  52                             push edx
100a06e6  894108                         mov dword ptr [ecx + 8], eax
100a06e9  8b4f78                         mov ecx, dword ptr [edi + 0x78]
100a06ec  8b01                           mov eax, dword ptr [ecx]
100a06ee  ff5008                         call dword ptr [eax + 8]
100a06f1  8b4f7c                         mov ecx, dword ptr [edi + 0x7c]
100a06f4  8d542418                       lea edx, [esp + 0x18]
100a06f8  53                             push ebx
100a06f9  52                             push edx
100a06fa  8b01                           mov eax, dword ptr [ecx]
100a06fc  ff5008                         call dword ptr [eax + 8]
100a06ff  8b4f7c                         mov ecx, dword ptr [edi + 0x7c]
100a0702  8b5f04                         mov ebx, dword ptr [edi + 4]
100a0705  e8d6a9ffff                     call 0x1009b0e0
100a070a  85c0                           test eax, eax
100a070c  741f                           je 0x100a072d
100a070e  83fb6c                         cmp ebx, 0x6c
100a0711  b905000000                     mov ecx, 5
100a0716  6a64                           push 0x64
100a0718  b80f000000                     mov eax, 0xf
100a071d  0f44c1                         cmove eax, ecx
100a0720  50                             push eax
100a0721  ff7708                         push dword ptr [edi + 8]
100a0724  ffd6                           call esi
100a0726  8b5f04                         mov ebx, dword ptr [edi + 4]
100a0729  8bf0                           mov esi, eax
100a072b  eb02                           jmp 0x100a072f
100a072d  33f6                           xor esi, esi
100a072f  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
100a0733  394c2410                       cmp dword ptr [esp + 0x10], ecx
100a0737  8b8784000000                   mov eax, dword ptr [edi + 0x84]
100a073d  0f4f4c2410                     cmovg ecx, dword ptr [esp + 0x10]
100a0742  8b9788000000                   mov edx, dword ptr [edi + 0x88]
100a0748  3bc8                           cmp ecx, eax
100a074a  0f4cc8                         cmovl ecx, eax
100a074d  2bd6                           sub edx, esi
100a074f  03542414                       add edx, dword ptr [esp + 0x14]
100a0753  0354241c                       add edx, dword ptr [esp + 0x1c]
100a0757  83fb6c                         cmp ebx, 0x6c
100a075a  7508                           jne 0x100a0764
100a075c  8b4778                         mov eax, dword ptr [edi + 0x78]
100a075f  8b4054                         mov eax, dword ptr [eax + 0x54]
100a0762  eb12                           jmp 0x100a0776
100a0764  8b477c                         mov eax, dword ptr [edi + 0x7c]
100a0767  8b4054                         mov eax, dword ptr [eax + 0x54]
100a076a  2b8788000000                   sub eax, dword ptr [edi + 0x88]
100a0770  2b442414                       sub eax, dword ptr [esp + 0x14]
100a0774  03c6                           add eax, esi
100a0776  894754                         mov dword ptr [edi + 0x54], eax
100a0779  8b4508                         mov eax, dword ptr [ebp + 8]
100a077c  894f58                         mov dword ptr [edi + 0x58], ecx
100a077f  89575c                         mov dword ptr [edi + 0x5c], edx
100a0782  5f                             pop edi
100a0783  5e                             pop esi
100a0784  8908                           mov dword ptr [eax], ecx
100a0786  895004                         mov dword ptr [eax + 4], edx
100a0789  5b                             pop ebx
100a078a  8be5                           mov esp, ebp
100a078c  5d                             pop ebp
100a078d  c20800                         ret 8
