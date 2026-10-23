; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100a1100 <= VA < 0x100a13d0 (next decompiler entry; may include padding/thunks)
100a1100  55                             push ebp
100a1101  8bec                           mov ebp, esp
100a1103  83ec18                         sub esp, 0x18
100a1106  53                             push ebx
100a1107  56                             push esi
100a1108  57                             push edi
100a1109  8b3dc8e20a10                   mov edi, dword ptr [0x100ae2c8]
100a110f  8bd9                           mov ebx, ecx
100a1111  6a64                           push 0x64
100a1113  6a03                           push 3
100a1115  ff7328                         push dword ptr [ebx + 0x28]
100a1118  ffd7                           call edi
100a111a  01430c                         add dword ptr [ebx + 0xc], eax
100a111d  6a64                           push 0x64
100a111f  6a05                           push 5
100a1121  ff7328                         push dword ptr [ebx + 0x28]
100a1124  ffd7                           call edi
100a1126  8bc8                           mov ecx, eax
100a1128  8b7324                         mov esi, dword ptr [ebx + 0x24]
100a112b  8b4330                         mov eax, dword ptr [ebx + 0x30]
100a112e  99                             cdq 
100a112f  2bc2                           sub eax, edx
100a1131  8b5308                         mov edx, dword ptr [ebx + 8]
100a1134  d1f8                           sar eax, 1
100a1136  2bd0                           sub edx, eax
100a1138  2bd1                           sub edx, ecx
100a113a  8b4b2c                         mov ecx, dword ptr [ebx + 0x2c]
100a113d  8955fc                         mov dword ptr [ebp - 4], edx
100a1140  8bc1                           mov eax, ecx
100a1142  99                             cdq 
100a1143  2bf1                           sub esi, ecx
100a1145  2bc2                           sub eax, edx
100a1147  8bd0                           mov edx, eax
100a1149  8b430c                         mov eax, dword ptr [ebx + 0xc]
100a114c  2bc1                           sub eax, ecx
100a114e  d1fa                           sar edx, 1
100a1150  034310                         add eax, dword ptr [ebx + 0x10]
100a1153  8945f0                         mov dword ptr [ebp - 0x10], eax
100a1156  8bc1                           mov eax, ecx
100a1158  6a64                           push 0x64
100a115a  2bc2                           sub eax, edx
100a115c  8955ec                         mov dword ptr [ebp - 0x14], edx
100a115f  03430c                         add eax, dword ptr [ebx + 0xc]
100a1162  6a1e                           push 0x1e
100a1164  ff7328                         push dword ptr [ebx + 0x28]
100a1167  8945f8                         mov dword ptr [ebp - 8], eax
100a116a  ffd7                           call edi
100a116c  8b0b                           mov ecx, dword ptr [ebx]
100a116e  99                             cdq 
100a116f  2bc2                           sub eax, edx
100a1171  8d9158080000                   lea edx, [ecx + 0x858]
100a1177  d1f8                           sar eax, 1
100a1179  8945e8                         mov dword ptr [ebp - 0x18], eax
100a117c  8b430c                         mov eax, dword ptr [ebx + 0xc]
100a117f  2bc6                           sub eax, esi
100a1181  837a1408                       cmp dword ptr [edx + 0x14], 8
100a1185  8945f4                         mov dword ptr [ebp - 0xc], eax
100a1188  7202                           jb 0x100a118c
100a118a  8b12                           mov edx, dword ptr [edx]
100a118c  52                             push edx
100a118d  ff7318                         push dword ptr [ebx + 0x18]
100a1190  e8cb33feff                     call 0x10084560
100a1195  8b0b                           mov ecx, dword ptr [ebx]
100a1197  8b4304                         mov eax, dword ptr [ebx + 4]
100a119a  8bb148080000                   mov esi, dword ptr [ecx + 0x848]
100a11a0  83f802                         cmp eax, 2
100a11a3  7412                           je 0x100a11b7
100a11a5  83f805                         cmp eax, 5
100a11a8  740d                           je 0x100a11b7
100a11aa  8b7b10                         mov edi, dword ptr [ebx + 0x10]
100a11ad  8bd7                           mov edx, edi
100a11af  2b532c                         sub edx, dword ptr [ebx + 0x2c]
100a11b2  0355ec                         add edx, dword ptr [ebp - 0x14]
100a11b5  eb0c                           jmp 0x100a11c3
100a11b7  8b55ec                         mov edx, dword ptr [ebp - 0x14]
100a11ba  8b7b10                         mov edi, dword ptr [ebx + 0x10]
100a11bd  2b532c                         sub edx, dword ptr [ebx + 0x2c]
100a11c0  8d1457                         lea edx, [edi + edx*2]
100a11c3  85c0                           test eax, eax
100a11c5  0f8490010000                   je 0x100a135b
100a11cb  83f803                         cmp eax, 3
100a11ce  0f8487010000                   je 0x100a135b
100a11d4  83f801                         cmp eax, 1
100a11d7  0f8414010000                   je 0x100a12f1
100a11dd  83f804                         cmp eax, 4
100a11e0  0f840b010000                   je 0x100a12f1
100a11e6  83f802                         cmp eax, 2
100a11e9  0f84a0000000                   je 0x100a128f
100a11ef  83f805                         cmp eax, 5
100a11f2  0f8497000000                   je 0x100a128f
100a11f8  83f806                         cmp eax, 6
100a11fb  0f85bd010000                   jne 0x100a13be
100a1201  8b75fc                         mov esi, dword ptr [ebp - 4]
100a1204  8bc6                           mov eax, esi
100a1206  2b45e8                         sub eax, dword ptr [ebp - 0x18]
100a1209  0375e8                         add esi, dword ptr [ebp - 0x18]
100a120c  8945ec                         mov dword ptr [ebp - 0x14], eax
100a120f  8975e8                         mov dword ptr [ebp - 0x18], esi
100a1212  3b7b14                         cmp edi, dword ptr [ebx + 0x14]
100a1215  7d28                           jge 0x100a123f
100a1217  0fb7431c                       movzx eax, word ptr [ebx + 0x1c]
100a121b  50                             push eax
100a121c  56                             push esi
100a121d  ff75f4                         push dword ptr [ebp - 0xc]
100a1220  e80b37feff                     call 0x10084930
100a1225  0fb7431e                       movzx eax, word ptr [ebx + 0x1e]
100a1229  8b75ec                         mov esi, dword ptr [ebp - 0x14]
100a122c  8b0b                           mov ecx, dword ptr [ebx]
100a122e  50                             push eax
100a122f  56                             push esi
100a1230  ff730c                         push dword ptr [ebx + 0xc]
100a1233  e8f836feff                     call 0x10084930
100a1238  5f                             pop edi
100a1239  5e                             pop esi
100a123a  5b                             pop ebx
100a123b  8be5                           mov esp, ebp
100a123d  5d                             pop ebp
100a123e  c3                             ret 
100a123f  52                             push edx
100a1240  ffb148080000                   push dword ptr [ecx + 0x848]
100a1246  e88532feff                     call 0x100844d0
100a124b  0fb74320                       movzx eax, word ptr [ebx + 0x20]
100a124f  8b0b                           mov ecx, dword ptr [ebx]
100a1251  50                             push eax
100a1252  56                             push esi
100a1253  ff75f8                         push dword ptr [ebp - 8]
100a1256  e8d536feff                     call 0x10084930
100a125b  0fb74320                       movzx eax, word ptr [ebx + 0x20]
100a125f  8b75ec                         mov esi, dword ptr [ebp - 0x14]
100a1262  8b0b                           mov ecx, dword ptr [ebx]
100a1264  50                             push eax
100a1265  56                             push esi
100a1266  ff730c                         push dword ptr [ebx + 0xc]
100a1269  e8c236feff                     call 0x10084930
100a126e  ff7318                         push dword ptr [ebx + 0x18]
100a1271  8b0b                           mov ecx, dword ptr [ebx]
100a1273  e86833feff                     call 0x100845e0
100a1278  0fb7431c                       movzx eax, word ptr [ebx + 0x1c]
100a127c  8b0b                           mov ecx, dword ptr [ebx]
100a127e  50                             push eax
100a127f  ff75e8                         push dword ptr [ebp - 0x18]
100a1282  ff75f4                         push dword ptr [ebp - 0xc]
100a1285  e8a636feff                     call 0x10084930
100a128a  e91f010000                     jmp 0x100a13ae
100a128f  3b7b14                         cmp edi, dword ptr [ebx + 0x14]
100a1292  7d24                           jge 0x100a12b8
100a1294  0fb7431c                       movzx eax, word ptr [ebx + 0x1c]
100a1298  8b75fc                         mov esi, dword ptr [ebp - 4]
100a129b  50                             push eax
100a129c  56                             push esi
100a129d  ff75f4                         push dword ptr [ebp - 0xc]
100a12a0  e88b36feff                     call 0x10084930
100a12a5  8b432c                         mov eax, dword ptr [ebx + 0x2c]
100a12a8  99                             cdq 
100a12a9  2bc2                           sub eax, edx
100a12ab  d1f8                           sar eax, 1
100a12ad  03430c                         add eax, dword ptr [ebx + 0xc]
100a12b0  8945f0                         mov dword ptr [ebp - 0x10], eax
100a12b3  e9f6000000                     jmp 0x100a13ae
100a12b8  52                             push edx
100a12b9  56                             push esi
100a12ba  e81132feff                     call 0x100844d0
100a12bf  0fb74320                       movzx eax, word ptr [ebx + 0x20]
100a12c3  8b75fc                         mov esi, dword ptr [ebp - 4]
100a12c6  8b0b                           mov ecx, dword ptr [ebx]
100a12c8  50                             push eax
100a12c9  56                             push esi
100a12ca  ff75f8                         push dword ptr [ebp - 8]
100a12cd  e85e36feff                     call 0x10084930
100a12d2  ff7318                         push dword ptr [ebx + 0x18]
100a12d5  8b0b                           mov ecx, dword ptr [ebx]
100a12d7  e80433feff                     call 0x100845e0
100a12dc  0fb7431c                       movzx eax, word ptr [ebx + 0x1c]
100a12e0  8b0b                           mov ecx, dword ptr [ebx]
100a12e2  50                             push eax
100a12e3  56                             push esi
100a12e4  ff75f4                         push dword ptr [ebp - 0xc]
100a12e7  e84436feff                     call 0x10084930
100a12ec  e9bd000000                     jmp 0x100a13ae
100a12f1  3b7b14                         cmp edi, dword ptr [ebx + 0x14]
100a12f4  7d18                           jge 0x100a130e
100a12f6  0fb7431c                       movzx eax, word ptr [ebx + 0x1c]
100a12fa  8b75fc                         mov esi, dword ptr [ebp - 4]
100a12fd  50                             push eax
100a12fe  56                             push esi
100a12ff  ff75f4                         push dword ptr [ebp - 0xc]
100a1302  e82936feff                     call 0x10084930
100a1307  5f                             pop edi
100a1308  5e                             pop esi
100a1309  5b                             pop ebx
100a130a  8be5                           mov esp, ebp
100a130c  5d                             pop ebp
100a130d  c3                             ret 
100a130e  52                             push edx
100a130f  56                             push esi
100a1310  e8bb31feff                     call 0x100844d0
100a1315  0fb74320                       movzx eax, word ptr [ebx + 0x20]
100a1319  8b75fc                         mov esi, dword ptr [ebp - 4]
100a131c  8b0b                           mov ecx, dword ptr [ebx]
100a131e  50                             push eax
100a131f  56                             push esi
100a1320  ff75f8                         push dword ptr [ebp - 8]
100a1323  e80836feff                     call 0x10084930
100a1328  8b0b                           mov ecx, dword ptr [ebx]
100a132a  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
100a1331  8d8158080000                   lea eax, [ecx + 0x858]
100a1337  7202                           jb 0x100a133b
100a1339  8b00                           mov eax, dword ptr [eax]
100a133b  50                             push eax
100a133c  ff7318                         push dword ptr [ebx + 0x18]
100a133f  e81c32feff                     call 0x10084560
100a1344  0fb7431c                       movzx eax, word ptr [ebx + 0x1c]
100a1348  8b0b                           mov ecx, dword ptr [ebx]
100a134a  50                             push eax
100a134b  56                             push esi
100a134c  ff75f4                         push dword ptr [ebp - 0xc]
100a134f  e8dc35feff                     call 0x10084930
100a1354  5f                             pop edi
100a1355  5e                             pop esi
100a1356  5b                             pop ebx
100a1357  8be5                           mov esp, ebp
100a1359  5d                             pop ebp
100a135a  c3                             ret 
100a135b  3b7b14                         cmp edi, dword ptr [ebx + 0x14]
100a135e  7d18                           jge 0x100a1378
100a1360  0fb7431e                       movzx eax, word ptr [ebx + 0x1e]
100a1364  8b75fc                         mov esi, dword ptr [ebp - 4]
100a1367  50                             push eax
100a1368  56                             push esi
100a1369  ff730c                         push dword ptr [ebx + 0xc]
100a136c  e8bf35feff                     call 0x10084930
100a1371  5f                             pop edi
100a1372  5e                             pop esi
100a1373  5b                             pop ebx
100a1374  8be5                           mov esp, ebp
100a1376  5d                             pop ebp
100a1377  c3                             ret 
100a1378  52                             push edx
100a1379  56                             push esi
100a137a  e85131feff                     call 0x100844d0
100a137f  0fb74320                       movzx eax, word ptr [ebx + 0x20]
100a1383  8b75fc                         mov esi, dword ptr [ebp - 4]
100a1386  8b0b                           mov ecx, dword ptr [ebx]
100a1388  50                             push eax
100a1389  56                             push esi
100a138a  ff730c                         push dword ptr [ebx + 0xc]
100a138d  e89e35feff                     call 0x10084930
100a1392  8b0b                           mov ecx, dword ptr [ebx]
100a1394  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
100a139b  8d8158080000                   lea eax, [ecx + 0x858]
100a13a1  7202                           jb 0x100a13a5
100a13a3  8b00                           mov eax, dword ptr [eax]
100a13a5  50                             push eax
100a13a6  ff7318                         push dword ptr [ebx + 0x18]
100a13a9  e8b231feff                     call 0x10084560
100a13ae  0fb7431e                       movzx eax, word ptr [ebx + 0x1e]
100a13b2  8b0b                           mov ecx, dword ptr [ebx]
100a13b4  50                             push eax
100a13b5  56                             push esi
100a13b6  ff75f0                         push dword ptr [ebp - 0x10]
100a13b9  e87235feff                     call 0x10084930
100a13be  5f                             pop edi
100a13bf  5e                             pop esi
100a13c0  5b                             pop ebx
100a13c1  8be5                           mov esp, ebp
100a13c3  5d                             pop ebp
100a13c4  c3                             ret 
100a13c5  cc                             int3 
100a13c6  cc                             int3 
100a13c7  cc                             int3 
100a13c8  cc                             int3 
100a13c9  cc                             int3 
100a13ca  cc                             int3 
100a13cb  cc                             int3 
100a13cc  cc                             int3 
100a13cd  cc                             int3 
100a13ce  cc                             int3 
100a13cf  cc                             int3 
