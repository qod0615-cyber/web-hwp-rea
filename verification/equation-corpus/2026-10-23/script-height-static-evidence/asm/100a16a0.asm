; Binary read only: C:\Users\K\tools\work\HwpPlugin.dll
; SHA256: 101cf47afbb608726d36ad353af6c1ebe826146abd7acff053bc351f03925d20
; Range: 0x100a16a0 <= VA < 0x100a1830 (next decompiler entry; may include padding/thunks)
100a16a0  55                             push ebp
100a16a1  8bec                           mov ebp, esp
100a16a3  8b5514                         mov edx, dword ptr [ebp + 0x14]
100a16a6  83ec0c                         sub esp, 0xc
100a16a9  56                             push esi
100a16aa  8bf1                           mov esi, ecx
100a16ac  8b0e                           mov ecx, dword ptr [esi]
100a16ae  8d8158080000                   lea eax, [ecx + 0x858]
100a16b4  c7460c00000000                 mov dword ptr [esi + 0xc], 0
100a16bb  c7460800000000                 mov dword ptr [esi + 8], 0
100a16c2  895618                         mov dword ptr [esi + 0x18], edx
100a16c5  83781408                       cmp dword ptr [eax + 0x14], 8
100a16c9  7202                           jb 0x100a16cd
100a16cb  8b00                           mov eax, dword ptr [eax]
100a16cd  50                             push eax
100a16ce  52                             push edx
100a16cf  e88c2efeff                     call 0x10084560
100a16d4  8b4510                         mov eax, dword ptr [ebp + 0x10]
100a16d7  85c0                           test eax, eax
100a16d9  7508                           jne 0x100a16e3
100a16db  8b06                           mov eax, dword ptr [esi]
100a16dd  8b8048080000                   mov eax, dword ptr [eax + 0x848]
100a16e3  894610                         mov dword ptr [esi + 0x10], eax
100a16e6  837e0413                       cmp dword ptr [esi + 4], 0x13
100a16ea  0f84b2000000                   je 0x100a17a2
100a16f0  0fb74620                       movzx eax, word ptr [esi + 0x20]
100a16f4  6685c0                         test ax, ax
100a16f7  7417                           je 0x100a1710
100a16f9  8b0e                           mov ecx, dword ptr [esi]
100a16fb  50                             push eax
100a16fc  8d45f8                         lea eax, [ebp - 8]
100a16ff  50                             push eax
100a1700  e8cb3afeff                     call 0x100851d0
100a1705  8b08                           mov ecx, dword ptr [eax]
100a1707  894e2c                         mov dword ptr [esi + 0x2c], ecx
100a170a  8b4004                         mov eax, dword ptr [eax + 4]
100a170d  894630                         mov dword ptr [esi + 0x30], eax
100a1710  0fb74622                       movzx eax, word ptr [esi + 0x22]
100a1714  6685c0                         test ax, ax
100a1717  7417                           je 0x100a1730
100a1719  8b0e                           mov ecx, dword ptr [esi]
100a171b  50                             push eax
100a171c  8d45f8                         lea eax, [ebp - 8]
100a171f  50                             push eax
100a1720  e8ab3afeff                     call 0x100851d0
100a1725  8b08                           mov ecx, dword ptr [eax]
100a1727  894e34                         mov dword ptr [esi + 0x34], ecx
100a172a  8b4004                         mov eax, dword ptr [eax + 4]
100a172d  894638                         mov dword ptr [esi + 0x38], eax
100a1730  0fb74624                       movzx eax, word ptr [esi + 0x24]
100a1734  6685c0                         test ax, ax
100a1737  7417                           je 0x100a1750
100a1739  8b0e                           mov ecx, dword ptr [esi]
100a173b  50                             push eax
100a173c  8d45f8                         lea eax, [ebp - 8]
100a173f  50                             push eax
100a1740  e88b3afeff                     call 0x100851d0
100a1745  8b08                           mov ecx, dword ptr [eax]
100a1747  894e3c                         mov dword ptr [esi + 0x3c], ecx
100a174a  8b4004                         mov eax, dword ptr [eax + 4]
100a174d  894640                         mov dword ptr [esi + 0x40], eax
100a1750  0fb74e26                       movzx ecx, word ptr [esi + 0x26]
100a1754  8bc1                           mov eax, ecx
100a1756  6685c9                         test cx, cx
100a1759  741b                           je 0x100a1776
100a175b  51                             push ecx
100a175c  8b0e                           mov ecx, dword ptr [esi]
100a175e  8d45f8                         lea eax, [ebp - 8]
100a1761  50                             push eax
100a1762  e8693afeff                     call 0x100851d0
100a1767  8b08                           mov ecx, dword ptr [eax]
100a1769  894e44                         mov dword ptr [esi + 0x44], ecx
100a176c  8b4004                         mov eax, dword ptr [eax + 4]
100a176f  894648                         mov dword ptr [esi + 0x48], eax
100a1772  0fb74626                       movzx eax, word ptr [esi + 0x26]
100a1776  b929230000                     mov ecx, 0x2329
100a177b  663bc1                         cmp ax, cx
100a177e  740a                           je 0x100a178a
100a1780  b92a230000                     mov ecx, 0x232a
100a1785  663bc1                         cmp ax, cx
100a1788  7538                           jne 0x100a17c2
100a178a  8b4e44                         mov ecx, dword ptr [esi + 0x44]
100a178d  b856555555                     mov eax, 0x55555556
100a1792  03c9                           add ecx, ecx
100a1794  f7e9                           imul ecx
100a1796  8bc2                           mov eax, edx
100a1798  c1e81f                         shr eax, 0x1f
100a179b  03c2                           add eax, edx
100a179d  894644                         mov dword ptr [esi + 0x44], eax
100a17a0  eb20                           jmp 0x100a17c2
100a17a2  0fb74626                       movzx eax, word ptr [esi + 0x26]
100a17a6  6685c0                         test ax, ax
100a17a9  7417                           je 0x100a17c2
100a17ab  8b0e                           mov ecx, dword ptr [esi]
100a17ad  50                             push eax
100a17ae  8d45f8                         lea eax, [ebp - 8]
100a17b1  50                             push eax
100a17b2  e8a937feff                     call 0x10084f60
100a17b7  8b08                           mov ecx, dword ptr [eax]
100a17b9  894e44                         mov dword ptr [esi + 0x44], ecx
100a17bc  8b4004                         mov eax, dword ptr [eax + 4]
100a17bf  894648                         mov dword ptr [esi + 0x48], eax
100a17c2  8b4604                         mov eax, dword ptr [esi + 4]
100a17c5  48                             dec eax
100a17c6  83f80a                         cmp eax, 0xa
100a17c9  7731                           ja 0x100a17fc
100a17cb  0fb68018180a10                 movzx eax, byte ptr [eax + 0x100a1818]
100a17d2  ff24850c180a10                 jmp dword ptr [eax*4 + 0x100a180c]
100a17d9  8b4648                         mov eax, dword ptr [esi + 0x48]
100a17dc  034638                         add eax, dword ptr [esi + 0x38]
100a17df  034630                         add eax, dword ptr [esi + 0x30]
100a17e2  894614                         mov dword ptr [esi + 0x14], eax
100a17e5  5e                             pop esi
100a17e6  8be5                           mov esp, ebp
100a17e8  5d                             pop ebp
100a17e9  c21000                         ret 0x10
100a17ec  8b4638                         mov eax, dword ptr [esi + 0x38]
100a17ef  034630                         add eax, dword ptr [esi + 0x30]
100a17f2  894614                         mov dword ptr [esi + 0x14], eax
100a17f5  5e                             pop esi
100a17f6  8be5                           mov esp, ebp
100a17f8  5d                             pop ebp
100a17f9  c21000                         ret 0x10
100a17fc  8b4648                         mov eax, dword ptr [esi + 0x48]
100a17ff  894614                         mov dword ptr [esi + 0x14], eax
100a1802  5e                             pop esi
100a1803  8be5                           mov esp, ebp
100a1805  5d                             pop ebp
100a1806  c21000                         ret 0x10
100a1809  0f1f00                         nop dword ptr [eax]
100a180c  d917                           fst dword ptr [edi]
100a180e  0a10                           or dl, byte ptr [eax]
100a1810  ec                             in al, dx
100a1811  17                             pop ss
100a1812  0a10                           or dl, byte ptr [eax]
100a1814  fc                             cld 
100a1815  17                             pop ss
100a1816  0a10                           or dl, byte ptr [eax]
100a1818  0000                           add byte ptr [eax], al
100a181a  0102                           add dword ptr [edx], eax
100a181c  0202                           add al, byte ptr [edx]
100a181e  0202                           add al, byte ptr [edx]
100a1820  0000                           add byte ptr [eax], al
100a1822  01cc                           add esp, ecx
100a1824  cc                             int3 
100a1825  cc                             int3 
100a1826  cc                             int3 
100a1827  cc                             int3 
100a1828  cc                             int3 
100a1829  cc                             int3 
100a182a  cc                             int3 
100a182b  cc                             int3 
100a182c  cc                             int3 
100a182d  cc                             int3 
100a182e  cc                             int3 
100a182f  cc                             int3 
