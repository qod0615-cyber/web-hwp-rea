; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009cbd0 <= VA < 0x1009ce10 (next decompiler entry; may include padding/thunks)
1009cbd0  55                             push ebp
1009cbd1  8bec                           mov ebp, esp
1009cbd3  6aff                           push -1
1009cbd5  68c9c40a10                     push 0x100ac4c9
1009cbda  64a100000000                   mov eax, dword ptr fs:[0]
1009cbe0  50                             push eax
1009cbe1  83ec4c                         sub esp, 0x4c
1009cbe4  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009cbe9  33c5                           xor eax, ebp
1009cbeb  8945f0                         mov dword ptr [ebp - 0x10], eax
1009cbee  53                             push ebx
1009cbef  56                             push esi
1009cbf0  57                             push edi
1009cbf1  50                             push eax
1009cbf2  8d45f4                         lea eax, [ebp - 0xc]
1009cbf5  64a300000000                   mov dword ptr fs:[0], eax
1009cbfb  8bd9                           mov ebx, ecx
1009cbfd  895db4                         mov dword ptr [ebp - 0x4c], ebx
1009cc00  8b4508                         mov eax, dword ptr [ebp + 8]
1009cc03  8945b0                         mov dword ptr [ebp - 0x50], eax
1009cc06  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009cc09  8b808c000000                   mov eax, dword ptr [eax + 0x8c]
1009cc0f  8b4864                         mov ecx, dword ptr [eax + 0x64]
1009cc12  8379046f                       cmp dword ptr [ecx + 4], 0x6f
1009cc16  7520                           jne 0x1009cc38
1009cc18  b800200000                     mov eax, 0x2000
1009cc1d  6603819c000000                 add ax, word ptr [ecx + 0x9c]
1009cc24  6683f819                       cmp ax, 0x19
1009cc28  770e                           ja 0x1009cc38
1009cc2a  8b4174                         mov eax, dword ptr [ecx + 0x74]
1009cc2d  6683600e01                     and word ptr [eax + 0xe], 1
1009cc32  7404                           je 0x1009cc38
1009cc34  33ff                           xor edi, edi
1009cc36  eb05                           jmp 0x1009cc3d
1009cc38  bf01000000                     mov edi, 1
1009cc3d  8b4374                         mov eax, dword ptr [ebx + 0x74]
1009cc40  8945b8                         mov dword ptr [ebp - 0x48], eax
1009cc43  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009cc46  99                             cdq 
1009cc47  2bc2                           sub eax, edx
1009cc49  c1e704                         shl edi, 4
1009cc4c  8bf0                           mov esi, eax
1009cc4e  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009cc51  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009cc54  83c704                         add edi, 4
1009cc57  d1fe                           sar esi, 1
1009cc59  037350                         add esi, dword ptr [ebx + 0x50]
1009cc5c  894dac                         mov dword ptr [ebp - 0x54], ecx
1009cc5f  03b080000000                   add esi, dword ptr [eax + 0x80]
1009cc65  8b4308                         mov eax, dword ptr [ebx + 8]
1009cc68  99                             cdq 
1009cc69  f7ff                           idiv edi
1009cc6b  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009cc6e  8bf8                           mov edi, eax
1009cc70  8b8380000000                   mov eax, dword ptr [ebx + 0x80]
1009cc76  99                             cdq 
1009cc77  2bc2                           sub eax, edx
1009cc79  d1f8                           sar eax, 1
1009cc7b  2bf8                           sub edi, eax
1009cc7d  03fe                           add edi, esi
1009cc7f  e85ce4ffff                     call 0x1009b0e0
1009cc84  85c0                           test eax, eax
1009cc86  7404                           je 0x1009cc8c
1009cc88  33c0                           xor eax, eax
1009cc8a  eb0b                           jmp 0x1009cc97
1009cc8c  8b8384000000                   mov eax, dword ptr [ebx + 0x84]
1009cc92  99                             cdq 
1009cc93  2bc2                           sub eax, edx
1009cc95  d1f8                           sar eax, 1
1009cc97  8b7354                         mov esi, dword ptr [ebx + 0x54]
1009cc9a  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
1009cc9d  2bf0                           sub esi, eax
1009cc9f  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009cca2  03707c                         add esi, dword ptr [eax + 0x7c]
1009cca5  8d8158080000                   lea eax, [ecx + 0x858]
1009ccab  83781408                       cmp dword ptr [eax + 0x14], 8
1009ccaf  7202                           jb 0x1009ccb3
1009ccb1  8b00                           mov eax, dword ptr [eax]
1009ccb3  50                             push eax
1009ccb4  ff7308                         push dword ptr [ebx + 8]
1009ccb7  e8a478feff                     call 0x10084560
1009ccbc  8b4db8                         mov ecx, dword ptr [ebp - 0x48]
1009ccbf  685de00000                     push 0xe05d
1009ccc4  56                             push esi
1009ccc5  57                             push edi
1009ccc6  e8657cfeff                     call 0x10084930
1009cccb  8b7368                         mov esi, dword ptr [ebx + 0x68]
1009ccce  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009ccd1  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009ccd4  99                             cdq 
1009ccd5  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009ccdb  2bc2                           sub eax, edx
1009ccdd  037b50                         add edi, dword ptr [ebx + 0x50]
1009cce0  8bd8                           mov ebx, eax
1009cce2  d1fb                           sar ebx, 1
1009cce4  03df                           add ebx, edi
1009cce6  897db8                         mov dword ptr [ebp - 0x48], edi
1009cce9  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009ccec  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1009ccef  894dac                         mov dword ptr [ebp - 0x54], ecx
1009ccf2  8b7678                         mov esi, dword ptr [esi + 0x78]
1009ccf5  8b4658                         mov eax, dword ptr [esi + 0x58]
1009ccf8  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009ccfb  99                             cdq 
1009ccfc  2bc2                           sub eax, edx
1009ccfe  894dac                         mov dword ptr [ebp - 0x54], ecx
1009cd01  d1f8                           sar eax, 1
1009cd03  2bd8                           sub ebx, eax
1009cd05  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009cd0b  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1009cd0e  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009cd11  89787c                         mov dword ptr [eax + 0x7c], edi
1009cd14  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009cd17  8b7db0                         mov edi, dword ptr [ebp - 0x50]
1009cd1a  57                             push edi
1009cd1b  8b01                           mov eax, dword ptr [ecx]
1009cd1d  ff5004                         call dword ptr [eax + 4]
1009cd20  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009cd23  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009cd2a  8d8658080000                   lea eax, [esi + 0x858]
1009cd30  7202                           jb 0x1009cd34
1009cd32  8b00                           mov eax, dword ptr [eax]
1009cd34  50                             push eax
1009cd35  ff7308                         push dword ptr [ebx + 8]
1009cd38  8bce                           mov ecx, esi
1009cd3a  e82178feff                     call 0x10084560
1009cd3f  3bfb                           cmp edi, ebx
1009cd41  0f8597000000                   jne 0x1009cdde
1009cd47  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009cd4a  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009cd4d  8955ac                         mov dword ptr [ebp - 0x54], edx
1009cd50  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009cd53  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009cd56  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009cd59  03c1                           add eax, ecx
1009cd5b  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009cd5e  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009cd65  8945b0                         mov dword ptr [ebp - 0x50], eax
1009cd68  7474                           je 0x1009cdde
1009cd6a  833e00                         cmp dword ptr [esi], 0
1009cd6d  746f                           je 0x1009cdde
1009cd6f  8d4dbc                         lea ecx, [ebp - 0x44]
1009cd72  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009cd78  6a01                           push 1
1009cd7a  8d4dbc                         lea ecx, [ebp - 0x44]
1009cd7d  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009cd84  ff1550ff0d10                   call dword ptr [0x100dff50]
1009cd8a  6a01                           push 1
1009cd8c  8d4dbc                         lea ecx, [ebp - 0x44]
1009cd8f  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009cd95  68ff000000                     push 0xff
1009cd9a  8d4dbc                         lea ecx, [ebp - 0x44]
1009cd9d  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009cda3  8b0e                           mov ecx, dword ptr [esi]
1009cda5  8d45bc                         lea eax, [ebp - 0x44]
1009cda8  50                             push eax
1009cda9  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009cdaf  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009cdb2  8d4dbc                         lea ecx, [ebp - 0x44]
1009cdb5  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009cdb8  898674080000                   mov dword ptr [esi + 0x874], eax
1009cdbe  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009cdc1  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009cdc7  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1009cdca  89be70080000                   mov dword ptr [esi + 0x870], edi
1009cdd0  898678080000                   mov dword ptr [esi + 0x878], eax
1009cdd6  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009cddc  eb03                           jmp 0x1009cde1
1009cdde  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009cde1  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009cde4  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009cde7  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009cdea  03c1                           add eax, ecx
1009cdec  897b48                         mov dword ptr [ebx + 0x48], edi
1009cdef  89434c                         mov dword ptr [ebx + 0x4c], eax
1009cdf2  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009cdf5  64890d00000000                 mov dword ptr fs:[0], ecx
1009cdfc  59                             pop ecx
1009cdfd  5f                             pop edi
1009cdfe  5e                             pop esi
1009cdff  5b                             pop ebx
1009ce00  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009ce03  33cd                           xor ecx, ebp
1009ce05  e84d5b0000                     call 0x100a2957
1009ce0a  8be5                           mov esp, ebp
1009ce0c  5d                             pop ebp
1009ce0d  c20400                         ret 4
