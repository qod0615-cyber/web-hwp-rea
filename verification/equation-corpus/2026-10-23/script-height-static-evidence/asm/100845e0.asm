; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100845e0 <= VA < 0x10084610 (next decompiler entry; may include padding/thunks)
100845e0  55                             push ebp
100845e1  8bec                           mov ebp, esp
100845e3  83b96c08000008                 cmp dword ptr [ecx + 0x86c], 8
100845ea  8d8158080000                   lea eax, [ecx + 0x858]
100845f0  7202                           jb 0x100845f4
100845f2  8b00                           mov eax, dword ptr [eax]
100845f4  50                             push eax
100845f5  ff7508                         push dword ptr [ebp + 8]
100845f8  e863ffffff                     call 0x10084560
100845fd  5d                             pop ebp
100845fe  c20400                         ret 4
10084601  cc                             int3 
10084602  cc                             int3 
10084603  cc                             int3 
10084604  cc                             int3 
10084605  cc                             int3 
10084606  cc                             int3 
10084607  cc                             int3 
10084608  cc                             int3 
10084609  cc                             int3 
1008460a  cc                             int3 
1008460b  cc                             int3 
1008460c  cc                             int3 
1008460d  cc                             int3 
1008460e  cc                             int3 
1008460f  cc                             int3 
