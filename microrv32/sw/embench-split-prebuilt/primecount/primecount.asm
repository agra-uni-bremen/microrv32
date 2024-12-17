
bd/src/primecount/primecount:     Dateiformat elf32-littleriscv


Disassembly of section .text:

80000000 <initSection>:
80000000:	000070b3          	and	x1,x0,x0
80000004:	00007133          	and	x2,x0,x0
80000008:	000071b3          	and	x3,x0,x0
8000000c:	00007233          	and	x4,x0,x0
80000010:	000072b3          	and	x5,x0,x0
80000014:	00007333          	and	x6,x0,x0
80000018:	000073b3          	and	x7,x0,x0
8000001c:	00007433          	and	x8,x0,x0
80000020:	000074b3          	and	x9,x0,x0
80000024:	00007533          	and	x10,x0,x0
80000028:	000075b3          	and	x11,x0,x0
8000002c:	00007633          	and	x12,x0,x0
80000030:	000076b3          	and	x13,x0,x0
80000034:	00007733          	and	x14,x0,x0
80000038:	000077b3          	and	x15,x0,x0
8000003c:	00007833          	and	x16,x0,x0
80000040:	000078b3          	and	x17,x0,x0
80000044:	00007933          	and	x18,x0,x0
80000048:	000079b3          	and	x19,x0,x0
8000004c:	00007a33          	and	x20,x0,x0
80000050:	00007ab3          	and	x21,x0,x0
80000054:	00007b33          	and	x22,x0,x0
80000058:	00007bb3          	and	x23,x0,x0
8000005c:	00007c33          	and	x24,x0,x0
80000060:	00007cb3          	and	x25,x0,x0
80000064:	00007d33          	and	x26,x0,x0
80000068:	00007db3          	and	x27,x0,x0
8000006c:	00007e33          	and	x28,x0,x0
80000070:	00007eb3          	and	x29,x0,x0
80000074:	00007f33          	and	x30,x0,x0
80000078:	00007fb3          	and	x31,x0,x0
8000007c:	00101117          	auipc	x2,0x101
80000080:	f8410113          	addi	x2,x2,-124 # 80101000 <stack_end>
80000084:	020000ef          	jal	x1,800000a4 <main>

80000088 <sys_end>:
80000088:	05d00893          	addi	x17,x0,93
8000008c:	00000513          	addi	x10,x0,0
80000090:	020102b7          	lui	x5,0x2010
80000094:	f1402873          	csrrs	x16,mhartid,x0
80000098:	0102a023          	sw	x16,0(x5) # 2010000 <SYSCALL_ADDR>
8000009c:	0112a023          	sw	x17,0(x5)
800000a0:	fe9ff06f          	jal	x0,80000088 <sys_end>

800000a4 <main>:
800000a4:	fe010113          	addi	x2,x2,-32
800000a8:	00112e23          	sw	x1,28(x2)
800000ac:	190000ef          	jal	x1,8000023c <initialise_board>
800000b0:	174000ef          	jal	x1,80000224 <initialise_benchmark>
800000b4:	00100513          	addi	x10,x0,1
800000b8:	160000ef          	jal	x1,80000218 <warm_caches>
800000bc:	188000ef          	jal	x1,80000244 <start_trigger>
800000c0:	15c000ef          	jal	x1,8000021c <benchmark>
800000c4:	00a12623          	sw	x10,12(x2)
800000c8:	18c000ef          	jal	x1,80000254 <stop_trigger>
800000cc:	00c12503          	lw	x10,12(x2)
800000d0:	158000ef          	jal	x1,80000228 <verify_benchmark>
800000d4:	01c12083          	lw	x1,28(x2)
800000d8:	00153513          	sltiu	x10,x10,1
800000dc:	02010113          	addi	x2,x2,32
800000e0:	00008067          	jalr	x0,0(x1)

800000e4 <countPrimes>:
800000e4:	e9010113          	addi	x2,x2,-368
800000e8:	00200793          	addi	x15,x0,2
800000ec:	00f12023          	sw	x15,0(x2)
800000f0:	00400793          	addi	x15,x0,4
800000f4:	16812423          	sw	x8,360(x2)
800000f8:	16912223          	sw	x9,356(x2)
800000fc:	17212023          	sw	x18,352(x2)
80000100:	15412c23          	sw	x20,344(x2)
80000104:	16112623          	sw	x1,364(x2)
80000108:	15312e23          	sw	x19,348(x2)
8000010c:	0af12423          	sw	x15,168(x2)
80000110:	00200493          	addi	x9,x0,2
80000114:	00300413          	addi	x8,x0,3
80000118:	00100a13          	addi	x20,x0,1
8000011c:	00100913          	addi	x18,x0,1
80000120:	00048593          	addi	x11,x9,0
80000124:	00048513          	addi	x10,x9,0
80000128:	138000ef          	jal	x1,80000260 <__mulsi3>
8000012c:	02a45e63          	bge	x8,x10,80000168 <countPrimes+0x84>
80000130:	fff48493          	addi	x9,x9,-1
80000134:	0a810713          	addi	x14,x2,168
80000138:	00010613          	addi	x12,x2,0
8000013c:	00000693          	addi	x13,x0,0
80000140:	0326c863          	blt	x13,x18,80000170 <countPrimes+0x8c>
80000144:	16c12083          	lw	x1,364(x2)
80000148:	16812403          	lw	x8,360(x2)
8000014c:	16412483          	lw	x9,356(x2)
80000150:	16012903          	lw	x18,352(x2)
80000154:	15c12983          	lw	x19,348(x2)
80000158:	000a0513          	addi	x10,x20,0
8000015c:	15812a03          	lw	x20,344(x2)
80000160:	17010113          	addi	x2,x2,368
80000164:	00008067          	jalr	x0,0(x1)
80000168:	00148493          	addi	x9,x9,1
8000016c:	fb5ff06f          	jal	x0,80000120 <countPrimes+0x3c>
80000170:	00062583          	lw	x11,0(x12)
80000174:	02b4d063          	bge	x9,x11,80000194 <countPrimes+0xb0>
80000178:	02900793          	addi	x15,x0,41
8000017c:	0327da63          	bge	x15,x18,800001b0 <countPrimes+0xcc>
80000180:	001a0a13          	addi	x20,x20,1
80000184:	00140413          	addi	x8,x8,1
80000188:	f99ff06f          	jal	x0,80000120 <countPrimes+0x3c>
8000018c:	00f587b3          	add	x15,x11,x15
80000190:	00f72023          	sw	x15,0(x14)
80000194:	00072783          	lw	x15,0(x14)
80000198:	fe87cae3          	blt	x15,x8,8000018c <countPrimes+0xa8>
8000019c:	00470713          	addi	x14,x14,4
800001a0:	00460613          	addi	x12,x12,4
800001a4:	fe8780e3          	beq	x15,x8,80000184 <countPrimes+0xa0>
800001a8:	00168693          	addi	x13,x13,1
800001ac:	f95ff06f          	jal	x0,80000140 <countPrimes+0x5c>
800001b0:	00291993          	slli	x19,x18,0x2
800001b4:	15098793          	addi	x15,x19,336
800001b8:	002789b3          	add	x19,x15,x2
800001bc:	ea89a823          	sw	x8,-336(x19)
800001c0:	00040593          	addi	x11,x8,0
800001c4:	00040513          	addi	x10,x8,0
800001c8:	098000ef          	jal	x1,80000260 <__mulsi3>
800001cc:	f4a9ac23          	sw	x10,-168(x19)
800001d0:	00190913          	addi	x18,x18,1
800001d4:	fadff06f          	jal	x0,80000180 <countPrimes+0x9c>

800001d8 <benchmark_body>:
800001d8:	ff010113          	addi	x2,x2,-16
800001dc:	00812423          	sw	x8,8(x2)
800001e0:	00912223          	sw	x9,4(x2)
800001e4:	00050413          	addi	x8,x10,0
800001e8:	00112623          	sw	x1,12(x2)
800001ec:	00000513          	addi	x10,x0,0
800001f0:	00000493          	addi	x9,x0,0
800001f4:	0084cc63          	blt	x9,x8,8000020c <benchmark_body+0x34>
800001f8:	00c12083          	lw	x1,12(x2)
800001fc:	00812403          	lw	x8,8(x2)
80000200:	00412483          	lw	x9,4(x2)
80000204:	01010113          	addi	x2,x2,16
80000208:	00008067          	jalr	x0,0(x1)
8000020c:	ed9ff0ef          	jal	x1,800000e4 <countPrimes>
80000210:	00148493          	addi	x9,x9,1
80000214:	fe1ff06f          	jal	x0,800001f4 <benchmark_body+0x1c>

80000218 <warm_caches>:
80000218:	fc1ff06f          	jal	x0,800001d8 <benchmark_body>

8000021c <benchmark>:
8000021c:	00100513          	addi	x10,x0,1
80000220:	fb9ff06f          	jal	x0,800001d8 <benchmark_body>

80000224 <initialise_benchmark>:
80000224:	00008067          	jalr	x0,0(x1)

80000228 <verify_benchmark>:
80000228:	fffff7b7          	lui	x15,0xfffff
8000022c:	24878793          	addi	x15,x15,584 # fffff248 <_end+0x7fefd248>
80000230:	00f50533          	add	x10,x10,x15
80000234:	00153513          	sltiu	x10,x10,1
80000238:	00008067          	jalr	x0,0(x1)

8000023c <initialise_board>:
8000023c:	00000513          	addi	x10,x0,0
80000240:	00008067          	jalr	x0,0(x1)

80000244 <start_trigger>:
80000244:	00000513          	addi	x10,x0,0
80000248:	deadc2b7          	lui	x5,0xdeadc
8000024c:	eef28293          	addi	x5,x5,-273 # deadbeef <_end+0x5e9d9eef>
80000250:	00008067          	jalr	x0,0(x1)

80000254 <stop_trigger>:
80000254:	beefe2b7          	lui	x5,0xbeefe
80000258:	ead28293          	addi	x5,x5,-339 # beefdead <_end+0x3edfbead>
8000025c:	00008067          	jalr	x0,0(x1)

80000260 <__mulsi3>:
80000260:	00050613          	addi	x12,x10,0
80000264:	00000513          	addi	x10,x0,0
80000268:	0015f693          	andi	x13,x11,1
8000026c:	00068463          	beq	x13,x0,80000274 <__mulsi3+0x14>
80000270:	00c50533          	add	x10,x10,x12
80000274:	0015d593          	srli	x11,x11,0x1
80000278:	00161613          	slli	x12,x12,0x1
8000027c:	fe0596e3          	bne	x11,x0,80000268 <__mulsi3+0x8>
80000280:	00008067          	jalr	x0,0(x1)

Disassembly of section .data:

80100000 <stack_begin>:
	...

80101000 <stack_end>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	2029                	.insn	2, 0x2029
   8:	3331                	.insn	2, 0x3331
   a:	322e                	.insn	2, 0x322e
   c:	302e                	.insn	2, 0x302e
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2841                	.insn	2, 0x2841
   2:	0000                	.insn	2, 0x
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	x0,x16,14 <_heap_size+0x14>
   c:	001e                	.insn	2, 0x001e
   e:	0000                	.insn	2, 0x
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	697a                	.insn	2, 0x697a
  1e:	32727363          	bgeu	x4,x7,344 <_heap_size+0x344>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.


Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	0076                	.insn	2, 0x0076
   2:	0000                	.insn	2, 0x
   4:	0005                	.insn	2, 0x0005
   6:	0004                	.insn	2, 0x0004
   8:	002e                	.insn	2, 0x002e
   a:	0000                	.insn	2, 0x
   c:	0101                	.insn	2, 0x0101
   e:	fb01                	.insn	2, 0xfb01
  10:	0d0e                	.insn	2, 0x0d0e
  12:	0100                	.insn	2, 0x0100
  14:	0101                	.insn	2, 0x0101
  16:	0001                	.insn	2, 0x0001
  18:	0000                	.insn	2, 0x
  1a:	0001                	.insn	2, 0x0001
  1c:	0100                	.insn	2, 0x0100
  1e:	0101                	.insn	2, 0x0101
  20:	021f 0000 0000      	.insn	6, 0x021f
  26:	0066                	.insn	2, 0x0066
  28:	0000                	.insn	2, 0x
  2a:	0102                	.insn	2, 0x0102
  2c:	021f 020f 008f      	.insn	6, 0x008f020f021f
  32:	0000                	.insn	2, 0x
  34:	8f01                	.insn	2, 0x8f01
  36:	0000                	.insn	2, 0x
  38:	0100                	.insn	2, 0x0100
  3a:	0500                	.insn	2, 0x0500
  3c:	6002                	.insn	2, 0x6002
  3e:	0002                	.insn	2, 0x0002
  40:	0380                	.insn	2, 0x0380
  42:	0124                	.insn	2, 0x0124
  44:	04090103          	lb	x2,64(x18)
  48:	0100                	.insn	2, 0x0100
  4a:	04090203          	lb	x4,64(x18)
  4e:	0100                	.insn	2, 0x0100
  50:	04090103          	lb	x2,64(x18)
  54:	0100                	.insn	2, 0x0100
  56:	04090103          	lb	x2,64(x18)
  5a:	0100                	.insn	2, 0x0100
  5c:	04090203          	lb	x4,64(x18)
  60:	0100                	.insn	2, 0x0100
  62:	04090103          	lb	x2,64(x18)
  66:	0100                	.insn	2, 0x0100
  68:	04090103          	lb	x2,64(x18)
  6c:	0100                	.insn	2, 0x0100
  6e:	04090103          	lb	x2,64(x18)
  72:	0100                	.insn	2, 0x0100
  74:	0409                	.insn	2, 0x0409
  76:	0000                	.insn	2, 0x
  78:	0101                	.insn	2, 0x0101

Disassembly of section .debug_line_str:

00000000 <.debug_line_str>:
   0:	6d6f682f          	.insn	4, 0x6d6f682f
   4:	2f65                	.insn	2, 0x2f65
   6:	6c6c6173          	.insn	4, 0x6c6c6173
   a:	7261                	.insn	2, 0x7261
   c:	6f6f742f          	.insn	4, 0x6f6f742f
  10:	736c                	.insn	2, 0x736c
  12:	7369722f          	.insn	4, 0x7369722f
  16:	672d7663          	bgeu	x26,x18,682 <_heap_size+0x682>
  1a:	756e                	.insn	2, 0x756e
  1c:	742d                	.insn	2, 0x742d
  1e:	636c6f6f          	jal	x30,c6654 <_stack_size+0xc5654>
  22:	6168                	.insn	2, 0x6168
  24:	6e69                	.insn	2, 0x6e69
  26:	6975622f          	.insn	4, 0x6975622f
  2a:	646c                	.insn	2, 0x646c
  2c:	672d                	.insn	2, 0x672d
  2e:	6e2d6363          	bltu	x26,x2,714 <_heap_size+0x714>
  32:	7765                	.insn	2, 0x7765
  34:	696c                	.insn	2, 0x696c
  36:	2d62                	.insn	2, 0x2d62
  38:	67617473          	.insn	4, 0x67617473
  3c:	3265                	.insn	2, 0x3265
  3e:	7369722f          	.insn	4, 0x7369722f
  42:	34367663          	bgeu	x12,x3,38e <_heap_size+0x38e>
  46:	752d                	.insn	2, 0x752d
  48:	6b6e                	.insn	2, 0x6b6e
  4a:	6f6e                	.insn	2, 0x6f6e
  4c:	652d6e77          	.insn	4, 0x652d6e77
  50:	666c                	.insn	2, 0x666c
  52:	3376722f          	.insn	4, 0x3376722f
  56:	6932                	.insn	2, 0x6932
  58:	706c692f          	.insn	4, 0x706c692f
  5c:	6c2f3233          	.insn	4, 0x6c2f3233
  60:	6269                	.insn	2, 0x6269
  62:	00636367          	.insn	4, 0x00636367
  66:	2e2e                	.insn	2, 0x2e2e
  68:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
  6c:	2e2e                	.insn	2, 0x2e2e
  6e:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
  72:	2e2e                	.insn	2, 0x2e2e
  74:	672f2e2f          	.insn	4, 0x672f2e2f
  78:	6c2f6363          	bltu	x30,x2,73e <_heap_size+0x73e>
  7c:	6269                	.insn	2, 0x6269
  7e:	2f636367          	.insn	4, 0x2f636367
  82:	666e6f63          	bltu	x28,x6,700 <_heap_size+0x700>
  86:	6769                	.insn	2, 0x6769
  88:	7369722f          	.insn	4, 0x7369722f
  8c:	6d007663          	bgeu	x0,x16,758 <_heap_size+0x758>
  90:	6c75                	.insn	2, 0x6c75
  92:	6964                	.insn	2, 0x6964
  94:	00532e33          	slt	x28,x6,x5

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	002d                	.insn	2, 0x002d
   2:	0000                	.insn	2, 0x
   4:	0005                	.insn	2, 0x0005
   6:	0401                	.insn	2, 0x0401
   8:	0000                	.insn	2, 0x
   a:	0000                	.insn	2, 0x
   c:	0001                	.insn	2, 0x0001
   e:	0000                	.insn	2, 0x
  10:	6000                	.insn	2, 0x6000
  12:	0002                	.insn	2, 0x0002
  14:	2480                	.insn	2, 0x2480
  16:	0000                	.insn	2, 0x
  18:	0000                	.insn	2, 0x
  1a:	0032                	.insn	2, 0x0032
  1c:	0000                	.insn	2, 0x
  1e:	0098                	.insn	2, 0x0098
  20:	0000                	.insn	2, 0x
  22:	8001                	.insn	2, 0x8001
  24:	a402                	.insn	2, 0xa402
  26:	0000                	.insn	2, 0x
  28:	2f00                	.insn	2, 0x2f00
  2a:	0260                	.insn	2, 0x0260
  2c:	8000                	.insn	2, 0x8000
  2e:	0324                	.insn	2, 0x0324
	...

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	1101                	.insn	2, 0x1101
   2:	1001                	.insn	2, 0x1001
   4:	12011117          	auipc	x2,0x12011
   8:	1b0e030f          	.insn	4, 0x1b0e030f
   c:	250e                	.insn	2, 0x250e
   e:	130e                	.insn	2, 0x130e
  10:	0005                	.insn	2, 0x0005
  12:	0200                	.insn	2, 0x0200
  14:	002e                	.insn	2, 0x002e
  16:	193f0e03          	lb	x28,403(x30)
  1a:	1549                	.insn	2, 0x1549
  1c:	0111                	.insn	2, 0x0111
  1e:	0f12                	.insn	2, 0x0f12
  20:	0000                	.insn	2, 0x
  22:	00003b03          	.insn	4, 0x3b03
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	001c                	.insn	2, 0x001c
   2:	0000                	.insn	2, 0x
   4:	0002                	.insn	2, 0x0002
   6:	0000                	.insn	2, 0x
   8:	0000                	.insn	2, 0x
   a:	0004                	.insn	2, 0x0004
   c:	0000                	.insn	2, 0x
   e:	0000                	.insn	2, 0x
  10:	0260                	.insn	2, 0x0260
  12:	8000                	.insn	2, 0x8000
  14:	0024                	.insn	2, 0x0024
	...

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	2e2e                	.insn	2, 0x2e2e
   2:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
   6:	2e2e                	.insn	2, 0x2e2e
   8:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
   c:	2e2e                	.insn	2, 0x2e2e
   e:	672f2e2f          	.insn	4, 0x672f2e2f
  12:	6c2f6363          	bltu	x30,x2,6d8 <_heap_size+0x6d8>
  16:	6269                	.insn	2, 0x6269
  18:	2f636367          	.insn	4, 0x2f636367
  1c:	666e6f63          	bltu	x28,x6,69a <_heap_size+0x69a>
  20:	6769                	.insn	2, 0x6769
  22:	7369722f          	.insn	4, 0x7369722f
  26:	6d2f7663          	bgeu	x30,x18,6f2 <_heap_size+0x6f2>
  2a:	6c75                	.insn	2, 0x6c75
  2c:	6964                	.insn	2, 0x6964
  2e:	00532e33          	slt	x28,x6,x5
  32:	6d6f682f          	.insn	4, 0x6d6f682f
  36:	2f65                	.insn	2, 0x2f65
  38:	6c6c6173          	.insn	4, 0x6c6c6173
  3c:	7261                	.insn	2, 0x7261
  3e:	6f6f742f          	.insn	4, 0x6f6f742f
  42:	736c                	.insn	2, 0x736c
  44:	7369722f          	.insn	4, 0x7369722f
  48:	672d7663          	bgeu	x26,x18,6b4 <_heap_size+0x6b4>
  4c:	756e                	.insn	2, 0x756e
  4e:	742d                	.insn	2, 0x742d
  50:	636c6f6f          	jal	x30,c6686 <_stack_size+0xc5686>
  54:	6168                	.insn	2, 0x6168
  56:	6e69                	.insn	2, 0x6e69
  58:	6975622f          	.insn	4, 0x6975622f
  5c:	646c                	.insn	2, 0x646c
  5e:	672d                	.insn	2, 0x672d
  60:	6e2d6363          	bltu	x26,x2,746 <_heap_size+0x746>
  64:	7765                	.insn	2, 0x7765
  66:	696c                	.insn	2, 0x696c
  68:	2d62                	.insn	2, 0x2d62
  6a:	67617473          	.insn	4, 0x67617473
  6e:	3265                	.insn	2, 0x3265
  70:	7369722f          	.insn	4, 0x7369722f
  74:	34367663          	bgeu	x12,x3,3c0 <_heap_size+0x3c0>
  78:	752d                	.insn	2, 0x752d
  7a:	6b6e                	.insn	2, 0x6b6e
  7c:	6f6e                	.insn	2, 0x6f6e
  7e:	652d6e77          	.insn	4, 0x652d6e77
  82:	666c                	.insn	2, 0x666c
  84:	3376722f          	.insn	4, 0x3376722f
  88:	6932                	.insn	2, 0x6932
  8a:	706c692f          	.insn	4, 0x706c692f
  8e:	6c2f3233          	.insn	4, 0x6c2f3233
  92:	6269                	.insn	2, 0x6269
  94:	00636367          	.insn	4, 0x00636367
  98:	20554e47          	.insn	4, 0x20554e47
  9c:	5341                	.insn	2, 0x5341
  9e:	3220                	.insn	2, 0x3220
  a0:	342e                	.insn	2, 0x342e
  a2:	0032                	.insn	2, 0x0032
  a4:	5f5f 756d 736c      	.insn	6, 0x736c756d5f5f
  aa:	3369                	.insn	2, 0x3369
	...
