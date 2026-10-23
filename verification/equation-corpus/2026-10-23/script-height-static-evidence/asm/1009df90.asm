; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009df90 <= VA < 0x1009e0d0 (next decompiler entry; may include padding/thunks)
1009df90  55                             push ebp
1009df91  8bec                           mov ebp, esp
1009df93  83e4f8                         and esp, 0xfffffff8
1009df96  83ec1c                         sub esp, 0x1c
1009df99  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009df9d  53                             push ebx
1009df9e  56                             push esi
1009df9f  57                             push edi
1009dfa0  8bd9                           mov ebx, ecx
1009dfa2  741d                           je 0x1009dfc1
1009dfa4  837b4400                       cmp dword ptr [ebx + 0x44], 0
1009dfa8  7517                           jne 0x1009dfc1
1009dfaa  8b4508                         mov eax, dword ptr [ebp + 8]
1009dfad  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009dfb0  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009dfb3  8910                           mov dword ptr [eax], edx
1009dfb5  894804                         mov dword ptr [eax + 4], ecx
1009dfb8  5f                             pop edi
1009dfb9  5e                             pop esi
1009dfba  5b                             pop ebx
1009dfbb  8be5                           mov esp, ebp
1009dfbd  5d                             pop ebp
1009dfbe  c20800                         ret 8
1009dfc1  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1009dfc8  e823a4feff                     call 0x100883f0
1009dfcd  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009dfd0  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009dfd7  8d8658080000                   lea eax, [esi + 0x858]
1009dfdd  89742410                       mov dword ptr [esp + 0x10], esi
1009dfe1  7202                           jb 0x1009dfe5
1009dfe3  8b00                           mov eax, dword ptr [eax]
1009dfe5  50                             push eax
1009dfe6  ff7308                         push dword ptr [ebx + 8]
1009dfe9  8bce                           mov ecx, esi
1009dfeb  e87065feff                     call 0x10084560
1009dff0  33c0                           xor eax, eax
1009dff2  c744241800000000               mov dword ptr [esp + 0x18], 0
1009dffa  8944241c                       mov dword ptr [esp + 0x1c], eax
1009dffe  c744241463e00000               mov dword ptr [esp + 0x14], 0xe063
1009e006  3906                           cmp dword ptr [esi], eax
1009e008  7452                           je 0x1009e05c
1009e00a  81ec20040000                   sub esp, 0x420
1009e010  83c604                         add esi, 4
1009e013  8bfc                           mov edi, esp
1009e015  b908010000                     mov ecx, 0x108
1009e01a  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009e01c  8bb42430040000                 mov esi, dword ptr [esp + 0x430]
1009e023  8bce                           mov ecx, esi
1009e025  e8f667feff                     call 0x10084820
1009e02a  8b0e                           mov ecx, dword ptr [esi]
1009e02c  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1009e032  50                             push eax
1009e033  ffd7                           call edi
1009e035  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1009e039  8bf0                           mov esi, eax
1009e03b  8d442418                       lea eax, [esp + 0x18]
1009e03f  50                             push eax
1009e040  6a01                           push 1
1009e042  8b09                           mov ecx, dword ptr [ecx]
1009e044  8d44241c                       lea eax, [esp + 0x1c]
1009e048  50                             push eax
1009e049  ff1508fe0d10                   call dword ptr [0x100dfe08]
1009e04f  8b442410                       mov eax, dword ptr [esp + 0x10]
1009e053  56                             push esi
1009e054  8b08                           mov ecx, dword ptr [eax]
1009e056  ffd7                           call edi
1009e058  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1009e05c  6a64                           push 0x64
1009e05e  6a14                           push 0x14
1009e060  50                             push eax
1009e061  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009e067  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1009e06b  8d542420                       lea edx, [esp + 0x20]
1009e06f  ff750c                         push dword ptr [ebp + 0xc]
1009e072  898b80000000                   mov dword ptr [ebx + 0x80], ecx
1009e078  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009e07b  898384000000                   mov dword ptr [ebx + 0x84], eax
1009e081  8b4308                         mov eax, dword ptr [ebx + 8]
1009e084  52                             push edx
1009e085  894108                         mov dword ptr [ecx + 8], eax
1009e088  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009e08b  8b01                           mov eax, dword ptr [ecx]
1009e08d  ff5008                         call dword ptr [eax + 8]
1009e090  8bb380000000                   mov esi, dword ptr [ebx + 0x80]
1009e096  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009e099  39742420                       cmp dword ptr [esp + 0x20], esi
1009e09d  8b8b84000000                   mov ecx, dword ptr [ebx + 0x84]
1009e0a3  0f4f742420                     cmovg esi, dword ptr [esp + 0x20]
1009e0a8  8b4054                         mov eax, dword ptr [eax + 0x54]
1009e0ab  8b542424                       mov edx, dword ptr [esp + 0x24]
1009e0af  03d1                           add edx, ecx
1009e0b1  897358                         mov dword ptr [ebx + 0x58], esi
1009e0b4  2bc1                           sub eax, ecx
1009e0b6  89535c                         mov dword ptr [ebx + 0x5c], edx
1009e0b9  894354                         mov dword ptr [ebx + 0x54], eax
1009e0bc  8b4508                         mov eax, dword ptr [ebp + 8]
1009e0bf  5f                             pop edi
1009e0c0  8930                           mov dword ptr [eax], esi
1009e0c2  5e                             pop esi
1009e0c3  895004                         mov dword ptr [eax + 4], edx
1009e0c6  5b                             pop ebx
1009e0c7  8be5                           mov esp, ebp
1009e0c9  5d                             pop ebp
1009e0ca  c20800                         ret 8
1009e0cd  cc                             int3 
1009e0ce  cc                             int3 
1009e0cf  cc                             int3 
