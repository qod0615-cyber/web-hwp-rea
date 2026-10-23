; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100964c0 <= VA < 0x100968b0 (next decompiler entry; may include padding/thunks)
100964c0  55                             push ebp
100964c1  8bec                           mov ebp, esp
100964c3  6aff                           push -1
100964c5  6869cd0a10                     push 0x100acd69
100964ca  64a100000000                   mov eax, dword ptr fs:[0]
100964d0  50                             push eax
100964d1  81eca4000000                   sub esp, 0xa4
100964d7  a10c100d10                     mov eax, dword ptr [0x100d100c]
100964dc  33c5                           xor eax, ebp
100964de  8945f0                         mov dword ptr [ebp - 0x10], eax
100964e1  53                             push ebx
100964e2  56                             push esi
100964e3  57                             push edi
100964e4  50                             push eax
100964e5  8d45f4                         lea eax, [ebp - 0xc]
100964e8  64a300000000                   mov dword ptr fs:[0], eax
100964ee  8bf9                           mov edi, ecx
100964f0  89bd64ffffff                   mov dword ptr [ebp - 0x9c], edi
100964f6  8b7768                         mov esi, dword ptr [edi + 0x68]
100964f9  8b4508                         mov eax, dword ptr [ebp + 8]
100964fc  8b5f6c                         mov ebx, dword ptr [edi + 0x6c]
100964ff  898570ffffff                   mov dword ptr [ebp - 0x90], eax
10096505  8b4750                         mov eax, dword ptr [edi + 0x50]
10096508  038680000000                   add eax, dword ptr [esi + 0x80]
1009650e  8b4e7c                         mov ecx, dword ptr [esi + 0x7c]
10096511  8b35c8e20a10                   mov esi, dword ptr [0x100ae2c8]
10096517  8945a0                         mov dword ptr [ebp - 0x60], eax
1009651a  8b475c                         mov eax, dword ptr [edi + 0x5c]
1009651d  99                             cdq 
1009651e  2bc2                           sub eax, edx
10096520  c7459000000000                 mov dword ptr [ebp - 0x70], 0
10096527  6a64                           push 0x64
10096529  d1f8                           sar eax, 1
1009652b  2bc8                           sub ecx, eax
1009652d  6a0f                           push 0xf
1009652f  ff7708                         push dword ptr [edi + 8]
10096532  898d74ffffff                   mov dword ptr [ebp - 0x8c], ecx
10096538  8b4f74                         mov ecx, dword ptr [edi + 0x74]
1009653b  894d94                         mov dword ptr [ebp - 0x6c], ecx
1009653e  ffd6                           call esi
10096540  6a64                           push 0x64
10096542  6a14                           push 0x14
10096544  ff7708                         push dword ptr [edi + 8]
10096547  898578ffffff                   mov dword ptr [ebp - 0x88], eax
1009654d  ffd6                           call esi
1009654f  6a64                           push 0x64
10096551  6a14                           push 0x14
10096553  ff7708                         push dword ptr [edi + 8]
10096556  894580                         mov dword ptr [ebp - 0x80], eax
10096559  ffd6                           call esi
1009655b  89856cffffff                   mov dword ptr [ebp - 0x94], eax
10096561  33c0                           xor eax, eax
10096563  894598                         mov dword ptr [ebp - 0x68], eax
10096566  394778                         cmp dword ptr [edi + 0x78], eax
10096569  0f8ee2010000                   jle 0x10096751
1009656f  90                             nop 
10096570  33c9                           xor ecx, ecx
10096572  c7458400000000                 mov dword ptr [ebp - 0x7c], 0
10096579  33d2                           xor edx, edx
1009657b  894d8c                         mov dword ptr [ebp - 0x74], ecx
1009657e  33f6                           xor esi, esi
10096580  89559c                         mov dword ptr [ebp - 0x64], edx
10096583  89b57cffffff                   mov dword ptr [ebp - 0x84], esi
10096589  394f7c                         cmp dword ptr [edi + 0x7c], ecx
1009658c  0f8e53010000                   jle 0x100966e5
10096592  83e001                         and eax, 1
10096595  898560ffffff                   mov dword ptr [ebp - 0xa0], eax
1009659b  0f1f440000                     nop dword ptr [eax + eax]
100965a0  85c0                           test eax, eax
100965a2  0f84c1000000                   je 0x10096669
100965a8  034b58                         add ecx, dword ptr [ebx + 0x58]
100965ab  80bf8800000000                 cmp byte ptr [edi + 0x88], 0
100965b2  8b435c                         mov eax, dword ptr [ebx + 0x5c]
100965b5  89458c                         mov dword ptr [ebp - 0x74], eax
100965b8  894d8c                         mov dword ptr [ebp - 0x74], ecx
100965bb  0f859e000000                   jne 0x1009665f
100965c1  85f6                           test esi, esi
100965c3  0f8598000000                   jne 0x10096661
100965c9  8bb38c000000                   mov esi, dword ptr [ebx + 0x8c]
100965cf  8b7664                         mov esi, dword ptr [esi + 0x64]
100965d2  85f6                           test esi, esi
100965d4  747c                           je 0x10096652
100965d6  3bb390000000                   cmp esi, dword ptr [ebx + 0x90]
100965dc  746b                           je 0x10096649
100965de  8d4624                         lea eax, [esi + 0x24]
100965e1  50                             push eax
100965e2  8d4dd8                         lea ecx, [ebp - 0x28]
100965e5  e816d7faff                     call 0x10043d00
100965ea  837dec08                       cmp dword ptr [ebp - 0x14], 8
100965ee  8d45d8                         lea eax, [ebp - 0x28]
100965f1  8d4dd8                         lea ecx, [ebp - 0x28]
100965f4  0f4345d8                       cmovae eax, dword ptr [ebp - 0x28]
100965f8  0fb738                         movzx edi, word ptr [eax]
100965fb  e810f6f6ff                     call 0x10005c10
10096600  83ff20                         cmp edi, 0x20
10096603  740a                           je 0x1009660f
10096605  83ff7e                         cmp edi, 0x7e
10096608  7405                           je 0x1009660f
1009660a  83ff60                         cmp edi, 0x60
1009660d  7537                           jne 0x10096646
1009660f  8b06                           mov eax, dword ptr [esi]
10096611  8d8d58ffffff                   lea ecx, [ebp - 0xa8]
10096617  6a01                           push 1
10096619  51                             push ecx
1009661a  8bce                           mov ecx, esi
1009661c  ff5008                         call dword ptr [eax + 8]
1009661f  8b559c                         mov edx, dword ptr [ebp - 0x64]
10096622  8b7664                         mov esi, dword ptr [esi + 0x64]
10096625  8b08                           mov ecx, dword ptr [eax]
10096627  03d1                           add edx, ecx
10096629  89559c                         mov dword ptr [ebp - 0x64], edx
1009662c  85f6                           test esi, esi
1009662e  75a6                           jne 0x100965d6
10096630  8b4d8c                         mov ecx, dword ptr [ebp - 0x74]
10096633  8bbd64ffffff                   mov edi, dword ptr [ebp - 0x9c]
10096639  2bca                           sub ecx, edx
1009663b  8bb57cffffff                   mov esi, dword ptr [ebp - 0x84]
10096641  894d8c                         mov dword ptr [ebp - 0x74], ecx
10096644  eb27                           jmp 0x1009666d
10096646  8b559c                         mov edx, dword ptr [ebp - 0x64]
10096649  8bbd64ffffff                   mov edi, dword ptr [ebp - 0x9c]
1009664f  8b4d8c                         mov ecx, dword ptr [ebp - 0x74]
10096652  8bb57cffffff                   mov esi, dword ptr [ebp - 0x84]
10096658  2bca                           sub ecx, edx
1009665a  894d8c                         mov dword ptr [ebp - 0x74], ecx
1009665d  eb0e                           jmp 0x1009666d
1009665f  85f6                           test esi, esi
10096661  7e06                           jle 0x10096669
10096663  034d80                         add ecx, dword ptr [ebp - 0x80]
10096666  894d8c                         mov dword ptr [ebp - 0x74], ecx
10096669  85f6                           test esi, esi
1009666b  751b                           jne 0x10096688
1009666d  80bf8800000001                 cmp byte ptr [edi + 0x88], 1
10096674  7512                           jne 0x10096688
10096676  8b878c000000                   mov eax, dword ptr [edi + 0x8c]
1009667c  8b5598                         mov edx, dword ptr [ebp - 0x68]
1009667f  8b4da0                         mov ecx, dword ptr [ebp - 0x60]
10096682  030c90                         add ecx, dword ptr [eax + edx*4]
10096685  894da0                         mov dword ptr [ebp - 0x60], ecx
10096688  8b45a0                         mov eax, dword ptr [ebp - 0x60]
1009668b  8bcb                           mov ecx, ebx
1009668d  034584                         add eax, dword ptr [ebp - 0x7c]
10096690  ffb570ffffff                   push dword ptr [ebp - 0x90]
10096696  898380000000                   mov dword ptr [ebx + 0x80], eax
1009669c  8b8574ffffff                   mov eax, dword ptr [ebp - 0x8c]
100966a2  2b4354                         sub eax, dword ptr [ebx + 0x54]
100966a5  034590                         add eax, dword ptr [ebp - 0x70]
100966a8  89437c                         mov dword ptr [ebx + 0x7c], eax
100966ab  8b03                           mov eax, dword ptr [ebx]
100966ad  ff5004                         call dword ptr [eax + 4]
100966b0  8b8784000000                   mov eax, dword ptr [edi + 0x84]
100966b6  8b5b64                         mov ebx, dword ptr [ebx + 0x64]
100966b9  8b04b0                         mov eax, dword ptr [eax + esi*4]
100966bc  034580                         add eax, dword ptr [ebp - 0x80]
100966bf  014584                         add dword ptr [ebp - 0x7c], eax
100966c2  85db                           test ebx, ebx
100966c4  741c                           je 0x100966e2
100966c6  8b4d8c                         mov ecx, dword ptr [ebp - 0x74]
100966c9  46                             inc esi
100966ca  8b559c                         mov edx, dword ptr [ebp - 0x64]
100966cd  8b8560ffffff                   mov eax, dword ptr [ebp - 0xa0]
100966d3  89b57cffffff                   mov dword ptr [ebp - 0x84], esi
100966d9  3b777c                         cmp esi, dword ptr [edi + 0x7c]
100966dc  0f8cbefeffff                   jl 0x100965a0
100966e2  8b4d8c                         mov ecx, dword ptr [ebp - 0x74]
100966e5  8b5598                         mov edx, dword ptr [ebp - 0x68]
100966e8  8b8780000000                   mov eax, dword ptr [edi + 0x80]
100966ee  8b0490                         mov eax, dword ptr [eax + edx*4]
100966f1  038578ffffff                   add eax, dword ptr [ebp - 0x88]
100966f7  014590                         add dword ptr [ebp - 0x70], eax
100966fa  8bc2                           mov eax, edx
100966fc  a801                           test al, 1
100966fe  7440                           je 0x10096740
10096700  51                             push ecx
10096701  ff7708                         push dword ptr [edi + 8]
10096704  8b4d94                         mov ecx, dword ptr [ebp - 0x6c]
10096707  e8c4ddfeff                     call 0x100844d0
1009670c  8b8578ffffff                   mov eax, dword ptr [ebp - 0x88]
10096712  8b8d74ffffff                   mov ecx, dword ptr [ebp - 0x8c]
10096718  99                             cdq 
10096719  2bc2                           sub eax, edx
1009671b  d1f8                           sar eax, 1
1009671d  2bc8                           sub ecx, eax
1009671f  8b459c                         mov eax, dword ptr [ebp - 0x64]
10096722  2b8d6cffffff                   sub ecx, dword ptr [ebp - 0x94]
10096728  034d90                         add ecx, dword ptr [ebp - 0x70]
1009672b  0345a0                         add eax, dword ptr [ebp - 0x60]
1009672e  686de00000                     push 0xe06d
10096733  51                             push ecx
10096734  8b4d94                         mov ecx, dword ptr [ebp - 0x6c]
10096737  50                             push eax
10096738  e8f3e1feff                     call 0x10084930
1009673d  8b4598                         mov eax, dword ptr [ebp - 0x68]
10096740  85db                           test ebx, ebx
10096742  740d                           je 0x10096751
10096744  40                             inc eax
10096745  894598                         mov dword ptr [ebp - 0x68], eax
10096748  3b4778                         cmp eax, dword ptr [edi + 0x78]
1009674b  0f8c1ffeffff                   jl 0x10096570
10096751  8b5d94                         mov ebx, dword ptr [ebp - 0x6c]
10096754  83bb6c08000008                 cmp dword ptr [ebx + 0x86c], 8
1009675b  8d8b58080000                   lea ecx, [ebx + 0x858]
10096761  8b4708                         mov eax, dword ptr [edi + 8]
10096764  7202                           jb 0x10096768
10096766  8b09                           mov ecx, dword ptr [ecx]
10096768  89838c030000                   mov dword ptr [ebx + 0x38c], eax
1009676e  8983f8020000                   mov dword ptr [ebx + 0x2f8], eax
10096774  898364020000                   mov dword ptr [ebx + 0x264], eax
1009677a  8983d0010000                   mov dword ptr [ebx + 0x1d0], eax
10096780  89833c010000                   mov dword ptr [ebx + 0x13c], eax
10096786  8983a8000000                   mov dword ptr [ebx + 0xa8], eax
1009678c  894314                         mov dword ptr [ebx + 0x14], eax
1009678f  898348080000                   mov dword ptr [ebx + 0x848], eax
10096795  99                             cdq 
10096796  2bc2                           sub eax, edx
10096798  d1f8                           sar eax, 1
1009679a  898394030000                   mov dword ptr [ebx + 0x394], eax
100967a0  898300030000                   mov dword ptr [ebx + 0x300], eax
100967a6  89836c020000                   mov dword ptr [ebx + 0x26c], eax
100967ac  8983d8010000                   mov dword ptr [ebx + 0x1d8], eax
100967b2  898344010000                   mov dword ptr [ebx + 0x144], eax
100967b8  8983b0000000                   mov dword ptr [ebx + 0xb0], eax
100967be  89431c                         mov dword ptr [ebx + 0x1c], eax
100967c1  89834c080000                   mov dword ptr [ebx + 0x84c], eax
100967c7  8d4304                         lea eax, [ebx + 4]
100967ca  51                             push ecx
100967cb  50                             push eax
100967cc  8bcb                           mov ecx, ebx
100967ce  e89ddffeff                     call 0x10084770
100967d3  39bd70ffffff                   cmp dword ptr [ebp - 0x90], edi
100967d9  0f8598000000                   jne 0x10096877
100967df  8b4768                         mov eax, dword ptr [edi + 0x68]
100967e2  8b7758                         mov esi, dword ptr [edi + 0x58]
100967e5  8b5f5c                         mov ebx, dword ptr [edi + 0x5c]
100967e8  8b487c                         mov ecx, dword ptr [eax + 0x7c]
100967eb  8b4754                         mov eax, dword ptr [edi + 0x54]
100967ee  03c1                           add eax, ecx
100967f0  89856cffffff                   mov dword ptr [ebp - 0x94], eax
100967f6  8b4594                         mov eax, dword ptr [ebp - 0x6c]
100967f9  83b88008000001                 cmp dword ptr [eax + 0x880], 1
10096800  7475                           je 0x10096877
10096802  833800                         cmp dword ptr [eax], 0
10096805  7470                           je 0x10096877
10096807  8d4da4                         lea ecx, [ebp - 0x5c]
1009680a  ff15f0fe0d10                   call dword ptr [0x100dfef0]
10096810  6a01                           push 1
10096812  8d4da4                         lea ecx, [ebp - 0x5c]
10096815  c745fc00000000                 mov dword ptr [ebp - 4], 0
1009681c  ff1550ff0d10                   call dword ptr [0x100dff50]
10096822  6a01                           push 1
10096824  8d4da4                         lea ecx, [ebp - 0x5c]
10096827  ff1514fe0d10                   call dword ptr [0x100dfe14]
1009682d  68ff000000                     push 0xff
10096832  8d4da4                         lea ecx, [ebp - 0x5c]
10096835  ff1510fe0d10                   call dword ptr [0x100dfe10]
1009683b  8b4d94                         mov ecx, dword ptr [ebp - 0x6c]
1009683e  8d45a4                         lea eax, [ebp - 0x5c]
10096841  50                             push eax
10096842  8b09                           mov ecx, dword ptr [ecx]
10096844  ff15f8fd0d10                   call dword ptr [0x100dfdf8]
1009684a  8b4d94                         mov ecx, dword ptr [ebp - 0x6c]
1009684d  8b45a0                         mov eax, dword ptr [ebp - 0x60]
10096850  898170080000                   mov dword ptr [ecx + 0x870], eax
10096856  8b856cffffff                   mov eax, dword ptr [ebp - 0x94]
1009685c  898174080000                   mov dword ptr [ecx + 0x874], eax
10096862  89997c080000                   mov dword ptr [ecx + 0x87c], ebx
10096868  89b178080000                   mov dword ptr [ecx + 0x878], esi
1009686e  8d4da4                         lea ecx, [ebp - 0x5c]
10096871  ff15f0fd0d10                   call dword ptr [0x100dfdf0]
10096877  8b4768                         mov eax, dword ptr [edi + 0x68]
1009687a  8b487c                         mov ecx, dword ptr [eax + 0x7c]
1009687d  8b45a0                         mov eax, dword ptr [ebp - 0x60]
10096880  894748                         mov dword ptr [edi + 0x48], eax
10096883  8b4754                         mov eax, dword ptr [edi + 0x54]
10096886  03c1                           add eax, ecx
10096888  89474c                         mov dword ptr [edi + 0x4c], eax
1009688b  8b4df4                         mov ecx, dword ptr [ebp - 0xc]
1009688e  64890d00000000                 mov dword ptr fs:[0], ecx
10096895  59                             pop ecx
10096896  5f                             pop edi
10096897  5e                             pop esi
10096898  5b                             pop ebx
10096899  8b4df0                         mov ecx, dword ptr [ebp - 0x10]
1009689c  33cd                           xor ecx, ebp
1009689e  e8b4c00000                     call 0x100a2957
100968a3  8be5                           mov esp, ebp
100968a5  5d                             pop ebp
100968a6  c20400                         ret 4
100968a9  cc                             int3 
100968aa  cc                             int3 
100968ab  cc                             int3 
100968ac  cc                             int3 
100968ad  cc                             int3 
100968ae  cc                             int3 
100968af  cc                             int3 
