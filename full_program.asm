   1              		.file	"custom_op.c"
   2              		.text
   3              	.Ltext0:
   4              		.cfi_sections	.debug_frame
   5              		.file 0 "C:/Users/Dell/Desktop/flex" "custom_op.c"
   6              		.section .rdata,"dr"
   7              	.LC0:
   8 0000 45787065 		.ascii "Expected x-value like x3\0"
   8      63746564 
   8      20782D76 
   8      616C7565 
   8      206C696B 
   9              	.LC1:
  10 0019 45787065 		.ascii "Expected y-value like y4\0"
  10      63746564 
  10      20792D76 
  10      616C7565 
  10      206C696B 
  11              	.LC2:
  12 0032 45787065 		.ascii "Expected 'custom_operation'\0"
  12      63746564 
  12      20276375 
  12      73746F6D 
  12      5F6F7065 
  13 004e 0000     		.align 8
  14              	.LC3:
  15 0050 5573696E 		.ascii "Using custom instruction: x\302\262 + y\302\262 - 2xy\0"
  15      67206375 
  15      73746F6D 
  15      20696E73 
  15      74727563 
  16 007a 00000000 		.align 8
  16      0000
  17              	.LC4:
  18 0080 52657375 		.ascii "Result for x=%.2f, y=%.2f is: %.2f\12\0"
  18      6C742066 
  18      6F722078 
  18      3D252E32 
  18      662C2079 
  19 00a4 00000000 		.text
  19      00000000 
  19      00000000 
  20              		.globl	computeExpression
  22              		.seh_proc	computeExpression
  23              	computeExpression:
  24              	.LFB6:
  25              		.file 1 "custom_op.c"
   1:custom_op.c   **** #include <stdio.h>
   2:custom_op.c   **** #include "custom_op.h"
   3:custom_op.c   **** 
   4:custom_op.c   **** extern int yylex();
   5:custom_op.c   **** 
   6:custom_op.c   **** void computeExpression() {
  26              		.loc 1 6 26
  27              		.cfi_startproc
  28 0000 55       		pushq	%rbp
  29              		.seh_pushreg	%rbp
  30              		.cfi_def_cfa_offset 16
  31              		.cfi_offset 6, -16
  32 0001 4889E5   		movq	%rsp, %rbp
  33              		.seh_setframe	%rbp, 0
  34              		.cfi_def_cfa_register 6
  35 0004 4883EC30 		subq	$48, %rsp
  36              		.seh_stackalloc	48
  37              		.seh_endprologue
   7:custom_op.c   ****     int token;
   8:custom_op.c   **** 
   9:custom_op.c   ****     token = yylex(); // x
  38              		.loc 1 9 13
  39 0008 E8000000 		call	yylex
  39      00
  40 000d 8945FC   		movl	%eax, -4(%rbp)
  10:custom_op.c   ****     if (token != XVAL) {
  41              		.loc 1 10 8
  42 0010 837DFC01 		cmpl	$1, -4(%rbp)
  43 0014 7414     		je	.L2
  11:custom_op.c   ****         printf("Expected x-value like x3\n");
  44              		.loc 1 11 9
  45 0016 488D0500 		leaq	.LC0(%rip), %rax
  45      000000
  46 001d 4889C1   		movq	%rax, %rcx
  47 0020 E8000000 		call	puts
  47      00
  12:custom_op.c   ****         return;
  48              		.loc 1 12 9
  49 0025 E90D0100 		jmp	.L1
  49      00
  50              	.L2:
  13:custom_op.c   ****     }
  14:custom_op.c   **** 
  15:custom_op.c   ****     token = yylex(); // y
  51              		.loc 1 15 13
  52 002a E8000000 		call	yylex
  52      00
  53 002f 8945FC   		movl	%eax, -4(%rbp)
  16:custom_op.c   ****     if (token != YVAL) {
  54              		.loc 1 16 8
  55 0032 837DFC02 		cmpl	$2, -4(%rbp)
  56 0036 7414     		je	.L4
  17:custom_op.c   ****         printf("Expected y-value like y4\n");
  57              		.loc 1 17 9
  58 0038 488D0519 		leaq	.LC1(%rip), %rax
  58      000000
  59 003f 4889C1   		movq	%rax, %rcx
  60 0042 E8000000 		call	puts
  60      00
  18:custom_op.c   ****         return;
  61              		.loc 1 18 9
  62 0047 E9EB0000 		jmp	.L1
  62      00
  63              	.L4:
  19:custom_op.c   ****     }
  20:custom_op.c   **** 
  21:custom_op.c   ****     token = yylex(); // custom_operation
  64              		.loc 1 21 13
  65 004c E8000000 		call	yylex
  65      00
  66 0051 8945FC   		movl	%eax, -4(%rbp)
  22:custom_op.c   ****     if (token != CUSTOM_OP) {
  67              		.loc 1 22 8
  68 0054 837DFC03 		cmpl	$3, -4(%rbp)
  69 0058 7414     		je	.L5
  23:custom_op.c   ****         printf("Expected 'custom_operation'\n");
  70              		.loc 1 23 9
  71 005a 488D0532 		leaq	.LC2(%rip), %rax
  71      000000
  72 0061 4889C1   		movq	%rax, %rcx
  73 0064 E8000000 		call	puts
  73      00
  24:custom_op.c   ****         return;
  74              		.loc 1 24 9
  75 0069 E9C90000 		jmp	.L1
  75      00
  76              	.L5:
  25:custom_op.c   ****     }
  26:custom_op.c   **** 
  27:custom_op.c   ****     // Custom instruction: x² + y² - 2xy
  28:custom_op.c   ****     double result = (xVal * xVal) + (yVal * yVal) - (2 * xVal * yVal);
  77              		.loc 1 28 27
  78 006e 488B0500 		movq	.refptr.xVal(%rip), %rax
  78      000000
  79 0075 F20F1008 		movsd	(%rax), %xmm1
  80 0079 488B0500 		movq	.refptr.xVal(%rip), %rax
  80      000000
  81 0080 F20F1000 		movsd	(%rax), %xmm0
  82 0084 F20F59C8 		mulsd	%xmm0, %xmm1
  83              		.loc 1 28 43
  84 0088 488B0500 		movq	.refptr.yVal(%rip), %rax
  84      000000
  85 008f F20F1010 		movsd	(%rax), %xmm2
  86 0093 488B0500 		movq	.refptr.yVal(%rip), %rax
  86      000000
  87 009a F20F1000 		movsd	(%rax), %xmm0
  88 009e F20F59C2 		mulsd	%xmm2, %xmm0
  89              		.loc 1 28 35
  90 00a2 F20F58C8 		addsd	%xmm0, %xmm1
  91              		.loc 1 28 56
  92 00a6 488B0500 		movq	.refptr.xVal(%rip), %rax
  92      000000
  93 00ad F20F1000 		movsd	(%rax), %xmm0
  94 00b1 660F28D0 		movapd	%xmm0, %xmm2
  95 00b5 F20F58D0 		addsd	%xmm0, %xmm2
  96              		.loc 1 28 63
  97 00b9 488B0500 		movq	.refptr.yVal(%rip), %rax
  97      000000
  98 00c0 F20F1000 		movsd	(%rax), %xmm0
  99 00c4 F20F59D0 		mulsd	%xmm0, %xmm2
 100              		.loc 1 28 12
 101 00c8 F20F5CCA 		subsd	%xmm2, %xmm1
 102 00cc 660F28C1 		movapd	%xmm1, %xmm0
 103 00d0 F20F1145 		movsd	%xmm0, -16(%rbp)
 103      F0
  29:custom_op.c   ****     printf("Using custom instruction: x² + y² - 2xy\n");
 104              		.loc 1 29 5
 105 00d5 488D0550 		leaq	.LC3(%rip), %rax
 105      000000
 106 00dc 4889C1   		movq	%rax, %rcx
 107 00df E8000000 		call	puts
 107      00
  30:custom_op.c   ****     printf("Result for x=%.2f, y=%.2f is: %.2f\n", xVal, yVal, result);
 108              		.loc 1 30 5
 109 00e4 488B0500 		movq	.refptr.yVal(%rip), %rax
 109      000000
 110 00eb F20F1010 		movsd	(%rax), %xmm2
 111 00ef 488B0500 		movq	.refptr.xVal(%rip), %rax
 111      000000
 112 00f6 F20F1008 		movsd	(%rax), %xmm1
 113 00fa F20F1045 		movsd	-16(%rbp), %xmm0
 113      F0
 114 00ff 488B45F0 		movq	-16(%rbp), %rax
 115 0103 660F28DA 		movapd	%xmm2, %xmm3
 116 0107 660F28D3 		movapd	%xmm3, %xmm2
 117 010b 66480F7E 		movq	%xmm3, %rcx
 117      D9
 118 0110 660F28D9 		movapd	%xmm1, %xmm3
 119 0114 660F28CB 		movapd	%xmm3, %xmm1
 120 0118 66480F7E 		movq	%xmm3, %rdx
 120      DA
 121 011d 660F28D8 		movapd	%xmm0, %xmm3
 122 0121 4989C1   		movq	%rax, %r9
 123 0124 4989C8   		movq	%rcx, %r8
 124 0127 488D0580 		leaq	.LC4(%rip), %rax
 124      000000
 125 012e 4889C1   		movq	%rax, %rcx
 126 0131 E8000000 		call	__mingw_printf
 126      00
 127 0136 90       		nop
 128              	.L1:
  31:custom_op.c   **** }
 129              		.loc 1 31 1
 130 0137 4883C430 		addq	$48, %rsp
 131 013b 5D       		popq	%rbp
 132              		.cfi_restore 6
 133              		.cfi_def_cfa 7, 8
 134 013c C3       		ret
 135              		.cfi_endproc
 136              	.LFE6:
 137              		.seh_endproc
 138              	.Letext0:
 139              		.file 2 "custom_op.h"
 140              		.file 3 "C:/msys64/mingw64/include/stdio.h"
 141 013d 909090   		.section	.debug_info,"dr"
 142              	.Ldebug_info0:
 143 0000 9B010000 		.long	0x19b
 144 0004 0500     		.word	0x5
 145 0006 01       		.byte	0x1
 146 0007 08       		.byte	0x8
 147 0008 00000000 		.secrel32	.Ldebug_abbrev0
 148 000c 05       		.uleb128 0x5
 149 000d 474E5520 		.ascii "GNU C17 14.2.0 -mtune=generic -march=nocona -g\0"
 149      43313720 
 149      31342E32 
 149      2E30202D 
 149      6D74756E 
 150 003c 1D       		.byte	0x1d
 151 003d 00000000 		.secrel32	.LASF0
 152 0041 0C000000 		.secrel32	.LASF1
 153 0045 00000000 		.quad	.Ltext0
 153      00000000 
 154 004d 3D010000 		.quad	.Letext0-.Ltext0
 154      00000000 
 155 0055 00000000 		.secrel32	.Ldebug_line0
 156 0059 01       		.uleb128 0x1
 157 005a 01       		.byte	0x1
 158 005b 06       		.byte	0x6
 159 005c 63686172 		.ascii "char\0"
 159      00
 160 0061 06       		.uleb128 0x6
 161 0062 59000000 		.long	0x59
 162 0066 01       		.uleb128 0x1
 163 0067 08       		.byte	0x8
 164 0068 07       		.byte	0x7
 165 0069 6C6F6E67 		.ascii "long long unsigned int\0"
 165      206C6F6E 
 165      6720756E 
 165      7369676E 
 165      65642069 
 166 0080 01       		.uleb128 0x1
 167 0081 08       		.byte	0x8
 168 0082 05       		.byte	0x5
 169 0083 6C6F6E67 		.ascii "long long int\0"
 169      206C6F6E 
 169      6720696E 
 169      7400
 170 0091 01       		.uleb128 0x1
 171 0092 02       		.byte	0x2
 172 0093 07       		.byte	0x7
 173 0094 73686F72 		.ascii "short unsigned int\0"
 173      7420756E 
 173      7369676E 
 173      65642069 
 173      6E7400
 174 00a7 01       		.uleb128 0x1
 175 00a8 04       		.byte	0x4
 176 00a9 05       		.byte	0x5
 177 00aa 696E7400 		.ascii "int\0"
 178 00ae 01       		.uleb128 0x1
 179 00af 04       		.byte	0x4
 180 00b0 05       		.byte	0x5
 181 00b1 6C6F6E67 		.ascii "long int\0"
 181      20696E74 
 181      00
 182 00ba 01       		.uleb128 0x1
 183 00bb 04       		.byte	0x4
 184 00bc 07       		.byte	0x7
 185 00bd 756E7369 		.ascii "unsigned int\0"
 185      676E6564 
 185      20696E74 
 185      00
 186 00ca 01       		.uleb128 0x1
 187 00cb 04       		.byte	0x4
 188 00cc 07       		.byte	0x7
 189 00cd 6C6F6E67 		.ascii "long unsigned int\0"
 189      20756E73 
 189      69676E65 
 189      6420696E 
 189      7400
 190 00df 01       		.uleb128 0x1
 191 00e0 01       		.byte	0x1
 192 00e1 08       		.byte	0x8
 193 00e2 756E7369 		.ascii "unsigned char\0"
 193      676E6564 
 193      20636861 
 193      7200
 194 00f0 02       		.uleb128 0x2
 195 00f1 7856616C 		.ascii "xVal\0"
 195      00
 196 00f6 0F       		.byte	0xf
 197 00f7 FB000000 		.long	0xfb
 198 00fb 01       		.uleb128 0x1
 199 00fc 08       		.byte	0x8
 200 00fd 04       		.byte	0x4
 201 00fe 646F7562 		.ascii "double\0"
 201      6C6500
 202 0105 02       		.uleb128 0x2
 203 0106 7956616C 		.ascii "yVal\0"
 203      00
 204 010b 15       		.byte	0x15
 205 010c FB000000 		.long	0xfb
 206 0110 07       		.uleb128 0x7
 207 0111 7072696E 		.ascii "printf\0"
 207      746600
 208 0118 03       		.byte	0x3
 209 0119 5E01     		.word	0x15e
 210 011b 05       		.byte	0x5
 211 011c 5F5F6D69 		.ascii "__mingw_printf\0"
 211      6E67775F 
 211      7072696E 
 211      746600
 212 012b A7000000 		.long	0xa7
 213 012f 3A010000 		.long	0x13a
 214 0133 08       		.uleb128 0x8
 215 0134 3A010000 		.long	0x13a
 216 0138 03       		.uleb128 0x3
 217 0139 00       		.byte	0
 218 013a 09       		.uleb128 0x9
 219 013b 08       		.byte	0x8
 220 013c 61000000 		.long	0x61
 221 0140 0A       		.uleb128 0xa
 222 0141 79796C65 		.ascii "yylex\0"
 222      7800
 223 0147 01       		.byte	0x1
 224 0148 04       		.byte	0x4
 225 0149 0C       		.byte	0xc
 226 014a A7000000 		.long	0xa7
 227 014e 54010000 		.long	0x154
 228 0152 03       		.uleb128 0x3
 229 0153 00       		.byte	0
 230 0154 0B       		.uleb128 0xb
 231 0155 636F6D70 		.ascii "computeExpression\0"
 231      75746545 
 231      78707265 
 231      7373696F 
 231      6E00
 232 0167 01       		.byte	0x1
 233 0168 06       		.byte	0x6
 234 0169 06       		.byte	0x6
 235 016a 00000000 		.quad	.LFB6
 235      00000000 
 236 0172 3D010000 		.quad	.LFE6-.LFB6
 236      00000000 
 237 017a 01       		.uleb128 0x1
 238 017b 9C       		.byte	0x9c
 239 017c 04       		.uleb128 0x4
 240 017d 746F6B65 		.ascii "token\0"
 240      6E00
 241 0183 07       		.byte	0x7
 242 0184 09       		.byte	0x9
 243 0185 A7000000 		.long	0xa7
 244 0189 02       		.uleb128 0x2
 245 018a 91       		.byte	0x91
 246 018b 6C       		.sleb128 -20
 247 018c 04       		.uleb128 0x4
 248 018d 72657375 		.ascii "result\0"
 248      6C7400
 249 0194 1C       		.byte	0x1c
 250 0195 0C       		.byte	0xc
 251 0196 FB000000 		.long	0xfb
 252 019a 02       		.uleb128 0x2
 253 019b 91       		.byte	0x91
 254 019c 60       		.sleb128 -32
 255 019d 00       		.byte	0
 256 019e 00       		.byte	0
 257              		.section	.debug_abbrev,"dr"
 258              	.Ldebug_abbrev0:
 259 0000 01       		.uleb128 0x1
 260 0001 24       		.uleb128 0x24
 261 0002 00       		.byte	0
 262 0003 0B       		.uleb128 0xb
 263 0004 0B       		.uleb128 0xb
 264 0005 3E       		.uleb128 0x3e
 265 0006 0B       		.uleb128 0xb
 266 0007 03       		.uleb128 0x3
 267 0008 08       		.uleb128 0x8
 268 0009 00       		.byte	0
 269 000a 00       		.byte	0
 270 000b 02       		.uleb128 0x2
 271 000c 34       		.uleb128 0x34
 272 000d 00       		.byte	0
 273 000e 03       		.uleb128 0x3
 274 000f 08       		.uleb128 0x8
 275 0010 3A       		.uleb128 0x3a
 276 0011 21       		.uleb128 0x21
 277 0012 02       		.sleb128 2
 278 0013 3B       		.uleb128 0x3b
 279 0014 21       		.uleb128 0x21
 280 0015 08       		.sleb128 8
 281 0016 39       		.uleb128 0x39
 282 0017 0B       		.uleb128 0xb
 283 0018 49       		.uleb128 0x49
 284 0019 13       		.uleb128 0x13
 285 001a 3F       		.uleb128 0x3f
 286 001b 19       		.uleb128 0x19
 287 001c 3C       		.uleb128 0x3c
 288 001d 19       		.uleb128 0x19
 289 001e 00       		.byte	0
 290 001f 00       		.byte	0
 291 0020 03       		.uleb128 0x3
 292 0021 18       		.uleb128 0x18
 293 0022 00       		.byte	0
 294 0023 00       		.byte	0
 295 0024 00       		.byte	0
 296 0025 04       		.uleb128 0x4
 297 0026 34       		.uleb128 0x34
 298 0027 00       		.byte	0
 299 0028 03       		.uleb128 0x3
 300 0029 08       		.uleb128 0x8
 301 002a 3A       		.uleb128 0x3a
 302 002b 21       		.uleb128 0x21
 303 002c 01       		.sleb128 1
 304 002d 3B       		.uleb128 0x3b
 305 002e 0B       		.uleb128 0xb
 306 002f 39       		.uleb128 0x39
 307 0030 0B       		.uleb128 0xb
 308 0031 49       		.uleb128 0x49
 309 0032 13       		.uleb128 0x13
 310 0033 02       		.uleb128 0x2
 311 0034 18       		.uleb128 0x18
 312 0035 00       		.byte	0
 313 0036 00       		.byte	0
 314 0037 05       		.uleb128 0x5
 315 0038 11       		.uleb128 0x11
 316 0039 01       		.byte	0x1
 317 003a 25       		.uleb128 0x25
 318 003b 08       		.uleb128 0x8
 319 003c 13       		.uleb128 0x13
 320 003d 0B       		.uleb128 0xb
 321 003e 03       		.uleb128 0x3
 322 003f 1F       		.uleb128 0x1f
 323 0040 1B       		.uleb128 0x1b
 324 0041 1F       		.uleb128 0x1f
 325 0042 11       		.uleb128 0x11
 326 0043 01       		.uleb128 0x1
 327 0044 12       		.uleb128 0x12
 328 0045 07       		.uleb128 0x7
 329 0046 10       		.uleb128 0x10
 330 0047 17       		.uleb128 0x17
 331 0048 00       		.byte	0
 332 0049 00       		.byte	0
 333 004a 06       		.uleb128 0x6
 334 004b 26       		.uleb128 0x26
 335 004c 00       		.byte	0
 336 004d 49       		.uleb128 0x49
 337 004e 13       		.uleb128 0x13
 338 004f 00       		.byte	0
 339 0050 00       		.byte	0
 340 0051 07       		.uleb128 0x7
 341 0052 2E       		.uleb128 0x2e
 342 0053 01       		.byte	0x1
 343 0054 3F       		.uleb128 0x3f
 344 0055 19       		.uleb128 0x19
 345 0056 03       		.uleb128 0x3
 346 0057 08       		.uleb128 0x8
 347 0058 3A       		.uleb128 0x3a
 348 0059 0B       		.uleb128 0xb
 349 005a 3B       		.uleb128 0x3b
 350 005b 05       		.uleb128 0x5
 351 005c 39       		.uleb128 0x39
 352 005d 0B       		.uleb128 0xb
 353 005e 6E       		.uleb128 0x6e
 354 005f 08       		.uleb128 0x8
 355 0060 27       		.uleb128 0x27
 356 0061 19       		.uleb128 0x19
 357 0062 49       		.uleb128 0x49
 358 0063 13       		.uleb128 0x13
 359 0064 3C       		.uleb128 0x3c
 360 0065 19       		.uleb128 0x19
 361 0066 01       		.uleb128 0x1
 362 0067 13       		.uleb128 0x13
 363 0068 00       		.byte	0
 364 0069 00       		.byte	0
 365 006a 08       		.uleb128 0x8
 366 006b 05       		.uleb128 0x5
 367 006c 00       		.byte	0
 368 006d 49       		.uleb128 0x49
 369 006e 13       		.uleb128 0x13
 370 006f 00       		.byte	0
 371 0070 00       		.byte	0
 372 0071 09       		.uleb128 0x9
 373 0072 0F       		.uleb128 0xf
 374 0073 00       		.byte	0
 375 0074 0B       		.uleb128 0xb
 376 0075 0B       		.uleb128 0xb
 377 0076 49       		.uleb128 0x49
 378 0077 13       		.uleb128 0x13
 379 0078 00       		.byte	0
 380 0079 00       		.byte	0
 381 007a 0A       		.uleb128 0xa
 382 007b 2E       		.uleb128 0x2e
 383 007c 01       		.byte	0x1
 384 007d 3F       		.uleb128 0x3f
 385 007e 19       		.uleb128 0x19
 386 007f 03       		.uleb128 0x3
 387 0080 08       		.uleb128 0x8
 388 0081 3A       		.uleb128 0x3a
 389 0082 0B       		.uleb128 0xb
 390 0083 3B       		.uleb128 0x3b
 391 0084 0B       		.uleb128 0xb
 392 0085 39       		.uleb128 0x39
 393 0086 0B       		.uleb128 0xb
 394 0087 49       		.uleb128 0x49
 395 0088 13       		.uleb128 0x13
 396 0089 3C       		.uleb128 0x3c
 397 008a 19       		.uleb128 0x19
 398 008b 01       		.uleb128 0x1
 399 008c 13       		.uleb128 0x13
 400 008d 00       		.byte	0
 401 008e 00       		.byte	0
 402 008f 0B       		.uleb128 0xb
 403 0090 2E       		.uleb128 0x2e
 404 0091 01       		.byte	0x1
 405 0092 3F       		.uleb128 0x3f
 406 0093 19       		.uleb128 0x19
 407 0094 03       		.uleb128 0x3
 408 0095 08       		.uleb128 0x8
 409 0096 3A       		.uleb128 0x3a
 410 0097 0B       		.uleb128 0xb
 411 0098 3B       		.uleb128 0x3b
 412 0099 0B       		.uleb128 0xb
 413 009a 39       		.uleb128 0x39
 414 009b 0B       		.uleb128 0xb
 415 009c 11       		.uleb128 0x11
 416 009d 01       		.uleb128 0x1
 417 009e 12       		.uleb128 0x12
 418 009f 07       		.uleb128 0x7
 419 00a0 40       		.uleb128 0x40
 420 00a1 18       		.uleb128 0x18
 421 00a2 7C       		.uleb128 0x7c
 422 00a3 19       		.uleb128 0x19
 423 00a4 00       		.byte	0
 424 00a5 00       		.byte	0
 425 00a6 00       		.byte	0
 426              		.section	.debug_aranges,"dr"
 427 0000 2C000000 		.long	0x2c
 428 0004 0200     		.word	0x2
 429 0006 00000000 		.secrel32	.Ldebug_info0
 430 000a 08       		.byte	0x8
 431 000b 00       		.byte	0
 432 000c 0000     		.word	0
 433 000e 0000     		.word	0
 434 0010 00000000 		.quad	.Ltext0
 434      00000000 
 435 0018 3D010000 		.quad	.Letext0-.Ltext0
 435      00000000 
 436 0020 00000000 		.quad	0
 436      00000000 
 437 0028 00000000 		.quad	0
 437      00000000 
 438              		.section	.debug_line,"dr"
 439              	.Ldebug_line0:
 440 0000 8F000000 		.section	.debug_str,"dr"
 440      05000800 
 440      38000000 
 440      010101FB 
 440      0E0D0001 
 441              		.section	.debug_line_str,"dr"
 442              	.LASF0:
 443 0000 63757374 		.ascii "custom_op.c\0"
 443      6F6D5F6F 
 443      702E6300 
 444              	.LASF1:
 445 000c 433A5C55 		.ascii "C:\\Users\\Dell\\Desktop\\flex\0"
 445      73657273 
 445      5C44656C 
 445      6C5C4465 
 445      736B746F 
 446              		.ident	"GCC: (Rev3, Built by MSYS2 project) 14.2.0"
 449 0027 433A2F55 		.section	.rdata$.refptr.yVal, "dr"
 449      73657273 
 449      2F44656C 
 449      6C2F4465 
 449      736B746F 
 450              		.globl	.refptr.yVal
 451              		.linkonce	discard
 452              	.refptr.yVal:
 453 0000 00000000 		.quad	yVal
 453      00000000 
 454 0008 00000000 		.section	.rdata$.refptr.xVal, "dr"
 454      00000000 
 455              		.globl	.refptr.xVal
 456              		.linkonce	discard
 457              	.refptr.xVal:
 458 0000 00000000 		.quad	xVal
 458      00000000 
 458      00000000 
 458      00000000 
   1              		.file	"lex.yy.c"
   2              		.text
   3              	.Ltext0:
   4              		.cfi_sections	.debug_frame
   5              		.file 0 "C:/Users/Dell/Desktop/flex" "lex.yy.c"
   6              	.lcomm yy_buffer_stack_top,8,8
   7              	.lcomm yy_buffer_stack_max,8,8
   8              	.lcomm yy_buffer_stack,8,8
   9              	.lcomm yy_hold_char,1,1
  10              	.lcomm yy_n_chars,4,4
  11              		.globl	yyleng
  12              		.bss
  13              		.align 4
  14              	yyleng:
  15 0000 00000000 		.space 4
  16              	.lcomm yy_c_buf_p,8,8
  17              	.lcomm yy_init,4,4
  18              	.lcomm yy_start,4,4
  19              	.lcomm yy_did_buffer_switch_on_eof,4,4
  20              		.globl	yyin
  21 0004 00000000 		.align 8
  22              	yyin:
  23 0008 00000000 		.space 8
  23      00000000 
  24              		.globl	yyout
  25              		.align 8
  26              	yyout:
  27 0010 00000000 		.space 8
  27      00000000 
  28              		.globl	yylineno
  29              		.data
  30              		.align 4
  31              	yylineno:
  32 0000 01000000 		.long	1
  33 0004 00000000 		.section .rdata,"dr"
  33      00000000 
  33      00000000 
  34              		.align 32
  35              	yy_accept:
  36 0000 0000     		.word	0
  37 0002 0000     		.word	0
  38 0004 0000     		.word	0
  39 0006 0700     		.word	7
  40 0008 0500     		.word	5
  41 000a 0400     		.word	4
  42 000c 0400     		.word	4
  43 000e 0500     		.word	5
  44 0010 0500     		.word	5
  45 0012 0500     		.word	5
  46 0014 0000     		.word	0
  47 0016 0100     		.word	1
  48 0018 0200     		.word	2
  49 001a 0000     		.word	0
  50 001c 0000     		.word	0
  51 001e 0000     		.word	0
  52 0020 0000     		.word	0
  53 0022 0000     		.word	0
  54 0024 0000     		.word	0
  55 0026 0000     		.word	0
  56 0028 0000     		.word	0
  57 002a 0000     		.word	0
  58 002c 0000     		.word	0
  59 002e 0000     		.word	0
  60 0030 0000     		.word	0
  61 0032 0000     		.word	0
  62 0034 0300     		.word	3
  63 0036 0000     		.word	0
  64 0038 00000000 		.align 32
  64      00000000 
  65              	yy_ec:
  66 0040 00010101 		.ascii "\0\1\1\1\1\1\1\1\1\2\3\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\2\1\1\1\1\1\1\1\1\1\1\1\1
  66      01010101 
  66      01020301 
  66      01010101 
  66      01010101 
  67              		.align 16
  68              	yy_meta:
  69 0140 00010101 		.ascii "\0\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1\1"
  69      01010101 
  69      01010101 
  69      01010101 
  69      01010101 
  70 0154 00000000 		.align 32
  70      00000000 
  70      00000000 
  71              	yy_base:
  72 0160 0000     		.word	0
  73 0162 0000     		.word	0
  74 0164 1200     		.word	18
  75 0166 2700     		.word	39
  76 0168 2800     		.word	40
  77 016a 2800     		.word	40
  78 016c 2800     		.word	40
  79 016e 1500     		.word	21
  80 0170 1F00     		.word	31
  81 0172 1E00     		.word	30
  82 0174 1200     		.word	18
  83 0176 1C00     		.word	28
  84 0178 1B00     		.word	27
  85 017a 0E00     		.word	14
  86 017c 1100     		.word	17
  87 017e 1200     		.word	18
  88 0180 1600     		.word	22
  89 0182 0E00     		.word	14
  90 0184 0B00     		.word	11
  91 0186 0F00     		.word	15
  92 0188 0800     		.word	8
  93 018a 0B00     		.word	11
  94 018c 0000     		.word	0
  95 018e 0400     		.word	4
  96 0190 0000     		.word	0
  97 0192 0000     		.word	0
  98 0194 2800     		.word	40
  99 0196 2800     		.word	40
 100 0198 0000     		.word	0
 101 019a 00000000 		.align 32
 101      0000
 102              	yy_def:
 103 01a0 0000     		.word	0
 104 01a2 1C00     		.word	28
 105 01a4 1C00     		.word	28
 106 01a6 1B00     		.word	27
 107 01a8 1B00     		.word	27
 108 01aa 1B00     		.word	27
 109 01ac 1B00     		.word	27
 110 01ae 1B00     		.word	27
 111 01b0 1B00     		.word	27
 112 01b2 1B00     		.word	27
 113 01b4 1B00     		.word	27
 114 01b6 1B00     		.word	27
 115 01b8 1B00     		.word	27
 116 01ba 1B00     		.word	27
 117 01bc 1B00     		.word	27
 118 01be 1B00     		.word	27
 119 01c0 1B00     		.word	27
 120 01c2 1B00     		.word	27
 121 01c4 1B00     		.word	27
 122 01c6 1B00     		.word	27
 123 01c8 1B00     		.word	27
 124 01ca 1B00     		.word	27
 125 01cc 1B00     		.word	27
 126 01ce 1B00     		.word	27
 127 01d0 1B00     		.word	27
 128 01d2 1B00     		.word	27
 129 01d4 1B00     		.word	27
 130 01d6 0000     		.word	0
 131 01d8 1B00     		.word	27
 132 01da 00000000 		.align 32
 132      0000
 133              	yy_nxt:
 134 01e0 0000     		.word	0
 135 01e2 0400     		.word	4
 136 01e4 0500     		.word	5
 137 01e6 0600     		.word	6
 138 01e8 1B00     		.word	27
 139 01ea 1B00     		.word	27
 140 01ec 1B00     		.word	27
 141 01ee 0700     		.word	7
 142 01f0 1B00     		.word	27
 143 01f2 1B00     		.word	27
 144 01f4 1B00     		.word	27
 145 01f6 1A00     		.word	26
 146 01f8 1900     		.word	25
 147 01fa 1800     		.word	24
 148 01fc 1B00     		.word	27
 149 01fe 1B00     		.word	27
 150 0200 1700     		.word	23
 151 0202 1600     		.word	22
 152 0204 0800     		.word	8
 153 0206 0900     		.word	9
 154 0208 0500     		.word	5
 155 020a 0600     		.word	6
 156 020c 1500     		.word	21
 157 020e 1400     		.word	20
 158 0210 1300     		.word	19
 159 0212 0700     		.word	7
 160 0214 1200     		.word	18
 161 0216 1100     		.word	17
 162 0218 1000     		.word	16
 163 021a 0F00     		.word	15
 164 021c 0E00     		.word	14
 165 021e 0C00     		.word	12
 166 0220 0B00     		.word	11
 167 0222 0D00     		.word	13
 168 0224 0C00     		.word	12
 169 0226 0B00     		.word	11
 170 0228 0800     		.word	8
 171 022a 0900     		.word	9
 172 022c 0A00     		.word	10
 173 022e 1B00     		.word	27
 174 0230 0300     		.word	3
 175 0232 1B00     		.word	27
 176 0234 1B00     		.word	27
 177 0236 1B00     		.word	27
 178 0238 1B00     		.word	27
 179 023a 1B00     		.word	27
 180 023c 1B00     		.word	27
 181 023e 1B00     		.word	27
 182 0240 1B00     		.word	27
 183 0242 1B00     		.word	27
 184 0244 1B00     		.word	27
 185 0246 1B00     		.word	27
 186 0248 1B00     		.word	27
 187 024a 1B00     		.word	27
 188 024c 1B00     		.word	27
 189 024e 1B00     		.word	27
 190 0250 1B00     		.word	27
 191 0252 1B00     		.word	27
 192 0254 1B00     		.word	27
 193 0256 1B00     		.word	27
 194 0258 00000000 		.align 32
 194      00000000 
 195              	yy_chk:
 196 0260 0000     		.word	0
 197 0262 1C00     		.word	28
 198 0264 0100     		.word	1
 199 0266 0100     		.word	1
 200 0268 0000     		.word	0
 201 026a 0000     		.word	0
 202 026c 0000     		.word	0
 203 026e 0100     		.word	1
 204 0270 0000     		.word	0
 205 0272 0000     		.word	0
 206 0274 0000     		.word	0
 207 0276 1900     		.word	25
 208 0278 1800     		.word	24
 209 027a 1700     		.word	23
 210 027c 0000     		.word	0
 211 027e 0000     		.word	0
 212 0280 1600     		.word	22
 213 0282 1500     		.word	21
 214 0284 0100     		.word	1
 215 0286 0100     		.word	1
 216 0288 0200     		.word	2
 217 028a 0200     		.word	2
 218 028c 1400     		.word	20
 219 028e 1300     		.word	19
 220 0290 1200     		.word	18
 221 0292 0200     		.word	2
 222 0294 1100     		.word	17
 223 0296 1000     		.word	16
 224 0298 0F00     		.word	15
 225 029a 0E00     		.word	14
 226 029c 0D00     		.word	13
 227 029e 0C00     		.word	12
 228 02a0 0B00     		.word	11
 229 02a2 0A00     		.word	10
 230 02a4 0900     		.word	9
 231 02a6 0800     		.word	8
 232 02a8 0200     		.word	2
 233 02aa 0200     		.word	2
 234 02ac 0700     		.word	7
 235 02ae 0300     		.word	3
 236 02b0 1B00     		.word	27
 237 02b2 1B00     		.word	27
 238 02b4 1B00     		.word	27
 239 02b6 1B00     		.word	27
 240 02b8 1B00     		.word	27
 241 02ba 1B00     		.word	27
 242 02bc 1B00     		.word	27
 243 02be 1B00     		.word	27
 244 02c0 1B00     		.word	27
 245 02c2 1B00     		.word	27
 246 02c4 1B00     		.word	27
 247 02c6 1B00     		.word	27
 248 02c8 1B00     		.word	27
 249 02ca 1B00     		.word	27
 250 02cc 1B00     		.word	27
 251 02ce 1B00     		.word	27
 252 02d0 1B00     		.word	27
 253 02d2 1B00     		.word	27
 254 02d4 1B00     		.word	27
 255 02d6 1B00     		.word	27
 256              	.lcomm yy_last_accepting_state,4,4
 257              	.lcomm yy_last_accepting_cpos,8,8
 258              		.globl	yy_flex_debug
 259              		.bss
 260              		.align 4
 261              	yy_flex_debug:
 262 0018 00000000 		.space 4
 263              		.globl	yytext
 264 001c 00000000 		.align 8
 265              	yytext:
 266 0020 00000000 		.space 8
 266      00000000 
 267              		.globl	xVal
 268              		.align 8
 269              	xVal:
 270 0028 00000000 		.space 8
 270      00000000 
 271              		.globl	yVal
 272              		.align 8
 273              	yVal:
 274 0030 00000000 		.space 8
 274      00000000 
 275              		.section .rdata,"dr"
 276              	.LC0:
 277 02d8 256C6600 		.ascii "%lf\0"
 278              	.LC1:
 279 02dc 546F6B65 		.ascii "Token: XVAL (x=%.2f)\12\0"
 279      6E3A2058 
 279      56414C20 
 279      28783D25 
 279      2E326629 
 280              	.LC2:
 281 02f2 546F6B65 		.ascii "Token: YVAL (y=%.2f)\12\0"
 281      6E3A2059 
 281      56414C20 
 281      28793D25 
 281      2E326629 
 282              	.LC3:
 283 0308 546F6B65 		.ascii "Token: CUSTOM_OP\0"
 283      6E3A2043 
 283      5553544F 
 283      4D5F4F50 
 283      00
 284              	.LC4:
 285 0319 556E6578 		.ascii "Unexpected character: %s\12\0"
 285      70656374 
 285      65642063 
 285      68617261 
 285      63746572 
 286 0333 00000000 		.align 8
 286      00
 287              	.LC5:
 288 0338 66617461 		.ascii "fatal flex scanner internal error--no action found\0"
 288      6C20666C 
 288      65782073 
 288      63616E6E 
 288      65722069 
 289              		.text
 290              		.globl	yylex
 292              		.seh_proc	yylex
 293              	yylex:
 294              	.LFB17:
 295              		.file 1 "lex.yy.c"
   1:lex.yy.c      **** #line 1 "lex.yy.c"
   2:lex.yy.c      **** 
   3:lex.yy.c      **** #line 3 "lex.yy.c"
   4:lex.yy.c      **** 
   5:lex.yy.c      **** #define  YY_INT_ALIGNED short int
   6:lex.yy.c      **** 
   7:lex.yy.c      **** /* A lexical scanner generated by flex */
   8:lex.yy.c      **** 
   9:lex.yy.c      **** #define FLEX_SCANNER
  10:lex.yy.c      **** #define YY_FLEX_MAJOR_VERSION 2
  11:lex.yy.c      **** #define YY_FLEX_MINOR_VERSION 6
  12:lex.yy.c      **** #define YY_FLEX_SUBMINOR_VERSION 4
  13:lex.yy.c      **** #if YY_FLEX_SUBMINOR_VERSION > 0
  14:lex.yy.c      **** #define FLEX_BETA
  15:lex.yy.c      **** #endif
  16:lex.yy.c      **** 
  17:lex.yy.c      **** /* First, we deal with  platform-specific or compiler-specific issues. */
  18:lex.yy.c      **** 
  19:lex.yy.c      **** /* begin standard C headers. */
  20:lex.yy.c      **** #include <stdio.h>
  21:lex.yy.c      **** #include <string.h>
  22:lex.yy.c      **** #include <errno.h>
  23:lex.yy.c      **** #include <stdlib.h>
  24:lex.yy.c      **** 
  25:lex.yy.c      **** /* end standard C headers. */
  26:lex.yy.c      **** 
  27:lex.yy.c      **** /* flex integer type definitions */
  28:lex.yy.c      **** 
  29:lex.yy.c      **** #ifndef FLEXINT_H
  30:lex.yy.c      **** #define FLEXINT_H
  31:lex.yy.c      **** 
  32:lex.yy.c      **** /* C99 systems have <inttypes.h>. Non-C99 systems may or may not. */
  33:lex.yy.c      **** 
  34:lex.yy.c      **** #if defined (__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
  35:lex.yy.c      **** 
  36:lex.yy.c      **** /* C99 says to define __STDC_LIMIT_MACROS before including stdint.h,
  37:lex.yy.c      ****  * if you want the limit (max/min) macros for int types. 
  38:lex.yy.c      ****  */
  39:lex.yy.c      **** #ifndef __STDC_LIMIT_MACROS
  40:lex.yy.c      **** #define __STDC_LIMIT_MACROS 1
  41:lex.yy.c      **** #endif
  42:lex.yy.c      **** 
  43:lex.yy.c      **** #include <inttypes.h>
  44:lex.yy.c      **** typedef int8_t flex_int8_t;
  45:lex.yy.c      **** typedef uint8_t flex_uint8_t;
  46:lex.yy.c      **** typedef int16_t flex_int16_t;
  47:lex.yy.c      **** typedef uint16_t flex_uint16_t;
  48:lex.yy.c      **** typedef int32_t flex_int32_t;
  49:lex.yy.c      **** typedef uint32_t flex_uint32_t;
  50:lex.yy.c      **** #else
  51:lex.yy.c      **** typedef signed char flex_int8_t;
  52:lex.yy.c      **** typedef short int flex_int16_t;
  53:lex.yy.c      **** typedef int flex_int32_t;
  54:lex.yy.c      **** typedef unsigned char flex_uint8_t; 
  55:lex.yy.c      **** typedef unsigned short int flex_uint16_t;
  56:lex.yy.c      **** typedef unsigned int flex_uint32_t;
  57:lex.yy.c      **** 
  58:lex.yy.c      **** /* Limits of integral types. */
  59:lex.yy.c      **** #ifndef INT8_MIN
  60:lex.yy.c      **** #define INT8_MIN               (-128)
  61:lex.yy.c      **** #endif
  62:lex.yy.c      **** #ifndef INT16_MIN
  63:lex.yy.c      **** #define INT16_MIN              (-32767-1)
  64:lex.yy.c      **** #endif
  65:lex.yy.c      **** #ifndef INT32_MIN
  66:lex.yy.c      **** #define INT32_MIN              (-2147483647-1)
  67:lex.yy.c      **** #endif
  68:lex.yy.c      **** #ifndef INT8_MAX
  69:lex.yy.c      **** #define INT8_MAX               (127)
  70:lex.yy.c      **** #endif
  71:lex.yy.c      **** #ifndef INT16_MAX
  72:lex.yy.c      **** #define INT16_MAX              (32767)
  73:lex.yy.c      **** #endif
  74:lex.yy.c      **** #ifndef INT32_MAX
  75:lex.yy.c      **** #define INT32_MAX              (2147483647)
  76:lex.yy.c      **** #endif
  77:lex.yy.c      **** #ifndef UINT8_MAX
  78:lex.yy.c      **** #define UINT8_MAX              (255U)
  79:lex.yy.c      **** #endif
  80:lex.yy.c      **** #ifndef UINT16_MAX
  81:lex.yy.c      **** #define UINT16_MAX             (65535U)
  82:lex.yy.c      **** #endif
  83:lex.yy.c      **** #ifndef UINT32_MAX
  84:lex.yy.c      **** #define UINT32_MAX             (4294967295U)
  85:lex.yy.c      **** #endif
  86:lex.yy.c      **** 
  87:lex.yy.c      **** #ifndef SIZE_MAX
  88:lex.yy.c      **** #define SIZE_MAX               (~(size_t)0)
  89:lex.yy.c      **** #endif
  90:lex.yy.c      **** 
  91:lex.yy.c      **** #endif /* ! C99 */
  92:lex.yy.c      **** 
  93:lex.yy.c      **** #endif /* ! FLEXINT_H */
  94:lex.yy.c      **** 
  95:lex.yy.c      **** /* begin standard C++ headers. */
  96:lex.yy.c      **** 
  97:lex.yy.c      **** /* TODO: this is always defined, so inline it */
  98:lex.yy.c      **** #define yyconst const
  99:lex.yy.c      **** 
 100:lex.yy.c      **** #if defined(__GNUC__) && __GNUC__ >= 3
 101:lex.yy.c      **** #define yynoreturn __attribute__((__noreturn__))
 102:lex.yy.c      **** #else
 103:lex.yy.c      **** #define yynoreturn
 104:lex.yy.c      **** #endif
 105:lex.yy.c      **** 
 106:lex.yy.c      **** /* Returned upon end-of-file. */
 107:lex.yy.c      **** #define YY_NULL 0
 108:lex.yy.c      **** 
 109:lex.yy.c      **** /* Promotes a possibly negative, possibly signed char to an
 110:lex.yy.c      ****  *   integer in range [0..255] for use as an array index.
 111:lex.yy.c      ****  */
 112:lex.yy.c      **** #define YY_SC_TO_UI(c) ((YY_CHAR) (c))
 113:lex.yy.c      **** 
 114:lex.yy.c      **** /* Enter a start condition.  This macro really ought to take a parameter,
 115:lex.yy.c      ****  * but we do it the disgusting crufty way forced on us by the ()-less
 116:lex.yy.c      ****  * definition of BEGIN.
 117:lex.yy.c      ****  */
 118:lex.yy.c      **** #define BEGIN (yy_start) = 1 + 2 *
 119:lex.yy.c      **** /* Translate the current start state into a value that can be later handed
 120:lex.yy.c      ****  * to BEGIN to return to the state.  The YYSTATE alias is for lex
 121:lex.yy.c      ****  * compatibility.
 122:lex.yy.c      ****  */
 123:lex.yy.c      **** #define YY_START (((yy_start) - 1) / 2)
 124:lex.yy.c      **** #define YYSTATE YY_START
 125:lex.yy.c      **** /* Action number for EOF rule of a given start state. */
 126:lex.yy.c      **** #define YY_STATE_EOF(state) (YY_END_OF_BUFFER + state + 1)
 127:lex.yy.c      **** /* Special action meaning "start processing a new file". */
 128:lex.yy.c      **** #define YY_NEW_FILE yyrestart( yyin  )
 129:lex.yy.c      **** #define YY_END_OF_BUFFER_CHAR 0
 130:lex.yy.c      **** 
 131:lex.yy.c      **** /* Size of default input buffer. */
 132:lex.yy.c      **** #ifndef YY_BUF_SIZE
 133:lex.yy.c      **** #ifdef __ia64__
 134:lex.yy.c      **** /* On IA-64, the buffer size is 16k, not 8k.
 135:lex.yy.c      ****  * Moreover, YY_BUF_SIZE is 2*YY_READ_BUF_SIZE in the general case.
 136:lex.yy.c      ****  * Ditto for the __ia64__ case accordingly.
 137:lex.yy.c      ****  */
 138:lex.yy.c      **** #define YY_BUF_SIZE 32768
 139:lex.yy.c      **** #else
 140:lex.yy.c      **** #define YY_BUF_SIZE 16384
 141:lex.yy.c      **** #endif /* __ia64__ */
 142:lex.yy.c      **** #endif
 143:lex.yy.c      **** 
 144:lex.yy.c      **** /* The state buf must be large enough to hold one state per character in the main buffer.
 145:lex.yy.c      ****  */
 146:lex.yy.c      **** #define YY_STATE_BUF_SIZE   ((YY_BUF_SIZE + 2) * sizeof(yy_state_type))
 147:lex.yy.c      **** 
 148:lex.yy.c      **** #ifndef YY_TYPEDEF_YY_BUFFER_STATE
 149:lex.yy.c      **** #define YY_TYPEDEF_YY_BUFFER_STATE
 150:lex.yy.c      **** typedef struct yy_buffer_state *YY_BUFFER_STATE;
 151:lex.yy.c      **** #endif
 152:lex.yy.c      **** 
 153:lex.yy.c      **** #ifndef YY_TYPEDEF_YY_SIZE_T
 154:lex.yy.c      **** #define YY_TYPEDEF_YY_SIZE_T
 155:lex.yy.c      **** typedef size_t yy_size_t;
 156:lex.yy.c      **** #endif
 157:lex.yy.c      **** 
 158:lex.yy.c      **** extern int yyleng;
 159:lex.yy.c      **** 
 160:lex.yy.c      **** extern FILE *yyin, *yyout;
 161:lex.yy.c      **** 
 162:lex.yy.c      **** #define EOB_ACT_CONTINUE_SCAN 0
 163:lex.yy.c      **** #define EOB_ACT_END_OF_FILE 1
 164:lex.yy.c      **** #define EOB_ACT_LAST_MATCH 2
 165:lex.yy.c      ****     
 166:lex.yy.c      ****     #define YY_LESS_LINENO(n)
 167:lex.yy.c      ****     #define YY_LINENO_REWIND_TO(ptr)
 168:lex.yy.c      ****     
 169:lex.yy.c      **** /* Return all but the first "n" matched characters back to the input stream. */
 170:lex.yy.c      **** #define yyless(n) \
 171:lex.yy.c      **** 	do \
 172:lex.yy.c      **** 		{ \
 173:lex.yy.c      **** 		/* Undo effects of setting up yytext. */ \
 174:lex.yy.c      ****         int yyless_macro_arg = (n); \
 175:lex.yy.c      ****         YY_LESS_LINENO(yyless_macro_arg);\
 176:lex.yy.c      **** 		*yy_cp = (yy_hold_char); \
 177:lex.yy.c      **** 		YY_RESTORE_YY_MORE_OFFSET \
 178:lex.yy.c      **** 		(yy_c_buf_p) = yy_cp = yy_bp + yyless_macro_arg - YY_MORE_ADJ; \
 179:lex.yy.c      **** 		YY_DO_BEFORE_ACTION; /* set up yytext again */ \
 180:lex.yy.c      **** 		} \
 181:lex.yy.c      **** 	while ( 0 )
 182:lex.yy.c      **** #define unput(c) yyunput( c, (yytext_ptr)  )
 183:lex.yy.c      **** 
 184:lex.yy.c      **** #ifndef YY_STRUCT_YY_BUFFER_STATE
 185:lex.yy.c      **** #define YY_STRUCT_YY_BUFFER_STATE
 186:lex.yy.c      **** struct yy_buffer_state
 187:lex.yy.c      **** 	{
 188:lex.yy.c      **** 	FILE *yy_input_file;
 189:lex.yy.c      **** 
 190:lex.yy.c      **** 	char *yy_ch_buf;		/* input buffer */
 191:lex.yy.c      **** 	char *yy_buf_pos;		/* current position in input buffer */
 192:lex.yy.c      **** 
 193:lex.yy.c      **** 	/* Size of input buffer in bytes, not including room for EOB
 194:lex.yy.c      **** 	 * characters.
 195:lex.yy.c      **** 	 */
 196:lex.yy.c      **** 	int yy_buf_size;
 197:lex.yy.c      **** 
 198:lex.yy.c      **** 	/* Number of characters read into yy_ch_buf, not including EOB
 199:lex.yy.c      **** 	 * characters.
 200:lex.yy.c      **** 	 */
 201:lex.yy.c      **** 	int yy_n_chars;
 202:lex.yy.c      **** 
 203:lex.yy.c      **** 	/* Whether we "own" the buffer - i.e., we know we created it,
 204:lex.yy.c      **** 	 * and can realloc() it to grow it, and should free() it to
 205:lex.yy.c      **** 	 * delete it.
 206:lex.yy.c      **** 	 */
 207:lex.yy.c      **** 	int yy_is_our_buffer;
 208:lex.yy.c      **** 
 209:lex.yy.c      **** 	/* Whether this is an "interactive" input source; if so, and
 210:lex.yy.c      **** 	 * if we're using stdio for input, then we want to use getc()
 211:lex.yy.c      **** 	 * instead of fread(), to make sure we stop fetching input after
 212:lex.yy.c      **** 	 * each newline.
 213:lex.yy.c      **** 	 */
 214:lex.yy.c      **** 	int yy_is_interactive;
 215:lex.yy.c      **** 
 216:lex.yy.c      **** 	/* Whether we're considered to be at the beginning of a line.
 217:lex.yy.c      **** 	 * If so, '^' rules will be active on the next match, otherwise
 218:lex.yy.c      **** 	 * not.
 219:lex.yy.c      **** 	 */
 220:lex.yy.c      **** 	int yy_at_bol;
 221:lex.yy.c      **** 
 222:lex.yy.c      ****     int yy_bs_lineno; /**< The line count. */
 223:lex.yy.c      ****     int yy_bs_column; /**< The column count. */
 224:lex.yy.c      **** 
 225:lex.yy.c      **** 	/* Whether to try to fill the input buffer when we reach the
 226:lex.yy.c      **** 	 * end of it.
 227:lex.yy.c      **** 	 */
 228:lex.yy.c      **** 	int yy_fill_buffer;
 229:lex.yy.c      **** 
 230:lex.yy.c      **** 	int yy_buffer_status;
 231:lex.yy.c      **** 
 232:lex.yy.c      **** #define YY_BUFFER_NEW 0
 233:lex.yy.c      **** #define YY_BUFFER_NORMAL 1
 234:lex.yy.c      **** 	/* When an EOF's been seen but there's still some text to process
 235:lex.yy.c      **** 	 * then we mark the buffer as YY_EOF_PENDING, to indicate that we
 236:lex.yy.c      **** 	 * shouldn't try reading from the input source any more.  We might
 237:lex.yy.c      **** 	 * still have a bunch of tokens to match, though, because of
 238:lex.yy.c      **** 	 * possible backing-up.
 239:lex.yy.c      **** 	 *
 240:lex.yy.c      **** 	 * When we actually see the EOF, we change the status to "new"
 241:lex.yy.c      **** 	 * (via yyrestart()), so that the user can continue scanning by
 242:lex.yy.c      **** 	 * just pointing yyin at a new input file.
 243:lex.yy.c      **** 	 */
 244:lex.yy.c      **** #define YY_BUFFER_EOF_PENDING 2
 245:lex.yy.c      **** 
 246:lex.yy.c      **** 	};
 247:lex.yy.c      **** #endif /* !YY_STRUCT_YY_BUFFER_STATE */
 248:lex.yy.c      **** 
 249:lex.yy.c      **** /* Stack of input buffers. */
 250:lex.yy.c      **** static size_t yy_buffer_stack_top = 0; /**< index of top of stack. */
 251:lex.yy.c      **** static size_t yy_buffer_stack_max = 0; /**< capacity of stack. */
 252:lex.yy.c      **** static YY_BUFFER_STATE * yy_buffer_stack = NULL; /**< Stack as an array. */
 253:lex.yy.c      **** 
 254:lex.yy.c      **** /* We provide macros for accessing buffer states in case in the
 255:lex.yy.c      ****  * future we want to put the buffer states in a more general
 256:lex.yy.c      ****  * "scanner state".
 257:lex.yy.c      ****  *
 258:lex.yy.c      ****  * Returns the top of the stack, or NULL.
 259:lex.yy.c      ****  */
 260:lex.yy.c      **** #define YY_CURRENT_BUFFER ( (yy_buffer_stack) \
 261:lex.yy.c      ****                           ? (yy_buffer_stack)[(yy_buffer_stack_top)] \
 262:lex.yy.c      ****                           : NULL)
 263:lex.yy.c      **** /* Same as previous macro, but useful when we know that the buffer stack is not
 264:lex.yy.c      ****  * NULL or when we need an lvalue. For internal use only.
 265:lex.yy.c      ****  */
 266:lex.yy.c      **** #define YY_CURRENT_BUFFER_LVALUE (yy_buffer_stack)[(yy_buffer_stack_top)]
 267:lex.yy.c      **** 
 268:lex.yy.c      **** /* yy_hold_char holds the character lost when yytext is formed. */
 269:lex.yy.c      **** static char yy_hold_char;
 270:lex.yy.c      **** static int yy_n_chars;		/* number of characters read into yy_ch_buf */
 271:lex.yy.c      **** int yyleng;
 272:lex.yy.c      **** 
 273:lex.yy.c      **** /* Points to current character in buffer. */
 274:lex.yy.c      **** static char *yy_c_buf_p = NULL;
 275:lex.yy.c      **** static int yy_init = 0;		/* whether we need to initialize */
 276:lex.yy.c      **** static int yy_start = 0;	/* start state number */
 277:lex.yy.c      **** 
 278:lex.yy.c      **** /* Flag which is used to allow yywrap()'s to do buffer switches
 279:lex.yy.c      ****  * instead of setting up a fresh yyin.  A bit of a hack ...
 280:lex.yy.c      ****  */
 281:lex.yy.c      **** static int yy_did_buffer_switch_on_eof;
 282:lex.yy.c      **** 
 283:lex.yy.c      **** void yyrestart ( FILE *input_file  );
 284:lex.yy.c      **** void yy_switch_to_buffer ( YY_BUFFER_STATE new_buffer  );
 285:lex.yy.c      **** YY_BUFFER_STATE yy_create_buffer ( FILE *file, int size  );
 286:lex.yy.c      **** void yy_delete_buffer ( YY_BUFFER_STATE b  );
 287:lex.yy.c      **** void yy_flush_buffer ( YY_BUFFER_STATE b  );
 288:lex.yy.c      **** void yypush_buffer_state ( YY_BUFFER_STATE new_buffer  );
 289:lex.yy.c      **** void yypop_buffer_state ( void );
 290:lex.yy.c      **** 
 291:lex.yy.c      **** static void yyensure_buffer_stack ( void );
 292:lex.yy.c      **** static void yy_load_buffer_state ( void );
 293:lex.yy.c      **** static void yy_init_buffer ( YY_BUFFER_STATE b, FILE *file  );
 294:lex.yy.c      **** #define YY_FLUSH_BUFFER yy_flush_buffer( YY_CURRENT_BUFFER )
 295:lex.yy.c      **** 
 296:lex.yy.c      **** YY_BUFFER_STATE yy_scan_buffer ( char *base, yy_size_t size  );
 297:lex.yy.c      **** YY_BUFFER_STATE yy_scan_string ( const char *yy_str  );
 298:lex.yy.c      **** YY_BUFFER_STATE yy_scan_bytes ( const char *bytes, int len  );
 299:lex.yy.c      **** 
 300:lex.yy.c      **** void *yyalloc ( yy_size_t  );
 301:lex.yy.c      **** void *yyrealloc ( void *, yy_size_t  );
 302:lex.yy.c      **** void yyfree ( void *  );
 303:lex.yy.c      **** 
 304:lex.yy.c      **** #define yy_new_buffer yy_create_buffer
 305:lex.yy.c      **** #define yy_set_interactive(is_interactive) \
 306:lex.yy.c      **** 	{ \
 307:lex.yy.c      **** 	if ( ! YY_CURRENT_BUFFER ){ \
 308:lex.yy.c      ****         yyensure_buffer_stack (); \
 309:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE =    \
 310:lex.yy.c      ****             yy_create_buffer( yyin, YY_BUF_SIZE ); \
 311:lex.yy.c      **** 	} \
 312:lex.yy.c      **** 	YY_CURRENT_BUFFER_LVALUE->yy_is_interactive = is_interactive; \
 313:lex.yy.c      **** 	}
 314:lex.yy.c      **** #define yy_set_bol(at_bol) \
 315:lex.yy.c      **** 	{ \
 316:lex.yy.c      **** 	if ( ! YY_CURRENT_BUFFER ){\
 317:lex.yy.c      ****         yyensure_buffer_stack (); \
 318:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE =    \
 319:lex.yy.c      ****             yy_create_buffer( yyin, YY_BUF_SIZE ); \
 320:lex.yy.c      **** 	} \
 321:lex.yy.c      **** 	YY_CURRENT_BUFFER_LVALUE->yy_at_bol = at_bol; \
 322:lex.yy.c      **** 	}
 323:lex.yy.c      **** #define YY_AT_BOL() (YY_CURRENT_BUFFER_LVALUE->yy_at_bol)
 324:lex.yy.c      **** 
 325:lex.yy.c      **** /* Begin user sect3 */
 326:lex.yy.c      **** typedef flex_uint8_t YY_CHAR;
 327:lex.yy.c      **** 
 328:lex.yy.c      **** FILE *yyin = NULL, *yyout = NULL;
 329:lex.yy.c      **** 
 330:lex.yy.c      **** typedef int yy_state_type;
 331:lex.yy.c      **** 
 332:lex.yy.c      **** extern int yylineno;
 333:lex.yy.c      **** int yylineno = 1;
 334:lex.yy.c      **** 
 335:lex.yy.c      **** extern char *yytext;
 336:lex.yy.c      **** #ifdef yytext_ptr
 337:lex.yy.c      **** #undef yytext_ptr
 338:lex.yy.c      **** #endif
 339:lex.yy.c      **** #define yytext_ptr yytext
 340:lex.yy.c      **** 
 341:lex.yy.c      **** static yy_state_type yy_get_previous_state ( void );
 342:lex.yy.c      **** static yy_state_type yy_try_NUL_trans ( yy_state_type current_state  );
 343:lex.yy.c      **** static int yy_get_next_buffer ( void );
 344:lex.yy.c      **** static void yynoreturn yy_fatal_error ( const char* msg  );
 345:lex.yy.c      **** 
 346:lex.yy.c      **** /* Done after the current pattern has been matched and before the
 347:lex.yy.c      ****  * corresponding action - sets up yytext.
 348:lex.yy.c      ****  */
 349:lex.yy.c      **** #define YY_DO_BEFORE_ACTION \
 350:lex.yy.c      **** 	(yytext_ptr) = yy_bp; \
 351:lex.yy.c      **** 	yyleng = (int) (yy_cp - yy_bp); \
 352:lex.yy.c      **** 	(yy_hold_char) = *yy_cp; \
 353:lex.yy.c      **** 	*yy_cp = '\0'; \
 354:lex.yy.c      **** 	(yy_c_buf_p) = yy_cp;
 355:lex.yy.c      **** #define YY_NUM_RULES 6
 356:lex.yy.c      **** #define YY_END_OF_BUFFER 7
 357:lex.yy.c      **** /* This struct is not used in this scanner,
 358:lex.yy.c      ****    but its presence is necessary. */
 359:lex.yy.c      **** struct yy_trans_info
 360:lex.yy.c      **** 	{
 361:lex.yy.c      **** 	flex_int32_t yy_verify;
 362:lex.yy.c      **** 	flex_int32_t yy_nxt;
 363:lex.yy.c      **** 	};
 364:lex.yy.c      **** static const flex_int16_t yy_accept[28] =
 365:lex.yy.c      ****     {   0,
 366:lex.yy.c      ****         0,    0,    7,    5,    4,    4,    5,    5,    5,    0,
 367:lex.yy.c      ****         1,    2,    0,    0,    0,    0,    0,    0,    0,    0,
 368:lex.yy.c      ****         0,    0,    0,    0,    0,    3,    0
 369:lex.yy.c      ****     } ;
 370:lex.yy.c      **** 
 371:lex.yy.c      **** static const YY_CHAR yy_ec[256] =
 372:lex.yy.c      ****     {   0,
 373:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    2,    3,
 374:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 375:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 376:lex.yy.c      ****         1,    2,    1,    1,    1,    1,    1,    1,    1,    1,
 377:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    4,    4,    4,
 378:lex.yy.c      ****         4,    4,    4,    4,    4,    4,    4,    1,    1,    1,
 379:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 380:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 381:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 382:lex.yy.c      ****         1,    1,    1,    1,    5,    1,    6,    1,    7,    1,
 383:lex.yy.c      **** 
 384:lex.yy.c      ****         8,    1,    1,    1,    9,    1,    1,    1,   10,   11,
 385:lex.yy.c      ****        12,   13,    1,   14,   15,   16,   17,    1,    1,   18,
 386:lex.yy.c      ****        19,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 387:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 388:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 389:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 390:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 391:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 392:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 393:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 394:lex.yy.c      **** 
 395:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 396:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 397:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 398:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 399:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 400:lex.yy.c      ****         1,    1,    1,    1,    1
 401:lex.yy.c      ****     } ;
 402:lex.yy.c      **** 
 403:lex.yy.c      **** static const YY_CHAR yy_meta[20] =
 404:lex.yy.c      ****     {   0,
 405:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
 406:lex.yy.c      ****         1,    1,    1,    1,    1,    1,    1,    1,    1
 407:lex.yy.c      ****     } ;
 408:lex.yy.c      **** 
 409:lex.yy.c      **** static const flex_int16_t yy_base[29] =
 410:lex.yy.c      ****     {   0,
 411:lex.yy.c      ****         0,   18,   39,   40,   40,   40,   21,   31,   30,   18,
 412:lex.yy.c      ****        28,   27,   14,   17,   18,   22,   14,   11,   15,    8,
 413:lex.yy.c      ****        11,    0,    4,    0,    0,   40,   40,    0
 414:lex.yy.c      ****     } ;
 415:lex.yy.c      **** 
 416:lex.yy.c      **** static const flex_int16_t yy_def[29] =
 417:lex.yy.c      ****     {   0,
 418:lex.yy.c      ****        28,   28,   27,   27,   27,   27,   27,   27,   27,   27,
 419:lex.yy.c      ****        27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
 420:lex.yy.c      ****        27,   27,   27,   27,   27,   27,    0,   27
 421:lex.yy.c      ****     } ;
 422:lex.yy.c      **** 
 423:lex.yy.c      **** static const flex_int16_t yy_nxt[60] =
 424:lex.yy.c      ****     {   0,
 425:lex.yy.c      ****         4,    5,    6,   27,   27,   27,    7,   27,   27,   27,
 426:lex.yy.c      ****        26,   25,   24,   27,   27,   23,   22,    8,    9,    5,
 427:lex.yy.c      ****         6,   21,   20,   19,    7,   18,   17,   16,   15,   14,
 428:lex.yy.c      ****        12,   11,   13,   12,   11,    8,    9,   10,   27,    3,
 429:lex.yy.c      ****        27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
 430:lex.yy.c      ****        27,   27,   27,   27,   27,   27,   27,   27,   27
 431:lex.yy.c      ****     } ;
 432:lex.yy.c      **** 
 433:lex.yy.c      **** static const flex_int16_t yy_chk[60] =
 434:lex.yy.c      ****     {   0,
 435:lex.yy.c      ****        28,    1,    1,    0,    0,    0,    1,    0,    0,    0,
 436:lex.yy.c      ****        25,   24,   23,    0,    0,   22,   21,    1,    1,    2,
 437:lex.yy.c      ****         2,   20,   19,   18,    2,   17,   16,   15,   14,   13,
 438:lex.yy.c      ****        12,   11,   10,    9,    8,    2,    2,    7,    3,   27,
 439:lex.yy.c      ****        27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
 440:lex.yy.c      ****        27,   27,   27,   27,   27,   27,   27,   27,   27
 441:lex.yy.c      ****     } ;
 442:lex.yy.c      **** 
 443:lex.yy.c      **** static yy_state_type yy_last_accepting_state;
 444:lex.yy.c      **** static char *yy_last_accepting_cpos;
 445:lex.yy.c      **** 
 446:lex.yy.c      **** extern int yy_flex_debug;
 447:lex.yy.c      **** int yy_flex_debug = 0;
 448:lex.yy.c      **** 
 449:lex.yy.c      **** /* The intent behind this definition is that it'll catch
 450:lex.yy.c      ****  * any uses of REJECT which flex missed.
 451:lex.yy.c      ****  */
 452:lex.yy.c      **** #define REJECT reject_used_but_not_detected
 453:lex.yy.c      **** #define yymore() yymore_used_but_not_detected
 454:lex.yy.c      **** #define YY_MORE_ADJ 0
 455:lex.yy.c      **** #define YY_RESTORE_YY_MORE_OFFSET
 456:lex.yy.c      **** char *yytext;
 457:lex.yy.c      **** #line 1 "custom_op.l"
 458:lex.yy.c      **** #line 2 "custom_op.l"
 459:lex.yy.c      **** #include <stdio.h>
 460:lex.yy.c      **** #include <stdlib.h>
 461:lex.yy.c      **** #include "custom_op.h"
 462:lex.yy.c      **** 
 463:lex.yy.c      **** double xVal = 0, yVal = 0;
 464:lex.yy.c      **** #line 464 "lex.yy.c"
 465:lex.yy.c      **** #line 465 "lex.yy.c"
 466:lex.yy.c      **** 
 467:lex.yy.c      **** #define INITIAL 0
 468:lex.yy.c      **** 
 469:lex.yy.c      **** #ifndef YY_NO_UNISTD_H
 470:lex.yy.c      **** /* Special case for "unistd.h", since it is non-ANSI. We include it way
 471:lex.yy.c      ****  * down here because we want the user's section 1 to have been scanned first.
 472:lex.yy.c      ****  * The user has a chance to override it with an option.
 473:lex.yy.c      ****  */
 474:lex.yy.c      **** #include <unistd.h>
 475:lex.yy.c      **** #endif
 476:lex.yy.c      **** 
 477:lex.yy.c      **** #ifndef YY_EXTRA_TYPE
 478:lex.yy.c      **** #define YY_EXTRA_TYPE void *
 479:lex.yy.c      **** #endif
 480:lex.yy.c      **** 
 481:lex.yy.c      **** static int yy_init_globals ( void );
 482:lex.yy.c      **** 
 483:lex.yy.c      **** /* Accessor methods to globals.
 484:lex.yy.c      ****    These are made visible to non-reentrant scanners for convenience. */
 485:lex.yy.c      **** 
 486:lex.yy.c      **** int yylex_destroy ( void );
 487:lex.yy.c      **** 
 488:lex.yy.c      **** int yyget_debug ( void );
 489:lex.yy.c      **** 
 490:lex.yy.c      **** void yyset_debug ( int debug_flag  );
 491:lex.yy.c      **** 
 492:lex.yy.c      **** YY_EXTRA_TYPE yyget_extra ( void );
 493:lex.yy.c      **** 
 494:lex.yy.c      **** void yyset_extra ( YY_EXTRA_TYPE user_defined  );
 495:lex.yy.c      **** 
 496:lex.yy.c      **** FILE *yyget_in ( void );
 497:lex.yy.c      **** 
 498:lex.yy.c      **** void yyset_in  ( FILE * _in_str  );
 499:lex.yy.c      **** 
 500:lex.yy.c      **** FILE *yyget_out ( void );
 501:lex.yy.c      **** 
 502:lex.yy.c      **** void yyset_out  ( FILE * _out_str  );
 503:lex.yy.c      **** 
 504:lex.yy.c      **** 			int yyget_leng ( void );
 505:lex.yy.c      **** 
 506:lex.yy.c      **** char *yyget_text ( void );
 507:lex.yy.c      **** 
 508:lex.yy.c      **** int yyget_lineno ( void );
 509:lex.yy.c      **** 
 510:lex.yy.c      **** void yyset_lineno ( int _line_number  );
 511:lex.yy.c      **** 
 512:lex.yy.c      **** /* Macros after this point can all be overridden by user definitions in
 513:lex.yy.c      ****  * section 1.
 514:lex.yy.c      ****  */
 515:lex.yy.c      **** 
 516:lex.yy.c      **** #ifndef YY_SKIP_YYWRAP
 517:lex.yy.c      **** #ifdef __cplusplus
 518:lex.yy.c      **** extern "C" int yywrap ( void );
 519:lex.yy.c      **** #else
 520:lex.yy.c      **** extern int yywrap ( void );
 521:lex.yy.c      **** #endif
 522:lex.yy.c      **** #endif
 523:lex.yy.c      **** 
 524:lex.yy.c      **** #ifndef YY_NO_UNPUT
 525:lex.yy.c      ****     
 526:lex.yy.c      ****     static void yyunput ( int c, char *buf_ptr  );
 527:lex.yy.c      ****     
 528:lex.yy.c      **** #endif
 529:lex.yy.c      **** 
 530:lex.yy.c      **** #ifndef yytext_ptr
 531:lex.yy.c      **** static void yy_flex_strncpy ( char *, const char *, int );
 532:lex.yy.c      **** #endif
 533:lex.yy.c      **** 
 534:lex.yy.c      **** #ifdef YY_NEED_STRLEN
 535:lex.yy.c      **** static int yy_flex_strlen ( const char * );
 536:lex.yy.c      **** #endif
 537:lex.yy.c      **** 
 538:lex.yy.c      **** #ifndef YY_NO_INPUT
 539:lex.yy.c      **** #ifdef __cplusplus
 540:lex.yy.c      **** static int yyinput ( void );
 541:lex.yy.c      **** #else
 542:lex.yy.c      **** static int input ( void );
 543:lex.yy.c      **** #endif
 544:lex.yy.c      **** 
 545:lex.yy.c      **** #endif
 546:lex.yy.c      **** 
 547:lex.yy.c      **** /* Amount of stuff to slurp up with each read. */
 548:lex.yy.c      **** #ifndef YY_READ_BUF_SIZE
 549:lex.yy.c      **** #ifdef __ia64__
 550:lex.yy.c      **** /* On IA-64, the buffer size is 16k, not 8k */
 551:lex.yy.c      **** #define YY_READ_BUF_SIZE 16384
 552:lex.yy.c      **** #else
 553:lex.yy.c      **** #define YY_READ_BUF_SIZE 8192
 554:lex.yy.c      **** #endif /* __ia64__ */
 555:lex.yy.c      **** #endif
 556:lex.yy.c      **** 
 557:lex.yy.c      **** /* Copy whatever the last rule matched to the standard output. */
 558:lex.yy.c      **** #ifndef ECHO
 559:lex.yy.c      **** /* This used to be an fputs(), but since the string might contain NUL's,
 560:lex.yy.c      ****  * we now use fwrite().
 561:lex.yy.c      ****  */
 562:lex.yy.c      **** #define ECHO do { if (fwrite( yytext, (size_t) yyleng, 1, yyout )) {} } while (0)
 563:lex.yy.c      **** #endif
 564:lex.yy.c      **** 
 565:lex.yy.c      **** /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
 566:lex.yy.c      ****  * is returned in "result".
 567:lex.yy.c      ****  */
 568:lex.yy.c      **** #ifndef YY_INPUT
 569:lex.yy.c      **** #define YY_INPUT(buf,result,max_size) \
 570:lex.yy.c      **** 	if ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \
 571:lex.yy.c      **** 		{ \
 572:lex.yy.c      **** 		int c = '*'; \
 573:lex.yy.c      **** 		int n; \
 574:lex.yy.c      **** 		for ( n = 0; n < max_size && \
 575:lex.yy.c      **** 			     (c = getc( yyin )) != EOF && c != '\n'; ++n ) \
 576:lex.yy.c      **** 			buf[n] = (char) c; \
 577:lex.yy.c      **** 		if ( c == '\n' ) \
 578:lex.yy.c      **** 			buf[n++] = (char) c; \
 579:lex.yy.c      **** 		if ( c == EOF && ferror( yyin ) ) \
 580:lex.yy.c      **** 			YY_FATAL_ERROR( "input in flex scanner failed" ); \
 581:lex.yy.c      **** 		result = n; \
 582:lex.yy.c      **** 		} \
 583:lex.yy.c      **** 	else \
 584:lex.yy.c      **** 		{ \
 585:lex.yy.c      **** 		errno=0; \
 586:lex.yy.c      **** 		while ( (result = (int) fread(buf, 1, (yy_size_t) max_size, yyin)) == 0 && ferror(yyin)) \
 587:lex.yy.c      **** 			{ \
 588:lex.yy.c      **** 			if( errno != EINTR) \
 589:lex.yy.c      **** 				{ \
 590:lex.yy.c      **** 				YY_FATAL_ERROR( "input in flex scanner failed" ); \
 591:lex.yy.c      **** 				break; \
 592:lex.yy.c      **** 				} \
 593:lex.yy.c      **** 			errno=0; \
 594:lex.yy.c      **** 			clearerr(yyin); \
 595:lex.yy.c      **** 			} \
 596:lex.yy.c      **** 		}\
 597:lex.yy.c      **** \
 598:lex.yy.c      **** 
 599:lex.yy.c      **** #endif
 600:lex.yy.c      **** 
 601:lex.yy.c      **** /* No semi-colon after return; correct usage is to write "yyterminate();" -
 602:lex.yy.c      ****  * we don't want an extra ';' after the "return" because that will cause
 603:lex.yy.c      ****  * some compilers to complain about unreachable statements.
 604:lex.yy.c      ****  */
 605:lex.yy.c      **** #ifndef yyterminate
 606:lex.yy.c      **** #define yyterminate() return YY_NULL
 607:lex.yy.c      **** #endif
 608:lex.yy.c      **** 
 609:lex.yy.c      **** /* Number of entries by which start-condition stack grows. */
 610:lex.yy.c      **** #ifndef YY_START_STACK_INCR
 611:lex.yy.c      **** #define YY_START_STACK_INCR 25
 612:lex.yy.c      **** #endif
 613:lex.yy.c      **** 
 614:lex.yy.c      **** /* Report a fatal error. */
 615:lex.yy.c      **** #ifndef YY_FATAL_ERROR
 616:lex.yy.c      **** #define YY_FATAL_ERROR(msg) yy_fatal_error( msg )
 617:lex.yy.c      **** #endif
 618:lex.yy.c      **** 
 619:lex.yy.c      **** /* end tables serialization structures and prototypes */
 620:lex.yy.c      **** 
 621:lex.yy.c      **** /* Default declaration of generated scanner - a define so the user can
 622:lex.yy.c      ****  * easily add parameters.
 623:lex.yy.c      ****  */
 624:lex.yy.c      **** #ifndef YY_DECL
 625:lex.yy.c      **** #define YY_DECL_IS_OURS 1
 626:lex.yy.c      **** 
 627:lex.yy.c      **** extern int yylex (void);
 628:lex.yy.c      **** 
 629:lex.yy.c      **** #define YY_DECL int yylex (void)
 630:lex.yy.c      **** #endif /* !YY_DECL */
 631:lex.yy.c      **** 
 632:lex.yy.c      **** /* Code executed at the beginning of each rule, after yytext and yyleng
 633:lex.yy.c      ****  * have been set up.
 634:lex.yy.c      ****  */
 635:lex.yy.c      **** #ifndef YY_USER_ACTION
 636:lex.yy.c      **** #define YY_USER_ACTION
 637:lex.yy.c      **** #endif
 638:lex.yy.c      **** 
 639:lex.yy.c      **** /* Code executed at the end of each rule. */
 640:lex.yy.c      **** #ifndef YY_BREAK
 641:lex.yy.c      **** #define YY_BREAK /*LINTED*/break;
 642:lex.yy.c      **** #endif
 643:lex.yy.c      **** 
 644:lex.yy.c      **** #define YY_RULE_SETUP \
 645:lex.yy.c      **** 	YY_USER_ACTION
 646:lex.yy.c      **** 
 647:lex.yy.c      **** /** The main scanner function which does all the work.
 648:lex.yy.c      ****  */
 649:lex.yy.c      **** YY_DECL
 296              		.loc 1 649 1
 297              		.cfi_startproc
 298 0000 55       		pushq	%rbp
 299              		.seh_pushreg	%rbp
 300              		.cfi_def_cfa_offset 16
 301              		.cfi_offset 6, -16
 302 0001 53       		pushq	%rbx
 303              		.seh_pushreg	%rbx
 304              		.cfi_def_cfa_offset 24
 305              		.cfi_offset 3, -24
 306 0002 4883EC58 		subq	$88, %rsp
 307              		.seh_stackalloc	88
 308              		.cfi_def_cfa_offset 112
 309 0006 488D6C24 		leaq	80(%rsp), %rbp
 309      50
 310              		.seh_setframe	%rbp, 80
 311              		.cfi_def_cfa 6, 32
 312              		.seh_endprologue
 650:lex.yy.c      **** {
 651:lex.yy.c      **** 	yy_state_type yy_current_state;
 652:lex.yy.c      **** 	char *yy_cp, *yy_bp;
 653:lex.yy.c      **** 	int yy_act;
 654:lex.yy.c      ****     
 313              		.loc 1 654 7
 314 000b 8B056000 		movl	yy_init(%rip), %eax
 314      0000
 315              		.loc 1 654 5
 316 0011 85C0     		testl	%eax, %eax
 317 0013 0F85C000 		jne	.L37
 317      0000
 655:lex.yy.c      **** 	if ( !(yy_init) )
 656:lex.yy.c      **** 		{
 318              		.loc 1 656 13
 319 0019 C7055C00 		movl	$1, yy_init(%rip)
 319      00000100 
 319      0000
 657:lex.yy.c      **** 		(yy_init) = 1;
 658:lex.yy.c      **** 
 659:lex.yy.c      **** #ifdef YY_USER_INIT
 660:lex.yy.c      **** 		YY_USER_INIT;
 661:lex.yy.c      **** #endif
 662:lex.yy.c      **** 
 320              		.loc 1 662 8
 321 0023 8B056400 		movl	yy_start(%rip), %eax
 321      0000
 322              		.loc 1 662 6
 323 0029 85C0     		testl	%eax, %eax
 324 002b 750A     		jne	.L3
 663:lex.yy.c      **** 		if ( ! (yy_start) )
 325              		.loc 1 663 15
 326 002d C7056000 		movl	$1, yy_start(%rip)
 326      00000100 
 326      0000
 327              	.L3:
 664:lex.yy.c      **** 			(yy_start) = 1;	/* first start state */
 665:lex.yy.c      **** 
 328              		.loc 1 665 8
 329 0037 488B0508 		movq	yyin(%rip), %rax
 329      000000
 330              		.loc 1 665 6
 331 003e 4885C0   		testq	%rax, %rax
 332 0041 7515     		jne	.L4
 666:lex.yy.c      **** 		if ( ! yyin )
 333              		.loc 1 666 11
 334 0043 B9000000 		movl	$0, %ecx
 334      00
 335 0048 488B0500 		movq	__imp___acrt_iob_func(%rip), %rax
 335      000000
 336 004f FFD0     		call	*%rax
 337              	.LVL0:
 338              		.loc 1 666 9 discriminator 1
 339 0051 48890508 		movq	%rax, yyin(%rip)
 339      000000
 340              	.L4:
 667:lex.yy.c      **** 			yyin = stdin;
 668:lex.yy.c      **** 
 341              		.loc 1 668 8
 342 0058 488B0510 		movq	yyout(%rip), %rax
 342      000000
 343              		.loc 1 668 6
 344 005f 4885C0   		testq	%rax, %rax
 345 0062 7515     		jne	.L5
 669:lex.yy.c      **** 		if ( ! yyout )
 346              		.loc 1 669 12
 347 0064 B9010000 		movl	$1, %ecx
 347      00
 348 0069 488B0500 		movq	__imp___acrt_iob_func(%rip), %rax
 348      000000
 349 0070 FFD0     		call	*%rax
 350              	.LVL1:
 351              		.loc 1 669 10 discriminator 1
 352 0072 48890510 		movq	%rax, yyout(%rip)
 352      000000
 353              	.L5:
 670:lex.yy.c      **** 			yyout = stdout;
 671:lex.yy.c      **** 
 354              		.loc 1 671 10
 355 0079 488B0548 		movq	yy_buffer_stack(%rip), %rax
 355      000000
 356              		.loc 1 671 6
 357 0080 4885C0   		testq	%rax, %rax
 358 0083 741D     		je	.L6
 359              		.loc 1 671 10 discriminator 1
 360 0085 488B0548 		movq	yy_buffer_stack(%rip), %rax
 360      000000
 361 008c 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 361      000000
 362 0093 48C1E203 		salq	$3, %rdx
 363 0097 4801D0   		addq	%rdx, %rax
 364 009a 488B00   		movq	(%rax), %rax
 365              		.loc 1 671 8 discriminator 1
 366 009d 4885C0   		testq	%rax, %rax
 367 00a0 7532     		jne	.L7
 368              	.L6:
 672:lex.yy.c      **** 		if ( ! YY_CURRENT_BUFFER ) {
 369              		.loc 1 672 4
 370 00a2 E8341800 		call	yyensure_buffer_stack
 370      00
 673:lex.yy.c      **** 			yyensure_buffer_stack ();
 674:lex.yy.c      **** 			YY_CURRENT_BUFFER_LVALUE =
 371              		.loc 1 674 5
 372 00a7 488B0508 		movq	yyin(%rip), %rax
 372      000000
 673:lex.yy.c      **** 			yyensure_buffer_stack ();
 373              		.loc 1 673 4
 374 00ae 488B1548 		movq	yy_buffer_stack(%rip), %rdx
 374      000000
 375 00b5 488B0D38 		movq	yy_buffer_stack_top(%rip), %rcx
 375      000000
 376 00bc 48C1E103 		salq	$3, %rcx
 377 00c0 488D1C0A 		leaq	(%rdx,%rcx), %rbx
 378              		.loc 1 674 5
 379 00c4 BA004000 		movl	$16384, %edx
 379      00
 380 00c9 4889C1   		movq	%rax, %rcx
 381 00cc E8831300 		call	yy_create_buffer
 381      00
 673:lex.yy.c      **** 			yyensure_buffer_stack ();
 382              		.loc 1 673 29
 383 00d1 488903   		movq	%rax, (%rbx)
 384              	.L7:
 675:lex.yy.c      **** 				yy_create_buffer( yyin, YY_BUF_SIZE );
 676:lex.yy.c      **** 		}
 677:lex.yy.c      **** 
 385              		.loc 1 677 3
 386 00d4 E8F01200 		call	yy_load_buffer_state
 386      00
 387              	.L37:
 678:lex.yy.c      **** 		yy_load_buffer_state(  );
 679:lex.yy.c      **** 		}
 680:lex.yy.c      **** 
 681:lex.yy.c      **** 	{
 682:lex.yy.c      **** #line 9 "custom_op.l"
 683:lex.yy.c      **** 
 684:lex.yy.c      **** 
 685:lex.yy.c      **** #line 685 "lex.yy.c"
 686:lex.yy.c      **** 
 687:lex.yy.c      **** 	while ( /*CONSTCOND*/1 )		/* loops until end-of-file is reached */
 688:lex.yy.c      **** 		{
 388              		.loc 1 688 9
 389 00d9 488B0558 		movq	yy_c_buf_p(%rip), %rax
 389      000000
 390 00e0 488945F0 		movq	%rax, -16(%rbp)
 689:lex.yy.c      **** 		yy_cp = (yy_c_buf_p);
 690:lex.yy.c      **** 
 691:lex.yy.c      **** 		/* Support of yytext. */
 391              		.loc 1 691 10
 392 00e4 0FB61550 		movzbl	yy_hold_char(%rip), %edx
 392      000000
 393 00eb 488B45F0 		movq	-16(%rbp), %rax
 394 00ef 8810     		movb	%dl, (%rax)
 692:lex.yy.c      **** 		*yy_cp = (yy_hold_char);
 693:lex.yy.c      **** 
 694:lex.yy.c      **** 		/* yy_bp points to the position in yy_ch_buf of the start of
 695:lex.yy.c      **** 		 * the current run.
 696:lex.yy.c      **** 		 */
 395              		.loc 1 696 9
 396 00f1 488B45F0 		movq	-16(%rbp), %rax
 397 00f5 488945E8 		movq	%rax, -24(%rbp)
 697:lex.yy.c      **** 		yy_bp = yy_cp;
 698:lex.yy.c      **** 
 398              		.loc 1 698 20
 399 00f9 8B056400 		movl	yy_start(%rip), %eax
 399      0000
 400 00ff 8945FC   		movl	%eax, -4(%rbp)
 401              	.L8:
 402              	.L12:
 403              	.LBB2:
 699:lex.yy.c      **** 		yy_current_state = (yy_start);
 700:lex.yy.c      **** yy_match:
 701:lex.yy.c      **** 		do
 702:lex.yy.c      **** 			{
 404              		.loc 1 702 25
 405 0102 488B45F0 		movq	-16(%rbp), %rax
 406 0106 0FB600   		movzbl	(%rax), %eax
 407 0109 0FB6C0   		movzbl	%al, %eax
 408              		.loc 1 702 12
 409 010c 4898     		cltq
 410 010e 488D1540 		leaq	yy_ec(%rip), %rdx
 410      000000
 411 0115 0FB60410 		movzbl	(%rax,%rdx), %eax
 412 0119 8845E3   		movb	%al, -29(%rbp)
 703:lex.yy.c      **** 			YY_CHAR yy_c = yy_ec[YY_SC_TO_UI(*yy_cp)] ;
 413              		.loc 1 703 18
 414 011c 8B45FC   		movl	-4(%rbp), %eax
 415 011f 4898     		cltq
 416 0121 488D1400 		leaq	(%rax,%rax), %rdx
 417 0125 488D0500 		leaq	yy_accept(%rip), %rax
 417      000000
 418 012c 0FB70402 		movzwl	(%rdx,%rax), %eax
 419              		.loc 1 703 7
 420 0130 6685C0   		testw	%ax, %ax
 421 0133 7448     		je	.L10
 704:lex.yy.c      **** 			if ( yy_accept[yy_current_state] )
 705:lex.yy.c      **** 				{
 422              		.loc 1 705 31
 423 0135 8B45FC   		movl	-4(%rbp), %eax
 424 0138 89056C00 		movl	%eax, yy_last_accepting_state(%rip)
 424      0000
 706:lex.yy.c      **** 				(yy_last_accepting_state) = yy_current_state;
 425              		.loc 1 706 30
 426 013e 488B45F0 		movq	-16(%rbp), %rax
 427 0142 48890570 		movq	%rax, yy_last_accepting_cpos(%rip)
 427      000000
 707:lex.yy.c      **** 				(yy_last_accepting_cpos) = yy_cp;
 708:lex.yy.c      **** 				}
 428              		.loc 1 708 10
 429 0149 EB32     		jmp	.L10
 430              	.L11:
 709:lex.yy.c      **** 			while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 710:lex.yy.c      **** 				{
 431              		.loc 1 710 36
 432 014b 8B45FC   		movl	-4(%rbp), %eax
 433 014e 4898     		cltq
 434 0150 488D1400 		leaq	(%rax,%rax), %rdx
 435 0154 488D05A0 		leaq	yy_def(%rip), %rax
 435      010000
 436 015b 0FB70402 		movzwl	(%rdx,%rax), %eax
 437              		.loc 1 710 22
 438 015f 98       		cwtl
 439 0160 8945FC   		movl	%eax, -4(%rbp)
 711:lex.yy.c      **** 				yy_current_state = (int) yy_def[yy_current_state];
 440              		.loc 1 711 8
 441 0163 837DFC1B 		cmpl	$27, -4(%rbp)
 442 0167 7E14     		jle	.L10
 712:lex.yy.c      **** 				if ( yy_current_state >= 28 )
 443              		.loc 1 712 20
 444 0169 0FB645E3 		movzbl	-29(%rbp), %eax
 445              		.loc 1 712 11
 446 016d 4898     		cltq
 447 016f 488D1540 		leaq	yy_meta(%rip), %rdx
 447      010000
 448 0176 0FB60410 		movzbl	(%rax,%rdx), %eax
 449 017a 8845E3   		movb	%al, -29(%rbp)
 450              	.L10:
 708:lex.yy.c      **** 			while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 451              		.loc 1 708 26
 452 017d 8B45FC   		movl	-4(%rbp), %eax
 453 0180 4898     		cltq
 454 0182 488D1400 		leaq	(%rax,%rax), %rdx
 455 0186 488D0560 		leaq	yy_base(%rip), %rax
 455      010000
 456 018d 0FB70402 		movzwl	(%rdx,%rax), %eax
 457 0191 0FBFD0   		movswl	%ax, %edx
 708:lex.yy.c      **** 			while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 458              		.loc 1 708 45
 459 0194 0FB645E3 		movzbl	-29(%rbp), %eax
 460 0198 01D0     		addl	%edx, %eax
 708:lex.yy.c      **** 			while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 461              		.loc 1 708 18
 462 019a 4898     		cltq
 463 019c 488D1400 		leaq	(%rax,%rax), %rdx
 464 01a0 488D0560 		leaq	yy_chk(%rip), %rax
 464      020000
 465 01a7 0FB70402 		movzwl	(%rdx,%rax), %eax
 466 01ab 98       		cwtl
 708:lex.yy.c      **** 			while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 467              		.loc 1 708 53
 468 01ac 3945FC   		cmpl	%eax, -4(%rbp)
 469 01af 759A     		jne	.L11
 713:lex.yy.c      **** 					yy_c = yy_meta[yy_c];
 714:lex.yy.c      **** 				}
 470              		.loc 1 714 37
 471 01b1 8B45FC   		movl	-4(%rbp), %eax
 472 01b4 4898     		cltq
 473 01b6 488D1400 		leaq	(%rax,%rax), %rdx
 474 01ba 488D0560 		leaq	yy_base(%rip), %rax
 474      010000
 475 01c1 0FB70402 		movzwl	(%rdx,%rax), %eax
 476 01c5 0FBFD0   		movswl	%ax, %edx
 477              		.loc 1 714 56
 478 01c8 0FB645E3 		movzbl	-29(%rbp), %eax
 479 01cc 01D0     		addl	%edx, %eax
 480              		.loc 1 714 29
 481 01ce 4898     		cltq
 482 01d0 488D1400 		leaq	(%rax,%rax), %rdx
 483 01d4 488D05E0 		leaq	yy_nxt(%rip), %rax
 483      010000
 484 01db 0FB70402 		movzwl	(%rdx,%rax), %eax
 485              		.loc 1 714 21
 486 01df 98       		cwtl
 487 01e0 8945FC   		movl	%eax, -4(%rbp)
 715:lex.yy.c      **** 			yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
 488              		.loc 1 715 4
 489 01e3 488345F0 		addq	$1, -16(%rbp)
 489      01
 490              	.LBE2:
 716:lex.yy.c      **** 			++yy_cp;
 717:lex.yy.c      **** 			}
 491              		.loc 1 717 18
 492 01e8 8B45FC   		movl	-4(%rbp), %eax
 493 01eb 4898     		cltq
 494 01ed 488D1400 		leaq	(%rax,%rax), %rdx
 495 01f1 488D0560 		leaq	yy_base(%rip), %rax
 495      010000
 496 01f8 0FB70402 		movzwl	(%rdx,%rax), %eax
 497              		.loc 1 717 37
 498 01fc 6683F828 		cmpw	$40, %ax
 499 0200 0F85FCFE 		jne	.L12
 499      FFFF
 718:lex.yy.c      **** 		while ( yy_base[yy_current_state] != 40 );
 719:lex.yy.c      **** 
 500              		.loc 1 719 1
 501 0206 90       		nop
 502              	.L13:
 720:lex.yy.c      **** yy_find_action:
 503              		.loc 1 720 21
 504 0207 8B45FC   		movl	-4(%rbp), %eax
 505 020a 4898     		cltq
 506 020c 488D1400 		leaq	(%rax,%rax), %rdx
 507 0210 488D0500 		leaq	yy_accept(%rip), %rax
 507      000000
 508 0217 0FB70402 		movzwl	(%rdx,%rax), %eax
 509              		.loc 1 720 10
 510 021b 98       		cwtl
 511 021c 8945E4   		movl	%eax, -28(%rbp)
 721:lex.yy.c      **** 		yy_act = yy_accept[yy_current_state];
 512              		.loc 1 721 6
 513 021f 837DE400 		cmpl	$0, -28(%rbp)
 514 0223 752C     		jne	.L14
 722:lex.yy.c      **** 		if ( yy_act == 0 )
 723:lex.yy.c      **** 			{ /* have to back up */
 515              		.loc 1 723 10
 516 0225 488B0570 		movq	yy_last_accepting_cpos(%rip), %rax
 516      000000
 517 022c 488945F0 		movq	%rax, -16(%rbp)
 724:lex.yy.c      **** 			yy_cp = (yy_last_accepting_cpos);
 518              		.loc 1 724 21
 519 0230 8B056C00 		movl	yy_last_accepting_state(%rip), %eax
 519      0000
 520 0236 8945FC   		movl	%eax, -4(%rbp)
 725:lex.yy.c      **** 			yy_current_state = (yy_last_accepting_state);
 521              		.loc 1 725 22
 522 0239 8B45FC   		movl	-4(%rbp), %eax
 523 023c 4898     		cltq
 524 023e 488D1400 		leaq	(%rax,%rax), %rdx
 525 0242 488D0500 		leaq	yy_accept(%rip), %rax
 525      000000
 526 0249 0FB70402 		movzwl	(%rdx,%rax), %eax
 527              		.loc 1 725 11
 528 024d 98       		cwtl
 529 024e 8945E4   		movl	%eax, -28(%rbp)
 530              	.L14:
 726:lex.yy.c      **** 			yy_act = yy_accept[yy_current_state];
 727:lex.yy.c      **** 			}
 728:lex.yy.c      **** 
 531              		.loc 1 728 3
 532 0251 488B45E8 		movq	-24(%rbp), %rax
 533 0255 48890520 		movq	%rax, yytext(%rip)
 533      000000
 534 025c 488B45F0 		movq	-16(%rbp), %rax
 535 0260 482B45E8 		subq	-24(%rbp), %rax
 536 0264 89050000 		movl	%eax, yyleng(%rip)
 536      0000
 537 026a 488B45F0 		movq	-16(%rbp), %rax
 538 026e 0FB600   		movzbl	(%rax), %eax
 539 0271 88055000 		movb	%al, yy_hold_char(%rip)
 539      0000
 540 0277 488B45F0 		movq	-16(%rbp), %rax
 541 027b C60000   		movb	$0, (%rax)
 542 027e 488B45F0 		movq	-16(%rbp), %rax
 543 0282 48890558 		movq	%rax, yy_c_buf_p(%rip)
 543      000000
 544              	.L15:
 729:lex.yy.c      **** 		YY_DO_BEFORE_ACTION;
 730:lex.yy.c      **** 
 731:lex.yy.c      **** do_action:	/* This label is used only to access EOF actions. */
 732:lex.yy.c      **** 
 545              		.loc 1 732 3
 546 0289 837DE408 		cmpl	$8, -28(%rbp)
 547 028d 0F87C403 		ja	.L16
 547      0000
 548 0293 8B45E4   		movl	-28(%rbp), %eax
 549 0296 488D1485 		leaq	0(,%rax,4), %rdx
 549      00000000 
 550 029e 488D056C 		leaq	.L18(%rip), %rax
 550      030000
 551 02a5 8B0402   		movl	(%rdx,%rax), %eax
 552 02a8 4898     		cltq
 553 02aa 488D156C 		leaq	.L18(%rip), %rdx
 553      030000
 554 02b1 4801D0   		addq	%rdx, %rax
 555 02b4 FFE0     		jmp	*%rax
 556              		.section .rdata,"dr"
 557 036b 00       		.align 4
 558              	.L18:
 559 036c BA020000 		.long	.L26-.L18
 560 0370 E4020000 		.long	.L25-.L18
 561 0374 3E030000 		.long	.L24-.L18
 562 0378 98030000 		.long	.L23-.L18
 563 037c 7A060000 		.long	.L38-.L18
 564 0380 B9030000 		.long	.L21-.L18
 565 0384 E0030000 		.long	.L20-.L18
 566 0388 1B040000 		.long	.L19-.L18
 567 038c 15040000 		.long	.L17-.L18
 568              		.text
 569              	.L26:
 733:lex.yy.c      **** 		switch ( yy_act )
 734:lex.yy.c      **** 	{ /* beginning of action switch */
 735:lex.yy.c      **** 			case 0: /* must back up */
 736:lex.yy.c      **** 			/* undo the effects of YY_DO_BEFORE_ACTION */
 570              		.loc 1 736 11
 571 02b6 0FB61550 		movzbl	yy_hold_char(%rip), %edx
 571      000000
 572 02bd 488B45F0 		movq	-16(%rbp), %rax
 573 02c1 8810     		movb	%dl, (%rax)
 737:lex.yy.c      **** 			*yy_cp = (yy_hold_char);
 574              		.loc 1 737 10
 575 02c3 488B0570 		movq	yy_last_accepting_cpos(%rip), %rax
 575      000000
 576 02ca 488945F0 		movq	%rax, -16(%rbp)
 738:lex.yy.c      **** 			yy_cp = (yy_last_accepting_cpos);
 577              		.loc 1 738 21
 578 02ce 8B056C00 		movl	yy_last_accepting_state(%rip), %eax
 578      0000
 579 02d4 8945FC   		movl	%eax, -4(%rbp)
 739:lex.yy.c      **** 			yy_current_state = (yy_last_accepting_state);
 580              		.loc 1 739 4
 581 02d7 E92BFFFF 		jmp	.L13
 581      FF
 582              	.L25:
 583              		.file 2 "custom_op.l"
   1:custom_op.l   **** %{
   2:custom_op.l   **** #include <stdio.h>
   3:custom_op.l   **** #include <stdlib.h>
   4:custom_op.l   **** #include "custom_op.h"
   5:custom_op.l   **** 
   6:custom_op.l   **** double xVal = 0, yVal = 0;
   7:custom_op.l   **** %}
   8:custom_op.l   **** 
   9:custom_op.l   **** %%
  10:custom_op.l   **** 
  11:custom_op.l   **** x[0-9]+          { sscanf(yytext + 1, "%lf", &xVal); printf("Token: XVAL (x=%.2f)\n", xVal); return
 584              		.loc 2 11 3
 585 02dc 488B0520 		movq	yytext(%rip), %rax
 585      000000
 586              		.loc 2 11 17
 587 02e3 4883C001 		addq	$1, %rax
 588              		.loc 2 11 3
 589 02e7 4C8D0528 		leaq	xVal(%rip), %r8
 589      000000
 590 02ee 488D15D8 		leaq	.LC0(%rip), %rdx
 590      020000
 591 02f5 4889C1   		movq	%rax, %rcx
 592 02f8 E8000000 		call	__mingw_sscanf
 592      00
 593              		.loc 2 11 37 discriminator 1
 594 02fd F20F1005 		movsd	xVal(%rip), %xmm0
 594      28000000 
 595 0305 660F28C8 		movapd	%xmm0, %xmm1
 596 0309 660F28C1 		movapd	%xmm1, %xmm0
 597 030d 66480F7E 		movq	%xmm1, %rax
 597      C8
 598 0312 660F28C8 		movapd	%xmm0, %xmm1
 599 0316 4889C2   		movq	%rax, %rdx
 600 0319 488D05DC 		leaq	.LC1(%rip), %rax
 600      020000
 601 0320 4889C1   		movq	%rax, %rcx
 602 0323 E8000000 		call	__mingw_printf
 602      00
 603              		.loc 2 11 84 discriminator 2
 604 0328 B8010000 		movl	$1, %eax
 604      00
 605              		.loc 2 11 84 is_stmt 0
 606 032d E9400300 		jmp	.L27
 606      00
 607              	.L24:
  12:custom_op.l   **** y[0-9]+          { sscanf(yytext + 1, "%lf", &yVal); printf("Token: YVAL (y=%.2f)\n", yVal); return
 608              		.loc 2 12 3 is_stmt 1
 609 0332 488B0520 		movq	yytext(%rip), %rax
 609      000000
 610              		.loc 2 12 17
 611 0339 4883C001 		addq	$1, %rax
 612              		.loc 2 12 3
 613 033d 4C8D0530 		leaq	yVal(%rip), %r8
 613      000000
 614 0344 488D15D8 		leaq	.LC0(%rip), %rdx
 614      020000
 615 034b 4889C1   		movq	%rax, %rcx
 616 034e E8000000 		call	__mingw_sscanf
 616      00
 617              		.loc 2 12 37 discriminator 1
 618 0353 F20F1005 		movsd	yVal(%rip), %xmm0
 618      30000000 
 619 035b 660F28C8 		movapd	%xmm0, %xmm1
 620 035f 660F28C1 		movapd	%xmm1, %xmm0
 621 0363 66480F7E 		movq	%xmm1, %rax
 621      C8
 622 0368 660F28C8 		movapd	%xmm0, %xmm1
 623 036c 4889C2   		movq	%rax, %rdx
 624 036f 488D05F2 		leaq	.LC2(%rip), %rax
 624      020000
 625 0376 4889C1   		movq	%rax, %rcx
 626 0379 E8000000 		call	__mingw_printf
 626      00
 627              		.loc 2 12 84 discriminator 2
 628 037e B8020000 		movl	$2, %eax
 628      00
 629              		.loc 2 12 84 is_stmt 0
 630 0383 E9EA0200 		jmp	.L27
 630      00
 631              	.L23:
  13:custom_op.l   **** custom_operation { printf("Token: CUSTOM_OP\n"); return CUSTOM_OP; }
 632              		.loc 2 13 3 is_stmt 1
 633 0388 488D0508 		leaq	.LC3(%rip), %rax
 633      030000
 634 038f 4889C1   		movq	%rax, %rcx
 635 0392 E8000000 		call	puts
 635      00
 636              		.loc 2 13 40 discriminator 1
 637 0397 B8030000 		movl	$3, %eax
 637      00
 638              		.loc 2 13 40 is_stmt 0
 639 039c E9D10200 		jmp	.L27
 639      00
 640              	.L21:
  14:custom_op.l   **** 
  15:custom_op.l   **** [ \t\n]          ; // Ignore whitespace
  16:custom_op.l   **** 
  17:custom_op.l   **** .                { printf("Unexpected character: %s\n", yytext); exit(1); }
 641              		.loc 2 17 3 is_stmt 1
 642 03a1 488B0520 		movq	yytext(%rip), %rax
 642      000000
 643 03a8 4889C2   		movq	%rax, %rdx
 644 03ab 488D0519 		leaq	.LC4(%rip), %rax
 644      030000
 645 03b2 4889C1   		movq	%rax, %rcx
 646 03b5 E8000000 		call	__mingw_printf
 646      00
 647              		.loc 2 17 49 discriminator 1
 648 03ba B9010000 		movl	$1, %ecx
 648      00
 649 03bf E8000000 		call	exit
 649      00
 650              	.L20:
  18:custom_op.l   **** 
  19:custom_op.l   **** %%
 651              		.loc 2 19 1
 652 03c4 488B0D10 		movq	yyout(%rip), %rcx
 652      000000
 653 03cb 8B050000 		movl	yyleng(%rip), %eax
 653      0000
 654 03d1 4863D0   		movslq	%eax, %rdx
 655 03d4 488B0520 		movq	yytext(%rip), %rax
 655      000000
 656 03db 4989C9   		movq	%rcx, %r9
 657 03de 41B80100 		movl	$1, %r8d
 657      0000
 658 03e4 4889C1   		movq	%rax, %rcx
 659 03e7 E8000000 		call	fwrite
 659      00
  20:custom_op.l   **** 
 660              		.loc 2 20 2
 661 03ec E97C0200 		jmp	.L28
 661      00
 662              	.L17:
 740:lex.yy.c      **** 			goto yy_find_action;
 741:lex.yy.c      **** 
 742:lex.yy.c      **** case 1:
 743:lex.yy.c      **** YY_RULE_SETUP
 744:lex.yy.c      **** #line 11 "custom_op.l"
 745:lex.yy.c      **** { sscanf(yytext + 1, "%lf", &xVal); printf("Token: XVAL (x=%.2f)\n", xVal); return XVAL; }
 746:lex.yy.c      **** 	YY_BREAK
 747:lex.yy.c      **** case 2:
 748:lex.yy.c      **** YY_RULE_SETUP
 749:lex.yy.c      **** #line 12 "custom_op.l"
 750:lex.yy.c      **** { sscanf(yytext + 1, "%lf", &yVal); printf("Token: YVAL (y=%.2f)\n", yVal); return YVAL; }
 751:lex.yy.c      **** 	YY_BREAK
 752:lex.yy.c      **** case 3:
 753:lex.yy.c      **** YY_RULE_SETUP
 754:lex.yy.c      **** #line 13 "custom_op.l"
 755:lex.yy.c      **** { printf("Token: CUSTOM_OP\n"); return CUSTOM_OP; }
 756:lex.yy.c      **** 	YY_BREAK
 757:lex.yy.c      **** case 4:
 758:lex.yy.c      **** /* rule 4 can match eol */
 759:lex.yy.c      **** YY_RULE_SETUP
 760:lex.yy.c      **** #line 15 "custom_op.l"
 761:lex.yy.c      **** ; // Ignore whitespace
 762:lex.yy.c      **** 	YY_BREAK
 763:lex.yy.c      **** case 5:
 764:lex.yy.c      **** YY_RULE_SETUP
 765:lex.yy.c      **** #line 17 "custom_op.l"
 766:lex.yy.c      **** { printf("Unexpected character: %s\n", yytext); exit(1); }
 767:lex.yy.c      **** 	YY_BREAK
 768:lex.yy.c      **** case 6:
 769:lex.yy.c      **** YY_RULE_SETUP
 770:lex.yy.c      **** #line 19 "custom_op.l"
 771:lex.yy.c      **** ECHO;
 772:lex.yy.c      **** 	YY_BREAK
 773:lex.yy.c      **** #line 773 "lex.yy.c"
 774:lex.yy.c      **** case YY_STATE_EOF(INITIAL):
 663              		.loc 1 774 2
 664 03f1 B8000000 		movl	$0, %eax
 664      00
 665 03f6 E9770200 		jmp	.L27
 665      00
 666              	.L19:
 667              	.LBB3:
 775:lex.yy.c      **** 	yyterminate();
 776:lex.yy.c      **** 
 777:lex.yy.c      **** 	case YY_END_OF_BUFFER:
 778:lex.yy.c      **** 		{
 779:lex.yy.c      **** 		/* Amount of text matched not including the EOB char. */
 668              		.loc 1 779 48
 669 03fb 488B0520 		movq	yytext(%rip), %rax
 669      000000
 670 0402 488B55F0 		movq	-16(%rbp), %rdx
 671 0406 4829C2   		subq	%rax, %rdx
 672              		.loc 1 779 35
 673 0409 89D0     		movl	%edx, %eax
 674              		.loc 1 779 7
 675 040b 83E801   		subl	$1, %eax
 676 040e 8945DC   		movl	%eax, -36(%rbp)
 780:lex.yy.c      **** 		int yy_amount_of_matched_text = (int) (yy_cp - (yytext_ptr)) - 1;
 781:lex.yy.c      **** 
 782:lex.yy.c      **** 		/* Undo the effects of YY_DO_BEFORE_ACTION. */
 677              		.loc 1 782 10
 678 0411 0FB61550 		movzbl	yy_hold_char(%rip), %edx
 678      000000
 679 0418 488B45F0 		movq	-16(%rbp), %rax
 680 041c 8810     		movb	%dl, (%rax)
 783:lex.yy.c      **** 		*yy_cp = (yy_hold_char);
 784:lex.yy.c      **** 		YY_RESTORE_YY_MORE_OFFSET
 785:lex.yy.c      **** 
 681              		.loc 1 785 8
 682 041e 488B0548 		movq	yy_buffer_stack(%rip), %rax
 682      000000
 683 0425 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 683      000000
 684 042c 48C1E203 		salq	$3, %rdx
 685 0430 4801D0   		addq	%rdx, %rax
 686 0433 488B00   		movq	(%rax), %rax
 687              		.loc 1 785 32
 688 0436 8B4038   		movl	56(%rax), %eax
 689              		.loc 1 785 6
 690 0439 85C0     		testl	%eax, %eax
 691 043b 7562     		jne	.L29
 786:lex.yy.c      **** 		if ( YY_CURRENT_BUFFER_LVALUE->yy_buffer_status == YY_BUFFER_NEW )
 787:lex.yy.c      **** 			{
 788:lex.yy.c      **** 			/* We're scanning a new file or input source.  It's
 789:lex.yy.c      **** 			 * possible that this happened because the user
 790:lex.yy.c      **** 			 * just pointed yyin at a new source and called
 791:lex.yy.c      **** 			 * yylex().  If so, then we have to assure
 792:lex.yy.c      **** 			 * consistency between YY_CURRENT_BUFFER and our
 793:lex.yy.c      **** 			 * globals.  Here is the right place to do so, because
 794:lex.yy.c      **** 			 * this is the first action (other than possibly a
 795:lex.yy.c      **** 			 * back-up) that will match for the new input source.
 796:lex.yy.c      **** 			 */
 692              		.loc 1 796 19
 693 043d 488B0548 		movq	yy_buffer_stack(%rip), %rax
 693      000000
 694 0444 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 694      000000
 695 044b 48C1E203 		salq	$3, %rdx
 696 044f 4801D0   		addq	%rdx, %rax
 697 0452 488B00   		movq	(%rax), %rax
 698              		.loc 1 796 43
 699 0455 8B401C   		movl	28(%rax), %eax
 700              		.loc 1 796 17
 701 0458 89055400 		movl	%eax, yy_n_chars(%rip)
 701      0000
 797:lex.yy.c      **** 			(yy_n_chars) = YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
 702              		.loc 1 797 4
 703 045e 488B0548 		movq	yy_buffer_stack(%rip), %rax
 703      000000
 704 0465 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 704      000000
 705 046c 48C1E203 		salq	$3, %rdx
 706 0470 4801D0   		addq	%rdx, %rax
 707 0473 488B00   		movq	(%rax), %rax
 708              		.loc 1 797 44
 709 0476 488B1508 		movq	yyin(%rip), %rdx
 709      000000
 710 047d 488910   		movq	%rdx, (%rax)
 798:lex.yy.c      **** 			YY_CURRENT_BUFFER_LVALUE->yy_input_file = yyin;
 711              		.loc 1 798 4
 712 0480 488B0548 		movq	yy_buffer_stack(%rip), %rax
 712      000000
 713 0487 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 713      000000
 714 048e 48C1E203 		salq	$3, %rdx
 715 0492 4801D0   		addq	%rdx, %rax
 716 0495 488B00   		movq	(%rax), %rax
 717              		.loc 1 798 47
 718 0498 C7403801 		movl	$1, 56(%rax)
 718      000000
 719              	.L29:
 799:lex.yy.c      **** 			YY_CURRENT_BUFFER_LVALUE->yy_buffer_status = YY_BUFFER_NORMAL;
 800:lex.yy.c      **** 			}
 801:lex.yy.c      **** 
 802:lex.yy.c      **** 		/* Note that here we test for yy_c_buf_p "<=" to the position
 803:lex.yy.c      **** 		 * of the first EOB in the buffer, since yy_c_buf_p will
 804:lex.yy.c      **** 		 * already have been incremented past the NUL character
 805:lex.yy.c      **** 		 * (since all states make transitions on EOB to the
 806:lex.yy.c      **** 		 * end-of-buffer state).  Contrast this with the test
 807:lex.yy.c      **** 		 * in input().
 808:lex.yy.c      **** 		 */
 720              		.loc 1 808 25
 721 049f 488B0548 		movq	yy_buffer_stack(%rip), %rax
 721      000000
 722 04a6 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 722      000000
 723 04ad 48C1E203 		salq	$3, %rdx
 724 04b1 4801D0   		addq	%rdx, %rax
 725 04b4 488B00   		movq	(%rax), %rax
 726              		.loc 1 808 49
 727 04b7 488B5008 		movq	8(%rax), %rdx
 728              		.loc 1 808 24
 729 04bb 8B055400 		movl	yy_n_chars(%rip), %eax
 729      0000
 730 04c1 4898     		cltq
 731 04c3 4801C2   		addq	%rax, %rdx
 732              		.loc 1 808 21
 733 04c6 488B0558 		movq	yy_c_buf_p(%rip), %rax
 733      000000
 734              		.loc 1 808 6
 735 04cd 4839C2   		cmpq	%rax, %rdx
 736 04d0 7274     		jb	.L30
 737              	.LBB4:
 809:lex.yy.c      **** 		if ( (yy_c_buf_p) <= &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars)] )
 810:lex.yy.c      **** 			{ /* This was really a NUL. */
 811:lex.yy.c      **** 			yy_state_type yy_next_state;
 812:lex.yy.c      **** 
 738              		.loc 1 812 32
 739 04d2 488B1520 		movq	yytext(%rip), %rdx
 739      000000
 740 04d9 8B45DC   		movl	-36(%rbp), %eax
 741 04dc 4898     		cltq
 742 04de 4801D0   		addq	%rdx, %rax
 743              		.loc 1 812 17
 744 04e1 48890558 		movq	%rax, yy_c_buf_p(%rip)
 744      000000
 813:lex.yy.c      **** 			(yy_c_buf_p) = (yytext_ptr) + yy_amount_of_matched_text;
 814:lex.yy.c      **** 
 745              		.loc 1 814 23
 746 04e8 E8E80700 		call	yy_get_previous_state
 746      00
 747 04ed 8945FC   		movl	%eax, -4(%rbp)
 815:lex.yy.c      **** 			yy_current_state = yy_get_previous_state(  );
 816:lex.yy.c      **** 
 817:lex.yy.c      **** 			/* Okay, we're now positioned to make the NUL
 818:lex.yy.c      **** 			 * transition.  We couldn't have
 819:lex.yy.c      **** 			 * yy_get_previous_state() go ahead and do it
 820:lex.yy.c      **** 			 * for us because it doesn't know how to deal
 821:lex.yy.c      **** 			 * with the possibility of jamming (and we don't
 822:lex.yy.c      **** 			 * want to build jamming into it because then it
 823:lex.yy.c      **** 			 * will run more slowly).
 824:lex.yy.c      **** 			 */
 825:lex.yy.c      **** 
 748              		.loc 1 825 20
 749 04f0 8B45FC   		movl	-4(%rbp), %eax
 750 04f3 89C1     		movl	%eax, %ecx
 751 04f5 E80E0900 		call	yy_try_NUL_trans
 751      00
 752 04fa 8945D8   		movl	%eax, -40(%rbp)
 826:lex.yy.c      **** 			yy_next_state = yy_try_NUL_trans( yy_current_state );
 827:lex.yy.c      **** 
 753              		.loc 1 827 10
 754 04fd 488B0520 		movq	yytext(%rip), %rax
 754      000000
 755 0504 488945E8 		movq	%rax, -24(%rbp)
 828:lex.yy.c      **** 			yy_bp = (yytext_ptr) + YY_MORE_ADJ;
 829:lex.yy.c      **** 
 756              		.loc 1 829 7
 757 0508 837DD800 		cmpl	$0, -40(%rbp)
 758 050c 7428     		je	.L31
 830:lex.yy.c      **** 			if ( yy_next_state )
 831:lex.yy.c      **** 				{
 832:lex.yy.c      **** 				/* Consume the NUL. */
 759              		.loc 1 832 13
 760 050e 488B0558 		movq	yy_c_buf_p(%rip), %rax
 760      000000
 761 0515 4883C001 		addq	$1, %rax
 762              		.loc 1 832 11
 763 0519 48890558 		movq	%rax, yy_c_buf_p(%rip)
 763      000000
 764 0520 488B0558 		movq	yy_c_buf_p(%rip), %rax
 764      000000
 765 0527 488945F0 		movq	%rax, -16(%rbp)
 833:lex.yy.c      **** 				yy_cp = ++(yy_c_buf_p);
 766              		.loc 1 833 22
 767 052b 8B45D8   		movl	-40(%rbp), %eax
 768 052e 8945FC   		movl	%eax, -4(%rbp)
 834:lex.yy.c      **** 				yy_current_state = yy_next_state;
 769              		.loc 1 834 5
 770 0531 E9CCFBFF 		jmp	.L12
 770      FF
 771              	.L31:
 835:lex.yy.c      **** 				goto yy_match;
 836:lex.yy.c      **** 				}
 837:lex.yy.c      **** 
 838:lex.yy.c      **** 			else
 839:lex.yy.c      **** 				{
 772              		.loc 1 839 11
 773 0536 488B0558 		movq	yy_c_buf_p(%rip), %rax
 773      000000
 774 053d 488945F0 		movq	%rax, -16(%rbp)
 840:lex.yy.c      **** 				yy_cp = (yy_c_buf_p);
 775              		.loc 1 840 5
 776 0541 E9C1FCFF 		jmp	.L13
 776      FF
 777              	.L30:
 778              	.LBE4:
 841:lex.yy.c      **** 				goto yy_find_action;
 842:lex.yy.c      **** 				}
 843:lex.yy.c      **** 			}
 844:lex.yy.c      **** 
 779              		.loc 1 844 17
 780 0546 E82E0100 		call	yy_get_next_buffer
 780      00
 781              		.loc 1 844 8 discriminator 1
 782 054b 83F802   		cmpl	$2, %eax
 783 054e 0F84AF00 		je	.L32
 783      0000
 784 0554 83F802   		cmpl	$2, %eax
 785 0557 0F8F0F01 		jg	.L39
 785      0000
 786 055d 85C0     		testl	%eax, %eax
 787 055f 7469     		je	.L34
 788 0561 83F801   		cmpl	$1, %eax
 789 0564 0F850201 		jne	.L39
 789      0000
 845:lex.yy.c      **** 		else switch ( yy_get_next_buffer(  ) )
 846:lex.yy.c      **** 			{
 847:lex.yy.c      **** 			case EOB_ACT_END_OF_FILE:
 848:lex.yy.c      **** 				{
 790              		.loc 1 848 35
 791 056a C7056400 		movl	$0, yy_did_buffer_switch_on_eof(%rip)
 791      00000000 
 791      0000
 849:lex.yy.c      **** 				(yy_did_buffer_switch_on_eof) = 0;
 850:lex.yy.c      **** 
 792              		.loc 1 850 10
 793 0574 E8FA1800 		call	yywrap
 793      00
 794              		.loc 1 850 8 discriminator 1
 795 0579 85C0     		testl	%eax, %eax
 796 057b 742B     		je	.L35
 851:lex.yy.c      **** 				if ( yywrap(  ) )
 852:lex.yy.c      **** 					{
 853:lex.yy.c      **** 					/* Note: because we've taken care in
 854:lex.yy.c      **** 					 * yy_get_next_buffer() to have set up
 855:lex.yy.c      **** 					 * yytext, we can now set up
 856:lex.yy.c      **** 					 * yy_c_buf_p so that if some total
 857:lex.yy.c      **** 					 * hoser (like flex itself) wants to
 858:lex.yy.c      **** 					 * call the scanner after we return the
 859:lex.yy.c      **** 					 * YY_NULL, it'll still work - another
 860:lex.yy.c      **** 					 * YY_NULL will get returned.
 861:lex.yy.c      **** 					 */
 797              		.loc 1 861 19
 798 057d 488B0520 		movq	yytext(%rip), %rax
 798      000000
 799 0584 48890558 		movq	%rax, yy_c_buf_p(%rip)
 799      000000
 862:lex.yy.c      **** 					(yy_c_buf_p) = (yytext_ptr) + YY_MORE_ADJ;
 863:lex.yy.c      **** 
 800              		.loc 1 863 15
 801 058b 8B056400 		movl	yy_start(%rip), %eax
 801      0000
 802 0591 83E801   		subl	$1, %eax
 803 0594 89C2     		movl	%eax, %edx
 804 0596 C1EA1F   		shrl	$31, %edx
 805 0599 01D0     		addl	%edx, %eax
 806 059b D1F8     		sarl	%eax
 807              		.loc 1 863 13
 808 059d 83C008   		addl	$8, %eax
 809 05a0 8945E4   		movl	%eax, -28(%rbp)
 864:lex.yy.c      **** 					yy_act = YY_STATE_EOF(YY_START);
 810              		.loc 1 864 6
 811 05a3 E9E1FCFF 		jmp	.L15
 811      FF
 812              	.L35:
 865:lex.yy.c      **** 					goto do_action;
 866:lex.yy.c      **** 					}
 867:lex.yy.c      **** 
 868:lex.yy.c      **** 				else
 869:lex.yy.c      **** 					{
 813              		.loc 1 869 11
 814 05a8 8B056800 		movl	yy_did_buffer_switch_on_eof(%rip), %eax
 814      0000
 815              		.loc 1 869 9
 816 05ae 85C0     		testl	%eax, %eax
 817 05b0 0F859E00 		jne	.L40
 817      0000
 870:lex.yy.c      **** 					if ( ! (yy_did_buffer_switch_on_eof) )
 818              		.loc 1 870 7
 819 05b6 488B0508 		movq	yyin(%rip), %rax
 819      000000
 820 05bd 4889C1   		movq	%rax, %rcx
 821 05c0 E85F0C00 		call	yyrestart
 821      00
 871:lex.yy.c      **** 						YY_NEW_FILE;
 872:lex.yy.c      **** 					}
 822              		.loc 1 872 5
 823 05c5 E98A0000 		jmp	.L40
 823      00
 824              	.L34:
 873:lex.yy.c      **** 				break;
 874:lex.yy.c      **** 				}
 875:lex.yy.c      **** 
 876:lex.yy.c      **** 			case EOB_ACT_CONTINUE_SCAN:
 877:lex.yy.c      **** 				(yy_c_buf_p) =
 825              		.loc 1 877 19
 826 05ca 488B1520 		movq	yytext(%rip), %rdx
 826      000000
 827 05d1 8B45DC   		movl	-36(%rbp), %eax
 828 05d4 4898     		cltq
 829 05d6 4801D0   		addq	%rdx, %rax
 876:lex.yy.c      **** 				(yy_c_buf_p) =
 830              		.loc 1 876 18
 831 05d9 48890558 		movq	%rax, yy_c_buf_p(%rip)
 831      000000
 878:lex.yy.c      **** 					(yytext_ptr) + yy_amount_of_matched_text;
 879:lex.yy.c      **** 
 832              		.loc 1 879 24
 833 05e0 E8F00600 		call	yy_get_previous_state
 833      00
 834 05e5 8945FC   		movl	%eax, -4(%rbp)
 880:lex.yy.c      **** 				yy_current_state = yy_get_previous_state(  );
 881:lex.yy.c      **** 
 835              		.loc 1 881 11
 836 05e8 488B0558 		movq	yy_c_buf_p(%rip), %rax
 836      000000
 837 05ef 488945F0 		movq	%rax, -16(%rbp)
 882:lex.yy.c      **** 				yy_cp = (yy_c_buf_p);
 838              		.loc 1 882 11
 839 05f3 488B0520 		movq	yytext(%rip), %rax
 839      000000
 840 05fa 488945E8 		movq	%rax, -24(%rbp)
 883:lex.yy.c      **** 				yy_bp = (yytext_ptr) + YY_MORE_ADJ;
 841              		.loc 1 883 5
 842 05fe E9FFFAFF 		jmp	.L12
 842      FF
 843              	.L32:
 884:lex.yy.c      **** 				goto yy_match;
 885:lex.yy.c      **** 
 886:lex.yy.c      **** 			case EOB_ACT_LAST_MATCH:
 887:lex.yy.c      **** 				(yy_c_buf_p) =
 844              		.loc 1 887 6
 845 0603 488B0548 		movq	yy_buffer_stack(%rip), %rax
 845      000000
 846 060a 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 846      000000
 847 0611 48C1E203 		salq	$3, %rdx
 848 0615 4801D0   		addq	%rdx, %rax
 849 0618 488B00   		movq	(%rax), %rax
 850              		.loc 1 887 30
 851 061b 488B5008 		movq	8(%rax), %rdx
 852              		.loc 1 887 5
 853 061f 8B055400 		movl	yy_n_chars(%rip), %eax
 853      0000
 854 0625 4898     		cltq
 855 0627 4801D0   		addq	%rdx, %rax
 886:lex.yy.c      **** 				(yy_c_buf_p) =
 856              		.loc 1 886 18
 857 062a 48890558 		movq	%rax, yy_c_buf_p(%rip)
 857      000000
 888:lex.yy.c      **** 				&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars)];
 889:lex.yy.c      **** 
 858              		.loc 1 889 24
 859 0631 E89F0600 		call	yy_get_previous_state
 859      00
 860 0636 8945FC   		movl	%eax, -4(%rbp)
 890:lex.yy.c      **** 				yy_current_state = yy_get_previous_state(  );
 891:lex.yy.c      **** 
 861              		.loc 1 891 11
 862 0639 488B0558 		movq	yy_c_buf_p(%rip), %rax
 862      000000
 863 0640 488945F0 		movq	%rax, -16(%rbp)
 892:lex.yy.c      **** 				yy_cp = (yy_c_buf_p);
 864              		.loc 1 892 11
 865 0644 488B0520 		movq	yytext(%rip), %rax
 865      000000
 866 064b 488945E8 		movq	%rax, -24(%rbp)
 893:lex.yy.c      **** 				yy_bp = (yytext_ptr) + YY_MORE_ADJ;
 867              		.loc 1 893 5
 868 064f E9B3FBFF 		jmp	.L13
 868      FF
 869              	.L40:
 872:lex.yy.c      **** 				break;
 870              		.loc 1 872 5
 871 0654 90       		nop
 894:lex.yy.c      **** 				goto yy_find_action;
 895:lex.yy.c      **** 			}
 872              		.loc 1 895 3
 873 0655 EB15     		jmp	.L39
 874              	.L16:
 875              	.LBE3:
 896:lex.yy.c      **** 		break;
 897:lex.yy.c      **** 		}
 898:lex.yy.c      **** 
 899:lex.yy.c      **** 	default:
 876              		.loc 1 899 3
 877 0657 488D0538 		leaq	.LC5(%rip), %rax
 877      030000
 878 065e 4889C1   		movq	%rax, %rcx
 879 0661 E8BD1500 		call	yy_fatal_error
 879      00
 880              	.L38:
  16:custom_op.l   **** .                { printf("Unexpected character: %s\n", yytext); exit(1); }
 881              		.loc 2 16 2
 882 0666 90       		nop
 883 0667 E96DFAFF 		jmp	.L37
 883      FF
 884              	.L39:
 885              	.LBB5:
 895:lex.yy.c      **** 		break;
 886              		.loc 1 895 3
 887 066c 90       		nop
 888              	.L28:
 889              	.LBE5:
 688:lex.yy.c      **** 		yy_cp = (yy_c_buf_p);
 890              		.loc 1 688 9
 891 066d E967FAFF 		jmp	.L37
 891      FF
 892              	.L27:
 900:lex.yy.c      **** 		YY_FATAL_ERROR(
 901:lex.yy.c      **** 			"fatal flex scanner internal error--no action found" );
 902:lex.yy.c      **** 	} /* end of action switch */
 903:lex.yy.c      **** 		} /* end of scanning one token */
 904:lex.yy.c      **** 	} /* end of user's declarations */
 893              		.loc 1 904 1
 894 0672 4883C458 		addq	$88, %rsp
 895 0676 5B       		popq	%rbx
 896              		.cfi_restore 3
 897 0677 5D       		popq	%rbp
 898              		.cfi_restore 6
 899              		.cfi_def_cfa 7, -72
 900 0678 C3       		ret
 901              		.cfi_endproc
 902              	.LFE17:
 903              		.seh_endproc
 904              		.section .rdata,"dr"
 905              		.align 8
 906              	.LC6:
 907 0390 66617461 		.ascii "fatal flex scanner internal error--end of buffer missed\0"
 907      6C20666C 
 907      65782073 
 907      63616E6E 
 907      65722069 
 908              		.align 8
 909              	.LC7:
 910 03c8 66617461 		.ascii "fatal error - scanner input buffer overflow\0"
 910      6C206572 
 910      726F7220 
 910      2D207363 
 910      616E6E65 
 911              	.LC8:
 912 03f4 696E7075 		.ascii "input in flex scanner failed\0"
 912      7420696E 
 912      20666C65 
 912      78207363 
 912      616E6E65 
 913 0411 00000000 		.align 8
 913      000000
 914              	.LC9:
 915 0418 6F757420 		.ascii "out of dynamic memory in yy_get_next_buffer()\0"
 915      6F662064 
 915      796E616D 
 915      6963206D 
 915      656D6F72 
 916              		.text
 918              		.seh_proc	yy_get_next_buffer
 919              	yy_get_next_buffer:
 920              	.LFB18:
 905:lex.yy.c      **** } /* end of yylex */
 906:lex.yy.c      **** 
 907:lex.yy.c      **** /* yy_get_next_buffer - try to read in a new buffer
 908:lex.yy.c      ****  *
 909:lex.yy.c      ****  * Returns a code representing an action:
 910:lex.yy.c      ****  *	EOB_ACT_LAST_MATCH -
 911:lex.yy.c      ****  *	EOB_ACT_CONTINUE_SCAN - continue scanning from current position
 912:lex.yy.c      ****  *	EOB_ACT_END_OF_FILE - end of file
 913:lex.yy.c      ****  */
 914:lex.yy.c      **** static int yy_get_next_buffer (void)
 921              		.loc 1 914 1
 922              		.cfi_startproc
 923 0679 55       		pushq	%rbp
 924              		.seh_pushreg	%rbp
 925              		.cfi_def_cfa_offset 16
 926              		.cfi_offset 6, -16
 927 067a 53       		pushq	%rbx
 928              		.seh_pushreg	%rbx
 929              		.cfi_def_cfa_offset 24
 930              		.cfi_offset 3, -24
 931 067b 4883EC68 		subq	$104, %rsp
 932              		.seh_stackalloc	104
 933              		.cfi_def_cfa_offset 128
 934 067f 488D6C24 		leaq	96(%rsp), %rbp
 934      60
 935              		.seh_setframe	%rbp, 96
 936              		.cfi_def_cfa 6, 32
 937              		.seh_endprologue
 915:lex.yy.c      **** {
 938              		.loc 1 915 19
 939 0684 488B0548 		movq	yy_buffer_stack(%rip), %rax
 939      000000
 940 068b 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 940      000000
 941 0692 48C1E203 		salq	$3, %rdx
 942 0696 4801D0   		addq	%rdx, %rax
 943 0699 488B00   		movq	(%rax), %rax
 944              		.loc 1 915 12
 945 069c 488B4008 		movq	8(%rax), %rax
 946 06a0 488945F8 		movq	%rax, -8(%rbp)
 916:lex.yy.c      ****     	char *dest = YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
 947              		.loc 1 916 8
 948 06a4 488B0520 		movq	yytext(%rip), %rax
 948      000000
 949 06ab 488945F0 		movq	%rax, -16(%rbp)
 917:lex.yy.c      **** 	char *source = (yytext_ptr);
 918:lex.yy.c      **** 	int number_to_move, i;
 919:lex.yy.c      **** 	int ret_val;
 920:lex.yy.c      **** 
 950              		.loc 1 920 23
 951 06af 488B0548 		movq	yy_buffer_stack(%rip), %rax
 951      000000
 952 06b6 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 952      000000
 953 06bd 48C1E203 		salq	$3, %rdx
 954 06c1 4801D0   		addq	%rdx, %rax
 955 06c4 488B00   		movq	(%rax), %rax
 956              		.loc 1 920 47
 957 06c7 488B4008 		movq	8(%rax), %rax
 958              		.loc 1 920 58
 959 06cb 8B155400 		movl	yy_n_chars(%rip), %edx
 959      0000
 960 06d1 4863D2   		movslq	%edx, %rdx
 961 06d4 4883C201 		addq	$1, %rdx
 962              		.loc 1 920 22
 963 06d8 4801C2   		addq	%rax, %rdx
 964              		.loc 1 920 20
 965 06db 488B0558 		movq	yy_c_buf_p(%rip), %rax
 965      000000
 966              		.loc 1 920 5
 967 06e2 4839C2   		cmpq	%rax, %rdx
 968 06e5 730F     		jnb	.L42
 921:lex.yy.c      **** 	if ( (yy_c_buf_p) > &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars) + 1] )
 969              		.loc 1 921 3
 970 06e7 488D0590 		leaq	.LC6(%rip), %rax
 970      030000
 971 06ee 4889C1   		movq	%rax, %rcx
 972 06f1 E82D1500 		call	yy_fatal_error
 972      00
 973              	.L42:
 922:lex.yy.c      **** 		YY_FATAL_ERROR(
 923:lex.yy.c      **** 		"fatal flex scanner internal error--end of buffer missed" );
 924:lex.yy.c      **** 
 974              		.loc 1 924 7
 975 06f6 488B0548 		movq	yy_buffer_stack(%rip), %rax
 975      000000
 976 06fd 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 976      000000
 977 0704 48C1E203 		salq	$3, %rdx
 978 0708 4801D0   		addq	%rdx, %rax
 979 070b 488B00   		movq	(%rax), %rax
 980              		.loc 1 924 31
 981 070e 8B4034   		movl	52(%rax), %eax
 982              		.loc 1 924 5
 983 0711 85C0     		testl	%eax, %eax
 984 0713 752B     		jne	.L43
 925:lex.yy.c      **** 	if ( YY_CURRENT_BUFFER_LVALUE->yy_fill_buffer == 0 )
 926:lex.yy.c      **** 		{ /* Don't try to fill the buffer, so this is an EOF. */
 985              		.loc 1 926 36
 986 0715 488B1558 		movq	yy_c_buf_p(%rip), %rdx
 986      000000
 987 071c 488B0520 		movq	yytext(%rip), %rax
 987      000000
 988 0723 4829C2   		subq	%rax, %rdx
 989              		.loc 1 926 6
 990 0726 4883FA01 		cmpq	$1, %rdx
 991 072a 750A     		jne	.L44
 927:lex.yy.c      **** 		if ( (yy_c_buf_p) - (yytext_ptr) - YY_MORE_ADJ == 1 )
 928:lex.yy.c      **** 			{
 929:lex.yy.c      **** 			/* We matched a single character, the EOB, so
 930:lex.yy.c      **** 			 * treat this as a final EOF.
 931:lex.yy.c      **** 			 */
 992              		.loc 1 931 11
 993 072c B8010000 		movl	$1, %eax
 993      00
 994 0731 E9980500 		jmp	.L45
 994      00
 995              	.L44:
 932:lex.yy.c      **** 			return EOB_ACT_END_OF_FILE;
 933:lex.yy.c      **** 			}
 934:lex.yy.c      **** 
 935:lex.yy.c      **** 		else
 936:lex.yy.c      **** 			{
 937:lex.yy.c      **** 			/* We matched some text prior to the EOB, first
 938:lex.yy.c      **** 			 * process it.
 939:lex.yy.c      **** 			 */
 996              		.loc 1 939 11
 997 0736 B8020000 		movl	$2, %eax
 997      00
 998 073b E98E0500 		jmp	.L45
 998      00
 999              	.L43:
 940:lex.yy.c      **** 			return EOB_ACT_LAST_MATCH;
 941:lex.yy.c      **** 			}
 942:lex.yy.c      **** 		}
 943:lex.yy.c      **** 
 944:lex.yy.c      **** 	/* Try to read more data. */
 945:lex.yy.c      **** 
 946:lex.yy.c      **** 	/* First move last chars to start of buffer. */
 1000              		.loc 1 946 39
 1001 0740 488B1558 		movq	yy_c_buf_p(%rip), %rdx
 1001      000000
 1002 0747 488B0520 		movq	yytext(%rip), %rax
 1002      000000
 1003 074e 4829C2   		subq	%rax, %rdx
 1004              		.loc 1 946 54
 1005 0751 89D0     		movl	%edx, %eax
 1006 0753 83E801   		subl	$1, %eax
 1007              		.loc 1 946 17
 1008 0756 8945D8   		movl	%eax, -40(%rbp)
 947:lex.yy.c      **** 	number_to_move = (int) ((yy_c_buf_p) - (yytext_ptr) - 1);
 948:lex.yy.c      **** 
 1009              		.loc 1 948 10
 1010 0759 C745EC00 		movl	$0, -20(%rbp)
 1010      000000
 1011              		.loc 1 948 2
 1012 0760 EB21     		jmp	.L46
 1013              	.L47:
 949:lex.yy.c      **** 	for ( i = 0; i < number_to_move; ++i )
 1014              		.loc 1 949 23
 1015 0762 488B55F0 		movq	-16(%rbp), %rdx
 1016 0766 488D4201 		leaq	1(%rdx), %rax
 1017 076a 488945F0 		movq	%rax, -16(%rbp)
 1018              		.loc 1 949 9
 1019 076e 488B45F8 		movq	-8(%rbp), %rax
 1020 0772 488D4801 		leaq	1(%rax), %rcx
 1021 0776 48894DF8 		movq	%rcx, -8(%rbp)
 1022              		.loc 1 949 15
 1023 077a 0FB612   		movzbl	(%rdx), %edx
 1024              		.loc 1 949 13
 1025 077d 8810     		movb	%dl, (%rax)
 948:lex.yy.c      **** 	for ( i = 0; i < number_to_move; ++i )
 1026              		.loc 1 948 35 discriminator 3
 1027 077f 8345EC01 		addl	$1, -20(%rbp)
 1028              	.L46:
 948:lex.yy.c      **** 	for ( i = 0; i < number_to_move; ++i )
 1029              		.loc 1 948 17 discriminator 1
 1030 0783 8B45EC   		movl	-20(%rbp), %eax
 1031 0786 3B45D8   		cmpl	-40(%rbp), %eax
 1032 0789 7CD7     		jl	.L47
 950:lex.yy.c      **** 		*(dest++) = *(source++);
 951:lex.yy.c      **** 
 1033              		.loc 1 951 7
 1034 078b 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1034      000000
 1035 0792 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1035      000000
 1036 0799 48C1E203 		salq	$3, %rdx
 1037 079d 4801D0   		addq	%rdx, %rax
 1038 07a0 488B00   		movq	(%rax), %rax
 1039              		.loc 1 951 31
 1040 07a3 8B4038   		movl	56(%rax), %eax
 1041              		.loc 1 951 5
 1042 07a6 83F802   		cmpl	$2, %eax
 1043 07a9 7530     		jne	.L48
 952:lex.yy.c      **** 	if ( YY_CURRENT_BUFFER_LVALUE->yy_buffer_status == YY_BUFFER_EOF_PENDING )
 953:lex.yy.c      **** 		/* don't do the read, it's not guaranteed to return an EOF,
 954:lex.yy.c      **** 		 * just force an EOF
 955:lex.yy.c      **** 		 */
 1044              		.loc 1 955 55
 1045 07ab C7055000 		movl	$0, yy_n_chars(%rip)
 1045      00000000 
 1045      0000
 1046              		.loc 1 955 3
 1047 07b5 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1047      000000
 1048 07bc 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1048      000000
 1049 07c3 48C1E203 		salq	$3, %rdx
 1050 07c7 4801D0   		addq	%rdx, %rax
 1051 07ca 488B00   		movq	(%rax), %rax
 1052              		.loc 1 955 40
 1053 07cd 8B155400 		movl	yy_n_chars(%rip), %edx
 1053      0000
 1054 07d3 89501C   		movl	%edx, 28(%rax)
 1055 07d6 E92E0300 		jmp	.L49
 1055      00
 1056              	.L48:
 1057              	.LBB6:
 956:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars = (yy_n_chars) = 0;
 957:lex.yy.c      **** 
 958:lex.yy.c      **** 	else
 959:lex.yy.c      **** 		{
 960:lex.yy.c      **** 			int num_to_read =
 1058              		.loc 1 960 4
 1059 07db 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1059      000000
 1060 07e2 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1060      000000
 1061 07e9 48C1E203 		salq	$3, %rdx
 1062 07ed 4801D0   		addq	%rdx, %rax
 1063 07f0 488B00   		movq	(%rax), %rax
 1064              		.loc 1 960 28
 1065 07f3 8B4018   		movl	24(%rax), %eax
 1066              		.loc 1 960 42
 1067 07f6 2B45D8   		subl	-40(%rbp), %eax
 959:lex.yy.c      **** 			int num_to_read =
 1068              		.loc 1 959 8
 1069 07f9 83E801   		subl	$1, %eax
 1070 07fc 8945E4   		movl	%eax, -28(%rbp)
 961:lex.yy.c      **** 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
 962:lex.yy.c      **** 
 1071              		.loc 1 962 9
 1072 07ff E90D0100 		jmp	.L50
 1072      00
 1073              	.L56:
 1074              	.LBB7:
 963:lex.yy.c      **** 		while ( num_to_read <= 0 )
 964:lex.yy.c      **** 			{ /* Not enough room in the buffer - grow it. */
 965:lex.yy.c      **** 
 966:lex.yy.c      **** 			/* just a shorter name for the current buffer */
 1075              		.loc 1 966 24
 1076 0804 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1076      000000
 1077 080b 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1077      000000
 1078 0812 48C1E203 		salq	$3, %rdx
 1079 0816 4801D0   		addq	%rdx, %rax
 1080              		.loc 1 966 20
 1081 0819 488B00   		movq	(%rax), %rax
 1082 081c 488945D0 		movq	%rax, -48(%rbp)
 967:lex.yy.c      **** 			YY_BUFFER_STATE b = YY_CURRENT_BUFFER_LVALUE;
 968:lex.yy.c      **** 
 969:lex.yy.c      **** 			int yy_c_buf_p_offset =
 1083              		.loc 1 969 25
 1084 0820 488B1558 		movq	yy_c_buf_p(%rip), %rdx
 1084      000000
 1085              		.loc 1 969 28
 1086 0827 488B45D0 		movq	-48(%rbp), %rax
 1087 082b 488B4008 		movq	8(%rax), %rax
 1088              		.loc 1 969 25
 1089 082f 4829C2   		subq	%rax, %rdx
 968:lex.yy.c      **** 			int yy_c_buf_p_offset =
 1090              		.loc 1 968 8
 1091 0832 8955CC   		movl	%edx, -52(%rbp)
 970:lex.yy.c      **** 				(int) ((yy_c_buf_p) - b->yy_ch_buf);
 971:lex.yy.c      **** 
 1092              		.loc 1 971 10
 1093 0835 488B45D0 		movq	-48(%rbp), %rax
 1094 0839 8B4020   		movl	32(%rax), %eax
 1095              		.loc 1 971 7
 1096 083c 85C0     		testl	%eax, %eax
 1097 083e 746E     		je	.L51
 1098              	.LBB8:
 972:lex.yy.c      **** 			if ( b->yy_is_our_buffer )
 973:lex.yy.c      **** 				{
 1099              		.loc 1 973 21
 1100 0840 488B45D0 		movq	-48(%rbp), %rax
 1101 0844 8B4018   		movl	24(%rax), %eax
 1102              		.loc 1 973 9
 1103 0847 01C0     		addl	%eax, %eax
 1104 0849 8945C8   		movl	%eax, -56(%rbp)
 974:lex.yy.c      **** 				int new_size = b->yy_buf_size * 2;
 975:lex.yy.c      **** 
 1105              		.loc 1 975 8
 1106 084c 837DC800 		cmpl	$0, -56(%rbp)
 1107 0850 7F24     		jg	.L52
 976:lex.yy.c      **** 				if ( new_size <= 0 )
 1108              		.loc 1 976 7
 1109 0852 488B45D0 		movq	-48(%rbp), %rax
 1110 0856 8B5018   		movl	24(%rax), %edx
 1111              		.loc 1 976 25
 1112 0859 488B45D0 		movq	-48(%rbp), %rax
 1113 085d 8B4018   		movl	24(%rax), %eax
 1114              		.loc 1 976 39
 1115 0860 8D4807   		leal	7(%rax), %ecx
 1116 0863 85C0     		testl	%eax, %eax
 1117 0865 0F48C1   		cmovs	%ecx, %eax
 1118 0868 C1F803   		sarl	$3, %eax
 1119              		.loc 1 976 21
 1120 086b 01C2     		addl	%eax, %edx
 1121 086d 488B45D0 		movq	-48(%rbp), %rax
 1122 0871 895018   		movl	%edx, 24(%rax)
 1123 0874 EB11     		jmp	.L53
 1124              	.L52:
 977:lex.yy.c      **** 					b->yy_buf_size += b->yy_buf_size / 8;
 978:lex.yy.c      **** 				else
 1125              		.loc 1 978 7
 1126 0876 488B45D0 		movq	-48(%rbp), %rax
 1127 087a 8B4018   		movl	24(%rax), %eax
 1128              		.loc 1 978 21
 1129 087d 8D1400   		leal	(%rax,%rax), %edx
 1130 0880 488B45D0 		movq	-48(%rbp), %rax
 1131 0884 895018   		movl	%edx, 24(%rax)
 1132              	.L53:
 979:lex.yy.c      **** 					b->yy_buf_size *= 2;
 980:lex.yy.c      **** 
 981:lex.yy.c      **** 				b->yy_ch_buf = (char *)
 982:lex.yy.c      **** 					/* Include room in for 2 EOB chars. */
 983:lex.yy.c      **** 					yyrealloc( (void *) b->yy_ch_buf,
 1133              		.loc 1 983 23
 1134 0887 488B45D0 		movq	-48(%rbp), %rax
 1135 088b 8B4018   		movl	24(%rax), %eax
 1136              		.loc 1 983 37
 1137 088e 83C002   		addl	$2, %eax
 982:lex.yy.c      **** 					yyrealloc( (void *) b->yy_ch_buf,
 1138              		.loc 1 982 6
 1139 0891 4863D0   		movslq	%eax, %rdx
 982:lex.yy.c      **** 					yyrealloc( (void *) b->yy_ch_buf,
 1140              		.loc 1 982 27
 1141 0894 488B45D0 		movq	-48(%rbp), %rax
 1142 0898 488B4008 		movq	8(%rax), %rax
 982:lex.yy.c      **** 					yyrealloc( (void *) b->yy_ch_buf,
 1143              		.loc 1 982 6
 1144 089c 4889C1   		movq	%rax, %rcx
 1145 089f E88A1500 		call	yyrealloc
 1145      00
 980:lex.yy.c      **** 				b->yy_ch_buf = (char *)
 1146              		.loc 1 980 18
 1147 08a4 488B55D0 		movq	-48(%rbp), %rdx
 1148 08a8 48894208 		movq	%rax, 8(%rdx)
 1149              	.LBE8:
 1150 08ac EB0C     		jmp	.L54
 1151              	.L51:
 984:lex.yy.c      **** 							 (yy_size_t) (b->yy_buf_size + 2)  );
 985:lex.yy.c      **** 				}
 986:lex.yy.c      **** 			else
 987:lex.yy.c      **** 				/* Can't grow it, we don't own it. */
 1152              		.loc 1 987 18
 1153 08ae 488B45D0 		movq	-48(%rbp), %rax
 1154 08b2 48C74008 		movq	$0, 8(%rax)
 1154      00000000 
 1155              	.L54:
 988:lex.yy.c      **** 				b->yy_ch_buf = NULL;
 989:lex.yy.c      **** 
 1156              		.loc 1 989 12
 1157 08ba 488B45D0 		movq	-48(%rbp), %rax
 1158 08be 488B4008 		movq	8(%rax), %rax
 1159              		.loc 1 989 7
 1160 08c2 4885C0   		testq	%rax, %rax
 1161 08c5 750F     		jne	.L55
 990:lex.yy.c      **** 			if ( ! b->yy_ch_buf )
 1162              		.loc 1 990 5
 1163 08c7 488D05C8 		leaq	.LC7(%rip), %rax
 1163      030000
 1164 08ce 4889C1   		movq	%rax, %rcx
 1165 08d1 E84D1300 		call	yy_fatal_error
 1165      00
 1166              	.L55:
 991:lex.yy.c      **** 				YY_FATAL_ERROR(
 992:lex.yy.c      **** 				"fatal error - scanner input buffer overflow" );
 993:lex.yy.c      **** 
 1167              		.loc 1 993 21
 1168 08d6 488B45D0 		movq	-48(%rbp), %rax
 1169 08da 488B5008 		movq	8(%rax), %rdx
 1170              		.loc 1 993 19
 1171 08de 8B45CC   		movl	-52(%rbp), %eax
 1172 08e1 4898     		cltq
 1173 08e3 4801D0   		addq	%rdx, %rax
 1174              		.loc 1 993 17
 1175 08e6 48890558 		movq	%rax, yy_c_buf_p(%rip)
 1175      000000
 994:lex.yy.c      **** 			(yy_c_buf_p) = &b->yy_ch_buf[yy_c_buf_p_offset];
 995:lex.yy.c      **** 
 1176              		.loc 1 995 18
 1177 08ed 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1177      000000
 1178 08f4 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1178      000000
 1179 08fb 48C1E203 		salq	$3, %rdx
 1180 08ff 4801D0   		addq	%rdx, %rax
 1181 0902 488B00   		movq	(%rax), %rax
 1182              		.loc 1 995 42
 1183 0905 8B4018   		movl	24(%rax), %eax
 1184              		.loc 1 995 56
 1185 0908 2B45D8   		subl	-40(%rbp), %eax
 1186              		.loc 1 995 16
 1187 090b 83E801   		subl	$1, %eax
 1188 090e 8945E4   		movl	%eax, -28(%rbp)
 1189              	.L50:
 1190              	.LBE7:
 962:lex.yy.c      **** 		while ( num_to_read <= 0 )
 1191              		.loc 1 962 23
 1192 0911 837DE400 		cmpl	$0, -28(%rbp)
 1193 0915 0F8EE9FE 		jle	.L56
 1193      FFFF
 996:lex.yy.c      **** 			num_to_read = YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
 997:lex.yy.c      **** 						number_to_move - 1;
 998:lex.yy.c      **** 
 999:lex.yy.c      **** 			}
1000:lex.yy.c      **** 
 1194              		.loc 1 1000 6
 1195 091b 817DE400 		cmpl	$8192, -28(%rbp)
 1195      200000
 1196 0922 7E07     		jle	.L57
1001:lex.yy.c      **** 		if ( num_to_read > YY_READ_BUF_SIZE )
 1197              		.loc 1 1001 16
 1198 0924 C745E400 		movl	$8192, -28(%rbp)
 1198      200000
 1199              	.L57:
1002:lex.yy.c      **** 			num_to_read = YY_READ_BUF_SIZE;
1003:lex.yy.c      **** 
1004:lex.yy.c      **** 		/* Read in more data. */
 1200              		.loc 1 1004 3
 1201 092b 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1201      000000
 1202 0932 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1202      000000
 1203 0939 48C1E203 		salq	$3, %rdx
 1204 093d 4801D0   		addq	%rdx, %rax
 1205 0940 488B00   		movq	(%rax), %rax
 1206 0943 8B4024   		movl	36(%rax), %eax
 1207 0946 85C0     		testl	%eax, %eax
 1208 0948 0F84E100 		je	.L58
 1208      0000
 1209              	.LBB9:
 1210              		.loc 1 1004 3 is_stmt 0 discriminator 1
 1211 094e C745E02A 		movl	$42, -32(%rbp)
 1211      000000
 1212 0955 C745DC00 		movl	$0, -36(%rbp)
 1212      000000
 1213              		.loc 1 1004 3
 1214 095c EB37     		jmp	.L59
 1215              	.L61:
 1216              		.loc 1 1004 3 discriminator 9
 1217 095e 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1217      000000
 1218 0965 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1218      000000
 1219 096c 48C1E203 		salq	$3, %rdx
 1220 0970 4801D0   		addq	%rdx, %rax
 1221 0973 488B00   		movq	(%rax), %rax
 1222 0976 488B4008 		movq	8(%rax), %rax
 1223 097a 8B55D8   		movl	-40(%rbp), %edx
 1224 097d 4863CA   		movslq	%edx, %rcx
 1225 0980 8B55DC   		movl	-36(%rbp), %edx
 1226 0983 4863D2   		movslq	%edx, %rdx
 1227 0986 4801CA   		addq	%rcx, %rdx
 1228 0989 4801D0   		addq	%rdx, %rax
 1229 098c 8B55E0   		movl	-32(%rbp), %edx
 1230 098f 8810     		movb	%dl, (%rax)
 1231 0991 8345DC01 		addl	$1, -36(%rbp)
 1232              	.L59:
 1233              		.loc 1 1004 3 discriminator 3
 1234 0995 8B45DC   		movl	-36(%rbp), %eax
 1235 0998 3B45E4   		cmpl	-28(%rbp), %eax
 1236 099b 7D1E     		jge	.L60
 1237              		.loc 1 1004 3 discriminator 5
 1238 099d 488B0508 		movq	yyin(%rip), %rax
 1238      000000
 1239 09a4 4889C1   		movq	%rax, %rcx
 1240 09a7 E8000000 		call	getc
 1240      00
 1241 09ac 8945E0   		movl	%eax, -32(%rbp)
 1242              		.loc 1 1004 3 discriminator 1
 1243 09af 837DE0FF 		cmpl	$-1, -32(%rbp)
 1244 09b3 7406     		je	.L60
 1245              		.loc 1 1004 3 discriminator 7
 1246 09b5 837DE00A 		cmpl	$10, -32(%rbp)
 1247 09b9 75A3     		jne	.L61
 1248              	.L60:
 1249              		.loc 1 1004 3 discriminator 10
 1250 09bb 837DE00A 		cmpl	$10, -32(%rbp)
 1251 09bf 7538     		jne	.L62
 1252              		.loc 1 1004 3 discriminator 11
 1253 09c1 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1253      000000
 1254 09c8 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1254      000000
 1255 09cf 48C1E203 		salq	$3, %rdx
 1256 09d3 4801D0   		addq	%rdx, %rax
 1257 09d6 488B00   		movq	(%rax), %rax
 1258 09d9 488B4808 		movq	8(%rax), %rcx
 1259 09dd 8B45D8   		movl	-40(%rbp), %eax
 1260 09e0 4C63C0   		movslq	%eax, %r8
 1261 09e3 8B45DC   		movl	-36(%rbp), %eax
 1262 09e6 8D5001   		leal	1(%rax), %edx
 1263 09e9 8955DC   		movl	%edx, -36(%rbp)
 1264 09ec 4898     		cltq
 1265 09ee 4C01C0   		addq	%r8, %rax
 1266 09f1 4801C8   		addq	%rcx, %rax
 1267 09f4 8B55E0   		movl	-32(%rbp), %edx
 1268 09f7 8810     		movb	%dl, (%rax)
 1269              	.L62:
 1270              		.loc 1 1004 3 discriminator 13
 1271 09f9 837DE0FF 		cmpl	$-1, -32(%rbp)
 1272 09fd 7522     		jne	.L63
 1273              		.loc 1 1004 3 discriminator 14
 1274 09ff 488B0508 		movq	yyin(%rip), %rax
 1274      000000
 1275 0a06 4889C1   		movq	%rax, %rcx
 1276 0a09 E8000000 		call	ferror
 1276      00
 1277              		.loc 1 1004 3 discriminator 1
 1278 0a0e 85C0     		testl	%eax, %eax
 1279 0a10 740F     		je	.L63
 1280              		.loc 1 1004 3 discriminator 16
 1281 0a12 488D05F4 		leaq	.LC8(%rip), %rax
 1281      030000
 1282 0a19 4889C1   		movq	%rax, %rcx
 1283 0a1c E8021200 		call	yy_fatal_error
 1283      00
 1284              	.L63:
 1285              		.loc 1 1004 3 discriminator 17
 1286 0a21 8B45DC   		movl	-36(%rbp), %eax
 1287 0a24 89055400 		movl	%eax, yy_n_chars(%rip)
 1287      0000
 1288              	.LBE9:
 1289 0a2a E9B90000 		jmp	.L64
 1289      00
 1290              	.L58:
 1291              		.loc 1 1004 3 discriminator 2
 1292 0a2f 488B0500 		movq	__imp__errno(%rip), %rax
 1292      000000
 1293 0a36 FFD0     		call	*%rax
 1294              	.LVL2:
 1295              		.loc 1 1004 3 discriminator 1
 1296 0a38 C7000000 		movl	$0, (%rax)
 1296      0000
 1297              		.loc 1 1004 3
 1298 0a3e EB3D     		jmp	.L65
 1299              	.L67:
 1300              		.loc 1 1004 3 discriminator 23
 1301 0a40 488B0500 		movq	__imp__errno(%rip), %rax
 1301      000000
 1302 0a47 FFD0     		call	*%rax
 1303              	.LVL3:
 1304 0a49 8B00     		movl	(%rax), %eax
 1305 0a4b 83F804   		cmpl	$4, %eax
 1306 0a4e 740F     		je	.L66
 1307              		.loc 1 1004 3 discriminator 19
 1308 0a50 488D05F4 		leaq	.LC8(%rip), %rax
 1308      030000
 1309 0a57 4889C1   		movq	%rax, %rcx
 1310 0a5a E8C41100 		call	yy_fatal_error
 1310      00
 1311              	.L66:
 1312              		.loc 1 1004 3 discriminator 20
 1313 0a5f 488B0500 		movq	__imp__errno(%rip), %rax
 1313      000000
 1314 0a66 FFD0     		call	*%rax
 1315              	.LVL4:
 1316              		.loc 1 1004 3 discriminator 1
 1317 0a68 C7000000 		movl	$0, (%rax)
 1317      0000
 1318 0a6e 488B0508 		movq	yyin(%rip), %rax
 1318      000000
 1319 0a75 4889C1   		movq	%rax, %rcx
 1320 0a78 E8000000 		call	clearerr
 1320      00
 1321              	.L65:
 1322              		.loc 1 1004 3 discriminator 21
 1323 0a7d 4C8B0508 		movq	yyin(%rip), %r8
 1323      000000
 1324 0a84 8B45E4   		movl	-28(%rbp), %eax
 1325 0a87 4863C8   		movslq	%eax, %rcx
 1326 0a8a 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1326      000000
 1327 0a91 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1327      000000
 1328 0a98 48C1E203 		salq	$3, %rdx
 1329 0a9c 4801D0   		addq	%rdx, %rax
 1330 0a9f 488B00   		movq	(%rax), %rax
 1331 0aa2 488B5008 		movq	8(%rax), %rdx
 1332 0aa6 8B45D8   		movl	-40(%rbp), %eax
 1333 0aa9 4898     		cltq
 1334 0aab 4801D0   		addq	%rdx, %rax
 1335 0aae 4D89C1   		movq	%r8, %r9
 1336 0ab1 4989C8   		movq	%rcx, %r8
 1337 0ab4 BA010000 		movl	$1, %edx
 1337      00
 1338 0ab9 4889C1   		movq	%rax, %rcx
 1339 0abc E8000000 		call	fread
 1339      00
 1340              		.loc 1 1004 3 discriminator 1
 1341 0ac1 89055400 		movl	%eax, yy_n_chars(%rip)
 1341      0000
 1342 0ac7 8B055400 		movl	yy_n_chars(%rip), %eax
 1342      0000
 1343 0acd 85C0     		testl	%eax, %eax
 1344 0acf 7517     		jne	.L64
 1345              		.loc 1 1004 3 discriminator 22
 1346 0ad1 488B0508 		movq	yyin(%rip), %rax
 1346      000000
 1347 0ad8 4889C1   		movq	%rax, %rcx
 1348 0adb E8000000 		call	ferror
 1348      00
 1349              		.loc 1 1004 3 discriminator 1
 1350 0ae0 85C0     		testl	%eax, %eax
 1351 0ae2 0F8558FF 		jne	.L67
 1351      FFFF
 1352              	.L64:
1005:lex.yy.c      **** 		YY_INPUT( (&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[number_to_move]),
1006:lex.yy.c      **** 			(yy_n_chars), num_to_read );
1007:lex.yy.c      **** 
 1353              		.loc 1 1007 3 is_stmt 1
 1354 0ae8 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1354      000000
 1355 0aef 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1355      000000
 1356 0af6 48C1E203 		salq	$3, %rdx
 1357 0afa 4801D0   		addq	%rdx, %rax
 1358 0afd 488B00   		movq	(%rax), %rax
 1359              		.loc 1 1007 40
 1360 0b00 8B155400 		movl	yy_n_chars(%rip), %edx
 1360      0000
 1361 0b06 89501C   		movl	%edx, 28(%rax)
 1362              	.L49:
 1363              	.LBE6:
1008:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars = (yy_n_chars);
1009:lex.yy.c      **** 		}
1010:lex.yy.c      **** 
 1364              		.loc 1 1010 20
 1365 0b09 8B055400 		movl	yy_n_chars(%rip), %eax
 1365      0000
 1366              		.loc 1 1010 5
 1367 0b0f 85C0     		testl	%eax, %eax
 1368 0b11 7546     		jne	.L68
1011:lex.yy.c      **** 	if ( (yy_n_chars) == 0 )
1012:lex.yy.c      **** 		{
 1369              		.loc 1 1012 6
 1370 0b13 837DD800 		cmpl	$0, -40(%rbp)
 1371 0b17 7518     		jne	.L69
1013:lex.yy.c      **** 		if ( number_to_move == YY_MORE_ADJ )
1014:lex.yy.c      **** 			{
 1372              		.loc 1 1014 12
 1373 0b19 C745E801 		movl	$1, -24(%rbp)
 1373      000000
1015:lex.yy.c      **** 			ret_val = EOB_ACT_END_OF_FILE;
 1374              		.loc 1 1015 4
 1375 0b20 488B0508 		movq	yyin(%rip), %rax
 1375      000000
 1376 0b27 4889C1   		movq	%rax, %rcx
 1377 0b2a E8F50600 		call	yyrestart
 1377      00
 1378 0b2f EB2F     		jmp	.L70
 1379              	.L69:
1016:lex.yy.c      **** 			yyrestart( yyin  );
1017:lex.yy.c      **** 			}
1018:lex.yy.c      **** 
1019:lex.yy.c      **** 		else
1020:lex.yy.c      **** 			{
 1380              		.loc 1 1020 12
 1381 0b31 C745E802 		movl	$2, -24(%rbp)
 1381      000000
1021:lex.yy.c      **** 			ret_val = EOB_ACT_LAST_MATCH;
 1382              		.loc 1 1021 4
 1383 0b38 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1383      000000
 1384 0b3f 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1384      000000
 1385 0b46 48C1E203 		salq	$3, %rdx
 1386 0b4a 4801D0   		addq	%rdx, %rax
 1387 0b4d 488B00   		movq	(%rax), %rax
 1388              		.loc 1 1021 47
 1389 0b50 C7403802 		movl	$2, 56(%rax)
 1389      000000
 1390 0b57 EB07     		jmp	.L70
 1391              	.L68:
1022:lex.yy.c      **** 			YY_CURRENT_BUFFER_LVALUE->yy_buffer_status =
1023:lex.yy.c      **** 				YY_BUFFER_EOF_PENDING;
1024:lex.yy.c      **** 			}
1025:lex.yy.c      **** 		}
1026:lex.yy.c      **** 
1027:lex.yy.c      **** 	else
 1392              		.loc 1 1027 11
 1393 0b59 C745E800 		movl	$0, -24(%rbp)
 1393      000000
 1394              	.L70:
1028:lex.yy.c      **** 		ret_val = EOB_ACT_CONTINUE_SCAN;
1029:lex.yy.c      **** 
 1395              		.loc 1 1029 20
 1396 0b60 8B155400 		movl	yy_n_chars(%rip), %edx
 1396      0000
 1397 0b66 8B45D8   		movl	-40(%rbp), %eax
 1398 0b69 8D0C02   		leal	(%rdx,%rax), %ecx
 1399              		.loc 1 1029 40
 1400 0b6c 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1400      000000
 1401 0b73 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1401      000000
 1402 0b7a 48C1E203 		salq	$3, %rdx
 1403 0b7e 4801D0   		addq	%rdx, %rax
 1404 0b81 488B00   		movq	(%rax), %rax
 1405              		.loc 1 1029 64
 1406 0b84 8B4018   		movl	24(%rax), %eax
 1407              		.loc 1 1029 5
 1408 0b87 39C1     		cmpl	%eax, %ecx
 1409 0b89 0F8EAF00 		jle	.L71
 1409      0000
 1410              	.LBB10:
1030:lex.yy.c      **** 	if (((yy_n_chars) + number_to_move) > YY_CURRENT_BUFFER_LVALUE->yy_buf_size) {
1031:lex.yy.c      **** 		/* Extend the array by 50%, plus the number we really need. */
 1411              		.loc 1 1031 31
 1412 0b8f 8B155400 		movl	yy_n_chars(%rip), %edx
 1412      0000
 1413 0b95 8B45D8   		movl	-40(%rbp), %eax
 1414 0b98 01C2     		addl	%eax, %edx
 1415              		.loc 1 1031 64
 1416 0b9a 8B055400 		movl	yy_n_chars(%rip), %eax
 1416      0000
 1417 0ba0 D1F8     		sarl	%eax
 1418              		.loc 1 1031 7
 1419 0ba2 01D0     		addl	%edx, %eax
 1420 0ba4 8945C4   		movl	%eax, -60(%rbp)
1032:lex.yy.c      **** 		int new_size = (yy_n_chars) + number_to_move + ((yy_n_chars) >> 1);
 1421              		.loc 1 1032 50
 1422 0ba7 8B45C4   		movl	-60(%rbp), %eax
 1423 0baa 4863D0   		movslq	%eax, %rdx
1033:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) yyrealloc(
 1424              		.loc 1 1033 13
 1425 0bad 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1425      000000
 1426 0bb4 488B0D38 		movq	yy_buffer_stack_top(%rip), %rcx
 1426      000000
 1427 0bbb 48C1E103 		salq	$3, %rcx
 1428 0bbf 4801C8   		addq	%rcx, %rax
 1429 0bc2 488B00   		movq	(%rax), %rax
 1430              		.loc 1 1033 37
 1431 0bc5 488B4008 		movq	8(%rax), %rax
1032:lex.yy.c      **** 		int new_size = (yy_n_chars) + number_to_move + ((yy_n_chars) >> 1);
 1432              		.loc 1 1032 3
 1433 0bc9 488B0D48 		movq	yy_buffer_stack(%rip), %rcx
 1433      000000
 1434 0bd0 4C8B0538 		movq	yy_buffer_stack_top(%rip), %r8
 1434      000000
 1435 0bd7 49C1E003 		salq	$3, %r8
 1436 0bdb 4C01C1   		addq	%r8, %rcx
 1437 0bde 488B19   		movq	(%rcx), %rbx
1032:lex.yy.c      **** 		int new_size = (yy_n_chars) + number_to_move + ((yy_n_chars) >> 1);
 1438              		.loc 1 1032 50
 1439 0be1 4889C1   		movq	%rax, %rcx
 1440 0be4 E8451200 		call	yyrealloc
 1440      00
1032:lex.yy.c      **** 		int new_size = (yy_n_chars) + number_to_move + ((yy_n_chars) >> 1);
 1441              		.loc 1 1032 39 discriminator 1
 1442 0be9 48894308 		movq	%rax, 8(%rbx)
1034:lex.yy.c      **** 			(void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf, (yy_size_t) new_size  );
 1443              		.loc 1 1034 10
 1444 0bed 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1444      000000
 1445 0bf4 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1445      000000
 1446 0bfb 48C1E203 		salq	$3, %rdx
 1447 0bff 4801D0   		addq	%rdx, %rax
 1448 0c02 488B00   		movq	(%rax), %rax
 1449              		.loc 1 1034 34
 1450 0c05 488B4008 		movq	8(%rax), %rax
 1451              		.loc 1 1034 6
 1452 0c09 4885C0   		testq	%rax, %rax
 1453 0c0c 750F     		jne	.L72
1035:lex.yy.c      **** 		if ( ! YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
 1454              		.loc 1 1035 4
 1455 0c0e 488D0518 		leaq	.LC9(%rip), %rax
 1455      040000
 1456 0c15 4889C1   		movq	%rax, %rcx
 1457 0c18 E8061000 		call	yy_fatal_error
 1457      00
 1458              	.L72:
1036:lex.yy.c      **** 			YY_FATAL_ERROR( "out of dynamic memory in yy_get_next_buffer()" );
1037:lex.yy.c      **** 		/* "- 2" to take care of EOB's */
 1459              		.loc 1 1037 3
 1460 0c1d 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1460      000000
 1461 0c24 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1461      000000
 1462 0c2b 48C1E203 		salq	$3, %rdx
 1463 0c2f 4801D0   		addq	%rdx, %rax
 1464 0c32 488B00   		movq	(%rax), %rax
 1465              		.loc 1 1037 43
 1466 0c35 8B55C4   		movl	-60(%rbp), %edx
 1467 0c38 83EA02   		subl	$2, %edx
 1468              		.loc 1 1037 41
 1469 0c3b 895018   		movl	%edx, 24(%rax)
 1470              	.L71:
 1471              	.LBE10:
1038:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE->yy_buf_size = (int) (new_size - 2);
1039:lex.yy.c      **** 	}
1040:lex.yy.c      **** 
 1472              		.loc 1 1040 15
 1473 0c3e 8B155400 		movl	yy_n_chars(%rip), %edx
 1473      0000
 1474 0c44 8B45D8   		movl	-40(%rbp), %eax
 1475 0c47 01D0     		addl	%edx, %eax
 1476 0c49 89055400 		movl	%eax, yy_n_chars(%rip)
 1476      0000
1041:lex.yy.c      **** 	(yy_n_chars) += number_to_move;
 1477              		.loc 1 1041 2
 1478 0c4f 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1478      000000
 1479 0c56 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1479      000000
 1480 0c5d 48C1E203 		salq	$3, %rdx
 1481 0c61 4801D0   		addq	%rdx, %rax
 1482 0c64 488B00   		movq	(%rax), %rax
 1483              		.loc 1 1041 26
 1484 0c67 488B5008 		movq	8(%rax), %rdx
 1485              		.loc 1 1041 37
 1486 0c6b 8B055400 		movl	yy_n_chars(%rip), %eax
 1486      0000
 1487 0c71 4898     		cltq
 1488 0c73 4801D0   		addq	%rdx, %rax
 1489              		.loc 1 1041 52
 1490 0c76 C60000   		movb	$0, (%rax)
1042:lex.yy.c      **** 	YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars)] = YY_END_OF_BUFFER_CHAR;
 1491              		.loc 1 1042 2
 1492 0c79 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1492      000000
 1493 0c80 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1493      000000
 1494 0c87 48C1E203 		salq	$3, %rdx
 1495 0c8b 4801D0   		addq	%rdx, %rax
 1496 0c8e 488B00   		movq	(%rax), %rax
 1497              		.loc 1 1042 26
 1498 0c91 488B4008 		movq	8(%rax), %rax
 1499              		.loc 1 1042 37
 1500 0c95 8B155400 		movl	yy_n_chars(%rip), %edx
 1500      0000
 1501 0c9b 4863D2   		movslq	%edx, %rdx
 1502 0c9e 4883C201 		addq	$1, %rdx
 1503 0ca2 4801D0   		addq	%rdx, %rax
 1504              		.loc 1 1042 56
 1505 0ca5 C60000   		movb	$0, (%rax)
1043:lex.yy.c      **** 	YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars) + 1] = YY_END_OF_BUFFER_CHAR;
1044:lex.yy.c      **** 
 1506              		.loc 1 1044 18
 1507 0ca8 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1507      000000
 1508 0caf 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1508      000000
 1509 0cb6 48C1E203 		salq	$3, %rdx
 1510 0cba 4801D0   		addq	%rdx, %rax
 1511 0cbd 488B00   		movq	(%rax), %rax
 1512              		.loc 1 1044 17
 1513 0cc0 488B4008 		movq	8(%rax), %rax
 1514              		.loc 1 1044 15
 1515 0cc4 48890520 		movq	%rax, yytext(%rip)
 1515      000000
1045:lex.yy.c      **** 	(yytext_ptr) = &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[0];
1046:lex.yy.c      **** 
 1516              		.loc 1 1046 9
 1517 0ccb 8B45E8   		movl	-24(%rbp), %eax
 1518              	.L45:
1047:lex.yy.c      **** 	return ret_val;
 1519              		.loc 1 1047 1
 1520 0cce 4883C468 		addq	$104, %rsp
 1521 0cd2 5B       		popq	%rbx
 1522              		.cfi_restore 3
 1523 0cd3 5D       		popq	%rbp
 1524              		.cfi_restore 6
 1525              		.cfi_def_cfa 7, -88
 1526 0cd4 C3       		ret
 1527              		.cfi_endproc
 1528              	.LFE18:
 1529              		.seh_endproc
 1531              		.seh_proc	yy_get_previous_state
 1532              	yy_get_previous_state:
 1533              	.LFB19:
1048:lex.yy.c      **** }
1049:lex.yy.c      **** 
1050:lex.yy.c      **** /* yy_get_previous_state - get the state just before the EOB char was reached */
1051:lex.yy.c      **** 
1052:lex.yy.c      ****     static yy_state_type yy_get_previous_state (void)
 1534              		.loc 1 1052 1
 1535              		.cfi_startproc
 1536 0cd5 55       		pushq	%rbp
 1537              		.seh_pushreg	%rbp
 1538              		.cfi_def_cfa_offset 16
 1539              		.cfi_offset 6, -16
 1540 0cd6 4889E5   		movq	%rsp, %rbp
 1541              		.seh_setframe	%rbp, 0
 1542              		.cfi_def_cfa_register 6
 1543 0cd9 4883EC20 		subq	$32, %rsp
 1544              		.seh_stackalloc	32
 1545              		.seh_endprologue
1053:lex.yy.c      **** {
1054:lex.yy.c      **** 	yy_state_type yy_current_state;
1055:lex.yy.c      **** 	char *yy_cp;
1056:lex.yy.c      ****     
 1546              		.loc 1 1056 19
 1547 0cdd 8B056400 		movl	yy_start(%rip), %eax
 1547      0000
 1548 0ce3 8945FC   		movl	%eax, -4(%rbp)
1057:lex.yy.c      **** 	yy_current_state = (yy_start);
1058:lex.yy.c      **** 
 1549              		.loc 1 1058 14
 1550 0ce6 488B0520 		movq	yytext(%rip), %rax
 1550      000000
 1551 0ced 488945F0 		movq	%rax, -16(%rbp)
 1552              		.loc 1 1058 2
 1553 0cf1 E9F80000 		jmp	.L74
 1553      00
 1554              	.L80:
 1555              	.LBB11:
1059:lex.yy.c      **** 	for ( yy_cp = (yytext_ptr) + YY_MORE_ADJ; yy_cp < (yy_c_buf_p); ++yy_cp )
1060:lex.yy.c      **** 		{
 1556              		.loc 1 1060 19
 1557 0cf6 488B45F0 		movq	-16(%rbp), %rax
 1558 0cfa 0FB600   		movzbl	(%rax), %eax
 1559              		.loc 1 1060 11
 1560 0cfd 84C0     		testb	%al, %al
 1561 0cff 7419     		je	.L75
 1562              		.loc 1 1060 34 discriminator 1
 1563 0d01 488B45F0 		movq	-16(%rbp), %rax
 1564 0d05 0FB600   		movzbl	(%rax), %eax
 1565 0d08 0FB6C0   		movzbl	%al, %eax
 1566              		.loc 1 1060 11 discriminator 1
 1567 0d0b 4898     		cltq
 1568 0d0d 488D1540 		leaq	yy_ec(%rip), %rdx
 1568      000000
 1569 0d14 0FB60410 		movzbl	(%rax,%rdx), %eax
 1570 0d18 EB05     		jmp	.L76
 1571              	.L75:
 1572              		.loc 1 1060 11 is_stmt 0 discriminator 2
 1573 0d1a B8010000 		movl	$1, %eax
 1573      00
 1574              	.L76:
 1575              		.loc 1 1060 11 discriminator 4
 1576 0d1f 8845EF   		movb	%al, -17(%rbp)
1061:lex.yy.c      **** 		YY_CHAR yy_c = (*yy_cp ? yy_ec[YY_SC_TO_UI(*yy_cp)] : 1);
 1577              		.loc 1 1061 17 is_stmt 1
 1578 0d22 8B45FC   		movl	-4(%rbp), %eax
 1579 0d25 4898     		cltq
 1580 0d27 488D1400 		leaq	(%rax,%rax), %rdx
 1581 0d2b 488D0500 		leaq	yy_accept(%rip), %rax
 1581      000000
 1582 0d32 0FB70402 		movzwl	(%rdx,%rax), %eax
 1583              		.loc 1 1061 6
 1584 0d36 6685C0   		testw	%ax, %ax
 1585 0d39 7448     		je	.L78
1062:lex.yy.c      **** 		if ( yy_accept[yy_current_state] )
1063:lex.yy.c      **** 			{
 1586              		.loc 1 1063 30
 1587 0d3b 8B45FC   		movl	-4(%rbp), %eax
 1588 0d3e 89056C00 		movl	%eax, yy_last_accepting_state(%rip)
 1588      0000
1064:lex.yy.c      **** 			(yy_last_accepting_state) = yy_current_state;
 1589              		.loc 1 1064 29
 1590 0d44 488B45F0 		movq	-16(%rbp), %rax
 1591 0d48 48890570 		movq	%rax, yy_last_accepting_cpos(%rip)
 1591      000000
1065:lex.yy.c      **** 			(yy_last_accepting_cpos) = yy_cp;
1066:lex.yy.c      **** 			}
 1592              		.loc 1 1066 9
 1593 0d4f EB32     		jmp	.L78
 1594              	.L79:
1067:lex.yy.c      **** 		while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
1068:lex.yy.c      **** 			{
 1595              		.loc 1 1068 35
 1596 0d51 8B45FC   		movl	-4(%rbp), %eax
 1597 0d54 4898     		cltq
 1598 0d56 488D1400 		leaq	(%rax,%rax), %rdx
 1599 0d5a 488D05A0 		leaq	yy_def(%rip), %rax
 1599      010000
 1600 0d61 0FB70402 		movzwl	(%rdx,%rax), %eax
 1601              		.loc 1 1068 21
 1602 0d65 98       		cwtl
 1603 0d66 8945FC   		movl	%eax, -4(%rbp)
1069:lex.yy.c      **** 			yy_current_state = (int) yy_def[yy_current_state];
 1604              		.loc 1 1069 7
 1605 0d69 837DFC1B 		cmpl	$27, -4(%rbp)
 1606 0d6d 7E14     		jle	.L78
1070:lex.yy.c      **** 			if ( yy_current_state >= 28 )
 1607              		.loc 1 1070 19
 1608 0d6f 0FB645EF 		movzbl	-17(%rbp), %eax
 1609              		.loc 1 1070 10
 1610 0d73 4898     		cltq
 1611 0d75 488D1540 		leaq	yy_meta(%rip), %rdx
 1611      010000
 1612 0d7c 0FB60410 		movzbl	(%rax,%rdx), %eax
 1613 0d80 8845EF   		movb	%al, -17(%rbp)
 1614              	.L78:
1066:lex.yy.c      **** 		while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 1615              		.loc 1 1066 25
 1616 0d83 8B45FC   		movl	-4(%rbp), %eax
 1617 0d86 4898     		cltq
 1618 0d88 488D1400 		leaq	(%rax,%rax), %rdx
 1619 0d8c 488D0560 		leaq	yy_base(%rip), %rax
 1619      010000
 1620 0d93 0FB70402 		movzwl	(%rdx,%rax), %eax
 1621 0d97 0FBFD0   		movswl	%ax, %edx
1066:lex.yy.c      **** 		while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 1622              		.loc 1 1066 44
 1623 0d9a 0FB645EF 		movzbl	-17(%rbp), %eax
 1624 0d9e 01D0     		addl	%edx, %eax
1066:lex.yy.c      **** 		while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 1625              		.loc 1 1066 17
 1626 0da0 4898     		cltq
 1627 0da2 488D1400 		leaq	(%rax,%rax), %rdx
 1628 0da6 488D0560 		leaq	yy_chk(%rip), %rax
 1628      020000
 1629 0dad 0FB70402 		movzwl	(%rdx,%rax), %eax
 1630 0db1 98       		cwtl
1066:lex.yy.c      **** 		while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 1631              		.loc 1 1066 52
 1632 0db2 3945FC   		cmpl	%eax, -4(%rbp)
 1633 0db5 759A     		jne	.L79
1071:lex.yy.c      **** 				yy_c = yy_meta[yy_c];
1072:lex.yy.c      **** 			}
 1634              		.loc 1 1072 36
 1635 0db7 8B45FC   		movl	-4(%rbp), %eax
 1636 0dba 4898     		cltq
 1637 0dbc 488D1400 		leaq	(%rax,%rax), %rdx
 1638 0dc0 488D0560 		leaq	yy_base(%rip), %rax
 1638      010000
 1639 0dc7 0FB70402 		movzwl	(%rdx,%rax), %eax
 1640 0dcb 0FBFD0   		movswl	%ax, %edx
 1641              		.loc 1 1072 55
 1642 0dce 0FB645EF 		movzbl	-17(%rbp), %eax
 1643 0dd2 01D0     		addl	%edx, %eax
 1644              		.loc 1 1072 28
 1645 0dd4 4898     		cltq
 1646 0dd6 488D1400 		leaq	(%rax,%rax), %rdx
 1647 0dda 488D05E0 		leaq	yy_nxt(%rip), %rax
 1647      010000
 1648 0de1 0FB70402 		movzwl	(%rdx,%rax), %eax
 1649              		.loc 1 1072 20
 1650 0de5 98       		cwtl
 1651 0de6 8945FC   		movl	%eax, -4(%rbp)
 1652              	.LBE11:
1058:lex.yy.c      **** 	for ( yy_cp = (yytext_ptr) + YY_MORE_ADJ; yy_cp < (yy_c_buf_p); ++yy_cp )
 1653              		.loc 1 1058 66 discriminator 2
 1654 0de9 488345F0 		addq	$1, -16(%rbp)
 1654      01
 1655              	.L74:
1058:lex.yy.c      **** 	for ( yy_cp = (yytext_ptr) + YY_MORE_ADJ; yy_cp < (yy_c_buf_p); ++yy_cp )
 1656              		.loc 1 1058 50 discriminator 1
 1657 0dee 488B0558 		movq	yy_c_buf_p(%rip), %rax
 1657      000000
 1658 0df5 483945F0 		cmpq	%rax, -16(%rbp)
 1659 0df9 0F82F7FE 		jb	.L80
 1659      FFFF
1073:lex.yy.c      **** 		yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
1074:lex.yy.c      **** 		}
1075:lex.yy.c      **** 
 1660              		.loc 1 1075 9
 1661 0dff 8B45FC   		movl	-4(%rbp), %eax
1076:lex.yy.c      **** 	return yy_current_state;
 1662              		.loc 1 1076 1
 1663 0e02 4883C420 		addq	$32, %rsp
 1664 0e06 5D       		popq	%rbp
 1665              		.cfi_restore 6
 1666              		.cfi_def_cfa 7, 8
 1667 0e07 C3       		ret
 1668              		.cfi_endproc
 1669              	.LFE19:
 1670              		.seh_endproc
 1672              		.seh_proc	yy_try_NUL_trans
 1673              	yy_try_NUL_trans:
 1674              	.LFB20:
1077:lex.yy.c      **** }
1078:lex.yy.c      **** 
1079:lex.yy.c      **** /* yy_try_NUL_trans - try to make a transition on the NUL character
1080:lex.yy.c      ****  *
1081:lex.yy.c      ****  * synopsis
1082:lex.yy.c      ****  *	next_state = yy_try_NUL_trans( current_state );
1083:lex.yy.c      ****  */
1084:lex.yy.c      ****     static yy_state_type yy_try_NUL_trans  (yy_state_type yy_current_state )
 1675              		.loc 1 1084 1
 1676              		.cfi_startproc
 1677 0e08 55       		pushq	%rbp
 1678              		.seh_pushreg	%rbp
 1679              		.cfi_def_cfa_offset 16
 1680              		.cfi_offset 6, -16
 1681 0e09 4889E5   		movq	%rsp, %rbp
 1682              		.seh_setframe	%rbp, 0
 1683              		.cfi_def_cfa_register 6
 1684 0e0c 4883EC20 		subq	$32, %rsp
 1685              		.seh_stackalloc	32
 1686              		.seh_endprologue
 1687 0e10 894D10   		movl	%ecx, 16(%rbp)
1085:lex.yy.c      **** {
1086:lex.yy.c      **** 	int yy_is_jam;
 1688              		.loc 1 1086 12
 1689 0e13 488B0558 		movq	yy_c_buf_p(%rip), %rax
 1689      000000
 1690 0e1a 488945F0 		movq	%rax, -16(%rbp)
1087:lex.yy.c      ****     	char *yy_cp = (yy_c_buf_p);
1088:lex.yy.c      **** 
 1691              		.loc 1 1088 10
 1692 0e1e C645FF01 		movb	$1, -1(%rbp)
1089:lex.yy.c      **** 	YY_CHAR yy_c = 1;
 1693              		.loc 1 1089 16
 1694 0e22 8B4510   		movl	16(%rbp), %eax
 1695 0e25 4898     		cltq
 1696 0e27 488D1400 		leaq	(%rax,%rax), %rdx
 1697 0e2b 488D0500 		leaq	yy_accept(%rip), %rax
 1697      000000
 1698 0e32 0FB70402 		movzwl	(%rdx,%rax), %eax
 1699              		.loc 1 1089 5
 1700 0e36 6685C0   		testw	%ax, %ax
 1701 0e39 7448     		je	.L84
1090:lex.yy.c      **** 	if ( yy_accept[yy_current_state] )
1091:lex.yy.c      **** 		{
 1702              		.loc 1 1091 29
 1703 0e3b 8B4510   		movl	16(%rbp), %eax
 1704 0e3e 89056C00 		movl	%eax, yy_last_accepting_state(%rip)
 1704      0000
1092:lex.yy.c      **** 		(yy_last_accepting_state) = yy_current_state;
 1705              		.loc 1 1092 28
 1706 0e44 488B45F0 		movq	-16(%rbp), %rax
 1707 0e48 48890570 		movq	%rax, yy_last_accepting_cpos(%rip)
 1707      000000
1093:lex.yy.c      **** 		(yy_last_accepting_cpos) = yy_cp;
1094:lex.yy.c      **** 		}
 1708              		.loc 1 1094 8
 1709 0e4f EB32     		jmp	.L84
 1710              	.L85:
1095:lex.yy.c      **** 	while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
1096:lex.yy.c      **** 		{
 1711              		.loc 1 1096 34
 1712 0e51 8B4510   		movl	16(%rbp), %eax
 1713 0e54 4898     		cltq
 1714 0e56 488D1400 		leaq	(%rax,%rax), %rdx
 1715 0e5a 488D05A0 		leaq	yy_def(%rip), %rax
 1715      010000
 1716 0e61 0FB70402 		movzwl	(%rdx,%rax), %eax
 1717              		.loc 1 1096 20
 1718 0e65 98       		cwtl
 1719 0e66 894510   		movl	%eax, 16(%rbp)
1097:lex.yy.c      **** 		yy_current_state = (int) yy_def[yy_current_state];
 1720              		.loc 1 1097 6
 1721 0e69 837D101B 		cmpl	$27, 16(%rbp)
 1722 0e6d 7E14     		jle	.L84
1098:lex.yy.c      **** 		if ( yy_current_state >= 28 )
 1723              		.loc 1 1098 18
 1724 0e6f 0FB645FF 		movzbl	-1(%rbp), %eax
 1725              		.loc 1 1098 9
 1726 0e73 4898     		cltq
 1727 0e75 488D1540 		leaq	yy_meta(%rip), %rdx
 1727      010000
 1728 0e7c 0FB60410 		movzbl	(%rax,%rdx), %eax
 1729 0e80 8845FF   		movb	%al, -1(%rbp)
 1730              	.L84:
1094:lex.yy.c      **** 	while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 1731              		.loc 1 1094 24
 1732 0e83 8B4510   		movl	16(%rbp), %eax
 1733 0e86 4898     		cltq
 1734 0e88 488D1400 		leaq	(%rax,%rax), %rdx
 1735 0e8c 488D0560 		leaq	yy_base(%rip), %rax
 1735      010000
 1736 0e93 0FB70402 		movzwl	(%rdx,%rax), %eax
 1737 0e97 0FBFD0   		movswl	%ax, %edx
1094:lex.yy.c      **** 	while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 1738              		.loc 1 1094 43
 1739 0e9a 0FB645FF 		movzbl	-1(%rbp), %eax
 1740 0e9e 01D0     		addl	%edx, %eax
1094:lex.yy.c      **** 	while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 1741              		.loc 1 1094 16
 1742 0ea0 4898     		cltq
 1743 0ea2 488D1400 		leaq	(%rax,%rax), %rdx
 1744 0ea6 488D0560 		leaq	yy_chk(%rip), %rax
 1744      020000
 1745 0ead 0FB70402 		movzwl	(%rdx,%rax), %eax
 1746 0eb1 98       		cwtl
1094:lex.yy.c      **** 	while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 1747              		.loc 1 1094 51
 1748 0eb2 394510   		cmpl	%eax, 16(%rbp)
 1749 0eb5 759A     		jne	.L85
1099:lex.yy.c      **** 			yy_c = yy_meta[yy_c];
1100:lex.yy.c      **** 		}
 1750              		.loc 1 1100 35
 1751 0eb7 8B4510   		movl	16(%rbp), %eax
 1752 0eba 4898     		cltq
 1753 0ebc 488D1400 		leaq	(%rax,%rax), %rdx
 1754 0ec0 488D0560 		leaq	yy_base(%rip), %rax
 1754      010000
 1755 0ec7 0FB70402 		movzwl	(%rdx,%rax), %eax
 1756 0ecb 0FBFD0   		movswl	%ax, %edx
 1757              		.loc 1 1100 54
 1758 0ece 0FB645FF 		movzbl	-1(%rbp), %eax
 1759 0ed2 01D0     		addl	%edx, %eax
 1760              		.loc 1 1100 27
 1761 0ed4 4898     		cltq
 1762 0ed6 488D1400 		leaq	(%rax,%rax), %rdx
 1763 0eda 488D05E0 		leaq	yy_nxt(%rip), %rax
 1763      010000
 1764 0ee1 0FB70402 		movzwl	(%rdx,%rax), %eax
 1765              		.loc 1 1100 19
 1766 0ee5 98       		cwtl
 1767 0ee6 894510   		movl	%eax, 16(%rbp)
1101:lex.yy.c      **** 	yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
 1768              		.loc 1 1101 32
 1769 0ee9 837D101B 		cmpl	$27, 16(%rbp)
 1770 0eed 0F94C0   		sete	%al
 1771              		.loc 1 1101 12
 1772 0ef0 0FB6C0   		movzbl	%al, %eax
 1773 0ef3 8945EC   		movl	%eax, -20(%rbp)
1102:lex.yy.c      **** 	yy_is_jam = (yy_current_state == 27);
1103:lex.yy.c      **** 
 1774              		.loc 1 1103 24
 1775 0ef6 837DEC00 		cmpl	$0, -20(%rbp)
 1776 0efa 7505     		jne	.L86
 1777              		.loc 1 1103 24 is_stmt 0 discriminator 1
 1778 0efc 8B4510   		movl	16(%rbp), %eax
 1779              		.loc 1 1103 24
 1780 0eff EB05     		jmp	.L88
 1781              	.L86:
 1782              		.loc 1 1103 24 discriminator 2
 1783 0f01 B8000000 		movl	$0, %eax
 1783      00
 1784              	.L88:
1104:lex.yy.c      **** 		return yy_is_jam ? 0 : yy_current_state;
 1785              		.loc 1 1104 1 is_stmt 1
 1786 0f06 4883C420 		addq	$32, %rsp
 1787 0f0a 5D       		popq	%rbp
 1788              		.cfi_restore 6
 1789              		.cfi_def_cfa 7, 8
 1790 0f0b C3       		ret
 1791              		.cfi_endproc
 1792              	.LFE20:
 1793              		.seh_endproc
 1794              		.section .rdata,"dr"
 1795 0446 0000     		.align 8
 1796              	.LC10:
 1797 0448 666C6578 		.ascii "flex scanner push-back overflow\0"
 1797      20736361 
 1797      6E6E6572 
 1797      20707573 
 1797      682D6261 
 1798              		.text
 1800              		.seh_proc	yyunput
 1801              	yyunput:
 1802              	.LFB21:
1105:lex.yy.c      **** }
1106:lex.yy.c      **** 
1107:lex.yy.c      **** #ifndef YY_NO_UNPUT
1108:lex.yy.c      **** 
1109:lex.yy.c      ****     static void yyunput (int c, char * yy_bp )
 1803              		.loc 1 1109 1
 1804              		.cfi_startproc
 1805 0f0c 55       		pushq	%rbp
 1806              		.seh_pushreg	%rbp
 1807              		.cfi_def_cfa_offset 16
 1808              		.cfi_offset 6, -16
 1809 0f0d 4889E5   		movq	%rsp, %rbp
 1810              		.seh_setframe	%rbp, 0
 1811              		.cfi_def_cfa_register 6
 1812 0f10 4883EC40 		subq	$64, %rsp
 1813              		.seh_stackalloc	64
 1814              		.seh_endprologue
 1815 0f14 894D10   		movl	%ecx, 16(%rbp)
 1816 0f17 48895518 		movq	%rdx, 24(%rbp)
1110:lex.yy.c      **** {
1111:lex.yy.c      **** 	char *yy_cp;
1112:lex.yy.c      ****     
 1817              		.loc 1 1112 11
 1818 0f1b 488B0558 		movq	yy_c_buf_p(%rip), %rax
 1818      000000
 1819 0f22 488945F8 		movq	%rax, -8(%rbp)
1113:lex.yy.c      ****     yy_cp = (yy_c_buf_p);
1114:lex.yy.c      **** 
1115:lex.yy.c      **** 	/* undo effects of setting up yytext */
 1820              		.loc 1 1115 9
 1821 0f26 0FB61550 		movzbl	yy_hold_char(%rip), %edx
 1821      000000
 1822 0f2d 488B45F8 		movq	-8(%rbp), %rax
 1823 0f31 8810     		movb	%dl, (%rax)
1116:lex.yy.c      **** 	*yy_cp = (yy_hold_char);
1117:lex.yy.c      **** 
 1824              		.loc 1 1117 15
 1825 0f33 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1825      000000
 1826 0f3a 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1826      000000
 1827 0f41 48C1E203 		salq	$3, %rdx
 1828 0f45 4801D0   		addq	%rdx, %rax
 1829 0f48 488B00   		movq	(%rax), %rax
 1830              		.loc 1 1117 39
 1831 0f4b 488B4008 		movq	8(%rax), %rax
 1832              		.loc 1 1117 51
 1833 0f4f 4883C002 		addq	$2, %rax
 1834              		.loc 1 1117 5
 1835 0f53 483945F8 		cmpq	%rax, -8(%rbp)
 1836 0f57 0F834601 		jnb	.L90
 1836      0000
 1837              	.LBB12:
1118:lex.yy.c      **** 	if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
1119:lex.yy.c      **** 		{ /* need to shift things up to make room */
1120:lex.yy.c      **** 		/* +2 for EOB chars. */
 1838              		.loc 1 1120 37
 1839 0f5d 8B055400 		movl	yy_n_chars(%rip), %eax
 1839      0000
 1840              		.loc 1 1120 7
 1841 0f63 83C002   		addl	$2, %eax
 1842 0f66 8945E4   		movl	%eax, -28(%rbp)
1121:lex.yy.c      **** 		int number_to_move = (yy_n_chars) + 2;
 1843              		.loc 1 1121 17
 1844 0f69 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1844      000000
 1845 0f70 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1845      000000
 1846 0f77 48C1E203 		salq	$3, %rdx
 1847 0f7b 4801D0   		addq	%rdx, %rax
 1848 0f7e 488B00   		movq	(%rax), %rax
 1849              		.loc 1 1121 41
 1850 0f81 488B5008 		movq	8(%rax), %rdx
1122:lex.yy.c      **** 		char *dest = &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[
 1851              		.loc 1 1122 6
 1852 0f85 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1852      000000
 1853 0f8c 488B0D38 		movq	yy_buffer_stack_top(%rip), %rcx
 1853      000000
 1854 0f93 48C1E103 		salq	$3, %rcx
 1855 0f97 4801C8   		addq	%rcx, %rax
 1856 0f9a 488B00   		movq	(%rax), %rax
 1857              		.loc 1 1122 30
 1858 0f9d 8B4018   		movl	24(%rax), %eax
 1859 0fa0 4898     		cltq
1121:lex.yy.c      **** 		int number_to_move = (yy_n_chars) + 2;
 1860              		.loc 1 1121 52
 1861 0fa2 4883C002 		addq	$2, %rax
1121:lex.yy.c      **** 		int number_to_move = (yy_n_chars) + 2;
 1862              		.loc 1 1121 9
 1863 0fa6 4801D0   		addq	%rdx, %rax
 1864 0fa9 488945F0 		movq	%rax, -16(%rbp)
1123:lex.yy.c      **** 					YY_CURRENT_BUFFER_LVALUE->yy_buf_size + 2];
1124:lex.yy.c      **** 		char *source =
 1865              		.loc 1 1124 6
 1866 0fad 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1866      000000
 1867 0fb4 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1867      000000
 1868 0fbb 48C1E203 		salq	$3, %rdx
 1869 0fbf 4801D0   		addq	%rdx, %rax
 1870 0fc2 488B00   		movq	(%rax), %rax
 1871              		.loc 1 1124 30
 1872 0fc5 488B5008 		movq	8(%rax), %rdx
 1873              		.loc 1 1124 5
 1874 0fc9 8B45E4   		movl	-28(%rbp), %eax
 1875 0fcc 4898     		cltq
1123:lex.yy.c      **** 					YY_CURRENT_BUFFER_LVALUE->yy_buf_size + 2];
 1876              		.loc 1 1123 9
 1877 0fce 4801D0   		addq	%rdx, %rax
 1878 0fd1 488945E8 		movq	%rax, -24(%rbp)
1125:lex.yy.c      **** 				&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[number_to_move];
1126:lex.yy.c      **** 
 1879              		.loc 1 1126 9
 1880 0fd5 EB17     		jmp	.L91
 1881              	.L92:
1127:lex.yy.c      **** 		while ( source > YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
 1882              		.loc 1 1127 12
 1883 0fd7 48836DE8 		subq	$1, -24(%rbp)
 1883      01
 1884 0fdc 48836DF0 		subq	$1, -16(%rbp)
 1884      01
 1885              		.loc 1 1127 14
 1886 0fe1 488B45E8 		movq	-24(%rbp), %rax
 1887 0fe5 0FB610   		movzbl	(%rax), %edx
 1888              		.loc 1 1127 12
 1889 0fe8 488B45F0 		movq	-16(%rbp), %rax
 1890 0fec 8810     		movb	%dl, (%rax)
 1891              	.L91:
1126:lex.yy.c      **** 		while ( source > YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
 1892              		.loc 1 1126 20
 1893 0fee 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1893      000000
 1894 0ff5 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1894      000000
 1895 0ffc 48C1E203 		salq	$3, %rdx
 1896 1000 4801D0   		addq	%rdx, %rax
 1897 1003 488B00   		movq	(%rax), %rax
1126:lex.yy.c      **** 		while ( source > YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
 1898              		.loc 1 1126 44
 1899 1006 488B4008 		movq	8(%rax), %rax
1126:lex.yy.c      **** 		while ( source > YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
 1900              		.loc 1 1126 18
 1901 100a 483B45E8 		cmpq	-24(%rbp), %rax
 1902 100e 72C7     		jb	.L92
1128:lex.yy.c      **** 			*--dest = *--source;
1129:lex.yy.c      **** 
 1903              		.loc 1 1129 24
 1904 1010 488B45F0 		movq	-16(%rbp), %rax
 1905 1014 482B45E8 		subq	-24(%rbp), %rax
 1906              		.loc 1 1129 12
 1907 1018 4898     		cltq
 1908              		.loc 1 1129 9
 1909 101a 480145F8 		addq	%rax, -8(%rbp)
1130:lex.yy.c      **** 		yy_cp += (int) (dest - source);
 1910              		.loc 1 1130 24
 1911 101e 488B45F0 		movq	-16(%rbp), %rax
 1912 1022 482B45E8 		subq	-24(%rbp), %rax
 1913              		.loc 1 1130 12
 1914 1026 4898     		cltq
 1915              		.loc 1 1130 9
 1916 1028 48014518 		addq	%rax, 24(%rbp)
1131:lex.yy.c      **** 		yy_bp += (int) (dest - source);
1132:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =
 1917              		.loc 1 1132 25
 1918 102c 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1918      000000
 1919 1033 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1919      000000
 1920 103a 48C1E203 		salq	$3, %rdx
 1921 103e 4801D0   		addq	%rdx, %rax
 1922 1041 488B00   		movq	(%rax), %rax
 1923              		.loc 1 1132 19
 1924 1044 8B4018   		movl	24(%rax), %eax
 1925              		.loc 1 1132 17
 1926 1047 89055400 		movl	%eax, yy_n_chars(%rip)
 1926      0000
1131:lex.yy.c      **** 		yy_bp += (int) (dest - source);
 1927              		.loc 1 1131 3
 1928 104d 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1928      000000
 1929 1054 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1929      000000
 1930 105b 48C1E203 		salq	$3, %rdx
 1931 105f 4801D0   		addq	%rdx, %rax
 1932 1062 488B00   		movq	(%rax), %rax
1131:lex.yy.c      **** 		yy_bp += (int) (dest - source);
 1933              		.loc 1 1131 40
 1934 1065 8B155400 		movl	yy_n_chars(%rip), %edx
 1934      0000
 1935 106b 89501C   		movl	%edx, 28(%rax)
1133:lex.yy.c      **** 			(yy_n_chars) = (int) YY_CURRENT_BUFFER_LVALUE->yy_buf_size;
1134:lex.yy.c      **** 
 1936              		.loc 1 1134 16
 1937 106e 488B0548 		movq	yy_buffer_stack(%rip), %rax
 1937      000000
 1938 1075 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 1938      000000
 1939 107c 48C1E203 		salq	$3, %rdx
 1940 1080 4801D0   		addq	%rdx, %rax
 1941 1083 488B00   		movq	(%rax), %rax
 1942              		.loc 1 1134 40
 1943 1086 488B4008 		movq	8(%rax), %rax
 1944              		.loc 1 1134 52
 1945 108a 4883C002 		addq	$2, %rax
 1946              		.loc 1 1134 6
 1947 108e 483945F8 		cmpq	%rax, -8(%rbp)
 1948 1092 730F     		jnb	.L90
1135:lex.yy.c      **** 		if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
 1949              		.loc 1 1135 4
 1950 1094 488D0548 		leaq	.LC10(%rip), %rax
 1950      040000
 1951 109b 4889C1   		movq	%rax, %rcx
 1952 109e E8800B00 		call	yy_fatal_error
 1952      00
 1953              	.L90:
 1954              	.LBE12:
1136:lex.yy.c      **** 			YY_FATAL_ERROR( "flex scanner push-back overflow" );
1137:lex.yy.c      **** 		}
1138:lex.yy.c      **** 
 1955              		.loc 1 1138 11
 1956 10a3 48836DF8 		subq	$1, -8(%rbp)
 1956      01
 1957              		.loc 1 1138 13
 1958 10a8 8B4510   		movl	16(%rbp), %eax
 1959 10ab 89C2     		movl	%eax, %edx
 1960              		.loc 1 1138 11
 1961 10ad 488B45F8 		movq	-8(%rbp), %rax
 1962 10b1 8810     		movb	%dl, (%rax)
1139:lex.yy.c      **** 	*--yy_cp = (char) c;
1140:lex.yy.c      **** 
 1963              		.loc 1 1140 15
 1964 10b3 488B4518 		movq	24(%rbp), %rax
 1965 10b7 48890520 		movq	%rax, yytext(%rip)
 1965      000000
1141:lex.yy.c      **** 	(yytext_ptr) = yy_bp;
 1966              		.loc 1 1141 19
 1967 10be 488B45F8 		movq	-8(%rbp), %rax
 1968 10c2 0FB600   		movzbl	(%rax), %eax
 1969              		.loc 1 1141 17
 1970 10c5 88055000 		movb	%al, yy_hold_char(%rip)
 1970      0000
1142:lex.yy.c      **** 	(yy_hold_char) = *yy_cp;
 1971              		.loc 1 1142 15
 1972 10cb 488B45F8 		movq	-8(%rbp), %rax
 1973 10cf 48890558 		movq	%rax, yy_c_buf_p(%rip)
 1973      000000
1143:lex.yy.c      **** 	(yy_c_buf_p) = yy_cp;
 1974              		.loc 1 1143 1
 1975 10d6 90       		nop
 1976 10d7 4883C440 		addq	$64, %rsp
 1977 10db 5D       		popq	%rbp
 1978              		.cfi_restore 6
 1979              		.cfi_def_cfa 7, 8
 1980 10dc C3       		ret
 1981              		.cfi_endproc
 1982              	.LFE21:
 1983              		.seh_endproc
 1985              		.seh_proc	input
 1986              	input:
 1987              	.LFB22:
1144:lex.yy.c      **** }
1145:lex.yy.c      **** 
1146:lex.yy.c      **** #endif
1147:lex.yy.c      **** 
1148:lex.yy.c      **** #ifndef YY_NO_INPUT
1149:lex.yy.c      **** #ifdef __cplusplus
1150:lex.yy.c      ****     static int yyinput (void)
1151:lex.yy.c      **** #else
1152:lex.yy.c      ****     static int input  (void)
1153:lex.yy.c      **** #endif
1154:lex.yy.c      **** 
 1988              		.loc 1 1154 1
 1989              		.cfi_startproc
 1990 10dd 55       		pushq	%rbp
 1991              		.seh_pushreg	%rbp
 1992              		.cfi_def_cfa_offset 16
 1993              		.cfi_offset 6, -16
 1994 10de 4889E5   		movq	%rsp, %rbp
 1995              		.seh_setframe	%rbp, 0
 1996              		.cfi_def_cfa_register 6
 1997 10e1 4883EC30 		subq	$48, %rsp
 1998              		.seh_stackalloc	48
 1999              		.seh_endprologue
1155:lex.yy.c      **** {
1156:lex.yy.c      **** 	int c;
1157:lex.yy.c      ****     
 2000              		.loc 1 1157 2
 2001 10e5 488B0558 		movq	yy_c_buf_p(%rip), %rax
 2001      000000
 2002              		.loc 1 1157 16
 2003 10ec 0FB61550 		movzbl	yy_hold_char(%rip), %edx
 2003      000000
 2004 10f3 8810     		movb	%dl, (%rax)
1158:lex.yy.c      **** 	*(yy_c_buf_p) = (yy_hold_char);
1159:lex.yy.c      **** 
 2005              		.loc 1 1159 7
 2006 10f5 488B0558 		movq	yy_c_buf_p(%rip), %rax
 2006      000000
 2007 10fc 0FB600   		movzbl	(%rax), %eax
 2008              		.loc 1 1159 5
 2009 10ff 84C0     		testb	%al, %al
 2010 1101 0F85D800 		jne	.L94
 2010      0000
1160:lex.yy.c      **** 	if ( *(yy_c_buf_p) == YY_END_OF_BUFFER_CHAR )
1161:lex.yy.c      **** 		{
1162:lex.yy.c      **** 		/* yy_c_buf_p now points to the character we want to return.
1163:lex.yy.c      **** 		 * If this occurs *before* the EOB characters, then it's a
1164:lex.yy.c      **** 		 * valid NUL; if not, then we've hit the end of the buffer.
1165:lex.yy.c      **** 		 */
 2011              		.loc 1 1165 24
 2012 1107 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2012      000000
 2013 110e 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2013      000000
 2014 1115 48C1E203 		salq	$3, %rdx
 2015 1119 4801D0   		addq	%rdx, %rax
 2016 111c 488B00   		movq	(%rax), %rax
 2017              		.loc 1 1165 48
 2018 111f 488B5008 		movq	8(%rax), %rdx
 2019              		.loc 1 1165 23
 2020 1123 8B055400 		movl	yy_n_chars(%rip), %eax
 2020      0000
 2021 1129 4898     		cltq
 2022 112b 4801D0   		addq	%rdx, %rax
 2023              		.loc 1 1165 21
 2024 112e 488B1558 		movq	yy_c_buf_p(%rip), %rdx
 2024      000000
 2025              		.loc 1 1165 6
 2026 1135 4839C2   		cmpq	%rax, %rdx
 2027 1138 730F     		jnb	.L95
1166:lex.yy.c      **** 		if ( (yy_c_buf_p) < &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars)] )
1167:lex.yy.c      **** 			/* This was really a NUL. */
 2028              		.loc 1 1167 4
 2029 113a 488B0558 		movq	yy_c_buf_p(%rip), %rax
 2029      000000
 2030              		.loc 1 1167 18
 2031 1141 C60000   		movb	$0, (%rax)
 2032 1144 E9960000 		jmp	.L94
 2032      00
 2033              	.L95:
 2034              	.LBB13:
1168:lex.yy.c      **** 			*(yy_c_buf_p) = '\0';
1169:lex.yy.c      **** 
1170:lex.yy.c      **** 		else
1171:lex.yy.c      **** 			{ /* need more input */
 2035              		.loc 1 1171 37
 2036 1149 488B1558 		movq	yy_c_buf_p(%rip), %rdx
 2036      000000
 2037 1150 488B0520 		movq	yytext(%rip), %rax
 2037      000000
 2038 1157 4829C2   		subq	%rax, %rdx
 2039              		.loc 1 1171 8
 2040 115a 8955FC   		movl	%edx, -4(%rbp)
1172:lex.yy.c      **** 			int offset = (int) ((yy_c_buf_p) - (yytext_ptr));
 2041              		.loc 1 1172 4
 2042 115d 488B0558 		movq	yy_c_buf_p(%rip), %rax
 2042      000000
 2043 1164 4883C001 		addq	$1, %rax
 2044 1168 48890558 		movq	%rax, yy_c_buf_p(%rip)
 2044      000000
1173:lex.yy.c      **** 			++(yy_c_buf_p);
1174:lex.yy.c      **** 
 2045              		.loc 1 1174 13
 2046 116f E805F5FF 		call	yy_get_next_buffer
 2046      FF
 2047              		.loc 1 1174 4 discriminator 1
 2048 1174 83F802   		cmpl	$2, %eax
 2049 1177 7410     		je	.L96
 2050 1179 83F802   		cmpl	$2, %eax
 2051 117c 7F61     		jg	.L94
 2052 117e 85C0     		testl	%eax, %eax
 2053 1180 7446     		je	.L97
 2054 1182 83F801   		cmpl	$1, %eax
 2055 1185 7411     		je	.L98
 2056 1187 EB56     		jmp	.L94
 2057              	.L96:
1175:lex.yy.c      **** 			switch ( yy_get_next_buffer(  ) )
1176:lex.yy.c      **** 				{
1177:lex.yy.c      **** 				case EOB_ACT_LAST_MATCH:
1178:lex.yy.c      **** 					/* This happens because yy_g_n_b()
1179:lex.yy.c      **** 					 * sees that we've accumulated a
1180:lex.yy.c      **** 					 * token and flags that we need to
1181:lex.yy.c      **** 					 * try matching the token before
1182:lex.yy.c      **** 					 * proceeding.  But for input(),
1183:lex.yy.c      **** 					 * there's no matching to consider.
1184:lex.yy.c      **** 					 * So convert the EOB_ACT_LAST_MATCH
1185:lex.yy.c      **** 					 * to EOB_ACT_END_OF_FILE.
1186:lex.yy.c      **** 					 */
1187:lex.yy.c      **** 
1188:lex.yy.c      **** 					/* Reset buffer status. */
 2058              		.loc 1 1188 6
 2059 1189 488B0508 		movq	yyin(%rip), %rax
 2059      000000
 2060 1190 4889C1   		movq	%rax, %rcx
 2061 1193 E88C0000 		call	yyrestart
 2061      00
 2062              	.L98:
1189:lex.yy.c      **** 					yyrestart( yyin );
1190:lex.yy.c      **** 
1191:lex.yy.c      **** 					/*FALLTHROUGH*/
1192:lex.yy.c      **** 
1193:lex.yy.c      **** 				case EOB_ACT_END_OF_FILE:
1194:lex.yy.c      **** 					{
 2063              		.loc 1 1194 11
 2064 1198 E8D60C00 		call	yywrap
 2064      00
 2065              		.loc 1 1194 9 discriminator 1
 2066 119d 85C0     		testl	%eax, %eax
 2067 119f 7407     		je	.L99
1195:lex.yy.c      **** 					if ( yywrap(  ) )
 2068              		.loc 1 1195 14
 2069 11a1 B8000000 		movl	$0, %eax
 2069      00
 2070 11a6 EB76     		jmp	.L100
 2071              	.L99:
1196:lex.yy.c      **** 						return 0;
1197:lex.yy.c      **** 
 2072              		.loc 1 1197 11
 2073 11a8 8B056800 		movl	yy_did_buffer_switch_on_eof(%rip), %eax
 2073      0000
 2074              		.loc 1 1197 9
 2075 11ae 85C0     		testl	%eax, %eax
 2076 11b0 750F     		jne	.L101
1198:lex.yy.c      **** 					if ( ! (yy_did_buffer_switch_on_eof) )
 2077              		.loc 1 1198 7
 2078 11b2 488B0508 		movq	yyin(%rip), %rax
 2078      000000
 2079 11b9 4889C1   		movq	%rax, %rcx
 2080 11bc E8630000 		call	yyrestart
 2080      00
 2081              	.L101:
1199:lex.yy.c      **** 						YY_NEW_FILE;
1200:lex.yy.c      **** #ifdef __cplusplus
1201:lex.yy.c      **** 					return yyinput();
1202:lex.yy.c      **** #else
 2082              		.loc 1 1202 13
 2083 11c1 E817FFFF 		call	input
 2083      FF
 2084 11c6 EB56     		jmp	.L100
 2085              	.L97:
1203:lex.yy.c      **** 					return input();
1204:lex.yy.c      **** #endif
1205:lex.yy.c      **** 					}
1206:lex.yy.c      **** 
1207:lex.yy.c      **** 				case EOB_ACT_CONTINUE_SCAN:
 2086              		.loc 1 1207 34
 2087 11c8 488B1520 		movq	yytext(%rip), %rdx
 2087      000000
 2088 11cf 8B45FC   		movl	-4(%rbp), %eax
 2089 11d2 4898     		cltq
 2090 11d4 4801D0   		addq	%rdx, %rax
 2091              		.loc 1 1207 19
 2092 11d7 48890558 		movq	%rax, yy_c_buf_p(%rip)
 2092      000000
1208:lex.yy.c      **** 					(yy_c_buf_p) = (yytext_ptr) + offset;
 2093              		.loc 1 1208 6
 2094 11de 90       		nop
 2095              	.L94:
 2096              	.LBE13:
1209:lex.yy.c      **** 					break;
1210:lex.yy.c      **** 				}
1211:lex.yy.c      **** 			}
1212:lex.yy.c      **** 		}
1213:lex.yy.c      **** 
 2097              		.loc 1 1213 7
 2098 11df 488B0558 		movq	yy_c_buf_p(%rip), %rax
 2098      000000
 2099              		.loc 1 1213 6
 2100 11e6 0FB600   		movzbl	(%rax), %eax
 2101              		.loc 1 1213 4
 2102 11e9 0FB6C0   		movzbl	%al, %eax
 2103 11ec 8945F8   		movl	%eax, -8(%rbp)
1214:lex.yy.c      **** 	c = *(unsigned char *) (yy_c_buf_p);	/* cast for 8-bit char's */
 2104              		.loc 1 1214 2
 2105 11ef 488B0558 		movq	yy_c_buf_p(%rip), %rax
 2105      000000
 2106              		.loc 1 1214 16
 2107 11f6 C60000   		movb	$0, (%rax)
1215:lex.yy.c      **** 	*(yy_c_buf_p) = '\0';	/* preserve yytext */
 2108              		.loc 1 1215 20
 2109 11f9 488B0558 		movq	yy_c_buf_p(%rip), %rax
 2109      000000
 2110 1200 4883C001 		addq	$1, %rax
 2111              		.loc 1 1215 17
 2112 1204 48890558 		movq	%rax, yy_c_buf_p(%rip)
 2112      000000
 2113              		.loc 1 1215 20
 2114 120b 488B0558 		movq	yy_c_buf_p(%rip), %rax
 2114      000000
 2115              		.loc 1 1215 19
 2116 1212 0FB600   		movzbl	(%rax), %eax
 2117              		.loc 1 1215 17
 2118 1215 88055000 		movb	%al, yy_hold_char(%rip)
 2118      0000
1216:lex.yy.c      **** 	(yy_hold_char) = *++(yy_c_buf_p);
1217:lex.yy.c      **** 
 2119              		.loc 1 1217 9
 2120 121b 8B45F8   		movl	-8(%rbp), %eax
 2121              	.L100:
1218:lex.yy.c      **** 	return c;
 2122              		.loc 1 1218 1
 2123 121e 4883C430 		addq	$48, %rsp
 2124 1222 5D       		popq	%rbp
 2125              		.cfi_restore 6
 2126              		.cfi_def_cfa 7, 8
 2127 1223 C3       		ret
 2128              		.cfi_endproc
 2129              	.LFE22:
 2130              		.seh_endproc
 2131              		.globl	yyrestart
 2133              		.seh_proc	yyrestart
 2134              	yyrestart:
 2135              	.LFB23:
1219:lex.yy.c      **** }
1220:lex.yy.c      **** #endif	/* ifndef YY_NO_INPUT */
1221:lex.yy.c      **** 
1222:lex.yy.c      **** /** Immediately switch to a different input stream.
1223:lex.yy.c      ****  * @param input_file A readable stream.
1224:lex.yy.c      ****  * 
1225:lex.yy.c      ****  * @note This function does not reset the start condition to @c INITIAL .
1226:lex.yy.c      ****  */
1227:lex.yy.c      ****     void yyrestart  (FILE * input_file )
 2136              		.loc 1 1227 1
 2137              		.cfi_startproc
 2138 1224 55       		pushq	%rbp
 2139              		.seh_pushreg	%rbp
 2140              		.cfi_def_cfa_offset 16
 2141              		.cfi_offset 6, -16
 2142 1225 53       		pushq	%rbx
 2143              		.seh_pushreg	%rbx
 2144              		.cfi_def_cfa_offset 24
 2145              		.cfi_offset 3, -24
 2146 1226 4883EC28 		subq	$40, %rsp
 2147              		.seh_stackalloc	40
 2148              		.cfi_def_cfa_offset 64
 2149 122a 488D6C24 		leaq	32(%rsp), %rbp
 2149      20
 2150              		.seh_setframe	%rbp, 32
 2151              		.cfi_def_cfa 6, 32
 2152              		.seh_endprologue
 2153 122f 48894D20 		movq	%rcx, 32(%rbp)
1228:lex.yy.c      **** {
1229:lex.yy.c      ****     
 2154              		.loc 1 1229 9
 2155 1233 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2155      000000
 2156              		.loc 1 1229 5
 2157 123a 4885C0   		testq	%rax, %rax
 2158 123d 741D     		je	.L103
 2159              		.loc 1 1229 9 discriminator 1
 2160 123f 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2160      000000
 2161 1246 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2161      000000
 2162 124d 48C1E203 		salq	$3, %rdx
 2163 1251 4801D0   		addq	%rdx, %rax
 2164 1254 488B00   		movq	(%rax), %rax
 2165              		.loc 1 1229 7 discriminator 1
 2166 1257 4885C0   		testq	%rax, %rax
 2167 125a 7532     		jne	.L104
 2168              	.L103:
1230:lex.yy.c      **** 	if ( ! YY_CURRENT_BUFFER ){
 2169              		.loc 1 1230 9
 2170 125c E87A0600 		call	yyensure_buffer_stack
 2170      00
1231:lex.yy.c      ****         yyensure_buffer_stack ();
1232:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE =
 2171              		.loc 1 1232 13
 2172 1261 488B0508 		movq	yyin(%rip), %rax
 2172      000000
1231:lex.yy.c      ****         yyensure_buffer_stack ();
 2173              		.loc 1 1231 3
 2174 1268 488B1548 		movq	yy_buffer_stack(%rip), %rdx
 2174      000000
 2175 126f 488B0D38 		movq	yy_buffer_stack_top(%rip), %rcx
 2175      000000
 2176 1276 48C1E103 		salq	$3, %rcx
 2177 127a 488D1C0A 		leaq	(%rdx,%rcx), %rbx
 2178              		.loc 1 1232 13
 2179 127e BA004000 		movl	$16384, %edx
 2179      00
 2180 1283 4889C1   		movq	%rax, %rcx
 2181 1286 E8C90100 		call	yy_create_buffer
 2181      00
1231:lex.yy.c      ****         yyensure_buffer_stack ();
 2182              		.loc 1 1231 28
 2183 128b 488903   		movq	%rax, (%rbx)
 2184              	.L104:
1233:lex.yy.c      ****             yy_create_buffer( yyin, YY_BUF_SIZE );
1234:lex.yy.c      **** 	}
1235:lex.yy.c      **** 
 2185              		.loc 1 1235 18
 2186 128e 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2186      000000
 2187              		.loc 1 1235 2
 2188 1295 4885C0   		testq	%rax, %rax
 2189 1298 741A     		je	.L105
 2190              		.loc 1 1235 18 discriminator 1
 2191 129a 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2191      000000
 2192 12a1 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2192      000000
 2193 12a8 48C1E203 		salq	$3, %rdx
 2194 12ac 4801D0   		addq	%rdx, %rax
 2195              		.loc 1 1235 2 discriminator 1
 2196 12af 488B00   		movq	(%rax), %rax
 2197 12b2 EB05     		jmp	.L106
 2198              	.L105:
 2199              		.loc 1 1235 2 is_stmt 0 discriminator 2
 2200 12b4 B8000000 		movl	$0, %eax
 2200      00
 2201              	.L106:
 2202              		.loc 1 1235 2 discriminator 4
 2203 12b9 488B5520 		movq	32(%rbp), %rdx
 2204 12bd 4889C1   		movq	%rax, %rcx
 2205 12c0 E8B90200 		call	yy_init_buffer
 2205      00
1236:lex.yy.c      **** 	yy_init_buffer( YY_CURRENT_BUFFER, input_file );
 2206              		.loc 1 1236 2 is_stmt 1
 2207 12c5 E8FF0000 		call	yy_load_buffer_state
 2207      00
1237:lex.yy.c      **** 	yy_load_buffer_state(  );
 2208              		.loc 1 1237 1
 2209 12ca 90       		nop
 2210 12cb 4883C428 		addq	$40, %rsp
 2211 12cf 5B       		popq	%rbx
 2212              		.cfi_restore 3
 2213 12d0 5D       		popq	%rbp
 2214              		.cfi_restore 6
 2215              		.cfi_def_cfa 7, -24
 2216 12d1 C3       		ret
 2217              		.cfi_endproc
 2218              	.LFE23:
 2219              		.seh_endproc
 2220              		.globl	yy_switch_to_buffer
 2222              		.seh_proc	yy_switch_to_buffer
 2223              	yy_switch_to_buffer:
 2224              	.LFB24:
1238:lex.yy.c      **** }
1239:lex.yy.c      **** 
1240:lex.yy.c      **** /** Switch to a different input buffer.
1241:lex.yy.c      ****  * @param new_buffer The new input buffer.
1242:lex.yy.c      ****  * 
1243:lex.yy.c      ****  */
1244:lex.yy.c      ****     void yy_switch_to_buffer  (YY_BUFFER_STATE  new_buffer )
 2225              		.loc 1 1244 1
 2226              		.cfi_startproc
 2227 12d2 55       		pushq	%rbp
 2228              		.seh_pushreg	%rbp
 2229              		.cfi_def_cfa_offset 16
 2230              		.cfi_offset 6, -16
 2231 12d3 4889E5   		movq	%rsp, %rbp
 2232              		.seh_setframe	%rbp, 0
 2233              		.cfi_def_cfa_register 6
 2234 12d6 4883EC20 		subq	$32, %rsp
 2235              		.seh_stackalloc	32
 2236              		.seh_endprologue
 2237 12da 48894D10 		movq	%rcx, 16(%rbp)
1245:lex.yy.c      **** {
1246:lex.yy.c      ****     
1247:lex.yy.c      **** 	/* TODO. We should be able to replace this entire function body
1248:lex.yy.c      **** 	 * with
1249:lex.yy.c      **** 	 *		yypop_buffer_state();
1250:lex.yy.c      **** 	 *		yypush_buffer_state(new_buffer);
1251:lex.yy.c      ****      */
 2238              		.loc 1 1251 2
 2239 12de E8F80500 		call	yyensure_buffer_stack
 2239      00
1252:lex.yy.c      **** 	yyensure_buffer_stack ();
 2240              		.loc 1 1252 7
 2241 12e3 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2241      000000
 2242 12ea 4885C0   		testq	%rax, %rax
 2243 12ed 741A     		je	.L108
 2244              		.loc 1 1252 7 is_stmt 0 discriminator 1
 2245 12ef 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2245      000000
 2246 12f6 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2246      000000
 2247 12fd 48C1E203 		salq	$3, %rdx
 2248 1301 4801D0   		addq	%rdx, %rax
 2249 1304 488B00   		movq	(%rax), %rax
 2250 1307 EB05     		jmp	.L109
 2251              	.L108:
 2252              		.loc 1 1252 7 discriminator 2
 2253 1309 B8000000 		movl	$0, %eax
 2253      00
 2254              	.L109:
 2255              		.loc 1 1252 5 is_stmt 1 discriminator 4
 2256 130e 483B4510 		cmpq	16(%rbp), %rax
 2257 1312 0F84AA00 		je	.L113
 2257      0000
1253:lex.yy.c      **** 	if ( YY_CURRENT_BUFFER == new_buffer )
1254:lex.yy.c      **** 		return;
1255:lex.yy.c      **** 
 2258              		.loc 1 1255 7
 2259 1318 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2259      000000
 2260              		.loc 1 1255 5
 2261 131f 4885C0   		testq	%rax, %rax
 2262 1322 7471     		je	.L112
 2263              		.loc 1 1255 7 discriminator 1
 2264 1324 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2264      000000
 2265 132b 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2265      000000
 2266 1332 48C1E203 		salq	$3, %rdx
 2267 1336 4801D0   		addq	%rdx, %rax
 2268 1339 488B00   		movq	(%rax), %rax
 2269 133c 4885C0   		testq	%rax, %rax
 2270 133f 7454     		je	.L112
1256:lex.yy.c      **** 	if ( YY_CURRENT_BUFFER )
1257:lex.yy.c      **** 		{
1258:lex.yy.c      **** 		/* Flush out information for old buffer. */
 2271              		.loc 1 1258 3
 2272 1341 488B0558 		movq	yy_c_buf_p(%rip), %rax
 2272      000000
 2273              		.loc 1 1258 17
 2274 1348 0FB61550 		movzbl	yy_hold_char(%rip), %edx
 2274      000000
 2275 134f 8810     		movb	%dl, (%rax)
1259:lex.yy.c      **** 		*(yy_c_buf_p) = (yy_hold_char);
 2276              		.loc 1 1259 3
 2277 1351 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2277      000000
 2278 1358 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2278      000000
 2279 135f 48C1E203 		salq	$3, %rdx
 2280 1363 4801D0   		addq	%rdx, %rax
 2281 1366 488B00   		movq	(%rax), %rax
 2282              		.loc 1 1259 40
 2283 1369 488B1558 		movq	yy_c_buf_p(%rip), %rdx
 2283      000000
 2284 1370 48895010 		movq	%rdx, 16(%rax)
1260:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE->yy_buf_pos = (yy_c_buf_p);
 2285              		.loc 1 1260 3
 2286 1374 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2286      000000
 2287 137b 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2287      000000
 2288 1382 48C1E203 		salq	$3, %rdx
 2289 1386 4801D0   		addq	%rdx, %rax
 2290 1389 488B00   		movq	(%rax), %rax
 2291              		.loc 1 1260 40
 2292 138c 8B155400 		movl	yy_n_chars(%rip), %edx
 2292      0000
 2293 1392 89501C   		movl	%edx, 28(%rax)
 2294              	.L112:
1261:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars = (yy_n_chars);
1262:lex.yy.c      **** 		}
1263:lex.yy.c      **** 
 2295              		.loc 1 1263 2
 2296 1395 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2296      000000
 2297 139c 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2297      000000
 2298 13a3 48C1E203 		salq	$3, %rdx
 2299 13a7 4801C2   		addq	%rax, %rdx
 2300              		.loc 1 1263 27
 2301 13aa 488B4510 		movq	16(%rbp), %rax
 2302 13ae 488902   		movq	%rax, (%rdx)
1264:lex.yy.c      **** 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
 2303              		.loc 1 1264 2
 2304 13b1 E8130000 		call	yy_load_buffer_state
 2304      00
1265:lex.yy.c      **** 	yy_load_buffer_state(  );
1266:lex.yy.c      **** 
1267:lex.yy.c      **** 	/* We don't actually know whether we did this switch during
1268:lex.yy.c      **** 	 * EOF (yywrap()) processing, but the only time this flag
1269:lex.yy.c      **** 	 * is looked at is after yywrap() is called, so it's safe
1270:lex.yy.c      **** 	 * to go ahead and always set it.
1271:lex.yy.c      **** 	 */
 2305              		.loc 1 1271 32
 2306 13b6 C7056400 		movl	$1, yy_did_buffer_switch_on_eof(%rip)
 2306      00000100 
 2306      0000
 2307 13c0 EB01     		jmp	.L107
 2308              	.L113:
1253:lex.yy.c      **** 		return;
 2309              		.loc 1 1253 3
 2310 13c2 90       		nop
 2311              	.L107:
1272:lex.yy.c      **** 	(yy_did_buffer_switch_on_eof) = 1;
 2312              		.loc 1 1272 1
 2313 13c3 4883C420 		addq	$32, %rsp
 2314 13c7 5D       		popq	%rbp
 2315              		.cfi_restore 6
 2316              		.cfi_def_cfa 7, 8
 2317 13c8 C3       		ret
 2318              		.cfi_endproc
 2319              	.LFE24:
 2320              		.seh_endproc
 2322              		.seh_proc	yy_load_buffer_state
 2323              	yy_load_buffer_state:
 2324              	.LFB25:
1273:lex.yy.c      **** }
1274:lex.yy.c      **** 
1275:lex.yy.c      **** static void yy_load_buffer_state  (void)
 2325              		.loc 1 1275 1
 2326              		.cfi_startproc
 2327 13c9 55       		pushq	%rbp
 2328              		.seh_pushreg	%rbp
 2329              		.cfi_def_cfa_offset 16
 2330              		.cfi_offset 6, -16
 2331 13ca 4889E5   		movq	%rsp, %rbp
 2332              		.seh_setframe	%rbp, 0
 2333              		.cfi_def_cfa_register 6
 2334              		.seh_endprologue
1276:lex.yy.c      **** {
 2335              		.loc 1 1276 21
 2336 13cd 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2336      000000
 2337 13d4 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2337      000000
 2338 13db 48C1E203 		salq	$3, %rdx
 2339 13df 4801D0   		addq	%rdx, %rax
 2340 13e2 488B00   		movq	(%rax), %rax
 2341              		.loc 1 1276 45
 2342 13e5 8B401C   		movl	28(%rax), %eax
 2343              		.loc 1 1276 19
 2344 13e8 89055400 		movl	%eax, yy_n_chars(%rip)
 2344      0000
1277:lex.yy.c      ****     	(yy_n_chars) = YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
 2345              		.loc 1 1277 32
 2346 13ee 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2346      000000
 2347 13f5 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2347      000000
 2348 13fc 48C1E203 		salq	$3, %rdx
 2349 1400 4801D0   		addq	%rdx, %rax
 2350 1403 488B00   		movq	(%rax), %rax
 2351              		.loc 1 1277 56
 2352 1406 488B4010 		movq	16(%rax), %rax
 2353              		.loc 1 1277 30
 2354 140a 48890558 		movq	%rax, yy_c_buf_p(%rip)
 2354      000000
 2355              		.loc 1 1277 15
 2356 1411 488B0558 		movq	yy_c_buf_p(%rip), %rax
 2356      000000
 2357 1418 48890520 		movq	%rax, yytext(%rip)
 2357      000000
1278:lex.yy.c      **** 	(yytext_ptr) = (yy_c_buf_p) = YY_CURRENT_BUFFER_LVALUE->yy_buf_pos;
 2358              		.loc 1 1278 9
 2359 141f 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2359      000000
 2360 1426 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2360      000000
 2361 142d 48C1E203 		salq	$3, %rdx
 2362 1431 4801D0   		addq	%rdx, %rax
 2363 1434 488B00   		movq	(%rax), %rax
 2364              		.loc 1 1278 33
 2365 1437 488B00   		movq	(%rax), %rax
 2366              		.loc 1 1278 7
 2367 143a 48890508 		movq	%rax, yyin(%rip)
 2367      000000
1279:lex.yy.c      **** 	yyin = YY_CURRENT_BUFFER_LVALUE->yy_input_file;
 2368              		.loc 1 1279 19
 2369 1441 488B0558 		movq	yy_c_buf_p(%rip), %rax
 2369      000000
 2370 1448 0FB600   		movzbl	(%rax), %eax
 2371              		.loc 1 1279 17
 2372 144b 88055000 		movb	%al, yy_hold_char(%rip)
 2372      0000
1280:lex.yy.c      **** 	(yy_hold_char) = *(yy_c_buf_p);
 2373              		.loc 1 1280 1
 2374 1451 90       		nop
 2375 1452 5D       		popq	%rbp
 2376              		.cfi_restore 6
 2377              		.cfi_def_cfa 7, 8
 2378 1453 C3       		ret
 2379              		.cfi_endproc
 2380              	.LFE25:
 2381              		.seh_endproc
 2382              		.section .rdata,"dr"
 2383              		.align 8
 2384              	.LC11:
 2385 0468 6F757420 		.ascii "out of dynamic memory in yy_create_buffer()\0"
 2385      6F662064 
 2385      796E616D 
 2385      6963206D 
 2385      656D6F72 
 2386              		.text
 2387              		.globl	yy_create_buffer
 2389              		.seh_proc	yy_create_buffer
 2390              	yy_create_buffer:
 2391              	.LFB26:
1281:lex.yy.c      **** }
1282:lex.yy.c      **** 
1283:lex.yy.c      **** /** Allocate and initialize an input buffer state.
1284:lex.yy.c      ****  * @param file A readable stream.
1285:lex.yy.c      ****  * @param size The character buffer size in bytes. When in doubt, use @c YY_BUF_SIZE.
1286:lex.yy.c      ****  * 
1287:lex.yy.c      ****  * @return the allocated buffer state.
1288:lex.yy.c      ****  */
1289:lex.yy.c      ****     YY_BUFFER_STATE yy_create_buffer  (FILE * file, int  size )
 2392              		.loc 1 1289 1
 2393              		.cfi_startproc
 2394 1454 55       		pushq	%rbp
 2395              		.seh_pushreg	%rbp
 2396              		.cfi_def_cfa_offset 16
 2397              		.cfi_offset 6, -16
 2398 1455 4889E5   		movq	%rsp, %rbp
 2399              		.seh_setframe	%rbp, 0
 2400              		.cfi_def_cfa_register 6
 2401 1458 4883EC30 		subq	$48, %rsp
 2402              		.seh_stackalloc	48
 2403              		.seh_endprologue
 2404 145c 48894D10 		movq	%rcx, 16(%rbp)
 2405 1460 895518   		movl	%edx, 24(%rbp)
1290:lex.yy.c      **** {
1291:lex.yy.c      **** 	YY_BUFFER_STATE b;
1292:lex.yy.c      ****     
 2406              		.loc 1 1292 24
 2407 1463 B9400000 		movl	$64, %ecx
 2407      00
 2408 1468 E8A30900 		call	yyalloc
 2408      00
 2409 146d 488945F8 		movq	%rax, -8(%rbp)
1293:lex.yy.c      **** 	b = (YY_BUFFER_STATE) yyalloc( sizeof( struct yy_buffer_state )  );
 2410              		.loc 1 1293 5
 2411 1471 48837DF8 		cmpq	$0, -8(%rbp)
 2411      00
 2412 1476 750F     		jne	.L116
1294:lex.yy.c      **** 	if ( ! b )
 2413              		.loc 1 1294 3
 2414 1478 488D0568 		leaq	.LC11(%rip), %rax
 2414      040000
 2415 147f 4889C1   		movq	%rax, %rcx
 2416 1482 E89C0700 		call	yy_fatal_error
 2416      00
 2417              	.L116:
1295:lex.yy.c      **** 		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
1296:lex.yy.c      **** 
 2418              		.loc 1 1296 17
 2419 1487 488B45F8 		movq	-8(%rbp), %rax
 2420 148b 8B5518   		movl	24(%rbp), %edx
 2421 148e 895018   		movl	%edx, 24(%rax)
1297:lex.yy.c      **** 	b->yy_buf_size = size;
1298:lex.yy.c      **** 
1299:lex.yy.c      **** 	/* yy_ch_buf has to be 2 characters longer than the size given because
1300:lex.yy.c      **** 	 * we need to put in 2 end-of-buffer characters.
1301:lex.yy.c      **** 	 */
 2422              		.loc 1 1301 49
 2423 1491 488B45F8 		movq	-8(%rbp), %rax
 2424 1495 8B4018   		movl	24(%rax), %eax
 2425              		.loc 1 1301 63
 2426 1498 83C002   		addl	$2, %eax
 2427              		.loc 1 1301 26
 2428 149b 4898     		cltq
 2429 149d 4889C1   		movq	%rax, %rcx
 2430 14a0 E86B0900 		call	yyalloc
 2430      00
 2431              		.loc 1 1301 15 discriminator 1
 2432 14a5 488B55F8 		movq	-8(%rbp), %rdx
 2433 14a9 48894208 		movq	%rax, 8(%rdx)
1302:lex.yy.c      **** 	b->yy_ch_buf = (char *) yyalloc( (yy_size_t) (b->yy_buf_size + 2)  );
 2434              		.loc 1 1302 10
 2435 14ad 488B45F8 		movq	-8(%rbp), %rax
 2436 14b1 488B4008 		movq	8(%rax), %rax
 2437              		.loc 1 1302 5
 2438 14b5 4885C0   		testq	%rax, %rax
 2439 14b8 750F     		jne	.L117
1303:lex.yy.c      **** 	if ( ! b->yy_ch_buf )
 2440              		.loc 1 1303 3
 2441 14ba 488D0568 		leaq	.LC11(%rip), %rax
 2441      040000
 2442 14c1 4889C1   		movq	%rax, %rcx
 2443 14c4 E85A0700 		call	yy_fatal_error
 2443      00
 2444              	.L117:
1304:lex.yy.c      **** 		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
1305:lex.yy.c      **** 
 2445              		.loc 1 1305 22
 2446 14c9 488B45F8 		movq	-8(%rbp), %rax
 2447 14cd C7402001 		movl	$1, 32(%rax)
 2447      000000
1306:lex.yy.c      **** 	b->yy_is_our_buffer = 1;
1307:lex.yy.c      **** 
 2448              		.loc 1 1307 2
 2449 14d4 488B5510 		movq	16(%rbp), %rdx
 2450 14d8 488B45F8 		movq	-8(%rbp), %rax
 2451 14dc 4889C1   		movq	%rax, %rcx
 2452 14df E89A0000 		call	yy_init_buffer
 2452      00
1308:lex.yy.c      **** 	yy_init_buffer( b, file );
1309:lex.yy.c      **** 
 2453              		.loc 1 1309 9
 2454 14e4 488B45F8 		movq	-8(%rbp), %rax
1310:lex.yy.c      **** 	return b;
 2455              		.loc 1 1310 1
 2456 14e8 4883C430 		addq	$48, %rsp
 2457 14ec 5D       		popq	%rbp
 2458              		.cfi_restore 6
 2459              		.cfi_def_cfa 7, 8
 2460 14ed C3       		ret
 2461              		.cfi_endproc
 2462              	.LFE26:
 2463              		.seh_endproc
 2464              		.globl	yy_delete_buffer
 2466              		.seh_proc	yy_delete_buffer
 2467              	yy_delete_buffer:
 2468              	.LFB27:
1311:lex.yy.c      **** }
1312:lex.yy.c      **** 
1313:lex.yy.c      **** /** Destroy the buffer.
1314:lex.yy.c      ****  * @param b a buffer created with yy_create_buffer()
1315:lex.yy.c      ****  * 
1316:lex.yy.c      ****  */
1317:lex.yy.c      ****     void yy_delete_buffer (YY_BUFFER_STATE  b )
 2469              		.loc 1 1317 1
 2470              		.cfi_startproc
 2471 14ee 55       		pushq	%rbp
 2472              		.seh_pushreg	%rbp
 2473              		.cfi_def_cfa_offset 16
 2474              		.cfi_offset 6, -16
 2475 14ef 4889E5   		movq	%rsp, %rbp
 2476              		.seh_setframe	%rbp, 0
 2477              		.cfi_def_cfa_register 6
 2478 14f2 4883EC20 		subq	$32, %rsp
 2479              		.seh_stackalloc	32
 2480              		.seh_endprologue
 2481 14f6 48894D10 		movq	%rcx, 16(%rbp)
1318:lex.yy.c      **** {
1319:lex.yy.c      ****     
 2482              		.loc 1 1319 5
 2483 14fa 48837D10 		cmpq	$0, 16(%rbp)
 2483      00
 2484 14ff 7476     		je	.L126
1320:lex.yy.c      **** 	if ( ! b )
1321:lex.yy.c      **** 		return;
1322:lex.yy.c      **** 
 2485              		.loc 1 1322 12
 2486 1501 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2486      000000
 2487 1508 4885C0   		testq	%rax, %rax
 2488 150b 741A     		je	.L122
 2489              		.loc 1 1322 12 is_stmt 0 discriminator 1
 2490 150d 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2490      000000
 2491 1514 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2491      000000
 2492 151b 48C1E203 		salq	$3, %rdx
 2493 151f 4801D0   		addq	%rdx, %rax
 2494 1522 488B00   		movq	(%rax), %rax
 2495 1525 EB05     		jmp	.L123
 2496              	.L122:
 2497              		.loc 1 1322 12 discriminator 2
 2498 1527 B8000000 		movl	$0, %eax
 2498      00
 2499              	.L123:
 2500              		.loc 1 1322 5 is_stmt 1 discriminator 4
 2501 152c 483B4510 		cmpq	16(%rbp), %rax
 2502 1530 751C     		jne	.L124
1323:lex.yy.c      **** 	if ( b == YY_CURRENT_BUFFER ) /* Not sure if we should pop here. */
 2503              		.loc 1 1323 3
 2504 1532 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2504      000000
 2505 1539 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2505      000000
 2506 1540 48C1E203 		salq	$3, %rdx
 2507 1544 4801D0   		addq	%rdx, %rax
 2508              		.loc 1 1323 28
 2509 1547 48C70000 		movq	$0, (%rax)
 2509      000000
 2510              	.L124:
1324:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE = (YY_BUFFER_STATE) 0;
1325:lex.yy.c      **** 
 2511              		.loc 1 1325 8
 2512 154e 488B4510 		movq	16(%rbp), %rax
 2513 1552 8B4020   		movl	32(%rax), %eax
 2514              		.loc 1 1325 5
 2515 1555 85C0     		testl	%eax, %eax
 2516 1557 7410     		je	.L125
1326:lex.yy.c      **** 	if ( b->yy_is_our_buffer )
 2517              		.loc 1 1326 21
 2518 1559 488B4510 		movq	16(%rbp), %rax
 2519 155d 488B4008 		movq	8(%rax), %rax
 2520              		.loc 1 1326 3
 2521 1561 4889C1   		movq	%rax, %rcx
 2522 1564 E8EB0800 		call	yyfree
 2522      00
 2523              	.L125:
1327:lex.yy.c      **** 		yyfree( (void *) b->yy_ch_buf  );
1328:lex.yy.c      **** 
 2524              		.loc 1 1328 2
 2525 1569 488B4510 		movq	16(%rbp), %rax
 2526 156d 4889C1   		movq	%rax, %rcx
 2527 1570 E8DF0800 		call	yyfree
 2527      00
 2528 1575 EB01     		jmp	.L119
 2529              	.L126:
1320:lex.yy.c      **** 		return;
 2530              		.loc 1 1320 3
 2531 1577 90       		nop
 2532              	.L119:
1329:lex.yy.c      **** 	yyfree( (void *) b  );
 2533              		.loc 1 1329 1
 2534 1578 4883C420 		addq	$32, %rsp
 2535 157c 5D       		popq	%rbp
 2536              		.cfi_restore 6
 2537              		.cfi_def_cfa 7, 8
 2538 157d C3       		ret
 2539              		.cfi_endproc
 2540              	.LFE27:
 2541              		.seh_endproc
 2543              		.seh_proc	yy_init_buffer
 2544              	yy_init_buffer:
 2545              	.LFB28:
1330:lex.yy.c      **** }
1331:lex.yy.c      **** 
1332:lex.yy.c      **** /* Initializes or reinitializes a buffer.
1333:lex.yy.c      ****  * This function is sometimes called more than once on the same buffer,
1334:lex.yy.c      ****  * such as during a yyrestart() or at EOF.
1335:lex.yy.c      ****  */
1336:lex.yy.c      ****     static void yy_init_buffer  (YY_BUFFER_STATE  b, FILE * file )
1337:lex.yy.c      **** 
 2546              		.loc 1 1337 1
 2547              		.cfi_startproc
 2548 157e 55       		pushq	%rbp
 2549              		.seh_pushreg	%rbp
 2550              		.cfi_def_cfa_offset 16
 2551              		.cfi_offset 6, -16
 2552 157f 4889E5   		movq	%rsp, %rbp
 2553              		.seh_setframe	%rbp, 0
 2554              		.cfi_def_cfa_register 6
 2555 1582 4883EC30 		subq	$48, %rsp
 2556              		.seh_stackalloc	48
 2557              		.seh_endprologue
 2558 1586 48894D10 		movq	%rcx, 16(%rbp)
 2559 158a 48895518 		movq	%rdx, 24(%rbp)
1338:lex.yy.c      **** {
 2560              		.loc 1 1338 15
 2561 158e 488B0500 		movq	__imp__errno(%rip), %rax
 2561      000000
 2562 1595 FFD0     		call	*%rax
 2563              	.LVL5:
 2564              		.loc 1 1338 6 discriminator 1
 2565 1597 8B00     		movl	(%rax), %eax
 2566 1599 8945FC   		movl	%eax, -4(%rbp)
1339:lex.yy.c      **** 	int oerrno = errno;
1340:lex.yy.c      ****     
 2567              		.loc 1 1340 2
 2568 159c 488B4510 		movq	16(%rbp), %rax
 2569 15a0 4889C1   		movq	%rax, %rcx
 2570 15a3 E8A30000 		call	yy_flush_buffer
 2570      00
1341:lex.yy.c      **** 	yy_flush_buffer( b );
1342:lex.yy.c      **** 
 2571              		.loc 1 1342 19
 2572 15a8 488B4510 		movq	16(%rbp), %rax
 2573 15ac 488B5518 		movq	24(%rbp), %rdx
 2574 15b0 488910   		movq	%rdx, (%rax)
1343:lex.yy.c      **** 	b->yy_input_file = file;
 2575              		.loc 1 1343 20
 2576 15b3 488B4510 		movq	16(%rbp), %rax
 2577 15b7 C7403401 		movl	$1, 52(%rax)
 2577      000000
1344:lex.yy.c      **** 	b->yy_fill_buffer = 1;
1345:lex.yy.c      **** 
1346:lex.yy.c      ****     /* If b is the current buffer, then yy_init_buffer was _probably_
1347:lex.yy.c      ****      * called from yyrestart() or through yy_get_next_buffer.
1348:lex.yy.c      ****      * In that case, we don't want to reset the lineno or column.
1349:lex.yy.c      ****      */
 2578              		.loc 1 1349 14
 2579 15be 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2579      000000
 2580 15c5 4885C0   		testq	%rax, %rax
 2581 15c8 741A     		je	.L128
 2582              		.loc 1 1349 14 is_stmt 0 discriminator 1
 2583 15ca 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2583      000000
 2584 15d1 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2584      000000
 2585 15d8 48C1E203 		salq	$3, %rdx
 2586 15dc 4801D0   		addq	%rdx, %rax
 2587 15df 488B00   		movq	(%rax), %rax
 2588 15e2 EB05     		jmp	.L129
 2589              	.L128:
 2590              		.loc 1 1349 14 discriminator 2
 2591 15e4 B8000000 		movl	$0, %eax
 2591      00
 2592              	.L129:
 2593              		.loc 1 1349 8 is_stmt 1 discriminator 4
 2594 15e9 483B4510 		cmpq	16(%rbp), %rax
 2595 15ed 7416     		je	.L130
1350:lex.yy.c      ****     if (b != YY_CURRENT_BUFFER){
 2596              		.loc 1 1350 25
 2597 15ef 488B4510 		movq	16(%rbp), %rax
 2598 15f3 C7402C01 		movl	$1, 44(%rax)
 2598      000000
1351:lex.yy.c      ****         b->yy_bs_lineno = 1;
 2599              		.loc 1 1351 25
 2600 15fa 488B4510 		movq	16(%rbp), %rax
 2601 15fe C7403000 		movl	$0, 48(%rax)
 2601      000000
 2602              	.L130:
1352:lex.yy.c      ****         b->yy_bs_column = 0;
1353:lex.yy.c      ****     }
1354:lex.yy.c      **** 
 2603              		.loc 1 1354 68
 2604 1605 48837D18 		cmpq	$0, 24(%rbp)
 2604      00
 2605 160a 741E     		je	.L131
 2606              		.loc 1 1354 40 discriminator 1
 2607 160c 488B4518 		movq	24(%rbp), %rax
 2608 1610 4889C1   		movq	%rax, %rcx
 2609 1613 E8000000 		call	fileno
 2609      00
 2610 1618 89C1     		movl	%eax, %ecx
 2611 161a E8000000 		call	isatty
 2611      00
 2612              		.loc 1 1354 68 discriminator 2
 2613 161f 85C0     		testl	%eax, %eax
 2614 1621 7E07     		jle	.L131
 2615              		.loc 1 1354 68 is_stmt 0 discriminator 3
 2616 1623 BA010000 		movl	$1, %edx
 2616      00
 2617              		.loc 1 1354 68
 2618 1628 EB05     		jmp	.L132
 2619              	.L131:
 2620              		.loc 1 1354 68 discriminator 4
 2621 162a BA000000 		movl	$0, %edx
 2621      00
 2622              	.L132:
 2623              		.loc 1 1354 30 is_stmt 1 discriminator 6
 2624 162f 488B4510 		movq	16(%rbp), %rax
 2625 1633 895024   		movl	%edx, 36(%rax)
1355:lex.yy.c      ****         b->yy_is_interactive = file ? (isatty( fileno(file) ) > 0) : 0;
1356:lex.yy.c      ****     
 2626              		.loc 1 1356 2
 2627 1636 488B0500 		movq	__imp__errno(%rip), %rax
 2627      000000
 2628 163d FFD0     		call	*%rax
 2629              	.LVL6:
 2630              		.loc 1 1356 8 discriminator 1
 2631 163f 8B55FC   		movl	-4(%rbp), %edx
 2632 1642 8910     		movl	%edx, (%rax)
1357:lex.yy.c      **** 	errno = oerrno;
 2633              		.loc 1 1357 1
 2634 1644 90       		nop
 2635 1645 4883C430 		addq	$48, %rsp
 2636 1649 5D       		popq	%rbp
 2637              		.cfi_restore 6
 2638              		.cfi_def_cfa 7, 8
 2639 164a C3       		ret
 2640              		.cfi_endproc
 2641              	.LFE28:
 2642              		.seh_endproc
 2643              		.globl	yy_flush_buffer
 2645              		.seh_proc	yy_flush_buffer
 2646              	yy_flush_buffer:
 2647              	.LFB29:
1358:lex.yy.c      **** }
1359:lex.yy.c      **** 
1360:lex.yy.c      **** /** Discard all buffered characters. On the next scan, YY_INPUT will be called.
1361:lex.yy.c      ****  * @param b the buffer state to be flushed, usually @c YY_CURRENT_BUFFER.
1362:lex.yy.c      ****  * 
1363:lex.yy.c      ****  */
1364:lex.yy.c      ****     void yy_flush_buffer (YY_BUFFER_STATE  b )
 2648              		.loc 1 1364 1
 2649              		.cfi_startproc
 2650 164b 55       		pushq	%rbp
 2651              		.seh_pushreg	%rbp
 2652              		.cfi_def_cfa_offset 16
 2653              		.cfi_offset 6, -16
 2654 164c 4889E5   		movq	%rsp, %rbp
 2655              		.seh_setframe	%rbp, 0
 2656              		.cfi_def_cfa_register 6
 2657 164f 4883EC20 		subq	$32, %rsp
 2658              		.seh_stackalloc	32
 2659              		.seh_endprologue
 2660 1653 48894D10 		movq	%rcx, 16(%rbp)
1365:lex.yy.c      **** {
 2661              		.loc 1 1365 9
 2662 1657 48837D10 		cmpq	$0, 16(%rbp)
 2662      00
 2663 165c 0F848300 		je	.L138
 2663      0000
1366:lex.yy.c      ****     	if ( ! b )
1367:lex.yy.c      **** 		return;
1368:lex.yy.c      **** 
 2664              		.loc 1 1368 16
 2665 1662 488B4510 		movq	16(%rbp), %rax
 2666 1666 C7401C00 		movl	$0, 28(%rax)
 2666      000000
1369:lex.yy.c      **** 	b->yy_n_chars = 0;
1370:lex.yy.c      **** 
1371:lex.yy.c      **** 	/* We always need two end-of-buffer characters.  The first causes
1372:lex.yy.c      **** 	 * a transition to the end-of-buffer state.  The second causes
1373:lex.yy.c      **** 	 * a jam in that state.
1374:lex.yy.c      **** 	 */
 2667              		.loc 1 1374 3
 2668 166d 488B4510 		movq	16(%rbp), %rax
 2669 1671 488B4008 		movq	8(%rax), %rax
 2670              		.loc 1 1374 18
 2671 1675 C60000   		movb	$0, (%rax)
1375:lex.yy.c      **** 	b->yy_ch_buf[0] = YY_END_OF_BUFFER_CHAR;
 2672              		.loc 1 1375 3
 2673 1678 488B4510 		movq	16(%rbp), %rax
 2674 167c 488B4008 		movq	8(%rax), %rax
 2675              		.loc 1 1375 14
 2676 1680 4883C001 		addq	$1, %rax
 2677              		.loc 1 1375 18
 2678 1684 C60000   		movb	$0, (%rax)
1376:lex.yy.c      **** 	b->yy_ch_buf[1] = YY_END_OF_BUFFER_CHAR;
1377:lex.yy.c      **** 
 2679              		.loc 1 1377 18
 2680 1687 488B4510 		movq	16(%rbp), %rax
 2681 168b 488B5008 		movq	8(%rax), %rdx
 2682              		.loc 1 1377 16
 2683 168f 488B4510 		movq	16(%rbp), %rax
 2684 1693 48895010 		movq	%rdx, 16(%rax)
1378:lex.yy.c      **** 	b->yy_buf_pos = &b->yy_ch_buf[0];
1379:lex.yy.c      **** 
 2685              		.loc 1 1379 15
 2686 1697 488B4510 		movq	16(%rbp), %rax
 2687 169b C7402801 		movl	$1, 40(%rax)
 2687      000000
1380:lex.yy.c      **** 	b->yy_at_bol = 1;
 2688              		.loc 1 1380 22
 2689 16a2 488B4510 		movq	16(%rbp), %rax
 2690 16a6 C7403800 		movl	$0, 56(%rax)
 2690      000000
1381:lex.yy.c      **** 	b->yy_buffer_status = YY_BUFFER_NEW;
1382:lex.yy.c      **** 
 2691              		.loc 1 1382 12
 2692 16ad 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2692      000000
 2693 16b4 4885C0   		testq	%rax, %rax
 2694 16b7 741A     		je	.L136
 2695              		.loc 1 1382 12 is_stmt 0 discriminator 1
 2696 16b9 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2696      000000
 2697 16c0 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2697      000000
 2698 16c7 48C1E203 		salq	$3, %rdx
 2699 16cb 4801D0   		addq	%rdx, %rax
 2700 16ce 488B00   		movq	(%rax), %rax
 2701 16d1 EB05     		jmp	.L137
 2702              	.L136:
 2703              		.loc 1 1382 12 discriminator 2
 2704 16d3 B8000000 		movl	$0, %eax
 2704      00
 2705              	.L137:
 2706              		.loc 1 1382 5 is_stmt 1 discriminator 4
 2707 16d8 483B4510 		cmpq	16(%rbp), %rax
 2708 16dc 7508     		jne	.L133
1383:lex.yy.c      **** 	if ( b == YY_CURRENT_BUFFER )
 2709              		.loc 1 1383 3
 2710 16de E8E6FCFF 		call	yy_load_buffer_state
 2710      FF
 2711 16e3 EB01     		jmp	.L133
 2712              	.L138:
1366:lex.yy.c      **** 		return;
 2713              		.loc 1 1366 3
 2714 16e5 90       		nop
 2715              	.L133:
1384:lex.yy.c      **** 		yy_load_buffer_state(  );
 2716              		.loc 1 1384 1
 2717 16e6 4883C420 		addq	$32, %rsp
 2718 16ea 5D       		popq	%rbp
 2719              		.cfi_restore 6
 2720              		.cfi_def_cfa 7, 8
 2721 16eb C3       		ret
 2722              		.cfi_endproc
 2723              	.LFE29:
 2724              		.seh_endproc
 2725              		.globl	yypush_buffer_state
 2727              		.seh_proc	yypush_buffer_state
 2728              	yypush_buffer_state:
 2729              	.LFB30:
1385:lex.yy.c      **** }
1386:lex.yy.c      **** 
1387:lex.yy.c      **** /** Pushes the new state onto the stack. The new state becomes
1388:lex.yy.c      ****  *  the current state. This function will allocate the stack
1389:lex.yy.c      ****  *  if necessary.
1390:lex.yy.c      ****  *  @param new_buffer The new state.
1391:lex.yy.c      ****  *  
1392:lex.yy.c      ****  */
1393:lex.yy.c      **** void yypush_buffer_state (YY_BUFFER_STATE new_buffer )
 2730              		.loc 1 1393 1
 2731              		.cfi_startproc
 2732 16ec 55       		pushq	%rbp
 2733              		.seh_pushreg	%rbp
 2734              		.cfi_def_cfa_offset 16
 2735              		.cfi_offset 6, -16
 2736 16ed 4889E5   		movq	%rsp, %rbp
 2737              		.seh_setframe	%rbp, 0
 2738              		.cfi_def_cfa_register 6
 2739 16f0 4883EC20 		subq	$32, %rsp
 2740              		.seh_stackalloc	32
 2741              		.seh_endprologue
 2742 16f4 48894D10 		movq	%rcx, 16(%rbp)
1394:lex.yy.c      **** {
 2743              		.loc 1 1394 9
 2744 16f8 48837D10 		cmpq	$0, 16(%rbp)
 2744      00
 2745 16fd 0F84EA00 		je	.L144
 2745      0000
1395:lex.yy.c      ****     	if (new_buffer == NULL)
1396:lex.yy.c      **** 		return;
1397:lex.yy.c      **** 
 2746              		.loc 1 1397 2
 2747 1703 E8D30100 		call	yyensure_buffer_stack
 2747      00
1398:lex.yy.c      **** 	yyensure_buffer_stack();
1399:lex.yy.c      **** 
1400:lex.yy.c      **** 	/* This block is copied from yy_switch_to_buffer. */
 2748              		.loc 1 1400 7
 2749 1708 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2749      000000
 2750              		.loc 1 1400 5
 2751 170f 4885C0   		testq	%rax, %rax
 2752 1712 7471     		je	.L142
 2753              		.loc 1 1400 7 discriminator 1
 2754 1714 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2754      000000
 2755 171b 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2755      000000
 2756 1722 48C1E203 		salq	$3, %rdx
 2757 1726 4801D0   		addq	%rdx, %rax
 2758 1729 488B00   		movq	(%rax), %rax
 2759 172c 4885C0   		testq	%rax, %rax
 2760 172f 7454     		je	.L142
1401:lex.yy.c      **** 	if ( YY_CURRENT_BUFFER )
1402:lex.yy.c      **** 		{
1403:lex.yy.c      **** 		/* Flush out information for old buffer. */
 2761              		.loc 1 1403 3
 2762 1731 488B0558 		movq	yy_c_buf_p(%rip), %rax
 2762      000000
 2763              		.loc 1 1403 17
 2764 1738 0FB61550 		movzbl	yy_hold_char(%rip), %edx
 2764      000000
 2765 173f 8810     		movb	%dl, (%rax)
1404:lex.yy.c      **** 		*(yy_c_buf_p) = (yy_hold_char);
 2766              		.loc 1 1404 3
 2767 1741 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2767      000000
 2768 1748 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2768      000000
 2769 174f 48C1E203 		salq	$3, %rdx
 2770 1753 4801D0   		addq	%rdx, %rax
 2771 1756 488B00   		movq	(%rax), %rax
 2772              		.loc 1 1404 40
 2773 1759 488B1558 		movq	yy_c_buf_p(%rip), %rdx
 2773      000000
 2774 1760 48895010 		movq	%rdx, 16(%rax)
1405:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE->yy_buf_pos = (yy_c_buf_p);
 2775              		.loc 1 1405 3
 2776 1764 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2776      000000
 2777 176b 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2777      000000
 2778 1772 48C1E203 		salq	$3, %rdx
 2779 1776 4801D0   		addq	%rdx, %rax
 2780 1779 488B00   		movq	(%rax), %rax
 2781              		.loc 1 1405 40
 2782 177c 8B155400 		movl	yy_n_chars(%rip), %edx
 2782      0000
 2783 1782 89501C   		movl	%edx, 28(%rax)
 2784              	.L142:
1406:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars = (yy_n_chars);
1407:lex.yy.c      **** 		}
1408:lex.yy.c      **** 
1409:lex.yy.c      **** 	/* Only push if top exists. Otherwise, replace top. */
 2785              		.loc 1 1409 6
 2786 1785 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2786      000000
 2787              		.loc 1 1409 5
 2788 178c 4885C0   		testq	%rax, %rax
 2789 178f 742F     		je	.L143
 2790              		.loc 1 1409 6 discriminator 1
 2791 1791 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2791      000000
 2792 1798 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2792      000000
 2793 179f 48C1E203 		salq	$3, %rdx
 2794 17a3 4801D0   		addq	%rdx, %rax
 2795 17a6 488B00   		movq	(%rax), %rax
 2796 17a9 4885C0   		testq	%rax, %rax
 2797 17ac 7412     		je	.L143
1410:lex.yy.c      **** 	if (YY_CURRENT_BUFFER)
 2798              		.loc 1 1410 24
 2799 17ae 488B0538 		movq	yy_buffer_stack_top(%rip), %rax
 2799      000000
 2800 17b5 4883C001 		addq	$1, %rax
 2801 17b9 48890538 		movq	%rax, yy_buffer_stack_top(%rip)
 2801      000000
 2802              	.L143:
1411:lex.yy.c      **** 		(yy_buffer_stack_top)++;
 2803              		.loc 1 1411 2
 2804 17c0 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2804      000000
 2805 17c7 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2805      000000
 2806 17ce 48C1E203 		salq	$3, %rdx
 2807 17d2 4801C2   		addq	%rax, %rdx
 2808              		.loc 1 1411 27
 2809 17d5 488B4510 		movq	16(%rbp), %rax
 2810 17d9 488902   		movq	%rax, (%rdx)
1412:lex.yy.c      **** 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
1413:lex.yy.c      **** 
1414:lex.yy.c      **** 	/* copied from yy_switch_to_buffer. */
 2811              		.loc 1 1414 2
 2812 17dc E8E8FBFF 		call	yy_load_buffer_state
 2812      FF
1415:lex.yy.c      **** 	yy_load_buffer_state(  );
 2813              		.loc 1 1415 32
 2814 17e1 C7056400 		movl	$1, yy_did_buffer_switch_on_eof(%rip)
 2814      00000100 
 2814      0000
 2815 17eb EB01     		jmp	.L139
 2816              	.L144:
1395:lex.yy.c      **** 		return;
 2817              		.loc 1 1395 3
 2818 17ed 90       		nop
 2819              	.L139:
1416:lex.yy.c      **** 	(yy_did_buffer_switch_on_eof) = 1;
 2820              		.loc 1 1416 1
 2821 17ee 4883C420 		addq	$32, %rsp
 2822 17f2 5D       		popq	%rbp
 2823              		.cfi_restore 6
 2824              		.cfi_def_cfa 7, 8
 2825 17f3 C3       		ret
 2826              		.cfi_endproc
 2827              	.LFE30:
 2828              		.seh_endproc
 2829              		.globl	yypop_buffer_state
 2831              		.seh_proc	yypop_buffer_state
 2832              	yypop_buffer_state:
 2833              	.LFB31:
1417:lex.yy.c      **** }
1418:lex.yy.c      **** 
1419:lex.yy.c      **** /** Removes and deletes the top of the stack, if present.
1420:lex.yy.c      ****  *  The next element becomes the new top.
1421:lex.yy.c      ****  *  
1422:lex.yy.c      ****  */
1423:lex.yy.c      **** void yypop_buffer_state (void)
 2834              		.loc 1 1423 1
 2835              		.cfi_startproc
 2836 17f4 55       		pushq	%rbp
 2837              		.seh_pushreg	%rbp
 2838              		.cfi_def_cfa_offset 16
 2839              		.cfi_offset 6, -16
 2840 17f5 4889E5   		movq	%rsp, %rbp
 2841              		.seh_setframe	%rbp, 0
 2842              		.cfi_def_cfa_register 6
 2843 17f8 4883EC20 		subq	$32, %rsp
 2844              		.seh_stackalloc	32
 2845              		.seh_endprologue
1424:lex.yy.c      **** {
 2846              		.loc 1 1424 11
 2847 17fc 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2847      000000
 2848              		.loc 1 1424 9
 2849 1803 4885C0   		testq	%rax, %rax
 2850 1806 0F84C800 		je	.L152
 2850      0000
 2851              		.loc 1 1424 11 discriminator 1
 2852 180c 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2852      000000
 2853 1813 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2853      000000
 2854 181a 48C1E203 		salq	$3, %rdx
 2855 181e 4801D0   		addq	%rdx, %rax
 2856 1821 488B00   		movq	(%rax), %rax
 2857              		.loc 1 1424 10 discriminator 1
 2858 1824 4885C0   		testq	%rax, %rax
 2859 1827 0F84A700 		je	.L152
 2859      0000
1425:lex.yy.c      ****     	if (!YY_CURRENT_BUFFER)
1426:lex.yy.c      **** 		return;
1427:lex.yy.c      **** 
 2860              		.loc 1 1427 19
 2861 182d 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2861      000000
 2862              		.loc 1 1427 2
 2863 1834 4885C0   		testq	%rax, %rax
 2864 1837 741A     		je	.L149
 2865              		.loc 1 1427 19 discriminator 1
 2866 1839 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2866      000000
 2867 1840 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2867      000000
 2868 1847 48C1E203 		salq	$3, %rdx
 2869 184b 4801D0   		addq	%rdx, %rax
 2870              		.loc 1 1427 2 discriminator 1
 2871 184e 488B00   		movq	(%rax), %rax
 2872 1851 EB05     		jmp	.L150
 2873              	.L149:
 2874              		.loc 1 1427 2 is_stmt 0 discriminator 2
 2875 1853 B8000000 		movl	$0, %eax
 2875      00
 2876              	.L150:
 2877              		.loc 1 1427 2 discriminator 4
 2878 1858 4889C1   		movq	%rax, %rcx
 2879 185b E88EFCFF 		call	yy_delete_buffer
 2879      FF
1428:lex.yy.c      **** 	yy_delete_buffer(YY_CURRENT_BUFFER );
 2880              		.loc 1 1428 2 is_stmt 1
 2881 1860 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2881      000000
 2882 1867 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2882      000000
 2883 186e 48C1E203 		salq	$3, %rdx
 2884 1872 4801D0   		addq	%rdx, %rax
 2885              		.loc 1 1428 27
 2886 1875 48C70000 		movq	$0, (%rax)
 2886      000000
1429:lex.yy.c      **** 	YY_CURRENT_BUFFER_LVALUE = NULL;
 2887              		.loc 1 1429 28
 2888 187c 488B0538 		movq	yy_buffer_stack_top(%rip), %rax
 2888      000000
 2889              		.loc 1 1429 5
 2890 1883 4885C0   		testq	%rax, %rax
 2891 1886 7412     		je	.L151
1430:lex.yy.c      **** 	if ((yy_buffer_stack_top) > 0)
 2892              		.loc 1 1430 3
 2893 1888 488B0538 		movq	yy_buffer_stack_top(%rip), %rax
 2893      000000
 2894 188f 4883E801 		subq	$1, %rax
 2895 1893 48890538 		movq	%rax, yy_buffer_stack_top(%rip)
 2895      000000
 2896              	.L151:
1431:lex.yy.c      **** 		--(yy_buffer_stack_top);
1432:lex.yy.c      **** 
 2897              		.loc 1 1432 6
 2898 189a 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2898      000000
 2899              		.loc 1 1432 5
 2900 18a1 4885C0   		testq	%rax, %rax
 2901 18a4 742F     		je	.L145
 2902              		.loc 1 1432 6 discriminator 1
 2903 18a6 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2903      000000
 2904 18ad 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2904      000000
 2905 18b4 48C1E203 		salq	$3, %rdx
 2906 18b8 4801D0   		addq	%rdx, %rax
 2907 18bb 488B00   		movq	(%rax), %rax
 2908 18be 4885C0   		testq	%rax, %rax
 2909 18c1 7412     		je	.L145
1433:lex.yy.c      **** 	if (YY_CURRENT_BUFFER) {
 2910              		.loc 1 1433 3
 2911 18c3 E801FBFF 		call	yy_load_buffer_state
 2911      FF
1434:lex.yy.c      **** 		yy_load_buffer_state(  );
 2912              		.loc 1 1434 33
 2913 18c8 C7056400 		movl	$1, yy_did_buffer_switch_on_eof(%rip)
 2913      00000100 
 2913      0000
 2914 18d2 EB01     		jmp	.L145
 2915              	.L152:
1425:lex.yy.c      **** 		return;
 2916              		.loc 1 1425 3
 2917 18d4 90       		nop
 2918              	.L145:
1435:lex.yy.c      **** 		(yy_did_buffer_switch_on_eof) = 1;
1436:lex.yy.c      **** 	}
 2919              		.loc 1 1436 1
 2920 18d5 4883C420 		addq	$32, %rsp
 2921 18d9 5D       		popq	%rbp
 2922              		.cfi_restore 6
 2923              		.cfi_def_cfa 7, 8
 2924 18da C3       		ret
 2925              		.cfi_endproc
 2926              	.LFE31:
 2927              		.seh_endproc
 2928              		.section .rdata,"dr"
 2929 0494 00000000 		.align 8
 2930              	.LC12:
 2931 0498 6F757420 		.ascii "out of dynamic memory in yyensure_buffer_stack()\0"
 2931      6F662064 
 2931      796E616D 
 2931      6963206D 
 2931      656D6F72 
 2932              		.text
 2934              		.seh_proc	yyensure_buffer_stack
 2935              	yyensure_buffer_stack:
 2936              	.LFB32:
1437:lex.yy.c      **** }
1438:lex.yy.c      **** 
1439:lex.yy.c      **** /* Allocates the stack if it does not exist.
1440:lex.yy.c      ****  *  Guarantees space for at least one push.
1441:lex.yy.c      ****  */
1442:lex.yy.c      **** static void yyensure_buffer_stack (void)
 2937              		.loc 1 1442 1
 2938              		.cfi_startproc
 2939 18db 55       		pushq	%rbp
 2940              		.seh_pushreg	%rbp
 2941              		.cfi_def_cfa_offset 16
 2942              		.cfi_offset 6, -16
 2943 18dc 4889E5   		movq	%rsp, %rbp
 2944              		.seh_setframe	%rbp, 0
 2945              		.cfi_def_cfa_register 6
 2946 18df 4883EC30 		subq	$48, %rsp
 2947              		.seh_stackalloc	48
 2948              		.seh_endprologue
1443:lex.yy.c      **** {
1444:lex.yy.c      **** 	yy_size_t num_to_alloc;
1445:lex.yy.c      ****     
 2949              		.loc 1 1445 6
 2950 18e3 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2950      000000
 2951              		.loc 1 1445 5
 2952 18ea 4885C0   		testq	%rax, %rax
 2953 18ed 7578     		jne	.L154
1446:lex.yy.c      **** 	if (!(yy_buffer_stack)) {
1447:lex.yy.c      **** 
1448:lex.yy.c      **** 		/* First allocation is just for 2 elements, since we don't know if this
1449:lex.yy.c      **** 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
1450:lex.yy.c      **** 		 * immediate realloc on the next call.
1451:lex.yy.c      ****          */
 2954              		.loc 1 1451 20
 2955 18ef 48C745F0 		movq	$1, -16(%rbp)
 2955      01000000 
1452:lex.yy.c      ****       num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */
 2956              		.loc 1 1452 49
 2957 18f7 488B45F0 		movq	-16(%rbp), %rax
 2958 18fb 48C1E003 		salq	$3, %rax
 2959 18ff 4889C1   		movq	%rax, %rcx
 2960 1902 E8090500 		call	yyalloc
 2960      00
 2961              		.loc 1 1452 21 discriminator 1
 2962 1907 48890548 		movq	%rax, yy_buffer_stack(%rip)
 2962      000000
1453:lex.yy.c      **** 		(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
1454:lex.yy.c      **** 								(num_to_alloc * sizeof(struct yy_buffer_state*)
1455:lex.yy.c      **** 								);
 2963              		.loc 1 1455 8
 2964 190e 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2964      000000
 2965              		.loc 1 1455 6
 2966 1915 4885C0   		testq	%rax, %rax
 2967 1918 750F     		jne	.L155
1456:lex.yy.c      **** 		if ( ! (yy_buffer_stack) )
 2968              		.loc 1 1456 4
 2969 191a 488D0598 		leaq	.LC12(%rip), %rax
 2969      040000
 2970 1921 4889C1   		movq	%rax, %rcx
 2971 1924 E8FA0200 		call	yy_fatal_error
 2971      00
 2972              	.L155:
1457:lex.yy.c      **** 			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
1458:lex.yy.c      **** 
 2973              		.loc 1 1458 3
 2974 1929 488B45F0 		movq	-16(%rbp), %rax
 2975 192d 488D14C5 		leaq	0(,%rax,8), %rdx
 2975      00000000 
 2976 1935 488B0548 		movq	yy_buffer_stack(%rip), %rax
 2976      000000
 2977 193c 4989D0   		movq	%rdx, %r8
 2978 193f BA000000 		movl	$0, %edx
 2978      00
 2979 1944 4889C1   		movq	%rax, %rcx
 2980 1947 E8000000 		call	memset
 2980      00
1459:lex.yy.c      **** 		memset((yy_buffer_stack), 0, num_to_alloc * sizeof(struct yy_buffer_state*));
1460:lex.yy.c      **** 
 2981              		.loc 1 1460 25
 2982 194c 488B45F0 		movq	-16(%rbp), %rax
 2983 1950 48890540 		movq	%rax, yy_buffer_stack_max(%rip)
 2983      000000
1461:lex.yy.c      **** 		(yy_buffer_stack_max) = num_to_alloc;
 2984              		.loc 1 1461 25
 2985 1957 48C70534 		movq	$0, yy_buffer_stack_top(%rip)
 2985      00000000 
 2985      000000
1462:lex.yy.c      **** 		(yy_buffer_stack_top) = 0;
 2986              		.loc 1 1462 3
 2987 1962 E9AE0000 		jmp	.L153
 2987      00
 2988              	.L154:
1463:lex.yy.c      **** 		return;
1464:lex.yy.c      **** 	}
1465:lex.yy.c      **** 
 2989              		.loc 1 1465 55
 2990 1967 488B0540 		movq	yy_buffer_stack_max(%rip), %rax
 2990      000000
 2991 196e 4883E801 		subq	$1, %rax
 2992              		.loc 1 1465 28
 2993 1972 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 2993      000000
 2994              		.loc 1 1465 5
 2995 1979 4839C2   		cmpq	%rax, %rdx
 2996 197c 0F829300 		jb	.L153
 2996      0000
 2997              	.LBB14:
1466:lex.yy.c      **** 	if ((yy_buffer_stack_top) >= ((yy_buffer_stack_max)) - 1){
1467:lex.yy.c      **** 
1468:lex.yy.c      **** 		/* Increase the buffer to prepare for a possible push. */
 2998              		.loc 1 1468 13
 2999 1982 48C745F8 		movq	$8, -8(%rbp)
 2999      08000000 
1469:lex.yy.c      **** 		yy_size_t grow_size = 8 /* arbitrary grow size */;
1470:lex.yy.c      **** 
 3000              		.loc 1 1470 40
 3001 198a 488B1540 		movq	yy_buffer_stack_max(%rip), %rdx
 3001      000000
 3002              		.loc 1 1470 16
 3003 1991 488B45F8 		movq	-8(%rbp), %rax
 3004 1995 4801D0   		addq	%rdx, %rax
 3005 1998 488945F0 		movq	%rax, -16(%rbp)
1471:lex.yy.c      **** 		num_to_alloc = (yy_buffer_stack_max) + grow_size;
 3006              		.loc 1 1471 49
 3007 199c 488B45F0 		movq	-16(%rbp), %rax
 3008 19a0 488D14C5 		leaq	0(,%rax,8), %rdx
 3008      00000000 
 3009 19a8 488B0548 		movq	yy_buffer_stack(%rip), %rax
 3009      000000
 3010 19af 4889C1   		movq	%rax, %rcx
 3011 19b2 E8770400 		call	yyrealloc
 3011      00
 3012              		.loc 1 1471 21 discriminator 1
 3013 19b7 48890548 		movq	%rax, yy_buffer_stack(%rip)
 3013      000000
1472:lex.yy.c      **** 		(yy_buffer_stack) = (struct yy_buffer_state**)yyrealloc
1473:lex.yy.c      **** 								((yy_buffer_stack),
1474:lex.yy.c      **** 								num_to_alloc * sizeof(struct yy_buffer_state*)
1475:lex.yy.c      **** 								);
 3014              		.loc 1 1475 8
 3015 19be 488B0548 		movq	yy_buffer_stack(%rip), %rax
 3015      000000
 3016              		.loc 1 1475 6
 3017 19c5 4885C0   		testq	%rax, %rax
 3018 19c8 750F     		jne	.L157
1476:lex.yy.c      **** 		if ( ! (yy_buffer_stack) )
 3019              		.loc 1 1476 4
 3020 19ca 488D0598 		leaq	.LC12(%rip), %rax
 3020      040000
 3021 19d1 4889C1   		movq	%rax, %rcx
 3022 19d4 E84A0200 		call	yy_fatal_error
 3022      00
 3023              	.L157:
1477:lex.yy.c      **** 			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
1478:lex.yy.c      **** 
1479:lex.yy.c      **** 		/* zero only the new slots.*/
 3024              		.loc 1 1479 3
 3025 19d9 488B45F8 		movq	-8(%rbp), %rax
 3026 19dd 488D0CC5 		leaq	0(,%rax,8), %rcx
 3026      00000000 
 3027 19e5 488B0548 		movq	yy_buffer_stack(%rip), %rax
 3027      000000
 3028              		.loc 1 1479 28
 3029 19ec 488B1540 		movq	yy_buffer_stack_max(%rip), %rdx
 3029      000000
 3030 19f3 48C1E203 		salq	$3, %rdx
 3031 19f7 4801D0   		addq	%rdx, %rax
 3032              		.loc 1 1479 3
 3033 19fa 4989C8   		movq	%rcx, %r8
 3034 19fd BA000000 		movl	$0, %edx
 3034      00
 3035 1a02 4889C1   		movq	%rax, %rcx
 3036 1a05 E8000000 		call	memset
 3036      00
1480:lex.yy.c      **** 		memset((yy_buffer_stack) + (yy_buffer_stack_max), 0, grow_size * sizeof(struct yy_buffer_state*))
 3037              		.loc 1 1480 25
 3038 1a0a 488B45F0 		movq	-16(%rbp), %rax
 3039 1a0e 48890540 		movq	%rax, yy_buffer_stack_max(%rip)
 3039      000000
 3040              	.L153:
 3041              	.LBE14:
1481:lex.yy.c      **** 		(yy_buffer_stack_max) = num_to_alloc;
1482:lex.yy.c      **** 	}
 3042              		.loc 1 1482 1
 3043 1a15 4883C430 		addq	$48, %rsp
 3044 1a19 5D       		popq	%rbp
 3045              		.cfi_restore 6
 3046              		.cfi_def_cfa 7, 8
 3047 1a1a C3       		ret
 3048              		.cfi_endproc
 3049              	.LFE32:
 3050              		.seh_endproc
 3051              		.section .rdata,"dr"
 3052 04c9 00000000 		.align 8
 3052      000000
 3053              	.LC13:
 3054 04d0 6F757420 		.ascii "out of dynamic memory in yy_scan_buffer()\0"
 3054      6F662064 
 3054      796E616D 
 3054      6963206D 
 3054      656D6F72 
 3055              		.text
 3056              		.globl	yy_scan_buffer
 3058              		.seh_proc	yy_scan_buffer
 3059              	yy_scan_buffer:
 3060              	.LFB33:
1483:lex.yy.c      **** }
1484:lex.yy.c      **** 
1485:lex.yy.c      **** /** Setup the input buffer state to scan directly from a user-specified character buffer.
1486:lex.yy.c      ****  * @param base the character buffer
1487:lex.yy.c      ****  * @param size the size in bytes of the character buffer
1488:lex.yy.c      ****  * 
1489:lex.yy.c      ****  * @return the newly allocated buffer state object.
1490:lex.yy.c      ****  */
1491:lex.yy.c      **** YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size )
 3061              		.loc 1 1491 1
 3062              		.cfi_startproc
 3063 1a1b 55       		pushq	%rbp
 3064              		.seh_pushreg	%rbp
 3065              		.cfi_def_cfa_offset 16
 3066              		.cfi_offset 6, -16
 3067 1a1c 4889E5   		movq	%rsp, %rbp
 3068              		.seh_setframe	%rbp, 0
 3069              		.cfi_def_cfa_register 6
 3070 1a1f 4883EC30 		subq	$48, %rsp
 3071              		.seh_stackalloc	48
 3072              		.seh_endprologue
 3073 1a23 48894D10 		movq	%rcx, 16(%rbp)
 3074 1a27 48895518 		movq	%rdx, 24(%rbp)
1492:lex.yy.c      **** {
1493:lex.yy.c      **** 	YY_BUFFER_STATE b;
1494:lex.yy.c      ****     
 3075              		.loc 1 1494 5
 3076 1a2b 48837D18 		cmpq	$1, 24(%rbp)
 3076      01
 3077 1a30 762C     		jbe	.L159
1495:lex.yy.c      **** 	if ( size < 2 ||
 3078              		.loc 1 1495 11
 3079 1a32 488B4518 		movq	24(%rbp), %rax
 3080 1a36 488D50FE 		leaq	-2(%rax), %rdx
 3081 1a3a 488B4510 		movq	16(%rbp), %rax
 3082 1a3e 4801D0   		addq	%rdx, %rax
 3083 1a41 0FB600   		movzbl	(%rax), %eax
1494:lex.yy.c      **** 	if ( size < 2 ||
 3084              		.loc 1 1494 16 discriminator 1
 3085 1a44 84C0     		testb	%al, %al
 3086 1a46 7516     		jne	.L159
1496:lex.yy.c      **** 	     base[size-2] != YY_END_OF_BUFFER_CHAR ||
 3087              		.loc 1 1496 11
 3088 1a48 488B4518 		movq	24(%rbp), %rax
 3089 1a4c 488D50FF 		leaq	-1(%rax), %rdx
 3090 1a50 488B4510 		movq	16(%rbp), %rax
 3091 1a54 4801D0   		addq	%rdx, %rax
 3092 1a57 0FB600   		movzbl	(%rax), %eax
1495:lex.yy.c      **** 	if ( size < 2 ||
 3093              		.loc 1 1495 45
 3094 1a5a 84C0     		testb	%al, %al
 3095 1a5c 740A     		je	.L160
 3096              	.L159:
1497:lex.yy.c      **** 	     base[size-1] != YY_END_OF_BUFFER_CHAR )
1498:lex.yy.c      **** 		/* They forgot to leave room for the EOB's. */
 3097              		.loc 1 1498 10
 3098 1a5e B8000000 		movl	$0, %eax
 3098      00
 3099 1a63 E9B00000 		jmp	.L161
 3099      00
 3100              	.L160:
1499:lex.yy.c      **** 		return NULL;
1500:lex.yy.c      **** 
 3101              		.loc 1 1500 24
 3102 1a68 B9400000 		movl	$64, %ecx
 3102      00
 3103 1a6d E89E0300 		call	yyalloc
 3103      00
 3104 1a72 488945F8 		movq	%rax, -8(%rbp)
1501:lex.yy.c      **** 	b = (YY_BUFFER_STATE) yyalloc( sizeof( struct yy_buffer_state )  );
 3105              		.loc 1 1501 5
 3106 1a76 48837DF8 		cmpq	$0, -8(%rbp)
 3106      00
 3107 1a7b 750F     		jne	.L162
1502:lex.yy.c      **** 	if ( ! b )
 3108              		.loc 1 1502 3
 3109 1a7d 488D05D0 		leaq	.LC13(%rip), %rax
 3109      040000
 3110 1a84 4889C1   		movq	%rax, %rcx
 3111 1a87 E8970100 		call	yy_fatal_error
 3111      00
 3112              	.L162:
1503:lex.yy.c      **** 		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_buffer()" );
1504:lex.yy.c      **** 
 3113              		.loc 1 1504 31
 3114 1a8c 488B4518 		movq	24(%rbp), %rax
 3115 1a90 83E802   		subl	$2, %eax
 3116              		.loc 1 1504 19
 3117 1a93 89C2     		movl	%eax, %edx
 3118              		.loc 1 1504 17
 3119 1a95 488B45F8 		movq	-8(%rbp), %rax
 3120 1a99 895018   		movl	%edx, 24(%rax)
1505:lex.yy.c      **** 	b->yy_buf_size = (int) (size - 2);	/* "- 2" to take care of EOB's */
 3121              		.loc 1 1505 31
 3122 1a9c 488B45F8 		movq	-8(%rbp), %rax
 3123 1aa0 488B5510 		movq	16(%rbp), %rdx
 3124 1aa4 48895008 		movq	%rdx, 8(%rax)
 3125              		.loc 1 1505 19
 3126 1aa8 488B45F8 		movq	-8(%rbp), %rax
 3127 1aac 488B5008 		movq	8(%rax), %rdx
 3128              		.loc 1 1505 16
 3129 1ab0 488B45F8 		movq	-8(%rbp), %rax
 3130 1ab4 48895010 		movq	%rdx, 16(%rax)
1506:lex.yy.c      **** 	b->yy_buf_pos = b->yy_ch_buf = base;
 3131              		.loc 1 1506 22
 3132 1ab8 488B45F8 		movq	-8(%rbp), %rax
 3133 1abc C7402000 		movl	$0, 32(%rax)
 3133      000000
1507:lex.yy.c      **** 	b->yy_is_our_buffer = 0;
 3134              		.loc 1 1507 19
 3135 1ac3 488B45F8 		movq	-8(%rbp), %rax
 3136 1ac7 48C70000 		movq	$0, (%rax)
 3136      000000
1508:lex.yy.c      **** 	b->yy_input_file = NULL;
 3137              		.loc 1 1508 19
 3138 1ace 488B45F8 		movq	-8(%rbp), %rax
 3139 1ad2 8B5018   		movl	24(%rax), %edx
 3140              		.loc 1 1508 16
 3141 1ad5 488B45F8 		movq	-8(%rbp), %rax
 3142 1ad9 89501C   		movl	%edx, 28(%rax)
1509:lex.yy.c      **** 	b->yy_n_chars = b->yy_buf_size;
 3143              		.loc 1 1509 23
 3144 1adc 488B45F8 		movq	-8(%rbp), %rax
 3145 1ae0 C7402400 		movl	$0, 36(%rax)
 3145      000000
1510:lex.yy.c      **** 	b->yy_is_interactive = 0;
 3146              		.loc 1 1510 15
 3147 1ae7 488B45F8 		movq	-8(%rbp), %rax
 3148 1aeb C7402801 		movl	$1, 40(%rax)
 3148      000000
1511:lex.yy.c      **** 	b->yy_at_bol = 1;
 3149              		.loc 1 1511 20
 3150 1af2 488B45F8 		movq	-8(%rbp), %rax
 3151 1af6 C7403400 		movl	$0, 52(%rax)
 3151      000000
1512:lex.yy.c      **** 	b->yy_fill_buffer = 0;
 3152              		.loc 1 1512 22
 3153 1afd 488B45F8 		movq	-8(%rbp), %rax
 3154 1b01 C7403800 		movl	$0, 56(%rax)
 3154      000000
1513:lex.yy.c      **** 	b->yy_buffer_status = YY_BUFFER_NEW;
1514:lex.yy.c      **** 
 3155              		.loc 1 1514 2
 3156 1b08 488B45F8 		movq	-8(%rbp), %rax
 3157 1b0c 4889C1   		movq	%rax, %rcx
 3158 1b0f E8BEF7FF 		call	yy_switch_to_buffer
 3158      FF
1515:lex.yy.c      **** 	yy_switch_to_buffer( b  );
1516:lex.yy.c      **** 
 3159              		.loc 1 1516 9
 3160 1b14 488B45F8 		movq	-8(%rbp), %rax
 3161              	.L161:
1517:lex.yy.c      **** 	return b;
 3162              		.loc 1 1517 1
 3163 1b18 4883C430 		addq	$48, %rsp
 3164 1b1c 5D       		popq	%rbp
 3165              		.cfi_restore 6
 3166              		.cfi_def_cfa 7, 8
 3167 1b1d C3       		ret
 3168              		.cfi_endproc
 3169              	.LFE33:
 3170              		.seh_endproc
 3171              		.globl	yy_scan_string
 3173              		.seh_proc	yy_scan_string
 3174              	yy_scan_string:
 3175              	.LFB34:
1518:lex.yy.c      **** }
1519:lex.yy.c      **** 
1520:lex.yy.c      **** /** Setup the input buffer state to scan a string. The next call to yylex() will
1521:lex.yy.c      ****  * scan from a @e copy of @a str.
1522:lex.yy.c      ****  * @param yystr a NUL-terminated string to scan
1523:lex.yy.c      ****  * 
1524:lex.yy.c      ****  * @return the newly allocated buffer state object.
1525:lex.yy.c      ****  * @note If you want to scan bytes that may contain NUL values, then use
1526:lex.yy.c      ****  *       yy_scan_bytes() instead.
1527:lex.yy.c      ****  */
1528:lex.yy.c      **** YY_BUFFER_STATE yy_scan_string (const char * yystr )
 3176              		.loc 1 1528 1
 3177              		.cfi_startproc
 3178 1b1e 55       		pushq	%rbp
 3179              		.seh_pushreg	%rbp
 3180              		.cfi_def_cfa_offset 16
 3181              		.cfi_offset 6, -16
 3182 1b1f 4889E5   		movq	%rsp, %rbp
 3183              		.seh_setframe	%rbp, 0
 3184              		.cfi_def_cfa_register 6
 3185 1b22 4883EC20 		subq	$32, %rsp
 3186              		.seh_stackalloc	32
 3187              		.seh_endprologue
 3188 1b26 48894D10 		movq	%rcx, 16(%rbp)
1529:lex.yy.c      **** {
1530:lex.yy.c      ****     
 3189              		.loc 1 1530 37
 3190 1b2a 488B4510 		movq	16(%rbp), %rax
 3191 1b2e 4889C1   		movq	%rax, %rcx
 3192 1b31 E8000000 		call	strlen
 3192      00
 3193              		.loc 1 1530 9 discriminator 1
 3194 1b36 89C2     		movl	%eax, %edx
 3195 1b38 488B4510 		movq	16(%rbp), %rax
 3196 1b3c 4889C1   		movq	%rax, %rcx
 3197 1b3f E8060000 		call	yy_scan_bytes
 3197      00
1531:lex.yy.c      **** 	return yy_scan_bytes( yystr, (int) strlen(yystr) );
 3198              		.loc 1 1531 1
 3199 1b44 4883C420 		addq	$32, %rsp
 3200 1b48 5D       		popq	%rbp
 3201              		.cfi_restore 6
 3202              		.cfi_def_cfa 7, 8
 3203 1b49 C3       		ret
 3204              		.cfi_endproc
 3205              	.LFE34:
 3206              		.seh_endproc
 3207              		.section .rdata,"dr"
 3208 04fa 00000000 		.align 8
 3208      0000
 3209              	.LC14:
 3210 0500 6F757420 		.ascii "out of dynamic memory in yy_scan_bytes()\0"
 3210      6F662064 
 3210      796E616D 
 3210      6963206D 
 3210      656D6F72 
 3211              	.LC15:
 3212 0529 62616420 		.ascii "bad buffer in yy_scan_bytes()\0"
 3212      62756666 
 3212      65722069 
 3212      6E207979 
 3212      5F736361 
 3213              		.text
 3214              		.globl	yy_scan_bytes
 3216              		.seh_proc	yy_scan_bytes
 3217              	yy_scan_bytes:
 3218              	.LFB35:
1532:lex.yy.c      **** }
1533:lex.yy.c      **** 
1534:lex.yy.c      **** /** Setup the input buffer state to scan the given bytes. The next call to yylex() will
1535:lex.yy.c      ****  * scan from a @e copy of @a bytes.
1536:lex.yy.c      ****  * @param yybytes the byte buffer to scan
1537:lex.yy.c      ****  * @param _yybytes_len the number of bytes in the buffer pointed to by @a bytes.
1538:lex.yy.c      ****  * 
1539:lex.yy.c      ****  * @return the newly allocated buffer state object.
1540:lex.yy.c      ****  */
1541:lex.yy.c      **** YY_BUFFER_STATE yy_scan_bytes  (const char * yybytes, int  _yybytes_len )
 3219              		.loc 1 1541 1
 3220              		.cfi_startproc
 3221 1b4a 55       		pushq	%rbp
 3222              		.seh_pushreg	%rbp
 3223              		.cfi_def_cfa_offset 16
 3224              		.cfi_offset 6, -16
 3225 1b4b 4889E5   		movq	%rsp, %rbp
 3226              		.seh_setframe	%rbp, 0
 3227              		.cfi_def_cfa_register 6
 3228 1b4e 4883EC40 		subq	$64, %rsp
 3229              		.seh_stackalloc	64
 3230              		.seh_endprologue
 3231 1b52 48894D10 		movq	%rcx, 16(%rbp)
 3232 1b56 895518   		movl	%edx, 24(%rbp)
1542:lex.yy.c      **** {
1543:lex.yy.c      **** 	YY_BUFFER_STATE b;
1544:lex.yy.c      **** 	char *buf;
1545:lex.yy.c      **** 	yy_size_t n;
1546:lex.yy.c      **** 	int i;
1547:lex.yy.c      ****     
1548:lex.yy.c      **** 	/* Get memory for full buffer, including space for trailing EOB's. */
 3233              		.loc 1 1548 32
 3234 1b59 8B4518   		movl	24(%rbp), %eax
 3235 1b5c 83C002   		addl	$2, %eax
 3236              		.loc 1 1548 4
 3237 1b5f 4898     		cltq
 3238 1b61 488945F0 		movq	%rax, -16(%rbp)
1549:lex.yy.c      **** 	n = (yy_size_t) (_yybytes_len + 2);
 3239              		.loc 1 1549 17
 3240 1b65 488B45F0 		movq	-16(%rbp), %rax
 3241 1b69 4889C1   		movq	%rax, %rcx
 3242 1b6c E89F0200 		call	yyalloc
 3242      00
 3243 1b71 488945E8 		movq	%rax, -24(%rbp)
1550:lex.yy.c      **** 	buf = (char *) yyalloc( n  );
 3244              		.loc 1 1550 5
 3245 1b75 48837DE8 		cmpq	$0, -24(%rbp)
 3245      00
 3246 1b7a 750F     		jne	.L166
1551:lex.yy.c      **** 	if ( ! buf )
 3247              		.loc 1 1551 3
 3248 1b7c 488D0500 		leaq	.LC14(%rip), %rax
 3248      050000
 3249 1b83 4889C1   		movq	%rax, %rcx
 3250 1b86 E8980000 		call	yy_fatal_error
 3250      00
 3251              	.L166:
1552:lex.yy.c      **** 		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_bytes()" );
1553:lex.yy.c      **** 
 3252              		.loc 1 1553 10
 3253 1b8b C745FC00 		movl	$0, -4(%rbp)
 3253      000000
 3254              		.loc 1 1553 2
 3255 1b92 EB23     		jmp	.L167
 3256              	.L168:
1554:lex.yy.c      **** 	for ( i = 0; i < _yybytes_len; ++i )
 3257              		.loc 1 1554 19
 3258 1b94 8B45FC   		movl	-4(%rbp), %eax
 3259 1b97 4863D0   		movslq	%eax, %rdx
 3260 1b9a 488B4510 		movq	16(%rbp), %rax
 3261 1b9e 4801D0   		addq	%rdx, %rax
 3262              		.loc 1 1554 6
 3263 1ba1 8B55FC   		movl	-4(%rbp), %edx
 3264 1ba4 4863CA   		movslq	%edx, %rcx
 3265 1ba7 488B55E8 		movq	-24(%rbp), %rdx
 3266 1bab 4801CA   		addq	%rcx, %rdx
 3267              		.loc 1 1554 19
 3268 1bae 0FB600   		movzbl	(%rax), %eax
 3269              		.loc 1 1554 10
 3270 1bb1 8802     		movb	%al, (%rdx)
1553:lex.yy.c      **** 	for ( i = 0; i < _yybytes_len; ++i )
 3271              		.loc 1 1553 33 discriminator 3
 3272 1bb3 8345FC01 		addl	$1, -4(%rbp)
 3273              	.L167:
1553:lex.yy.c      **** 	for ( i = 0; i < _yybytes_len; ++i )
 3274              		.loc 1 1553 17 discriminator 1
 3275 1bb7 8B45FC   		movl	-4(%rbp), %eax
 3276 1bba 3B4518   		cmpl	24(%rbp), %eax
 3277 1bbd 7CD5     		jl	.L168
1555:lex.yy.c      **** 		buf[i] = yybytes[i];
1556:lex.yy.c      **** 
 3278              		.loc 1 1556 25
 3279 1bbf 8B4518   		movl	24(%rbp), %eax
 3280 1bc2 4898     		cltq
 3281 1bc4 488D5001 		leaq	1(%rax), %rdx
 3282 1bc8 488B45E8 		movq	-24(%rbp), %rax
 3283 1bcc 4801D0   		addq	%rdx, %rax
 3284              		.loc 1 1556 42
 3285 1bcf C60000   		movb	$0, (%rax)
 3286              		.loc 1 1556 5
 3287 1bd2 8B5518   		movl	24(%rbp), %edx
 3288 1bd5 4863CA   		movslq	%edx, %rcx
 3289 1bd8 488B55E8 		movq	-24(%rbp), %rdx
 3290 1bdc 4801CA   		addq	%rcx, %rdx
 3291              		.loc 1 1556 25
 3292 1bdf 0FB600   		movzbl	(%rax), %eax
 3293              		.loc 1 1556 20
 3294 1be2 8802     		movb	%al, (%rdx)
1557:lex.yy.c      **** 	buf[_yybytes_len] = buf[_yybytes_len+1] = YY_END_OF_BUFFER_CHAR;
1558:lex.yy.c      **** 
 3295              		.loc 1 1558 6
 3296 1be4 488B55F0 		movq	-16(%rbp), %rdx
 3297 1be8 488B45E8 		movq	-24(%rbp), %rax
 3298 1bec 4889C1   		movq	%rax, %rcx
 3299 1bef E827FEFF 		call	yy_scan_buffer
 3299      FF
 3300 1bf4 488945E0 		movq	%rax, -32(%rbp)
1559:lex.yy.c      **** 	b = yy_scan_buffer( buf, n );
 3301              		.loc 1 1559 5
 3302 1bf8 48837DE0 		cmpq	$0, -32(%rbp)
 3302      00
 3303 1bfd 750F     		jne	.L169
1560:lex.yy.c      **** 	if ( ! b )
 3304              		.loc 1 1560 3
 3305 1bff 488D0529 		leaq	.LC15(%rip), %rax
 3305      050000
 3306 1c06 4889C1   		movq	%rax, %rcx
 3307 1c09 E8150000 		call	yy_fatal_error
 3307      00
 3308              	.L169:
1561:lex.yy.c      **** 		YY_FATAL_ERROR( "bad buffer in yy_scan_bytes()" );
1562:lex.yy.c      **** 
1563:lex.yy.c      **** 	/* It's okay to grow etc. this buffer, and we should throw it
1564:lex.yy.c      **** 	 * away when we're done.
1565:lex.yy.c      **** 	 */
 3309              		.loc 1 1565 22
 3310 1c0e 488B45E0 		movq	-32(%rbp), %rax
 3311 1c12 C7402001 		movl	$1, 32(%rax)
 3311      000000
1566:lex.yy.c      **** 	b->yy_is_our_buffer = 1;
1567:lex.yy.c      **** 
 3312              		.loc 1 1567 9
 3313 1c19 488B45E0 		movq	-32(%rbp), %rax
1568:lex.yy.c      **** 	return b;
 3314              		.loc 1 1568 1
 3315 1c1d 4883C440 		addq	$64, %rsp
 3316 1c21 5D       		popq	%rbp
 3317              		.cfi_restore 6
 3318              		.cfi_def_cfa 7, 8
 3319 1c22 C3       		ret
 3320              		.cfi_endproc
 3321              	.LFE35:
 3322              		.seh_endproc
 3323              		.section .rdata,"dr"
 3324              	.LC16:
 3325 0547 25730A00 		.ascii "%s\12\0"
 3326 054b 00000000 		.text
 3326      00000000 
 3326      00000000 
 3326      00000000 
 3326      00000000 
 3328              		.seh_proc	yy_fatal_error
 3329              	yy_fatal_error:
 3330              	.LFB36:
1569:lex.yy.c      **** }
1570:lex.yy.c      **** 
1571:lex.yy.c      **** #ifndef YY_EXIT_FAILURE
1572:lex.yy.c      **** #define YY_EXIT_FAILURE 2
1573:lex.yy.c      **** #endif
1574:lex.yy.c      **** 
1575:lex.yy.c      **** static void yynoreturn yy_fatal_error (const char* msg )
 3331              		.loc 1 1575 1
 3332              		.cfi_startproc
 3333 1c23 55       		pushq	%rbp
 3334              		.seh_pushreg	%rbp
 3335              		.cfi_def_cfa_offset 16
 3336              		.cfi_offset 6, -16
 3337 1c24 4889E5   		movq	%rsp, %rbp
 3338              		.seh_setframe	%rbp, 0
 3339              		.cfi_def_cfa_register 6
 3340 1c27 4883EC20 		subq	$32, %rsp
 3341              		.seh_stackalloc	32
 3342              		.seh_endprologue
 3343 1c2b 48894D10 		movq	%rcx, 16(%rbp)
1576:lex.yy.c      **** {
 3344              		.loc 1 1576 4
 3345 1c2f B9020000 		movl	$2, %ecx
 3345      00
 3346 1c34 488B0500 		movq	__imp___acrt_iob_func(%rip), %rax
 3346      000000
 3347 1c3b FFD0     		call	*%rax
 3348              	.LVL7:
 3349 1c3d 4889C1   		movq	%rax, %rcx
 3350              		.loc 1 1576 4 is_stmt 0 discriminator 1
 3351 1c40 488B4510 		movq	16(%rbp), %rax
 3352 1c44 4989C0   		movq	%rax, %r8
 3353 1c47 488D0547 		leaq	.LC16(%rip), %rax
 3353      050000
 3354 1c4e 4889C2   		movq	%rax, %rdx
 3355 1c51 E8000000 		call	__mingw_fprintf
 3355      00
1577:lex.yy.c      **** 			fprintf( stderr, "%s\n", msg );
 3356              		.loc 1 1577 2 is_stmt 1
 3357 1c56 B9020000 		movl	$2, %ecx
 3357      00
 3358 1c5b E8000000 		call	exit
 3358      00
 3359 1c60 90       		nop
 3360              		.cfi_endproc
 3361              	.LFE36:
 3362              		.seh_endproc
 3363              		.globl	yyget_lineno
 3365              		.seh_proc	yyget_lineno
 3366              	yyget_lineno:
 3367              	.LFB37:
1578:lex.yy.c      **** 	exit( YY_EXIT_FAILURE );
1579:lex.yy.c      **** }
1580:lex.yy.c      **** 
1581:lex.yy.c      **** /* Redefine yyless() so it works in section 3 code. */
1582:lex.yy.c      **** 
1583:lex.yy.c      **** #undef yyless
1584:lex.yy.c      **** #define yyless(n) \
1585:lex.yy.c      **** 	do \
1586:lex.yy.c      **** 		{ \
1587:lex.yy.c      **** 		/* Undo effects of setting up yytext. */ \
1588:lex.yy.c      ****         int yyless_macro_arg = (n); \
1589:lex.yy.c      ****         YY_LESS_LINENO(yyless_macro_arg);\
1590:lex.yy.c      **** 		yytext[yyleng] = (yy_hold_char); \
1591:lex.yy.c      **** 		(yy_c_buf_p) = yytext + yyless_macro_arg; \
1592:lex.yy.c      **** 		(yy_hold_char) = *(yy_c_buf_p); \
1593:lex.yy.c      **** 		*(yy_c_buf_p) = '\0'; \
1594:lex.yy.c      **** 		yyleng = yyless_macro_arg; \
1595:lex.yy.c      **** 		} \
1596:lex.yy.c      **** 	while ( 0 )
1597:lex.yy.c      **** 
1598:lex.yy.c      **** /* Accessor  methods (get/set functions) to struct members. */
1599:lex.yy.c      **** 
1600:lex.yy.c      **** /** Get the current line number.
1601:lex.yy.c      ****  * 
1602:lex.yy.c      ****  */
1603:lex.yy.c      **** int yyget_lineno  (void)
 3368              		.loc 1 1603 1
 3369              		.cfi_startproc
 3370 1c61 55       		pushq	%rbp
 3371              		.seh_pushreg	%rbp
 3372              		.cfi_def_cfa_offset 16
 3373              		.cfi_offset 6, -16
 3374 1c62 4889E5   		movq	%rsp, %rbp
 3375              		.seh_setframe	%rbp, 0
 3376              		.cfi_def_cfa_register 6
 3377              		.seh_endprologue
1604:lex.yy.c      **** {
1605:lex.yy.c      ****     
 3378              		.loc 1 1605 12
 3379 1c65 8B050000 		movl	yylineno(%rip), %eax
 3379      0000
1606:lex.yy.c      ****     return yylineno;
 3380              		.loc 1 1606 1
 3381 1c6b 5D       		popq	%rbp
 3382              		.cfi_restore 6
 3383              		.cfi_def_cfa 7, 8
 3384 1c6c C3       		ret
 3385              		.cfi_endproc
 3386              	.LFE37:
 3387              		.seh_endproc
 3388              		.globl	yyget_in
 3390              		.seh_proc	yyget_in
 3391              	yyget_in:
 3392              	.LFB38:
1607:lex.yy.c      **** }
1608:lex.yy.c      **** 
1609:lex.yy.c      **** /** Get the input stream.
1610:lex.yy.c      ****  * 
1611:lex.yy.c      ****  */
1612:lex.yy.c      **** FILE *yyget_in  (void)
 3393              		.loc 1 1612 1
 3394              		.cfi_startproc
 3395 1c6d 55       		pushq	%rbp
 3396              		.seh_pushreg	%rbp
 3397              		.cfi_def_cfa_offset 16
 3398              		.cfi_offset 6, -16
 3399 1c6e 4889E5   		movq	%rsp, %rbp
 3400              		.seh_setframe	%rbp, 0
 3401              		.cfi_def_cfa_register 6
 3402              		.seh_endprologue
1613:lex.yy.c      **** {
 3403              		.loc 1 1613 16
 3404 1c71 488B0508 		movq	yyin(%rip), %rax
 3404      000000
1614:lex.yy.c      ****         return yyin;
 3405              		.loc 1 1614 1
 3406 1c78 5D       		popq	%rbp
 3407              		.cfi_restore 6
 3408              		.cfi_def_cfa 7, 8
 3409 1c79 C3       		ret
 3410              		.cfi_endproc
 3411              	.LFE38:
 3412              		.seh_endproc
 3413              		.globl	yyget_out
 3415              		.seh_proc	yyget_out
 3416              	yyget_out:
 3417              	.LFB39:
1615:lex.yy.c      **** }
1616:lex.yy.c      **** 
1617:lex.yy.c      **** /** Get the output stream.
1618:lex.yy.c      ****  * 
1619:lex.yy.c      ****  */
1620:lex.yy.c      **** FILE *yyget_out  (void)
 3418              		.loc 1 1620 1
 3419              		.cfi_startproc
 3420 1c7a 55       		pushq	%rbp
 3421              		.seh_pushreg	%rbp
 3422              		.cfi_def_cfa_offset 16
 3423              		.cfi_offset 6, -16
 3424 1c7b 4889E5   		movq	%rsp, %rbp
 3425              		.seh_setframe	%rbp, 0
 3426              		.cfi_def_cfa_register 6
 3427              		.seh_endprologue
1621:lex.yy.c      **** {
 3428              		.loc 1 1621 16
 3429 1c7e 488B0510 		movq	yyout(%rip), %rax
 3429      000000
1622:lex.yy.c      ****         return yyout;
 3430              		.loc 1 1622 1
 3431 1c85 5D       		popq	%rbp
 3432              		.cfi_restore 6
 3433              		.cfi_def_cfa 7, 8
 3434 1c86 C3       		ret
 3435              		.cfi_endproc
 3436              	.LFE39:
 3437              		.seh_endproc
 3438              		.globl	yyget_leng
 3440              		.seh_proc	yyget_leng
 3441              	yyget_leng:
 3442              	.LFB40:
1623:lex.yy.c      **** }
1624:lex.yy.c      **** 
1625:lex.yy.c      **** /** Get the length of the current token.
1626:lex.yy.c      ****  * 
1627:lex.yy.c      ****  */
1628:lex.yy.c      **** int yyget_leng  (void)
 3443              		.loc 1 1628 1
 3444              		.cfi_startproc
 3445 1c87 55       		pushq	%rbp
 3446              		.seh_pushreg	%rbp
 3447              		.cfi_def_cfa_offset 16
 3448              		.cfi_offset 6, -16
 3449 1c88 4889E5   		movq	%rsp, %rbp
 3450              		.seh_setframe	%rbp, 0
 3451              		.cfi_def_cfa_register 6
 3452              		.seh_endprologue
1629:lex.yy.c      **** {
 3453              		.loc 1 1629 16
 3454 1c8b 8B050000 		movl	yyleng(%rip), %eax
 3454      0000
1630:lex.yy.c      ****         return yyleng;
 3455              		.loc 1 1630 1
 3456 1c91 5D       		popq	%rbp
 3457              		.cfi_restore 6
 3458              		.cfi_def_cfa 7, 8
 3459 1c92 C3       		ret
 3460              		.cfi_endproc
 3461              	.LFE40:
 3462              		.seh_endproc
 3463              		.globl	yyget_text
 3465              		.seh_proc	yyget_text
 3466              	yyget_text:
 3467              	.LFB41:
1631:lex.yy.c      **** }
1632:lex.yy.c      **** 
1633:lex.yy.c      **** /** Get the current token.
1634:lex.yy.c      ****  * 
1635:lex.yy.c      ****  */
1636:lex.yy.c      **** 
1637:lex.yy.c      **** char *yyget_text  (void)
 3468              		.loc 1 1637 1
 3469              		.cfi_startproc
 3470 1c93 55       		pushq	%rbp
 3471              		.seh_pushreg	%rbp
 3472              		.cfi_def_cfa_offset 16
 3473              		.cfi_offset 6, -16
 3474 1c94 4889E5   		movq	%rsp, %rbp
 3475              		.seh_setframe	%rbp, 0
 3476              		.cfi_def_cfa_register 6
 3477              		.seh_endprologue
1638:lex.yy.c      **** {
 3478              		.loc 1 1638 16
 3479 1c97 488B0520 		movq	yytext(%rip), %rax
 3479      000000
1639:lex.yy.c      ****         return yytext;
 3480              		.loc 1 1639 1
 3481 1c9e 5D       		popq	%rbp
 3482              		.cfi_restore 6
 3483              		.cfi_def_cfa 7, 8
 3484 1c9f C3       		ret
 3485              		.cfi_endproc
 3486              	.LFE41:
 3487              		.seh_endproc
 3488              		.globl	yyset_lineno
 3490              		.seh_proc	yyset_lineno
 3491              	yyset_lineno:
 3492              	.LFB42:
1640:lex.yy.c      **** }
1641:lex.yy.c      **** 
1642:lex.yy.c      **** /** Set the current line number.
1643:lex.yy.c      ****  * @param _line_number line number
1644:lex.yy.c      ****  * 
1645:lex.yy.c      ****  */
1646:lex.yy.c      **** void yyset_lineno (int  _line_number )
 3493              		.loc 1 1646 1
 3494              		.cfi_startproc
 3495 1ca0 55       		pushq	%rbp
 3496              		.seh_pushreg	%rbp
 3497              		.cfi_def_cfa_offset 16
 3498              		.cfi_offset 6, -16
 3499 1ca1 4889E5   		movq	%rsp, %rbp
 3500              		.seh_setframe	%rbp, 0
 3501              		.cfi_def_cfa_register 6
 3502              		.seh_endprologue
 3503 1ca4 894D10   		movl	%ecx, 16(%rbp)
1647:lex.yy.c      **** {
1648:lex.yy.c      ****     
 3504              		.loc 1 1648 14
 3505 1ca7 8B4510   		movl	16(%rbp), %eax
 3506 1caa 89050000 		movl	%eax, yylineno(%rip)
 3506      0000
1649:lex.yy.c      ****     yylineno = _line_number;
 3507              		.loc 1 1649 1
 3508 1cb0 90       		nop
 3509 1cb1 5D       		popq	%rbp
 3510              		.cfi_restore 6
 3511              		.cfi_def_cfa 7, 8
 3512 1cb2 C3       		ret
 3513              		.cfi_endproc
 3514              	.LFE42:
 3515              		.seh_endproc
 3516              		.globl	yyset_in
 3518              		.seh_proc	yyset_in
 3519              	yyset_in:
 3520              	.LFB43:
1650:lex.yy.c      **** }
1651:lex.yy.c      **** 
1652:lex.yy.c      **** /** Set the input stream. This does not discard the current
1653:lex.yy.c      ****  * input buffer.
1654:lex.yy.c      ****  * @param _in_str A readable stream.
1655:lex.yy.c      ****  * 
1656:lex.yy.c      ****  * @see yy_switch_to_buffer
1657:lex.yy.c      ****  */
1658:lex.yy.c      **** void yyset_in (FILE *  _in_str )
 3521              		.loc 1 1658 1
 3522              		.cfi_startproc
 3523 1cb3 55       		pushq	%rbp
 3524              		.seh_pushreg	%rbp
 3525              		.cfi_def_cfa_offset 16
 3526              		.cfi_offset 6, -16
 3527 1cb4 4889E5   		movq	%rsp, %rbp
 3528              		.seh_setframe	%rbp, 0
 3529              		.cfi_def_cfa_register 6
 3530              		.seh_endprologue
 3531 1cb7 48894D10 		movq	%rcx, 16(%rbp)
1659:lex.yy.c      **** {
 3532              		.loc 1 1659 14
 3533 1cbb 488B4510 		movq	16(%rbp), %rax
 3534 1cbf 48890508 		movq	%rax, yyin(%rip)
 3534      000000
1660:lex.yy.c      ****         yyin = _in_str ;
 3535              		.loc 1 1660 1
 3536 1cc6 90       		nop
 3537 1cc7 5D       		popq	%rbp
 3538              		.cfi_restore 6
 3539              		.cfi_def_cfa 7, 8
 3540 1cc8 C3       		ret
 3541              		.cfi_endproc
 3542              	.LFE43:
 3543              		.seh_endproc
 3544              		.globl	yyset_out
 3546              		.seh_proc	yyset_out
 3547              	yyset_out:
 3548              	.LFB44:
1661:lex.yy.c      **** }
1662:lex.yy.c      **** 
1663:lex.yy.c      **** void yyset_out (FILE *  _out_str )
 3549              		.loc 1 1663 1
 3550              		.cfi_startproc
 3551 1cc9 55       		pushq	%rbp
 3552              		.seh_pushreg	%rbp
 3553              		.cfi_def_cfa_offset 16
 3554              		.cfi_offset 6, -16
 3555 1cca 4889E5   		movq	%rsp, %rbp
 3556              		.seh_setframe	%rbp, 0
 3557              		.cfi_def_cfa_register 6
 3558              		.seh_endprologue
 3559 1ccd 48894D10 		movq	%rcx, 16(%rbp)
1664:lex.yy.c      **** {
 3560              		.loc 1 1664 15
 3561 1cd1 488B4510 		movq	16(%rbp), %rax
 3562 1cd5 48890510 		movq	%rax, yyout(%rip)
 3562      000000
1665:lex.yy.c      ****         yyout = _out_str ;
 3563              		.loc 1 1665 1
 3564 1cdc 90       		nop
 3565 1cdd 5D       		popq	%rbp
 3566              		.cfi_restore 6
 3567              		.cfi_def_cfa 7, 8
 3568 1cde C3       		ret
 3569              		.cfi_endproc
 3570              	.LFE44:
 3571              		.seh_endproc
 3572              		.globl	yyget_debug
 3574              		.seh_proc	yyget_debug
 3575              	yyget_debug:
 3576              	.LFB45:
1666:lex.yy.c      **** }
1667:lex.yy.c      **** 
1668:lex.yy.c      **** int yyget_debug  (void)
 3577              		.loc 1 1668 1
 3578              		.cfi_startproc
 3579 1cdf 55       		pushq	%rbp
 3580              		.seh_pushreg	%rbp
 3581              		.cfi_def_cfa_offset 16
 3582              		.cfi_offset 6, -16
 3583 1ce0 4889E5   		movq	%rsp, %rbp
 3584              		.seh_setframe	%rbp, 0
 3585              		.cfi_def_cfa_register 6
 3586              		.seh_endprologue
1669:lex.yy.c      **** {
 3587              		.loc 1 1669 16
 3588 1ce3 8B051800 		movl	yy_flex_debug(%rip), %eax
 3588      0000
1670:lex.yy.c      ****         return yy_flex_debug;
 3589              		.loc 1 1670 1
 3590 1ce9 5D       		popq	%rbp
 3591              		.cfi_restore 6
 3592              		.cfi_def_cfa 7, 8
 3593 1cea C3       		ret
 3594              		.cfi_endproc
 3595              	.LFE45:
 3596              		.seh_endproc
 3597              		.globl	yyset_debug
 3599              		.seh_proc	yyset_debug
 3600              	yyset_debug:
 3601              	.LFB46:
1671:lex.yy.c      **** }
1672:lex.yy.c      **** 
1673:lex.yy.c      **** void yyset_debug (int  _bdebug )
 3602              		.loc 1 1673 1
 3603              		.cfi_startproc
 3604 1ceb 55       		pushq	%rbp
 3605              		.seh_pushreg	%rbp
 3606              		.cfi_def_cfa_offset 16
 3607              		.cfi_offset 6, -16
 3608 1cec 4889E5   		movq	%rsp, %rbp
 3609              		.seh_setframe	%rbp, 0
 3610              		.cfi_def_cfa_register 6
 3611              		.seh_endprologue
 3612 1cef 894D10   		movl	%ecx, 16(%rbp)
1674:lex.yy.c      **** {
 3613              		.loc 1 1674 23
 3614 1cf2 8B4510   		movl	16(%rbp), %eax
 3615 1cf5 89051800 		movl	%eax, yy_flex_debug(%rip)
 3615      0000
1675:lex.yy.c      ****         yy_flex_debug = _bdebug ;
 3616              		.loc 1 1675 1
 3617 1cfb 90       		nop
 3618 1cfc 5D       		popq	%rbp
 3619              		.cfi_restore 6
 3620              		.cfi_def_cfa 7, 8
 3621 1cfd C3       		ret
 3622              		.cfi_endproc
 3623              	.LFE46:
 3624              		.seh_endproc
 3626              		.seh_proc	yy_init_globals
 3627              	yy_init_globals:
 3628              	.LFB47:
1676:lex.yy.c      **** }
1677:lex.yy.c      **** 
1678:lex.yy.c      **** static int yy_init_globals (void)
 3629              		.loc 1 1678 1
 3630              		.cfi_startproc
 3631 1cfe 55       		pushq	%rbp
 3632              		.seh_pushreg	%rbp
 3633              		.cfi_def_cfa_offset 16
 3634              		.cfi_offset 6, -16
 3635 1cff 4889E5   		movq	%rsp, %rbp
 3636              		.seh_setframe	%rbp, 0
 3637              		.cfi_def_cfa_register 6
 3638              		.seh_endprologue
1679:lex.yy.c      **** {
1680:lex.yy.c      ****         /* Initialization is the same as for the non-reentrant scanner.
1681:lex.yy.c      ****      * This function is called from yylex_destroy(), so don't allocate here.
1682:lex.yy.c      ****      */
1683:lex.yy.c      **** 
 3639              		.loc 1 1683 23
 3640 1d02 48C70544 		movq	$0, yy_buffer_stack(%rip)
 3640      00000000 
 3640      000000
1684:lex.yy.c      ****     (yy_buffer_stack) = NULL;
 3641              		.loc 1 1684 27
 3642 1d0d 48C70534 		movq	$0, yy_buffer_stack_top(%rip)
 3642      00000000 
 3642      000000
1685:lex.yy.c      ****     (yy_buffer_stack_top) = 0;
 3643              		.loc 1 1685 27
 3644 1d18 48C7053C 		movq	$0, yy_buffer_stack_max(%rip)
 3644      00000000 
 3644      000000
1686:lex.yy.c      ****     (yy_buffer_stack_max) = 0;
 3645              		.loc 1 1686 18
 3646 1d23 48C70554 		movq	$0, yy_c_buf_p(%rip)
 3646      00000000 
 3646      000000
1687:lex.yy.c      ****     (yy_c_buf_p) = NULL;
 3647              		.loc 1 1687 15
 3648 1d2e C7055C00 		movl	$0, yy_init(%rip)
 3648      00000000 
 3648      0000
1688:lex.yy.c      ****     (yy_init) = 0;
 3649              		.loc 1 1688 16
 3650 1d38 C7056000 		movl	$0, yy_start(%rip)
 3650      00000000 
 3650      0000
1689:lex.yy.c      ****     (yy_start) = 0;
1690:lex.yy.c      **** 
1691:lex.yy.c      **** /* Defined in main.c */
1692:lex.yy.c      **** #ifdef YY_STDINIT
1693:lex.yy.c      ****     yyin = stdin;
1694:lex.yy.c      ****     yyout = stdout;
1695:lex.yy.c      **** #else
 3651              		.loc 1 1695 10
 3652 1d42 48C70504 		movq	$0, yyin(%rip)
 3652      00000000 
 3652      000000
1696:lex.yy.c      ****     yyin = NULL;
 3653              		.loc 1 1696 11
 3654 1d4d 48C7050C 		movq	$0, yyout(%rip)
 3654      00000000 
 3654      000000
1697:lex.yy.c      ****     yyout = NULL;
1698:lex.yy.c      **** #endif
1699:lex.yy.c      **** 
1700:lex.yy.c      ****     /* For future reference: Set errno on error, since we are called by
1701:lex.yy.c      ****      * yylex_init()
1702:lex.yy.c      ****      */
 3655              		.loc 1 1702 12
 3656 1d58 B8000000 		movl	$0, %eax
 3656      00
1703:lex.yy.c      ****     return 0;
 3657              		.loc 1 1703 1
 3658 1d5d 5D       		popq	%rbp
 3659              		.cfi_restore 6
 3660              		.cfi_def_cfa 7, 8
 3661 1d5e C3       		ret
 3662              		.cfi_endproc
 3663              	.LFE47:
 3664              		.seh_endproc
 3665              		.globl	yylex_destroy
 3667              		.seh_proc	yylex_destroy
 3668              	yylex_destroy:
 3669              	.LFB48:
1704:lex.yy.c      **** }
1705:lex.yy.c      **** 
1706:lex.yy.c      **** /* yylex_destroy is for both reentrant and non-reentrant scanners. */
1707:lex.yy.c      **** int yylex_destroy  (void)
 3670              		.loc 1 1707 1
 3671              		.cfi_startproc
 3672 1d5f 55       		pushq	%rbp
 3673              		.seh_pushreg	%rbp
 3674              		.cfi_def_cfa_offset 16
 3675              		.cfi_offset 6, -16
 3676 1d60 4889E5   		movq	%rsp, %rbp
 3677              		.seh_setframe	%rbp, 0
 3678              		.cfi_def_cfa_register 6
 3679 1d63 4883EC20 		subq	$32, %rsp
 3680              		.seh_stackalloc	32
 3681              		.seh_endprologue
1708:lex.yy.c      **** {
1709:lex.yy.c      ****     
1710:lex.yy.c      ****     /* Pop the buffer stack, destroying each element. */
 3682              		.loc 1 1710 7
 3683 1d67 EB54     		jmp	.L191
 3684              	.L195:
1711:lex.yy.c      **** 	while(YY_CURRENT_BUFFER){
 3685              		.loc 1 1711 21
 3686 1d69 488B0548 		movq	yy_buffer_stack(%rip), %rax
 3686      000000
 3687              		.loc 1 1711 3
 3688 1d70 4885C0   		testq	%rax, %rax
 3689 1d73 741A     		je	.L192
 3690              		.loc 1 1711 21 discriminator 1
 3691 1d75 488B0548 		movq	yy_buffer_stack(%rip), %rax
 3691      000000
 3692 1d7c 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 3692      000000
 3693 1d83 48C1E203 		salq	$3, %rdx
 3694 1d87 4801D0   		addq	%rdx, %rax
 3695              		.loc 1 1711 3 discriminator 1
 3696 1d8a 488B00   		movq	(%rax), %rax
 3697 1d8d EB05     		jmp	.L193
 3698              	.L192:
 3699              		.loc 1 1711 3 is_stmt 0 discriminator 2
 3700 1d8f B8000000 		movl	$0, %eax
 3700      00
 3701              	.L193:
 3702              		.loc 1 1711 3 discriminator 4
 3703 1d94 4889C1   		movq	%rax, %rcx
 3704 1d97 E852F7FF 		call	yy_delete_buffer
 3704      FF
1712:lex.yy.c      **** 		yy_delete_buffer( YY_CURRENT_BUFFER  );
 3705              		.loc 1 1712 3 is_stmt 1
 3706 1d9c 488B0548 		movq	yy_buffer_stack(%rip), %rax
 3706      000000
 3707 1da3 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 3707      000000
 3708 1daa 48C1E203 		salq	$3, %rdx
 3709 1dae 4801D0   		addq	%rdx, %rax
 3710              		.loc 1 1712 28
 3711 1db1 48C70000 		movq	$0, (%rax)
 3711      000000
1713:lex.yy.c      **** 		YY_CURRENT_BUFFER_LVALUE = NULL;
 3712              		.loc 1 1713 3
 3713 1db8 E837FAFF 		call	yypop_buffer_state
 3713      FF
 3714              	.L191:
1710:lex.yy.c      **** 	while(YY_CURRENT_BUFFER){
 3715              		.loc 1 1710 8
 3716 1dbd 488B0548 		movq	yy_buffer_stack(%rip), %rax
 3716      000000
 3717 1dc4 4885C0   		testq	%rax, %rax
 3718 1dc7 741D     		je	.L194
1710:lex.yy.c      **** 	while(YY_CURRENT_BUFFER){
 3719              		.loc 1 1710 8 is_stmt 0 discriminator 1
 3720 1dc9 488B0548 		movq	yy_buffer_stack(%rip), %rax
 3720      000000
 3721 1dd0 488B1538 		movq	yy_buffer_stack_top(%rip), %rdx
 3721      000000
 3722 1dd7 48C1E203 		salq	$3, %rdx
 3723 1ddb 4801D0   		addq	%rdx, %rax
 3724 1dde 488B00   		movq	(%rax), %rax
 3725 1de1 4885C0   		testq	%rax, %rax
 3726 1de4 7583     		jne	.L195
 3727              	.L194:
1714:lex.yy.c      **** 		yypop_buffer_state();
1715:lex.yy.c      **** 	}
1716:lex.yy.c      **** 
1717:lex.yy.c      **** 	/* Destroy the stack itself. */
 3728              		.loc 1 1717 2 is_stmt 1
 3729 1de6 488B0548 		movq	yy_buffer_stack(%rip), %rax
 3729      000000
 3730 1ded 4889C1   		movq	%rax, %rcx
 3731 1df0 E85F0000 		call	yyfree
 3731      00
1718:lex.yy.c      **** 	yyfree((yy_buffer_stack) );
 3732              		.loc 1 1718 20
 3733 1df5 48C70544 		movq	$0, yy_buffer_stack(%rip)
 3733      00000000 
 3733      000000
1719:lex.yy.c      **** 	(yy_buffer_stack) = NULL;
1720:lex.yy.c      **** 
1721:lex.yy.c      ****     /* Reset the globals. This is important in a non-reentrant scanner so the next time
1722:lex.yy.c      ****      * yylex() is called, initialization will occur. */
 3734              		.loc 1 1722 5
 3735 1e00 E8F9FEFF 		call	yy_init_globals
 3735      FF
1723:lex.yy.c      ****     yy_init_globals( );
1724:lex.yy.c      **** 
 3736              		.loc 1 1724 12
 3737 1e05 B8000000 		movl	$0, %eax
 3737      00
1725:lex.yy.c      ****     return 0;
 3738              		.loc 1 1725 1
 3739 1e0a 4883C420 		addq	$32, %rsp
 3740 1e0e 5D       		popq	%rbp
 3741              		.cfi_restore 6
 3742              		.cfi_def_cfa 7, 8
 3743 1e0f C3       		ret
 3744              		.cfi_endproc
 3745              	.LFE48:
 3746              		.seh_endproc
 3747              		.globl	yyalloc
 3749              		.seh_proc	yyalloc
 3750              	yyalloc:
 3751              	.LFB49:
1726:lex.yy.c      **** }
1727:lex.yy.c      **** 
1728:lex.yy.c      **** /*
1729:lex.yy.c      ****  * Internal utility routines.
1730:lex.yy.c      ****  */
1731:lex.yy.c      **** 
1732:lex.yy.c      **** #ifndef yytext_ptr
1733:lex.yy.c      **** static void yy_flex_strncpy (char* s1, const char * s2, int n )
1734:lex.yy.c      **** {
1735:lex.yy.c      **** 		
1736:lex.yy.c      **** 	int i;
1737:lex.yy.c      **** 	for ( i = 0; i < n; ++i )
1738:lex.yy.c      **** 		s1[i] = s2[i];
1739:lex.yy.c      **** }
1740:lex.yy.c      **** #endif
1741:lex.yy.c      **** 
1742:lex.yy.c      **** #ifdef YY_NEED_STRLEN
1743:lex.yy.c      **** static int yy_flex_strlen (const char * s )
1744:lex.yy.c      **** {
1745:lex.yy.c      **** 	int n;
1746:lex.yy.c      **** 	for ( n = 0; s[n]; ++n )
1747:lex.yy.c      **** 		;
1748:lex.yy.c      **** 
1749:lex.yy.c      **** 	return n;
1750:lex.yy.c      **** }
1751:lex.yy.c      **** #endif
1752:lex.yy.c      **** 
1753:lex.yy.c      **** void *yyalloc (yy_size_t  size )
 3752              		.loc 1 1753 1
 3753              		.cfi_startproc
 3754 1e10 55       		pushq	%rbp
 3755              		.seh_pushreg	%rbp
 3756              		.cfi_def_cfa_offset 16
 3757              		.cfi_offset 6, -16
 3758 1e11 4889E5   		movq	%rsp, %rbp
 3759              		.seh_setframe	%rbp, 0
 3760              		.cfi_def_cfa_register 6
 3761 1e14 4883EC20 		subq	$32, %rsp
 3762              		.seh_stackalloc	32
 3763              		.seh_endprologue
 3764 1e18 48894D10 		movq	%rcx, 16(%rbp)
1754:lex.yy.c      **** {
 3765              		.loc 1 1754 11
 3766 1e1c 488B4510 		movq	16(%rbp), %rax
 3767 1e20 4889C1   		movq	%rax, %rcx
 3768 1e23 E8000000 		call	malloc
 3768      00
1755:lex.yy.c      **** 			return malloc(size);
 3769              		.loc 1 1755 1
 3770 1e28 4883C420 		addq	$32, %rsp
 3771 1e2c 5D       		popq	%rbp
 3772              		.cfi_restore 6
 3773              		.cfi_def_cfa 7, 8
 3774 1e2d C3       		ret
 3775              		.cfi_endproc
 3776              	.LFE49:
 3777              		.seh_endproc
 3778              		.globl	yyrealloc
 3780              		.seh_proc	yyrealloc
 3781              	yyrealloc:
 3782              	.LFB50:
1756:lex.yy.c      **** }
1757:lex.yy.c      **** 
1758:lex.yy.c      **** void *yyrealloc  (void * ptr, yy_size_t  size )
 3783              		.loc 1 1758 1
 3784              		.cfi_startproc
 3785 1e2e 55       		pushq	%rbp
 3786              		.seh_pushreg	%rbp
 3787              		.cfi_def_cfa_offset 16
 3788              		.cfi_offset 6, -16
 3789 1e2f 4889E5   		movq	%rsp, %rbp
 3790              		.seh_setframe	%rbp, 0
 3791              		.cfi_def_cfa_register 6
 3792 1e32 4883EC20 		subq	$32, %rsp
 3793              		.seh_stackalloc	32
 3794              		.seh_endprologue
 3795 1e36 48894D10 		movq	%rcx, 16(%rbp)
 3796 1e3a 48895518 		movq	%rdx, 24(%rbp)
1759:lex.yy.c      **** {
1760:lex.yy.c      **** 		
1761:lex.yy.c      **** 	/* The cast to (char *) in the following accommodates both
1762:lex.yy.c      **** 	 * implementations that use char* generic pointers, and those
1763:lex.yy.c      **** 	 * that use void* generic pointers.  It works with the latter
1764:lex.yy.c      **** 	 * because both ANSI C and C++ allow castless assignment from
1765:lex.yy.c      **** 	 * any pointer type to void*, and deal with argument conversions
1766:lex.yy.c      **** 	 * as though doing an assignment.
1767:lex.yy.c      **** 	 */
 3797              		.loc 1 1767 9
 3798 1e3e 488B5518 		movq	24(%rbp), %rdx
 3799 1e42 488B4510 		movq	16(%rbp), %rax
 3800 1e46 4889C1   		movq	%rax, %rcx
 3801 1e49 E8000000 		call	realloc
 3801      00
1768:lex.yy.c      **** 	return realloc(ptr, size);
 3802              		.loc 1 1768 1
 3803 1e4e 4883C420 		addq	$32, %rsp
 3804 1e52 5D       		popq	%rbp
 3805              		.cfi_restore 6
 3806              		.cfi_def_cfa 7, 8
 3807 1e53 C3       		ret
 3808              		.cfi_endproc
 3809              	.LFE50:
 3810              		.seh_endproc
 3811              		.globl	yyfree
 3813              		.seh_proc	yyfree
 3814              	yyfree:
 3815              	.LFB51:
1769:lex.yy.c      **** }
1770:lex.yy.c      **** 
1771:lex.yy.c      **** void yyfree (void * ptr )
 3816              		.loc 1 1771 1
 3817              		.cfi_startproc
 3818 1e54 55       		pushq	%rbp
 3819              		.seh_pushreg	%rbp
 3820              		.cfi_def_cfa_offset 16
 3821              		.cfi_offset 6, -16
 3822 1e55 4889E5   		movq	%rsp, %rbp
 3823              		.seh_setframe	%rbp, 0
 3824              		.cfi_def_cfa_register 6
 3825 1e58 4883EC20 		subq	$32, %rsp
 3826              		.seh_stackalloc	32
 3827              		.seh_endprologue
 3828 1e5c 48894D10 		movq	%rcx, 16(%rbp)
1772:lex.yy.c      **** {
 3829              		.loc 1 1772 4
 3830 1e60 488B4510 		movq	16(%rbp), %rax
 3831 1e64 4889C1   		movq	%rax, %rcx
 3832 1e67 E8000000 		call	free
 3832      00
1773:lex.yy.c      **** 			free( (char *) ptr );	/* see yyrealloc() for (char *) cast */
 3833              		.loc 1 1773 1
 3834 1e6c 90       		nop
 3835 1e6d 4883C420 		addq	$32, %rsp
 3836 1e71 5D       		popq	%rbp
 3837              		.cfi_restore 6
 3838              		.cfi_def_cfa 7, 8
 3839 1e72 C3       		ret
 3840              		.cfi_endproc
 3841              	.LFE51:
 3842              		.seh_endproc
 3843              		.globl	yywrap
 3845              		.seh_proc	yywrap
 3846              	yywrap:
 3847              	.LFB52:
  21:custom_op.l   **** int yywrap() {
 3848              		.loc 2 21 14
 3849              		.cfi_startproc
 3850 1e73 55       		pushq	%rbp
 3851              		.seh_pushreg	%rbp
 3852              		.cfi_def_cfa_offset 16
 3853              		.cfi_offset 6, -16
 3854 1e74 4889E5   		movq	%rsp, %rbp
 3855              		.seh_setframe	%rbp, 0
 3856              		.cfi_def_cfa_register 6
 3857              		.seh_endprologue
  22:custom_op.l   ****     return 1;
 3858              		.loc 2 22 12
 3859 1e77 B8010000 		movl	$1, %eax
 3859      00
  23:custom_op.l   **** }
 3860              		.loc 2 23 1
 3861 1e7c 5D       		popq	%rbp
 3862              		.cfi_restore 6
 3863              		.cfi_def_cfa 7, 8
 3864 1e7d C3       		ret
 3865              		.cfi_endproc
 3866              	.LFE52:
 3867              		.seh_endproc
 3868              	.Letext0:
 3869              		.file 3 "C:/msys64/mingw64/include/stdio.h"
 3870              		.file 4 "C:/msys64/mingw64/include/corecrt.h"
 3871              		.file 5 "C:/msys64/mingw64/include/stdint.h"
 3872              		.file 6 "custom_op.h"
 3873              		.file 7 "C:/msys64/mingw64/include/stdlib.h"
 3874              		.file 8 "C:/msys64/mingw64/include/string.h"
 3875              		.file 9 "C:/msys64/mingw64/include/io.h"
 3876              		.file 10 "C:/msys64/mingw64/include/errno.h"
 3877 1e7e 9090     		.section	.debug_info,"dr"
 3878              	.Ldebug_info0:
 3879 0000 35150000 		.long	0x1535
 3880 0004 0500     		.word	0x5
 3881 0006 01       		.byte	0x1
 3882 0007 08       		.byte	0x8
 3883 0008 00000000 		.secrel32	.Ldebug_abbrev0
 3884 000c 25       		.uleb128 0x25
 3885 000d 474E5520 		.ascii "GNU C17 14.2.0 -mtune=generic -march=nocona -g\0"
 3885      43313720 
 3885      31342E32 
 3885      2E30202D 
 3885      6D74756E 
 3886 003c 1D       		.byte	0x1d
 3887 003d 00000000 		.secrel32	.LASF0
 3888 0041 09000000 		.secrel32	.LASF1
 3889 0045 00000000 		.quad	.Ltext0
 3889      00000000 
 3890 004d 7E1E0000 		.quad	.Letext0-.Ltext0
 3890      00000000 
 3891 0055 00000000 		.secrel32	.Ldebug_line0
 3892 0059 05       		.uleb128 0x5
 3893 005a 01       		.byte	0x1
 3894 005b 06       		.byte	0x6
 3895 005c 63686172 		.ascii "char\0"
 3895      00
 3896 0061 07       		.uleb128 0x7
 3897 0062 59000000 		.long	0x59
 3898 0066 08       		.uleb128 0x8
 3899 0067 73697A65 		.ascii "size_t\0"
 3899      5F7400
 3900 006e 04       		.byte	0x4
 3901 006f 23       		.byte	0x23
 3902 0070 2C       		.byte	0x2c
 3903 0071 75000000 		.long	0x75
 3904 0075 05       		.uleb128 0x5
 3905 0076 08       		.byte	0x8
 3906 0077 07       		.byte	0x7
 3907 0078 6C6F6E67 		.ascii "long long unsigned int\0"
 3907      206C6F6E 
 3907      6720756E 
 3907      7369676E 
 3907      65642069 
 3908 008f 05       		.uleb128 0x5
 3909 0090 08       		.byte	0x8
 3910 0091 05       		.byte	0x5
 3911 0092 6C6F6E67 		.ascii "long long int\0"
 3911      206C6F6E 
 3911      6720696E 
 3911      7400
 3912 00a0 05       		.uleb128 0x5
 3913 00a1 02       		.byte	0x2
 3914 00a2 07       		.byte	0x7
 3915 00a3 73686F72 		.ascii "short unsigned int\0"
 3915      7420756E 
 3915      7369676E 
 3915      65642069 
 3915      6E7400
 3916 00b6 05       		.uleb128 0x5
 3917 00b7 04       		.byte	0x4
 3918 00b8 05       		.byte	0x5
 3919 00b9 696E7400 		.ascii "int\0"
 3920 00bd 05       		.uleb128 0x5
 3921 00be 04       		.byte	0x4
 3922 00bf 05       		.byte	0x5
 3923 00c0 6C6F6E67 		.ascii "long int\0"
 3923      20696E74 
 3923      00
 3924 00c9 0B       		.uleb128 0xb
 3925 00ca 59000000 		.long	0x59
 3926 00ce 0B       		.uleb128 0xb
 3927 00cf B6000000 		.long	0xb6
 3928 00d3 05       		.uleb128 0x5
 3929 00d4 04       		.byte	0x4
 3930 00d5 07       		.byte	0x7
 3931 00d6 756E7369 		.ascii "unsigned int\0"
 3931      676E6564 
 3931      20696E74 
 3931      00
 3932 00e3 05       		.uleb128 0x5
 3933 00e4 04       		.byte	0x4
 3934 00e5 07       		.byte	0x7
 3935 00e6 6C6F6E67 		.ascii "long unsigned int\0"
 3935      20756E73 
 3935      69676E65 
 3935      6420696E 
 3935      7400
 3936 00f8 05       		.uleb128 0x5
 3937 00f9 01       		.byte	0x1
 3938 00fa 08       		.byte	0x8
 3939 00fb 756E7369 		.ascii "unsigned char\0"
 3939      676E6564 
 3939      20636861 
 3939      7200
 3940 0109 1E       		.uleb128 0x1e
 3941 010a 5F696F62 		.ascii "_iobuf\0"
 3941      756600
 3942 0111 30       		.byte	0x30
 3943 0112 03       		.byte	0x3
 3944 0113 21       		.byte	0x21
 3945 0114 0A       		.byte	0xa
 3946 0115 99010000 		.long	0x199
 3947 0119 04       		.uleb128 0x4
 3948 011a 5F707472 		.ascii "_ptr\0"
 3948      00
 3949 011f 03       		.byte	0x3
 3950 0120 25       		.byte	0x25
 3951 0121 0B       		.byte	0xb
 3952 0122 C9000000 		.long	0xc9
 3953 0126 00       		.byte	0
 3954 0127 04       		.uleb128 0x4
 3955 0128 5F636E74 		.ascii "_cnt\0"
 3955      00
 3956 012d 03       		.byte	0x3
 3957 012e 26       		.byte	0x26
 3958 012f 09       		.byte	0x9
 3959 0130 B6000000 		.long	0xb6
 3960 0134 08       		.byte	0x8
 3961 0135 04       		.uleb128 0x4
 3962 0136 5F626173 		.ascii "_base\0"
 3962      6500
 3963 013c 03       		.byte	0x3
 3964 013d 27       		.byte	0x27
 3965 013e 0B       		.byte	0xb
 3966 013f C9000000 		.long	0xc9
 3967 0143 10       		.byte	0x10
 3968 0144 04       		.uleb128 0x4
 3969 0145 5F666C61 		.ascii "_flag\0"
 3969      6700
 3970 014b 03       		.byte	0x3
 3971 014c 28       		.byte	0x28
 3972 014d 09       		.byte	0x9
 3973 014e B6000000 		.long	0xb6
 3974 0152 18       		.byte	0x18
 3975 0153 04       		.uleb128 0x4
 3976 0154 5F66696C 		.ascii "_file\0"
 3976      6500
 3977 015a 03       		.byte	0x3
 3978 015b 29       		.byte	0x29
 3979 015c 09       		.byte	0x9
 3980 015d B6000000 		.long	0xb6
 3981 0161 1C       		.byte	0x1c
 3982 0162 04       		.uleb128 0x4
 3983 0163 5F636861 		.ascii "_charbuf\0"
 3983      72627566 
 3983      00
 3984 016c 03       		.byte	0x3
 3985 016d 2A       		.byte	0x2a
 3986 016e 09       		.byte	0x9
 3987 016f B6000000 		.long	0xb6
 3988 0173 20       		.byte	0x20
 3989 0174 04       		.uleb128 0x4
 3990 0175 5F627566 		.ascii "_bufsiz\0"
 3990      73697A00 
 3991 017d 03       		.byte	0x3
 3992 017e 2B       		.byte	0x2b
 3993 017f 09       		.byte	0x9
 3994 0180 B6000000 		.long	0xb6
 3995 0184 24       		.byte	0x24
 3996 0185 04       		.uleb128 0x4
 3997 0186 5F746D70 		.ascii "_tmpfname\0"
 3997      666E616D 
 3997      6500
 3998 0190 03       		.byte	0x3
 3999 0191 2C       		.byte	0x2c
 4000 0192 0B       		.byte	0xb
 4001 0193 C9000000 		.long	0xc9
 4002 0197 28       		.byte	0x28
 4003 0198 00       		.byte	0
 4004 0199 08       		.uleb128 0x8
 4005 019a 46494C45 		.ascii "FILE\0"
 4005      00
 4006 019f 03       		.byte	0x3
 4007 01a0 2F       		.byte	0x2f
 4008 01a1 19       		.byte	0x19
 4009 01a2 09010000 		.long	0x109
 4010 01a6 05       		.uleb128 0x5
 4011 01a7 08       		.byte	0x8
 4012 01a8 04       		.byte	0x4
 4013 01a9 646F7562 		.ascii "double\0"
 4013      6C6500
 4014 01b0 05       		.uleb128 0x5
 4015 01b1 04       		.byte	0x4
 4016 01b2 04       		.byte	0x4
 4017 01b3 666C6F61 		.ascii "float\0"
 4017      7400
 4018 01b9 05       		.uleb128 0x5
 4019 01ba 10       		.byte	0x10
 4020 01bb 04       		.byte	0x4
 4021 01bc 6C6F6E67 		.ascii "long double\0"
 4021      20646F75 
 4021      626C6500 
 4022 01c8 05       		.uleb128 0x5
 4023 01c9 01       		.byte	0x1
 4024 01ca 06       		.byte	0x6
 4025 01cb 7369676E 		.ascii "signed char\0"
 4025      65642063 
 4025      68617200 
 4026 01d7 08       		.uleb128 0x8
 4027 01d8 75696E74 		.ascii "uint8_t\0"
 4027      385F7400 
 4028 01e0 05       		.byte	0x5
 4029 01e1 24       		.byte	0x24
 4030 01e2 19       		.byte	0x19
 4031 01e3 F8000000 		.long	0xf8
 4032 01e7 08       		.uleb128 0x8
 4033 01e8 696E7431 		.ascii "int16_t\0"
 4033      365F7400 
 4034 01f0 05       		.byte	0x5
 4035 01f1 25       		.byte	0x25
 4036 01f2 10       		.byte	0x10
 4037 01f3 F7010000 		.long	0x1f7
 4038 01f7 05       		.uleb128 0x5
 4039 01f8 02       		.byte	0x2
 4040 01f9 05       		.byte	0x5
 4041 01fa 73686F72 		.ascii "short int\0"
 4041      7420696E 
 4041      7400
 4042 0204 08       		.uleb128 0x8
 4043 0205 666C6578 		.ascii "flex_uint8_t\0"
 4043      5F75696E 
 4043      74385F74 
 4043      00
 4044 0212 01       		.byte	0x1
 4045 0213 2C       		.byte	0x2c
 4046 0214 11       		.byte	0x11
 4047 0215 D7010000 		.long	0x1d7
 4048 0219 08       		.uleb128 0x8
 4049 021a 666C6578 		.ascii "flex_int16_t\0"
 4049      5F696E74 
 4049      31365F74 
 4049      00
 4050 0227 01       		.byte	0x1
 4051 0228 2D       		.byte	0x2d
 4052 0229 11       		.byte	0x11
 4053 022a E7010000 		.long	0x1e7
 4054 022e 07       		.uleb128 0x7
 4055 022f 19020000 		.long	0x219
 4056 0233 08       		.uleb128 0x8
 4057 0234 59595F42 		.ascii "YY_BUFFER_STATE\0"
 4057      55464645 
 4057      525F5354 
 4057      41544500 
 4058 0244 01       		.byte	0x1
 4059 0245 95       		.byte	0x95
 4060 0246 21       		.byte	0x21
 4061 0247 4B020000 		.long	0x24b
 4062 024b 0B       		.uleb128 0xb
 4063 024c 50020000 		.long	0x250
 4064 0250 1E       		.uleb128 0x1e
 4065 0251 79795F62 		.ascii "yy_buffer_state\0"
 4065      75666665 
 4065      725F7374 
 4065      61746500 
 4066 0261 40       		.byte	0x40
 4067 0262 01       		.byte	0x1
 4068 0263 B9       		.byte	0xb9
 4069 0264 08       		.byte	0x8
 4070 0265 70030000 		.long	0x370
 4071 0269 04       		.uleb128 0x4
 4072 026a 79795F69 		.ascii "yy_input_file\0"
 4072      6E707574 
 4072      5F66696C 
 4072      6500
 4073 0278 01       		.byte	0x1
 4074 0279 BB       		.byte	0xbb
 4075 027a 08       		.byte	0x8
 4076 027b 9E030000 		.long	0x39e
 4077 027f 00       		.byte	0
 4078 0280 04       		.uleb128 0x4
 4079 0281 79795F63 		.ascii "yy_ch_buf\0"
 4079      685F6275 
 4079      6600
 4080 028b 01       		.byte	0x1
 4081 028c BD       		.byte	0xbd
 4082 028d 08       		.byte	0x8
 4083 028e C9000000 		.long	0xc9
 4084 0292 08       		.byte	0x8
 4085 0293 04       		.uleb128 0x4
 4086 0294 79795F62 		.ascii "yy_buf_pos\0"
 4086      75665F70 
 4086      6F7300
 4087 029f 01       		.byte	0x1
 4088 02a0 BE       		.byte	0xbe
 4089 02a1 08       		.byte	0x8
 4090 02a2 C9000000 		.long	0xc9
 4091 02a6 10       		.byte	0x10
 4092 02a7 04       		.uleb128 0x4
 4093 02a8 79795F62 		.ascii "yy_buf_size\0"
 4093      75665F73 
 4093      697A6500 
 4094 02b4 01       		.byte	0x1
 4095 02b5 C3       		.byte	0xc3
 4096 02b6 06       		.byte	0x6
 4097 02b7 B6000000 		.long	0xb6
 4098 02bb 18       		.byte	0x18
 4099 02bc 26       		.uleb128 0x26
 4100 02bd 11000000 		.secrel32	.LASF2
 4101 02c1 01       		.byte	0x1
 4102 02c2 C8       		.byte	0xc8
 4103 02c3 06       		.byte	0x6
 4104 02c4 B6000000 		.long	0xb6
 4105 02c8 1C       		.byte	0x1c
 4106 02c9 04       		.uleb128 0x4
 4107 02ca 79795F69 		.ascii "yy_is_our_buffer\0"
 4107      735F6F75 
 4107      725F6275 
 4107      66666572 
 4107      00
 4108 02db 01       		.byte	0x1
 4109 02dc CE       		.byte	0xce
 4110 02dd 06       		.byte	0x6
 4111 02de B6000000 		.long	0xb6
 4112 02e2 20       		.byte	0x20
 4113 02e3 04       		.uleb128 0x4
 4114 02e4 79795F69 		.ascii "yy_is_interactive\0"
 4114      735F696E 
 4114      74657261 
 4114      63746976 
 4114      6500
 4115 02f6 01       		.byte	0x1
 4116 02f7 D5       		.byte	0xd5
 4117 02f8 06       		.byte	0x6
 4118 02f9 B6000000 		.long	0xb6
 4119 02fd 24       		.byte	0x24
 4120 02fe 04       		.uleb128 0x4
 4121 02ff 79795F61 		.ascii "yy_at_bol\0"
 4121      745F626F 
 4121      6C00
 4122 0309 01       		.byte	0x1
 4123 030a DB       		.byte	0xdb
 4124 030b 06       		.byte	0x6
 4125 030c B6000000 		.long	0xb6
 4126 0310 28       		.byte	0x28
 4127 0311 04       		.uleb128 0x4
 4128 0312 79795F62 		.ascii "yy_bs_lineno\0"
 4128      735F6C69 
 4128      6E656E6F 
 4128      00
 4129 031f 01       		.byte	0x1
 4130 0320 DD       		.byte	0xdd
 4131 0321 09       		.byte	0x9
 4132 0322 B6000000 		.long	0xb6
 4133 0326 2C       		.byte	0x2c
 4134 0327 04       		.uleb128 0x4
 4135 0328 79795F62 		.ascii "yy_bs_column\0"
 4135      735F636F 
 4135      6C756D6E 
 4135      00
 4136 0335 01       		.byte	0x1
 4137 0336 DE       		.byte	0xde
 4138 0337 09       		.byte	0x9
 4139 0338 B6000000 		.long	0xb6
 4140 033c 30       		.byte	0x30
 4141 033d 04       		.uleb128 0x4
 4142 033e 79795F66 		.ascii "yy_fill_buffer\0"
 4142      696C6C5F 
 4142      62756666 
 4142      657200
 4143 034d 01       		.byte	0x1
 4144 034e E3       		.byte	0xe3
 4145 034f 06       		.byte	0x6
 4146 0350 B6000000 		.long	0xb6
 4147 0354 34       		.byte	0x34
 4148 0355 04       		.uleb128 0x4
 4149 0356 79795F62 		.ascii "yy_buffer_status\0"
 4149      75666665 
 4149      725F7374 
 4149      61747573 
 4149      00
 4150 0367 01       		.byte	0x1
 4151 0368 E5       		.byte	0xe5
 4152 0369 06       		.byte	0x6
 4153 036a B6000000 		.long	0xb6
 4154 036e 38       		.byte	0x38
 4155 036f 00       		.byte	0
 4156 0370 08       		.uleb128 0x8
 4157 0371 79795F73 		.ascii "yy_size_t\0"
 4157      697A655F 
 4157      7400
 4158 037b 01       		.byte	0x1
 4159 037c 9A       		.byte	0x9a
 4160 037d 10       		.byte	0x10
 4161 037e 66000000 		.long	0x66
 4162 0382 10       		.uleb128 0x10
 4163 0383 79796C65 		.ascii "yyleng\0"
 4163      6E6700
 4164 038a 01       		.byte	0x1
 4165 038b 9D       		.byte	0x9d
 4166 038c 0C       		.byte	0xc
 4167 038d B6000000 		.long	0xb6
 4168 0391 10       		.uleb128 0x10
 4169 0392 7979696E 		.ascii "yyin\0"
 4169      00
 4170 0397 01       		.byte	0x1
 4171 0398 9F       		.byte	0x9f
 4172 0399 0E       		.byte	0xe
 4173 039a 9E030000 		.long	0x39e
 4174 039e 0B       		.uleb128 0xb
 4175 039f 99010000 		.long	0x199
 4176 03a3 1F       		.uleb128 0x1f
 4177 03a4 9E030000 		.long	0x39e
 4178 03a8 10       		.uleb128 0x10
 4179 03a9 79796F75 		.ascii "yyout\0"
 4179      7400
 4180 03af 01       		.byte	0x1
 4181 03b0 9F       		.byte	0x9f
 4182 03b1 15       		.byte	0x15
 4183 03b2 9E030000 		.long	0x39e
 4184 03b6 16       		.uleb128 0x16
 4185 03b7 79795F62 		.ascii "yy_buffer_stack_top\0"
 4185      75666665 
 4185      725F7374 
 4185      61636B5F 
 4185      746F7000 
 4186 03cb F9       		.byte	0xf9
 4187 03cc 0F       		.byte	0xf
 4188 03cd 66000000 		.long	0x66
 4189 03d1 09       		.uleb128 0x9
 4190 03d2 03       		.byte	0x3
 4191 03d3 38000000 		.quad	yy_buffer_stack_top
 4191      00000000 
 4192 03db 16       		.uleb128 0x16
 4193 03dc 79795F62 		.ascii "yy_buffer_stack_max\0"
 4193      75666665 
 4193      725F7374 
 4193      61636B5F 
 4193      6D617800 
 4194 03f0 FA       		.byte	0xfa
 4195 03f1 0F       		.byte	0xf
 4196 03f2 66000000 		.long	0x66
 4197 03f6 09       		.uleb128 0x9
 4198 03f7 03       		.byte	0x3
 4199 03f8 40000000 		.quad	yy_buffer_stack_max
 4199      00000000 
 4200 0400 16       		.uleb128 0x16
 4201 0401 79795F62 		.ascii "yy_buffer_stack\0"
 4201      75666665 
 4201      725F7374 
 4201      61636B00 
 4202 0411 FB       		.byte	0xfb
 4203 0412 1A       		.byte	0x1a
 4204 0413 21040000 		.long	0x421
 4205 0417 09       		.uleb128 0x9
 4206 0418 03       		.byte	0x3
 4207 0419 48000000 		.quad	yy_buffer_stack
 4207      00000000 
 4208 0421 0B       		.uleb128 0xb
 4209 0422 33020000 		.long	0x233
 4210 0426 01       		.uleb128 0x1
 4211 0427 79795F68 		.ascii "yy_hold_char\0"
 4211      6F6C645F 
 4211      63686172 
 4211      00
 4212 0434 0C01     		.word	0x10c
 4213 0436 0D       		.byte	0xd
 4214 0437 59000000 		.long	0x59
 4215 043b 09       		.uleb128 0x9
 4216 043c 03       		.byte	0x3
 4217 043d 50000000 		.quad	yy_hold_char
 4217      00000000 
 4218 0445 06       		.uleb128 0x6
 4219 0446 11000000 		.secrel32	.LASF2
 4220 044a 0D01     		.word	0x10d
 4221 044c 0C       		.byte	0xc
 4222 044d B6000000 		.long	0xb6
 4223 0451 09       		.uleb128 0x9
 4224 0452 03       		.byte	0x3
 4225 0453 54000000 		.quad	yy_n_chars
 4225      00000000 
 4226 045b 11       		.uleb128 0x11
 4227 045c 82030000 		.long	0x382
 4228 0460 0E01     		.word	0x10e
 4229 0462 05       		.byte	0x5
 4230 0463 09       		.uleb128 0x9
 4231 0464 03       		.byte	0x3
 4232 0465 00000000 		.quad	yyleng
 4232      00000000 
 4233 046d 01       		.uleb128 0x1
 4234 046e 79795F63 		.ascii "yy_c_buf_p\0"
 4234      5F627566 
 4234      5F7000
 4235 0479 1101     		.word	0x111
 4236 047b 0E       		.byte	0xe
 4237 047c C9000000 		.long	0xc9
 4238 0480 09       		.uleb128 0x9
 4239 0481 03       		.byte	0x3
 4240 0482 58000000 		.quad	yy_c_buf_p
 4240      00000000 
 4241 048a 01       		.uleb128 0x1
 4242 048b 79795F69 		.ascii "yy_init\0"
 4242      6E697400 
 4243 0493 1201     		.word	0x112
 4244 0495 0C       		.byte	0xc
 4245 0496 B6000000 		.long	0xb6
 4246 049a 09       		.uleb128 0x9
 4247 049b 03       		.byte	0x3
 4248 049c 60000000 		.quad	yy_init
 4248      00000000 
 4249 04a4 01       		.uleb128 0x1
 4250 04a5 79795F73 		.ascii "yy_start\0"
 4250      74617274 
 4250      00
 4251 04ae 1301     		.word	0x113
 4252 04b0 0C       		.byte	0xc
 4253 04b1 B6000000 		.long	0xb6
 4254 04b5 09       		.uleb128 0x9
 4255 04b6 03       		.byte	0x3
 4256 04b7 64000000 		.quad	yy_start
 4256      00000000 
 4257 04bf 01       		.uleb128 0x1
 4258 04c0 79795F64 		.ascii "yy_did_buffer_switch_on_eof\0"
 4258      69645F62 
 4258      75666665 
 4258      725F7377 
 4258      69746368 
 4259 04dc 1801     		.word	0x118
 4260 04de 0C       		.byte	0xc
 4261 04df B6000000 		.long	0xb6
 4262 04e3 09       		.uleb128 0x9
 4263 04e4 03       		.byte	0x3
 4264 04e5 68000000 		.quad	yy_did_buffer_switch_on_eof
 4264      00000000 
 4265 04ed 20       		.uleb128 0x20
 4266 04ee 59595F43 		.ascii "YY_CHAR\0"
 4266      48415200 
 4267 04f6 4501     		.word	0x145
 4268 04f8 16       		.byte	0x16
 4269 04f9 04020000 		.long	0x204
 4270 04fd 07       		.uleb128 0x7
 4271 04fe ED040000 		.long	0x4ed
 4272 0502 11       		.uleb128 0x11
 4273 0503 91030000 		.long	0x391
 4274 0507 4701     		.word	0x147
 4275 0509 07       		.byte	0x7
 4276 050a 09       		.uleb128 0x9
 4277 050b 03       		.byte	0x3
 4278 050c 08000000 		.quad	yyin
 4278      00000000 
 4279 0514 27       		.uleb128 0x27
 4280 0515 A8030000 		.long	0x3a8
 4281 0519 4701     		.word	0x147
 4282 051b 09       		.uleb128 0x9
 4283 051c 03       		.byte	0x3
 4284 051d 10000000 		.quad	yyout
 4284      00000000 
 4285 0525 20       		.uleb128 0x20
 4286 0526 79795F73 		.ascii "yy_state_type\0"
 4286      74617465 
 4286      5F747970 
 4286      6500
 4287 0534 4901     		.word	0x149
 4288 0536 0D       		.byte	0xd
 4289 0537 B6000000 		.long	0xb6
 4290 053b 17       		.uleb128 0x17
 4291 053c 79796C69 		.ascii "yylineno\0"
 4291      6E656E6F 
 4291      00
 4292 0545 4B01     		.word	0x14b
 4293 0547 0C       		.byte	0xc
 4294 0548 B6000000 		.long	0xb6
 4295 054c 11       		.uleb128 0x11
 4296 054d 3B050000 		.long	0x53b
 4297 0551 4C01     		.word	0x14c
 4298 0553 05       		.byte	0x5
 4299 0554 09       		.uleb128 0x9
 4300 0555 03       		.byte	0x3
 4301 0556 00000000 		.quad	yylineno
 4301      00000000 
 4302 055e 17       		.uleb128 0x17
 4303 055f 79797465 		.ascii "yytext\0"
 4303      787400
 4304 0566 4E01     		.word	0x14e
 4305 0568 0E       		.byte	0xe
 4306 0569 C9000000 		.long	0xc9
 4307 056d 12       		.uleb128 0x12
 4308 056e 2E020000 		.long	0x22e
 4309 0572 7D050000 		.long	0x57d
 4310 0576 13       		.uleb128 0x13
 4311 0577 75000000 		.long	0x75
 4312 057b 1B       		.byte	0x1b
 4313 057c 00       		.byte	0
 4314 057d 07       		.uleb128 0x7
 4315 057e 6D050000 		.long	0x56d
 4316 0582 01       		.uleb128 0x1
 4317 0583 79795F61 		.ascii "yy_accept\0"
 4317      63636570 
 4317      7400
 4318 058d 6B01     		.word	0x16b
 4319 058f 1B       		.byte	0x1b
 4320 0590 7D050000 		.long	0x57d
 4321 0594 09       		.uleb128 0x9
 4322 0595 03       		.byte	0x3
 4323 0596 00000000 		.quad	yy_accept
 4323      00000000 
 4324 059e 12       		.uleb128 0x12
 4325 059f FD040000 		.long	0x4fd
 4326 05a3 AE050000 		.long	0x5ae
 4327 05a7 13       		.uleb128 0x13
 4328 05a8 75000000 		.long	0x75
 4329 05ac FF       		.byte	0xff
 4330 05ad 00       		.byte	0
 4331 05ae 07       		.uleb128 0x7
 4332 05af 9E050000 		.long	0x59e
 4333 05b3 01       		.uleb128 0x1
 4334 05b4 79795F65 		.ascii "yy_ec\0"
 4334      6300
 4335 05ba 7201     		.word	0x172
 4336 05bc 16       		.byte	0x16
 4337 05bd AE050000 		.long	0x5ae
 4338 05c1 09       		.uleb128 0x9
 4339 05c2 03       		.byte	0x3
 4340 05c3 40000000 		.quad	yy_ec
 4340      00000000 
 4341 05cb 12       		.uleb128 0x12
 4342 05cc FD040000 		.long	0x4fd
 4343 05d0 DB050000 		.long	0x5db
 4344 05d4 13       		.uleb128 0x13
 4345 05d5 75000000 		.long	0x75
 4346 05d9 13       		.byte	0x13
 4347 05da 00       		.byte	0
 4348 05db 07       		.uleb128 0x7
 4349 05dc CB050000 		.long	0x5cb
 4350 05e0 01       		.uleb128 0x1
 4351 05e1 79795F6D 		.ascii "yy_meta\0"
 4351      65746100 
 4352 05e9 9201     		.word	0x192
 4353 05eb 16       		.byte	0x16
 4354 05ec DB050000 		.long	0x5db
 4355 05f0 09       		.uleb128 0x9
 4356 05f1 03       		.byte	0x3
 4357 05f2 40010000 		.quad	yy_meta
 4357      00000000 
 4358 05fa 12       		.uleb128 0x12
 4359 05fb 2E020000 		.long	0x22e
 4360 05ff 0A060000 		.long	0x60a
 4361 0603 13       		.uleb128 0x13
 4362 0604 75000000 		.long	0x75
 4363 0608 1C       		.byte	0x1c
 4364 0609 00       		.byte	0
 4365 060a 07       		.uleb128 0x7
 4366 060b FA050000 		.long	0x5fa
 4367 060f 01       		.uleb128 0x1
 4368 0610 79795F62 		.ascii "yy_base\0"
 4368      61736500 
 4369 0618 9801     		.word	0x198
 4370 061a 1B       		.byte	0x1b
 4371 061b 0A060000 		.long	0x60a
 4372 061f 09       		.uleb128 0x9
 4373 0620 03       		.byte	0x3
 4374 0621 60010000 		.quad	yy_base
 4374      00000000 
 4375 0629 01       		.uleb128 0x1
 4376 062a 79795F64 		.ascii "yy_def\0"
 4376      656600
 4377 0631 9F01     		.word	0x19f
 4378 0633 1B       		.byte	0x1b
 4379 0634 0A060000 		.long	0x60a
 4380 0638 09       		.uleb128 0x9
 4381 0639 03       		.byte	0x3
 4382 063a A0010000 		.quad	yy_def
 4382      00000000 
 4383 0642 12       		.uleb128 0x12
 4384 0643 2E020000 		.long	0x22e
 4385 0647 52060000 		.long	0x652
 4386 064b 13       		.uleb128 0x13
 4387 064c 75000000 		.long	0x75
 4388 0650 3B       		.byte	0x3b
 4389 0651 00       		.byte	0
 4390 0652 07       		.uleb128 0x7
 4391 0653 42060000 		.long	0x642
 4392 0657 01       		.uleb128 0x1
 4393 0658 79795F6E 		.ascii "yy_nxt\0"
 4393      787400
 4394 065f A601     		.word	0x1a6
 4395 0661 1B       		.byte	0x1b
 4396 0662 52060000 		.long	0x652
 4397 0666 09       		.uleb128 0x9
 4398 0667 03       		.byte	0x3
 4399 0668 E0010000 		.quad	yy_nxt
 4399      00000000 
 4400 0670 01       		.uleb128 0x1
 4401 0671 79795F63 		.ascii "yy_chk\0"
 4401      686B00
 4402 0678 B001     		.word	0x1b0
 4403 067a 1B       		.byte	0x1b
 4404 067b 52060000 		.long	0x652
 4405 067f 09       		.uleb128 0x9
 4406 0680 03       		.byte	0x3
 4407 0681 60020000 		.quad	yy_chk
 4407      00000000 
 4408 0689 01       		.uleb128 0x1
 4409 068a 79795F6C 		.ascii "yy_last_accepting_state\0"
 4409      6173745F 
 4409      61636365 
 4409      7074696E 
 4409      675F7374 
 4410 06a2 BA01     		.word	0x1ba
 4411 06a4 16       		.byte	0x16
 4412 06a5 25050000 		.long	0x525
 4413 06a9 09       		.uleb128 0x9
 4414 06aa 03       		.byte	0x3
 4415 06ab 6C000000 		.quad	yy_last_accepting_state
 4415      00000000 
 4416 06b3 01       		.uleb128 0x1
 4417 06b4 79795F6C 		.ascii "yy_last_accepting_cpos\0"
 4417      6173745F 
 4417      61636365 
 4417      7074696E 
 4417      675F6370 
 4418 06cb BB01     		.word	0x1bb
 4419 06cd 0E       		.byte	0xe
 4420 06ce C9000000 		.long	0xc9
 4421 06d2 09       		.uleb128 0x9
 4422 06d3 03       		.byte	0x3
 4423 06d4 70000000 		.quad	yy_last_accepting_cpos
 4423      00000000 
 4424 06dc 17       		.uleb128 0x17
 4425 06dd 79795F66 		.ascii "yy_flex_debug\0"
 4425      6C65785F 
 4425      64656275 
 4425      6700
 4426 06eb BD01     		.word	0x1bd
 4427 06ed 0C       		.byte	0xc
 4428 06ee B6000000 		.long	0xb6
 4429 06f2 11       		.uleb128 0x11
 4430 06f3 DC060000 		.long	0x6dc
 4431 06f7 BE01     		.word	0x1be
 4432 06f9 05       		.byte	0x5
 4433 06fa 09       		.uleb128 0x9
 4434 06fb 03       		.byte	0x3
 4435 06fc 18000000 		.quad	yy_flex_debug
 4435      00000000 
 4436 0704 11       		.uleb128 0x11
 4437 0705 5E050000 		.long	0x55e
 4438 0709 C701     		.word	0x1c7
 4439 070b 07       		.byte	0x7
 4440 070c 09       		.uleb128 0x9
 4441 070d 03       		.byte	0x3
 4442 070e 20000000 		.quad	yytext
 4442      00000000 
 4443 0716 10       		.uleb128 0x10
 4444 0717 7856616C 		.ascii "xVal\0"
 4444      00
 4445 071c 06       		.byte	0x6
 4446 071d 08       		.byte	0x8
 4447 071e 0F       		.byte	0xf
 4448 071f A6010000 		.long	0x1a6
 4449 0723 10       		.uleb128 0x10
 4450 0724 7956616C 		.ascii "yVal\0"
 4450      00
 4451 0729 06       		.byte	0x6
 4452 072a 08       		.byte	0x8
 4453 072b 15       		.byte	0x15
 4454 072c A6010000 		.long	0x1a6
 4455 0730 21       		.uleb128 0x21
 4456 0731 16070000 		.long	0x716
 4457 0735 08       		.byte	0x8
 4458 0736 09       		.uleb128 0x9
 4459 0737 03       		.byte	0x3
 4460 0738 28000000 		.quad	xVal
 4460      00000000 
 4461 0740 21       		.uleb128 0x21
 4462 0741 23070000 		.long	0x723
 4463 0745 12       		.byte	0x12
 4464 0746 09       		.uleb128 0x9
 4465 0747 03       		.byte	0x3
 4466 0748 30000000 		.quad	yVal
 4466      00000000 
 4467 0750 28       		.uleb128 0x28
 4468 0751 08       		.byte	0x8
 4469 0752 1F       		.uleb128 0x1f
 4470 0753 50070000 		.long	0x750
 4471 0757 22       		.uleb128 0x22
 4472 0758 66726565 		.ascii "free\0"
 4472      00
 4473 075d 07       		.byte	0x7
 4474 075e C501     		.word	0x1c5
 4475 0760 6A070000 		.long	0x76a
 4476 0764 02       		.uleb128 0x2
 4477 0765 50070000 		.long	0x750
 4478 0769 00       		.byte	0
 4479 076a 09       		.uleb128 0x9
 4480 076b 7265616C 		.ascii "realloc\0"
 4480      6C6F6300 
 4481 0773 07       		.byte	0x7
 4482 0774 C701     		.word	0x1c7
 4483 0776 11       		.byte	0x11
 4484 0777 50070000 		.long	0x750
 4485 077b 8A070000 		.long	0x78a
 4486 077f 02       		.uleb128 0x2
 4487 0780 50070000 		.long	0x750
 4488 0784 02       		.uleb128 0x2
 4489 0785 75000000 		.long	0x75
 4490 0789 00       		.byte	0
 4491 078a 09       		.uleb128 0x9
 4492 078b 6D616C6C 		.ascii "malloc\0"
 4492      6F6300
 4493 0792 07       		.byte	0x7
 4494 0793 C601     		.word	0x1c6
 4495 0795 11       		.byte	0x11
 4496 0796 50070000 		.long	0x750
 4497 079a A4070000 		.long	0x7a4
 4498 079e 02       		.uleb128 0x2
 4499 079f 75000000 		.long	0x75
 4500 07a3 00       		.byte	0
 4501 07a4 18       		.uleb128 0x18
 4502 07a5 66707269 		.ascii "fprintf\0"
 4502      6E746600 
 4503 07ad 5A01     		.word	0x15a
 4504 07af 5F5F6D69 		.ascii "__mingw_fprintf\0"
 4504      6E67775F 
 4504      66707269 
 4504      6E746600 
 4505 07bf B6000000 		.long	0xb6
 4506 07c3 D3070000 		.long	0x7d3
 4507 07c7 02       		.uleb128 0x2
 4508 07c8 9E030000 		.long	0x39e
 4509 07cc 02       		.uleb128 0x2
 4510 07cd D3070000 		.long	0x7d3
 4511 07d1 19       		.uleb128 0x19
 4512 07d2 00       		.byte	0
 4513 07d3 0B       		.uleb128 0xb
 4514 07d4 61000000 		.long	0x61
 4515 07d8 1A       		.uleb128 0x1a
 4516 07d9 7374726C 		.ascii "strlen\0"
 4516      656E00
 4517 07e0 08       		.byte	0x8
 4518 07e1 40       		.byte	0x40
 4519 07e2 12       		.byte	0x12
 4520 07e3 66000000 		.long	0x66
 4521 07e7 F1070000 		.long	0x7f1
 4522 07eb 02       		.uleb128 0x2
 4523 07ec D3070000 		.long	0x7d3
 4524 07f0 00       		.byte	0
 4525 07f1 1A       		.uleb128 0x1a
 4526 07f2 6D656D73 		.ascii "memset\0"
 4526      657400
 4527 07f9 08       		.byte	0x8
 4528 07fa 35       		.byte	0x35
 4529 07fb 12       		.byte	0x12
 4530 07fc 50070000 		.long	0x750
 4531 0800 14080000 		.long	0x814
 4532 0804 02       		.uleb128 0x2
 4533 0805 50070000 		.long	0x750
 4534 0809 02       		.uleb128 0x2
 4535 080a B6000000 		.long	0xb6
 4536 080e 02       		.uleb128 0x2
 4537 080f 75000000 		.long	0x75
 4538 0813 00       		.byte	0
 4539 0814 09       		.uleb128 0x9
 4540 0815 69736174 		.ascii "isatty\0"
 4540      747900
 4541 081c 09       		.byte	0x9
 4542 081d 5F01     		.word	0x15f
 4543 081f 0F       		.byte	0xf
 4544 0820 B6000000 		.long	0xb6
 4545 0824 2E080000 		.long	0x82e
 4546 0828 02       		.uleb128 0x2
 4547 0829 B6000000 		.long	0xb6
 4548 082d 00       		.byte	0
 4549 082e 09       		.uleb128 0x9
 4550 082f 66696C65 		.ascii "fileno\0"
 4550      6E6F00
 4551 0836 03       		.byte	0x3
 4552 0837 3D05     		.word	0x53d
 4553 0839 0F       		.byte	0xf
 4554 083a B6000000 		.long	0xb6
 4555 083e 48080000 		.long	0x848
 4556 0842 02       		.uleb128 0x2
 4557 0843 9E030000 		.long	0x39e
 4558 0847 00       		.byte	0
 4559 0848 09       		.uleb128 0x9
 4560 0849 66726561 		.ascii "fread\0"
 4560      6400
 4561 084f 03       		.byte	0x3
 4562 0850 4002     		.word	0x240
 4563 0852 12       		.byte	0x12
 4564 0853 66000000 		.long	0x66
 4565 0857 70080000 		.long	0x870
 4566 085b 02       		.uleb128 0x2
 4567 085c 52070000 		.long	0x752
 4568 0860 02       		.uleb128 0x2
 4569 0861 66000000 		.long	0x66
 4570 0865 02       		.uleb128 0x2
 4571 0866 66000000 		.long	0x66
 4572 086a 02       		.uleb128 0x2
 4573 086b A3030000 		.long	0x3a3
 4574 086f 00       		.byte	0
 4575 0870 22       		.uleb128 0x22
 4576 0871 636C6561 		.ascii "clearerr\0"
 4576      72657272 
 4576      00
 4577 087a 03       		.byte	0x3
 4578 087b 1E02     		.word	0x21e
 4579 087d 87080000 		.long	0x887
 4580 0881 02       		.uleb128 0x2
 4581 0882 9E030000 		.long	0x39e
 4582 0886 00       		.byte	0
 4583 0887 29       		.uleb128 0x29
 4584 0888 5F657272 		.ascii "_errno\0"
 4584      6E6F00
 4585 088f 0A       		.byte	0xa
 4586 0890 11       		.byte	0x11
 4587 0891 1D       		.byte	0x1d
 4588 0892 CE000000 		.long	0xce
 4589 0896 09       		.uleb128 0x9
 4590 0897 66657272 		.ascii "ferror\0"
 4590      6F7200
 4591 089e 03       		.byte	0x3
 4592 089f 2702     		.word	0x227
 4593 08a1 0F       		.byte	0xf
 4594 08a2 B6000000 		.long	0xb6
 4595 08a6 B0080000 		.long	0x8b0
 4596 08aa 02       		.uleb128 0x2
 4597 08ab 9E030000 		.long	0x39e
 4598 08af 00       		.byte	0
 4599 08b0 09       		.uleb128 0x9
 4600 08b1 67657463 		.ascii "getc\0"
 4600      00
 4601 08b6 03       		.byte	0x3
 4602 08b7 6F02     		.word	0x26f
 4603 08b9 0F       		.byte	0xf
 4604 08ba B6000000 		.long	0xb6
 4605 08be C8080000 		.long	0x8c8
 4606 08c2 02       		.uleb128 0x2
 4607 08c3 9E030000 		.long	0x39e
 4608 08c7 00       		.byte	0
 4609 08c8 09       		.uleb128 0x9
 4610 08c9 66777269 		.ascii "fwrite\0"
 4610      746500
 4611 08d0 03       		.byte	0x3
 4612 08d1 6E02     		.word	0x26e
 4613 08d3 12       		.byte	0x12
 4614 08d4 66000000 		.long	0x66
 4615 08d8 F1080000 		.long	0x8f1
 4616 08dc 02       		.uleb128 0x2
 4617 08dd F1080000 		.long	0x8f1
 4618 08e1 02       		.uleb128 0x2
 4619 08e2 75000000 		.long	0x75
 4620 08e6 02       		.uleb128 0x2
 4621 08e7 75000000 		.long	0x75
 4622 08eb 02       		.uleb128 0x2
 4623 08ec 9E030000 		.long	0x39e
 4624 08f0 00       		.byte	0
 4625 08f1 0B       		.uleb128 0xb
 4626 08f2 F6080000 		.long	0x8f6
 4627 08f6 2A       		.uleb128 0x2a
 4628 08f7 2B       		.uleb128 0x2b
 4629 08f8 65786974 		.ascii "exit\0"
 4629      00
 4630 08fd 07       		.byte	0x7
 4631 08fe 1201     		.word	0x112
 4632 0900 20       		.byte	0x20
 4633 0901 0B090000 		.long	0x90b
 4634 0905 02       		.uleb128 0x2
 4635 0906 B6000000 		.long	0xb6
 4636 090a 00       		.byte	0
 4637 090b 18       		.uleb128 0x18
 4638 090c 7072696E 		.ascii "printf\0"
 4638      746600
 4639 0913 5E01     		.word	0x15e
 4640 0915 5F5F6D69 		.ascii "__mingw_printf\0"
 4640      6E67775F 
 4640      7072696E 
 4640      746600
 4641 0924 B6000000 		.long	0xb6
 4642 0928 33090000 		.long	0x933
 4643 092c 02       		.uleb128 0x2
 4644 092d D3070000 		.long	0x7d3
 4645 0931 19       		.uleb128 0x19
 4646 0932 00       		.byte	0
 4647 0933 18       		.uleb128 0x18
 4648 0934 73736361 		.ascii "sscanf\0"
 4648      6E6600
 4649 093b 3501     		.word	0x135
 4650 093d 5F5F6D69 		.ascii "__mingw_sscanf\0"
 4650      6E67775F 
 4650      73736361 
 4650      6E6600
 4651 094c B6000000 		.long	0xb6
 4652 0950 60090000 		.long	0x960
 4653 0954 02       		.uleb128 0x2
 4654 0955 D3070000 		.long	0x7d3
 4655 0959 02       		.uleb128 0x2
 4656 095a D3070000 		.long	0x7d3
 4657 095e 19       		.uleb128 0x19
 4658 095f 00       		.byte	0
 4659 0960 1A       		.uleb128 0x1a
 4660 0961 5F5F6163 		.ascii "__acrt_iob_func\0"
 4660      72745F69 
 4660      6F625F66 
 4660      756E6300 
 4661 0971 03       		.byte	0x3
 4662 0972 65       		.byte	0x65
 4663 0973 17       		.byte	0x17
 4664 0974 9E030000 		.long	0x39e
 4665 0978 82090000 		.long	0x982
 4666 097c 02       		.uleb128 0x2
 4667 097d D3000000 		.long	0xd3
 4668 0981 00       		.byte	0
 4669 0982 2C       		.uleb128 0x2c
 4670 0983 79797772 		.ascii "yywrap\0"
 4670      617000
 4671 098a 02       		.byte	0x2
 4672 098b 15       		.byte	0x15
 4673 098c 05       		.byte	0x5
 4674 098d B6000000 		.long	0xb6
 4675 0991 731E0000 		.quad	.LFB52
 4675      00000000 
 4676 0999 0B000000 		.quad	.LFE52-.LFB52
 4676      00000000 
 4677 09a1 01       		.uleb128 0x1
 4678 09a2 9C       		.byte	0x9c
 4679 09a3 0D       		.uleb128 0xd
 4680 09a4 79796672 		.ascii "yyfree\0"
 4680      656500
 4681 09ab EA06     		.word	0x6ea
 4682 09ad 06       		.byte	0x6
 4683 09ae 541E0000 		.quad	.LFB51
 4683      00000000 
 4684 09b6 1F000000 		.quad	.LFE51-.LFB51
 4684      00000000 
 4685 09be 01       		.uleb128 0x1
 4686 09bf 9C       		.byte	0x9c
 4687 09c0 D4090000 		.long	0x9d4
 4688 09c4 03       		.uleb128 0x3
 4689 09c5 70747200 		.ascii "ptr\0"
 4690 09c9 EA06     		.word	0x6ea
 4691 09cb 15       		.byte	0x15
 4692 09cc 50070000 		.long	0x750
 4693 09d0 02       		.uleb128 0x2
 4694 09d1 91       		.byte	0x91
 4695 09d2 00       		.sleb128 0
 4696 09d3 00       		.byte	0
 4697 09d4 0E       		.uleb128 0xe
 4698 09d5 79797265 		.ascii "yyrealloc\0"
 4698      616C6C6F 
 4698      6300
 4699 09df DD06     		.word	0x6dd
 4700 09e1 07       		.byte	0x7
 4701 09e2 50070000 		.long	0x750
 4702 09e6 2E1E0000 		.quad	.LFB50
 4702      00000000 
 4703 09ee 26000000 		.quad	.LFE50-.LFB50
 4703      00000000 
 4704 09f6 01       		.uleb128 0x1
 4705 09f7 9C       		.byte	0x9c
 4706 09f8 1C0A0000 		.long	0xa1c
 4707 09fc 03       		.uleb128 0x3
 4708 09fd 70747200 		.ascii "ptr\0"
 4709 0a01 DD06     		.word	0x6dd
 4710 0a03 1A       		.byte	0x1a
 4711 0a04 50070000 		.long	0x750
 4712 0a08 02       		.uleb128 0x2
 4713 0a09 91       		.byte	0x91
 4714 0a0a 00       		.sleb128 0
 4715 0a0b 03       		.uleb128 0x3
 4716 0a0c 73697A65 		.ascii "size\0"
 4716      00
 4717 0a11 DD06     		.word	0x6dd
 4718 0a13 2A       		.byte	0x2a
 4719 0a14 70030000 		.long	0x370
 4720 0a18 02       		.uleb128 0x2
 4721 0a19 91       		.byte	0x91
 4722 0a1a 08       		.sleb128 8
 4723 0a1b 00       		.byte	0
 4724 0a1c 0E       		.uleb128 0xe
 4725 0a1d 7979616C 		.ascii "yyalloc\0"
 4725      6C6F6300 
 4726 0a25 D806     		.word	0x6d8
 4727 0a27 07       		.byte	0x7
 4728 0a28 50070000 		.long	0x750
 4729 0a2c 101E0000 		.quad	.LFB49
 4729      00000000 
 4730 0a34 1E000000 		.quad	.LFE49-.LFB49
 4730      00000000 
 4731 0a3c 01       		.uleb128 0x1
 4732 0a3d 9C       		.byte	0x9c
 4733 0a3e 530A0000 		.long	0xa53
 4734 0a42 03       		.uleb128 0x3
 4735 0a43 73697A65 		.ascii "size\0"
 4735      00
 4736 0a48 D806     		.word	0x6d8
 4737 0a4a 1B       		.byte	0x1b
 4738 0a4b 70030000 		.long	0x370
 4739 0a4f 02       		.uleb128 0x2
 4740 0a50 91       		.byte	0x91
 4741 0a51 00       		.sleb128 0
 4742 0a52 00       		.byte	0
 4743 0a53 2D       		.uleb128 0x2d
 4744 0a54 79796C65 		.ascii "yylex_destroy\0"
 4744      785F6465 
 4744      7374726F 
 4744      7900
 4745 0a62 01       		.byte	0x1
 4746 0a63 AA06     		.word	0x6aa
 4747 0a65 05       		.byte	0x5
 4748 0a66 B6000000 		.long	0xb6
 4749 0a6a 5F1D0000 		.quad	.LFB48
 4749      00000000 
 4750 0a72 B1000000 		.quad	.LFE48-.LFB48
 4750      00000000 
 4751 0a7a 01       		.uleb128 0x1
 4752 0a7b 9C       		.byte	0x9c
 4753 0a7c 2E       		.uleb128 0x2e
 4754 0a7d 79795F69 		.ascii "yy_init_globals\0"
 4754      6E69745F 
 4754      676C6F62 
 4754      616C7300 
 4755 0a8d 01       		.byte	0x1
 4756 0a8e 8D06     		.word	0x68d
 4757 0a90 0C       		.byte	0xc
 4758 0a91 B6000000 		.long	0xb6
 4759 0a95 FE1C0000 		.quad	.LFB47
 4759      00000000 
 4760 0a9d 61000000 		.quad	.LFE47-.LFB47
 4760      00000000 
 4761 0aa5 01       		.uleb128 0x1
 4762 0aa6 9C       		.byte	0x9c
 4763 0aa7 14       		.uleb128 0x14
 4764 0aa8 79797365 		.ascii "yyset_debug\0"
 4764      745F6465 
 4764      62756700 
 4765 0ab4 8806     		.word	0x688
 4766 0ab6 EB1C0000 		.quad	.LFB46
 4766      00000000 
 4767 0abe 13000000 		.quad	.LFE46-.LFB46
 4767      00000000 
 4768 0ac6 01       		.uleb128 0x1
 4769 0ac7 9C       		.byte	0x9c
 4770 0ac8 E00A0000 		.long	0xae0
 4771 0acc 03       		.uleb128 0x3
 4772 0acd 5F626465 		.ascii "_bdebug\0"
 4772      62756700 
 4773 0ad5 8806     		.word	0x688
 4774 0ad7 18       		.byte	0x18
 4775 0ad8 B6000000 		.long	0xb6
 4776 0adc 02       		.uleb128 0x2
 4777 0add 91       		.byte	0x91
 4778 0ade 00       		.sleb128 0
 4779 0adf 00       		.byte	0
 4780 0ae0 0F       		.uleb128 0xf
 4781 0ae1 79796765 		.ascii "yyget_debug\0"
 4781      745F6465 
 4781      62756700 
 4782 0aed 8306     		.word	0x683
 4783 0aef 05       		.byte	0x5
 4784 0af0 B6000000 		.long	0xb6
 4785 0af4 DF1C0000 		.quad	.LFB45
 4785      00000000 
 4786 0afc 0C000000 		.quad	.LFE45-.LFB45
 4786      00000000 
 4787 0b04 01       		.uleb128 0x1
 4788 0b05 9C       		.byte	0x9c
 4789 0b06 14       		.uleb128 0x14
 4790 0b07 79797365 		.ascii "yyset_out\0"
 4790      745F6F75 
 4790      7400
 4791 0b11 7E06     		.word	0x67e
 4792 0b13 C91C0000 		.quad	.LFB44
 4792      00000000 
 4793 0b1b 16000000 		.quad	.LFE44-.LFB44
 4793      00000000 
 4794 0b23 01       		.uleb128 0x1
 4795 0b24 9C       		.byte	0x9c
 4796 0b25 3E0B0000 		.long	0xb3e
 4797 0b29 03       		.uleb128 0x3
 4798 0b2a 5F6F7574 		.ascii "_out_str\0"
 4798      5F737472 
 4798      00
 4799 0b33 7E06     		.word	0x67e
 4800 0b35 19       		.byte	0x19
 4801 0b36 9E030000 		.long	0x39e
 4802 0b3a 02       		.uleb128 0x2
 4803 0b3b 91       		.byte	0x91
 4804 0b3c 00       		.sleb128 0
 4805 0b3d 00       		.byte	0
 4806 0b3e 14       		.uleb128 0x14
 4807 0b3f 79797365 		.ascii "yyset_in\0"
 4807      745F696E 
 4807      00
 4808 0b48 7906     		.word	0x679
 4809 0b4a B31C0000 		.quad	.LFB43
 4809      00000000 
 4810 0b52 16000000 		.quad	.LFE43-.LFB43
 4810      00000000 
 4811 0b5a 01       		.uleb128 0x1
 4812 0b5b 9C       		.byte	0x9c
 4813 0b5c 740B0000 		.long	0xb74
 4814 0b60 03       		.uleb128 0x3
 4815 0b61 5F696E5F 		.ascii "_in_str\0"
 4815      73747200 
 4816 0b69 7906     		.word	0x679
 4817 0b6b 18       		.byte	0x18
 4818 0b6c 9E030000 		.long	0x39e
 4819 0b70 02       		.uleb128 0x2
 4820 0b71 91       		.byte	0x91
 4821 0b72 00       		.sleb128 0
 4822 0b73 00       		.byte	0
 4823 0b74 14       		.uleb128 0x14
 4824 0b75 79797365 		.ascii "yyset_lineno\0"
 4824      745F6C69 
 4824      6E656E6F 
 4824      00
 4825 0b82 6D06     		.word	0x66d
 4826 0b84 A01C0000 		.quad	.LFB42
 4826      00000000 
 4827 0b8c 13000000 		.quad	.LFE42-.LFB42
 4827      00000000 
 4828 0b94 01       		.uleb128 0x1
 4829 0b95 9C       		.byte	0x9c
 4830 0b96 B30B0000 		.long	0xbb3
 4831 0b9a 03       		.uleb128 0x3
 4832 0b9b 5F6C696E 		.ascii "_line_number\0"
 4832      655F6E75 
 4832      6D626572 
 4832      00
 4833 0ba8 6D06     		.word	0x66d
 4834 0baa 19       		.byte	0x19
 4835 0bab B6000000 		.long	0xb6
 4836 0baf 02       		.uleb128 0x2
 4837 0bb0 91       		.byte	0x91
 4838 0bb1 00       		.sleb128 0
 4839 0bb2 00       		.byte	0
 4840 0bb3 0F       		.uleb128 0xf
 4841 0bb4 79796765 		.ascii "yyget_text\0"
 4841      745F7465 
 4841      787400
 4842 0bbf 6406     		.word	0x664
 4843 0bc1 07       		.byte	0x7
 4844 0bc2 C9000000 		.long	0xc9
 4845 0bc6 931C0000 		.quad	.LFB41
 4845      00000000 
 4846 0bce 0D000000 		.quad	.LFE41-.LFB41
 4846      00000000 
 4847 0bd6 01       		.uleb128 0x1
 4848 0bd7 9C       		.byte	0x9c
 4849 0bd8 0F       		.uleb128 0xf
 4850 0bd9 79796765 		.ascii "yyget_leng\0"
 4850      745F6C65 
 4850      6E6700
 4851 0be4 5B06     		.word	0x65b
 4852 0be6 05       		.byte	0x5
 4853 0be7 B6000000 		.long	0xb6
 4854 0beb 871C0000 		.quad	.LFB40
 4854      00000000 
 4855 0bf3 0C000000 		.quad	.LFE40-.LFB40
 4855      00000000 
 4856 0bfb 01       		.uleb128 0x1
 4857 0bfc 9C       		.byte	0x9c
 4858 0bfd 0F       		.uleb128 0xf
 4859 0bfe 79796765 		.ascii "yyget_out\0"
 4859      745F6F75 
 4859      7400
 4860 0c08 5306     		.word	0x653
 4861 0c0a 07       		.byte	0x7
 4862 0c0b 9E030000 		.long	0x39e
 4863 0c0f 7A1C0000 		.quad	.LFB39
 4863      00000000 
 4864 0c17 0D000000 		.quad	.LFE39-.LFB39
 4864      00000000 
 4865 0c1f 01       		.uleb128 0x1
 4866 0c20 9C       		.byte	0x9c
 4867 0c21 0F       		.uleb128 0xf
 4868 0c22 79796765 		.ascii "yyget_in\0"
 4868      745F696E 
 4868      00
 4869 0c2b 4B06     		.word	0x64b
 4870 0c2d 07       		.byte	0x7
 4871 0c2e 9E030000 		.long	0x39e
 4872 0c32 6D1C0000 		.quad	.LFB38
 4872      00000000 
 4873 0c3a 0D000000 		.quad	.LFE38-.LFB38
 4873      00000000 
 4874 0c42 01       		.uleb128 0x1
 4875 0c43 9C       		.byte	0x9c
 4876 0c44 0F       		.uleb128 0xf
 4877 0c45 79796765 		.ascii "yyget_lineno\0"
 4877      745F6C69 
 4877      6E656E6F 
 4877      00
 4878 0c52 4206     		.word	0x642
 4879 0c54 05       		.byte	0x5
 4880 0c55 B6000000 		.long	0xb6
 4881 0c59 611C0000 		.quad	.LFB37
 4881      00000000 
 4882 0c61 0C000000 		.quad	.LFE37-.LFB37
 4882      00000000 
 4883 0c69 01       		.uleb128 0x1
 4884 0c6a 9C       		.byte	0x9c
 4885 0c6b 2F       		.uleb128 0x2f
 4886 0c6c 79795F66 		.ascii "yy_fatal_error\0"
 4886      6174616C 
 4886      5F657272 
 4886      6F7200
 4887 0c7b 01       		.byte	0x1
 4888 0c7c 2606     		.word	0x626
 4889 0c7e 18       		.byte	0x18
 4890 0c7f 231C0000 		.quad	.LFB36
 4890      00000000 
 4891 0c87 3E000000 		.quad	.LFE36-.LFB36
 4891      00000000 
 4892 0c8f 01       		.uleb128 0x1
 4893 0c90 9C       		.byte	0x9c
 4894 0c91 B20C0000 		.long	0xcb2
 4895 0c95 03       		.uleb128 0x3
 4896 0c96 6D736700 		.ascii "msg\0"
 4897 0c9a 2606     		.word	0x626
 4898 0c9c 34       		.byte	0x34
 4899 0c9d D3070000 		.long	0x7d3
 4900 0ca1 02       		.uleb128 0x2
 4901 0ca2 91       		.byte	0x91
 4902 0ca3 00       		.sleb128 0
 4903 0ca4 0A       		.uleb128 0xa
 4904 0ca5 3D1C0000 		.quad	.LVL7
 4904      00000000 
 4905 0cad 60090000 		.long	0x960
 4906 0cb1 00       		.byte	0
 4907 0cb2 0E       		.uleb128 0xe
 4908 0cb3 79795F73 		.ascii "yy_scan_bytes\0"
 4908      63616E5F 
 4908      62797465 
 4908      7300
 4909 0cc1 0406     		.word	0x604
 4910 0cc3 11       		.byte	0x11
 4911 0cc4 33020000 		.long	0x233
 4912 0cc8 4A1B0000 		.quad	.LFB35
 4912      00000000 
 4913 0cd0 D9000000 		.quad	.LFE35-.LFB35
 4913      00000000 
 4914 0cd8 01       		.uleb128 0x1
 4915 0cd9 9C       		.byte	0x9c
 4916 0cda 400D0000 		.long	0xd40
 4917 0cde 03       		.uleb128 0x3
 4918 0cdf 79796279 		.ascii "yybytes\0"
 4918      74657300 
 4919 0ce7 0406     		.word	0x604
 4920 0ce9 2E       		.byte	0x2e
 4921 0cea D3070000 		.long	0x7d3
 4922 0cee 02       		.uleb128 0x2
 4923 0cef 91       		.byte	0x91
 4924 0cf0 00       		.sleb128 0
 4925 0cf1 03       		.uleb128 0x3
 4926 0cf2 5F797962 		.ascii "_yybytes_len\0"
 4926      79746573 
 4926      5F6C656E 
 4926      00
 4927 0cff 0406     		.word	0x604
 4928 0d01 3C       		.byte	0x3c
 4929 0d02 B6000000 		.long	0xb6
 4930 0d06 02       		.uleb128 0x2
 4931 0d07 91       		.byte	0x91
 4932 0d08 08       		.sleb128 8
 4933 0d09 01       		.uleb128 0x1
 4934 0d0a 6200     		.ascii "b\0"
 4935 0d0c 0606     		.word	0x606
 4936 0d0e 12       		.byte	0x12
 4937 0d0f 33020000 		.long	0x233
 4938 0d13 02       		.uleb128 0x2
 4939 0d14 91       		.byte	0x91
 4940 0d15 50       		.sleb128 -48
 4941 0d16 01       		.uleb128 0x1
 4942 0d17 62756600 		.ascii "buf\0"
 4943 0d1b 0706     		.word	0x607
 4944 0d1d 08       		.byte	0x8
 4945 0d1e C9000000 		.long	0xc9
 4946 0d22 02       		.uleb128 0x2
 4947 0d23 91       		.byte	0x91
 4948 0d24 58       		.sleb128 -40
 4949 0d25 01       		.uleb128 0x1
 4950 0d26 6E00     		.ascii "n\0"
 4951 0d28 0806     		.word	0x608
 4952 0d2a 0C       		.byte	0xc
 4953 0d2b 70030000 		.long	0x370
 4954 0d2f 02       		.uleb128 0x2
 4955 0d30 91       		.byte	0x91
 4956 0d31 60       		.sleb128 -32
 4957 0d32 01       		.uleb128 0x1
 4958 0d33 6900     		.ascii "i\0"
 4959 0d35 0906     		.word	0x609
 4960 0d37 06       		.byte	0x6
 4961 0d38 B6000000 		.long	0xb6
 4962 0d3c 02       		.uleb128 0x2
 4963 0d3d 91       		.byte	0x91
 4964 0d3e 6C       		.sleb128 -20
 4965 0d3f 00       		.byte	0
 4966 0d40 0E       		.uleb128 0xe
 4967 0d41 79795F73 		.ascii "yy_scan_string\0"
 4967      63616E5F 
 4967      73747269 
 4967      6E6700
 4968 0d50 F705     		.word	0x5f7
 4969 0d52 11       		.byte	0x11
 4970 0d53 33020000 		.long	0x233
 4971 0d57 1E1B0000 		.quad	.LFB34
 4971      00000000 
 4972 0d5f 2C000000 		.quad	.LFE34-.LFB34
 4972      00000000 
 4973 0d67 01       		.uleb128 0x1
 4974 0d68 9C       		.byte	0x9c
 4975 0d69 7F0D0000 		.long	0xd7f
 4976 0d6d 03       		.uleb128 0x3
 4977 0d6e 79797374 		.ascii "yystr\0"
 4977      7200
 4978 0d74 F705     		.word	0x5f7
 4979 0d76 2E       		.byte	0x2e
 4980 0d77 D3070000 		.long	0x7d3
 4981 0d7b 02       		.uleb128 0x2
 4982 0d7c 91       		.byte	0x91
 4983 0d7d 00       		.sleb128 0
 4984 0d7e 00       		.byte	0
 4985 0d7f 0E       		.uleb128 0xe
 4986 0d80 79795F73 		.ascii "yy_scan_buffer\0"
 4986      63616E5F 
 4986      62756666 
 4986      657200
 4987 0d8f D205     		.word	0x5d2
 4988 0d91 11       		.byte	0x11
 4989 0d92 33020000 		.long	0x233
 4990 0d96 1B1A0000 		.quad	.LFB33
 4990      00000000 
 4991 0d9e 03010000 		.quad	.LFE33-.LFB33
 4991      00000000 
 4992 0da6 01       		.uleb128 0x1
 4993 0da7 9C       		.byte	0x9c
 4994 0da8 DA0D0000 		.long	0xdda
 4995 0dac 03       		.uleb128 0x3
 4996 0dad 62617365 		.ascii "base\0"
 4996      00
 4997 0db2 D205     		.word	0x5d2
 4998 0db4 29       		.byte	0x29
 4999 0db5 C9000000 		.long	0xc9
 5000 0db9 02       		.uleb128 0x2
 5001 0dba 91       		.byte	0x91
 5002 0dbb 00       		.sleb128 0
 5003 0dbc 03       		.uleb128 0x3
 5004 0dbd 73697A65 		.ascii "size\0"
 5004      00
 5005 0dc2 D205     		.word	0x5d2
 5006 0dc4 3A       		.byte	0x3a
 5007 0dc5 70030000 		.long	0x370
 5008 0dc9 02       		.uleb128 0x2
 5009 0dca 91       		.byte	0x91
 5010 0dcb 08       		.sleb128 8
 5011 0dcc 01       		.uleb128 0x1
 5012 0dcd 6200     		.ascii "b\0"
 5013 0dcf D405     		.word	0x5d4
 5014 0dd1 12       		.byte	0x12
 5015 0dd2 33020000 		.long	0x233
 5016 0dd6 02       		.uleb128 0x2
 5017 0dd7 91       		.byte	0x91
 5018 0dd8 68       		.sleb128 -24
 5019 0dd9 00       		.byte	0
 5020 0dda 1B       		.uleb128 0x1b
 5021 0ddb 7979656E 		.ascii "yyensure_buffer_stack\0"
 5021      73757265 
 5021      5F627566 
 5021      6665725F 
 5021      73746163 
 5022 0df1 A105     		.word	0x5a1
 5023 0df3 0D       		.byte	0xd
 5024 0df4 DB180000 		.quad	.LFB32
 5024      00000000 
 5025 0dfc 40010000 		.quad	.LFE32-.LFB32
 5025      00000000 
 5026 0e04 01       		.uleb128 0x1
 5027 0e05 9C       		.byte	0x9c
 5028 0e06 4A0E0000 		.long	0xe4a
 5029 0e0a 01       		.uleb128 0x1
 5030 0e0b 6E756D5F 		.ascii "num_to_alloc\0"
 5030      746F5F61 
 5030      6C6C6F63 
 5030      00
 5031 0e18 A305     		.word	0x5a3
 5032 0e1a 0C       		.byte	0xc
 5033 0e1b 70030000 		.long	0x370
 5034 0e1f 02       		.uleb128 0x2
 5035 0e20 91       		.byte	0x91
 5036 0e21 60       		.sleb128 -32
 5037 0e22 0C       		.uleb128 0xc
 5038 0e23 82190000 		.quad	.LBB14
 5038      00000000 
 5039 0e2b 93000000 		.quad	.LBE14-.LBB14
 5039      00000000 
 5040 0e33 01       		.uleb128 0x1
 5041 0e34 67726F77 		.ascii "grow_size\0"
 5041      5F73697A 
 5041      6500
 5042 0e3e BC05     		.word	0x5bc
 5043 0e40 0D       		.byte	0xd
 5044 0e41 70030000 		.long	0x370
 5045 0e45 02       		.uleb128 0x2
 5046 0e46 91       		.byte	0x91
 5047 0e47 68       		.sleb128 -24
 5048 0e48 00       		.byte	0
 5049 0e49 00       		.byte	0
 5050 0e4a 30       		.uleb128 0x30
 5051 0e4b 7979706F 		.ascii "yypop_buffer_state\0"
 5051      705F6275 
 5051      66666572 
 5051      5F737461 
 5051      746500
 5052 0e5e 01       		.byte	0x1
 5053 0e5f 8E05     		.word	0x58e
 5054 0e61 06       		.byte	0x6
 5055 0e62 F4170000 		.quad	.LFB31
 5055      00000000 
 5056 0e6a E7000000 		.quad	.LFE31-.LFB31
 5056      00000000 
 5057 0e72 01       		.uleb128 0x1
 5058 0e73 9C       		.byte	0x9c
 5059 0e74 0D       		.uleb128 0xd
 5060 0e75 79797075 		.ascii "yypush_buffer_state\0"
 5060      73685F62 
 5060      75666665 
 5060      725F7374 
 5060      61746500 
 5061 0e89 7005     		.word	0x570
 5062 0e8b 06       		.byte	0x6
 5063 0e8c EC160000 		.quad	.LFB30
 5063      00000000 
 5064 0e94 08010000 		.quad	.LFE30-.LFB30
 5064      00000000 
 5065 0e9c 01       		.uleb128 0x1
 5066 0e9d 9C       		.byte	0x9c
 5067 0e9e B20E0000 		.long	0xeb2
 5068 0ea2 1C       		.uleb128 0x1c
 5069 0ea3 22000000 		.secrel32	.LASF3
 5070 0ea7 7005     		.word	0x570
 5071 0ea9 2B       		.byte	0x2b
 5072 0eaa 33020000 		.long	0x233
 5073 0eae 02       		.uleb128 0x2
 5074 0eaf 91       		.byte	0x91
 5075 0eb0 00       		.sleb128 0
 5076 0eb1 00       		.byte	0
 5077 0eb2 0D       		.uleb128 0xd
 5078 0eb3 79795F66 		.ascii "yy_flush_buffer\0"
 5078      6C757368 
 5078      5F627566 
 5078      66657200 
 5079 0ec3 5305     		.word	0x553
 5080 0ec5 0A       		.byte	0xa
 5081 0ec6 4B160000 		.quad	.LFB29
 5081      00000000 
 5082 0ece A1000000 		.quad	.LFE29-.LFB29
 5082      00000000 
 5083 0ed6 01       		.uleb128 0x1
 5084 0ed7 9C       		.byte	0x9c
 5085 0ed8 EA0E0000 		.long	0xeea
 5086 0edc 03       		.uleb128 0x3
 5087 0edd 6200     		.ascii "b\0"
 5088 0edf 5305     		.word	0x553
 5089 0ee1 2C       		.byte	0x2c
 5090 0ee2 33020000 		.long	0x233
 5091 0ee6 02       		.uleb128 0x2
 5092 0ee7 91       		.byte	0x91
 5093 0ee8 00       		.sleb128 0
 5094 0ee9 00       		.byte	0
 5095 0eea 1B       		.uleb128 0x1b
 5096 0eeb 79795F69 		.ascii "yy_init_buffer\0"
 5096      6E69745F 
 5096      62756666 
 5096      657200
 5097 0efa 3705     		.word	0x537
 5098 0efc 11       		.byte	0x11
 5099 0efd 7E150000 		.quad	.LFB28
 5099      00000000 
 5100 0f05 CD000000 		.quad	.LFE28-.LFB28
 5100      00000000 
 5101 0f0d 01       		.uleb128 0x1
 5102 0f0e 9C       		.byte	0x9c
 5103 0f0f 5D0F0000 		.long	0xf5d
 5104 0f13 03       		.uleb128 0x3
 5105 0f14 6200     		.ascii "b\0"
 5106 0f16 3705     		.word	0x537
 5107 0f18 33       		.byte	0x33
 5108 0f19 33020000 		.long	0x233
 5109 0f1d 02       		.uleb128 0x2
 5110 0f1e 91       		.byte	0x91
 5111 0f1f 00       		.sleb128 0
 5112 0f20 03       		.uleb128 0x3
 5113 0f21 66696C65 		.ascii "file\0"
 5113      00
 5114 0f26 3705     		.word	0x537
 5115 0f28 3D       		.byte	0x3d
 5116 0f29 9E030000 		.long	0x39e
 5117 0f2d 02       		.uleb128 0x2
 5118 0f2e 91       		.byte	0x91
 5119 0f2f 08       		.sleb128 8
 5120 0f30 01       		.uleb128 0x1
 5121 0f31 6F657272 		.ascii "oerrno\0"
 5121      6E6F00
 5122 0f38 3A05     		.word	0x53a
 5123 0f3a 06       		.byte	0x6
 5124 0f3b B6000000 		.long	0xb6
 5125 0f3f 02       		.uleb128 0x2
 5126 0f40 91       		.byte	0x91
 5127 0f41 6C       		.sleb128 -20
 5128 0f42 0A       		.uleb128 0xa
 5129 0f43 97150000 		.quad	.LVL5
 5129      00000000 
 5130 0f4b 87080000 		.long	0x887
 5131 0f4f 0A       		.uleb128 0xa
 5132 0f50 3F160000 		.quad	.LVL6
 5132      00000000 
 5133 0f58 87080000 		.long	0x887
 5134 0f5c 00       		.byte	0
 5135 0f5d 0D       		.uleb128 0xd
 5136 0f5e 79795F64 		.ascii "yy_delete_buffer\0"
 5136      656C6574 
 5136      655F6275 
 5136      66666572 
 5136      00
 5137 0f6f 2405     		.word	0x524
 5138 0f71 0A       		.byte	0xa
 5139 0f72 EE140000 		.quad	.LFB27
 5139      00000000 
 5140 0f7a 90000000 		.quad	.LFE27-.LFB27
 5140      00000000 
 5141 0f82 01       		.uleb128 0x1
 5142 0f83 9C       		.byte	0x9c
 5143 0f84 960F0000 		.long	0xf96
 5144 0f88 03       		.uleb128 0x3
 5145 0f89 6200     		.ascii "b\0"
 5146 0f8b 2405     		.word	0x524
 5147 0f8d 2D       		.byte	0x2d
 5148 0f8e 33020000 		.long	0x233
 5149 0f92 02       		.uleb128 0x2
 5150 0f93 91       		.byte	0x91
 5151 0f94 00       		.sleb128 0
 5152 0f95 00       		.byte	0
 5153 0f96 0E       		.uleb128 0xe
 5154 0f97 79795F63 		.ascii "yy_create_buffer\0"
 5154      72656174 
 5154      655F6275 
 5154      66666572 
 5154      00
 5155 0fa8 0805     		.word	0x508
 5156 0faa 15       		.byte	0x15
 5157 0fab 33020000 		.long	0x233
 5158 0faf 54140000 		.quad	.LFB26
 5158      00000000 
 5159 0fb7 9A000000 		.quad	.LFE26-.LFB26
 5159      00000000 
 5160 0fbf 01       		.uleb128 0x1
 5161 0fc0 9C       		.byte	0x9c
 5162 0fc1 F30F0000 		.long	0xff3
 5163 0fc5 03       		.uleb128 0x3
 5164 0fc6 66696C65 		.ascii "file\0"
 5164      00
 5165 0fcb 0805     		.word	0x508
 5166 0fcd 2F       		.byte	0x2f
 5167 0fce 9E030000 		.long	0x39e
 5168 0fd2 02       		.uleb128 0x2
 5169 0fd3 91       		.byte	0x91
 5170 0fd4 00       		.sleb128 0
 5171 0fd5 03       		.uleb128 0x3
 5172 0fd6 73697A65 		.ascii "size\0"
 5172      00
 5173 0fdb 0805     		.word	0x508
 5174 0fdd 3A       		.byte	0x3a
 5175 0fde B6000000 		.long	0xb6
 5176 0fe2 02       		.uleb128 0x2
 5177 0fe3 91       		.byte	0x91
 5178 0fe4 08       		.sleb128 8
 5179 0fe5 01       		.uleb128 0x1
 5180 0fe6 6200     		.ascii "b\0"
 5181 0fe8 0A05     		.word	0x50a
 5182 0fea 12       		.byte	0x12
 5183 0feb 33020000 		.long	0x233
 5184 0fef 02       		.uleb128 0x2
 5185 0ff0 91       		.byte	0x91
 5186 0ff1 68       		.sleb128 -24
 5187 0ff2 00       		.byte	0
 5188 0ff3 31       		.uleb128 0x31
 5189 0ff4 79795F6C 		.ascii "yy_load_buffer_state\0"
 5189      6F61645F 
 5189      62756666 
 5189      65725F73 
 5189      74617465 
 5190 1009 01       		.byte	0x1
 5191 100a FA04     		.word	0x4fa
 5192 100c 0D       		.byte	0xd
 5193 100d C9130000 		.quad	.LFB25
 5193      00000000 
 5194 1015 8B000000 		.quad	.LFE25-.LFB25
 5194      00000000 
 5195 101d 01       		.uleb128 0x1
 5196 101e 9C       		.byte	0x9c
 5197 101f 0D       		.uleb128 0xd
 5198 1020 79795F73 		.ascii "yy_switch_to_buffer\0"
 5198      77697463 
 5198      685F746F 
 5198      5F627566 
 5198      66657200 
 5199 1034 DB04     		.word	0x4db
 5200 1036 0A       		.byte	0xa
 5201 1037 D2120000 		.quad	.LFB24
 5201      00000000 
 5202 103f F7000000 		.quad	.LFE24-.LFB24
 5202      00000000 
 5203 1047 01       		.uleb128 0x1
 5204 1048 9C       		.byte	0x9c
 5205 1049 5D100000 		.long	0x105d
 5206 104d 1C       		.uleb128 0x1c
 5207 104e 22000000 		.secrel32	.LASF3
 5208 1052 DB04     		.word	0x4db
 5209 1054 31       		.byte	0x31
 5210 1055 33020000 		.long	0x233
 5211 1059 02       		.uleb128 0x2
 5212 105a 91       		.byte	0x91
 5213 105b 00       		.sleb128 0
 5214 105c 00       		.byte	0
 5215 105d 0D       		.uleb128 0xd
 5216 105e 79797265 		.ascii "yyrestart\0"
 5216      73746172 
 5216      7400
 5217 1068 CA04     		.word	0x4ca
 5218 106a 0A       		.byte	0xa
 5219 106b 24120000 		.quad	.LFB23
 5219      00000000 
 5220 1073 AE000000 		.quad	.LFE23-.LFB23
 5220      00000000 
 5221 107b 01       		.uleb128 0x1
 5222 107c 9C       		.byte	0x9c
 5223 107d 98100000 		.long	0x1098
 5224 1081 03       		.uleb128 0x3
 5225 1082 696E7075 		.ascii "input_file\0"
 5225      745F6669 
 5225      6C6500
 5226 108d CA04     		.word	0x4ca
 5227 108f 1D       		.byte	0x1d
 5228 1090 9E030000 		.long	0x39e
 5229 1094 02       		.uleb128 0x2
 5230 1095 91       		.byte	0x91
 5231 1096 00       		.sleb128 0
 5232 1097 00       		.byte	0
 5233 1098 23       		.uleb128 0x23
 5234 1099 696E7075 		.ascii "input\0"
 5234      7400
 5235 109f 7F04     		.word	0x47f
 5236 10a1 10       		.byte	0x10
 5237 10a2 B6000000 		.long	0xb6
 5238 10a6 DD100000 		.quad	.LFB22
 5238      00000000 
 5239 10ae 47010000 		.quad	.LFE22-.LFB22
 5239      00000000 
 5240 10b6 01       		.uleb128 0x1
 5241 10b7 9C       		.byte	0x9c
 5242 10b8 EE100000 		.long	0x10ee
 5243 10bc 01       		.uleb128 0x1
 5244 10bd 6300     		.ascii "c\0"
 5245 10bf 8304     		.word	0x483
 5246 10c1 06       		.byte	0x6
 5247 10c2 B6000000 		.long	0xb6
 5248 10c6 02       		.uleb128 0x2
 5249 10c7 91       		.byte	0x91
 5250 10c8 68       		.sleb128 -24
 5251 10c9 0C       		.uleb128 0xc
 5252 10ca 49110000 		.quad	.LBB13
 5252      00000000 
 5253 10d2 96000000 		.quad	.LBE13-.LBB13
 5253      00000000 
 5254 10da 01       		.uleb128 0x1
 5255 10db 6F666673 		.ascii "offset\0"
 5255      657400
 5256 10e2 9304     		.word	0x493
 5257 10e4 08       		.byte	0x8
 5258 10e5 B6000000 		.long	0xb6
 5259 10e9 02       		.uleb128 0x2
 5260 10ea 91       		.byte	0x91
 5261 10eb 6C       		.sleb128 -20
 5262 10ec 00       		.byte	0
 5263 10ed 00       		.byte	0
 5264 10ee 1B       		.uleb128 0x1b
 5265 10ef 7979756E 		.ascii "yyunput\0"
 5265      70757400 
 5266 10f7 5404     		.word	0x454
 5267 10f9 11       		.byte	0x11
 5268 10fa 0C0F0000 		.quad	.LFB21
 5268      00000000 
 5269 1102 D1010000 		.quad	.LFE21-.LFB21
 5269      00000000 
 5270 110a 01       		.uleb128 0x1
 5271 110b 9C       		.byte	0x9c
 5272 110c 81110000 		.long	0x1181
 5273 1110 03       		.uleb128 0x3
 5274 1111 6300     		.ascii "c\0"
 5275 1113 5404     		.word	0x454
 5276 1115 1E       		.byte	0x1e
 5277 1116 B6000000 		.long	0xb6
 5278 111a 02       		.uleb128 0x2
 5279 111b 91       		.byte	0x91
 5280 111c 00       		.sleb128 0
 5281 111d 03       		.uleb128 0x3
 5282 111e 79795F62 		.ascii "yy_bp\0"
 5282      7000
 5283 1124 5404     		.word	0x454
 5284 1126 28       		.byte	0x28
 5285 1127 C9000000 		.long	0xc9
 5286 112b 02       		.uleb128 0x2
 5287 112c 91       		.byte	0x91
 5288 112d 08       		.sleb128 8
 5289 112e 06       		.uleb128 0x6
 5290 112f 1C000000 		.secrel32	.LASF4
 5291 1133 5604     		.word	0x456
 5292 1135 08       		.byte	0x8
 5293 1136 C9000000 		.long	0xc9
 5294 113a 02       		.uleb128 0x2
 5295 113b 91       		.byte	0x91
 5296 113c 68       		.sleb128 -24
 5297 113d 0C       		.uleb128 0xc
 5298 113e 5D0F0000 		.quad	.LBB12
 5298      00000000 
 5299 1146 46010000 		.quad	.LBE12-.LBB12
 5299      00000000 
 5300 114e 06       		.uleb128 0x6
 5301 114f 2D000000 		.secrel32	.LASF5
 5302 1153 6004     		.word	0x460
 5303 1155 07       		.byte	0x7
 5304 1156 B6000000 		.long	0xb6
 5305 115a 02       		.uleb128 0x2
 5306 115b 91       		.byte	0x91
 5307 115c 54       		.sleb128 -44
 5308 115d 01       		.uleb128 0x1
 5309 115e 64657374 		.ascii "dest\0"
 5309      00
 5310 1163 6104     		.word	0x461
 5311 1165 09       		.byte	0x9
 5312 1166 C9000000 		.long	0xc9
 5313 116a 02       		.uleb128 0x2
 5314 116b 91       		.byte	0x91
 5315 116c 60       		.sleb128 -32
 5316 116d 01       		.uleb128 0x1
 5317 116e 736F7572 		.ascii "source\0"
 5317      636500
 5318 1175 6304     		.word	0x463
 5319 1177 09       		.byte	0x9
 5320 1178 C9000000 		.long	0xc9
 5321 117c 02       		.uleb128 0x2
 5322 117d 91       		.byte	0x91
 5323 117e 58       		.sleb128 -40
 5324 117f 00       		.byte	0
 5325 1180 00       		.byte	0
 5326 1181 24       		.uleb128 0x24
 5327 1182 79795F74 		.ascii "yy_try_NUL_trans\0"
 5327      72795F4E 
 5327      554C5F74 
 5327      72616E73 
 5327      00
 5328 1193 3B04     		.word	0x43b
 5329 1195 25050000 		.long	0x525
 5330 1199 080E0000 		.quad	.LFB20
 5330      00000000 
 5331 11a1 04010000 		.quad	.LFE20-.LFB20
 5331      00000000 
 5332 11a9 01       		.uleb128 0x1
 5333 11aa 9C       		.byte	0x9c
 5334 11ab F3110000 		.long	0x11f3
 5335 11af 1C       		.uleb128 0x1c
 5336 11b0 00000000 		.secrel32	.LASF6
 5337 11b4 3B04     		.word	0x43b
 5338 11b6 3B       		.byte	0x3b
 5339 11b7 25050000 		.long	0x525
 5340 11bb 02       		.uleb128 0x2
 5341 11bc 91       		.byte	0x91
 5342 11bd 00       		.sleb128 0
 5343 11be 01       		.uleb128 0x1
 5344 11bf 79795F69 		.ascii "yy_is_jam\0"
 5344      735F6A61 
 5344      6D00
 5345 11c9 3D04     		.word	0x43d
 5346 11cb 06       		.byte	0x6
 5347 11cc B6000000 		.long	0xb6
 5348 11d0 02       		.uleb128 0x2
 5349 11d1 91       		.byte	0x91
 5350 11d2 5C       		.sleb128 -36
 5351 11d3 06       		.uleb128 0x6
 5352 11d4 1C000000 		.secrel32	.LASF4
 5353 11d8 3E04     		.word	0x43e
 5354 11da 0C       		.byte	0xc
 5355 11db C9000000 		.long	0xc9
 5356 11df 02       		.uleb128 0x2
 5357 11e0 91       		.byte	0x91
 5358 11e1 60       		.sleb128 -32
 5359 11e2 01       		.uleb128 0x1
 5360 11e3 79795F63 		.ascii "yy_c\0"
 5360      00
 5361 11e8 4004     		.word	0x440
 5362 11ea 0A       		.byte	0xa
 5363 11eb ED040000 		.long	0x4ed
 5364 11ef 02       		.uleb128 0x2
 5365 11f0 91       		.byte	0x91
 5366 11f1 6F       		.sleb128 -17
 5367 11f2 00       		.byte	0
 5368 11f3 24       		.uleb128 0x24
 5369 11f4 79795F67 		.ascii "yy_get_previous_state\0"
 5369      65745F70 
 5369      72657669 
 5369      6F75735F 
 5369      73746174 
 5370 120a 1B04     		.word	0x41b
 5371 120c 25050000 		.long	0x525
 5372 1210 D50C0000 		.quad	.LFB19
 5372      00000000 
 5373 1218 33010000 		.quad	.LFE19-.LFB19
 5373      00000000 
 5374 1220 01       		.uleb128 0x1
 5375 1221 9C       		.byte	0x9c
 5376 1222 67120000 		.long	0x1267
 5377 1226 06       		.uleb128 0x6
 5378 1227 00000000 		.secrel32	.LASF6
 5379 122b 1D04     		.word	0x41d
 5380 122d 10       		.byte	0x10
 5381 122e 25050000 		.long	0x525
 5382 1232 02       		.uleb128 0x2
 5383 1233 91       		.byte	0x91
 5384 1234 6C       		.sleb128 -20
 5385 1235 06       		.uleb128 0x6
 5386 1236 1C000000 		.secrel32	.LASF4
 5387 123a 1E04     		.word	0x41e
 5388 123c 08       		.byte	0x8
 5389 123d C9000000 		.long	0xc9
 5390 1241 02       		.uleb128 0x2
 5391 1242 91       		.byte	0x91
 5392 1243 60       		.sleb128 -32
 5393 1244 0C       		.uleb128 0xc
 5394 1245 F60C0000 		.quad	.LBB11
 5394      00000000 
 5395 124d F3000000 		.quad	.LBE11-.LBB11
 5395      00000000 
 5396 1255 01       		.uleb128 0x1
 5397 1256 79795F63 		.ascii "yy_c\0"
 5397      00
 5398 125b 2404     		.word	0x424
 5399 125d 0B       		.byte	0xb
 5400 125e ED040000 		.long	0x4ed
 5401 1262 02       		.uleb128 0x2
 5402 1263 91       		.byte	0x91
 5403 1264 5F       		.sleb128 -33
 5404 1265 00       		.byte	0
 5405 1266 00       		.byte	0
 5406 1267 23       		.uleb128 0x23
 5407 1268 79795F67 		.ascii "yy_get_next_buffer\0"
 5407      65745F6E 
 5407      6578745F 
 5407      62756666 
 5407      657200
 5408 127b 9103     		.word	0x391
 5409 127d 0C       		.byte	0xc
 5410 127e B6000000 		.long	0xb6
 5411 1282 79060000 		.quad	.LFB18
 5411      00000000 
 5412 128a 5C060000 		.quad	.LFE18-.LFB18
 5412      00000000 
 5413 1292 01       		.uleb128 0x1
 5414 1293 9C       		.byte	0x9c
 5415 1294 F6130000 		.long	0x13f6
 5416 1298 01       		.uleb128 0x1
 5417 1299 64657374 		.ascii "dest\0"
 5417      00
 5418 129e 9303     		.word	0x393
 5419 12a0 0C       		.byte	0xc
 5420 12a1 C9000000 		.long	0xc9
 5421 12a5 02       		.uleb128 0x2
 5422 12a6 91       		.byte	0x91
 5423 12a7 58       		.sleb128 -40
 5424 12a8 01       		.uleb128 0x1
 5425 12a9 736F7572 		.ascii "source\0"
 5425      636500
 5426 12b0 9403     		.word	0x394
 5427 12b2 08       		.byte	0x8
 5428 12b3 C9000000 		.long	0xc9
 5429 12b7 02       		.uleb128 0x2
 5430 12b8 91       		.byte	0x91
 5431 12b9 50       		.sleb128 -48
 5432 12ba 06       		.uleb128 0x6
 5433 12bb 2D000000 		.secrel32	.LASF5
 5434 12bf 9503     		.word	0x395
 5435 12c1 06       		.byte	0x6
 5436 12c2 B6000000 		.long	0xb6
 5437 12c6 03       		.uleb128 0x3
 5438 12c7 91       		.byte	0x91
 5439 12c8 B87F     		.sleb128 -72
 5440 12ca 01       		.uleb128 0x1
 5441 12cb 6900     		.ascii "i\0"
 5442 12cd 9503     		.word	0x395
 5443 12cf 16       		.byte	0x16
 5444 12d0 B6000000 		.long	0xb6
 5445 12d4 02       		.uleb128 0x2
 5446 12d5 91       		.byte	0x91
 5447 12d6 4C       		.sleb128 -52
 5448 12d7 01       		.uleb128 0x1
 5449 12d8 7265745F 		.ascii "ret_val\0"
 5449      76616C00 
 5450 12e0 9603     		.word	0x396
 5451 12e2 06       		.byte	0x6
 5452 12e3 B6000000 		.long	0xb6
 5453 12e7 02       		.uleb128 0x2
 5454 12e8 91       		.byte	0x91
 5455 12e9 48       		.sleb128 -56
 5456 12ea 15       		.uleb128 0x15
 5457 12eb DB070000 		.quad	.LBB6
 5457      00000000 
 5458 12f3 2E030000 		.quad	.LBE6-.LBB6
 5458      00000000 
 5459 12fb D3130000 		.long	0x13d3
 5460 12ff 01       		.uleb128 0x1
 5461 1300 6E756D5F 		.ascii "num_to_read\0"
 5461      746F5F72 
 5461      65616400 
 5462 130c BF03     		.word	0x3bf
 5463 130e 08       		.byte	0x8
 5464 130f B6000000 		.long	0xb6
 5465 1313 02       		.uleb128 0x2
 5466 1314 91       		.byte	0x91
 5467 1315 44       		.sleb128 -60
 5468 1316 15       		.uleb128 0x15
 5469 1317 04080000 		.quad	.LBB7
 5469      00000000 
 5470 131f 0D010000 		.quad	.LBE7-.LBB7
 5470      00000000 
 5471 1327 7A130000 		.long	0x137a
 5472 132b 01       		.uleb128 0x1
 5473 132c 6200     		.ascii "b\0"
 5474 132e C603     		.word	0x3c6
 5475 1330 14       		.byte	0x14
 5476 1331 33020000 		.long	0x233
 5477 1335 03       		.uleb128 0x3
 5478 1336 91       		.byte	0x91
 5479 1337 B07F     		.sleb128 -80
 5480 1339 01       		.uleb128 0x1
 5481 133a 79795F63 		.ascii "yy_c_buf_p_offset\0"
 5481      5F627566 
 5481      5F705F6F 
 5481      66667365 
 5481      7400
 5482 134c C803     		.word	0x3c8
 5483 134e 08       		.byte	0x8
 5484 134f B6000000 		.long	0xb6
 5485 1353 03       		.uleb128 0x3
 5486 1354 91       		.byte	0x91
 5487 1355 AC7F     		.sleb128 -84
 5488 1357 0C       		.uleb128 0xc
 5489 1358 40080000 		.quad	.LBB8
 5489      00000000 
 5490 1360 6C000000 		.quad	.LBE8-.LBB8
 5490      00000000 
 5491 1368 06       		.uleb128 0x6
 5492 1369 3C000000 		.secrel32	.LASF7
 5493 136d CD03     		.word	0x3cd
 5494 136f 09       		.byte	0x9
 5495 1370 B6000000 		.long	0xb6
 5496 1374 03       		.uleb128 0x3
 5497 1375 91       		.byte	0x91
 5498 1376 A87F     		.sleb128 -88
 5499 1378 00       		.byte	0
 5500 1379 00       		.byte	0
 5501 137a 15       		.uleb128 0x15
 5502 137b 4E090000 		.quad	.LBB9
 5502      00000000 
 5503 1383 DC000000 		.quad	.LBE9-.LBB9
 5503      00000000 
 5504 138b AB130000 		.long	0x13ab
 5505 138f 01       		.uleb128 0x1
 5506 1390 6300     		.ascii "c\0"
 5507 1392 EC03     		.word	0x3ec
 5508 1394 03       		.byte	0x3
 5509 1395 B6000000 		.long	0xb6
 5510 1399 02       		.uleb128 0x2
 5511 139a 91       		.byte	0x91
 5512 139b 40       		.sleb128 -64
 5513 139c 01       		.uleb128 0x1
 5514 139d 6E00     		.ascii "n\0"
 5515 139f EC03     		.word	0x3ec
 5516 13a1 03       		.byte	0x3
 5517 13a2 B6000000 		.long	0xb6
 5518 13a6 03       		.uleb128 0x3
 5519 13a7 91       		.byte	0x91
 5520 13a8 BC7F     		.sleb128 -68
 5521 13aa 00       		.byte	0
 5522 13ab 0A       		.uleb128 0xa
 5523 13ac 380A0000 		.quad	.LVL2
 5523      00000000 
 5524 13b4 87080000 		.long	0x887
 5525 13b8 0A       		.uleb128 0xa
 5526 13b9 490A0000 		.quad	.LVL3
 5526      00000000 
 5527 13c1 87080000 		.long	0x887
 5528 13c5 0A       		.uleb128 0xa
 5529 13c6 680A0000 		.quad	.LVL4
 5529      00000000 
 5530 13ce 87080000 		.long	0x887
 5531 13d2 00       		.byte	0
 5532 13d3 0C       		.uleb128 0xc
 5533 13d4 8F0B0000 		.quad	.LBB10
 5533      00000000 
 5534 13dc AF000000 		.quad	.LBE10-.LBB10
 5534      00000000 
 5535 13e4 06       		.uleb128 0x6
 5536 13e5 3C000000 		.secrel32	.LASF7
 5537 13e9 0704     		.word	0x407
 5538 13eb 07       		.byte	0x7
 5539 13ec B6000000 		.long	0xb6
 5540 13f0 03       		.uleb128 0x3
 5541 13f1 91       		.byte	0x91
 5542 13f2 A47F     		.sleb128 -92
 5543 13f4 00       		.byte	0
 5544 13f5 00       		.byte	0
 5545 13f6 32       		.uleb128 0x32
 5546 13f7 79796C65 		.ascii "yylex\0"
 5546      7800
 5547 13fd 01       		.byte	0x1
 5548 13fe 8802     		.word	0x288
 5549 1400 01       		.byte	0x1
 5550 1401 B6000000 		.long	0xb6
 5551 1405 00000000 		.quad	.LFB17
 5551      00000000 
 5552 140d 79060000 		.quad	.LFE17-.LFB17
 5552      00000000 
 5553 1415 01       		.uleb128 0x1
 5554 1416 9C       		.byte	0x9c
 5555 1417 06       		.uleb128 0x6
 5556 1418 00000000 		.secrel32	.LASF6
 5557 141c 8A02     		.word	0x28a
 5558 141e 10       		.byte	0x10
 5559 141f 25050000 		.long	0x525
 5560 1423 02       		.uleb128 0x2
 5561 1424 91       		.byte	0x91
 5562 1425 5C       		.sleb128 -36
 5563 1426 06       		.uleb128 0x6
 5564 1427 1C000000 		.secrel32	.LASF4
 5565 142b 8B02     		.word	0x28b
 5566 142d 08       		.byte	0x8
 5567 142e C9000000 		.long	0xc9
 5568 1432 02       		.uleb128 0x2
 5569 1433 91       		.byte	0x91
 5570 1434 50       		.sleb128 -48
 5571 1435 01       		.uleb128 0x1
 5572 1436 79795F62 		.ascii "yy_bp\0"
 5572      7000
 5573 143c 8B02     		.word	0x28b
 5574 143e 10       		.byte	0x10
 5575 143f C9000000 		.long	0xc9
 5576 1443 02       		.uleb128 0x2
 5577 1444 91       		.byte	0x91
 5578 1445 48       		.sleb128 -56
 5579 1446 01       		.uleb128 0x1
 5580 1447 79795F61 		.ascii "yy_act\0"
 5580      637400
 5581 144e 8C02     		.word	0x28c
 5582 1450 06       		.byte	0x6
 5583 1451 B6000000 		.long	0xb6
 5584 1455 02       		.uleb128 0x2
 5585 1456 91       		.byte	0x91
 5586 1457 44       		.sleb128 -60
 5587 1458 1D       		.uleb128 0x1d
 5588 1459 79795F6D 		.ascii "yy_match\0"
 5588      61746368 
 5588      00
 5589 1462 BB02     		.word	0x2bb
 5590 1464 02010000 		.quad	.L8
 5590      00000000 
 5591 146c 1D       		.uleb128 0x1d
 5592 146d 79795F66 		.ascii "yy_find_action\0"
 5592      696E645F 
 5592      61637469 
 5592      6F6E00
 5593 147c CF02     		.word	0x2cf
 5594 147e 07020000 		.quad	.L13
 5594      00000000 
 5595 1486 1D       		.uleb128 0x1d
 5596 1487 646F5F61 		.ascii "do_action\0"
 5596      6374696F 
 5596      6E00
 5597 1491 DA02     		.word	0x2da
 5598 1493 89020000 		.quad	.L15
 5598      00000000 
 5599 149b 15       		.uleb128 0x15
 5600 149c 02010000 		.quad	.LBB2
 5600      00000000 
 5601 14a4 E6000000 		.quad	.LBE2-.LBB2
 5601      00000000 
 5602 14ac C1140000 		.long	0x14c1
 5603 14b0 01       		.uleb128 0x1
 5604 14b1 79795F63 		.ascii "yy_c\0"
 5604      00
 5605 14b6 BE02     		.word	0x2be
 5606 14b8 0C       		.byte	0xc
 5607 14b9 ED040000 		.long	0x4ed
 5608 14bd 02       		.uleb128 0x2
 5609 14be 91       		.byte	0x91
 5610 14bf 43       		.sleb128 -61
 5611 14c0 00       		.byte	0
 5612 14c1 33       		.uleb128 0x33
 5613 14c2 0C000000 		.secrel32	.LLRL0
 5614 14c6 1D150000 		.long	0x151d
 5615 14ca 01       		.uleb128 0x1
 5616 14cb 79795F61 		.ascii "yy_amount_of_matched_text\0"
 5616      6D6F756E 
 5616      745F6F66 
 5616      5F6D6174 
 5616      63686564 
 5617 14e5 0B03     		.word	0x30b
 5618 14e7 07       		.byte	0x7
 5619 14e8 B6000000 		.long	0xb6
 5620 14ec 03       		.uleb128 0x3
 5621 14ed 91       		.byte	0x91
 5622 14ee BC7F     		.sleb128 -68
 5623 14f0 0C       		.uleb128 0xc
 5624 14f1 D2040000 		.quad	.LBB4
 5624      00000000 
 5625 14f9 74000000 		.quad	.LBE4-.LBB4
 5625      00000000 
 5626 1501 01       		.uleb128 0x1
 5627 1502 79795F6E 		.ascii "yy_next_state\0"
 5627      6578745F 
 5627      73746174 
 5627      6500
 5628 1510 2A03     		.word	0x32a
 5629 1512 12       		.byte	0x12
 5630 1513 25050000 		.long	0x525
 5631 1517 03       		.uleb128 0x3
 5632 1518 91       		.byte	0x91
 5633 1519 B87F     		.sleb128 -72
 5634 151b 00       		.byte	0
 5635 151c 00       		.byte	0
 5636 151d 0A       		.uleb128 0xa
 5637 151e 51000000 		.quad	.LVL0
 5637      00000000 
 5638 1526 60090000 		.long	0x960
 5639 152a 0A       		.uleb128 0xa
 5640 152b 72000000 		.quad	.LVL1
 5640      00000000 
 5641 1533 60090000 		.long	0x960
 5642 1537 00       		.byte	0
 5643 1538 00       		.byte	0
 5644              		.section	.debug_abbrev,"dr"
 5645              	.Ldebug_abbrev0:
 5646 0000 01       		.uleb128 0x1
 5647 0001 34       		.uleb128 0x34
 5648 0002 00       		.byte	0
 5649 0003 03       		.uleb128 0x3
 5650 0004 08       		.uleb128 0x8
 5651 0005 3A       		.uleb128 0x3a
 5652 0006 21       		.uleb128 0x21
 5653 0007 01       		.sleb128 1
 5654 0008 3B       		.uleb128 0x3b
 5655 0009 05       		.uleb128 0x5
 5656 000a 39       		.uleb128 0x39
 5657 000b 0B       		.uleb128 0xb
 5658 000c 49       		.uleb128 0x49
 5659 000d 13       		.uleb128 0x13
 5660 000e 02       		.uleb128 0x2
 5661 000f 18       		.uleb128 0x18
 5662 0010 00       		.byte	0
 5663 0011 00       		.byte	0
 5664 0012 02       		.uleb128 0x2
 5665 0013 05       		.uleb128 0x5
 5666 0014 00       		.byte	0
 5667 0015 49       		.uleb128 0x49
 5668 0016 13       		.uleb128 0x13
 5669 0017 00       		.byte	0
 5670 0018 00       		.byte	0
 5671 0019 03       		.uleb128 0x3
 5672 001a 05       		.uleb128 0x5
 5673 001b 00       		.byte	0
 5674 001c 03       		.uleb128 0x3
 5675 001d 08       		.uleb128 0x8
 5676 001e 3A       		.uleb128 0x3a
 5677 001f 21       		.uleb128 0x21
 5678 0020 01       		.sleb128 1
 5679 0021 3B       		.uleb128 0x3b
 5680 0022 05       		.uleb128 0x5
 5681 0023 39       		.uleb128 0x39
 5682 0024 0B       		.uleb128 0xb
 5683 0025 49       		.uleb128 0x49
 5684 0026 13       		.uleb128 0x13
 5685 0027 02       		.uleb128 0x2
 5686 0028 18       		.uleb128 0x18
 5687 0029 00       		.byte	0
 5688 002a 00       		.byte	0
 5689 002b 04       		.uleb128 0x4
 5690 002c 0D       		.uleb128 0xd
 5691 002d 00       		.byte	0
 5692 002e 03       		.uleb128 0x3
 5693 002f 08       		.uleb128 0x8
 5694 0030 3A       		.uleb128 0x3a
 5695 0031 0B       		.uleb128 0xb
 5696 0032 3B       		.uleb128 0x3b
 5697 0033 0B       		.uleb128 0xb
 5698 0034 39       		.uleb128 0x39
 5699 0035 0B       		.uleb128 0xb
 5700 0036 49       		.uleb128 0x49
 5701 0037 13       		.uleb128 0x13
 5702 0038 38       		.uleb128 0x38
 5703 0039 0B       		.uleb128 0xb
 5704 003a 00       		.byte	0
 5705 003b 00       		.byte	0
 5706 003c 05       		.uleb128 0x5
 5707 003d 24       		.uleb128 0x24
 5708 003e 00       		.byte	0
 5709 003f 0B       		.uleb128 0xb
 5710 0040 0B       		.uleb128 0xb
 5711 0041 3E       		.uleb128 0x3e
 5712 0042 0B       		.uleb128 0xb
 5713 0043 03       		.uleb128 0x3
 5714 0044 08       		.uleb128 0x8
 5715 0045 00       		.byte	0
 5716 0046 00       		.byte	0
 5717 0047 06       		.uleb128 0x6
 5718 0048 34       		.uleb128 0x34
 5719 0049 00       		.byte	0
 5720 004a 03       		.uleb128 0x3
 5721 004b 0E       		.uleb128 0xe
 5722 004c 3A       		.uleb128 0x3a
 5723 004d 21       		.uleb128 0x21
 5724 004e 01       		.sleb128 1
 5725 004f 3B       		.uleb128 0x3b
 5726 0050 05       		.uleb128 0x5
 5727 0051 39       		.uleb128 0x39
 5728 0052 0B       		.uleb128 0xb
 5729 0053 49       		.uleb128 0x49
 5730 0054 13       		.uleb128 0x13
 5731 0055 02       		.uleb128 0x2
 5732 0056 18       		.uleb128 0x18
 5733 0057 00       		.byte	0
 5734 0058 00       		.byte	0
 5735 0059 07       		.uleb128 0x7
 5736 005a 26       		.uleb128 0x26
 5737 005b 00       		.byte	0
 5738 005c 49       		.uleb128 0x49
 5739 005d 13       		.uleb128 0x13
 5740 005e 00       		.byte	0
 5741 005f 00       		.byte	0
 5742 0060 08       		.uleb128 0x8
 5743 0061 16       		.uleb128 0x16
 5744 0062 00       		.byte	0
 5745 0063 03       		.uleb128 0x3
 5746 0064 08       		.uleb128 0x8
 5747 0065 3A       		.uleb128 0x3a
 5748 0066 0B       		.uleb128 0xb
 5749 0067 3B       		.uleb128 0x3b
 5750 0068 0B       		.uleb128 0xb
 5751 0069 39       		.uleb128 0x39
 5752 006a 0B       		.uleb128 0xb
 5753 006b 49       		.uleb128 0x49
 5754 006c 13       		.uleb128 0x13
 5755 006d 00       		.byte	0
 5756 006e 00       		.byte	0
 5757 006f 09       		.uleb128 0x9
 5758 0070 2E       		.uleb128 0x2e
 5759 0071 01       		.byte	0x1
 5760 0072 3F       		.uleb128 0x3f
 5761 0073 19       		.uleb128 0x19
 5762 0074 03       		.uleb128 0x3
 5763 0075 08       		.uleb128 0x8
 5764 0076 3A       		.uleb128 0x3a
 5765 0077 0B       		.uleb128 0xb
 5766 0078 3B       		.uleb128 0x3b
 5767 0079 05       		.uleb128 0x5
 5768 007a 39       		.uleb128 0x39
 5769 007b 0B       		.uleb128 0xb
 5770 007c 27       		.uleb128 0x27
 5771 007d 19       		.uleb128 0x19
 5772 007e 49       		.uleb128 0x49
 5773 007f 13       		.uleb128 0x13
 5774 0080 3C       		.uleb128 0x3c
 5775 0081 19       		.uleb128 0x19
 5776 0082 01       		.uleb128 0x1
 5777 0083 13       		.uleb128 0x13
 5778 0084 00       		.byte	0
 5779 0085 00       		.byte	0
 5780 0086 0A       		.uleb128 0xa
 5781 0087 48       		.uleb128 0x48
 5782 0088 00       		.byte	0
 5783 0089 7D       		.uleb128 0x7d
 5784 008a 01       		.uleb128 0x1
 5785 008b 7F       		.uleb128 0x7f
 5786 008c 13       		.uleb128 0x13
 5787 008d 00       		.byte	0
 5788 008e 00       		.byte	0
 5789 008f 0B       		.uleb128 0xb
 5790 0090 0F       		.uleb128 0xf
 5791 0091 00       		.byte	0
 5792 0092 0B       		.uleb128 0xb
 5793 0093 21       		.uleb128 0x21
 5794 0094 08       		.sleb128 8
 5795 0095 49       		.uleb128 0x49
 5796 0096 13       		.uleb128 0x13
 5797 0097 00       		.byte	0
 5798 0098 00       		.byte	0
 5799 0099 0C       		.uleb128 0xc
 5800 009a 0B       		.uleb128 0xb
 5801 009b 01       		.byte	0x1
 5802 009c 11       		.uleb128 0x11
 5803 009d 01       		.uleb128 0x1
 5804 009e 12       		.uleb128 0x12
 5805 009f 07       		.uleb128 0x7
 5806 00a0 00       		.byte	0
 5807 00a1 00       		.byte	0
 5808 00a2 0D       		.uleb128 0xd
 5809 00a3 2E       		.uleb128 0x2e
 5810 00a4 01       		.byte	0x1
 5811 00a5 3F       		.uleb128 0x3f
 5812 00a6 19       		.uleb128 0x19
 5813 00a7 03       		.uleb128 0x3
 5814 00a8 08       		.uleb128 0x8
 5815 00a9 3A       		.uleb128 0x3a
 5816 00aa 21       		.uleb128 0x21
 5817 00ab 01       		.sleb128 1
 5818 00ac 3B       		.uleb128 0x3b
 5819 00ad 05       		.uleb128 0x5
 5820 00ae 39       		.uleb128 0x39
 5821 00af 0B       		.uleb128 0xb
 5822 00b0 27       		.uleb128 0x27
 5823 00b1 19       		.uleb128 0x19
 5824 00b2 11       		.uleb128 0x11
 5825 00b3 01       		.uleb128 0x1
 5826 00b4 12       		.uleb128 0x12
 5827 00b5 07       		.uleb128 0x7
 5828 00b6 40       		.uleb128 0x40
 5829 00b7 18       		.uleb128 0x18
 5830 00b8 7C       		.uleb128 0x7c
 5831 00b9 19       		.uleb128 0x19
 5832 00ba 01       		.uleb128 0x1
 5833 00bb 13       		.uleb128 0x13
 5834 00bc 00       		.byte	0
 5835 00bd 00       		.byte	0
 5836 00be 0E       		.uleb128 0xe
 5837 00bf 2E       		.uleb128 0x2e
 5838 00c0 01       		.byte	0x1
 5839 00c1 3F       		.uleb128 0x3f
 5840 00c2 19       		.uleb128 0x19
 5841 00c3 03       		.uleb128 0x3
 5842 00c4 08       		.uleb128 0x8
 5843 00c5 3A       		.uleb128 0x3a
 5844 00c6 21       		.uleb128 0x21
 5845 00c7 01       		.sleb128 1
 5846 00c8 3B       		.uleb128 0x3b
 5847 00c9 05       		.uleb128 0x5
 5848 00ca 39       		.uleb128 0x39
 5849 00cb 0B       		.uleb128 0xb
 5850 00cc 27       		.uleb128 0x27
 5851 00cd 19       		.uleb128 0x19
 5852 00ce 49       		.uleb128 0x49
 5853 00cf 13       		.uleb128 0x13
 5854 00d0 11       		.uleb128 0x11
 5855 00d1 01       		.uleb128 0x1
 5856 00d2 12       		.uleb128 0x12
 5857 00d3 07       		.uleb128 0x7
 5858 00d4 40       		.uleb128 0x40
 5859 00d5 18       		.uleb128 0x18
 5860 00d6 7C       		.uleb128 0x7c
 5861 00d7 19       		.uleb128 0x19
 5862 00d8 01       		.uleb128 0x1
 5863 00d9 13       		.uleb128 0x13
 5864 00da 00       		.byte	0
 5865 00db 00       		.byte	0
 5866 00dc 0F       		.uleb128 0xf
 5867 00dd 2E       		.uleb128 0x2e
 5868 00de 00       		.byte	0
 5869 00df 3F       		.uleb128 0x3f
 5870 00e0 19       		.uleb128 0x19
 5871 00e1 03       		.uleb128 0x3
 5872 00e2 08       		.uleb128 0x8
 5873 00e3 3A       		.uleb128 0x3a
 5874 00e4 21       		.uleb128 0x21
 5875 00e5 01       		.sleb128 1
 5876 00e6 3B       		.uleb128 0x3b
 5877 00e7 05       		.uleb128 0x5
 5878 00e8 39       		.uleb128 0x39
 5879 00e9 0B       		.uleb128 0xb
 5880 00ea 27       		.uleb128 0x27
 5881 00eb 19       		.uleb128 0x19
 5882 00ec 49       		.uleb128 0x49
 5883 00ed 13       		.uleb128 0x13
 5884 00ee 11       		.uleb128 0x11
 5885 00ef 01       		.uleb128 0x1
 5886 00f0 12       		.uleb128 0x12
 5887 00f1 07       		.uleb128 0x7
 5888 00f2 40       		.uleb128 0x40
 5889 00f3 18       		.uleb128 0x18
 5890 00f4 7A       		.uleb128 0x7a
 5891 00f5 19       		.uleb128 0x19
 5892 00f6 00       		.byte	0
 5893 00f7 00       		.byte	0
 5894 00f8 10       		.uleb128 0x10
 5895 00f9 34       		.uleb128 0x34
 5896 00fa 00       		.byte	0
 5897 00fb 03       		.uleb128 0x3
 5898 00fc 08       		.uleb128 0x8
 5899 00fd 3A       		.uleb128 0x3a
 5900 00fe 0B       		.uleb128 0xb
 5901 00ff 3B       		.uleb128 0x3b
 5902 0100 0B       		.uleb128 0xb
 5903 0101 39       		.uleb128 0x39
 5904 0102 0B       		.uleb128 0xb
 5905 0103 49       		.uleb128 0x49
 5906 0104 13       		.uleb128 0x13
 5907 0105 3F       		.uleb128 0x3f
 5908 0106 19       		.uleb128 0x19
 5909 0107 3C       		.uleb128 0x3c
 5910 0108 19       		.uleb128 0x19
 5911 0109 00       		.byte	0
 5912 010a 00       		.byte	0
 5913 010b 11       		.uleb128 0x11
 5914 010c 34       		.uleb128 0x34
 5915 010d 00       		.byte	0
 5916 010e 47       		.uleb128 0x47
 5917 010f 13       		.uleb128 0x13
 5918 0110 3B       		.uleb128 0x3b
 5919 0111 05       		.uleb128 0x5
 5920 0112 39       		.uleb128 0x39
 5921 0113 0B       		.uleb128 0xb
 5922 0114 02       		.uleb128 0x2
 5923 0115 18       		.uleb128 0x18
 5924 0116 00       		.byte	0
 5925 0117 00       		.byte	0
 5926 0118 12       		.uleb128 0x12
 5927 0119 01       		.uleb128 0x1
 5928 011a 01       		.byte	0x1
 5929 011b 49       		.uleb128 0x49
 5930 011c 13       		.uleb128 0x13
 5931 011d 01       		.uleb128 0x1
 5932 011e 13       		.uleb128 0x13
 5933 011f 00       		.byte	0
 5934 0120 00       		.byte	0
 5935 0121 13       		.uleb128 0x13
 5936 0122 21       		.uleb128 0x21
 5937 0123 00       		.byte	0
 5938 0124 49       		.uleb128 0x49
 5939 0125 13       		.uleb128 0x13
 5940 0126 2F       		.uleb128 0x2f
 5941 0127 0B       		.uleb128 0xb
 5942 0128 00       		.byte	0
 5943 0129 00       		.byte	0
 5944 012a 14       		.uleb128 0x14
 5945 012b 2E       		.uleb128 0x2e
 5946 012c 01       		.byte	0x1
 5947 012d 3F       		.uleb128 0x3f
 5948 012e 19       		.uleb128 0x19
 5949 012f 03       		.uleb128 0x3
 5950 0130 08       		.uleb128 0x8
 5951 0131 3A       		.uleb128 0x3a
 5952 0132 21       		.uleb128 0x21
 5953 0133 01       		.sleb128 1
 5954 0134 3B       		.uleb128 0x3b
 5955 0135 05       		.uleb128 0x5
 5956 0136 39       		.uleb128 0x39
 5957 0137 21       		.uleb128 0x21
 5958 0138 06       		.sleb128 6
 5959 0139 27       		.uleb128 0x27
 5960 013a 19       		.uleb128 0x19
 5961 013b 11       		.uleb128 0x11
 5962 013c 01       		.uleb128 0x1
 5963 013d 12       		.uleb128 0x12
 5964 013e 07       		.uleb128 0x7
 5965 013f 40       		.uleb128 0x40
 5966 0140 18       		.uleb128 0x18
 5967 0141 7A       		.uleb128 0x7a
 5968 0142 19       		.uleb128 0x19
 5969 0143 01       		.uleb128 0x1
 5970 0144 13       		.uleb128 0x13
 5971 0145 00       		.byte	0
 5972 0146 00       		.byte	0
 5973 0147 15       		.uleb128 0x15
 5974 0148 0B       		.uleb128 0xb
 5975 0149 01       		.byte	0x1
 5976 014a 11       		.uleb128 0x11
 5977 014b 01       		.uleb128 0x1
 5978 014c 12       		.uleb128 0x12
 5979 014d 07       		.uleb128 0x7
 5980 014e 01       		.uleb128 0x1
 5981 014f 13       		.uleb128 0x13
 5982 0150 00       		.byte	0
 5983 0151 00       		.byte	0
 5984 0152 16       		.uleb128 0x16
 5985 0153 34       		.uleb128 0x34
 5986 0154 00       		.byte	0
 5987 0155 03       		.uleb128 0x3
 5988 0156 08       		.uleb128 0x8
 5989 0157 3A       		.uleb128 0x3a
 5990 0158 21       		.uleb128 0x21
 5991 0159 01       		.sleb128 1
 5992 015a 3B       		.uleb128 0x3b
 5993 015b 0B       		.uleb128 0xb
 5994 015c 39       		.uleb128 0x39
 5995 015d 0B       		.uleb128 0xb
 5996 015e 49       		.uleb128 0x49
 5997 015f 13       		.uleb128 0x13
 5998 0160 02       		.uleb128 0x2
 5999 0161 18       		.uleb128 0x18
 6000 0162 00       		.byte	0
 6001 0163 00       		.byte	0
 6002 0164 17       		.uleb128 0x17
 6003 0165 34       		.uleb128 0x34
 6004 0166 00       		.byte	0
 6005 0167 03       		.uleb128 0x3
 6006 0168 08       		.uleb128 0x8
 6007 0169 3A       		.uleb128 0x3a
 6008 016a 21       		.uleb128 0x21
 6009 016b 01       		.sleb128 1
 6010 016c 3B       		.uleb128 0x3b
 6011 016d 05       		.uleb128 0x5
 6012 016e 39       		.uleb128 0x39
 6013 016f 0B       		.uleb128 0xb
 6014 0170 49       		.uleb128 0x49
 6015 0171 13       		.uleb128 0x13
 6016 0172 3F       		.uleb128 0x3f
 6017 0173 19       		.uleb128 0x19
 6018 0174 3C       		.uleb128 0x3c
 6019 0175 19       		.uleb128 0x19
 6020 0176 00       		.byte	0
 6021 0177 00       		.byte	0
 6022 0178 18       		.uleb128 0x18
 6023 0179 2E       		.uleb128 0x2e
 6024 017a 01       		.byte	0x1
 6025 017b 3F       		.uleb128 0x3f
 6026 017c 19       		.uleb128 0x19
 6027 017d 03       		.uleb128 0x3
 6028 017e 08       		.uleb128 0x8
 6029 017f 3A       		.uleb128 0x3a
 6030 0180 21       		.uleb128 0x21
 6031 0181 03       		.sleb128 3
 6032 0182 3B       		.uleb128 0x3b
 6033 0183 05       		.uleb128 0x5
 6034 0184 39       		.uleb128 0x39
 6035 0185 21       		.uleb128 0x21
 6036 0186 05       		.sleb128 5
 6037 0187 6E       		.uleb128 0x6e
 6038 0188 08       		.uleb128 0x8
 6039 0189 27       		.uleb128 0x27
 6040 018a 19       		.uleb128 0x19
 6041 018b 49       		.uleb128 0x49
 6042 018c 13       		.uleb128 0x13
 6043 018d 3C       		.uleb128 0x3c
 6044 018e 19       		.uleb128 0x19
 6045 018f 01       		.uleb128 0x1
 6046 0190 13       		.uleb128 0x13
 6047 0191 00       		.byte	0
 6048 0192 00       		.byte	0
 6049 0193 19       		.uleb128 0x19
 6050 0194 18       		.uleb128 0x18
 6051 0195 00       		.byte	0
 6052 0196 00       		.byte	0
 6053 0197 00       		.byte	0
 6054 0198 1A       		.uleb128 0x1a
 6055 0199 2E       		.uleb128 0x2e
 6056 019a 01       		.byte	0x1
 6057 019b 3F       		.uleb128 0x3f
 6058 019c 19       		.uleb128 0x19
 6059 019d 03       		.uleb128 0x3
 6060 019e 08       		.uleb128 0x8
 6061 019f 3A       		.uleb128 0x3a
 6062 01a0 0B       		.uleb128 0xb
 6063 01a1 3B       		.uleb128 0x3b
 6064 01a2 0B       		.uleb128 0xb
 6065 01a3 39       		.uleb128 0x39
 6066 01a4 0B       		.uleb128 0xb
 6067 01a5 27       		.uleb128 0x27
 6068 01a6 19       		.uleb128 0x19
 6069 01a7 49       		.uleb128 0x49
 6070 01a8 13       		.uleb128 0x13
 6071 01a9 3C       		.uleb128 0x3c
 6072 01aa 19       		.uleb128 0x19
 6073 01ab 01       		.uleb128 0x1
 6074 01ac 13       		.uleb128 0x13
 6075 01ad 00       		.byte	0
 6076 01ae 00       		.byte	0
 6077 01af 1B       		.uleb128 0x1b
 6078 01b0 2E       		.uleb128 0x2e
 6079 01b1 01       		.byte	0x1
 6080 01b2 03       		.uleb128 0x3
 6081 01b3 08       		.uleb128 0x8
 6082 01b4 3A       		.uleb128 0x3a
 6083 01b5 21       		.uleb128 0x21
 6084 01b6 01       		.sleb128 1
 6085 01b7 3B       		.uleb128 0x3b
 6086 01b8 05       		.uleb128 0x5
 6087 01b9 39       		.uleb128 0x39
 6088 01ba 0B       		.uleb128 0xb
 6089 01bb 27       		.uleb128 0x27
 6090 01bc 19       		.uleb128 0x19
 6091 01bd 11       		.uleb128 0x11
 6092 01be 01       		.uleb128 0x1
 6093 01bf 12       		.uleb128 0x12
 6094 01c0 07       		.uleb128 0x7
 6095 01c1 40       		.uleb128 0x40
 6096 01c2 18       		.uleb128 0x18
 6097 01c3 7C       		.uleb128 0x7c
 6098 01c4 19       		.uleb128 0x19
 6099 01c5 01       		.uleb128 0x1
 6100 01c6 13       		.uleb128 0x13
 6101 01c7 00       		.byte	0
 6102 01c8 00       		.byte	0
 6103 01c9 1C       		.uleb128 0x1c
 6104 01ca 05       		.uleb128 0x5
 6105 01cb 00       		.byte	0
 6106 01cc 03       		.uleb128 0x3
 6107 01cd 0E       		.uleb128 0xe
 6108 01ce 3A       		.uleb128 0x3a
 6109 01cf 21       		.uleb128 0x21
 6110 01d0 01       		.sleb128 1
 6111 01d1 3B       		.uleb128 0x3b
 6112 01d2 05       		.uleb128 0x5
 6113 01d3 39       		.uleb128 0x39
 6114 01d4 0B       		.uleb128 0xb
 6115 01d5 49       		.uleb128 0x49
 6116 01d6 13       		.uleb128 0x13
 6117 01d7 02       		.uleb128 0x2
 6118 01d8 18       		.uleb128 0x18
 6119 01d9 00       		.byte	0
 6120 01da 00       		.byte	0
 6121 01db 1D       		.uleb128 0x1d
 6122 01dc 0A       		.uleb128 0xa
 6123 01dd 00       		.byte	0
 6124 01de 03       		.uleb128 0x3
 6125 01df 08       		.uleb128 0x8
 6126 01e0 3A       		.uleb128 0x3a
 6127 01e1 21       		.uleb128 0x21
 6128 01e2 01       		.sleb128 1
 6129 01e3 3B       		.uleb128 0x3b
 6130 01e4 05       		.uleb128 0x5
 6131 01e5 39       		.uleb128 0x39
 6132 01e6 21       		.uleb128 0x21
 6133 01e7 01       		.sleb128 1
 6134 01e8 11       		.uleb128 0x11
 6135 01e9 01       		.uleb128 0x1
 6136 01ea 00       		.byte	0
 6137 01eb 00       		.byte	0
 6138 01ec 1E       		.uleb128 0x1e
 6139 01ed 13       		.uleb128 0x13
 6140 01ee 01       		.byte	0x1
 6141 01ef 03       		.uleb128 0x3
 6142 01f0 08       		.uleb128 0x8
 6143 01f1 0B       		.uleb128 0xb
 6144 01f2 0B       		.uleb128 0xb
 6145 01f3 3A       		.uleb128 0x3a
 6146 01f4 0B       		.uleb128 0xb
 6147 01f5 3B       		.uleb128 0x3b
 6148 01f6 0B       		.uleb128 0xb
 6149 01f7 39       		.uleb128 0x39
 6150 01f8 0B       		.uleb128 0xb
 6151 01f9 01       		.uleb128 0x1
 6152 01fa 13       		.uleb128 0x13
 6153 01fb 00       		.byte	0
 6154 01fc 00       		.byte	0
 6155 01fd 1F       		.uleb128 0x1f
 6156 01fe 37       		.uleb128 0x37
 6157 01ff 00       		.byte	0
 6158 0200 49       		.uleb128 0x49
 6159 0201 13       		.uleb128 0x13
 6160 0202 00       		.byte	0
 6161 0203 00       		.byte	0
 6162 0204 20       		.uleb128 0x20
 6163 0205 16       		.uleb128 0x16
 6164 0206 00       		.byte	0
 6165 0207 03       		.uleb128 0x3
 6166 0208 08       		.uleb128 0x8
 6167 0209 3A       		.uleb128 0x3a
 6168 020a 21       		.uleb128 0x21
 6169 020b 01       		.sleb128 1
 6170 020c 3B       		.uleb128 0x3b
 6171 020d 05       		.uleb128 0x5
 6172 020e 39       		.uleb128 0x39
 6173 020f 0B       		.uleb128 0xb
 6174 0210 49       		.uleb128 0x49
 6175 0211 13       		.uleb128 0x13
 6176 0212 00       		.byte	0
 6177 0213 00       		.byte	0
 6178 0214 21       		.uleb128 0x21
 6179 0215 34       		.uleb128 0x34
 6180 0216 00       		.byte	0
 6181 0217 47       		.uleb128 0x47
 6182 0218 13       		.uleb128 0x13
 6183 0219 3A       		.uleb128 0x3a
 6184 021a 21       		.uleb128 0x21
 6185 021b 02       		.sleb128 2
 6186 021c 3B       		.uleb128 0x3b
 6187 021d 21       		.uleb128 0x21
 6188 021e 06       		.sleb128 6
 6189 021f 39       		.uleb128 0x39
 6190 0220 0B       		.uleb128 0xb
 6191 0221 02       		.uleb128 0x2
 6192 0222 18       		.uleb128 0x18
 6193 0223 00       		.byte	0
 6194 0224 00       		.byte	0
 6195 0225 22       		.uleb128 0x22
 6196 0226 2E       		.uleb128 0x2e
 6197 0227 01       		.byte	0x1
 6198 0228 3F       		.uleb128 0x3f
 6199 0229 19       		.uleb128 0x19
 6200 022a 03       		.uleb128 0x3
 6201 022b 08       		.uleb128 0x8
 6202 022c 3A       		.uleb128 0x3a
 6203 022d 0B       		.uleb128 0xb
 6204 022e 3B       		.uleb128 0x3b
 6205 022f 05       		.uleb128 0x5
 6206 0230 39       		.uleb128 0x39
 6207 0231 21       		.uleb128 0x21
 6208 0232 10       		.sleb128 16
 6209 0233 27       		.uleb128 0x27
 6210 0234 19       		.uleb128 0x19
 6211 0235 3C       		.uleb128 0x3c
 6212 0236 19       		.uleb128 0x19
 6213 0237 01       		.uleb128 0x1
 6214 0238 13       		.uleb128 0x13
 6215 0239 00       		.byte	0
 6216 023a 00       		.byte	0
 6217 023b 23       		.uleb128 0x23
 6218 023c 2E       		.uleb128 0x2e
 6219 023d 01       		.byte	0x1
 6220 023e 03       		.uleb128 0x3
 6221 023f 08       		.uleb128 0x8
 6222 0240 3A       		.uleb128 0x3a
 6223 0241 21       		.uleb128 0x21
 6224 0242 01       		.sleb128 1
 6225 0243 3B       		.uleb128 0x3b
 6226 0244 05       		.uleb128 0x5
 6227 0245 39       		.uleb128 0x39
 6228 0246 0B       		.uleb128 0xb
 6229 0247 27       		.uleb128 0x27
 6230 0248 19       		.uleb128 0x19
 6231 0249 49       		.uleb128 0x49
 6232 024a 13       		.uleb128 0x13
 6233 024b 11       		.uleb128 0x11
 6234 024c 01       		.uleb128 0x1
 6235 024d 12       		.uleb128 0x12
 6236 024e 07       		.uleb128 0x7
 6237 024f 40       		.uleb128 0x40
 6238 0250 18       		.uleb128 0x18
 6239 0251 7C       		.uleb128 0x7c
 6240 0252 19       		.uleb128 0x19
 6241 0253 01       		.uleb128 0x1
 6242 0254 13       		.uleb128 0x13
 6243 0255 00       		.byte	0
 6244 0256 00       		.byte	0
 6245 0257 24       		.uleb128 0x24
 6246 0258 2E       		.uleb128 0x2e
 6247 0259 01       		.byte	0x1
 6248 025a 03       		.uleb128 0x3
 6249 025b 08       		.uleb128 0x8
 6250 025c 3A       		.uleb128 0x3a
 6251 025d 21       		.uleb128 0x21
 6252 025e 01       		.sleb128 1
 6253 025f 3B       		.uleb128 0x3b
 6254 0260 05       		.uleb128 0x5
 6255 0261 39       		.uleb128 0x39
 6256 0262 21       		.uleb128 0x21
 6257 0263 1A       		.sleb128 26
 6258 0264 27       		.uleb128 0x27
 6259 0265 19       		.uleb128 0x19
 6260 0266 49       		.uleb128 0x49
 6261 0267 13       		.uleb128 0x13
 6262 0268 11       		.uleb128 0x11
 6263 0269 01       		.uleb128 0x1
 6264 026a 12       		.uleb128 0x12
 6265 026b 07       		.uleb128 0x7
 6266 026c 40       		.uleb128 0x40
 6267 026d 18       		.uleb128 0x18
 6268 026e 7A       		.uleb128 0x7a
 6269 026f 19       		.uleb128 0x19
 6270 0270 01       		.uleb128 0x1
 6271 0271 13       		.uleb128 0x13
 6272 0272 00       		.byte	0
 6273 0273 00       		.byte	0
 6274 0274 25       		.uleb128 0x25
 6275 0275 11       		.uleb128 0x11
 6276 0276 01       		.byte	0x1
 6277 0277 25       		.uleb128 0x25
 6278 0278 08       		.uleb128 0x8
 6279 0279 13       		.uleb128 0x13
 6280 027a 0B       		.uleb128 0xb
 6281 027b 03       		.uleb128 0x3
 6282 027c 1F       		.uleb128 0x1f
 6283 027d 1B       		.uleb128 0x1b
 6284 027e 1F       		.uleb128 0x1f
 6285 027f 11       		.uleb128 0x11
 6286 0280 01       		.uleb128 0x1
 6287 0281 12       		.uleb128 0x12
 6288 0282 07       		.uleb128 0x7
 6289 0283 10       		.uleb128 0x10
 6290 0284 17       		.uleb128 0x17
 6291 0285 00       		.byte	0
 6292 0286 00       		.byte	0
 6293 0287 26       		.uleb128 0x26
 6294 0288 0D       		.uleb128 0xd
 6295 0289 00       		.byte	0
 6296 028a 03       		.uleb128 0x3
 6297 028b 0E       		.uleb128 0xe
 6298 028c 3A       		.uleb128 0x3a
 6299 028d 0B       		.uleb128 0xb
 6300 028e 3B       		.uleb128 0x3b
 6301 028f 0B       		.uleb128 0xb
 6302 0290 39       		.uleb128 0x39
 6303 0291 0B       		.uleb128 0xb
 6304 0292 49       		.uleb128 0x49
 6305 0293 13       		.uleb128 0x13
 6306 0294 38       		.uleb128 0x38
 6307 0295 0B       		.uleb128 0xb
 6308 0296 00       		.byte	0
 6309 0297 00       		.byte	0
 6310 0298 27       		.uleb128 0x27
 6311 0299 34       		.uleb128 0x34
 6312 029a 00       		.byte	0
 6313 029b 47       		.uleb128 0x47
 6314 029c 13       		.uleb128 0x13
 6315 029d 3B       		.uleb128 0x3b
 6316 029e 05       		.uleb128 0x5
 6317 029f 02       		.uleb128 0x2
 6318 02a0 18       		.uleb128 0x18
 6319 02a1 00       		.byte	0
 6320 02a2 00       		.byte	0
 6321 02a3 28       		.uleb128 0x28
 6322 02a4 0F       		.uleb128 0xf
 6323 02a5 00       		.byte	0
 6324 02a6 0B       		.uleb128 0xb
 6325 02a7 0B       		.uleb128 0xb
 6326 02a8 00       		.byte	0
 6327 02a9 00       		.byte	0
 6328 02aa 29       		.uleb128 0x29
 6329 02ab 2E       		.uleb128 0x2e
 6330 02ac 00       		.byte	0
 6331 02ad 3F       		.uleb128 0x3f
 6332 02ae 19       		.uleb128 0x19
 6333 02af 03       		.uleb128 0x3
 6334 02b0 08       		.uleb128 0x8
 6335 02b1 3A       		.uleb128 0x3a
 6336 02b2 0B       		.uleb128 0xb
 6337 02b3 3B       		.uleb128 0x3b
 6338 02b4 0B       		.uleb128 0xb
 6339 02b5 39       		.uleb128 0x39
 6340 02b6 0B       		.uleb128 0xb
 6341 02b7 27       		.uleb128 0x27
 6342 02b8 19       		.uleb128 0x19
 6343 02b9 49       		.uleb128 0x49
 6344 02ba 13       		.uleb128 0x13
 6345 02bb 3C       		.uleb128 0x3c
 6346 02bc 19       		.uleb128 0x19
 6347 02bd 00       		.byte	0
 6348 02be 00       		.byte	0
 6349 02bf 2A       		.uleb128 0x2a
 6350 02c0 26       		.uleb128 0x26
 6351 02c1 00       		.byte	0
 6352 02c2 00       		.byte	0
 6353 02c3 00       		.byte	0
 6354 02c4 2B       		.uleb128 0x2b
 6355 02c5 2E       		.uleb128 0x2e
 6356 02c6 01       		.byte	0x1
 6357 02c7 3F       		.uleb128 0x3f
 6358 02c8 19       		.uleb128 0x19
 6359 02c9 03       		.uleb128 0x3
 6360 02ca 08       		.uleb128 0x8
 6361 02cb 3A       		.uleb128 0x3a
 6362 02cc 0B       		.uleb128 0xb
 6363 02cd 3B       		.uleb128 0x3b
 6364 02ce 05       		.uleb128 0x5
 6365 02cf 39       		.uleb128 0x39
 6366 02d0 0B       		.uleb128 0xb
 6367 02d1 27       		.uleb128 0x27
 6368 02d2 19       		.uleb128 0x19
 6369 02d3 8701     		.uleb128 0x87
 6370 02d5 19       		.uleb128 0x19
 6371 02d6 3C       		.uleb128 0x3c
 6372 02d7 19       		.uleb128 0x19
 6373 02d8 01       		.uleb128 0x1
 6374 02d9 13       		.uleb128 0x13
 6375 02da 00       		.byte	0
 6376 02db 00       		.byte	0
 6377 02dc 2C       		.uleb128 0x2c
 6378 02dd 2E       		.uleb128 0x2e
 6379 02de 00       		.byte	0
 6380 02df 3F       		.uleb128 0x3f
 6381 02e0 19       		.uleb128 0x19
 6382 02e1 03       		.uleb128 0x3
 6383 02e2 08       		.uleb128 0x8
 6384 02e3 3A       		.uleb128 0x3a
 6385 02e4 0B       		.uleb128 0xb
 6386 02e5 3B       		.uleb128 0x3b
 6387 02e6 0B       		.uleb128 0xb
 6388 02e7 39       		.uleb128 0x39
 6389 02e8 0B       		.uleb128 0xb
 6390 02e9 27       		.uleb128 0x27
 6391 02ea 19       		.uleb128 0x19
 6392 02eb 49       		.uleb128 0x49
 6393 02ec 13       		.uleb128 0x13
 6394 02ed 11       		.uleb128 0x11
 6395 02ee 01       		.uleb128 0x1
 6396 02ef 12       		.uleb128 0x12
 6397 02f0 07       		.uleb128 0x7
 6398 02f1 40       		.uleb128 0x40
 6399 02f2 18       		.uleb128 0x18
 6400 02f3 7A       		.uleb128 0x7a
 6401 02f4 19       		.uleb128 0x19
 6402 02f5 00       		.byte	0
 6403 02f6 00       		.byte	0
 6404 02f7 2D       		.uleb128 0x2d
 6405 02f8 2E       		.uleb128 0x2e
 6406 02f9 00       		.byte	0
 6407 02fa 3F       		.uleb128 0x3f
 6408 02fb 19       		.uleb128 0x19
 6409 02fc 03       		.uleb128 0x3
 6410 02fd 08       		.uleb128 0x8
 6411 02fe 3A       		.uleb128 0x3a
 6412 02ff 0B       		.uleb128 0xb
 6413 0300 3B       		.uleb128 0x3b
 6414 0301 05       		.uleb128 0x5
 6415 0302 39       		.uleb128 0x39
 6416 0303 0B       		.uleb128 0xb
 6417 0304 27       		.uleb128 0x27
 6418 0305 19       		.uleb128 0x19
 6419 0306 49       		.uleb128 0x49
 6420 0307 13       		.uleb128 0x13
 6421 0308 11       		.uleb128 0x11
 6422 0309 01       		.uleb128 0x1
 6423 030a 12       		.uleb128 0x12
 6424 030b 07       		.uleb128 0x7
 6425 030c 40       		.uleb128 0x40
 6426 030d 18       		.uleb128 0x18
 6427 030e 7C       		.uleb128 0x7c
 6428 030f 19       		.uleb128 0x19
 6429 0310 00       		.byte	0
 6430 0311 00       		.byte	0
 6431 0312 2E       		.uleb128 0x2e
 6432 0313 2E       		.uleb128 0x2e
 6433 0314 00       		.byte	0
 6434 0315 03       		.uleb128 0x3
 6435 0316 08       		.uleb128 0x8
 6436 0317 3A       		.uleb128 0x3a
 6437 0318 0B       		.uleb128 0xb
 6438 0319 3B       		.uleb128 0x3b
 6439 031a 05       		.uleb128 0x5
 6440 031b 39       		.uleb128 0x39
 6441 031c 0B       		.uleb128 0xb
 6442 031d 27       		.uleb128 0x27
 6443 031e 19       		.uleb128 0x19
 6444 031f 49       		.uleb128 0x49
 6445 0320 13       		.uleb128 0x13
 6446 0321 11       		.uleb128 0x11
 6447 0322 01       		.uleb128 0x1
 6448 0323 12       		.uleb128 0x12
 6449 0324 07       		.uleb128 0x7
 6450 0325 40       		.uleb128 0x40
 6451 0326 18       		.uleb128 0x18
 6452 0327 7A       		.uleb128 0x7a
 6453 0328 19       		.uleb128 0x19
 6454 0329 00       		.byte	0
 6455 032a 00       		.byte	0
 6456 032b 2F       		.uleb128 0x2f
 6457 032c 2E       		.uleb128 0x2e
 6458 032d 01       		.byte	0x1
 6459 032e 03       		.uleb128 0x3
 6460 032f 08       		.uleb128 0x8
 6461 0330 3A       		.uleb128 0x3a
 6462 0331 0B       		.uleb128 0xb
 6463 0332 3B       		.uleb128 0x3b
 6464 0333 05       		.uleb128 0x5
 6465 0334 39       		.uleb128 0x39
 6466 0335 0B       		.uleb128 0xb
 6467 0336 27       		.uleb128 0x27
 6468 0337 19       		.uleb128 0x19
 6469 0338 8701     		.uleb128 0x87
 6470 033a 19       		.uleb128 0x19
 6471 033b 11       		.uleb128 0x11
 6472 033c 01       		.uleb128 0x1
 6473 033d 12       		.uleb128 0x12
 6474 033e 07       		.uleb128 0x7
 6475 033f 40       		.uleb128 0x40
 6476 0340 18       		.uleb128 0x18
 6477 0341 7C       		.uleb128 0x7c
 6478 0342 19       		.uleb128 0x19
 6479 0343 01       		.uleb128 0x1
 6480 0344 13       		.uleb128 0x13
 6481 0345 00       		.byte	0
 6482 0346 00       		.byte	0
 6483 0347 30       		.uleb128 0x30
 6484 0348 2E       		.uleb128 0x2e
 6485 0349 00       		.byte	0
 6486 034a 3F       		.uleb128 0x3f
 6487 034b 19       		.uleb128 0x19
 6488 034c 03       		.uleb128 0x3
 6489 034d 08       		.uleb128 0x8
 6490 034e 3A       		.uleb128 0x3a
 6491 034f 0B       		.uleb128 0xb
 6492 0350 3B       		.uleb128 0x3b
 6493 0351 05       		.uleb128 0x5
 6494 0352 39       		.uleb128 0x39
 6495 0353 0B       		.uleb128 0xb
 6496 0354 27       		.uleb128 0x27
 6497 0355 19       		.uleb128 0x19
 6498 0356 11       		.uleb128 0x11
 6499 0357 01       		.uleb128 0x1
 6500 0358 12       		.uleb128 0x12
 6501 0359 07       		.uleb128 0x7
 6502 035a 40       		.uleb128 0x40
 6503 035b 18       		.uleb128 0x18
 6504 035c 7C       		.uleb128 0x7c
 6505 035d 19       		.uleb128 0x19
 6506 035e 00       		.byte	0
 6507 035f 00       		.byte	0
 6508 0360 31       		.uleb128 0x31
 6509 0361 2E       		.uleb128 0x2e
 6510 0362 00       		.byte	0
 6511 0363 03       		.uleb128 0x3
 6512 0364 08       		.uleb128 0x8
 6513 0365 3A       		.uleb128 0x3a
 6514 0366 0B       		.uleb128 0xb
 6515 0367 3B       		.uleb128 0x3b
 6516 0368 05       		.uleb128 0x5
 6517 0369 39       		.uleb128 0x39
 6518 036a 0B       		.uleb128 0xb
 6519 036b 27       		.uleb128 0x27
 6520 036c 19       		.uleb128 0x19
 6521 036d 11       		.uleb128 0x11
 6522 036e 01       		.uleb128 0x1
 6523 036f 12       		.uleb128 0x12
 6524 0370 07       		.uleb128 0x7
 6525 0371 40       		.uleb128 0x40
 6526 0372 18       		.uleb128 0x18
 6527 0373 7A       		.uleb128 0x7a
 6528 0374 19       		.uleb128 0x19
 6529 0375 00       		.byte	0
 6530 0376 00       		.byte	0
 6531 0377 32       		.uleb128 0x32
 6532 0378 2E       		.uleb128 0x2e
 6533 0379 01       		.byte	0x1
 6534 037a 3F       		.uleb128 0x3f
 6535 037b 19       		.uleb128 0x19
 6536 037c 03       		.uleb128 0x3
 6537 037d 08       		.uleb128 0x8
 6538 037e 3A       		.uleb128 0x3a
 6539 037f 0B       		.uleb128 0xb
 6540 0380 3B       		.uleb128 0x3b
 6541 0381 05       		.uleb128 0x5
 6542 0382 39       		.uleb128 0x39
 6543 0383 0B       		.uleb128 0xb
 6544 0384 27       		.uleb128 0x27
 6545 0385 19       		.uleb128 0x19
 6546 0386 49       		.uleb128 0x49
 6547 0387 13       		.uleb128 0x13
 6548 0388 11       		.uleb128 0x11
 6549 0389 01       		.uleb128 0x1
 6550 038a 12       		.uleb128 0x12
 6551 038b 07       		.uleb128 0x7
 6552 038c 40       		.uleb128 0x40
 6553 038d 18       		.uleb128 0x18
 6554 038e 7C       		.uleb128 0x7c
 6555 038f 19       		.uleb128 0x19
 6556 0390 00       		.byte	0
 6557 0391 00       		.byte	0
 6558 0392 33       		.uleb128 0x33
 6559 0393 0B       		.uleb128 0xb
 6560 0394 01       		.byte	0x1
 6561 0395 55       		.uleb128 0x55
 6562 0396 17       		.uleb128 0x17
 6563 0397 01       		.uleb128 0x1
 6564 0398 13       		.uleb128 0x13
 6565 0399 00       		.byte	0
 6566 039a 00       		.byte	0
 6567 039b 00       		.byte	0
 6568              		.section	.debug_aranges,"dr"
 6569 0000 2C000000 		.long	0x2c
 6570 0004 0200     		.word	0x2
 6571 0006 00000000 		.secrel32	.Ldebug_info0
 6572 000a 08       		.byte	0x8
 6573 000b 00       		.byte	0
 6574 000c 0000     		.word	0
 6575 000e 0000     		.word	0
 6576 0010 00000000 		.quad	.Ltext0
 6576      00000000 
 6577 0018 7E1E0000 		.quad	.Letext0-.Ltext0
 6577      00000000 
 6578 0020 00000000 		.quad	0
 6578      00000000 
 6579 0028 00000000 		.quad	0
 6579      00000000 
 6580              		.section	.debug_rnglists,"dr"
 6581              	.Ldebug_ranges0:
 6582 0000 13000000 		.long	.Ldebug_ranges3-.Ldebug_ranges2
 6583              	.Ldebug_ranges2:
 6584 0004 0500     		.word	0x5
 6585 0006 08       		.byte	0x8
 6586 0007 00       		.byte	0
 6587 0008 00000000 		.long	0
 6588              	.LLRL0:
 6589 000c 04       		.byte	0x4
 6590 000d FB07     		.uleb128 .LBB3-.Ltext0
 6591 000f D70C     		.uleb128 .LBE3-.Ltext0
 6592 0011 04       		.byte	0x4
 6593 0012 EC0C     		.uleb128 .LBB5-.Ltext0
 6594 0014 ED0C     		.uleb128 .LBE5-.Ltext0
 6595 0016 00       		.byte	0
 6596              	.Ldebug_ranges3:
 6597              		.section	.debug_line,"dr"
 6598              	.Ldebug_line0:
 6599 0000 490B0000 		.section	.debug_str,"dr"
 6599      05000800 
 6599      5B000000 
 6599      010101FB 
 6599      0E0D0001 
 6600              	.LASF6:
 6601 0000 79795F63 		.ascii "yy_current_state\0"
 6601      75727265 
 6601      6E745F73 
 6601      74617465 
 6601      00
 6602              	.LASF2:
 6603 0011 79795F6E 		.ascii "yy_n_chars\0"
 6603      5F636861 
 6603      727300
 6604              	.LASF4:
 6605 001c 79795F63 		.ascii "yy_cp\0"
 6605      7000
 6606              	.LASF3:
 6607 0022 6E65775F 		.ascii "new_buffer\0"
 6607      62756666 
 6607      657200
 6608              	.LASF5:
 6609 002d 6E756D62 		.ascii "number_to_move\0"
 6609      65725F74 
 6609      6F5F6D6F 
 6609      766500
 6610              	.LASF7:
 6611 003c 6E65775F 		.ascii "new_size\0"
 6611      73697A65 
 6611      00
 6612              		.section	.debug_line_str,"dr"
 6613              	.LASF0:
 6614 0000 6C65782E 		.ascii "lex.yy.c\0"
 6614      79792E63 
 6614      00
 6615              	.LASF1:
 6616 0009 433A5C55 		.ascii "C:\\Users\\Dell\\Desktop\\flex\0"
 6616      73657273 
 6616      5C44656C 
 6616      6C5C4465 
 6616      736B746F 
 6617              		.ident	"GCC: (Rev3, Built by MSYS2 project) 14.2.0"
   1              		.file	"main.c"
   2              		.text
   3              	.Ltext0:
   4              		.cfi_sections	.debug_frame
   5              		.file 0 "C:/Users/Dell/Desktop/flex" "main.c"
   6              		.section .rdata,"dr"
   7              		.align 8
   8              	.LC0:
   9 0000 456E7465 		.ascii "Enter expression like: x3 y4 custom_operation\12> \0"
   9      72206578 
   9      70726573 
   9      73696F6E 
   9      206C696B 
  10 0031 00000000 		.text
  10      00000000 
  10      00000000 
  10      000000
  11              		.globl	main
  13              		.seh_proc	main
  14              	main:
  15              	.LFB6:
  16              		.file 1 "main.c"
   1:main.c        **** #include <stdio.h>
   2:main.c        **** 
   3:main.c        **** void computeExpression();
   4:main.c        **** 
   5:main.c        **** int main() {
  17              		.loc 1 5 12
  18              		.cfi_startproc
  19 0000 55       		pushq	%rbp
  20              		.seh_pushreg	%rbp
  21              		.cfi_def_cfa_offset 16
  22              		.cfi_offset 6, -16
  23 0001 4889E5   		movq	%rsp, %rbp
  24              		.seh_setframe	%rbp, 0
  25              		.cfi_def_cfa_register 6
  26 0004 4883EC20 		subq	$32, %rsp
  27              		.seh_stackalloc	32
  28              		.seh_endprologue
  29              		.loc 1 5 12
  30 0008 E8000000 		call	__main
  30      00
   6:main.c        ****     printf("Enter expression like: x3 y4 custom_operation\n> ");
  31              		.loc 1 6 5
  32 000d 488D0500 		leaq	.LC0(%rip), %rax
  32      000000
  33 0014 4889C1   		movq	%rax, %rcx
  34 0017 E8000000 		call	__mingw_printf
  34      00
   7:main.c        ****     computeExpression();
  35              		.loc 1 7 5
  36 001c E8000000 		call	computeExpression
  36      00
   8:main.c        ****     return 0;
  37              		.loc 1 8 12
  38 0021 B8000000 		movl	$0, %eax
  38      00
   9:main.c        **** }
  39              		.loc 1 9 1
  40 0026 4883C420 		addq	$32, %rsp
  41 002a 5D       		popq	%rbp
  42              		.cfi_restore 6
  43              		.cfi_def_cfa 7, 8
  44 002b C3       		ret
  45              		.cfi_endproc
  46              	.LFE6:
  47              		.seh_endproc
  48              	.Letext0:
  49              		.file 2 "C:/msys64/mingw64/include/stdio.h"
  50 002c 90909090 		.section	.debug_info,"dr"
  51              	.Ldebug_info0:
  52 0000 58010000 		.long	0x158
  53 0004 0500     		.word	0x5
  54 0006 01       		.byte	0x1
  55 0007 08       		.byte	0x8
  56 0008 00000000 		.secrel32	.Ldebug_abbrev0
  57 000c 03       		.uleb128 0x3
  58 000d 474E5520 		.ascii "GNU C17 14.2.0 -mtune=generic -march=nocona -g\0"
  58      43313720 
  58      31342E32 
  58      2E30202D 
  58      6D74756E 
  59 003c 1D       		.byte	0x1d
  60 003d 1B000000 		.secrel32	.LASF0
  61 0041 00000000 		.secrel32	.LASF1
  62 0045 00000000 		.quad	.Ltext0
  62      00000000 
  63 004d 2C000000 		.quad	.Letext0-.Ltext0
  63      00000000 
  64 0055 00000000 		.secrel32	.Ldebug_line0
  65 0059 01       		.uleb128 0x1
  66 005a 01       		.byte	0x1
  67 005b 06       		.byte	0x6
  68 005c 63686172 		.ascii "char\0"
  68      00
  69 0061 04       		.uleb128 0x4
  70 0062 59000000 		.long	0x59
  71 0066 01       		.uleb128 0x1
  72 0067 08       		.byte	0x8
  73 0068 07       		.byte	0x7
  74 0069 6C6F6E67 		.ascii "long long unsigned int\0"
  74      206C6F6E 
  74      6720756E 
  74      7369676E 
  74      65642069 
  75 0080 01       		.uleb128 0x1
  76 0081 08       		.byte	0x8
  77 0082 05       		.byte	0x5
  78 0083 6C6F6E67 		.ascii "long long int\0"
  78      206C6F6E 
  78      6720696E 
  78      7400
  79 0091 01       		.uleb128 0x1
  80 0092 02       		.byte	0x2
  81 0093 07       		.byte	0x7
  82 0094 73686F72 		.ascii "short unsigned int\0"
  82      7420756E 
  82      7369676E 
  82      65642069 
  82      6E7400
  83 00a7 01       		.uleb128 0x1
  84 00a8 04       		.byte	0x4
  85 00a9 05       		.byte	0x5
  86 00aa 696E7400 		.ascii "int\0"
  87 00ae 01       		.uleb128 0x1
  88 00af 04       		.byte	0x4
  89 00b0 05       		.byte	0x5
  90 00b1 6C6F6E67 		.ascii "long int\0"
  90      20696E74 
  90      00
  91 00ba 01       		.uleb128 0x1
  92 00bb 04       		.byte	0x4
  93 00bc 07       		.byte	0x7
  94 00bd 756E7369 		.ascii "unsigned int\0"
  94      676E6564 
  94      20696E74 
  94      00
  95 00ca 01       		.uleb128 0x1
  96 00cb 04       		.byte	0x4
  97 00cc 07       		.byte	0x7
  98 00cd 6C6F6E67 		.ascii "long unsigned int\0"
  98      20756E73 
  98      69676E65 
  98      6420696E 
  98      7400
  99 00df 01       		.uleb128 0x1
 100 00e0 01       		.byte	0x1
 101 00e1 08       		.byte	0x8
 102 00e2 756E7369 		.ascii "unsigned char\0"
 102      676E6564 
 102      20636861 
 102      7200
 103 00f0 05       		.uleb128 0x5
 104 00f1 636F6D70 		.ascii "computeExpression\0"
 104      75746545 
 104      78707265 
 104      7373696F 
 104      6E00
 105 0103 01       		.byte	0x1
 106 0104 03       		.byte	0x3
 107 0105 06       		.byte	0x6
 108 0106 0C010000 		.long	0x10c
 109 010a 02       		.uleb128 0x2
 110 010b 00       		.byte	0
 111 010c 06       		.uleb128 0x6
 112 010d 7072696E 		.ascii "printf\0"
 112      746600
 113 0114 02       		.byte	0x2
 114 0115 5E01     		.word	0x15e
 115 0117 05       		.byte	0x5
 116 0118 5F5F6D69 		.ascii "__mingw_printf\0"
 116      6E67775F 
 116      7072696E 
 116      746600
 117 0127 A7000000 		.long	0xa7
 118 012b 36010000 		.long	0x136
 119 012f 07       		.uleb128 0x7
 120 0130 36010000 		.long	0x136
 121 0134 02       		.uleb128 0x2
 122 0135 00       		.byte	0
 123 0136 08       		.uleb128 0x8
 124 0137 08       		.byte	0x8
 125 0138 61000000 		.long	0x61
 126 013c 09       		.uleb128 0x9
 127 013d 6D61696E 		.ascii "main\0"
 127      00
 128 0142 01       		.byte	0x1
 129 0143 05       		.byte	0x5
 130 0144 05       		.byte	0x5
 131 0145 A7000000 		.long	0xa7
 132 0149 00000000 		.quad	.LFB6
 132      00000000 
 133 0151 2C000000 		.quad	.LFE6-.LFB6
 133      00000000 
 134 0159 01       		.uleb128 0x1
 135 015a 9C       		.byte	0x9c
 136 015b 00       		.byte	0
 137              		.section	.debug_abbrev,"dr"
 138              	.Ldebug_abbrev0:
 139 0000 01       		.uleb128 0x1
 140 0001 24       		.uleb128 0x24
 141 0002 00       		.byte	0
 142 0003 0B       		.uleb128 0xb
 143 0004 0B       		.uleb128 0xb
 144 0005 3E       		.uleb128 0x3e
 145 0006 0B       		.uleb128 0xb
 146 0007 03       		.uleb128 0x3
 147 0008 08       		.uleb128 0x8
 148 0009 00       		.byte	0
 149 000a 00       		.byte	0
 150 000b 02       		.uleb128 0x2
 151 000c 18       		.uleb128 0x18
 152 000d 00       		.byte	0
 153 000e 00       		.byte	0
 154 000f 00       		.byte	0
 155 0010 03       		.uleb128 0x3
 156 0011 11       		.uleb128 0x11
 157 0012 01       		.byte	0x1
 158 0013 25       		.uleb128 0x25
 159 0014 08       		.uleb128 0x8
 160 0015 13       		.uleb128 0x13
 161 0016 0B       		.uleb128 0xb
 162 0017 03       		.uleb128 0x3
 163 0018 1F       		.uleb128 0x1f
 164 0019 1B       		.uleb128 0x1b
 165 001a 1F       		.uleb128 0x1f
 166 001b 11       		.uleb128 0x11
 167 001c 01       		.uleb128 0x1
 168 001d 12       		.uleb128 0x12
 169 001e 07       		.uleb128 0x7
 170 001f 10       		.uleb128 0x10
 171 0020 17       		.uleb128 0x17
 172 0021 00       		.byte	0
 173 0022 00       		.byte	0
 174 0023 04       		.uleb128 0x4
 175 0024 26       		.uleb128 0x26
 176 0025 00       		.byte	0
 177 0026 49       		.uleb128 0x49
 178 0027 13       		.uleb128 0x13
 179 0028 00       		.byte	0
 180 0029 00       		.byte	0
 181 002a 05       		.uleb128 0x5
 182 002b 2E       		.uleb128 0x2e
 183 002c 01       		.byte	0x1
 184 002d 3F       		.uleb128 0x3f
 185 002e 19       		.uleb128 0x19
 186 002f 03       		.uleb128 0x3
 187 0030 08       		.uleb128 0x8
 188 0031 3A       		.uleb128 0x3a
 189 0032 0B       		.uleb128 0xb
 190 0033 3B       		.uleb128 0x3b
 191 0034 0B       		.uleb128 0xb
 192 0035 39       		.uleb128 0x39
 193 0036 0B       		.uleb128 0xb
 194 0037 3C       		.uleb128 0x3c
 195 0038 19       		.uleb128 0x19
 196 0039 01       		.uleb128 0x1
 197 003a 13       		.uleb128 0x13
 198 003b 00       		.byte	0
 199 003c 00       		.byte	0
 200 003d 06       		.uleb128 0x6
 201 003e 2E       		.uleb128 0x2e
 202 003f 01       		.byte	0x1
 203 0040 3F       		.uleb128 0x3f
 204 0041 19       		.uleb128 0x19
 205 0042 03       		.uleb128 0x3
 206 0043 08       		.uleb128 0x8
 207 0044 3A       		.uleb128 0x3a
 208 0045 0B       		.uleb128 0xb
 209 0046 3B       		.uleb128 0x3b
 210 0047 05       		.uleb128 0x5
 211 0048 39       		.uleb128 0x39
 212 0049 0B       		.uleb128 0xb
 213 004a 6E       		.uleb128 0x6e
 214 004b 08       		.uleb128 0x8
 215 004c 27       		.uleb128 0x27
 216 004d 19       		.uleb128 0x19
 217 004e 49       		.uleb128 0x49
 218 004f 13       		.uleb128 0x13
 219 0050 3C       		.uleb128 0x3c
 220 0051 19       		.uleb128 0x19
 221 0052 01       		.uleb128 0x1
 222 0053 13       		.uleb128 0x13
 223 0054 00       		.byte	0
 224 0055 00       		.byte	0
 225 0056 07       		.uleb128 0x7
 226 0057 05       		.uleb128 0x5
 227 0058 00       		.byte	0
 228 0059 49       		.uleb128 0x49
 229 005a 13       		.uleb128 0x13
 230 005b 00       		.byte	0
 231 005c 00       		.byte	0
 232 005d 08       		.uleb128 0x8
 233 005e 0F       		.uleb128 0xf
 234 005f 00       		.byte	0
 235 0060 0B       		.uleb128 0xb
 236 0061 0B       		.uleb128 0xb
 237 0062 49       		.uleb128 0x49
 238 0063 13       		.uleb128 0x13
 239 0064 00       		.byte	0
 240 0065 00       		.byte	0
 241 0066 09       		.uleb128 0x9
 242 0067 2E       		.uleb128 0x2e
 243 0068 00       		.byte	0
 244 0069 3F       		.uleb128 0x3f
 245 006a 19       		.uleb128 0x19
 246 006b 03       		.uleb128 0x3
 247 006c 08       		.uleb128 0x8
 248 006d 3A       		.uleb128 0x3a
 249 006e 0B       		.uleb128 0xb
 250 006f 3B       		.uleb128 0x3b
 251 0070 0B       		.uleb128 0xb
 252 0071 39       		.uleb128 0x39
 253 0072 0B       		.uleb128 0xb
 254 0073 49       		.uleb128 0x49
 255 0074 13       		.uleb128 0x13
 256 0075 11       		.uleb128 0x11
 257 0076 01       		.uleb128 0x1
 258 0077 12       		.uleb128 0x12
 259 0078 07       		.uleb128 0x7
 260 0079 40       		.uleb128 0x40
 261 007a 18       		.uleb128 0x18
 262 007b 7C       		.uleb128 0x7c
 263 007c 19       		.uleb128 0x19
 264 007d 00       		.byte	0
 265 007e 00       		.byte	0
 266 007f 00       		.byte	0
 267              		.section	.debug_aranges,"dr"
 268 0000 2C000000 		.long	0x2c
 269 0004 0200     		.word	0x2
 270 0006 00000000 		.secrel32	.Ldebug_info0
 271 000a 08       		.byte	0x8
 272 000b 00       		.byte	0
 273 000c 0000     		.word	0
 274 000e 0000     		.word	0
 275 0010 00000000 		.quad	.Ltext0
 275      00000000 
 276 0018 2C000000 		.quad	.Letext0-.Ltext0
 276      00000000 
 277 0020 00000000 		.quad	0
 277      00000000 
 278 0028 00000000 		.quad	0
 278      00000000 
 279              		.section	.debug_line,"dr"
 280              	.Ldebug_line0:
 281 0000 59000000 		.section	.debug_str,"dr"
 281      05000800 
 281      33000000 
 281      010101FB 
 281      0E0D0001 
 282              		.section	.debug_line_str,"dr"
 283              	.LASF1:
 284 0000 433A5C55 		.ascii "C:\\Users\\Dell\\Desktop\\flex\0"
 284      73657273 
 284      5C44656C 
 284      6C5C4465 
 284      736B746F 
 285              	.LASF0:
 286 001b 6D61696E 		.ascii "main.c\0"
 286      2E6300
 288              		.ident	"GCC: (Rev3, Built by MSYS2 project) 14.2.0"
