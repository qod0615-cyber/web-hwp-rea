; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x1005e970 <= VA < 0x1005f0b0 (next decompiler entry; may include padding/thunks)
1005e970  55                             push ebp
1005e971  8bec                           mov ebp, esp
1005e973  6aff                           push -1
1005e975  6819a90a10                     push 0x100aa919
1005e97a  64a100000000                   mov eax, dword ptr fs:[0]
1005e980  50                             push eax
1005e981  53                             push ebx
1005e982  56                             push esi
1005e983  57                             push edi
1005e984  a10c100d10                     mov eax, dword ptr [0x100d100c]
1005e989  33c5                           xor eax, ebp
1005e98b  50                             push eax
1005e98c  8d45f4                         lea eax, [ebp - 0xc]
1005e98f  64a300000000                   mov dword ptr fs:[0], eax
1005e995  8bf1                           mov esi, ecx
1005e997  8b4514                         mov eax, dword ptr [ebp + 0x14]
1005e99a  8b5e04                         mov ebx, dword ptr [esi + 4]
1005e99d  c70000000000                   mov dword ptr [eax], 0
1005e9a3  83c30c                         add ebx, 0xc
1005e9a6  7403                           je 0x1005e9ab
1005e9a8  ff431c                         inc dword ptr [ebx + 0x1c]
1005e9ab  8b7d0c                         mov edi, dword ptr [ebp + 0xc]
1005e9ae  81ff88870000                   cmp edi, 0x8788
1005e9b4  7718                           ja 0x1005e9ce
1005e9b6  744e                           je 0x1005ea06
1005e9b8  8d878078ffff                   lea eax, [edi - 0x8780]
1005e9be  83f803                         cmp eax, 3
1005e9c1  0f87a1000000                   ja 0x1005ea68
1005e9c7  ff24856cef0510                 jmp dword ptr [eax*4 + 0x1005ef6c]
1005e9ce  81fff0870000                   cmp edi, 0x87f0
1005e9d4  0f828e000000                   jb 0x1005ea68
1005e9da  81fff1870000                   cmp edi, 0x87f1
1005e9e0  7608                           jbe 0x1005e9ea
1005e9e2  81ff22890000                   cmp edi, 0x8922
1005e9e8  757e                           jne 0x1005ea68
1005e9ea  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005e9ed  8b01                           mov eax, dword ptr [ecx]
1005e9ef  ff502c                         call dword ptr [eax + 0x2c]
1005e9f2  a820                           test al, 0x20
1005e9f4  0f853a050000                   jne 0x1005ef34
1005e9fa  8b4514                         mov eax, dword ptr [ebp + 0x14]
1005e9fd  833800                         cmp dword ptr [eax], 0
1005ea00  0f852e050000                   jne 0x1005ef34
1005ea06  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005ea09  8b01                           mov eax, dword ptr [ecx]
1005ea0b  ff5010                         call dword ptr [eax + 0x10]
1005ea0e  a900080000                     test eax, 0x800
1005ea13  0f851b050000                   jne 0x1005ef34
1005ea19  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005ea1c  8b01                           mov eax, dword ptr [ecx]
1005ea1e  ff5010                         call dword ptr [eax + 0x10]
1005ea21  a900200000                     test eax, 0x2000
1005ea26  0f8508050000                   jne 0x1005ef34
1005ea2c  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005ea2f  8b01                           mov eax, dword ptr [ecx]
1005ea31  ff5010                         call dword ptr [eax + 0x10]
1005ea34  a820                           test al, 0x20
1005ea36  0f85f8040000                   jne 0x1005ef34
1005ea3c  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005ea3f  8b01                           mov eax, dword ptr [ecx]
1005ea41  ff502c                         call dword ptr [eax + 0x2c]
1005ea44  a810                           test al, 0x10
1005ea46  0f85e8040000                   jne 0x1005ef34
1005ea4c  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005ea4f  8b01                           mov eax, dword ptr [ecx]
1005ea51  ff502c                         call dword ptr [eax + 0x2c]
1005ea54  a808                           test al, 8
1005ea56  0f85d8040000                   jne 0x1005ef34
1005ea5c  8b4514                         mov eax, dword ptr [ebp + 0x14]
1005ea5f  833800                         cmp dword ptr [eax], 0
1005ea62  0f85cc040000                   jne 0x1005ef34
1005ea68  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005ea6b  8b01                           mov eax, dword ptr [ecx]
1005ea6d  ff5010                         call dword ptr [eax + 0x10]
1005ea70  a900080000                     test eax, 0x800
1005ea75  0f8560020000                   jne 0x1005ecdb
1005ea7b  8b4d14                         mov ecx, dword ptr [ebp + 0x14]
1005ea7e  c70101000000                   mov dword ptr [ecx], 1
1005ea84  81ff80870000                   cmp edi, 0x8780
1005ea8a  0f87b3010000                   ja 0x1005ec43
1005ea90  0f8494010000                   je 0x1005ec2a
1005ea96  81ffa0840000                   cmp edi, 0x84a0
1005ea9c  7770                           ja 0x1005eb0e
1005ea9e  7462                           je 0x1005eb02
1005eaa0  8d87807bffff                   lea eax, [edi - 0x8480]
1005eaa6  83f812                         cmp eax, 0x12
1005eaa9  0f8709020000                   ja 0x1005ecb8
1005eaaf  0fb68090ef0510                 movzx eax, byte ptr [eax + 0x1005ef90]
1005eab6  ff24857cef0510                 jmp dword ptr [eax*4 + 0x1005ef7c]
1005eabd  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005eac0  8b01                           mov eax, dword ptr [ecx]
1005eac2  ff5010                         call dword ptr [eax + 0x10]
1005eac5  a820                           test al, 0x20
1005eac7  0f850e020000                   jne 0x1005ecdb
1005eacd  8bce                           mov ecx, esi
1005eacf  e83ce9ffff                     call 0x1005d410
1005ead4  e902020000                     jmp 0x1005ecdb
1005ead9  6a01                           push 1
1005eadb  6a00                           push 0
1005eadd  51                             push ecx
1005eade  8bce                           mov ecx, esi
1005eae0  e8fbbfffff                     call 0x1005aae0
1005eae5  e9f1010000                     jmp 0x1005ecdb
1005eaea  8bce                           mov ecx, esi
1005eaec  e8df0a0000                     call 0x1005f5d0
1005eaf1  e9e5010000                     jmp 0x1005ecdb
1005eaf6  8bce                           mov ecx, esi
1005eaf8  e8b30b0000                     call 0x1005f6b0
1005eafd  e9d9010000                     jmp 0x1005ecdb
1005eb02  8bce                           mov ecx, esi
1005eb04  e897e9ffff                     call 0x1005d4a0
1005eb09  e9cd010000                     jmp 0x1005ecdb
1005eb0e  8bc7                           mov eax, edi
1005eb10  2de4840000                     sub eax, 0x84e4
1005eb15  0f8419040000                   je 0x1005ef34
1005eb1b  83e803                         sub eax, 3
1005eb1e  0f84f6000000                   je 0x1005ec1a
1005eb24  2d5d010000                     sub eax, 0x15d
1005eb29  0f8589010000                   jne 0x1005ecb8
1005eb2f  8b4e08                         mov ecx, dword ptr [esi + 8]
1005eb32  8b4130                         mov eax, dword ptr [ecx + 0x30]
1005eb35  83e00f                         and eax, 0xf
1005eb38  83f801                         cmp eax, 1
1005eb3b  7405                           je 0x1005eb42
1005eb3d  83f802                         cmp eax, 2
1005eb40  7540                           jne 0x1005eb82
1005eb42  6a01                           push 1
1005eb44  6a00                           push 0
1005eb46  e8755d0100                     call 0x100748c0
1005eb4b  85c0                           test eax, eax
1005eb4d  7433                           je 0x1005eb82
1005eb4f  b800040000                     mov eax, 0x400
1005eb54  8bce                           mov ecx, esi
1005eb56  66098694000000                 or word ptr [esi + 0x94], ax
1005eb5d  e85e8dffff                     call 0x100578c0
1005eb62  8b4604                         mov eax, dword ptr [esi + 4]
1005eb65  6a00                           push 0
1005eb67  6820001a00                     push 0x1a0020
1005eb6c  6808140000                     push 0x1408
1005eb71  6a00                           push 0
1005eb73  c7403c01000000                 mov dword ptr [eax + 0x3c], 1
1005eb7a  ff15c0ff0d10                   call dword ptr [0x100dffc0]
1005eb80  eb44                           jmp 0x1005ebc6
1005eb82  8d4d0c                         lea ecx, [ebp + 0xc]
1005eb85  ff1590e00a10                   call dword ptr [0x100ae090]
1005eb8b  8d450c                         lea eax, [ebp + 0xc]
1005eb8e  c745fc00000000                 mov dword ptr [ebp - 4], 0
1005eb95  50                             push eax
1005eb96  8bce                           mov ecx, esi
1005eb98  e893c5ffff                     call 0x1005b130
1005eb9d  8b450c                         mov eax, dword ptr [ebp + 0xc]
1005eba0  8d4d0c                         lea ecx, [ebp + 0xc]
1005eba3  8b40f8                         mov eax, dword ptr [eax - 8]
1005eba6  c745fcffffffff                 mov dword ptr [ebp - 4], 0xffffffff
1005ebad  3986b0000000                   cmp dword ptr [esi + 0xb0], eax
1005ebb3  770b                           ja 0x1005ebc0
1005ebb5  ff1554e20a10                   call dword ptr [0x100ae254]
1005ebbb  e91b010000                     jmp 0x1005ecdb
1005ebc0  ff1554e20a10                   call dword ptr [0x100ae254]
1005ebc6  8b4e08                         mov ecx, dword ptr [esi + 8]
1005ebc9  83ec0c                         sub esp, 0xc
1005ebcc  e8bf6b0100                     call 0x10075790
1005ebd1  8b4604                         mov eax, dword ptr [esi + 4]
1005ebd4  8b4008                         mov eax, dword ptr [eax + 8]
1005ebd7  50                             push eax
1005ebd8  8b08                           mov ecx, dword ptr [eax]
1005ebda  ff5130                         call dword ptr [ecx + 0x30]
1005ebdd  85c0                           test eax, eax
1005ebdf  7423                           je 0x1005ec04
1005ebe1  8bce                           mov ecx, esi
1005ebe3  e8e8090000                     call 0x1005f5d0
1005ebe8  8b4604                         mov eax, dword ptr [esi + 4]
1005ebeb  6a00                           push 0
1005ebed  8b4008                         mov eax, dword ptr [eax + 8]
1005ebf0  50                             push eax
1005ebf1  8b08                           mov ecx, dword ptr [eax]
1005ebf3  ff512c                         call dword ptr [ecx + 0x2c]
1005ebf6  8b4604                         mov eax, dword ptr [esi + 4]
1005ebf9  6a00                           push 0
1005ebfb  8b4008                         mov eax, dword ptr [eax + 8]
1005ebfe  50                             push eax
1005ebff  8b08                           mov ecx, dword ptr [eax]
1005ec01  ff515c                         call dword ptr [ecx + 0x5c]
1005ec04  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005ec07  6a00                           push 0
1005ec09  6a00                           push 0
1005ec0b  6800030000                     push 0x300
1005ec10  8b01                           mov eax, dword ptr [ecx]
1005ec12  ff5028                         call dword ptr [eax + 0x28]
1005ec15  e9c1000000                     jmp 0x1005ecdb
1005ec1a  33c0                           xor eax, eax
1005ec1c  394660                         cmp dword ptr [esi + 0x60], eax
1005ec1f  0f94c0                         sete al
1005ec22  894660                         mov dword ptr [esi + 0x60], eax
1005ec25  e90a030000                     jmp 0x1005ef34
1005ec2a  6a00                           push 0
1005ec2c  6800010700                     push 0x70100
1005ec31  6808140000                     push 0x1408
1005ec36  6a00                           push 0
1005ec38  ff15c0ff0d10                   call dword ptr [0x100dffc0]
1005ec3e  e998000000                     jmp 0x1005ecdb
1005ec43  81ff92870000                   cmp edi, 0x8792
1005ec49  7758                           ja 0x1005eca3
1005ec4b  744a                           je 0x1005ec97
1005ec4d  8d877f78ffff                   lea eax, [edi - 0x8781]
1005ec53  83f807                         cmp eax, 7
1005ec56  7760                           ja 0x1005ecb8
1005ec58  ff2485a4ef0510                 jmp dword ptr [eax*4 + 0x1005efa4]
1005ec5f  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005ec62  6a00                           push 0
1005ec64  8b01                           mov eax, dword ptr [ecx]
1005ec66  ff5030                         call dword ptr [eax + 0x30]
1005ec69  eb99                           jmp 0x1005ec04
1005ec6b  6a00                           push 0
1005ec6d  51                             push ecx
1005ec6e  8bce                           mov ecx, esi
1005ec70  e88b9bffff                     call 0x10058800
1005ec75  eb64                           jmp 0x1005ecdb
1005ec77  6a00                           push 0
1005ec79  6800201d00                     push 0x1d2000
1005ec7e  6808140000                     push 0x1408
1005ec83  6a00                           push 0
1005ec85  ff15c0ff0d10                   call dword ptr [0x100dffc0]
1005ec8b  eb4e                           jmp 0x1005ecdb
1005ec8d  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005ec90  8b01                           mov eax, dword ptr [ecx]
1005ec92  ff503c                         call dword ptr [eax + 0x3c]
1005ec95  eb44                           jmp 0x1005ecdb
1005ec97  6a01                           push 1
1005ec99  51                             push ecx
1005ec9a  8bce                           mov ecx, esi
1005ec9c  e85f9bffff                     call 0x10058800
1005eca1  eb38                           jmp 0x1005ecdb
1005eca3  8bc7                           mov eax, edi
1005eca5  2df0870000                     sub eax, 0x87f0
1005ecaa  7427                           je 0x1005ecd3
1005ecac  83e801                         sub eax, 1
1005ecaf  7418                           je 0x1005ecc9
1005ecb1  2d31010000                     sub eax, 0x131
1005ecb6  7408                           je 0x1005ecc0
1005ecb8  c70100000000                   mov dword ptr [ecx], 0
1005ecbe  eb27                           jmp 0x1005ece7
1005ecc0  8bce                           mov ecx, esi
1005ecc2  e8e9030000                     call 0x1005f0b0
1005ecc7  eb12                           jmp 0x1005ecdb
1005ecc9  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005eccc  8b01                           mov eax, dword ptr [ecx]
1005ecce  ff5040                         call dword ptr [eax + 0x40]
1005ecd1  eb08                           jmp 0x1005ecdb
1005ecd3  8b4e0c                         mov ecx, dword ptr [esi + 0xc]
1005ecd6  8b01                           mov eax, dword ptr [ecx]
1005ecd8  ff5038                         call dword ptr [eax + 0x38]
1005ecdb  8b4514                         mov eax, dword ptr [ebp + 0x14]
1005ecde  833800                         cmp dword ptr [eax], 0
1005ece1  0f854d020000                   jne 0x1005ef34
1005ece7  81ff91840000                   cmp edi, 0x8491
1005eced  0f872b020000                   ja 0x1005ef1e
1005ecf3  0f841c020000                   je 0x1005ef15
1005ecf9  81c7807cffff                   add edi, 0xffff7c80
1005ecff  83ff73                         cmp edi, 0x73
1005ed02  0f872c020000                   ja 0x1005ef34
1005ed08  0fb68738f00510                 movzx eax, byte ptr [edi + 0x1005f038]
1005ed0f  ff2485c4ef0510                 jmp dword ptr [eax*4 + 0x1005efc4]
1005ed16  6880830000                     push 0x8380
1005ed1b  6a00                           push 0
1005ed1d  8bce                           mov ecx, esi
1005ed1f  e87c84ffff                     call 0x100571a0
1005ed24  e90b020000                     jmp 0x1005ef34
1005ed29  6880830000                     push 0x8380
1005ed2e  6a01                           push 1
1005ed30  8bce                           mov ecx, esi
1005ed32  e86984ffff                     call 0x100571a0
1005ed37  e9f8010000                     jmp 0x1005ef34
1005ed3c  6881830000                     push 0x8381
1005ed41  6a00                           push 0
1005ed43  8bce                           mov ecx, esi
1005ed45  e85684ffff                     call 0x100571a0
1005ed4a  e9e5010000                     jmp 0x1005ef34
1005ed4f  6881830000                     push 0x8381
1005ed54  6a01                           push 1
1005ed56  8bce                           mov ecx, esi
1005ed58  e84384ffff                     call 0x100571a0
1005ed5d  e9d2010000                     jmp 0x1005ef34
1005ed62  6886830000                     push 0x8386
1005ed67  6a00                           push 0
1005ed69  8bce                           mov ecx, esi
1005ed6b  e83084ffff                     call 0x100571a0
1005ed70  e9bf010000                     jmp 0x1005ef34
1005ed75  6886830000                     push 0x8386
1005ed7a  6a01                           push 1
1005ed7c  8bce                           mov ecx, esi
1005ed7e  e81d84ffff                     call 0x100571a0
1005ed83  e9ac010000                     jmp 0x1005ef34
1005ed88  6887830000                     push 0x8387
1005ed8d  6a00                           push 0
1005ed8f  8bce                           mov ecx, esi
1005ed91  e80a84ffff                     call 0x100571a0
1005ed96  e999010000                     jmp 0x1005ef34
1005ed9b  6887830000                     push 0x8387
1005eda0  6a01                           push 1
1005eda2  8bce                           mov ecx, esi
1005eda4  e8f783ffff                     call 0x100571a0
1005eda9  e986010000                     jmp 0x1005ef34
1005edae  6889830000                     push 0x8389
1005edb3  6a00                           push 0
1005edb5  8bce                           mov ecx, esi
1005edb7  e8e483ffff                     call 0x100571a0
1005edbc  e973010000                     jmp 0x1005ef34
1005edc1  6889830000                     push 0x8389
1005edc6  6a01                           push 1
1005edc8  8bce                           mov ecx, esi
1005edca  e8d183ffff                     call 0x100571a0
1005edcf  e960010000                     jmp 0x1005ef34
1005edd4  688c830000                     push 0x838c
1005edd9  6a00                           push 0
1005eddb  8bce                           mov ecx, esi
1005eddd  e8be83ffff                     call 0x100571a0
1005ede2  e94d010000                     jmp 0x1005ef34
1005ede7  688c830000                     push 0x838c
1005edec  6a01                           push 1
1005edee  8bce                           mov ecx, esi
1005edf0  e8ab83ffff                     call 0x100571a0
1005edf5  e93a010000                     jmp 0x1005ef34
1005edfa  688d830000                     push 0x838d
1005edff  6a00                           push 0
1005ee01  8bce                           mov ecx, esi
1005ee03  e89883ffff                     call 0x100571a0
1005ee08  e927010000                     jmp 0x1005ef34
1005ee0d  688d830000                     push 0x838d
1005ee12  6a01                           push 1
1005ee14  8bce                           mov ecx, esi
1005ee16  e88583ffff                     call 0x100571a0
1005ee1b  e914010000                     jmp 0x1005ef34
1005ee20  688e830000                     push 0x838e
1005ee25  6a00                           push 0
1005ee27  8bce                           mov ecx, esi
1005ee29  e87283ffff                     call 0x100571a0
1005ee2e  e901010000                     jmp 0x1005ef34
1005ee33  688f830000                     push 0x838f
1005ee38  6a00                           push 0
1005ee3a  8bce                           mov ecx, esi
1005ee3c  e85f83ffff                     call 0x100571a0
1005ee41  e9ee000000                     jmp 0x1005ef34
1005ee46  6897830000                     push 0x8397
1005ee4b  6a00                           push 0
1005ee4d  8bce                           mov ecx, esi
1005ee4f  e84c83ffff                     call 0x100571a0
1005ee54  e9db000000                     jmp 0x1005ef34
1005ee59  6897830000                     push 0x8397
1005ee5e  6a01                           push 1
1005ee60  8bce                           mov ecx, esi
1005ee62  e83983ffff                     call 0x100571a0
1005ee67  e9c8000000                     jmp 0x1005ef34
1005ee6c  6898830000                     push 0x8398
1005ee71  6a00                           push 0
1005ee73  8bce                           mov ecx, esi
1005ee75  e82683ffff                     call 0x100571a0
1005ee7a  e9b5000000                     jmp 0x1005ef34
1005ee7f  6898830000                     push 0x8398
1005ee84  6a01                           push 1
1005ee86  8bce                           mov ecx, esi
1005ee88  e81383ffff                     call 0x100571a0
1005ee8d  e9a2000000                     jmp 0x1005ef34
1005ee92  68e0830000                     push 0x83e0
1005ee97  6a00                           push 0
1005ee99  8bce                           mov ecx, esi
1005ee9b  e80083ffff                     call 0x100571a0
1005eea0  e98f000000                     jmp 0x1005ef34
1005eea5  68e1830000                     push 0x83e1
1005eeaa  6a00                           push 0
1005eeac  8bce                           mov ecx, esi
1005eeae  e8ed82ffff                     call 0x100571a0
1005eeb3  eb7f                           jmp 0x1005ef34
1005eeb5  68e2830000                     push 0x83e2
1005eeba  6a00                           push 0
1005eebc  8bce                           mov ecx, esi
1005eebe  e8dd82ffff                     call 0x100571a0
1005eec3  eb6f                           jmp 0x1005ef34
1005eec5  68e3830000                     push 0x83e3
1005eeca  6a00                           push 0
1005eecc  8bce                           mov ecx, esi
1005eece  e8cd82ffff                     call 0x100571a0
1005eed3  eb5f                           jmp 0x1005ef34
1005eed5  68e0830000                     push 0x83e0
1005eeda  6a01                           push 1
1005eedc  8bce                           mov ecx, esi
1005eede  e8bd82ffff                     call 0x100571a0
1005eee3  eb4f                           jmp 0x1005ef34
1005eee5  68e1830000                     push 0x83e1
1005eeea  6a01                           push 1
1005eeec  8bce                           mov ecx, esi
1005eeee  e8ad82ffff                     call 0x100571a0
1005eef3  eb3f                           jmp 0x1005ef34
1005eef5  68e2830000                     push 0x83e2
1005eefa  6a01                           push 1
1005eefc  8bce                           mov ecx, esi
1005eefe  e89d82ffff                     call 0x100571a0
1005ef03  eb2f                           jmp 0x1005ef34
1005ef05  68e3830000                     push 0x83e3
1005ef0a  6a01                           push 1
1005ef0c  8bce                           mov ecx, esi
1005ef0e  e88d82ffff                     call 0x100571a0
1005ef13  eb1f                           jmp 0x1005ef34
1005ef15  8bce                           mov ecx, esi
1005ef17  e814e3ffff                     call 0x1005d230
1005ef1c  eb16                           jmp 0x1005ef34
1005ef1e  81ffb0840000                   cmp edi, 0x84b0
1005ef24  750e                           jne 0x1005ef34
1005ef26  6a00                           push 0
1005ef28  51                             push ecx
1005ef29  6aff                           push -1
1005ef2b  6a00                           push 0
1005ef2d  8bce                           mov ecx, esi
1005ef2f  e8bce0ffff                     call 0x1005cff0
1005ef34  8b7514                         mov esi, dword ptr [ebp + 0x14]
1005ef37  c70601000000                   mov dword ptr [esi], 1
1005ef3d  85db                           test ebx, ebx
1005ef3f  7410                           je 0x1005ef51
1005ef41  8b431c                         mov eax, dword ptr [ebx + 0x1c]
1005ef44  85c0                           test eax, eax
1005ef46  7e06                           jle 0x1005ef4e
1005ef48  48                             dec eax
1005ef49  89431c                         mov dword ptr [ebx + 0x1c], eax
1005ef4c  eb03                           jmp 0x1005ef51
1005ef4e  ff4b18                         dec dword ptr [ebx + 0x18]
1005ef51  b801000000                     mov eax, 1
1005ef56  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1005ef59  64890d00000000                 mov dword ptr fs:[0], ecx
1005ef60  59                             pop ecx
1005ef61  5f                             pop edi
1005ef62  5e                             pop esi
1005ef63  5b                             pop ebx
1005ef64  8be5                           mov esp, ebp
1005ef66  5d                             pop ebp
1005ef67  c21000                         ret 0x10
1005ef6a  6690                           nop 
1005ef6c  eae9051006ea05                 ljmp 0x5ea:0x61005e9
1005ef73  10ea                           adc dl, ch
1005ef75  e90510eae9                     jmp 0xf9efff7f
1005ef7a  0510eaea05                     add eax, 0x5eaea10
1005ef7f  10f6                           adc dh, dh
1005ef81  ea0510bdea0510                 ljmp 0x1005:0xeabd1005
1005ef88  d9ea                           fldl2e 
1005ef8a  0510b8ec05                     add eax, 0x5ecb810
1005ef8f  1000                           adc byte ptr [eax], al
1005ef91  010404                         add dword ptr [esp + eax], eax
1005ef94  0404                           add al, 4
1005ef96  0404                           add al, 4
1005ef98  0404                           add al, 4
1005ef9a  0404                           add al, 4
1005ef9c  0404                           add al, 4
1005ef9e  0404                           add al, 4
1005efa0  020403                         add al, byte ptr [ebx + eax]
1005efa3  90                             nop 
1005efa4  77ec                           ja 0x1005ef92
1005efa6  05105fec05                     add eax, 0x5ec5f10
1005efab  106bec                         adc byte ptr [ebx - 0x14], ch
1005efae  0510b8ec05                     add eax, 0x5ecb810
1005efb3  10b8ec0510b8                   adc byte ptr [eax - 0x47effa14], bh
1005efb9  ec                             in al, dx
1005efba  0510b8ec05                     add eax, 0x5ecb810
1005efbf  108dec051016                   adc byte ptr [ebp + 0x161005ec], cl
1005efc5  ed                             in eax, dx
1005efc6  05103ced05                     add eax, 0x5ed3c10
1005efcb  1062ed                         adc byte ptr [edx - 0x13], ah
1005efce  051088ed05                     add eax, 0x5ed8810
1005efd3  10aeed0510d4                   adc byte ptr [esi - 0x2beffa13], ch
1005efd9  ed                             in eax, dx
1005efda  0510faed05                     add eax, 0x5edfa10
1005efdf  1020                           adc byte ptr [eax], ah
1005efe1  ee                             out dx, al
1005efe2  051033ee05                     add eax, 0x5ee3310
1005efe7  1046ee                         adc byte ptr [esi - 0x12], al
1005efea  05106cee05                     add eax, 0x5ee6c10
1005efef  1029                           adc byte ptr [ecx], ch
1005eff1  ed                             in eax, dx
1005eff2  05104fed05                     add eax, 0x5ed4f10
1005eff7  1075ed                         adc byte ptr [ebp - 0x13], dh
1005effa  05109bed05                     add eax, 0x5ed9b10
1005efff  10c1                           adc cl, al
1005f001  ed                             in eax, dx
1005f002  0510e7ed05                     add eax, 0x5ede710
1005f007  100dee051059                   adc byte ptr [0x591005ee], cl
1005f00d  ee                             out dx, al
1005f00e  05107fee05                     add eax, 0x5ee7f10
1005f013  1092ee0510a5                   adc byte ptr [edx - 0x5aeffa12], dl
1005f019  ee                             out dx, al
1005f01a  0510b5ee05                     add eax, 0x5eeb510
1005f01f  10c5                           adc ch, al
1005f021  ee                             out dx, al
1005f022  0510d5ee05                     add eax, 0x5eed510
1005f027  10e5                           adc ch, ah
1005f029  ee                             out dx, al
1005f02a  0510f5ee05                     add eax, 0x5eef510
1005f02f  1005ef051034                   adc byte ptr [0x341005ef], al
1005f035  ef                             out dx, eax
1005f036  051000011c                     add eax, 0x1c010010
1005f03b  1c1c                           sbb al, 0x1c
1005f03d  1c02                           sbb al, 2
1005f03f  031c04                         add ebx, dword ptr [esp + eax]
1005f042  1c1c                           sbb al, 0x1c
1005f044  050607081c                     add eax, 0x1c080706
1005f049  1c1c                           sbb al, 0x1c
1005f04b  1c1c                           sbb al, 0x1c
1005f04d  1c1c                           sbb al, 0x1c
1005f04f  090a                           or dword ptr [edx], ecx
1005f051  1c1c                           sbb al, 0x1c
1005f053  1c1c                           sbb al, 0x1c
1005f055  1c1c                           sbb al, 0x1c
1005f057  1c1c                           sbb al, 0x1c
1005f059  1c1c                           sbb al, 0x1c
1005f05b  1c1c                           sbb al, 0x1c
1005f05d  1c1c                           sbb al, 0x1c
1005f05f  1c1c                           sbb al, 0x1c
1005f061  1c1c                           sbb al, 0x1c
1005f063  1c1c                           sbb al, 0x1c
1005f065  1c1c                           sbb al, 0x1c
1005f067  1c0b                           sbb al, 0xb
1005f069  0c1c                           or al, 0x1c
1005f06b  1c1c                           sbb al, 0x1c
1005f06d  1c0d                           sbb al, 0xd
1005f06f  0e                             push cs
1005f070  1c0f                           sbb al, 0xf
1005f072  1c1c                           sbb al, 0x1c
1005f074  1011                           adc byte ptr [ecx], dl
1005f076  1c1c                           sbb al, 0x1c
1005f078  1c1c                           sbb al, 0x1c
1005f07a  1c1c                           sbb al, 0x1c
1005f07c  1c1c                           sbb al, 0x1c
1005f07e  1c12                           sbb al, 0x12
1005f080  131c1c                         adc ebx, dword ptr [esp + ebx]
1005f083  1c1c                           sbb al, 0x1c
1005f085  1c1c                           sbb al, 0x1c
1005f087  1c1c                           sbb al, 0x1c
1005f089  1c1c                           sbb al, 0x1c
1005f08b  1c1c                           sbb al, 0x1c
1005f08d  1c1c                           sbb al, 0x1c
1005f08f  1c1c                           sbb al, 0x1c
1005f091  1c1c                           sbb al, 0x1c
1005f093  1c1c                           sbb al, 0x1c
1005f095  1c1c                           sbb al, 0x1c
1005f097  1c14                           sbb al, 0x14
1005f099  1516171c1c                     adc eax, 0x1c1c1716
1005f09e  1c1c                           sbb al, 0x1c
1005f0a0  1c1c                           sbb al, 0x1c
1005f0a2  1c1c                           sbb al, 0x1c
1005f0a4  1c1c                           sbb al, 0x1c
1005f0a6  1c1c                           sbb al, 0x1c
1005f0a8  1819                           sbb byte ptr [ecx], bl
1005f0aa  1a1b                           sbb bl, byte ptr [ebx]
1005f0ac  cc                             int3 
1005f0ad  cc                             int3 
1005f0ae  cc                             int3 
1005f0af  cc                             int3 
