; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x10005610 <= VA < 0x10005660 (next decompiler entry; may include padding/thunks)
10005610  55                             push ebp
10005611  8bec                           mov ebp, esp
10005613  8b4d0c                         mov ecx, dword ptr [ebp + 0xc]
10005616  8b4510                         mov eax, dword ptr [ebp + 0x10]
10005619  c70100000000                   mov dword ptr [ecx], 0
1000561f  c7410400000000                 mov dword ptr [ecx + 4], 0
10005626  85c0                           test eax, eax
10005628  742d                           je 0x10005657
1000562a  83787400                       cmp dword ptr [eax + 0x74], 0
1000562e  7417                           je 0x10005647
10005630  83787800                       cmp dword ptr [eax + 0x78], 0
10005634  7411                           je 0x10005647
10005636  8b5074                         mov edx, dword ptr [eax + 0x74]
10005639  8b4078                         mov eax, dword ptr [eax + 0x78]
1000563c  894104                         mov dword ptr [ecx + 4], eax
1000563f  8bc1                           mov eax, ecx
10005641  8911                           mov dword ptr [ecx], edx
10005643  5d                             pop ebp
10005644  c20c00                         ret 0xc
10005647  8b4010                         mov eax, dword ptr [eax + 0x10]
1000564a  8b9048080000                   mov edx, dword ptr [eax + 0x848]
10005650  8bc2                           mov eax, edx
10005652  8911                           mov dword ptr [ecx], edx
10005654  894104                         mov dword ptr [ecx + 4], eax
10005657  8bc1                           mov eax, ecx
10005659  5d                             pop ebp
1000565a  c20c00                         ret 0xc
1000565d  cc                             int3 
1000565e  cc                             int3 
1000565f  cc                             int3 
