
bd/src/matmult-int/matmult-int:     Dateiformat elf32-littleriscv


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
800000ac:	32c000ef          	jal	x1,800003d8 <initialise_board>
800000b0:	23c000ef          	jal	x1,800002ec <initialise_benchmark>
800000b4:	00100513          	addi	x10,x0,1
800000b8:	228000ef          	jal	x1,800002e0 <warm_caches>
800000bc:	324000ef          	jal	x1,800003e0 <start_trigger>
800000c0:	224000ef          	jal	x1,800002e4 <benchmark>
800000c4:	00a12623          	sw	x10,12(x2)
800000c8:	328000ef          	jal	x1,800003f0 <stop_trigger>
800000cc:	00c12503          	lw	x10,12(x2)
800000d0:	2c8000ef          	jal	x1,80000398 <verify_benchmark>
800000d4:	01c12083          	lw	x1,28(x2)
800000d8:	00153513          	sltiu	x10,x10,1
800000dc:	02010113          	addi	x2,x2,32
800000e0:	00008067          	jalr	x0,0(x1)

800000e4 <values_match>:
800000e4:	40b50533          	sub	x10,x10,x11
800000e8:	00153513          	sltiu	x10,x10,1
800000ec:	00008067          	jalr	x0,0(x1)

800000f0 <InitSeed>:
800000f0:	801037b7          	lui	x15,0x80103
800000f4:	5807a023          	sw	x0,1408(x15) # 80103580 <Seed>
800000f8:	00008067          	jalr	x0,0(x1)

800000fc <RandomInteger>:
800000fc:	ff010113          	addi	x2,x2,-16
80000100:	00812423          	sw	x8,8(x2)
80000104:	80103437          	lui	x8,0x80103
80000108:	58042783          	lw	x15,1408(x8) # 80103580 <Seed>
8000010c:	000025b7          	lui	x11,0x2
80000110:	f9f58593          	addi	x11,x11,-97 # 1f9f <_stack_size+0xf9f>
80000114:	00579513          	slli	x10,x15,0x5
80000118:	00f50533          	add	x10,x10,x15
8000011c:	00251513          	slli	x10,x10,0x2
80000120:	00f50533          	add	x10,x10,x15
80000124:	05150513          	addi	x10,x10,81
80000128:	00112623          	sw	x1,12(x2)
8000012c:	378000ef          	jal	x1,800004a4 <__modsi3>
80000130:	00c12083          	lw	x1,12(x2)
80000134:	58a42023          	sw	x10,1408(x8)
80000138:	00812403          	lw	x8,8(x2)
8000013c:	01010113          	addi	x2,x2,16
80000140:	00008067          	jalr	x0,0(x1)

80000144 <Multiply>:
80000144:	fc010113          	addi	x2,x2,-64
80000148:	02912a23          	sw	x9,52(x2)
8000014c:	03312623          	sw	x19,44(x2)
80000150:	03412423          	sw	x20,40(x2)
80000154:	03512223          	sw	x21,36(x2)
80000158:	01912a23          	sw	x25,20(x2)
8000015c:	01a12823          	sw	x26,16(x2)
80000160:	01b12623          	sw	x27,12(x2)
80000164:	02112e23          	sw	x1,60(x2)
80000168:	02812c23          	sw	x8,56(x2)
8000016c:	03212823          	sw	x18,48(x2)
80000170:	03612023          	sw	x22,32(x2)
80000174:	01712e23          	sw	x23,28(x2)
80000178:	01812c23          	sw	x24,24(x2)
8000017c:	00050a13          	addi	x20,x10,0
80000180:	00058a93          	addi	x21,x11,0
80000184:	00060993          	addi	x19,x12,0
80000188:	00000493          	addi	x9,x0,0
8000018c:	01400c93          	addi	x25,x0,20
80000190:	05000d13          	addi	x26,x0,80
80000194:	64000d93          	addi	x27,x0,1600
80000198:	00998433          	add	x8,x19,x9
8000019c:	00000913          	addi	x18,x0,0
800001a0:	00042023          	sw	x0,0(x8)
800001a4:	009a0c33          	add	x24,x20,x9
800001a8:	012a8bb3          	add	x23,x21,x18
800001ac:	00000b13          	addi	x22,x0,0
800001b0:	000ba583          	lw	x11,0(x23)
800001b4:	000c2503          	lw	x10,0(x24)
800001b8:	001b0b13          	addi	x22,x22,1
800001bc:	004c0c13          	addi	x24,x24,4
800001c0:	23c000ef          	jal	x1,800003fc <__mulsi3>
800001c4:	00042783          	lw	x15,0(x8)
800001c8:	050b8b93          	addi	x23,x23,80
800001cc:	00a787b3          	add	x15,x15,x10
800001d0:	00f42023          	sw	x15,0(x8)
800001d4:	fd9b1ee3          	bne	x22,x25,800001b0 <Multiply+0x6c>
800001d8:	00490913          	addi	x18,x18,4
800001dc:	00440413          	addi	x8,x8,4
800001e0:	fda910e3          	bne	x18,x26,800001a0 <Multiply+0x5c>
800001e4:	05048493          	addi	x9,x9,80
800001e8:	fbb498e3          	bne	x9,x27,80000198 <Multiply+0x54>
800001ec:	03c12083          	lw	x1,60(x2)
800001f0:	03812403          	lw	x8,56(x2)
800001f4:	03412483          	lw	x9,52(x2)
800001f8:	03012903          	lw	x18,48(x2)
800001fc:	02c12983          	lw	x19,44(x2)
80000200:	02812a03          	lw	x20,40(x2)
80000204:	02412a83          	lw	x21,36(x2)
80000208:	02012b03          	lw	x22,32(x2)
8000020c:	01c12b83          	lw	x23,28(x2)
80000210:	01812c03          	lw	x24,24(x2)
80000214:	01412c83          	lw	x25,20(x2)
80000218:	01012d03          	lw	x26,16(x2)
8000021c:	00c12d83          	lw	x27,12(x2)
80000220:	04010113          	addi	x2,x2,64
80000224:	00008067          	jalr	x0,0(x1)

80000228 <Test>:
80000228:	f1dff06f          	jal	x0,80000144 <Multiply>

8000022c <benchmark_body>:
8000022c:	fe010113          	addi	x2,x2,-32
80000230:	00812c23          	sw	x8,24(x2)
80000234:	00912a23          	sw	x9,20(x2)
80000238:	80101437          	lui	x8,0x80101
8000023c:	801024b7          	lui	x9,0x80102
80000240:	01412423          	sw	x20,8(x2)
80000244:	64040413          	addi	x8,x8,1600 # 80101640 <ArrayA>
80000248:	64048493          	addi	x9,x9,1600 # 80102640 <ArrayB+0x380>
8000024c:	80103a37          	lui	x20,0x80103
80000250:	01212823          	sw	x18,16(x2)
80000254:	01312623          	sw	x19,12(x2)
80000258:	01512223          	sw	x21,4(x2)
8000025c:	01612023          	sw	x22,0(x2)
80000260:	00112e23          	sw	x1,28(x2)
80000264:	00050913          	addi	x18,x10,0
80000268:	00000993          	addi	x19,x0,0
8000026c:	64040b13          	addi	x22,x8,1600
80000270:	c8048a93          	addi	x21,x9,-896
80000274:	640a0a13          	addi	x20,x20,1600 # 80103640 <Seed+0xc0>
80000278:	0329c863          	blt	x19,x18,800002a8 <benchmark_body+0x7c>
8000027c:	01c12083          	lw	x1,28(x2)
80000280:	01812403          	lw	x8,24(x2)
80000284:	01412483          	lw	x9,20(x2)
80000288:	01012903          	lw	x18,16(x2)
8000028c:	00c12983          	lw	x19,12(x2)
80000290:	00812a03          	lw	x20,8(x2)
80000294:	00412a83          	lw	x21,4(x2)
80000298:	00012b03          	lw	x22,0(x2)
8000029c:	00000513          	addi	x10,x0,0
800002a0:	02010113          	addi	x2,x2,32
800002a4:	00008067          	jalr	x0,0(x1)
800002a8:	64000613          	addi	x12,x0,1600
800002ac:	000b0593          	addi	x11,x22,0
800002b0:	00040513          	addi	x10,x8,0
800002b4:	29c000ef          	jal	x1,80000550 <memcpy>
800002b8:	64000613          	addi	x12,x0,1600
800002bc:	2c048593          	addi	x11,x9,704
800002c0:	000a8513          	addi	x10,x21,0
800002c4:	28c000ef          	jal	x1,80000550 <memcpy>
800002c8:	900a0613          	addi	x12,x20,-1792
800002cc:	000a8593          	addi	x11,x21,0
800002d0:	00040513          	addi	x10,x8,0
800002d4:	e71ff0ef          	jal	x1,80000144 <Multiply>
800002d8:	00198993          	addi	x19,x19,1
800002dc:	f9dff06f          	jal	x0,80000278 <benchmark_body+0x4c>

800002e0 <warm_caches>:
800002e0:	f4dff06f          	jal	x0,8000022c <benchmark_body>

800002e4 <benchmark>:
800002e4:	00100513          	addi	x10,x0,1
800002e8:	f45ff06f          	jal	x0,8000022c <benchmark_body>

800002ec <initialise_benchmark>:
800002ec:	fe010113          	addi	x2,x2,-32
800002f0:	00812c23          	sw	x8,24(x2)
800002f4:	80102437          	lui	x8,0x80102
800002f8:	801037b7          	lui	x15,0x80103
800002fc:	c8040413          	addi	x8,x8,-896 # 80101c80 <ArrayA_ref>
80000300:	01312623          	sw	x19,12(x2)
80000304:	01412423          	sw	x20,8(x2)
80000308:	00112e23          	sw	x1,28(x2)
8000030c:	00912a23          	sw	x9,20(x2)
80000310:	01212823          	sw	x18,16(x2)
80000314:	5807a023          	sw	x0,1408(x15) # 80103580 <Seed>
80000318:	64040993          	addi	x19,x8,1600
8000031c:	01400a13          	addi	x20,x0,20
80000320:	00040913          	addi	x18,x8,0
80000324:	00000493          	addi	x9,x0,0
80000328:	dd5ff0ef          	jal	x1,800000fc <RandomInteger>
8000032c:	00a92023          	sw	x10,0(x18)
80000330:	00148493          	addi	x9,x9,1
80000334:	00490913          	addi	x18,x18,4
80000338:	ff4498e3          	bne	x9,x20,80000328 <initialise_benchmark+0x3c>
8000033c:	05040413          	addi	x8,x8,80
80000340:	ff3410e3          	bne	x8,x19,80000320 <initialise_benchmark+0x34>
80000344:	80103437          	lui	x8,0x80103
80000348:	90040413          	addi	x8,x8,-1792 # 80102900 <ArrayB_ref>
8000034c:	64040993          	addi	x19,x8,1600
80000350:	01400a13          	addi	x20,x0,20
80000354:	00040913          	addi	x18,x8,0
80000358:	00000493          	addi	x9,x0,0
8000035c:	da1ff0ef          	jal	x1,800000fc <RandomInteger>
80000360:	00a92023          	sw	x10,0(x18)
80000364:	00148493          	addi	x9,x9,1
80000368:	00490913          	addi	x18,x18,4
8000036c:	ff4498e3          	bne	x9,x20,8000035c <initialise_benchmark+0x70>
80000370:	05040413          	addi	x8,x8,80
80000374:	ff3410e3          	bne	x8,x19,80000354 <initialise_benchmark+0x68>
80000378:	01c12083          	lw	x1,28(x2)
8000037c:	01812403          	lw	x8,24(x2)
80000380:	01412483          	lw	x9,20(x2)
80000384:	01012903          	lw	x18,16(x2)
80000388:	00c12983          	lw	x19,12(x2)
8000038c:	00812a03          	lw	x20,8(x2)
80000390:	02010113          	addi	x2,x2,32
80000394:	00008067          	jalr	x0,0(x1)

80000398 <verify_benchmark>:
80000398:	9b010113          	addi	x2,x2,-1616
8000039c:	801015b7          	lui	x11,0x80101
800003a0:	64000613          	addi	x12,x0,1600
800003a4:	00058593          	addi	x11,x11,0 # 80101000 <stack_end>
800003a8:	00010513          	addi	x10,x2,0
800003ac:	64112623          	sw	x1,1612(x2)
800003b0:	1a0000ef          	jal	x1,80000550 <memcpy>
800003b4:	80103537          	lui	x10,0x80103
800003b8:	00010593          	addi	x11,x2,0
800003bc:	64000613          	addi	x12,x0,1600
800003c0:	f4050513          	addi	x10,x10,-192 # 80102f40 <ResultArray>
800003c4:	110000ef          	jal	x1,800004d4 <memcmp>
800003c8:	64c12083          	lw	x1,1612(x2)
800003cc:	00153513          	sltiu	x10,x10,1
800003d0:	65010113          	addi	x2,x2,1616
800003d4:	00008067          	jalr	x0,0(x1)

800003d8 <initialise_board>:
800003d8:	00000513          	addi	x10,x0,0
800003dc:	00008067          	jalr	x0,0(x1)

800003e0 <start_trigger>:
800003e0:	00000513          	addi	x10,x0,0
800003e4:	deadc2b7          	lui	x5,0xdeadc
800003e8:	eef28293          	addi	x5,x5,-273 # deadbeef <_end+0x5e9d795f>
800003ec:	00008067          	jalr	x0,0(x1)

800003f0 <stop_trigger>:
800003f0:	beefe2b7          	lui	x5,0xbeefe
800003f4:	ead28293          	addi	x5,x5,-339 # beefdead <_end+0x3edf991d>
800003f8:	00008067          	jalr	x0,0(x1)

800003fc <__mulsi3>:
800003fc:	00050613          	addi	x12,x10,0
80000400:	00000513          	addi	x10,x0,0
80000404:	0015f693          	andi	x13,x11,1
80000408:	00068463          	beq	x13,x0,80000410 <__mulsi3+0x14>
8000040c:	00c50533          	add	x10,x10,x12
80000410:	0015d593          	srli	x11,x11,0x1
80000414:	00161613          	slli	x12,x12,0x1
80000418:	fe0596e3          	bne	x11,x0,80000404 <__mulsi3+0x8>
8000041c:	00008067          	jalr	x0,0(x1)

80000420 <__divsi3>:
80000420:	06054063          	blt	x10,x0,80000480 <__umodsi3+0x10>
80000424:	0605c663          	blt	x11,x0,80000490 <__umodsi3+0x20>

80000428 <__hidden___udivsi3>:
80000428:	00058613          	addi	x12,x11,0
8000042c:	00050593          	addi	x11,x10,0
80000430:	fff00513          	addi	x10,x0,-1
80000434:	02060c63          	beq	x12,x0,8000046c <__hidden___udivsi3+0x44>
80000438:	00100693          	addi	x13,x0,1
8000043c:	00b67a63          	bgeu	x12,x11,80000450 <__hidden___udivsi3+0x28>
80000440:	00c05863          	bge	x0,x12,80000450 <__hidden___udivsi3+0x28>
80000444:	00161613          	slli	x12,x12,0x1
80000448:	00169693          	slli	x13,x13,0x1
8000044c:	feb66ae3          	bltu	x12,x11,80000440 <__hidden___udivsi3+0x18>
80000450:	00000513          	addi	x10,x0,0
80000454:	00c5e663          	bltu	x11,x12,80000460 <__hidden___udivsi3+0x38>
80000458:	40c585b3          	sub	x11,x11,x12
8000045c:	00d56533          	or	x10,x10,x13
80000460:	0016d693          	srli	x13,x13,0x1
80000464:	00165613          	srli	x12,x12,0x1
80000468:	fe0696e3          	bne	x13,x0,80000454 <__hidden___udivsi3+0x2c>
8000046c:	00008067          	jalr	x0,0(x1)

80000470 <__umodsi3>:
80000470:	00008293          	addi	x5,x1,0
80000474:	fb5ff0ef          	jal	x1,80000428 <__hidden___udivsi3>
80000478:	00058513          	addi	x10,x11,0
8000047c:	00028067          	jalr	x0,0(x5)
80000480:	40a00533          	sub	x10,x0,x10
80000484:	00b04863          	blt	x0,x11,80000494 <__umodsi3+0x24>
80000488:	40b005b3          	sub	x11,x0,x11
8000048c:	f9dff06f          	jal	x0,80000428 <__hidden___udivsi3>
80000490:	40b005b3          	sub	x11,x0,x11
80000494:	00008293          	addi	x5,x1,0
80000498:	f91ff0ef          	jal	x1,80000428 <__hidden___udivsi3>
8000049c:	40a00533          	sub	x10,x0,x10
800004a0:	00028067          	jalr	x0,0(x5)

800004a4 <__modsi3>:
800004a4:	00008293          	addi	x5,x1,0
800004a8:	0005ca63          	blt	x11,x0,800004bc <__modsi3+0x18>
800004ac:	00054c63          	blt	x10,x0,800004c4 <__modsi3+0x20>
800004b0:	f79ff0ef          	jal	x1,80000428 <__hidden___udivsi3>
800004b4:	00058513          	addi	x10,x11,0
800004b8:	00028067          	jalr	x0,0(x5)
800004bc:	40b005b3          	sub	x11,x0,x11
800004c0:	fe0558e3          	bge	x10,x0,800004b0 <__modsi3+0xc>
800004c4:	40a00533          	sub	x10,x0,x10
800004c8:	f61ff0ef          	jal	x1,80000428 <__hidden___udivsi3>
800004cc:	40b00533          	sub	x10,x0,x11
800004d0:	00028067          	jalr	x0,0(x5)

800004d4 <memcmp>:
800004d4:	00300793          	addi	x15,x0,3
800004d8:	02c7fe63          	bgeu	x15,x12,80000514 <memcmp+0x40>
800004dc:	00a5e7b3          	or	x15,x11,x10
800004e0:	0037f793          	andi	x15,x15,3
800004e4:	02079463          	bne	x15,x0,8000050c <memcmp+0x38>
800004e8:	00300693          	addi	x13,x0,3
800004ec:	0140006f          	jal	x0,80000500 <memcmp+0x2c>
800004f0:	ffc60613          	addi	x12,x12,-4
800004f4:	00450513          	addi	x10,x10,4
800004f8:	00458593          	addi	x11,x11,4
800004fc:	00c6fc63          	bgeu	x13,x12,80000514 <memcmp+0x40>
80000500:	00052703          	lw	x14,0(x10)
80000504:	0005a783          	lw	x15,0(x11)
80000508:	fef704e3          	beq	x14,x15,800004f0 <memcmp+0x1c>
8000050c:	fff60693          	addi	x13,x12,-1
80000510:	00c0006f          	jal	x0,8000051c <memcmp+0x48>
80000514:	fff60693          	addi	x13,x12,-1
80000518:	02060863          	beq	x12,x0,80000548 <memcmp+0x74>
8000051c:	00168693          	addi	x13,x13,1
80000520:	00d506b3          	add	x13,x10,x13
80000524:	0080006f          	jal	x0,8000052c <memcmp+0x58>
80000528:	02a68063          	beq	x13,x10,80000548 <memcmp+0x74>
8000052c:	00054783          	lbu	x15,0(x10)
80000530:	0005c703          	lbu	x14,0(x11)
80000534:	00150513          	addi	x10,x10,1
80000538:	00158593          	addi	x11,x11,1
8000053c:	fee786e3          	beq	x15,x14,80000528 <memcmp+0x54>
80000540:	40e78533          	sub	x10,x15,x14
80000544:	00008067          	jalr	x0,0(x1)
80000548:	00000513          	addi	x10,x0,0
8000054c:	00008067          	jalr	x0,0(x1)

80000550 <memcpy>:
80000550:	00a5c7b3          	xor	x15,x11,x10
80000554:	0037f793          	andi	x15,x15,3
80000558:	00c508b3          	add	x17,x10,x12
8000055c:	06079463          	bne	x15,x0,800005c4 <memcpy+0x74>
80000560:	00300793          	addi	x15,x0,3
80000564:	06c7f063          	bgeu	x15,x12,800005c4 <memcpy+0x74>
80000568:	00357793          	andi	x15,x10,3
8000056c:	00050713          	addi	x14,x10,0
80000570:	06079a63          	bne	x15,x0,800005e4 <memcpy+0x94>
80000574:	ffc8f613          	andi	x12,x17,-4
80000578:	40e606b3          	sub	x13,x12,x14
8000057c:	02000793          	addi	x15,x0,32
80000580:	08d7ce63          	blt	x15,x13,8000061c <memcpy+0xcc>
80000584:	00058693          	addi	x13,x11,0
80000588:	00070793          	addi	x15,x14,0
8000058c:	02c77863          	bgeu	x14,x12,800005bc <memcpy+0x6c>
80000590:	0006a803          	lw	x16,0(x13)
80000594:	00478793          	addi	x15,x15,4
80000598:	00468693          	addi	x13,x13,4
8000059c:	ff07ae23          	sw	x16,-4(x15)
800005a0:	fec7e8e3          	bltu	x15,x12,80000590 <memcpy+0x40>
800005a4:	fff60793          	addi	x15,x12,-1
800005a8:	40e787b3          	sub	x15,x15,x14
800005ac:	ffc7f793          	andi	x15,x15,-4
800005b0:	00478793          	addi	x15,x15,4
800005b4:	00f70733          	add	x14,x14,x15
800005b8:	00f585b3          	add	x11,x11,x15
800005bc:	01176863          	bltu	x14,x17,800005cc <memcpy+0x7c>
800005c0:	00008067          	jalr	x0,0(x1)
800005c4:	00050713          	addi	x14,x10,0
800005c8:	05157863          	bgeu	x10,x17,80000618 <memcpy+0xc8>
800005cc:	0005c783          	lbu	x15,0(x11)
800005d0:	00170713          	addi	x14,x14,1
800005d4:	00158593          	addi	x11,x11,1
800005d8:	fef70fa3          	sb	x15,-1(x14)
800005dc:	fee898e3          	bne	x17,x14,800005cc <memcpy+0x7c>
800005e0:	00008067          	jalr	x0,0(x1)
800005e4:	0005c683          	lbu	x13,0(x11)
800005e8:	00170713          	addi	x14,x14,1
800005ec:	00377793          	andi	x15,x14,3
800005f0:	fed70fa3          	sb	x13,-1(x14)
800005f4:	00158593          	addi	x11,x11,1
800005f8:	f6078ee3          	beq	x15,x0,80000574 <memcpy+0x24>
800005fc:	0005c683          	lbu	x13,0(x11)
80000600:	00170713          	addi	x14,x14,1
80000604:	00377793          	andi	x15,x14,3
80000608:	fed70fa3          	sb	x13,-1(x14)
8000060c:	00158593          	addi	x11,x11,1
80000610:	fc079ae3          	bne	x15,x0,800005e4 <memcpy+0x94>
80000614:	f61ff06f          	jal	x0,80000574 <memcpy+0x24>
80000618:	00008067          	jalr	x0,0(x1)
8000061c:	ff010113          	addi	x2,x2,-16
80000620:	00812623          	sw	x8,12(x2)
80000624:	02000413          	addi	x8,x0,32
80000628:	0005a383          	lw	x7,0(x11)
8000062c:	0045a283          	lw	x5,4(x11)
80000630:	0085af83          	lw	x31,8(x11)
80000634:	00c5af03          	lw	x30,12(x11)
80000638:	0105ae83          	lw	x29,16(x11)
8000063c:	0145ae03          	lw	x28,20(x11)
80000640:	0185a303          	lw	x6,24(x11)
80000644:	01c5a803          	lw	x16,28(x11)
80000648:	0205a683          	lw	x13,32(x11)
8000064c:	02470713          	addi	x14,x14,36
80000650:	40e607b3          	sub	x15,x12,x14
80000654:	fc772e23          	sw	x7,-36(x14)
80000658:	fe572023          	sw	x5,-32(x14)
8000065c:	fff72223          	sw	x31,-28(x14)
80000660:	ffe72423          	sw	x30,-24(x14)
80000664:	ffd72623          	sw	x29,-20(x14)
80000668:	ffc72823          	sw	x28,-16(x14)
8000066c:	fe672a23          	sw	x6,-12(x14)
80000670:	ff072c23          	sw	x16,-8(x14)
80000674:	fed72e23          	sw	x13,-4(x14)
80000678:	02458593          	addi	x11,x11,36
8000067c:	faf446e3          	blt	x8,x15,80000628 <memcpy+0xd8>
80000680:	00058693          	addi	x13,x11,0
80000684:	00070793          	addi	x15,x14,0
80000688:	02c77863          	bgeu	x14,x12,800006b8 <memcpy+0x168>
8000068c:	0006a803          	lw	x16,0(x13)
80000690:	00478793          	addi	x15,x15,4
80000694:	00468693          	addi	x13,x13,4
80000698:	ff07ae23          	sw	x16,-4(x15)
8000069c:	fec7e8e3          	bltu	x15,x12,8000068c <memcpy+0x13c>
800006a0:	fff60793          	addi	x15,x12,-1
800006a4:	40e787b3          	sub	x15,x15,x14
800006a8:	ffc7f793          	andi	x15,x15,-4
800006ac:	00478793          	addi	x15,x15,4
800006b0:	00f70733          	add	x14,x14,x15
800006b4:	00f585b3          	add	x11,x11,x15
800006b8:	01176863          	bltu	x14,x17,800006c8 <memcpy+0x178>
800006bc:	00c12403          	lw	x8,12(x2)
800006c0:	01010113          	addi	x2,x2,16
800006c4:	00008067          	jalr	x0,0(x1)
800006c8:	0005c783          	lbu	x15,0(x11)
800006cc:	00170713          	addi	x14,x14,1
800006d0:	00158593          	addi	x11,x11,1
800006d4:	fef70fa3          	sb	x15,-1(x14)
800006d8:	fee882e3          	beq	x17,x14,800006bc <memcpy+0x16c>
800006dc:	0005c783          	lbu	x15,0(x11)
800006e0:	00170713          	addi	x14,x14,1
800006e4:	00158593          	addi	x11,x11,1
800006e8:	fef70fa3          	sb	x15,-1(x14)
800006ec:	fce89ee3          	bne	x17,x14,800006c8 <memcpy+0x178>
800006f0:	fcdff06f          	jal	x0,800006bc <memcpy+0x16c>

Disassembly of section .data:

80100000 <stack_begin>:
	...

80101000 <stack_end>:
80101000:	9510                	.insn	2, 0x9510
80101002:	1158                	.insn	2, 0x1158
80101004:	12c6850b          	.insn	4, 0x12c6850b
80101008:	f6f2                	.insn	2, 0xf6f2
8010100a:	10a1                	.insn	2, 0x10a1
8010100c:	0c392f27          	.insn	4, 0x0c392f27
80101010:	d7a1                	.insn	2, 0xd7a1
80101012:	3f1916cf          	.insn	4, 0x3f1916cf
80101016:	1209                	.insn	2, 0x1209
80101018:	14befcf3          	.insn	4, 0x14befcf3
8010101c:	c1da                	.insn	2, 0xc1da
8010101e:	126a                	.insn	2, 0x126a
80101020:	37b8                	.insn	2, 0x37b8
80101022:	1474                	.insn	2, 0x1474
80101024:	f91f 124d 2f4a      	.insn	6, 0x2f4a124df91f
8010102a:	1170                	.insn	2, 0x1170
8010102c:	ac8e                	.insn	2, 0xac8e
8010102e:	0e5c                	.insn	2, 0x0e5c
80101030:	0ddf9267          	.insn	4, 0x0ddf9267
80101034:	7831                	.insn	2, 0x7831
80101036:	0eb1                	.insn	2, 0x0eb1
80101038:	018e                	.insn	2, 0x018e
8010103a:	1394                	.insn	2, 0x1394
8010103c:	0fb732f7          	.insn	4, 0x0fb732f7
80101040:	1350190b          	.insn	4, 0x1350190b
80101044:	7246                	.insn	2, 0x7246
80101046:	13f2                	.insn	2, 0x13f2
80101048:	110bb083          	.insn	4, 0x110bb083
8010104c:	eef8                	.insn	2, 0xeef8
8010104e:	1495                	.insn	2, 0x1495
80101050:	0f08e7ab          	.insn	4, 0x0f08e7ab
80101054:	13dfc78b          	.insn	4, 0x13dfc78b
80101058:	11d5bd33          	.insn	4, 0x11d5bd33
8010105c:	0ec44d17          	auipc	x26,0xec44
80101060:	f9be                	.insn	2, 0xf9be
80101062:	192e                	.insn	2, 0x192e
80101064:	e4b9                	.insn	2, 0xe4b9
80101066:	12e0                	.insn	2, 0x12e0
80101068:	02be                	.insn	2, 0x02be
8010106a:	1570                	.insn	2, 0x1570
8010106c:	83b0                	.insn	2, 0x83b0
8010106e:	108e                	.insn	2, 0x108e
80101070:	1345ba5b          	.insn	4, 0x1345ba5b
80101074:	d4d8                	.insn	2, 0xd4d8
80101076:	131c                	.insn	2, 0x131c
80101078:	3a4a                	.insn	2, 0x3a4a
8010107a:	0ee5                	.insn	2, 0x0ee5
8010107c:	9360                	.insn	2, 0x9360
8010107e:	0efd                	.insn	2, 0x0efd
80101080:	9cf4                	.insn	2, 0x9cf4
80101082:	73780e6f          	jal	x28,80181fb8 <_end+0x7da28>
80101086:	0fb4                	.insn	2, 0x0fb4
80101088:	14c13a13          	sltiu	x20,x2,332
8010108c:	312c                	.insn	2, 0x312c
8010108e:	1141                	.insn	2, 0x1141
80101090:	13962743          	.insn	4, 0x13962743
80101094:	11edd75b          	.insn	4, 0x11edd75b
80101098:	f9f2                	.insn	2, 0xf9f2
8010109a:	100d                	.insn	2, 0x100d
8010109c:	aa24                	.insn	2, 0xaa24
8010109e:	1238                	.insn	2, 0x1238
801010a0:	6b92                	.insn	2, 0x6b92
801010a2:	122c                	.insn	2, 0x122c
801010a4:	12d9a28f          	.insn	4, 0x12d9a28f
801010a8:	0fb09343          	.insn	4, 0x0fb09343
801010ac:	0c742807          	.insn	4, 0x0c742807
801010b0:	1d0c                	.insn	2, 0x1d0c
801010b2:	bd321927          	.insn	4, 0xbd321927
801010b6:	c62213f7          	.insn	4, 0xc62213f7
801010ba:	14c6                	.insn	2, 0x14c6
801010bc:	10bf999b          	.insn	4, 0x10bf999b
801010c0:	3bd2                	.insn	2, 0x3bd2
801010c2:	1145                	.insn	2, 0x1145
801010c4:	0f7ab9b7          	lui	x19,0xf7ab
801010c8:	2846                	.insn	2, 0x2846
801010ca:	1199                	.insn	2, 0x1199
801010cc:	1287f543          	.insn	4, 0x1287f543
801010d0:	60f1                	.insn	2, 0x60f1
801010d2:	0ef4                	.insn	2, 0x0ef4
801010d4:	0c79                	.insn	2, 0x0c79
801010d6:	0ee9                	.insn	2, 0x0ee9
801010d8:	12c7fbe3          	bgeu	x15,x12,80101a0e <ArrayA+0x3ce>
801010dc:	a400                	.insn	2, 0xa400
801010de:	0e16                	.insn	2, 0x0e16
801010e0:	12a628fb          	.insn	4, 0x12a628fb
801010e4:	9a4d                	.insn	2, 0x9a4d
801010e6:	12a1                	.insn	2, 0x12a1
801010e8:	107366e3          	bltu	x6,x7,801019f4 <ArrayA+0x3b4>
801010ec:	209d                	.insn	2, 0x209d
801010ee:	b3ed1483          	lh	x9,-1218(x26) # 8ed44b9a <_end+0xec4060a>
801010f2:	1116                	.insn	2, 0x1116
801010f4:	2540                	.insn	2, 0x2540
801010f6:	136e                	.insn	2, 0x136e
801010f8:	4ffa                	.insn	2, 0x4ffa
801010fa:	0f15                	.insn	2, 0x0f15
801010fc:	7c12                	.insn	2, 0x7c12
801010fe:	0d5f 03b2 1512      	.insn	6, 0x151203b20d5f
80101104:	7ea2                	.insn	2, 0x7ea2
80101106:	1245                	.insn	2, 0x1245
80101108:	192c                	.insn	2, 0x192c
8010110a:	1348                	.insn	2, 0x1348
8010110c:	eac1                	.insn	2, 0xeac1
8010110e:	0f71                	.insn	2, 0x0f71
80101110:	9c9a                	.insn	2, 0x9c9a
80101112:	4d4a1257          	.insn	4, 0x4d4a1257
80101116:	10d5                	.insn	2, 0x10d5
80101118:	ab82                	.insn	2, 0xab82
8010111a:	10c1                	.insn	2, 0x10c1
8010111c:	0eb7f567          	.insn	4, 0x0eb7f567
80101120:	297f 0c64 5864 0def 	.insn	14, 0x34de14417f3a0def58640c64297f
80101128:	7f3a 1441 34de 
8010112e:	ad741087          	.insn	4, 0xad741087
80101132:	1311                	.insn	2, 0x1311
80101134:	1253a22f          	.insn	4, 0x1253a22f
80101138:	406c                	.insn	2, 0x406c
8010113a:	1151                	.insn	2, 0x1151
8010113c:	116c1b3f 103f1b77 	.insn	8, 0x103f1b77116c1b3f
80101144:	af58                	.insn	2, 0xaf58
80101146:	1682                	.insn	2, 0x1682
80101148:	00c1                	.insn	2, 0x00c1
8010114a:	14fc1227          	.insn	4, 0x14fc1227
8010114e:	0fad                	.insn	2, 0x0fad
80101150:	9405                	.insn	2, 0x9405
80101152:	165a                	.insn	2, 0x165a
80101154:	925e                	.insn	2, 0x925e
80101156:	1365                	.insn	2, 0x1365
80101158:	91dc                	.insn	2, 0x91dc
8010115a:	1879                	.insn	2, 0x1879
8010115c:	ed32                	.insn	2, 0xed32
8010115e:	12aa                	.insn	2, 0x12aa
80101160:	15473b77          	.insn	4, 0x15473b77
80101164:	126376c3          	.insn	4, 0x126376c3
80101168:	798a                	.insn	2, 0x798a
8010116a:	0cfe                	.insn	2, 0x0cfe
8010116c:	d2df 103d d75c      	.insn	6, 0xd75c103dd2df
80101172:	0fda                	.insn	2, 0x0fda
80101174:	87f6                	.insn	2, 0x87f6
80101176:	35a40fc7          	.insn	4, 0x35a40fc7
8010117a:	15e8                	.insn	2, 0x15e8
8010117c:	1220e8f3          	.insn	4, 0x1220e8f3
80101180:	610c                	.insn	2, 0x610c
80101182:	152d                	.insn	2, 0x152d
80101184:	ba1c                	.insn	2, 0xba1c
80101186:	4c8f1073          	.insn	4, 0x4c8f1073
8010118a:	0efc                	.insn	2, 0x0efc
8010118c:	11f45513          	.insn	4, 0x11f45513
80101190:	c03c                	.insn	2, 0xc03c
80101192:	103e                	.insn	2, 0x103e
80101194:	0a7c                	.insn	2, 0x0a7c
80101196:	132a                	.insn	2, 0x132a
80101198:	05c9                	.insn	2, 0x05c9
8010119a:	55af112f          	.insn	4, 0x55af112f
8010119e:	0ec4                	.insn	2, 0x0ec4
801011a0:	173d9917          	auipc	x18,0x173d9
801011a4:	024a                	.insn	2, 0x024a
801011a6:	13c8                	.insn	2, 0x13c8
801011a8:	1619eeeb          	.insn	4, 0x1619eeeb
801011ac:	12cda5f7          	.insn	4, 0x12cda5f7
801011b0:	6fb5                	.insn	2, 0x6fb5
801011b2:	15e8                	.insn	2, 0x15e8
801011b4:	f18c                	.insn	2, 0xf18c
801011b6:	1f551297          	auipc	x5,0x1f551
801011ba:	0f6d                	.insn	2, 0x0f6d
801011bc:	0f3e                	.insn	2, 0x0f3e
801011be:	1020                	.insn	2, 0x1020
801011c0:	0f4d6593          	ori	x11,x26,244
801011c4:	7480                	.insn	2, 0x7480
801011c6:	111d                	.insn	2, 0x111d
801011c8:	44b6                	.insn	2, 0x44b6
801011ca:	15a4                	.insn	2, 0x15a4
801011cc:	11070547          	.insn	4, 0x11070547
801011d0:	93e8                	.insn	2, 0x93e8
801011d2:	1514                	.insn	2, 0x1514
801011d4:	1222062f          	.insn	4, 0x1222062f
801011d8:	10629967          	.insn	4, 0x10629967
801011dc:	4b74                	.insn	2, 0x4b74
801011de:	135a                	.insn	2, 0x135a
801011e0:	0de5309b          	.insn	4, 0x0de5309b
801011e4:	eb50                	.insn	2, 0xeb50
801011e6:	0d89                	.insn	2, 0x0d89
801011e8:	0cacdc33          	.insn	4, 0x0cacdc33
801011ec:	4722                	.insn	2, 0x4722
801011ee:	0bd6                	.insn	2, 0x0bd6
801011f0:	65d2                	.insn	2, 0x65d2
801011f2:	1495                	.insn	2, 0x1495
801011f4:	40d5                	.insn	2, 0x40d5
801011f6:	120a                	.insn	2, 0x120a
801011f8:	31cd                	.insn	2, 0x31cd
801011fa:	0f1a                	.insn	2, 0x0f1a
801011fc:	02a9                	.insn	2, 0x02a9
801011fe:	be0e0de7          	jalr	x27,-1056(x28)
80101202:	0dee                	.insn	2, 0x0dee
80101204:	f8d8                	.insn	2, 0xf8d8
80101206:	0d62                	.insn	2, 0x0d62
80101208:	ef54                	.insn	2, 0xef54
8010120a:	0bf1                	.insn	2, 0x0bf1
8010120c:	c4df 0ef2 bf80      	.insn	6, 0xbf800ef2c4df
80101212:	0df8                	.insn	2, 0x0df8
80101214:	a57d                	.insn	2, 0xa57d
80101216:	0c9e                	.insn	2, 0x0c9e
80101218:	1395                	.insn	2, 0x1395
8010121a:	10ba                	.insn	2, 0x10ba
8010121c:	0b0aa0b3          	.insn	4, 0x0b0aa0b3
80101220:	10f1                	.insn	2, 0x10f1
80101222:	ad2f11ab          	.insn	4, 0xad2f11ab
80101226:	d5891077          	.insn	4, 0xd5891077
8010122a:	0f0a                	.insn	2, 0x0f0a
8010122c:	109d0787          	.insn	4, 0x109d0787
80101230:	108d38a7          	.insn	4, 0x108d38a7
80101234:	1ed0                	.insn	2, 0x1ed0
80101236:	143e                	.insn	2, 0x143e
80101238:	dfce                	.insn	2, 0xdfce
8010123a:	1320                	.insn	2, 0x1320
8010123c:	124e314b          	.insn	4, 0x124e314b
80101240:	17da5f4f          	.insn	4, 0x17da5f4f
80101244:	26ff 13ee aec8 166d 	.insn	14, 0xc1f411a480ba166daec813ee26ff
8010124c:	80ba 11a4 c1f4 
80101252:	15a2                	.insn	2, 0x15a2
80101254:	4a3c                	.insn	2, 0x4a3c
80101256:	153c                	.insn	2, 0x153c
80101258:	8e99                	.insn	2, 0x8e99
8010125a:	1185                	.insn	2, 0x1185
8010125c:	5036                	.insn	2, 0x5036
8010125e:	91df0f97          	auipc	x31,0x91df0
80101262:	0f7a                	.insn	2, 0x0f7a
80101264:	a309                	.insn	2, 0xa309
80101266:	0fad                	.insn	2, 0x0fad
80101268:	15b9                	.insn	2, 0x15b9
8010126a:	558b18d7          	.insn	4, 0x558b18d7
8010126e:	105f 58d6 16fb      	.insn	6, 0x16fb58d6105f
80101274:	f8b1                	.insn	2, 0xf8b1
80101276:	1801                	.insn	2, 0x1801
80101278:	bbe2                	.insn	2, 0xbbe2
8010127a:	134e                	.insn	2, 0x134e
8010127c:	9056                	.insn	2, 0x9056
8010127e:	159f acca 0fec      	.insn	6, 0x0fecacca159f
80101284:	b7d0                	.insn	2, 0xb7d0
80101286:	1346                	.insn	2, 0x1346
80101288:	709a                	.insn	2, 0x709a
8010128a:	10a8                	.insn	2, 0x10a8
8010128c:	461d                	.insn	2, 0x461d
8010128e:	0c09                	.insn	2, 0x0c09
80101290:	352c                	.insn	2, 0x352c
80101292:	159d                	.insn	2, 0x159d
80101294:	a211                	.insn	2, 0xa211
80101296:	13b6                	.insn	2, 0x13b6
80101298:	16291f0b          	.insn	4, 0x16291f0b
8010129c:	4ce8                	.insn	2, 0x4ce8
8010129e:	11dc                	.insn	2, 0x11dc
801012a0:	08b5                	.insn	2, 0x08b5
801012a2:	65c213e3          	bne	x4,x28,801020e8 <ArrayA_ref+0x468>
801012a6:	0fc8                	.insn	2, 0x0fc8
801012a8:	a6f0                	.insn	2, 0xa6f0
801012aa:	0cde                	.insn	2, 0x0cde
801012ac:	8238                	.insn	2, 0x8238
801012ae:	108a                	.insn	2, 0x108a
801012b0:	0fbd5d53          	.insn	4, 0x0fbd5d53
801012b4:	079f 0dfb dbe3      	.insn	6, 0xdbe30dfb079f
801012ba:	132d                	.insn	2, 0x132d
801012bc:	e4d1                	.insn	2, 0xe4d1
801012be:	0cf6                	.insn	2, 0x0cf6
801012c0:	e858                	.insn	2, 0xe858
801012c2:	592e127f 6dcd12ed 	.insn	12, 0x904b0ea26dcd12ed592e127f
801012ca:	904b0ea2 
801012ce:	1474                	.insn	2, 0x1474
801012d0:	3302                	.insn	2, 0x3302
801012d2:	10c4                	.insn	2, 0x10c4
801012d4:	4ad1                	.insn	2, 0x4ad1
801012d6:	1376                	.insn	2, 0x1376
801012d8:	d8b1                	.insn	2, 0xd8b1
801012da:	0dea                	.insn	2, 0x0dea
801012dc:	7761                	.insn	2, 0x7761
801012de:	71780e37          	lui	x28,0x71780
801012e2:	11b4                	.insn	2, 0x11b4
801012e4:	028c                	.insn	2, 0x028c
801012e6:	0fdf 468e 14d5      	.insn	6, 0x14d5468e0fdf
801012ec:	44aa                	.insn	2, 0x44aa
801012ee:	0f75                	.insn	2, 0x0f75
801012f0:	ae7f 123d e8db 0fe0 	.insn	14, 0x666d0c888a680fe0e8db123dae7f
801012f8:	8a68 0c88 666d 
801012fe:	0fb8                	.insn	2, 0x0fb8
80101300:	4d8a                	.insn	2, 0x4d8a
80101302:	71e90dcf          	.insn	4, 0x71e90dcf
80101306:	0f04                	.insn	2, 0x0f04
80101308:	6974                	.insn	2, 0x6974
8010130a:	0af4117f 67e00d85 	.insn	12, 0x3fa0126e67e00d850af4117f
80101312:	3fa0126e 
80101316:	f82b110f          	.insn	4, 0xf82b110f
8010131a:	0c48                	.insn	2, 0x0c48
8010131c:	6f49                	.insn	2, 0x6f49
8010131e:	b37e0e1b          	.insn	4, 0xb37e0e1b
80101322:	1130                	.insn	2, 0x1130
80101324:	127f190f          	.insn	4, 0x127f190f
80101328:	97f6                	.insn	2, 0x97f6
8010132a:	10d9                	.insn	2, 0x10d9
8010132c:	71d4                	.insn	2, 0x71d4
8010132e:	0e8d                	.insn	2, 0x0e8d
80101330:	b624                	.insn	2, 0xb624
80101332:	2c9e196b          	.insn	4, 0x2c9e196b
80101336:	1719                	.insn	2, 0x1719
80101338:	c88e                	.insn	2, 0xc88e
8010133a:	1462                	.insn	2, 0x1462
8010133c:	af69                	.insn	2, 0xaf69
8010133e:	e994136f          	jal	x6,800431d6 <memcpy+0x42c86>
80101342:	14fe                	.insn	2, 0x14fe
80101344:	1312c727          	.insn	4, 0x1312c727
80101348:	11eb7dcb          	.insn	4, 0x11eb7dcb
8010134c:	0c84                	.insn	2, 0x0c84
8010134e:	10fa                	.insn	2, 0x10fa
80101350:	e900                	.insn	2, 0xe900
80101352:	ea1f1033          	.insn	4, 0xea1f1033
80101356:	1054                	.insn	2, 0x1054
80101358:	09aa                	.insn	2, 0x09aa
8010135a:	1591                	.insn	2, 0x1591
8010135c:	4ff0                	.insn	2, 0x4ff0
8010135e:	f1b00f0b          	.insn	4, 0xf1b00f0b
80101362:	14c6                	.insn	2, 0x14c6
80101364:	76bc                	.insn	2, 0x76bc
80101366:	1666                	.insn	2, 0x1666
80101368:	c0df 12de f226      	.insn	6, 0xf22612dec0df
8010136e:	1338                	.insn	2, 0x1338
80101370:	46cc                	.insn	2, 0x46cc
80101372:	eb37104b          	.insn	4, 0xeb37104b
80101376:	13a6                	.insn	2, 0x13a6
80101378:	1134baaf          	.insn	4, 0x1134baaf
8010137c:	3621                	.insn	2, 0x3621
8010137e:	0dfa                	.insn	2, 0x0dfa
80101380:	4972                	.insn	2, 0x4972
80101382:	16c4                	.insn	2, 0x16c4
80101384:	9b6d                	.insn	2, 0x9b6d
80101386:	1474                	.insn	2, 0x1474
80101388:	264d                	.insn	2, 0x264d
8010138a:	141e                	.insn	2, 0x141e
8010138c:	c09d                	.insn	2, 0xc09d
8010138e:	0f79                	.insn	2, 0x0f79
80101390:	dec9                	.insn	2, 0xdec9
80101392:	11a0                	.insn	2, 0x11a0
80101394:	5e79                	.insn	2, 0x5e79
80101396:	10f9                	.insn	2, 0x10f9
80101398:	ca3d                	.insn	2, 0xca3d
8010139a:	0c3c                	.insn	2, 0x0c3c
8010139c:	9166                	.insn	2, 0x9166
8010139e:	0ee0                	.insn	2, 0x0ee0
801013a0:	5bc6                	.insn	2, 0x5bc6
801013a2:	0f4c                	.insn	2, 0x0f4c
801013a4:	18df 0efe 641a      	.insn	6, 0x641a0efe18df
801013aa:	1409                	.insn	2, 0x1409
801013ac:	a8c6                	.insn	2, 0xa8c6
801013ae:	0edc                	.insn	2, 0x0edc
801013b0:	b69a                	.insn	2, 0xb69a
801013b2:	13e1                	.insn	2, 0x13e1
801013b4:	aace                	.insn	2, 0xaace
801013b6:	13a0                	.insn	2, 0x13a0
801013b8:	d4fd                	.insn	2, 0xd4fd
801013ba:	1095                	.insn	2, 0x1095
801013bc:	eb44                	.insn	2, 0xeb44
801013be:	4a8711eb          	.insn	4, 0x4a8711eb
801013c2:	12fd                	.insn	2, 0x12fd
801013c4:	7ef0                	.insn	2, 0x7ef0
801013c6:	12ce                	.insn	2, 0x12ce
801013c8:	0f88eee7          	.insn	4, 0x0f88eee7
801013cc:	d8a5                	.insn	2, 0xd8a5
801013ce:	0ee6                	.insn	2, 0x0ee6
801013d0:	2932                	.insn	2, 0x2932
801013d2:	1418                	.insn	2, 0x1418
801013d4:	1bfa                	.insn	2, 0x1bfa
801013d6:	12a5                	.insn	2, 0x12a5
801013d8:	335e                	.insn	2, 0x335e
801013da:	14aa                	.insn	2, 0x14aa
801013dc:	a52e                	.insn	2, 0xa52e
801013de:	d5760f8b          	.insn	4, 0xd5760f8b
801013e2:	1724                	.insn	2, 0x1724
801013e4:	73c5                	.insn	2, 0x73c5
801013e6:	eed21417          	auipc	x8,0xeed21
801013ea:	188210e7          	.insn	4, 0x188210e7
801013ee:	0c68                	.insn	2, 0x0c68
801013f0:	7259                	.insn	2, 0x7259
801013f2:	0df4                	.insn	2, 0x0df4
801013f4:	fe2d                	.insn	2, 0xfe2d
801013f6:	0f79                	.insn	2, 0x0f79
801013f8:	160f82b7          	lui	x5,0x160f8
801013fc:	a35a                	.insn	2, 0xa35a
801013fe:	0e80                	.insn	2, 0x0e80
80101400:	e575                	.insn	2, 0xe575
80101402:	1684                	.insn	2, 0x1684
80101404:	a6d2                	.insn	2, 0xa6d2
80101406:	1562                	.insn	2, 0x1562
80101408:	d3b2                	.insn	2, 0xd3b2
8010140a:	1118                	.insn	2, 0x1118
8010140c:	13300003          	lb	x0,307(x0) # 133 <_heap_size+0x133>
80101410:	8825                	.insn	2, 0x8825
80101412:	0dae                	.insn	2, 0x0dae
80101414:	3c5a                	.insn	2, 0x3c5a
80101416:	bfb10f23          	sb	x27,-1026(x2)
8010141a:	0d4a                	.insn	2, 0x0d4a
8010141c:	0c0ee433          	.insn	4, 0x0c0ee433
80101420:	12163bab          	.insn	4, 0x12163bab
80101424:	91a4                	.insn	2, 0x91a4
80101426:	1000                	.insn	2, 0x1000
80101428:	9b21                	.insn	2, 0x9b21
8010142a:	1105                	.insn	2, 0x1105
8010142c:	cf1d                	.insn	2, 0xcf1d
8010142e:	9e080c93          	addi	x25,x16,-1568
80101432:	1125                	.insn	2, 0x1125
80101434:	02d6                	.insn	2, 0x02d6
80101436:	10ad                	.insn	2, 0x10ad
80101438:	809e                	.insn	2, 0x809e
8010143a:	0d8d                	.insn	2, 0x0d8d
8010143c:	0bc5048f          	.insn	4, 0x0bc5048f
80101440:	0d429e53          	.insn	4, 0x0d429e53
80101444:	0ab382e7          	jalr	x5,171(x7)
80101448:	cc44                	.insn	2, 0xcc44
8010144a:	46a3124b          	.insn	4, 0x46a3124b
8010144e:	0aa2                	.insn	2, 0x0aa2
80101450:	81b2                	.insn	2, 0x81b2
80101452:	10c0                	.insn	2, 0x10c0
80101454:	28e8                	.insn	2, 0x28e8
80101456:	10ac                	.insn	2, 0x10ac
80101458:	ce06                	.insn	2, 0xce06
8010145a:	0dff a92f 1139 9f5b 	.insn	10, 0x11539f5b1139a92f0dff
80101462:	1153 
80101464:	292e                	.insn	2, 0x292e
80101466:	12f0                	.insn	2, 0x12f0
80101468:	11c11bcb          	.insn	4, 0x11c11bcb
8010146c:	fd51                	.insn	2, 0xfd51
8010146e:	0cb8                	.insn	2, 0x0cb8
80101470:	1bf88197          	auipc	x3,0x1bf88
80101474:	4f0e                	.insn	2, 0x4f0e
80101476:	165f 6f3c 137d      	.insn	6, 0x137d6f3c165f
8010147c:	1130                	.insn	2, 0x1130
8010147e:	13f1                	.insn	2, 0x13f1
80101480:	af48                	.insn	2, 0xaf48
80101482:	04971363          	bne	x14,x9,801014c8 <stack_end+0x4c8>
80101486:	114e                	.insn	2, 0x114e
80101488:	78d1                	.insn	2, 0x78d1
8010148a:	0f2e                	.insn	2, 0x0f2e
8010148c:	7510                	.insn	2, 0x7510
8010148e:	35fc10fb          	.insn	4, 0x35fc10fb
80101492:	0ea6                	.insn	2, 0x0ea6
80101494:	36e6                	.insn	2, 0x36e6
80101496:	107d                	.insn	2, 0x107d
80101498:	1348620b          	.insn	4, 0x1348620b
8010149c:	a820                	.insn	2, 0xa820
8010149e:	af7a1027          	.insn	4, 0xaf7a1027
801014a2:	141c                	.insn	2, 0x141c
801014a4:	56b0                	.insn	2, 0x56b0
801014a6:	1575                	.insn	2, 0x1575
801014a8:	9600                	.insn	2, 0x9600
801014aa:	a65f10c7          	.insn	4, 0xa65f10c7
801014ae:	13be                	.insn	2, 0x13be
801014b0:	6b35                	.insn	2, 0x6b35
801014b2:	111c                	.insn	2, 0x111c
801014b4:	f962                	.insn	2, 0xf962
801014b6:	12aa                	.insn	2, 0x12aa
801014b8:	2f41                	.insn	2, 0x2f41
801014ba:	1016                	.insn	2, 0x1016
801014bc:	0c677e3b          	.insn	4, 0x0c677e3b
801014c0:	ab6a                	.insn	2, 0xab6a
801014c2:	1912                	.insn	2, 0x1912
801014c4:	6582                	.insn	2, 0x6582
801014c6:	13c8                	.insn	2, 0x13c8
801014c8:	9819                	.insn	2, 0x9819
801014ca:	4a03152f          	.insn	4, 0x4a03152f
801014ce:	12f5                	.insn	2, 0x12f5
801014d0:	bf90                	.insn	2, 0xbf90
801014d2:	147d                	.insn	2, 0x147d
801014d4:	1202a45b          	.insn	4, 0x1202a45b
801014d8:	5880                	.insn	2, 0x5880
801014da:	126a                	.insn	2, 0x126a
801014dc:	e7fe                	.insn	2, 0xe7fe
801014de:	12a2                	.insn	2, 0x12a2
801014e0:	946c                	.insn	2, 0x946c
801014e2:	1008                	.insn	2, 0x1008
801014e4:	11330967          	jalr	x18,275(x6)
801014e8:	2ae1                	.insn	2, 0x2ae1
801014ea:	1610                	.insn	2, 0x1610
801014ec:	3eaa                	.insn	2, 0x3eaa
801014ee:	0c38                	.insn	2, 0x0c38
801014f0:	12f7540b          	.insn	4, 0x12f7540b
801014f4:	c4a8                	.insn	2, 0xc4a8
801014f6:	16ea                	.insn	2, 0x16ea
801014f8:	a539                	.insn	2, 0xa539
801014fa:	12dc                	.insn	2, 0x12dc
801014fc:	b95c                	.insn	2, 0xb95c
801014fe:	1692                	.insn	2, 0x1692
80101500:	5404                	.insn	2, 0x5404
80101502:	109c                	.insn	2, 0x109c
80101504:	9174                	.insn	2, 0x9174
80101506:	1544                	.insn	2, 0x1544
80101508:	8f04                	.insn	2, 0x8f04
8010150a:	1255                	.insn	2, 0x1255
8010150c:	0495                	.insn	2, 0x0495
8010150e:	0ce1                	.insn	2, 0x0ce1
80101510:	174c5803          	lhu	x16,372(x24)
80101514:	7991                	.insn	2, 0x7991
80101516:	1562                	.insn	2, 0x1562
80101518:	4e7e                	.insn	2, 0x4e7e
8010151a:	1564                	.insn	2, 0x1564
8010151c:	d084                	.insn	2, 0xd084
8010151e:	33901243          	.insn	4, 0x33901243
80101522:	e40212cf          	.insn	4, 0xe40212cf
80101526:	1040                	.insn	2, 0x1040
80101528:	e9c5                	.insn	2, 0xe9c5
8010152a:	0edd                	.insn	2, 0x0edd
8010152c:	d422                	.insn	2, 0xd422
8010152e:	105d                	.insn	2, 0x105d
80101530:	c05a                	.insn	2, 0xc05a
80101532:	104d                	.insn	2, 0x104d
80101534:	7459                	.insn	2, 0x7459
80101536:	0fd2                	.insn	2, 0x0fd2
80101538:	0ef0                	.insn	2, 0x0ef0
8010153a:	1361                	.insn	2, 0x1361
8010153c:	fb02                	.insn	2, 0xfb02
8010153e:	12a4                	.insn	2, 0x12a4
80101540:	1834                	.insn	2, 0x1834
80101542:	083e12e7          	.insn	4, 0x083e12e7
80101546:	7fae11cb          	.insn	4, 0x7fae11cb
8010154a:	de271017          	auipc	x0,0xde271
8010154e:	13d2                	.insn	2, 0x13d2
80101550:	0354                	.insn	2, 0x0354
80101552:	0ea4                	.insn	2, 0x0ea4
80101554:	6d02                	.insn	2, 0x6d02
80101556:	0fea                	.insn	2, 0x0fea
80101558:	0dfd120b          	.insn	4, 0x0dfd120b
8010155c:	2881                	.insn	2, 0x2881
8010155e:	0c72                	.insn	2, 0x0c72
80101560:	15d62643          	.insn	4, 0x15d62643
80101564:	0168                	.insn	2, 0x0168
80101566:	a0a50feb          	.insn	4, 0xa0a50feb
8010156a:	14d2                	.insn	2, 0x14d2
8010156c:	101a4ba3          	.insn	4, 0x101a4ba3
80101570:	cbd4                	.insn	2, 0xcbd4
80101572:	14be                	.insn	2, 0x14be
80101574:	b6d2                	.insn	2, 0xb6d2
80101576:	1160                	.insn	2, 0x1160
80101578:	57e8                	.insn	2, 0x57e8
8010157a:	1041                	.insn	2, 0x1041
8010157c:	ed6a                	.insn	2, 0xed6a
8010157e:	0f7a                	.insn	2, 0x0f7a
80101580:	9735                	.insn	2, 0x9735
80101582:	0e11                	.insn	2, 0x0e11
80101584:	099a                	.insn	2, 0x099a
80101586:	10ba                	.insn	2, 0x10ba
80101588:	106a                	.insn	2, 0x106a
8010158a:	13f9                	.insn	2, 0x13f9
8010158c:	0a86dcab          	.insn	4, 0x0a86dcab
80101590:	36ae                	.insn	2, 0x36ae
80101592:	0f75                	.insn	2, 0x0f75
80101594:	d148                	.insn	2, 0xd148
80101596:	133c                	.insn	2, 0x133c
80101598:	0e1467b7          	lui	x15,0xe146
8010159c:	a10e                	.insn	2, 0xa10e
8010159e:	13a6                	.insn	2, 0x13a6
801015a0:	617a                	.insn	2, 0x617a
801015a2:	0d80                	.insn	2, 0x0d80
801015a4:	0f55                	.insn	2, 0x0f55
801015a6:	84b0103b          	.insn	4, 0x84b0103b
801015aa:	102e                	.insn	2, 0x102e
801015ac:	0ce21e6b          	.insn	4, 0x0ce21e6b
801015b0:	17e6592b          	.insn	4, 0x17e6592b
801015b4:	c9fd                	.insn	2, 0xc9fd
801015b6:	1131                	.insn	2, 0x1131
801015b8:	b64e                	.insn	2, 0xb64e
801015ba:	13d8                	.insn	2, 0x13d8
801015bc:	bd99                	.insn	2, 0xbd99
801015be:	f02d142b          	.insn	4, 0xf02d142b
801015c2:	139c                	.insn	2, 0x139c
801015c4:	62c9                	.insn	2, 0x62c9
801015c6:	13b1                	.insn	2, 0x13b1
801015c8:	a31f 1244 124d      	.insn	6, 0x124d1244a31f
801015ce:	1036                	.insn	2, 0x1036
801015d0:	2f38                	.insn	2, 0x2f38
801015d2:	0de0                	.insn	2, 0x0de0
801015d4:	9259                	.insn	2, 0x9259
801015d6:	0f5a                	.insn	2, 0x0f5a
801015d8:	3f15                	.insn	2, 0x3f15
801015da:	143d                	.insn	2, 0x143d
801015dc:	0c14f5f3          	.insn	4, 0x0c14f5f3
801015e0:	4df1                	.insn	2, 0x4df1
801015e2:	131c                	.insn	2, 0x131c
801015e4:	3d72                	.insn	2, 0x3d72
801015e6:	c7e11707          	.insn	4, 0xc7e11707
801015ea:	b40212cb          	.insn	4, 0xb40212cb
801015ee:	139f fa82 0d66      	.insn	6, 0x0d66fa82139f
801015f4:	3e7c                	.insn	2, 0x3e7c
801015f6:	0dc9                	.insn	2, 0x0dc9
801015f8:	0e1f81d3          	.insn	4, 0x0e1f81d3
801015fc:	100c                	.insn	2, 0x100c
801015fe:	0e80                	.insn	2, 0x0e80
80101600:	f180                	.insn	2, 0xf180
80101602:	2368140b          	.insn	4, 0x2368140b
80101606:	1230                	.insn	2, 0x1230
80101608:	2d20                	.insn	2, 0x2d20
8010160a:	0ecc                	.insn	2, 0x0ecc
8010160c:	ad35                	.insn	2, 0xad35
8010160e:	0b6c                	.insn	2, 0x0b6c
80101610:	09ad                	.insn	2, 0x09ad
80101612:	0e68                	.insn	2, 0x0e68
80101614:	5c90                	.insn	2, 0x5c90
80101616:	0fae                	.insn	2, 0x0fae
80101618:	0bdab983          	.insn	4, 0x0bdab983
8010161c:	9fa5                	.insn	2, 0x9fa5
8010161e:	0a79                	.insn	2, 0x0a79
80101620:	2d5a                	.insn	2, 0x2d5a
80101622:	0c12                	.insn	2, 0x0c12
80101624:	096e                	.insn	2, 0x096e
80101626:	3e200a47          	.insn	4, 0x3e200a47
8010162a:	11a9                	.insn	2, 0x11a9
8010162c:	f7f2                	.insn	2, 0xf7f2
8010162e:	b60b0c77          	.insn	4, 0xb60b0c77
80101632:	1376                	.insn	2, 0x1376
80101634:	53fc                	.insn	2, 0x53fc
80101636:	0f14                	.insn	2, 0x0f14
80101638:	0e3c7a77          	.insn	4, 0x0e3c7a77
8010163c:	498d                	.insn	2, 0x498d
8010163e:	1145                	.insn	2, 0x1145

80101640 <ArrayA>:
	...

80101c80 <ArrayA_ref>:
	...

801022c0 <ArrayB>:
	...

80102900 <ArrayB_ref>:
	...

80102f40 <ResultArray>:
	...

80103580 <Seed>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	2029                	.insn	2, 0x2029
   8:	3331                	.insn	2, 0x3331
   a:	322e                	.insn	2, 0x322e
   c:	302e                	.insn	2, 0x302e
   e:	4700                	.insn	2, 0x4700
  10:	203a4343          	.insn	4, 0x203a4343
  14:	4728                	.insn	2, 0x4728
  16:	554e                	.insn	2, 0x554e
  18:	2029                	.insn	2, 0x2029
  1a:	3331                	.insn	2, 0x3331
  1c:	322e                	.insn	2, 0x322e
  1e:	302e                	.insn	2, 0x302e
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
  3c:	fc02                	.insn	2, 0xfc02
  3e:	03800003          	lb	x0,56(x0) # 38 <_heap_size+0x38>
  42:	0124                	.insn	2, 0x0124
  44:	04090103          	lb	x2,64(x18) # 974da1e0 <_end+0x173d5c50>
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
  7a:	0000014f          	.insn	4, 0x014f
  7e:	0005                	.insn	2, 0x0005
  80:	0004                	.insn	2, 0x0004
  82:	002e                	.insn	2, 0x002e
  84:	0000                	.insn	2, 0x
  86:	0101                	.insn	2, 0x0101
  88:	fb01                	.insn	2, 0xfb01
  8a:	0d0e                	.insn	2, 0x0d0e
  8c:	0100                	.insn	2, 0x0100
  8e:	0101                	.insn	2, 0x0101
  90:	0001                	.insn	2, 0x0001
  92:	0000                	.insn	2, 0x
  94:	0001                	.insn	2, 0x0001
  96:	0100                	.insn	2, 0x0100
  98:	0101                	.insn	2, 0x0101
  9a:	021f 0000 0000      	.insn	6, 0x021f
  a0:	0066                	.insn	2, 0x0066
  a2:	0000                	.insn	2, 0x
  a4:	0102                	.insn	2, 0x0102
  a6:	021f 020f 0098      	.insn	6, 0x0098020f021f
  ac:	0000                	.insn	2, 0x
  ae:	9801                	.insn	2, 0x9801
  b0:	0000                	.insn	2, 0x
  b2:	0100                	.insn	2, 0x0100
  b4:	0500                	.insn	2, 0x0500
  b6:	2002                	.insn	2, 0x2002
  b8:	0004                	.insn	2, 0x0004
  ba:	0380                	.insn	2, 0x0380
  bc:	00c4                	.insn	2, 0x00c4
  be:	0301                	.insn	2, 0x0301
  c0:	0901                	.insn	2, 0x0901
  c2:	0004                	.insn	2, 0x0004
  c4:	0301                	.insn	2, 0x0301
  c6:	0904                	.insn	2, 0x0904
  c8:	0004                	.insn	2, 0x0004
  ca:	0301                	.insn	2, 0x0301
  cc:	0901                	.insn	2, 0x0901
  ce:	0004                	.insn	2, 0x0004
  d0:	0301                	.insn	2, 0x0301
  d2:	0901                	.insn	2, 0x0901
  d4:	0004                	.insn	2, 0x0004
  d6:	0301                	.insn	2, 0x0301
  d8:	0901                	.insn	2, 0x0901
  da:	0004                	.insn	2, 0x0004
  dc:	0301                	.insn	2, 0x0301
  de:	0901                	.insn	2, 0x0901
  e0:	0004                	.insn	2, 0x0004
  e2:	0301                	.insn	2, 0x0301
  e4:	0901                	.insn	2, 0x0901
  e6:	0004                	.insn	2, 0x0004
  e8:	0301                	.insn	2, 0x0301
  ea:	0902                	.insn	2, 0x0902
  ec:	0004                	.insn	2, 0x0004
  ee:	0301                	.insn	2, 0x0301
  f0:	0901                	.insn	2, 0x0901
  f2:	0004                	.insn	2, 0x0004
  f4:	0301                	.insn	2, 0x0301
  f6:	0901                	.insn	2, 0x0901
  f8:	0004                	.insn	2, 0x0004
  fa:	0301                	.insn	2, 0x0301
  fc:	0901                	.insn	2, 0x0901
  fe:	0004                	.insn	2, 0x0004
 100:	0301                	.insn	2, 0x0301
 102:	0902                	.insn	2, 0x0902
 104:	0004                	.insn	2, 0x0004
 106:	0301                	.insn	2, 0x0301
 108:	0902                	.insn	2, 0x0902
 10a:	0004                	.insn	2, 0x0004
 10c:	0301                	.insn	2, 0x0301
 10e:	0901                	.insn	2, 0x0901
 110:	0004                	.insn	2, 0x0004
 112:	0301                	.insn	2, 0x0301
 114:	0901                	.insn	2, 0x0901
 116:	0004                	.insn	2, 0x0004
 118:	0301                	.insn	2, 0x0301
 11a:	0902                	.insn	2, 0x0902
 11c:	0004                	.insn	2, 0x0004
 11e:	0301                	.insn	2, 0x0301
 120:	0901                	.insn	2, 0x0901
 122:	0004                	.insn	2, 0x0004
 124:	0301                	.insn	2, 0x0301
 126:	0901                	.insn	2, 0x0901
 128:	0004                	.insn	2, 0x0004
 12a:	0301                	.insn	2, 0x0301
 12c:	0902                	.insn	2, 0x0902
 12e:	0004                	.insn	2, 0x0004
 130:	0301                	.insn	2, 0x0301
 132:	0906                	.insn	2, 0x0906
 134:	0004                	.insn	2, 0x0004
 136:	0301                	.insn	2, 0x0301
 138:	0901                	.insn	2, 0x0901
 13a:	0004                	.insn	2, 0x0004
 13c:	0301                	.insn	2, 0x0301
 13e:	0901                	.insn	2, 0x0901
 140:	0004                	.insn	2, 0x0004
 142:	0301                	.insn	2, 0x0301
 144:	0901                	.insn	2, 0x0901
 146:	0004                	.insn	2, 0x0004
 148:	0301                	.insn	2, 0x0301
 14a:	0905                	.insn	2, 0x0905
 14c:	0004                	.insn	2, 0x0004
 14e:	0301                	.insn	2, 0x0301
 150:	0902                	.insn	2, 0x0902
 152:	0004                	.insn	2, 0x0004
 154:	0301                	.insn	2, 0x0301
 156:	0902                	.insn	2, 0x0902
 158:	0004                	.insn	2, 0x0004
 15a:	0301                	.insn	2, 0x0301
 15c:	0901                	.insn	2, 0x0901
 15e:	0004                	.insn	2, 0x0004
 160:	0301                	.insn	2, 0x0301
 162:	0902                	.insn	2, 0x0902
 164:	0004                	.insn	2, 0x0004
 166:	0301                	.insn	2, 0x0301
 168:	0902                	.insn	2, 0x0902
 16a:	0004                	.insn	2, 0x0004
 16c:	0301                	.insn	2, 0x0301
 16e:	0901                	.insn	2, 0x0901
 170:	0004                	.insn	2, 0x0004
 172:	0301                	.insn	2, 0x0301
 174:	0901                	.insn	2, 0x0901
 176:	0004                	.insn	2, 0x0004
 178:	0301                	.insn	2, 0x0301
 17a:	0901                	.insn	2, 0x0901
 17c:	0004                	.insn	2, 0x0004
 17e:	0301                	.insn	2, 0x0301
 180:	0904                	.insn	2, 0x0904
 182:	0004                	.insn	2, 0x0004
 184:	0301                	.insn	2, 0x0301
 186:	0901                	.insn	2, 0x0901
 188:	0004                	.insn	2, 0x0004
 18a:	0301                	.insn	2, 0x0301
 18c:	0901                	.insn	2, 0x0901
 18e:	0004                	.insn	2, 0x0004
 190:	0301                	.insn	2, 0x0301
 192:	0902                	.insn	2, 0x0902
 194:	0004                	.insn	2, 0x0004
 196:	0301                	.insn	2, 0x0301
 198:	0901                	.insn	2, 0x0901
 19a:	0004                	.insn	2, 0x0004
 19c:	0301                	.insn	2, 0x0301
 19e:	0901                	.insn	2, 0x0901
 1a0:	0004                	.insn	2, 0x0004
 1a2:	0301                	.insn	2, 0x0301
 1a4:	0902                	.insn	2, 0x0902
 1a6:	0004                	.insn	2, 0x0004
 1a8:	0301                	.insn	2, 0x0301
 1aa:	0901                	.insn	2, 0x0901
 1ac:	0004                	.insn	2, 0x0004
 1ae:	0301                	.insn	2, 0x0301
 1b0:	0902                	.insn	2, 0x0902
 1b2:	0004                	.insn	2, 0x0004
 1b4:	0301                	.insn	2, 0x0301
 1b6:	0901                	.insn	2, 0x0901
 1b8:	0004                	.insn	2, 0x0004
 1ba:	0301                	.insn	2, 0x0301
 1bc:	0901                	.insn	2, 0x0901
 1be:	0004                	.insn	2, 0x0004
 1c0:	0301                	.insn	2, 0x0301
 1c2:	0901                	.insn	2, 0x0901
 1c4:	0004                	.insn	2, 0x0004
 1c6:	0901                	.insn	2, 0x0901
 1c8:	0004                	.insn	2, 0x0004
 1ca:	0100                	.insn	2, 0x0100
 1cc:	Address 0x1cc is out of bounds.


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
  98:	6964                	.insn	2, 0x6964
  9a:	2e76                	.insn	2, 0x2e76
  9c:	Address 0x9c is out of bounds.


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
  10:	fc00                	.insn	2, 0xfc00
  12:	24800003          	lb	x0,584(x0) # 248 <_heap_size+0x248>
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
  2a:	03fc                	.insn	2, 0x03fc
  2c:	8000                	.insn	2, 0x8000
  2e:	0324                	.insn	2, 0x0324
  30:	5b00                	.insn	2, 0x5b00
  32:	0000                	.insn	2, 0x
  34:	0500                	.insn	2, 0x0500
  36:	0100                	.insn	2, 0x0100
  38:	2804                	.insn	2, 0x2804
  3a:	0000                	.insn	2, 0x
  3c:	0100                	.insn	2, 0x0100
  3e:	007a                	.insn	2, 0x007a
  40:	0000                	.insn	2, 0x
  42:	0420                	.insn	2, 0x0420
  44:	8000                	.insn	2, 0x8000
  46:	01b4                	.insn	2, 0x01b4
  48:	00ad                	.insn	2, 0x00ad
  4a:	0000                	.insn	2, 0x
  4c:	0032                	.insn	2, 0x0032
  4e:	0000                	.insn	2, 0x
  50:	0098                	.insn	2, 0x0098
  52:	0000                	.insn	2, 0x
  54:	8001                	.insn	2, 0x8001
  56:	dc02                	.insn	2, 0xdc02
  58:	0000                	.insn	2, 0x
  5a:	5d00                	.insn	2, 0x5d00
  5c:	0420                	.insn	2, 0x0420
  5e:	8000                	.insn	2, 0x8000
  60:	0184                	.insn	2, 0x0184
  62:	ee02                	.insn	2, 0xee02
  64:	0000                	.insn	2, 0x
  66:	5d00                	.insn	2, 0x5d00
  68:	0428                	.insn	2, 0x0428
  6a:	8000                	.insn	2, 0x8000
  6c:	0248                	.insn	2, 0x0248
  6e:	00e5                	.insn	2, 0x00e5
  70:	0000                	.insn	2, 0x
  72:	285d                	.insn	2, 0x285d
  74:	0004                	.insn	2, 0x0004
  76:	4880                	.insn	2, 0x4880
  78:	f802                	.insn	2, 0xf802
  7a:	0000                	.insn	2, 0x
  7c:	5d00                	.insn	2, 0x5d00
  7e:	0470                	.insn	2, 0x0470
  80:	8000                	.insn	2, 0x8000
  82:	0210                	.insn	2, 0x0210
  84:	0102                	.insn	2, 0x0102
  86:	0000                	.insn	2, 0x
  88:	a45d                	.insn	2, 0xa45d
  8a:	0004                	.insn	2, 0x0004
  8c:	3080                	.insn	2, 0x3080
  8e:	Address 0x8e is out of bounds.


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
  26:	0000                	.insn	2, 0x
  28:	1101                	.insn	2, 0x1101
  2a:	1001                	.insn	2, 0x1001
  2c:	12011117          	auipc	x2,0x12011
  30:	1b0e030f          	.insn	4, 0x1b0e030f
  34:	250e                	.insn	2, 0x250e
  36:	130e                	.insn	2, 0x130e
  38:	0005                	.insn	2, 0x0005
  3a:	0200                	.insn	2, 0x0200
  3c:	002e                	.insn	2, 0x002e
  3e:	193f0e03          	lb	x28,403(x30)
  42:	1549                	.insn	2, 0x1549
  44:	0111                	.insn	2, 0x0111
  46:	0f12                	.insn	2, 0x0f12
  48:	0000                	.insn	2, 0x
  4a:	00003b03          	.insn	4, 0x3b03
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
  10:	03fc                	.insn	2, 0x03fc
  12:	8000                	.insn	2, 0x8000
  14:	0024                	.insn	2, 0x0024
	...
  1e:	0000                	.insn	2, 0x
  20:	001c                	.insn	2, 0x001c
  22:	0000                	.insn	2, 0x
  24:	0002                	.insn	2, 0x0002
  26:	0031                	.insn	2, 0x0031
  28:	0000                	.insn	2, 0x
  2a:	0004                	.insn	2, 0x0004
  2c:	0000                	.insn	2, 0x
  2e:	0000                	.insn	2, 0x
  30:	0420                	.insn	2, 0x0420
  32:	8000                	.insn	2, 0x8000
  34:	00b4                	.insn	2, 0x00b4
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
  ac:	2e00                	.insn	2, 0x2e00
  ae:	2f2e                	.insn	2, 0x2f2e
  b0:	2e2e                	.insn	2, 0x2e2e
  b2:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
  b6:	2e2e                	.insn	2, 0x2e2e
  b8:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
  bc:	2f2e                	.insn	2, 0x2f2e
  be:	2f636367          	.insn	4, 0x2f636367
  c2:	696c                	.insn	2, 0x696c
  c4:	6762                	.insn	2, 0x6762
  c6:	632f6363          	bltu	x30,x18,6ec <_heap_size+0x6ec>
  ca:	69666e6f          	jal	x28,66760 <_stack_size+0x65760>
  ce:	69722f67          	.insn	4, 0x69722f67
  d2:	2f766373          	.insn	4, 0x2f766373
  d6:	6964                	.insn	2, 0x6964
  d8:	2e76                	.insn	2, 0x2e76
  da:	5f5f0053          	.insn	4, 0x5f5f0053
  de:	6964                	.insn	2, 0x6964
  e0:	7376                	.insn	2, 0x7376
  e2:	3369                	.insn	2, 0x3369
  e4:	5f00                	.insn	2, 0x5f00
  e6:	685f 6469 6564      	.insn	6, 0x65646469685f
  ec:	5f6e                	.insn	2, 0x5f6e
  ee:	5f5f 6475 7669      	.insn	6, 0x766964755f5f
  f4:	00336973          	.insn	4, 0x00336973
  f8:	5f5f 6d75 646f      	.insn	6, 0x646f6d755f5f
  fe:	00336973          	.insn	4, 0x00336973
 102:	5f5f 6f6d 7364      	.insn	6, 0x73646f6d5f5f
 108:	3369                	.insn	2, 0x3369
	...
