; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1009de00 <= VA < 0x1009df90 (next decompiler entry; may include padding/thunks)
1009de00  55                             push ebp
1009de01  8bec                           mov ebp, esp
1009de03  6aff                           push -1
1009de05  68c9c40a10                     push 0x100ac4c9
1009de0a  64a100000000                   mov eax, dword ptr fs:[0]
1009de10  50                             push eax
1009de11  83ec4c                         sub esp, 0x4c
1009de14  a10c100d10                     mov eax, dword ptr [0x100d100c]
1009de19  33c5                           xor eax, ebp
1009de1b  8945f0                         mov dword ptr [ebp - 0x10], eax
1009de1e  53                             push ebx
1009de1f  56                             push esi
1009de20  57                             push edi
1009de21  50                             push eax
1009de22  8d45f4                         lea eax, [ebp - 0xc]
1009de25  64a300000000                   mov dword ptr fs:[0], eax
1009de2b  8bd9                           mov ebx, ecx
1009de2d  895db4                         mov dword ptr [ebp - 0x4c], ebx
1009de30  8b4508                         mov eax, dword ptr [ebp + 8]
1009de33  51                             push ecx
1009de34  8945b0                         mov dword ptr [ebp - 0x50], eax
1009de37  e894020000                     call 0x1009e0d0
1009de3c  8b7368                         mov esi, dword ptr [ebx + 0x68]
1009de3f  8b4358                         mov eax, dword ptr [ebx + 0x58]
1009de42  8b4b5c                         mov ecx, dword ptr [ebx + 0x5c]
1009de45  99                             cdq 
1009de46  8bbe80000000                   mov edi, dword ptr [esi + 0x80]
1009de4c  2bc2                           sub eax, edx
1009de4e  037b50                         add edi, dword ptr [ebx + 0x50]
1009de51  8bd8                           mov ebx, eax
1009de53  d1fb                           sar ebx, 1
1009de55  03df                           add ebx, edi
1009de57  897db8                         mov dword ptr [ebp - 0x48], edi
1009de5a  8b7e7c                         mov edi, dword ptr [esi + 0x7c]
1009de5d  8b75b4                         mov esi, dword ptr [ebp - 0x4c]
1009de60  894dac                         mov dword ptr [ebp - 0x54], ecx
1009de63  8b7678                         mov esi, dword ptr [esi + 0x78]
1009de66  8b4658                         mov eax, dword ptr [esi + 0x58]
1009de69  8b4e5c                         mov ecx, dword ptr [esi + 0x5c]
1009de6c  99                             cdq 
1009de6d  2bc2                           sub eax, edx
1009de6f  894dac                         mov dword ptr [ebp - 0x54], ecx
1009de72  d1f8                           sar eax, 1
1009de74  2bd8                           sub ebx, eax
1009de76  899e80000000                   mov dword ptr [esi + 0x80], ebx
1009de7c  8b5db4                         mov ebx, dword ptr [ebp - 0x4c]
1009de7f  8b4378                         mov eax, dword ptr [ebx + 0x78]
1009de82  89787c                         mov dword ptr [eax + 0x7c], edi
1009de85  8b4b78                         mov ecx, dword ptr [ebx + 0x78]
1009de88  8b7db0                         mov edi, dword ptr [ebp - 0x50]
1009de8b  57                             push edi
1009de8c  8b01                           mov eax, dword ptr [ecx]
1009de8e  ff5004                         call dword ptr [eax + 4]
1009de91  8b7374                         mov esi, dword ptr [ebx + 0x74]
1009de94  83be6c08000008                 cmp dword ptr [esi + 0x86c], 8
1009de9b  8d8658080000                   lea eax, [esi + 0x858]
1009dea1  7202                           jb 0x1009dea5
1009dea3  8b00                           mov eax, dword ptr [eax]
1009dea5  50                             push eax
1009dea6  ff7308                         push dword ptr [ebx + 8]
1009dea9  8bce                           mov ecx, esi
1009deab  e8b066feff                     call 0x10084560
1009deb0  3bfb                           cmp edi, ebx
1009deb2  0f8597000000                   jne 0x1009df4f
1009deb8  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009debb  8b5358                         mov edx, dword ptr [ebx + 0x58]
1009debe  8955ac                         mov dword ptr [ebp - 0x54], edx
1009dec1  8b535c                         mov edx, dword ptr [ebx + 0x5c]
1009dec4  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009dec7  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009deca  03c1                           add eax, ecx
1009decc  8955b4                         mov dword ptr [ebp - 0x4c], edx
1009decf  83be8008000001                 cmp dword ptr [esi + 0x880], 1
1009ded6  8945b0                         mov dword ptr [ebp - 0x50], eax
1009ded9  7474                           je 0x1009df4f
1009dedb  833e00                         cmp dword ptr [esi], 0
1009dede  746f                           je 0x1009df4f
1009dee0  8d4dbc                         lea ecx, [ebp - 0x44]
1009dee3  ff15f0fe0d10                   call dword ptr [0x100dfef0]
1009dee9  6a01                           push 1
1009deeb  8d4dbc                         lea ecx, [ebp - 0x44]
1009deee  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009def5  ff1550ff0d10                   call dword ptr [0x100dff50]
1009defb  6a01                           push 1
1009defd  8d4dbc                         lea ecx, [ebp - 0x44]
1009df00  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009df06  68ff000000                     push 0xff
1009df0b  8d4dbc                         lea ecx, [ebp - 0x44]
1009df0e  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009df14  8b0e                           mov ecx, dword ptr [esi]
1009df16  8d45bc                         lea eax, [ebp - 0x44]
1009df19  50                             push eax
1009df1a  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009df20  8b45b0                         mov eax, dword ptr [ebp - 0x50]
1009df23  8d4dbc                         lea ecx, [ebp - 0x44]
1009df26  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009df29  898674080000                   mov dword ptr [esi + 0x874], eax
1009df2f  8b45b4                         mov eax, dword ptr [ebp - 0x4c]
1009df32  89867c080000                   mov dword ptr [esi + 0x87c], eax
1009df38  8b45ac                         mov eax, dword ptr [ebp - 0x54]
1009df3b  89be70080000                   mov dword ptr [esi + 0x870], edi
1009df41  898678080000                   mov dword ptr [esi + 0x878], eax
1009df47  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
1009df4d  eb03                           jmp 0x1009df52
1009df4f  8b7db8                         mov edi, dword ptr [ebp - 0x48]
1009df52  8b4368                         mov eax, dword ptr [ebx + 0x68]
1009df55  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009df58  8b4354                         mov eax, dword ptr [ebx + 0x54]
1009df5b  03c1                           add eax, ecx
1009df5d  897b48                         mov dword ptr [ebx + 0x48], edi
1009df60  89434c                         mov dword ptr [ebx + 0x4c], eax
1009df63  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009df66  64890d00000000                 mov dword ptr fs:[0], ecx
1009df6d  59                             pop ecx
1009df6e  5f                             pop edi
1009df6f  5e                             pop esi
1009df70  5b                             pop ebx
1009df71  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009df74  33cd                           xor ecx, ebp
1009df76  e8dc490000                     call 0x100a2957
1009df7b  8be5                           mov esp, ebp
1009df7d  5d                             pop ebp
1009df7e  c20400                         ret 4
1009df81  cc                             int3 
1009df82  cc                             int3 
1009df83  cc                             int3 
1009df84  cc                             int3 
1009df85  cc                             int3 
1009df86  cc                             int3 
1009df87  cc                             int3 
1009df88  cc                             int3 
1009df89  cc                             int3 
1009df8a  cc                             int3 
1009df8b  cc                             int3 
1009df8c  cc                             int3 
1009df8d  cc                             int3 
1009df8e  cc                             int3 
1009df8f  cc                             int3 
