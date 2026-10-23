; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009ef50 <= VA < 0x1009f0a0 (next decompiler entry; may include padding/thunks)
1009ef50  55                             push ebp
1009ef51  8bec                           mov ebp, esp
1009ef53  83e4f8                         and esp, 0xfffffff8
1009ef56  83ec1c                         sub esp, 0x1c
1009ef59  53                             push ebx
1009ef5a  56                             push esi
1009ef5b  57                             push edi
1009ef5c  8bd9                           mov ebx, ecx
1009ef5e  e88d94feff                     call 0x100883f0
1009ef63  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009ef67  741d                           je 0x1009ef86
1009ef69  837b4400                       cmp dword ptr [ebx + 0x44], 0
1009ef6d  7517                           jne 0x1009ef86
1009ef6f  8b4508                         mov eax, dword ptr [ebp + 8]
1009ef72  8b4b58                         mov ecx, dword ptr [ebx + 0x58]
1009ef75  8908                           mov dword ptr [eax], ecx
1009ef77  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009ef7a  894804                         mov dword ptr [eax + 4], ecx
1009ef7d  5f                             pop edi
1009ef7e  5e                             pop esi
1009ef7f  5b                             pop ebx
1009ef80  8be5                           mov esp, ebp
1009ef82  5d                             pop ebp
1009ef83  c20800                         ret 8
1009ef86  8bcb                           mov ecx, ebx
1009ef88  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1009ef8f  e85c94feff                     call 0x100883f0
1009ef94  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009ef97  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009ef9e  8d8658080000                   lea eax, [esi + 0x858]
1009efa4  89742410                       mov dword ptr [esp + 0x10], esi
1009efa8  7202                           jb 0x1009efac
1009efaa  8b00                           mov eax, dword ptr [eax]
1009efac  50                             push eax
1009efad  ff7308                         push dword ptr [ebx + 8]
1009efb0  8bce                           mov ecx, esi
1009efb2  e8a955feff                     call 0x10084560
1009efb7  33c0                           xor eax, eax
1009efb9  c744241800000000               mov dword ptr [esp + 0x18], 0
1009efc1  8944241c                       mov dword ptr [esp + 0x1c], eax
1009efc5  c744241466e00000               mov dword ptr [esp + 0x14], 0xe066
1009efcd  3906                           cmp dword ptr [esi], eax
1009efcf  7452                           je 0x1009f023
1009efd1  81ec20040000                   sub esp, 0x420
1009efd7  83c604                         add esi, 4
1009efda  8bfc                           mov edi, esp
1009efdc  b908010000                     mov ecx, 0x108
1009efe1  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009efe3  8bb42430040000                 mov esi, dword ptr [esp + 0x430]
1009efea  8bce                           mov ecx, esi
1009efec  e82f58feff                     call 0x10084820
1009eff1  8b0e                           mov ecx, dword ptr [esi]
1009eff3  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1009eff9  50                             push eax
1009effa  ffd7                           call edi
1009effc  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1009f000  8bf0                           mov esi, eax
1009f002  8d442418                       lea eax, [esp + 0x18]
1009f006  50                             push eax
1009f007  6a01                           push 1
1009f009  8b09                           mov ecx, dword ptr [ecx]
1009f00b  8d44241c                       lea eax, [esp + 0x1c]
1009f00f  50                             push eax
1009f010  ff1508fe0d10                   call dword ptr [0x100dfe08]
1009f016  8b442410                       mov eax, dword ptr [esp + 0x10]
1009f01a  56                             push esi
1009f01b  8b08                           mov ecx, dword ptr [eax]
1009f01d  ffd7                           call edi
1009f01f  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1009f023  6a64                           push 0x64
1009f025  6a14                           push 0x14
1009f027  50                             push eax
1009f028  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009f02e  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1009f032  8d542420                       lea edx, [esp + 0x20]
1009f036  ff750c                         push dword ptr [ebp + 0xc]
1009f039  898b80000000                   mov dword ptr [ebx + 0x80], ecx
1009f03f  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009f042  898384000000                   mov dword ptr [ebx + 0x84], eax
1009f048  8b4308                         mov eax, dword ptr [ebx + 8]
1009f04b  52                             push edx
1009f04c  894108                         mov dword ptr [ecx + 8], eax
1009f04f  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009f052  8b01                           mov eax, dword ptr [ecx]
1009f054  ff5008                         call dword ptr [eax + 8]
1009f057  8bb380000000                   mov esi, dword ptr [ebx + 0x80]
1009f05d  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009f060  39742420                       cmp dword ptr [esp + 0x20], esi
1009f064  8b8b84000000                   mov ecx, dword ptr [ebx + 0x84]
1009f06a  0f4f742420                     cmovg esi, dword ptr [esp + 0x20]
1009f06f  8b4054                         mov eax, dword ptr [eax + 0x54]
1009f072  8b542424                       mov edx, dword ptr [esp + 0x24]
1009f076  03d1                           add edx, ecx
1009f078  897358                         mov dword ptr [ebx + 0x58], esi
1009f07b  2bc1                           sub eax, ecx
1009f07d  89535c                         mov dword ptr [ebx + 0x5c], edx
1009f080  894354                         mov dword ptr [ebx + 0x54], eax
1009f083  8b4508                         mov eax, dword ptr [ebp + 8]
1009f086  5f                             pop edi
1009f087  8930                           mov dword ptr [eax], esi
1009f089  5e                             pop esi
1009f08a  895004                         mov dword ptr [eax + 4], edx
1009f08d  5b                             pop ebx
1009f08e  8be5                           mov esp, ebp
1009f090  5d                             pop ebp
1009f091  c20800                         ret 8
1009f094  cc                             int3 
1009f095  cc                             int3 
1009f096  cc                             int3 
1009f097  cc                             int3 
1009f098  cc                             int3 
1009f099  cc                             int3 
1009f09a  cc                             int3 
1009f09b  cc                             int3 
1009f09c  cc                             int3 
1009f09d  cc                             int3 
1009f09e  cc                             int3 
1009f09f  cc                             int3 
