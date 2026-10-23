; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009dbc0 <= VA < 0x1009dd00 (next decompiler entry; may include padding/thunks)
1009dbc0  55                             push ebp
1009dbc1  8bec                           mov ebp, esp
1009dbc3  83e4f8                         and esp, 0xfffffff8
1009dbc6  83ec1c                         sub esp, 0x1c
1009dbc9  837d0c00                       cmp dword ptr [ebp + 0xc], 0
1009dbcd  53                             push ebx
1009dbce  56                             push esi
1009dbcf  57                             push edi
1009dbd0  8bd9                           mov ebx, ecx
1009dbd2  741d                           je 0x1009dbf1
1009dbd4  837b4400                       cmp dword ptr [ebx + 0x44], 0
1009dbd8  7517                           jne 0x1009dbf1
1009dbda  8b4508                         mov eax, dword ptr [ebp + 8]
1009dbdd  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009dbe0  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009dbe3  8910                           mov dword ptr [eax], edx
1009dbe5  894804                         mov dword ptr [eax + 4], ecx
1009dbe8  5f                             pop edi
1009dbe9  5e                             pop esi
1009dbea  5b                             pop ebx
1009dbeb  8be5                           mov esp, ebp
1009dbed  5d                             pop ebp
1009dbee  c20800                         ret 8
1009dbf1  c7434400000000                 mov dword ptr [ebx + 0x44], 0
1009dbf8  e8f3a7feff                     call 0x100883f0
1009dbfd  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009dc00  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009dc07  8d8658080000                   lea eax, [esi + 0x858]
1009dc0d  89742410                       mov dword ptr [esp + 0x10], esi
1009dc11  7202                           jb 0x1009dc15
1009dc13  8b00                           mov eax, dword ptr [eax]
1009dc15  50                             push eax
1009dc16  ff7308                         push dword ptr [ebx + 8]
1009dc19  8bce                           mov ecx, esi
1009dc1b  e84069feff                     call 0x10084560
1009dc20  33c0                           xor eax, eax
1009dc22  c744241800000000               mov dword ptr [esp + 0x18], 0
1009dc2a  8944241c                       mov dword ptr [esp + 0x1c], eax
1009dc2e  c744241460e00000               mov dword ptr [esp + 0x14], 0xe060
1009dc36  3906                           cmp dword ptr [esi], eax
1009dc38  7452                           je 0x1009dc8c
1009dc3a  81ec20040000                   sub esp, 0x420
1009dc40  83c604                         add esi, 4
1009dc43  8bfc                           mov edi, esp
1009dc45  b908010000                     mov ecx, 0x108
1009dc4a  f3a5                           rep movsd dword ptr es:[edi], dword ptr [esi]
1009dc4c  8bb42430040000                 mov esi, dword ptr [esp + 0x430]
1009dc53  8bce                           mov ecx, esi
1009dc55  e8c66bfeff                     call 0x10084820
1009dc5a  8b0e                           mov ecx, dword ptr [esi]
1009dc5c  8b3d2cff0d10                   mov edi, dword ptr [0x100dff2c]
1009dc62  50                             push eax
1009dc63  ffd7                           call edi
1009dc65  8b4c2410                       mov ecx, dword ptr [esp + 0x10]
1009dc69  8bf0                           mov esi, eax
1009dc6b  8d442418                       lea eax, [esp + 0x18]
1009dc6f  50                             push eax
1009dc70  6a01                           push 1
1009dc72  8b09                           mov ecx, dword ptr [ecx]
1009dc74  8d44241c                       lea eax, [esp + 0x1c]
1009dc78  50                             push eax
1009dc79  ff1508fe0d10                   call dword ptr [0x100dfe08]
1009dc7f  8b442410                       mov eax, dword ptr [esp + 0x10]
1009dc83  56                             push esi
1009dc84  8b08                           mov ecx, dword ptr [eax]
1009dc86  ffd7                           call edi
1009dc88  8b44241c                       mov eax, dword ptr [esp + 0x1c]
1009dc8c  6a64                           push 0x64
1009dc8e  6a14                           push 0x14
1009dc90  50                             push eax
1009dc91  ff15c8e20a10                   call dword ptr [0x100ae2c8]
1009dc97  8b4c2418                       mov ecx, dword ptr [esp + 0x18]
1009dc9b  8d542420                       lea edx, [esp + 0x20]
1009dc9f  ff750c                         push dword ptr [ebp + 0xc]
1009dca2  898b80000000                   mov dword ptr [ebx + 0x80], ecx
1009dca8  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009dcab  898384000000                   mov dword ptr [ebx + 0x84], eax
1009dcb1  8b4308                         mov eax, dword ptr [ebx + 8]
1009dcb4  52                             push edx
1009dcb5  894108                         mov dword ptr [ecx + 8], eax
1009dcb8  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009dcbb  8b01                           mov eax, dword ptr [ecx]
1009dcbd  ff5008                         call dword ptr [eax + 8]
1009dcc0  8bb380000000                   mov esi, dword ptr [ebx + 0x80]
1009dcc6  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009dcc9  39742420                       cmp dword ptr [esp + 0x20], esi
1009dccd  8b8b84000000                   mov ecx, dword ptr [ebx + 0x84]
1009dcd3  0f4f742420                     cmovg esi, dword ptr [esp + 0x20]
1009dcd8  8b4054                         mov eax, dword ptr [eax + 0x54]
1009dcdb  8b542424                       mov edx, dword ptr [esp + 0x24]
1009dcdf  03d1                           add edx, ecx
1009dce1  897358                         mov dword ptr [ebx + 0x58], esi
1009dce4  2bc1                           sub eax, ecx
1009dce6  89535c                         mov dword ptr [ebx + 0x5c], edx
1009dce9  894354                         mov dword ptr [ebx + 0x54], eax
1009dcec  8b4508                         mov eax, dword ptr [ebp + 8]
1009dcef  5f                             pop edi
1009dcf0  8930                           mov dword ptr [eax], esi
1009dcf2  5e                             pop esi
1009dcf3  895004                         mov dword ptr [eax + 4], edx
1009dcf6  5b                             pop ebx
1009dcf7  8be5                           mov esp, ebp
1009dcf9  5d                             pop ebp
1009dcfa  c20800                         ret 8
1009dcfd  cc                             int3 
1009dcfe  cc                             int3 
1009dcff  cc                             int3 
