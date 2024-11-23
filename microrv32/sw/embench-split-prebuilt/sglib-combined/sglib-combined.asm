
bd/src/sglib-combined/sglib-combined:     Dateiformat elf32-littleriscv


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
80000080:	f8410113          	addi	x2,x2,-124 # 80101000 <__sglue>
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
800000ac:	75d010ef          	jal	x1,80002008 <initialise_board>
800000b0:	749010ef          	jal	x1,80001ff8 <initialise_benchmark>
800000b4:	00100513          	addi	x10,x0,1
800000b8:	745010ef          	jal	x1,80001ffc <warm_caches>
800000bc:	755010ef          	jal	x1,80002010 <start_trigger>
800000c0:	741010ef          	jal	x1,80002000 <benchmark>
800000c4:	00a12623          	sw	x10,12(x2)
800000c8:	759010ef          	jal	x1,80002020 <stop_trigger>
800000cc:	00c12503          	lw	x10,12(x2)
800000d0:	635010ef          	jal	x1,80001f04 <verify_benchmark>
800000d4:	01c12083          	lw	x1,28(x2)
800000d8:	00153513          	sltiu	x10,x10,1
800000dc:	02010113          	addi	x2,x2,32
800000e0:	00008067          	jalr	x0,0(x1)

800000e4 <sglib___rbtree_fix_left_deletion_discrepancy>:
800000e4:	00052703          	lw	x14,0(x10)
800000e8:	00c72683          	lw	x13,12(x14)
800000ec:	00069863          	bne	x13,x0,800000fc <sglib___rbtree_fix_left_deletion_discrepancy+0x18>
800000f0:	00070223          	sb	x0,4(x14)
800000f4:	00000513          	addi	x10,x0,0
800000f8:	00008067          	jalr	x0,0(x1)
800000fc:	0046c803          	lbu	x16,4(x13)
80000100:	00100613          	addi	x12,x0,1
80000104:	00c6a583          	lw	x11,12(x13)
80000108:	0086a783          	lw	x15,8(x13)
8000010c:	0cc81663          	bne	x16,x12,800001d8 <sglib___rbtree_fix_left_deletion_discrepancy+0xf4>
80000110:	00079c63          	bne	x15,x0,80000128 <sglib___rbtree_fix_left_deletion_discrepancy+0x44>
80000114:	00d52023          	sw	x13,0(x10)
80000118:	00068223          	sb	x0,4(x13)
8000011c:	00e6a423          	sw	x14,8(x13)
80000120:	00072623          	sw	x0,12(x14)
80000124:	fd1ff06f          	jal	x0,800000f4 <sglib___rbtree_fix_left_deletion_discrepancy+0x10>
80000128:	00c7a803          	lw	x16,12(x15)
8000012c:	0087a603          	lw	x12,8(x15)
80000130:	00080663          	beq	x16,x0,8000013c <sglib___rbtree_fix_left_deletion_discrepancy+0x58>
80000134:	00484883          	lbu	x17,4(x16)
80000138:	02089863          	bne	x17,x0,80000168 <sglib___rbtree_fix_left_deletion_discrepancy+0x84>
8000013c:	00060663          	beq	x12,x0,80000148 <sglib___rbtree_fix_left_deletion_discrepancy+0x64>
80000140:	00464883          	lbu	x17,4(x12)
80000144:	02089063          	bne	x17,x0,80000164 <sglib___rbtree_fix_left_deletion_discrepancy+0x80>
80000148:	00d52023          	sw	x13,0(x10)
8000014c:	00e6a423          	sw	x14,8(x13)
80000150:	00068223          	sb	x0,4(x13)
80000154:	00f72623          	sw	x15,12(x14)
80000158:	00100713          	addi	x14,x0,1
8000015c:	00e78223          	sb	x14,4(x15)
80000160:	f95ff06f          	jal	x0,800000f4 <sglib___rbtree_fix_left_deletion_discrepancy+0x10>
80000164:	06080263          	beq	x16,x0,800001c8 <sglib___rbtree_fix_left_deletion_discrepancy+0xe4>
80000168:	00484883          	lbu	x17,4(x16)
8000016c:	00100313          	addi	x6,x0,1
80000170:	04689a63          	bne	x17,x6,800001c4 <sglib___rbtree_fix_left_deletion_discrepancy+0xe0>
80000174:	02060863          	beq	x12,x0,800001a4 <sglib___rbtree_fix_left_deletion_discrepancy+0xc0>
80000178:	00464303          	lbu	x6,4(x12)
8000017c:	03131463          	bne	x6,x17,800001a4 <sglib___rbtree_fix_left_deletion_discrepancy+0xc0>
80000180:	00c62803          	lw	x16,12(x12)
80000184:	00862583          	lw	x11,8(x12)
80000188:	00c52023          	sw	x12,0(x10)
8000018c:	00060223          	sb	x0,4(x12)
80000190:	00d62623          	sw	x13,12(x12)
80000194:	0107a423          	sw	x16,8(x15)
80000198:	00e62423          	sw	x14,8(x12)
8000019c:	00b72623          	sw	x11,12(x14)
800001a0:	f55ff06f          	jal	x0,800000f4 <sglib___rbtree_fix_left_deletion_discrepancy+0x10>
800001a4:	00f52023          	sw	x15,0(x10)
800001a8:	00d7a623          	sw	x13,12(x15)
800001ac:	00e7a423          	sw	x14,8(x15)
800001b0:	00b6a623          	sw	x11,12(x13)
800001b4:	0106a423          	sw	x16,8(x13)
800001b8:	00c72623          	sw	x12,12(x14)
800001bc:	00080223          	sb	x0,4(x16)
800001c0:	f35ff06f          	jal	x0,800000f4 <sglib___rbtree_fix_left_deletion_discrepancy+0x10>
800001c4:	f20608e3          	beq	x12,x0,800000f4 <sglib___rbtree_fix_left_deletion_discrepancy+0x10>
800001c8:	00464803          	lbu	x16,4(x12)
800001cc:	00100593          	addi	x11,x0,1
800001d0:	f2b812e3          	bne	x16,x11,800000f4 <sglib___rbtree_fix_left_deletion_discrepancy+0x10>
800001d4:	fadff06f          	jal	x0,80000180 <sglib___rbtree_fix_left_deletion_discrepancy+0x9c>
800001d8:	00058663          	beq	x11,x0,800001e4 <sglib___rbtree_fix_left_deletion_discrepancy+0x100>
800001dc:	0045c603          	lbu	x12,4(x11)
800001e0:	02061663          	bne	x12,x0,8000020c <sglib___rbtree_fix_left_deletion_discrepancy+0x128>
800001e4:	00078663          	beq	x15,x0,800001f0 <sglib___rbtree_fix_left_deletion_discrepancy+0x10c>
800001e8:	0047c603          	lbu	x12,4(x15)
800001ec:	00061e63          	bne	x12,x0,80000208 <sglib___rbtree_fix_left_deletion_discrepancy+0x124>
800001f0:	00474503          	lbu	x10,4(x14)
800001f4:	00100793          	addi	x15,x0,1
800001f8:	00070223          	sb	x0,4(x14)
800001fc:	00153513          	sltiu	x10,x10,1
80000200:	00f68223          	sb	x15,4(x13)
80000204:	00008067          	jalr	x0,0(x1)
80000208:	02058e63          	beq	x11,x0,80000244 <sglib___rbtree_fix_left_deletion_discrepancy+0x160>
8000020c:	0045c803          	lbu	x16,4(x11)
80000210:	00100613          	addi	x12,x0,1
80000214:	02c81863          	bne	x16,x12,80000244 <sglib___rbtree_fix_left_deletion_discrepancy+0x160>
80000218:	00078663          	beq	x15,x0,80000224 <sglib___rbtree_fix_left_deletion_discrepancy+0x140>
8000021c:	0047c603          	lbu	x12,4(x15)
80000220:	02061263          	bne	x12,x0,80000244 <sglib___rbtree_fix_left_deletion_discrepancy+0x160>
80000224:	00d52023          	sw	x13,0(x10)
80000228:	00474603          	lbu	x12,4(x14)
8000022c:	00c68223          	sb	x12,4(x13)
80000230:	00070223          	sb	x0,4(x14)
80000234:	00e6a423          	sw	x14,8(x13)
80000238:	00f72623          	sw	x15,12(x14)
8000023c:	00058223          	sb	x0,4(x11)
80000240:	eb5ff06f          	jal	x0,800000f4 <sglib___rbtree_fix_left_deletion_discrepancy+0x10>
80000244:	00c7a583          	lw	x11,12(x15)
80000248:	0087a603          	lw	x12,8(x15)
8000024c:	00f52023          	sw	x15,0(x10)
80000250:	00474503          	lbu	x10,4(x14)
80000254:	00a78223          	sb	x10,4(x15)
80000258:	00070223          	sb	x0,4(x14)
8000025c:	00d7a623          	sw	x13,12(x15)
80000260:	00e7a423          	sw	x14,8(x15)
80000264:	00b6a423          	sw	x11,8(x13)
80000268:	00c72623          	sw	x12,12(x14)
8000026c:	e89ff06f          	jal	x0,800000f4 <sglib___rbtree_fix_left_deletion_discrepancy+0x10>

80000270 <sglib___rbtree_fix_right_deletion_discrepancy>:
80000270:	00052703          	lw	x14,0(x10)
80000274:	00872683          	lw	x13,8(x14)
80000278:	00069863          	bne	x13,x0,80000288 <sglib___rbtree_fix_right_deletion_discrepancy+0x18>
8000027c:	00070223          	sb	x0,4(x14)
80000280:	00000513          	addi	x10,x0,0
80000284:	00008067          	jalr	x0,0(x1)
80000288:	0046c803          	lbu	x16,4(x13)
8000028c:	00100613          	addi	x12,x0,1
80000290:	0086a583          	lw	x11,8(x13)
80000294:	00c6a783          	lw	x15,12(x13)
80000298:	0cc81663          	bne	x16,x12,80000364 <sglib___rbtree_fix_right_deletion_discrepancy+0xf4>
8000029c:	00079c63          	bne	x15,x0,800002b4 <sglib___rbtree_fix_right_deletion_discrepancy+0x44>
800002a0:	00d52023          	sw	x13,0(x10)
800002a4:	00068223          	sb	x0,4(x13)
800002a8:	00e6a623          	sw	x14,12(x13)
800002ac:	00072423          	sw	x0,8(x14)
800002b0:	fd1ff06f          	jal	x0,80000280 <sglib___rbtree_fix_right_deletion_discrepancy+0x10>
800002b4:	0087a803          	lw	x16,8(x15)
800002b8:	00c7a603          	lw	x12,12(x15)
800002bc:	00080663          	beq	x16,x0,800002c8 <sglib___rbtree_fix_right_deletion_discrepancy+0x58>
800002c0:	00484883          	lbu	x17,4(x16)
800002c4:	02089863          	bne	x17,x0,800002f4 <sglib___rbtree_fix_right_deletion_discrepancy+0x84>
800002c8:	00060663          	beq	x12,x0,800002d4 <sglib___rbtree_fix_right_deletion_discrepancy+0x64>
800002cc:	00464883          	lbu	x17,4(x12)
800002d0:	02089063          	bne	x17,x0,800002f0 <sglib___rbtree_fix_right_deletion_discrepancy+0x80>
800002d4:	00d52023          	sw	x13,0(x10)
800002d8:	00e6a623          	sw	x14,12(x13)
800002dc:	00068223          	sb	x0,4(x13)
800002e0:	00f72423          	sw	x15,8(x14)
800002e4:	00100713          	addi	x14,x0,1
800002e8:	00e78223          	sb	x14,4(x15)
800002ec:	f95ff06f          	jal	x0,80000280 <sglib___rbtree_fix_right_deletion_discrepancy+0x10>
800002f0:	06080263          	beq	x16,x0,80000354 <sglib___rbtree_fix_right_deletion_discrepancy+0xe4>
800002f4:	00484883          	lbu	x17,4(x16)
800002f8:	00100313          	addi	x6,x0,1
800002fc:	04689a63          	bne	x17,x6,80000350 <sglib___rbtree_fix_right_deletion_discrepancy+0xe0>
80000300:	02060863          	beq	x12,x0,80000330 <sglib___rbtree_fix_right_deletion_discrepancy+0xc0>
80000304:	00464303          	lbu	x6,4(x12)
80000308:	03131463          	bne	x6,x17,80000330 <sglib___rbtree_fix_right_deletion_discrepancy+0xc0>
8000030c:	00862803          	lw	x16,8(x12)
80000310:	00c62583          	lw	x11,12(x12)
80000314:	00c52023          	sw	x12,0(x10)
80000318:	00060223          	sb	x0,4(x12)
8000031c:	00d62423          	sw	x13,8(x12)
80000320:	0107a623          	sw	x16,12(x15)
80000324:	00e62623          	sw	x14,12(x12)
80000328:	00b72423          	sw	x11,8(x14)
8000032c:	f55ff06f          	jal	x0,80000280 <sglib___rbtree_fix_right_deletion_discrepancy+0x10>
80000330:	00f52023          	sw	x15,0(x10)
80000334:	00d7a423          	sw	x13,8(x15)
80000338:	00e7a623          	sw	x14,12(x15)
8000033c:	00b6a423          	sw	x11,8(x13)
80000340:	0106a623          	sw	x16,12(x13)
80000344:	00c72423          	sw	x12,8(x14)
80000348:	00080223          	sb	x0,4(x16)
8000034c:	f35ff06f          	jal	x0,80000280 <sglib___rbtree_fix_right_deletion_discrepancy+0x10>
80000350:	f20608e3          	beq	x12,x0,80000280 <sglib___rbtree_fix_right_deletion_discrepancy+0x10>
80000354:	00464803          	lbu	x16,4(x12)
80000358:	00100593          	addi	x11,x0,1
8000035c:	f2b812e3          	bne	x16,x11,80000280 <sglib___rbtree_fix_right_deletion_discrepancy+0x10>
80000360:	fadff06f          	jal	x0,8000030c <sglib___rbtree_fix_right_deletion_discrepancy+0x9c>
80000364:	00058663          	beq	x11,x0,80000370 <sglib___rbtree_fix_right_deletion_discrepancy+0x100>
80000368:	0045c603          	lbu	x12,4(x11)
8000036c:	02061663          	bne	x12,x0,80000398 <sglib___rbtree_fix_right_deletion_discrepancy+0x128>
80000370:	00078663          	beq	x15,x0,8000037c <sglib___rbtree_fix_right_deletion_discrepancy+0x10c>
80000374:	0047c603          	lbu	x12,4(x15)
80000378:	00061e63          	bne	x12,x0,80000394 <sglib___rbtree_fix_right_deletion_discrepancy+0x124>
8000037c:	00474503          	lbu	x10,4(x14)
80000380:	00100793          	addi	x15,x0,1
80000384:	00070223          	sb	x0,4(x14)
80000388:	00153513          	sltiu	x10,x10,1
8000038c:	00f68223          	sb	x15,4(x13)
80000390:	00008067          	jalr	x0,0(x1)
80000394:	02058e63          	beq	x11,x0,800003d0 <sglib___rbtree_fix_right_deletion_discrepancy+0x160>
80000398:	0045c803          	lbu	x16,4(x11)
8000039c:	00100613          	addi	x12,x0,1
800003a0:	02c81863          	bne	x16,x12,800003d0 <sglib___rbtree_fix_right_deletion_discrepancy+0x160>
800003a4:	00078663          	beq	x15,x0,800003b0 <sglib___rbtree_fix_right_deletion_discrepancy+0x140>
800003a8:	0047c603          	lbu	x12,4(x15)
800003ac:	02061263          	bne	x12,x0,800003d0 <sglib___rbtree_fix_right_deletion_discrepancy+0x160>
800003b0:	00d52023          	sw	x13,0(x10)
800003b4:	00474603          	lbu	x12,4(x14)
800003b8:	00c68223          	sb	x12,4(x13)
800003bc:	00070223          	sb	x0,4(x14)
800003c0:	00e6a623          	sw	x14,12(x13)
800003c4:	00f72423          	sw	x15,8(x14)
800003c8:	00058223          	sb	x0,4(x11)
800003cc:	eb5ff06f          	jal	x0,80000280 <sglib___rbtree_fix_right_deletion_discrepancy+0x10>
800003d0:	0087a583          	lw	x11,8(x15)
800003d4:	00c7a603          	lw	x12,12(x15)
800003d8:	00f52023          	sw	x15,0(x10)
800003dc:	00474503          	lbu	x10,4(x14)
800003e0:	00a78223          	sb	x10,4(x15)
800003e4:	00070223          	sb	x0,4(x14)
800003e8:	00d7a423          	sw	x13,8(x15)
800003ec:	00e7a623          	sw	x14,12(x15)
800003f0:	00b6a623          	sw	x11,12(x13)
800003f4:	00c72423          	sw	x12,8(x14)
800003f8:	e89ff06f          	jal	x0,80000280 <sglib___rbtree_fix_right_deletion_discrepancy+0x10>

800003fc <sglib___rbtree_delete_rightmost_leaf>:
800003fc:	ff010113          	addi	x2,x2,-16
80000400:	00812423          	sw	x8,8(x2)
80000404:	00050413          	addi	x8,x10,0
80000408:	00052503          	lw	x10,0(x10)
8000040c:	00112623          	sw	x1,12(x2)
80000410:	00c52703          	lw	x14,12(x10)
80000414:	04071663          	bne	x14,x0,80000460 <sglib___rbtree_delete_rightmost_leaf+0x64>
80000418:	00a5a023          	sw	x10,0(x11)
8000041c:	00852703          	lw	x14,8(x10)
80000420:	02070863          	beq	x14,x0,80000450 <sglib___rbtree_delete_rightmost_leaf+0x54>
80000424:	00454783          	lbu	x15,4(x10)
80000428:	00000513          	addi	x10,x0,0
8000042c:	00079663          	bne	x15,x0,80000438 <sglib___rbtree_delete_rightmost_leaf+0x3c>
80000430:	00474783          	lbu	x15,4(x14)
80000434:	0017b513          	sltiu	x10,x15,1
80000438:	00070223          	sb	x0,4(x14)
8000043c:	00e42023          	sw	x14,0(x8)
80000440:	00c12083          	lw	x1,12(x2)
80000444:	00812403          	lw	x8,8(x2)
80000448:	01010113          	addi	x2,x2,16
8000044c:	00008067          	jalr	x0,0(x1)
80000450:	00042023          	sw	x0,0(x8)
80000454:	00454503          	lbu	x10,4(x10)
80000458:	00153513          	sltiu	x10,x10,1
8000045c:	fe5ff06f          	jal	x0,80000440 <sglib___rbtree_delete_rightmost_leaf+0x44>
80000460:	00c50513          	addi	x10,x10,12
80000464:	f99ff0ef          	jal	x1,800003fc <sglib___rbtree_delete_rightmost_leaf>
80000468:	fc050ce3          	beq	x10,x0,80000440 <sglib___rbtree_delete_rightmost_leaf+0x44>
8000046c:	00040513          	addi	x10,x8,0
80000470:	00812403          	lw	x8,8(x2)
80000474:	00c12083          	lw	x1,12(x2)
80000478:	01010113          	addi	x2,x2,16
8000047c:	df5ff06f          	jal	x0,80000270 <sglib___rbtree_fix_right_deletion_discrepancy>

80000480 <sglib___rbtree_consistency_check_recursive>:
80000480:	fe010113          	addi	x2,x2,-32
80000484:	00812c23          	sw	x8,24(x2)
80000488:	00912a23          	sw	x9,20(x2)
8000048c:	01212823          	sw	x18,16(x2)
80000490:	01312623          	sw	x19,12(x2)
80000494:	00112e23          	sw	x1,28(x2)
80000498:	00050413          	addi	x8,x10,0
8000049c:	00058913          	addi	x18,x11,0
800004a0:	00060493          	addi	x9,x12,0
800004a4:	00100993          	addi	x19,x0,1
800004a8:	02041663          	bne	x8,x0,800004d4 <sglib___rbtree_consistency_check_recursive+0x54>
800004ac:	00092783          	lw	x15,0(x18)
800004b0:	0007d463          	bge	x15,x0,800004b8 <sglib___rbtree_consistency_check_recursive+0x38>
800004b4:	00992023          	sw	x9,0(x18)
800004b8:	01c12083          	lw	x1,28(x2)
800004bc:	01812403          	lw	x8,24(x2)
800004c0:	01412483          	lw	x9,20(x2)
800004c4:	01012903          	lw	x18,16(x2)
800004c8:	00c12983          	lw	x19,12(x2)
800004cc:	02010113          	addi	x2,x2,32
800004d0:	00008067          	jalr	x0,0(x1)
800004d4:	00444783          	lbu	x15,4(x8)
800004d8:	00842503          	lw	x10,8(x8)
800004dc:	01379c63          	bne	x15,x19,800004f4 <sglib___rbtree_consistency_check_recursive+0x74>
800004e0:	00048613          	addi	x12,x9,0
800004e4:	00090593          	addi	x11,x18,0
800004e8:	f99ff0ef          	jal	x1,80000480 <sglib___rbtree_consistency_check_recursive>
800004ec:	00c42403          	lw	x8,12(x8)
800004f0:	fb9ff06f          	jal	x0,800004a8 <sglib___rbtree_consistency_check_recursive+0x28>
800004f4:	00148493          	addi	x9,x9,1
800004f8:	fe9ff06f          	jal	x0,800004e0 <sglib___rbtree_consistency_check_recursive+0x60>

800004fc <sglib___rbtree_add_recursive.constprop.0>:
800004fc:	ff010113          	addi	x2,x2,-16
80000500:	00912223          	sw	x9,4(x2)
80000504:	00052483          	lw	x9,0(x10)
80000508:	00812423          	sw	x8,8(x2)
8000050c:	00112623          	sw	x1,12(x2)
80000510:	00050413          	addi	x8,x10,0
80000514:	02049263          	bne	x9,x0,80000538 <sglib___rbtree_add_recursive.constprop.0+0x3c>
80000518:	00100793          	addi	x15,x0,1
8000051c:	00f58223          	sb	x15,4(x11)
80000520:	00b52023          	sw	x11,0(x10)
80000524:	00c12083          	lw	x1,12(x2)
80000528:	00812403          	lw	x8,8(x2)
8000052c:	00412483          	lw	x9,4(x2)
80000530:	01010113          	addi	x2,x2,16
80000534:	00008067          	jalr	x0,0(x1)
80000538:	0005a783          	lw	x15,0(x11)
8000053c:	0004a703          	lw	x14,0(x9)
80000540:	40e787b3          	sub	x15,x15,x14
80000544:	0007c663          	blt	x15,x0,80000550 <sglib___rbtree_add_recursive.constprop.0+0x54>
80000548:	0e079263          	bne	x15,x0,8000062c <sglib___rbtree_add_recursive.constprop.0+0x130>
8000054c:	0e95f063          	bgeu	x11,x9,8000062c <sglib___rbtree_add_recursive.constprop.0+0x130>
80000550:	00848513          	addi	x10,x9,8
80000554:	fa9ff0ef          	jal	x1,800004fc <sglib___rbtree_add_recursive.constprop.0>
80000558:	0044c783          	lbu	x15,4(x9)
8000055c:	fc0794e3          	bne	x15,x0,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
80000560:	00042683          	lw	x13,0(x8)
80000564:	0086a783          	lw	x15,8(x13)
80000568:	00c6a703          	lw	x14,12(x13)
8000056c:	0047c603          	lbu	x12,4(x15)
80000570:	04070663          	beq	x14,x0,800005bc <sglib___rbtree_add_recursive.constprop.0+0xc0>
80000574:	00474583          	lbu	x11,4(x14)
80000578:	00100513          	addi	x10,x0,1
8000057c:	04a59063          	bne	x11,x10,800005bc <sglib___rbtree_add_recursive.constprop.0+0xc0>
80000580:	fab612e3          	bne	x12,x11,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
80000584:	0087a583          	lw	x11,8(x15)
80000588:	00058663          	beq	x11,x0,80000594 <sglib___rbtree_add_recursive.constprop.0+0x98>
8000058c:	0045c583          	lbu	x11,4(x11)
80000590:	00c58c63          	beq	x11,x12,800005a8 <sglib___rbtree_add_recursive.constprop.0+0xac>
80000594:	00c7a603          	lw	x12,12(x15)
80000598:	f80606e3          	beq	x12,x0,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
8000059c:	00464583          	lbu	x11,4(x12)
800005a0:	00100613          	addi	x12,x0,1
800005a4:	f8c590e3          	bne	x11,x12,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
800005a8:	00078223          	sb	x0,4(x15)
800005ac:	00070223          	sb	x0,4(x14)
800005b0:	00100793          	addi	x15,x0,1
800005b4:	00f68223          	sb	x15,4(x13)
800005b8:	f6dff06f          	jal	x0,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
800005bc:	00100713          	addi	x14,x0,1
800005c0:	f6e612e3          	bne	x12,x14,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
800005c4:	0087a583          	lw	x11,8(x15)
800005c8:	00c7a703          	lw	x14,12(x15)
800005cc:	02058463          	beq	x11,x0,800005f4 <sglib___rbtree_add_recursive.constprop.0+0xf8>
800005d0:	0045c503          	lbu	x10,4(x11)
800005d4:	02c51063          	bne	x10,x12,800005f4 <sglib___rbtree_add_recursive.constprop.0+0xf8>
800005d8:	00e6a423          	sw	x14,8(x13)
800005dc:	00b7a423          	sw	x11,8(x15)
800005e0:	00d7a623          	sw	x13,12(x15)
800005e4:	00c68223          	sb	x12,4(x13)
800005e8:	00078223          	sb	x0,4(x15)
800005ec:	00f42023          	sw	x15,0(x8)
800005f0:	f35ff06f          	jal	x0,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
800005f4:	f20708e3          	beq	x14,x0,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
800005f8:	00474603          	lbu	x12,4(x14)
800005fc:	00100593          	addi	x11,x0,1
80000600:	f2b612e3          	bne	x12,x11,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
80000604:	00872503          	lw	x10,8(x14)
80000608:	00c72583          	lw	x11,12(x14)
8000060c:	00a7a623          	sw	x10,12(x15)
80000610:	00b6a423          	sw	x11,8(x13)
80000614:	00f72423          	sw	x15,8(x14)
80000618:	00d72623          	sw	x13,12(x14)
8000061c:	00070223          	sb	x0,4(x14)
80000620:	00c68223          	sb	x12,4(x13)
80000624:	00e42023          	sw	x14,0(x8)
80000628:	efdff06f          	jal	x0,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
8000062c:	00c48513          	addi	x10,x9,12
80000630:	ecdff0ef          	jal	x1,800004fc <sglib___rbtree_add_recursive.constprop.0>
80000634:	0044c783          	lbu	x15,4(x9)
80000638:	ee0796e3          	bne	x15,x0,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
8000063c:	00042683          	lw	x13,0(x8)
80000640:	00c6a783          	lw	x15,12(x13)
80000644:	0086a703          	lw	x14,8(x13)
80000648:	0047c603          	lbu	x12,4(x15)
8000064c:	02070663          	beq	x14,x0,80000678 <sglib___rbtree_add_recursive.constprop.0+0x17c>
80000650:	00474583          	lbu	x11,4(x14)
80000654:	00100513          	addi	x10,x0,1
80000658:	02a59063          	bne	x11,x10,80000678 <sglib___rbtree_add_recursive.constprop.0+0x17c>
8000065c:	ecb614e3          	bne	x12,x11,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
80000660:	00c7a583          	lw	x11,12(x15)
80000664:	00058663          	beq	x11,x0,80000670 <sglib___rbtree_add_recursive.constprop.0+0x174>
80000668:	0045c583          	lbu	x11,4(x11)
8000066c:	f2c58ee3          	beq	x11,x12,800005a8 <sglib___rbtree_add_recursive.constprop.0+0xac>
80000670:	0087a603          	lw	x12,8(x15)
80000674:	f25ff06f          	jal	x0,80000598 <sglib___rbtree_add_recursive.constprop.0+0x9c>
80000678:	00100713          	addi	x14,x0,1
8000067c:	eae614e3          	bne	x12,x14,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
80000680:	00c7a583          	lw	x11,12(x15)
80000684:	0087a703          	lw	x14,8(x15)
80000688:	00058e63          	beq	x11,x0,800006a4 <sglib___rbtree_add_recursive.constprop.0+0x1a8>
8000068c:	0045c503          	lbu	x10,4(x11)
80000690:	00c51a63          	bne	x10,x12,800006a4 <sglib___rbtree_add_recursive.constprop.0+0x1a8>
80000694:	00e6a623          	sw	x14,12(x13)
80000698:	00b7a623          	sw	x11,12(x15)
8000069c:	00d7a423          	sw	x13,8(x15)
800006a0:	f45ff06f          	jal	x0,800005e4 <sglib___rbtree_add_recursive.constprop.0+0xe8>
800006a4:	e80700e3          	beq	x14,x0,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
800006a8:	00474603          	lbu	x12,4(x14)
800006ac:	00100593          	addi	x11,x0,1
800006b0:	e6b61ae3          	bne	x12,x11,80000524 <sglib___rbtree_add_recursive.constprop.0+0x28>
800006b4:	00c72503          	lw	x10,12(x14)
800006b8:	00872583          	lw	x11,8(x14)
800006bc:	00a7a423          	sw	x10,8(x15)
800006c0:	00b6a623          	sw	x11,12(x13)
800006c4:	00f72623          	sw	x15,12(x14)
800006c8:	00d72423          	sw	x13,8(x14)
800006cc:	f51ff06f          	jal	x0,8000061c <sglib___rbtree_add_recursive.constprop.0+0x120>

800006d0 <sglib_dllist_add>:
800006d0:	00052783          	lw	x15,0(x10)
800006d4:	00079c63          	bne	x15,x0,800006ec <sglib_dllist_add+0x1c>
800006d8:	00b52023          	sw	x11,0(x10)
800006dc:	0005a423          	sw	x0,8(x11)
800006e0:	00052783          	lw	x15,0(x10)
800006e4:	0007a223          	sw	x0,4(x15)
800006e8:	00008067          	jalr	x0,0(x1)
800006ec:	00f5a223          	sw	x15,4(x11)
800006f0:	0087a783          	lw	x15,8(x15)
800006f4:	00f5a423          	sw	x15,8(x11)
800006f8:	00052783          	lw	x15,0(x10)
800006fc:	00b7a423          	sw	x11,8(x15)
80000700:	0085a783          	lw	x15,8(x11)
80000704:	00078463          	beq	x15,x0,8000070c <sglib_dllist_add+0x3c>
80000708:	00b7a223          	sw	x11,4(x15)
8000070c:	00008067          	jalr	x0,0(x1)

80000710 <sglib_dllist_add_after>:
80000710:	00052783          	lw	x15,0(x10)
80000714:	00079c63          	bne	x15,x0,8000072c <sglib_dllist_add_after+0x1c>
80000718:	00b52023          	sw	x11,0(x10)
8000071c:	0005a423          	sw	x0,8(x11)
80000720:	00052783          	lw	x15,0(x10)
80000724:	0007a223          	sw	x0,4(x15)
80000728:	00008067          	jalr	x0,0(x1)
8000072c:	0047a783          	lw	x15,4(x15)
80000730:	00f5a223          	sw	x15,4(x11)
80000734:	00052783          	lw	x15,0(x10)
80000738:	00f5a423          	sw	x15,8(x11)
8000073c:	00b7a223          	sw	x11,4(x15)
80000740:	0045a783          	lw	x15,4(x11)
80000744:	00078463          	beq	x15,x0,8000074c <sglib_dllist_add_after+0x3c>
80000748:	00b7a423          	sw	x11,8(x15)
8000074c:	00008067          	jalr	x0,0(x1)

80000750 <sglib_dllist_add_before>:
80000750:	00052783          	lw	x15,0(x10)
80000754:	00079c63          	bne	x15,x0,8000076c <sglib_dllist_add_before+0x1c>
80000758:	00b52023          	sw	x11,0(x10)
8000075c:	0005a423          	sw	x0,8(x11)
80000760:	00052783          	lw	x15,0(x10)
80000764:	0007a223          	sw	x0,4(x15)
80000768:	00008067          	jalr	x0,0(x1)
8000076c:	00f5a223          	sw	x15,4(x11)
80000770:	0087a783          	lw	x15,8(x15)
80000774:	00f5a423          	sw	x15,8(x11)
80000778:	00052783          	lw	x15,0(x10)
8000077c:	00b7a423          	sw	x11,8(x15)
80000780:	0085a783          	lw	x15,8(x11)
80000784:	00078463          	beq	x15,x0,8000078c <sglib_dllist_add_before+0x3c>
80000788:	00b7a223          	sw	x11,4(x15)
8000078c:	00008067          	jalr	x0,0(x1)

80000790 <sglib_dllist_add_if_not_member>:
80000790:	00052703          	lw	x14,0(x10)
80000794:	00070793          	addi	x15,x14,0
80000798:	02078463          	beq	x15,x0,800007c0 <sglib_dllist_add_if_not_member+0x30>
8000079c:	0007a803          	lw	x16,0(x15)
800007a0:	0005a683          	lw	x13,0(x11)
800007a4:	00d81a63          	bne	x16,x13,800007b8 <sglib_dllist_add_if_not_member+0x28>
800007a8:	00f62023          	sw	x15,0(x12)
800007ac:	00062503          	lw	x10,0(x12)
800007b0:	00153513          	sltiu	x10,x10,1
800007b4:	00008067          	jalr	x0,0(x1)
800007b8:	0087a783          	lw	x15,8(x15)
800007bc:	fddff06f          	jal	x0,80000798 <sglib_dllist_add_if_not_member+0x8>
800007c0:	02070063          	beq	x14,x0,800007e0 <sglib_dllist_add_if_not_member+0x50>
800007c4:	00472783          	lw	x15,4(x14)
800007c8:	00078c63          	beq	x15,x0,800007e0 <sglib_dllist_add_if_not_member+0x50>
800007cc:	0007a683          	lw	x13,0(x15)
800007d0:	0005a703          	lw	x14,0(x11)
800007d4:	fce68ae3          	beq	x13,x14,800007a8 <sglib_dllist_add_if_not_member+0x18>
800007d8:	0047a783          	lw	x15,4(x15)
800007dc:	fedff06f          	jal	x0,800007c8 <sglib_dllist_add_if_not_member+0x38>
800007e0:	00062023          	sw	x0,0(x12)
800007e4:	00052783          	lw	x15,0(x10)
800007e8:	00079c63          	bne	x15,x0,80000800 <sglib_dllist_add_if_not_member+0x70>
800007ec:	00b52023          	sw	x11,0(x10)
800007f0:	0005a423          	sw	x0,8(x11)
800007f4:	00052783          	lw	x15,0(x10)
800007f8:	0007a223          	sw	x0,4(x15)
800007fc:	fb1ff06f          	jal	x0,800007ac <sglib_dllist_add_if_not_member+0x1c>
80000800:	00f5a223          	sw	x15,4(x11)
80000804:	0087a783          	lw	x15,8(x15)
80000808:	00f5a423          	sw	x15,8(x11)
8000080c:	00052783          	lw	x15,0(x10)
80000810:	00b7a423          	sw	x11,8(x15)
80000814:	0085a783          	lw	x15,8(x11)
80000818:	f8078ae3          	beq	x15,x0,800007ac <sglib_dllist_add_if_not_member+0x1c>
8000081c:	00b7a223          	sw	x11,4(x15)
80000820:	f8dff06f          	jal	x0,800007ac <sglib_dllist_add_if_not_member+0x1c>

80000824 <sglib_dllist_add_after_if_not_member>:
80000824:	00052703          	lw	x14,0(x10)
80000828:	00070793          	addi	x15,x14,0
8000082c:	02078463          	beq	x15,x0,80000854 <sglib_dllist_add_after_if_not_member+0x30>
80000830:	0007a803          	lw	x16,0(x15)
80000834:	0005a683          	lw	x13,0(x11)
80000838:	00d81a63          	bne	x16,x13,8000084c <sglib_dllist_add_after_if_not_member+0x28>
8000083c:	00f62023          	sw	x15,0(x12)
80000840:	00062503          	lw	x10,0(x12)
80000844:	00153513          	sltiu	x10,x10,1
80000848:	00008067          	jalr	x0,0(x1)
8000084c:	0087a783          	lw	x15,8(x15)
80000850:	fddff06f          	jal	x0,8000082c <sglib_dllist_add_after_if_not_member+0x8>
80000854:	02070063          	beq	x14,x0,80000874 <sglib_dllist_add_after_if_not_member+0x50>
80000858:	00472783          	lw	x15,4(x14)
8000085c:	00078c63          	beq	x15,x0,80000874 <sglib_dllist_add_after_if_not_member+0x50>
80000860:	0007a683          	lw	x13,0(x15)
80000864:	0005a703          	lw	x14,0(x11)
80000868:	fce68ae3          	beq	x13,x14,8000083c <sglib_dllist_add_after_if_not_member+0x18>
8000086c:	0047a783          	lw	x15,4(x15)
80000870:	fedff06f          	jal	x0,8000085c <sglib_dllist_add_after_if_not_member+0x38>
80000874:	00062023          	sw	x0,0(x12)
80000878:	00052783          	lw	x15,0(x10)
8000087c:	00079c63          	bne	x15,x0,80000894 <sglib_dllist_add_after_if_not_member+0x70>
80000880:	00b52023          	sw	x11,0(x10)
80000884:	0005a423          	sw	x0,8(x11)
80000888:	00052783          	lw	x15,0(x10)
8000088c:	0007a223          	sw	x0,4(x15)
80000890:	fb1ff06f          	jal	x0,80000840 <sglib_dllist_add_after_if_not_member+0x1c>
80000894:	0047a783          	lw	x15,4(x15)
80000898:	00f5a223          	sw	x15,4(x11)
8000089c:	00052783          	lw	x15,0(x10)
800008a0:	00f5a423          	sw	x15,8(x11)
800008a4:	00b7a223          	sw	x11,4(x15)
800008a8:	0045a783          	lw	x15,4(x11)
800008ac:	f8078ae3          	beq	x15,x0,80000840 <sglib_dllist_add_after_if_not_member+0x1c>
800008b0:	00b7a423          	sw	x11,8(x15)
800008b4:	f8dff06f          	jal	x0,80000840 <sglib_dllist_add_after_if_not_member+0x1c>

800008b8 <sglib_dllist_add_before_if_not_member>:
800008b8:	ed9ff06f          	jal	x0,80000790 <sglib_dllist_add_if_not_member>

800008bc <sglib_dllist_concat>:
800008bc:	00052783          	lw	x15,0(x10)
800008c0:	00079663          	bne	x15,x0,800008cc <sglib_dllist_concat+0x10>
800008c4:	00b52023          	sw	x11,0(x10)
800008c8:	00008067          	jalr	x0,0(x1)
800008cc:	02058463          	beq	x11,x0,800008f4 <sglib_dllist_concat+0x38>
800008d0:	00078713          	addi	x14,x15,0
800008d4:	0047a783          	lw	x15,4(x15)
800008d8:	fe079ce3          	bne	x15,x0,800008d0 <sglib_dllist_concat+0x14>
800008dc:	0005a223          	sw	x0,4(x11)
800008e0:	00e5a423          	sw	x14,8(x11)
800008e4:	00b72223          	sw	x11,4(x14)
800008e8:	0045a783          	lw	x15,4(x11)
800008ec:	00078463          	beq	x15,x0,800008f4 <sglib_dllist_concat+0x38>
800008f0:	00b7a423          	sw	x11,8(x15)
800008f4:	00008067          	jalr	x0,0(x1)

800008f8 <sglib_dllist_delete>:
800008f8:	00052783          	lw	x15,0(x10)
800008fc:	0085a683          	lw	x13,8(x11)
80000900:	0045a703          	lw	x14,4(x11)
80000904:	00b79863          	bne	x15,x11,80000914 <sglib_dllist_delete+0x1c>
80000908:	00070793          	addi	x15,x14,0
8000090c:	00068463          	beq	x13,x0,80000914 <sglib_dllist_delete+0x1c>
80000910:	00068793          	addi	x15,x13,0
80000914:	00070463          	beq	x14,x0,8000091c <sglib_dllist_delete+0x24>
80000918:	00d72423          	sw	x13,8(x14)
8000091c:	0085a683          	lw	x13,8(x11)
80000920:	00068463          	beq	x13,x0,80000928 <sglib_dllist_delete+0x30>
80000924:	00e6a223          	sw	x14,4(x13)
80000928:	00f52023          	sw	x15,0(x10)
8000092c:	00008067          	jalr	x0,0(x1)

80000930 <sglib_dllist_delete_if_member>:
80000930:	00052703          	lw	x14,0(x10)
80000934:	00070793          	addi	x15,x14,0
80000938:	04078a63          	beq	x15,x0,8000098c <sglib_dllist_delete_if_member+0x5c>
8000093c:	0007a803          	lw	x16,0(x15)
80000940:	0005a683          	lw	x13,0(x11)
80000944:	04d81063          	bne	x16,x13,80000984 <sglib_dllist_delete_if_member+0x54>
80000948:	00f62023          	sw	x15,0(x12)
8000094c:	00052703          	lw	x14,0(x10)
80000950:	0087a583          	lw	x11,8(x15)
80000954:	0047a683          	lw	x13,4(x15)
80000958:	00f71863          	bne	x14,x15,80000968 <sglib_dllist_delete_if_member+0x38>
8000095c:	00068713          	addi	x14,x13,0
80000960:	00058463          	beq	x11,x0,80000968 <sglib_dllist_delete_if_member+0x38>
80000964:	00058713          	addi	x14,x11,0
80000968:	00068463          	beq	x13,x0,80000970 <sglib_dllist_delete_if_member+0x40>
8000096c:	00b6a423          	sw	x11,8(x13)
80000970:	0087a783          	lw	x15,8(x15)
80000974:	00078463          	beq	x15,x0,8000097c <sglib_dllist_delete_if_member+0x4c>
80000978:	00d7a223          	sw	x13,4(x15)
8000097c:	00e52023          	sw	x14,0(x10)
80000980:	0140006f          	jal	x0,80000994 <sglib_dllist_delete_if_member+0x64>
80000984:	0087a783          	lw	x15,8(x15)
80000988:	fb1ff06f          	jal	x0,80000938 <sglib_dllist_delete_if_member+0x8>
8000098c:	00071a63          	bne	x14,x0,800009a0 <sglib_dllist_delete_if_member+0x70>
80000990:	00062023          	sw	x0,0(x12)
80000994:	00062503          	lw	x10,0(x12)
80000998:	00a03533          	sltu	x10,x0,x10
8000099c:	00008067          	jalr	x0,0(x1)
800009a0:	00472783          	lw	x15,4(x14)
800009a4:	fe0786e3          	beq	x15,x0,80000990 <sglib_dllist_delete_if_member+0x60>
800009a8:	0007a683          	lw	x13,0(x15)
800009ac:	0005a703          	lw	x14,0(x11)
800009b0:	f8e68ce3          	beq	x13,x14,80000948 <sglib_dllist_delete_if_member+0x18>
800009b4:	0047a783          	lw	x15,4(x15)
800009b8:	fedff06f          	jal	x0,800009a4 <sglib_dllist_delete_if_member+0x74>

800009bc <sglib_dllist_is_member>:
800009bc:	00050793          	addi	x15,x10,0
800009c0:	02078663          	beq	x15,x0,800009ec <sglib_dllist_is_member+0x30>
800009c4:	00b79663          	bne	x15,x11,800009d0 <sglib_dllist_is_member+0x14>
800009c8:	00100513          	addi	x10,x0,1
800009cc:	00008067          	jalr	x0,0(x1)
800009d0:	0087a783          	lw	x15,8(x15)
800009d4:	fedff06f          	jal	x0,800009c0 <sglib_dllist_is_member+0x4>
800009d8:	00452503          	lw	x10,4(x10)
800009dc:	00050463          	beq	x10,x0,800009e4 <sglib_dllist_is_member+0x28>
800009e0:	feb51ce3          	bne	x10,x11,800009d8 <sglib_dllist_is_member+0x1c>
800009e4:	00a03533          	sltu	x10,x0,x10
800009e8:	00008067          	jalr	x0,0(x1)
800009ec:	fe0516e3          	bne	x10,x0,800009d8 <sglib_dllist_is_member+0x1c>
800009f0:	00008067          	jalr	x0,0(x1)

800009f4 <sglib_dllist_find_member>:
800009f4:	00050793          	addi	x15,x10,0
800009f8:	00050e63          	beq	x10,x0,80000a14 <sglib_dllist_find_member+0x20>
800009fc:	00052683          	lw	x13,0(x10)
80000a00:	0005a703          	lw	x14,0(x11)
80000a04:	00e69463          	bne	x13,x14,80000a0c <sglib_dllist_find_member+0x18>
80000a08:	00008067          	jalr	x0,0(x1)
80000a0c:	00852503          	lw	x10,8(x10)
80000a10:	fe9ff06f          	jal	x0,800009f8 <sglib_dllist_find_member+0x4>
80000a14:	00078c63          	beq	x15,x0,80000a2c <sglib_dllist_find_member+0x38>
80000a18:	0047a503          	lw	x10,4(x15)
80000a1c:	00050863          	beq	x10,x0,80000a2c <sglib_dllist_find_member+0x38>
80000a20:	00052703          	lw	x14,0(x10)
80000a24:	0005a783          	lw	x15,0(x11)
80000a28:	00f71463          	bne	x14,x15,80000a30 <sglib_dllist_find_member+0x3c>
80000a2c:	00008067          	jalr	x0,0(x1)
80000a30:	00452503          	lw	x10,4(x10)
80000a34:	fe9ff06f          	jal	x0,80000a1c <sglib_dllist_find_member+0x28>

80000a38 <sglib_dllist_get_first>:
80000a38:	00050a63          	beq	x10,x0,80000a4c <sglib_dllist_get_first+0x14>
80000a3c:	00050793          	addi	x15,x10,0
80000a40:	00852503          	lw	x10,8(x10)
80000a44:	fe051ce3          	bne	x10,x0,80000a3c <sglib_dllist_get_first+0x4>
80000a48:	00078513          	addi	x10,x15,0
80000a4c:	00008067          	jalr	x0,0(x1)

80000a50 <sglib_dllist_get_last>:
80000a50:	00050a63          	beq	x10,x0,80000a64 <sglib_dllist_get_last+0x14>
80000a54:	00050793          	addi	x15,x10,0
80000a58:	00452503          	lw	x10,4(x10)
80000a5c:	fe051ce3          	bne	x10,x0,80000a54 <sglib_dllist_get_last+0x4>
80000a60:	00078513          	addi	x10,x15,0
80000a64:	00008067          	jalr	x0,0(x1)

80000a68 <sglib_dllist_sort>:
80000a68:	00052583          	lw	x11,0(x10)
80000a6c:	10058863          	beq	x11,x0,80000b7c <sglib_dllist_sort+0x114>
80000a70:	ff010113          	addi	x2,x2,-16
80000a74:	00058793          	addi	x15,x11,0
80000a78:	0085a583          	lw	x11,8(x11)
80000a7c:	fe059ce3          	bne	x11,x0,80000a74 <sglib_dllist_sort+0xc>
80000a80:	00f12623          	sw	x15,12(x2)
80000a84:	00100813          	addi	x16,x0,1
80000a88:	00c12783          	lw	x15,12(x2)
80000a8c:	00000893          	addi	x17,x0,0
80000a90:	00012623          	sw	x0,12(x2)
80000a94:	00c10693          	addi	x13,x2,12
80000a98:	02078263          	beq	x15,x0,80000abc <sglib_dllist_sort+0x54>
80000a9c:	00078613          	addi	x12,x15,0
80000aa0:	00100713          	addi	x14,x0,1
80000aa4:	00c0006f          	jal	x0,80000ab0 <sglib_dllist_sort+0x48>
80000aa8:	00462603          	lw	x12,4(x12)
80000aac:	00170713          	addi	x14,x14,1
80000ab0:	03075663          	bge	x14,x16,80000adc <sglib_dllist_sort+0x74>
80000ab4:	fe061ae3          	bne	x12,x0,80000aa8 <sglib_dllist_sort+0x40>
80000ab8:	00f6a023          	sw	x15,0(x13)
80000abc:	00181813          	slli	x16,x16,0x1
80000ac0:	fc0894e3          	bne	x17,x0,80000a88 <sglib_dllist_sort+0x20>
80000ac4:	00c12703          	lw	x14,12(x2)
80000ac8:	00070793          	addi	x15,x14,0
80000acc:	0a079063          	bne	x15,x0,80000b6c <sglib_dllist_sort+0x104>
80000ad0:	00e52023          	sw	x14,0(x10)
80000ad4:	01010113          	addi	x2,x2,16
80000ad8:	00008067          	jalr	x0,0(x1)
80000adc:	fc060ee3          	beq	x12,x0,80000ab8 <sglib_dllist_sort+0x50>
80000ae0:	00462703          	lw	x14,4(x12)
80000ae4:	00100893          	addi	x17,x0,1
80000ae8:	00062223          	sw	x0,4(x12)
80000aec:	00070613          	addi	x12,x14,0
80000af0:	0508d863          	bge	x17,x16,80000b40 <sglib_dllist_sort+0xd8>
80000af4:	04061063          	bne	x12,x0,80000b34 <sglib_dllist_sort+0xcc>
80000af8:	02070263          	beq	x14,x0,80000b1c <sglib_dllist_sort+0xb4>
80000afc:	0007a303          	lw	x6,0(x15)
80000b00:	00072883          	lw	x17,0(x14)
80000b04:	05135863          	bge	x6,x17,80000b54 <sglib_dllist_sort+0xec>
80000b08:	00f6a023          	sw	x15,0(x13)
80000b0c:	00478693          	addi	x13,x15,4
80000b10:	0047a783          	lw	x15,4(x15)
80000b14:	fe0794e3          	bne	x15,x0,80000afc <sglib_dllist_sort+0x94>
80000b18:	00070793          	addi	x15,x14,0
80000b1c:	00f6a023          	sw	x15,0(x13)
80000b20:	00100893          	addi	x17,x0,1
80000b24:	0006a783          	lw	x15,0(x13)
80000b28:	02079e63          	bne	x15,x0,80000b64 <sglib_dllist_sort+0xfc>
80000b2c:	00060793          	addi	x15,x12,0
80000b30:	f69ff06f          	jal	x0,80000a98 <sglib_dllist_sort+0x30>
80000b34:	00462603          	lw	x12,4(x12)
80000b38:	00188893          	addi	x17,x17,1
80000b3c:	fb5ff06f          	jal	x0,80000af0 <sglib_dllist_sort+0x88>
80000b40:	fa060ce3          	beq	x12,x0,80000af8 <sglib_dllist_sort+0x90>
80000b44:	00462883          	lw	x17,4(x12)
80000b48:	00062223          	sw	x0,4(x12)
80000b4c:	00088613          	addi	x12,x17,0
80000b50:	fa9ff06f          	jal	x0,80000af8 <sglib_dllist_sort+0x90>
80000b54:	00e6a023          	sw	x14,0(x13)
80000b58:	00470693          	addi	x13,x14,4
80000b5c:	00472703          	lw	x14,4(x14)
80000b60:	f99ff06f          	jal	x0,80000af8 <sglib_dllist_sort+0x90>
80000b64:	00478693          	addi	x13,x15,4
80000b68:	fbdff06f          	jal	x0,80000b24 <sglib_dllist_sort+0xbc>
80000b6c:	00b7a423          	sw	x11,8(x15)
80000b70:	00078593          	addi	x11,x15,0
80000b74:	0047a783          	lw	x15,4(x15)
80000b78:	f55ff06f          	jal	x0,80000acc <sglib_dllist_sort+0x64>
80000b7c:	00008067          	jalr	x0,0(x1)

80000b80 <sglib_dllist_len>:
80000b80:	02050c63          	beq	x10,x0,80000bb8 <sglib_dllist_len+0x38>
80000b84:	00050713          	addi	x14,x10,0
80000b88:	00000793          	addi	x15,x0,0
80000b8c:	00872703          	lw	x14,8(x14)
80000b90:	00178793          	addi	x15,x15,1
80000b94:	fe071ce3          	bne	x14,x0,80000b8c <sglib_dllist_len+0xc>
80000b98:	00452703          	lw	x14,4(x10)
80000b9c:	00000513          	addi	x10,x0,0
80000ba0:	00071663          	bne	x14,x0,80000bac <sglib_dllist_len+0x2c>
80000ba4:	00f50533          	add	x10,x10,x15
80000ba8:	00008067          	jalr	x0,0(x1)
80000bac:	00472703          	lw	x14,4(x14)
80000bb0:	00150513          	addi	x10,x10,1
80000bb4:	fedff06f          	jal	x0,80000ba0 <sglib_dllist_len+0x20>
80000bb8:	00000513          	addi	x10,x0,0
80000bbc:	00008067          	jalr	x0,0(x1)

80000bc0 <sglib_dllist_reverse>:
80000bc0:	00052783          	lw	x15,0(x10)
80000bc4:	02078263          	beq	x15,x0,80000be8 <sglib_dllist_reverse+0x28>
80000bc8:	0047a703          	lw	x14,4(x15)
80000bcc:	0047a603          	lw	x12,4(x15)
80000bd0:	00078693          	addi	x13,x15,0
80000bd4:	0087a783          	lw	x15,8(x15)
80000bd8:	00c6a423          	sw	x12,8(x13)
80000bdc:	00f6a223          	sw	x15,4(x13)
80000be0:	fe0796e3          	bne	x15,x0,80000bcc <sglib_dllist_reverse+0xc>
80000be4:	00071463          	bne	x14,x0,80000bec <sglib_dllist_reverse+0x2c>
80000be8:	00008067          	jalr	x0,0(x1)
80000bec:	00472783          	lw	x15,4(x14)
80000bf0:	00872683          	lw	x13,8(x14)
80000bf4:	00f72423          	sw	x15,8(x14)
80000bf8:	00d72223          	sw	x13,4(x14)
80000bfc:	00078713          	addi	x14,x15,0
80000c00:	fe5ff06f          	jal	x0,80000be4 <sglib_dllist_reverse+0x24>

80000c04 <sglib_dllist_it_current>:
80000c04:	00052503          	lw	x10,0(x10)
80000c08:	00008067          	jalr	x0,0(x1)

80000c0c <sglib_dllist_it_next>:
80000c0c:	fe010113          	addi	x2,x2,-32
80000c10:	01212823          	sw	x18,16(x2)
80000c14:	00c52903          	lw	x18,12(x10)
80000c18:	00812c23          	sw	x8,24(x2)
80000c1c:	00912a23          	sw	x9,20(x2)
80000c20:	00112e23          	sw	x1,28(x2)
80000c24:	01312623          	sw	x19,12(x2)
80000c28:	00452403          	lw	x8,4(x10)
80000c2c:	00052223          	sw	x0,4(x10)
80000c30:	00050493          	addi	x9,x10,0
80000c34:	04090863          	beq	x18,x0,80000c84 <sglib_dllist_it_next+0x78>
80000c38:	01052983          	lw	x19,16(x10)
80000c3c:	04040663          	beq	x8,x0,80000c88 <sglib_dllist_it_next+0x7c>
80000c40:	00040593          	addi	x11,x8,0
80000c44:	00098513          	addi	x10,x19,0
80000c48:	000900e7          	jalr	x1,0(x18)
80000c4c:	02051863          	bne	x10,x0,80000c7c <sglib_dllist_it_next+0x70>
80000c50:	00842783          	lw	x15,8(x8)
80000c54:	00f4a223          	sw	x15,4(x9)
80000c58:	0084a023          	sw	x8,0(x9)
80000c5c:	01c12083          	lw	x1,28(x2)
80000c60:	00040513          	addi	x10,x8,0
80000c64:	01812403          	lw	x8,24(x2)
80000c68:	01412483          	lw	x9,20(x2)
80000c6c:	01012903          	lw	x18,16(x2)
80000c70:	00c12983          	lw	x19,12(x2)
80000c74:	02010113          	addi	x2,x2,32
80000c78:	00008067          	jalr	x0,0(x1)
80000c7c:	00842403          	lw	x8,8(x8)
80000c80:	fbdff06f          	jal	x0,80000c3c <sglib_dllist_it_next+0x30>
80000c84:	fc0416e3          	bne	x8,x0,80000c50 <sglib_dllist_it_next+0x44>
80000c88:	00c4a903          	lw	x18,12(x9)
80000c8c:	0084a403          	lw	x8,8(x9)
80000c90:	0004a423          	sw	x0,8(x9)
80000c94:	02090863          	beq	x18,x0,80000cc4 <sglib_dllist_it_next+0xb8>
80000c98:	0104a983          	lw	x19,16(x9)
80000c9c:	02040663          	beq	x8,x0,80000cc8 <sglib_dllist_it_next+0xbc>
80000ca0:	00098593          	addi	x11,x19,0
80000ca4:	00040513          	addi	x10,x8,0
80000ca8:	000900e7          	jalr	x1,0(x18)
80000cac:	00051863          	bne	x10,x0,80000cbc <sglib_dllist_it_next+0xb0>
80000cb0:	00442783          	lw	x15,4(x8)
80000cb4:	00f4a423          	sw	x15,8(x9)
80000cb8:	fa1ff06f          	jal	x0,80000c58 <sglib_dllist_it_next+0x4c>
80000cbc:	00442403          	lw	x8,4(x8)
80000cc0:	fddff06f          	jal	x0,80000c9c <sglib_dllist_it_next+0x90>
80000cc4:	fe0416e3          	bne	x8,x0,80000cb0 <sglib_dllist_it_next+0xa4>
80000cc8:	00000413          	addi	x8,x0,0
80000ccc:	f8dff06f          	jal	x0,80000c58 <sglib_dllist_it_next+0x4c>

80000cd0 <sglib_dllist_it_init_on_equal>:
80000cd0:	00c52623          	sw	x12,12(x10)
80000cd4:	00d52823          	sw	x13,16(x10)
80000cd8:	00b52223          	sw	x11,4(x10)
80000cdc:	00b52423          	sw	x11,8(x10)
80000ce0:	00058663          	beq	x11,x0,80000cec <sglib_dllist_it_init_on_equal+0x1c>
80000ce4:	0045a783          	lw	x15,4(x11)
80000ce8:	00f52423          	sw	x15,8(x10)
80000cec:	f21ff06f          	jal	x0,80000c0c <sglib_dllist_it_next>

80000cf0 <sglib_dllist_it_init>:
80000cf0:	00000693          	addi	x13,x0,0
80000cf4:	00000613          	addi	x12,x0,0
80000cf8:	fd9ff06f          	jal	x0,80000cd0 <sglib_dllist_it_init_on_equal>

80000cfc <ilist_hash_function>:
80000cfc:	00052503          	lw	x10,0(x10)
80000d00:	00008067          	jalr	x0,0(x1)

80000d04 <sglib_ilist_is_member>:
80000d04:	00050463          	beq	x10,x0,80000d0c <sglib_ilist_is_member+0x8>
80000d08:	00b51663          	bne	x10,x11,80000d14 <sglib_ilist_is_member+0x10>
80000d0c:	00a03533          	sltu	x10,x0,x10
80000d10:	00008067          	jalr	x0,0(x1)
80000d14:	00452503          	lw	x10,4(x10)
80000d18:	fedff06f          	jal	x0,80000d04 <sglib_ilist_is_member>

80000d1c <sglib_ilist_find_member>:
80000d1c:	00050863          	beq	x10,x0,80000d2c <sglib_ilist_find_member+0x10>
80000d20:	00052703          	lw	x14,0(x10)
80000d24:	0005a783          	lw	x15,0(x11)
80000d28:	00f71463          	bne	x14,x15,80000d30 <sglib_ilist_find_member+0x14>
80000d2c:	00008067          	jalr	x0,0(x1)
80000d30:	00452503          	lw	x10,4(x10)
80000d34:	fe9ff06f          	jal	x0,80000d1c <sglib_ilist_find_member>

80000d38 <sglib_ilist_add_if_not_member>:
80000d38:	00052783          	lw	x15,0(x10)
80000d3c:	02078463          	beq	x15,x0,80000d64 <sglib_ilist_add_if_not_member+0x2c>
80000d40:	0007a683          	lw	x13,0(x15)
80000d44:	0005a703          	lw	x14,0(x11)
80000d48:	00e69a63          	bne	x13,x14,80000d5c <sglib_ilist_add_if_not_member+0x24>
80000d4c:	00f62023          	sw	x15,0(x12)
80000d50:	00062503          	lw	x10,0(x12)
80000d54:	00153513          	sltiu	x10,x10,1
80000d58:	00008067          	jalr	x0,0(x1)
80000d5c:	0047a783          	lw	x15,4(x15)
80000d60:	fddff06f          	jal	x0,80000d3c <sglib_ilist_add_if_not_member+0x4>
80000d64:	00062023          	sw	x0,0(x12)
80000d68:	00052783          	lw	x15,0(x10)
80000d6c:	00f5a223          	sw	x15,4(x11)
80000d70:	00b52023          	sw	x11,0(x10)
80000d74:	fddff06f          	jal	x0,80000d50 <sglib_ilist_add_if_not_member+0x18>

80000d78 <sglib_ilist_add>:
80000d78:	00052783          	lw	x15,0(x10)
80000d7c:	00f5a223          	sw	x15,4(x11)
80000d80:	00b52023          	sw	x11,0(x10)
80000d84:	00008067          	jalr	x0,0(x1)

80000d88 <sglib_ilist_concat>:
80000d88:	00052783          	lw	x15,0(x10)
80000d8c:	00079663          	bne	x15,x0,80000d98 <sglib_ilist_concat+0x10>
80000d90:	00b52023          	sw	x11,0(x10)
80000d94:	00008067          	jalr	x0,0(x1)
80000d98:	00078713          	addi	x14,x15,0
80000d9c:	0047a783          	lw	x15,4(x15)
80000da0:	fe079ce3          	bne	x15,x0,80000d98 <sglib_ilist_concat+0x10>
80000da4:	00b72223          	sw	x11,4(x14)
80000da8:	00008067          	jalr	x0,0(x1)

80000dac <sglib_ilist_delete>:
80000dac:	00052783          	lw	x15,0(x10)
80000db0:	00078e63          	beq	x15,x0,80000dcc <sglib_ilist_delete+0x20>
80000db4:	00b79863          	bne	x15,x11,80000dc4 <sglib_ilist_delete+0x18>
80000db8:	0045a783          	lw	x15,4(x11)
80000dbc:	00f52023          	sw	x15,0(x10)
80000dc0:	00008067          	jalr	x0,0(x1)
80000dc4:	00478513          	addi	x10,x15,4
80000dc8:	fe5ff06f          	jal	x0,80000dac <sglib_ilist_delete>
80000dcc:	00402783          	lw	x15,4(x0) # 4 <_heap_size+0x4>
80000dd0:	00100073          	ebreak

80000dd4 <sglib_ilist_delete_if_member>:
80000dd4:	00052783          	lw	x15,0(x10)
80000dd8:	02078863          	beq	x15,x0,80000e08 <sglib_ilist_delete_if_member+0x34>
80000ddc:	0007a683          	lw	x13,0(x15)
80000de0:	0005a703          	lw	x14,0(x11)
80000de4:	00e69e63          	bne	x13,x14,80000e00 <sglib_ilist_delete_if_member+0x2c>
80000de8:	00f62023          	sw	x15,0(x12)
80000dec:	0047a783          	lw	x15,4(x15)
80000df0:	00f52023          	sw	x15,0(x10)
80000df4:	00062503          	lw	x10,0(x12)
80000df8:	00a03533          	sltu	x10,x0,x10
80000dfc:	00008067          	jalr	x0,0(x1)
80000e00:	00478513          	addi	x10,x15,4
80000e04:	fd1ff06f          	jal	x0,80000dd4 <sglib_ilist_delete_if_member>
80000e08:	00062023          	sw	x0,0(x12)
80000e0c:	fe9ff06f          	jal	x0,80000df4 <sglib_ilist_delete_if_member+0x20>

80000e10 <sglib_ilist_sort>:
80000e10:	00052783          	lw	x15,0(x10)
80000e14:	ff010113          	addi	x2,x2,-16
80000e18:	00100593          	addi	x11,x0,1
80000e1c:	00f12623          	sw	x15,12(x2)
80000e20:	00c12783          	lw	x15,12(x2)
80000e24:	00000813          	addi	x16,x0,0
80000e28:	00012623          	sw	x0,12(x2)
80000e2c:	00c10713          	addi	x14,x2,12
80000e30:	02078263          	beq	x15,x0,80000e54 <sglib_ilist_sort+0x44>
80000e34:	00078693          	addi	x13,x15,0
80000e38:	00100613          	addi	x12,x0,1
80000e3c:	00c0006f          	jal	x0,80000e48 <sglib_ilist_sort+0x38>
80000e40:	0046a683          	lw	x13,4(x13)
80000e44:	00160613          	addi	x12,x12,1
80000e48:	02b65263          	bge	x12,x11,80000e6c <sglib_ilist_sort+0x5c>
80000e4c:	fe069ae3          	bne	x13,x0,80000e40 <sglib_ilist_sort+0x30>
80000e50:	00f72023          	sw	x15,0(x14)
80000e54:	00159593          	slli	x11,x11,0x1
80000e58:	fc0814e3          	bne	x16,x0,80000e20 <sglib_ilist_sort+0x10>
80000e5c:	00c12783          	lw	x15,12(x2)
80000e60:	00f52023          	sw	x15,0(x10)
80000e64:	01010113          	addi	x2,x2,16
80000e68:	00008067          	jalr	x0,0(x1)
80000e6c:	fe0682e3          	beq	x13,x0,80000e50 <sglib_ilist_sort+0x40>
80000e70:	0046a803          	lw	x16,4(x13)
80000e74:	00100613          	addi	x12,x0,1
80000e78:	0006a223          	sw	x0,4(x13)
80000e7c:	00080693          	addi	x13,x16,0
80000e80:	04b65a63          	bge	x12,x11,80000ed4 <sglib_ilist_sort+0xc4>
80000e84:	04069263          	bne	x13,x0,80000ec8 <sglib_ilist_sort+0xb8>
80000e88:	02080463          	beq	x16,x0,80000eb0 <sglib_ilist_sort+0xa0>
80000e8c:	00078613          	addi	x12,x15,0
80000e90:	00080793          	addi	x15,x16,0
80000e94:	00062883          	lw	x17,0(x12)
80000e98:	0007a803          	lw	x16,0(x15)
80000e9c:	0508d663          	bge	x17,x16,80000ee8 <sglib_ilist_sort+0xd8>
80000ea0:	00c72023          	sw	x12,0(x14)
80000ea4:	00460713          	addi	x14,x12,4
80000ea8:	00462603          	lw	x12,4(x12)
80000eac:	fe0614e3          	bne	x12,x0,80000e94 <sglib_ilist_sort+0x84>
80000eb0:	00f72023          	sw	x15,0(x14)
80000eb4:	00100813          	addi	x16,x0,1
80000eb8:	00072783          	lw	x15,0(x14)
80000ebc:	04079263          	bne	x15,x0,80000f00 <sglib_ilist_sort+0xf0>
80000ec0:	00068793          	addi	x15,x13,0
80000ec4:	f6dff06f          	jal	x0,80000e30 <sglib_ilist_sort+0x20>
80000ec8:	0046a683          	lw	x13,4(x13)
80000ecc:	00160613          	addi	x12,x12,1
80000ed0:	fb1ff06f          	jal	x0,80000e80 <sglib_ilist_sort+0x70>
80000ed4:	fa068ae3          	beq	x13,x0,80000e88 <sglib_ilist_sort+0x78>
80000ed8:	0046a603          	lw	x12,4(x13)
80000edc:	0006a223          	sw	x0,4(x13)
80000ee0:	00060693          	addi	x13,x12,0
80000ee4:	fa5ff06f          	jal	x0,80000e88 <sglib_ilist_sort+0x78>
80000ee8:	00f72023          	sw	x15,0(x14)
80000eec:	00478713          	addi	x14,x15,4
80000ef0:	0047a783          	lw	x15,4(x15)
80000ef4:	fa0790e3          	bne	x15,x0,80000e94 <sglib_ilist_sort+0x84>
80000ef8:	00060793          	addi	x15,x12,0
80000efc:	fb5ff06f          	jal	x0,80000eb0 <sglib_ilist_sort+0xa0>
80000f00:	00478713          	addi	x14,x15,4
80000f04:	fb5ff06f          	jal	x0,80000eb8 <sglib_ilist_sort+0xa8>

80000f08 <sglib_ilist_len>:
80000f08:	00050793          	addi	x15,x10,0
80000f0c:	00000513          	addi	x10,x0,0
80000f10:	00079463          	bne	x15,x0,80000f18 <sglib_ilist_len+0x10>
80000f14:	00008067          	jalr	x0,0(x1)
80000f18:	0047a783          	lw	x15,4(x15)
80000f1c:	00150513          	addi	x10,x10,1
80000f20:	ff1ff06f          	jal	x0,80000f10 <sglib_ilist_len+0x8>

80000f24 <sglib_ilist_reverse>:
80000f24:	00052783          	lw	x15,0(x10)
80000f28:	00000713          	addi	x14,x0,0
80000f2c:	00079663          	bne	x15,x0,80000f38 <sglib_ilist_reverse+0x14>
80000f30:	00e52023          	sw	x14,0(x10)
80000f34:	00008067          	jalr	x0,0(x1)
80000f38:	0047a683          	lw	x13,4(x15)
80000f3c:	00e7a223          	sw	x14,4(x15)
80000f40:	00078713          	addi	x14,x15,0
80000f44:	00068793          	addi	x15,x13,0
80000f48:	fe5ff06f          	jal	x0,80000f2c <sglib_ilist_reverse+0x8>

80000f4c <sglib_ilist_it_current>:
80000f4c:	00052503          	lw	x10,0(x10)
80000f50:	00008067          	jalr	x0,0(x1)

80000f54 <sglib_ilist_it_next>:
80000f54:	fe010113          	addi	x2,x2,-32
80000f58:	01212823          	sw	x18,16(x2)
80000f5c:	00852903          	lw	x18,8(x10)
80000f60:	00812c23          	sw	x8,24(x2)
80000f64:	00912a23          	sw	x9,20(x2)
80000f68:	00112e23          	sw	x1,28(x2)
80000f6c:	01312623          	sw	x19,12(x2)
80000f70:	00452403          	lw	x8,4(x10)
80000f74:	00052223          	sw	x0,4(x10)
80000f78:	00050493          	addi	x9,x10,0
80000f7c:	00090e63          	beq	x18,x0,80000f98 <sglib_ilist_it_next+0x44>
80000f80:	00c52983          	lw	x19,12(x10)
80000f84:	00040a63          	beq	x8,x0,80000f98 <sglib_ilist_it_next+0x44>
80000f88:	00098593          	addi	x11,x19,0
80000f8c:	00040513          	addi	x10,x8,0
80000f90:	000900e7          	jalr	x1,0(x18)
80000f94:	02051a63          	bne	x10,x0,80000fc8 <sglib_ilist_it_next+0x74>
80000f98:	0084a023          	sw	x8,0(x9)
80000f9c:	00040663          	beq	x8,x0,80000fa8 <sglib_ilist_it_next+0x54>
80000fa0:	00442783          	lw	x15,4(x8)
80000fa4:	00f4a223          	sw	x15,4(x9)
80000fa8:	01c12083          	lw	x1,28(x2)
80000fac:	00040513          	addi	x10,x8,0
80000fb0:	01812403          	lw	x8,24(x2)
80000fb4:	01412483          	lw	x9,20(x2)
80000fb8:	01012903          	lw	x18,16(x2)
80000fbc:	00c12983          	lw	x19,12(x2)
80000fc0:	02010113          	addi	x2,x2,32
80000fc4:	00008067          	jalr	x0,0(x1)
80000fc8:	00442403          	lw	x8,4(x8)
80000fcc:	fb9ff06f          	jal	x0,80000f84 <sglib_ilist_it_next+0x30>

80000fd0 <sglib_ilist_it_init_on_equal>:
80000fd0:	00c52423          	sw	x12,8(x10)
80000fd4:	00d52623          	sw	x13,12(x10)
80000fd8:	00b52223          	sw	x11,4(x10)
80000fdc:	f79ff06f          	jal	x0,80000f54 <sglib_ilist_it_next>

80000fe0 <sglib_ilist_it_init>:
80000fe0:	00052423          	sw	x0,8(x10)
80000fe4:	00052623          	sw	x0,12(x10)
80000fe8:	00b52223          	sw	x11,4(x10)
80000fec:	f69ff06f          	jal	x0,80000f54 <sglib_ilist_it_next>

80000ff0 <sglib_hashed_ilist_init>:
80000ff0:	05000613          	addi	x12,x0,80
80000ff4:	00000593          	addi	x11,x0,0
80000ff8:	7980306f          	jal	x0,80004790 <memset>

80000ffc <sglib_hashed_ilist_add>:
80000ffc:	ff010113          	addi	x2,x2,-16
80001000:	00912223          	sw	x9,4(x2)
80001004:	00058493          	addi	x9,x11,0
80001008:	00812423          	sw	x8,8(x2)
8000100c:	00050413          	addi	x8,x10,0
80001010:	0004a503          	lw	x10,0(x9)
80001014:	01400593          	addi	x11,x0,20
80001018:	00112623          	sw	x1,12(x2)
8000101c:	250010ef          	jal	x1,8000226c <__umodsi3>
80001020:	00251513          	slli	x10,x10,0x2
80001024:	00a40533          	add	x10,x8,x10
80001028:	00052783          	lw	x15,0(x10)
8000102c:	00c12083          	lw	x1,12(x2)
80001030:	00812403          	lw	x8,8(x2)
80001034:	00f4a223          	sw	x15,4(x9)
80001038:	00952023          	sw	x9,0(x10)
8000103c:	00412483          	lw	x9,4(x2)
80001040:	01010113          	addi	x2,x2,16
80001044:	00008067          	jalr	x0,0(x1)

80001048 <sglib_hashed_ilist_add_if_not_member>:
80001048:	fe010113          	addi	x2,x2,-32
8000104c:	00812c23          	sw	x8,24(x2)
80001050:	00058413          	addi	x8,x11,0
80001054:	00912a23          	sw	x9,20(x2)
80001058:	00050493          	addi	x9,x10,0
8000105c:	00042503          	lw	x10,0(x8)
80001060:	01400593          	addi	x11,x0,20
80001064:	00112e23          	sw	x1,28(x2)
80001068:	00c12623          	sw	x12,12(x2)
8000106c:	200010ef          	jal	x1,8000226c <__umodsi3>
80001070:	00251513          	slli	x10,x10,0x2
80001074:	00040593          	addi	x11,x8,0
80001078:	01812403          	lw	x8,24(x2)
8000107c:	00c12603          	lw	x12,12(x2)
80001080:	01c12083          	lw	x1,28(x2)
80001084:	00a48533          	add	x10,x9,x10
80001088:	01412483          	lw	x9,20(x2)
8000108c:	02010113          	addi	x2,x2,32
80001090:	ca9ff06f          	jal	x0,80000d38 <sglib_ilist_add_if_not_member>

80001094 <sglib_hashed_ilist_delete>:
80001094:	ff010113          	addi	x2,x2,-16
80001098:	00812423          	sw	x8,8(x2)
8000109c:	00058413          	addi	x8,x11,0
800010a0:	00912223          	sw	x9,4(x2)
800010a4:	00050493          	addi	x9,x10,0
800010a8:	00042503          	lw	x10,0(x8)
800010ac:	01400593          	addi	x11,x0,20
800010b0:	00112623          	sw	x1,12(x2)
800010b4:	1b8010ef          	jal	x1,8000226c <__umodsi3>
800010b8:	00251513          	slli	x10,x10,0x2
800010bc:	00040593          	addi	x11,x8,0
800010c0:	00812403          	lw	x8,8(x2)
800010c4:	00c12083          	lw	x1,12(x2)
800010c8:	00a48533          	add	x10,x9,x10
800010cc:	00412483          	lw	x9,4(x2)
800010d0:	01010113          	addi	x2,x2,16
800010d4:	cd9ff06f          	jal	x0,80000dac <sglib_ilist_delete>

800010d8 <sglib_hashed_ilist_delete_if_member>:
800010d8:	fe010113          	addi	x2,x2,-32
800010dc:	00812c23          	sw	x8,24(x2)
800010e0:	00058413          	addi	x8,x11,0
800010e4:	00912a23          	sw	x9,20(x2)
800010e8:	00050493          	addi	x9,x10,0
800010ec:	00042503          	lw	x10,0(x8)
800010f0:	01400593          	addi	x11,x0,20
800010f4:	00112e23          	sw	x1,28(x2)
800010f8:	00c12623          	sw	x12,12(x2)
800010fc:	170010ef          	jal	x1,8000226c <__umodsi3>
80001100:	00251513          	slli	x10,x10,0x2
80001104:	00040593          	addi	x11,x8,0
80001108:	01812403          	lw	x8,24(x2)
8000110c:	00c12603          	lw	x12,12(x2)
80001110:	01c12083          	lw	x1,28(x2)
80001114:	00a48533          	add	x10,x9,x10
80001118:	01412483          	lw	x9,20(x2)
8000111c:	02010113          	addi	x2,x2,32
80001120:	cb5ff06f          	jal	x0,80000dd4 <sglib_ilist_delete_if_member>

80001124 <sglib_hashed_ilist_is_member>:
80001124:	ff010113          	addi	x2,x2,-16
80001128:	00912223          	sw	x9,4(x2)
8000112c:	00058493          	addi	x9,x11,0
80001130:	00812423          	sw	x8,8(x2)
80001134:	00050413          	addi	x8,x10,0
80001138:	0004a503          	lw	x10,0(x9)
8000113c:	01400593          	addi	x11,x0,20
80001140:	00112623          	sw	x1,12(x2)
80001144:	128010ef          	jal	x1,8000226c <__umodsi3>
80001148:	00251513          	slli	x10,x10,0x2
8000114c:	00a40433          	add	x8,x8,x10
80001150:	00042503          	lw	x10,0(x8)
80001154:	00812403          	lw	x8,8(x2)
80001158:	00c12083          	lw	x1,12(x2)
8000115c:	00048593          	addi	x11,x9,0
80001160:	00412483          	lw	x9,4(x2)
80001164:	01010113          	addi	x2,x2,16
80001168:	b9dff06f          	jal	x0,80000d04 <sglib_ilist_is_member>

8000116c <sglib_hashed_ilist_find_member>:
8000116c:	ff010113          	addi	x2,x2,-16
80001170:	00912223          	sw	x9,4(x2)
80001174:	00058493          	addi	x9,x11,0
80001178:	00812423          	sw	x8,8(x2)
8000117c:	00050413          	addi	x8,x10,0
80001180:	0004a503          	lw	x10,0(x9)
80001184:	01400593          	addi	x11,x0,20
80001188:	00112623          	sw	x1,12(x2)
8000118c:	0e0010ef          	jal	x1,8000226c <__umodsi3>
80001190:	00251513          	slli	x10,x10,0x2
80001194:	00a40433          	add	x8,x8,x10
80001198:	00042503          	lw	x10,0(x8)
8000119c:	00812403          	lw	x8,8(x2)
800011a0:	00c12083          	lw	x1,12(x2)
800011a4:	00048593          	addi	x11,x9,0
800011a8:	00412483          	lw	x9,4(x2)
800011ac:	01010113          	addi	x2,x2,16
800011b0:	b6dff06f          	jal	x0,80000d1c <sglib_ilist_find_member>

800011b4 <sglib_hashed_ilist_it_current>:
800011b4:	00052503          	lw	x10,0(x10)
800011b8:	00008067          	jalr	x0,0(x1)

800011bc <sglib_hashed_ilist_it_next>:
800011bc:	ff010113          	addi	x2,x2,-16
800011c0:	00812423          	sw	x8,8(x2)
800011c4:	00912223          	sw	x9,4(x2)
800011c8:	00112623          	sw	x1,12(x2)
800011cc:	00050413          	addi	x8,x10,0
800011d0:	01300493          	addi	x9,x0,19
800011d4:	d81ff0ef          	jal	x1,80000f54 <sglib_ilist_it_next>
800011d8:	00051a63          	bne	x10,x0,800011ec <sglib_hashed_ilist_it_next+0x30>
800011dc:	01442783          	lw	x15,20(x8)
800011e0:	00178793          	addi	x15,x15,1
800011e4:	00f42a23          	sw	x15,20(x8)
800011e8:	00f4dc63          	bge	x9,x15,80001200 <sglib_hashed_ilist_it_next+0x44>
800011ec:	00c12083          	lw	x1,12(x2)
800011f0:	00812403          	lw	x8,8(x2)
800011f4:	00412483          	lw	x9,4(x2)
800011f8:	01010113          	addi	x2,x2,16
800011fc:	00008067          	jalr	x0,0(x1)
80001200:	01042703          	lw	x14,16(x8)
80001204:	00279793          	slli	x15,x15,0x2
80001208:	01842683          	lw	x13,24(x8)
8000120c:	00f707b3          	add	x15,x14,x15
80001210:	0007a783          	lw	x15,0(x15)
80001214:	01c42703          	lw	x14,28(x8)
80001218:	00d42423          	sw	x13,8(x8)
8000121c:	00f42223          	sw	x15,4(x8)
80001220:	00e42623          	sw	x14,12(x8)
80001224:	00040513          	addi	x10,x8,0
80001228:	d2dff0ef          	jal	x1,80000f54 <sglib_ilist_it_next>
8000122c:	fadff06f          	jal	x0,800011d8 <sglib_hashed_ilist_it_next+0x1c>

80001230 <sglib_hashed_ilist_it_init_on_equal>:
80001230:	ff010113          	addi	x2,x2,-16
80001234:	00812423          	sw	x8,8(x2)
80001238:	00112623          	sw	x1,12(x2)
8000123c:	00d52e23          	sw	x13,28(x10)
80001240:	0005a783          	lw	x15,0(x11)
80001244:	00b52823          	sw	x11,16(x10)
80001248:	00052a23          	sw	x0,20(x10)
8000124c:	00c52c23          	sw	x12,24(x10)
80001250:	00c52423          	sw	x12,8(x10)
80001254:	00d52623          	sw	x13,12(x10)
80001258:	00f52223          	sw	x15,4(x10)
8000125c:	00050413          	addi	x8,x10,0
80001260:	cf5ff0ef          	jal	x1,80000f54 <sglib_ilist_it_next>
80001264:	00051c63          	bne	x10,x0,8000127c <sglib_hashed_ilist_it_init_on_equal+0x4c>
80001268:	00040513          	addi	x10,x8,0
8000126c:	00812403          	lw	x8,8(x2)
80001270:	00c12083          	lw	x1,12(x2)
80001274:	01010113          	addi	x2,x2,16
80001278:	f45ff06f          	jal	x0,800011bc <sglib_hashed_ilist_it_next>
8000127c:	00c12083          	lw	x1,12(x2)
80001280:	00812403          	lw	x8,8(x2)
80001284:	01010113          	addi	x2,x2,16
80001288:	00008067          	jalr	x0,0(x1)

8000128c <sglib_hashed_ilist_it_init>:
8000128c:	00000693          	addi	x13,x0,0
80001290:	00000613          	addi	x12,x0,0
80001294:	f9dff06f          	jal	x0,80001230 <sglib_hashed_ilist_it_init_on_equal>

80001298 <sglib_iq_init>:
80001298:	18052c23          	sw	x0,408(x10)
8000129c:	18052a23          	sw	x0,404(x10)
800012a0:	00008067          	jalr	x0,0(x1)

800012a4 <sglib_iq_is_empty>:
800012a4:	19452783          	lw	x15,404(x10)
800012a8:	19852703          	lw	x14,408(x10)
800012ac:	40e78533          	sub	x10,x15,x14
800012b0:	00153513          	sltiu	x10,x10,1
800012b4:	00008067          	jalr	x0,0(x1)

800012b8 <sglib_iq_is_full>:
800012b8:	ff010113          	addi	x2,x2,-16
800012bc:	00812423          	sw	x8,8(x2)
800012c0:	00050413          	addi	x8,x10,0
800012c4:	19852503          	lw	x10,408(x10)
800012c8:	06500593          	addi	x11,x0,101
800012cc:	00112623          	sw	x1,12(x2)
800012d0:	00150513          	addi	x10,x10,1
800012d4:	7cd000ef          	jal	x1,800022a0 <__modsi3>
800012d8:	19442783          	lw	x15,404(x8)
800012dc:	00c12083          	lw	x1,12(x2)
800012e0:	00812403          	lw	x8,8(x2)
800012e4:	40f50533          	sub	x10,x10,x15
800012e8:	00153513          	sltiu	x10,x10,1
800012ec:	01010113          	addi	x2,x2,16
800012f0:	00008067          	jalr	x0,0(x1)

800012f4 <sglib_iq_first_element>:
800012f4:	19452783          	lw	x15,404(x10)
800012f8:	00279793          	slli	x15,x15,0x2
800012fc:	00f50533          	add	x10,x10,x15
80001300:	00052503          	lw	x10,0(x10)
80001304:	00008067          	jalr	x0,0(x1)

80001308 <sglib_iq_first_element_ptr>:
80001308:	19452783          	lw	x15,404(x10)
8000130c:	00279793          	slli	x15,x15,0x2
80001310:	00f50533          	add	x10,x10,x15
80001314:	00008067          	jalr	x0,0(x1)

80001318 <sglib_iq_add_next>:
80001318:	ff010113          	addi	x2,x2,-16
8000131c:	00812423          	sw	x8,8(x2)
80001320:	00050413          	addi	x8,x10,0
80001324:	19852503          	lw	x10,408(x10)
80001328:	06500593          	addi	x11,x0,101
8000132c:	00112623          	sw	x1,12(x2)
80001330:	00150513          	addi	x10,x10,1
80001334:	76d000ef          	jal	x1,800022a0 <__modsi3>
80001338:	00c12083          	lw	x1,12(x2)
8000133c:	18a42c23          	sw	x10,408(x8)
80001340:	00812403          	lw	x8,8(x2)
80001344:	01010113          	addi	x2,x2,16
80001348:	00008067          	jalr	x0,0(x1)

8000134c <sglib_iq_add>:
8000134c:	ff010113          	addi	x2,x2,-16
80001350:	00812423          	sw	x8,8(x2)
80001354:	00050413          	addi	x8,x10,0
80001358:	19852503          	lw	x10,408(x10)
8000135c:	00112623          	sw	x1,12(x2)
80001360:	00251793          	slli	x15,x10,0x2
80001364:	00f407b3          	add	x15,x8,x15
80001368:	00b7a023          	sw	x11,0(x15)
8000136c:	00150513          	addi	x10,x10,1
80001370:	06500593          	addi	x11,x0,101
80001374:	72d000ef          	jal	x1,800022a0 <__modsi3>
80001378:	00c12083          	lw	x1,12(x2)
8000137c:	18a42c23          	sw	x10,408(x8)
80001380:	00812403          	lw	x8,8(x2)
80001384:	01010113          	addi	x2,x2,16
80001388:	00008067          	jalr	x0,0(x1)

8000138c <sglib_iq_delete_first>:
8000138c:	ff010113          	addi	x2,x2,-16
80001390:	00812423          	sw	x8,8(x2)
80001394:	00050413          	addi	x8,x10,0
80001398:	19452503          	lw	x10,404(x10)
8000139c:	06500593          	addi	x11,x0,101
800013a0:	00112623          	sw	x1,12(x2)
800013a4:	00150513          	addi	x10,x10,1
800013a8:	6f9000ef          	jal	x1,800022a0 <__modsi3>
800013ac:	00c12083          	lw	x1,12(x2)
800013b0:	18a42a23          	sw	x10,404(x8)
800013b4:	00812403          	lw	x8,8(x2)
800013b8:	01010113          	addi	x2,x2,16
800013bc:	00008067          	jalr	x0,0(x1)

800013c0 <sglib_iq_delete>:
800013c0:	fcdff06f          	jal	x0,8000138c <sglib_iq_delete_first>

800013c4 <sglib___rbtree_delete_recursive>:
800013c4:	fe010113          	addi	x2,x2,-32
800013c8:	00812c23          	sw	x8,24(x2)
800013cc:	00052403          	lw	x8,0(x10)
800013d0:	00112e23          	sw	x1,28(x2)
800013d4:	00912a23          	sw	x9,20(x2)
800013d8:	00041e63          	bne	x8,x0,800013f4 <sglib___rbtree_delete_recursive+0x30>
800013dc:	00000513          	addi	x10,x0,0
800013e0:	01c12083          	lw	x1,28(x2)
800013e4:	01812403          	lw	x8,24(x2)
800013e8:	01412483          	lw	x9,20(x2)
800013ec:	02010113          	addi	x2,x2,32
800013f0:	00008067          	jalr	x0,0(x1)
800013f4:	0005a783          	lw	x15,0(x11)
800013f8:	00042703          	lw	x14,0(x8)
800013fc:	00050493          	addi	x9,x10,0
80001400:	40e78533          	sub	x10,x15,x14
80001404:	00054663          	blt	x10,x0,80001410 <sglib___rbtree_delete_recursive+0x4c>
80001408:	02051863          	bne	x10,x0,80001438 <sglib___rbtree_delete_recursive+0x74>
8000140c:	0285f463          	bgeu	x11,x8,80001434 <sglib___rbtree_delete_recursive+0x70>
80001410:	00840513          	addi	x10,x8,8
80001414:	fb1ff0ef          	jal	x1,800013c4 <sglib___rbtree_delete_recursive>
80001418:	fc0502e3          	beq	x10,x0,800013dc <sglib___rbtree_delete_recursive+0x18>
8000141c:	01812403          	lw	x8,24(x2)
80001420:	01c12083          	lw	x1,28(x2)
80001424:	00048513          	addi	x10,x9,0
80001428:	01412483          	lw	x9,20(x2)
8000142c:	02010113          	addi	x2,x2,32
80001430:	cb5fe06f          	jal	x0,800000e4 <sglib___rbtree_fix_left_deletion_discrepancy>
80001434:	02b47463          	bgeu	x8,x11,8000145c <sglib___rbtree_delete_recursive+0x98>
80001438:	00c40513          	addi	x10,x8,12
8000143c:	f89ff0ef          	jal	x1,800013c4 <sglib___rbtree_delete_recursive>
80001440:	f8050ee3          	beq	x10,x0,800013dc <sglib___rbtree_delete_recursive+0x18>
80001444:	01812403          	lw	x8,24(x2)
80001448:	01c12083          	lw	x1,28(x2)
8000144c:	00048513          	addi	x10,x9,0
80001450:	01412483          	lw	x9,20(x2)
80001454:	02010113          	addi	x2,x2,32
80001458:	e19fe06f          	jal	x0,80000270 <sglib___rbtree_fix_right_deletion_discrepancy>
8000145c:	00842783          	lw	x15,8(x8)
80001460:	02079c63          	bne	x15,x0,80001498 <sglib___rbtree_delete_recursive+0xd4>
80001464:	00c42703          	lw	x14,12(x8)
80001468:	00071a63          	bne	x14,x0,8000147c <sglib___rbtree_delete_recursive+0xb8>
8000146c:	0004a023          	sw	x0,0(x9)
80001470:	00444503          	lbu	x10,4(x8)
80001474:	00153513          	sltiu	x10,x10,1
80001478:	f69ff06f          	jal	x0,800013e0 <sglib___rbtree_delete_recursive+0x1c>
8000147c:	00444783          	lbu	x15,4(x8)
80001480:	00079663          	bne	x15,x0,8000148c <sglib___rbtree_delete_recursive+0xc8>
80001484:	00474783          	lbu	x15,4(x14)
80001488:	0017b513          	sltiu	x10,x15,1
8000148c:	00070223          	sb	x0,4(x14)
80001490:	00e4a023          	sw	x14,0(x9)
80001494:	f4dff06f          	jal	x0,800013e0 <sglib___rbtree_delete_recursive+0x1c>
80001498:	00c10593          	addi	x11,x2,12
8000149c:	00840513          	addi	x10,x8,8
800014a0:	f5dfe0ef          	jal	x1,800003fc <sglib___rbtree_delete_rightmost_leaf>
800014a4:	00842703          	lw	x14,8(x8)
800014a8:	00c12783          	lw	x15,12(x2)
800014ac:	00e7a423          	sw	x14,8(x15)
800014b0:	00c42703          	lw	x14,12(x8)
800014b4:	00e7a623          	sw	x14,12(x15)
800014b8:	00444703          	lbu	x14,4(x8)
800014bc:	00e78223          	sb	x14,4(x15)
800014c0:	00f4a023          	sw	x15,0(x9)
800014c4:	f0050ce3          	beq	x10,x0,800013dc <sglib___rbtree_delete_recursive+0x18>
800014c8:	00048513          	addi	x10,x9,0
800014cc:	c19fe0ef          	jal	x1,800000e4 <sglib___rbtree_fix_left_deletion_discrepancy>
800014d0:	f11ff06f          	jal	x0,800013e0 <sglib___rbtree_delete_recursive+0x1c>

800014d4 <sglib_rbtree_add>:
800014d4:	ff010113          	addi	x2,x2,-16
800014d8:	0005a623          	sw	x0,12(x11)
800014dc:	0005a423          	sw	x0,8(x11)
800014e0:	00812423          	sw	x8,8(x2)
800014e4:	00112623          	sw	x1,12(x2)
800014e8:	00050413          	addi	x8,x10,0
800014ec:	810ff0ef          	jal	x1,800004fc <sglib___rbtree_add_recursive.constprop.0>
800014f0:	00042783          	lw	x15,0(x8)
800014f4:	00078223          	sb	x0,4(x15)
800014f8:	00c12083          	lw	x1,12(x2)
800014fc:	00812403          	lw	x8,8(x2)
80001500:	01010113          	addi	x2,x2,16
80001504:	00008067          	jalr	x0,0(x1)

80001508 <sglib_rbtree_delete>:
80001508:	ff010113          	addi	x2,x2,-16
8000150c:	00812423          	sw	x8,8(x2)
80001510:	00112623          	sw	x1,12(x2)
80001514:	00050413          	addi	x8,x10,0
80001518:	eadff0ef          	jal	x1,800013c4 <sglib___rbtree_delete_recursive>
8000151c:	00042783          	lw	x15,0(x8)
80001520:	00078463          	beq	x15,x0,80001528 <sglib_rbtree_delete+0x20>
80001524:	00078223          	sb	x0,4(x15)
80001528:	00c12083          	lw	x1,12(x2)
8000152c:	00812403          	lw	x8,8(x2)
80001530:	01010113          	addi	x2,x2,16
80001534:	00008067          	jalr	x0,0(x1)

80001538 <sglib_rbtree_find_member>:
80001538:	00051463          	bne	x10,x0,80001540 <sglib_rbtree_find_member+0x8>
8000153c:	00008067          	jalr	x0,0(x1)
80001540:	0005a783          	lw	x15,0(x11)
80001544:	00052703          	lw	x14,0(x10)
80001548:	40e787b3          	sub	x15,x15,x14
8000154c:	0007d663          	bge	x15,x0,80001558 <sglib_rbtree_find_member+0x20>
80001550:	00852503          	lw	x10,8(x10)
80001554:	fe5ff06f          	jal	x0,80001538 <sglib_rbtree_find_member>
80001558:	fe0782e3          	beq	x15,x0,8000153c <sglib_rbtree_find_member+0x4>
8000155c:	00c52503          	lw	x10,12(x10)
80001560:	fd9ff06f          	jal	x0,80001538 <sglib_rbtree_find_member>

80001564 <sglib_rbtree_is_member>:
80001564:	00051463          	bne	x10,x0,8000156c <sglib_rbtree_is_member+0x8>
80001568:	00008067          	jalr	x0,0(x1)
8000156c:	0005a783          	lw	x15,0(x11)
80001570:	00052703          	lw	x14,0(x10)
80001574:	40e787b3          	sub	x15,x15,x14
80001578:	0007c663          	blt	x15,x0,80001584 <sglib_rbtree_is_member+0x20>
8000157c:	00079a63          	bne	x15,x0,80001590 <sglib_rbtree_is_member+0x2c>
80001580:	00a5f663          	bgeu	x11,x10,8000158c <sglib_rbtree_is_member+0x28>
80001584:	00852503          	lw	x10,8(x10)
80001588:	fddff06f          	jal	x0,80001564 <sglib_rbtree_is_member>
8000158c:	00b57663          	bgeu	x10,x11,80001598 <sglib_rbtree_is_member+0x34>
80001590:	00c52503          	lw	x10,12(x10)
80001594:	fd1ff06f          	jal	x0,80001564 <sglib_rbtree_is_member>
80001598:	00100513          	addi	x10,x0,1
8000159c:	00008067          	jalr	x0,0(x1)

800015a0 <sglib_rbtree_delete_if_member>:
800015a0:	ff010113          	addi	x2,x2,-16
800015a4:	00812423          	sw	x8,8(x2)
800015a8:	00050413          	addi	x8,x10,0
800015ac:	00052503          	lw	x10,0(x10)
800015b0:	00912223          	sw	x9,4(x2)
800015b4:	00112623          	sw	x1,12(x2)
800015b8:	00060493          	addi	x9,x12,0
800015bc:	f7dff0ef          	jal	x1,80001538 <sglib_rbtree_find_member>
800015c0:	00a4a023          	sw	x10,0(x9)
800015c4:	02050463          	beq	x10,x0,800015ec <sglib_rbtree_delete_if_member+0x4c>
800015c8:	00050593          	addi	x11,x10,0
800015cc:	00040513          	addi	x10,x8,0
800015d0:	f39ff0ef          	jal	x1,80001508 <sglib_rbtree_delete>
800015d4:	00100513          	addi	x10,x0,1
800015d8:	00c12083          	lw	x1,12(x2)
800015dc:	00812403          	lw	x8,8(x2)
800015e0:	00412483          	lw	x9,4(x2)
800015e4:	01010113          	addi	x2,x2,16
800015e8:	00008067          	jalr	x0,0(x1)
800015ec:	00000513          	addi	x10,x0,0
800015f0:	fe9ff06f          	jal	x0,800015d8 <sglib_rbtree_delete_if_member+0x38>

800015f4 <sglib_rbtree_add_if_not_member>:
800015f4:	ff010113          	addi	x2,x2,-16
800015f8:	00812423          	sw	x8,8(x2)
800015fc:	00050413          	addi	x8,x10,0
80001600:	00052503          	lw	x10,0(x10)
80001604:	00912223          	sw	x9,4(x2)
80001608:	01212023          	sw	x18,0(x2)
8000160c:	00112623          	sw	x1,12(x2)
80001610:	00060913          	addi	x18,x12,0
80001614:	00058493          	addi	x9,x11,0
80001618:	f21ff0ef          	jal	x1,80001538 <sglib_rbtree_find_member>
8000161c:	00a92023          	sw	x10,0(x18)
80001620:	02051663          	bne	x10,x0,8000164c <sglib_rbtree_add_if_not_member+0x58>
80001624:	00040513          	addi	x10,x8,0
80001628:	00048593          	addi	x11,x9,0
8000162c:	ea9ff0ef          	jal	x1,800014d4 <sglib_rbtree_add>
80001630:	00100513          	addi	x10,x0,1
80001634:	00c12083          	lw	x1,12(x2)
80001638:	00812403          	lw	x8,8(x2)
8000163c:	00412483          	lw	x9,4(x2)
80001640:	00012903          	lw	x18,0(x2)
80001644:	01010113          	addi	x2,x2,16
80001648:	00008067          	jalr	x0,0(x1)
8000164c:	00000513          	addi	x10,x0,0
80001650:	fe5ff06f          	jal	x0,80001634 <sglib_rbtree_add_if_not_member+0x40>

80001654 <sglib_rbtree_len>:
80001654:	00050713          	addi	x14,x10,0
80001658:	00000793          	addi	x15,x0,0
8000165c:	00000513          	addi	x10,x0,0
80001660:	00071463          	bne	x14,x0,80001668 <sglib_rbtree_len+0x14>
80001664:	00008067          	jalr	x0,0(x1)
80001668:	d8010113          	addi	x2,x2,-640
8000166c:	00279693          	slli	x13,x15,0x2
80001670:	08010613          	addi	x12,x2,128
80001674:	00d606b3          	add	x13,x12,x13
80001678:	00c72603          	lw	x12,12(x14)
8000167c:	00872703          	lw	x14,8(x14)
80001680:	00c6a023          	sw	x12,0(x13)
80001684:	00f106b3          	add	x13,x2,x15
80001688:	00068023          	sb	x0,0(x13)
8000168c:	00178793          	addi	x15,x15,1
80001690:	fc071ee3          	bne	x14,x0,8000166c <sglib_rbtree_len+0x18>
80001694:	00f10633          	add	x12,x2,x15
80001698:	fff64703          	lbu	x14,-1(x12)
8000169c:	00078593          	addi	x11,x15,0
800016a0:	fff78793          	addi	x15,x15,-1
800016a4:	00071463          	bne	x14,x0,800016ac <sglib_rbtree_len+0x58>
800016a8:	00150513          	addi	x10,x10,1
800016ac:	00170713          	addi	x14,x14,1
800016b0:	fee60fa3          	sb	x14,-1(x12)
800016b4:	00279693          	slli	x13,x15,0x2
800016b8:	08010713          	addi	x14,x2,128
800016bc:	00d70733          	add	x14,x14,x13
800016c0:	00072703          	lw	x14,0(x14)
800016c4:	00f05663          	bge	x0,x15,800016d0 <sglib_rbtree_len+0x7c>
800016c8:	fff60613          	addi	x12,x12,-1
800016cc:	fc0706e3          	beq	x14,x0,80001698 <sglib_rbtree_len+0x44>
800016d0:	28068793          	addi	x15,x13,640
800016d4:	002786b3          	add	x13,x15,x2
800016d8:	e006a023          	sw	x0,-512(x13)
800016dc:	00058793          	addi	x15,x11,0
800016e0:	f80716e3          	bne	x14,x0,8000166c <sglib_rbtree_len+0x18>
800016e4:	28010113          	addi	x2,x2,640
800016e8:	00008067          	jalr	x0,0(x1)

800016ec <sglib__rbtree_it_compute_current_elem>:
800016ec:	fd010113          	addi	x2,x2,-48
800016f0:	01412c23          	sw	x20,24(x2)
800016f4:	01612823          	sw	x22,16(x2)
800016f8:	28852a03          	lw	x20,648(x10)
800016fc:	28c52b03          	lw	x22,652(x10)
80001700:	02812423          	sw	x8,40(x2)
80001704:	01712623          	sw	x23,12(x2)
80001708:	02112623          	sw	x1,44(x2)
8000170c:	02912223          	sw	x9,36(x2)
80001710:	03212023          	sw	x18,32(x2)
80001714:	01312e23          	sw	x19,28(x2)
80001718:	01512a23          	sw	x21,20(x2)
8000171c:	00050413          	addi	x8,x10,0
80001720:	00052023          	sw	x0,0(x10)
80001724:	00100b93          	addi	x23,x0,1
80001728:	28441903          	lh	x18,644(x8)
8000172c:	01205663          	bge	x0,x18,80001738 <sglib__rbtree_it_compute_current_elem+0x4c>
80001730:	00042783          	lw	x15,0(x8)
80001734:	02078863          	beq	x15,x0,80001764 <sglib__rbtree_it_compute_current_elem+0x78>
80001738:	02c12083          	lw	x1,44(x2)
8000173c:	02812403          	lw	x8,40(x2)
80001740:	02412483          	lw	x9,36(x2)
80001744:	02012903          	lw	x18,32(x2)
80001748:	01c12983          	lw	x19,28(x2)
8000174c:	01812a03          	lw	x20,24(x2)
80001750:	01412a83          	lw	x21,20(x2)
80001754:	01012b03          	lw	x22,16(x2)
80001758:	00c12b83          	lw	x23,12(x2)
8000175c:	03010113          	addi	x2,x2,48
80001760:	00008067          	jalr	x0,0(x1)
80001764:	fff90793          	addi	x15,x18,-1
80001768:	00f40ab3          	add	x21,x8,x15
8000176c:	004ac703          	lbu	x14,4(x21)
80001770:	02ebfc63          	bgeu	x23,x14,800017a8 <sglib__rbtree_it_compute_current_elem+0xbc>
80001774:	28f41223          	sh	x15,644(x8)
80001778:	28441783          	lh	x15,644(x8)
8000177c:	faf056e3          	bge	x0,x15,80001728 <sglib__rbtree_it_compute_current_elem+0x3c>
80001780:	00f40733          	add	x14,x8,x15
80001784:	28641683          	lh	x13,646(x8)
80001788:	00374703          	lbu	x14,3(x14)
8000178c:	f8e69ee3          	bne	x13,x14,80001728 <sglib__rbtree_it_compute_current_elem+0x3c>
80001790:	01f78793          	addi	x15,x15,31
80001794:	00279793          	slli	x15,x15,0x2
80001798:	00f407b3          	add	x15,x8,x15
8000179c:	0047a783          	lw	x15,4(x15)
800017a0:	00f42023          	sw	x15,0(x8)
800017a4:	f85ff06f          	jal	x0,80001728 <sglib__rbtree_it_compute_current_elem+0x3c>
800017a8:	00291993          	slli	x19,x18,0x2
800017ac:	013409b3          	add	x19,x8,x19
800017b0:	0809a783          	lw	x15,128(x19)
800017b4:	02071263          	bne	x14,x0,800017d8 <sglib__rbtree_it_compute_current_elem+0xec>
800017b8:	0087a483          	lw	x9,8(x15)
800017bc:	060a0863          	beq	x20,x0,8000182c <sglib__rbtree_it_compute_current_elem+0x140>
800017c0:	040b1c63          	bne	x22,x0,80001818 <sglib__rbtree_it_compute_current_elem+0x12c>
800017c4:	00049e63          	bne	x9,x0,800017e0 <sglib__rbtree_it_compute_current_elem+0xf4>
800017c8:	004ac783          	lbu	x15,4(x21)
800017cc:	00178793          	addi	x15,x15,1
800017d0:	00fa8223          	sb	x15,4(x21)
800017d4:	fa5ff06f          	jal	x0,80001778 <sglib__rbtree_it_compute_current_elem+0x8c>
800017d8:	00c7a483          	lw	x9,12(x15)
800017dc:	fe1ff06f          	jal	x0,800017bc <sglib__rbtree_it_compute_current_elem+0xd0>
800017e0:	000a2783          	lw	x15,0(x20)
800017e4:	0004a703          	lw	x14,0(x9)
800017e8:	40e787b3          	sub	x15,x15,x14
800017ec:	0007d663          	bge	x15,x0,800017f8 <sglib__rbtree_it_compute_current_elem+0x10c>
800017f0:	0084a483          	lw	x9,8(x9)
800017f4:	fd1ff06f          	jal	x0,800017c4 <sglib__rbtree_it_compute_current_elem+0xd8>
800017f8:	02078c63          	beq	x15,x0,80001830 <sglib__rbtree_it_compute_current_elem+0x144>
800017fc:	00c4a483          	lw	x9,12(x9)
80001800:	fc5ff06f          	jal	x0,800017c4 <sglib__rbtree_it_compute_current_elem+0xd8>
80001804:	00048593          	addi	x11,x9,0
80001808:	000a0513          	addi	x10,x20,0
8000180c:	000b00e7          	jalr	x1,0(x22)
80001810:	00055863          	bge	x10,x0,80001820 <sglib__rbtree_it_compute_current_elem+0x134>
80001814:	0084a483          	lw	x9,8(x9)
80001818:	fe0496e3          	bne	x9,x0,80001804 <sglib__rbtree_it_compute_current_elem+0x118>
8000181c:	fadff06f          	jal	x0,800017c8 <sglib__rbtree_it_compute_current_elem+0xdc>
80001820:	00050863          	beq	x10,x0,80001830 <sglib__rbtree_it_compute_current_elem+0x144>
80001824:	00c4a483          	lw	x9,12(x9)
80001828:	ff1ff06f          	jal	x0,80001818 <sglib__rbtree_it_compute_current_elem+0x12c>
8000182c:	f8048ee3          	beq	x9,x0,800017c8 <sglib__rbtree_it_compute_current_elem+0xdc>
80001830:	28441783          	lh	x15,644(x8)
80001834:	01240933          	add	x18,x8,x18
80001838:	0899a223          	sw	x9,132(x19)
8000183c:	00090223          	sb	x0,4(x18)
80001840:	00178793          	addi	x15,x15,1
80001844:	28f41223          	sh	x15,644(x8)
80001848:	f81ff06f          	jal	x0,800017c8 <sglib__rbtree_it_compute_current_elem+0xdc>

8000184c <sglib__rbtree_it_init>:
8000184c:	fe010113          	addi	x2,x2,-32
80001850:	00812c23          	sw	x8,24(x2)
80001854:	00912a23          	sw	x9,20(x2)
80001858:	01412423          	sw	x20,8(x2)
8000185c:	00112e23          	sw	x1,28(x2)
80001860:	01212823          	sw	x18,16(x2)
80001864:	01312623          	sw	x19,12(x2)
80001868:	28c51323          	sh	x12,646(x10)
8000186c:	28e52423          	sw	x14,648(x10)
80001870:	28d52623          	sw	x13,652(x10)
80001874:	00050493          	addi	x9,x10,0
80001878:	00058413          	addi	x8,x11,0
8000187c:	00060a13          	addi	x20,x12,0
80001880:	08070663          	beq	x14,x0,8000190c <sglib__rbtree_it_init+0xc0>
80001884:	00068993          	addi	x19,x13,0
80001888:	00070913          	addi	x18,x14,0
8000188c:	06069663          	bne	x13,x0,800018f8 <sglib__rbtree_it_init+0xac>
80001890:	02041863          	bne	x8,x0,800018c0 <sglib__rbtree_it_init+0x74>
80001894:	28049223          	sh	x0,644(x9)
80001898:	0004a023          	sw	x0,0(x9)
8000189c:	01c12083          	lw	x1,28(x2)
800018a0:	01812403          	lw	x8,24(x2)
800018a4:	0004a503          	lw	x10,0(x9)
800018a8:	01012903          	lw	x18,16(x2)
800018ac:	01412483          	lw	x9,20(x2)
800018b0:	00c12983          	lw	x19,12(x2)
800018b4:	00812a03          	lw	x20,8(x2)
800018b8:	02010113          	addi	x2,x2,32
800018bc:	00008067          	jalr	x0,0(x1)
800018c0:	00092783          	lw	x15,0(x18)
800018c4:	00042703          	lw	x14,0(x8)
800018c8:	40e787b3          	sub	x15,x15,x14
800018cc:	0007d663          	bge	x15,x0,800018d8 <sglib__rbtree_it_init+0x8c>
800018d0:	00842403          	lw	x8,8(x8)
800018d4:	fbdff06f          	jal	x0,80001890 <sglib__rbtree_it_init+0x44>
800018d8:	02078c63          	beq	x15,x0,80001910 <sglib__rbtree_it_init+0xc4>
800018dc:	00c42403          	lw	x8,12(x8)
800018e0:	fb1ff06f          	jal	x0,80001890 <sglib__rbtree_it_init+0x44>
800018e4:	00040593          	addi	x11,x8,0
800018e8:	00090513          	addi	x10,x18,0
800018ec:	000980e7          	jalr	x1,0(x19)
800018f0:	00055863          	bge	x10,x0,80001900 <sglib__rbtree_it_init+0xb4>
800018f4:	00842403          	lw	x8,8(x8)
800018f8:	fe0416e3          	bne	x8,x0,800018e4 <sglib__rbtree_it_init+0x98>
800018fc:	f99ff06f          	jal	x0,80001894 <sglib__rbtree_it_init+0x48>
80001900:	00050863          	beq	x10,x0,80001910 <sglib__rbtree_it_init+0xc4>
80001904:	00c42403          	lw	x8,12(x8)
80001908:	ff1ff06f          	jal	x0,800018f8 <sglib__rbtree_it_init+0xac>
8000190c:	f80584e3          	beq	x11,x0,80001894 <sglib__rbtree_it_init+0x48>
80001910:	00100793          	addi	x15,x0,1
80001914:	28f49223          	sh	x15,644(x9)
80001918:	00048223          	sb	x0,4(x9)
8000191c:	0884a223          	sw	x8,132(x9)
80001920:	000a1663          	bne	x20,x0,8000192c <sglib__rbtree_it_init+0xe0>
80001924:	0084a023          	sw	x8,0(x9)
80001928:	f75ff06f          	jal	x0,8000189c <sglib__rbtree_it_init+0x50>
8000192c:	00048513          	addi	x10,x9,0
80001930:	dbdff0ef          	jal	x1,800016ec <sglib__rbtree_it_compute_current_elem>
80001934:	f69ff06f          	jal	x0,8000189c <sglib__rbtree_it_init+0x50>

80001938 <sglib_rbtree_it_init>:
80001938:	00000713          	addi	x14,x0,0
8000193c:	00000693          	addi	x13,x0,0
80001940:	00200613          	addi	x12,x0,2
80001944:	f09ff06f          	jal	x0,8000184c <sglib__rbtree_it_init>

80001948 <sglib_rbtree_it_init_preorder>:
80001948:	00050793          	addi	x15,x10,0
8000194c:	28079323          	sh	x0,646(x15)
80001950:	2807a423          	sw	x0,648(x15)
80001954:	2807a623          	sw	x0,652(x15)
80001958:	00058513          	addi	x10,x11,0
8000195c:	00059863          	bne	x11,x0,8000196c <sglib_rbtree_it_init_preorder+0x24>
80001960:	28079223          	sh	x0,644(x15)
80001964:	00a7a023          	sw	x10,0(x15)
80001968:	00008067          	jalr	x0,0(x1)
8000196c:	00100713          	addi	x14,x0,1
80001970:	28e79223          	sh	x14,644(x15)
80001974:	00078223          	sb	x0,4(x15)
80001978:	08b7a223          	sw	x11,132(x15)
8000197c:	fe9ff06f          	jal	x0,80001964 <sglib_rbtree_it_init_preorder+0x1c>

80001980 <sglib_rbtree_it_init_inorder>:
80001980:	00000713          	addi	x14,x0,0
80001984:	00000693          	addi	x13,x0,0
80001988:	00100613          	addi	x12,x0,1
8000198c:	ec1ff06f          	jal	x0,8000184c <sglib__rbtree_it_init>

80001990 <benchmark_body>:
80001990:	b6010113          	addi	x2,x2,-1184
80001994:	49312623          	sw	x19,1164(x2)
80001998:	801029b7          	lui	x19,0x80102
8000199c:	48812c23          	sw	x8,1176(x2)
800019a0:	48912a23          	sw	x9,1172(x2)
800019a4:	49212823          	sw	x18,1168(x2)
800019a8:	49412423          	sw	x20,1160(x2)
800019ac:	48112e23          	sw	x1,1180(x2)
800019b0:	49512223          	sw	x21,1156(x2)
800019b4:	49612023          	sw	x22,1152(x2)
800019b8:	47712e23          	sw	x23,1148(x2)
800019bc:	47812c23          	sw	x24,1144(x2)
800019c0:	47912a23          	sw	x25,1140(x2)
800019c4:	00050913          	addi	x18,x10,0
800019c8:	00000493          	addi	x9,x0,0
800019cc:	80101a37          	lui	x20,0x80101
800019d0:	e4098413          	addi	x8,x19,-448 # 80101e40 <array2>
800019d4:	0324ce63          	blt	x9,x18,80001a10 <benchmark_body+0x80>
800019d8:	49c12083          	lw	x1,1180(x2)
800019dc:	49812403          	lw	x8,1176(x2)
800019e0:	00c12503          	lw	x10,12(x2)
800019e4:	49412483          	lw	x9,1172(x2)
800019e8:	49012903          	lw	x18,1168(x2)
800019ec:	48c12983          	lw	x19,1164(x2)
800019f0:	48812a03          	lw	x20,1160(x2)
800019f4:	48412a83          	lw	x21,1156(x2)
800019f8:	48012b03          	lw	x22,1152(x2)
800019fc:	47c12b83          	lw	x23,1148(x2)
80001a00:	47812c03          	lw	x24,1144(x2)
80001a04:	47412c83          	lw	x25,1140(x2)
80001a08:	4a010113          	addi	x2,x2,1184
80001a0c:	00008067          	jalr	x0,0(x1)
80001a10:	19000613          	addi	x12,x0,400
80001a14:	6b0a0593          	addi	x11,x20,1712 # 801016b0 <array>
80001a18:	e4098513          	addi	x10,x19,-448
80001a1c:	651020ef          	jal	x1,8000486c <memcpy>
80001a20:	06400793          	addi	x15,x0,100
80001a24:	04012623          	sw	x0,76(x2)
80001a28:	1ef12023          	sw	x15,480(x2)
80001a2c:	00100713          	addi	x14,x0,1
80001a30:	00200313          	addi	x6,x0,2
80001a34:	e4098893          	addi	x17,x19,-448
80001a38:	00100e13          	addi	x28,x0,1
80001a3c:	fff70713          	addi	x14,x14,-1
80001a40:	00271793          	slli	x15,x14,0x2
80001a44:	47078793          	addi	x15,x15,1136
80001a48:	002787b3          	add	x15,x15,x2
80001a4c:	bdc7a603          	lw	x12,-1060(x15)
80001a50:	d707a683          	lw	x13,-656(x15)
80001a54:	40c687b3          	sub	x15,x13,x12
80001a58:	20f34863          	blt	x6,x15,80001c68 <benchmark_body+0x2d8>
80001a5c:	02679663          	bne	x15,x6,80001a88 <benchmark_body+0xf8>
80001a60:	fff68693          	addi	x13,x13,-1
80001a64:	00261613          	slli	x12,x12,0x2
80001a68:	00269693          	slli	x13,x13,0x2
80001a6c:	00c40633          	add	x12,x8,x12
80001a70:	00d406b3          	add	x13,x8,x13
80001a74:	00062783          	lw	x15,0(x12)
80001a78:	0006a583          	lw	x11,0(x13)
80001a7c:	00f5d663          	bge	x11,x15,80001a88 <benchmark_body+0xf8>
80001a80:	00b62023          	sw	x11,0(x12)
80001a84:	00f6a023          	sw	x15,0(x13)
80001a88:	fae04ae3          	blt	x0,x14,80001a3c <benchmark_body+0xac>
80001a8c:	80102537          	lui	x10,0x80102
80001a90:	000025b7          	lui	x11,0x2
80001a94:	02050513          	addi	x10,x10,32 # 80102020 <heap>
80001a98:	80104bb7          	lui	x23,0x80104
80001a9c:	6b0a0a93          	addi	x21,x20,1712
80001aa0:	5e4000ef          	jal	x1,80002084 <init_heap_beebs>
80001aa4:	190a8b13          	addi	x22,x21,400
80001aa8:	180ba023          	sw	x0,384(x23) # 80104180 <the_list>
80001aac:	6b0a0c13          	addi	x24,x20,1712
80001ab0:	00c00513          	addi	x10,x0,12
80001ab4:	640000ef          	jal	x1,800020f4 <malloc_beebs>
80001ab8:	000c2783          	lw	x15,0(x24)
80001abc:	00050593          	addi	x11,x10,0
80001ac0:	004c0c13          	addi	x24,x24,4
80001ac4:	00f52023          	sw	x15,0(x10)
80001ac8:	180b8513          	addi	x10,x23,384
80001acc:	c05fe0ef          	jal	x1,800006d0 <sglib_dllist_add>
80001ad0:	ff6c10e3          	bne	x24,x22,80001ab0 <benchmark_body+0x120>
80001ad4:	180b8513          	addi	x10,x23,384
80001ad8:	f91fe0ef          	jal	x1,80000a68 <sglib_dllist_sort>
80001adc:	180ba503          	lw	x10,384(x23)
80001ae0:	00012623          	sw	x0,12(x2)
80001ae4:	f55fe0ef          	jal	x1,80000a38 <sglib_dllist_get_first>
80001ae8:	28051e63          	bne	x10,x0,80001d84 <benchmark_body+0x3f4>
80001aec:	19040513          	addi	x10,x8,400
80001af0:	80102c37          	lui	x24,0x80102
80001af4:	cfcff0ef          	jal	x1,80000ff0 <sglib_hashed_ilist_init>
80001af8:	000a8b93          	addi	x23,x21,0
80001afc:	fd0c0c13          	addi	x24,x24,-48 # 80101fd0 <htab>
80001b00:	000bac83          	lw	x25,0(x23)
80001b04:	01410593          	addi	x11,x2,20
80001b08:	000c0513          	addi	x10,x24,0
80001b0c:	01912a23          	sw	x25,20(x2)
80001b10:	e5cff0ef          	jal	x1,8000116c <sglib_hashed_ilist_find_member>
80001b14:	00051e63          	bne	x10,x0,80001b30 <benchmark_body+0x1a0>
80001b18:	00800513          	addi	x10,x0,8
80001b1c:	5d8000ef          	jal	x1,800020f4 <malloc_beebs>
80001b20:	00050593          	addi	x11,x10,0
80001b24:	01952023          	sw	x25,0(x10)
80001b28:	000c0513          	addi	x10,x24,0
80001b2c:	cd0ff0ef          	jal	x1,80000ffc <sglib_hashed_ilist_add>
80001b30:	004b8b93          	addi	x23,x23,4
80001b34:	fd6b96e3          	bne	x23,x22,80001b00 <benchmark_body+0x170>
80001b38:	000c0593          	addi	x11,x24,0
80001b3c:	02c10513          	addi	x10,x2,44
80001b40:	f4cff0ef          	jal	x1,8000128c <sglib_hashed_ilist_it_init>
80001b44:	24051a63          	bne	x10,x0,80001d98 <benchmark_body+0x408>
80001b48:	000a8c13          	addi	x24,x21,0
80001b4c:	00000b93          	addi	x23,x0,0
80001b50:	000c2703          	lw	x14,0(x24)
80001b54:	002b9793          	slli	x15,x23,0x2
80001b58:	47078793          	addi	x15,x15,1136
80001b5c:	002787b3          	add	x15,x15,x2
80001b60:	001b8513          	addi	x10,x23,1
80001b64:	bce7ae23          	sw	x14,-1060(x15)
80001b68:	06500593          	addi	x11,x0,101
80001b6c:	734000ef          	jal	x1,800022a0 <__modsi3>
80001b70:	004c0c13          	addi	x24,x24,4
80001b74:	00050b93          	addi	x23,x10,0
80001b78:	fd6c1ce3          	bne	x24,x22,80001b50 <benchmark_body+0x1c0>
80001b7c:	00000513          	addi	x10,x0,0
80001b80:	23751863          	bne	x10,x23,80001db0 <benchmark_body+0x420>
80001b84:	04c10593          	addi	x11,x2,76
80001b88:	00058613          	addi	x12,x11,0 # 2000 <_stack_size+0x1000>
80001b8c:	000a8513          	addi	x10,x21,0
80001b90:	00000793          	addi	x15,x0,0
80001b94:	06400e13          	addi	x28,x0,100
80001b98:	00052703          	lw	x14,0(x10)
80001b9c:	00e62023          	sw	x14,0(x12)
80001ba0:	00078713          	addi	x14,x15,0
80001ba4:	00178793          	addi	x15,x15,1
80001ba8:	02070663          	beq	x14,x0,80001bd4 <benchmark_body+0x244>
80001bac:	40175313          	srai	x6,x14,0x1
80001bb0:	00231693          	slli	x13,x6,0x2
80001bb4:	00271713          	slli	x14,x14,0x2
80001bb8:	47068693          	addi	x13,x13,1136
80001bbc:	47070713          	addi	x14,x14,1136
80001bc0:	002686b3          	add	x13,x13,x2
80001bc4:	00270733          	add	x14,x14,x2
80001bc8:	bdc6a883          	lw	x17,-1060(x13)
80001bcc:	bdc72803          	lw	x16,-1060(x14)
80001bd0:	2108c663          	blt	x17,x16,80001ddc <benchmark_body+0x44c>
80001bd4:	00450513          	addi	x10,x10,4
80001bd8:	00460613          	addi	x12,x12,4
80001bdc:	fbc79ee3          	bne	x15,x28,80001b98 <benchmark_body+0x208>
80001be0:	04c12683          	lw	x13,76(x2)
80001be4:	00c12703          	lw	x14,12(x2)
80001be8:	fff78793          	addi	x15,x15,-1
80001bec:	00d70733          	add	x14,x14,x13
80001bf0:	00e12623          	sw	x14,12(x2)
80001bf4:	18c5a703          	lw	x14,396(x11)
80001bf8:	00000693          	addi	x13,x0,0
80001bfc:	04e12623          	sw	x14,76(x2)
80001c00:	00169713          	slli	x14,x13,0x1
80001c04:	00170613          	addi	x12,x14,1
80001c08:	22f65a63          	bge	x12,x15,80001e3c <benchmark_body+0x4ac>
80001c0c:	00269513          	slli	x10,x13,0x2
80001c10:	47050813          	addi	x16,x10,1136
80001c14:	00280833          	add	x16,x16,x2
80001c18:	bdc82303          	lw	x6,-1060(x16)
80001c1c:	00261813          	slli	x16,x12,0x2
80001c20:	47080813          	addi	x16,x16,1136
80001c24:	00280833          	add	x16,x16,x2
80001c28:	bdc82803          	lw	x16,-1060(x16)
80001c2c:	00270713          	addi	x14,x14,2
80001c30:	21035463          	bge	x6,x16,80001e38 <benchmark_body+0x4a8>
80001c34:	1af74e63          	blt	x14,x15,80001df0 <benchmark_body+0x460>
80001c38:	00060713          	addi	x14,x12,0
80001c3c:	20e68063          	beq	x13,x14,80001e3c <benchmark_body+0x4ac>
80001c40:	00271693          	slli	x13,x14,0x2
80001c44:	47068693          	addi	x13,x13,1136
80001c48:	002686b3          	add	x13,x13,x2
80001c4c:	bdc6a603          	lw	x12,-1060(x13)
80001c50:	47050513          	addi	x10,x10,1136
80001c54:	00250533          	add	x10,x10,x2
80001c58:	bcc52e23          	sw	x12,-1060(x10)
80001c5c:	bc66ae23          	sw	x6,-1060(x13)
80001c60:	00070693          	addi	x13,x14,0
80001c64:	f9dff06f          	jal	x0,80001c00 <benchmark_body+0x270>
80001c68:	00261513          	slli	x10,x12,0x2
80001c6c:	00a40fb3          	add	x31,x8,x10
80001c70:	00160e93          	addi	x29,x12,1
80001c74:	fff68793          	addi	x15,x13,-1
80001c78:	00a88533          	add	x10,x17,x10
80001c7c:	04fec663          	blt	x29,x15,80001cc8 <benchmark_body+0x338>
80001c80:	40ce8833          	sub	x16,x29,x12
80001c84:	0f0e5a63          	bge	x28,x16,80001d78 <benchmark_body+0x3e8>
80001c88:	40f685b3          	sub	x11,x13,x15
80001c8c:	02be5663          	bge	x28,x11,80001cb8 <benchmark_body+0x328>
80001c90:	00170513          	addi	x10,x14,1
80001c94:	00271713          	slli	x14,x14,0x2
80001c98:	47070713          	addi	x14,x14,1136
80001c9c:	fff58593          	addi	x11,x11,-1
80001ca0:	00178793          	addi	x15,x15,1
80001ca4:	00270733          	add	x14,x14,x2
80001ca8:	0ab85e63          	bge	x16,x11,80001d64 <benchmark_body+0x3d4>
80001cac:	bcf72e23          	sw	x15,-1060(x14)
80001cb0:	d6d72823          	sw	x13,-656(x14)
80001cb4:	00050713          	addi	x14,x10,0
80001cb8:	000e8693          	addi	x13,x29,0
80001cbc:	d99ff06f          	jal	x0,80001a54 <benchmark_body+0xc4>
80001cc0:	001e8e93          	addi	x29,x29,1
80001cc4:	05d7cc63          	blt	x15,x29,80001d1c <benchmark_body+0x38c>
80001cc8:	002e9813          	slli	x16,x29,0x2
80001ccc:	010405b3          	add	x11,x8,x16
80001cd0:	0005a583          	lw	x11,0(x11)
80001cd4:	000faf03          	lw	x30,0(x31)
80001cd8:	febf54e3          	bge	x30,x11,80001cc0 <benchmark_body+0x330>
80001cdc:	00279593          	slli	x11,x15,0x2
80001ce0:	00b885b3          	add	x11,x17,x11
80001ce4:	07d7c063          	blt	x15,x29,80001d44 <benchmark_body+0x3b4>
80001ce8:	0005af03          	lw	x30,0(x11)
80001cec:	00052283          	lw	x5,0(x10)
80001cf0:	045f5663          	bge	x30,x5,80001d3c <benchmark_body+0x3ac>
80001cf4:	06fed463          	bge	x29,x15,80001d5c <benchmark_body+0x3cc>
80001cf8:	01088833          	add	x16,x17,x16
80001cfc:	00082283          	lw	x5,0(x16)
80001d00:	01e82023          	sw	x30,0(x16)
80001d04:	002e8813          	addi	x16,x29,2
80001d08:	0055a023          	sw	x5,0(x11)
80001d0c:	001e8593          	addi	x11,x29,1
80001d10:	04f85463          	bge	x16,x15,80001d58 <benchmark_body+0x3c8>
80001d14:	fff78793          	addi	x15,x15,-1
80001d18:	01c0006f          	jal	x0,80001d34 <benchmark_body+0x3a4>
80001d1c:	00279593          	slli	x11,x15,0x2
80001d20:	00b405b3          	add	x11,x8,x11
80001d24:	0005a803          	lw	x16,0(x11)
80001d28:	01e5a023          	sw	x30,0(x11)
80001d2c:	010fa023          	sw	x16,0(x31)
80001d30:	00078593          	addi	x11,x15,0
80001d34:	00058e93          	addi	x29,x11,0
80001d38:	f45ff06f          	jal	x0,80001c7c <benchmark_body+0x2ec>
80001d3c:	fff78793          	addi	x15,x15,-1
80001d40:	f9dff06f          	jal	x0,80001cdc <benchmark_body+0x34c>
80001d44:	00052e83          	lw	x29,0(x10)
80001d48:	0005a803          	lw	x16,0(x11)
80001d4c:	01d5a023          	sw	x29,0(x11)
80001d50:	01052023          	sw	x16,0(x10)
80001d54:	fddff06f          	jal	x0,80001d30 <benchmark_body+0x3a0>
80001d58:	fcf5cee3          	blt	x11,x15,80001d34 <benchmark_body+0x3a4>
80001d5c:	000e8593          	addi	x11,x29,0
80001d60:	fd5ff06f          	jal	x0,80001d34 <benchmark_body+0x3a4>
80001d64:	bcc72e23          	sw	x12,-1060(x14)
80001d68:	d7d72823          	sw	x29,-656(x14)
80001d6c:	00078613          	addi	x12,x15,0
80001d70:	00068e93          	addi	x29,x13,0
80001d74:	f41ff06f          	jal	x0,80001cb4 <benchmark_body+0x324>
80001d78:	00178613          	addi	x12,x15,1
80001d7c:	00068e93          	addi	x29,x13,0
80001d80:	f39ff06f          	jal	x0,80001cb8 <benchmark_body+0x328>
80001d84:	00c12783          	lw	x15,12(x2)
80001d88:	00452503          	lw	x10,4(x10)
80001d8c:	00178793          	addi	x15,x15,1
80001d90:	00f12623          	sw	x15,12(x2)
80001d94:	d55ff06f          	jal	x0,80001ae8 <benchmark_body+0x158>
80001d98:	00c12783          	lw	x15,12(x2)
80001d9c:	02c10513          	addi	x10,x2,44
80001da0:	00178793          	addi	x15,x15,1
80001da4:	00f12623          	sw	x15,12(x2)
80001da8:	c14ff0ef          	jal	x1,800011bc <sglib_hashed_ilist_it_next>
80001dac:	d99ff06f          	jal	x0,80001b44 <benchmark_body+0x1b4>
80001db0:	00251713          	slli	x14,x10,0x2
80001db4:	47070713          	addi	x14,x14,1136
80001db8:	00270733          	add	x14,x14,x2
80001dbc:	00c12783          	lw	x15,12(x2)
80001dc0:	bdc72703          	lw	x14,-1060(x14)
80001dc4:	06500593          	addi	x11,x0,101
80001dc8:	00150513          	addi	x10,x10,1
80001dcc:	00e787b3          	add	x15,x15,x14
80001dd0:	00f12623          	sw	x15,12(x2)
80001dd4:	4cc000ef          	jal	x1,800022a0 <__modsi3>
80001dd8:	da9ff06f          	jal	x0,80001b80 <benchmark_body+0x1f0>
80001ddc:	bd06ae23          	sw	x16,-1060(x13)
80001de0:	bd172e23          	sw	x17,-1060(x14)
80001de4:	00030713          	addi	x14,x6,0
80001de8:	dc1ff06f          	jal	x0,80001ba8 <benchmark_body+0x218>
80001dec:	00068613          	addi	x12,x13,0
80001df0:	00261893          	slli	x17,x12,0x2
80001df4:	47088813          	addi	x16,x17,1136
80001df8:	002808b3          	add	x17,x16,x2
80001dfc:	00271813          	slli	x16,x14,0x2
80001e00:	47080813          	addi	x16,x16,1136
80001e04:	00280833          	add	x16,x16,x2
80001e08:	bdc8a883          	lw	x17,-1060(x17)
80001e0c:	bdc82803          	lw	x16,-1060(x16)
80001e10:	e308d4e3          	bge	x17,x16,80001c38 <benchmark_body+0x2a8>
80001e14:	e29ff06f          	jal	x0,80001c3c <benchmark_body+0x2ac>
80001e18:	00c12783          	lw	x15,12(x2)
80001e1c:	00052703          	lw	x14,0(x10)
80001e20:	1e010513          	addi	x10,x2,480
80001e24:	00e787b3          	add	x15,x15,x14
80001e28:	00f12623          	sw	x15,12(x2)
80001e2c:	8c1ff0ef          	jal	x1,800016ec <sglib__rbtree_it_compute_current_elem>
80001e30:	1e012503          	lw	x10,480(x2)
80001e34:	0580006f          	jal	x0,80001e8c <benchmark_body+0x4fc>
80001e38:	faf74ae3          	blt	x14,x15,80001dec <benchmark_body+0x45c>
80001e3c:	ffc58593          	addi	x11,x11,-4
80001e40:	da0790e3          	bne	x15,x0,80001be0 <benchmark_body+0x250>
80001e44:	00012823          	sw	x0,16(x2)
80001e48:	000aab83          	lw	x23,0(x21)
80001e4c:	01012503          	lw	x10,16(x2)
80001e50:	01c10593          	addi	x11,x2,28
80001e54:	01712e23          	sw	x23,28(x2)
80001e58:	ee0ff0ef          	jal	x1,80001538 <sglib_rbtree_find_member>
80001e5c:	00051e63          	bne	x10,x0,80001e78 <benchmark_body+0x4e8>
80001e60:	01000513          	addi	x10,x0,16
80001e64:	290000ef          	jal	x1,800020f4 <malloc_beebs>
80001e68:	00050593          	addi	x11,x10,0
80001e6c:	01752023          	sw	x23,0(x10)
80001e70:	01010513          	addi	x10,x2,16
80001e74:	e60ff0ef          	jal	x1,800014d4 <sglib_rbtree_add>
80001e78:	004a8a93          	addi	x21,x21,4
80001e7c:	fd6a96e3          	bne	x21,x22,80001e48 <benchmark_body+0x4b8>
80001e80:	01012583          	lw	x11,16(x2)
80001e84:	1e010513          	addi	x10,x2,480
80001e88:	af9ff0ef          	jal	x1,80001980 <sglib_rbtree_it_init_inorder>
80001e8c:	f80516e3          	bne	x10,x0,80001e18 <benchmark_body+0x488>
80001e90:	00148493          	addi	x9,x9,1
80001e94:	b41ff06f          	jal	x0,800019d4 <benchmark_body+0x44>

80001e98 <sglib_rbtree_it_init_postorder>:
80001e98:	aa1ff06f          	jal	x0,80001938 <sglib_rbtree_it_init>

80001e9c <sglib_rbtree_it_init_on_equal>:
80001e9c:	00068713          	addi	x14,x13,0
80001ea0:	00060693          	addi	x13,x12,0
80001ea4:	00100613          	addi	x12,x0,1
80001ea8:	9a5ff06f          	jal	x0,8000184c <sglib__rbtree_it_init>

80001eac <sglib_rbtree_it_current>:
80001eac:	00052503          	lw	x10,0(x10)
80001eb0:	00008067          	jalr	x0,0(x1)

80001eb4 <sglib_rbtree_it_next>:
80001eb4:	ff010113          	addi	x2,x2,-16
80001eb8:	00812423          	sw	x8,8(x2)
80001ebc:	00112623          	sw	x1,12(x2)
80001ec0:	00050413          	addi	x8,x10,0
80001ec4:	829ff0ef          	jal	x1,800016ec <sglib__rbtree_it_compute_current_elem>
80001ec8:	00042503          	lw	x10,0(x8)
80001ecc:	00c12083          	lw	x1,12(x2)
80001ed0:	00812403          	lw	x8,8(x2)
80001ed4:	01010113          	addi	x2,x2,16
80001ed8:	00008067          	jalr	x0,0(x1)

80001edc <sglib___rbtree_consistency_check>:
80001edc:	fe010113          	addi	x2,x2,-32
80001ee0:	fff00793          	addi	x15,x0,-1
80001ee4:	00c10593          	addi	x11,x2,12
80001ee8:	00000613          	addi	x12,x0,0
80001eec:	00112e23          	sw	x1,28(x2)
80001ef0:	00f12623          	sw	x15,12(x2)
80001ef4:	d8cfe0ef          	jal	x1,80000480 <sglib___rbtree_consistency_check_recursive>
80001ef8:	01c12083          	lw	x1,28(x2)
80001efc:	02010113          	addi	x2,x2,32
80001f00:	00008067          	jalr	x0,0(x1)

80001f04 <verify_benchmark>:
80001f04:	fd010113          	addi	x2,x2,-48
80001f08:	801047b7          	lui	x15,0x80104
80001f0c:	02912223          	sw	x9,36(x2)
80001f10:	00050493          	addi	x9,x10,0
80001f14:	1807a503          	lw	x10,384(x15) # 80104180 <the_list>
80001f18:	02112623          	sw	x1,44(x2)
80001f1c:	02812423          	sw	x8,40(x2)
80001f20:	03212023          	sw	x18,32(x2)
80001f24:	01312e23          	sw	x19,28(x2)
80001f28:	01412c23          	sw	x20,24(x2)
80001f2c:	01512a23          	sw	x21,20(x2)
80001f30:	01612823          	sw	x22,16(x2)
80001f34:	b05fe0ef          	jal	x1,80000a38 <sglib_dllist_get_first>
80001f38:	00000793          	addi	x15,x0,0
80001f3c:	06051e63          	bne	x10,x0,80001fb8 <verify_benchmark+0xb4>
80001f40:	80101437          	lui	x8,0x80101
80001f44:	801029b7          	lui	x19,0x80102
80001f48:	6b040413          	addi	x8,x8,1712 # 801016b0 <array>
80001f4c:	e4098913          	addi	x18,x19,-448 # 80101e40 <array2>
80001f50:	19040b13          	addi	x22,x8,400
80001f54:	80102ab7          	lui	x21,0x80102
80001f58:	19090913          	addi	x18,x18,400
80001f5c:	00042a03          	lw	x20,0(x8)
80001f60:	00810593          	addi	x11,x2,8
80001f64:	00090513          	addi	x10,x18,0
80001f68:	01412423          	sw	x20,8(x2)
80001f6c:	a00ff0ef          	jal	x1,8000116c <sglib_hashed_ilist_find_member>
80001f70:	04050863          	beq	x10,x0,80001fc0 <verify_benchmark+0xbc>
80001f74:	00052783          	lw	x15,0(x10)
80001f78:	04fa1463          	bne	x20,x15,80001fc0 <verify_benchmark+0xbc>
80001f7c:	00440413          	addi	x8,x8,4
80001f80:	fd641ee3          	bne	x8,x22,80001f5c <verify_benchmark+0x58>
80001f84:	000047b7          	lui	x15,0x4
80001f88:	aca78793          	addi	x15,x15,-1334 # 3aca <_stack_size+0x2aca>
80001f8c:	02f49a63          	bne	x9,x15,80001fc0 <verify_benchmark+0xbc>
80001f90:	80102537          	lui	x10,0x80102
80001f94:	02050513          	addi	x10,x10,32 # 80102020 <heap>
80001f98:	13c000ef          	jal	x1,800020d4 <check_heap_beebs>
80001f9c:	02050263          	beq	x10,x0,80001fc0 <verify_benchmark+0xbc>
80001fa0:	19000613          	addi	x12,x0,400
80001fa4:	840a8593          	addi	x11,x21,-1984 # 80101840 <array_exp.0>
80001fa8:	e4098513          	addi	x10,x19,-448
80001fac:	400020ef          	jal	x1,800043ac <memcmp>
80001fb0:	00153513          	sltiu	x10,x10,1
80001fb4:	0100006f          	jal	x0,80001fc4 <verify_benchmark+0xc0>
80001fb8:	00052703          	lw	x14,0(x10)
80001fbc:	02f70863          	beq	x14,x15,80001fec <verify_benchmark+0xe8>
80001fc0:	00000513          	addi	x10,x0,0
80001fc4:	02c12083          	lw	x1,44(x2)
80001fc8:	02812403          	lw	x8,40(x2)
80001fcc:	02412483          	lw	x9,36(x2)
80001fd0:	02012903          	lw	x18,32(x2)
80001fd4:	01c12983          	lw	x19,28(x2)
80001fd8:	01812a03          	lw	x20,24(x2)
80001fdc:	01412a83          	lw	x21,20(x2)
80001fe0:	01012b03          	lw	x22,16(x2)
80001fe4:	03010113          	addi	x2,x2,48
80001fe8:	00008067          	jalr	x0,0(x1)
80001fec:	00452503          	lw	x10,4(x10)
80001ff0:	00178793          	addi	x15,x15,1
80001ff4:	f49ff06f          	jal	x0,80001f3c <verify_benchmark+0x38>

80001ff8 <initialise_benchmark>:
80001ff8:	00008067          	jalr	x0,0(x1)

80001ffc <warm_caches>:
80001ffc:	995ff06f          	jal	x0,80001990 <benchmark_body>

80002000 <benchmark>:
80002000:	00200513          	addi	x10,x0,2
80002004:	98dff06f          	jal	x0,80001990 <benchmark_body>

80002008 <initialise_board>:
80002008:	00000513          	addi	x10,x0,0
8000200c:	00008067          	jalr	x0,0(x1)

80002010 <start_trigger>:
80002010:	00000513          	addi	x10,x0,0
80002014:	deadc2b7          	lui	x5,0xdeadc
80002018:	eef28293          	addi	x5,x5,-273 # deadbeef <_end+0x5e9d6d3f>
8000201c:	00008067          	jalr	x0,0(x1)

80002020 <stop_trigger>:
80002020:	beefe2b7          	lui	x5,0xbeefe
80002024:	ead28293          	addi	x5,x5,-339 # beefdead <_end+0x3edf8cfd>
80002028:	00008067          	jalr	x0,0(x1)

8000202c <rand_beebs>:
8000202c:	ff010113          	addi	x2,x2,-16
80002030:	00812423          	sw	x8,8(x2)
80002034:	80104437          	lui	x8,0x80104
80002038:	19042503          	lw	x10,400(x8) # 80104190 <seed>
8000203c:	41c655b7          	lui	x11,0x41c65
80002040:	e6d58593          	addi	x11,x11,-403 # 41c64e6d <SYSCALL_ADDR+0x3fc54e6d>
80002044:	00112623          	sw	x1,12(x2)
80002048:	1b0000ef          	jal	x1,800021f8 <__mulsi3>
8000204c:	000037b7          	lui	x15,0x3
80002050:	03978793          	addi	x15,x15,57 # 3039 <_stack_size+0x2039>
80002054:	00f50533          	add	x10,x10,x15
80002058:	00151513          	slli	x10,x10,0x1
8000205c:	00155513          	srli	x10,x10,0x1
80002060:	18a42823          	sw	x10,400(x8)
80002064:	00c12083          	lw	x1,12(x2)
80002068:	00812403          	lw	x8,8(x2)
8000206c:	01055513          	srli	x10,x10,0x10
80002070:	01010113          	addi	x2,x2,16
80002074:	00008067          	jalr	x0,0(x1)

80002078 <srand_beebs>:
80002078:	801047b7          	lui	x15,0x80104
8000207c:	18a7a823          	sw	x10,400(x15) # 80104190 <seed>
80002080:	00008067          	jalr	x0,0(x1)

80002084 <init_heap_beebs>:
80002084:	0035f793          	andi	x15,x11,3
80002088:	02078663          	beq	x15,x0,800020b4 <init_heap_beebs+0x30>
8000208c:	801026b7          	lui	x13,0x80102
80002090:	80102637          	lui	x12,0x80102
80002094:	80102537          	lui	x10,0x80102
80002098:	ff010113          	addi	x2,x2,-16
8000209c:	9d068693          	addi	x13,x13,-1584 # 801019d0 <array_exp.0+0x190>
800020a0:	aa060613          	addi	x12,x12,-1376 # 80101aa0 <__func__.0>
800020a4:	04100593          	addi	x11,x0,65
800020a8:	9f050513          	addi	x10,x10,-1552 # 801019f0 <array_exp.0+0x1b0>
800020ac:	00112623          	sw	x1,12(x2)
800020b0:	220000ef          	jal	x1,800022d0 <__assert_func>
800020b4:	801047b7          	lui	x15,0x80104
800020b8:	18a7a623          	sw	x10,396(x15) # 8010418c <heap_ptr>
800020bc:	801047b7          	lui	x15,0x80104
800020c0:	00b50533          	add	x10,x10,x11
800020c4:	18a7a423          	sw	x10,392(x15) # 80104188 <heap_end>
800020c8:	801047b7          	lui	x15,0x80104
800020cc:	1807a223          	sw	x0,388(x15) # 80104184 <heap_requested>
800020d0:	00008067          	jalr	x0,0(x1)

800020d4 <check_heap_beebs>:
800020d4:	801047b7          	lui	x15,0x80104
800020d8:	1847a783          	lw	x15,388(x15) # 80104184 <heap_requested>
800020dc:	80104737          	lui	x14,0x80104
800020e0:	00f507b3          	add	x15,x10,x15
800020e4:	18872503          	lw	x10,392(x14) # 80104188 <heap_end>
800020e8:	00f53533          	sltu	x10,x10,x15
800020ec:	00154513          	xori	x10,x10,1
800020f0:	00008067          	jalr	x0,0(x1)

800020f4 <malloc_beebs>:
800020f4:	00050793          	addi	x15,x10,0
800020f8:	00051663          	bne	x10,x0,80002104 <malloc_beebs+0x10>
800020fc:	00000513          	addi	x10,x0,0
80002100:	00008067          	jalr	x0,0(x1)
80002104:	80104637          	lui	x12,0x80104
80002108:	18c62503          	lw	x10,396(x12) # 8010418c <heap_ptr>
8000210c:	801045b7          	lui	x11,0x80104
80002110:	1845a683          	lw	x13,388(x11) # 80104184 <heap_requested>
80002114:	00f50733          	add	x14,x10,x15
80002118:	00377813          	andi	x16,x14,3
8000211c:	00d787b3          	add	x15,x15,x13
80002120:	00080a63          	beq	x16,x0,80002134 <malloc_beebs+0x40>
80002124:	00400693          	addi	x13,x0,4
80002128:	410686b3          	sub	x13,x13,x16
8000212c:	00d70733          	add	x14,x14,x13
80002130:	00d787b3          	add	x15,x15,x13
80002134:	18f5a223          	sw	x15,388(x11)
80002138:	801047b7          	lui	x15,0x80104
8000213c:	1887a783          	lw	x15,392(x15) # 80104188 <heap_end>
80002140:	fae7eee3          	bltu	x15,x14,800020fc <malloc_beebs+0x8>
80002144:	18e62623          	sw	x14,396(x12)
80002148:	00008067          	jalr	x0,0(x1)

8000214c <calloc_beebs>:
8000214c:	fe010113          	addi	x2,x2,-32
80002150:	00112e23          	sw	x1,28(x2)
80002154:	00812c23          	sw	x8,24(x2)
80002158:	0a0000ef          	jal	x1,800021f8 <__mulsi3>
8000215c:	00a12623          	sw	x10,12(x2)
80002160:	f95ff0ef          	jal	x1,800020f4 <malloc_beebs>
80002164:	00050413          	addi	x8,x10,0
80002168:	00050863          	beq	x10,x0,80002178 <calloc_beebs+0x2c>
8000216c:	00c12603          	lw	x12,12(x2)
80002170:	00000593          	addi	x11,x0,0
80002174:	61c020ef          	jal	x1,80004790 <memset>
80002178:	01c12083          	lw	x1,28(x2)
8000217c:	00040513          	addi	x10,x8,0
80002180:	01812403          	lw	x8,24(x2)
80002184:	02010113          	addi	x2,x2,32
80002188:	00008067          	jalr	x0,0(x1)

8000218c <realloc_beebs>:
8000218c:	00051663          	bne	x10,x0,80002198 <realloc_beebs+0xc>
80002190:	00000513          	addi	x10,x0,0
80002194:	00008067          	jalr	x0,0(x1)
80002198:	ff010113          	addi	x2,x2,-16
8000219c:	00912223          	sw	x9,4(x2)
800021a0:	00050493          	addi	x9,x10,0
800021a4:	00058513          	addi	x10,x11,0
800021a8:	00812423          	sw	x8,8(x2)
800021ac:	00112623          	sw	x1,12(x2)
800021b0:	00058413          	addi	x8,x11,0
800021b4:	f41ff0ef          	jal	x1,800020f4 <malloc_beebs>
800021b8:	00000793          	addi	x15,x0,0
800021bc:	02051863          	bne	x10,x0,800021ec <realloc_beebs+0x60>
800021c0:	00000513          	addi	x10,x0,0
800021c4:	00c12083          	lw	x1,12(x2)
800021c8:	00812403          	lw	x8,8(x2)
800021cc:	00412483          	lw	x9,4(x2)
800021d0:	01010113          	addi	x2,x2,16
800021d4:	00008067          	jalr	x0,0(x1)
800021d8:	00f48733          	add	x14,x9,x15
800021dc:	00074683          	lbu	x13,0(x14)
800021e0:	00f50733          	add	x14,x10,x15
800021e4:	00178793          	addi	x15,x15,1
800021e8:	00d70023          	sb	x13,0(x14)
800021ec:	fe8796e3          	bne	x15,x8,800021d8 <realloc_beebs+0x4c>
800021f0:	fd5ff06f          	jal	x0,800021c4 <realloc_beebs+0x38>

800021f4 <free_beebs>:
800021f4:	00008067          	jalr	x0,0(x1)

800021f8 <__mulsi3>:
800021f8:	00050613          	addi	x12,x10,0
800021fc:	00000513          	addi	x10,x0,0
80002200:	0015f693          	andi	x13,x11,1
80002204:	00068463          	beq	x13,x0,8000220c <__mulsi3+0x14>
80002208:	00c50533          	add	x10,x10,x12
8000220c:	0015d593          	srli	x11,x11,0x1
80002210:	00161613          	slli	x12,x12,0x1
80002214:	fe0596e3          	bne	x11,x0,80002200 <__mulsi3+0x8>
80002218:	00008067          	jalr	x0,0(x1)

8000221c <__divsi3>:
8000221c:	06054063          	blt	x10,x0,8000227c <__umodsi3+0x10>
80002220:	0605c663          	blt	x11,x0,8000228c <__umodsi3+0x20>

80002224 <__hidden___udivsi3>:
80002224:	00058613          	addi	x12,x11,0
80002228:	00050593          	addi	x11,x10,0
8000222c:	fff00513          	addi	x10,x0,-1
80002230:	02060c63          	beq	x12,x0,80002268 <__hidden___udivsi3+0x44>
80002234:	00100693          	addi	x13,x0,1
80002238:	00b67a63          	bgeu	x12,x11,8000224c <__hidden___udivsi3+0x28>
8000223c:	00c05863          	bge	x0,x12,8000224c <__hidden___udivsi3+0x28>
80002240:	00161613          	slli	x12,x12,0x1
80002244:	00169693          	slli	x13,x13,0x1
80002248:	feb66ae3          	bltu	x12,x11,8000223c <__hidden___udivsi3+0x18>
8000224c:	00000513          	addi	x10,x0,0
80002250:	00c5e663          	bltu	x11,x12,8000225c <__hidden___udivsi3+0x38>
80002254:	40c585b3          	sub	x11,x11,x12
80002258:	00d56533          	or	x10,x10,x13
8000225c:	0016d693          	srli	x13,x13,0x1
80002260:	00165613          	srli	x12,x12,0x1
80002264:	fe0696e3          	bne	x13,x0,80002250 <__hidden___udivsi3+0x2c>
80002268:	00008067          	jalr	x0,0(x1)

8000226c <__umodsi3>:
8000226c:	00008293          	addi	x5,x1,0
80002270:	fb5ff0ef          	jal	x1,80002224 <__hidden___udivsi3>
80002274:	00058513          	addi	x10,x11,0
80002278:	00028067          	jalr	x0,0(x5)
8000227c:	40a00533          	sub	x10,x0,x10
80002280:	00b04863          	blt	x0,x11,80002290 <__umodsi3+0x24>
80002284:	40b005b3          	sub	x11,x0,x11
80002288:	f9dff06f          	jal	x0,80002224 <__hidden___udivsi3>
8000228c:	40b005b3          	sub	x11,x0,x11
80002290:	00008293          	addi	x5,x1,0
80002294:	f91ff0ef          	jal	x1,80002224 <__hidden___udivsi3>
80002298:	40a00533          	sub	x10,x0,x10
8000229c:	00028067          	jalr	x0,0(x5)

800022a0 <__modsi3>:
800022a0:	00008293          	addi	x5,x1,0
800022a4:	0005ca63          	blt	x11,x0,800022b8 <__modsi3+0x18>
800022a8:	00054c63          	blt	x10,x0,800022c0 <__modsi3+0x20>
800022ac:	f79ff0ef          	jal	x1,80002224 <__hidden___udivsi3>
800022b0:	00058513          	addi	x10,x11,0
800022b4:	00028067          	jalr	x0,0(x5)
800022b8:	40b005b3          	sub	x11,x0,x11
800022bc:	fe0558e3          	bge	x10,x0,800022ac <__modsi3+0xc>
800022c0:	40a00533          	sub	x10,x0,x10
800022c4:	f61ff0ef          	jal	x1,80002224 <__hidden___udivsi3>
800022c8:	40b00533          	sub	x10,x0,x11
800022cc:	00028067          	jalr	x0,0(x5)

800022d0 <__assert_func>:
800022d0:	801017b7          	lui	x15,0x80101
800022d4:	6a47a703          	lw	x14,1700(x15) # 801016a4 <_impure_ptr>
800022d8:	ff010113          	addi	x2,x2,-16
800022dc:	00068793          	addi	x15,x13,0
800022e0:	00060813          	addi	x16,x12,0
800022e4:	00112623          	sw	x1,12(x2)
800022e8:	00c72883          	lw	x17,12(x14)
800022ec:	00050693          	addi	x13,x10,0
800022f0:	00058713          	addi	x14,x11,0
800022f4:	00078613          	addi	x12,x15,0
800022f8:	02080063          	beq	x16,x0,80002318 <__assert_func+0x48>
800022fc:	801027b7          	lui	x15,0x80102
80002300:	a2078793          	addi	x15,x15,-1504 # 80101a20 <array_exp.0+0x1e0>
80002304:	801025b7          	lui	x11,0x80102
80002308:	a3058593          	addi	x11,x11,-1488 # 80101a30 <array_exp.0+0x1f0>
8000230c:	00088513          	addi	x10,x17,0
80002310:	018000ef          	jal	x1,80002328 <fiprintf>
80002314:	788020ef          	jal	x1,80004a9c <abort>
80002318:	80102837          	lui	x16,0x80102
8000231c:	a2c80793          	addi	x15,x16,-1492 # 80101a2c <array_exp.0+0x1ec>
80002320:	a2c80813          	addi	x16,x16,-1492
80002324:	fe1ff06f          	jal	x0,80002304 <__assert_func+0x34>

80002328 <fiprintf>:
80002328:	00050e13          	addi	x28,x10,0
8000232c:	80101537          	lui	x10,0x80101
80002330:	fc010113          	addi	x2,x2,-64
80002334:	6a452503          	lw	x10,1700(x10) # 801016a4 <_impure_ptr>
80002338:	02810313          	addi	x6,x2,40
8000233c:	02c12423          	sw	x12,40(x2)
80002340:	02d12623          	sw	x13,44(x2)
80002344:	00058613          	addi	x12,x11,0
80002348:	00030693          	addi	x13,x6,0
8000234c:	000e0593          	addi	x11,x28,0
80002350:	00112e23          	sw	x1,28(x2)
80002354:	02e12823          	sw	x14,48(x2)
80002358:	02f12a23          	sw	x15,52(x2)
8000235c:	03012c23          	sw	x16,56(x2)
80002360:	03112e23          	sw	x17,60(x2)
80002364:	00612623          	sw	x6,12(x2)
80002368:	010000ef          	jal	x1,80002378 <_vfiprintf_r>
8000236c:	01c12083          	lw	x1,28(x2)
80002370:	04010113          	addi	x2,x2,64
80002374:	00008067          	jalr	x0,0(x1)

80002378 <_vfiprintf_r>:
80002378:	ed010113          	addi	x2,x2,-304
8000237c:	12912223          	sw	x9,292(x2)
80002380:	13212023          	sw	x18,288(x2)
80002384:	11312e23          	sw	x19,284(x2)
80002388:	11812423          	sw	x24,264(x2)
8000238c:	12112623          	sw	x1,300(x2)
80002390:	11612823          	sw	x22,272(x2)
80002394:	00050993          	addi	x19,x10,0
80002398:	00058493          	addi	x9,x11,0
8000239c:	00060c13          	addi	x24,x12,0
800023a0:	00068913          	addi	x18,x13,0
800023a4:	00050863          	beq	x10,x0,800023b4 <_vfiprintf_r+0x3c>
800023a8:	03452783          	lw	x15,52(x10)
800023ac:	00079463          	bne	x15,x0,800023b4 <_vfiprintf_r+0x3c>
800023b0:	7b10006f          	jal	x0,80003360 <_vfiprintf_r+0xfe8>
800023b4:	00c49703          	lh	x14,12(x9)
800023b8:	0644a783          	lw	x15,100(x9)
800023bc:	01271693          	slli	x13,x14,0x12
800023c0:	0206c063          	blt	x13,x0,800023e0 <_vfiprintf_r+0x68>
800023c4:	ffffe6b7          	lui	x13,0xffffe
800023c8:	fff68693          	addi	x13,x13,-1 # ffffdfff <_end+0x7fef8e4f>
800023cc:	00002637          	lui	x12,0x2
800023d0:	00c76733          	or	x14,x14,x12
800023d4:	00d7f7b3          	and	x15,x15,x13
800023d8:	00e49623          	sh	x14,12(x9)
800023dc:	06f4a223          	sw	x15,100(x9)
800023e0:	01279713          	slli	x14,x15,0x12
800023e4:	00075463          	bge	x14,x0,800023ec <_vfiprintf_r+0x74>
800023e8:	0800106f          	jal	x0,80003468 <_vfiprintf_r+0x10f0>
800023ec:	00c49783          	lh	x15,12(x9)
800023f0:	0087f713          	andi	x14,x15,8
800023f4:	2a070063          	beq	x14,x0,80002694 <_vfiprintf_r+0x31c>
800023f8:	0104a703          	lw	x14,16(x9)
800023fc:	28070c63          	beq	x14,x0,80002694 <_vfiprintf_r+0x31c>
80002400:	01a7f793          	andi	x15,x15,26
80002404:	00a00713          	addi	x14,x0,10
80002408:	2ae78663          	beq	x15,x14,800026b4 <_vfiprintf_r+0x33c>
8000240c:	80102737          	lui	x14,0x80102
80002410:	11412c23          	sw	x20,280(x2)
80002414:	11512a23          	sw	x21,276(x2)
80002418:	04c10a13          	addi	x20,x2,76
8000241c:	00000b13          	addi	x22,x0,0
80002420:	ab070713          	addi	x14,x14,-1360 # 80101ab0 <__func__.0+0x10>
80002424:	80102ab7          	lui	x21,0x80102
80002428:	12812423          	sw	x8,296(x2)
8000242c:	11912223          	sw	x25,260(x2)
80002430:	11712623          	sw	x23,268(x2)
80002434:	11a12023          	sw	x26,256(x2)
80002438:	0fb12e23          	sw	x27,252(x2)
8000243c:	05412023          	sw	x20,64(x2)
80002440:	04012423          	sw	x0,72(x2)
80002444:	04012223          	sw	x0,68(x2)
80002448:	000a0793          	addi	x15,x20,0
8000244c:	00012223          	sw	x0,4(x2)
80002450:	00012c23          	sw	x0,24(x2)
80002454:	00012e23          	sw	x0,28(x2)
80002458:	02012023          	sw	x0,32(x2)
8000245c:	00e12023          	sw	x14,0(x2)
80002460:	01000413          	addi	x8,x0,16
80002464:	c1ca8a93          	addi	x21,x21,-996 # 80101c1c <zeroes.0>
80002468:	000b0c93          	addi	x25,x22,0
8000246c:	00090813          	addi	x16,x18,0
80002470:	000c4703          	lbu	x14,0(x24)
80002474:	1e070063          	beq	x14,x0,80002654 <_vfiprintf_r+0x2dc>
80002478:	000c0b93          	addi	x23,x24,0
8000247c:	02500693          	addi	x13,x0,37
80002480:	26d70663          	beq	x14,x13,800026ec <_vfiprintf_r+0x374>
80002484:	001bc703          	lbu	x14,1(x23)
80002488:	001b8b93          	addi	x23,x23,1
8000248c:	fe071ae3          	bne	x14,x0,80002480 <_vfiprintf_r+0x108>
80002490:	418b8933          	sub	x18,x23,x24
80002494:	1d8b8063          	beq	x23,x24,80002654 <_vfiprintf_r+0x2dc>
80002498:	04812683          	lw	x13,72(x2)
8000249c:	04412703          	lw	x14,68(x2)
800024a0:	0187a023          	sw	x24,0(x15)
800024a4:	012686b3          	add	x13,x13,x18
800024a8:	00170713          	addi	x14,x14,1
800024ac:	0127a223          	sw	x18,4(x15)
800024b0:	04d12423          	sw	x13,72(x2)
800024b4:	04e12223          	sw	x14,68(x2)
800024b8:	00700693          	addi	x13,x0,7
800024bc:	00878793          	addi	x15,x15,8
800024c0:	22e6ce63          	blt	x13,x14,800026fc <_vfiprintf_r+0x384>
800024c4:	000bc703          	lbu	x14,0(x23)
800024c8:	012c8cb3          	add	x25,x25,x18
800024cc:	18070463          	beq	x14,x0,80002654 <_vfiprintf_r+0x2dc>
800024d0:	00000313          	addi	x6,x0,0
800024d4:	001bc703          	lbu	x14,1(x23)
800024d8:	001b8c13          	addi	x24,x23,1
800024dc:	02010da3          	sb	x0,59(x2)
800024e0:	fff00d13          	addi	x26,x0,-1
800024e4:	00000b13          	addi	x22,x0,0
800024e8:	05a00913          	addi	x18,x0,90
800024ec:	00078b93          	addi	x23,x15,0
800024f0:	00030d93          	addi	x27,x6,0
800024f4:	001c0c13          	addi	x24,x24,1
800024f8:	00070613          	addi	x12,x14,0
800024fc:	fe060693          	addi	x13,x12,-32 # 1fe0 <_stack_size+0xfe0>
80002500:	04d96663          	bltu	x18,x13,8000254c <_vfiprintf_r+0x1d4>
80002504:	00012783          	lw	x15,0(x2)
80002508:	00269693          	slli	x13,x13,0x2
8000250c:	00f686b3          	add	x13,x13,x15
80002510:	0006a703          	lw	x14,0(x13)
80002514:	00070067          	jalr	x0,0(x14)
80002518:	00000b13          	addi	x22,x0,0
8000251c:	fd060713          	addi	x14,x12,-48
80002520:	00900593          	addi	x11,x0,9
80002524:	000c4603          	lbu	x12,0(x24)
80002528:	002b1693          	slli	x13,x22,0x2
8000252c:	01668b33          	add	x22,x13,x22
80002530:	001b1b13          	slli	x22,x22,0x1
80002534:	01670b33          	add	x22,x14,x22
80002538:	fd060713          	addi	x14,x12,-48
8000253c:	001c0c13          	addi	x24,x24,1
80002540:	fee5f2e3          	bgeu	x11,x14,80002524 <_vfiprintf_r+0x1ac>
80002544:	fe060693          	addi	x13,x12,-32
80002548:	fad97ee3          	bgeu	x18,x13,80002504 <_vfiprintf_r+0x18c>
8000254c:	000b8793          	addi	x15,x23,0
80002550:	000d8313          	addi	x6,x27,0
80002554:	10060063          	beq	x12,x0,80002654 <_vfiprintf_r+0x2dc>
80002558:	08c10623          	sb	x12,140(x2)
8000255c:	02010da3          	sb	x0,59(x2)
80002560:	00100d93          	addi	x27,x0,1
80002564:	00100e93          	addi	x29,x0,1
80002568:	08c10b93          	addi	x23,x2,140
8000256c:	00000d13          	addi	x26,x0,0
80002570:	00000f93          	addi	x31,x0,0
80002574:	08437293          	andi	x5,x6,132
80002578:	04812683          	lw	x13,72(x2)
8000257c:	04412703          	lw	x14,68(x2)
80002580:	00029663          	bne	x5,x0,8000258c <_vfiprintf_r+0x214>
80002584:	41bb0933          	sub	x18,x22,x27
80002588:	1f204ee3          	blt	x0,x18,80002f84 <_vfiprintf_r+0xc0c>
8000258c:	03b14603          	lbu	x12,59(x2)
80002590:	02060863          	beq	x12,x0,800025c0 <_vfiprintf_r+0x248>
80002594:	03b10613          	addi	x12,x2,59
80002598:	00c7a023          	sw	x12,0(x15)
8000259c:	00170713          	addi	x14,x14,1
800025a0:	00100613          	addi	x12,x0,1
800025a4:	00168693          	addi	x13,x13,1
800025a8:	00c7a223          	sw	x12,4(x15)
800025ac:	04d12423          	sw	x13,72(x2)
800025b0:	04e12223          	sw	x14,68(x2)
800025b4:	00700613          	addi	x12,x0,7
800025b8:	00878793          	addi	x15,x15,8
800025bc:	1ce64863          	blt	x12,x14,8000278c <_vfiprintf_r+0x414>
800025c0:	020f8863          	beq	x31,x0,800025f0 <_vfiprintf_r+0x278>
800025c4:	03c10613          	addi	x12,x2,60
800025c8:	00c7a023          	sw	x12,0(x15)
800025cc:	00170713          	addi	x14,x14,1
800025d0:	00200613          	addi	x12,x0,2
800025d4:	00268693          	addi	x13,x13,2
800025d8:	00c7a223          	sw	x12,4(x15)
800025dc:	04d12423          	sw	x13,72(x2)
800025e0:	04e12223          	sw	x14,68(x2)
800025e4:	00700613          	addi	x12,x0,7
800025e8:	00878793          	addi	x15,x15,8
800025ec:	2ae64ae3          	blt	x12,x14,800030a0 <_vfiprintf_r+0xd28>
800025f0:	08000613          	addi	x12,x0,128
800025f4:	70c28663          	beq	x5,x12,80002d00 <_vfiprintf_r+0x988>
800025f8:	41dd0d33          	sub	x26,x26,x29
800025fc:	01a046e3          	blt	x0,x26,80002e08 <_vfiprintf_r+0xa90>
80002600:	00de86b3          	add	x13,x29,x13
80002604:	00170713          	addi	x14,x14,1
80002608:	0177a023          	sw	x23,0(x15)
8000260c:	01d7a223          	sw	x29,4(x15)
80002610:	04d12423          	sw	x13,72(x2)
80002614:	04e12223          	sw	x14,68(x2)
80002618:	00700613          	addi	x12,x0,7
8000261c:	00878793          	addi	x15,x15,8
80002620:	0ce64ee3          	blt	x12,x14,80002efc <_vfiprintf_r+0xb84>
80002624:	00437313          	andi	x6,x6,4
80002628:	00030663          	beq	x6,x0,80002634 <_vfiprintf_r+0x2bc>
8000262c:	41bb0933          	sub	x18,x22,x27
80002630:	1b204463          	blt	x0,x18,800027d8 <_vfiprintf_r+0x460>
80002634:	01bb5463          	bge	x22,x27,8000263c <_vfiprintf_r+0x2c4>
80002638:	000d8b13          	addi	x22,x27,0
8000263c:	016c8cb3          	add	x25,x25,x22
80002640:	0e069063          	bne	x13,x0,80002720 <_vfiprintf_r+0x3a8>
80002644:	000c4703          	lbu	x14,0(x24)
80002648:	04012223          	sw	x0,68(x2)
8000264c:	000a0793          	addi	x15,x20,0
80002650:	e20714e3          	bne	x14,x0,80002478 <_vfiprintf_r+0x100>
80002654:	04812783          	lw	x15,72(x2)
80002658:	000c8b13          	addi	x22,x25,0
8000265c:	0e078263          	beq	x15,x0,80002740 <_vfiprintf_r+0x3c8>
80002660:	04010613          	addi	x12,x2,64
80002664:	00048593          	addi	x11,x9,0
80002668:	00098513          	addi	x10,x19,0
8000266c:	6ed000ef          	jal	x1,80003558 <__sprint_r>
80002670:	0d00006f          	jal	x0,80002740 <_vfiprintf_r+0x3c8>
80002674:	00082b03          	lw	x22,0(x16)
80002678:	00480813          	addi	x16,x16,4
8000267c:	320b4063          	blt	x22,x0,8000299c <_vfiprintf_r+0x624>
80002680:	000c4703          	lbu	x14,0(x24)
80002684:	e71ff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>
80002688:	000c4703          	lbu	x14,0(x24)
8000268c:	020ded93          	ori	x27,x27,32
80002690:	e65ff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>
80002694:	00048593          	addi	x11,x9,0
80002698:	00098513          	addi	x10,x19,0
8000269c:	309010ef          	jal	x1,800041a4 <__swsetup_r>
800026a0:	5c0514e3          	bne	x10,x0,80003468 <_vfiprintf_r+0x10f0>
800026a4:	00c49783          	lh	x15,12(x9)
800026a8:	00a00713          	addi	x14,x0,10
800026ac:	01a7f793          	andi	x15,x15,26
800026b0:	d4e79ee3          	bne	x15,x14,8000240c <_vfiprintf_r+0x94>
800026b4:	00e49783          	lh	x15,14(x9)
800026b8:	d407cae3          	blt	x15,x0,8000240c <_vfiprintf_r+0x94>
800026bc:	12c12083          	lw	x1,300(x2)
800026c0:	11012b03          	lw	x22,272(x2)
800026c4:	00090693          	addi	x13,x18,0
800026c8:	000c0613          	addi	x12,x24,0
800026cc:	12012903          	lw	x18,288(x2)
800026d0:	10812c03          	lw	x24,264(x2)
800026d4:	00048593          	addi	x11,x9,0
800026d8:	00098513          	addi	x10,x19,0
800026dc:	12412483          	lw	x9,292(x2)
800026e0:	11c12983          	lw	x19,284(x2)
800026e4:	13010113          	addi	x2,x2,304
800026e8:	5a50006f          	jal	x0,8000348c <__sbprintf>
800026ec:	418b8933          	sub	x18,x23,x24
800026f0:	db8b94e3          	bne	x23,x24,80002498 <_vfiprintf_r+0x120>
800026f4:	000bc703          	lbu	x14,0(x23)
800026f8:	dd5ff06f          	jal	x0,800024cc <_vfiprintf_r+0x154>
800026fc:	04010613          	addi	x12,x2,64
80002700:	00048593          	addi	x11,x9,0
80002704:	00098513          	addi	x10,x19,0
80002708:	01012423          	sw	x16,8(x2)
8000270c:	64d000ef          	jal	x1,80003558 <__sprint_r>
80002710:	02051663          	bne	x10,x0,8000273c <_vfiprintf_r+0x3c4>
80002714:	00812803          	lw	x16,8(x2)
80002718:	000a0793          	addi	x15,x20,0
8000271c:	da9ff06f          	jal	x0,800024c4 <_vfiprintf_r+0x14c>
80002720:	04010613          	addi	x12,x2,64
80002724:	00048593          	addi	x11,x9,0
80002728:	00098513          	addi	x10,x19,0
8000272c:	01012423          	sw	x16,8(x2)
80002730:	629000ef          	jal	x1,80003558 <__sprint_r>
80002734:	00812803          	lw	x16,8(x2)
80002738:	f00506e3          	beq	x10,x0,80002644 <_vfiprintf_r+0x2cc>
8000273c:	000c8b13          	addi	x22,x25,0
80002740:	00c4d783          	lhu	x15,12(x9)
80002744:	12812403          	lw	x8,296(x2)
80002748:	11812a03          	lw	x20,280(x2)
8000274c:	0407f793          	andi	x15,x15,64
80002750:	11412a83          	lw	x21,276(x2)
80002754:	10c12b83          	lw	x23,268(x2)
80002758:	10412c83          	lw	x25,260(x2)
8000275c:	10012d03          	lw	x26,256(x2)
80002760:	0fc12d83          	lw	x27,252(x2)
80002764:	500792e3          	bne	x15,x0,80003468 <_vfiprintf_r+0x10f0>
80002768:	12c12083          	lw	x1,300(x2)
8000276c:	12412483          	lw	x9,292(x2)
80002770:	12012903          	lw	x18,288(x2)
80002774:	11c12983          	lw	x19,284(x2)
80002778:	10812c03          	lw	x24,264(x2)
8000277c:	000b0513          	addi	x10,x22,0
80002780:	11012b03          	lw	x22,272(x2)
80002784:	13010113          	addi	x2,x2,304
80002788:	00008067          	jalr	x0,0(x1)
8000278c:	04010613          	addi	x12,x2,64
80002790:	00048593          	addi	x11,x9,0
80002794:	00098513          	addi	x10,x19,0
80002798:	03012223          	sw	x16,36(x2)
8000279c:	01d12a23          	sw	x29,20(x2)
800027a0:	00612823          	sw	x6,16(x2)
800027a4:	00512623          	sw	x5,12(x2)
800027a8:	01f12423          	sw	x31,8(x2)
800027ac:	5ad000ef          	jal	x1,80003558 <__sprint_r>
800027b0:	f80516e3          	bne	x10,x0,8000273c <_vfiprintf_r+0x3c4>
800027b4:	04812683          	lw	x13,72(x2)
800027b8:	04412703          	lw	x14,68(x2)
800027bc:	02412803          	lw	x16,36(x2)
800027c0:	01412e83          	lw	x29,20(x2)
800027c4:	01012303          	lw	x6,16(x2)
800027c8:	00c12283          	lw	x5,12(x2)
800027cc:	00812f83          	lw	x31,8(x2)
800027d0:	000a0793          	addi	x15,x20,0
800027d4:	dedff06f          	jal	x0,800025c0 <_vfiprintf_r+0x248>
800027d8:	80102e37          	lui	x28,0x80102
800027dc:	01000613          	addi	x12,x0,16
800027e0:	04412703          	lw	x14,68(x2)
800027e4:	c2ce0e13          	addi	x28,x28,-980 # 80101c2c <blanks.1>
800027e8:	07265c63          	bge	x12,x18,80002860 <_vfiprintf_r+0x4e8>
800027ec:	01612423          	sw	x22,8(x2)
800027f0:	01000b93          	addi	x23,x0,16
800027f4:	00700d13          	addi	x26,x0,7
800027f8:	01012623          	sw	x16,12(x2)
800027fc:	000e0b13          	addi	x22,x28,0
80002800:	00c0006f          	jal	x0,8000280c <_vfiprintf_r+0x494>
80002804:	ff090913          	addi	x18,x18,-16
80002808:	052bd663          	bge	x23,x18,80002854 <_vfiprintf_r+0x4dc>
8000280c:	01068693          	addi	x13,x13,16
80002810:	00170713          	addi	x14,x14,1
80002814:	0167a023          	sw	x22,0(x15)
80002818:	0177a223          	sw	x23,4(x15)
8000281c:	04d12423          	sw	x13,72(x2)
80002820:	04e12223          	sw	x14,68(x2)
80002824:	00878793          	addi	x15,x15,8
80002828:	fced5ee3          	bge	x26,x14,80002804 <_vfiprintf_r+0x48c>
8000282c:	04010613          	addi	x12,x2,64
80002830:	00048593          	addi	x11,x9,0
80002834:	00098513          	addi	x10,x19,0
80002838:	521000ef          	jal	x1,80003558 <__sprint_r>
8000283c:	f00510e3          	bne	x10,x0,8000273c <_vfiprintf_r+0x3c4>
80002840:	ff090913          	addi	x18,x18,-16
80002844:	04812683          	lw	x13,72(x2)
80002848:	04412703          	lw	x14,68(x2)
8000284c:	000a0793          	addi	x15,x20,0
80002850:	fb2bcee3          	blt	x23,x18,8000280c <_vfiprintf_r+0x494>
80002854:	000b0e13          	addi	x28,x22,0
80002858:	00c12803          	lw	x16,12(x2)
8000285c:	00812b03          	lw	x22,8(x2)
80002860:	012686b3          	add	x13,x13,x18
80002864:	00170713          	addi	x14,x14,1
80002868:	01c7a023          	sw	x28,0(x15)
8000286c:	0127a223          	sw	x18,4(x15)
80002870:	04d12423          	sw	x13,72(x2)
80002874:	04e12223          	sw	x14,68(x2)
80002878:	00700793          	addi	x15,x0,7
8000287c:	dae7dce3          	bge	x15,x14,80002634 <_vfiprintf_r+0x2bc>
80002880:	04010613          	addi	x12,x2,64
80002884:	00048593          	addi	x11,x9,0
80002888:	00098513          	addi	x10,x19,0
8000288c:	01012423          	sw	x16,8(x2)
80002890:	4c9000ef          	jal	x1,80003558 <__sprint_r>
80002894:	ea0514e3          	bne	x10,x0,8000273c <_vfiprintf_r+0x3c4>
80002898:	04812683          	lw	x13,72(x2)
8000289c:	00812803          	lw	x16,8(x2)
800028a0:	d95ff06f          	jal	x0,80002634 <_vfiprintf_r+0x2bc>
800028a4:	000b8793          	addi	x15,x23,0
800028a8:	00082b83          	lw	x23,0(x16)
800028ac:	02010da3          	sb	x0,59(x2)
800028b0:	000d8313          	addi	x6,x27,0
800028b4:	00480913          	addi	x18,x16,4
800028b8:	2e0b80e3          	beq	x23,x0,80003398 <_vfiprintf_r+0x1020>
800028bc:	00f12623          	sw	x15,12(x2)
800028c0:	01b12423          	sw	x27,8(x2)
800028c4:	180d4ee3          	blt	x26,x0,80003260 <_vfiprintf_r+0xee8>
800028c8:	000d0613          	addi	x12,x26,0
800028cc:	00000593          	addi	x11,x0,0
800028d0:	000b8513          	addi	x10,x23,0
800028d4:	215010ef          	jal	x1,800042e8 <memchr>
800028d8:	00812303          	lw	x6,8(x2)
800028dc:	00c12783          	lw	x15,12(x2)
800028e0:	000d0e93          	addi	x29,x26,0
800028e4:	00050463          	beq	x10,x0,800028ec <_vfiprintf_r+0x574>
800028e8:	41750eb3          	sub	x29,x10,x23
800028ec:	03b14703          	lbu	x14,59(x2)
800028f0:	fffecd93          	xori	x27,x29,-1
800028f4:	41fddd93          	srai	x27,x27,0x1f
800028f8:	01befdb3          	and	x27,x29,x27
800028fc:	00090813          	addi	x16,x18,0
80002900:	00000d13          	addi	x26,x0,0
80002904:	00000f93          	addi	x31,x0,0
80002908:	c60706e3          	beq	x14,x0,80002574 <_vfiprintf_r+0x1fc>
8000290c:	001d8d93          	addi	x27,x27,1
80002910:	00237f93          	andi	x31,x6,2
80002914:	c60f80e3          	beq	x31,x0,80002574 <_vfiprintf_r+0x1fc>
80002918:	002d8d93          	addi	x27,x27,2
8000291c:	00200f93          	addi	x31,x0,2
80002920:	c55ff06f          	jal	x0,80002574 <_vfiprintf_r+0x1fc>
80002924:	00082703          	lw	x14,0(x16)
80002928:	000b8793          	addi	x15,x23,0
8000292c:	000d8313          	addi	x6,x27,0
80002930:	02010da3          	sb	x0,59(x2)
80002934:	00480813          	addi	x16,x16,4
80002938:	08e10623          	sb	x14,140(x2)
8000293c:	00100d93          	addi	x27,x0,1
80002940:	00100e93          	addi	x29,x0,1
80002944:	08c10b93          	addi	x23,x2,140
80002948:	c25ff06f          	jal	x0,8000256c <_vfiprintf_r+0x1f4>
8000294c:	000d8313          	addi	x6,x27,0
80002950:	02037713          	andi	x14,x6,32
80002954:	000b8793          	addi	x15,x23,0
80002958:	22070a63          	beq	x14,x0,80002b8c <_vfiprintf_r+0x814>
8000295c:	00780813          	addi	x16,x16,7
80002960:	ff887813          	andi	x16,x16,-8
80002964:	00482683          	lw	x13,4(x16)
80002968:	00082903          	lw	x18,0(x16)
8000296c:	00880813          	addi	x16,x16,8
80002970:	00068d93          	addi	x27,x13,0
80002974:	2406c263          	blt	x13,x0,80002bb8 <_vfiprintf_r+0x840>
80002978:	260d4063          	blt	x26,x0,80002bd8 <_vfiprintf_r+0x860>
8000297c:	01b966b3          	or	x13,x18,x27
80002980:	f7f37313          	andi	x6,x6,-129
80002984:	24069a63          	bne	x13,x0,80002bd8 <_vfiprintf_r+0x860>
80002988:	2c0d1ce3          	bne	x26,x0,80003460 <_vfiprintf_r+0x10e8>
8000298c:	00000d93          	addi	x27,x0,0
80002990:	00000e93          	addi	x29,x0,0
80002994:	0f010b93          	addi	x23,x2,240
80002998:	26c0006f          	jal	x0,80002c04 <_vfiprintf_r+0x88c>
8000299c:	41600b33          	sub	x22,x0,x22
800029a0:	000c4703          	lbu	x14,0(x24)
800029a4:	004ded93          	ori	x27,x27,4
800029a8:	b4dff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>
800029ac:	02b00693          	addi	x13,x0,43
800029b0:	000c4703          	lbu	x14,0(x24)
800029b4:	02d10da3          	sb	x13,59(x2)
800029b8:	b3dff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>
800029bc:	000086b7          	lui	x13,0x8
800029c0:	83068693          	addi	x13,x13,-2000 # 7830 <_stack_size+0x6830>
800029c4:	02d11e23          	sh	x13,60(x2)
800029c8:	801026b7          	lui	x13,0x80102
800029cc:	a7468693          	addi	x13,x13,-1420 # 80101a74 <array_exp.0+0x234>
800029d0:	00082703          	lw	x14,0(x16)
800029d4:	000b8793          	addi	x15,x23,0
800029d8:	00000593          	addi	x11,x0,0
800029dc:	002de313          	ori	x6,x27,2
800029e0:	00480813          	addi	x16,x16,4
800029e4:	00d12223          	sw	x13,4(x2)
800029e8:	02010da3          	sb	x0,59(x2)
800029ec:	540d4663          	blt	x26,x0,80002f38 <_vfiprintf_r+0xbc0>
800029f0:	00b766b3          	or	x13,x14,x11
800029f4:	f7f37613          	andi	x12,x6,-129
800029f8:	52069a63          	bne	x13,x0,80002f2c <_vfiprintf_r+0xbb4>
800029fc:	00030e93          	addi	x29,x6,0
80002a00:	00200713          	addi	x14,x0,2
80002a04:	00060313          	addi	x6,x12,0
80002a08:	0a0d1863          	bne	x26,x0,80002ab8 <_vfiprintf_r+0x740>
80002a0c:	f80710e3          	bne	x14,x0,8000298c <_vfiprintf_r+0x614>
80002a10:	001efe93          	andi	x29,x29,1
80002a14:	740e8e63          	beq	x29,x0,80003170 <_vfiprintf_r+0xdf8>
80002a18:	03000713          	addi	x14,x0,48
80002a1c:	0ee107a3          	sb	x14,239(x2)
80002a20:	000e8d93          	addi	x27,x29,0
80002a24:	0ef10b93          	addi	x23,x2,239
80002a28:	1dc0006f          	jal	x0,80002c04 <_vfiprintf_r+0x88c>
80002a2c:	020df713          	andi	x14,x27,32
80002a30:	000b8793          	addi	x15,x23,0
80002a34:	74071463          	bne	x14,x0,8000317c <_vfiprintf_r+0xe04>
80002a38:	010df713          	andi	x14,x27,16
80002a3c:	140716e3          	bne	x14,x0,80003388 <_vfiprintf_r+0x1010>
80002a40:	040df713          	andi	x14,x27,64
80002a44:	1e071ce3          	bne	x14,x0,8000343c <_vfiprintf_r+0x10c4>
80002a48:	200df313          	andi	x6,x27,512
80002a4c:	12030ee3          	beq	x6,x0,80003388 <_vfiprintf_r+0x1010>
80002a50:	00082703          	lw	x14,0(x16)
80002a54:	00480813          	addi	x16,x16,4
80002a58:	01970023          	sb	x25,0(x14)
80002a5c:	a15ff06f          	jal	x0,80002470 <_vfiprintf_r+0xf8>
80002a60:	000c4703          	lbu	x14,0(x24)
80002a64:	06800693          	addi	x13,x0,104
80002a68:	10d708e3          	beq	x14,x13,80003378 <_vfiprintf_r+0x1000>
80002a6c:	040ded93          	ori	x27,x27,64
80002a70:	a85ff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>
80002a74:	000b8793          	addi	x15,x23,0
80002a78:	010dee93          	ori	x29,x27,16
80002a7c:	020ef713          	andi	x14,x29,32
80002a80:	68070e63          	beq	x14,x0,8000311c <_vfiprintf_r+0xda4>
80002a84:	00780813          	addi	x16,x16,7
80002a88:	ff887813          	andi	x16,x16,-8
80002a8c:	00082903          	lw	x18,0(x16)
80002a90:	00482d83          	lw	x27,4(x16)
80002a94:	00880813          	addi	x16,x16,8
80002a98:	02010da3          	sb	x0,59(x2)
80002a9c:	000e8313          	addi	x6,x29,0
80002aa0:	120d4c63          	blt	x26,x0,80002bd8 <_vfiprintf_r+0x860>
80002aa4:	01b966b3          	or	x13,x18,x27
80002aa8:	f7fef313          	andi	x6,x29,-129
80002aac:	12069663          	bne	x13,x0,80002bd8 <_vfiprintf_r+0x860>
80002ab0:	00100713          	addi	x14,x0,1
80002ab4:	f40d0ce3          	beq	x26,x0,80002a0c <_vfiprintf_r+0x694>
80002ab8:	00100693          	addi	x13,x0,1
80002abc:	1ad702e3          	beq	x14,x13,80003460 <_vfiprintf_r+0x10e8>
80002ac0:	00200693          	addi	x13,x0,2
80002ac4:	0ed70ae3          	beq	x14,x13,800033b8 <_vfiprintf_r+0x1040>
80002ac8:	00000713          	addi	x14,x0,0
80002acc:	00000593          	addi	x11,x0,0
80002ad0:	0f010b93          	addi	x23,x2,240
80002ad4:	01d59613          	slli	x12,x11,0x1d
80002ad8:	00777693          	andi	x13,x14,7
80002adc:	00375713          	srli	x14,x14,0x3
80002ae0:	03068693          	addi	x13,x13,48
80002ae4:	00e66733          	or	x14,x12,x14
80002ae8:	0035d593          	srli	x11,x11,0x3
80002aec:	fedb8fa3          	sb	x13,-1(x23)
80002af0:	00b76633          	or	x12,x14,x11
80002af4:	000b8513          	addi	x10,x23,0
80002af8:	fffb8b93          	addi	x23,x23,-1
80002afc:	fc061ce3          	bne	x12,x0,80002ad4 <_vfiprintf_r+0x75c>
80002b00:	00137713          	andi	x14,x6,1
80002b04:	46070463          	beq	x14,x0,80002f6c <_vfiprintf_r+0xbf4>
80002b08:	03000713          	addi	x14,x0,48
80002b0c:	46e68063          	beq	x13,x14,80002f6c <_vfiprintf_r+0xbf4>
80002b10:	ffe50513          	addi	x10,x10,-2
80002b14:	feeb8fa3          	sb	x14,-1(x23)
80002b18:	0f010713          	addi	x14,x2,240
80002b1c:	40a70eb3          	sub	x29,x14,x10
80002b20:	000d0d93          	addi	x27,x26,0
80002b24:	67dd4863          	blt	x26,x29,80003194 <_vfiprintf_r+0xe1c>
80002b28:	00050b93          	addi	x23,x10,0
80002b2c:	0d80006f          	jal	x0,80002c04 <_vfiprintf_r+0x88c>
80002b30:	000b8793          	addi	x15,x23,0
80002b34:	010de693          	ori	x13,x27,16
80002b38:	0206f713          	andi	x14,x13,32
80002b3c:	5a070463          	beq	x14,x0,800030e4 <_vfiprintf_r+0xd6c>
80002b40:	00780813          	addi	x16,x16,7
80002b44:	ff887813          	andi	x16,x16,-8
80002b48:	00082703          	lw	x14,0(x16)
80002b4c:	00482583          	lw	x11,4(x16)
80002b50:	00880813          	addi	x16,x16,8
80002b54:	02010da3          	sb	x0,59(x2)
80002b58:	bff6f313          	andi	x6,x13,-1025
80002b5c:	f60d4ae3          	blt	x26,x0,80002ad0 <_vfiprintf_r+0x758>
80002b60:	00b76633          	or	x12,x14,x11
80002b64:	b7f6f693          	andi	x13,x13,-1153
80002b68:	7e061463          	bne	x12,x0,80003350 <_vfiprintf_r+0xfd8>
80002b6c:	00030e93          	addi	x29,x6,0
80002b70:	00000713          	addi	x14,x0,0
80002b74:	00068313          	addi	x6,x13,0
80002b78:	e91ff06f          	jal	x0,80002a08 <_vfiprintf_r+0x690>
80002b7c:	010de313          	ori	x6,x27,16
80002b80:	02037713          	andi	x14,x6,32
80002b84:	000b8793          	addi	x15,x23,0
80002b88:	dc071ae3          	bne	x14,x0,8000295c <_vfiprintf_r+0x5e4>
80002b8c:	01037693          	andi	x13,x6,16
80002b90:	00082703          	lw	x14,0(x16)
80002b94:	00480813          	addi	x16,x16,4
80002b98:	5c069463          	bne	x13,x0,80003160 <_vfiprintf_r+0xde8>
80002b9c:	04037693          	andi	x13,x6,64
80002ba0:	5a068c63          	beq	x13,x0,80003158 <_vfiprintf_r+0xde0>
80002ba4:	01071913          	slli	x18,x14,0x10
80002ba8:	41095913          	srai	x18,x18,0x10
80002bac:	41f95d93          	srai	x27,x18,0x1f
80002bb0:	000d8693          	addi	x13,x27,0
80002bb4:	dc06d2e3          	bge	x13,x0,80002978 <_vfiprintf_r+0x600>
80002bb8:	02d00613          	addi	x12,x0,45
80002bbc:	012036b3          	sltu	x13,x0,x18
80002bc0:	41b00e33          	sub	x28,x0,x27
80002bc4:	02c10da3          	sb	x12,59(x2)
80002bc8:	40de0db3          	sub	x27,x28,x13
80002bcc:	41200933          	sub	x18,x0,x18
80002bd0:	000d4463          	blt	x26,x0,80002bd8 <_vfiprintf_r+0x860>
80002bd4:	f7f37313          	andi	x6,x6,-129
80002bd8:	6a0d9863          	bne	x27,x0,80003288 <_vfiprintf_r+0xf10>
80002bdc:	00900693          	addi	x13,x0,9
80002be0:	6b26e463          	bltu	x13,x18,80003288 <_vfiprintf_r+0xf10>
80002be4:	03090713          	addi	x14,x18,48
80002be8:	0ff77713          	andi	x14,x14,255
80002bec:	0ee107a3          	sb	x14,239(x2)
80002bf0:	000d0d93          	addi	x27,x26,0
80002bf4:	01a04463          	blt	x0,x26,80002bfc <_vfiprintf_r+0x884>
80002bf8:	00100d93          	addi	x27,x0,1
80002bfc:	00100e93          	addi	x29,x0,1
80002c00:	0ef10b93          	addi	x23,x2,239
80002c04:	03b14703          	lbu	x14,59(x2)
80002c08:	d00712e3          	bne	x14,x0,8000290c <_vfiprintf_r+0x594>
80002c0c:	d05ff06f          	jal	x0,80002910 <_vfiprintf_r+0x598>
80002c10:	00098513          	addi	x10,x19,0
80002c14:	01012423          	sw	x16,8(x2)
80002c18:	0bd010ef          	jal	x1,800044d4 <_localeconv_r>
80002c1c:	00452783          	lw	x15,4(x10)
80002c20:	00078513          	addi	x10,x15,0
80002c24:	02f12023          	sw	x15,32(x2)
80002c28:	5e9010ef          	jal	x1,80004a10 <strlen>
80002c2c:	00050713          	addi	x14,x10,0
80002c30:	00098513          	addi	x10,x19,0
80002c34:	00e12e23          	sw	x14,28(x2)
80002c38:	09d010ef          	jal	x1,800044d4 <_localeconv_r>
80002c3c:	00852683          	lw	x13,8(x10)
80002c40:	01c12783          	lw	x15,28(x2)
80002c44:	00812803          	lw	x16,8(x2)
80002c48:	00d12c23          	sw	x13,24(x2)
80002c4c:	a2078ae3          	beq	x15,x0,80002680 <_vfiprintf_r+0x308>
80002c50:	01812783          	lw	x15,24(x2)
80002c54:	000c4703          	lbu	x14,0(x24)
80002c58:	88078ee3          	beq	x15,x0,800024f4 <_vfiprintf_r+0x17c>
80002c5c:	0007c683          	lbu	x13,0(x15)
80002c60:	88068ae3          	beq	x13,x0,800024f4 <_vfiprintf_r+0x17c>
80002c64:	400ded93          	ori	x27,x27,1024
80002c68:	88dff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>
80002c6c:	000c4703          	lbu	x14,0(x24)
80002c70:	001ded93          	ori	x27,x27,1
80002c74:	881ff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>
80002c78:	03b14683          	lbu	x13,59(x2)
80002c7c:	000c4703          	lbu	x14,0(x24)
80002c80:	86069ae3          	bne	x13,x0,800024f4 <_vfiprintf_r+0x17c>
80002c84:	02000693          	addi	x13,x0,32
80002c88:	02d10da3          	sb	x13,59(x2)
80002c8c:	869ff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>
80002c90:	000c4703          	lbu	x14,0(x24)
80002c94:	080ded93          	ori	x27,x27,128
80002c98:	85dff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>
80002c9c:	000c4603          	lbu	x12,0(x24)
80002ca0:	02a00713          	addi	x14,x0,42
80002ca4:	001c0593          	addi	x11,x24,1
80002ca8:	7ce60463          	beq	x12,x14,80003470 <_vfiprintf_r+0x10f8>
80002cac:	fd060713          	addi	x14,x12,-48
80002cb0:	00900693          	addi	x13,x0,9
80002cb4:	00000d13          	addi	x26,x0,0
80002cb8:	00900513          	addi	x10,x0,9
80002cbc:	02e6e463          	bltu	x13,x14,80002ce4 <_vfiprintf_r+0x96c>
80002cc0:	0005c603          	lbu	x12,0(x11)
80002cc4:	002d1693          	slli	x13,x26,0x2
80002cc8:	01a68d33          	add	x26,x13,x26
80002ccc:	001d1d13          	slli	x26,x26,0x1
80002cd0:	00ed0d33          	add	x26,x26,x14
80002cd4:	fd060713          	addi	x14,x12,-48
80002cd8:	00158593          	addi	x11,x11,1
80002cdc:	fee572e3          	bgeu	x10,x14,80002cc0 <_vfiprintf_r+0x948>
80002ce0:	4c0d4063          	blt	x26,x0,800031a0 <_vfiprintf_r+0xe28>
80002ce4:	00058c13          	addi	x24,x11,0
80002ce8:	815ff06f          	jal	x0,800024fc <_vfiprintf_r+0x184>
80002cec:	000c4703          	lbu	x14,0(x24)
80002cf0:	06c00693          	addi	x13,x0,108
80002cf4:	66d70a63          	beq	x14,x13,80003368 <_vfiprintf_r+0xff0>
80002cf8:	010ded93          	ori	x27,x27,16
80002cfc:	ff8ff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>
80002d00:	41bb0933          	sub	x18,x22,x27
80002d04:	8f205ae3          	bge	x0,x18,800025f8 <_vfiprintf_r+0x280>
80002d08:	80102f37          	lui	x30,0x80102
80002d0c:	01000613          	addi	x12,x0,16
80002d10:	c1cf0f13          	addi	x30,x30,-996 # 80101c1c <zeroes.0>
80002d14:	09265863          	bge	x12,x18,80002da4 <_vfiprintf_r+0xa2c>
80002d18:	01612423          	sw	x22,8(x2)
80002d1c:	01000e13          	addi	x28,x0,16
80002d20:	00700f93          	addi	x31,x0,7
80002d24:	00612623          	sw	x6,12(x2)
80002d28:	01d12823          	sw	x29,16(x2)
80002d2c:	01012a23          	sw	x16,20(x2)
80002d30:	000f0b13          	addi	x22,x30,0
80002d34:	00c0006f          	jal	x0,80002d40 <_vfiprintf_r+0x9c8>
80002d38:	ff090913          	addi	x18,x18,-16
80002d3c:	052e5a63          	bge	x28,x18,80002d90 <_vfiprintf_r+0xa18>
80002d40:	01068693          	addi	x13,x13,16
80002d44:	00170713          	addi	x14,x14,1
80002d48:	0167a023          	sw	x22,0(x15)
80002d4c:	01c7a223          	sw	x28,4(x15)
80002d50:	04d12423          	sw	x13,72(x2)
80002d54:	04e12223          	sw	x14,68(x2)
80002d58:	00878793          	addi	x15,x15,8
80002d5c:	fcefdee3          	bge	x31,x14,80002d38 <_vfiprintf_r+0x9c0>
80002d60:	04010613          	addi	x12,x2,64
80002d64:	00048593          	addi	x11,x9,0
80002d68:	00098513          	addi	x10,x19,0
80002d6c:	7ec000ef          	jal	x1,80003558 <__sprint_r>
80002d70:	9c0516e3          	bne	x10,x0,8000273c <_vfiprintf_r+0x3c4>
80002d74:	01000e13          	addi	x28,x0,16
80002d78:	ff090913          	addi	x18,x18,-16
80002d7c:	04812683          	lw	x13,72(x2)
80002d80:	04412703          	lw	x14,68(x2)
80002d84:	000a0793          	addi	x15,x20,0
80002d88:	00700f93          	addi	x31,x0,7
80002d8c:	fb2e4ae3          	blt	x28,x18,80002d40 <_vfiprintf_r+0x9c8>
80002d90:	000b0f13          	addi	x30,x22,0
80002d94:	00c12303          	lw	x6,12(x2)
80002d98:	01012e83          	lw	x29,16(x2)
80002d9c:	01412803          	lw	x16,20(x2)
80002da0:	00812b03          	lw	x22,8(x2)
80002da4:	012686b3          	add	x13,x13,x18
80002da8:	00170713          	addi	x14,x14,1
80002dac:	01e7a023          	sw	x30,0(x15)
80002db0:	0127a223          	sw	x18,4(x15)
80002db4:	04d12423          	sw	x13,72(x2)
80002db8:	04e12223          	sw	x14,68(x2)
80002dbc:	00700613          	addi	x12,x0,7
80002dc0:	00878793          	addi	x15,x15,8
80002dc4:	82e65ae3          	bge	x12,x14,800025f8 <_vfiprintf_r+0x280>
80002dc8:	04010613          	addi	x12,x2,64
80002dcc:	00048593          	addi	x11,x9,0
80002dd0:	00098513          	addi	x10,x19,0
80002dd4:	01012823          	sw	x16,16(x2)
80002dd8:	01d12623          	sw	x29,12(x2)
80002ddc:	00612423          	sw	x6,8(x2)
80002de0:	778000ef          	jal	x1,80003558 <__sprint_r>
80002de4:	94051ce3          	bne	x10,x0,8000273c <_vfiprintf_r+0x3c4>
80002de8:	00c12e83          	lw	x29,12(x2)
80002dec:	04812683          	lw	x13,72(x2)
80002df0:	04412703          	lw	x14,68(x2)
80002df4:	41dd0d33          	sub	x26,x26,x29
80002df8:	01012803          	lw	x16,16(x2)
80002dfc:	00812303          	lw	x6,8(x2)
80002e00:	000a0793          	addi	x15,x20,0
80002e04:	ffa05e63          	bge	x0,x26,80002600 <_vfiprintf_r+0x288>
80002e08:	80102f37          	lui	x30,0x80102
80002e0c:	c1cf0f13          	addi	x30,x30,-996 # 80101c1c <zeroes.0>
80002e10:	09a45663          	bge	x8,x26,80002e9c <_vfiprintf_r+0xb24>
80002e14:	01612423          	sw	x22,8(x2)
80002e18:	00700913          	addi	x18,x0,7
80002e1c:	000d0b13          	addi	x22,x26,0
80002e20:	00612623          	sw	x6,12(x2)
80002e24:	01d12823          	sw	x29,16(x2)
80002e28:	01012a23          	sw	x16,20(x2)
80002e2c:	000a8d13          	addi	x26,x21,0
80002e30:	00c0006f          	jal	x0,80002e3c <_vfiprintf_r+0xac4>
80002e34:	ff0b0b13          	addi	x22,x22,-16
80002e38:	05645663          	bge	x8,x22,80002e84 <_vfiprintf_r+0xb0c>
80002e3c:	01068693          	addi	x13,x13,16
80002e40:	00170713          	addi	x14,x14,1
80002e44:	0157a023          	sw	x21,0(x15)
80002e48:	0087a223          	sw	x8,4(x15)
80002e4c:	04d12423          	sw	x13,72(x2)
80002e50:	04e12223          	sw	x14,68(x2)
80002e54:	00878793          	addi	x15,x15,8
80002e58:	fce95ee3          	bge	x18,x14,80002e34 <_vfiprintf_r+0xabc>
80002e5c:	04010613          	addi	x12,x2,64
80002e60:	00048593          	addi	x11,x9,0
80002e64:	00098513          	addi	x10,x19,0
80002e68:	6f0000ef          	jal	x1,80003558 <__sprint_r>
80002e6c:	8c0518e3          	bne	x10,x0,8000273c <_vfiprintf_r+0x3c4>
80002e70:	ff0b0b13          	addi	x22,x22,-16
80002e74:	04812683          	lw	x13,72(x2)
80002e78:	04412703          	lw	x14,68(x2)
80002e7c:	000a0793          	addi	x15,x20,0
80002e80:	fb644ee3          	blt	x8,x22,80002e3c <_vfiprintf_r+0xac4>
80002e84:	000d0f13          	addi	x30,x26,0
80002e88:	00c12303          	lw	x6,12(x2)
80002e8c:	000b0d13          	addi	x26,x22,0
80002e90:	01012e83          	lw	x29,16(x2)
80002e94:	01412803          	lw	x16,20(x2)
80002e98:	00812b03          	lw	x22,8(x2)
80002e9c:	01a686b3          	add	x13,x13,x26
80002ea0:	00170713          	addi	x14,x14,1
80002ea4:	01e7a023          	sw	x30,0(x15)
80002ea8:	01a7a223          	sw	x26,4(x15)
80002eac:	04d12423          	sw	x13,72(x2)
80002eb0:	04e12223          	sw	x14,68(x2)
80002eb4:	00700613          	addi	x12,x0,7
80002eb8:	00878793          	addi	x15,x15,8
80002ebc:	f4e65263          	bge	x12,x14,80002600 <_vfiprintf_r+0x288>
80002ec0:	04010613          	addi	x12,x2,64
80002ec4:	00048593          	addi	x11,x9,0
80002ec8:	00098513          	addi	x10,x19,0
80002ecc:	01012823          	sw	x16,16(x2)
80002ed0:	01d12623          	sw	x29,12(x2)
80002ed4:	00612423          	sw	x6,8(x2)
80002ed8:	680000ef          	jal	x1,80003558 <__sprint_r>
80002edc:	860510e3          	bne	x10,x0,8000273c <_vfiprintf_r+0x3c4>
80002ee0:	04812683          	lw	x13,72(x2)
80002ee4:	04412703          	lw	x14,68(x2)
80002ee8:	01012803          	lw	x16,16(x2)
80002eec:	00c12e83          	lw	x29,12(x2)
80002ef0:	00812303          	lw	x6,8(x2)
80002ef4:	000a0793          	addi	x15,x20,0
80002ef8:	f08ff06f          	jal	x0,80002600 <_vfiprintf_r+0x288>
80002efc:	04010613          	addi	x12,x2,64
80002f00:	00048593          	addi	x11,x9,0
80002f04:	00098513          	addi	x10,x19,0
80002f08:	01012623          	sw	x16,12(x2)
80002f0c:	00612423          	sw	x6,8(x2)
80002f10:	648000ef          	jal	x1,80003558 <__sprint_r>
80002f14:	820514e3          	bne	x10,x0,8000273c <_vfiprintf_r+0x3c4>
80002f18:	04812683          	lw	x13,72(x2)
80002f1c:	00c12803          	lw	x16,12(x2)
80002f20:	00812303          	lw	x6,8(x2)
80002f24:	000a0793          	addi	x15,x20,0
80002f28:	efcff06f          	jal	x0,80002624 <_vfiprintf_r+0x2ac>
80002f2c:	00200693          	addi	x13,x0,2
80002f30:	00060313          	addi	x6,x12,0
80002f34:	b8068ee3          	beq	x13,x0,80002ad0 <_vfiprintf_r+0x758>
80002f38:	00412503          	lw	x10,4(x2)
80002f3c:	0f010b93          	addi	x23,x2,240
80002f40:	00f77693          	andi	x13,x14,15
80002f44:	00d506b3          	add	x13,x10,x13
80002f48:	0006c603          	lbu	x12,0(x13)
80002f4c:	00475713          	srli	x14,x14,0x4
80002f50:	01c59693          	slli	x13,x11,0x1c
80002f54:	00e6e733          	or	x14,x13,x14
80002f58:	0045d593          	srli	x11,x11,0x4
80002f5c:	fecb8fa3          	sb	x12,-1(x23)
80002f60:	00b766b3          	or	x13,x14,x11
80002f64:	fffb8b93          	addi	x23,x23,-1
80002f68:	fc069ce3          	bne	x13,x0,80002f40 <_vfiprintf_r+0xbc8>
80002f6c:	0f010713          	addi	x14,x2,240
80002f70:	41770eb3          	sub	x29,x14,x23
80002f74:	000d0d93          	addi	x27,x26,0
80002f78:	c9dd56e3          	bge	x26,x29,80002c04 <_vfiprintf_r+0x88c>
80002f7c:	000e8d93          	addi	x27,x29,0
80002f80:	c85ff06f          	jal	x0,80002c04 <_vfiprintf_r+0x88c>
80002f84:	80102e37          	lui	x28,0x80102
80002f88:	01000613          	addi	x12,x0,16
80002f8c:	c2ce0e13          	addi	x28,x28,-980 # 80101c2c <blanks.1>
80002f90:	0b265063          	bge	x12,x18,80003030 <_vfiprintf_r+0xcb8>
80002f94:	01612823          	sw	x22,16(x2)
80002f98:	01000f13          	addi	x30,x0,16
80002f9c:	00700393          	addi	x7,x0,7
80002fa0:	01f12423          	sw	x31,8(x2)
80002fa4:	00512623          	sw	x5,12(x2)
80002fa8:	00612a23          	sw	x6,20(x2)
80002fac:	03d12223          	sw	x29,36(x2)
80002fb0:	03012423          	sw	x16,40(x2)
80002fb4:	000e0b13          	addi	x22,x28,0
80002fb8:	00c0006f          	jal	x0,80002fc4 <_vfiprintf_r+0xc4c>
80002fbc:	ff090913          	addi	x18,x18,-16
80002fc0:	052f5a63          	bge	x30,x18,80003014 <_vfiprintf_r+0xc9c>
80002fc4:	01068693          	addi	x13,x13,16
80002fc8:	00170713          	addi	x14,x14,1
80002fcc:	0167a023          	sw	x22,0(x15)
80002fd0:	01e7a223          	sw	x30,4(x15)
80002fd4:	04d12423          	sw	x13,72(x2)
80002fd8:	04e12223          	sw	x14,68(x2)
80002fdc:	00878793          	addi	x15,x15,8
80002fe0:	fce3dee3          	bge	x7,x14,80002fbc <_vfiprintf_r+0xc44>
80002fe4:	04010613          	addi	x12,x2,64
80002fe8:	00048593          	addi	x11,x9,0
80002fec:	00098513          	addi	x10,x19,0
80002ff0:	568000ef          	jal	x1,80003558 <__sprint_r>
80002ff4:	f4051463          	bne	x10,x0,8000273c <_vfiprintf_r+0x3c4>
80002ff8:	01000f13          	addi	x30,x0,16
80002ffc:	ff090913          	addi	x18,x18,-16
80003000:	04812683          	lw	x13,72(x2)
80003004:	04412703          	lw	x14,68(x2)
80003008:	000a0793          	addi	x15,x20,0
8000300c:	00700393          	addi	x7,x0,7
80003010:	fb2f4ae3          	blt	x30,x18,80002fc4 <_vfiprintf_r+0xc4c>
80003014:	000b0e13          	addi	x28,x22,0
80003018:	00812f83          	lw	x31,8(x2)
8000301c:	00c12283          	lw	x5,12(x2)
80003020:	01412303          	lw	x6,20(x2)
80003024:	02412e83          	lw	x29,36(x2)
80003028:	02812803          	lw	x16,40(x2)
8000302c:	01012b03          	lw	x22,16(x2)
80003030:	012686b3          	add	x13,x13,x18
80003034:	00170713          	addi	x14,x14,1
80003038:	01c7a023          	sw	x28,0(x15)
8000303c:	0127a223          	sw	x18,4(x15)
80003040:	04d12423          	sw	x13,72(x2)
80003044:	04e12223          	sw	x14,68(x2)
80003048:	00700613          	addi	x12,x0,7
8000304c:	00878793          	addi	x15,x15,8
80003050:	d2e65e63          	bge	x12,x14,8000258c <_vfiprintf_r+0x214>
80003054:	04010613          	addi	x12,x2,64
80003058:	00048593          	addi	x11,x9,0
8000305c:	00098513          	addi	x10,x19,0
80003060:	03012223          	sw	x16,36(x2)
80003064:	01d12a23          	sw	x29,20(x2)
80003068:	00612823          	sw	x6,16(x2)
8000306c:	00512623          	sw	x5,12(x2)
80003070:	01f12423          	sw	x31,8(x2)
80003074:	4e4000ef          	jal	x1,80003558 <__sprint_r>
80003078:	ec051263          	bne	x10,x0,8000273c <_vfiprintf_r+0x3c4>
8000307c:	04812683          	lw	x13,72(x2)
80003080:	04412703          	lw	x14,68(x2)
80003084:	02412803          	lw	x16,36(x2)
80003088:	01412e83          	lw	x29,20(x2)
8000308c:	01012303          	lw	x6,16(x2)
80003090:	00c12283          	lw	x5,12(x2)
80003094:	00812f83          	lw	x31,8(x2)
80003098:	000a0793          	addi	x15,x20,0
8000309c:	cf0ff06f          	jal	x0,8000258c <_vfiprintf_r+0x214>
800030a0:	04010613          	addi	x12,x2,64
800030a4:	00048593          	addi	x11,x9,0
800030a8:	00098513          	addi	x10,x19,0
800030ac:	01012a23          	sw	x16,20(x2)
800030b0:	01d12823          	sw	x29,16(x2)
800030b4:	00612623          	sw	x6,12(x2)
800030b8:	00512423          	sw	x5,8(x2)
800030bc:	49c000ef          	jal	x1,80003558 <__sprint_r>
800030c0:	e6051e63          	bne	x10,x0,8000273c <_vfiprintf_r+0x3c4>
800030c4:	04812683          	lw	x13,72(x2)
800030c8:	04412703          	lw	x14,68(x2)
800030cc:	01412803          	lw	x16,20(x2)
800030d0:	01012e83          	lw	x29,16(x2)
800030d4:	00c12303          	lw	x6,12(x2)
800030d8:	00812283          	lw	x5,8(x2)
800030dc:	000a0793          	addi	x15,x20,0
800030e0:	d10ff06f          	jal	x0,800025f0 <_vfiprintf_r+0x278>
800030e4:	0106f613          	andi	x12,x13,16
800030e8:	00082703          	lw	x14,0(x16)
800030ec:	00480813          	addi	x16,x16,4
800030f0:	02061263          	bne	x12,x0,80003114 <_vfiprintf_r+0xd9c>
800030f4:	0406f613          	andi	x12,x13,64
800030f8:	00060a63          	beq	x12,x0,8000310c <_vfiprintf_r+0xd94>
800030fc:	01071713          	slli	x14,x14,0x10
80003100:	01075713          	srli	x14,x14,0x10
80003104:	00000593          	addi	x11,x0,0
80003108:	a4dff06f          	jal	x0,80002b54 <_vfiprintf_r+0x7dc>
8000310c:	2006f613          	andi	x12,x13,512
80003110:	30061463          	bne	x12,x0,80003418 <_vfiprintf_r+0x10a0>
80003114:	00000593          	addi	x11,x0,0
80003118:	a3dff06f          	jal	x0,80002b54 <_vfiprintf_r+0x7dc>
8000311c:	010ef693          	andi	x13,x29,16
80003120:	00082703          	lw	x14,0(x16)
80003124:	00480813          	addi	x16,x16,4
80003128:	02069263          	bne	x13,x0,8000314c <_vfiprintf_r+0xdd4>
8000312c:	040ef693          	andi	x13,x29,64
80003130:	00068a63          	beq	x13,x0,80003144 <_vfiprintf_r+0xdcc>
80003134:	01071913          	slli	x18,x14,0x10
80003138:	01095913          	srli	x18,x18,0x10
8000313c:	00000d93          	addi	x27,x0,0
80003140:	959ff06f          	jal	x0,80002a98 <_vfiprintf_r+0x720>
80003144:	200ef693          	andi	x13,x29,512
80003148:	2c069e63          	bne	x13,x0,80003424 <_vfiprintf_r+0x10ac>
8000314c:	00070913          	addi	x18,x14,0
80003150:	00000d93          	addi	x27,x0,0
80003154:	945ff06f          	jal	x0,80002a98 <_vfiprintf_r+0x720>
80003158:	20037693          	andi	x13,x6,512
8000315c:	2e069863          	bne	x13,x0,8000344c <_vfiprintf_r+0x10d4>
80003160:	41f75d93          	srai	x27,x14,0x1f
80003164:	00070913          	addi	x18,x14,0
80003168:	000d8693          	addi	x13,x27,0
8000316c:	809ff06f          	jal	x0,80002974 <_vfiprintf_r+0x5fc>
80003170:	00000d93          	addi	x27,x0,0
80003174:	0f010b93          	addi	x23,x2,240
80003178:	a8dff06f          	jal	x0,80002c04 <_vfiprintf_r+0x88c>
8000317c:	00082703          	lw	x14,0(x16)
80003180:	41fcd693          	srai	x13,x25,0x1f
80003184:	00480813          	addi	x16,x16,4
80003188:	01972023          	sw	x25,0(x14)
8000318c:	00d72223          	sw	x13,4(x14)
80003190:	ae0ff06f          	jal	x0,80002470 <_vfiprintf_r+0xf8>
80003194:	000e8d93          	addi	x27,x29,0
80003198:	00050b93          	addi	x23,x10,0
8000319c:	a69ff06f          	jal	x0,80002c04 <_vfiprintf_r+0x88c>
800031a0:	fff00d13          	addi	x26,x0,-1
800031a4:	00058c13          	addi	x24,x11,0
800031a8:	b54ff06f          	jal	x0,800024fc <_vfiprintf_r+0x184>
800031ac:	80102737          	lui	x14,0x80102
800031b0:	a6070713          	addi	x14,x14,-1440 # 80101a60 <array_exp.0+0x220>
800031b4:	000d8313          	addi	x6,x27,0
800031b8:	00e12223          	sw	x14,4(x2)
800031bc:	02037713          	andi	x14,x6,32
800031c0:	000b8793          	addi	x15,x23,0
800031c4:	06070a63          	beq	x14,x0,80003238 <_vfiprintf_r+0xec0>
800031c8:	00780813          	addi	x16,x16,7
800031cc:	ff887813          	andi	x16,x16,-8
800031d0:	00082703          	lw	x14,0(x16)
800031d4:	00482583          	lw	x11,4(x16)
800031d8:	00880813          	addi	x16,x16,8
800031dc:	00137693          	andi	x13,x6,1
800031e0:	00068e63          	beq	x13,x0,800031fc <_vfiprintf_r+0xe84>
800031e4:	00b766b3          	or	x13,x14,x11
800031e8:	00068a63          	beq	x13,x0,800031fc <_vfiprintf_r+0xe84>
800031ec:	03000693          	addi	x13,x0,48
800031f0:	02d10e23          	sb	x13,60(x2)
800031f4:	02c10ea3          	sb	x12,61(x2)
800031f8:	00236313          	ori	x6,x6,2
800031fc:	bff37313          	andi	x6,x6,-1025
80003200:	fe8ff06f          	jal	x0,800029e8 <_vfiprintf_r+0x670>
80003204:	000b8793          	addi	x15,x23,0
80003208:	000d8e93          	addi	x29,x27,0
8000320c:	871ff06f          	jal	x0,80002a7c <_vfiprintf_r+0x704>
80003210:	000b8793          	addi	x15,x23,0
80003214:	000d8693          	addi	x13,x27,0
80003218:	921ff06f          	jal	x0,80002b38 <_vfiprintf_r+0x7c0>
8000321c:	80102737          	lui	x14,0x80102
80003220:	a7470713          	addi	x14,x14,-1420 # 80101a74 <array_exp.0+0x234>
80003224:	000d8313          	addi	x6,x27,0
80003228:	00e12223          	sw	x14,4(x2)
8000322c:	02037713          	andi	x14,x6,32
80003230:	000b8793          	addi	x15,x23,0
80003234:	f8071ae3          	bne	x14,x0,800031c8 <_vfiprintf_r+0xe50>
80003238:	01037693          	andi	x13,x6,16
8000323c:	00082703          	lw	x14,0(x16)
80003240:	00480813          	addi	x16,x16,4
80003244:	02069e63          	bne	x13,x0,80003280 <_vfiprintf_r+0xf08>
80003248:	04037693          	andi	x13,x6,64
8000324c:	02068663          	beq	x13,x0,80003278 <_vfiprintf_r+0xf00>
80003250:	01071713          	slli	x14,x14,0x10
80003254:	01075713          	srli	x14,x14,0x10
80003258:	00000593          	addi	x11,x0,0
8000325c:	f81ff06f          	jal	x0,800031dc <_vfiprintf_r+0xe64>
80003260:	000b8513          	addi	x10,x23,0
80003264:	7ac010ef          	jal	x1,80004a10 <strlen>
80003268:	00812303          	lw	x6,8(x2)
8000326c:	00c12783          	lw	x15,12(x2)
80003270:	00050e93          	addi	x29,x10,0
80003274:	e78ff06f          	jal	x0,800028ec <_vfiprintf_r+0x574>
80003278:	20037693          	andi	x13,x6,512
8000327c:	1a069a63          	bne	x13,x0,80003430 <_vfiprintf_r+0x10b8>
80003280:	00000593          	addi	x11,x0,0
80003284:	f59ff06f          	jal	x0,800031dc <_vfiprintf_r+0xe64>
80003288:	40037713          	andi	x14,x6,1024
8000328c:	00000693          	addi	x13,x0,0
80003290:	0f010e93          	addi	x29,x2,240
80003294:	01612423          	sw	x22,8(x2)
80003298:	01a12623          	sw	x26,12(x2)
8000329c:	03912223          	sw	x25,36(x2)
800032a0:	02912423          	sw	x9,40(x2)
800032a4:	01812d03          	lw	x26,24(x2)
800032a8:	00f12823          	sw	x15,16(x2)
800032ac:	00612a23          	sw	x6,20(x2)
800032b0:	00068b13          	addi	x22,x13,0
800032b4:	00070c93          	addi	x25,x14,0
800032b8:	000e8493          	addi	x9,x29,0
800032bc:	03012623          	sw	x16,44(x2)
800032c0:	0280006f          	jal	x0,800032e8 <_vfiprintf_r+0xf70>
800032c4:	00a00613          	addi	x12,x0,10
800032c8:	00000693          	addi	x13,x0,0
800032cc:	00090513          	addi	x10,x18,0
800032d0:	000d8593          	addi	x11,x27,0
800032d4:	248030ef          	jal	x1,8000651c <__udivdi3>
800032d8:	120d8663          	beq	x27,x0,80003404 <_vfiprintf_r+0x108c>
800032dc:	00050913          	addi	x18,x10,0
800032e0:	00058d93          	addi	x27,x11,0
800032e4:	000b8493          	addi	x9,x23,0
800032e8:	00a00613          	addi	x12,x0,10
800032ec:	00000693          	addi	x13,x0,0
800032f0:	00090513          	addi	x10,x18,0
800032f4:	000d8593          	addi	x11,x27,0
800032f8:	7e8030ef          	jal	x1,80006ae0 <__umoddi3>
800032fc:	03050513          	addi	x10,x10,48
80003300:	fea48fa3          	sb	x10,-1(x9)
80003304:	fff48b93          	addi	x23,x9,-1
80003308:	001b0b13          	addi	x22,x22,1
8000330c:	fa0c8ce3          	beq	x25,x0,800032c4 <_vfiprintf_r+0xf4c>
80003310:	000d4783          	lbu	x15,0(x26)
80003314:	fb6798e3          	bne	x15,x22,800032c4 <_vfiprintf_r+0xf4c>
80003318:	0ff00793          	addi	x15,x0,255
8000331c:	fafb04e3          	beq	x22,x15,800032c4 <_vfiprintf_r+0xf4c>
80003320:	0a0d9263          	bne	x27,x0,800033c4 <_vfiprintf_r+0x104c>
80003324:	00900793          	addi	x15,x0,9
80003328:	0927ee63          	bltu	x15,x18,800033c4 <_vfiprintf_r+0x104c>
8000332c:	01a12c23          	sw	x26,24(x2)
80003330:	00812b03          	lw	x22,8(x2)
80003334:	00c12d03          	lw	x26,12(x2)
80003338:	01012783          	lw	x15,16(x2)
8000333c:	01412303          	lw	x6,20(x2)
80003340:	02412c83          	lw	x25,36(x2)
80003344:	02812483          	lw	x9,40(x2)
80003348:	02c12803          	lw	x16,44(x2)
8000334c:	c21ff06f          	jal	x0,80002f6c <_vfiprintf_r+0xbf4>
80003350:	00068313          	addi	x6,x13,0
80003354:	00000693          	addi	x13,x0,0
80003358:	f6068c63          	beq	x13,x0,80002ad0 <_vfiprintf_r+0x758>
8000335c:	bddff06f          	jal	x0,80002f38 <_vfiprintf_r+0xbc0>
80003360:	6e8000ef          	jal	x1,80003a48 <__sinit>
80003364:	850ff06f          	jal	x0,800023b4 <_vfiprintf_r+0x3c>
80003368:	001c4703          	lbu	x14,1(x24)
8000336c:	020ded93          	ori	x27,x27,32
80003370:	001c0c13          	addi	x24,x24,1
80003374:	980ff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>
80003378:	001c4703          	lbu	x14,1(x24)
8000337c:	200ded93          	ori	x27,x27,512
80003380:	001c0c13          	addi	x24,x24,1
80003384:	970ff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>
80003388:	00082703          	lw	x14,0(x16)
8000338c:	00480813          	addi	x16,x16,4
80003390:	01972023          	sw	x25,0(x14)
80003394:	8dcff06f          	jal	x0,80002470 <_vfiprintf_r+0xf8>
80003398:	00600713          	addi	x14,x0,6
8000339c:	000d0e93          	addi	x29,x26,0
800033a0:	07a76863          	bltu	x14,x26,80003410 <_vfiprintf_r+0x1098>
800033a4:	80102bb7          	lui	x23,0x80102
800033a8:	000e8d93          	addi	x27,x29,0
800033ac:	00090813          	addi	x16,x18,0
800033b0:	a88b8b93          	addi	x23,x23,-1400 # 80101a88 <array_exp.0+0x248>
800033b4:	9b8ff06f          	jal	x0,8000256c <_vfiprintf_r+0x1f4>
800033b8:	00000713          	addi	x14,x0,0
800033bc:	00000593          	addi	x11,x0,0
800033c0:	b79ff06f          	jal	x0,80002f38 <_vfiprintf_r+0xbc0>
800033c4:	01c12783          	lw	x15,28(x2)
800033c8:	02012583          	lw	x11,32(x2)
800033cc:	00000b13          	addi	x22,x0,0
800033d0:	40fb8bb3          	sub	x23,x23,x15
800033d4:	00078613          	addi	x12,x15,0
800033d8:	000b8513          	addi	x10,x23,0
800033dc:	04c010ef          	jal	x1,80004428 <strncpy>
800033e0:	001d4783          	lbu	x15,1(x26)
800033e4:	00a00613          	addi	x12,x0,10
800033e8:	00000693          	addi	x13,x0,0
800033ec:	00f037b3          	sltu	x15,x0,x15
800033f0:	00090513          	addi	x10,x18,0
800033f4:	000d8593          	addi	x11,x27,0
800033f8:	00fd0d33          	add	x26,x26,x15
800033fc:	120030ef          	jal	x1,8000651c <__udivdi3>
80003400:	eddff06f          	jal	x0,800032dc <_vfiprintf_r+0xf64>
80003404:	00900793          	addi	x15,x0,9
80003408:	ed27eae3          	bltu	x15,x18,800032dc <_vfiprintf_r+0xf64>
8000340c:	f21ff06f          	jal	x0,8000332c <_vfiprintf_r+0xfb4>
80003410:	00600e93          	addi	x29,x0,6
80003414:	f91ff06f          	jal	x0,800033a4 <_vfiprintf_r+0x102c>
80003418:	0ff77713          	andi	x14,x14,255
8000341c:	00000593          	addi	x11,x0,0
80003420:	f34ff06f          	jal	x0,80002b54 <_vfiprintf_r+0x7dc>
80003424:	0ff77913          	andi	x18,x14,255
80003428:	00000d93          	addi	x27,x0,0
8000342c:	e6cff06f          	jal	x0,80002a98 <_vfiprintf_r+0x720>
80003430:	0ff77713          	andi	x14,x14,255
80003434:	00000593          	addi	x11,x0,0
80003438:	da5ff06f          	jal	x0,800031dc <_vfiprintf_r+0xe64>
8000343c:	00082703          	lw	x14,0(x16)
80003440:	00480813          	addi	x16,x16,4
80003444:	01971023          	sh	x25,0(x14)
80003448:	828ff06f          	jal	x0,80002470 <_vfiprintf_r+0xf8>
8000344c:	01871913          	slli	x18,x14,0x18
80003450:	41895913          	srai	x18,x18,0x18
80003454:	41f95d93          	srai	x27,x18,0x1f
80003458:	000d8693          	addi	x13,x27,0
8000345c:	d18ff06f          	jal	x0,80002974 <_vfiprintf_r+0x5fc>
80003460:	03000713          	addi	x14,x0,48
80003464:	f88ff06f          	jal	x0,80002bec <_vfiprintf_r+0x874>
80003468:	fff00b13          	addi	x22,x0,-1
8000346c:	afcff06f          	jal	x0,80002768 <_vfiprintf_r+0x3f0>
80003470:	00082d03          	lw	x26,0(x16)
80003474:	00480813          	addi	x16,x16,4
80003478:	000d5463          	bge	x26,x0,80003480 <_vfiprintf_r+0x1108>
8000347c:	fff00d13          	addi	x26,x0,-1
80003480:	001c4703          	lbu	x14,1(x24)
80003484:	00058c13          	addi	x24,x11,0
80003488:	86cff06f          	jal	x0,800024f4 <_vfiprintf_r+0x17c>

8000348c <__sbprintf>:
8000348c:	b8010113          	addi	x2,x2,-1152
80003490:	00c59783          	lh	x15,12(x11)
80003494:	00e5d703          	lhu	x14,14(x11)
80003498:	46812c23          	sw	x8,1144(x2)
8000349c:	00058413          	addi	x8,x11,0
800034a0:	000105b7          	lui	x11,0x10
800034a4:	ffd58593          	addi	x11,x11,-3 # fffd <_stack_size+0xeffd>
800034a8:	06442e03          	lw	x28,100(x8)
800034ac:	01c42303          	lw	x6,28(x8)
800034b0:	02442883          	lw	x17,36(x8)
800034b4:	01071713          	slli	x14,x14,0x10
800034b8:	00b7f7b3          	and	x15,x15,x11
800034bc:	00e7e7b3          	or	x15,x15,x14
800034c0:	40000813          	addi	x16,x0,1024
800034c4:	00f12a23          	sw	x15,20(x2)
800034c8:	00810593          	addi	x11,x2,8
800034cc:	07010793          	addi	x15,x2,112
800034d0:	46912a23          	sw	x9,1140(x2)
800034d4:	47212823          	sw	x18,1136(x2)
800034d8:	46112e23          	sw	x1,1148(x2)
800034dc:	00050913          	addi	x18,x10,0
800034e0:	07c12623          	sw	x28,108(x2)
800034e4:	02612223          	sw	x6,36(x2)
800034e8:	03112623          	sw	x17,44(x2)
800034ec:	00f12423          	sw	x15,8(x2)
800034f0:	00f12c23          	sw	x15,24(x2)
800034f4:	01012823          	sw	x16,16(x2)
800034f8:	01012e23          	sw	x16,28(x2)
800034fc:	02012023          	sw	x0,32(x2)
80003500:	e79fe0ef          	jal	x1,80002378 <_vfiprintf_r>
80003504:	00050493          	addi	x9,x10,0
80003508:	02055c63          	bge	x10,x0,80003540 <__sbprintf+0xb4>
8000350c:	01415783          	lhu	x15,20(x2)
80003510:	0407f793          	andi	x15,x15,64
80003514:	00078863          	beq	x15,x0,80003524 <__sbprintf+0x98>
80003518:	00c45783          	lhu	x15,12(x8)
8000351c:	0407e793          	ori	x15,x15,64
80003520:	00f41623          	sh	x15,12(x8)
80003524:	47c12083          	lw	x1,1148(x2)
80003528:	47812403          	lw	x8,1144(x2)
8000352c:	47012903          	lw	x18,1136(x2)
80003530:	00048513          	addi	x10,x9,0
80003534:	47412483          	lw	x9,1140(x2)
80003538:	48010113          	addi	x2,x2,1152
8000353c:	00008067          	jalr	x0,0(x1)
80003540:	00810593          	addi	x11,x2,8
80003544:	00090513          	addi	x10,x18,0
80003548:	2a8000ef          	jal	x1,800037f0 <_fflush_r>
8000354c:	fc0500e3          	beq	x10,x0,8000350c <__sbprintf+0x80>
80003550:	fff00493          	addi	x9,x0,-1
80003554:	fb9ff06f          	jal	x0,8000350c <__sbprintf+0x80>

80003558 <__sprint_r>:
80003558:	00862783          	lw	x15,8(x12)
8000355c:	ff010113          	addi	x2,x2,-16
80003560:	00812423          	sw	x8,8(x2)
80003564:	00112623          	sw	x1,12(x2)
80003568:	00060413          	addi	x8,x12,0
8000356c:	00079e63          	bne	x15,x0,80003588 <__sprint_r+0x30>
80003570:	00c12083          	lw	x1,12(x2)
80003574:	00042223          	sw	x0,4(x8)
80003578:	00812403          	lw	x8,8(x2)
8000357c:	00000513          	addi	x10,x0,0
80003580:	01010113          	addi	x2,x2,16
80003584:	00008067          	jalr	x0,0(x1)
80003588:	4f0000ef          	jal	x1,80003a78 <__sfvwrite_r>
8000358c:	00c12083          	lw	x1,12(x2)
80003590:	00042423          	sw	x0,8(x8)
80003594:	00042223          	sw	x0,4(x8)
80003598:	00812403          	lw	x8,8(x2)
8000359c:	01010113          	addi	x2,x2,16
800035a0:	00008067          	jalr	x0,0(x1)

800035a4 <__sflush_r>:
800035a4:	00c59703          	lh	x14,12(x11)
800035a8:	fe010113          	addi	x2,x2,-32
800035ac:	00812c23          	sw	x8,24(x2)
800035b0:	01312623          	sw	x19,12(x2)
800035b4:	00112e23          	sw	x1,28(x2)
800035b8:	00877793          	andi	x15,x14,8
800035bc:	00058413          	addi	x8,x11,0
800035c0:	00050993          	addi	x19,x10,0
800035c4:	12079063          	bne	x15,x0,800036e4 <__sflush_r+0x140>
800035c8:	000017b7          	lui	x15,0x1
800035cc:	80078793          	addi	x15,x15,-2048 # 800 <_heap_size+0x800>
800035d0:	0045a683          	lw	x13,4(x11)
800035d4:	00f767b3          	or	x15,x14,x15
800035d8:	00f59623          	sh	x15,12(x11)
800035dc:	18d05263          	bge	x0,x13,80003760 <__sflush_r+0x1bc>
800035e0:	02842803          	lw	x16,40(x8)
800035e4:	0e080463          	beq	x16,x0,800036cc <__sflush_r+0x128>
800035e8:	00912a23          	sw	x9,20(x2)
800035ec:	01371693          	slli	x13,x14,0x13
800035f0:	0009a483          	lw	x9,0(x19)
800035f4:	0009a023          	sw	x0,0(x19)
800035f8:	01c42583          	lw	x11,28(x8)
800035fc:	1606ce63          	blt	x13,x0,80003778 <__sflush_r+0x1d4>
80003600:	00000613          	addi	x12,x0,0
80003604:	00100693          	addi	x13,x0,1
80003608:	00098513          	addi	x10,x19,0
8000360c:	000800e7          	jalr	x1,0(x16)
80003610:	fff00793          	addi	x15,x0,-1
80003614:	00050613          	addi	x12,x10,0
80003618:	1af50463          	beq	x10,x15,800037c0 <__sflush_r+0x21c>
8000361c:	00c41783          	lh	x15,12(x8)
80003620:	02842803          	lw	x16,40(x8)
80003624:	01c42583          	lw	x11,28(x8)
80003628:	0047f793          	andi	x15,x15,4
8000362c:	00078e63          	beq	x15,x0,80003648 <__sflush_r+0xa4>
80003630:	00442703          	lw	x14,4(x8)
80003634:	03042783          	lw	x15,48(x8)
80003638:	40e60633          	sub	x12,x12,x14
8000363c:	00078663          	beq	x15,x0,80003648 <__sflush_r+0xa4>
80003640:	03c42783          	lw	x15,60(x8)
80003644:	40f60633          	sub	x12,x12,x15
80003648:	00000693          	addi	x13,x0,0
8000364c:	00098513          	addi	x10,x19,0
80003650:	000800e7          	jalr	x1,0(x16)
80003654:	fff00793          	addi	x15,x0,-1
80003658:	12f51463          	bne	x10,x15,80003780 <__sflush_r+0x1dc>
8000365c:	0009a683          	lw	x13,0(x19)
80003660:	01d00793          	addi	x15,x0,29
80003664:	00c41703          	lh	x14,12(x8)
80003668:	16d7ea63          	bltu	x15,x13,800037dc <__sflush_r+0x238>
8000366c:	204007b7          	lui	x15,0x20400
80003670:	00178793          	addi	x15,x15,1 # 20400001 <SYSCALL_ADDR+0x1e3f0001>
80003674:	00d7d7b3          	srl	x15,x15,x13
80003678:	0017f793          	andi	x15,x15,1
8000367c:	16078063          	beq	x15,x0,800037dc <__sflush_r+0x238>
80003680:	01042603          	lw	x12,16(x8)
80003684:	fffff7b7          	lui	x15,0xfffff
80003688:	7ff78793          	addi	x15,x15,2047 # fffff7ff <_end+0x7fefa64f>
8000368c:	00f777b3          	and	x15,x14,x15
80003690:	00f41623          	sh	x15,12(x8)
80003694:	00042223          	sw	x0,4(x8)
80003698:	00c42023          	sw	x12,0(x8)
8000369c:	01371793          	slli	x15,x14,0x13
800036a0:	0007d463          	bge	x15,x0,800036a8 <__sflush_r+0x104>
800036a4:	10068263          	beq	x13,x0,800037a8 <__sflush_r+0x204>
800036a8:	03042583          	lw	x11,48(x8)
800036ac:	0099a023          	sw	x9,0(x19)
800036b0:	10058463          	beq	x11,x0,800037b8 <__sflush_r+0x214>
800036b4:	04040793          	addi	x15,x8,64
800036b8:	00f58663          	beq	x11,x15,800036c4 <__sflush_r+0x120>
800036bc:	00098513          	addi	x10,x19,0
800036c0:	538010ef          	jal	x1,80004bf8 <_free_r>
800036c4:	01412483          	lw	x9,20(x2)
800036c8:	02042823          	sw	x0,48(x8)
800036cc:	00000513          	addi	x10,x0,0
800036d0:	01c12083          	lw	x1,28(x2)
800036d4:	01812403          	lw	x8,24(x2)
800036d8:	00c12983          	lw	x19,12(x2)
800036dc:	02010113          	addi	x2,x2,32
800036e0:	00008067          	jalr	x0,0(x1)
800036e4:	01212823          	sw	x18,16(x2)
800036e8:	0105a903          	lw	x18,16(x11)
800036ec:	08090263          	beq	x18,x0,80003770 <__sflush_r+0x1cc>
800036f0:	00912a23          	sw	x9,20(x2)
800036f4:	0005a483          	lw	x9,0(x11)
800036f8:	00377713          	andi	x14,x14,3
800036fc:	0125a023          	sw	x18,0(x11)
80003700:	412484b3          	sub	x9,x9,x18
80003704:	00000793          	addi	x15,x0,0
80003708:	00071463          	bne	x14,x0,80003710 <__sflush_r+0x16c>
8000370c:	0145a783          	lw	x15,20(x11)
80003710:	00f42423          	sw	x15,8(x8)
80003714:	00904863          	blt	x0,x9,80003724 <__sflush_r+0x180>
80003718:	0540006f          	jal	x0,8000376c <__sflush_r+0x1c8>
8000371c:	00a90933          	add	x18,x18,x10
80003720:	04905663          	bge	x0,x9,8000376c <__sflush_r+0x1c8>
80003724:	02442783          	lw	x15,36(x8)
80003728:	01c42583          	lw	x11,28(x8)
8000372c:	00048693          	addi	x13,x9,0
80003730:	00090613          	addi	x12,x18,0
80003734:	00098513          	addi	x10,x19,0
80003738:	000780e7          	jalr	x1,0(x15)
8000373c:	40a484b3          	sub	x9,x9,x10
80003740:	fca04ee3          	blt	x0,x10,8000371c <__sflush_r+0x178>
80003744:	00c41703          	lh	x14,12(x8)
80003748:	01012903          	lw	x18,16(x2)
8000374c:	04076713          	ori	x14,x14,64
80003750:	01412483          	lw	x9,20(x2)
80003754:	00e41623          	sh	x14,12(x8)
80003758:	fff00513          	addi	x10,x0,-1
8000375c:	f75ff06f          	jal	x0,800036d0 <__sflush_r+0x12c>
80003760:	03c5a683          	lw	x13,60(x11)
80003764:	e6d04ee3          	blt	x0,x13,800035e0 <__sflush_r+0x3c>
80003768:	f65ff06f          	jal	x0,800036cc <__sflush_r+0x128>
8000376c:	01412483          	lw	x9,20(x2)
80003770:	01012903          	lw	x18,16(x2)
80003774:	f59ff06f          	jal	x0,800036cc <__sflush_r+0x128>
80003778:	05042603          	lw	x12,80(x8)
8000377c:	eadff06f          	jal	x0,80003628 <__sflush_r+0x84>
80003780:	00c41703          	lh	x14,12(x8)
80003784:	01042683          	lw	x13,16(x8)
80003788:	fffff7b7          	lui	x15,0xfffff
8000378c:	7ff78793          	addi	x15,x15,2047 # fffff7ff <_end+0x7fefa64f>
80003790:	00f777b3          	and	x15,x14,x15
80003794:	00f41623          	sh	x15,12(x8)
80003798:	00042223          	sw	x0,4(x8)
8000379c:	00d42023          	sw	x13,0(x8)
800037a0:	01371793          	slli	x15,x14,0x13
800037a4:	f007d2e3          	bge	x15,x0,800036a8 <__sflush_r+0x104>
800037a8:	03042583          	lw	x11,48(x8)
800037ac:	04a42823          	sw	x10,80(x8)
800037b0:	0099a023          	sw	x9,0(x19)
800037b4:	f00590e3          	bne	x11,x0,800036b4 <__sflush_r+0x110>
800037b8:	01412483          	lw	x9,20(x2)
800037bc:	f11ff06f          	jal	x0,800036cc <__sflush_r+0x128>
800037c0:	0009a783          	lw	x15,0(x19)
800037c4:	e4078ce3          	beq	x15,x0,8000361c <__sflush_r+0x78>
800037c8:	01d00713          	addi	x14,x0,29
800037cc:	00e78c63          	beq	x15,x14,800037e4 <__sflush_r+0x240>
800037d0:	01600713          	addi	x14,x0,22
800037d4:	00e78863          	beq	x15,x14,800037e4 <__sflush_r+0x240>
800037d8:	00c41703          	lh	x14,12(x8)
800037dc:	04076713          	ori	x14,x14,64
800037e0:	f71ff06f          	jal	x0,80003750 <__sflush_r+0x1ac>
800037e4:	0099a023          	sw	x9,0(x19)
800037e8:	01412483          	lw	x9,20(x2)
800037ec:	ee1ff06f          	jal	x0,800036cc <__sflush_r+0x128>

800037f0 <_fflush_r>:
800037f0:	fe010113          	addi	x2,x2,-32
800037f4:	00812c23          	sw	x8,24(x2)
800037f8:	00112e23          	sw	x1,28(x2)
800037fc:	00050413          	addi	x8,x10,0
80003800:	00050663          	beq	x10,x0,8000380c <_fflush_r+0x1c>
80003804:	03452783          	lw	x15,52(x10)
80003808:	02078a63          	beq	x15,x0,8000383c <_fflush_r+0x4c>
8000380c:	00c59783          	lh	x15,12(x11)
80003810:	00079c63          	bne	x15,x0,80003828 <_fflush_r+0x38>
80003814:	01c12083          	lw	x1,28(x2)
80003818:	01812403          	lw	x8,24(x2)
8000381c:	00000513          	addi	x10,x0,0
80003820:	02010113          	addi	x2,x2,32
80003824:	00008067          	jalr	x0,0(x1)
80003828:	00040513          	addi	x10,x8,0
8000382c:	01812403          	lw	x8,24(x2)
80003830:	01c12083          	lw	x1,28(x2)
80003834:	02010113          	addi	x2,x2,32
80003838:	d6dff06f          	jal	x0,800035a4 <__sflush_r>
8000383c:	00b12623          	sw	x11,12(x2)
80003840:	208000ef          	jal	x1,80003a48 <__sinit>
80003844:	00c12583          	lw	x11,12(x2)
80003848:	fc5ff06f          	jal	x0,8000380c <_fflush_r+0x1c>

8000384c <stdio_exit_handler>:
8000384c:	80101637          	lui	x12,0x80101
80003850:	800065b7          	lui	x11,0x80006
80003854:	80101537          	lui	x10,0x80101
80003858:	00060613          	addi	x12,x12,0 # 80101000 <__sglue>
8000385c:	c5058593          	addi	x11,x11,-944 # 80005c50 <_fclose_r>
80003860:	01050513          	addi	x10,x10,16 # 80101010 <_impure_data>
80003864:	7280006f          	jal	x0,80003f8c <_fwalk_sglue>

80003868 <cleanup_stdio>:
80003868:	00452583          	lw	x11,4(x10)
8000386c:	ff010113          	addi	x2,x2,-16
80003870:	801047b7          	lui	x15,0x80104
80003874:	00812423          	sw	x8,8(x2)
80003878:	00112623          	sw	x1,12(x2)
8000387c:	02078793          	addi	x15,x15,32 # 80104020 <__sf>
80003880:	00050413          	addi	x8,x10,0
80003884:	00f58463          	beq	x11,x15,8000388c <cleanup_stdio+0x24>
80003888:	3c8020ef          	jal	x1,80005c50 <_fclose_r>
8000388c:	00842583          	lw	x11,8(x8)
80003890:	801047b7          	lui	x15,0x80104
80003894:	08878793          	addi	x15,x15,136 # 80104088 <__sf+0x68>
80003898:	00f58663          	beq	x11,x15,800038a4 <cleanup_stdio+0x3c>
8000389c:	00040513          	addi	x10,x8,0
800038a0:	3b0020ef          	jal	x1,80005c50 <_fclose_r>
800038a4:	00c42583          	lw	x11,12(x8)
800038a8:	801047b7          	lui	x15,0x80104
800038ac:	0f078793          	addi	x15,x15,240 # 801040f0 <__sf+0xd0>
800038b0:	00f58c63          	beq	x11,x15,800038c8 <cleanup_stdio+0x60>
800038b4:	00040513          	addi	x10,x8,0
800038b8:	00812403          	lw	x8,8(x2)
800038bc:	00c12083          	lw	x1,12(x2)
800038c0:	01010113          	addi	x2,x2,16
800038c4:	38c0206f          	jal	x0,80005c50 <_fclose_r>
800038c8:	00c12083          	lw	x1,12(x2)
800038cc:	00812403          	lw	x8,8(x2)
800038d0:	01010113          	addi	x2,x2,16
800038d4:	00008067          	jalr	x0,0(x1)

800038d8 <global_stdio_init.part.0>:
800038d8:	fe010113          	addi	x2,x2,-32
800038dc:	800047b7          	lui	x15,0x80004
800038e0:	00812c23          	sw	x8,24(x2)
800038e4:	80104737          	lui	x14,0x80104
800038e8:	84c78793          	addi	x15,x15,-1972 # 8000384c <stdio_exit_handler>
800038ec:	80104437          	lui	x8,0x80104
800038f0:	80104537          	lui	x10,0x80104
800038f4:	02040413          	addi	x8,x8,32 # 80104020 <__sf>
800038f8:	00112e23          	sw	x1,28(x2)
800038fc:	00912a23          	sw	x9,20(x2)
80003900:	01212823          	sw	x18,16(x2)
80003904:	01312623          	sw	x19,12(x2)
80003908:	01412423          	sw	x20,8(x2)
8000390c:	18f72a23          	sw	x15,404(x14) # 80104194 <__stdio_exit_handler>
80003910:	00800613          	addi	x12,x0,8
80003914:	00400793          	addi	x15,x0,4
80003918:	00000593          	addi	x11,x0,0
8000391c:	07c50513          	addi	x10,x10,124 # 8010407c <__sf+0x5c>
80003920:	00f42623          	sw	x15,12(x8)
80003924:	00042023          	sw	x0,0(x8)
80003928:	00042223          	sw	x0,4(x8)
8000392c:	00042423          	sw	x0,8(x8)
80003930:	06042223          	sw	x0,100(x8)
80003934:	00042823          	sw	x0,16(x8)
80003938:	00042a23          	sw	x0,20(x8)
8000393c:	00042c23          	sw	x0,24(x8)
80003940:	651000ef          	jal	x1,80004790 <memset>
80003944:	000107b7          	lui	x15,0x10
80003948:	80004a37          	lui	x20,0x80004
8000394c:	800049b7          	lui	x19,0x80004
80003950:	80004937          	lui	x18,0x80004
80003954:	800044b7          	lui	x9,0x80004
80003958:	80104537          	lui	x10,0x80104
8000395c:	040a0a13          	addi	x20,x20,64 # 80004040 <__sread>
80003960:	09c98993          	addi	x19,x19,156 # 8000409c <__swrite>
80003964:	12490913          	addi	x18,x18,292 # 80004124 <__sseek>
80003968:	19c48493          	addi	x9,x9,412 # 8000419c <__sclose>
8000396c:	00978793          	addi	x15,x15,9 # 10009 <_stack_size+0xf009>
80003970:	00800613          	addi	x12,x0,8
80003974:	00000593          	addi	x11,x0,0
80003978:	0e450513          	addi	x10,x10,228 # 801040e4 <__sf+0xc4>
8000397c:	03442023          	sw	x20,32(x8)
80003980:	03342223          	sw	x19,36(x8)
80003984:	03242423          	sw	x18,40(x8)
80003988:	02942623          	sw	x9,44(x8)
8000398c:	06f42a23          	sw	x15,116(x8)
80003990:	00842e23          	sw	x8,28(x8)
80003994:	06042423          	sw	x0,104(x8)
80003998:	06042623          	sw	x0,108(x8)
8000399c:	06042823          	sw	x0,112(x8)
800039a0:	0c042623          	sw	x0,204(x8)
800039a4:	06042c23          	sw	x0,120(x8)
800039a8:	06042e23          	sw	x0,124(x8)
800039ac:	08042023          	sw	x0,128(x8)
800039b0:	5e1000ef          	jal	x1,80004790 <memset>
800039b4:	000207b7          	lui	x15,0x20
800039b8:	80104537          	lui	x10,0x80104
800039bc:	80104737          	lui	x14,0x80104
800039c0:	01278793          	addi	x15,x15,18 # 20012 <_stack_size+0x1f012>
800039c4:	08870713          	addi	x14,x14,136 # 80104088 <__sf+0x68>
800039c8:	00800613          	addi	x12,x0,8
800039cc:	00000593          	addi	x11,x0,0
800039d0:	14c50513          	addi	x10,x10,332 # 8010414c <__sf+0x12c>
800039d4:	09442423          	sw	x20,136(x8)
800039d8:	09342623          	sw	x19,140(x8)
800039dc:	09242823          	sw	x18,144(x8)
800039e0:	08942a23          	sw	x9,148(x8)
800039e4:	0cf42e23          	sw	x15,220(x8)
800039e8:	08e42223          	sw	x14,132(x8)
800039ec:	0c042823          	sw	x0,208(x8)
800039f0:	0c042a23          	sw	x0,212(x8)
800039f4:	0c042c23          	sw	x0,216(x8)
800039f8:	12042a23          	sw	x0,308(x8)
800039fc:	0e042023          	sw	x0,224(x8)
80003a00:	0e042223          	sw	x0,228(x8)
80003a04:	0e042423          	sw	x0,232(x8)
80003a08:	589000ef          	jal	x1,80004790 <memset>
80003a0c:	801047b7          	lui	x15,0x80104
80003a10:	0f078793          	addi	x15,x15,240 # 801040f0 <__sf+0xd0>
80003a14:	0f442823          	sw	x20,240(x8)
80003a18:	0f342a23          	sw	x19,244(x8)
80003a1c:	0f242c23          	sw	x18,248(x8)
80003a20:	0e942e23          	sw	x9,252(x8)
80003a24:	01c12083          	lw	x1,28(x2)
80003a28:	0ef42623          	sw	x15,236(x8)
80003a2c:	01812403          	lw	x8,24(x2)
80003a30:	01412483          	lw	x9,20(x2)
80003a34:	01012903          	lw	x18,16(x2)
80003a38:	00c12983          	lw	x19,12(x2)
80003a3c:	00812a03          	lw	x20,8(x2)
80003a40:	02010113          	addi	x2,x2,32
80003a44:	00008067          	jalr	x0,0(x1)

80003a48 <__sinit>:
80003a48:	03452783          	lw	x15,52(x10)
80003a4c:	00078463          	beq	x15,x0,80003a54 <__sinit+0xc>
80003a50:	00008067          	jalr	x0,0(x1)
80003a54:	801047b7          	lui	x15,0x80104
80003a58:	1947a703          	lw	x14,404(x15) # 80104194 <__stdio_exit_handler>
80003a5c:	800047b7          	lui	x15,0x80004
80003a60:	86878793          	addi	x15,x15,-1944 # 80003868 <cleanup_stdio>
80003a64:	02f52a23          	sw	x15,52(x10)
80003a68:	fe0714e3          	bne	x14,x0,80003a50 <__sinit+0x8>
80003a6c:	e6dff06f          	jal	x0,800038d8 <global_stdio_init.part.0>

80003a70 <__sfp_lock_acquire>:
80003a70:	00008067          	jalr	x0,0(x1)

80003a74 <__sfp_lock_release>:
80003a74:	00008067          	jalr	x0,0(x1)

80003a78 <__sfvwrite_r>:
80003a78:	00862783          	lw	x15,8(x12)
80003a7c:	2c078463          	beq	x15,x0,80003d44 <__sfvwrite_r+0x2cc>
80003a80:	00c59683          	lh	x13,12(x11)
80003a84:	fd010113          	addi	x2,x2,-48
80003a88:	02812423          	sw	x8,40(x2)
80003a8c:	01412c23          	sw	x20,24(x2)
80003a90:	01612823          	sw	x22,16(x2)
80003a94:	02112623          	sw	x1,44(x2)
80003a98:	0086f793          	andi	x15,x13,8
80003a9c:	00060b13          	addi	x22,x12,0
80003aa0:	00050a13          	addi	x20,x10,0
80003aa4:	00058413          	addi	x8,x11,0
80003aa8:	08078e63          	beq	x15,x0,80003b44 <__sfvwrite_r+0xcc>
80003aac:	0105a783          	lw	x15,16(x11)
80003ab0:	08078a63          	beq	x15,x0,80003b44 <__sfvwrite_r+0xcc>
80003ab4:	02912223          	sw	x9,36(x2)
80003ab8:	03212023          	sw	x18,32(x2)
80003abc:	01312e23          	sw	x19,28(x2)
80003ac0:	01512a23          	sw	x21,20(x2)
80003ac4:	0026f793          	andi	x15,x13,2
80003ac8:	000b2483          	lw	x9,0(x22)
80003acc:	0a078463          	beq	x15,x0,80003b74 <__sfvwrite_r+0xfc>
80003ad0:	02442783          	lw	x15,36(x8)
80003ad4:	01c42583          	lw	x11,28(x8)
80003ad8:	80000ab7          	lui	x21,0x80000
80003adc:	00000993          	addi	x19,x0,0
80003ae0:	00000913          	addi	x18,x0,0
80003ae4:	c00a8a93          	addi	x21,x21,-1024 # 7ffffc00 <SYSCALL_ADDR+0x7dfefc00>
80003ae8:	00098613          	addi	x12,x19,0
80003aec:	000a0513          	addi	x10,x20,0
80003af0:	04090263          	beq	x18,x0,80003b34 <__sfvwrite_r+0xbc>
80003af4:	00090693          	addi	x13,x18,0
80003af8:	012af463          	bgeu	x21,x18,80003b00 <__sfvwrite_r+0x88>
80003afc:	000a8693          	addi	x13,x21,0
80003b00:	000780e7          	jalr	x1,0(x15)
80003b04:	46a05263          	bge	x0,x10,80003f68 <__sfvwrite_r+0x4f0>
80003b08:	008b2783          	lw	x15,8(x22)
80003b0c:	00a989b3          	add	x19,x19,x10
80003b10:	40a90933          	sub	x18,x18,x10
80003b14:	40a787b3          	sub	x15,x15,x10
80003b18:	00fb2423          	sw	x15,8(x22)
80003b1c:	1a078663          	beq	x15,x0,80003cc8 <__sfvwrite_r+0x250>
80003b20:	02442783          	lw	x15,36(x8)
80003b24:	01c42583          	lw	x11,28(x8)
80003b28:	00098613          	addi	x12,x19,0
80003b2c:	000a0513          	addi	x10,x20,0
80003b30:	fc0912e3          	bne	x18,x0,80003af4 <__sfvwrite_r+0x7c>
80003b34:	0004a983          	lw	x19,0(x9)
80003b38:	0044a903          	lw	x18,4(x9)
80003b3c:	00848493          	addi	x9,x9,8
80003b40:	fa9ff06f          	jal	x0,80003ae8 <__sfvwrite_r+0x70>
80003b44:	00040593          	addi	x11,x8,0
80003b48:	000a0513          	addi	x10,x20,0
80003b4c:	658000ef          	jal	x1,800041a4 <__swsetup_r>
80003b50:	1c051c63          	bne	x10,x0,80003d28 <__sfvwrite_r+0x2b0>
80003b54:	00c41683          	lh	x13,12(x8)
80003b58:	02912223          	sw	x9,36(x2)
80003b5c:	03212023          	sw	x18,32(x2)
80003b60:	01312e23          	sw	x19,28(x2)
80003b64:	01512a23          	sw	x21,20(x2)
80003b68:	0026f793          	andi	x15,x13,2
80003b6c:	000b2483          	lw	x9,0(x22)
80003b70:	f60790e3          	bne	x15,x0,80003ad0 <__sfvwrite_r+0x58>
80003b74:	01712623          	sw	x23,12(x2)
80003b78:	01812423          	sw	x24,8(x2)
80003b7c:	0016f793          	andi	x15,x13,1
80003b80:	1c079663          	bne	x15,x0,80003d4c <__sfvwrite_r+0x2d4>
80003b84:	00042783          	lw	x15,0(x8)
80003b88:	00842703          	lw	x14,8(x8)
80003b8c:	80000ab7          	lui	x21,0x80000
80003b90:	01912223          	sw	x25,4(x2)
80003b94:	00000b93          	addi	x23,x0,0
80003b98:	00000993          	addi	x19,x0,0
80003b9c:	fffa8a93          	addi	x21,x21,-1 # 7fffffff <SYSCALL_ADDR+0x7dfeffff>
80003ba0:	00078513          	addi	x10,x15,0
80003ba4:	00070c13          	addi	x24,x14,0
80003ba8:	10098263          	beq	x19,x0,80003cac <__sfvwrite_r+0x234>
80003bac:	2006f613          	andi	x12,x13,512
80003bb0:	28060863          	beq	x12,x0,80003e40 <__sfvwrite_r+0x3c8>
80003bb4:	00070c93          	addi	x25,x14,0
80003bb8:	32e9e863          	bltu	x19,x14,80003ee8 <__sfvwrite_r+0x470>
80003bbc:	4806f713          	andi	x14,x13,1152
80003bc0:	08070a63          	beq	x14,x0,80003c54 <__sfvwrite_r+0x1dc>
80003bc4:	01442603          	lw	x12,20(x8)
80003bc8:	01042583          	lw	x11,16(x8)
80003bcc:	00161713          	slli	x14,x12,0x1
80003bd0:	00c70733          	add	x14,x14,x12
80003bd4:	40b78933          	sub	x18,x15,x11
80003bd8:	01f75c13          	srli	x24,x14,0x1f
80003bdc:	00ec0c33          	add	x24,x24,x14
80003be0:	00190793          	addi	x15,x18,1
80003be4:	401c5c13          	srai	x24,x24,0x1
80003be8:	013787b3          	add	x15,x15,x19
80003bec:	000c0613          	addi	x12,x24,0
80003bf0:	00fc7663          	bgeu	x24,x15,80003bfc <__sfvwrite_r+0x184>
80003bf4:	00078c13          	addi	x24,x15,0
80003bf8:	00078613          	addi	x12,x15,0
80003bfc:	4006f693          	andi	x13,x13,1024
80003c00:	32068063          	beq	x13,x0,80003f20 <__sfvwrite_r+0x4a8>
80003c04:	00060593          	addi	x11,x12,0
80003c08:	000a0513          	addi	x10,x20,0
80003c0c:	2f8010ef          	jal	x1,80004f04 <_malloc_r>
80003c10:	00050c93          	addi	x25,x10,0
80003c14:	34050e63          	beq	x10,x0,80003f70 <__sfvwrite_r+0x4f8>
80003c18:	01042583          	lw	x11,16(x8)
80003c1c:	00090613          	addi	x12,x18,0
80003c20:	44d000ef          	jal	x1,8000486c <memcpy>
80003c24:	00c45783          	lhu	x15,12(x8)
80003c28:	b7f7f793          	andi	x15,x15,-1153
80003c2c:	0807e793          	ori	x15,x15,128
80003c30:	00f41623          	sh	x15,12(x8)
80003c34:	012c8533          	add	x10,x25,x18
80003c38:	412c07b3          	sub	x15,x24,x18
80003c3c:	01942823          	sw	x25,16(x8)
80003c40:	01842a23          	sw	x24,20(x8)
80003c44:	00a42023          	sw	x10,0(x8)
80003c48:	00098c13          	addi	x24,x19,0
80003c4c:	00f42423          	sw	x15,8(x8)
80003c50:	00098c93          	addi	x25,x19,0
80003c54:	000c8613          	addi	x12,x25,0
80003c58:	000b8593          	addi	x11,x23,0
80003c5c:	229000ef          	jal	x1,80004684 <memmove>
80003c60:	00842703          	lw	x14,8(x8)
80003c64:	00042783          	lw	x15,0(x8)
80003c68:	00098913          	addi	x18,x19,0
80003c6c:	41870733          	sub	x14,x14,x24
80003c70:	019787b3          	add	x15,x15,x25
80003c74:	00e42423          	sw	x14,8(x8)
80003c78:	00f42023          	sw	x15,0(x8)
80003c7c:	00000993          	addi	x19,x0,0
80003c80:	008b2783          	lw	x15,8(x22)
80003c84:	012b8bb3          	add	x23,x23,x18
80003c88:	412787b3          	sub	x15,x15,x18
80003c8c:	00fb2423          	sw	x15,8(x22)
80003c90:	02078663          	beq	x15,x0,80003cbc <__sfvwrite_r+0x244>
80003c94:	00042783          	lw	x15,0(x8)
80003c98:	00842703          	lw	x14,8(x8)
80003c9c:	00c41683          	lh	x13,12(x8)
80003ca0:	00078513          	addi	x10,x15,0
80003ca4:	00070c13          	addi	x24,x14,0
80003ca8:	f00992e3          	bne	x19,x0,80003bac <__sfvwrite_r+0x134>
80003cac:	0004ab83          	lw	x23,0(x9)
80003cb0:	0044a983          	lw	x19,4(x9)
80003cb4:	00848493          	addi	x9,x9,8
80003cb8:	ee9ff06f          	jal	x0,80003ba0 <__sfvwrite_r+0x128>
80003cbc:	00c12b83          	lw	x23,12(x2)
80003cc0:	00812c03          	lw	x24,8(x2)
80003cc4:	00412c83          	lw	x25,4(x2)
80003cc8:	02c12083          	lw	x1,44(x2)
80003ccc:	02812403          	lw	x8,40(x2)
80003cd0:	02412483          	lw	x9,36(x2)
80003cd4:	02012903          	lw	x18,32(x2)
80003cd8:	01c12983          	lw	x19,28(x2)
80003cdc:	01412a83          	lw	x21,20(x2)
80003ce0:	01812a03          	lw	x20,24(x2)
80003ce4:	01012b03          	lw	x22,16(x2)
80003ce8:	00000513          	addi	x10,x0,0
80003cec:	03010113          	addi	x2,x2,48
80003cf0:	00008067          	jalr	x0,0(x1)
80003cf4:	00040593          	addi	x11,x8,0
80003cf8:	000a0513          	addi	x10,x20,0
80003cfc:	af5ff0ef          	jal	x1,800037f0 <_fflush_r>
80003d00:	0a050e63          	beq	x10,x0,80003dbc <__sfvwrite_r+0x344>
80003d04:	00c41783          	lh	x15,12(x8)
80003d08:	00c12b83          	lw	x23,12(x2)
80003d0c:	00812c03          	lw	x24,8(x2)
80003d10:	02412483          	lw	x9,36(x2)
80003d14:	02012903          	lw	x18,32(x2)
80003d18:	01c12983          	lw	x19,28(x2)
80003d1c:	01412a83          	lw	x21,20(x2)
80003d20:	0407e793          	ori	x15,x15,64
80003d24:	00f41623          	sh	x15,12(x8)
80003d28:	02c12083          	lw	x1,44(x2)
80003d2c:	02812403          	lw	x8,40(x2)
80003d30:	01812a03          	lw	x20,24(x2)
80003d34:	01012b03          	lw	x22,16(x2)
80003d38:	fff00513          	addi	x10,x0,-1
80003d3c:	03010113          	addi	x2,x2,48
80003d40:	00008067          	jalr	x0,0(x1)
80003d44:	00000513          	addi	x10,x0,0
80003d48:	00008067          	jalr	x0,0(x1)
80003d4c:	00000a93          	addi	x21,x0,0
80003d50:	00000513          	addi	x10,x0,0
80003d54:	00000c13          	addi	x24,x0,0
80003d58:	00000993          	addi	x19,x0,0
80003d5c:	08098263          	beq	x19,x0,80003de0 <__sfvwrite_r+0x368>
80003d60:	08050a63          	beq	x10,x0,80003df4 <__sfvwrite_r+0x37c>
80003d64:	000a8793          	addi	x15,x21,0
80003d68:	00098b93          	addi	x23,x19,0
80003d6c:	0137f463          	bgeu	x15,x19,80003d74 <__sfvwrite_r+0x2fc>
80003d70:	00078b93          	addi	x23,x15,0
80003d74:	00042503          	lw	x10,0(x8)
80003d78:	01042783          	lw	x15,16(x8)
80003d7c:	00842903          	lw	x18,8(x8)
80003d80:	01442683          	lw	x13,20(x8)
80003d84:	00a7f663          	bgeu	x15,x10,80003d90 <__sfvwrite_r+0x318>
80003d88:	00d90933          	add	x18,x18,x13
80003d8c:	09794463          	blt	x18,x23,80003e14 <__sfvwrite_r+0x39c>
80003d90:	16dbc263          	blt	x23,x13,80003ef4 <__sfvwrite_r+0x47c>
80003d94:	02442783          	lw	x15,36(x8)
80003d98:	01c42583          	lw	x11,28(x8)
80003d9c:	000c0613          	addi	x12,x24,0
80003da0:	000a0513          	addi	x10,x20,0
80003da4:	000780e7          	jalr	x1,0(x15)
80003da8:	00050913          	addi	x18,x10,0
80003dac:	f4a05ce3          	bge	x0,x10,80003d04 <__sfvwrite_r+0x28c>
80003db0:	412a8ab3          	sub	x21,x21,x18
80003db4:	00100513          	addi	x10,x0,1
80003db8:	f20a8ee3          	beq	x21,x0,80003cf4 <__sfvwrite_r+0x27c>
80003dbc:	008b2783          	lw	x15,8(x22)
80003dc0:	012c0c33          	add	x24,x24,x18
80003dc4:	412989b3          	sub	x19,x19,x18
80003dc8:	412787b3          	sub	x15,x15,x18
80003dcc:	00fb2423          	sw	x15,8(x22)
80003dd0:	f80796e3          	bne	x15,x0,80003d5c <__sfvwrite_r+0x2e4>
80003dd4:	00c12b83          	lw	x23,12(x2)
80003dd8:	00812c03          	lw	x24,8(x2)
80003ddc:	eedff06f          	jal	x0,80003cc8 <__sfvwrite_r+0x250>
80003de0:	0044a983          	lw	x19,4(x9)
80003de4:	00048793          	addi	x15,x9,0
80003de8:	00848493          	addi	x9,x9,8
80003dec:	fe098ae3          	beq	x19,x0,80003de0 <__sfvwrite_r+0x368>
80003df0:	0007ac03          	lw	x24,0(x15)
80003df4:	00098613          	addi	x12,x19,0
80003df8:	00a00593          	addi	x11,x0,10
80003dfc:	000c0513          	addi	x10,x24,0
80003e00:	4e8000ef          	jal	x1,800042e8 <memchr>
80003e04:	14050c63          	beq	x10,x0,80003f5c <__sfvwrite_r+0x4e4>
80003e08:	00150513          	addi	x10,x10,1
80003e0c:	41850ab3          	sub	x21,x10,x24
80003e10:	f55ff06f          	jal	x0,80003d64 <__sfvwrite_r+0x2ec>
80003e14:	000c0593          	addi	x11,x24,0
80003e18:	00090613          	addi	x12,x18,0
80003e1c:	069000ef          	jal	x1,80004684 <memmove>
80003e20:	00042783          	lw	x15,0(x8)
80003e24:	00040593          	addi	x11,x8,0
80003e28:	000a0513          	addi	x10,x20,0
80003e2c:	012787b3          	add	x15,x15,x18
80003e30:	00f42023          	sw	x15,0(x8)
80003e34:	9bdff0ef          	jal	x1,800037f0 <_fflush_r>
80003e38:	f6050ce3          	beq	x10,x0,80003db0 <__sfvwrite_r+0x338>
80003e3c:	ec9ff06f          	jal	x0,80003d04 <__sfvwrite_r+0x28c>
80003e40:	01042683          	lw	x13,16(x8)
80003e44:	04f6e463          	bltu	x13,x15,80003e8c <__sfvwrite_r+0x414>
80003e48:	01442583          	lw	x11,20(x8)
80003e4c:	04b9e063          	bltu	x19,x11,80003e8c <__sfvwrite_r+0x414>
80003e50:	00098913          	addi	x18,x19,0
80003e54:	013af463          	bgeu	x21,x19,80003e5c <__sfvwrite_r+0x3e4>
80003e58:	000a8913          	addi	x18,x21,0
80003e5c:	00090513          	addi	x10,x18,0
80003e60:	c40fe0ef          	jal	x1,800022a0 <__modsi3>
80003e64:	02442783          	lw	x15,36(x8)
80003e68:	01c42583          	lw	x11,28(x8)
80003e6c:	40a906b3          	sub	x13,x18,x10
80003e70:	000b8613          	addi	x12,x23,0
80003e74:	000a0513          	addi	x10,x20,0
80003e78:	000780e7          	jalr	x1,0(x15)
80003e7c:	00050913          	addi	x18,x10,0
80003e80:	04a05a63          	bge	x0,x10,80003ed4 <__sfvwrite_r+0x45c>
80003e84:	412989b3          	sub	x19,x19,x18
80003e88:	df9ff06f          	jal	x0,80003c80 <__sfvwrite_r+0x208>
80003e8c:	00070913          	addi	x18,x14,0
80003e90:	00e9f463          	bgeu	x19,x14,80003e98 <__sfvwrite_r+0x420>
80003e94:	00098913          	addi	x18,x19,0
80003e98:	00078513          	addi	x10,x15,0
80003e9c:	00090613          	addi	x12,x18,0
80003ea0:	000b8593          	addi	x11,x23,0
80003ea4:	7e0000ef          	jal	x1,80004684 <memmove>
80003ea8:	00842703          	lw	x14,8(x8)
80003eac:	00042783          	lw	x15,0(x8)
80003eb0:	41270733          	sub	x14,x14,x18
80003eb4:	012787b3          	add	x15,x15,x18
80003eb8:	00e42423          	sw	x14,8(x8)
80003ebc:	00f42023          	sw	x15,0(x8)
80003ec0:	fc0712e3          	bne	x14,x0,80003e84 <__sfvwrite_r+0x40c>
80003ec4:	00040593          	addi	x11,x8,0
80003ec8:	000a0513          	addi	x10,x20,0
80003ecc:	925ff0ef          	jal	x1,800037f0 <_fflush_r>
80003ed0:	fa050ae3          	beq	x10,x0,80003e84 <__sfvwrite_r+0x40c>
80003ed4:	00c41783          	lh	x15,12(x8)
80003ed8:	00c12b83          	lw	x23,12(x2)
80003edc:	00812c03          	lw	x24,8(x2)
80003ee0:	00412c83          	lw	x25,4(x2)
80003ee4:	e2dff06f          	jal	x0,80003d10 <__sfvwrite_r+0x298>
80003ee8:	00098c13          	addi	x24,x19,0
80003eec:	00098c93          	addi	x25,x19,0
80003ef0:	d65ff06f          	jal	x0,80003c54 <__sfvwrite_r+0x1dc>
80003ef4:	000b8613          	addi	x12,x23,0
80003ef8:	000c0593          	addi	x11,x24,0
80003efc:	788000ef          	jal	x1,80004684 <memmove>
80003f00:	00842703          	lw	x14,8(x8)
80003f04:	00042783          	lw	x15,0(x8)
80003f08:	000b8913          	addi	x18,x23,0
80003f0c:	41770733          	sub	x14,x14,x23
80003f10:	017787b3          	add	x15,x15,x23
80003f14:	00e42423          	sw	x14,8(x8)
80003f18:	00f42023          	sw	x15,0(x8)
80003f1c:	e95ff06f          	jal	x0,80003db0 <__sfvwrite_r+0x338>
80003f20:	000a0513          	addi	x10,x20,0
80003f24:	7bc010ef          	jal	x1,800056e0 <_realloc_r>
80003f28:	00050c93          	addi	x25,x10,0
80003f2c:	d00514e3          	bne	x10,x0,80003c34 <__sfvwrite_r+0x1bc>
80003f30:	01042583          	lw	x11,16(x8)
80003f34:	000a0513          	addi	x10,x20,0
80003f38:	4c1000ef          	jal	x1,80004bf8 <_free_r>
80003f3c:	00c41783          	lh	x15,12(x8)
80003f40:	00c00713          	addi	x14,x0,12
80003f44:	00c12b83          	lw	x23,12(x2)
80003f48:	00812c03          	lw	x24,8(x2)
80003f4c:	00412c83          	lw	x25,4(x2)
80003f50:	00ea2023          	sw	x14,0(x20)
80003f54:	f7f7f793          	andi	x15,x15,-129
80003f58:	db9ff06f          	jal	x0,80003d10 <__sfvwrite_r+0x298>
80003f5c:	00198793          	addi	x15,x19,1
80003f60:	00078a93          	addi	x21,x15,0
80003f64:	e05ff06f          	jal	x0,80003d68 <__sfvwrite_r+0x2f0>
80003f68:	00c41783          	lh	x15,12(x8)
80003f6c:	da5ff06f          	jal	x0,80003d10 <__sfvwrite_r+0x298>
80003f70:	00c00713          	addi	x14,x0,12
80003f74:	00c41783          	lh	x15,12(x8)
80003f78:	00c12b83          	lw	x23,12(x2)
80003f7c:	00812c03          	lw	x24,8(x2)
80003f80:	00412c83          	lw	x25,4(x2)
80003f84:	00ea2023          	sw	x14,0(x20)
80003f88:	d89ff06f          	jal	x0,80003d10 <__sfvwrite_r+0x298>

80003f8c <_fwalk_sglue>:
80003f8c:	fd010113          	addi	x2,x2,-48
80003f90:	03212023          	sw	x18,32(x2)
80003f94:	01312e23          	sw	x19,28(x2)
80003f98:	01412c23          	sw	x20,24(x2)
80003f9c:	01512a23          	sw	x21,20(x2)
80003fa0:	01612823          	sw	x22,16(x2)
80003fa4:	01712623          	sw	x23,12(x2)
80003fa8:	02112623          	sw	x1,44(x2)
80003fac:	02812423          	sw	x8,40(x2)
80003fb0:	02912223          	sw	x9,36(x2)
80003fb4:	00050b13          	addi	x22,x10,0
80003fb8:	00058b93          	addi	x23,x11,0
80003fbc:	00060a93          	addi	x21,x12,0
80003fc0:	00000a13          	addi	x20,x0,0
80003fc4:	00100993          	addi	x19,x0,1
80003fc8:	fff00913          	addi	x18,x0,-1
80003fcc:	004aa483          	lw	x9,4(x21)
80003fd0:	008aa403          	lw	x8,8(x21)
80003fd4:	fff48493          	addi	x9,x9,-1
80003fd8:	0204c863          	blt	x9,x0,80004008 <_fwalk_sglue+0x7c>
80003fdc:	00c45783          	lhu	x15,12(x8)
80003fe0:	00f9fe63          	bgeu	x19,x15,80003ffc <_fwalk_sglue+0x70>
80003fe4:	00e41783          	lh	x15,14(x8)
80003fe8:	00040593          	addi	x11,x8,0
80003fec:	000b0513          	addi	x10,x22,0
80003ff0:	01278663          	beq	x15,x18,80003ffc <_fwalk_sglue+0x70>
80003ff4:	000b80e7          	jalr	x1,0(x23)
80003ff8:	00aa6a33          	or	x20,x20,x10
80003ffc:	fff48493          	addi	x9,x9,-1
80004000:	06840413          	addi	x8,x8,104
80004004:	fd249ce3          	bne	x9,x18,80003fdc <_fwalk_sglue+0x50>
80004008:	000aaa83          	lw	x21,0(x21)
8000400c:	fc0a90e3          	bne	x21,x0,80003fcc <_fwalk_sglue+0x40>
80004010:	02c12083          	lw	x1,44(x2)
80004014:	02812403          	lw	x8,40(x2)
80004018:	02412483          	lw	x9,36(x2)
8000401c:	02012903          	lw	x18,32(x2)
80004020:	01c12983          	lw	x19,28(x2)
80004024:	01412a83          	lw	x21,20(x2)
80004028:	01012b03          	lw	x22,16(x2)
8000402c:	00c12b83          	lw	x23,12(x2)
80004030:	000a0513          	addi	x10,x20,0
80004034:	01812a03          	lw	x20,24(x2)
80004038:	03010113          	addi	x2,x2,48
8000403c:	00008067          	jalr	x0,0(x1)

80004040 <__sread>:
80004040:	ff010113          	addi	x2,x2,-16
80004044:	00812423          	sw	x8,8(x2)
80004048:	00058413          	addi	x8,x11,0
8000404c:	00e59583          	lh	x11,14(x11)
80004050:	00112623          	sw	x1,12(x2)
80004054:	558000ef          	jal	x1,800045ac <_read_r>
80004058:	02054063          	blt	x10,x0,80004078 <__sread+0x38>
8000405c:	05042783          	lw	x15,80(x8)
80004060:	00c12083          	lw	x1,12(x2)
80004064:	00a787b3          	add	x15,x15,x10
80004068:	04f42823          	sw	x15,80(x8)
8000406c:	00812403          	lw	x8,8(x2)
80004070:	01010113          	addi	x2,x2,16
80004074:	00008067          	jalr	x0,0(x1)
80004078:	00c45783          	lhu	x15,12(x8)
8000407c:	fffff737          	lui	x14,0xfffff
80004080:	fff70713          	addi	x14,x14,-1 # ffffefff <_end+0x7fef9e4f>
80004084:	00e7f7b3          	and	x15,x15,x14
80004088:	00c12083          	lw	x1,12(x2)
8000408c:	00f41623          	sh	x15,12(x8)
80004090:	00812403          	lw	x8,8(x2)
80004094:	01010113          	addi	x2,x2,16
80004098:	00008067          	jalr	x0,0(x1)

8000409c <__swrite>:
8000409c:	00c59783          	lh	x15,12(x11)
800040a0:	fe010113          	addi	x2,x2,-32
800040a4:	00812c23          	sw	x8,24(x2)
800040a8:	00912a23          	sw	x9,20(x2)
800040ac:	01212823          	sw	x18,16(x2)
800040b0:	01312623          	sw	x19,12(x2)
800040b4:	00112e23          	sw	x1,28(x2)
800040b8:	1007f713          	andi	x14,x15,256
800040bc:	00058413          	addi	x8,x11,0
800040c0:	00050493          	addi	x9,x10,0
800040c4:	00060913          	addi	x18,x12,0
800040c8:	00068993          	addi	x19,x13,0
800040cc:	04071063          	bne	x14,x0,8000410c <__swrite+0x70>
800040d0:	fffff737          	lui	x14,0xfffff
800040d4:	fff70713          	addi	x14,x14,-1 # ffffefff <_end+0x7fef9e4f>
800040d8:	00e7f7b3          	and	x15,x15,x14
800040dc:	00e41583          	lh	x11,14(x8)
800040e0:	00f41623          	sh	x15,12(x8)
800040e4:	01812403          	lw	x8,24(x2)
800040e8:	01c12083          	lw	x1,28(x2)
800040ec:	00098693          	addi	x13,x19,0
800040f0:	00090613          	addi	x12,x18,0
800040f4:	00c12983          	lw	x19,12(x2)
800040f8:	01012903          	lw	x18,16(x2)
800040fc:	00048513          	addi	x10,x9,0
80004100:	01412483          	lw	x9,20(x2)
80004104:	02010113          	addi	x2,x2,32
80004108:	5100006f          	jal	x0,80004618 <_write_r>
8000410c:	00e59583          	lh	x11,14(x11)
80004110:	00200693          	addi	x13,x0,2
80004114:	00000613          	addi	x12,x0,0
80004118:	428000ef          	jal	x1,80004540 <_lseek_r>
8000411c:	00c41783          	lh	x15,12(x8)
80004120:	fb1ff06f          	jal	x0,800040d0 <__swrite+0x34>

80004124 <__sseek>:
80004124:	ff010113          	addi	x2,x2,-16
80004128:	00812423          	sw	x8,8(x2)
8000412c:	00058413          	addi	x8,x11,0
80004130:	00e59583          	lh	x11,14(x11)
80004134:	00112623          	sw	x1,12(x2)
80004138:	408000ef          	jal	x1,80004540 <_lseek_r>
8000413c:	fff00793          	addi	x15,x0,-1
80004140:	02f50863          	beq	x10,x15,80004170 <__sseek+0x4c>
80004144:	00c45783          	lhu	x15,12(x8)
80004148:	00001737          	lui	x14,0x1
8000414c:	00c12083          	lw	x1,12(x2)
80004150:	00e7e7b3          	or	x15,x15,x14
80004154:	01079793          	slli	x15,x15,0x10
80004158:	4107d793          	srai	x15,x15,0x10
8000415c:	04a42823          	sw	x10,80(x8)
80004160:	00f41623          	sh	x15,12(x8)
80004164:	00812403          	lw	x8,8(x2)
80004168:	01010113          	addi	x2,x2,16
8000416c:	00008067          	jalr	x0,0(x1)
80004170:	00c45783          	lhu	x15,12(x8)
80004174:	fffff737          	lui	x14,0xfffff
80004178:	fff70713          	addi	x14,x14,-1 # ffffefff <_end+0x7fef9e4f>
8000417c:	00e7f7b3          	and	x15,x15,x14
80004180:	01079793          	slli	x15,x15,0x10
80004184:	4107d793          	srai	x15,x15,0x10
80004188:	00c12083          	lw	x1,12(x2)
8000418c:	00f41623          	sh	x15,12(x8)
80004190:	00812403          	lw	x8,8(x2)
80004194:	01010113          	addi	x2,x2,16
80004198:	00008067          	jalr	x0,0(x1)

8000419c <__sclose>:
8000419c:	00e59583          	lh	x11,14(x11)
800041a0:	3400006f          	jal	x0,800044e0 <_close_r>

800041a4 <__swsetup_r>:
800041a4:	801017b7          	lui	x15,0x80101
800041a8:	6a47a783          	lw	x15,1700(x15) # 801016a4 <_impure_ptr>
800041ac:	ff010113          	addi	x2,x2,-16
800041b0:	00812423          	sw	x8,8(x2)
800041b4:	00912223          	sw	x9,4(x2)
800041b8:	00112623          	sw	x1,12(x2)
800041bc:	00050493          	addi	x9,x10,0
800041c0:	00058413          	addi	x8,x11,0
800041c4:	00078663          	beq	x15,x0,800041d0 <__swsetup_r+0x2c>
800041c8:	0347a703          	lw	x14,52(x15)
800041cc:	0e070c63          	beq	x14,x0,800042c4 <__swsetup_r+0x120>
800041d0:	00c41783          	lh	x15,12(x8)
800041d4:	0087f713          	andi	x14,x15,8
800041d8:	06070a63          	beq	x14,x0,8000424c <__swsetup_r+0xa8>
800041dc:	01042703          	lw	x14,16(x8)
800041e0:	08070663          	beq	x14,x0,8000426c <__swsetup_r+0xc8>
800041e4:	0017f693          	andi	x13,x15,1
800041e8:	02068863          	beq	x13,x0,80004218 <__swsetup_r+0x74>
800041ec:	01442683          	lw	x13,20(x8)
800041f0:	00042423          	sw	x0,8(x8)
800041f4:	00000513          	addi	x10,x0,0
800041f8:	40d006b3          	sub	x13,x0,x13
800041fc:	00d42c23          	sw	x13,24(x8)
80004200:	02070a63          	beq	x14,x0,80004234 <__swsetup_r+0x90>
80004204:	00c12083          	lw	x1,12(x2)
80004208:	00812403          	lw	x8,8(x2)
8000420c:	00412483          	lw	x9,4(x2)
80004210:	01010113          	addi	x2,x2,16
80004214:	00008067          	jalr	x0,0(x1)
80004218:	0027f693          	andi	x13,x15,2
8000421c:	00000613          	addi	x12,x0,0
80004220:	00069463          	bne	x13,x0,80004228 <__swsetup_r+0x84>
80004224:	01442603          	lw	x12,20(x8)
80004228:	00c42423          	sw	x12,8(x8)
8000422c:	00000513          	addi	x10,x0,0
80004230:	fc071ae3          	bne	x14,x0,80004204 <__swsetup_r+0x60>
80004234:	0807f713          	andi	x14,x15,128
80004238:	fc0706e3          	beq	x14,x0,80004204 <__swsetup_r+0x60>
8000423c:	0407e793          	ori	x15,x15,64
80004240:	00f41623          	sh	x15,12(x8)
80004244:	fff00513          	addi	x10,x0,-1
80004248:	fbdff06f          	jal	x0,80004204 <__swsetup_r+0x60>
8000424c:	0107f713          	andi	x14,x15,16
80004250:	08070063          	beq	x14,x0,800042d0 <__swsetup_r+0x12c>
80004254:	0047f713          	andi	x14,x15,4
80004258:	02071c63          	bne	x14,x0,80004290 <__swsetup_r+0xec>
8000425c:	01042703          	lw	x14,16(x8)
80004260:	0087e793          	ori	x15,x15,8
80004264:	00f41623          	sh	x15,12(x8)
80004268:	f6071ee3          	bne	x14,x0,800041e4 <__swsetup_r+0x40>
8000426c:	2807f693          	andi	x13,x15,640
80004270:	20000613          	addi	x12,x0,512
80004274:	f6c688e3          	beq	x13,x12,800041e4 <__swsetup_r+0x40>
80004278:	00040593          	addi	x11,x8,0
8000427c:	00048513          	addi	x10,x9,0
80004280:	2d9010ef          	jal	x1,80005d58 <__smakebuf_r>
80004284:	00c41783          	lh	x15,12(x8)
80004288:	01042703          	lw	x14,16(x8)
8000428c:	f59ff06f          	jal	x0,800041e4 <__swsetup_r+0x40>
80004290:	03042583          	lw	x11,48(x8)
80004294:	00058e63          	beq	x11,x0,800042b0 <__swsetup_r+0x10c>
80004298:	04040713          	addi	x14,x8,64
8000429c:	00e58863          	beq	x11,x14,800042ac <__swsetup_r+0x108>
800042a0:	00048513          	addi	x10,x9,0
800042a4:	155000ef          	jal	x1,80004bf8 <_free_r>
800042a8:	00c41783          	lh	x15,12(x8)
800042ac:	02042823          	sw	x0,48(x8)
800042b0:	01042703          	lw	x14,16(x8)
800042b4:	fdb7f793          	andi	x15,x15,-37
800042b8:	00042223          	sw	x0,4(x8)
800042bc:	00e42023          	sw	x14,0(x8)
800042c0:	fa1ff06f          	jal	x0,80004260 <__swsetup_r+0xbc>
800042c4:	00078513          	addi	x10,x15,0
800042c8:	f80ff0ef          	jal	x1,80003a48 <__sinit>
800042cc:	f05ff06f          	jal	x0,800041d0 <__swsetup_r+0x2c>
800042d0:	00900713          	addi	x14,x0,9
800042d4:	00e4a023          	sw	x14,0(x9)
800042d8:	0407e793          	ori	x15,x15,64
800042dc:	00f41623          	sh	x15,12(x8)
800042e0:	fff00513          	addi	x10,x0,-1
800042e4:	f21ff06f          	jal	x0,80004204 <__swsetup_r+0x60>

800042e8 <memchr>:
800042e8:	00357793          	andi	x15,x10,3
800042ec:	0ff5f693          	andi	x13,x11,255
800042f0:	02078a63          	beq	x15,x0,80004324 <memchr+0x3c>
800042f4:	fff60793          	addi	x15,x12,-1
800042f8:	02060e63          	beq	x12,x0,80004334 <memchr+0x4c>
800042fc:	fff00613          	addi	x12,x0,-1
80004300:	0180006f          	jal	x0,80004318 <memchr+0x30>
80004304:	00150513          	addi	x10,x10,1
80004308:	00357713          	andi	x14,x10,3
8000430c:	00070e63          	beq	x14,x0,80004328 <memchr+0x40>
80004310:	fff78793          	addi	x15,x15,-1
80004314:	02c78063          	beq	x15,x12,80004334 <memchr+0x4c>
80004318:	00054703          	lbu	x14,0(x10)
8000431c:	fed714e3          	bne	x14,x13,80004304 <memchr+0x1c>
80004320:	00008067          	jalr	x0,0(x1)
80004324:	00060793          	addi	x15,x12,0
80004328:	00300713          	addi	x14,x0,3
8000432c:	00f76863          	bltu	x14,x15,8000433c <memchr+0x54>
80004330:	06079063          	bne	x15,x0,80004390 <memchr+0xa8>
80004334:	00000513          	addi	x10,x0,0
80004338:	00008067          	jalr	x0,0(x1)
8000433c:	0ff5f593          	andi	x11,x11,255
80004340:	00859713          	slli	x14,x11,0x8
80004344:	00b705b3          	add	x11,x14,x11
80004348:	01059713          	slli	x14,x11,0x10
8000434c:	feff08b7          	lui	x17,0xfeff0
80004350:	80808837          	lui	x16,0x80808
80004354:	00e585b3          	add	x11,x11,x14
80004358:	eff88893          	addi	x17,x17,-257 # fefefeff <_end+0x7eeead4f>
8000435c:	08080813          	addi	x16,x16,128 # 80808080 <_end+0x702ed0>
80004360:	00300313          	addi	x6,x0,3
80004364:	0100006f          	jal	x0,80004374 <memchr+0x8c>
80004368:	ffc78793          	addi	x15,x15,-4
8000436c:	00450513          	addi	x10,x10,4
80004370:	fcf370e3          	bgeu	x6,x15,80004330 <memchr+0x48>
80004374:	00052703          	lw	x14,0(x10)
80004378:	00e5c733          	xor	x14,x11,x14
8000437c:	01170633          	add	x12,x14,x17
80004380:	fff74713          	xori	x14,x14,-1
80004384:	00e67733          	and	x14,x12,x14
80004388:	01077733          	and	x14,x14,x16
8000438c:	fc070ee3          	beq	x14,x0,80004368 <memchr+0x80>
80004390:	00f507b3          	add	x15,x10,x15
80004394:	00c0006f          	jal	x0,800043a0 <memchr+0xb8>
80004398:	00150513          	addi	x10,x10,1
8000439c:	f8f50ce3          	beq	x10,x15,80004334 <memchr+0x4c>
800043a0:	00054703          	lbu	x14,0(x10)
800043a4:	fed71ae3          	bne	x14,x13,80004398 <memchr+0xb0>
800043a8:	00008067          	jalr	x0,0(x1)

800043ac <memcmp>:
800043ac:	00300793          	addi	x15,x0,3
800043b0:	02c7fe63          	bgeu	x15,x12,800043ec <memcmp+0x40>
800043b4:	00a5e7b3          	or	x15,x11,x10
800043b8:	0037f793          	andi	x15,x15,3
800043bc:	02079463          	bne	x15,x0,800043e4 <memcmp+0x38>
800043c0:	00300693          	addi	x13,x0,3
800043c4:	0140006f          	jal	x0,800043d8 <memcmp+0x2c>
800043c8:	ffc60613          	addi	x12,x12,-4
800043cc:	00450513          	addi	x10,x10,4
800043d0:	00458593          	addi	x11,x11,4
800043d4:	00c6fc63          	bgeu	x13,x12,800043ec <memcmp+0x40>
800043d8:	00052703          	lw	x14,0(x10)
800043dc:	0005a783          	lw	x15,0(x11)
800043e0:	fef704e3          	beq	x14,x15,800043c8 <memcmp+0x1c>
800043e4:	fff60693          	addi	x13,x12,-1
800043e8:	00c0006f          	jal	x0,800043f4 <memcmp+0x48>
800043ec:	fff60693          	addi	x13,x12,-1
800043f0:	02060863          	beq	x12,x0,80004420 <memcmp+0x74>
800043f4:	00168693          	addi	x13,x13,1
800043f8:	00d506b3          	add	x13,x10,x13
800043fc:	0080006f          	jal	x0,80004404 <memcmp+0x58>
80004400:	02a68063          	beq	x13,x10,80004420 <memcmp+0x74>
80004404:	00054783          	lbu	x15,0(x10)
80004408:	0005c703          	lbu	x14,0(x11)
8000440c:	00150513          	addi	x10,x10,1
80004410:	00158593          	addi	x11,x11,1
80004414:	fee786e3          	beq	x15,x14,80004400 <memcmp+0x54>
80004418:	40e78533          	sub	x10,x15,x14
8000441c:	00008067          	jalr	x0,0(x1)
80004420:	00000513          	addi	x10,x0,0
80004424:	00008067          	jalr	x0,0(x1)

80004428 <strncpy>:
80004428:	00a5e7b3          	or	x15,x11,x10
8000442c:	0037f793          	andi	x15,x15,3
80004430:	00079663          	bne	x15,x0,8000443c <strncpy+0x14>
80004434:	00300793          	addi	x15,x0,3
80004438:	04c7e663          	bltu	x15,x12,80004484 <strncpy+0x5c>
8000443c:	00050713          	addi	x14,x10,0
80004440:	01c0006f          	jal	x0,8000445c <strncpy+0x34>
80004444:	fff5c683          	lbu	x13,-1(x11)
80004448:	fff60813          	addi	x16,x12,-1
8000444c:	fed78fa3          	sb	x13,-1(x15)
80004450:	00068e63          	beq	x13,x0,8000446c <strncpy+0x44>
80004454:	00078713          	addi	x14,x15,0
80004458:	00080613          	addi	x12,x16,0
8000445c:	00158593          	addi	x11,x11,1
80004460:	00170793          	addi	x15,x14,1
80004464:	fe0610e3          	bne	x12,x0,80004444 <strncpy+0x1c>
80004468:	00008067          	jalr	x0,0(x1)
8000446c:	00c70733          	add	x14,x14,x12
80004470:	06080063          	beq	x16,x0,800044d0 <strncpy+0xa8>
80004474:	00178793          	addi	x15,x15,1
80004478:	fe078fa3          	sb	x0,-1(x15)
8000447c:	fee79ce3          	bne	x15,x14,80004474 <strncpy+0x4c>
80004480:	00008067          	jalr	x0,0(x1)
80004484:	feff0337          	lui	x6,0xfeff0
80004488:	808088b7          	lui	x17,0x80808
8000448c:	00050713          	addi	x14,x10,0
80004490:	eff30313          	addi	x6,x6,-257 # fefefeff <_end+0x7eeead4f>
80004494:	08088893          	addi	x17,x17,128 # 80808080 <_end+0x702ed0>
80004498:	00300e13          	addi	x28,x0,3
8000449c:	0180006f          	jal	x0,800044b4 <strncpy+0x8c>
800044a0:	00d72023          	sw	x13,0(x14)
800044a4:	ffc60613          	addi	x12,x12,-4
800044a8:	00470713          	addi	x14,x14,4
800044ac:	00458593          	addi	x11,x11,4
800044b0:	face76e3          	bgeu	x28,x12,8000445c <strncpy+0x34>
800044b4:	0005a683          	lw	x13,0(x11)
800044b8:	006687b3          	add	x15,x13,x6
800044bc:	fff6c813          	xori	x16,x13,-1
800044c0:	0107f7b3          	and	x15,x15,x16
800044c4:	0117f7b3          	and	x15,x15,x17
800044c8:	fc078ce3          	beq	x15,x0,800044a0 <strncpy+0x78>
800044cc:	f91ff06f          	jal	x0,8000445c <strncpy+0x34>
800044d0:	00008067          	jalr	x0,0(x1)

800044d4 <_localeconv_r>:
800044d4:	80101537          	lui	x10,0x80101
800044d8:	62850513          	addi	x10,x10,1576 # 80101628 <__global_locale+0xf0>
800044dc:	00008067          	jalr	x0,0(x1)

800044e0 <_close_r>:
800044e0:	ff010113          	addi	x2,x2,-16
800044e4:	00812423          	sw	x8,8(x2)
800044e8:	00912223          	sw	x9,4(x2)
800044ec:	00050413          	addi	x8,x10,0
800044f0:	801044b7          	lui	x9,0x80104
800044f4:	00058513          	addi	x10,x11,0
800044f8:	00112623          	sw	x1,12(x2)
800044fc:	1804ac23          	sw	x0,408(x9) # 80104198 <errno>
80004500:	4e1010ef          	jal	x1,800061e0 <_close>
80004504:	fff00793          	addi	x15,x0,-1
80004508:	00f50c63          	beq	x10,x15,80004520 <_close_r+0x40>
8000450c:	00c12083          	lw	x1,12(x2)
80004510:	00812403          	lw	x8,8(x2)
80004514:	00412483          	lw	x9,4(x2)
80004518:	01010113          	addi	x2,x2,16
8000451c:	00008067          	jalr	x0,0(x1)
80004520:	1984a783          	lw	x15,408(x9)
80004524:	fe0784e3          	beq	x15,x0,8000450c <_close_r+0x2c>
80004528:	00c12083          	lw	x1,12(x2)
8000452c:	00f42023          	sw	x15,0(x8)
80004530:	00812403          	lw	x8,8(x2)
80004534:	00412483          	lw	x9,4(x2)
80004538:	01010113          	addi	x2,x2,16
8000453c:	00008067          	jalr	x0,0(x1)

80004540 <_lseek_r>:
80004540:	ff010113          	addi	x2,x2,-16
80004544:	00058713          	addi	x14,x11,0
80004548:	00812423          	sw	x8,8(x2)
8000454c:	00912223          	sw	x9,4(x2)
80004550:	00060593          	addi	x11,x12,0
80004554:	00050413          	addi	x8,x10,0
80004558:	801044b7          	lui	x9,0x80104
8000455c:	00068613          	addi	x12,x13,0
80004560:	00070513          	addi	x10,x14,0
80004564:	00112623          	sw	x1,12(x2)
80004568:	1804ac23          	sw	x0,408(x9) # 80104198 <errno>
8000456c:	5b5010ef          	jal	x1,80006320 <_lseek>
80004570:	fff00793          	addi	x15,x0,-1
80004574:	00f50c63          	beq	x10,x15,8000458c <_lseek_r+0x4c>
80004578:	00c12083          	lw	x1,12(x2)
8000457c:	00812403          	lw	x8,8(x2)
80004580:	00412483          	lw	x9,4(x2)
80004584:	01010113          	addi	x2,x2,16
80004588:	00008067          	jalr	x0,0(x1)
8000458c:	1984a783          	lw	x15,408(x9)
80004590:	fe0784e3          	beq	x15,x0,80004578 <_lseek_r+0x38>
80004594:	00c12083          	lw	x1,12(x2)
80004598:	00f42023          	sw	x15,0(x8)
8000459c:	00812403          	lw	x8,8(x2)
800045a0:	00412483          	lw	x9,4(x2)
800045a4:	01010113          	addi	x2,x2,16
800045a8:	00008067          	jalr	x0,0(x1)

800045ac <_read_r>:
800045ac:	ff010113          	addi	x2,x2,-16
800045b0:	00058713          	addi	x14,x11,0
800045b4:	00812423          	sw	x8,8(x2)
800045b8:	00912223          	sw	x9,4(x2)
800045bc:	00060593          	addi	x11,x12,0
800045c0:	00050413          	addi	x8,x10,0
800045c4:	801044b7          	lui	x9,0x80104
800045c8:	00068613          	addi	x12,x13,0
800045cc:	00070513          	addi	x10,x14,0
800045d0:	00112623          	sw	x1,12(x2)
800045d4:	1804ac23          	sw	x0,408(x9) # 80104198 <errno>
800045d8:	58d010ef          	jal	x1,80006364 <_read>
800045dc:	fff00793          	addi	x15,x0,-1
800045e0:	00f50c63          	beq	x10,x15,800045f8 <_read_r+0x4c>
800045e4:	00c12083          	lw	x1,12(x2)
800045e8:	00812403          	lw	x8,8(x2)
800045ec:	00412483          	lw	x9,4(x2)
800045f0:	01010113          	addi	x2,x2,16
800045f4:	00008067          	jalr	x0,0(x1)
800045f8:	1984a783          	lw	x15,408(x9)
800045fc:	fe0784e3          	beq	x15,x0,800045e4 <_read_r+0x38>
80004600:	00c12083          	lw	x1,12(x2)
80004604:	00f42023          	sw	x15,0(x8)
80004608:	00812403          	lw	x8,8(x2)
8000460c:	00412483          	lw	x9,4(x2)
80004610:	01010113          	addi	x2,x2,16
80004614:	00008067          	jalr	x0,0(x1)

80004618 <_write_r>:
80004618:	ff010113          	addi	x2,x2,-16
8000461c:	00058713          	addi	x14,x11,0
80004620:	00812423          	sw	x8,8(x2)
80004624:	00912223          	sw	x9,4(x2)
80004628:	00060593          	addi	x11,x12,0
8000462c:	00050413          	addi	x8,x10,0
80004630:	801044b7          	lui	x9,0x80104
80004634:	00068613          	addi	x12,x13,0
80004638:	00070513          	addi	x10,x14,0
8000463c:	00112623          	sw	x1,12(x2)
80004640:	1804ac23          	sw	x0,408(x9) # 80104198 <errno>
80004644:	5e1010ef          	jal	x1,80006424 <_write>
80004648:	fff00793          	addi	x15,x0,-1
8000464c:	00f50c63          	beq	x10,x15,80004664 <_write_r+0x4c>
80004650:	00c12083          	lw	x1,12(x2)
80004654:	00812403          	lw	x8,8(x2)
80004658:	00412483          	lw	x9,4(x2)
8000465c:	01010113          	addi	x2,x2,16
80004660:	00008067          	jalr	x0,0(x1)
80004664:	1984a783          	lw	x15,408(x9)
80004668:	fe0784e3          	beq	x15,x0,80004650 <_write_r+0x38>
8000466c:	00c12083          	lw	x1,12(x2)
80004670:	00f42023          	sw	x15,0(x8)
80004674:	00812403          	lw	x8,8(x2)
80004678:	00412483          	lw	x9,4(x2)
8000467c:	01010113          	addi	x2,x2,16
80004680:	00008067          	jalr	x0,0(x1)

80004684 <memmove>:
80004684:	02a5f663          	bgeu	x11,x10,800046b0 <memmove+0x2c>
80004688:	00c58733          	add	x14,x11,x12
8000468c:	02e57263          	bgeu	x10,x14,800046b0 <memmove+0x2c>
80004690:	00c507b3          	add	x15,x10,x12
80004694:	04060663          	beq	x12,x0,800046e0 <memmove+0x5c>
80004698:	fff74683          	lbu	x13,-1(x14)
8000469c:	fff78793          	addi	x15,x15,-1
800046a0:	fff70713          	addi	x14,x14,-1
800046a4:	00d78023          	sb	x13,0(x15)
800046a8:	fef518e3          	bne	x10,x15,80004698 <memmove+0x14>
800046ac:	00008067          	jalr	x0,0(x1)
800046b0:	00f00793          	addi	x15,x0,15
800046b4:	02c7e863          	bltu	x15,x12,800046e4 <memmove+0x60>
800046b8:	00050793          	addi	x15,x10,0
800046bc:	fff60693          	addi	x13,x12,-1
800046c0:	0c060263          	beq	x12,x0,80004784 <memmove+0x100>
800046c4:	00168693          	addi	x13,x13,1
800046c8:	00d786b3          	add	x13,x15,x13
800046cc:	0005c703          	lbu	x14,0(x11)
800046d0:	00178793          	addi	x15,x15,1
800046d4:	00158593          	addi	x11,x11,1
800046d8:	fee78fa3          	sb	x14,-1(x15)
800046dc:	fed798e3          	bne	x15,x13,800046cc <memmove+0x48>
800046e0:	00008067          	jalr	x0,0(x1)
800046e4:	00b567b3          	or	x15,x10,x11
800046e8:	0037f793          	andi	x15,x15,3
800046ec:	08079663          	bne	x15,x0,80004778 <memmove+0xf4>
800046f0:	ff060893          	addi	x17,x12,-16
800046f4:	ff08f893          	andi	x17,x17,-16
800046f8:	01088893          	addi	x17,x17,16
800046fc:	011506b3          	add	x13,x10,x17
80004700:	00058713          	addi	x14,x11,0
80004704:	00050793          	addi	x15,x10,0
80004708:	00072803          	lw	x16,0(x14)
8000470c:	01070713          	addi	x14,x14,16
80004710:	01078793          	addi	x15,x15,16
80004714:	ff07a823          	sw	x16,-16(x15)
80004718:	ff472803          	lw	x16,-12(x14)
8000471c:	ff07aa23          	sw	x16,-12(x15)
80004720:	ff872803          	lw	x16,-8(x14)
80004724:	ff07ac23          	sw	x16,-8(x15)
80004728:	ffc72803          	lw	x16,-4(x14)
8000472c:	ff07ae23          	sw	x16,-4(x15)
80004730:	fcd79ce3          	bne	x15,x13,80004708 <memmove+0x84>
80004734:	00c67813          	andi	x16,x12,12
80004738:	011585b3          	add	x11,x11,x17
8000473c:	00f67713          	andi	x14,x12,15
80004740:	04080463          	beq	x16,x0,80004788 <memmove+0x104>
80004744:	ffc70813          	addi	x16,x14,-4
80004748:	ffc87813          	andi	x16,x16,-4
8000474c:	00480813          	addi	x16,x16,4
80004750:	010687b3          	add	x15,x13,x16
80004754:	00058713          	addi	x14,x11,0
80004758:	00072883          	lw	x17,0(x14)
8000475c:	00468693          	addi	x13,x13,4
80004760:	00470713          	addi	x14,x14,4
80004764:	ff16ae23          	sw	x17,-4(x13)
80004768:	fef698e3          	bne	x13,x15,80004758 <memmove+0xd4>
8000476c:	00367613          	andi	x12,x12,3
80004770:	010585b3          	add	x11,x11,x16
80004774:	f49ff06f          	jal	x0,800046bc <memmove+0x38>
80004778:	fff60693          	addi	x13,x12,-1
8000477c:	00050793          	addi	x15,x10,0
80004780:	f45ff06f          	jal	x0,800046c4 <memmove+0x40>
80004784:	00008067          	jalr	x0,0(x1)
80004788:	00070613          	addi	x12,x14,0
8000478c:	f31ff06f          	jal	x0,800046bc <memmove+0x38>

80004790 <memset>:
80004790:	00f00313          	addi	x6,x0,15
80004794:	00050713          	addi	x14,x10,0
80004798:	02c37e63          	bgeu	x6,x12,800047d4 <memset+0x44>
8000479c:	00f77793          	andi	x15,x14,15
800047a0:	0a079063          	bne	x15,x0,80004840 <memset+0xb0>
800047a4:	08059263          	bne	x11,x0,80004828 <memset+0x98>
800047a8:	ff067693          	andi	x13,x12,-16
800047ac:	00f67613          	andi	x12,x12,15
800047b0:	00e686b3          	add	x13,x13,x14
800047b4:	00b72023          	sw	x11,0(x14)
800047b8:	00b72223          	sw	x11,4(x14)
800047bc:	00b72423          	sw	x11,8(x14)
800047c0:	00b72623          	sw	x11,12(x14)
800047c4:	01070713          	addi	x14,x14,16
800047c8:	fed766e3          	bltu	x14,x13,800047b4 <memset+0x24>
800047cc:	00061463          	bne	x12,x0,800047d4 <memset+0x44>
800047d0:	00008067          	jalr	x0,0(x1)
800047d4:	40c306b3          	sub	x13,x6,x12
800047d8:	00269693          	slli	x13,x13,0x2
800047dc:	00000297          	auipc	x5,0x0
800047e0:	005686b3          	add	x13,x13,x5
800047e4:	00c68067          	jalr	x0,12(x13)
800047e8:	00b70723          	sb	x11,14(x14)
800047ec:	00b706a3          	sb	x11,13(x14)
800047f0:	00b70623          	sb	x11,12(x14)
800047f4:	00b705a3          	sb	x11,11(x14)
800047f8:	00b70523          	sb	x11,10(x14)
800047fc:	00b704a3          	sb	x11,9(x14)
80004800:	00b70423          	sb	x11,8(x14)
80004804:	00b703a3          	sb	x11,7(x14)
80004808:	00b70323          	sb	x11,6(x14)
8000480c:	00b702a3          	sb	x11,5(x14)
80004810:	00b70223          	sb	x11,4(x14)
80004814:	00b701a3          	sb	x11,3(x14)
80004818:	00b70123          	sb	x11,2(x14)
8000481c:	00b700a3          	sb	x11,1(x14)
80004820:	00b70023          	sb	x11,0(x14)
80004824:	00008067          	jalr	x0,0(x1)
80004828:	0ff5f593          	andi	x11,x11,255
8000482c:	00859693          	slli	x13,x11,0x8
80004830:	00d5e5b3          	or	x11,x11,x13
80004834:	01059693          	slli	x13,x11,0x10
80004838:	00d5e5b3          	or	x11,x11,x13
8000483c:	f6dff06f          	jal	x0,800047a8 <memset+0x18>
80004840:	00279693          	slli	x13,x15,0x2
80004844:	00000297          	auipc	x5,0x0
80004848:	005686b3          	add	x13,x13,x5
8000484c:	00008293          	addi	x5,x1,0
80004850:	fa0680e7          	jalr	x1,-96(x13)
80004854:	00028093          	addi	x1,x5,0 # 80004844 <memset+0xb4>
80004858:	ff078793          	addi	x15,x15,-16
8000485c:	40f70733          	sub	x14,x14,x15
80004860:	00f60633          	add	x12,x12,x15
80004864:	f6c378e3          	bgeu	x6,x12,800047d4 <memset+0x44>
80004868:	f3dff06f          	jal	x0,800047a4 <memset+0x14>

8000486c <memcpy>:
8000486c:	00a5c7b3          	xor	x15,x11,x10
80004870:	0037f793          	andi	x15,x15,3
80004874:	00c508b3          	add	x17,x10,x12
80004878:	06079463          	bne	x15,x0,800048e0 <memcpy+0x74>
8000487c:	00300793          	addi	x15,x0,3
80004880:	06c7f063          	bgeu	x15,x12,800048e0 <memcpy+0x74>
80004884:	00357793          	andi	x15,x10,3
80004888:	00050713          	addi	x14,x10,0
8000488c:	06079a63          	bne	x15,x0,80004900 <memcpy+0x94>
80004890:	ffc8f613          	andi	x12,x17,-4
80004894:	40e606b3          	sub	x13,x12,x14
80004898:	02000793          	addi	x15,x0,32
8000489c:	08d7ce63          	blt	x15,x13,80004938 <memcpy+0xcc>
800048a0:	00058693          	addi	x13,x11,0
800048a4:	00070793          	addi	x15,x14,0
800048a8:	02c77863          	bgeu	x14,x12,800048d8 <memcpy+0x6c>
800048ac:	0006a803          	lw	x16,0(x13)
800048b0:	00478793          	addi	x15,x15,4
800048b4:	00468693          	addi	x13,x13,4
800048b8:	ff07ae23          	sw	x16,-4(x15)
800048bc:	fec7e8e3          	bltu	x15,x12,800048ac <memcpy+0x40>
800048c0:	fff60793          	addi	x15,x12,-1
800048c4:	40e787b3          	sub	x15,x15,x14
800048c8:	ffc7f793          	andi	x15,x15,-4
800048cc:	00478793          	addi	x15,x15,4
800048d0:	00f70733          	add	x14,x14,x15
800048d4:	00f585b3          	add	x11,x11,x15
800048d8:	01176863          	bltu	x14,x17,800048e8 <memcpy+0x7c>
800048dc:	00008067          	jalr	x0,0(x1)
800048e0:	00050713          	addi	x14,x10,0
800048e4:	05157863          	bgeu	x10,x17,80004934 <memcpy+0xc8>
800048e8:	0005c783          	lbu	x15,0(x11)
800048ec:	00170713          	addi	x14,x14,1
800048f0:	00158593          	addi	x11,x11,1
800048f4:	fef70fa3          	sb	x15,-1(x14)
800048f8:	fee898e3          	bne	x17,x14,800048e8 <memcpy+0x7c>
800048fc:	00008067          	jalr	x0,0(x1)
80004900:	0005c683          	lbu	x13,0(x11)
80004904:	00170713          	addi	x14,x14,1
80004908:	00377793          	andi	x15,x14,3
8000490c:	fed70fa3          	sb	x13,-1(x14)
80004910:	00158593          	addi	x11,x11,1
80004914:	f6078ee3          	beq	x15,x0,80004890 <memcpy+0x24>
80004918:	0005c683          	lbu	x13,0(x11)
8000491c:	00170713          	addi	x14,x14,1
80004920:	00377793          	andi	x15,x14,3
80004924:	fed70fa3          	sb	x13,-1(x14)
80004928:	00158593          	addi	x11,x11,1
8000492c:	fc079ae3          	bne	x15,x0,80004900 <memcpy+0x94>
80004930:	f61ff06f          	jal	x0,80004890 <memcpy+0x24>
80004934:	00008067          	jalr	x0,0(x1)
80004938:	ff010113          	addi	x2,x2,-16
8000493c:	00812623          	sw	x8,12(x2)
80004940:	02000413          	addi	x8,x0,32
80004944:	0005a383          	lw	x7,0(x11)
80004948:	0045a283          	lw	x5,4(x11)
8000494c:	0085af83          	lw	x31,8(x11)
80004950:	00c5af03          	lw	x30,12(x11)
80004954:	0105ae83          	lw	x29,16(x11)
80004958:	0145ae03          	lw	x28,20(x11)
8000495c:	0185a303          	lw	x6,24(x11)
80004960:	01c5a803          	lw	x16,28(x11)
80004964:	0205a683          	lw	x13,32(x11)
80004968:	02470713          	addi	x14,x14,36
8000496c:	40e607b3          	sub	x15,x12,x14
80004970:	fc772e23          	sw	x7,-36(x14)
80004974:	fe572023          	sw	x5,-32(x14)
80004978:	fff72223          	sw	x31,-28(x14)
8000497c:	ffe72423          	sw	x30,-24(x14)
80004980:	ffd72623          	sw	x29,-20(x14)
80004984:	ffc72823          	sw	x28,-16(x14)
80004988:	fe672a23          	sw	x6,-12(x14)
8000498c:	ff072c23          	sw	x16,-8(x14)
80004990:	fed72e23          	sw	x13,-4(x14)
80004994:	02458593          	addi	x11,x11,36
80004998:	faf446e3          	blt	x8,x15,80004944 <memcpy+0xd8>
8000499c:	00058693          	addi	x13,x11,0
800049a0:	00070793          	addi	x15,x14,0
800049a4:	02c77863          	bgeu	x14,x12,800049d4 <memcpy+0x168>
800049a8:	0006a803          	lw	x16,0(x13)
800049ac:	00478793          	addi	x15,x15,4
800049b0:	00468693          	addi	x13,x13,4
800049b4:	ff07ae23          	sw	x16,-4(x15)
800049b8:	fec7e8e3          	bltu	x15,x12,800049a8 <memcpy+0x13c>
800049bc:	fff60793          	addi	x15,x12,-1
800049c0:	40e787b3          	sub	x15,x15,x14
800049c4:	ffc7f793          	andi	x15,x15,-4
800049c8:	00478793          	addi	x15,x15,4
800049cc:	00f70733          	add	x14,x14,x15
800049d0:	00f585b3          	add	x11,x11,x15
800049d4:	01176863          	bltu	x14,x17,800049e4 <memcpy+0x178>
800049d8:	00c12403          	lw	x8,12(x2)
800049dc:	01010113          	addi	x2,x2,16
800049e0:	00008067          	jalr	x0,0(x1)
800049e4:	0005c783          	lbu	x15,0(x11)
800049e8:	00170713          	addi	x14,x14,1
800049ec:	00158593          	addi	x11,x11,1
800049f0:	fef70fa3          	sb	x15,-1(x14)
800049f4:	fee882e3          	beq	x17,x14,800049d8 <memcpy+0x16c>
800049f8:	0005c783          	lbu	x15,0(x11)
800049fc:	00170713          	addi	x14,x14,1
80004a00:	00158593          	addi	x11,x11,1
80004a04:	fef70fa3          	sb	x15,-1(x14)
80004a08:	fce89ee3          	bne	x17,x14,800049e4 <memcpy+0x178>
80004a0c:	fcdff06f          	jal	x0,800049d8 <memcpy+0x16c>

80004a10 <strlen>:
80004a10:	00357793          	andi	x15,x10,3
80004a14:	00050713          	addi	x14,x10,0
80004a18:	04079c63          	bne	x15,x0,80004a70 <strlen+0x60>
80004a1c:	7f7f86b7          	lui	x13,0x7f7f8
80004a20:	f7f68693          	addi	x13,x13,-129 # 7f7f7f7f <SYSCALL_ADDR+0x7d7e7f7f>
80004a24:	fff00593          	addi	x11,x0,-1
80004a28:	00072603          	lw	x12,0(x14)
80004a2c:	00470713          	addi	x14,x14,4
80004a30:	00d677b3          	and	x15,x12,x13
80004a34:	00d787b3          	add	x15,x15,x13
80004a38:	00c7e7b3          	or	x15,x15,x12
80004a3c:	00d7e7b3          	or	x15,x15,x13
80004a40:	feb784e3          	beq	x15,x11,80004a28 <strlen+0x18>
80004a44:	ffc74683          	lbu	x13,-4(x14)
80004a48:	40a707b3          	sub	x15,x14,x10
80004a4c:	04068463          	beq	x13,x0,80004a94 <strlen+0x84>
80004a50:	ffd74683          	lbu	x13,-3(x14)
80004a54:	02068c63          	beq	x13,x0,80004a8c <strlen+0x7c>
80004a58:	ffe74503          	lbu	x10,-2(x14)
80004a5c:	00a03533          	sltu	x10,x0,x10
80004a60:	00f50533          	add	x10,x10,x15
80004a64:	ffe50513          	addi	x10,x10,-2
80004a68:	00008067          	jalr	x0,0(x1)
80004a6c:	fa0688e3          	beq	x13,x0,80004a1c <strlen+0xc>
80004a70:	00074783          	lbu	x15,0(x14)
80004a74:	00170713          	addi	x14,x14,1
80004a78:	00377693          	andi	x13,x14,3
80004a7c:	fe0798e3          	bne	x15,x0,80004a6c <strlen+0x5c>
80004a80:	40a70733          	sub	x14,x14,x10
80004a84:	fff70513          	addi	x10,x14,-1
80004a88:	00008067          	jalr	x0,0(x1)
80004a8c:	ffd78513          	addi	x10,x15,-3
80004a90:	00008067          	jalr	x0,0(x1)
80004a94:	ffc78513          	addi	x10,x15,-4
80004a98:	00008067          	jalr	x0,0(x1)

80004a9c <abort>:
80004a9c:	ff010113          	addi	x2,x2,-16
80004aa0:	00600513          	addi	x10,x0,6
80004aa4:	00112623          	sw	x1,12(x2)
80004aa8:	448010ef          	jal	x1,80005ef0 <raise>
80004aac:	00100513          	addi	x10,x0,1
80004ab0:	774010ef          	jal	x1,80006224 <_exit>

80004ab4 <_malloc_trim_r>:
80004ab4:	fe010113          	addi	x2,x2,-32
80004ab8:	01312623          	sw	x19,12(x2)
80004abc:	801019b7          	lui	x19,0x80101
80004ac0:	00812c23          	sw	x8,24(x2)
80004ac4:	00912a23          	sw	x9,20(x2)
80004ac8:	01212823          	sw	x18,16(x2)
80004acc:	01412423          	sw	x20,8(x2)
80004ad0:	00112e23          	sw	x1,28(x2)
80004ad4:	00058a13          	addi	x20,x11,0
80004ad8:	00050913          	addi	x18,x10,0
80004adc:	13098993          	addi	x19,x19,304 # 80101130 <__malloc_av_>
80004ae0:	3f9000ef          	jal	x1,800056d8 <__malloc_lock>
80004ae4:	0089a703          	lw	x14,8(x19)
80004ae8:	000017b7          	lui	x15,0x1
80004aec:	fef78793          	addi	x15,x15,-17 # fef <_heap_size+0xfef>
80004af0:	00472483          	lw	x9,4(x14)
80004af4:	00001737          	lui	x14,0x1
80004af8:	ffc4f493          	andi	x9,x9,-4
80004afc:	00f48433          	add	x8,x9,x15
80004b00:	41440433          	sub	x8,x8,x20
80004b04:	00c45413          	srli	x8,x8,0xc
80004b08:	fff40413          	addi	x8,x8,-1
80004b0c:	00c41413          	slli	x8,x8,0xc
80004b10:	00e44e63          	blt	x8,x14,80004b2c <_malloc_trim_r+0x78>
80004b14:	00000593          	addi	x11,x0,0
80004b18:	00090513          	addi	x10,x18,0
80004b1c:	5cc010ef          	jal	x1,800060e8 <_sbrk_r>
80004b20:	0089a783          	lw	x15,8(x19)
80004b24:	009787b3          	add	x15,x15,x9
80004b28:	02f50863          	beq	x10,x15,80004b58 <_malloc_trim_r+0xa4>
80004b2c:	00090513          	addi	x10,x18,0
80004b30:	3ad000ef          	jal	x1,800056dc <__malloc_unlock>
80004b34:	01c12083          	lw	x1,28(x2)
80004b38:	01812403          	lw	x8,24(x2)
80004b3c:	01412483          	lw	x9,20(x2)
80004b40:	01012903          	lw	x18,16(x2)
80004b44:	00c12983          	lw	x19,12(x2)
80004b48:	00812a03          	lw	x20,8(x2)
80004b4c:	00000513          	addi	x10,x0,0
80004b50:	02010113          	addi	x2,x2,32
80004b54:	00008067          	jalr	x0,0(x1)
80004b58:	408005b3          	sub	x11,x0,x8
80004b5c:	00090513          	addi	x10,x18,0
80004b60:	588010ef          	jal	x1,800060e8 <_sbrk_r>
80004b64:	fff00793          	addi	x15,x0,-1
80004b68:	04f50a63          	beq	x10,x15,80004bbc <_malloc_trim_r+0x108>
80004b6c:	801047b7          	lui	x15,0x80104
80004b70:	15878793          	addi	x15,x15,344 # 80104158 <__malloc_current_mallinfo>
80004b74:	0007a703          	lw	x14,0(x15)
80004b78:	0089a683          	lw	x13,8(x19)
80004b7c:	408484b3          	sub	x9,x9,x8
80004b80:	0014e493          	ori	x9,x9,1
80004b84:	40870733          	sub	x14,x14,x8
80004b88:	00090513          	addi	x10,x18,0
80004b8c:	0096a223          	sw	x9,4(x13)
80004b90:	00e7a023          	sw	x14,0(x15)
80004b94:	349000ef          	jal	x1,800056dc <__malloc_unlock>
80004b98:	01c12083          	lw	x1,28(x2)
80004b9c:	01812403          	lw	x8,24(x2)
80004ba0:	01412483          	lw	x9,20(x2)
80004ba4:	01012903          	lw	x18,16(x2)
80004ba8:	00c12983          	lw	x19,12(x2)
80004bac:	00812a03          	lw	x20,8(x2)
80004bb0:	00100513          	addi	x10,x0,1
80004bb4:	02010113          	addi	x2,x2,32
80004bb8:	00008067          	jalr	x0,0(x1)
80004bbc:	00000593          	addi	x11,x0,0
80004bc0:	00090513          	addi	x10,x18,0
80004bc4:	524010ef          	jal	x1,800060e8 <_sbrk_r>
80004bc8:	0089a703          	lw	x14,8(x19)
80004bcc:	00f00693          	addi	x13,x0,15
80004bd0:	40e507b3          	sub	x15,x10,x14
80004bd4:	f4f6dce3          	bge	x13,x15,80004b2c <_malloc_trim_r+0x78>
80004bd8:	801016b7          	lui	x13,0x80101
80004bdc:	6a86a683          	lw	x13,1704(x13) # 801016a8 <__malloc_sbrk_base>
80004be0:	0017e793          	ori	x15,x15,1
80004be4:	00f72223          	sw	x15,4(x14) # 1004 <_stack_size+0x4>
80004be8:	40d50533          	sub	x10,x10,x13
80004bec:	801046b7          	lui	x13,0x80104
80004bf0:	14a6ac23          	sw	x10,344(x13) # 80104158 <__malloc_current_mallinfo>
80004bf4:	f39ff06f          	jal	x0,80004b2c <_malloc_trim_r+0x78>

80004bf8 <_free_r>:
80004bf8:	18058263          	beq	x11,x0,80004d7c <_free_r+0x184>
80004bfc:	ff010113          	addi	x2,x2,-16
80004c00:	00812423          	sw	x8,8(x2)
80004c04:	00912223          	sw	x9,4(x2)
80004c08:	00058413          	addi	x8,x11,0
80004c0c:	00050493          	addi	x9,x10,0
80004c10:	00112623          	sw	x1,12(x2)
80004c14:	2c5000ef          	jal	x1,800056d8 <__malloc_lock>
80004c18:	ffc42503          	lw	x10,-4(x8)
80004c1c:	ff840713          	addi	x14,x8,-8
80004c20:	801015b7          	lui	x11,0x80101
80004c24:	ffe57793          	andi	x15,x10,-2
80004c28:	00f70633          	add	x12,x14,x15
80004c2c:	13058593          	addi	x11,x11,304 # 80101130 <__malloc_av_>
80004c30:	00462683          	lw	x13,4(x12)
80004c34:	0085a803          	lw	x16,8(x11)
80004c38:	ffc6f693          	andi	x13,x13,-4
80004c3c:	1ac80263          	beq	x16,x12,80004de0 <_free_r+0x1e8>
80004c40:	00d62223          	sw	x13,4(x12)
80004c44:	00157513          	andi	x10,x10,1
80004c48:	00d60833          	add	x16,x12,x13
80004c4c:	0a051063          	bne	x10,x0,80004cec <_free_r+0xf4>
80004c50:	ff842303          	lw	x6,-8(x8)
80004c54:	00482803          	lw	x16,4(x16)
80004c58:	80101537          	lui	x10,0x80101
80004c5c:	40670733          	sub	x14,x14,x6
80004c60:	00872883          	lw	x17,8(x14)
80004c64:	13850513          	addi	x10,x10,312 # 80101138 <__malloc_av_+0x8>
80004c68:	006787b3          	add	x15,x15,x6
80004c6c:	00187813          	andi	x16,x16,1
80004c70:	14a88263          	beq	x17,x10,80004db4 <_free_r+0x1bc>
80004c74:	00c72303          	lw	x6,12(x14)
80004c78:	0068a623          	sw	x6,12(x17)
80004c7c:	01132423          	sw	x17,8(x6)
80004c80:	1a080a63          	beq	x16,x0,80004e34 <_free_r+0x23c>
80004c84:	0017e693          	ori	x13,x15,1
80004c88:	00d72223          	sw	x13,4(x14)
80004c8c:	00f62023          	sw	x15,0(x12)
80004c90:	1ff00693          	addi	x13,x0,511
80004c94:	06f6ec63          	bltu	x13,x15,80004d0c <_free_r+0x114>
80004c98:	ff87f693          	andi	x13,x15,-8
80004c9c:	00868693          	addi	x13,x13,8
80004ca0:	0045a503          	lw	x10,4(x11)
80004ca4:	00d586b3          	add	x13,x11,x13
80004ca8:	0006a603          	lw	x12,0(x13)
80004cac:	0057d813          	srli	x16,x15,0x5
80004cb0:	00100793          	addi	x15,x0,1
80004cb4:	010797b3          	sll	x15,x15,x16
80004cb8:	00a7e7b3          	or	x15,x15,x10
80004cbc:	ff868513          	addi	x10,x13,-8
80004cc0:	00a72623          	sw	x10,12(x14)
80004cc4:	00c72423          	sw	x12,8(x14)
80004cc8:	00f5a223          	sw	x15,4(x11)
80004ccc:	00e6a023          	sw	x14,0(x13)
80004cd0:	00e62623          	sw	x14,12(x12)
80004cd4:	00812403          	lw	x8,8(x2)
80004cd8:	00c12083          	lw	x1,12(x2)
80004cdc:	00048513          	addi	x10,x9,0
80004ce0:	00412483          	lw	x9,4(x2)
80004ce4:	01010113          	addi	x2,x2,16
80004ce8:	1f50006f          	jal	x0,800056dc <__malloc_unlock>
80004cec:	00482503          	lw	x10,4(x16)
80004cf0:	00157513          	andi	x10,x10,1
80004cf4:	08050663          	beq	x10,x0,80004d80 <_free_r+0x188>
80004cf8:	0017e693          	ori	x13,x15,1
80004cfc:	fed42e23          	sw	x13,-4(x8)
80004d00:	00f62023          	sw	x15,0(x12)
80004d04:	1ff00693          	addi	x13,x0,511
80004d08:	f8f6f8e3          	bgeu	x13,x15,80004c98 <_free_r+0xa0>
80004d0c:	0097d693          	srli	x13,x15,0x9
80004d10:	00400613          	addi	x12,x0,4
80004d14:	12d66463          	bltu	x12,x13,80004e3c <_free_r+0x244>
80004d18:	0067d693          	srli	x13,x15,0x6
80004d1c:	03968513          	addi	x10,x13,57
80004d20:	03868613          	addi	x12,x13,56
80004d24:	00351513          	slli	x10,x10,0x3
80004d28:	00a58533          	add	x10,x11,x10
80004d2c:	00052683          	lw	x13,0(x10)
80004d30:	ff850513          	addi	x10,x10,-8
80004d34:	00d51863          	bne	x10,x13,80004d44 <_free_r+0x14c>
80004d38:	15c0006f          	jal	x0,80004e94 <_free_r+0x29c>
80004d3c:	0086a683          	lw	x13,8(x13)
80004d40:	00d50863          	beq	x10,x13,80004d50 <_free_r+0x158>
80004d44:	0046a603          	lw	x12,4(x13)
80004d48:	ffc67613          	andi	x12,x12,-4
80004d4c:	fec7e8e3          	bltu	x15,x12,80004d3c <_free_r+0x144>
80004d50:	00c6a503          	lw	x10,12(x13)
80004d54:	00a72623          	sw	x10,12(x14)
80004d58:	00d72423          	sw	x13,8(x14)
80004d5c:	00812403          	lw	x8,8(x2)
80004d60:	00e52423          	sw	x14,8(x10)
80004d64:	00c12083          	lw	x1,12(x2)
80004d68:	00048513          	addi	x10,x9,0
80004d6c:	00412483          	lw	x9,4(x2)
80004d70:	00e6a623          	sw	x14,12(x13)
80004d74:	01010113          	addi	x2,x2,16
80004d78:	1650006f          	jal	x0,800056dc <__malloc_unlock>
80004d7c:	00008067          	jalr	x0,0(x1)
80004d80:	80101537          	lui	x10,0x80101
80004d84:	00d787b3          	add	x15,x15,x13
80004d88:	13850513          	addi	x10,x10,312 # 80101138 <__malloc_av_+0x8>
80004d8c:	00862683          	lw	x13,8(x12)
80004d90:	0ea68063          	beq	x13,x10,80004e70 <_free_r+0x278>
80004d94:	00c62803          	lw	x16,12(x12)
80004d98:	0017e513          	ori	x10,x15,1
80004d9c:	00f70633          	add	x12,x14,x15
80004da0:	0106a623          	sw	x16,12(x13)
80004da4:	00d82423          	sw	x13,8(x16)
80004da8:	00a72223          	sw	x10,4(x14)
80004dac:	00f62023          	sw	x15,0(x12)
80004db0:	ee1ff06f          	jal	x0,80004c90 <_free_r+0x98>
80004db4:	14081063          	bne	x16,x0,80004ef4 <_free_r+0x2fc>
80004db8:	00862583          	lw	x11,8(x12)
80004dbc:	00c62603          	lw	x12,12(x12)
80004dc0:	00f686b3          	add	x13,x13,x15
80004dc4:	0016e793          	ori	x15,x13,1
80004dc8:	00c5a623          	sw	x12,12(x11)
80004dcc:	00b62423          	sw	x11,8(x12)
80004dd0:	00f72223          	sw	x15,4(x14)
80004dd4:	00d70733          	add	x14,x14,x13
80004dd8:	00d72023          	sw	x13,0(x14)
80004ddc:	ef9ff06f          	jal	x0,80004cd4 <_free_r+0xdc>
80004de0:	00157513          	andi	x10,x10,1
80004de4:	00d786b3          	add	x13,x15,x13
80004de8:	02051063          	bne	x10,x0,80004e08 <_free_r+0x210>
80004dec:	ff842503          	lw	x10,-8(x8)
80004df0:	40a70733          	sub	x14,x14,x10
80004df4:	00c72783          	lw	x15,12(x14)
80004df8:	00872603          	lw	x12,8(x14)
80004dfc:	00a686b3          	add	x13,x13,x10
80004e00:	00f62623          	sw	x15,12(x12)
80004e04:	00c7a423          	sw	x12,8(x15)
80004e08:	801017b7          	lui	x15,0x80101
80004e0c:	0016e613          	ori	x12,x13,1
80004e10:	6ac7a783          	lw	x15,1708(x15) # 801016ac <__malloc_trim_threshold>
80004e14:	00c72223          	sw	x12,4(x14)
80004e18:	00e5a423          	sw	x14,8(x11)
80004e1c:	eaf6ece3          	bltu	x13,x15,80004cd4 <_free_r+0xdc>
80004e20:	801047b7          	lui	x15,0x80104
80004e24:	1a47a583          	lw	x11,420(x15) # 801041a4 <__malloc_top_pad>
80004e28:	00048513          	addi	x10,x9,0
80004e2c:	c89ff0ef          	jal	x1,80004ab4 <_malloc_trim_r>
80004e30:	ea5ff06f          	jal	x0,80004cd4 <_free_r+0xdc>
80004e34:	00d787b3          	add	x15,x15,x13
80004e38:	f55ff06f          	jal	x0,80004d8c <_free_r+0x194>
80004e3c:	01400613          	addi	x12,x0,20
80004e40:	02d67063          	bgeu	x12,x13,80004e60 <_free_r+0x268>
80004e44:	05400613          	addi	x12,x0,84
80004e48:	06d66463          	bltu	x12,x13,80004eb0 <_free_r+0x2b8>
80004e4c:	00c7d693          	srli	x13,x15,0xc
80004e50:	06f68513          	addi	x10,x13,111
80004e54:	06e68613          	addi	x12,x13,110
80004e58:	00351513          	slli	x10,x10,0x3
80004e5c:	ecdff06f          	jal	x0,80004d28 <_free_r+0x130>
80004e60:	05c68513          	addi	x10,x13,92
80004e64:	05b68613          	addi	x12,x13,91
80004e68:	00351513          	slli	x10,x10,0x3
80004e6c:	ebdff06f          	jal	x0,80004d28 <_free_r+0x130>
80004e70:	00e5aa23          	sw	x14,20(x11)
80004e74:	00e5a823          	sw	x14,16(x11)
80004e78:	0017e693          	ori	x13,x15,1
80004e7c:	00a72623          	sw	x10,12(x14)
80004e80:	00a72423          	sw	x10,8(x14)
80004e84:	00d72223          	sw	x13,4(x14)
80004e88:	00f70733          	add	x14,x14,x15
80004e8c:	00f72023          	sw	x15,0(x14)
80004e90:	e45ff06f          	jal	x0,80004cd4 <_free_r+0xdc>
80004e94:	0045a803          	lw	x16,4(x11)
80004e98:	40265613          	srai	x12,x12,0x2
80004e9c:	00100793          	addi	x15,x0,1
80004ea0:	00c797b3          	sll	x15,x15,x12
80004ea4:	0107e7b3          	or	x15,x15,x16
80004ea8:	00f5a223          	sw	x15,4(x11)
80004eac:	ea9ff06f          	jal	x0,80004d54 <_free_r+0x15c>
80004eb0:	15400613          	addi	x12,x0,340
80004eb4:	00d66c63          	bltu	x12,x13,80004ecc <_free_r+0x2d4>
80004eb8:	00f7d693          	srli	x13,x15,0xf
80004ebc:	07868513          	addi	x10,x13,120
80004ec0:	07768613          	addi	x12,x13,119
80004ec4:	00351513          	slli	x10,x10,0x3
80004ec8:	e61ff06f          	jal	x0,80004d28 <_free_r+0x130>
80004ecc:	55400613          	addi	x12,x0,1364
80004ed0:	00d66c63          	bltu	x12,x13,80004ee8 <_free_r+0x2f0>
80004ed4:	0127d693          	srli	x13,x15,0x12
80004ed8:	07d68513          	addi	x10,x13,125
80004edc:	07c68613          	addi	x12,x13,124
80004ee0:	00351513          	slli	x10,x10,0x3
80004ee4:	e45ff06f          	jal	x0,80004d28 <_free_r+0x130>
80004ee8:	3f800513          	addi	x10,x0,1016
80004eec:	07e00613          	addi	x12,x0,126
80004ef0:	e39ff06f          	jal	x0,80004d28 <_free_r+0x130>
80004ef4:	0017e693          	ori	x13,x15,1
80004ef8:	00d72223          	sw	x13,4(x14)
80004efc:	00f62023          	sw	x15,0(x12)
80004f00:	dd5ff06f          	jal	x0,80004cd4 <_free_r+0xdc>

80004f04 <_malloc_r>:
80004f04:	fd010113          	addi	x2,x2,-48
80004f08:	01312e23          	sw	x19,28(x2)
80004f0c:	02112623          	sw	x1,44(x2)
80004f10:	02812423          	sw	x8,40(x2)
80004f14:	02912223          	sw	x9,36(x2)
80004f18:	03212023          	sw	x18,32(x2)
80004f1c:	00b58793          	addi	x15,x11,11
80004f20:	01600713          	addi	x14,x0,22
80004f24:	00050993          	addi	x19,x10,0
80004f28:	08f76263          	bltu	x14,x15,80004fac <_malloc_r+0xa8>
80004f2c:	01000793          	addi	x15,x0,16
80004f30:	20b7e663          	bltu	x15,x11,8000513c <_malloc_r+0x238>
80004f34:	7a4000ef          	jal	x1,800056d8 <__malloc_lock>
80004f38:	01800793          	addi	x15,x0,24
80004f3c:	00200593          	addi	x11,x0,2
80004f40:	01000493          	addi	x9,x0,16
80004f44:	80101937          	lui	x18,0x80101
80004f48:	13090913          	addi	x18,x18,304 # 80101130 <__malloc_av_>
80004f4c:	00f907b3          	add	x15,x18,x15
80004f50:	0047a403          	lw	x8,4(x15)
80004f54:	ff878713          	addi	x14,x15,-8
80004f58:	34e40e63          	beq	x8,x14,800052b4 <_malloc_r+0x3b0>
80004f5c:	00442783          	lw	x15,4(x8)
80004f60:	00c42683          	lw	x13,12(x8)
80004f64:	00842603          	lw	x12,8(x8)
80004f68:	ffc7f793          	andi	x15,x15,-4
80004f6c:	00f407b3          	add	x15,x8,x15
80004f70:	0047a703          	lw	x14,4(x15)
80004f74:	00d62623          	sw	x13,12(x12)
80004f78:	00c6a423          	sw	x12,8(x13)
80004f7c:	00176713          	ori	x14,x14,1
80004f80:	00098513          	addi	x10,x19,0
80004f84:	00e7a223          	sw	x14,4(x15)
80004f88:	754000ef          	jal	x1,800056dc <__malloc_unlock>
80004f8c:	00840513          	addi	x10,x8,8
80004f90:	02c12083          	lw	x1,44(x2)
80004f94:	02812403          	lw	x8,40(x2)
80004f98:	02412483          	lw	x9,36(x2)
80004f9c:	02012903          	lw	x18,32(x2)
80004fa0:	01c12983          	lw	x19,28(x2)
80004fa4:	03010113          	addi	x2,x2,48
80004fa8:	00008067          	jalr	x0,0(x1)
80004fac:	ff87f493          	andi	x9,x15,-8
80004fb0:	1807c663          	blt	x15,x0,8000513c <_malloc_r+0x238>
80004fb4:	18b4e463          	bltu	x9,x11,8000513c <_malloc_r+0x238>
80004fb8:	720000ef          	jal	x1,800056d8 <__malloc_lock>
80004fbc:	1f700793          	addi	x15,x0,503
80004fc0:	4097f463          	bgeu	x15,x9,800053c8 <_malloc_r+0x4c4>
80004fc4:	0094d793          	srli	x15,x9,0x9
80004fc8:	18078263          	beq	x15,x0,8000514c <_malloc_r+0x248>
80004fcc:	00400713          	addi	x14,x0,4
80004fd0:	34f76a63          	bltu	x14,x15,80005324 <_malloc_r+0x420>
80004fd4:	0064d793          	srli	x15,x9,0x6
80004fd8:	03978593          	addi	x11,x15,57
80004fdc:	03878813          	addi	x16,x15,56
80004fe0:	00359613          	slli	x12,x11,0x3
80004fe4:	80101937          	lui	x18,0x80101
80004fe8:	13090913          	addi	x18,x18,304 # 80101130 <__malloc_av_>
80004fec:	00c90633          	add	x12,x18,x12
80004ff0:	00462403          	lw	x8,4(x12)
80004ff4:	ff860613          	addi	x12,x12,-8
80004ff8:	02860863          	beq	x12,x8,80005028 <_malloc_r+0x124>
80004ffc:	00f00513          	addi	x10,x0,15
80005000:	0140006f          	jal	x0,80005014 <_malloc_r+0x110>
80005004:	00c42683          	lw	x13,12(x8)
80005008:	2a075263          	bge	x14,x0,800052ac <_malloc_r+0x3a8>
8000500c:	00d60e63          	beq	x12,x13,80005028 <_malloc_r+0x124>
80005010:	00068413          	addi	x8,x13,0
80005014:	00442783          	lw	x15,4(x8)
80005018:	ffc7f793          	andi	x15,x15,-4
8000501c:	40978733          	sub	x14,x15,x9
80005020:	fee552e3          	bge	x10,x14,80005004 <_malloc_r+0x100>
80005024:	00080593          	addi	x11,x16,0
80005028:	01092403          	lw	x8,16(x18)
8000502c:	80101837          	lui	x16,0x80101
80005030:	13880813          	addi	x16,x16,312 # 80101138 <__malloc_av_+0x8>
80005034:	27040863          	beq	x8,x16,800052a4 <_malloc_r+0x3a0>
80005038:	00442783          	lw	x15,4(x8)
8000503c:	00f00693          	addi	x13,x0,15
80005040:	ffc7f793          	andi	x15,x15,-4
80005044:	40978733          	sub	x14,x15,x9
80005048:	38e6c663          	blt	x13,x14,800053d4 <_malloc_r+0x4d0>
8000504c:	01092a23          	sw	x16,20(x18)
80005050:	01092823          	sw	x16,16(x18)
80005054:	34075a63          	bge	x14,x0,800053a8 <_malloc_r+0x4a4>
80005058:	1ff00713          	addi	x14,x0,511
8000505c:	00492503          	lw	x10,4(x18)
80005060:	26f76263          	bltu	x14,x15,800052c4 <_malloc_r+0x3c0>
80005064:	ff87f713          	andi	x14,x15,-8
80005068:	00870713          	addi	x14,x14,8
8000506c:	00e90733          	add	x14,x18,x14
80005070:	00072683          	lw	x13,0(x14)
80005074:	0057d613          	srli	x12,x15,0x5
80005078:	00100793          	addi	x15,x0,1
8000507c:	00c797b3          	sll	x15,x15,x12
80005080:	00f56533          	or	x10,x10,x15
80005084:	ff870793          	addi	x15,x14,-8
80005088:	00f42623          	sw	x15,12(x8)
8000508c:	00d42423          	sw	x13,8(x8)
80005090:	00a92223          	sw	x10,4(x18)
80005094:	00872023          	sw	x8,0(x14)
80005098:	0086a623          	sw	x8,12(x13)
8000509c:	4025d793          	srai	x15,x11,0x2
800050a0:	00100613          	addi	x12,x0,1
800050a4:	00f61633          	sll	x12,x12,x15
800050a8:	0ac56a63          	bltu	x10,x12,8000515c <_malloc_r+0x258>
800050ac:	00a677b3          	and	x15,x12,x10
800050b0:	02079463          	bne	x15,x0,800050d8 <_malloc_r+0x1d4>
800050b4:	00161613          	slli	x12,x12,0x1
800050b8:	ffc5f593          	andi	x11,x11,-4
800050bc:	00a677b3          	and	x15,x12,x10
800050c0:	00458593          	addi	x11,x11,4
800050c4:	00079a63          	bne	x15,x0,800050d8 <_malloc_r+0x1d4>
800050c8:	00161613          	slli	x12,x12,0x1
800050cc:	00a677b3          	and	x15,x12,x10
800050d0:	00458593          	addi	x11,x11,4
800050d4:	fe078ae3          	beq	x15,x0,800050c8 <_malloc_r+0x1c4>
800050d8:	00f00893          	addi	x17,x0,15
800050dc:	00359313          	slli	x6,x11,0x3
800050e0:	00690333          	add	x6,x18,x6
800050e4:	00030513          	addi	x10,x6,0
800050e8:	00c52783          	lw	x15,12(x10)
800050ec:	00058e13          	addi	x28,x11,0
800050f0:	24f50c63          	beq	x10,x15,80005348 <_malloc_r+0x444>
800050f4:	0047a703          	lw	x14,4(x15)
800050f8:	00078413          	addi	x8,x15,0
800050fc:	00c7a783          	lw	x15,12(x15)
80005100:	ffc77713          	andi	x14,x14,-4
80005104:	409706b3          	sub	x13,x14,x9
80005108:	24d8cc63          	blt	x17,x13,80005360 <_malloc_r+0x45c>
8000510c:	fe06c2e3          	blt	x13,x0,800050f0 <_malloc_r+0x1ec>
80005110:	00e40733          	add	x14,x8,x14
80005114:	00472683          	lw	x13,4(x14)
80005118:	00842603          	lw	x12,8(x8)
8000511c:	00098513          	addi	x10,x19,0
80005120:	0016e693          	ori	x13,x13,1
80005124:	00d72223          	sw	x13,4(x14)
80005128:	00f62623          	sw	x15,12(x12)
8000512c:	00c7a423          	sw	x12,8(x15)
80005130:	5ac000ef          	jal	x1,800056dc <__malloc_unlock>
80005134:	00840513          	addi	x10,x8,8
80005138:	e59ff06f          	jal	x0,80004f90 <_malloc_r+0x8c>
8000513c:	00c00793          	addi	x15,x0,12
80005140:	00f9a023          	sw	x15,0(x19)
80005144:	00000513          	addi	x10,x0,0
80005148:	e49ff06f          	jal	x0,80004f90 <_malloc_r+0x8c>
8000514c:	20000613          	addi	x12,x0,512
80005150:	04000593          	addi	x11,x0,64
80005154:	03f00813          	addi	x16,x0,63
80005158:	e8dff06f          	jal	x0,80004fe4 <_malloc_r+0xe0>
8000515c:	00892403          	lw	x8,8(x18)
80005160:	01612823          	sw	x22,16(x2)
80005164:	00442783          	lw	x15,4(x8)
80005168:	ffc7fb13          	andi	x22,x15,-4
8000516c:	009b6863          	bltu	x22,x9,8000517c <_malloc_r+0x278>
80005170:	409b0733          	sub	x14,x22,x9
80005174:	00f00793          	addi	x15,x0,15
80005178:	0ee7c463          	blt	x15,x14,80005260 <_malloc_r+0x35c>
8000517c:	801047b7          	lui	x15,0x80104
80005180:	01912223          	sw	x25,4(x2)
80005184:	80101cb7          	lui	x25,0x80101
80005188:	01512a23          	sw	x21,20(x2)
8000518c:	6a8ca703          	lw	x14,1704(x25) # 801016a8 <__malloc_sbrk_base>
80005190:	1a47aa83          	lw	x21,420(x15) # 801041a4 <__malloc_top_pad>
80005194:	01412c23          	sw	x20,24(x2)
80005198:	01712623          	sw	x23,12(x2)
8000519c:	fff00793          	addi	x15,x0,-1
800051a0:	01640a33          	add	x20,x8,x22
800051a4:	01548ab3          	add	x21,x9,x21
800051a8:	3cf70e63          	beq	x14,x15,80005584 <_malloc_r+0x680>
800051ac:	000017b7          	lui	x15,0x1
800051b0:	00f78793          	addi	x15,x15,15 # 100f <_stack_size+0xf>
800051b4:	00fa8ab3          	add	x21,x21,x15
800051b8:	fffff7b7          	lui	x15,0xfffff
800051bc:	00fafab3          	and	x21,x21,x15
800051c0:	000a8593          	addi	x11,x21,0
800051c4:	00098513          	addi	x10,x19,0
800051c8:	721000ef          	jal	x1,800060e8 <_sbrk_r>
800051cc:	fff00793          	addi	x15,x0,-1
800051d0:	00050b93          	addi	x23,x10,0
800051d4:	46f50263          	beq	x10,x15,80005638 <_malloc_r+0x734>
800051d8:	01812423          	sw	x24,8(x2)
800051dc:	25456463          	bltu	x10,x20,80005424 <_malloc_r+0x520>
800051e0:	80104c37          	lui	x24,0x80104
800051e4:	158c0c13          	addi	x24,x24,344 # 80104158 <__malloc_current_mallinfo>
800051e8:	000c2583          	lw	x11,0(x24)
800051ec:	00ba85b3          	add	x11,x21,x11
800051f0:	00bc2023          	sw	x11,0(x24)
800051f4:	00058713          	addi	x14,x11,0
800051f8:	2aaa1c63          	bne	x20,x10,800054b0 <_malloc_r+0x5ac>
800051fc:	01451793          	slli	x15,x10,0x14
80005200:	2a079863          	bne	x15,x0,800054b0 <_malloc_r+0x5ac>
80005204:	00892b83          	lw	x23,8(x18)
80005208:	015b07b3          	add	x15,x22,x21
8000520c:	0017e793          	ori	x15,x15,1
80005210:	00fba223          	sw	x15,4(x23)
80005214:	80104737          	lui	x14,0x80104
80005218:	1a072683          	lw	x13,416(x14) # 801041a0 <__malloc_max_sbrked_mem>
8000521c:	00b6f463          	bgeu	x13,x11,80005224 <_malloc_r+0x320>
80005220:	1ab72023          	sw	x11,416(x14)
80005224:	80104737          	lui	x14,0x80104
80005228:	19c72683          	lw	x13,412(x14) # 8010419c <__malloc_max_total_mem>
8000522c:	00b6f463          	bgeu	x13,x11,80005234 <_malloc_r+0x330>
80005230:	18b72e23          	sw	x11,412(x14)
80005234:	00812c03          	lw	x24,8(x2)
80005238:	000b8413          	addi	x8,x23,0
8000523c:	ffc7f793          	andi	x15,x15,-4
80005240:	40978733          	sub	x14,x15,x9
80005244:	3897ec63          	bltu	x15,x9,800055dc <_malloc_r+0x6d8>
80005248:	00f00793          	addi	x15,x0,15
8000524c:	38e7d863          	bge	x15,x14,800055dc <_malloc_r+0x6d8>
80005250:	01812a03          	lw	x20,24(x2)
80005254:	01412a83          	lw	x21,20(x2)
80005258:	00c12b83          	lw	x23,12(x2)
8000525c:	00412c83          	lw	x25,4(x2)
80005260:	0014e793          	ori	x15,x9,1
80005264:	00f42223          	sw	x15,4(x8)
80005268:	009404b3          	add	x9,x8,x9
8000526c:	00992423          	sw	x9,8(x18)
80005270:	00176713          	ori	x14,x14,1
80005274:	00098513          	addi	x10,x19,0
80005278:	00e4a223          	sw	x14,4(x9)
8000527c:	460000ef          	jal	x1,800056dc <__malloc_unlock>
80005280:	02c12083          	lw	x1,44(x2)
80005284:	00840513          	addi	x10,x8,8
80005288:	02812403          	lw	x8,40(x2)
8000528c:	01012b03          	lw	x22,16(x2)
80005290:	02412483          	lw	x9,36(x2)
80005294:	02012903          	lw	x18,32(x2)
80005298:	01c12983          	lw	x19,28(x2)
8000529c:	03010113          	addi	x2,x2,48
800052a0:	00008067          	jalr	x0,0(x1)
800052a4:	00492503          	lw	x10,4(x18)
800052a8:	df5ff06f          	jal	x0,8000509c <_malloc_r+0x198>
800052ac:	00842603          	lw	x12,8(x8)
800052b0:	cbdff06f          	jal	x0,80004f6c <_malloc_r+0x68>
800052b4:	00c7a403          	lw	x8,12(x15) # fffff00c <_end+0x7fef9e5c>
800052b8:	00258593          	addi	x11,x11,2
800052bc:	d68786e3          	beq	x15,x8,80005028 <_malloc_r+0x124>
800052c0:	c9dff06f          	jal	x0,80004f5c <_malloc_r+0x58>
800052c4:	0097d713          	srli	x14,x15,0x9
800052c8:	00400693          	addi	x13,x0,4
800052cc:	14e6f263          	bgeu	x13,x14,80005410 <_malloc_r+0x50c>
800052d0:	01400693          	addi	x13,x0,20
800052d4:	32e6e663          	bltu	x13,x14,80005600 <_malloc_r+0x6fc>
800052d8:	05c70613          	addi	x12,x14,92
800052dc:	05b70693          	addi	x13,x14,91
800052e0:	00361613          	slli	x12,x12,0x3
800052e4:	00c90633          	add	x12,x18,x12
800052e8:	00062703          	lw	x14,0(x12)
800052ec:	ff860613          	addi	x12,x12,-8
800052f0:	00e61863          	bne	x12,x14,80005300 <_malloc_r+0x3fc>
800052f4:	2980006f          	jal	x0,8000558c <_malloc_r+0x688>
800052f8:	00872703          	lw	x14,8(x14)
800052fc:	00e60863          	beq	x12,x14,8000530c <_malloc_r+0x408>
80005300:	00472683          	lw	x13,4(x14)
80005304:	ffc6f693          	andi	x13,x13,-4
80005308:	fed7e8e3          	bltu	x15,x13,800052f8 <_malloc_r+0x3f4>
8000530c:	00c72603          	lw	x12,12(x14)
80005310:	00c42623          	sw	x12,12(x8)
80005314:	00e42423          	sw	x14,8(x8)
80005318:	00862423          	sw	x8,8(x12)
8000531c:	00872623          	sw	x8,12(x14)
80005320:	d7dff06f          	jal	x0,8000509c <_malloc_r+0x198>
80005324:	01400713          	addi	x14,x0,20
80005328:	10f77863          	bgeu	x14,x15,80005438 <_malloc_r+0x534>
8000532c:	05400713          	addi	x14,x0,84
80005330:	2ef76663          	bltu	x14,x15,8000561c <_malloc_r+0x718>
80005334:	00c4d793          	srli	x15,x9,0xc
80005338:	06f78593          	addi	x11,x15,111
8000533c:	06e78813          	addi	x16,x15,110
80005340:	00359613          	slli	x12,x11,0x3
80005344:	ca1ff06f          	jal	x0,80004fe4 <_malloc_r+0xe0>
80005348:	001e0e13          	addi	x28,x28,1
8000534c:	003e7793          	andi	x15,x28,3
80005350:	00850513          	addi	x10,x10,8
80005354:	10078063          	beq	x15,x0,80005454 <_malloc_r+0x550>
80005358:	00c52783          	lw	x15,12(x10)
8000535c:	d95ff06f          	jal	x0,800050f0 <_malloc_r+0x1ec>
80005360:	00842603          	lw	x12,8(x8)
80005364:	0014e593          	ori	x11,x9,1
80005368:	00b42223          	sw	x11,4(x8)
8000536c:	00f62623          	sw	x15,12(x12)
80005370:	00c7a423          	sw	x12,8(x15)
80005374:	009404b3          	add	x9,x8,x9
80005378:	00992a23          	sw	x9,20(x18)
8000537c:	00992823          	sw	x9,16(x18)
80005380:	0016e793          	ori	x15,x13,1
80005384:	0104a623          	sw	x16,12(x9)
80005388:	0104a423          	sw	x16,8(x9)
8000538c:	00f4a223          	sw	x15,4(x9)
80005390:	00e40733          	add	x14,x8,x14
80005394:	00098513          	addi	x10,x19,0
80005398:	00d72023          	sw	x13,0(x14)
8000539c:	340000ef          	jal	x1,800056dc <__malloc_unlock>
800053a0:	00840513          	addi	x10,x8,8
800053a4:	bedff06f          	jal	x0,80004f90 <_malloc_r+0x8c>
800053a8:	00f407b3          	add	x15,x8,x15
800053ac:	0047a703          	lw	x14,4(x15)
800053b0:	00098513          	addi	x10,x19,0
800053b4:	00176713          	ori	x14,x14,1
800053b8:	00e7a223          	sw	x14,4(x15)
800053bc:	320000ef          	jal	x1,800056dc <__malloc_unlock>
800053c0:	00840513          	addi	x10,x8,8
800053c4:	bcdff06f          	jal	x0,80004f90 <_malloc_r+0x8c>
800053c8:	0034d593          	srli	x11,x9,0x3
800053cc:	00848793          	addi	x15,x9,8
800053d0:	b75ff06f          	jal	x0,80004f44 <_malloc_r+0x40>
800053d4:	0014e693          	ori	x13,x9,1
800053d8:	00d42223          	sw	x13,4(x8)
800053dc:	009404b3          	add	x9,x8,x9
800053e0:	00992a23          	sw	x9,20(x18)
800053e4:	00992823          	sw	x9,16(x18)
800053e8:	00176693          	ori	x13,x14,1
800053ec:	0104a623          	sw	x16,12(x9)
800053f0:	0104a423          	sw	x16,8(x9)
800053f4:	00d4a223          	sw	x13,4(x9)
800053f8:	00f407b3          	add	x15,x8,x15
800053fc:	00098513          	addi	x10,x19,0
80005400:	00e7a023          	sw	x14,0(x15)
80005404:	2d8000ef          	jal	x1,800056dc <__malloc_unlock>
80005408:	00840513          	addi	x10,x8,8
8000540c:	b85ff06f          	jal	x0,80004f90 <_malloc_r+0x8c>
80005410:	0067d713          	srli	x14,x15,0x6
80005414:	03970613          	addi	x12,x14,57
80005418:	03870693          	addi	x13,x14,56
8000541c:	00361613          	slli	x12,x12,0x3
80005420:	ec5ff06f          	jal	x0,800052e4 <_malloc_r+0x3e0>
80005424:	07240c63          	beq	x8,x18,8000549c <_malloc_r+0x598>
80005428:	00892403          	lw	x8,8(x18)
8000542c:	00812c03          	lw	x24,8(x2)
80005430:	00442783          	lw	x15,4(x8)
80005434:	e09ff06f          	jal	x0,8000523c <_malloc_r+0x338>
80005438:	05c78593          	addi	x11,x15,92
8000543c:	05b78813          	addi	x16,x15,91
80005440:	00359613          	slli	x12,x11,0x3
80005444:	ba1ff06f          	jal	x0,80004fe4 <_malloc_r+0xe0>
80005448:	00832783          	lw	x15,8(x6)
8000544c:	fff58593          	addi	x11,x11,-1
80005450:	28679063          	bne	x15,x6,800056d0 <_malloc_r+0x7cc>
80005454:	0035f793          	andi	x15,x11,3
80005458:	ff830313          	addi	x6,x6,-8
8000545c:	fe0796e3          	bne	x15,x0,80005448 <_malloc_r+0x544>
80005460:	00492703          	lw	x14,4(x18)
80005464:	fff64793          	xori	x15,x12,-1
80005468:	00e7f7b3          	and	x15,x15,x14
8000546c:	00f92223          	sw	x15,4(x18)
80005470:	00161613          	slli	x12,x12,0x1
80005474:	cec7e4e3          	bltu	x15,x12,8000515c <_malloc_r+0x258>
80005478:	ce0602e3          	beq	x12,x0,8000515c <_malloc_r+0x258>
8000547c:	00f67733          	and	x14,x12,x15
80005480:	00071a63          	bne	x14,x0,80005494 <_malloc_r+0x590>
80005484:	00161613          	slli	x12,x12,0x1
80005488:	00f67733          	and	x14,x12,x15
8000548c:	004e0e13          	addi	x28,x28,4
80005490:	fe070ae3          	beq	x14,x0,80005484 <_malloc_r+0x580>
80005494:	000e0593          	addi	x11,x28,0
80005498:	c45ff06f          	jal	x0,800050dc <_malloc_r+0x1d8>
8000549c:	80104c37          	lui	x24,0x80104
800054a0:	158c0c13          	addi	x24,x24,344 # 80104158 <__malloc_current_mallinfo>
800054a4:	000c2703          	lw	x14,0(x24)
800054a8:	00ea8733          	add	x14,x21,x14
800054ac:	00ec2023          	sw	x14,0(x24)
800054b0:	6a8ca683          	lw	x13,1704(x25)
800054b4:	fff00793          	addi	x15,x0,-1
800054b8:	18f68663          	beq	x13,x15,80005644 <_malloc_r+0x740>
800054bc:	414b87b3          	sub	x15,x23,x20
800054c0:	00e787b3          	add	x15,x15,x14
800054c4:	00fc2023          	sw	x15,0(x24)
800054c8:	007bfc93          	andi	x25,x23,7
800054cc:	0c0c8c63          	beq	x25,x0,800055a4 <_malloc_r+0x6a0>
800054d0:	419b8bb3          	sub	x23,x23,x25
800054d4:	000017b7          	lui	x15,0x1
800054d8:	00878793          	addi	x15,x15,8 # 1008 <_stack_size+0x8>
800054dc:	008b8b93          	addi	x23,x23,8
800054e0:	419785b3          	sub	x11,x15,x25
800054e4:	015b8ab3          	add	x21,x23,x21
800054e8:	415585b3          	sub	x11,x11,x21
800054ec:	01459593          	slli	x11,x11,0x14
800054f0:	0145da13          	srli	x20,x11,0x14
800054f4:	000a0593          	addi	x11,x20,0
800054f8:	00098513          	addi	x10,x19,0
800054fc:	3ed000ef          	jal	x1,800060e8 <_sbrk_r>
80005500:	fff00793          	addi	x15,x0,-1
80005504:	18f50063          	beq	x10,x15,80005684 <_malloc_r+0x780>
80005508:	41750533          	sub	x10,x10,x23
8000550c:	01450ab3          	add	x21,x10,x20
80005510:	000c2703          	lw	x14,0(x24)
80005514:	01792423          	sw	x23,8(x18)
80005518:	001ae793          	ori	x15,x21,1
8000551c:	00ea05b3          	add	x11,x20,x14
80005520:	00bc2023          	sw	x11,0(x24)
80005524:	00fba223          	sw	x15,4(x23)
80005528:	cf2406e3          	beq	x8,x18,80005214 <_malloc_r+0x310>
8000552c:	00f00693          	addi	x13,x0,15
80005530:	0b66f063          	bgeu	x13,x22,800055d0 <_malloc_r+0x6cc>
80005534:	00442703          	lw	x14,4(x8)
80005538:	ff4b0793          	addi	x15,x22,-12
8000553c:	ff87f793          	andi	x15,x15,-8
80005540:	00177713          	andi	x14,x14,1
80005544:	00f76733          	or	x14,x14,x15
80005548:	00e42223          	sw	x14,4(x8)
8000554c:	00500613          	addi	x12,x0,5
80005550:	00f40733          	add	x14,x8,x15
80005554:	00c72223          	sw	x12,4(x14)
80005558:	00c72423          	sw	x12,8(x14)
8000555c:	00f6e663          	bltu	x13,x15,80005568 <_malloc_r+0x664>
80005560:	004ba783          	lw	x15,4(x23)
80005564:	cb1ff06f          	jal	x0,80005214 <_malloc_r+0x310>
80005568:	00840593          	addi	x11,x8,8
8000556c:	00098513          	addi	x10,x19,0
80005570:	e88ff0ef          	jal	x1,80004bf8 <_free_r>
80005574:	00892b83          	lw	x23,8(x18)
80005578:	000c2583          	lw	x11,0(x24)
8000557c:	004ba783          	lw	x15,4(x23)
80005580:	c95ff06f          	jal	x0,80005214 <_malloc_r+0x310>
80005584:	010a8a93          	addi	x21,x21,16
80005588:	c39ff06f          	jal	x0,800051c0 <_malloc_r+0x2bc>
8000558c:	4026d693          	srai	x13,x13,0x2
80005590:	00100793          	addi	x15,x0,1
80005594:	00d797b3          	sll	x15,x15,x13
80005598:	00f56533          	or	x10,x10,x15
8000559c:	00a92223          	sw	x10,4(x18)
800055a0:	d71ff06f          	jal	x0,80005310 <_malloc_r+0x40c>
800055a4:	015b85b3          	add	x11,x23,x21
800055a8:	40b005b3          	sub	x11,x0,x11
800055ac:	01459593          	slli	x11,x11,0x14
800055b0:	0145da13          	srli	x20,x11,0x14
800055b4:	000a0593          	addi	x11,x20,0
800055b8:	00098513          	addi	x10,x19,0
800055bc:	32d000ef          	jal	x1,800060e8 <_sbrk_r>
800055c0:	fff00793          	addi	x15,x0,-1
800055c4:	f4f512e3          	bne	x10,x15,80005508 <_malloc_r+0x604>
800055c8:	00000a13          	addi	x20,x0,0
800055cc:	f45ff06f          	jal	x0,80005510 <_malloc_r+0x60c>
800055d0:	00812c03          	lw	x24,8(x2)
800055d4:	00100793          	addi	x15,x0,1
800055d8:	00fba223          	sw	x15,4(x23)
800055dc:	00098513          	addi	x10,x19,0
800055e0:	0fc000ef          	jal	x1,800056dc <__malloc_unlock>
800055e4:	00000513          	addi	x10,x0,0
800055e8:	01812a03          	lw	x20,24(x2)
800055ec:	01412a83          	lw	x21,20(x2)
800055f0:	01012b03          	lw	x22,16(x2)
800055f4:	00c12b83          	lw	x23,12(x2)
800055f8:	00412c83          	lw	x25,4(x2)
800055fc:	995ff06f          	jal	x0,80004f90 <_malloc_r+0x8c>
80005600:	05400693          	addi	x13,x0,84
80005604:	04e6e463          	bltu	x13,x14,8000564c <_malloc_r+0x748>
80005608:	00c7d713          	srli	x14,x15,0xc
8000560c:	06f70613          	addi	x12,x14,111
80005610:	06e70693          	addi	x13,x14,110
80005614:	00361613          	slli	x12,x12,0x3
80005618:	ccdff06f          	jal	x0,800052e4 <_malloc_r+0x3e0>
8000561c:	15400713          	addi	x14,x0,340
80005620:	04f76463          	bltu	x14,x15,80005668 <_malloc_r+0x764>
80005624:	00f4d793          	srli	x15,x9,0xf
80005628:	07878593          	addi	x11,x15,120
8000562c:	07778813          	addi	x16,x15,119
80005630:	00359613          	slli	x12,x11,0x3
80005634:	9b1ff06f          	jal	x0,80004fe4 <_malloc_r+0xe0>
80005638:	00892403          	lw	x8,8(x18)
8000563c:	00442783          	lw	x15,4(x8)
80005640:	bfdff06f          	jal	x0,8000523c <_malloc_r+0x338>
80005644:	6b7ca423          	sw	x23,1704(x25)
80005648:	e81ff06f          	jal	x0,800054c8 <_malloc_r+0x5c4>
8000564c:	15400693          	addi	x13,x0,340
80005650:	04e6e463          	bltu	x13,x14,80005698 <_malloc_r+0x794>
80005654:	00f7d713          	srli	x14,x15,0xf
80005658:	07870613          	addi	x12,x14,120
8000565c:	07770693          	addi	x13,x14,119
80005660:	00361613          	slli	x12,x12,0x3
80005664:	c81ff06f          	jal	x0,800052e4 <_malloc_r+0x3e0>
80005668:	55400713          	addi	x14,x0,1364
8000566c:	04f76463          	bltu	x14,x15,800056b4 <_malloc_r+0x7b0>
80005670:	0124d793          	srli	x15,x9,0x12
80005674:	07d78593          	addi	x11,x15,125
80005678:	07c78813          	addi	x16,x15,124
8000567c:	00359613          	slli	x12,x11,0x3
80005680:	965ff06f          	jal	x0,80004fe4 <_malloc_r+0xe0>
80005684:	ff8c8c93          	addi	x25,x25,-8
80005688:	019a8ab3          	add	x21,x21,x25
8000568c:	417a8ab3          	sub	x21,x21,x23
80005690:	00000a13          	addi	x20,x0,0
80005694:	e7dff06f          	jal	x0,80005510 <_malloc_r+0x60c>
80005698:	55400693          	addi	x13,x0,1364
8000569c:	02e6e463          	bltu	x13,x14,800056c4 <_malloc_r+0x7c0>
800056a0:	0127d713          	srli	x14,x15,0x12
800056a4:	07d70613          	addi	x12,x14,125
800056a8:	07c70693          	addi	x13,x14,124
800056ac:	00361613          	slli	x12,x12,0x3
800056b0:	c35ff06f          	jal	x0,800052e4 <_malloc_r+0x3e0>
800056b4:	3f800613          	addi	x12,x0,1016
800056b8:	07f00593          	addi	x11,x0,127
800056bc:	07e00813          	addi	x16,x0,126
800056c0:	925ff06f          	jal	x0,80004fe4 <_malloc_r+0xe0>
800056c4:	3f800613          	addi	x12,x0,1016
800056c8:	07e00693          	addi	x13,x0,126
800056cc:	c19ff06f          	jal	x0,800052e4 <_malloc_r+0x3e0>
800056d0:	00492783          	lw	x15,4(x18)
800056d4:	d9dff06f          	jal	x0,80005470 <_malloc_r+0x56c>

800056d8 <__malloc_lock>:
800056d8:	00008067          	jalr	x0,0(x1)

800056dc <__malloc_unlock>:
800056dc:	00008067          	jalr	x0,0(x1)

800056e0 <_realloc_r>:
800056e0:	fd010113          	addi	x2,x2,-48
800056e4:	02912223          	sw	x9,36(x2)
800056e8:	02112623          	sw	x1,44(x2)
800056ec:	00060493          	addi	x9,x12,0
800056f0:	1e058863          	beq	x11,x0,800058e0 <_realloc_r+0x200>
800056f4:	02812423          	sw	x8,40(x2)
800056f8:	03212023          	sw	x18,32(x2)
800056fc:	00058413          	addi	x8,x11,0
80005700:	01312e23          	sw	x19,28(x2)
80005704:	01512a23          	sw	x21,20(x2)
80005708:	01412c23          	sw	x20,24(x2)
8000570c:	00050913          	addi	x18,x10,0
80005710:	fc9ff0ef          	jal	x1,800056d8 <__malloc_lock>
80005714:	ffc42703          	lw	x14,-4(x8)
80005718:	00b48793          	addi	x15,x9,11
8000571c:	01600693          	addi	x13,x0,22
80005720:	ff840a93          	addi	x21,x8,-8
80005724:	ffc77993          	andi	x19,x14,-4
80005728:	10f6f263          	bgeu	x13,x15,8000582c <_realloc_r+0x14c>
8000572c:	ff87fa13          	andi	x20,x15,-8
80005730:	1007c263          	blt	x15,x0,80005834 <_realloc_r+0x154>
80005734:	109a6063          	bltu	x20,x9,80005834 <_realloc_r+0x154>
80005738:	1349d263          	bge	x19,x20,8000585c <_realloc_r+0x17c>
8000573c:	801017b7          	lui	x15,0x80101
80005740:	01812423          	sw	x24,8(x2)
80005744:	13078c13          	addi	x24,x15,304 # 80101130 <__malloc_av_>
80005748:	008c2603          	lw	x12,8(x24)
8000574c:	013a86b3          	add	x13,x21,x19
80005750:	0046a783          	lw	x15,4(x13)
80005754:	1cd60863          	beq	x12,x13,80005924 <_realloc_r+0x244>
80005758:	ffe7f613          	andi	x12,x15,-2
8000575c:	00c68633          	add	x12,x13,x12
80005760:	00462603          	lw	x12,4(x12)
80005764:	00167613          	andi	x12,x12,1
80005768:	14061a63          	bne	x12,x0,800058bc <_realloc_r+0x1dc>
8000576c:	ffc7f793          	andi	x15,x15,-4
80005770:	00f98633          	add	x12,x19,x15
80005774:	0d465863          	bge	x12,x20,80005844 <_realloc_r+0x164>
80005778:	00177713          	andi	x14,x14,1
8000577c:	02071c63          	bne	x14,x0,800057b4 <_realloc_r+0xd4>
80005780:	01712623          	sw	x23,12(x2)
80005784:	ff842b83          	lw	x23,-8(x8)
80005788:	01612823          	sw	x22,16(x2)
8000578c:	417a8bb3          	sub	x23,x21,x23
80005790:	004ba703          	lw	x14,4(x23)
80005794:	ffc77713          	andi	x14,x14,-4
80005798:	00e787b3          	add	x15,x15,x14
8000579c:	01378b33          	add	x22,x15,x19
800057a0:	334b5c63          	bge	x22,x20,80005ad8 <_realloc_r+0x3f8>
800057a4:	00e98b33          	add	x22,x19,x14
800057a8:	294b5863          	bge	x22,x20,80005a38 <_realloc_r+0x358>
800057ac:	01012b03          	lw	x22,16(x2)
800057b0:	00c12b83          	lw	x23,12(x2)
800057b4:	00048593          	addi	x11,x9,0
800057b8:	00090513          	addi	x10,x18,0
800057bc:	f48ff0ef          	jal	x1,80004f04 <_malloc_r>
800057c0:	00050493          	addi	x9,x10,0
800057c4:	40050863          	beq	x10,x0,80005bd4 <_realloc_r+0x4f4>
800057c8:	ffc42783          	lw	x15,-4(x8)
800057cc:	ff850713          	addi	x14,x10,-8
800057d0:	ffe7f793          	andi	x15,x15,-2
800057d4:	00fa87b3          	add	x15,x21,x15
800057d8:	24e78663          	beq	x15,x14,80005a24 <_realloc_r+0x344>
800057dc:	ffc98613          	addi	x12,x19,-4
800057e0:	02400793          	addi	x15,x0,36
800057e4:	2ec7e463          	bltu	x15,x12,80005acc <_realloc_r+0x3ec>
800057e8:	01300713          	addi	x14,x0,19
800057ec:	20c76a63          	bltu	x14,x12,80005a00 <_realloc_r+0x320>
800057f0:	00050793          	addi	x15,x10,0
800057f4:	00040713          	addi	x14,x8,0
800057f8:	00072683          	lw	x13,0(x14)
800057fc:	00d7a023          	sw	x13,0(x15)
80005800:	00472683          	lw	x13,4(x14)
80005804:	00d7a223          	sw	x13,4(x15)
80005808:	00872703          	lw	x14,8(x14)
8000580c:	00e7a423          	sw	x14,8(x15)
80005810:	00040593          	addi	x11,x8,0
80005814:	00090513          	addi	x10,x18,0
80005818:	be0ff0ef          	jal	x1,80004bf8 <_free_r>
8000581c:	00090513          	addi	x10,x18,0
80005820:	ebdff0ef          	jal	x1,800056dc <__malloc_unlock>
80005824:	00812c03          	lw	x24,8(x2)
80005828:	06c0006f          	jal	x0,80005894 <_realloc_r+0x1b4>
8000582c:	01000a13          	addi	x20,x0,16
80005830:	f09a74e3          	bgeu	x20,x9,80005738 <_realloc_r+0x58>
80005834:	00c00793          	addi	x15,x0,12
80005838:	00f92023          	sw	x15,0(x18)
8000583c:	00000493          	addi	x9,x0,0
80005840:	0540006f          	jal	x0,80005894 <_realloc_r+0x1b4>
80005844:	00c6a783          	lw	x15,12(x13)
80005848:	0086a703          	lw	x14,8(x13)
8000584c:	00812c03          	lw	x24,8(x2)
80005850:	00060993          	addi	x19,x12,0
80005854:	00f72623          	sw	x15,12(x14)
80005858:	00e7a423          	sw	x14,8(x15)
8000585c:	004aa783          	lw	x15,4(x21)
80005860:	414986b3          	sub	x13,x19,x20
80005864:	00f00613          	addi	x12,x0,15
80005868:	0017f793          	andi	x15,x15,1
8000586c:	013a8733          	add	x14,x21,x19
80005870:	08d66263          	bltu	x12,x13,800058f4 <_realloc_r+0x214>
80005874:	0137e7b3          	or	x15,x15,x19
80005878:	00faa223          	sw	x15,4(x21)
8000587c:	00472783          	lw	x15,4(x14)
80005880:	0017e793          	ori	x15,x15,1
80005884:	00f72223          	sw	x15,4(x14)
80005888:	00090513          	addi	x10,x18,0
8000588c:	e51ff0ef          	jal	x1,800056dc <__malloc_unlock>
80005890:	00040493          	addi	x9,x8,0
80005894:	02812403          	lw	x8,40(x2)
80005898:	02c12083          	lw	x1,44(x2)
8000589c:	02012903          	lw	x18,32(x2)
800058a0:	01c12983          	lw	x19,28(x2)
800058a4:	01812a03          	lw	x20,24(x2)
800058a8:	01412a83          	lw	x21,20(x2)
800058ac:	00048513          	addi	x10,x9,0
800058b0:	02412483          	lw	x9,36(x2)
800058b4:	03010113          	addi	x2,x2,48
800058b8:	00008067          	jalr	x0,0(x1)
800058bc:	00177713          	andi	x14,x14,1
800058c0:	ee071ae3          	bne	x14,x0,800057b4 <_realloc_r+0xd4>
800058c4:	01712623          	sw	x23,12(x2)
800058c8:	ff842b83          	lw	x23,-8(x8)
800058cc:	01612823          	sw	x22,16(x2)
800058d0:	417a8bb3          	sub	x23,x21,x23
800058d4:	004ba703          	lw	x14,4(x23)
800058d8:	ffc77713          	andi	x14,x14,-4
800058dc:	ec9ff06f          	jal	x0,800057a4 <_realloc_r+0xc4>
800058e0:	02c12083          	lw	x1,44(x2)
800058e4:	02412483          	lw	x9,36(x2)
800058e8:	00060593          	addi	x11,x12,0
800058ec:	03010113          	addi	x2,x2,48
800058f0:	e14ff06f          	jal	x0,80004f04 <_malloc_r>
800058f4:	0147e7b3          	or	x15,x15,x20
800058f8:	00faa223          	sw	x15,4(x21)
800058fc:	014a85b3          	add	x11,x21,x20
80005900:	0016e693          	ori	x13,x13,1
80005904:	00d5a223          	sw	x13,4(x11)
80005908:	00472783          	lw	x15,4(x14)
8000590c:	00858593          	addi	x11,x11,8
80005910:	00090513          	addi	x10,x18,0
80005914:	0017e793          	ori	x15,x15,1
80005918:	00f72223          	sw	x15,4(x14)
8000591c:	adcff0ef          	jal	x1,80004bf8 <_free_r>
80005920:	f69ff06f          	jal	x0,80005888 <_realloc_r+0x1a8>
80005924:	ffc7f793          	andi	x15,x15,-4
80005928:	013786b3          	add	x13,x15,x19
8000592c:	010a0613          	addi	x12,x20,16
80005930:	26c6d063          	bge	x13,x12,80005b90 <_realloc_r+0x4b0>
80005934:	00177713          	andi	x14,x14,1
80005938:	e6071ee3          	bne	x14,x0,800057b4 <_realloc_r+0xd4>
8000593c:	01712623          	sw	x23,12(x2)
80005940:	ff842b83          	lw	x23,-8(x8)
80005944:	01612823          	sw	x22,16(x2)
80005948:	417a8bb3          	sub	x23,x21,x23
8000594c:	004ba703          	lw	x14,4(x23)
80005950:	ffc77713          	andi	x14,x14,-4
80005954:	00e787b3          	add	x15,x15,x14
80005958:	01378b33          	add	x22,x15,x19
8000595c:	e4cb44e3          	blt	x22,x12,800057a4 <_realloc_r+0xc4>
80005960:	00cba783          	lw	x15,12(x23)
80005964:	008ba703          	lw	x14,8(x23)
80005968:	ffc98613          	addi	x12,x19,-4
8000596c:	02400693          	addi	x13,x0,36
80005970:	00f72623          	sw	x15,12(x14)
80005974:	00e7a423          	sw	x14,8(x15)
80005978:	008b8493          	addi	x9,x23,8
8000597c:	28c6e463          	bltu	x13,x12,80005c04 <_realloc_r+0x524>
80005980:	01300713          	addi	x14,x0,19
80005984:	00048793          	addi	x15,x9,0
80005988:	02c77263          	bgeu	x14,x12,800059ac <_realloc_r+0x2cc>
8000598c:	00042703          	lw	x14,0(x8)
80005990:	01b00793          	addi	x15,x0,27
80005994:	00eba423          	sw	x14,8(x23)
80005998:	00442703          	lw	x14,4(x8)
8000599c:	00eba623          	sw	x14,12(x23)
800059a0:	26c7ea63          	bltu	x15,x12,80005c14 <_realloc_r+0x534>
800059a4:	00840413          	addi	x8,x8,8
800059a8:	010b8793          	addi	x15,x23,16
800059ac:	00042703          	lw	x14,0(x8)
800059b0:	00e7a023          	sw	x14,0(x15)
800059b4:	00442703          	lw	x14,4(x8)
800059b8:	00e7a223          	sw	x14,4(x15)
800059bc:	00842703          	lw	x14,8(x8)
800059c0:	00e7a423          	sw	x14,8(x15)
800059c4:	014b8733          	add	x14,x23,x20
800059c8:	414b0b33          	sub	x22,x22,x20
800059cc:	00ec2423          	sw	x14,8(x24)
800059d0:	001b6793          	ori	x15,x22,1
800059d4:	00f72223          	sw	x15,4(x14)
800059d8:	004ba783          	lw	x15,4(x23)
800059dc:	00090513          	addi	x10,x18,0
800059e0:	0017f793          	andi	x15,x15,1
800059e4:	0147e7b3          	or	x15,x15,x20
800059e8:	00fba223          	sw	x15,4(x23)
800059ec:	cf1ff0ef          	jal	x1,800056dc <__malloc_unlock>
800059f0:	01012b03          	lw	x22,16(x2)
800059f4:	00c12b83          	lw	x23,12(x2)
800059f8:	00812c03          	lw	x24,8(x2)
800059fc:	e99ff06f          	jal	x0,80005894 <_realloc_r+0x1b4>
80005a00:	00042683          	lw	x13,0(x8)
80005a04:	01b00713          	addi	x14,x0,27
80005a08:	00d52023          	sw	x13,0(x10)
80005a0c:	00442683          	lw	x13,4(x8)
80005a10:	00d52223          	sw	x13,4(x10)
80005a14:	14c76e63          	bltu	x14,x12,80005b70 <_realloc_r+0x490>
80005a18:	00840713          	addi	x14,x8,8
80005a1c:	00850793          	addi	x15,x10,8
80005a20:	dd9ff06f          	jal	x0,800057f8 <_realloc_r+0x118>
80005a24:	ffc52783          	lw	x15,-4(x10)
80005a28:	00812c03          	lw	x24,8(x2)
80005a2c:	ffc7f793          	andi	x15,x15,-4
80005a30:	00f989b3          	add	x19,x19,x15
80005a34:	e29ff06f          	jal	x0,8000585c <_realloc_r+0x17c>
80005a38:	00cba783          	lw	x15,12(x23)
80005a3c:	008ba703          	lw	x14,8(x23)
80005a40:	ffc98613          	addi	x12,x19,-4
80005a44:	02400693          	addi	x13,x0,36
80005a48:	00f72623          	sw	x15,12(x14)
80005a4c:	00e7a423          	sw	x14,8(x15)
80005a50:	008b8493          	addi	x9,x23,8
80005a54:	10c6e663          	bltu	x13,x12,80005b60 <_realloc_r+0x480>
80005a58:	01300713          	addi	x14,x0,19
80005a5c:	00048793          	addi	x15,x9,0
80005a60:	02c77c63          	bgeu	x14,x12,80005a98 <_realloc_r+0x3b8>
80005a64:	00042703          	lw	x14,0(x8)
80005a68:	01b00793          	addi	x15,x0,27
80005a6c:	00eba423          	sw	x14,8(x23)
80005a70:	00442703          	lw	x14,4(x8)
80005a74:	00eba623          	sw	x14,12(x23)
80005a78:	14c7f863          	bgeu	x15,x12,80005bc8 <_realloc_r+0x4e8>
80005a7c:	00842783          	lw	x15,8(x8)
80005a80:	00fba823          	sw	x15,16(x23)
80005a84:	00c42783          	lw	x15,12(x8)
80005a88:	00fbaa23          	sw	x15,20(x23)
80005a8c:	0ad60c63          	beq	x12,x13,80005b44 <_realloc_r+0x464>
80005a90:	01040413          	addi	x8,x8,16
80005a94:	018b8793          	addi	x15,x23,24
80005a98:	00042703          	lw	x14,0(x8)
80005a9c:	00e7a023          	sw	x14,0(x15)
80005aa0:	00442703          	lw	x14,4(x8)
80005aa4:	00e7a223          	sw	x14,4(x15)
80005aa8:	00842703          	lw	x14,8(x8)
80005aac:	00e7a423          	sw	x14,8(x15)
80005ab0:	000b0993          	addi	x19,x22,0
80005ab4:	000b8a93          	addi	x21,x23,0
80005ab8:	01012b03          	lw	x22,16(x2)
80005abc:	00c12b83          	lw	x23,12(x2)
80005ac0:	00812c03          	lw	x24,8(x2)
80005ac4:	00048413          	addi	x8,x9,0
80005ac8:	d95ff06f          	jal	x0,8000585c <_realloc_r+0x17c>
80005acc:	00040593          	addi	x11,x8,0
80005ad0:	bb5fe0ef          	jal	x1,80004684 <memmove>
80005ad4:	d3dff06f          	jal	x0,80005810 <_realloc_r+0x130>
80005ad8:	00c6a783          	lw	x15,12(x13)
80005adc:	0086a703          	lw	x14,8(x13)
80005ae0:	ffc98613          	addi	x12,x19,-4
80005ae4:	02400693          	addi	x13,x0,36
80005ae8:	00f72623          	sw	x15,12(x14)
80005aec:	00e7a423          	sw	x14,8(x15)
80005af0:	008ba703          	lw	x14,8(x23)
80005af4:	00cba783          	lw	x15,12(x23)
80005af8:	008b8493          	addi	x9,x23,8
80005afc:	00f72623          	sw	x15,12(x14)
80005b00:	00e7a423          	sw	x14,8(x15)
80005b04:	04c6ee63          	bltu	x13,x12,80005b60 <_realloc_r+0x480>
80005b08:	01300713          	addi	x14,x0,19
80005b0c:	00048793          	addi	x15,x9,0
80005b10:	f8c774e3          	bgeu	x14,x12,80005a98 <_realloc_r+0x3b8>
80005b14:	00042703          	lw	x14,0(x8)
80005b18:	01b00793          	addi	x15,x0,27
80005b1c:	00eba423          	sw	x14,8(x23)
80005b20:	00442703          	lw	x14,4(x8)
80005b24:	00eba623          	sw	x14,12(x23)
80005b28:	0ac7f063          	bgeu	x15,x12,80005bc8 <_realloc_r+0x4e8>
80005b2c:	00842703          	lw	x14,8(x8)
80005b30:	02400793          	addi	x15,x0,36
80005b34:	00eba823          	sw	x14,16(x23)
80005b38:	00c42703          	lw	x14,12(x8)
80005b3c:	00ebaa23          	sw	x14,20(x23)
80005b40:	f4f618e3          	bne	x12,x15,80005a90 <_realloc_r+0x3b0>
80005b44:	01042703          	lw	x14,16(x8)
80005b48:	020b8793          	addi	x15,x23,32
80005b4c:	01840413          	addi	x8,x8,24
80005b50:	00ebac23          	sw	x14,24(x23)
80005b54:	ffc42703          	lw	x14,-4(x8)
80005b58:	00ebae23          	sw	x14,28(x23)
80005b5c:	f3dff06f          	jal	x0,80005a98 <_realloc_r+0x3b8>
80005b60:	00040593          	addi	x11,x8,0
80005b64:	00048513          	addi	x10,x9,0
80005b68:	b1dfe0ef          	jal	x1,80004684 <memmove>
80005b6c:	f45ff06f          	jal	x0,80005ab0 <_realloc_r+0x3d0>
80005b70:	00842703          	lw	x14,8(x8)
80005b74:	00e52423          	sw	x14,8(x10)
80005b78:	00c42703          	lw	x14,12(x8)
80005b7c:	00e52623          	sw	x14,12(x10)
80005b80:	06f60463          	beq	x12,x15,80005be8 <_realloc_r+0x508>
80005b84:	01040713          	addi	x14,x8,16
80005b88:	01050793          	addi	x15,x10,16
80005b8c:	c6dff06f          	jal	x0,800057f8 <_realloc_r+0x118>
80005b90:	014a8ab3          	add	x21,x21,x20
80005b94:	414686b3          	sub	x13,x13,x20
80005b98:	015c2423          	sw	x21,8(x24)
80005b9c:	0016e793          	ori	x15,x13,1
80005ba0:	00faa223          	sw	x15,4(x21)
80005ba4:	ffc42783          	lw	x15,-4(x8)
80005ba8:	00090513          	addi	x10,x18,0
80005bac:	00040493          	addi	x9,x8,0
80005bb0:	0017f793          	andi	x15,x15,1
80005bb4:	0147e7b3          	or	x15,x15,x20
80005bb8:	fef42e23          	sw	x15,-4(x8)
80005bbc:	b21ff0ef          	jal	x1,800056dc <__malloc_unlock>
80005bc0:	00812c03          	lw	x24,8(x2)
80005bc4:	cd1ff06f          	jal	x0,80005894 <_realloc_r+0x1b4>
80005bc8:	00840413          	addi	x8,x8,8
80005bcc:	010b8793          	addi	x15,x23,16
80005bd0:	ec9ff06f          	jal	x0,80005a98 <_realloc_r+0x3b8>
80005bd4:	00090513          	addi	x10,x18,0
80005bd8:	b05ff0ef          	jal	x1,800056dc <__malloc_unlock>
80005bdc:	00000493          	addi	x9,x0,0
80005be0:	00812c03          	lw	x24,8(x2)
80005be4:	cb1ff06f          	jal	x0,80005894 <_realloc_r+0x1b4>
80005be8:	01042683          	lw	x13,16(x8)
80005bec:	01840713          	addi	x14,x8,24
80005bf0:	01850793          	addi	x15,x10,24
80005bf4:	00d52823          	sw	x13,16(x10)
80005bf8:	01442683          	lw	x13,20(x8)
80005bfc:	00d52a23          	sw	x13,20(x10)
80005c00:	bf9ff06f          	jal	x0,800057f8 <_realloc_r+0x118>
80005c04:	00040593          	addi	x11,x8,0
80005c08:	00048513          	addi	x10,x9,0
80005c0c:	a79fe0ef          	jal	x1,80004684 <memmove>
80005c10:	db5ff06f          	jal	x0,800059c4 <_realloc_r+0x2e4>
80005c14:	00842783          	lw	x15,8(x8)
80005c18:	00fba823          	sw	x15,16(x23)
80005c1c:	00c42783          	lw	x15,12(x8)
80005c20:	00fbaa23          	sw	x15,20(x23)
80005c24:	00d60863          	beq	x12,x13,80005c34 <_realloc_r+0x554>
80005c28:	01040413          	addi	x8,x8,16
80005c2c:	018b8793          	addi	x15,x23,24
80005c30:	d7dff06f          	jal	x0,800059ac <_realloc_r+0x2cc>
80005c34:	01042703          	lw	x14,16(x8)
80005c38:	020b8793          	addi	x15,x23,32
80005c3c:	01840413          	addi	x8,x8,24
80005c40:	00ebac23          	sw	x14,24(x23)
80005c44:	ffc42703          	lw	x14,-4(x8)
80005c48:	00ebae23          	sw	x14,28(x23)
80005c4c:	d61ff06f          	jal	x0,800059ac <_realloc_r+0x2cc>

80005c50 <_fclose_r>:
80005c50:	ff010113          	addi	x2,x2,-16
80005c54:	00112623          	sw	x1,12(x2)
80005c58:	01212023          	sw	x18,0(x2)
80005c5c:	02058863          	beq	x11,x0,80005c8c <_fclose_r+0x3c>
80005c60:	00812423          	sw	x8,8(x2)
80005c64:	00912223          	sw	x9,4(x2)
80005c68:	00058413          	addi	x8,x11,0
80005c6c:	00050493          	addi	x9,x10,0
80005c70:	00050663          	beq	x10,x0,80005c7c <_fclose_r+0x2c>
80005c74:	03452783          	lw	x15,52(x10)
80005c78:	0c078c63          	beq	x15,x0,80005d50 <_fclose_r+0x100>
80005c7c:	00c41783          	lh	x15,12(x8)
80005c80:	02079263          	bne	x15,x0,80005ca4 <_fclose_r+0x54>
80005c84:	00812403          	lw	x8,8(x2)
80005c88:	00412483          	lw	x9,4(x2)
80005c8c:	00c12083          	lw	x1,12(x2)
80005c90:	00000913          	addi	x18,x0,0
80005c94:	00090513          	addi	x10,x18,0
80005c98:	00012903          	lw	x18,0(x2)
80005c9c:	01010113          	addi	x2,x2,16
80005ca0:	00008067          	jalr	x0,0(x1)
80005ca4:	00040593          	addi	x11,x8,0
80005ca8:	00048513          	addi	x10,x9,0
80005cac:	8f9fd0ef          	jal	x1,800035a4 <__sflush_r>
80005cb0:	02c42783          	lw	x15,44(x8)
80005cb4:	00050913          	addi	x18,x10,0
80005cb8:	00078a63          	beq	x15,x0,80005ccc <_fclose_r+0x7c>
80005cbc:	01c42583          	lw	x11,28(x8)
80005cc0:	00048513          	addi	x10,x9,0
80005cc4:	000780e7          	jalr	x1,0(x15)
80005cc8:	06054463          	blt	x10,x0,80005d30 <_fclose_r+0xe0>
80005ccc:	00c45783          	lhu	x15,12(x8)
80005cd0:	0807f793          	andi	x15,x15,128
80005cd4:	06079663          	bne	x15,x0,80005d40 <_fclose_r+0xf0>
80005cd8:	03042583          	lw	x11,48(x8)
80005cdc:	00058c63          	beq	x11,x0,80005cf4 <_fclose_r+0xa4>
80005ce0:	04040793          	addi	x15,x8,64
80005ce4:	00f58663          	beq	x11,x15,80005cf0 <_fclose_r+0xa0>
80005ce8:	00048513          	addi	x10,x9,0
80005cec:	f0dfe0ef          	jal	x1,80004bf8 <_free_r>
80005cf0:	02042823          	sw	x0,48(x8)
80005cf4:	04442583          	lw	x11,68(x8)
80005cf8:	00058863          	beq	x11,x0,80005d08 <_fclose_r+0xb8>
80005cfc:	00048513          	addi	x10,x9,0
80005d00:	ef9fe0ef          	jal	x1,80004bf8 <_free_r>
80005d04:	04042223          	sw	x0,68(x8)
80005d08:	d69fd0ef          	jal	x1,80003a70 <__sfp_lock_acquire>
80005d0c:	00041623          	sh	x0,12(x8)
80005d10:	d65fd0ef          	jal	x1,80003a74 <__sfp_lock_release>
80005d14:	00c12083          	lw	x1,12(x2)
80005d18:	00812403          	lw	x8,8(x2)
80005d1c:	00412483          	lw	x9,4(x2)
80005d20:	00090513          	addi	x10,x18,0
80005d24:	00012903          	lw	x18,0(x2)
80005d28:	01010113          	addi	x2,x2,16
80005d2c:	00008067          	jalr	x0,0(x1)
80005d30:	00c45783          	lhu	x15,12(x8)
80005d34:	fff00913          	addi	x18,x0,-1
80005d38:	0807f793          	andi	x15,x15,128
80005d3c:	f8078ee3          	beq	x15,x0,80005cd8 <_fclose_r+0x88>
80005d40:	01042583          	lw	x11,16(x8)
80005d44:	00048513          	addi	x10,x9,0
80005d48:	eb1fe0ef          	jal	x1,80004bf8 <_free_r>
80005d4c:	f8dff06f          	jal	x0,80005cd8 <_fclose_r+0x88>
80005d50:	cf9fd0ef          	jal	x1,80003a48 <__sinit>
80005d54:	f29ff06f          	jal	x0,80005c7c <_fclose_r+0x2c>

80005d58 <__smakebuf_r>:
80005d58:	00c59783          	lh	x15,12(x11)
80005d5c:	f8010113          	addi	x2,x2,-128
80005d60:	06812c23          	sw	x8,120(x2)
80005d64:	06112e23          	sw	x1,124(x2)
80005d68:	0027f713          	andi	x14,x15,2
80005d6c:	00058413          	addi	x8,x11,0
80005d70:	02070463          	beq	x14,x0,80005d98 <__smakebuf_r+0x40>
80005d74:	04358793          	addi	x15,x11,67
80005d78:	00f5a023          	sw	x15,0(x11)
80005d7c:	00f5a823          	sw	x15,16(x11)
80005d80:	00100793          	addi	x15,x0,1
80005d84:	00f5aa23          	sw	x15,20(x11)
80005d88:	07c12083          	lw	x1,124(x2)
80005d8c:	07812403          	lw	x8,120(x2)
80005d90:	08010113          	addi	x2,x2,128
80005d94:	00008067          	jalr	x0,0(x1)
80005d98:	00e59583          	lh	x11,14(x11)
80005d9c:	06912a23          	sw	x9,116(x2)
80005da0:	07212823          	sw	x18,112(x2)
80005da4:	07312623          	sw	x19,108(x2)
80005da8:	07412423          	sw	x20,104(x2)
80005dac:	00050493          	addi	x9,x10,0
80005db0:	0805c663          	blt	x11,x0,80005e3c <__smakebuf_r+0xe4>
80005db4:	00810613          	addi	x12,x2,8
80005db8:	1fc000ef          	jal	x1,80005fb4 <_fstat_r>
80005dbc:	06054e63          	blt	x10,x0,80005e38 <__smakebuf_r+0xe0>
80005dc0:	00c12783          	lw	x15,12(x2)
80005dc4:	0000f937          	lui	x18,0xf
80005dc8:	000019b7          	lui	x19,0x1
80005dcc:	00f97933          	and	x18,x18,x15
80005dd0:	ffffe7b7          	lui	x15,0xffffe
80005dd4:	00f90933          	add	x18,x18,x15
80005dd8:	00193913          	sltiu	x18,x18,1
80005ddc:	40000a13          	addi	x20,x0,1024
80005de0:	80098993          	addi	x19,x19,-2048 # 800 <_heap_size+0x800>
80005de4:	000a0593          	addi	x11,x20,0
80005de8:	00048513          	addi	x10,x9,0
80005dec:	918ff0ef          	jal	x1,80004f04 <_malloc_r>
80005df0:	00c41783          	lh	x15,12(x8)
80005df4:	06050863          	beq	x10,x0,80005e64 <__smakebuf_r+0x10c>
80005df8:	0807e793          	ori	x15,x15,128
80005dfc:	00a42023          	sw	x10,0(x8)
80005e00:	00a42823          	sw	x10,16(x8)
80005e04:	00f41623          	sh	x15,12(x8)
80005e08:	01442a23          	sw	x20,20(x8)
80005e0c:	0a091063          	bne	x18,x0,80005eac <__smakebuf_r+0x154>
80005e10:	0137e7b3          	or	x15,x15,x19
80005e14:	07c12083          	lw	x1,124(x2)
80005e18:	00f41623          	sh	x15,12(x8)
80005e1c:	07812403          	lw	x8,120(x2)
80005e20:	07412483          	lw	x9,116(x2)
80005e24:	07012903          	lw	x18,112(x2)
80005e28:	06c12983          	lw	x19,108(x2)
80005e2c:	06812a03          	lw	x20,104(x2)
80005e30:	08010113          	addi	x2,x2,128
80005e34:	00008067          	jalr	x0,0(x1)
80005e38:	00c41783          	lh	x15,12(x8)
80005e3c:	0807f793          	andi	x15,x15,128
80005e40:	00000913          	addi	x18,x0,0
80005e44:	04078e63          	beq	x15,x0,80005ea0 <__smakebuf_r+0x148>
80005e48:	04000a13          	addi	x20,x0,64
80005e4c:	000a0593          	addi	x11,x20,0
80005e50:	00048513          	addi	x10,x9,0
80005e54:	8b0ff0ef          	jal	x1,80004f04 <_malloc_r>
80005e58:	00c41783          	lh	x15,12(x8)
80005e5c:	00000993          	addi	x19,x0,0
80005e60:	f8051ce3          	bne	x10,x0,80005df8 <__smakebuf_r+0xa0>
80005e64:	2007f713          	andi	x14,x15,512
80005e68:	04071e63          	bne	x14,x0,80005ec4 <__smakebuf_r+0x16c>
80005e6c:	ffc7f793          	andi	x15,x15,-4
80005e70:	0027e793          	ori	x15,x15,2
80005e74:	04340713          	addi	x14,x8,67
80005e78:	00f41623          	sh	x15,12(x8)
80005e7c:	00100793          	addi	x15,x0,1
80005e80:	07412483          	lw	x9,116(x2)
80005e84:	07012903          	lw	x18,112(x2)
80005e88:	06c12983          	lw	x19,108(x2)
80005e8c:	06812a03          	lw	x20,104(x2)
80005e90:	00e42023          	sw	x14,0(x8)
80005e94:	00e42823          	sw	x14,16(x8)
80005e98:	00f42a23          	sw	x15,20(x8)
80005e9c:	eedff06f          	jal	x0,80005d88 <__smakebuf_r+0x30>
80005ea0:	40000a13          	addi	x20,x0,1024
80005ea4:	00000993          	addi	x19,x0,0
80005ea8:	f3dff06f          	jal	x0,80005de4 <__smakebuf_r+0x8c>
80005eac:	00e41583          	lh	x11,14(x8)
80005eb0:	00048513          	addi	x10,x9,0
80005eb4:	168000ef          	jal	x1,8000601c <_isatty_r>
80005eb8:	02051063          	bne	x10,x0,80005ed8 <__smakebuf_r+0x180>
80005ebc:	00c41783          	lh	x15,12(x8)
80005ec0:	f51ff06f          	jal	x0,80005e10 <__smakebuf_r+0xb8>
80005ec4:	07412483          	lw	x9,116(x2)
80005ec8:	07012903          	lw	x18,112(x2)
80005ecc:	06c12983          	lw	x19,108(x2)
80005ed0:	06812a03          	lw	x20,104(x2)
80005ed4:	eb5ff06f          	jal	x0,80005d88 <__smakebuf_r+0x30>
80005ed8:	00c45783          	lhu	x15,12(x8)
80005edc:	ffc7f793          	andi	x15,x15,-4
80005ee0:	0017e793          	ori	x15,x15,1
80005ee4:	01079793          	slli	x15,x15,0x10
80005ee8:	4107d793          	srai	x15,x15,0x10
80005eec:	f25ff06f          	jal	x0,80005e10 <__smakebuf_r+0xb8>

80005ef0 <raise>:
80005ef0:	ff010113          	addi	x2,x2,-16
80005ef4:	00912223          	sw	x9,4(x2)
80005ef8:	80101737          	lui	x14,0x80101
80005efc:	00112623          	sw	x1,12(x2)
80005f00:	01f00793          	addi	x15,x0,31
80005f04:	6a472483          	lw	x9,1700(x14) # 801016a4 <_impure_ptr>
80005f08:	08a7ee63          	bltu	x15,x10,80005fa4 <raise+0xb4>
80005f0c:	1184a783          	lw	x15,280(x9)
80005f10:	00812423          	sw	x8,8(x2)
80005f14:	00050413          	addi	x8,x10,0
80005f18:	04078263          	beq	x15,x0,80005f5c <raise+0x6c>
80005f1c:	00251713          	slli	x14,x10,0x2
80005f20:	00e787b3          	add	x15,x15,x14
80005f24:	0007a703          	lw	x14,0(x15) # ffffe000 <_end+0x7fef8e50>
80005f28:	02070a63          	beq	x14,x0,80005f5c <raise+0x6c>
80005f2c:	00100693          	addi	x13,x0,1
80005f30:	00d70a63          	beq	x14,x13,80005f44 <raise+0x54>
80005f34:	fff00693          	addi	x13,x0,-1
80005f38:	04d70663          	beq	x14,x13,80005f84 <raise+0x94>
80005f3c:	0007a023          	sw	x0,0(x15)
80005f40:	000700e7          	jalr	x1,0(x14)
80005f44:	00812403          	lw	x8,8(x2)
80005f48:	00000513          	addi	x10,x0,0
80005f4c:	00c12083          	lw	x1,12(x2)
80005f50:	00412483          	lw	x9,4(x2)
80005f54:	01010113          	addi	x2,x2,16
80005f58:	00008067          	jalr	x0,0(x1)
80005f5c:	00048513          	addi	x10,x9,0
80005f60:	184000ef          	jal	x1,800060e4 <_getpid_r>
80005f64:	00040613          	addi	x12,x8,0
80005f68:	00812403          	lw	x8,8(x2)
80005f6c:	00c12083          	lw	x1,12(x2)
80005f70:	00050593          	addi	x11,x10,0
80005f74:	00048513          	addi	x10,x9,0
80005f78:	00412483          	lw	x9,4(x2)
80005f7c:	01010113          	addi	x2,x2,16
80005f80:	0fc0006f          	jal	x0,8000607c <_kill_r>
80005f84:	00812403          	lw	x8,8(x2)
80005f88:	00c12083          	lw	x1,12(x2)
80005f8c:	01600793          	addi	x15,x0,22
80005f90:	00f4a023          	sw	x15,0(x9)
80005f94:	00100513          	addi	x10,x0,1
80005f98:	00412483          	lw	x9,4(x2)
80005f9c:	01010113          	addi	x2,x2,16
80005fa0:	00008067          	jalr	x0,0(x1)
80005fa4:	01600793          	addi	x15,x0,22
80005fa8:	00f4a023          	sw	x15,0(x9)
80005fac:	fff00513          	addi	x10,x0,-1
80005fb0:	f9dff06f          	jal	x0,80005f4c <raise+0x5c>

80005fb4 <_fstat_r>:
80005fb4:	ff010113          	addi	x2,x2,-16
80005fb8:	00058713          	addi	x14,x11,0
80005fbc:	00812423          	sw	x8,8(x2)
80005fc0:	00912223          	sw	x9,4(x2)
80005fc4:	00050413          	addi	x8,x10,0
80005fc8:	801044b7          	lui	x9,0x80104
80005fcc:	00060593          	addi	x11,x12,0
80005fd0:	00070513          	addi	x10,x14,0
80005fd4:	00112623          	sw	x1,12(x2)
80005fd8:	1804ac23          	sw	x0,408(x9) # 80104198 <errno>
80005fdc:	278000ef          	jal	x1,80006254 <_fstat>
80005fe0:	fff00793          	addi	x15,x0,-1
80005fe4:	00f50c63          	beq	x10,x15,80005ffc <_fstat_r+0x48>
80005fe8:	00c12083          	lw	x1,12(x2)
80005fec:	00812403          	lw	x8,8(x2)
80005ff0:	00412483          	lw	x9,4(x2)
80005ff4:	01010113          	addi	x2,x2,16
80005ff8:	00008067          	jalr	x0,0(x1)
80005ffc:	1984a783          	lw	x15,408(x9)
80006000:	fe0784e3          	beq	x15,x0,80005fe8 <_fstat_r+0x34>
80006004:	00c12083          	lw	x1,12(x2)
80006008:	00f42023          	sw	x15,0(x8)
8000600c:	00812403          	lw	x8,8(x2)
80006010:	00412483          	lw	x9,4(x2)
80006014:	01010113          	addi	x2,x2,16
80006018:	00008067          	jalr	x0,0(x1)

8000601c <_isatty_r>:
8000601c:	ff010113          	addi	x2,x2,-16
80006020:	00812423          	sw	x8,8(x2)
80006024:	00912223          	sw	x9,4(x2)
80006028:	00050413          	addi	x8,x10,0
8000602c:	801044b7          	lui	x9,0x80104
80006030:	00058513          	addi	x10,x11,0
80006034:	00112623          	sw	x1,12(x2)
80006038:	1804ac23          	sw	x0,408(x9) # 80104198 <errno>
8000603c:	280000ef          	jal	x1,800062bc <_isatty>
80006040:	fff00793          	addi	x15,x0,-1
80006044:	00f50c63          	beq	x10,x15,8000605c <_isatty_r+0x40>
80006048:	00c12083          	lw	x1,12(x2)
8000604c:	00812403          	lw	x8,8(x2)
80006050:	00412483          	lw	x9,4(x2)
80006054:	01010113          	addi	x2,x2,16
80006058:	00008067          	jalr	x0,0(x1)
8000605c:	1984a783          	lw	x15,408(x9)
80006060:	fe0784e3          	beq	x15,x0,80006048 <_isatty_r+0x2c>
80006064:	00c12083          	lw	x1,12(x2)
80006068:	00f42023          	sw	x15,0(x8)
8000606c:	00812403          	lw	x8,8(x2)
80006070:	00412483          	lw	x9,4(x2)
80006074:	01010113          	addi	x2,x2,16
80006078:	00008067          	jalr	x0,0(x1)

8000607c <_kill_r>:
8000607c:	ff010113          	addi	x2,x2,-16
80006080:	00058713          	addi	x14,x11,0
80006084:	00812423          	sw	x8,8(x2)
80006088:	00912223          	sw	x9,4(x2)
8000608c:	00050413          	addi	x8,x10,0
80006090:	801044b7          	lui	x9,0x80104
80006094:	00060593          	addi	x11,x12,0
80006098:	00070513          	addi	x10,x14,0
8000609c:	00112623          	sw	x1,12(x2)
800060a0:	1804ac23          	sw	x0,408(x9) # 80104198 <errno>
800060a4:	258000ef          	jal	x1,800062fc <_kill>
800060a8:	fff00793          	addi	x15,x0,-1
800060ac:	00f50c63          	beq	x10,x15,800060c4 <_kill_r+0x48>
800060b0:	00c12083          	lw	x1,12(x2)
800060b4:	00812403          	lw	x8,8(x2)
800060b8:	00412483          	lw	x9,4(x2)
800060bc:	01010113          	addi	x2,x2,16
800060c0:	00008067          	jalr	x0,0(x1)
800060c4:	1984a783          	lw	x15,408(x9)
800060c8:	fe0784e3          	beq	x15,x0,800060b0 <_kill_r+0x34>
800060cc:	00c12083          	lw	x1,12(x2)
800060d0:	00f42023          	sw	x15,0(x8)
800060d4:	00812403          	lw	x8,8(x2)
800060d8:	00412483          	lw	x9,4(x2)
800060dc:	01010113          	addi	x2,x2,16
800060e0:	00008067          	jalr	x0,0(x1)

800060e4 <_getpid_r>:
800060e4:	1d00006f          	jal	x0,800062b4 <_getpid>

800060e8 <_sbrk_r>:
800060e8:	ff010113          	addi	x2,x2,-16
800060ec:	00812423          	sw	x8,8(x2)
800060f0:	00912223          	sw	x9,4(x2)
800060f4:	00050413          	addi	x8,x10,0
800060f8:	801044b7          	lui	x9,0x80104
800060fc:	00058513          	addi	x10,x11,0
80006100:	00112623          	sw	x1,12(x2)
80006104:	1804ac23          	sw	x0,408(x9) # 80104198 <errno>
80006108:	2a0000ef          	jal	x1,800063a8 <_sbrk>
8000610c:	fff00793          	addi	x15,x0,-1
80006110:	00f50c63          	beq	x10,x15,80006128 <_sbrk_r+0x40>
80006114:	00c12083          	lw	x1,12(x2)
80006118:	00812403          	lw	x8,8(x2)
8000611c:	00412483          	lw	x9,4(x2)
80006120:	01010113          	addi	x2,x2,16
80006124:	00008067          	jalr	x0,0(x1)
80006128:	1984a783          	lw	x15,408(x9)
8000612c:	fe0784e3          	beq	x15,x0,80006114 <_sbrk_r+0x2c>
80006130:	00c12083          	lw	x1,12(x2)
80006134:	00f42023          	sw	x15,0(x8)
80006138:	00812403          	lw	x8,8(x2)
8000613c:	00412483          	lw	x9,4(x2)
80006140:	01010113          	addi	x2,x2,16
80006144:	00008067          	jalr	x0,0(x1)

80006148 <__ascii_mbtowc>:
80006148:	02058063          	beq	x11,x0,80006168 <__ascii_mbtowc+0x20>
8000614c:	04060263          	beq	x12,x0,80006190 <__ascii_mbtowc+0x48>
80006150:	04068863          	beq	x13,x0,800061a0 <__ascii_mbtowc+0x58>
80006154:	00064783          	lbu	x15,0(x12)
80006158:	00f5a023          	sw	x15,0(x11)
8000615c:	00064503          	lbu	x10,0(x12)
80006160:	00a03533          	sltu	x10,x0,x10
80006164:	00008067          	jalr	x0,0(x1)
80006168:	ff010113          	addi	x2,x2,-16
8000616c:	00c10593          	addi	x11,x2,12
80006170:	02060463          	beq	x12,x0,80006198 <__ascii_mbtowc+0x50>
80006174:	02068a63          	beq	x13,x0,800061a8 <__ascii_mbtowc+0x60>
80006178:	00064783          	lbu	x15,0(x12)
8000617c:	00f5a023          	sw	x15,0(x11)
80006180:	00064503          	lbu	x10,0(x12)
80006184:	00a03533          	sltu	x10,x0,x10
80006188:	01010113          	addi	x2,x2,16
8000618c:	00008067          	jalr	x0,0(x1)
80006190:	00000513          	addi	x10,x0,0
80006194:	00008067          	jalr	x0,0(x1)
80006198:	00000513          	addi	x10,x0,0
8000619c:	fedff06f          	jal	x0,80006188 <__ascii_mbtowc+0x40>
800061a0:	ffe00513          	addi	x10,x0,-2
800061a4:	00008067          	jalr	x0,0(x1)
800061a8:	ffe00513          	addi	x10,x0,-2
800061ac:	fddff06f          	jal	x0,80006188 <__ascii_mbtowc+0x40>

800061b0 <__ascii_wctomb>:
800061b0:	02058463          	beq	x11,x0,800061d8 <__ascii_wctomb+0x28>
800061b4:	0ff00793          	addi	x15,x0,255
800061b8:	00c7e863          	bltu	x15,x12,800061c8 <__ascii_wctomb+0x18>
800061bc:	00c58023          	sb	x12,0(x11)
800061c0:	00100513          	addi	x10,x0,1
800061c4:	00008067          	jalr	x0,0(x1)
800061c8:	08a00793          	addi	x15,x0,138
800061cc:	00f52023          	sw	x15,0(x10)
800061d0:	fff00513          	addi	x10,x0,-1
800061d4:	00008067          	jalr	x0,0(x1)
800061d8:	00000513          	addi	x10,x0,0
800061dc:	00008067          	jalr	x0,0(x1)

800061e0 <_close>:
800061e0:	ff010113          	addi	x2,x2,-16
800061e4:	00112623          	sw	x1,12(x2)
800061e8:	00812423          	sw	x8,8(x2)
800061ec:	03900893          	addi	x17,x0,57
800061f0:	00000073          	ecall
800061f4:	00050413          	addi	x8,x10,0
800061f8:	00054c63          	blt	x10,x0,80006210 <_close+0x30>
800061fc:	00c12083          	lw	x1,12(x2)
80006200:	00040513          	addi	x10,x8,0
80006204:	00812403          	lw	x8,8(x2)
80006208:	01010113          	addi	x2,x2,16
8000620c:	00008067          	jalr	x0,0(x1)
80006210:	40800433          	sub	x8,x0,x8
80006214:	2fc000ef          	jal	x1,80006510 <__errno>
80006218:	00852023          	sw	x8,0(x10)
8000621c:	fff00413          	addi	x8,x0,-1
80006220:	fddff06f          	jal	x0,800061fc <_close+0x1c>

80006224 <_exit>:
80006224:	05d00893          	addi	x17,x0,93
80006228:	00000073          	ecall
8000622c:	00054463          	blt	x10,x0,80006234 <_exit+0x10>
80006230:	0000006f          	jal	x0,80006230 <_exit+0xc>
80006234:	ff010113          	addi	x2,x2,-16
80006238:	00812423          	sw	x8,8(x2)
8000623c:	00050413          	addi	x8,x10,0
80006240:	00112623          	sw	x1,12(x2)
80006244:	40800433          	sub	x8,x0,x8
80006248:	2c8000ef          	jal	x1,80006510 <__errno>
8000624c:	00852023          	sw	x8,0(x10)
80006250:	0000006f          	jal	x0,80006250 <_exit+0x2c>

80006254 <_fstat>:
80006254:	f7010113          	addi	x2,x2,-144
80006258:	08912223          	sw	x9,132(x2)
8000625c:	08112623          	sw	x1,140(x2)
80006260:	00058493          	addi	x9,x11,0
80006264:	08812423          	sw	x8,136(x2)
80006268:	05000893          	addi	x17,x0,80
8000626c:	00010593          	addi	x11,x2,0
80006270:	00000073          	ecall
80006274:	00050413          	addi	x8,x10,0
80006278:	02054463          	blt	x10,x0,800062a0 <_fstat+0x4c>
8000627c:	00048513          	addi	x10,x9,0
80006280:	00010593          	addi	x11,x2,0
80006284:	1e4000ef          	jal	x1,80006468 <_conv_stat>
80006288:	08c12083          	lw	x1,140(x2)
8000628c:	00040513          	addi	x10,x8,0
80006290:	08812403          	lw	x8,136(x2)
80006294:	08412483          	lw	x9,132(x2)
80006298:	09010113          	addi	x2,x2,144
8000629c:	00008067          	jalr	x0,0(x1)
800062a0:	40800433          	sub	x8,x0,x8
800062a4:	26c000ef          	jal	x1,80006510 <__errno>
800062a8:	00852023          	sw	x8,0(x10)
800062ac:	fff00413          	addi	x8,x0,-1
800062b0:	fcdff06f          	jal	x0,8000627c <_fstat+0x28>

800062b4 <_getpid>:
800062b4:	00100513          	addi	x10,x0,1
800062b8:	00008067          	jalr	x0,0(x1)

800062bc <_isatty>:
800062bc:	f9010113          	addi	x2,x2,-112
800062c0:	00810593          	addi	x11,x2,8
800062c4:	06112623          	sw	x1,108(x2)
800062c8:	f8dff0ef          	jal	x1,80006254 <_fstat>
800062cc:	fff00793          	addi	x15,x0,-1
800062d0:	00f50e63          	beq	x10,x15,800062ec <_isatty+0x30>
800062d4:	00c12503          	lw	x10,12(x2)
800062d8:	06c12083          	lw	x1,108(x2)
800062dc:	00d55513          	srli	x10,x10,0xd
800062e0:	00157513          	andi	x10,x10,1
800062e4:	07010113          	addi	x2,x2,112
800062e8:	00008067          	jalr	x0,0(x1)
800062ec:	06c12083          	lw	x1,108(x2)
800062f0:	00000513          	addi	x10,x0,0
800062f4:	07010113          	addi	x2,x2,112
800062f8:	00008067          	jalr	x0,0(x1)

800062fc <_kill>:
800062fc:	ff010113          	addi	x2,x2,-16
80006300:	00112623          	sw	x1,12(x2)
80006304:	20c000ef          	jal	x1,80006510 <__errno>
80006308:	00c12083          	lw	x1,12(x2)
8000630c:	01600793          	addi	x15,x0,22
80006310:	00f52023          	sw	x15,0(x10)
80006314:	fff00513          	addi	x10,x0,-1
80006318:	01010113          	addi	x2,x2,16
8000631c:	00008067          	jalr	x0,0(x1)

80006320 <_lseek>:
80006320:	ff010113          	addi	x2,x2,-16
80006324:	00112623          	sw	x1,12(x2)
80006328:	00812423          	sw	x8,8(x2)
8000632c:	03e00893          	addi	x17,x0,62
80006330:	00000073          	ecall
80006334:	00050413          	addi	x8,x10,0
80006338:	00054c63          	blt	x10,x0,80006350 <_lseek+0x30>
8000633c:	00c12083          	lw	x1,12(x2)
80006340:	00040513          	addi	x10,x8,0
80006344:	00812403          	lw	x8,8(x2)
80006348:	01010113          	addi	x2,x2,16
8000634c:	00008067          	jalr	x0,0(x1)
80006350:	40800433          	sub	x8,x0,x8
80006354:	1bc000ef          	jal	x1,80006510 <__errno>
80006358:	00852023          	sw	x8,0(x10)
8000635c:	fff00413          	addi	x8,x0,-1
80006360:	fddff06f          	jal	x0,8000633c <_lseek+0x1c>

80006364 <_read>:
80006364:	ff010113          	addi	x2,x2,-16
80006368:	00112623          	sw	x1,12(x2)
8000636c:	00812423          	sw	x8,8(x2)
80006370:	03f00893          	addi	x17,x0,63
80006374:	00000073          	ecall
80006378:	00050413          	addi	x8,x10,0
8000637c:	00054c63          	blt	x10,x0,80006394 <_read+0x30>
80006380:	00c12083          	lw	x1,12(x2)
80006384:	00040513          	addi	x10,x8,0
80006388:	00812403          	lw	x8,8(x2)
8000638c:	01010113          	addi	x2,x2,16
80006390:	00008067          	jalr	x0,0(x1)
80006394:	40800433          	sub	x8,x0,x8
80006398:	178000ef          	jal	x1,80006510 <__errno>
8000639c:	00852023          	sw	x8,0(x10)
800063a0:	fff00413          	addi	x8,x0,-1
800063a4:	fddff06f          	jal	x0,80006380 <_read+0x1c>

800063a8 <_sbrk>:
800063a8:	801046b7          	lui	x13,0x80104
800063ac:	1a86a703          	lw	x14,424(x13) # 801041a8 <heap_end.0>
800063b0:	ff010113          	addi	x2,x2,-16
800063b4:	00112623          	sw	x1,12(x2)
800063b8:	00050793          	addi	x15,x10,0
800063bc:	02071063          	bne	x14,x0,800063dc <_sbrk+0x34>
800063c0:	0d600893          	addi	x17,x0,214
800063c4:	00000513          	addi	x10,x0,0
800063c8:	00000073          	ecall
800063cc:	fff00613          	addi	x12,x0,-1
800063d0:	00050713          	addi	x14,x10,0
800063d4:	02c50a63          	beq	x10,x12,80006408 <_sbrk+0x60>
800063d8:	1aa6a423          	sw	x10,424(x13)
800063dc:	0d600893          	addi	x17,x0,214
800063e0:	00e78533          	add	x10,x15,x14
800063e4:	00000073          	ecall
800063e8:	1a86a703          	lw	x14,424(x13)
800063ec:	00e787b3          	add	x15,x15,x14
800063f0:	00f51c63          	bne	x10,x15,80006408 <_sbrk+0x60>
800063f4:	00c12083          	lw	x1,12(x2)
800063f8:	1aa6a423          	sw	x10,424(x13)
800063fc:	00070513          	addi	x10,x14,0
80006400:	01010113          	addi	x2,x2,16
80006404:	00008067          	jalr	x0,0(x1)
80006408:	108000ef          	jal	x1,80006510 <__errno>
8000640c:	00c12083          	lw	x1,12(x2)
80006410:	00c00793          	addi	x15,x0,12
80006414:	00f52023          	sw	x15,0(x10)
80006418:	fff00513          	addi	x10,x0,-1
8000641c:	01010113          	addi	x2,x2,16
80006420:	00008067          	jalr	x0,0(x1)

80006424 <_write>:
80006424:	ff010113          	addi	x2,x2,-16
80006428:	00112623          	sw	x1,12(x2)
8000642c:	00812423          	sw	x8,8(x2)
80006430:	04000893          	addi	x17,x0,64
80006434:	00000073          	ecall
80006438:	00050413          	addi	x8,x10,0
8000643c:	00054c63          	blt	x10,x0,80006454 <_write+0x30>
80006440:	00c12083          	lw	x1,12(x2)
80006444:	00040513          	addi	x10,x8,0
80006448:	00812403          	lw	x8,8(x2)
8000644c:	01010113          	addi	x2,x2,16
80006450:	00008067          	jalr	x0,0(x1)
80006454:	40800433          	sub	x8,x0,x8
80006458:	0b8000ef          	jal	x1,80006510 <__errno>
8000645c:	00852023          	sw	x8,0(x10)
80006460:	fff00413          	addi	x8,x0,-1
80006464:	fddff06f          	jal	x0,80006440 <_write+0x1c>

80006468 <_conv_stat>:
80006468:	0185d703          	lhu	x14,24(x11)
8000646c:	0145d783          	lhu	x15,20(x11)
80006470:	ff010113          	addi	x2,x2,-16
80006474:	01c5a283          	lw	x5,28(x11)
80006478:	0205af83          	lw	x31,32(x11)
8000647c:	0305af03          	lw	x30,48(x11)
80006480:	0405ae83          	lw	x29,64(x11)
80006484:	0385ae03          	lw	x28,56(x11)
80006488:	0485a303          	lw	x6,72(x11)
8000648c:	04c5a383          	lw	x7,76(x11)
80006490:	0585a803          	lw	x16,88(x11)
80006494:	05c5a883          	lw	x17,92(x11)
80006498:	00812623          	sw	x8,12(x2)
8000649c:	00912423          	sw	x9,8(x2)
800064a0:	0105a403          	lw	x8,16(x11)
800064a4:	0085a483          	lw	x9,8(x11)
800064a8:	01212223          	sw	x18,4(x2)
800064ac:	0005a903          	lw	x18,0(x11)
800064b0:	0685a603          	lw	x12,104(x11)
800064b4:	01071713          	slli	x14,x14,0x10
800064b8:	00e7e7b3          	or	x15,x15,x14
800064bc:	06c5a683          	lw	x13,108(x11)
800064c0:	01251023          	sh	x18,0(x10)
800064c4:	00951123          	sh	x9,2(x10)
800064c8:	00852223          	sw	x8,4(x10)
800064cc:	00f52423          	sw	x15,8(x10)
800064d0:	00551623          	sh	x5,12(x10)
800064d4:	01f51723          	sh	x31,14(x10)
800064d8:	01e52823          	sw	x30,16(x10)
800064dc:	05d52623          	sw	x29,76(x10)
800064e0:	05c52423          	sw	x28,72(x10)
800064e4:	00652c23          	sw	x6,24(x10)
800064e8:	00752e23          	sw	x7,28(x10)
800064ec:	03052423          	sw	x16,40(x10)
800064f0:	03152623          	sw	x17,44(x10)
800064f4:	02c52c23          	sw	x12,56(x10)
800064f8:	00c12403          	lw	x8,12(x2)
800064fc:	02d52e23          	sw	x13,60(x10)
80006500:	00812483          	lw	x9,8(x2)
80006504:	00412903          	lw	x18,4(x2)
80006508:	01010113          	addi	x2,x2,16
8000650c:	00008067          	jalr	x0,0(x1)

80006510 <__errno>:
80006510:	801017b7          	lui	x15,0x80101
80006514:	6a47a503          	lw	x10,1700(x15) # 801016a4 <_impure_ptr>
80006518:	00008067          	jalr	x0,0(x1)

8000651c <__udivdi3>:
8000651c:	fd010113          	addi	x2,x2,-48
80006520:	01412c23          	sw	x20,24(x2)
80006524:	02112623          	sw	x1,44(x2)
80006528:	02812423          	sw	x8,40(x2)
8000652c:	02912223          	sw	x9,36(x2)
80006530:	03212023          	sw	x18,32(x2)
80006534:	01312e23          	sw	x19,28(x2)
80006538:	01512a23          	sw	x21,20(x2)
8000653c:	01612823          	sw	x22,16(x2)
80006540:	01712623          	sw	x23,12(x2)
80006544:	01812423          	sw	x24,8(x2)
80006548:	01912223          	sw	x25,4(x2)
8000654c:	00050a13          	addi	x20,x10,0
80006550:	38069463          	bne	x13,x0,800068d8 <__udivdi3+0x3bc>
80006554:	801027b7          	lui	x15,0x80102
80006558:	00060993          	addi	x19,x12,0
8000655c:	00050493          	addi	x9,x10,0
80006560:	d4078793          	addi	x15,x15,-704 # 80101d40 <__clz_tab>
80006564:	12c5f863          	bgeu	x11,x12,80006694 <__udivdi3+0x178>
80006568:	00010737          	lui	x14,0x10
8000656c:	00058913          	addi	x18,x11,0
80006570:	10e67863          	bgeu	x12,x14,80006680 <__udivdi3+0x164>
80006574:	10063713          	sltiu	x14,x12,256
80006578:	00173713          	sltiu	x14,x14,1
8000657c:	00371713          	slli	x14,x14,0x3
80006580:	00e656b3          	srl	x13,x12,x14
80006584:	00d787b3          	add	x15,x15,x13
80006588:	0007c783          	lbu	x15,0(x15)
8000658c:	02000693          	addi	x13,x0,32
80006590:	00e787b3          	add	x15,x15,x14
80006594:	40f68733          	sub	x14,x13,x15
80006598:	00f68c63          	beq	x13,x15,800065b0 <__udivdi3+0x94>
8000659c:	00e59933          	sll	x18,x11,x14
800065a0:	00fa57b3          	srl	x15,x20,x15
800065a4:	00e619b3          	sll	x19,x12,x14
800065a8:	0127e933          	or	x18,x15,x18
800065ac:	00ea14b3          	sll	x9,x20,x14
800065b0:	0109da93          	srli	x21,x19,0x10
800065b4:	000a8593          	addi	x11,x21,0
800065b8:	00090513          	addi	x10,x18,0 # f000 <_stack_size+0xe000>
800065bc:	01099b13          	slli	x22,x19,0x10
800065c0:	c65fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
800065c4:	010b5b13          	srli	x22,x22,0x10
800065c8:	00050593          	addi	x11,x10,0
800065cc:	00050a13          	addi	x20,x10,0
800065d0:	000b0513          	addi	x10,x22,0
800065d4:	c25fb0ef          	jal	x1,800021f8 <__mulsi3>
800065d8:	00050413          	addi	x8,x10,0
800065dc:	000a8593          	addi	x11,x21,0
800065e0:	00090513          	addi	x10,x18,0
800065e4:	c89fb0ef          	jal	x1,8000226c <__umodsi3>
800065e8:	01051513          	slli	x10,x10,0x10
800065ec:	0104d713          	srli	x14,x9,0x10
800065f0:	00a76733          	or	x14,x14,x10
800065f4:	000a0913          	addi	x18,x20,0
800065f8:	00877e63          	bgeu	x14,x8,80006614 <__udivdi3+0xf8>
800065fc:	00e98733          	add	x14,x19,x14
80006600:	fffa0913          	addi	x18,x20,-1
80006604:	01376863          	bltu	x14,x19,80006614 <__udivdi3+0xf8>
80006608:	00877663          	bgeu	x14,x8,80006614 <__udivdi3+0xf8>
8000660c:	ffea0913          	addi	x18,x20,-2
80006610:	01370733          	add	x14,x14,x19
80006614:	40870433          	sub	x8,x14,x8
80006618:	000a8593          	addi	x11,x21,0
8000661c:	00040513          	addi	x10,x8,0
80006620:	c05fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
80006624:	00050593          	addi	x11,x10,0
80006628:	00050a13          	addi	x20,x10,0
8000662c:	000b0513          	addi	x10,x22,0
80006630:	bc9fb0ef          	jal	x1,800021f8 <__mulsi3>
80006634:	00050b13          	addi	x22,x10,0
80006638:	000a8593          	addi	x11,x21,0
8000663c:	00040513          	addi	x10,x8,0
80006640:	c2dfb0ef          	jal	x1,8000226c <__umodsi3>
80006644:	01049493          	slli	x9,x9,0x10
80006648:	01051513          	slli	x10,x10,0x10
8000664c:	0104d493          	srli	x9,x9,0x10
80006650:	00a4e4b3          	or	x9,x9,x10
80006654:	000a0713          	addi	x14,x20,0
80006658:	0164fc63          	bgeu	x9,x22,80006670 <__udivdi3+0x154>
8000665c:	009984b3          	add	x9,x19,x9
80006660:	fffa0713          	addi	x14,x20,-1
80006664:	0134e663          	bltu	x9,x19,80006670 <__udivdi3+0x154>
80006668:	0164f463          	bgeu	x9,x22,80006670 <__udivdi3+0x154>
8000666c:	ffea0713          	addi	x14,x20,-2
80006670:	01091793          	slli	x15,x18,0x10
80006674:	00e7e7b3          	or	x15,x15,x14
80006678:	00000913          	addi	x18,x0,0
8000667c:	1200006f          	jal	x0,8000679c <__udivdi3+0x280>
80006680:	010006b7          	lui	x13,0x1000
80006684:	01800713          	addi	x14,x0,24
80006688:	eed67ce3          	bgeu	x12,x13,80006580 <__udivdi3+0x64>
8000668c:	01000713          	addi	x14,x0,16
80006690:	ef1ff06f          	jal	x0,80006580 <__udivdi3+0x64>
80006694:	00000713          	addi	x14,x0,0
80006698:	00060c63          	beq	x12,x0,800066b0 <__udivdi3+0x194>
8000669c:	00010737          	lui	x14,0x10
800066a0:	12e67c63          	bgeu	x12,x14,800067d8 <__udivdi3+0x2bc>
800066a4:	10063713          	sltiu	x14,x12,256
800066a8:	00173713          	sltiu	x14,x14,1
800066ac:	00371713          	slli	x14,x14,0x3
800066b0:	00e656b3          	srl	x13,x12,x14
800066b4:	00d787b3          	add	x15,x15,x13
800066b8:	0007c783          	lbu	x15,0(x15)
800066bc:	02000693          	addi	x13,x0,32
800066c0:	00e787b3          	add	x15,x15,x14
800066c4:	40f68733          	sub	x14,x13,x15
800066c8:	12f69263          	bne	x13,x15,800067ec <__udivdi3+0x2d0>
800066cc:	40c58a33          	sub	x20,x11,x12
800066d0:	00100913          	addi	x18,x0,1
800066d4:	0109db13          	srli	x22,x19,0x10
800066d8:	000b0593          	addi	x11,x22,0
800066dc:	000a0513          	addi	x10,x20,0
800066e0:	01099b93          	slli	x23,x19,0x10
800066e4:	b41fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
800066e8:	010bdb93          	srli	x23,x23,0x10
800066ec:	00050593          	addi	x11,x10,0
800066f0:	00050c13          	addi	x24,x10,0
800066f4:	000b8513          	addi	x10,x23,0
800066f8:	b01fb0ef          	jal	x1,800021f8 <__mulsi3>
800066fc:	00050a93          	addi	x21,x10,0
80006700:	000b0593          	addi	x11,x22,0
80006704:	000a0513          	addi	x10,x20,0
80006708:	b65fb0ef          	jal	x1,8000226c <__umodsi3>
8000670c:	01051513          	slli	x10,x10,0x10
80006710:	0104d713          	srli	x14,x9,0x10
80006714:	00a76733          	or	x14,x14,x10
80006718:	000c0a13          	addi	x20,x24,0
8000671c:	01577e63          	bgeu	x14,x21,80006738 <__udivdi3+0x21c>
80006720:	00e98733          	add	x14,x19,x14
80006724:	fffc0a13          	addi	x20,x24,-1
80006728:	01376863          	bltu	x14,x19,80006738 <__udivdi3+0x21c>
8000672c:	01577663          	bgeu	x14,x21,80006738 <__udivdi3+0x21c>
80006730:	ffec0a13          	addi	x20,x24,-2
80006734:	01370733          	add	x14,x14,x19
80006738:	41570433          	sub	x8,x14,x21
8000673c:	000b0593          	addi	x11,x22,0
80006740:	00040513          	addi	x10,x8,0
80006744:	ae1fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
80006748:	00050593          	addi	x11,x10,0
8000674c:	00050a93          	addi	x21,x10,0
80006750:	000b8513          	addi	x10,x23,0
80006754:	aa5fb0ef          	jal	x1,800021f8 <__mulsi3>
80006758:	00050b93          	addi	x23,x10,0
8000675c:	000b0593          	addi	x11,x22,0
80006760:	00040513          	addi	x10,x8,0
80006764:	b09fb0ef          	jal	x1,8000226c <__umodsi3>
80006768:	01049493          	slli	x9,x9,0x10
8000676c:	01051513          	slli	x10,x10,0x10
80006770:	0104d493          	srli	x9,x9,0x10
80006774:	00a4e4b3          	or	x9,x9,x10
80006778:	000a8713          	addi	x14,x21,0
8000677c:	0174fc63          	bgeu	x9,x23,80006794 <__udivdi3+0x278>
80006780:	009984b3          	add	x9,x19,x9
80006784:	fffa8713          	addi	x14,x21,-1
80006788:	0134e663          	bltu	x9,x19,80006794 <__udivdi3+0x278>
8000678c:	0174f463          	bgeu	x9,x23,80006794 <__udivdi3+0x278>
80006790:	ffea8713          	addi	x14,x21,-2
80006794:	010a1793          	slli	x15,x20,0x10
80006798:	00e7e7b3          	or	x15,x15,x14
8000679c:	02c12083          	lw	x1,44(x2)
800067a0:	02812403          	lw	x8,40(x2)
800067a4:	02412483          	lw	x9,36(x2)
800067a8:	01c12983          	lw	x19,28(x2)
800067ac:	01812a03          	lw	x20,24(x2)
800067b0:	01412a83          	lw	x21,20(x2)
800067b4:	01012b03          	lw	x22,16(x2)
800067b8:	00c12b83          	lw	x23,12(x2)
800067bc:	00812c03          	lw	x24,8(x2)
800067c0:	00412c83          	lw	x25,4(x2)
800067c4:	00090593          	addi	x11,x18,0
800067c8:	00078513          	addi	x10,x15,0
800067cc:	02012903          	lw	x18,32(x2)
800067d0:	03010113          	addi	x2,x2,48
800067d4:	00008067          	jalr	x0,0(x1)
800067d8:	010006b7          	lui	x13,0x1000
800067dc:	01800713          	addi	x14,x0,24
800067e0:	ecd678e3          	bgeu	x12,x13,800066b0 <__udivdi3+0x194>
800067e4:	01000713          	addi	x14,x0,16
800067e8:	ec9ff06f          	jal	x0,800066b0 <__udivdi3+0x194>
800067ec:	00e619b3          	sll	x19,x12,x14
800067f0:	00f5d933          	srl	x18,x11,x15
800067f4:	0109db93          	srli	x23,x19,0x10
800067f8:	00e595b3          	sll	x11,x11,x14
800067fc:	00fa57b3          	srl	x15,x20,x15
80006800:	00b7eab3          	or	x21,x15,x11
80006804:	00ea14b3          	sll	x9,x20,x14
80006808:	000b8593          	addi	x11,x23,0
8000680c:	00090513          	addi	x10,x18,0
80006810:	01099a13          	slli	x20,x19,0x10
80006814:	a11fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
80006818:	010a5a13          	srli	x20,x20,0x10
8000681c:	00050593          	addi	x11,x10,0
80006820:	00050b13          	addi	x22,x10,0
80006824:	000a0513          	addi	x10,x20,0
80006828:	9d1fb0ef          	jal	x1,800021f8 <__mulsi3>
8000682c:	00050413          	addi	x8,x10,0
80006830:	000b8593          	addi	x11,x23,0
80006834:	00090513          	addi	x10,x18,0
80006838:	a35fb0ef          	jal	x1,8000226c <__umodsi3>
8000683c:	01051513          	slli	x10,x10,0x10
80006840:	010ad713          	srli	x14,x21,0x10
80006844:	00a76733          	or	x14,x14,x10
80006848:	000b0913          	addi	x18,x22,0
8000684c:	00877e63          	bgeu	x14,x8,80006868 <__udivdi3+0x34c>
80006850:	00e98733          	add	x14,x19,x14
80006854:	fffb0913          	addi	x18,x22,-1
80006858:	01376863          	bltu	x14,x19,80006868 <__udivdi3+0x34c>
8000685c:	00877663          	bgeu	x14,x8,80006868 <__udivdi3+0x34c>
80006860:	ffeb0913          	addi	x18,x22,-2
80006864:	01370733          	add	x14,x14,x19
80006868:	40870433          	sub	x8,x14,x8
8000686c:	000b8593          	addi	x11,x23,0
80006870:	00040513          	addi	x10,x8,0
80006874:	9b1fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
80006878:	00050593          	addi	x11,x10,0
8000687c:	00050b13          	addi	x22,x10,0
80006880:	000a0513          	addi	x10,x20,0
80006884:	975fb0ef          	jal	x1,800021f8 <__mulsi3>
80006888:	00050a13          	addi	x20,x10,0
8000688c:	000b8593          	addi	x11,x23,0
80006890:	00040513          	addi	x10,x8,0
80006894:	9d9fb0ef          	jal	x1,8000226c <__umodsi3>
80006898:	010a9793          	slli	x15,x21,0x10
8000689c:	01051513          	slli	x10,x10,0x10
800068a0:	0107d793          	srli	x15,x15,0x10
800068a4:	00a7e7b3          	or	x15,x15,x10
800068a8:	000b0713          	addi	x14,x22,0
800068ac:	0147fe63          	bgeu	x15,x20,800068c8 <__udivdi3+0x3ac>
800068b0:	00f987b3          	add	x15,x19,x15
800068b4:	fffb0713          	addi	x14,x22,-1
800068b8:	0137e863          	bltu	x15,x19,800068c8 <__udivdi3+0x3ac>
800068bc:	0147f663          	bgeu	x15,x20,800068c8 <__udivdi3+0x3ac>
800068c0:	ffeb0713          	addi	x14,x22,-2
800068c4:	013787b3          	add	x15,x15,x19
800068c8:	01091913          	slli	x18,x18,0x10
800068cc:	41478a33          	sub	x20,x15,x20
800068d0:	00e96933          	or	x18,x18,x14
800068d4:	e01ff06f          	jal	x0,800066d4 <__udivdi3+0x1b8>
800068d8:	1ed5ee63          	bltu	x11,x13,80006ad4 <__udivdi3+0x5b8>
800068dc:	000107b7          	lui	x15,0x10
800068e0:	04f6f463          	bgeu	x13,x15,80006928 <__udivdi3+0x40c>
800068e4:	1006b713          	sltiu	x14,x13,256
800068e8:	00173713          	sltiu	x14,x14,1
800068ec:	00371713          	slli	x14,x14,0x3
800068f0:	801027b7          	lui	x15,0x80102
800068f4:	00e6d533          	srl	x10,x13,x14
800068f8:	d4078793          	addi	x15,x15,-704 # 80101d40 <__clz_tab>
800068fc:	00a787b3          	add	x15,x15,x10
80006900:	0007c803          	lbu	x16,0(x15)
80006904:	02000793          	addi	x15,x0,32
80006908:	00e80833          	add	x16,x16,x14
8000690c:	41078933          	sub	x18,x15,x16
80006910:	03079663          	bne	x15,x16,8000693c <__udivdi3+0x420>
80006914:	00100793          	addi	x15,x0,1
80006918:	e8b6e2e3          	bltu	x13,x11,8000679c <__udivdi3+0x280>
8000691c:	00ca37b3          	sltu	x15,x20,x12
80006920:	0017b793          	sltiu	x15,x15,1
80006924:	e79ff06f          	jal	x0,8000679c <__udivdi3+0x280>
80006928:	010007b7          	lui	x15,0x1000
8000692c:	01800713          	addi	x14,x0,24
80006930:	fcf6f0e3          	bgeu	x13,x15,800068f0 <__udivdi3+0x3d4>
80006934:	01000713          	addi	x14,x0,16
80006938:	fb9ff06f          	jal	x0,800068f0 <__udivdi3+0x3d4>
8000693c:	012696b3          	sll	x13,x13,x18
80006940:	01065b33          	srl	x22,x12,x16
80006944:	00db6b33          	or	x22,x22,x13
80006948:	0105d4b3          	srl	x9,x11,x16
8000694c:	010b5c13          	srli	x24,x22,0x10
80006950:	010a5833          	srl	x16,x20,x16
80006954:	012595b3          	sll	x11,x11,x18
80006958:	00b869b3          	or	x19,x16,x11
8000695c:	00048513          	addi	x10,x9,0
80006960:	000c0593          	addi	x11,x24,0
80006964:	010b1b93          	slli	x23,x22,0x10
80006968:	01261433          	sll	x8,x12,x18
8000696c:	010bdb93          	srli	x23,x23,0x10
80006970:	8b5fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
80006974:	00050593          	addi	x11,x10,0
80006978:	00050c93          	addi	x25,x10,0
8000697c:	000b8513          	addi	x10,x23,0
80006980:	879fb0ef          	jal	x1,800021f8 <__mulsi3>
80006984:	00050a93          	addi	x21,x10,0
80006988:	000c0593          	addi	x11,x24,0
8000698c:	00048513          	addi	x10,x9,0
80006990:	8ddfb0ef          	jal	x1,8000226c <__umodsi3>
80006994:	01051513          	slli	x10,x10,0x10
80006998:	0109d693          	srli	x13,x19,0x10
8000699c:	00a6e6b3          	or	x13,x13,x10
800069a0:	000c8493          	addi	x9,x25,0
800069a4:	0156fe63          	bgeu	x13,x21,800069c0 <__udivdi3+0x4a4>
800069a8:	00db06b3          	add	x13,x22,x13
800069ac:	fffc8493          	addi	x9,x25,-1
800069b0:	0166e863          	bltu	x13,x22,800069c0 <__udivdi3+0x4a4>
800069b4:	0156f663          	bgeu	x13,x21,800069c0 <__udivdi3+0x4a4>
800069b8:	ffec8493          	addi	x9,x25,-2
800069bc:	016686b3          	add	x13,x13,x22
800069c0:	41568ab3          	sub	x21,x13,x21
800069c4:	000c0593          	addi	x11,x24,0
800069c8:	000a8513          	addi	x10,x21,0
800069cc:	859fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
800069d0:	00050593          	addi	x11,x10,0
800069d4:	00050c93          	addi	x25,x10,0
800069d8:	000b8513          	addi	x10,x23,0
800069dc:	81dfb0ef          	jal	x1,800021f8 <__mulsi3>
800069e0:	00050b93          	addi	x23,x10,0
800069e4:	000c0593          	addi	x11,x24,0
800069e8:	000a8513          	addi	x10,x21,0
800069ec:	881fb0ef          	jal	x1,8000226c <__umodsi3>
800069f0:	01099713          	slli	x14,x19,0x10
800069f4:	01051513          	slli	x10,x10,0x10
800069f8:	01075713          	srli	x14,x14,0x10
800069fc:	00a76733          	or	x14,x14,x10
80006a00:	000c8693          	addi	x13,x25,0
80006a04:	01777e63          	bgeu	x14,x23,80006a20 <__udivdi3+0x504>
80006a08:	00eb0733          	add	x14,x22,x14
80006a0c:	fffc8693          	addi	x13,x25,-1
80006a10:	01676863          	bltu	x14,x22,80006a20 <__udivdi3+0x504>
80006a14:	01777663          	bgeu	x14,x23,80006a20 <__udivdi3+0x504>
80006a18:	ffec8693          	addi	x13,x25,-2
80006a1c:	01670733          	add	x14,x14,x22
80006a20:	01049793          	slli	x15,x9,0x10
80006a24:	00010e37          	lui	x28,0x10
80006a28:	00d7e7b3          	or	x15,x15,x13
80006a2c:	fffe0313          	addi	x6,x28,-1 # ffff <_stack_size+0xefff>
80006a30:	0067f8b3          	and	x17,x15,x6
80006a34:	00647333          	and	x6,x8,x6
80006a38:	41770733          	sub	x14,x14,x23
80006a3c:	0107de93          	srli	x29,x15,0x10
80006a40:	01045413          	srli	x8,x8,0x10
80006a44:	00088513          	addi	x10,x17,0
80006a48:	00030593          	addi	x11,x6,0
80006a4c:	facfb0ef          	jal	x1,800021f8 <__mulsi3>
80006a50:	00050813          	addi	x16,x10,0
80006a54:	00040593          	addi	x11,x8,0
80006a58:	00088513          	addi	x10,x17,0
80006a5c:	f9cfb0ef          	jal	x1,800021f8 <__mulsi3>
80006a60:	00050893          	addi	x17,x10,0
80006a64:	00030593          	addi	x11,x6,0
80006a68:	000e8513          	addi	x10,x29,0
80006a6c:	f8cfb0ef          	jal	x1,800021f8 <__mulsi3>
80006a70:	00050313          	addi	x6,x10,0
80006a74:	00040593          	addi	x11,x8,0
80006a78:	000e8513          	addi	x10,x29,0
80006a7c:	f7cfb0ef          	jal	x1,800021f8 <__mulsi3>
80006a80:	01085693          	srli	x13,x16,0x10
80006a84:	006888b3          	add	x17,x17,x6
80006a88:	011686b3          	add	x13,x13,x17
80006a8c:	00050613          	addi	x12,x10,0
80006a90:	0066f463          	bgeu	x13,x6,80006a98 <__udivdi3+0x57c>
80006a94:	01c50633          	add	x12,x10,x28
80006a98:	0106d593          	srli	x11,x13,0x10
80006a9c:	00c58633          	add	x12,x11,x12
80006aa0:	02c76663          	bltu	x14,x12,80006acc <__udivdi3+0x5b0>
80006aa4:	bcc71ae3          	bne	x14,x12,80006678 <__udivdi3+0x15c>
80006aa8:	00010637          	lui	x12,0x10
80006aac:	fff60613          	addi	x12,x12,-1 # ffff <_stack_size+0xefff>
80006ab0:	00c6f6b3          	and	x13,x13,x12
80006ab4:	01069693          	slli	x13,x13,0x10
80006ab8:	00c87833          	and	x16,x16,x12
80006abc:	012a1733          	sll	x14,x20,x18
80006ac0:	010686b3          	add	x13,x13,x16
80006ac4:	00000913          	addi	x18,x0,0
80006ac8:	ccd77ae3          	bgeu	x14,x13,8000679c <__udivdi3+0x280>
80006acc:	fff78793          	addi	x15,x15,-1 # ffffff <_stack_size+0xffefff>
80006ad0:	ba9ff06f          	jal	x0,80006678 <__udivdi3+0x15c>
80006ad4:	00000913          	addi	x18,x0,0
80006ad8:	00000793          	addi	x15,x0,0
80006adc:	cc1ff06f          	jal	x0,8000679c <__udivdi3+0x280>

80006ae0 <__umoddi3>:
80006ae0:	fd010113          	addi	x2,x2,-48
80006ae4:	02812423          	sw	x8,40(x2)
80006ae8:	02912223          	sw	x9,36(x2)
80006aec:	02112623          	sw	x1,44(x2)
80006af0:	03212023          	sw	x18,32(x2)
80006af4:	01312e23          	sw	x19,28(x2)
80006af8:	01412c23          	sw	x20,24(x2)
80006afc:	01512a23          	sw	x21,20(x2)
80006b00:	01612823          	sw	x22,16(x2)
80006b04:	01712623          	sw	x23,12(x2)
80006b08:	01812423          	sw	x24,8(x2)
80006b0c:	01912223          	sw	x25,4(x2)
80006b10:	01a12023          	sw	x26,0(x2)
80006b14:	00050413          	addi	x8,x10,0
80006b18:	00058493          	addi	x9,x11,0
80006b1c:	24069c63          	bne	x13,x0,80006d74 <__umoddi3+0x294>
80006b20:	801027b7          	lui	x15,0x80102
80006b24:	00060993          	addi	x19,x12,0
80006b28:	d4078793          	addi	x15,x15,-704 # 80101d40 <__clz_tab>
80006b2c:	12c5fe63          	bgeu	x11,x12,80006c68 <__umoddi3+0x188>
80006b30:	00010737          	lui	x14,0x10
80006b34:	12e67063          	bgeu	x12,x14,80006c54 <__umoddi3+0x174>
80006b38:	10063713          	sltiu	x14,x12,256
80006b3c:	00173713          	sltiu	x14,x14,1
80006b40:	00371713          	slli	x14,x14,0x3
80006b44:	00e656b3          	srl	x13,x12,x14
80006b48:	00d787b3          	add	x15,x15,x13
80006b4c:	0007c783          	lbu	x15,0(x15)
80006b50:	00e787b3          	add	x15,x15,x14
80006b54:	02000713          	addi	x14,x0,32
80006b58:	40f70933          	sub	x18,x14,x15
80006b5c:	00f70c63          	beq	x14,x15,80006b74 <__umoddi3+0x94>
80006b60:	012594b3          	sll	x9,x11,x18
80006b64:	00f557b3          	srl	x15,x10,x15
80006b68:	012619b3          	sll	x19,x12,x18
80006b6c:	0097e4b3          	or	x9,x15,x9
80006b70:	01251433          	sll	x8,x10,x18
80006b74:	0109da93          	srli	x21,x19,0x10
80006b78:	000a8593          	addi	x11,x21,0
80006b7c:	01099b13          	slli	x22,x19,0x10
80006b80:	00048513          	addi	x10,x9,0
80006b84:	ea0fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
80006b88:	010b5b13          	srli	x22,x22,0x10
80006b8c:	000b0593          	addi	x11,x22,0
80006b90:	e68fb0ef          	jal	x1,800021f8 <__mulsi3>
80006b94:	00050a13          	addi	x20,x10,0
80006b98:	000a8593          	addi	x11,x21,0
80006b9c:	00048513          	addi	x10,x9,0
80006ba0:	eccfb0ef          	jal	x1,8000226c <__umodsi3>
80006ba4:	01051513          	slli	x10,x10,0x10
80006ba8:	01045793          	srli	x15,x8,0x10
80006bac:	00a7e7b3          	or	x15,x15,x10
80006bb0:	0147fa63          	bgeu	x15,x20,80006bc4 <__umoddi3+0xe4>
80006bb4:	00f987b3          	add	x15,x19,x15
80006bb8:	0137e663          	bltu	x15,x19,80006bc4 <__umoddi3+0xe4>
80006bbc:	0147f463          	bgeu	x15,x20,80006bc4 <__umoddi3+0xe4>
80006bc0:	013787b3          	add	x15,x15,x19
80006bc4:	414784b3          	sub	x9,x15,x20
80006bc8:	000a8593          	addi	x11,x21,0
80006bcc:	00048513          	addi	x10,x9,0
80006bd0:	e54fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
80006bd4:	000b0593          	addi	x11,x22,0
80006bd8:	e20fb0ef          	jal	x1,800021f8 <__mulsi3>
80006bdc:	00050a13          	addi	x20,x10,0
80006be0:	000a8593          	addi	x11,x21,0
80006be4:	00048513          	addi	x10,x9,0
80006be8:	e84fb0ef          	jal	x1,8000226c <__umodsi3>
80006bec:	01041413          	slli	x8,x8,0x10
80006bf0:	01051513          	slli	x10,x10,0x10
80006bf4:	01045413          	srli	x8,x8,0x10
80006bf8:	00a46433          	or	x8,x8,x10
80006bfc:	01447a63          	bgeu	x8,x20,80006c10 <__umoddi3+0x130>
80006c00:	00898433          	add	x8,x19,x8
80006c04:	01346663          	bltu	x8,x19,80006c10 <__umoddi3+0x130>
80006c08:	01447463          	bgeu	x8,x20,80006c10 <__umoddi3+0x130>
80006c0c:	01340433          	add	x8,x8,x19
80006c10:	41440433          	sub	x8,x8,x20
80006c14:	01245533          	srl	x10,x8,x18
80006c18:	00000593          	addi	x11,x0,0
80006c1c:	02c12083          	lw	x1,44(x2)
80006c20:	02812403          	lw	x8,40(x2)
80006c24:	02412483          	lw	x9,36(x2)
80006c28:	02012903          	lw	x18,32(x2)
80006c2c:	01c12983          	lw	x19,28(x2)
80006c30:	01812a03          	lw	x20,24(x2)
80006c34:	01412a83          	lw	x21,20(x2)
80006c38:	01012b03          	lw	x22,16(x2)
80006c3c:	00c12b83          	lw	x23,12(x2)
80006c40:	00812c03          	lw	x24,8(x2)
80006c44:	00412c83          	lw	x25,4(x2)
80006c48:	00012d03          	lw	x26,0(x2)
80006c4c:	03010113          	addi	x2,x2,48
80006c50:	00008067          	jalr	x0,0(x1)
80006c54:	010006b7          	lui	x13,0x1000
80006c58:	01800713          	addi	x14,x0,24
80006c5c:	eed674e3          	bgeu	x12,x13,80006b44 <__umoddi3+0x64>
80006c60:	01000713          	addi	x14,x0,16
80006c64:	ee1ff06f          	jal	x0,80006b44 <__umoddi3+0x64>
80006c68:	00000713          	addi	x14,x0,0
80006c6c:	00060c63          	beq	x12,x0,80006c84 <__umoddi3+0x1a4>
80006c70:	00010737          	lui	x14,0x10
80006c74:	0ee67663          	bgeu	x12,x14,80006d60 <__umoddi3+0x280>
80006c78:	10063713          	sltiu	x14,x12,256
80006c7c:	00173713          	sltiu	x14,x14,1
80006c80:	00371713          	slli	x14,x14,0x3
80006c84:	00e656b3          	srl	x13,x12,x14
80006c88:	00d787b3          	add	x15,x15,x13
80006c8c:	0007c783          	lbu	x15,0(x15)
80006c90:	40c584b3          	sub	x9,x11,x12
80006c94:	00e787b3          	add	x15,x15,x14
80006c98:	02000713          	addi	x14,x0,32
80006c9c:	40f70933          	sub	x18,x14,x15
80006ca0:	ecf70ae3          	beq	x14,x15,80006b74 <__umoddi3+0x94>
80006ca4:	012619b3          	sll	x19,x12,x18
80006ca8:	00f5dbb3          	srl	x23,x11,x15
80006cac:	0109db13          	srli	x22,x19,0x10
80006cb0:	00f557b3          	srl	x15,x10,x15
80006cb4:	012595b3          	sll	x11,x11,x18
80006cb8:	00b7ea33          	or	x20,x15,x11
80006cbc:	01251433          	sll	x8,x10,x18
80006cc0:	000b0593          	addi	x11,x22,0
80006cc4:	01099a93          	slli	x21,x19,0x10
80006cc8:	000b8513          	addi	x10,x23,0
80006ccc:	d58fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
80006cd0:	010ada93          	srli	x21,x21,0x10
80006cd4:	000a8593          	addi	x11,x21,0
80006cd8:	d20fb0ef          	jal	x1,800021f8 <__mulsi3>
80006cdc:	00050493          	addi	x9,x10,0
80006ce0:	000b0593          	addi	x11,x22,0
80006ce4:	000b8513          	addi	x10,x23,0
80006ce8:	d84fb0ef          	jal	x1,8000226c <__umodsi3>
80006cec:	01051513          	slli	x10,x10,0x10
80006cf0:	010a5713          	srli	x14,x20,0x10
80006cf4:	00a76733          	or	x14,x14,x10
80006cf8:	00977a63          	bgeu	x14,x9,80006d0c <__umoddi3+0x22c>
80006cfc:	00e98733          	add	x14,x19,x14
80006d00:	01376663          	bltu	x14,x19,80006d0c <__umoddi3+0x22c>
80006d04:	00977463          	bgeu	x14,x9,80006d0c <__umoddi3+0x22c>
80006d08:	01370733          	add	x14,x14,x19
80006d0c:	409704b3          	sub	x9,x14,x9
80006d10:	000b0593          	addi	x11,x22,0
80006d14:	00048513          	addi	x10,x9,0
80006d18:	d0cfb0ef          	jal	x1,80002224 <__hidden___udivsi3>
80006d1c:	000a8593          	addi	x11,x21,0
80006d20:	cd8fb0ef          	jal	x1,800021f8 <__mulsi3>
80006d24:	00050a93          	addi	x21,x10,0
80006d28:	000b0593          	addi	x11,x22,0
80006d2c:	00048513          	addi	x10,x9,0
80006d30:	d3cfb0ef          	jal	x1,8000226c <__umodsi3>
80006d34:	010a1793          	slli	x15,x20,0x10
80006d38:	01051513          	slli	x10,x10,0x10
80006d3c:	0107d793          	srli	x15,x15,0x10
80006d40:	00a7e7b3          	or	x15,x15,x10
80006d44:	0157fa63          	bgeu	x15,x21,80006d58 <__umoddi3+0x278>
80006d48:	00f987b3          	add	x15,x19,x15
80006d4c:	0137e663          	bltu	x15,x19,80006d58 <__umoddi3+0x278>
80006d50:	0157f463          	bgeu	x15,x21,80006d58 <__umoddi3+0x278>
80006d54:	013787b3          	add	x15,x15,x19
80006d58:	415784b3          	sub	x9,x15,x21
80006d5c:	e19ff06f          	jal	x0,80006b74 <__umoddi3+0x94>
80006d60:	010006b7          	lui	x13,0x1000
80006d64:	01800713          	addi	x14,x0,24
80006d68:	f0d67ee3          	bgeu	x12,x13,80006c84 <__umoddi3+0x1a4>
80006d6c:	01000713          	addi	x14,x0,16
80006d70:	f15ff06f          	jal	x0,80006c84 <__umoddi3+0x1a4>
80006d74:	ead5e4e3          	bltu	x11,x13,80006c1c <__umoddi3+0x13c>
80006d78:	000107b7          	lui	x15,0x10
80006d7c:	04f6fe63          	bgeu	x13,x15,80006dd8 <__umoddi3+0x2f8>
80006d80:	1006b793          	sltiu	x15,x13,256
80006d84:	0017b793          	sltiu	x15,x15,1
80006d88:	00379793          	slli	x15,x15,0x3
80006d8c:	80102737          	lui	x14,0x80102
80006d90:	00f6d833          	srl	x16,x13,x15
80006d94:	d4070713          	addi	x14,x14,-704 # 80101d40 <__clz_tab>
80006d98:	01070733          	add	x14,x14,x16
80006d9c:	00074a83          	lbu	x21,0(x14)
80006da0:	00fa8ab3          	add	x21,x21,x15
80006da4:	02000793          	addi	x15,x0,32
80006da8:	41578a33          	sub	x20,x15,x21
80006dac:	05579063          	bne	x15,x21,80006dec <__umoddi3+0x30c>
80006db0:	00b6e463          	bltu	x13,x11,80006db8 <__umoddi3+0x2d8>
80006db4:	00c56c63          	bltu	x10,x12,80006dcc <__umoddi3+0x2ec>
80006db8:	40c50933          	sub	x18,x10,x12
80006dbc:	40d586b3          	sub	x13,x11,x13
80006dc0:	012534b3          	sltu	x9,x10,x18
80006dc4:	00090413          	addi	x8,x18,0
80006dc8:	409684b3          	sub	x9,x13,x9
80006dcc:	00040513          	addi	x10,x8,0
80006dd0:	00048593          	addi	x11,x9,0
80006dd4:	e49ff06f          	jal	x0,80006c1c <__umoddi3+0x13c>
80006dd8:	01000737          	lui	x14,0x1000
80006ddc:	01800793          	addi	x15,x0,24
80006de0:	fae6f6e3          	bgeu	x13,x14,80006d8c <__umoddi3+0x2ac>
80006de4:	01000793          	addi	x15,x0,16
80006de8:	fa5ff06f          	jal	x0,80006d8c <__umoddi3+0x2ac>
80006dec:	014696b3          	sll	x13,x13,x20
80006df0:	01565bb3          	srl	x23,x12,x21
80006df4:	00dbebb3          	or	x23,x23,x13
80006df8:	0155d9b3          	srl	x19,x11,x21
80006dfc:	01555433          	srl	x8,x10,x21
80006e00:	014595b3          	sll	x11,x11,x20
80006e04:	010bd493          	srli	x9,x23,0x10
80006e08:	00b46433          	or	x8,x8,x11
80006e0c:	01451b33          	sll	x22,x10,x20
80006e10:	00048593          	addi	x11,x9,0
80006e14:	00098513          	addi	x10,x19,0
80006e18:	010b9c13          	slli	x24,x23,0x10
80006e1c:	01461933          	sll	x18,x12,x20
80006e20:	010c5c13          	srli	x24,x24,0x10
80006e24:	c00fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
80006e28:	00050593          	addi	x11,x10,0
80006e2c:	00050d13          	addi	x26,x10,0
80006e30:	000c0513          	addi	x10,x24,0
80006e34:	bc4fb0ef          	jal	x1,800021f8 <__mulsi3>
80006e38:	00050c93          	addi	x25,x10,0
80006e3c:	00048593          	addi	x11,x9,0
80006e40:	00098513          	addi	x10,x19,0
80006e44:	c28fb0ef          	jal	x1,8000226c <__umodsi3>
80006e48:	01051513          	slli	x10,x10,0x10
80006e4c:	01045793          	srli	x15,x8,0x10
80006e50:	00a7e7b3          	or	x15,x15,x10
80006e54:	000d0993          	addi	x19,x26,0
80006e58:	0197fe63          	bgeu	x15,x25,80006e74 <__umoddi3+0x394>
80006e5c:	00fb87b3          	add	x15,x23,x15
80006e60:	fffd0993          	addi	x19,x26,-1
80006e64:	0177e863          	bltu	x15,x23,80006e74 <__umoddi3+0x394>
80006e68:	0197f663          	bgeu	x15,x25,80006e74 <__umoddi3+0x394>
80006e6c:	ffed0993          	addi	x19,x26,-2
80006e70:	017787b3          	add	x15,x15,x23
80006e74:	41978cb3          	sub	x25,x15,x25
80006e78:	00048593          	addi	x11,x9,0
80006e7c:	000c8513          	addi	x10,x25,0
80006e80:	ba4fb0ef          	jal	x1,80002224 <__hidden___udivsi3>
80006e84:	00050593          	addi	x11,x10,0
80006e88:	00050d13          	addi	x26,x10,0
80006e8c:	000c0513          	addi	x10,x24,0
80006e90:	b68fb0ef          	jal	x1,800021f8 <__mulsi3>
80006e94:	00048593          	addi	x11,x9,0
80006e98:	00050c13          	addi	x24,x10,0
80006e9c:	000c8513          	addi	x10,x25,0
80006ea0:	bccfb0ef          	jal	x1,8000226c <__umodsi3>
80006ea4:	01041593          	slli	x11,x8,0x10
80006ea8:	01051513          	slli	x10,x10,0x10
80006eac:	0105d593          	srli	x11,x11,0x10
80006eb0:	00a5e5b3          	or	x11,x11,x10
80006eb4:	000d0793          	addi	x15,x26,0
80006eb8:	0185fe63          	bgeu	x11,x24,80006ed4 <__umoddi3+0x3f4>
80006ebc:	00bb85b3          	add	x11,x23,x11
80006ec0:	fffd0793          	addi	x15,x26,-1
80006ec4:	0175e863          	bltu	x11,x23,80006ed4 <__umoddi3+0x3f4>
80006ec8:	0185f663          	bgeu	x11,x24,80006ed4 <__umoddi3+0x3f4>
80006ecc:	ffed0793          	addi	x15,x26,-2
80006ed0:	017585b3          	add	x11,x11,x23
80006ed4:	00010e37          	lui	x28,0x10
80006ed8:	01099993          	slli	x19,x19,0x10
80006edc:	00f9e9b3          	or	x19,x19,x15
80006ee0:	fffe0793          	addi	x15,x28,-1 # ffff <_stack_size+0xefff>
80006ee4:	00f9f733          	and	x14,x19,x15
80006ee8:	00f977b3          	and	x15,x18,x15
80006eec:	418584b3          	sub	x9,x11,x24
80006ef0:	0109d993          	srli	x19,x19,0x10
80006ef4:	01095313          	srli	x6,x18,0x10
80006ef8:	00070513          	addi	x10,x14,0 # 1000000 <_stack_size+0xfff000>
80006efc:	00078593          	addi	x11,x15,0 # 10000 <_stack_size+0xf000>
80006f00:	af8fb0ef          	jal	x1,800021f8 <__mulsi3>
80006f04:	00050813          	addi	x16,x10,0
80006f08:	00030593          	addi	x11,x6,0
80006f0c:	00070513          	addi	x10,x14,0
80006f10:	ae8fb0ef          	jal	x1,800021f8 <__mulsi3>
80006f14:	00050713          	addi	x14,x10,0
80006f18:	00078593          	addi	x11,x15,0
80006f1c:	00098513          	addi	x10,x19,0
80006f20:	ad8fb0ef          	jal	x1,800021f8 <__mulsi3>
80006f24:	00050893          	addi	x17,x10,0
80006f28:	00030593          	addi	x11,x6,0
80006f2c:	00098513          	addi	x10,x19,0
80006f30:	ac8fb0ef          	jal	x1,800021f8 <__mulsi3>
80006f34:	01085793          	srli	x15,x16,0x10
80006f38:	01170733          	add	x14,x14,x17
80006f3c:	00e787b3          	add	x15,x15,x14
80006f40:	00050693          	addi	x13,x10,0
80006f44:	0117f463          	bgeu	x15,x17,80006f4c <__umoddi3+0x46c>
80006f48:	01c506b3          	add	x13,x10,x28
80006f4c:	0107d713          	srli	x14,x15,0x10
80006f50:	00d70733          	add	x14,x14,x13
80006f54:	000106b7          	lui	x13,0x10
80006f58:	fff68693          	addi	x13,x13,-1 # ffff <_stack_size+0xefff>
80006f5c:	00d7f7b3          	and	x15,x15,x13
80006f60:	01079793          	slli	x15,x15,0x10
80006f64:	00d87833          	and	x16,x16,x13
80006f68:	010787b3          	add	x15,x15,x16
80006f6c:	00e4e663          	bltu	x9,x14,80006f78 <__umoddi3+0x498>
80006f70:	00e49e63          	bne	x9,x14,80006f8c <__umoddi3+0x4ac>
80006f74:	00fb7c63          	bgeu	x22,x15,80006f8c <__umoddi3+0x4ac>
80006f78:	41278933          	sub	x18,x15,x18
80006f7c:	0127b6b3          	sltu	x13,x15,x18
80006f80:	017686b3          	add	x13,x13,x23
80006f84:	00090793          	addi	x15,x18,0
80006f88:	40d70733          	sub	x14,x14,x13
80006f8c:	40fb07b3          	sub	x15,x22,x15
80006f90:	00fb3b33          	sltu	x22,x22,x15
80006f94:	40e485b3          	sub	x11,x9,x14
80006f98:	416585b3          	sub	x11,x11,x22
80006f9c:	01559ab3          	sll	x21,x11,x21
80006fa0:	0147d7b3          	srl	x15,x15,x20
80006fa4:	00fae533          	or	x10,x21,x15
80006fa8:	0145d5b3          	srl	x11,x11,x20
80006fac:	c71ff06f          	jal	x0,80006c1c <__umoddi3+0x13c>

Disassembly of section .data:

80100000 <stack_begin>:
	...

80101000 <__sglue>:
80101000:	0000                	.insn	2, 0x
80101002:	0000                	.insn	2, 0x
80101004:	00000003          	lb	x0,0(x0) # 0 <_heap_size>
80101008:	4020                	.insn	2, 0x4020
8010100a:	8010                	.insn	2, 0x8010
8010100c:	0000                	.insn	2, 0x
	...

80101010 <_impure_data>:
80101010:	0000                	.insn	2, 0x
80101012:	0000                	.insn	2, 0x
80101014:	4020                	.insn	2, 0x4020
80101016:	8010                	.insn	2, 0x8010
80101018:	4088                	.insn	2, 0x4088
8010101a:	8010                	.insn	2, 0x8010
8010101c:	40f0                	.insn	2, 0x40f0
8010101e:	8010                	.insn	2, 0x8010
	...
801010a8:	0001                	.insn	2, 0x0001
801010aa:	0000                	.insn	2, 0x
801010ac:	0000                	.insn	2, 0x
801010ae:	0000                	.insn	2, 0x
801010b0:	330e                	.insn	2, 0x330e
801010b2:	abcd                	.insn	2, 0xabcd
801010b4:	1234                	.insn	2, 0x1234
801010b6:	e66d                	.insn	2, 0xe66d
801010b8:	deec                	.insn	2, 0xdeec
801010ba:	0005                	.insn	2, 0x0005
801010bc:	0000000b          	.insn	4, 0x000b
	...

80101130 <__malloc_av_>:
	...
80101138:	1130                	.insn	2, 0x1130
8010113a:	8010                	.insn	2, 0x8010
8010113c:	1130                	.insn	2, 0x1130
8010113e:	8010                	.insn	2, 0x8010
80101140:	1138                	.insn	2, 0x1138
80101142:	8010                	.insn	2, 0x8010
80101144:	1138                	.insn	2, 0x1138
80101146:	8010                	.insn	2, 0x8010
80101148:	1140                	.insn	2, 0x1140
8010114a:	8010                	.insn	2, 0x8010
8010114c:	1140                	.insn	2, 0x1140
8010114e:	8010                	.insn	2, 0x8010
80101150:	1148                	.insn	2, 0x1148
80101152:	8010                	.insn	2, 0x8010
80101154:	1148                	.insn	2, 0x1148
80101156:	8010                	.insn	2, 0x8010
80101158:	1150                	.insn	2, 0x1150
8010115a:	8010                	.insn	2, 0x8010
8010115c:	1150                	.insn	2, 0x1150
8010115e:	8010                	.insn	2, 0x8010
80101160:	1158                	.insn	2, 0x1158
80101162:	8010                	.insn	2, 0x8010
80101164:	1158                	.insn	2, 0x1158
80101166:	8010                	.insn	2, 0x8010
80101168:	1160                	.insn	2, 0x1160
8010116a:	8010                	.insn	2, 0x8010
8010116c:	1160                	.insn	2, 0x1160
8010116e:	8010                	.insn	2, 0x8010
80101170:	1168                	.insn	2, 0x1168
80101172:	8010                	.insn	2, 0x8010
80101174:	1168                	.insn	2, 0x1168
80101176:	8010                	.insn	2, 0x8010
80101178:	1170                	.insn	2, 0x1170
8010117a:	8010                	.insn	2, 0x8010
8010117c:	1170                	.insn	2, 0x1170
8010117e:	8010                	.insn	2, 0x8010
80101180:	1178                	.insn	2, 0x1178
80101182:	8010                	.insn	2, 0x8010
80101184:	1178                	.insn	2, 0x1178
80101186:	8010                	.insn	2, 0x8010
80101188:	1180                	.insn	2, 0x1180
8010118a:	8010                	.insn	2, 0x8010
8010118c:	1180                	.insn	2, 0x1180
8010118e:	8010                	.insn	2, 0x8010
80101190:	1188                	.insn	2, 0x1188
80101192:	8010                	.insn	2, 0x8010
80101194:	1188                	.insn	2, 0x1188
80101196:	8010                	.insn	2, 0x8010
80101198:	1190                	.insn	2, 0x1190
8010119a:	8010                	.insn	2, 0x8010
8010119c:	1190                	.insn	2, 0x1190
8010119e:	8010                	.insn	2, 0x8010
801011a0:	1198                	.insn	2, 0x1198
801011a2:	8010                	.insn	2, 0x8010
801011a4:	1198                	.insn	2, 0x1198
801011a6:	8010                	.insn	2, 0x8010
801011a8:	11a0                	.insn	2, 0x11a0
801011aa:	8010                	.insn	2, 0x8010
801011ac:	11a0                	.insn	2, 0x11a0
801011ae:	8010                	.insn	2, 0x8010
801011b0:	11a8                	.insn	2, 0x11a8
801011b2:	8010                	.insn	2, 0x8010
801011b4:	11a8                	.insn	2, 0x11a8
801011b6:	8010                	.insn	2, 0x8010
801011b8:	11b0                	.insn	2, 0x11b0
801011ba:	8010                	.insn	2, 0x8010
801011bc:	11b0                	.insn	2, 0x11b0
801011be:	8010                	.insn	2, 0x8010
801011c0:	11b8                	.insn	2, 0x11b8
801011c2:	8010                	.insn	2, 0x8010
801011c4:	11b8                	.insn	2, 0x11b8
801011c6:	8010                	.insn	2, 0x8010
801011c8:	11c0                	.insn	2, 0x11c0
801011ca:	8010                	.insn	2, 0x8010
801011cc:	11c0                	.insn	2, 0x11c0
801011ce:	8010                	.insn	2, 0x8010
801011d0:	11c8                	.insn	2, 0x11c8
801011d2:	8010                	.insn	2, 0x8010
801011d4:	11c8                	.insn	2, 0x11c8
801011d6:	8010                	.insn	2, 0x8010
801011d8:	11d0                	.insn	2, 0x11d0
801011da:	8010                	.insn	2, 0x8010
801011dc:	11d0                	.insn	2, 0x11d0
801011de:	8010                	.insn	2, 0x8010
801011e0:	11d8                	.insn	2, 0x11d8
801011e2:	8010                	.insn	2, 0x8010
801011e4:	11d8                	.insn	2, 0x11d8
801011e6:	8010                	.insn	2, 0x8010
801011e8:	11e0                	.insn	2, 0x11e0
801011ea:	8010                	.insn	2, 0x8010
801011ec:	11e0                	.insn	2, 0x11e0
801011ee:	8010                	.insn	2, 0x8010
801011f0:	11e8                	.insn	2, 0x11e8
801011f2:	8010                	.insn	2, 0x8010
801011f4:	11e8                	.insn	2, 0x11e8
801011f6:	8010                	.insn	2, 0x8010
801011f8:	11f0                	.insn	2, 0x11f0
801011fa:	8010                	.insn	2, 0x8010
801011fc:	11f0                	.insn	2, 0x11f0
801011fe:	8010                	.insn	2, 0x8010
80101200:	11f8                	.insn	2, 0x11f8
80101202:	8010                	.insn	2, 0x8010
80101204:	11f8                	.insn	2, 0x11f8
80101206:	8010                	.insn	2, 0x8010
80101208:	1200                	.insn	2, 0x1200
8010120a:	8010                	.insn	2, 0x8010
8010120c:	1200                	.insn	2, 0x1200
8010120e:	8010                	.insn	2, 0x8010
80101210:	1208                	.insn	2, 0x1208
80101212:	8010                	.insn	2, 0x8010
80101214:	1208                	.insn	2, 0x1208
80101216:	8010                	.insn	2, 0x8010
80101218:	1210                	.insn	2, 0x1210
8010121a:	8010                	.insn	2, 0x8010
8010121c:	1210                	.insn	2, 0x1210
8010121e:	8010                	.insn	2, 0x8010
80101220:	1218                	.insn	2, 0x1218
80101222:	8010                	.insn	2, 0x8010
80101224:	1218                	.insn	2, 0x1218
80101226:	8010                	.insn	2, 0x8010
80101228:	1220                	.insn	2, 0x1220
8010122a:	8010                	.insn	2, 0x8010
8010122c:	1220                	.insn	2, 0x1220
8010122e:	8010                	.insn	2, 0x8010
80101230:	1228                	.insn	2, 0x1228
80101232:	8010                	.insn	2, 0x8010
80101234:	1228                	.insn	2, 0x1228
80101236:	8010                	.insn	2, 0x8010
80101238:	1230                	.insn	2, 0x1230
8010123a:	8010                	.insn	2, 0x8010
8010123c:	1230                	.insn	2, 0x1230
8010123e:	8010                	.insn	2, 0x8010
80101240:	1238                	.insn	2, 0x1238
80101242:	8010                	.insn	2, 0x8010
80101244:	1238                	.insn	2, 0x1238
80101246:	8010                	.insn	2, 0x8010
80101248:	1240                	.insn	2, 0x1240
8010124a:	8010                	.insn	2, 0x8010
8010124c:	1240                	.insn	2, 0x1240
8010124e:	8010                	.insn	2, 0x8010
80101250:	1248                	.insn	2, 0x1248
80101252:	8010                	.insn	2, 0x8010
80101254:	1248                	.insn	2, 0x1248
80101256:	8010                	.insn	2, 0x8010
80101258:	1250                	.insn	2, 0x1250
8010125a:	8010                	.insn	2, 0x8010
8010125c:	1250                	.insn	2, 0x1250
8010125e:	8010                	.insn	2, 0x8010
80101260:	1258                	.insn	2, 0x1258
80101262:	8010                	.insn	2, 0x8010
80101264:	1258                	.insn	2, 0x1258
80101266:	8010                	.insn	2, 0x8010
80101268:	1260                	.insn	2, 0x1260
8010126a:	8010                	.insn	2, 0x8010
8010126c:	1260                	.insn	2, 0x1260
8010126e:	8010                	.insn	2, 0x8010
80101270:	1268                	.insn	2, 0x1268
80101272:	8010                	.insn	2, 0x8010
80101274:	1268                	.insn	2, 0x1268
80101276:	8010                	.insn	2, 0x8010
80101278:	1270                	.insn	2, 0x1270
8010127a:	8010                	.insn	2, 0x8010
8010127c:	1270                	.insn	2, 0x1270
8010127e:	8010                	.insn	2, 0x8010
80101280:	1278                	.insn	2, 0x1278
80101282:	8010                	.insn	2, 0x8010
80101284:	1278                	.insn	2, 0x1278
80101286:	8010                	.insn	2, 0x8010
80101288:	1280                	.insn	2, 0x1280
8010128a:	8010                	.insn	2, 0x8010
8010128c:	1280                	.insn	2, 0x1280
8010128e:	8010                	.insn	2, 0x8010
80101290:	1288                	.insn	2, 0x1288
80101292:	8010                	.insn	2, 0x8010
80101294:	1288                	.insn	2, 0x1288
80101296:	8010                	.insn	2, 0x8010
80101298:	1290                	.insn	2, 0x1290
8010129a:	8010                	.insn	2, 0x8010
8010129c:	1290                	.insn	2, 0x1290
8010129e:	8010                	.insn	2, 0x8010
801012a0:	1298                	.insn	2, 0x1298
801012a2:	8010                	.insn	2, 0x8010
801012a4:	1298                	.insn	2, 0x1298
801012a6:	8010                	.insn	2, 0x8010
801012a8:	12a0                	.insn	2, 0x12a0
801012aa:	8010                	.insn	2, 0x8010
801012ac:	12a0                	.insn	2, 0x12a0
801012ae:	8010                	.insn	2, 0x8010
801012b0:	12a8                	.insn	2, 0x12a8
801012b2:	8010                	.insn	2, 0x8010
801012b4:	12a8                	.insn	2, 0x12a8
801012b6:	8010                	.insn	2, 0x8010
801012b8:	12b0                	.insn	2, 0x12b0
801012ba:	8010                	.insn	2, 0x8010
801012bc:	12b0                	.insn	2, 0x12b0
801012be:	8010                	.insn	2, 0x8010
801012c0:	12b8                	.insn	2, 0x12b8
801012c2:	8010                	.insn	2, 0x8010
801012c4:	12b8                	.insn	2, 0x12b8
801012c6:	8010                	.insn	2, 0x8010
801012c8:	12c0                	.insn	2, 0x12c0
801012ca:	8010                	.insn	2, 0x8010
801012cc:	12c0                	.insn	2, 0x12c0
801012ce:	8010                	.insn	2, 0x8010
801012d0:	12c8                	.insn	2, 0x12c8
801012d2:	8010                	.insn	2, 0x8010
801012d4:	12c8                	.insn	2, 0x12c8
801012d6:	8010                	.insn	2, 0x8010
801012d8:	12d0                	.insn	2, 0x12d0
801012da:	8010                	.insn	2, 0x8010
801012dc:	12d0                	.insn	2, 0x12d0
801012de:	8010                	.insn	2, 0x8010
801012e0:	12d8                	.insn	2, 0x12d8
801012e2:	8010                	.insn	2, 0x8010
801012e4:	12d8                	.insn	2, 0x12d8
801012e6:	8010                	.insn	2, 0x8010
801012e8:	12e0                	.insn	2, 0x12e0
801012ea:	8010                	.insn	2, 0x8010
801012ec:	12e0                	.insn	2, 0x12e0
801012ee:	8010                	.insn	2, 0x8010
801012f0:	12e8                	.insn	2, 0x12e8
801012f2:	8010                	.insn	2, 0x8010
801012f4:	12e8                	.insn	2, 0x12e8
801012f6:	8010                	.insn	2, 0x8010
801012f8:	12f0                	.insn	2, 0x12f0
801012fa:	8010                	.insn	2, 0x8010
801012fc:	12f0                	.insn	2, 0x12f0
801012fe:	8010                	.insn	2, 0x8010
80101300:	12f8                	.insn	2, 0x12f8
80101302:	8010                	.insn	2, 0x8010
80101304:	12f8                	.insn	2, 0x12f8
80101306:	8010                	.insn	2, 0x8010
80101308:	1300                	.insn	2, 0x1300
8010130a:	8010                	.insn	2, 0x8010
8010130c:	1300                	.insn	2, 0x1300
8010130e:	8010                	.insn	2, 0x8010
80101310:	1308                	.insn	2, 0x1308
80101312:	8010                	.insn	2, 0x8010
80101314:	1308                	.insn	2, 0x1308
80101316:	8010                	.insn	2, 0x8010
80101318:	1310                	.insn	2, 0x1310
8010131a:	8010                	.insn	2, 0x8010
8010131c:	1310                	.insn	2, 0x1310
8010131e:	8010                	.insn	2, 0x8010
80101320:	1318                	.insn	2, 0x1318
80101322:	8010                	.insn	2, 0x8010
80101324:	1318                	.insn	2, 0x1318
80101326:	8010                	.insn	2, 0x8010
80101328:	1320                	.insn	2, 0x1320
8010132a:	8010                	.insn	2, 0x8010
8010132c:	1320                	.insn	2, 0x1320
8010132e:	8010                	.insn	2, 0x8010
80101330:	1328                	.insn	2, 0x1328
80101332:	8010                	.insn	2, 0x8010
80101334:	1328                	.insn	2, 0x1328
80101336:	8010                	.insn	2, 0x8010
80101338:	1330                	.insn	2, 0x1330
8010133a:	8010                	.insn	2, 0x8010
8010133c:	1330                	.insn	2, 0x1330
8010133e:	8010                	.insn	2, 0x8010
80101340:	1338                	.insn	2, 0x1338
80101342:	8010                	.insn	2, 0x8010
80101344:	1338                	.insn	2, 0x1338
80101346:	8010                	.insn	2, 0x8010
80101348:	1340                	.insn	2, 0x1340
8010134a:	8010                	.insn	2, 0x8010
8010134c:	1340                	.insn	2, 0x1340
8010134e:	8010                	.insn	2, 0x8010
80101350:	1348                	.insn	2, 0x1348
80101352:	8010                	.insn	2, 0x8010
80101354:	1348                	.insn	2, 0x1348
80101356:	8010                	.insn	2, 0x8010
80101358:	1350                	.insn	2, 0x1350
8010135a:	8010                	.insn	2, 0x8010
8010135c:	1350                	.insn	2, 0x1350
8010135e:	8010                	.insn	2, 0x8010
80101360:	1358                	.insn	2, 0x1358
80101362:	8010                	.insn	2, 0x8010
80101364:	1358                	.insn	2, 0x1358
80101366:	8010                	.insn	2, 0x8010
80101368:	1360                	.insn	2, 0x1360
8010136a:	8010                	.insn	2, 0x8010
8010136c:	1360                	.insn	2, 0x1360
8010136e:	8010                	.insn	2, 0x8010
80101370:	1368                	.insn	2, 0x1368
80101372:	8010                	.insn	2, 0x8010
80101374:	1368                	.insn	2, 0x1368
80101376:	8010                	.insn	2, 0x8010
80101378:	1370                	.insn	2, 0x1370
8010137a:	8010                	.insn	2, 0x8010
8010137c:	1370                	.insn	2, 0x1370
8010137e:	8010                	.insn	2, 0x8010
80101380:	1378                	.insn	2, 0x1378
80101382:	8010                	.insn	2, 0x8010
80101384:	1378                	.insn	2, 0x1378
80101386:	8010                	.insn	2, 0x8010
80101388:	1380                	.insn	2, 0x1380
8010138a:	8010                	.insn	2, 0x8010
8010138c:	1380                	.insn	2, 0x1380
8010138e:	8010                	.insn	2, 0x8010
80101390:	1388                	.insn	2, 0x1388
80101392:	8010                	.insn	2, 0x8010
80101394:	1388                	.insn	2, 0x1388
80101396:	8010                	.insn	2, 0x8010
80101398:	1390                	.insn	2, 0x1390
8010139a:	8010                	.insn	2, 0x8010
8010139c:	1390                	.insn	2, 0x1390
8010139e:	8010                	.insn	2, 0x8010
801013a0:	1398                	.insn	2, 0x1398
801013a2:	8010                	.insn	2, 0x8010
801013a4:	1398                	.insn	2, 0x1398
801013a6:	8010                	.insn	2, 0x8010
801013a8:	13a0                	.insn	2, 0x13a0
801013aa:	8010                	.insn	2, 0x8010
801013ac:	13a0                	.insn	2, 0x13a0
801013ae:	8010                	.insn	2, 0x8010
801013b0:	13a8                	.insn	2, 0x13a8
801013b2:	8010                	.insn	2, 0x8010
801013b4:	13a8                	.insn	2, 0x13a8
801013b6:	8010                	.insn	2, 0x8010
801013b8:	13b0                	.insn	2, 0x13b0
801013ba:	8010                	.insn	2, 0x8010
801013bc:	13b0                	.insn	2, 0x13b0
801013be:	8010                	.insn	2, 0x8010
801013c0:	13b8                	.insn	2, 0x13b8
801013c2:	8010                	.insn	2, 0x8010
801013c4:	13b8                	.insn	2, 0x13b8
801013c6:	8010                	.insn	2, 0x8010
801013c8:	13c0                	.insn	2, 0x13c0
801013ca:	8010                	.insn	2, 0x8010
801013cc:	13c0                	.insn	2, 0x13c0
801013ce:	8010                	.insn	2, 0x8010
801013d0:	13c8                	.insn	2, 0x13c8
801013d2:	8010                	.insn	2, 0x8010
801013d4:	13c8                	.insn	2, 0x13c8
801013d6:	8010                	.insn	2, 0x8010
801013d8:	13d0                	.insn	2, 0x13d0
801013da:	8010                	.insn	2, 0x8010
801013dc:	13d0                	.insn	2, 0x13d0
801013de:	8010                	.insn	2, 0x8010
801013e0:	13d8                	.insn	2, 0x13d8
801013e2:	8010                	.insn	2, 0x8010
801013e4:	13d8                	.insn	2, 0x13d8
801013e6:	8010                	.insn	2, 0x8010
801013e8:	13e0                	.insn	2, 0x13e0
801013ea:	8010                	.insn	2, 0x8010
801013ec:	13e0                	.insn	2, 0x13e0
801013ee:	8010                	.insn	2, 0x8010
801013f0:	13e8                	.insn	2, 0x13e8
801013f2:	8010                	.insn	2, 0x8010
801013f4:	13e8                	.insn	2, 0x13e8
801013f6:	8010                	.insn	2, 0x8010
801013f8:	13f0                	.insn	2, 0x13f0
801013fa:	8010                	.insn	2, 0x8010
801013fc:	13f0                	.insn	2, 0x13f0
801013fe:	8010                	.insn	2, 0x8010
80101400:	13f8                	.insn	2, 0x13f8
80101402:	8010                	.insn	2, 0x8010
80101404:	13f8                	.insn	2, 0x13f8
80101406:	8010                	.insn	2, 0x8010
80101408:	1400                	.insn	2, 0x1400
8010140a:	8010                	.insn	2, 0x8010
8010140c:	1400                	.insn	2, 0x1400
8010140e:	8010                	.insn	2, 0x8010
80101410:	1408                	.insn	2, 0x1408
80101412:	8010                	.insn	2, 0x8010
80101414:	1408                	.insn	2, 0x1408
80101416:	8010                	.insn	2, 0x8010
80101418:	1410                	.insn	2, 0x1410
8010141a:	8010                	.insn	2, 0x8010
8010141c:	1410                	.insn	2, 0x1410
8010141e:	8010                	.insn	2, 0x8010
80101420:	1418                	.insn	2, 0x1418
80101422:	8010                	.insn	2, 0x8010
80101424:	1418                	.insn	2, 0x1418
80101426:	8010                	.insn	2, 0x8010
80101428:	1420                	.insn	2, 0x1420
8010142a:	8010                	.insn	2, 0x8010
8010142c:	1420                	.insn	2, 0x1420
8010142e:	8010                	.insn	2, 0x8010
80101430:	1428                	.insn	2, 0x1428
80101432:	8010                	.insn	2, 0x8010
80101434:	1428                	.insn	2, 0x1428
80101436:	8010                	.insn	2, 0x8010
80101438:	1430                	.insn	2, 0x1430
8010143a:	8010                	.insn	2, 0x8010
8010143c:	1430                	.insn	2, 0x1430
8010143e:	8010                	.insn	2, 0x8010
80101440:	1438                	.insn	2, 0x1438
80101442:	8010                	.insn	2, 0x8010
80101444:	1438                	.insn	2, 0x1438
80101446:	8010                	.insn	2, 0x8010
80101448:	1440                	.insn	2, 0x1440
8010144a:	8010                	.insn	2, 0x8010
8010144c:	1440                	.insn	2, 0x1440
8010144e:	8010                	.insn	2, 0x8010
80101450:	1448                	.insn	2, 0x1448
80101452:	8010                	.insn	2, 0x8010
80101454:	1448                	.insn	2, 0x1448
80101456:	8010                	.insn	2, 0x8010
80101458:	1450                	.insn	2, 0x1450
8010145a:	8010                	.insn	2, 0x8010
8010145c:	1450                	.insn	2, 0x1450
8010145e:	8010                	.insn	2, 0x8010
80101460:	1458                	.insn	2, 0x1458
80101462:	8010                	.insn	2, 0x8010
80101464:	1458                	.insn	2, 0x1458
80101466:	8010                	.insn	2, 0x8010
80101468:	1460                	.insn	2, 0x1460
8010146a:	8010                	.insn	2, 0x8010
8010146c:	1460                	.insn	2, 0x1460
8010146e:	8010                	.insn	2, 0x8010
80101470:	1468                	.insn	2, 0x1468
80101472:	8010                	.insn	2, 0x8010
80101474:	1468                	.insn	2, 0x1468
80101476:	8010                	.insn	2, 0x8010
80101478:	1470                	.insn	2, 0x1470
8010147a:	8010                	.insn	2, 0x8010
8010147c:	1470                	.insn	2, 0x1470
8010147e:	8010                	.insn	2, 0x8010
80101480:	1478                	.insn	2, 0x1478
80101482:	8010                	.insn	2, 0x8010
80101484:	1478                	.insn	2, 0x1478
80101486:	8010                	.insn	2, 0x8010
80101488:	1480                	.insn	2, 0x1480
8010148a:	8010                	.insn	2, 0x8010
8010148c:	1480                	.insn	2, 0x1480
8010148e:	8010                	.insn	2, 0x8010
80101490:	1488                	.insn	2, 0x1488
80101492:	8010                	.insn	2, 0x8010
80101494:	1488                	.insn	2, 0x1488
80101496:	8010                	.insn	2, 0x8010
80101498:	1490                	.insn	2, 0x1490
8010149a:	8010                	.insn	2, 0x8010
8010149c:	1490                	.insn	2, 0x1490
8010149e:	8010                	.insn	2, 0x8010
801014a0:	1498                	.insn	2, 0x1498
801014a2:	8010                	.insn	2, 0x8010
801014a4:	1498                	.insn	2, 0x1498
801014a6:	8010                	.insn	2, 0x8010
801014a8:	14a0                	.insn	2, 0x14a0
801014aa:	8010                	.insn	2, 0x8010
801014ac:	14a0                	.insn	2, 0x14a0
801014ae:	8010                	.insn	2, 0x8010
801014b0:	14a8                	.insn	2, 0x14a8
801014b2:	8010                	.insn	2, 0x8010
801014b4:	14a8                	.insn	2, 0x14a8
801014b6:	8010                	.insn	2, 0x8010
801014b8:	14b0                	.insn	2, 0x14b0
801014ba:	8010                	.insn	2, 0x8010
801014bc:	14b0                	.insn	2, 0x14b0
801014be:	8010                	.insn	2, 0x8010
801014c0:	14b8                	.insn	2, 0x14b8
801014c2:	8010                	.insn	2, 0x8010
801014c4:	14b8                	.insn	2, 0x14b8
801014c6:	8010                	.insn	2, 0x8010
801014c8:	14c0                	.insn	2, 0x14c0
801014ca:	8010                	.insn	2, 0x8010
801014cc:	14c0                	.insn	2, 0x14c0
801014ce:	8010                	.insn	2, 0x8010
801014d0:	14c8                	.insn	2, 0x14c8
801014d2:	8010                	.insn	2, 0x8010
801014d4:	14c8                	.insn	2, 0x14c8
801014d6:	8010                	.insn	2, 0x8010
801014d8:	14d0                	.insn	2, 0x14d0
801014da:	8010                	.insn	2, 0x8010
801014dc:	14d0                	.insn	2, 0x14d0
801014de:	8010                	.insn	2, 0x8010
801014e0:	14d8                	.insn	2, 0x14d8
801014e2:	8010                	.insn	2, 0x8010
801014e4:	14d8                	.insn	2, 0x14d8
801014e6:	8010                	.insn	2, 0x8010
801014e8:	14e0                	.insn	2, 0x14e0
801014ea:	8010                	.insn	2, 0x8010
801014ec:	14e0                	.insn	2, 0x14e0
801014ee:	8010                	.insn	2, 0x8010
801014f0:	14e8                	.insn	2, 0x14e8
801014f2:	8010                	.insn	2, 0x8010
801014f4:	14e8                	.insn	2, 0x14e8
801014f6:	8010                	.insn	2, 0x8010
801014f8:	14f0                	.insn	2, 0x14f0
801014fa:	8010                	.insn	2, 0x8010
801014fc:	14f0                	.insn	2, 0x14f0
801014fe:	8010                	.insn	2, 0x8010
80101500:	14f8                	.insn	2, 0x14f8
80101502:	8010                	.insn	2, 0x8010
80101504:	14f8                	.insn	2, 0x14f8
80101506:	8010                	.insn	2, 0x8010
80101508:	1500                	.insn	2, 0x1500
8010150a:	8010                	.insn	2, 0x8010
8010150c:	1500                	.insn	2, 0x1500
8010150e:	8010                	.insn	2, 0x8010
80101510:	1508                	.insn	2, 0x1508
80101512:	8010                	.insn	2, 0x8010
80101514:	1508                	.insn	2, 0x1508
80101516:	8010                	.insn	2, 0x8010
80101518:	1510                	.insn	2, 0x1510
8010151a:	8010                	.insn	2, 0x8010
8010151c:	1510                	.insn	2, 0x1510
8010151e:	8010                	.insn	2, 0x8010
80101520:	1518                	.insn	2, 0x1518
80101522:	8010                	.insn	2, 0x8010
80101524:	1518                	.insn	2, 0x1518
80101526:	8010                	.insn	2, 0x8010
80101528:	1520                	.insn	2, 0x1520
8010152a:	8010                	.insn	2, 0x8010
8010152c:	1520                	.insn	2, 0x1520
8010152e:	8010                	.insn	2, 0x8010
80101530:	1528                	.insn	2, 0x1528
80101532:	8010                	.insn	2, 0x8010
80101534:	1528                	.insn	2, 0x1528
80101536:	8010                	.insn	2, 0x8010

80101538 <__global_locale>:
80101538:	00000043          	.insn	4, 0x0043
	...
80101558:	00000043          	.insn	4, 0x0043
	...
80101578:	00000043          	.insn	4, 0x0043
	...
80101598:	00000043          	.insn	4, 0x0043
	...
801015b8:	00000043          	.insn	4, 0x0043
	...
801015d8:	00000043          	.insn	4, 0x0043
	...
801015f8:	00000043          	.insn	4, 0x0043
	...
80101618:	61b0                	.insn	2, 0x61b0
8010161a:	8000                	.insn	2, 0x8000
8010161c:	6148                	.insn	2, 0x6148
8010161e:	8000                	.insn	2, 0x8000
80101620:	0000                	.insn	2, 0x
80101622:	0000                	.insn	2, 0x
80101624:	1c3c                	.insn	2, 0x1c3c
80101626:	8010                	.insn	2, 0x8010
80101628:	1a9c                	.insn	2, 0x1a9c
8010162a:	8010                	.insn	2, 0x8010
8010162c:	1a2c                	.insn	2, 0x1a2c
8010162e:	8010                	.insn	2, 0x8010
80101630:	1a2c                	.insn	2, 0x1a2c
80101632:	8010                	.insn	2, 0x8010
80101634:	1a2c                	.insn	2, 0x1a2c
80101636:	8010                	.insn	2, 0x8010
80101638:	1a2c                	.insn	2, 0x1a2c
8010163a:	8010                	.insn	2, 0x8010
8010163c:	1a2c                	.insn	2, 0x1a2c
8010163e:	8010                	.insn	2, 0x8010
80101640:	1a2c                	.insn	2, 0x1a2c
80101642:	8010                	.insn	2, 0x8010
80101644:	1a2c                	.insn	2, 0x1a2c
80101646:	8010                	.insn	2, 0x8010
80101648:	1a2c                	.insn	2, 0x1a2c
8010164a:	8010                	.insn	2, 0x8010
8010164c:	1a2c                	.insn	2, 0x1a2c
8010164e:	8010                	.insn	2, 0x8010
80101650:	ffff                	.insn	2, 0xffff
80101652:	ffff                	.insn	2, 0xffff
80101654:	ffff                	.insn	2, 0xffff
80101656:	ffff                	.insn	2, 0xffff
80101658:	ffff                	.insn	2, 0xffff
8010165a:	ffff                	.insn	2, 0xffff
8010165c:	ffff                	.insn	2, 0xffff
8010165e:	0000                	.insn	2, 0x
80101660:	0001                	.insn	2, 0x0001
80101662:	5341                	.insn	2, 0x5341
80101664:	00494943          	.insn	4, 0x00494943
	...
80101680:	0000                	.insn	2, 0x
80101682:	5341                	.insn	2, 0x5341
80101684:	00494943          	.insn	4, 0x00494943
	...

801016a4 <_impure_ptr>:
801016a4:	1010                	.insn	2, 0x1010
801016a6:	8010                	.insn	2, 0x8010

801016a8 <__malloc_sbrk_base>:
801016a8:	ffff                	.insn	2, 0xffff
801016aa:	ffff                	.insn	2, 0xffff

801016ac <__malloc_trim_threshold>:
801016ac:	0000                	.insn	2, 0x
801016ae:	0002                	.insn	2, 0x0002

801016b0 <array>:
801016b0:	000e                	.insn	2, 0x000e
801016b2:	0000                	.insn	2, 0x
801016b4:	0042                	.insn	2, 0x0042
801016b6:	0000                	.insn	2, 0x
801016b8:	000c                	.insn	2, 0x000c
801016ba:	0000                	.insn	2, 0x
801016bc:	0029                	.insn	2, 0x0029
801016be:	0000                	.insn	2, 0x
801016c0:	0056                	.insn	2, 0x0056
801016c2:	0000                	.insn	2, 0x
801016c4:	0045                	.insn	2, 0x0045
801016c6:	0000                	.insn	2, 0x
801016c8:	00000013          	addi	x0,x0,0
801016cc:	004d                	.insn	2, 0x004d
801016ce:	0000                	.insn	2, 0x
801016d0:	0044                	.insn	2, 0x0044
801016d2:	0000                	.insn	2, 0x
801016d4:	0026                	.insn	2, 0x0026
801016d6:	0000                	.insn	2, 0x
801016d8:	001a                	.insn	2, 0x001a
801016da:	0000                	.insn	2, 0x
801016dc:	002a                	.insn	2, 0x002a
801016de:	0000                	.insn	2, 0x
801016e0:	0025                	.insn	2, 0x0025
801016e2:	0000                	.insn	2, 0x
801016e4:	00000017          	auipc	x0,0x0
801016e8:	0011                	.insn	2, 0x0011
801016ea:	0000                	.insn	2, 0x
801016ec:	001d                	.insn	2, 0x001d
801016ee:	0000                	.insn	2, 0x
801016f0:	00000037          	lui	x0,0x0
801016f4:	000d                	.insn	2, 0x000d
801016f6:	0000                	.insn	2, 0x
801016f8:	005a                	.insn	2, 0x005a
801016fa:	0000                	.insn	2, 0x
801016fc:	005c                	.insn	2, 0x005c
801016fe:	0000                	.insn	2, 0x
80101700:	004c                	.insn	2, 0x004c
80101702:	0000                	.insn	2, 0x
80101704:	00000063          	beq	x0,x0,80101704 <array+0x54>
80101708:	000a                	.insn	2, 0x000a
8010170a:	0000                	.insn	2, 0x
8010170c:	0036                	.insn	2, 0x0036
8010170e:	0000                	.insn	2, 0x
80101710:	0039                	.insn	2, 0x0039
80101712:	0000                	.insn	2, 0x
80101714:	00000053          	.insn	4, 0x0053
80101718:	0028                	.insn	2, 0x0028
8010171a:	0000                	.insn	2, 0x
8010171c:	002c                	.insn	2, 0x002c
8010171e:	0000                	.insn	2, 0x
80101720:	0000004b          	.insn	4, 0x004b
80101724:	0021                	.insn	2, 0x0021
80101726:	0000                	.insn	2, 0x
80101728:	0018                	.insn	2, 0x0018
8010172a:	0000                	.insn	2, 0x
8010172c:	001c                	.insn	2, 0x001c
8010172e:	0000                	.insn	2, 0x
80101730:	0050                	.insn	2, 0x0050
80101732:	0000                	.insn	2, 0x
80101734:	0012                	.insn	2, 0x0012
80101736:	0000                	.insn	2, 0x
80101738:	004e                	.insn	2, 0x004e
8010173a:	0000                	.insn	2, 0x
8010173c:	0020                	.insn	2, 0x0020
8010173e:	0000                	.insn	2, 0x
80101740:	005d                	.insn	2, 0x005d
80101742:	0000                	.insn	2, 0x
80101744:	0059                	.insn	2, 0x0059
80101746:	0000                	.insn	2, 0x
80101748:	0034                	.insn	2, 0x0034
8010174a:	0000                	.insn	2, 0x
8010174c:	0000000b          	.insn	4, 0x000b
80101750:	0015                	.insn	2, 0x0015
80101752:	0000                	.insn	2, 0x
80101754:	0060                	.insn	2, 0x0060
80101756:	0000                	.insn	2, 0x
80101758:	0032                	.insn	2, 0x0032
8010175a:	0000                	.insn	2, 0x
8010175c:	0000000f          	fence	unknown,unknown
80101760:	0030                	.insn	2, 0x0030
80101762:	0000                	.insn	2, 0x
80101764:	0000003f 00000057 	.insn	8, 0x00570000003f
8010176c:	0014                	.insn	2, 0x0014
8010176e:	0000                	.insn	2, 0x
80101770:	0008                	.insn	2, 0x0008
80101772:	0000                	.insn	2, 0x
80101774:	0055                	.insn	2, 0x0055
80101776:	0000                	.insn	2, 0x
80101778:	0000002b          	.insn	4, 0x002b
8010177c:	0010                	.insn	2, 0x0010
8010177e:	0000                	.insn	2, 0x
80101780:	005e                	.insn	2, 0x005e
80101782:	0000                	.insn	2, 0x
80101784:	0058                	.insn	2, 0x0058
80101786:	0000                	.insn	2, 0x
80101788:	0035                	.insn	2, 0x0035
8010178a:	0000                	.insn	2, 0x
8010178c:	0054                	.insn	2, 0x0054
8010178e:	0000                	.insn	2, 0x
80101790:	004a                	.insn	2, 0x004a
80101792:	0000                	.insn	2, 0x
80101794:	0000005b          	.insn	4, 0x005b
80101798:	00000043          	.insn	4, 0x0043
8010179c:	0024                	.insn	2, 0x0024
8010179e:	0000                	.insn	2, 0x
801017a0:	005f 0000 003d      	.insn	6, 0x003d0000005f
801017a6:	0000                	.insn	2, 0x
801017a8:	0040                	.insn	2, 0x0040
801017aa:	0000                	.insn	2, 0x
801017ac:	0005                	.insn	2, 0x0005
801017ae:	0000                	.insn	2, 0x
801017b0:	001e                	.insn	2, 0x001e
801017b2:	0000                	.insn	2, 0x
801017b4:	0052                	.insn	2, 0x0052
801017b6:	0000                	.insn	2, 0x
801017b8:	0048                	.insn	2, 0x0048
801017ba:	0000                	.insn	2, 0x
801017bc:	002e                	.insn	2, 0x002e
801017be:	0000                	.insn	2, 0x
801017c0:	0000003b          	.insn	4, 0x003b
801017c4:	0009                	.insn	2, 0x0009
801017c6:	0000                	.insn	2, 0x
801017c8:	00000007          	.insn	4, 0x0007
801017cc:	00000003          	lb	x0,0(x0) # 0 <_heap_size>
801017d0:	00000027          	.insn	4, 0x0027
801017d4:	001f 0000 0004      	.insn	6, 0x00040000001f
801017da:	0000                	.insn	2, 0x
801017dc:	0049                	.insn	2, 0x0049
801017de:	0000                	.insn	2, 0x
801017e0:	0046                	.insn	2, 0x0046
801017e2:	0000                	.insn	2, 0x
801017e4:	003c                	.insn	2, 0x003c
801017e6:	0000                	.insn	2, 0x
801017e8:	003a                	.insn	2, 0x003a
801017ea:	0000                	.insn	2, 0x
801017ec:	0051                	.insn	2, 0x0051
801017ee:	0000                	.insn	2, 0x
801017f0:	0038                	.insn	2, 0x0038
801017f2:	0000                	.insn	2, 0x
801017f4:	00000033          	add	x0,x0,x0
801017f8:	002d                	.insn	2, 0x002d
801017fa:	0000                	.insn	2, 0x
801017fc:	0001                	.insn	2, 0x0001
801017fe:	0000                	.insn	2, 0x
80101800:	0006                	.insn	2, 0x0006
80101802:	0000                	.insn	2, 0x
80101804:	0031                	.insn	2, 0x0031
80101806:	0000                	.insn	2, 0x
80101808:	0000001b          	.insn	4, 0x001b
8010180c:	0000002f          	.insn	4, 0x002f
80101810:	0022                	.insn	2, 0x0022
80101812:	0000                	.insn	2, 0x
80101814:	00000023          	sb	x0,0(x0) # 0 <_heap_size>
80101818:	003e                	.insn	2, 0x003e
8010181a:	0000                	.insn	2, 0x
8010181c:	0061                	.insn	2, 0x0061
8010181e:	0000                	.insn	2, 0x
80101820:	0002                	.insn	2, 0x0002
80101822:	0000                	.insn	2, 0x
80101824:	0000004f          	.insn	4, 0x004f
80101828:	0062                	.insn	2, 0x0062
8010182a:	0000                	.insn	2, 0x
8010182c:	0019                	.insn	2, 0x0019
8010182e:	0000                	.insn	2, 0x
80101830:	0016                	.insn	2, 0x0016
80101832:	0000                	.insn	2, 0x
80101834:	0041                	.insn	2, 0x0041
80101836:	0000                	.insn	2, 0x
80101838:	00000047          	.insn	4, 0x0047
8010183c:	0000                	.insn	2, 0x
	...

80101840 <array_exp.0>:
80101840:	0000                	.insn	2, 0x
80101842:	0000                	.insn	2, 0x
80101844:	0001                	.insn	2, 0x0001
80101846:	0000                	.insn	2, 0x
80101848:	0002                	.insn	2, 0x0002
8010184a:	0000                	.insn	2, 0x
8010184c:	00000003          	lb	x0,0(x0) # 0 <_heap_size>
80101850:	0004                	.insn	2, 0x0004
80101852:	0000                	.insn	2, 0x
80101854:	0005                	.insn	2, 0x0005
80101856:	0000                	.insn	2, 0x
80101858:	0006                	.insn	2, 0x0006
8010185a:	0000                	.insn	2, 0x
8010185c:	00000007          	.insn	4, 0x0007
80101860:	0008                	.insn	2, 0x0008
80101862:	0000                	.insn	2, 0x
80101864:	0009                	.insn	2, 0x0009
80101866:	0000                	.insn	2, 0x
80101868:	000a                	.insn	2, 0x000a
8010186a:	0000                	.insn	2, 0x
8010186c:	0000000b          	.insn	4, 0x000b
80101870:	000c                	.insn	2, 0x000c
80101872:	0000                	.insn	2, 0x
80101874:	000d                	.insn	2, 0x000d
80101876:	0000                	.insn	2, 0x
80101878:	000e                	.insn	2, 0x000e
8010187a:	0000                	.insn	2, 0x
8010187c:	0000000f          	fence	unknown,unknown
80101880:	0010                	.insn	2, 0x0010
80101882:	0000                	.insn	2, 0x
80101884:	0011                	.insn	2, 0x0011
80101886:	0000                	.insn	2, 0x
80101888:	0012                	.insn	2, 0x0012
8010188a:	0000                	.insn	2, 0x
8010188c:	00000013          	addi	x0,x0,0
80101890:	0014                	.insn	2, 0x0014
80101892:	0000                	.insn	2, 0x
80101894:	0015                	.insn	2, 0x0015
80101896:	0000                	.insn	2, 0x
80101898:	0016                	.insn	2, 0x0016
8010189a:	0000                	.insn	2, 0x
8010189c:	00000017          	auipc	x0,0x0
801018a0:	0018                	.insn	2, 0x0018
801018a2:	0000                	.insn	2, 0x
801018a4:	0019                	.insn	2, 0x0019
801018a6:	0000                	.insn	2, 0x
801018a8:	001a                	.insn	2, 0x001a
801018aa:	0000                	.insn	2, 0x
801018ac:	0000001b          	.insn	4, 0x001b
801018b0:	001c                	.insn	2, 0x001c
801018b2:	0000                	.insn	2, 0x
801018b4:	001d                	.insn	2, 0x001d
801018b6:	0000                	.insn	2, 0x
801018b8:	001e                	.insn	2, 0x001e
801018ba:	0000                	.insn	2, 0x
801018bc:	001f 0000 0020      	.insn	6, 0x00200000001f
801018c2:	0000                	.insn	2, 0x
801018c4:	0021                	.insn	2, 0x0021
801018c6:	0000                	.insn	2, 0x
801018c8:	0022                	.insn	2, 0x0022
801018ca:	0000                	.insn	2, 0x
801018cc:	00000023          	sb	x0,0(x0) # 0 <_heap_size>
801018d0:	0024                	.insn	2, 0x0024
801018d2:	0000                	.insn	2, 0x
801018d4:	0025                	.insn	2, 0x0025
801018d6:	0000                	.insn	2, 0x
801018d8:	0026                	.insn	2, 0x0026
801018da:	0000                	.insn	2, 0x
801018dc:	00000027          	.insn	4, 0x0027
801018e0:	0028                	.insn	2, 0x0028
801018e2:	0000                	.insn	2, 0x
801018e4:	0029                	.insn	2, 0x0029
801018e6:	0000                	.insn	2, 0x
801018e8:	002a                	.insn	2, 0x002a
801018ea:	0000                	.insn	2, 0x
801018ec:	0000002b          	.insn	4, 0x002b
801018f0:	002c                	.insn	2, 0x002c
801018f2:	0000                	.insn	2, 0x
801018f4:	002d                	.insn	2, 0x002d
801018f6:	0000                	.insn	2, 0x
801018f8:	002e                	.insn	2, 0x002e
801018fa:	0000                	.insn	2, 0x
801018fc:	0000002f          	.insn	4, 0x002f
80101900:	0030                	.insn	2, 0x0030
80101902:	0000                	.insn	2, 0x
80101904:	0031                	.insn	2, 0x0031
80101906:	0000                	.insn	2, 0x
80101908:	0032                	.insn	2, 0x0032
8010190a:	0000                	.insn	2, 0x
8010190c:	00000033          	add	x0,x0,x0
80101910:	0034                	.insn	2, 0x0034
80101912:	0000                	.insn	2, 0x
80101914:	0035                	.insn	2, 0x0035
80101916:	0000                	.insn	2, 0x
80101918:	0036                	.insn	2, 0x0036
8010191a:	0000                	.insn	2, 0x
8010191c:	00000037          	lui	x0,0x0
80101920:	0038                	.insn	2, 0x0038
80101922:	0000                	.insn	2, 0x
80101924:	0039                	.insn	2, 0x0039
80101926:	0000                	.insn	2, 0x
80101928:	003a                	.insn	2, 0x003a
8010192a:	0000                	.insn	2, 0x
8010192c:	0000003b          	.insn	4, 0x003b
80101930:	003c                	.insn	2, 0x003c
80101932:	0000                	.insn	2, 0x
80101934:	003d                	.insn	2, 0x003d
80101936:	0000                	.insn	2, 0x
80101938:	003e                	.insn	2, 0x003e
8010193a:	0000                	.insn	2, 0x
8010193c:	0000003f 00000040 	.insn	8, 0x00400000003f
80101944:	0041                	.insn	2, 0x0041
80101946:	0000                	.insn	2, 0x
80101948:	0042                	.insn	2, 0x0042
8010194a:	0000                	.insn	2, 0x
8010194c:	00000043          	.insn	4, 0x0043
80101950:	0044                	.insn	2, 0x0044
80101952:	0000                	.insn	2, 0x
80101954:	0045                	.insn	2, 0x0045
80101956:	0000                	.insn	2, 0x
80101958:	0046                	.insn	2, 0x0046
8010195a:	0000                	.insn	2, 0x
8010195c:	00000047          	.insn	4, 0x0047
80101960:	0048                	.insn	2, 0x0048
80101962:	0000                	.insn	2, 0x
80101964:	0049                	.insn	2, 0x0049
80101966:	0000                	.insn	2, 0x
80101968:	004a                	.insn	2, 0x004a
8010196a:	0000                	.insn	2, 0x
8010196c:	0000004b          	.insn	4, 0x004b
80101970:	004c                	.insn	2, 0x004c
80101972:	0000                	.insn	2, 0x
80101974:	004d                	.insn	2, 0x004d
80101976:	0000                	.insn	2, 0x
80101978:	004e                	.insn	2, 0x004e
8010197a:	0000                	.insn	2, 0x
8010197c:	0000004f          	.insn	4, 0x004f
80101980:	0050                	.insn	2, 0x0050
80101982:	0000                	.insn	2, 0x
80101984:	0051                	.insn	2, 0x0051
80101986:	0000                	.insn	2, 0x
80101988:	0052                	.insn	2, 0x0052
8010198a:	0000                	.insn	2, 0x
8010198c:	00000053          	.insn	4, 0x0053
80101990:	0054                	.insn	2, 0x0054
80101992:	0000                	.insn	2, 0x
80101994:	0055                	.insn	2, 0x0055
80101996:	0000                	.insn	2, 0x
80101998:	0056                	.insn	2, 0x0056
8010199a:	0000                	.insn	2, 0x
8010199c:	00000057          	.insn	4, 0x0057
801019a0:	0058                	.insn	2, 0x0058
801019a2:	0000                	.insn	2, 0x
801019a4:	0059                	.insn	2, 0x0059
801019a6:	0000                	.insn	2, 0x
801019a8:	005a                	.insn	2, 0x005a
801019aa:	0000                	.insn	2, 0x
801019ac:	0000005b          	.insn	4, 0x005b
801019b0:	005c                	.insn	2, 0x005c
801019b2:	0000                	.insn	2, 0x
801019b4:	005d                	.insn	2, 0x005d
801019b6:	0000                	.insn	2, 0x
801019b8:	005e                	.insn	2, 0x005e
801019ba:	0000                	.insn	2, 0x
801019bc:	005f 0000 0060      	.insn	6, 0x00600000005f
801019c2:	0000                	.insn	2, 0x
801019c4:	0061                	.insn	2, 0x0061
801019c6:	0000                	.insn	2, 0x
801019c8:	0062                	.insn	2, 0x0062
801019ca:	0000                	.insn	2, 0x
801019cc:	00000063          	beq	x0,x0,801019cc <array_exp.0+0x18c>
801019d0:	6568                	.insn	2, 0x6568
801019d2:	7061                	.insn	2, 0x7061
801019d4:	735f 7a69 2065      	.insn	6, 0x20657a69735f
801019da:	2025                	.insn	2, 0x2025
801019dc:	657a6973          	.insn	4, 0x657a6973
801019e0:	7628666f          	jal	x12,80188142 <_end+0x82f92>
801019e4:	2064696f          	jal	x18,80147bea <_end+0x42a3a>
801019e8:	292a                	.insn	2, 0x292a
801019ea:	3d20                	.insn	2, 0x3d20
801019ec:	203d                	.insn	2, 0x203d
801019ee:	0030                	.insn	2, 0x0030
801019f0:	6d6f682f          	.insn	4, 0x6d6f682f
801019f4:	2f65                	.insn	2, 0x2f65
801019f6:	6c6c6173          	.insn	4, 0x6c6c6173
801019fa:	7261                	.insn	2, 0x7261
801019fc:	726f772f          	.insn	4, 0x726f772f
80101a00:	6d652f6b          	.insn	4, 0x6d652f6b
80101a04:	6562                	.insn	2, 0x6562
80101a06:	636e                	.insn	2, 0x636e
80101a08:	2d68                	.insn	2, 0x2d68
80101a0a:	6f69                	.insn	2, 0x6f69
80101a0c:	2f74                	.insn	2, 0x2f74
80101a0e:	70707573          	.insn	4, 0x70707573
80101a12:	2f74726f          	jal	x4,80149508 <_end+0x44358>
80101a16:	6562                	.insn	2, 0x6562
80101a18:	6265                	.insn	2, 0x6265
80101a1a:	632e6373          	.insn	4, 0x632e6373
80101a1e:	0000                	.insn	2, 0x
80101a20:	202c                	.insn	2, 0x202c
80101a22:	7566                	.insn	2, 0x7566
80101a24:	636e                	.insn	2, 0x636e
80101a26:	6974                	.insn	2, 0x6974
80101a28:	203a6e6f          	jal	x28,801a842a <_end+0xa327a>
80101a2c:	0000                	.insn	2, 0x
80101a2e:	0000                	.insn	2, 0x
80101a30:	7361                	.insn	2, 0x7361
80101a32:	74726573          	.insn	4, 0x74726573
80101a36:	6f69                	.insn	2, 0x6f69
80101a38:	206e                	.insn	2, 0x206e
80101a3a:	2522                	.insn	2, 0x2522
80101a3c:	66202273          	.insn	4, 0x66202273
80101a40:	6961                	.insn	2, 0x6961
80101a42:	656c                	.insn	2, 0x656c
80101a44:	3a64                	.insn	2, 0x3a64
80101a46:	6620                	.insn	2, 0x6620
80101a48:	6c69                	.insn	2, 0x6c69
80101a4a:	2065                	.insn	2, 0x2065
80101a4c:	2522                	.insn	2, 0x2522
80101a4e:	202c2273          	.insn	4, 0x202c2273
80101a52:	696c                	.insn	2, 0x696c
80101a54:	656e                	.insn	2, 0x656e
80101a56:	2520                	.insn	2, 0x2520
80101a58:	2564                	.insn	2, 0x2564
80101a5a:	0a732573          	.insn	4, 0x0a732573
80101a5e:	0000                	.insn	2, 0x
80101a60:	3130                	.insn	2, 0x3130
80101a62:	3332                	.insn	2, 0x3332
80101a64:	3534                	.insn	2, 0x3534
80101a66:	3736                	.insn	2, 0x3736
80101a68:	3938                	.insn	2, 0x3938
80101a6a:	4241                	.insn	2, 0x4241
80101a6c:	46454443          	.insn	4, 0x46454443
80101a70:	0000                	.insn	2, 0x
80101a72:	0000                	.insn	2, 0x
80101a74:	3130                	.insn	2, 0x3130
80101a76:	3332                	.insn	2, 0x3332
80101a78:	3534                	.insn	2, 0x3534
80101a7a:	3736                	.insn	2, 0x3736
80101a7c:	3938                	.insn	2, 0x3938
80101a7e:	6261                	.insn	2, 0x6261
80101a80:	66656463          	bltu	x10,x6,801020e8 <heap+0xc8>
80101a84:	0000                	.insn	2, 0x
80101a86:	0000                	.insn	2, 0x
80101a88:	6e28                	.insn	2, 0x6e28
80101a8a:	6c75                	.insn	2, 0x6c75
80101a8c:	296c                	.insn	2, 0x296c
80101a8e:	0000                	.insn	2, 0x
80101a90:	00000043          	.insn	4, 0x0043
80101a94:	4f50                	.insn	2, 0x4f50
80101a96:	00584953          	.insn	4, 0x00584953
80101a9a:	0000                	.insn	2, 0x
80101a9c:	002e                	.insn	2, 0x002e
	...

80101aa0 <__func__.0>:
80101aa0:	6e69                	.insn	2, 0x6e69
80101aa2:	7469                	.insn	2, 0x7469
80101aa4:	685f 6165 5f70      	.insn	6, 0x5f706165685f
80101aaa:	6562                	.insn	2, 0x6562
80101aac:	6265                	.insn	2, 0x6265
80101aae:	2c780073          	.insn	4, 0x2c780073
80101ab2:	8000                	.insn	2, 0x8000
80101ab4:	254c                	.insn	2, 0x254c
80101ab6:	8000                	.insn	2, 0x8000
80101ab8:	254c                	.insn	2, 0x254c
80101aba:	8000                	.insn	2, 0x8000
80101abc:	2c6c                	.insn	2, 0x2c6c
80101abe:	8000                	.insn	2, 0x8000
80101ac0:	254c                	.insn	2, 0x254c
80101ac2:	8000                	.insn	2, 0x8000
80101ac4:	254c                	.insn	2, 0x254c
80101ac6:	8000                	.insn	2, 0x8000
80101ac8:	254c                	.insn	2, 0x254c
80101aca:	8000                	.insn	2, 0x8000
80101acc:	2c10                	.insn	2, 0x2c10
80101ace:	8000                	.insn	2, 0x8000
80101ad0:	254c                	.insn	2, 0x254c
80101ad2:	8000                	.insn	2, 0x8000
80101ad4:	254c                	.insn	2, 0x254c
80101ad6:	8000                	.insn	2, 0x8000
80101ad8:	2674                	.insn	2, 0x2674
80101ada:	8000                	.insn	2, 0x8000
80101adc:	29ac                	.insn	2, 0x29ac
80101ade:	8000                	.insn	2, 0x8000
80101ae0:	254c                	.insn	2, 0x254c
80101ae2:	8000                	.insn	2, 0x8000
80101ae4:	29a0                	.insn	2, 0x29a0
80101ae6:	8000                	.insn	2, 0x8000
80101ae8:	2c9c                	.insn	2, 0x2c9c
80101aea:	8000                	.insn	2, 0x8000
80101aec:	254c                	.insn	2, 0x254c
80101aee:	8000                	.insn	2, 0x8000
80101af0:	2c90                	.insn	2, 0x2c90
80101af2:	8000                	.insn	2, 0x8000
80101af4:	2518                	.insn	2, 0x2518
80101af6:	8000                	.insn	2, 0x8000
80101af8:	2518                	.insn	2, 0x2518
80101afa:	8000                	.insn	2, 0x8000
80101afc:	2518                	.insn	2, 0x2518
80101afe:	8000                	.insn	2, 0x8000
80101b00:	2518                	.insn	2, 0x2518
80101b02:	8000                	.insn	2, 0x8000
80101b04:	2518                	.insn	2, 0x2518
80101b06:	8000                	.insn	2, 0x8000
80101b08:	2518                	.insn	2, 0x2518
80101b0a:	8000                	.insn	2, 0x8000
80101b0c:	2518                	.insn	2, 0x2518
80101b0e:	8000                	.insn	2, 0x8000
80101b10:	2518                	.insn	2, 0x2518
80101b12:	8000                	.insn	2, 0x8000
80101b14:	2518                	.insn	2, 0x2518
80101b16:	8000                	.insn	2, 0x8000
80101b18:	254c                	.insn	2, 0x254c
80101b1a:	8000                	.insn	2, 0x8000
80101b1c:	254c                	.insn	2, 0x254c
80101b1e:	8000                	.insn	2, 0x8000
80101b20:	254c                	.insn	2, 0x254c
80101b22:	8000                	.insn	2, 0x8000
80101b24:	254c                	.insn	2, 0x254c
80101b26:	8000                	.insn	2, 0x8000
80101b28:	254c                	.insn	2, 0x254c
80101b2a:	8000                	.insn	2, 0x8000
80101b2c:	254c                	.insn	2, 0x254c
80101b2e:	8000                	.insn	2, 0x8000
80101b30:	254c                	.insn	2, 0x254c
80101b32:	8000                	.insn	2, 0x8000
80101b34:	254c                	.insn	2, 0x254c
80101b36:	8000                	.insn	2, 0x8000
80101b38:	254c                	.insn	2, 0x254c
80101b3a:	8000                	.insn	2, 0x8000
80101b3c:	2924                	.insn	2, 0x2924
80101b3e:	8000                	.insn	2, 0x8000
80101b40:	2b7c                	.insn	2, 0x2b7c
80101b42:	8000                	.insn	2, 0x8000
80101b44:	254c                	.insn	2, 0x254c
80101b46:	8000                	.insn	2, 0x8000
80101b48:	254c                	.insn	2, 0x254c
80101b4a:	8000                	.insn	2, 0x8000
80101b4c:	254c                	.insn	2, 0x254c
80101b4e:	8000                	.insn	2, 0x8000
80101b50:	254c                	.insn	2, 0x254c
80101b52:	8000                	.insn	2, 0x8000
80101b54:	254c                	.insn	2, 0x254c
80101b56:	8000                	.insn	2, 0x8000
80101b58:	254c                	.insn	2, 0x254c
80101b5a:	8000                	.insn	2, 0x8000
80101b5c:	254c                	.insn	2, 0x254c
80101b5e:	8000                	.insn	2, 0x8000
80101b60:	254c                	.insn	2, 0x254c
80101b62:	8000                	.insn	2, 0x8000
80101b64:	254c                	.insn	2, 0x254c
80101b66:	8000                	.insn	2, 0x8000
80101b68:	254c                	.insn	2, 0x254c
80101b6a:	8000                	.insn	2, 0x8000
80101b6c:	2b30                	.insn	2, 0x2b30
80101b6e:	8000                	.insn	2, 0x8000
80101b70:	254c                	.insn	2, 0x254c
80101b72:	8000                	.insn	2, 0x8000
80101b74:	254c                	.insn	2, 0x254c
80101b76:	8000                	.insn	2, 0x8000
80101b78:	254c                	.insn	2, 0x254c
80101b7a:	8000                	.insn	2, 0x8000
80101b7c:	28a4                	.insn	2, 0x28a4
80101b7e:	8000                	.insn	2, 0x8000
80101b80:	254c                	.insn	2, 0x254c
80101b82:	8000                	.insn	2, 0x8000
80101b84:	2a74                	.insn	2, 0x2a74
80101b86:	8000                	.insn	2, 0x8000
80101b88:	254c                	.insn	2, 0x254c
80101b8a:	8000                	.insn	2, 0x8000
80101b8c:	254c                	.insn	2, 0x254c
80101b8e:	8000                	.insn	2, 0x8000
80101b90:	31ac                	.insn	2, 0x31ac
80101b92:	8000                	.insn	2, 0x8000
80101b94:	254c                	.insn	2, 0x254c
80101b96:	8000                	.insn	2, 0x8000
80101b98:	254c                	.insn	2, 0x254c
80101b9a:	8000                	.insn	2, 0x8000
80101b9c:	254c                	.insn	2, 0x254c
80101b9e:	8000                	.insn	2, 0x8000
80101ba0:	254c                	.insn	2, 0x254c
80101ba2:	8000                	.insn	2, 0x8000
80101ba4:	254c                	.insn	2, 0x254c
80101ba6:	8000                	.insn	2, 0x8000
80101ba8:	254c                	.insn	2, 0x254c
80101baa:	8000                	.insn	2, 0x8000
80101bac:	254c                	.insn	2, 0x254c
80101bae:	8000                	.insn	2, 0x8000
80101bb0:	254c                	.insn	2, 0x254c
80101bb2:	8000                	.insn	2, 0x8000
80101bb4:	254c                	.insn	2, 0x254c
80101bb6:	8000                	.insn	2, 0x8000
80101bb8:	254c                	.insn	2, 0x254c
80101bba:	8000                	.insn	2, 0x8000
80101bbc:	2924                	.insn	2, 0x2924
80101bbe:	8000                	.insn	2, 0x8000
80101bc0:	294c                	.insn	2, 0x294c
80101bc2:	8000                	.insn	2, 0x8000
80101bc4:	254c                	.insn	2, 0x254c
80101bc6:	8000                	.insn	2, 0x8000
80101bc8:	254c                	.insn	2, 0x254c
80101bca:	8000                	.insn	2, 0x8000
80101bcc:	254c                	.insn	2, 0x254c
80101bce:	8000                	.insn	2, 0x8000
80101bd0:	2a60                	.insn	2, 0x2a60
80101bd2:	8000                	.insn	2, 0x8000
80101bd4:	294c                	.insn	2, 0x294c
80101bd6:	8000                	.insn	2, 0x8000
80101bd8:	2688                	.insn	2, 0x2688
80101bda:	8000                	.insn	2, 0x8000
80101bdc:	254c                	.insn	2, 0x254c
80101bde:	8000                	.insn	2, 0x8000
80101be0:	2cec                	.insn	2, 0x2cec
80101be2:	8000                	.insn	2, 0x8000
80101be4:	254c                	.insn	2, 0x254c
80101be6:	8000                	.insn	2, 0x8000
80101be8:	2a2c                	.insn	2, 0x2a2c
80101bea:	8000                	.insn	2, 0x8000
80101bec:	3210                	.insn	2, 0x3210
80101bee:	8000                	.insn	2, 0x8000
80101bf0:	29bc                	.insn	2, 0x29bc
80101bf2:	8000                	.insn	2, 0x8000
80101bf4:	2688                	.insn	2, 0x2688
80101bf6:	8000                	.insn	2, 0x8000
80101bf8:	254c                	.insn	2, 0x254c
80101bfa:	8000                	.insn	2, 0x8000
80101bfc:	28a4                	.insn	2, 0x28a4
80101bfe:	8000                	.insn	2, 0x8000
80101c00:	2680                	.insn	2, 0x2680
80101c02:	8000                	.insn	2, 0x8000
80101c04:	3204                	.insn	2, 0x3204
80101c06:	8000                	.insn	2, 0x8000
80101c08:	254c                	.insn	2, 0x254c
80101c0a:	8000                	.insn	2, 0x8000
80101c0c:	254c                	.insn	2, 0x254c
80101c0e:	8000                	.insn	2, 0x8000
80101c10:	321c                	.insn	2, 0x321c
80101c12:	8000                	.insn	2, 0x8000
80101c14:	254c                	.insn	2, 0x254c
80101c16:	8000                	.insn	2, 0x8000
80101c18:	2680                	.insn	2, 0x2680
80101c1a:	8000                	.insn	2, 0x8000

80101c1c <zeroes.0>:
80101c1c:	3030                	.insn	2, 0x3030
80101c1e:	3030                	.insn	2, 0x3030
80101c20:	3030                	.insn	2, 0x3030
80101c22:	3030                	.insn	2, 0x3030
80101c24:	3030                	.insn	2, 0x3030
80101c26:	3030                	.insn	2, 0x3030
80101c28:	3030                	.insn	2, 0x3030
80101c2a:	3030                	.insn	2, 0x3030

80101c2c <blanks.1>:
80101c2c:	2020                	.insn	2, 0x2020
80101c2e:	2020                	.insn	2, 0x2020
80101c30:	2020                	.insn	2, 0x2020
80101c32:	2020                	.insn	2, 0x2020
80101c34:	2020                	.insn	2, 0x2020
80101c36:	2020                	.insn	2, 0x2020
80101c38:	2020                	.insn	2, 0x2020
80101c3a:	2020                	.insn	2, 0x2020

80101c3c <_ctype_>:
80101c3c:	2000                	.insn	2, 0x2000
80101c3e:	2020                	.insn	2, 0x2020
80101c40:	2020                	.insn	2, 0x2020
80101c42:	2020                	.insn	2, 0x2020
80101c44:	2020                	.insn	2, 0x2020
80101c46:	2828                	.insn	2, 0x2828
80101c48:	2828                	.insn	2, 0x2828
80101c4a:	2028                	.insn	2, 0x2028
80101c4c:	2020                	.insn	2, 0x2020
80101c4e:	2020                	.insn	2, 0x2020
80101c50:	2020                	.insn	2, 0x2020
80101c52:	2020                	.insn	2, 0x2020
80101c54:	2020                	.insn	2, 0x2020
80101c56:	2020                	.insn	2, 0x2020
80101c58:	2020                	.insn	2, 0x2020
80101c5a:	2020                	.insn	2, 0x2020
80101c5c:	8820                	.insn	2, 0x8820
80101c5e:	1010                	.insn	2, 0x1010
80101c60:	1010                	.insn	2, 0x1010
80101c62:	1010                	.insn	2, 0x1010
80101c64:	1010                	.insn	2, 0x1010
80101c66:	1010                	.insn	2, 0x1010
80101c68:	1010                	.insn	2, 0x1010
80101c6a:	1010                	.insn	2, 0x1010
80101c6c:	0410                	.insn	2, 0x0410
80101c6e:	0404                	.insn	2, 0x0404
80101c70:	0404                	.insn	2, 0x0404
80101c72:	0404                	.insn	2, 0x0404
80101c74:	0404                	.insn	2, 0x0404
80101c76:	1004                	.insn	2, 0x1004
80101c78:	1010                	.insn	2, 0x1010
80101c7a:	1010                	.insn	2, 0x1010
80101c7c:	1010                	.insn	2, 0x1010
80101c7e:	4141                	.insn	2, 0x4141
80101c80:	4141                	.insn	2, 0x4141
80101c82:	4141                	.insn	2, 0x4141
80101c84:	0101                	.insn	2, 0x0101
80101c86:	0101                	.insn	2, 0x0101
80101c88:	0101                	.insn	2, 0x0101
80101c8a:	0101                	.insn	2, 0x0101
80101c8c:	0101                	.insn	2, 0x0101
80101c8e:	0101                	.insn	2, 0x0101
80101c90:	0101                	.insn	2, 0x0101
80101c92:	0101                	.insn	2, 0x0101
80101c94:	0101                	.insn	2, 0x0101
80101c96:	0101                	.insn	2, 0x0101
80101c98:	1010                	.insn	2, 0x1010
80101c9a:	1010                	.insn	2, 0x1010
80101c9c:	1010                	.insn	2, 0x1010
80101c9e:	4242                	.insn	2, 0x4242
80101ca0:	4242                	.insn	2, 0x4242
80101ca2:	4242                	.insn	2, 0x4242
80101ca4:	0202                	.insn	2, 0x0202
80101ca6:	0202                	.insn	2, 0x0202
80101ca8:	0202                	.insn	2, 0x0202
80101caa:	0202                	.insn	2, 0x0202
80101cac:	0202                	.insn	2, 0x0202
80101cae:	0202                	.insn	2, 0x0202
80101cb0:	0202                	.insn	2, 0x0202
80101cb2:	0202                	.insn	2, 0x0202
80101cb4:	0202                	.insn	2, 0x0202
80101cb6:	0202                	.insn	2, 0x0202
80101cb8:	1010                	.insn	2, 0x1010
80101cba:	1010                	.insn	2, 0x1010
80101cbc:	0020                	.insn	2, 0x0020
	...

80101d40 <__clz_tab>:
80101d40:	0100                	.insn	2, 0x0100
80101d42:	0202                	.insn	2, 0x0202
80101d44:	03030303          	lb	x6,48(x6)
80101d48:	0404                	.insn	2, 0x0404
80101d4a:	0404                	.insn	2, 0x0404
80101d4c:	0404                	.insn	2, 0x0404
80101d4e:	0404                	.insn	2, 0x0404
80101d50:	0505                	.insn	2, 0x0505
80101d52:	0505                	.insn	2, 0x0505
80101d54:	0505                	.insn	2, 0x0505
80101d56:	0505                	.insn	2, 0x0505
80101d58:	0505                	.insn	2, 0x0505
80101d5a:	0505                	.insn	2, 0x0505
80101d5c:	0505                	.insn	2, 0x0505
80101d5e:	0505                	.insn	2, 0x0505
80101d60:	0606                	.insn	2, 0x0606
80101d62:	0606                	.insn	2, 0x0606
80101d64:	0606                	.insn	2, 0x0606
80101d66:	0606                	.insn	2, 0x0606
80101d68:	0606                	.insn	2, 0x0606
80101d6a:	0606                	.insn	2, 0x0606
80101d6c:	0606                	.insn	2, 0x0606
80101d6e:	0606                	.insn	2, 0x0606
80101d70:	0606                	.insn	2, 0x0606
80101d72:	0606                	.insn	2, 0x0606
80101d74:	0606                	.insn	2, 0x0606
80101d76:	0606                	.insn	2, 0x0606
80101d78:	0606                	.insn	2, 0x0606
80101d7a:	0606                	.insn	2, 0x0606
80101d7c:	0606                	.insn	2, 0x0606
80101d7e:	0606                	.insn	2, 0x0606
80101d80:	07070707          	.insn	4, 0x07070707
80101d84:	07070707          	.insn	4, 0x07070707
80101d88:	07070707          	.insn	4, 0x07070707
80101d8c:	07070707          	.insn	4, 0x07070707
80101d90:	07070707          	.insn	4, 0x07070707
80101d94:	07070707          	.insn	4, 0x07070707
80101d98:	07070707          	.insn	4, 0x07070707
80101d9c:	07070707          	.insn	4, 0x07070707
80101da0:	07070707          	.insn	4, 0x07070707
80101da4:	07070707          	.insn	4, 0x07070707
80101da8:	07070707          	.insn	4, 0x07070707
80101dac:	07070707          	.insn	4, 0x07070707
80101db0:	07070707          	.insn	4, 0x07070707
80101db4:	07070707          	.insn	4, 0x07070707
80101db8:	07070707          	.insn	4, 0x07070707
80101dbc:	07070707          	.insn	4, 0x07070707
80101dc0:	0808                	.insn	2, 0x0808
80101dc2:	0808                	.insn	2, 0x0808
80101dc4:	0808                	.insn	2, 0x0808
80101dc6:	0808                	.insn	2, 0x0808
80101dc8:	0808                	.insn	2, 0x0808
80101dca:	0808                	.insn	2, 0x0808
80101dcc:	0808                	.insn	2, 0x0808
80101dce:	0808                	.insn	2, 0x0808
80101dd0:	0808                	.insn	2, 0x0808
80101dd2:	0808                	.insn	2, 0x0808
80101dd4:	0808                	.insn	2, 0x0808
80101dd6:	0808                	.insn	2, 0x0808
80101dd8:	0808                	.insn	2, 0x0808
80101dda:	0808                	.insn	2, 0x0808
80101ddc:	0808                	.insn	2, 0x0808
80101dde:	0808                	.insn	2, 0x0808
80101de0:	0808                	.insn	2, 0x0808
80101de2:	0808                	.insn	2, 0x0808
80101de4:	0808                	.insn	2, 0x0808
80101de6:	0808                	.insn	2, 0x0808
80101de8:	0808                	.insn	2, 0x0808
80101dea:	0808                	.insn	2, 0x0808
80101dec:	0808                	.insn	2, 0x0808
80101dee:	0808                	.insn	2, 0x0808
80101df0:	0808                	.insn	2, 0x0808
80101df2:	0808                	.insn	2, 0x0808
80101df4:	0808                	.insn	2, 0x0808
80101df6:	0808                	.insn	2, 0x0808
80101df8:	0808                	.insn	2, 0x0808
80101dfa:	0808                	.insn	2, 0x0808
80101dfc:	0808                	.insn	2, 0x0808
80101dfe:	0808                	.insn	2, 0x0808
80101e00:	0808                	.insn	2, 0x0808
80101e02:	0808                	.insn	2, 0x0808
80101e04:	0808                	.insn	2, 0x0808
80101e06:	0808                	.insn	2, 0x0808
80101e08:	0808                	.insn	2, 0x0808
80101e0a:	0808                	.insn	2, 0x0808
80101e0c:	0808                	.insn	2, 0x0808
80101e0e:	0808                	.insn	2, 0x0808
80101e10:	0808                	.insn	2, 0x0808
80101e12:	0808                	.insn	2, 0x0808
80101e14:	0808                	.insn	2, 0x0808
80101e16:	0808                	.insn	2, 0x0808
80101e18:	0808                	.insn	2, 0x0808
80101e1a:	0808                	.insn	2, 0x0808
80101e1c:	0808                	.insn	2, 0x0808
80101e1e:	0808                	.insn	2, 0x0808
80101e20:	0808                	.insn	2, 0x0808
80101e22:	0808                	.insn	2, 0x0808
80101e24:	0808                	.insn	2, 0x0808
80101e26:	0808                	.insn	2, 0x0808
80101e28:	0808                	.insn	2, 0x0808
80101e2a:	0808                	.insn	2, 0x0808
80101e2c:	0808                	.insn	2, 0x0808
80101e2e:	0808                	.insn	2, 0x0808
80101e30:	0808                	.insn	2, 0x0808
80101e32:	0808                	.insn	2, 0x0808
80101e34:	0808                	.insn	2, 0x0808
80101e36:	0808                	.insn	2, 0x0808
80101e38:	0808                	.insn	2, 0x0808
80101e3a:	0808                	.insn	2, 0x0808
80101e3c:	0808                	.insn	2, 0x0808
80101e3e:	0808                	.insn	2, 0x0808

80101e40 <array2>:
	...

80101fd0 <htab>:
	...

80102020 <heap>:
	...

80104020 <__sf>:
	...

80104158 <__malloc_current_mallinfo>:
	...

80104180 <the_list>:
80104180:	0000                	.insn	2, 0x
	...

80104184 <heap_requested>:
80104184:	0000                	.insn	2, 0x
	...

80104188 <heap_end>:
80104188:	0000                	.insn	2, 0x
	...

8010418c <heap_ptr>:
8010418c:	0000                	.insn	2, 0x
	...

80104190 <seed>:
80104190:	0000                	.insn	2, 0x
	...

80104194 <__stdio_exit_handler>:
80104194:	0000                	.insn	2, 0x
	...

80104198 <errno>:
80104198:	0000                	.insn	2, 0x
	...

8010419c <__malloc_max_total_mem>:
8010419c:	0000                	.insn	2, 0x
	...

801041a0 <__malloc_max_sbrked_mem>:
801041a0:	0000                	.insn	2, 0x
	...

801041a4 <__malloc_top_pad>:
801041a4:	0000                	.insn	2, 0x
	...

801041a8 <heap_end.0>:
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
      3c:	f802                	.insn	2, 0xf802
      3e:	0021                	.insn	2, 0x0021
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
      b6:	1c02                	.insn	2, 0x1c02
      b8:	0022                	.insn	2, 0x0022
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
     1cc:	5101                	.insn	2, 0x5101
     1ce:	0009                	.insn	2, 0x0009
     1d0:	0500                	.insn	2, 0x0500
     1d2:	0400                	.insn	2, 0x0400
     1d4:	3300                	.insn	2, 0x3300
     1d6:	0000                	.insn	2, 0x
     1d8:	0100                	.insn	2, 0x0100
     1da:	0101                	.insn	2, 0x0101
     1dc:	000d0efb          	.insn	4, 0x000d0efb
     1e0:	0101                	.insn	2, 0x0101
     1e2:	0101                	.insn	2, 0x0101
     1e4:	0000                	.insn	2, 0x
     1e6:	0100                	.insn	2, 0x0100
     1e8:	0000                	.insn	2, 0x
     1ea:	0101                	.insn	2, 0x0101
     1ec:	1f01                	.insn	2, 0x1f01
     1ee:	0002                	.insn	2, 0x0002
     1f0:	0000                	.insn	2, 0x
     1f2:	c400                	.insn	2, 0xc400
     1f4:	0000                	.insn	2, 0x
     1f6:	0200                	.insn	2, 0x0200
     1f8:	1f01                	.insn	2, 0x1f01
     1fa:	0f02                	.insn	2, 0x0f02
     1fc:	0000ba03          	.insn	4, 0xba03
     200:	0100                	.insn	2, 0x0100
     202:	00ba                	.insn	2, 0x00ba
     204:	0000                	.insn	2, 0x
     206:	e001                	.insn	2, 0xe001
     208:	0000                	.insn	2, 0x
     20a:	0100                	.insn	2, 0x0100
     20c:	0105                	.insn	2, 0x0105
     20e:	0500                	.insn	2, 0x0500
     210:	1c02                	.insn	2, 0x1c02
     212:	0065                	.insn	2, 0x0065
     214:	0380                	.insn	2, 0x0380
     216:	0a92                	.insn	2, 0x0a92
     218:	0501                	.insn	2, 0x0501
     21a:	09010303          	lb	x6,144(x2)
     21e:	0000                	.insn	2, 0x
     220:	0301                	.insn	2, 0x0301
     222:	7dd1                	.insn	2, 0x7dd1
     224:	0009                	.insn	2, 0x0009
     226:	0100                	.insn	2, 0x0100
     228:	00090103          	lb	x2,0(x18)
     22c:	0100                	.insn	2, 0x0100
     22e:	00090103          	lb	x2,0(x18)
     232:	0100                	.insn	2, 0x0100
     234:	00090103          	lb	x2,0(x18)
     238:	0100                	.insn	2, 0x0100
     23a:	00090103          	lb	x2,0(x18)
     23e:	0100                	.insn	2, 0x0100
     240:	00090103          	lb	x2,0(x18)
     244:	0100                	.insn	2, 0x0100
     246:	00090203          	lb	x4,0(x18)
     24a:	0100                	.insn	2, 0x0100
     24c:	00090103          	lb	x2,0(x18)
     250:	0100                	.insn	2, 0x0100
     252:	00090103          	lb	x2,0(x18)
     256:	0100                	.insn	2, 0x0100
     258:	00090103          	lb	x2,0(x18)
     25c:	0100                	.insn	2, 0x0100
     25e:	00092503          	lw	x10,0(x18)
     262:	0100                	.insn	2, 0x0100
     264:	0105                	.insn	2, 0x0105
     266:	0306                	.insn	2, 0x0306
     268:	01ff 0009 0100 0003 	.insn	10, 0x300900030100000901ff
     270:	3009 
     272:	0100                	.insn	2, 0x0100
     274:	0605                	.insn	2, 0x0605
     276:	097e8103          	lb	x2,151(x29)
     27a:	0004                	.insn	2, 0x0004
     27c:	0501                	.insn	2, 0x0501
     27e:	02030607          	.insn	4, 0x02030607
     282:	1009                	.insn	2, 0x1009
     284:	0100                	.insn	2, 0x0100
     286:	0a05                	.insn	2, 0x0a05
     288:	0306                	.insn	2, 0x0306
     28a:	0900                	.insn	2, 0x0900
     28c:	0004                	.insn	2, 0x0004
     28e:	0501                	.insn	2, 0x0501
     290:	0004                	.insn	2, 0x0004
     292:	0402                	.insn	2, 0x0402
     294:	0301                	.insn	2, 0x0301
     296:	0904                	.insn	2, 0x0904
     298:	0004                	.insn	2, 0x0004
     29a:	0601                	.insn	2, 0x0601
     29c:	08090003          	lb	x0,128(x18)
     2a0:	0100                	.insn	2, 0x0100
     2a2:	00090003          	lb	x0,0(x18)
     2a6:	0100                	.insn	2, 0x0100
     2a8:	00090003          	lb	x0,0(x18)
     2ac:	0100                	.insn	2, 0x0100
     2ae:	00090003          	lb	x0,0(x18)
     2b2:	0100                	.insn	2, 0x0100
     2b4:	0200                	.insn	2, 0x0200
     2b6:	0104                	.insn	2, 0x0104
     2b8:	00090003          	lb	x0,0(x18)
     2bc:	0100                	.insn	2, 0x0100
     2be:	0200                	.insn	2, 0x0200
     2c0:	0304                	.insn	2, 0x0304
     2c2:	0306                	.insn	2, 0x0306
     2c4:	0900                	.insn	2, 0x0900
     2c6:	0004                	.insn	2, 0x0004
     2c8:	0001                	.insn	2, 0x0001
     2ca:	0402                	.insn	2, 0x0402
     2cc:	0615                	.insn	2, 0x0615
     2ce:	0c090003          	lb	x0,192(x18)
     2d2:	0100                	.insn	2, 0x0100
     2d4:	0200                	.insn	2, 0x0200
     2d6:	1504                	.insn	2, 0x1504
     2d8:	18090003          	lb	x0,384(x18)
     2dc:	0100                	.insn	2, 0x0100
     2de:	00090203          	lb	x4,0(x18)
     2e2:	0100                	.insn	2, 0x0100
     2e4:	0705                	.insn	2, 0x0705
     2e6:	0306                	.insn	2, 0x0306
     2e8:	0900                	.insn	2, 0x0900
     2ea:	0000                	.insn	2, 0x
     2ec:	0501                	.insn	2, 0x0501
     2ee:	0608                	.insn	2, 0x0608
     2f0:	04090503          	lb	x10,64(x18)
     2f4:	0100                	.insn	2, 0x0100
     2f6:	1105                	.insn	2, 0x1105
     2f8:	0306                	.insn	2, 0x0306
     2fa:	0901                	.insn	2, 0x0901
     2fc:	0000                	.insn	2, 0x
     2fe:	0501                	.insn	2, 0x0501
     300:	031e                	.insn	2, 0x031e
     302:	0900                	.insn	2, 0x0900
     304:	0004                	.insn	2, 0x0004
     306:	0501                	.insn	2, 0x0501
     308:	097f030b          	.insn	4, 0x097f030b
     30c:	0004                	.insn	2, 0x0004
     30e:	0501                	.insn	2, 0x0501
     310:	0608                	.insn	2, 0x0608
     312:	04090103          	lb	x2,64(x18)
     316:	0100                	.insn	2, 0x0100
     318:	0b05                	.insn	2, 0x0b05
     31a:	0306                	.insn	2, 0x0306
     31c:	0900                	.insn	2, 0x0900
     31e:	0000                	.insn	2, 0x
     320:	0501                	.insn	2, 0x0501
     322:	0608                	.insn	2, 0x0608
     324:	04090103          	lb	x2,64(x18)
     328:	0100                	.insn	2, 0x0100
     32a:	0b05                	.insn	2, 0x0b05
     32c:	0306                	.insn	2, 0x0306
     32e:	0900                	.insn	2, 0x0900
     330:	0000                	.insn	2, 0x
     332:	0501                	.insn	2, 0x0501
     334:	0604                	.insn	2, 0x0604
     336:	04090303          	lb	x6,64(x18)
     33a:	0100                	.insn	2, 0x0100
     33c:	00090003          	lb	x0,0(x18)
     340:	0100                	.insn	2, 0x0100
     342:	00090003          	lb	x0,0(x18)
     346:	0100                	.insn	2, 0x0100
     348:	00090003          	lb	x0,0(x18)
     34c:	0100                	.insn	2, 0x0100
     34e:	04090003          	lb	x0,64(x18)
     352:	0100                	.insn	2, 0x0100
     354:	14090003          	lb	x0,320(x18)
     358:	0100                	.insn	2, 0x0100
     35a:	00090003          	lb	x0,0(x18)
     35e:	0100                	.insn	2, 0x0100
     360:	08090003          	lb	x0,128(x18)
     364:	0100                	.insn	2, 0x0100
     366:	0c090003          	lb	x0,192(x18)
     36a:	0100                	.insn	2, 0x0100
     36c:	18090003          	lb	x0,384(x18)
     370:	0100                	.insn	2, 0x0100
     372:	0200                	.insn	2, 0x0200
     374:	0104                	.insn	2, 0x0104
     376:	08090003          	lb	x0,128(x18)
     37a:	0100                	.insn	2, 0x0100
     37c:	0200                	.insn	2, 0x0200
     37e:	0104                	.insn	2, 0x0104
     380:	08090003          	lb	x0,128(x18)
     384:	0100                	.insn	2, 0x0100
     386:	0200                	.insn	2, 0x0200
     388:	0304                	.insn	2, 0x0304
     38a:	04090003          	lb	x0,64(x18)
     38e:	0100                	.insn	2, 0x0100
     390:	0200                	.insn	2, 0x0200
     392:	0504                	.insn	2, 0x0504
     394:	04090003          	lb	x0,64(x18)
     398:	0100                	.insn	2, 0x0100
     39a:	0200                	.insn	2, 0x0200
     39c:	0704                	.insn	2, 0x0704
     39e:	08090003          	lb	x0,128(x18)
     3a2:	0100                	.insn	2, 0x0100
     3a4:	0200                	.insn	2, 0x0200
     3a6:	0704                	.insn	2, 0x0704
     3a8:	04090003          	lb	x0,64(x18)
     3ac:	0100                	.insn	2, 0x0100
     3ae:	0200                	.insn	2, 0x0200
     3b0:	0704                	.insn	2, 0x0704
     3b2:	00090003          	lb	x0,0(x18)
     3b6:	0100                	.insn	2, 0x0100
     3b8:	0200                	.insn	2, 0x0200
     3ba:	0704                	.insn	2, 0x0704
     3bc:	14090003          	lb	x0,320(x18)
     3c0:	0100                	.insn	2, 0x0100
     3c2:	0200                	.insn	2, 0x0200
     3c4:	0704                	.insn	2, 0x0704
     3c6:	0c090003          	lb	x0,192(x18)
     3ca:	0100                	.insn	2, 0x0100
     3cc:	0200                	.insn	2, 0x0200
     3ce:	0704                	.insn	2, 0x0704
     3d0:	1c090003          	lb	x0,448(x18)
     3d4:	0100                	.insn	2, 0x0100
     3d6:	0200                	.insn	2, 0x0200
     3d8:	0804                	.insn	2, 0x0804
     3da:	08090003          	lb	x0,128(x18)
     3de:	0100                	.insn	2, 0x0100
     3e0:	0200                	.insn	2, 0x0200
     3e2:	0a04                	.insn	2, 0x0a04
     3e4:	0c090003          	lb	x0,192(x18)
     3e8:	0100                	.insn	2, 0x0100
     3ea:	0200                	.insn	2, 0x0200
     3ec:	0c04                	.insn	2, 0x0c04
     3ee:	04090003          	lb	x0,64(x18)
     3f2:	0100                	.insn	2, 0x0100
     3f4:	0200                	.insn	2, 0x0200
     3f6:	0e04                	.insn	2, 0x0e04
     3f8:	04090003          	lb	x0,64(x18)
     3fc:	0100                	.insn	2, 0x0100
     3fe:	0200                	.insn	2, 0x0200
     400:	0e04                	.insn	2, 0x0e04
     402:	00090003          	lb	x0,0(x18)
     406:	0100                	.insn	2, 0x0100
     408:	0200                	.insn	2, 0x0200
     40a:	0e04                	.insn	2, 0x0e04
     40c:	08090003          	lb	x0,128(x18)
     410:	0100                	.insn	2, 0x0100
     412:	0200                	.insn	2, 0x0200
     414:	0e04                	.insn	2, 0x0e04
     416:	00090003          	lb	x0,0(x18)
     41a:	0100                	.insn	2, 0x0100
     41c:	00090103          	lb	x2,0(x18)
     420:	0100                	.insn	2, 0x0100
     422:	0b05                	.insn	2, 0x0b05
     424:	0306                	.insn	2, 0x0306
     426:	00fe                	.insn	2, 0x00fe
     428:	0009                	.insn	2, 0x0009
     42a:	0100                	.insn	2, 0x0100
     42c:	0405                	.insn	2, 0x0405
     42e:	0200                	.insn	2, 0x0200
     430:	0404                	.insn	2, 0x0404
     432:	097ef503          	.insn	4, 0x097ef503
     436:	0008                	.insn	2, 0x0008
     438:	0001                	.insn	2, 0x0001
     43a:	0402                	.insn	2, 0x0402
     43c:	0900030b          	.insn	4, 0x0900030b
     440:	0004                	.insn	2, 0x0004
     442:	0001                	.insn	2, 0x0001
     444:	0402                	.insn	2, 0x0402
     446:	0304                	.insn	2, 0x0304
     448:	0900                	.insn	2, 0x0900
     44a:	0004                	.insn	2, 0x0004
     44c:	0001                	.insn	2, 0x0001
     44e:	0402                	.insn	2, 0x0402
     450:	030a                	.insn	2, 0x030a
     452:	0900                	.insn	2, 0x0900
     454:	0004                	.insn	2, 0x0004
     456:	0601                	.insn	2, 0x0601
     458:	08091503          	lh	x10,128(x18)
     45c:	0100                	.insn	2, 0x0100
     45e:	0200                	.insn	2, 0x0200
     460:	0504                	.insn	2, 0x0504
     462:	0306                	.insn	2, 0x0306
     464:	00000903          	lb	x18,0(x0) # 0 <_heap_size>
     468:	0501                	.insn	2, 0x0501
     46a:	097d0307          	.insn	4, 0x097d0307
     46e:	0004                	.insn	2, 0x0004
     470:	0501                	.insn	2, 0x0501
     472:	0604                	.insn	2, 0x0604
     474:	04090303          	lb	x6,64(x18)
     478:	0100                	.insn	2, 0x0100
     47a:	00090003          	lb	x0,0(x18)
     47e:	0100                	.insn	2, 0x0100
     480:	00090003          	lb	x0,0(x18)
     484:	0100                	.insn	2, 0x0100
     486:	00090003          	lb	x0,0(x18)
     48a:	0100                	.insn	2, 0x0100
     48c:	0200                	.insn	2, 0x0200
     48e:	0104                	.insn	2, 0x0104
     490:	00090003          	lb	x0,0(x18)
     494:	0100                	.insn	2, 0x0100
     496:	0200                	.insn	2, 0x0200
     498:	0304                	.insn	2, 0x0304
     49a:	0306                	.insn	2, 0x0306
     49c:	0900                	.insn	2, 0x0900
     49e:	0008                	.insn	2, 0x0008
     4a0:	0001                	.insn	2, 0x0001
     4a2:	0402                	.insn	2, 0x0402
     4a4:	0615                	.insn	2, 0x0615
     4a6:	0c090003          	lb	x0,192(x18)
     4aa:	0100                	.insn	2, 0x0100
     4ac:	0200                	.insn	2, 0x0200
     4ae:	1504                	.insn	2, 0x1504
     4b0:	18090003          	lb	x0,384(x18)
     4b4:	0100                	.insn	2, 0x0100
     4b6:	00090203          	lb	x4,0(x18)
     4ba:	0100                	.insn	2, 0x0100
     4bc:	0705                	.insn	2, 0x0705
     4be:	0306                	.insn	2, 0x0306
     4c0:	0900                	.insn	2, 0x0900
     4c2:	0000                	.insn	2, 0x
     4c4:	0501                	.insn	2, 0x0501
     4c6:	0608                	.insn	2, 0x0608
     4c8:	04090903          	lb	x18,64(x18)
     4cc:	0100                	.insn	2, 0x0100
     4ce:	0b05                	.insn	2, 0x0b05
     4d0:	0306                	.insn	2, 0x0306
     4d2:	0900                	.insn	2, 0x0900
     4d4:	0000                	.insn	2, 0x
     4d6:	0501                	.insn	2, 0x0501
     4d8:	0608                	.insn	2, 0x0608
     4da:	04090103          	lb	x2,64(x18)
     4de:	0100                	.insn	2, 0x0100
     4e0:	0b05                	.insn	2, 0x0b05
     4e2:	0306                	.insn	2, 0x0306
     4e4:	0900                	.insn	2, 0x0900
     4e6:	0000                	.insn	2, 0x
     4e8:	0501                	.insn	2, 0x0501
     4ea:	0008                	.insn	2, 0x0008
     4ec:	0402                	.insn	2, 0x0402
     4ee:	0d03060f          	.insn	4, 0x0d03060f
     4f2:	0409                	.insn	2, 0x0409
     4f4:	0100                	.insn	2, 0x0100
     4f6:	0405                	.insn	2, 0x0405
     4f8:	00090503          	lb	x10,0(x18)
     4fc:	0100                	.insn	2, 0x0100
     4fe:	00090003          	lb	x0,0(x18)
     502:	0100                	.insn	2, 0x0100
     504:	00090003          	lb	x0,0(x18)
     508:	0100                	.insn	2, 0x0100
     50a:	00090003          	lb	x0,0(x18)
     50e:	0100                	.insn	2, 0x0100
     510:	04090003          	lb	x0,64(x18)
     514:	0100                	.insn	2, 0x0100
     516:	14090003          	lb	x0,320(x18)
     51a:	0100                	.insn	2, 0x0100
     51c:	00090003          	lb	x0,0(x18)
     520:	0100                	.insn	2, 0x0100
     522:	08090003          	lb	x0,128(x18)
     526:	0100                	.insn	2, 0x0100
     528:	0c090003          	lb	x0,192(x18)
     52c:	0100                	.insn	2, 0x0100
     52e:	18090003          	lb	x0,384(x18)
     532:	0100                	.insn	2, 0x0100
     534:	0200                	.insn	2, 0x0200
     536:	0104                	.insn	2, 0x0104
     538:	08090003          	lb	x0,128(x18)
     53c:	0100                	.insn	2, 0x0100
     53e:	0200                	.insn	2, 0x0200
     540:	0104                	.insn	2, 0x0104
     542:	08090003          	lb	x0,128(x18)
     546:	0100                	.insn	2, 0x0100
     548:	0200                	.insn	2, 0x0200
     54a:	0304                	.insn	2, 0x0304
     54c:	04090003          	lb	x0,64(x18)
     550:	0100                	.insn	2, 0x0100
     552:	0200                	.insn	2, 0x0200
     554:	0504                	.insn	2, 0x0504
     556:	04090003          	lb	x0,64(x18)
     55a:	0100                	.insn	2, 0x0100
     55c:	0200                	.insn	2, 0x0200
     55e:	0704                	.insn	2, 0x0704
     560:	08090003          	lb	x0,128(x18)
     564:	0100                	.insn	2, 0x0100
     566:	0200                	.insn	2, 0x0200
     568:	0704                	.insn	2, 0x0704
     56a:	04090003          	lb	x0,64(x18)
     56e:	0100                	.insn	2, 0x0100
     570:	0200                	.insn	2, 0x0200
     572:	0704                	.insn	2, 0x0704
     574:	00090003          	lb	x0,0(x18)
     578:	0100                	.insn	2, 0x0100
     57a:	0200                	.insn	2, 0x0200
     57c:	0704                	.insn	2, 0x0704
     57e:	14090003          	lb	x0,320(x18)
     582:	0100                	.insn	2, 0x0100
     584:	0200                	.insn	2, 0x0200
     586:	0704                	.insn	2, 0x0704
     588:	0c090003          	lb	x0,192(x18)
     58c:	0100                	.insn	2, 0x0100
     58e:	0200                	.insn	2, 0x0200
     590:	0704                	.insn	2, 0x0704
     592:	1c090003          	lb	x0,448(x18)
     596:	0100                	.insn	2, 0x0100
     598:	0200                	.insn	2, 0x0200
     59a:	0804                	.insn	2, 0x0804
     59c:	08090003          	lb	x0,128(x18)
     5a0:	0100                	.insn	2, 0x0100
     5a2:	0200                	.insn	2, 0x0200
     5a4:	0a04                	.insn	2, 0x0a04
     5a6:	0c090003          	lb	x0,192(x18)
     5aa:	0100                	.insn	2, 0x0100
     5ac:	0200                	.insn	2, 0x0200
     5ae:	0c04                	.insn	2, 0x0c04
     5b0:	04090003          	lb	x0,64(x18)
     5b4:	0100                	.insn	2, 0x0100
     5b6:	0200                	.insn	2, 0x0200
     5b8:	0e04                	.insn	2, 0x0e04
     5ba:	04090003          	lb	x0,64(x18)
     5be:	0100                	.insn	2, 0x0100
     5c0:	0200                	.insn	2, 0x0200
     5c2:	0e04                	.insn	2, 0x0e04
     5c4:	00090003          	lb	x0,0(x18)
     5c8:	0100                	.insn	2, 0x0100
     5ca:	0200                	.insn	2, 0x0200
     5cc:	0e04                	.insn	2, 0x0e04
     5ce:	08090003          	lb	x0,128(x18)
     5d2:	0100                	.insn	2, 0x0100
     5d4:	0305                	.insn	2, 0x0305
     5d6:	0900e303          	.insn	4, 0x0900e303
     5da:	0000                	.insn	2, 0x
     5dc:	0301                	.insn	2, 0x0301
     5de:	0901                	.insn	2, 0x0901
     5e0:	0000                	.insn	2, 0x
     5e2:	0501                	.insn	2, 0x0501
     5e4:	0601                	.insn	2, 0x0601
     5e6:	0900e103          	.insn	4, 0x0900e103
     5ea:	0000                	.insn	2, 0x
     5ec:	0501                	.insn	2, 0x0501
     5ee:	0004                	.insn	2, 0x0004
     5f0:	0402                	.insn	2, 0x0402
     5f2:	0304                	.insn	2, 0x0304
     5f4:	7e9d                	.insn	2, 0x7e9d
     5f6:	3c09                	.insn	2, 0x3c09
     5f8:	0100                	.insn	2, 0x0100
     5fa:	0200                	.insn	2, 0x0200
     5fc:	0b04                	.insn	2, 0x0b04
     5fe:	04090003          	lb	x0,64(x18)
     602:	0100                	.insn	2, 0x0100
     604:	0200                	.insn	2, 0x0200
     606:	0404                	.insn	2, 0x0404
     608:	04090003          	lb	x0,64(x18)
     60c:	0100                	.insn	2, 0x0100
     60e:	0200                	.insn	2, 0x0200
     610:	0a04                	.insn	2, 0x0a04
     612:	04090003          	lb	x0,64(x18)
     616:	0100                	.insn	2, 0x0100
     618:	0805                	.insn	2, 0x0805
     61a:	0306                	.insn	2, 0x0306
     61c:	0912                	.insn	2, 0x0912
     61e:	0008                	.insn	2, 0x0008
     620:	0301                	.insn	2, 0x0301
     622:	0902                	.insn	2, 0x0902
     624:	0000                	.insn	2, 0x
     626:	0501                	.insn	2, 0x0501
     628:	0003060b          	.insn	4, 0x0003060b
     62c:	0009                	.insn	2, 0x0009
     62e:	0100                	.insn	2, 0x0100
     630:	0805                	.insn	2, 0x0805
     632:	0306                	.insn	2, 0x0306
     634:	0901                	.insn	2, 0x0901
     636:	0004                	.insn	2, 0x0004
     638:	0501                	.insn	2, 0x0501
     63a:	0003060b          	.insn	4, 0x0003060b
     63e:	0009                	.insn	2, 0x0009
     640:	0100                	.insn	2, 0x0100
     642:	0805                	.insn	2, 0x0805
     644:	0306                	.insn	2, 0x0306
     646:	0901                	.insn	2, 0x0901
     648:	0004                	.insn	2, 0x0004
     64a:	0601                	.insn	2, 0x0601
     64c:	00090303          	lb	x6,0(x18)
     650:	0100                	.insn	2, 0x0100
     652:	1105                	.insn	2, 0x1105
     654:	04097d03          	.insn	4, 0x04097d03
     658:	0100                	.insn	2, 0x0100
     65a:	1e05                	.insn	2, 0x1e05
     65c:	04090003          	lb	x0,64(x18)
     660:	0100                	.insn	2, 0x0100
     662:	0b05                	.insn	2, 0x0b05
     664:	04090003          	lb	x0,64(x18)
     668:	0100                	.insn	2, 0x0100
     66a:	0805                	.insn	2, 0x0805
     66c:	0306                	.insn	2, 0x0306
     66e:	0901                	.insn	2, 0x0901
     670:	0004                	.insn	2, 0x0004
     672:	0501                	.insn	2, 0x0501
     674:	0003060b          	.insn	4, 0x0003060b
     678:	0009                	.insn	2, 0x0009
     67a:	0100                	.insn	2, 0x0100
     67c:	0805                	.insn	2, 0x0805
     67e:	0306                	.insn	2, 0x0306
     680:	0902                	.insn	2, 0x0902
     682:	0004                	.insn	2, 0x0004
     684:	0301                	.insn	2, 0x0301
     686:	0900                	.insn	2, 0x0900
     688:	0000                	.insn	2, 0x
     68a:	0301                	.insn	2, 0x0301
     68c:	0900                	.insn	2, 0x0900
     68e:	0000                	.insn	2, 0x
     690:	0301                	.insn	2, 0x0301
     692:	0900                	.insn	2, 0x0900
     694:	0000                	.insn	2, 0x
     696:	0301                	.insn	2, 0x0301
     698:	0900                	.insn	2, 0x0900
     69a:	0000                	.insn	2, 0x
     69c:	0301                	.insn	2, 0x0301
     69e:	0900                	.insn	2, 0x0900
     6a0:	0014                	.insn	2, 0x0014
     6a2:	0301                	.insn	2, 0x0301
     6a4:	0900                	.insn	2, 0x0900
     6a6:	0000                	.insn	2, 0x
     6a8:	0301                	.insn	2, 0x0301
     6aa:	0900                	.insn	2, 0x0900
     6ac:	0008                	.insn	2, 0x0008
     6ae:	0301                	.insn	2, 0x0301
     6b0:	0900                	.insn	2, 0x0900
     6b2:	000c                	.insn	2, 0x000c
     6b4:	0301                	.insn	2, 0x0301
     6b6:	0900                	.insn	2, 0x0900
     6b8:	0018                	.insn	2, 0x0018
     6ba:	0001                	.insn	2, 0x0001
     6bc:	0402                	.insn	2, 0x0402
     6be:	0301                	.insn	2, 0x0301
     6c0:	0900                	.insn	2, 0x0900
     6c2:	0008                	.insn	2, 0x0008
     6c4:	0001                	.insn	2, 0x0001
     6c6:	0402                	.insn	2, 0x0402
     6c8:	0301                	.insn	2, 0x0301
     6ca:	0900                	.insn	2, 0x0900
     6cc:	0008                	.insn	2, 0x0008
     6ce:	0001                	.insn	2, 0x0001
     6d0:	0402                	.insn	2, 0x0402
     6d2:	09000303          	lb	x6,144(x0) # 90 <_heap_size+0x90>
     6d6:	0004                	.insn	2, 0x0004
     6d8:	0001                	.insn	2, 0x0001
     6da:	0402                	.insn	2, 0x0402
     6dc:	0305                	.insn	2, 0x0305
     6de:	0900                	.insn	2, 0x0900
     6e0:	0004                	.insn	2, 0x0004
     6e2:	0001                	.insn	2, 0x0001
     6e4:	0402                	.insn	2, 0x0402
     6e6:	09000307          	.insn	4, 0x09000307
     6ea:	0008                	.insn	2, 0x0008
     6ec:	0001                	.insn	2, 0x0001
     6ee:	0402                	.insn	2, 0x0402
     6f0:	09000307          	.insn	4, 0x09000307
     6f4:	0004                	.insn	2, 0x0004
     6f6:	0001                	.insn	2, 0x0001
     6f8:	0402                	.insn	2, 0x0402
     6fa:	09000307          	.insn	4, 0x09000307
     6fe:	0000                	.insn	2, 0x
     700:	0001                	.insn	2, 0x0001
     702:	0402                	.insn	2, 0x0402
     704:	09000307          	.insn	4, 0x09000307
     708:	0014                	.insn	2, 0x0014
     70a:	0001                	.insn	2, 0x0001
     70c:	0402                	.insn	2, 0x0402
     70e:	09000307          	.insn	4, 0x09000307
     712:	000c                	.insn	2, 0x000c
     714:	0001                	.insn	2, 0x0001
     716:	0402                	.insn	2, 0x0402
     718:	09000307          	.insn	4, 0x09000307
     71c:	001c                	.insn	2, 0x001c
     71e:	0001                	.insn	2, 0x0001
     720:	0402                	.insn	2, 0x0402
     722:	0308                	.insn	2, 0x0308
     724:	0900                	.insn	2, 0x0900
     726:	0008                	.insn	2, 0x0008
     728:	0001                	.insn	2, 0x0001
     72a:	0402                	.insn	2, 0x0402
     72c:	0308                	.insn	2, 0x0308
     72e:	0900                	.insn	2, 0x0900
     730:	0008                	.insn	2, 0x0008
     732:	0001                	.insn	2, 0x0001
     734:	0402                	.insn	2, 0x0402
     736:	030a                	.insn	2, 0x030a
     738:	0900                	.insn	2, 0x0900
     73a:	0004                	.insn	2, 0x0004
     73c:	0001                	.insn	2, 0x0001
     73e:	0402                	.insn	2, 0x0402
     740:	030c                	.insn	2, 0x030c
     742:	0900                	.insn	2, 0x0900
     744:	0004                	.insn	2, 0x0004
     746:	0001                	.insn	2, 0x0001
     748:	0402                	.insn	2, 0x0402
     74a:	030e                	.insn	2, 0x030e
     74c:	0900                	.insn	2, 0x0900
     74e:	0008                	.insn	2, 0x0008
     750:	0001                	.insn	2, 0x0001
     752:	0402                	.insn	2, 0x0402
     754:	030e                	.insn	2, 0x030e
     756:	0900                	.insn	2, 0x0900
     758:	0008                	.insn	2, 0x0008
     75a:	0001                	.insn	2, 0x0001
     75c:	0402                	.insn	2, 0x0402
     75e:	030e                	.insn	2, 0x030e
     760:	0900                	.insn	2, 0x0900
     762:	0004                	.insn	2, 0x0004
     764:	0501                	.insn	2, 0x0501
     766:	09150307          	.insn	4, 0x09150307
     76a:	0004                	.insn	2, 0x0004
     76c:	0501                	.insn	2, 0x0501
     76e:	060a                	.insn	2, 0x060a
     770:	00090003          	lb	x0,0(x18)
     774:	0100                	.insn	2, 0x0100
     776:	0405                	.insn	2, 0x0405
     778:	0306                	.insn	2, 0x0306
     77a:	00040913          	addi	x18,x8,0
     77e:	0301                	.insn	2, 0x0301
     780:	0900                	.insn	2, 0x0900
     782:	0000                	.insn	2, 0x
     784:	0301                	.insn	2, 0x0301
     786:	0900                	.insn	2, 0x0900
     788:	0000                	.insn	2, 0x
     78a:	0301                	.insn	2, 0x0301
     78c:	0900                	.insn	2, 0x0900
     78e:	0000                	.insn	2, 0x
     790:	0001                	.insn	2, 0x0001
     792:	0402                	.insn	2, 0x0402
     794:	0301                	.insn	2, 0x0301
     796:	0900                	.insn	2, 0x0900
     798:	0000                	.insn	2, 0x
     79a:	0001                	.insn	2, 0x0001
     79c:	0402                	.insn	2, 0x0402
     79e:	00030603          	lb	x12,0(x6)
     7a2:	0809                	.insn	2, 0x0809
     7a4:	0100                	.insn	2, 0x0100
     7a6:	0200                	.insn	2, 0x0200
     7a8:	1504                	.insn	2, 0x1504
     7aa:	0306                	.insn	2, 0x0306
     7ac:	0900                	.insn	2, 0x0900
     7ae:	000c                	.insn	2, 0x000c
     7b0:	0001                	.insn	2, 0x0001
     7b2:	0402                	.insn	2, 0x0402
     7b4:	0315                	.insn	2, 0x0315
     7b6:	0900                	.insn	2, 0x0900
     7b8:	0020                	.insn	2, 0x0020
     7ba:	0301                	.insn	2, 0x0301
     7bc:	0901                	.insn	2, 0x0901
     7be:	0000                	.insn	2, 0x
     7c0:	0501                	.insn	2, 0x0501
     7c2:	00030607          	.insn	4, 0x00030607
     7c6:	0009                	.insn	2, 0x0009
     7c8:	0100                	.insn	2, 0x0100
     7ca:	0805                	.insn	2, 0x0805
     7cc:	0306                	.insn	2, 0x0306
     7ce:	090a                	.insn	2, 0x090a
     7d0:	0004                	.insn	2, 0x0004
     7d2:	0601                	.insn	2, 0x0601
     7d4:	00090203          	lb	x4,0(x18)
     7d8:	0100                	.insn	2, 0x0100
     7da:	0b05                	.insn	2, 0x0b05
     7dc:	04097e03          	.insn	4, 0x04097e03
     7e0:	0100                	.insn	2, 0x0100
     7e2:	1405                	.insn	2, 0x1405
     7e4:	0200                	.insn	2, 0x0200
     7e6:	0104                	.insn	2, 0x0104
     7e8:	04090003          	lb	x0,64(x18)
     7ec:	0100                	.insn	2, 0x0100
     7ee:	0405                	.insn	2, 0x0405
     7f0:	0200                	.insn	2, 0x0200
     7f2:	0404                	.insn	2, 0x0404
     7f4:	0c097503          	.insn	4, 0x0c097503
     7f8:	0100                	.insn	2, 0x0100
     7fa:	0200                	.insn	2, 0x0200
     7fc:	0b04                	.insn	2, 0x0b04
     7fe:	04090003          	lb	x0,64(x18)
     802:	0100                	.insn	2, 0x0100
     804:	0200                	.insn	2, 0x0200
     806:	0404                	.insn	2, 0x0404
     808:	04090003          	lb	x0,64(x18)
     80c:	0100                	.insn	2, 0x0100
     80e:	0200                	.insn	2, 0x0200
     810:	0a04                	.insn	2, 0x0a04
     812:	04090003          	lb	x0,64(x18)
     816:	0100                	.insn	2, 0x0100
     818:	0805                	.insn	2, 0x0805
     81a:	0306                	.insn	2, 0x0306
     81c:	091e                	.insn	2, 0x091e
     81e:	0008                	.insn	2, 0x0008
     820:	0301                	.insn	2, 0x0301
     822:	00000903          	lb	x18,0(x0) # 0 <_heap_size>
     826:	0301                	.insn	2, 0x0301
     828:	0902                	.insn	2, 0x0902
     82a:	0000                	.insn	2, 0x
     82c:	0501                	.insn	2, 0x0501
     82e:	0611                	.insn	2, 0x0611
     830:	00090003          	lb	x0,0(x18)
     834:	0100                	.insn	2, 0x0100
     836:	1e05                	.insn	2, 0x1e05
     838:	04090003          	lb	x0,64(x18)
     83c:	0100                	.insn	2, 0x0100
     83e:	0b05                	.insn	2, 0x0b05
     840:	04090003          	lb	x0,64(x18)
     844:	0100                	.insn	2, 0x0100
     846:	0805                	.insn	2, 0x0805
     848:	0306                	.insn	2, 0x0306
     84a:	0901                	.insn	2, 0x0901
     84c:	0004                	.insn	2, 0x0004
     84e:	0501                	.insn	2, 0x0501
     850:	0103060b          	.insn	4, 0x0103060b
     854:	0009                	.insn	2, 0x0009
     856:	0100                	.insn	2, 0x0100
     858:	0805                	.insn	2, 0x0805
     85a:	04090403          	lb	x8,64(x18)
     85e:	0100                	.insn	2, 0x0100
     860:	1e05                	.insn	2, 0x1e05
     862:	04097d03          	.insn	4, 0x04097d03
     866:	0100                	.insn	2, 0x0100
     868:	1105                	.insn	2, 0x1105
     86a:	04090003          	lb	x0,64(x18)
     86e:	0100                	.insn	2, 0x0100
     870:	0b05                	.insn	2, 0x0b05
     872:	04090003          	lb	x0,64(x18)
     876:	0100                	.insn	2, 0x0100
     878:	0805                	.insn	2, 0x0805
     87a:	04090303          	lb	x6,64(x18)
     87e:	0100                	.insn	2, 0x0100
     880:	0b05                	.insn	2, 0x0b05
     882:	0c097b03          	.insn	4, 0x0c097b03
     886:	0100                	.insn	2, 0x0100
     888:	0805                	.insn	2, 0x0805
     88a:	0306                	.insn	2, 0x0306
     88c:	0901                	.insn	2, 0x0901
     88e:	0004                	.insn	2, 0x0004
     890:	0301                	.insn	2, 0x0301
     892:	0901                	.insn	2, 0x0901
     894:	0000                	.insn	2, 0x
     896:	0301                	.insn	2, 0x0301
     898:	0901                	.insn	2, 0x0901
     89a:	0000                	.insn	2, 0x
     89c:	0301                	.insn	2, 0x0301
     89e:	0902                	.insn	2, 0x0902
     8a0:	0000                	.insn	2, 0x
     8a2:	0301                	.insn	2, 0x0301
     8a4:	0900                	.insn	2, 0x0900
     8a6:	0000                	.insn	2, 0x
     8a8:	0301                	.insn	2, 0x0301
     8aa:	0900                	.insn	2, 0x0900
     8ac:	0000                	.insn	2, 0x
     8ae:	0301                	.insn	2, 0x0301
     8b0:	0900                	.insn	2, 0x0900
     8b2:	0000                	.insn	2, 0x
     8b4:	0301                	.insn	2, 0x0301
     8b6:	0900                	.insn	2, 0x0900
     8b8:	0000                	.insn	2, 0x
     8ba:	0301                	.insn	2, 0x0301
     8bc:	0900                	.insn	2, 0x0900
     8be:	0004                	.insn	2, 0x0004
     8c0:	0301                	.insn	2, 0x0301
     8c2:	0900                	.insn	2, 0x0900
     8c4:	0000                	.insn	2, 0x
     8c6:	0301                	.insn	2, 0x0301
     8c8:	0900                	.insn	2, 0x0900
     8ca:	000c                	.insn	2, 0x000c
     8cc:	0301                	.insn	2, 0x0301
     8ce:	0900                	.insn	2, 0x0900
     8d0:	000c                	.insn	2, 0x000c
     8d2:	0301                	.insn	2, 0x0301
     8d4:	0900                	.insn	2, 0x0900
     8d6:	0018                	.insn	2, 0x0018
     8d8:	0001                	.insn	2, 0x0001
     8da:	0402                	.insn	2, 0x0402
     8dc:	0301                	.insn	2, 0x0301
     8de:	0900                	.insn	2, 0x0900
     8e0:	0008                	.insn	2, 0x0008
     8e2:	0001                	.insn	2, 0x0001
     8e4:	0402                	.insn	2, 0x0402
     8e6:	0301                	.insn	2, 0x0301
     8e8:	0900                	.insn	2, 0x0900
     8ea:	0008                	.insn	2, 0x0008
     8ec:	0001                	.insn	2, 0x0001
     8ee:	0402                	.insn	2, 0x0402
     8f0:	09000303          	lb	x6,144(x0) # 90 <_heap_size+0x90>
     8f4:	0004                	.insn	2, 0x0004
     8f6:	0001                	.insn	2, 0x0001
     8f8:	0402                	.insn	2, 0x0402
     8fa:	0305                	.insn	2, 0x0305
     8fc:	0900                	.insn	2, 0x0900
     8fe:	0004                	.insn	2, 0x0004
     900:	0001                	.insn	2, 0x0001
     902:	0402                	.insn	2, 0x0402
     904:	09000307          	.insn	4, 0x09000307
     908:	0008                	.insn	2, 0x0008
     90a:	0001                	.insn	2, 0x0001
     90c:	0402                	.insn	2, 0x0402
     90e:	09000307          	.insn	4, 0x09000307
     912:	0004                	.insn	2, 0x0004
     914:	0001                	.insn	2, 0x0001
     916:	0402                	.insn	2, 0x0402
     918:	09000307          	.insn	4, 0x09000307
     91c:	0000                	.insn	2, 0x
     91e:	0001                	.insn	2, 0x0001
     920:	0402                	.insn	2, 0x0402
     922:	09000307          	.insn	4, 0x09000307
     926:	0014                	.insn	2, 0x0014
     928:	0001                	.insn	2, 0x0001
     92a:	0402                	.insn	2, 0x0402
     92c:	09000307          	.insn	4, 0x09000307
     930:	000c                	.insn	2, 0x000c
     932:	0001                	.insn	2, 0x0001
     934:	0402                	.insn	2, 0x0402
     936:	09000307          	.insn	4, 0x09000307
     93a:	001c                	.insn	2, 0x001c
     93c:	0001                	.insn	2, 0x0001
     93e:	0402                	.insn	2, 0x0402
     940:	0308                	.insn	2, 0x0308
     942:	0900                	.insn	2, 0x0900
     944:	0008                	.insn	2, 0x0008
     946:	0001                	.insn	2, 0x0001
     948:	0402                	.insn	2, 0x0402
     94a:	0308                	.insn	2, 0x0308
     94c:	0900                	.insn	2, 0x0900
     94e:	0008                	.insn	2, 0x0008
     950:	0001                	.insn	2, 0x0001
     952:	0402                	.insn	2, 0x0402
     954:	030a                	.insn	2, 0x030a
     956:	0900                	.insn	2, 0x0900
     958:	0004                	.insn	2, 0x0004
     95a:	0001                	.insn	2, 0x0001
     95c:	0402                	.insn	2, 0x0402
     95e:	030c                	.insn	2, 0x030c
     960:	0900                	.insn	2, 0x0900
     962:	0004                	.insn	2, 0x0004
     964:	0001                	.insn	2, 0x0001
     966:	0402                	.insn	2, 0x0402
     968:	030e                	.insn	2, 0x030e
     96a:	0900                	.insn	2, 0x0900
     96c:	0008                	.insn	2, 0x0008
     96e:	0601                	.insn	2, 0x0601
     970:	04090103          	lb	x2,64(x18)
     974:	0100                	.insn	2, 0x0100
     976:	0200                	.insn	2, 0x0200
     978:	0e04                	.insn	2, 0x0e04
     97a:	04097f03          	.insn	4, 0x04097f03
     97e:	0100                	.insn	2, 0x0100
     980:	04090103          	lb	x2,64(x18)
     984:	0100                	.insn	2, 0x0100
     986:	0200                	.insn	2, 0x0200
     988:	0e04                	.insn	2, 0x0e04
     98a:	0c097f03          	.insn	4, 0x0c097f03
     98e:	0100                	.insn	2, 0x0100
     990:	0200                	.insn	2, 0x0200
     992:	0e04                	.insn	2, 0x0e04
     994:	0306                	.insn	2, 0x0306
     996:	0900                	.insn	2, 0x0900
     998:	0004                	.insn	2, 0x0004
     99a:	0001                	.insn	2, 0x0001
     99c:	0402                	.insn	2, 0x0402
     99e:	030e                	.insn	2, 0x030e
     9a0:	0900                	.insn	2, 0x0900
     9a2:	0000                	.insn	2, 0x
     9a4:	0001                	.insn	2, 0x0001
     9a6:	0402                	.insn	2, 0x0402
     9a8:	030e                	.insn	2, 0x030e
     9aa:	0900                	.insn	2, 0x0900
     9ac:	0000                	.insn	2, 0x
     9ae:	0301                	.insn	2, 0x0301
     9b0:	0901                	.insn	2, 0x0901
     9b2:	0000                	.insn	2, 0x
     9b4:	0301                	.insn	2, 0x0301
     9b6:	0900                	.insn	2, 0x0900
     9b8:	0000                	.insn	2, 0x
     9ba:	0301                	.insn	2, 0x0301
     9bc:	0900                	.insn	2, 0x0900
     9be:	0000                	.insn	2, 0x
     9c0:	0301                	.insn	2, 0x0301
     9c2:	0900                	.insn	2, 0x0900
     9c4:	0000                	.insn	2, 0x
     9c6:	0301                	.insn	2, 0x0301
     9c8:	0900                	.insn	2, 0x0900
     9ca:	0000                	.insn	2, 0x
     9cc:	0301                	.insn	2, 0x0301
     9ce:	0900                	.insn	2, 0x0900
     9d0:	0004                	.insn	2, 0x0004
     9d2:	0301                	.insn	2, 0x0301
     9d4:	0900                	.insn	2, 0x0900
     9d6:	0000                	.insn	2, 0x
     9d8:	0301                	.insn	2, 0x0301
     9da:	0900                	.insn	2, 0x0900
     9dc:	0004                	.insn	2, 0x0004
     9de:	0301                	.insn	2, 0x0301
     9e0:	0900                	.insn	2, 0x0900
     9e2:	0000                	.insn	2, 0x
     9e4:	0301                	.insn	2, 0x0301
     9e6:	0900                	.insn	2, 0x0900
     9e8:	0004                	.insn	2, 0x0004
     9ea:	0301                	.insn	2, 0x0301
     9ec:	0900                	.insn	2, 0x0900
     9ee:	0004                	.insn	2, 0x0004
     9f0:	0301                	.insn	2, 0x0301
     9f2:	0900                	.insn	2, 0x0900
     9f4:	0004                	.insn	2, 0x0004
     9f6:	0301                	.insn	2, 0x0301
     9f8:	0900                	.insn	2, 0x0900
     9fa:	0004                	.insn	2, 0x0004
     9fc:	0301                	.insn	2, 0x0301
     9fe:	0900                	.insn	2, 0x0900
     a00:	0000                	.insn	2, 0x
     a02:	0301                	.insn	2, 0x0301
     a04:	0900                	.insn	2, 0x0900
     a06:	0008                	.insn	2, 0x0008
     a08:	0301                	.insn	2, 0x0301
     a0a:	0900                	.insn	2, 0x0900
     a0c:	0000                	.insn	2, 0x
     a0e:	0301                	.insn	2, 0x0301
     a10:	0900                	.insn	2, 0x0900
     a12:	0004                	.insn	2, 0x0004
     a14:	0301                	.insn	2, 0x0301
     a16:	0900                	.insn	2, 0x0900
     a18:	0004                	.insn	2, 0x0004
     a1a:	0301                	.insn	2, 0x0301
     a1c:	0900                	.insn	2, 0x0900
     a1e:	0000                	.insn	2, 0x
     a20:	0301                	.insn	2, 0x0301
     a22:	0900                	.insn	2, 0x0900
     a24:	0008                	.insn	2, 0x0008
     a26:	0301                	.insn	2, 0x0301
     a28:	0900                	.insn	2, 0x0900
     a2a:	0000                	.insn	2, 0x
     a2c:	0301                	.insn	2, 0x0301
     a2e:	0900                	.insn	2, 0x0900
     a30:	0004                	.insn	2, 0x0004
     a32:	0301                	.insn	2, 0x0301
     a34:	0900                	.insn	2, 0x0900
     a36:	0004                	.insn	2, 0x0004
     a38:	0301                	.insn	2, 0x0301
     a3a:	0900                	.insn	2, 0x0900
     a3c:	0000                	.insn	2, 0x
     a3e:	0301                	.insn	2, 0x0301
     a40:	0900                	.insn	2, 0x0900
     a42:	0008                	.insn	2, 0x0008
     a44:	0301                	.insn	2, 0x0301
     a46:	0900                	.insn	2, 0x0900
     a48:	0000                	.insn	2, 0x
     a4a:	0301                	.insn	2, 0x0301
     a4c:	0900                	.insn	2, 0x0900
     a4e:	0004                	.insn	2, 0x0004
     a50:	0301                	.insn	2, 0x0301
     a52:	0900                	.insn	2, 0x0900
     a54:	0010                	.insn	2, 0x0010
     a56:	0301                	.insn	2, 0x0301
     a58:	0900                	.insn	2, 0x0900
     a5a:	0000                	.insn	2, 0x
     a5c:	0301                	.insn	2, 0x0301
     a5e:	0900                	.insn	2, 0x0900
     a60:	0000                	.insn	2, 0x
     a62:	0001                	.insn	2, 0x0001
     a64:	0402                	.insn	2, 0x0402
     a66:	0301                	.insn	2, 0x0301
     a68:	0900                	.insn	2, 0x0900
     a6a:	0004                	.insn	2, 0x0004
     a6c:	0001                	.insn	2, 0x0001
     a6e:	0402                	.insn	2, 0x0402
     a70:	09000303          	lb	x6,144(x0) # 90 <_heap_size+0x90>
     a74:	0004                	.insn	2, 0x0004
     a76:	0001                	.insn	2, 0x0001
     a78:	0402                	.insn	2, 0x0402
     a7a:	09000303          	lb	x6,144(x0) # 90 <_heap_size+0x90>
     a7e:	0008                	.insn	2, 0x0008
     a80:	0001                	.insn	2, 0x0001
     a82:	0402                	.insn	2, 0x0402
     a84:	09000303          	lb	x6,144(x0) # 90 <_heap_size+0x90>
     a88:	0000                	.insn	2, 0x
     a8a:	0301                	.insn	2, 0x0301
     a8c:	0902                	.insn	2, 0x0902
     a8e:	0000                	.insn	2, 0x
     a90:	0501                	.insn	2, 0x0501
     a92:	0003060b          	.insn	4, 0x0003060b
     a96:	0009                	.insn	2, 0x0009
     a98:	0100                	.insn	2, 0x0100
     a9a:	1405                	.insn	2, 0x1405
     a9c:	0200                	.insn	2, 0x0200
     a9e:	0104                	.insn	2, 0x0104
     aa0:	04090003          	lb	x0,64(x18)
     aa4:	0100                	.insn	2, 0x0100
     aa6:	0805                	.insn	2, 0x0805
     aa8:	0200                	.insn	2, 0x0200
     aaa:	0304                	.insn	2, 0x0304
     aac:	04097e03          	.insn	4, 0x04097e03
     ab0:	0100                	.insn	2, 0x0100
     ab2:	0b05                	.insn	2, 0x0b05
     ab4:	14097d03          	.insn	4, 0x14097d03
     ab8:	0100                	.insn	2, 0x0100
     aba:	0805                	.insn	2, 0x0805
     abc:	0200                	.insn	2, 0x0200
     abe:	0304                	.insn	2, 0x0304
     ac0:	04090303          	lb	x6,64(x18)
     ac4:	0100                	.insn	2, 0x0100
     ac6:	0b05                	.insn	2, 0x0b05
     ac8:	04090803          	lb	x16,64(x18)
     acc:	0100                	.insn	2, 0x0100
     ace:	2105                	.insn	2, 0x2105
     ad0:	0200                	.insn	2, 0x0200
     ad2:	0204                	.insn	2, 0x0204
     ad4:	04097a03          	.insn	4, 0x04097a03
     ad8:	0100                	.insn	2, 0x0100
     ada:	0505                	.insn	2, 0x0505
     adc:	0306                	.insn	2, 0x0306
     ade:	0902                	.insn	2, 0x0902
     ae0:	0004                	.insn	2, 0x0004
     ae2:	0501                	.insn	2, 0x0501
     ae4:	00030607          	.insn	4, 0x00030607
     ae8:	0009                	.insn	2, 0x0009
     aea:	0100                	.insn	2, 0x0100
     aec:	0505                	.insn	2, 0x0505
     aee:	0306                	.insn	2, 0x0306
     af0:	0901                	.insn	2, 0x0901
     af2:	0004                	.insn	2, 0x0004
     af4:	0301                	.insn	2, 0x0301
     af6:	0900                	.insn	2, 0x0900
     af8:	0000                	.insn	2, 0x
     afa:	0301                	.insn	2, 0x0301
     afc:	0900                	.insn	2, 0x0900
     afe:	0000                	.insn	2, 0x
     b00:	0301                	.insn	2, 0x0301
     b02:	0900                	.insn	2, 0x0900
     b04:	0000                	.insn	2, 0x
     b06:	0301                	.insn	2, 0x0301
     b08:	0900                	.insn	2, 0x0900
     b0a:	0000                	.insn	2, 0x
     b0c:	0501                	.insn	2, 0x0501
     b0e:	43030607          	.insn	4, 0x43030607
     b12:	0409                	.insn	2, 0x0409
     b14:	0100                	.insn	2, 0x0100
     b16:	04097f03          	.insn	4, 0x04097f03
     b1a:	0100                	.insn	2, 0x0100
     b1c:	0809                	.insn	2, 0x0809
     b1e:	0000                	.insn	2, 0x
     b20:	0101                	.insn	2, 0x0101
     b22:	0941                	.insn	2, 0x0941
     b24:	0000                	.insn	2, 0x
     b26:	0005                	.insn	2, 0x0005
     b28:	0004                	.insn	2, 0x0004
     b2a:	00000033          	add	x0,x0,x0
     b2e:	0101                	.insn	2, 0x0101
     b30:	fb01                	.insn	2, 0xfb01
     b32:	0d0e                	.insn	2, 0x0d0e
     b34:	0100                	.insn	2, 0x0100
     b36:	0101                	.insn	2, 0x0101
     b38:	0001                	.insn	2, 0x0001
     b3a:	0000                	.insn	2, 0x
     b3c:	0001                	.insn	2, 0x0001
     b3e:	0100                	.insn	2, 0x0100
     b40:	0101                	.insn	2, 0x0101
     b42:	021f 0000 0000      	.insn	6, 0x021f
     b48:	00c4                	.insn	2, 0x00c4
     b4a:	0000                	.insn	2, 0x
     b4c:	0102                	.insn	2, 0x0102
     b4e:	021f 030f 00ba      	.insn	6, 0x00ba030f021f
     b54:	0000                	.insn	2, 0x
     b56:	ba01                	.insn	2, 0xba01
     b58:	0000                	.insn	2, 0x
     b5a:	0100                	.insn	2, 0x0100
     b5c:	00e0                	.insn	2, 0x00e0
     b5e:	0000                	.insn	2, 0x
     b60:	0501                	.insn	2, 0x0501
     b62:	0001                	.insn	2, 0x0001
     b64:	0205                	.insn	2, 0x0205
     b66:	6ae0                	.insn	2, 0x6ae0
     b68:	8000                	.insn	2, 0x8000
     b6a:	010a8603          	lb	x12,16(x21)
     b6e:	0305                	.insn	2, 0x0305
     b70:	00090103          	lb	x2,0(x18)
     b74:	0100                	.insn	2, 0x0100
     b76:	00090203          	lb	x4,0(x18)
     b7a:	0100                	.insn	2, 0x0100
     b7c:	097ddb03          	lhu	x22,151(x27)
     b80:	0000                	.insn	2, 0x
     b82:	0301                	.insn	2, 0x0301
     b84:	0901                	.insn	2, 0x0901
     b86:	0000                	.insn	2, 0x
     b88:	0301                	.insn	2, 0x0301
     b8a:	0901                	.insn	2, 0x0901
     b8c:	0000                	.insn	2, 0x
     b8e:	0301                	.insn	2, 0x0301
     b90:	0901                	.insn	2, 0x0901
     b92:	0000                	.insn	2, 0x
     b94:	0301                	.insn	2, 0x0301
     b96:	0901                	.insn	2, 0x0901
     b98:	0000                	.insn	2, 0x
     b9a:	0301                	.insn	2, 0x0301
     b9c:	0901                	.insn	2, 0x0901
     b9e:	0000                	.insn	2, 0x
     ba0:	0301                	.insn	2, 0x0301
     ba2:	0902                	.insn	2, 0x0902
     ba4:	0000                	.insn	2, 0x
     ba6:	0301                	.insn	2, 0x0301
     ba8:	0901                	.insn	2, 0x0901
     baa:	0000                	.insn	2, 0x
     bac:	0301                	.insn	2, 0x0301
     bae:	0901                	.insn	2, 0x0901
     bb0:	0000                	.insn	2, 0x
     bb2:	0501                	.insn	2, 0x0501
     bb4:	0601                	.insn	2, 0x0601
     bb6:	09029903          	lh	x18,144(x5)
     bba:	0000                	.insn	2, 0x
     bbc:	0501                	.insn	2, 0x0501
     bbe:	0306                	.insn	2, 0x0306
     bc0:	34097de7          	.insn	4, 0x34097de7
     bc4:	0100                	.insn	2, 0x0100
     bc6:	0305                	.insn	2, 0x0305
     bc8:	0306                	.insn	2, 0x0306
     bca:	0901                	.insn	2, 0x0901
     bcc:	0004                	.insn	2, 0x0004
     bce:	0501                	.insn	2, 0x0501
     bd0:	0606                	.insn	2, 0x0606
     bd2:	00090003          	lb	x0,0(x18)
     bd6:	0100                	.insn	2, 0x0100
     bd8:	0305                	.insn	2, 0x0305
     bda:	0306                	.insn	2, 0x0306
     bdc:	0925                	.insn	2, 0x0925
     bde:	0004                	.insn	2, 0x0004
     be0:	0501                	.insn	2, 0x0501
     be2:	0606                	.insn	2, 0x0606
     be4:	00090003          	lb	x0,0(x18)
     be8:	0100                	.insn	2, 0x0100
     bea:	0705                	.insn	2, 0x0705
     bec:	0306                	.insn	2, 0x0306
     bee:	0902                	.insn	2, 0x0902
     bf0:	000c                	.insn	2, 0x000c
     bf2:	0501                	.insn	2, 0x0501
     bf4:	060a                	.insn	2, 0x060a
     bf6:	04090003          	lb	x0,64(x18)
     bfa:	0100                	.insn	2, 0x0100
     bfc:	0405                	.insn	2, 0x0405
     bfe:	0306                	.insn	2, 0x0306
     c00:	0904                	.insn	2, 0x0904
     c02:	0004                	.insn	2, 0x0004
     c04:	0301                	.insn	2, 0x0301
     c06:	0900                	.insn	2, 0x0900
     c08:	0000                	.insn	2, 0x
     c0a:	0301                	.insn	2, 0x0301
     c0c:	0900                	.insn	2, 0x0900
     c0e:	0000                	.insn	2, 0x
     c10:	0301                	.insn	2, 0x0301
     c12:	0900                	.insn	2, 0x0900
     c14:	0000                	.insn	2, 0x
     c16:	0001                	.insn	2, 0x0001
     c18:	0402                	.insn	2, 0x0402
     c1a:	0301                	.insn	2, 0x0301
     c1c:	0900                	.insn	2, 0x0900
     c1e:	0000                	.insn	2, 0x
     c20:	0001                	.insn	2, 0x0001
     c22:	0402                	.insn	2, 0x0402
     c24:	00030603          	lb	x12,0(x6)
     c28:	0809                	.insn	2, 0x0809
     c2a:	0100                	.insn	2, 0x0100
     c2c:	0200                	.insn	2, 0x0200
     c2e:	1504                	.insn	2, 0x1504
     c30:	0306                	.insn	2, 0x0306
     c32:	0900                	.insn	2, 0x0900
     c34:	000c                	.insn	2, 0x000c
     c36:	0001                	.insn	2, 0x0001
     c38:	0402                	.insn	2, 0x0402
     c3a:	0315                	.insn	2, 0x0315
     c3c:	0900                	.insn	2, 0x0900
     c3e:	0018                	.insn	2, 0x0018
     c40:	0301                	.insn	2, 0x0301
     c42:	0902                	.insn	2, 0x0902
     c44:	0000                	.insn	2, 0x
     c46:	0501                	.insn	2, 0x0501
     c48:	00030607          	.insn	4, 0x00030607
     c4c:	0009                	.insn	2, 0x0009
     c4e:	0100                	.insn	2, 0x0100
     c50:	0805                	.insn	2, 0x0805
     c52:	0306                	.insn	2, 0x0306
     c54:	0905                	.insn	2, 0x0905
     c56:	0004                	.insn	2, 0x0004
     c58:	0501                	.insn	2, 0x0501
     c5a:	0611                	.insn	2, 0x0611
     c5c:	00090103          	lb	x2,0(x18)
     c60:	0100                	.insn	2, 0x0100
     c62:	1e05                	.insn	2, 0x1e05
     c64:	04090003          	lb	x0,64(x18)
     c68:	0100                	.insn	2, 0x0100
     c6a:	0b05                	.insn	2, 0x0b05
     c6c:	04097f03          	.insn	4, 0x04097f03
     c70:	0100                	.insn	2, 0x0100
     c72:	0805                	.insn	2, 0x0805
     c74:	0306                	.insn	2, 0x0306
     c76:	0901                	.insn	2, 0x0901
     c78:	0004                	.insn	2, 0x0004
     c7a:	0501                	.insn	2, 0x0501
     c7c:	0003060b          	.insn	4, 0x0003060b
     c80:	0009                	.insn	2, 0x0009
     c82:	0100                	.insn	2, 0x0100
     c84:	0805                	.insn	2, 0x0805
     c86:	0306                	.insn	2, 0x0306
     c88:	0901                	.insn	2, 0x0901
     c8a:	0004                	.insn	2, 0x0004
     c8c:	0501                	.insn	2, 0x0501
     c8e:	0003060b          	.insn	4, 0x0003060b
     c92:	0009                	.insn	2, 0x0009
     c94:	0100                	.insn	2, 0x0100
     c96:	0405                	.insn	2, 0x0405
     c98:	0306                	.insn	2, 0x0306
     c9a:	00040903          	lb	x18,0(x8)
     c9e:	0301                	.insn	2, 0x0301
     ca0:	0900                	.insn	2, 0x0900
     ca2:	0000                	.insn	2, 0x
     ca4:	0301                	.insn	2, 0x0301
     ca6:	0900                	.insn	2, 0x0900
     ca8:	0000                	.insn	2, 0x
     caa:	0301                	.insn	2, 0x0301
     cac:	0900                	.insn	2, 0x0900
     cae:	0000                	.insn	2, 0x
     cb0:	0501                	.insn	2, 0x0501
     cb2:	0008                	.insn	2, 0x0008
     cb4:	0402                	.insn	2, 0x0402
     cb6:	0925030f          	.insn	4, 0x0925030f
     cba:	0000                	.insn	2, 0x
     cbc:	0501                	.insn	2, 0x0501
     cbe:	0304                	.insn	2, 0x0304
     cc0:	0905                	.insn	2, 0x0905
     cc2:	0000                	.insn	2, 0x
     cc4:	0301                	.insn	2, 0x0301
     cc6:	0900                	.insn	2, 0x0900
     cc8:	0000                	.insn	2, 0x
     cca:	0301                	.insn	2, 0x0301
     ccc:	0900                	.insn	2, 0x0900
     cce:	0000                	.insn	2, 0x
     cd0:	0301                	.insn	2, 0x0301
     cd2:	0900                	.insn	2, 0x0900
     cd4:	0000                	.insn	2, 0x
     cd6:	0301                	.insn	2, 0x0301
     cd8:	0900                	.insn	2, 0x0900
     cda:	0004                	.insn	2, 0x0004
     cdc:	0301                	.insn	2, 0x0301
     cde:	0900                	.insn	2, 0x0900
     ce0:	0014                	.insn	2, 0x0014
     ce2:	0301                	.insn	2, 0x0301
     ce4:	0900                	.insn	2, 0x0900
     ce6:	0000                	.insn	2, 0x
     ce8:	0301                	.insn	2, 0x0301
     cea:	0900                	.insn	2, 0x0900
     cec:	0000                	.insn	2, 0x
     cee:	0301                	.insn	2, 0x0301
     cf0:	0900                	.insn	2, 0x0900
     cf2:	000c                	.insn	2, 0x000c
     cf4:	0301                	.insn	2, 0x0301
     cf6:	0900                	.insn	2, 0x0900
     cf8:	0018                	.insn	2, 0x0018
     cfa:	0001                	.insn	2, 0x0001
     cfc:	0402                	.insn	2, 0x0402
     cfe:	0301                	.insn	2, 0x0301
     d00:	0900                	.insn	2, 0x0900
     d02:	0004                	.insn	2, 0x0004
     d04:	0001                	.insn	2, 0x0001
     d06:	0402                	.insn	2, 0x0402
     d08:	0301                	.insn	2, 0x0301
     d0a:	0900                	.insn	2, 0x0900
     d0c:	0004                	.insn	2, 0x0004
     d0e:	0001                	.insn	2, 0x0001
     d10:	0402                	.insn	2, 0x0402
     d12:	09000303          	lb	x6,144(x0) # 90 <_heap_size+0x90>
     d16:	0004                	.insn	2, 0x0004
     d18:	0001                	.insn	2, 0x0001
     d1a:	0402                	.insn	2, 0x0402
     d1c:	0305                	.insn	2, 0x0305
     d1e:	0900                	.insn	2, 0x0900
     d20:	0004                	.insn	2, 0x0004
     d22:	0001                	.insn	2, 0x0001
     d24:	0402                	.insn	2, 0x0402
     d26:	09000307          	.insn	4, 0x09000307
     d2a:	0004                	.insn	2, 0x0004
     d2c:	0001                	.insn	2, 0x0001
     d2e:	0402                	.insn	2, 0x0402
     d30:	09000307          	.insn	4, 0x09000307
     d34:	0004                	.insn	2, 0x0004
     d36:	0001                	.insn	2, 0x0001
     d38:	0402                	.insn	2, 0x0402
     d3a:	09000307          	.insn	4, 0x09000307
     d3e:	0000                	.insn	2, 0x
     d40:	0001                	.insn	2, 0x0001
     d42:	0402                	.insn	2, 0x0402
     d44:	09000307          	.insn	4, 0x09000307
     d48:	0000                	.insn	2, 0x
     d4a:	0001                	.insn	2, 0x0001
     d4c:	0402                	.insn	2, 0x0402
     d4e:	09000307          	.insn	4, 0x09000307
     d52:	0018                	.insn	2, 0x0018
     d54:	0001                	.insn	2, 0x0001
     d56:	0402                	.insn	2, 0x0402
     d58:	09000307          	.insn	4, 0x09000307
     d5c:	001c                	.insn	2, 0x001c
     d5e:	0001                	.insn	2, 0x0001
     d60:	0402                	.insn	2, 0x0402
     d62:	0308                	.insn	2, 0x0308
     d64:	0900                	.insn	2, 0x0900
     d66:	0004                	.insn	2, 0x0004
     d68:	0001                	.insn	2, 0x0001
     d6a:	0402                	.insn	2, 0x0402
     d6c:	0308                	.insn	2, 0x0308
     d6e:	0900                	.insn	2, 0x0900
     d70:	0004                	.insn	2, 0x0004
     d72:	0001                	.insn	2, 0x0001
     d74:	0402                	.insn	2, 0x0402
     d76:	030a                	.insn	2, 0x030a
     d78:	0900                	.insn	2, 0x0900
     d7a:	0004                	.insn	2, 0x0004
     d7c:	0001                	.insn	2, 0x0001
     d7e:	0402                	.insn	2, 0x0402
     d80:	030c                	.insn	2, 0x030c
     d82:	0900                	.insn	2, 0x0900
     d84:	0004                	.insn	2, 0x0004
     d86:	0001                	.insn	2, 0x0001
     d88:	0402                	.insn	2, 0x0402
     d8a:	030e                	.insn	2, 0x030e
     d8c:	0900                	.insn	2, 0x0900
     d8e:	0004                	.insn	2, 0x0004
     d90:	0001                	.insn	2, 0x0001
     d92:	0402                	.insn	2, 0x0402
     d94:	030e                	.insn	2, 0x030e
     d96:	0900                	.insn	2, 0x0900
     d98:	0004                	.insn	2, 0x0004
     d9a:	0001                	.insn	2, 0x0001
     d9c:	0402                	.insn	2, 0x0402
     d9e:	030e                	.insn	2, 0x030e
     da0:	0900                	.insn	2, 0x0900
     da2:	0000                	.insn	2, 0x
     da4:	0001                	.insn	2, 0x0001
     da6:	0402                	.insn	2, 0x0402
     da8:	0900030f          	.insn	4, 0x0900030f
     dac:	0000                	.insn	2, 0x
     dae:	0501                	.insn	2, 0x0501
     db0:	09050307          	.insn	4, 0x09050307
     db4:	0000                	.insn	2, 0x
     db6:	0501                	.insn	2, 0x0501
     db8:	0304                	.insn	2, 0x0304
     dba:	0902                	.insn	2, 0x0902
     dbc:	0000                	.insn	2, 0x
     dbe:	0501                	.insn	2, 0x0501
     dc0:	0612                	.insn	2, 0x0612
     dc2:	00090003          	lb	x0,0(x18)
     dc6:	0100                	.insn	2, 0x0100
     dc8:	0405                	.insn	2, 0x0405
     dca:	0306                	.insn	2, 0x0306
     dcc:	0901                	.insn	2, 0x0901
     dce:	0004                	.insn	2, 0x0004
     dd0:	0301                	.insn	2, 0x0301
     dd2:	0901                	.insn	2, 0x0901
     dd4:	0000                	.insn	2, 0x
     dd6:	0501                	.insn	2, 0x0501
     dd8:	060c                	.insn	2, 0x060c
     dda:	00090003          	lb	x0,0(x18)
     dde:	0100                	.insn	2, 0x0100
     de0:	0305                	.insn	2, 0x0305
     de2:	0306                	.insn	2, 0x0306
     de4:	00da                	.insn	2, 0x00da
     de6:	0409                	.insn	2, 0x0409
     de8:	0100                	.insn	2, 0x0100
     dea:	00090103          	lb	x2,0(x18)
     dee:	0100                	.insn	2, 0x0100
     df0:	0900d803          	lhu	x16,144(x1)
     df4:	0000                	.insn	2, 0x
     df6:	0501                	.insn	2, 0x0501
     df8:	0601                	.insn	2, 0x0601
     dfa:	00090103          	lb	x2,0(x18)
     dfe:	0100                	.insn	2, 0x0100
     e00:	0405                	.insn	2, 0x0405
     e02:	0200                	.insn	2, 0x0200
     e04:	0404                	.insn	2, 0x0404
     e06:	097e8d03          	lb	x26,151(x29)
     e0a:	0038                	.insn	2, 0x0038
     e0c:	0001                	.insn	2, 0x0001
     e0e:	0402                	.insn	2, 0x0402
     e10:	0900030b          	.insn	4, 0x0900030b
     e14:	0004                	.insn	2, 0x0004
     e16:	0001                	.insn	2, 0x0001
     e18:	0402                	.insn	2, 0x0402
     e1a:	0304                	.insn	2, 0x0304
     e1c:	0900                	.insn	2, 0x0900
     e1e:	0004                	.insn	2, 0x0004
     e20:	0001                	.insn	2, 0x0001
     e22:	0402                	.insn	2, 0x0402
     e24:	030a                	.insn	2, 0x030a
     e26:	0900                	.insn	2, 0x0900
     e28:	0004                	.insn	2, 0x0004
     e2a:	0601                	.insn	2, 0x0601
     e2c:	08091503          	lh	x10,128(x18)
     e30:	0100                	.insn	2, 0x0100
     e32:	0200                	.insn	2, 0x0200
     e34:	0504                	.insn	2, 0x0504
     e36:	0306                	.insn	2, 0x0306
     e38:	00000903          	lb	x18,0(x0) # 0 <_heap_size>
     e3c:	0501                	.insn	2, 0x0501
     e3e:	097d0307          	.insn	4, 0x097d0307
     e42:	0004                	.insn	2, 0x0004
     e44:	0501                	.insn	2, 0x0501
     e46:	0604                	.insn	2, 0x0604
     e48:	04090303          	lb	x6,64(x18)
     e4c:	0100                	.insn	2, 0x0100
     e4e:	00090003          	lb	x0,0(x18)
     e52:	0100                	.insn	2, 0x0100
     e54:	00090003          	lb	x0,0(x18)
     e58:	0100                	.insn	2, 0x0100
     e5a:	00090003          	lb	x0,0(x18)
     e5e:	0100                	.insn	2, 0x0100
     e60:	0200                	.insn	2, 0x0200
     e62:	0104                	.insn	2, 0x0104
     e64:	00090003          	lb	x0,0(x18)
     e68:	0100                	.insn	2, 0x0100
     e6a:	0200                	.insn	2, 0x0200
     e6c:	0304                	.insn	2, 0x0304
     e6e:	0306                	.insn	2, 0x0306
     e70:	0900                	.insn	2, 0x0900
     e72:	0008                	.insn	2, 0x0008
     e74:	0001                	.insn	2, 0x0001
     e76:	0402                	.insn	2, 0x0402
     e78:	0615                	.insn	2, 0x0615
     e7a:	0c090003          	lb	x0,192(x18)
     e7e:	0100                	.insn	2, 0x0100
     e80:	0b05                	.insn	2, 0x0b05
     e82:	0306                	.insn	2, 0x0306
     e84:	000c090b          	.insn	4, 0x000c090b
     e88:	0501                	.insn	2, 0x0501
     e8a:	0004                	.insn	2, 0x0004
     e8c:	0402                	.insn	2, 0x0402
     e8e:	0315                	.insn	2, 0x0315
     e90:	0975                	.insn	2, 0x0975
     e92:	0004                	.insn	2, 0x0004
     e94:	0001                	.insn	2, 0x0001
     e96:	0402                	.insn	2, 0x0402
     e98:	0615                	.insn	2, 0x0615
     e9a:	0c090003          	lb	x0,192(x18)
     e9e:	0100                	.insn	2, 0x0100
     ea0:	00090203          	lb	x4,0(x18)
     ea4:	0100                	.insn	2, 0x0100
     ea6:	0705                	.insn	2, 0x0705
     ea8:	0306                	.insn	2, 0x0306
     eaa:	0900                	.insn	2, 0x0900
     eac:	0000                	.insn	2, 0x
     eae:	0501                	.insn	2, 0x0501
     eb0:	0608                	.insn	2, 0x0608
     eb2:	04091003          	lh	x0,64(x18)
     eb6:	0100                	.insn	2, 0x0100
     eb8:	00090203          	lb	x4,0(x18)
     ebc:	0100                	.insn	2, 0x0100
     ebe:	0b05                	.insn	2, 0x0b05
     ec0:	0306                	.insn	2, 0x0306
     ec2:	0900                	.insn	2, 0x0900
     ec4:	0000                	.insn	2, 0x
     ec6:	0501                	.insn	2, 0x0501
     ec8:	0608                	.insn	2, 0x0608
     eca:	04090103          	lb	x2,64(x18)
     ece:	0100                	.insn	2, 0x0100
     ed0:	0b05                	.insn	2, 0x0b05
     ed2:	0306                	.insn	2, 0x0306
     ed4:	0900                	.insn	2, 0x0900
     ed6:	0000                	.insn	2, 0x
     ed8:	0501                	.insn	2, 0x0501
     eda:	0608                	.insn	2, 0x0608
     edc:	04090103          	lb	x2,64(x18)
     ee0:	0100                	.insn	2, 0x0100
     ee2:	0306                	.insn	2, 0x0306
     ee4:	00000903          	lb	x18,0(x0) # 0 <_heap_size>
     ee8:	0501                	.insn	2, 0x0501
     eea:	031e                	.insn	2, 0x031e
     eec:	097d                	.insn	2, 0x097d
     eee:	0004                	.insn	2, 0x0004
     ef0:	0501                	.insn	2, 0x0501
     ef2:	0311                	.insn	2, 0x0311
     ef4:	0900                	.insn	2, 0x0900
     ef6:	0004                	.insn	2, 0x0004
     ef8:	0501                	.insn	2, 0x0501
     efa:	0900030b          	.insn	4, 0x0900030b
     efe:	0004                	.insn	2, 0x0004
     f00:	0501                	.insn	2, 0x0501
     f02:	0608                	.insn	2, 0x0608
     f04:	04090103          	lb	x2,64(x18)
     f08:	0100                	.insn	2, 0x0100
     f0a:	0b05                	.insn	2, 0x0b05
     f0c:	0306                	.insn	2, 0x0306
     f0e:	0900                	.insn	2, 0x0900
     f10:	0000                	.insn	2, 0x
     f12:	0501                	.insn	2, 0x0501
     f14:	0608                	.insn	2, 0x0608
     f16:	04090203          	lb	x4,64(x18)
     f1a:	0100                	.insn	2, 0x0100
     f1c:	00090003          	lb	x0,0(x18)
     f20:	0100                	.insn	2, 0x0100
     f22:	00090003          	lb	x0,0(x18)
     f26:	0100                	.insn	2, 0x0100
     f28:	00090003          	lb	x0,0(x18)
     f2c:	0100                	.insn	2, 0x0100
     f2e:	00090003          	lb	x0,0(x18)
     f32:	0100                	.insn	2, 0x0100
     f34:	14090003          	lb	x0,320(x18)
     f38:	0100                	.insn	2, 0x0100
     f3a:	00090003          	lb	x0,0(x18)
     f3e:	0100                	.insn	2, 0x0100
     f40:	00090003          	lb	x0,0(x18)
     f44:	0100                	.insn	2, 0x0100
     f46:	0c090003          	lb	x0,192(x18)
     f4a:	0100                	.insn	2, 0x0100
     f4c:	18090003          	lb	x0,384(x18)
     f50:	0100                	.insn	2, 0x0100
     f52:	0200                	.insn	2, 0x0200
     f54:	0104                	.insn	2, 0x0104
     f56:	04090003          	lb	x0,64(x18)
     f5a:	0100                	.insn	2, 0x0100
     f5c:	0200                	.insn	2, 0x0200
     f5e:	0104                	.insn	2, 0x0104
     f60:	04090003          	lb	x0,64(x18)
     f64:	0100                	.insn	2, 0x0100
     f66:	0200                	.insn	2, 0x0200
     f68:	0304                	.insn	2, 0x0304
     f6a:	04090003          	lb	x0,64(x18)
     f6e:	0100                	.insn	2, 0x0100
     f70:	0200                	.insn	2, 0x0200
     f72:	0504                	.insn	2, 0x0504
     f74:	04090003          	lb	x0,64(x18)
     f78:	0100                	.insn	2, 0x0100
     f7a:	0200                	.insn	2, 0x0200
     f7c:	0704                	.insn	2, 0x0704
     f7e:	04090003          	lb	x0,64(x18)
     f82:	0100                	.insn	2, 0x0100
     f84:	0200                	.insn	2, 0x0200
     f86:	0704                	.insn	2, 0x0704
     f88:	04090003          	lb	x0,64(x18)
     f8c:	0100                	.insn	2, 0x0100
     f8e:	0200                	.insn	2, 0x0200
     f90:	0704                	.insn	2, 0x0704
     f92:	00090003          	lb	x0,0(x18)
     f96:	0100                	.insn	2, 0x0100
     f98:	0200                	.insn	2, 0x0200
     f9a:	0704                	.insn	2, 0x0704
     f9c:	00090003          	lb	x0,0(x18)
     fa0:	0100                	.insn	2, 0x0100
     fa2:	0200                	.insn	2, 0x0200
     fa4:	0704                	.insn	2, 0x0704
     fa6:	18090003          	lb	x0,384(x18)
     faa:	0100                	.insn	2, 0x0100
     fac:	0200                	.insn	2, 0x0200
     fae:	0704                	.insn	2, 0x0704
     fb0:	1c090003          	lb	x0,448(x18)
     fb4:	0100                	.insn	2, 0x0100
     fb6:	0200                	.insn	2, 0x0200
     fb8:	0804                	.insn	2, 0x0804
     fba:	04090003          	lb	x0,64(x18)
     fbe:	0100                	.insn	2, 0x0100
     fc0:	0200                	.insn	2, 0x0200
     fc2:	0804                	.insn	2, 0x0804
     fc4:	04090003          	lb	x0,64(x18)
     fc8:	0100                	.insn	2, 0x0100
     fca:	0200                	.insn	2, 0x0200
     fcc:	0a04                	.insn	2, 0x0a04
     fce:	04090003          	lb	x0,64(x18)
     fd2:	0100                	.insn	2, 0x0100
     fd4:	0200                	.insn	2, 0x0200
     fd6:	0c04                	.insn	2, 0x0c04
     fd8:	04090003          	lb	x0,64(x18)
     fdc:	0100                	.insn	2, 0x0100
     fde:	0200                	.insn	2, 0x0200
     fe0:	0e04                	.insn	2, 0x0e04
     fe2:	04090003          	lb	x0,64(x18)
     fe6:	0100                	.insn	2, 0x0100
     fe8:	0200                	.insn	2, 0x0200
     fea:	0e04                	.insn	2, 0x0e04
     fec:	04090003          	lb	x0,64(x18)
     ff0:	0100                	.insn	2, 0x0100
     ff2:	0200                	.insn	2, 0x0200
     ff4:	0e04                	.insn	2, 0x0e04
     ff6:	00090003          	lb	x0,0(x18)
     ffa:	0100                	.insn	2, 0x0100
     ffc:	0405                	.insn	2, 0x0405
     ffe:	0200                	.insn	2, 0x0200
    1000:	0404                	.insn	2, 0x0404
    1002:	0306                	.insn	2, 0x0306
    1004:	00040967          	jalr	x18,0(x8)
    1008:	0001                	.insn	2, 0x0001
    100a:	0402                	.insn	2, 0x0402
    100c:	0900030b          	.insn	4, 0x0900030b
    1010:	0004                	.insn	2, 0x0004
    1012:	0001                	.insn	2, 0x0001
    1014:	0402                	.insn	2, 0x0402
    1016:	0304                	.insn	2, 0x0304
    1018:	0900                	.insn	2, 0x0900
    101a:	0004                	.insn	2, 0x0004
    101c:	0001                	.insn	2, 0x0001
    101e:	0402                	.insn	2, 0x0402
    1020:	030a                	.insn	2, 0x030a
    1022:	0900                	.insn	2, 0x0900
    1024:	0004                	.insn	2, 0x0004
    1026:	0501                	.insn	2, 0x0501
    1028:	2e030607          	.insn	4, 0x2e030607
    102c:	0809                	.insn	2, 0x0809
    102e:	0100                	.insn	2, 0x0100
    1030:	0a05                	.insn	2, 0x0a05
    1032:	0306                	.insn	2, 0x0306
    1034:	0900                	.insn	2, 0x0900
    1036:	0000                	.insn	2, 0x
    1038:	0501                	.insn	2, 0x0501
    103a:	0604                	.insn	2, 0x0604
    103c:	04091303          	lh	x6,64(x18)
    1040:	0100                	.insn	2, 0x0100
    1042:	00090003          	lb	x0,0(x18)
    1046:	0100                	.insn	2, 0x0100
    1048:	00090003          	lb	x0,0(x18)
    104c:	0100                	.insn	2, 0x0100
    104e:	00090003          	lb	x0,0(x18)
    1052:	0100                	.insn	2, 0x0100
    1054:	0200                	.insn	2, 0x0200
    1056:	0104                	.insn	2, 0x0104
    1058:	00090003          	lb	x0,0(x18)
    105c:	0100                	.insn	2, 0x0100
    105e:	0200                	.insn	2, 0x0200
    1060:	0304                	.insn	2, 0x0304
    1062:	0306                	.insn	2, 0x0306
    1064:	0900                	.insn	2, 0x0900
    1066:	0008                	.insn	2, 0x0008
    1068:	0001                	.insn	2, 0x0001
    106a:	0402                	.insn	2, 0x0402
    106c:	0615                	.insn	2, 0x0615
    106e:	0c090003          	lb	x0,192(x18)
    1072:	0100                	.insn	2, 0x0100
    1074:	0200                	.insn	2, 0x0200
    1076:	1504                	.insn	2, 0x1504
    1078:	20090003          	lb	x0,512(x18)
    107c:	0100                	.insn	2, 0x0100
    107e:	00090103          	lb	x2,0(x18)
    1082:	0100                	.insn	2, 0x0100
    1084:	0705                	.insn	2, 0x0705
    1086:	0306                	.insn	2, 0x0306
    1088:	0900                	.insn	2, 0x0900
    108a:	0000                	.insn	2, 0x
    108c:	0501                	.insn	2, 0x0501
    108e:	0608                	.insn	2, 0x0608
    1090:	04090a03          	lb	x20,64(x18)
    1094:	0100                	.insn	2, 0x0100
    1096:	0b05                	.insn	2, 0x0b05
    1098:	0306                	.insn	2, 0x0306
    109a:	0900                	.insn	2, 0x0900
    109c:	0000                	.insn	2, 0x
    109e:	0501                	.insn	2, 0x0501
    10a0:	0014                	.insn	2, 0x0014
    10a2:	0402                	.insn	2, 0x0402
    10a4:	0301                	.insn	2, 0x0301
    10a6:	0900                	.insn	2, 0x0900
    10a8:	0004                	.insn	2, 0x0004
    10aa:	0501                	.insn	2, 0x0501
    10ac:	0605                	.insn	2, 0x0605
    10ae:	04090203          	lb	x4,64(x18)
    10b2:	0100                	.insn	2, 0x0100
    10b4:	00090103          	lb	x2,0(x18)
    10b8:	0100                	.insn	2, 0x0100
    10ba:	00090003          	lb	x0,0(x18)
    10be:	0100                	.insn	2, 0x0100
    10c0:	00090003          	lb	x0,0(x18)
    10c4:	0100                	.insn	2, 0x0100
    10c6:	10090003          	lb	x0,256(x18)
    10ca:	0100                	.insn	2, 0x0100
    10cc:	04090003          	lb	x0,64(x18)
    10d0:	0100                	.insn	2, 0x0100
    10d2:	00090003          	lb	x0,0(x18)
    10d6:	0100                	.insn	2, 0x0100
    10d8:	0805                	.insn	2, 0x0805
    10da:	00090503          	lb	x10,0(x18)
    10de:	0100                	.insn	2, 0x0100
    10e0:	00090203          	lb	x4,0(x18)
    10e4:	0100                	.insn	2, 0x0100
    10e6:	0505                	.insn	2, 0x0505
    10e8:	00090203          	lb	x4,0(x18)
    10ec:	0100                	.insn	2, 0x0100
    10ee:	00090103          	lb	x2,0(x18)
    10f2:	0100                	.insn	2, 0x0100
    10f4:	00090103          	lb	x2,0(x18)
    10f8:	0100                	.insn	2, 0x0100
    10fa:	0d05                	.insn	2, 0x0d05
    10fc:	0306                	.insn	2, 0x0306
    10fe:	0900                	.insn	2, 0x0900
    1100:	0000                	.insn	2, 0x
    1102:	0501                	.insn	2, 0x0501
    1104:	0004                	.insn	2, 0x0004
    1106:	0402                	.insn	2, 0x0402
    1108:	0304                	.insn	2, 0x0304
    110a:	000c0967          	jalr	x18,0(x24)
    110e:	0001                	.insn	2, 0x0001
    1110:	0402                	.insn	2, 0x0402
    1112:	0900030b          	.insn	4, 0x0900030b
    1116:	0004                	.insn	2, 0x0004
    1118:	0001                	.insn	2, 0x0001
    111a:	0402                	.insn	2, 0x0402
    111c:	0304                	.insn	2, 0x0304
    111e:	0900                	.insn	2, 0x0900
    1120:	0004                	.insn	2, 0x0004
    1122:	0001                	.insn	2, 0x0001
    1124:	0402                	.insn	2, 0x0402
    1126:	030a                	.insn	2, 0x030a
    1128:	0900                	.insn	2, 0x0900
    112a:	0004                	.insn	2, 0x0004
    112c:	0501                	.insn	2, 0x0501
    112e:	0608                	.insn	2, 0x0608
    1130:	08091e03          	lh	x28,128(x18)
    1134:	0100                	.insn	2, 0x0100
    1136:	00090303          	lb	x6,0(x18)
    113a:	0100                	.insn	2, 0x0100
    113c:	00090203          	lb	x4,0(x18)
    1140:	0100                	.insn	2, 0x0100
    1142:	1105                	.insn	2, 0x1105
    1144:	0306                	.insn	2, 0x0306
    1146:	0900                	.insn	2, 0x0900
    1148:	0000                	.insn	2, 0x
    114a:	0501                	.insn	2, 0x0501
    114c:	031e                	.insn	2, 0x031e
    114e:	0900                	.insn	2, 0x0900
    1150:	0004                	.insn	2, 0x0004
    1152:	0501                	.insn	2, 0x0501
    1154:	0900030b          	.insn	4, 0x0900030b
    1158:	0004                	.insn	2, 0x0004
    115a:	0501                	.insn	2, 0x0501
    115c:	0608                	.insn	2, 0x0608
    115e:	04090103          	lb	x2,64(x18)
    1162:	0100                	.insn	2, 0x0100
    1164:	0b05                	.insn	2, 0x0b05
    1166:	0306                	.insn	2, 0x0306
    1168:	0901                	.insn	2, 0x0901
    116a:	0000                	.insn	2, 0x
    116c:	0501                	.insn	2, 0x0501
    116e:	031e                	.insn	2, 0x031e
    1170:	0901                	.insn	2, 0x0901
    1172:	0004                	.insn	2, 0x0004
    1174:	0501                	.insn	2, 0x0501
    1176:	0311                	.insn	2, 0x0311
    1178:	0900                	.insn	2, 0x0900
    117a:	0004                	.insn	2, 0x0004
    117c:	0501                	.insn	2, 0x0501
    117e:	0308                	.insn	2, 0x0308
    1180:	00040903          	lb	x18,0(x8)
    1184:	0501                	.insn	2, 0x0501
    1186:	097d030b          	.insn	4, 0x097d030b
    118a:	0004                	.insn	2, 0x0004
    118c:	0301                	.insn	2, 0x0301
    118e:	0901                	.insn	2, 0x0901
    1190:	0004                	.insn	2, 0x0004
    1192:	0501                	.insn	2, 0x0501
    1194:	0308                	.insn	2, 0x0308
    1196:	0902                	.insn	2, 0x0902
    1198:	0004                	.insn	2, 0x0004
    119a:	0501                	.insn	2, 0x0501
    119c:	097b030b          	.insn	4, 0x097b030b
    11a0:	000c                	.insn	2, 0x000c
    11a2:	0501                	.insn	2, 0x0501
    11a4:	0608                	.insn	2, 0x0608
    11a6:	04090103          	lb	x2,64(x18)
    11aa:	0100                	.insn	2, 0x0100
    11ac:	00090103          	lb	x2,0(x18)
    11b0:	0100                	.insn	2, 0x0100
    11b2:	00090103          	lb	x2,0(x18)
    11b6:	0100                	.insn	2, 0x0100
    11b8:	00090203          	lb	x4,0(x18)
    11bc:	0100                	.insn	2, 0x0100
    11be:	00090003          	lb	x0,0(x18)
    11c2:	0100                	.insn	2, 0x0100
    11c4:	00090003          	lb	x0,0(x18)
    11c8:	0100                	.insn	2, 0x0100
    11ca:	00090003          	lb	x0,0(x18)
    11ce:	0100                	.insn	2, 0x0100
    11d0:	00090003          	lb	x0,0(x18)
    11d4:	0100                	.insn	2, 0x0100
    11d6:	04090003          	lb	x0,64(x18)
    11da:	0100                	.insn	2, 0x0100
    11dc:	00090003          	lb	x0,0(x18)
    11e0:	0100                	.insn	2, 0x0100
    11e2:	0c090003          	lb	x0,192(x18)
    11e6:	0100                	.insn	2, 0x0100
    11e8:	0c090003          	lb	x0,192(x18)
    11ec:	0100                	.insn	2, 0x0100
    11ee:	18090003          	lb	x0,384(x18)
    11f2:	0100                	.insn	2, 0x0100
    11f4:	0200                	.insn	2, 0x0200
    11f6:	0104                	.insn	2, 0x0104
    11f8:	08090003          	lb	x0,128(x18)
    11fc:	0100                	.insn	2, 0x0100
    11fe:	0200                	.insn	2, 0x0200
    1200:	0104                	.insn	2, 0x0104
    1202:	08090003          	lb	x0,128(x18)
    1206:	0100                	.insn	2, 0x0100
    1208:	0200                	.insn	2, 0x0200
    120a:	0304                	.insn	2, 0x0304
    120c:	04090003          	lb	x0,64(x18)
    1210:	0100                	.insn	2, 0x0100
    1212:	0200                	.insn	2, 0x0200
    1214:	0504                	.insn	2, 0x0504
    1216:	04090003          	lb	x0,64(x18)
    121a:	0100                	.insn	2, 0x0100
    121c:	0200                	.insn	2, 0x0200
    121e:	0704                	.insn	2, 0x0704
    1220:	08090003          	lb	x0,128(x18)
    1224:	0100                	.insn	2, 0x0100
    1226:	0200                	.insn	2, 0x0200
    1228:	0704                	.insn	2, 0x0704
    122a:	04090003          	lb	x0,64(x18)
    122e:	0100                	.insn	2, 0x0100
    1230:	0200                	.insn	2, 0x0200
    1232:	0704                	.insn	2, 0x0704
    1234:	00090003          	lb	x0,0(x18)
    1238:	0100                	.insn	2, 0x0100
    123a:	0200                	.insn	2, 0x0200
    123c:	0704                	.insn	2, 0x0704
    123e:	14090003          	lb	x0,320(x18)
    1242:	0100                	.insn	2, 0x0100
    1244:	0200                	.insn	2, 0x0200
    1246:	0704                	.insn	2, 0x0704
    1248:	10090003          	lb	x0,256(x18)
    124c:	0100                	.insn	2, 0x0100
    124e:	0200                	.insn	2, 0x0200
    1250:	0704                	.insn	2, 0x0704
    1252:	18090003          	lb	x0,384(x18)
    1256:	0100                	.insn	2, 0x0100
    1258:	0200                	.insn	2, 0x0200
    125a:	0804                	.insn	2, 0x0804
    125c:	08090003          	lb	x0,128(x18)
    1260:	0100                	.insn	2, 0x0100
    1262:	0200                	.insn	2, 0x0200
    1264:	0804                	.insn	2, 0x0804
    1266:	08090003          	lb	x0,128(x18)
    126a:	0100                	.insn	2, 0x0100
    126c:	0200                	.insn	2, 0x0200
    126e:	0a04                	.insn	2, 0x0a04
    1270:	04090003          	lb	x0,64(x18)
    1274:	0100                	.insn	2, 0x0100
    1276:	0200                	.insn	2, 0x0200
    1278:	0c04                	.insn	2, 0x0c04
    127a:	04090003          	lb	x0,64(x18)
    127e:	0100                	.insn	2, 0x0100
    1280:	0200                	.insn	2, 0x0200
    1282:	0e04                	.insn	2, 0x0e04
    1284:	08090003          	lb	x0,128(x18)
    1288:	0100                	.insn	2, 0x0100
    128a:	0306                	.insn	2, 0x0306
    128c:	0901                	.insn	2, 0x0901
    128e:	0000                	.insn	2, 0x
    1290:	0001                	.insn	2, 0x0001
    1292:	0402                	.insn	2, 0x0402
    1294:	030e                	.insn	2, 0x030e
    1296:	097f 0004 0301 0901 	.insn	10, 0x0008090103010004097f
    129e:	0008 
    12a0:	0001                	.insn	2, 0x0001
    12a2:	0402                	.insn	2, 0x0402
    12a4:	030e                	.insn	2, 0x030e
    12a6:	097f 000c 0001 0402 	.insn	10, 0x060e04020001000c097f
    12ae:	060e 
    12b0:	04090003          	lb	x0,64(x18)
    12b4:	0100                	.insn	2, 0x0100
    12b6:	0200                	.insn	2, 0x0200
    12b8:	0e04                	.insn	2, 0x0e04
    12ba:	00090003          	lb	x0,0(x18)
    12be:	0100                	.insn	2, 0x0100
    12c0:	0200                	.insn	2, 0x0200
    12c2:	0e04                	.insn	2, 0x0e04
    12c4:	00090003          	lb	x0,0(x18)
    12c8:	0100                	.insn	2, 0x0100
    12ca:	00090103          	lb	x2,0(x18)
    12ce:	0100                	.insn	2, 0x0100
    12d0:	00090003          	lb	x0,0(x18)
    12d4:	0100                	.insn	2, 0x0100
    12d6:	00090003          	lb	x0,0(x18)
    12da:	0100                	.insn	2, 0x0100
    12dc:	00090003          	lb	x0,0(x18)
    12e0:	0100                	.insn	2, 0x0100
    12e2:	00090003          	lb	x0,0(x18)
    12e6:	0100                	.insn	2, 0x0100
    12e8:	04090003          	lb	x0,64(x18)
    12ec:	0100                	.insn	2, 0x0100
    12ee:	00090003          	lb	x0,0(x18)
    12f2:	0100                	.insn	2, 0x0100
    12f4:	04090003          	lb	x0,64(x18)
    12f8:	0100                	.insn	2, 0x0100
    12fa:	00090003          	lb	x0,0(x18)
    12fe:	0100                	.insn	2, 0x0100
    1300:	04090003          	lb	x0,64(x18)
    1304:	0100                	.insn	2, 0x0100
    1306:	04090003          	lb	x0,64(x18)
    130a:	0100                	.insn	2, 0x0100
    130c:	04090003          	lb	x0,64(x18)
    1310:	0100                	.insn	2, 0x0100
    1312:	04090003          	lb	x0,64(x18)
    1316:	0100                	.insn	2, 0x0100
    1318:	00090003          	lb	x0,0(x18)
    131c:	0100                	.insn	2, 0x0100
    131e:	08090003          	lb	x0,128(x18)
    1322:	0100                	.insn	2, 0x0100
    1324:	00090003          	lb	x0,0(x18)
    1328:	0100                	.insn	2, 0x0100
    132a:	04090003          	lb	x0,64(x18)
    132e:	0100                	.insn	2, 0x0100
    1330:	04090003          	lb	x0,64(x18)
    1334:	0100                	.insn	2, 0x0100
    1336:	00090003          	lb	x0,0(x18)
    133a:	0100                	.insn	2, 0x0100
    133c:	08090003          	lb	x0,128(x18)
    1340:	0100                	.insn	2, 0x0100
    1342:	00090003          	lb	x0,0(x18)
    1346:	0100                	.insn	2, 0x0100
    1348:	04090003          	lb	x0,64(x18)
    134c:	0100                	.insn	2, 0x0100
    134e:	04090003          	lb	x0,64(x18)
    1352:	0100                	.insn	2, 0x0100
    1354:	00090003          	lb	x0,0(x18)
    1358:	0100                	.insn	2, 0x0100
    135a:	08090003          	lb	x0,128(x18)
    135e:	0100                	.insn	2, 0x0100
    1360:	00090003          	lb	x0,0(x18)
    1364:	0100                	.insn	2, 0x0100
    1366:	04090003          	lb	x0,64(x18)
    136a:	0100                	.insn	2, 0x0100
    136c:	10090003          	lb	x0,256(x18)
    1370:	0100                	.insn	2, 0x0100
    1372:	00090003          	lb	x0,0(x18)
    1376:	0100                	.insn	2, 0x0100
    1378:	00090003          	lb	x0,0(x18)
    137c:	0100                	.insn	2, 0x0100
    137e:	0200                	.insn	2, 0x0200
    1380:	0104                	.insn	2, 0x0104
    1382:	04090003          	lb	x0,64(x18)
    1386:	0100                	.insn	2, 0x0100
    1388:	0200                	.insn	2, 0x0200
    138a:	0304                	.insn	2, 0x0304
    138c:	04090003          	lb	x0,64(x18)
    1390:	0100                	.insn	2, 0x0100
    1392:	0200                	.insn	2, 0x0200
    1394:	0304                	.insn	2, 0x0304
    1396:	08090003          	lb	x0,128(x18)
    139a:	0100                	.insn	2, 0x0100
    139c:	0200                	.insn	2, 0x0200
    139e:	0304                	.insn	2, 0x0304
    13a0:	18090003          	lb	x0,384(x18)
    13a4:	0100                	.insn	2, 0x0100
    13a6:	00090203          	lb	x4,0(x18)
    13aa:	0100                	.insn	2, 0x0100
    13ac:	0b05                	.insn	2, 0x0b05
    13ae:	0306                	.insn	2, 0x0306
    13b0:	0900                	.insn	2, 0x0900
    13b2:	0000                	.insn	2, 0x
    13b4:	0501                	.insn	2, 0x0501
    13b6:	0014                	.insn	2, 0x0014
    13b8:	0402                	.insn	2, 0x0402
    13ba:	0301                	.insn	2, 0x0301
    13bc:	0900                	.insn	2, 0x0900
    13be:	0004                	.insn	2, 0x0004
    13c0:	0501                	.insn	2, 0x0501
    13c2:	0021                	.insn	2, 0x0021
    13c4:	0402                	.insn	2, 0x0402
    13c6:	0302                	.insn	2, 0x0302
    13c8:	0900                	.insn	2, 0x0900
    13ca:	0004                	.insn	2, 0x0004
    13cc:	0501                	.insn	2, 0x0501
    13ce:	0605                	.insn	2, 0x0605
    13d0:	04090203          	lb	x4,64(x18)
    13d4:	0100                	.insn	2, 0x0100
    13d6:	00090103          	lb	x2,0(x18)
    13da:	0100                	.insn	2, 0x0100
    13dc:	00090003          	lb	x0,0(x18)
    13e0:	0100                	.insn	2, 0x0100
    13e2:	00090003          	lb	x0,0(x18)
    13e6:	0100                	.insn	2, 0x0100
    13e8:	10090003          	lb	x0,256(x18)
    13ec:	0100                	.insn	2, 0x0100
    13ee:	04090003          	lb	x0,64(x18)
    13f2:	0100                	.insn	2, 0x0100
    13f4:	0200                	.insn	2, 0x0200
    13f6:	0104                	.insn	2, 0x0104
    13f8:	00090003          	lb	x0,0(x18)
    13fc:	0100                	.insn	2, 0x0100
    13fe:	0805                	.insn	2, 0x0805
    1400:	00090303          	lb	x6,0(x18)
    1404:	0100                	.insn	2, 0x0100
    1406:	00090303          	lb	x6,0(x18)
    140a:	0100                	.insn	2, 0x0100
    140c:	0505                	.insn	2, 0x0505
    140e:	00090203          	lb	x4,0(x18)
    1412:	0100                	.insn	2, 0x0100
    1414:	00090003          	lb	x0,0(x18)
    1418:	0100                	.insn	2, 0x0100
    141a:	00090003          	lb	x0,0(x18)
    141e:	0100                	.insn	2, 0x0100
    1420:	04090003          	lb	x0,64(x18)
    1424:	0100                	.insn	2, 0x0100
    1426:	0c090003          	lb	x0,192(x18)
    142a:	0100                	.insn	2, 0x0100
    142c:	00090003          	lb	x0,0(x18)
    1430:	0100                	.insn	2, 0x0100
    1432:	00090103          	lb	x2,0(x18)
    1436:	0100                	.insn	2, 0x0100
    1438:	1405                	.insn	2, 0x1405
    143a:	0306                	.insn	2, 0x0306
    143c:	0900                	.insn	2, 0x0900
    143e:	0000                	.insn	2, 0x
    1440:	0501                	.insn	2, 0x0501
    1442:	0320                	.insn	2, 0x0320
    1444:	0900                	.insn	2, 0x0900
    1446:	0004                	.insn	2, 0x0004
    1448:	0501                	.insn	2, 0x0501
    144a:	0605                	.insn	2, 0x0605
    144c:	04090103          	lb	x2,64(x18)
    1450:	0100                	.insn	2, 0x0100
    1452:	00090103          	lb	x2,0(x18)
    1456:	0100                	.insn	2, 0x0100
    1458:	0d05                	.insn	2, 0x0d05
    145a:	0306                	.insn	2, 0x0306
    145c:	0900                	.insn	2, 0x0900
    145e:	0000                	.insn	2, 0x
    1460:	0901                	.insn	2, 0x0901
    1462:	000c                	.insn	2, 0x000c
    1464:	0100                	.insn	2, 0x0100
    1466:	3b01                	.insn	2, 0x3b01
    1468:	0000                	.insn	2, 0x
    146a:	0500                	.insn	2, 0x0500
    146c:	0400                	.insn	2, 0x0400
    146e:	3300                	.insn	2, 0x3300
    1470:	0000                	.insn	2, 0x
    1472:	0100                	.insn	2, 0x0100
    1474:	0101                	.insn	2, 0x0101
    1476:	000d0efb          	.insn	4, 0x000d0efb
    147a:	0101                	.insn	2, 0x0101
    147c:	0101                	.insn	2, 0x0101
    147e:	0000                	.insn	2, 0x
    1480:	0100                	.insn	2, 0x0100
    1482:	0000                	.insn	2, 0x
    1484:	0101                	.insn	2, 0x0101
    1486:	1f01                	.insn	2, 0x1f01
    1488:	0002                	.insn	2, 0x0002
    148a:	0000                	.insn	2, 0x
    148c:	c400                	.insn	2, 0xc400
    148e:	0000                	.insn	2, 0x
    1490:	0200                	.insn	2, 0x0200
    1492:	1f01                	.insn	2, 0x1f01
    1494:	0f02                	.insn	2, 0x0f02
    1496:	0000ba03          	.insn	4, 0xba03
    149a:	0100                	.insn	2, 0x0100
    149c:	00e0                	.insn	2, 0x00e0
    149e:	0000                	.insn	2, 0x
    14a0:	ba01                	.insn	2, 0xba01
    14a2:	0000                	.insn	2, 0x
    14a4:	0100                	.insn	2, 0x0100

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
  9c:	2e2e0053          	.insn	4, 0x2e2e0053
  a0:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
  a4:	2e2e                	.insn	2, 0x2e2e
  a6:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
  aa:	2e2e                	.insn	2, 0x2e2e
  ac:	672f2e2f          	.insn	4, 0x672f2e2f
  b0:	6c2f6363          	bltu	x30,x2,776 <_heap_size+0x776>
  b4:	6269                	.insn	2, 0x6269
  b6:	2f636367          	.insn	4, 0x2f636367
  ba:	696c                	.insn	2, 0x696c
  bc:	6762                	.insn	2, 0x6762
  be:	2e326363          	bltu	x4,x3,3a4 <_heap_size+0x3a4>
  c2:	2e2e0063          	beq	x28,x2,3a2 <_heap_size+0x3a2>
  c6:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
  ca:	2e2e                	.insn	2, 0x2e2e
  cc:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
  d0:	2e2e                	.insn	2, 0x2e2e
  d2:	672f2e2f          	.insn	4, 0x672f2e2f
  d6:	6c2f6363          	bltu	x30,x2,79c <_heap_size+0x79c>
  da:	6269                	.insn	2, 0x6269
  dc:	00636367          	.insn	4, 0x00636367
  e0:	696c                	.insn	2, 0x696c
  e2:	6762                	.insn	2, 0x6762
  e4:	2e326363          	bltu	x4,x3,3ca <_heap_size+0x3ca>
  e8:	0068                	.insn	2, 0x0068

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
      10:	f800                	.insn	2, 0xf800
      12:	0021                	.insn	2, 0x0021
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
      2a:	21f8                	.insn	2, 0x21f8
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
      42:	221c                	.insn	2, 0x221c
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
      5c:	221c                	.insn	2, 0x221c
      5e:	8000                	.insn	2, 0x8000
      60:	0184                	.insn	2, 0x0184
      62:	ee02                	.insn	2, 0xee02
      64:	0000                	.insn	2, 0x
      66:	5d00                	.insn	2, 0x5d00
      68:	2224                	.insn	2, 0x2224
      6a:	8000                	.insn	2, 0x8000
      6c:	0248                	.insn	2, 0x0248
      6e:	00e5                	.insn	2, 0x00e5
      70:	0000                	.insn	2, 0x
      72:	245d                	.insn	2, 0x245d
      74:	0022                	.insn	2, 0x0022
      76:	4880                	.insn	2, 0x4880
      78:	f802                	.insn	2, 0xf802
      7a:	0000                	.insn	2, 0x
      7c:	5d00                	.insn	2, 0x5d00
      7e:	226c                	.insn	2, 0x226c
      80:	8000                	.insn	2, 0x8000
      82:	0210                	.insn	2, 0x0210
      84:	0102                	.insn	2, 0x0102
      86:	0000                	.insn	2, 0x
      88:	a05d                	.insn	2, 0xa05d
      8a:	0022                	.insn	2, 0x0022
      8c:	3080                	.insn	2, 0x3080
      8e:	094a0003          	lb	x0,148(x20)
      92:	0000                	.insn	2, 0x
      94:	0005                	.insn	2, 0x0005
      96:	0401                	.insn	2, 0x0401
      98:	0050                	.insn	2, 0x0050
      9a:	0000                	.insn	2, 0x
      9c:	9e14                	.insn	2, 0x9e14
      9e:	0001                	.insn	2, 0x0001
      a0:	1d00                	.insn	2, 0x1d00
      a2:	009e                	.insn	2, 0x009e
      a4:	0000                	.insn	2, 0x
      a6:	0000                	.insn	2, 0x
      a8:	0000                	.insn	2, 0x
      aa:	651c                	.insn	2, 0x651c
      ac:	8000                	.insn	2, 0x8000
      ae:	05c4                	.insn	2, 0x05c4
      b0:	0000                	.insn	2, 0x
      b2:	01cd                	.insn	2, 0x01cd
      b4:	0000                	.insn	2, 0x
      b6:	0805                	.insn	2, 0x0805
      b8:	00015907          	.insn	4, 0x00015907
      bc:	1500                	.insn	2, 0x1500
      be:	0504                	.insn	2, 0x0504
      c0:	6e69                	.insn	2, 0x6e69
      c2:	0074                	.insn	2, 0x0074
      c4:	0405                	.insn	2, 0x0405
      c6:	00016307          	.insn	4, 0x00016307
      ca:	0500                	.insn	2, 0x0500
      cc:	0508                	.insn	2, 0x0508
      ce:	0000014b          	.insn	4, 0x014b
      d2:	1005                	.insn	2, 0x1005
      d4:	e704                	.insn	2, 0xe704
      d6:	0002                	.insn	2, 0x0002
      d8:	0500                	.insn	2, 0x0500
      da:	0601                	.insn	2, 0x0601
      dc:	0192                	.insn	2, 0x0192
      de:	0000                	.insn	2, 0x
      e0:	0105                	.insn	2, 0x0105
      e2:	9008                	.insn	2, 0x9008
      e4:	0001                	.insn	2, 0x0001
      e6:	0500                	.insn	2, 0x0500
      e8:	0502                	.insn	2, 0x0502
      ea:	0000012b          	.insn	4, 0x012b
      ee:	0205                	.insn	2, 0x0205
      f0:	00029407          	.insn	4, 0x00029407
      f4:	0500                	.insn	2, 0x0500
      f6:	0504                	.insn	2, 0x0504
      f8:	0150                	.insn	2, 0x0150
      fa:	0000                	.insn	2, 0x
      fc:	0405                	.insn	2, 0x0405
      fe:	00015e07          	.insn	4, 0x00015e07
     102:	0500                	.insn	2, 0x0500
     104:	0801                	.insn	2, 0x0801
     106:	0199                	.insn	2, 0x0199
     108:	0000                	.insn	2, 0x
     10a:	8308                	.insn	2, 0x8308
     10c:	0002                	.insn	2, 0x0002
     10e:	7b00                	.insn	2, 0x7b00
     110:	5016                	.insn	2, 0x5016
     112:	0000                	.insn	2, 0x
     114:	0c00                	.insn	2, 0x0c00
     116:	007a                	.insn	2, 0x007a
     118:	0000                	.insn	2, 0x
     11a:	f408                	.insn	2, 0xf408
     11c:	0002                	.insn	2, 0x0002
     11e:	8000                	.insn	2, 0x8000
     120:	00002d0f          	.insn	4, 0x2d0f
     124:	0800                	.insn	2, 0x0800
     126:	000002f3          	.insn	4, 0x02f3
     12a:	1681                	.insn	2, 0x1681
     12c:	0034                	.insn	2, 0x0034
     12e:	0000                	.insn	2, 0x
     130:	a808                	.insn	2, 0xa808
     132:	0002                	.insn	2, 0x0002
     134:	8400                	.insn	2, 0x8400
     136:	00003b0f          	.insn	4, 0x3b0f
     13a:	0800                	.insn	2, 0x0800
     13c:	000002a7          	.insn	4, 0x02a7
     140:	1685                	.insn	2, 0x1685
     142:	0026                	.insn	2, 0x0026
     144:	0000                	.insn	2, 0x
     146:	0205                	.insn	2, 0x0205
     148:	8704                	.insn	2, 0x8704
     14a:	0001                	.insn	2, 0x0001
     14c:	0500                	.insn	2, 0x0500
     14e:	0304                	.insn	2, 0x0304
     150:	017f 0000 0405 2504 	.insn	10, 0x0001250404050000017f
     158:	0001 
     15a:	0500                	.insn	2, 0x0500
     15c:	0308                	.insn	2, 0x0308
     15e:	011d                	.insn	2, 0x011d
     160:	0000                	.insn	2, 0x
     162:	0805                	.insn	2, 0x0805
     164:	ec04                	.insn	2, 0xec04
     166:	0002                	.insn	2, 0x0002
     168:	0500                	.insn	2, 0x0500
     16a:	0310                	.insn	2, 0x0310
     16c:	02be                	.insn	2, 0x02be
     16e:	0000                	.insn	2, 0x
     170:	2005                	.insn	2, 0x2005
     172:	0002df03          	lhu	x30,0(x5)
     176:	1600                	.insn	2, 0x1600
     178:	0000028b          	.insn	4, 0x028b
     17c:	0208                	.insn	2, 0x0208
     17e:	01f1                	.insn	2, 0x01f1
     180:	120a                	.insn	2, 0x120a
     182:	0001                	.insn	2, 0x0001
     184:	1700                	.insn	2, 0x1700
     186:	6f6c                	.insn	2, 0x6f6c
     188:	f1020077          	.insn	4, 0xf1020077
     18c:	1a01                	.insn	2, 0x1a01
     18e:	008a                	.insn	2, 0x008a
     190:	0000                	.insn	2, 0x
     192:	1800                	.insn	2, 0x1800
     194:	0170                	.insn	2, 0x0170
     196:	0000                	.insn	2, 0x
     198:	f102                	.insn	2, 0xf102
     19a:	1f01                	.insn	2, 0x1f01
     19c:	008a                	.insn	2, 0x008a
     19e:	0000                	.insn	2, 0x
     1a0:	0004                	.insn	2, 0x0004
     1a2:	0819                	.insn	2, 0x0819
     1a4:	f802                	.insn	2, 0xf802
     1a6:	0901                	.insn	2, 0x0901
     1a8:	0132                	.insn	2, 0x0132
     1aa:	0000                	.insn	2, 0x
     1ac:	7312                	.insn	2, 0x7312
     1ae:	fa00                	.insn	2, 0xfa00
     1b0:	1301                	.insn	2, 0x1301
     1b2:	000000e7          	jalr	x1,0(x0) # 0 <_heap_size>
     1b6:	6c12                	.insn	2, 0x6c12
     1b8:	006c                	.insn	2, 0x006c
     1ba:	a00a01fb          	.insn	4, 0xa00a01fb
     1be:	0000                	.insn	2, 0x
     1c0:	0000                	.insn	2, 0x
     1c2:	0b1a                	.insn	2, 0x0b1a
     1c4:	0001                	.insn	2, 0x0001
     1c6:	0200                	.insn	2, 0x0200
     1c8:	01fc                	.insn	2, 0x01fc
     1ca:	00011203          	lh	x4,0(x2)
     1ce:	0c00                	.insn	2, 0x0c00
     1d0:	0132                	.insn	2, 0x0132
     1d2:	0000                	.insn	2, 0x
     1d4:	0000851b          	.insn	4, 0x851b
     1d8:	5400                	.insn	2, 0x5400
     1da:	0001                	.insn	2, 0x0001
     1dc:	1c00                	.insn	2, 0x1c00
     1de:	0034                	.insn	2, 0x0034
     1e0:	0000                	.insn	2, 0x
     1e2:	00ff 440c 0001 1d00 	.insn	10, 0x01751d000001440c00ff
     1ea:	0175 
     1ec:	0000                	.insn	2, 0x
     1ee:	0602                	.insn	2, 0x0602
     1f0:	1602                	.insn	2, 0x1602
     1f2:	0154                	.insn	2, 0x0154
     1f4:	0000                	.insn	2, 0x
     1f6:	131e                	.insn	2, 0x131e
     1f8:	0001                	.insn	2, 0x0001
     1fa:	0100                	.insn	2, 0x0100
     1fc:	0512                	.insn	2, 0x0512
     1fe:	ab01                	.insn	2, 0xab01
     200:	0000                	.insn	2, 0x
     202:	1c00                	.insn	2, 0x1c00
     204:	0065                	.insn	2, 0x0065
     206:	c480                	.insn	2, 0xc480
     208:	0005                	.insn	2, 0x0005
     20a:	0100                	.insn	2, 0x0100
     20c:	8c9c                	.insn	2, 0x8c9c
     20e:	0005                	.insn	2, 0x0005
     210:	1300                	.insn	2, 0x1300
     212:	006e                	.insn	2, 0x006e
     214:	ab14                	.insn	2, 0xab14
     216:	0000                	.insn	2, 0x
     218:	0c00                	.insn	2, 0x0c00
     21a:	0000                	.insn	2, 0x
     21c:	1300                	.insn	2, 0x1300
     21e:	0064                	.insn	2, 0x0064
     220:	ab1f 0000 9000      	.insn	6, 0x90000000ab1f
     226:	0000                	.insn	2, 0x
     228:	1f00                	.insn	2, 0x1f00
     22a:	058c                	.insn	2, 0x058c
     22c:	0000                	.insn	2, 0x
     22e:	651c                	.insn	2, 0x651c
     230:	8000                	.insn	2, 0x8000
     232:	000c                	.insn	2, 0x000c
     234:	0000                	.insn	2, 0x
     236:	1401                	.insn	2, 0x1401
     238:	0a05                	.insn	2, 0x0a05
     23a:	ae0d                	.insn	2, 0xae0d
     23c:	0005                	.insn	2, 0x0005
     23e:	fc00                	.insn	2, 0xfc00
     240:	0000                	.insn	2, 0x
     242:	0d00                	.insn	2, 0x0d00
     244:	05a6                	.insn	2, 0x05a6
     246:	0000                	.insn	2, 0x
     248:	010c                	.insn	2, 0x010c
     24a:	0000                	.insn	2, 0x
     24c:	9e0d                	.insn	2, 0x9e0d
     24e:	0005                	.insn	2, 0x0005
     250:	5300                	.insn	2, 0x5300
     252:	0001                	.insn	2, 0x0001
     254:	2000                	.insn	2, 0x2000
     256:	0019                	.insn	2, 0x0019
     258:	0000                	.insn	2, 0x
     25a:	0005b70b          	.insn	4, 0x0005b70b
     25e:	0b00                	.insn	2, 0x0b00
     260:	05c2                	.insn	2, 0x05c2
     262:	0000                	.insn	2, 0x
     264:	0005cd0b          	.insn	4, 0x0005cd0b
     268:	0100                	.insn	2, 0x0100
     26a:	05d8                	.insn	2, 0x05d8
     26c:	0000                	.insn	2, 0x
     26e:	000001b3          	add	x3,x0,x0
     272:	e301                	.insn	2, 0xe301
     274:	0005                	.insn	2, 0x0005
     276:	0100                	.insn	2, 0x0100
     278:	0002                	.insn	2, 0x0002
     27a:	0100                	.insn	2, 0x0100
     27c:	05ee                	.insn	2, 0x05ee
     27e:	0000                	.insn	2, 0x
     280:	0231                	.insn	2, 0x0231
     282:	0000                	.insn	2, 0x
     284:	f901                	.insn	2, 0xf901
     286:	0005                	.insn	2, 0x0005
     288:	7c00                	.insn	2, 0x7c00
     28a:	0002                	.insn	2, 0x0002
     28c:	0100                	.insn	2, 0x0100
     28e:	0604                	.insn	2, 0x0604
     290:	0000                	.insn	2, 0x
     292:	02c9                	.insn	2, 0x02c9
     294:	0000                	.insn	2, 0x
     296:	0f01                	.insn	2, 0x0f01
     298:	0006                	.insn	2, 0x0006
     29a:	d800                	.insn	2, 0xd800
     29c:	0002                	.insn	2, 0x0002
     29e:	0100                	.insn	2, 0x0100
     2a0:	061a                	.insn	2, 0x061a
     2a2:	0000                	.insn	2, 0x
     2a4:	000002e7          	jalr	x5,0(x0) # 0 <_heap_size>
     2a8:	2501                	.insn	2, 0x2501
     2aa:	0006                	.insn	2, 0x0006
     2ac:	fe00                	.insn	2, 0xfe00
     2ae:	0002                	.insn	2, 0x0002
     2b0:	0100                	.insn	2, 0x0100
     2b2:	0000062f          	.insn	4, 0x062f
     2b6:	030d                	.insn	2, 0x030d
     2b8:	0000                	.insn	2, 0x
     2ba:	00063a0b          	.insn	4, 0x00063a0b
     2be:	0900                	.insn	2, 0x0900
     2c0:	0645                	.insn	2, 0x0645
     2c2:	0000                	.insn	2, 0x
     2c4:	0000002b          	.insn	4, 0x002b
     2c8:	0000024f          	.insn	4, 0x024f
     2cc:	4a01                	.insn	2, 0x4a01
     2ce:	0006                	.insn	2, 0x0006
     2d0:	3000                	.insn	2, 0x3000
     2d2:	01000003          	lb	x0,16(x0) # 10 <_heap_size+0x10>
     2d6:	0656                	.insn	2, 0x0656
     2d8:	0000                	.insn	2, 0x
     2da:	0354                	.insn	2, 0x0354
     2dc:	0000                	.insn	2, 0x
     2de:	0a00                	.insn	2, 0x0a00
     2e0:	00000663          	beq	x0,x0,2ec <_heap_size+0x2ec>
     2e4:	65b0                	.insn	2, 0x65b0
     2e6:	8000                	.insn	2, 0x8000
     2e8:	00c8                	.insn	2, 0x00c8
     2ea:	0000                	.insn	2, 0x
     2ec:	02d6                	.insn	2, 0x02d6
     2ee:	0000                	.insn	2, 0x
     2f0:	6801                	.insn	2, 0x6801
     2f2:	0006                	.insn	2, 0x0006
     2f4:	5a00                	.insn	2, 0x5a00
     2f6:	01000003          	lb	x0,16(x0) # 10 <_heap_size+0x10>
     2fa:	0674                	.insn	2, 0x0674
     2fc:	0000                	.insn	2, 0x
     2fe:	0362                	.insn	2, 0x0362
     300:	0000                	.insn	2, 0x
     302:	8001                	.insn	2, 0x8001
     304:	0006                	.insn	2, 0x0006
     306:	7700                	.insn	2, 0x7700
     308:	01000003          	lb	x0,16(x0) # 10 <_heap_size+0x10>
     30c:	068c                	.insn	2, 0x068c
     30e:	0000                	.insn	2, 0x
     310:	0394                	.insn	2, 0x0394
     312:	0000                	.insn	2, 0x
     314:	9801                	.insn	2, 0x9801
     316:	0006                	.insn	2, 0x0006
     318:	b100                	.insn	2, 0xb100
     31a:	01000003          	lb	x0,16(x0) # 10 <_heap_size+0x10>
     31e:	06a4                	.insn	2, 0x06a4
     320:	0000                	.insn	2, 0x
     322:	03e1                	.insn	2, 0x03e1
     324:	0000                	.insn	2, 0x
     326:	b001                	.insn	2, 0xb001
     328:	0006                	.insn	2, 0x0006
     32a:	f500                	.insn	2, 0xf500
     32c:	04000003          	lb	x0,64(x0) # 40 <_heap_size+0x40>
     330:	65c4                	.insn	2, 0x65c4
     332:	8000                	.insn	2, 0x8000
     334:	0932                	.insn	2, 0x0932
     336:	0000                	.insn	2, 0x
     338:	d804                	.insn	2, 0xd804
     33a:	0065                	.insn	2, 0x0065
     33c:	3b80                	.insn	2, 0x3b80
     33e:	0009                	.insn	2, 0x0009
     340:	0400                	.insn	2, 0x0400
     342:	65e8                	.insn	2, 0x65e8
     344:	8000                	.insn	2, 0x8000
     346:	0944                	.insn	2, 0x0944
     348:	0000                	.insn	2, 0x
     34a:	2404                	.insn	2, 0x2404
     34c:	0066                	.insn	2, 0x0066
     34e:	3280                	.insn	2, 0x3280
     350:	0009                	.insn	2, 0x0009
     352:	0400                	.insn	2, 0x0400
     354:	6634                	.insn	2, 0x6634
     356:	8000                	.insn	2, 0x8000
     358:	0000093b          	.insn	4, 0x093b
     35c:	4404                	.insn	2, 0x4404
     35e:	0066                	.insn	2, 0x0066
     360:	4480                	.insn	2, 0x4480
     362:	0009                	.insn	2, 0x0009
     364:	0000                	.insn	2, 0x
     366:	bf09                	.insn	2, 0xbf09
     368:	37000007          	.insn	4, 0x37000007
     36c:	0000                	.insn	2, 0x
     36e:	4300                	.insn	2, 0x4300
     370:	0004                	.insn	2, 0x0004
     372:	0100                	.insn	2, 0x0100
     374:	07c0                	.insn	2, 0x07c0
     376:	0000                	.insn	2, 0x
     378:	0000040b          	.insn	4, 0x040b
     37c:	cb01                	.insn	2, 0xcb01
     37e:	13000007          	.insn	4, 0x13000007
     382:	0004                	.insn	2, 0x0004
     384:	0900                	.insn	2, 0x0900
     386:	07d6                	.insn	2, 0x07d6
     388:	0000                	.insn	2, 0x
     38a:	0042                	.insn	2, 0x0042
     38c:	0000                	.insn	2, 0x
     38e:	0378                	.insn	2, 0x0378
     390:	0000                	.insn	2, 0x
     392:	db01                	.insn	2, 0xdb01
     394:	45000007          	.insn	4, 0x45000007
     398:	0004                	.insn	2, 0x0004
     39a:	0100                	.insn	2, 0x0100
     39c:	000007e7          	jalr	x15,0(x0) # 0 <_heap_size>
     3a0:	0454                	.insn	2, 0x0454
     3a2:	0000                	.insn	2, 0x
     3a4:	f301                	.insn	2, 0xf301
     3a6:	69000007          	.insn	4, 0x69000007
     3aa:	0004                	.insn	2, 0x0004
     3ac:	0100                	.insn	2, 0x0100
     3ae:	07ff 0000 0486 0000 	.insn	10, 0x0b0100000486000007ff
     3b6:	0b01 
     3b8:	0008                	.insn	2, 0x0008
     3ba:	a300                	.insn	2, 0xa300
     3bc:	0004                	.insn	2, 0x0004
     3be:	0100                	.insn	2, 0x0100
     3c0:	00000817          	auipc	x16,0x0
     3c4:	04df 0000 2301      	.insn	6, 0x2301000004df
     3ca:	0008                	.insn	2, 0x0008
     3cc:	0a00                	.insn	2, 0x0a00
     3ce:	0005                	.insn	2, 0x0005
     3d0:	0400                	.insn	2, 0x0400
     3d2:	6974                	.insn	2, 0x6974
     3d4:	8000                	.insn	2, 0x8000
     3d6:	0932                	.insn	2, 0x0932
     3d8:	0000                	.insn	2, 0x
     3da:	8404                	.insn	2, 0x8404
     3dc:	0069                	.insn	2, 0x0069
     3de:	3b80                	.insn	2, 0x3b80
     3e0:	0009                	.insn	2, 0x0009
     3e2:	0400                	.insn	2, 0x0400
     3e4:	6994                	.insn	2, 0x6994
     3e6:	8000                	.insn	2, 0x8000
     3e8:	0944                	.insn	2, 0x0944
     3ea:	0000                	.insn	2, 0x
     3ec:	d004                	.insn	2, 0xd004
     3ee:	0069                	.insn	2, 0x0069
     3f0:	3280                	.insn	2, 0x3280
     3f2:	0009                	.insn	2, 0x0009
     3f4:	0400                	.insn	2, 0x0400
     3f6:	69e0                	.insn	2, 0x69e0
     3f8:	8000                	.insn	2, 0x8000
     3fa:	0000093b          	.insn	4, 0x093b
     3fe:	f004                	.insn	2, 0xf004
     400:	0069                	.insn	2, 0x0069
     402:	4480                	.insn	2, 0x4480
     404:	0009                	.insn	2, 0x0009
     406:	0000                	.insn	2, 0x
     408:	300e                	.insn	2, 0x300e
     40a:	0008                	.insn	2, 0x0008
     40c:	5c00                	.insn	2, 0x5c00
     40e:	0000                	.insn	2, 0x
     410:	0100                	.insn	2, 0x0100
     412:	0835                	.insn	2, 0x0835
     414:	0000                	.insn	2, 0x
     416:	00000527          	.insn	4, 0x0527
     41a:	4101                	.insn	2, 0x4101
     41c:	0008                	.insn	2, 0x0008
     41e:	3600                	.insn	2, 0x3600
     420:	0005                	.insn	2, 0x0005
     422:	0100                	.insn	2, 0x0100
     424:	084d                	.insn	2, 0x084d
     426:	0000                	.insn	2, 0x
     428:	055a                	.insn	2, 0x055a
     42a:	0000                	.insn	2, 0x
     42c:	5901                	.insn	2, 0x5901
     42e:	0008                	.insn	2, 0x0008
     430:	6200                	.insn	2, 0x6200
     432:	0005                	.insn	2, 0x0005
     434:	0100                	.insn	2, 0x0100
     436:	0865                	.insn	2, 0x0865
     438:	0000                	.insn	2, 0x
     43a:	0571                	.insn	2, 0x0571
     43c:	0000                	.insn	2, 0x
     43e:	7101                	.insn	2, 0x7101
     440:	0008                	.insn	2, 0x0008
     442:	a900                	.insn	2, 0xa900
     444:	0005                	.insn	2, 0x0005
     446:	0100                	.insn	2, 0x0100
     448:	087d                	.insn	2, 0x087d
     44a:	0000                	.insn	2, 0x
     44c:	05b1                	.insn	2, 0x05b1
     44e:	0000                	.insn	2, 0x
     450:	8901                	.insn	2, 0x8901
     452:	0008                	.insn	2, 0x0008
     454:	b900                	.insn	2, 0xb900
     456:	0005                	.insn	2, 0x0005
     458:	0a00                	.insn	2, 0x0a00
     45a:	0895                	.insn	2, 0x0895
     45c:	0000                	.insn	2, 0x
     45e:	6a44                	.insn	2, 0x6a44
     460:	8000                	.insn	2, 0x8000
     462:	0010                	.insn	2, 0x0010
     464:	0000                	.insn	2, 0x
     466:	03e9                	.insn	2, 0x03e9
     468:	0000                	.insn	2, 0x
     46a:	00089a07          	.insn	4, 0x00089a07
     46e:	0100                	.insn	2, 0x0100
     470:	075a                	.insn	2, 0x075a
     472:	08a6                	.insn	2, 0x08a6
     474:	0000                	.insn	2, 0x
     476:	5b01                	.insn	2, 0x5b01
     478:	0a00                	.insn	2, 0x0a00
     47a:	000008b3          	add	x17,x0,x0
     47e:	6a54                	.insn	2, 0x6a54
     480:	8000                	.insn	2, 0x8000
     482:	0010                	.insn	2, 0x0010
     484:	0000                	.insn	2, 0x
     486:	0409                	.insn	2, 0x0409
     488:	0000                	.insn	2, 0x
     48a:	0008b807          	.insn	4, 0x0008b807
     48e:	0100                	.insn	2, 0x0100
     490:	075a                	.insn	2, 0x075a
     492:	08c4                	.insn	2, 0x08c4
     494:	0000                	.insn	2, 0x
     496:	5b01                	.insn	2, 0x5b01
     498:	0a00                	.insn	2, 0x0a00
     49a:	08d1                	.insn	2, 0x08d1
     49c:	0000                	.insn	2, 0x
     49e:	6a64                	.insn	2, 0x6a64
     4a0:	8000                	.insn	2, 0x8000
     4a2:	0010                	.insn	2, 0x0010
     4a4:	0000                	.insn	2, 0x
     4a6:	0429                	.insn	2, 0x0429
     4a8:	0000                	.insn	2, 0x
     4aa:	0008d607          	.insn	4, 0x0008d607
     4ae:	0100                	.insn	2, 0x0100
     4b0:	075a                	.insn	2, 0x075a
     4b2:	08e2                	.insn	2, 0x08e2
     4b4:	0000                	.insn	2, 0x
     4b6:	5b01                	.insn	2, 0x5b01
     4b8:	0e00                	.insn	2, 0x0e00
     4ba:	000008ef          	jal	x17,4ba <_heap_size+0x4ba>
     4be:	0076                	.insn	2, 0x0076
     4c0:	0000                	.insn	2, 0x
     4c2:	0008f007          	.insn	4, 0x0008f007
     4c6:	0100                	.insn	2, 0x0100
     4c8:	075a                	.insn	2, 0x075a
     4ca:	08fc                	.insn	2, 0x08fc
     4cc:	0000                	.insn	2, 0x
     4ce:	5b01                	.insn	2, 0x5b01
     4d0:	0000                	.insn	2, 0x
     4d2:	0900                	.insn	2, 0x0900
     4d4:	06bd                	.insn	2, 0x06bd
     4d6:	0000                	.insn	2, 0x
     4d8:	0081                	.insn	2, 0x0081
     4da:	0000                	.insn	2, 0x
     4dc:	00000463          	beq	x0,x0,4e4 <_heap_size+0x4e4>
     4e0:	c201                	.insn	2, 0xc201
     4e2:	0006                	.insn	2, 0x0006
     4e4:	c100                	.insn	2, 0xc100
     4e6:	0005                	.insn	2, 0x0005
     4e8:	0100                	.insn	2, 0x0100
     4ea:	06ce                	.insn	2, 0x06ce
     4ec:	0000                	.insn	2, 0x
     4ee:	05d0                	.insn	2, 0x05d0
     4f0:	0000                	.insn	2, 0x
     4f2:	0a00                	.insn	2, 0x0a00
     4f4:	0735                	.insn	2, 0x0735
     4f6:	0000                	.insn	2, 0x
     4f8:	66d4                	.insn	2, 0x66d4
     4fa:	8000                	.insn	2, 0x8000
     4fc:	00c8                	.insn	2, 0x00c8
     4fe:	0000                	.insn	2, 0x
     500:	04ea                	.insn	2, 0x04ea
     502:	0000                	.insn	2, 0x
     504:	3a01                	.insn	2, 0x3a01
     506:	d8000007          	.insn	4, 0xd8000007
     50a:	0005                	.insn	2, 0x0005
     50c:	0100                	.insn	2, 0x0100
     50e:	0746                	.insn	2, 0x0746
     510:	0000                	.insn	2, 0x
     512:	05e0                	.insn	2, 0x05e0
     514:	0000                	.insn	2, 0x
     516:	5201                	.insn	2, 0x5201
     518:	f5000007          	.insn	4, 0xf5000007
     51c:	0005                	.insn	2, 0x0005
     51e:	0100                	.insn	2, 0x0100
     520:	075e                	.insn	2, 0x075e
     522:	0000                	.insn	2, 0x
     524:	0612                	.insn	2, 0x0612
     526:	0000                	.insn	2, 0x
     528:	6a01                	.insn	2, 0x6a01
     52a:	2f000007          	.insn	4, 0x2f000007
     52e:	0006                	.insn	2, 0x0006
     530:	0100                	.insn	2, 0x0100
     532:	0776                	.insn	2, 0x0776
     534:	0000                	.insn	2, 0x
     536:	065f 0000 8201      	.insn	6, 0x82010000065f
     53c:	73000007          	.insn	4, 0x73000007
     540:	0006                	.insn	2, 0x0006
     542:	0400                	.insn	2, 0x0400
     544:	66e8                	.insn	2, 0x66e8
     546:	8000                	.insn	2, 0x8000
     548:	0932                	.insn	2, 0x0932
     54a:	0000                	.insn	2, 0x
     54c:	fc04                	.insn	2, 0xfc04
     54e:	0066                	.insn	2, 0x0066
     550:	3b80                	.insn	2, 0x3b80
     552:	0009                	.insn	2, 0x0009
     554:	0400                	.insn	2, 0x0400
     556:	670c                	.insn	2, 0x670c
     558:	8000                	.insn	2, 0x8000
     55a:	0944                	.insn	2, 0x0944
     55c:	0000                	.insn	2, 0x
     55e:	4804                	.insn	2, 0x4804
     560:	32800067          	jalr	x0,808(x0) # 328 <_heap_size+0x328>
     564:	0009                	.insn	2, 0x0009
     566:	0400                	.insn	2, 0x0400
     568:	6758                	.insn	2, 0x6758
     56a:	8000                	.insn	2, 0x8000
     56c:	0000093b          	.insn	4, 0x093b
     570:	6804                	.insn	2, 0x6804
     572:	44800067          	jalr	x0,1096(x0) # 448 <_heap_size+0x448>
     576:	0009                	.insn	2, 0x0009
     578:	0000                	.insn	2, 0x
     57a:	db09                	.insn	2, 0xdb09
     57c:	0006                	.insn	2, 0x0006
     57e:	9100                	.insn	2, 0x9100
     580:	0000                	.insn	2, 0x
     582:	6d00                	.insn	2, 0x6d00
     584:	0005                	.insn	2, 0x0005
     586:	0100                	.insn	2, 0x0100
     588:	06e0                	.insn	2, 0x06e0
     58a:	0000                	.insn	2, 0x
     58c:	0690                	.insn	2, 0x0690
     58e:	0000                	.insn	2, 0x
     590:	ec01                	.insn	2, 0xec01
     592:	0006                	.insn	2, 0x0006
     594:	9800                	.insn	2, 0x9800
     596:	0006                	.insn	2, 0x0006
     598:	0100                	.insn	2, 0x0100
     59a:	06f8                	.insn	2, 0x06f8
     59c:	0000                	.insn	2, 0x
     59e:	06ad                	.insn	2, 0x06ad
     5a0:	0000                	.insn	2, 0x
     5a2:	0401                	.insn	2, 0x0401
     5a4:	ca000007          	.insn	4, 0xca000007
     5a8:	0006                	.insn	2, 0x0006
     5aa:	0100                	.insn	2, 0x0100
     5ac:	0710                	.insn	2, 0x0710
     5ae:	0000                	.insn	2, 0x
     5b0:	000006e7          	jalr	x13,0(x0) # 0 <_heap_size>
     5b4:	1c01                	.insn	2, 0x1c01
     5b6:	17000007          	.insn	4, 0x17000007
     5ba:	01000007          	.insn	4, 0x01000007
     5be:	0728                	.insn	2, 0x0728
     5c0:	0000                	.insn	2, 0x
     5c2:	0749                	.insn	2, 0x0749
     5c4:	0000                	.insn	2, 0x
     5c6:	1804                	.insn	2, 0x1804
     5c8:	0068                	.insn	2, 0x0068
     5ca:	3280                	.insn	2, 0x3280
     5cc:	0009                	.insn	2, 0x0009
     5ce:	0400                	.insn	2, 0x0400
     5d0:	682c                	.insn	2, 0x682c
     5d2:	8000                	.insn	2, 0x8000
     5d4:	0000093b          	.insn	4, 0x093b
     5d8:	3c04                	.insn	2, 0x3c04
     5da:	0068                	.insn	2, 0x0068
     5dc:	4480                	.insn	2, 0x4480
     5de:	0009                	.insn	2, 0x0009
     5e0:	0400                	.insn	2, 0x0400
     5e2:	6878                	.insn	2, 0x6878
     5e4:	8000                	.insn	2, 0x8000
     5e6:	0932                	.insn	2, 0x0932
     5e8:	0000                	.insn	2, 0x
     5ea:	8804                	.insn	2, 0x8804
     5ec:	0068                	.insn	2, 0x0068
     5ee:	3b80                	.insn	2, 0x3b80
     5f0:	0009                	.insn	2, 0x0009
     5f2:	0400                	.insn	2, 0x0400
     5f4:	6898                	.insn	2, 0x6898
     5f6:	8000                	.insn	2, 0x8000
     5f8:	0944                	.insn	2, 0x0944
     5fa:	0000                	.insn	2, 0x
     5fc:	0e00                	.insn	2, 0x0e00
     5fe:	0000078f          	.insn	4, 0x078f
     602:	009c                	.insn	2, 0x009c
     604:	0000                	.insn	2, 0x
     606:	9401                	.insn	2, 0x9401
     608:	5f000007          	.insn	4, 0x5f000007
     60c:	01000007          	.insn	4, 0x01000007
     610:	07a0                	.insn	2, 0x07a0
     612:	0000                	.insn	2, 0x
     614:	00000767          	jalr	x14,0(x0) # 0 <_heap_size>
     618:	0000                	.insn	2, 0x
     61a:	0000                	.insn	2, 0x
     61c:	d221                	.insn	2, 0xd221
     61e:	0002                	.insn	2, 0x0002
     620:	0100                	.insn	2, 0x0100
     622:	ab0103e3          	beq	x2,x16,c8 <_heap_size+0xc8>
     626:	0000                	.insn	2, 0x
     628:	0300                	.insn	2, 0x0300
     62a:	092c                	.insn	2, 0x092c
     62c:	0000                	.insn	2, 0x
     62e:	17006e0f          	.insn	4, 0x17006e0f
     632:	000000ab          	.insn	4, 0x00ab
     636:	2200640f          	.insn	4, 0x2200640f
     63a:	000000ab          	.insn	4, 0x00ab
     63e:	0070720f          	.insn	4, 0x0070720f
     642:	2c2e                	.insn	2, 0x2c2e
     644:	0009                	.insn	2, 0x0009
     646:	0300                	.insn	2, 0x0300
     648:	6e6e                	.insn	2, 0x6e6e
     64a:	e500                	.insn	2, 0xe500
     64c:	013f1103          	lh	x2,19(x30)
     650:	0000                	.insn	2, 0x
     652:	00646403          	.insn	4, 0x00646403
     656:	03e6                	.insn	2, 0x03e6
     658:	3f11                	.insn	2, 0x3f11
     65a:	0001                	.insn	2, 0x0001
     65c:	0300                	.insn	2, 0x0300
     65e:	7272                	.insn	2, 0x7272
     660:	e700                	.insn	2, 0xe700
     662:	01320b03          	lb	x22,19(x4) # 13 <_heap_size+0x13>
     666:	0000                	.insn	2, 0x
     668:	00306403          	.insn	4, 0x00306403
     66c:	03e8                	.insn	2, 0x03e8
     66e:	950a                	.insn	2, 0x950a
     670:	0000                	.insn	2, 0x
     672:	0300                	.insn	2, 0x0300
     674:	3164                	.insn	2, 0x3164
     676:	e800                	.insn	2, 0xe800
     678:	00950e03          	lb	x28,9(x10)
     67c:	0000                	.insn	2, 0x
     67e:	00306e03          	.insn	4, 0x00306e03
     682:	03e8                	.insn	2, 0x03e8
     684:	9512                	.insn	2, 0x9512
     686:	0000                	.insn	2, 0x
     688:	0300                	.insn	2, 0x0300
     68a:	316e                	.insn	2, 0x316e
     68c:	e800                	.insn	2, 0xe800
     68e:	00951603          	lh	x12,9(x10)
     692:	0000                	.insn	2, 0x
     694:	00326e03          	.insn	4, 0x00326e03
     698:	03e8                	.insn	2, 0x03e8
     69a:	951a                	.insn	2, 0x951a
     69c:	0000                	.insn	2, 0x
     69e:	0300                	.insn	2, 0x0300
     6a0:	3071                	.insn	2, 0x3071
     6a2:	e900                	.insn	2, 0xe900
     6a4:	00950a03          	lb	x20,9(x10)
     6a8:	0000                	.insn	2, 0x
     6aa:	00317103          	.insn	4, 0x00317103
     6ae:	03e9                	.insn	2, 0x03e9
     6b0:	950e                	.insn	2, 0x950e
     6b2:	0000                	.insn	2, 0x
     6b4:	0300                	.insn	2, 0x0300
     6b6:	0062                	.insn	2, 0x0062
     6b8:	03ea                	.insn	2, 0x03ea
     6ba:	950a                	.insn	2, 0x950a
     6bc:	0000                	.insn	2, 0x
     6be:	0300                	.insn	2, 0x0300
     6c0:	6d62                	.insn	2, 0x6d62
     6c2:	ea00                	.insn	2, 0xea00
     6c4:	00950d03          	lb	x26,9(x10)
     6c8:	0000                	.insn	2, 0x
     6ca:	00777703          	.insn	4, 0x00777703
     6ce:	3f1104b3          	.insn	4, 0x3f1104b3
     6d2:	0001                	.insn	2, 0x0001
     6d4:	0600                	.insn	2, 0x0600
     6d6:	00000663          	beq	x0,x0,6e2 <_heap_size+0x6e2>
     6da:	fb02                	.insn	2, 0xfb02
     6dc:	0002                	.insn	2, 0x0002
     6de:	1a00                	.insn	2, 0x1a00
     6e0:	0404                	.insn	2, 0x0404
     6e2:	0095                	.insn	2, 0x0095
     6e4:	0000                	.insn	2, 0x
     6e6:	615f5f03          	lhu	x30,1557(x30)
     6ea:	1a00                	.insn	2, 0x1a00
     6ec:	0404                	.insn	2, 0x0404
     6ee:	0095                	.insn	2, 0x0095
     6f0:	0000                	.insn	2, 0x
     6f2:	0600                	.insn	2, 0x0600
     6f4:	06bd                	.insn	2, 0x06bd
     6f6:	0000                	.insn	2, 0x
     6f8:	b902                	.insn	2, 0xb902
     6fa:	0002                	.insn	2, 0x0002
     6fc:	2600                	.insn	2, 0x2600
     6fe:	0404                	.insn	2, 0x0404
     700:	0095                	.insn	2, 0x0095
     702:	0000                	.insn	2, 0x
     704:	3502                	.insn	2, 0x3502
     706:	0001                	.insn	2, 0x0001
     708:	2600                	.insn	2, 0x2600
     70a:	0404                	.insn	2, 0x0404
     70c:	0095                	.insn	2, 0x0095
     70e:	0000                	.insn	2, 0x
     710:	b402                	.insn	2, 0xb402
     712:	0002                	.insn	2, 0x0002
     714:	2600                	.insn	2, 0x2600
     716:	0404                	.insn	2, 0x0404
     718:	0095                	.insn	2, 0x0095
     71a:	0000                	.insn	2, 0x
     71c:	af02                	.insn	2, 0xaf02
     71e:	0002                	.insn	2, 0x0002
     720:	2600                	.insn	2, 0x2600
     722:	0404                	.insn	2, 0x0404
     724:	0095                	.insn	2, 0x0095
     726:	0000                	.insn	2, 0x
     728:	0502                	.insn	2, 0x0502
     72a:	26000003          	lb	x0,608(x0) # 260 <_heap_size+0x260>
     72e:	0404                	.insn	2, 0x0404
     730:	0095                	.insn	2, 0x0095
     732:	0000                	.insn	2, 0x
     734:	0002                	.insn	2, 0x0002
     736:	26000003          	lb	x0,608(x0) # 260 <_heap_size+0x260>
     73a:	0404                	.insn	2, 0x0404
     73c:	0095                	.insn	2, 0x0095
     73e:	0000                	.insn	2, 0x
     740:	6d5f5f03          	lhu	x30,1749(x30)
     744:	2600                	.insn	2, 0x2600
     746:	0404                	.insn	2, 0x0404
     748:	0095                	.insn	2, 0x0095
     74a:	0000                	.insn	2, 0x
     74c:	0600                	.insn	2, 0x0600
     74e:	000006db          	.insn	4, 0x06db
     752:	fb02                	.insn	2, 0xfb02
     754:	0002                	.insn	2, 0x0002
     756:	3200                	.insn	2, 0x3200
     758:	0404                	.insn	2, 0x0404
     75a:	0095                	.insn	2, 0x0095
     75c:	0000                	.insn	2, 0x
     75e:	615f5f03          	lhu	x30,1557(x30)
     762:	3200                	.insn	2, 0x3200
     764:	0404                	.insn	2, 0x0404
     766:	0095                	.insn	2, 0x0095
     768:	0000                	.insn	2, 0x
     76a:	0600                	.insn	2, 0x0600
     76c:	0735                	.insn	2, 0x0735
     76e:	0000                	.insn	2, 0x
     770:	b902                	.insn	2, 0xb902
     772:	0002                	.insn	2, 0x0002
     774:	4b00                	.insn	2, 0x4b00
     776:	0804                	.insn	2, 0x0804
     778:	0095                	.insn	2, 0x0095
     77a:	0000                	.insn	2, 0x
     77c:	3502                	.insn	2, 0x3502
     77e:	0001                	.insn	2, 0x0001
     780:	4b00                	.insn	2, 0x4b00
     782:	0804                	.insn	2, 0x0804
     784:	0095                	.insn	2, 0x0095
     786:	0000                	.insn	2, 0x
     788:	b402                	.insn	2, 0xb402
     78a:	0002                	.insn	2, 0x0002
     78c:	4b00                	.insn	2, 0x4b00
     78e:	0804                	.insn	2, 0x0804
     790:	0095                	.insn	2, 0x0095
     792:	0000                	.insn	2, 0x
     794:	af02                	.insn	2, 0xaf02
     796:	0002                	.insn	2, 0x0002
     798:	4b00                	.insn	2, 0x4b00
     79a:	0804                	.insn	2, 0x0804
     79c:	0095                	.insn	2, 0x0095
     79e:	0000                	.insn	2, 0x
     7a0:	0502                	.insn	2, 0x0502
     7a2:	4b000003          	lb	x0,1200(x0) # 4b0 <_heap_size+0x4b0>
     7a6:	0804                	.insn	2, 0x0804
     7a8:	0095                	.insn	2, 0x0095
     7aa:	0000                	.insn	2, 0x
     7ac:	0002                	.insn	2, 0x0002
     7ae:	4b000003          	lb	x0,1200(x0) # 4b0 <_heap_size+0x4b0>
     7b2:	0804                	.insn	2, 0x0804
     7b4:	0095                	.insn	2, 0x0095
     7b6:	0000                	.insn	2, 0x
     7b8:	6d5f5f03          	lhu	x30,1749(x30)
     7bc:	4b00                	.insn	2, 0x4b00
     7be:	0804                	.insn	2, 0x0804
     7c0:	0095                	.insn	2, 0x0095
     7c2:	0000                	.insn	2, 0x
     7c4:	0600                	.insn	2, 0x0600
     7c6:	0000078f          	.insn	4, 0x078f
     7ca:	b902                	.insn	2, 0xb902
     7cc:	0002                	.insn	2, 0x0002
     7ce:	5000                	.insn	2, 0x5000
     7d0:	0404                	.insn	2, 0x0404
     7d2:	0095                	.insn	2, 0x0095
     7d4:	0000                	.insn	2, 0x
     7d6:	3502                	.insn	2, 0x3502
     7d8:	0001                	.insn	2, 0x0001
     7da:	5000                	.insn	2, 0x5000
     7dc:	0404                	.insn	2, 0x0404
     7de:	0095                	.insn	2, 0x0095
     7e0:	0000                	.insn	2, 0x
     7e2:	b402                	.insn	2, 0xb402
     7e4:	0002                	.insn	2, 0x0002
     7e6:	5000                	.insn	2, 0x5000
     7e8:	0404                	.insn	2, 0x0404
     7ea:	0095                	.insn	2, 0x0095
     7ec:	0000                	.insn	2, 0x
     7ee:	af02                	.insn	2, 0xaf02
     7f0:	0002                	.insn	2, 0x0002
     7f2:	5000                	.insn	2, 0x5000
     7f4:	0404                	.insn	2, 0x0404
     7f6:	0095                	.insn	2, 0x0095
     7f8:	0000                	.insn	2, 0x
     7fa:	0502                	.insn	2, 0x0502
     7fc:	50000003          	lb	x0,1280(x0) # 500 <_heap_size+0x500>
     800:	0404                	.insn	2, 0x0404
     802:	0095                	.insn	2, 0x0095
     804:	0000                	.insn	2, 0x
     806:	0002                	.insn	2, 0x0002
     808:	50000003          	lb	x0,1280(x0) # 500 <_heap_size+0x500>
     80c:	0404                	.insn	2, 0x0404
     80e:	0095                	.insn	2, 0x0095
     810:	0000                	.insn	2, 0x
     812:	6d5f5f03          	lhu	x30,1749(x30)
     816:	5000                	.insn	2, 0x5000
     818:	0404                	.insn	2, 0x0404
     81a:	0095                	.insn	2, 0x0095
     81c:	0000                	.insn	2, 0x
     81e:	0600                	.insn	2, 0x0600
     820:	07ad                	.insn	2, 0x07ad
     822:	0000                	.insn	2, 0x
     824:	fb02                	.insn	2, 0xfb02
     826:	0002                	.insn	2, 0x0002
     828:	7300                	.insn	2, 0x7300
     82a:	0404                	.insn	2, 0x0404
     82c:	0095                	.insn	2, 0x0095
     82e:	0000                	.insn	2, 0x
     830:	615f5f03          	lhu	x30,1557(x30)
     834:	7300                	.insn	2, 0x7300
     836:	0404                	.insn	2, 0x0404
     838:	0095                	.insn	2, 0x0095
     83a:	0000                	.insn	2, 0x
     83c:	0600                	.insn	2, 0x0600
     83e:	000007bf 785f5f03 	.insn	8, 0x785f5f03000007bf
     846:	8100                	.insn	2, 0x8100
     848:	0504                	.insn	2, 0x0504
     84a:	0095                	.insn	2, 0x0095
     84c:	0000                	.insn	2, 0x
     84e:	1000                	.insn	2, 0x1000
     850:	00316d03          	.insn	4, 0x00316d03
     854:	0491                	.insn	2, 0x0491
     856:	0000950f          	.insn	4, 0x950f
     85a:	0300                	.insn	2, 0x0300
     85c:	306d                	.insn	2, 0x306d
     85e:	9100                	.insn	2, 0x9100
     860:	1304                	.insn	2, 0x1304
     862:	0095                	.insn	2, 0x0095
     864:	0000                	.insn	2, 0x
     866:	3006                	.insn	2, 0x3006
     868:	0008                	.insn	2, 0x0008
     86a:	0200                	.insn	2, 0x0200
     86c:	02b9                	.insn	2, 0x02b9
     86e:	0000                	.insn	2, 0x
     870:	049c                	.insn	2, 0x049c
     872:	9508                	.insn	2, 0x9508
     874:	0000                	.insn	2, 0x
     876:	0200                	.insn	2, 0x0200
     878:	0135                	.insn	2, 0x0135
     87a:	0000                	.insn	2, 0x
     87c:	049c                	.insn	2, 0x049c
     87e:	9508                	.insn	2, 0x9508
     880:	0000                	.insn	2, 0x
     882:	0200                	.insn	2, 0x0200
     884:	02b4                	.insn	2, 0x02b4
     886:	0000                	.insn	2, 0x
     888:	049c                	.insn	2, 0x049c
     88a:	9508                	.insn	2, 0x9508
     88c:	0000                	.insn	2, 0x
     88e:	0200                	.insn	2, 0x0200
     890:	000002af          	.insn	4, 0x02af
     894:	049c                	.insn	2, 0x049c
     896:	9508                	.insn	2, 0x9508
     898:	0000                	.insn	2, 0x
     89a:	0200                	.insn	2, 0x0200
     89c:	0305                	.insn	2, 0x0305
     89e:	0000                	.insn	2, 0x
     8a0:	049c                	.insn	2, 0x049c
     8a2:	9508                	.insn	2, 0x9508
     8a4:	0000                	.insn	2, 0x
     8a6:	0200                	.insn	2, 0x0200
     8a8:	0300                	.insn	2, 0x0300
     8aa:	0000                	.insn	2, 0x
     8ac:	049c                	.insn	2, 0x049c
     8ae:	9508                	.insn	2, 0x9508
     8b0:	0000                	.insn	2, 0x
     8b2:	0300                	.insn	2, 0x0300
     8b4:	5f5f 006d 049c      	.insn	6, 0x049c006d5f5f
     8ba:	9508                	.insn	2, 0x9508
     8bc:	0000                	.insn	2, 0x
     8be:	0000                	.insn	2, 0x
     8c0:	0a06                	.insn	2, 0x0a06
     8c2:	0009                	.insn	2, 0x0009
     8c4:	0200                	.insn	2, 0x0200
     8c6:	0000026f          	jal	x4,8c6 <_heap_size+0x8c6>
     8ca:	049d                	.insn	2, 0x049d
     8cc:	9508                	.insn	2, 0x9508
     8ce:	0000                	.insn	2, 0x
     8d0:	0200                	.insn	2, 0x0200
     8d2:	0274                	.insn	2, 0x0274
     8d4:	0000                	.insn	2, 0x
     8d6:	049d                	.insn	2, 0x049d
     8d8:	9508                	.insn	2, 0x9508
     8da:	0000                	.insn	2, 0x
     8dc:	0200                	.insn	2, 0x0200
     8de:	0279                	.insn	2, 0x0279
     8e0:	0000                	.insn	2, 0x
     8e2:	049d                	.insn	2, 0x049d
     8e4:	9508                	.insn	2, 0x9508
     8e6:	0000                	.insn	2, 0x
     8e8:	0200                	.insn	2, 0x0200
     8ea:	027e                	.insn	2, 0x027e
     8ec:	0000                	.insn	2, 0x
     8ee:	049d                	.insn	2, 0x049d
     8f0:	9508                	.insn	2, 0x9508
     8f2:	0000                	.insn	2, 0x
     8f4:	0200                	.insn	2, 0x0200
     8f6:	0000030f          	.insn	4, 0x030f
     8fa:	049d                	.insn	2, 0x049d
     8fc:	9508                	.insn	2, 0x9508
     8fe:	0000                	.insn	2, 0x
     900:	0200                	.insn	2, 0x0200
     902:	02cd                	.insn	2, 0x02cd
     904:	0000                	.insn	2, 0x
     906:	049d                	.insn	2, 0x049d
     908:	9508                	.insn	2, 0x9508
     90a:	0000                	.insn	2, 0x
     90c:	0200                	.insn	2, 0x0200
     90e:	030a                	.insn	2, 0x030a
     910:	0000                	.insn	2, 0x
     912:	049d                	.insn	2, 0x049d
     914:	9508                	.insn	2, 0x9508
     916:	0000                	.insn	2, 0x
     918:	0200                	.insn	2, 0x0200
     91a:	013a                	.insn	2, 0x013a
     91c:	0000                	.insn	2, 0x
     91e:	049d                	.insn	2, 0x049d
     920:	9508                	.insn	2, 0x9508
     922:	0000                	.insn	2, 0x
     924:	0600                	.insn	2, 0x0600
     926:	000008b3          	add	x17,x0,x0
     92a:	3f02                	.insn	2, 0x3f02
     92c:	0001                	.insn	2, 0x0001
     92e:	9d00                	.insn	2, 0x9d00
     930:	0804                	.insn	2, 0x0804
     932:	0095                	.insn	2, 0x0095
     934:	0000                	.insn	2, 0x
     936:	4502                	.insn	2, 0x4502
     938:	0001                	.insn	2, 0x0001
     93a:	9d00                	.insn	2, 0x9d00
     93c:	0804                	.insn	2, 0x0804
     93e:	0095                	.insn	2, 0x0095
     940:	0000                	.insn	2, 0x
     942:	0600                	.insn	2, 0x0600
     944:	08d1                	.insn	2, 0x08d1
     946:	0000                	.insn	2, 0x
     948:	3f02                	.insn	2, 0x3f02
     94a:	0001                	.insn	2, 0x0001
     94c:	9d00                	.insn	2, 0x9d00
     94e:	0804                	.insn	2, 0x0804
     950:	0095                	.insn	2, 0x0095
     952:	0000                	.insn	2, 0x
     954:	4502                	.insn	2, 0x4502
     956:	0001                	.insn	2, 0x0001
     958:	9d00                	.insn	2, 0x9d00
     95a:	0804                	.insn	2, 0x0804
     95c:	0095                	.insn	2, 0x0095
     95e:	0000                	.insn	2, 0x
     960:	0600                	.insn	2, 0x0600
     962:	000008ef          	jal	x17,962 <_heap_size+0x962>
     966:	3f02                	.insn	2, 0x3f02
     968:	0001                	.insn	2, 0x0001
     96a:	9d00                	.insn	2, 0x9d00
     96c:	0804                	.insn	2, 0x0804
     96e:	0095                	.insn	2, 0x0095
     970:	0000                	.insn	2, 0x
     972:	4502                	.insn	2, 0x4502
     974:	0001                	.insn	2, 0x0001
     976:	9d00                	.insn	2, 0x9d00
     978:	0804                	.insn	2, 0x0804
     97a:	0095                	.insn	2, 0x0095
     97c:	0000                	.insn	2, 0x
     97e:	1000                	.insn	2, 0x1000
     980:	3f02                	.insn	2, 0x3f02
     982:	0001                	.insn	2, 0x0001
     984:	9d00                	.insn	2, 0x9d00
     986:	0804                	.insn	2, 0x0804
     988:	0095                	.insn	2, 0x0095
     98a:	0000                	.insn	2, 0x
     98c:	4502                	.insn	2, 0x4502
     98e:	0001                	.insn	2, 0x0001
     990:	9d00                	.insn	2, 0x9d00
     992:	0804                	.insn	2, 0x0804
     994:	0095                	.insn	2, 0x0095
     996:	0000                	.insn	2, 0x
     998:	0000                	.insn	2, 0x
     99a:	1c06                	.insn	2, 0x1c06
     99c:	0009                	.insn	2, 0x0009
     99e:	0300                	.insn	2, 0x0300
     9a0:	5f5f 0078 04a2      	.insn	6, 0x04a200785f5f
     9a6:	9505                	.insn	2, 0x9505
     9a8:	0000                	.insn	2, 0x
     9aa:	0000                	.insn	2, 0x
     9ac:	0310                	.insn	2, 0x0310
     9ae:	5f5f 0078 04aa      	.insn	6, 0x04aa00785f5f
     9b4:	9505                	.insn	2, 0x9505
     9b6:	0000                	.insn	2, 0x
     9b8:	0000                	.insn	2, 0x
     9ba:	0000                	.insn	2, 0x
     9bc:	0422                	.insn	2, 0x0422
     9be:	000000ab          	.insn	4, 0x00ab
     9c2:	ee11                	.insn	2, 0xee11
     9c4:	0000                	.insn	2, 0x
     9c6:	ee00                	.insn	2, 0xee00
     9c8:	0000                	.insn	2, 0x
     9ca:	1100                	.insn	2, 0x1100
     9cc:	00a4                	.insn	2, 0x00a4
     9ce:	0000                	.insn	2, 0x
     9d0:	00a4                	.insn	2, 0x00a4
     9d2:	0000                	.insn	2, 0x
     9d4:	f811                	.insn	2, 0xf811
     9d6:	0000                	.insn	2, 0x
     9d8:	f800                	.insn	2, 0xf800
     9da:	0000                	.insn	2, 0x
     9dc:	0000                	.insn	2, 0x
     9de:	095a                	.insn	2, 0x095a
     9e0:	0000                	.insn	2, 0x
     9e2:	0005                	.insn	2, 0x0005
     9e4:	0401                	.insn	2, 0x0401
     9e6:	0215                	.insn	2, 0x0215
     9e8:	0000                	.insn	2, 0x
     9ea:	9e14                	.insn	2, 0x9e14
     9ec:	0001                	.insn	2, 0x0001
     9ee:	1d00                	.insn	2, 0x1d00
     9f0:	009e                	.insn	2, 0x009e
     9f2:	0000                	.insn	2, 0x
     9f4:	0000                	.insn	2, 0x
     9f6:	0000                	.insn	2, 0x
     9f8:	6ae0                	.insn	2, 0x6ae0
     9fa:	8000                	.insn	2, 0x8000
     9fc:	04d0                	.insn	2, 0x04d0
     9fe:	0000                	.insn	2, 0x
     a00:	0b22                	.insn	2, 0x0b22
     a02:	0000                	.insn	2, 0x
     a04:	0404                	.insn	2, 0x0404
     a06:	00016307          	.insn	4, 0x00016307
     a0a:	0400                	.insn	2, 0x0400
     a0c:	0708                	.insn	2, 0x0708
     a0e:	0159                	.insn	2, 0x0159
     a10:	0000                	.insn	2, 0x
     a12:	0415                	.insn	2, 0x0415
     a14:	6905                	.insn	2, 0x6905
     a16:	746e                	.insn	2, 0x746e
     a18:	0400                	.insn	2, 0x0400
     a1a:	0508                	.insn	2, 0x0508
     a1c:	0000014b          	.insn	4, 0x014b
     a20:	1004                	.insn	2, 0x1004
     a22:	e704                	.insn	2, 0xe704
     a24:	0002                	.insn	2, 0x0002
     a26:	0400                	.insn	2, 0x0400
     a28:	0601                	.insn	2, 0x0601
     a2a:	0192                	.insn	2, 0x0192
     a2c:	0000                	.insn	2, 0x
     a2e:	0104                	.insn	2, 0x0104
     a30:	9008                	.insn	2, 0x9008
     a32:	0001                	.insn	2, 0x0001
     a34:	0400                	.insn	2, 0x0400
     a36:	0502                	.insn	2, 0x0502
     a38:	0000012b          	.insn	4, 0x012b
     a3c:	0204                	.insn	2, 0x0204
     a3e:	00029407          	.insn	4, 0x00029407
     a42:	0400                	.insn	2, 0x0400
     a44:	0504                	.insn	2, 0x0504
     a46:	0150                	.insn	2, 0x0150
     a48:	0000                	.insn	2, 0x
     a4a:	0404                	.insn	2, 0x0404
     a4c:	00015e07          	.insn	4, 0x00015e07
     a50:	0400                	.insn	2, 0x0400
     a52:	0801                	.insn	2, 0x0801
     a54:	0199                	.insn	2, 0x0199
     a56:	0000                	.insn	2, 0x
     a58:	0002830b          	.insn	4, 0x0002830b
     a5c:	7b00                	.insn	2, 0x7b00
     a5e:	5016                	.insn	2, 0x5016
     a60:	0000                	.insn	2, 0x
     a62:	0c00                	.insn	2, 0x0c00
     a64:	007a                	.insn	2, 0x007a
     a66:	0000                	.insn	2, 0x
     a68:	0002f40b          	.insn	4, 0x0002f40b
     a6c:	8000                	.insn	2, 0x8000
     a6e:	0000340f          	.insn	4, 0x340f
     a72:	0b00                	.insn	2, 0x0b00
     a74:	000002f3          	.insn	4, 0x02f3
     a78:	1681                	.insn	2, 0x1681
     a7a:	0026                	.insn	2, 0x0026
     a7c:	0000                	.insn	2, 0x
     a7e:	0002a80b          	.insn	4, 0x0002a80b
     a82:	8400                	.insn	2, 0x8400
     a84:	00003b0f          	.insn	4, 0x3b0f
     a88:	0b00                	.insn	2, 0x0b00
     a8a:	000002a7          	.insn	4, 0x02a7
     a8e:	1685                	.insn	2, 0x1685
     a90:	002d                	.insn	2, 0x002d
     a92:	0000                	.insn	2, 0x
     a94:	0204                	.insn	2, 0x0204
     a96:	8704                	.insn	2, 0x8704
     a98:	0001                	.insn	2, 0x0001
     a9a:	0400                	.insn	2, 0x0400
     a9c:	0304                	.insn	2, 0x0304
     a9e:	017f 0000 0404 2504 	.insn	10, 0x0001250404040000017f
     aa6:	0001 
     aa8:	0400                	.insn	2, 0x0400
     aaa:	0308                	.insn	2, 0x0308
     aac:	011d                	.insn	2, 0x011d
     aae:	0000                	.insn	2, 0x
     ab0:	0804                	.insn	2, 0x0804
     ab2:	ec04                	.insn	2, 0xec04
     ab4:	0002                	.insn	2, 0x0002
     ab6:	0400                	.insn	2, 0x0400
     ab8:	0310                	.insn	2, 0x0310
     aba:	02be                	.insn	2, 0x02be
     abc:	0000                	.insn	2, 0x
     abe:	2004                	.insn	2, 0x2004
     ac0:	0002df03          	lhu	x30,0(x5)
     ac4:	1600                	.insn	2, 0x1600
     ac6:	0000028b          	.insn	4, 0x028b
     aca:	0208                	.insn	2, 0x0208
     acc:	01f1                	.insn	2, 0x01f1
     ace:	120a                	.insn	2, 0x120a
     ad0:	0001                	.insn	2, 0x0001
     ad2:	1700                	.insn	2, 0x1700
     ad4:	6f6c                	.insn	2, 0x6f6c
     ad6:	f1020077          	.insn	4, 0xf1020077
     ada:	1a01                	.insn	2, 0x1a01
     adc:	008a                	.insn	2, 0x008a
     ade:	0000                	.insn	2, 0x
     ae0:	1800                	.insn	2, 0x1800
     ae2:	0170                	.insn	2, 0x0170
     ae4:	0000                	.insn	2, 0x
     ae6:	f102                	.insn	2, 0xf102
     ae8:	1f01                	.insn	2, 0x1f01
     aea:	008a                	.insn	2, 0x008a
     aec:	0000                	.insn	2, 0x
     aee:	0004                	.insn	2, 0x0004
     af0:	0819                	.insn	2, 0x0819
     af2:	f802                	.insn	2, 0xf802
     af4:	0901                	.insn	2, 0x0901
     af6:	0132                	.insn	2, 0x0132
     af8:	0000                	.insn	2, 0x
     afa:	7311                	.insn	2, 0x7311
     afc:	fa00                	.insn	2, 0xfa00
     afe:	1301                	.insn	2, 0x1301
     b00:	000000e7          	jalr	x1,0(x0) # 0 <_heap_size>
     b04:	6c11                	.insn	2, 0x6c11
     b06:	006c                	.insn	2, 0x006c
     b08:	a00a01fb          	.insn	4, 0xa00a01fb
     b0c:	0000                	.insn	2, 0x
     b0e:	0000                	.insn	2, 0x
     b10:	0b1a                	.insn	2, 0x0b1a
     b12:	0001                	.insn	2, 0x0001
     b14:	0200                	.insn	2, 0x0200
     b16:	01fc                	.insn	2, 0x01fc
     b18:	00011203          	lh	x4,0(x2)
     b1c:	0c00                	.insn	2, 0x0c00
     b1e:	0132                	.insn	2, 0x0132
     b20:	0000                	.insn	2, 0x
     b22:	0000851b          	.insn	4, 0x851b
     b26:	5400                	.insn	2, 0x5400
     b28:	0001                	.insn	2, 0x0001
     b2a:	1c00                	.insn	2, 0x1c00
     b2c:	0026                	.insn	2, 0x0026
     b2e:	0000                	.insn	2, 0x
     b30:	00ff 440c 0001 1d00 	.insn	10, 0x01751d000001440c00ff
     b38:	0175 
     b3a:	0000                	.insn	2, 0x
     b3c:	0602                	.insn	2, 0x0602
     b3e:	1602                	.insn	2, 0x1602
     b40:	0154                	.insn	2, 0x0154
     b42:	0000                	.insn	2, 0x
     b44:	141e                	.insn	2, 0x141e
     b46:	01000003          	lb	x0,16(x0) # 10 <_heap_size+0x10>
     b4a:	0506                	.insn	2, 0x0506
     b4c:	ab01                	.insn	2, 0xab01
     b4e:	0000                	.insn	2, 0x
     b50:	e000                	.insn	2, 0xe000
     b52:	006a                	.insn	2, 0x006a
     b54:	d080                	.insn	2, 0xd080
     b56:	0004                	.insn	2, 0x0004
     b58:	0100                	.insn	2, 0x0100
     b5a:	9c9c                	.insn	2, 0x9c9c
     b5c:	0005                	.insn	2, 0x0005
     b5e:	1200                	.insn	2, 0x1200
     b60:	0075                	.insn	2, 0x0075
     b62:	ab14                	.insn	2, 0xab14
     b64:	0000                	.insn	2, 0x
     b66:	8200                	.insn	2, 0x8200
     b68:	12000007          	.insn	4, 0x12000007
     b6c:	0076                	.insn	2, 0x0076
     b6e:	ab1f 0000 e200      	.insn	6, 0xe2000000ab1f
     b74:	1f000007          	.insn	4, 0x1f000007
     b78:	08010077          	.insn	4, 0x08010077
     b7c:	0b05                	.insn	2, 0x0b05
     b7e:	000000ab          	.insn	4, 0x00ab
     b82:	082a                	.insn	2, 0x082a
     b84:	0000                	.insn	2, 0x
     b86:	9c20                	.insn	2, 0x9c20
     b88:	0005                	.insn	2, 0x0005
     b8a:	e000                	.insn	2, 0xe000
     b8c:	006a                	.insn	2, 0x006a
     b8e:	b380                	.insn	2, 0xb380
     b90:	0000                	.insn	2, 0x
     b92:	0100                	.insn	2, 0x0100
     b94:	050a                	.insn	2, 0x050a
     b96:	0d0a                	.insn	2, 0x0d0a
     b98:	05be                	.insn	2, 0x05be
     b9a:	0000                	.insn	2, 0x
     b9c:	00000837          	lui	x16,0x0
     ba0:	b60d                	.insn	2, 0xb60d
     ba2:	0005                	.insn	2, 0x0005
     ba4:	4f00                	.insn	2, 0x4f00
     ba6:	0008                	.insn	2, 0x0008
     ba8:	0d00                	.insn	2, 0x0d00
     baa:	05ae                	.insn	2, 0x05ae
     bac:	0000                	.insn	2, 0x
     bae:	0896                	.insn	2, 0x0896
     bb0:	0000                	.insn	2, 0x
     bb2:	b321                	.insn	2, 0xb321
     bb4:	0000                	.insn	2, 0x
     bb6:	0800                	.insn	2, 0x0800
     bb8:	000005c7          	.insn	4, 0x05c7
     bbc:	d208                	.insn	2, 0xd208
     bbe:	0005                	.insn	2, 0x0005
     bc0:	0800                	.insn	2, 0x0800
     bc2:	05dd                	.insn	2, 0x05dd
     bc4:	0000                	.insn	2, 0x
     bc6:	e801                	.insn	2, 0xe801
     bc8:	0005                	.insn	2, 0x0005
     bca:	f600                	.insn	2, 0xf600
     bcc:	0008                	.insn	2, 0x0008
     bce:	0100                	.insn	2, 0x0100
     bd0:	000005f3          	.insn	4, 0x05f3
     bd4:	0920                	.insn	2, 0x0920
     bd6:	0000                	.insn	2, 0x
     bd8:	fe01                	.insn	2, 0xfe01
     bda:	0005                	.insn	2, 0x0005
     bdc:	5000                	.insn	2, 0x5000
     bde:	0009                	.insn	2, 0x0009
     be0:	0100                	.insn	2, 0x0100
     be2:	0609                	.insn	2, 0x0609
     be4:	0000                	.insn	2, 0x
     be6:	0000098f          	.insn	4, 0x098f
     bea:	1401                	.insn	2, 0x1401
     bec:	0006                	.insn	2, 0x0006
     bee:	eb00                	.insn	2, 0xeb00
     bf0:	0009                	.insn	2, 0x0009
     bf2:	0100                	.insn	2, 0x0100
     bf4:	061f 0000 0a01      	.insn	6, 0x0a010000061f
     bfa:	0000                	.insn	2, 0x
     bfc:	2a01                	.insn	2, 0x2a01
     bfe:	0006                	.insn	2, 0x0006
     c00:	0a00                	.insn	2, 0x0a00
     c02:	000a                	.insn	2, 0x000a
     c04:	0100                	.insn	2, 0x0100
     c06:	0635                	.insn	2, 0x0635
     c08:	0000                	.insn	2, 0x
     c0a:	00000a1b          	.insn	4, 0x0a1b
     c0e:	3f01                	.insn	2, 0x3f01
     c10:	0006                	.insn	2, 0x0006
     c12:	2a00                	.insn	2, 0x2a00
     c14:	000a                	.insn	2, 0x000a
     c16:	0800                	.insn	2, 0x0800
     c18:	064a                	.insn	2, 0x064a
     c1a:	0000                	.insn	2, 0x
     c1c:	550a                	.insn	2, 0x550a
     c1e:	0006                	.insn	2, 0x0006
     c20:	c000                	.insn	2, 0xc000
     c22:	0000                	.insn	2, 0x
     c24:	5e00                	.insn	2, 0x5e00
     c26:	0002                	.insn	2, 0x0002
     c28:	0100                	.insn	2, 0x0100
     c2a:	065a                	.insn	2, 0x065a
     c2c:	0000                	.insn	2, 0x
     c2e:	0a46                	.insn	2, 0x0a46
     c30:	0000                	.insn	2, 0x
     c32:	6601                	.insn	2, 0x6601
     c34:	0006                	.insn	2, 0x0006
     c36:	5400                	.insn	2, 0x5400
     c38:	000a                	.insn	2, 0x000a
     c3a:	0000                	.insn	2, 0x
     c3c:	7309                	.insn	2, 0x7309
     c3e:	0006                	.insn	2, 0x0006
     c40:	7400                	.insn	2, 0x7400
     c42:	0080006b          	.insn	4, 0x0080006b
     c46:	0000                	.insn	2, 0x
     c48:	9700                	.insn	2, 0x9700
     c4a:	0002                	.insn	2, 0x0002
     c4c:	0600                	.insn	2, 0x0600
     c4e:	0678                	.insn	2, 0x0678
     c50:	0000                	.insn	2, 0x
     c52:	6501                	.insn	2, 0x6501
     c54:	8406                	.insn	2, 0x8406
     c56:	0006                	.insn	2, 0x0006
     c58:	0100                	.insn	2, 0x0100
     c5a:	0866                	.insn	2, 0x0866
     c5c:	0690                	.insn	2, 0x0690
     c5e:	0000                	.insn	2, 0x
     c60:	9c08                	.insn	2, 0x9c08
     c62:	0006                	.insn	2, 0x0006
     c64:	0800                	.insn	2, 0x0800
     c66:	06a8                	.insn	2, 0x06a8
     c68:	0000                	.insn	2, 0x
     c6a:	b408                	.insn	2, 0xb408
     c6c:	0006                	.insn	2, 0x0006
     c6e:	0800                	.insn	2, 0x0800
     c70:	06c0                	.insn	2, 0x06c0
     c72:	0000                	.insn	2, 0x
     c74:	0900                	.insn	2, 0x0900
     c76:	0745                	.insn	2, 0x0745
     c78:	0000                	.insn	2, 0x
     c7a:	6b74                	.insn	2, 0x6b74
     c7c:	8000                	.insn	2, 0x8000
     c7e:	00a0                	.insn	2, 0x00a0
     c80:	0000                	.insn	2, 0x
     c82:	031e                	.insn	2, 0x031e
     c84:	0000                	.insn	2, 0x
     c86:	4a01                	.insn	2, 0x4a01
     c88:	5a000007          	.insn	4, 0x5a000007
     c8c:	000a                	.insn	2, 0x000a
     c8e:	0100                	.insn	2, 0x0100
     c90:	0756                	.insn	2, 0x0756
     c92:	0000                	.insn	2, 0x
     c94:	0a62                	.insn	2, 0x0a62
     c96:	0000                	.insn	2, 0x
     c98:	6201                	.insn	2, 0x6201
     c9a:	6a000007          	.insn	4, 0x6a000007
     c9e:	000a                	.insn	2, 0x000a
     ca0:	0100                	.insn	2, 0x0100
     ca2:	076e                	.insn	2, 0x076e
     ca4:	0000                	.insn	2, 0x
     ca6:	0aa5                	.insn	2, 0x0aa5
     ca8:	0000                	.insn	2, 0x
     caa:	7a01                	.insn	2, 0x7a01
     cac:	e0000007          	.insn	4, 0xe0000007
     cb0:	000a                	.insn	2, 0x000a
     cb2:	0100                	.insn	2, 0x0100
     cb4:	0786                	.insn	2, 0x0786
     cb6:	0000                	.insn	2, 0x
     cb8:	00000afb          	.insn	4, 0x0afb
     cbc:	9201                	.insn	2, 0x9201
     cbe:	0f000007          	.insn	4, 0x0f000007
     cc2:	0500000b          	.insn	4, 0x0500000b
     cc6:	6b88                	.insn	2, 0x6b88
     cc8:	8000                	.insn	2, 0x8000
     cca:	0942                	.insn	2, 0x0942
     ccc:	0000                	.insn	2, 0x
     cce:	9405                	.insn	2, 0x9405
     cd0:	4b80006b          	.insn	4, 0x4b80006b
     cd4:	0009                	.insn	2, 0x0009
     cd6:	0500                	.insn	2, 0x0500
     cd8:	6ba4                	.insn	2, 0x6ba4
     cda:	8000                	.insn	2, 0x8000
     cdc:	0954                	.insn	2, 0x0954
     cde:	0000                	.insn	2, 0x
     ce0:	d405                	.insn	2, 0xd405
     ce2:	4280006b          	.insn	4, 0x4280006b
     ce6:	0009                	.insn	2, 0x0009
     ce8:	0500                	.insn	2, 0x0500
     cea:	6bdc                	.insn	2, 0x6bdc
     cec:	8000                	.insn	2, 0x8000
     cee:	0000094b          	.insn	4, 0x094b
     cf2:	ec05                	.insn	2, 0xec05
     cf4:	5480006b          	.insn	4, 0x5480006b
     cf8:	0009                	.insn	2, 0x0009
     cfa:	0000                	.insn	2, 0x
     cfc:	cd0a                	.insn	2, 0xcd0a
     cfe:	0006                	.insn	2, 0x0006
     d00:	c900                	.insn	2, 0xc900
     d02:	0000                	.insn	2, 0x
     d04:	3e00                	.insn	2, 0x3e00
     d06:	01000003          	lb	x0,16(x0) # 10 <_heap_size+0x10>
     d0a:	06d2                	.insn	2, 0x06d2
     d0c:	0000                	.insn	2, 0x
     d0e:	0b2c                	.insn	2, 0x0b2c
     d10:	0000                	.insn	2, 0x
     d12:	de01                	.insn	2, 0xde01
     d14:	0006                	.insn	2, 0x0006
     d16:	3b00                	.insn	2, 0x3b00
     d18:	0000000b          	.insn	4, 0x000b
     d1c:	eb0a                	.insn	2, 0xeb0a
     d1e:	0006                	.insn	2, 0x0006
     d20:	de00                	.insn	2, 0xde00
     d22:	0000                	.insn	2, 0x
     d24:	c100                	.insn	2, 0xc100
     d26:	01000003          	lb	x0,16(x0) # 10 <_heap_size+0x10>
     d2a:	06f0                	.insn	2, 0x06f0
     d2c:	0000                	.insn	2, 0x
     d2e:	00000b43          	.insn	4, 0x0b43
     d32:	fc01                	.insn	2, 0xfc01
     d34:	0006                	.insn	2, 0x0006
     d36:	4b00                	.insn	2, 0x4b00
     d38:	0100000b          	.insn	4, 0x0100000b
     d3c:	0708                	.insn	2, 0x0708
     d3e:	0000                	.insn	2, 0x
     d40:	0b60                	.insn	2, 0x0b60
     d42:	0000                	.insn	2, 0x
     d44:	1401                	.insn	2, 0x1401
     d46:	9b000007          	.insn	4, 0x9b000007
     d4a:	0100000b          	.insn	4, 0x0100000b
     d4e:	0720                	.insn	2, 0x0720
     d50:	0000                	.insn	2, 0x
     d52:	0bd6                	.insn	2, 0x0bd6
     d54:	0000                	.insn	2, 0x
     d56:	2c01                	.insn	2, 0x2c01
     d58:	f1000007          	.insn	4, 0xf1000007
     d5c:	0100000b          	.insn	4, 0x0100000b
     d60:	0738                	.insn	2, 0x0738
     d62:	0000                	.insn	2, 0x
     d64:	0c0c                	.insn	2, 0x0c0c
     d66:	0000                	.insn	2, 0x
     d68:	d005                	.insn	2, 0xd005
     d6a:	006c                	.insn	2, 0x006c
     d6c:	4280                	.insn	2, 0x4280
     d6e:	0009                	.insn	2, 0x0009
     d70:	0500                	.insn	2, 0x0500
     d72:	6cdc                	.insn	2, 0x6cdc
     d74:	8000                	.insn	2, 0x8000
     d76:	0000094b          	.insn	4, 0x094b
     d7a:	ec05                	.insn	2, 0xec05
     d7c:	006c                	.insn	2, 0x006c
     d7e:	5480                	.insn	2, 0x5480
     d80:	0009                	.insn	2, 0x0009
     d82:	0500                	.insn	2, 0x0500
     d84:	6d1c                	.insn	2, 0x6d1c
     d86:	8000                	.insn	2, 0x8000
     d88:	0942                	.insn	2, 0x0942
     d8a:	0000                	.insn	2, 0x
     d8c:	2405                	.insn	2, 0x2405
     d8e:	006d                	.insn	2, 0x006d
     d90:	4b80                	.insn	2, 0x4b80
     d92:	0009                	.insn	2, 0x0009
     d94:	0500                	.insn	2, 0x0500
     d96:	6d34                	.insn	2, 0x6d34
     d98:	8000                	.insn	2, 0x8000
     d9a:	0954                	.insn	2, 0x0954
     d9c:	0000                	.insn	2, 0x
     d9e:	0a00                	.insn	2, 0x0a00
     da0:	079f 0000 00e9      	.insn	6, 0x00e90000079f
     da6:	0000                	.insn	2, 0x
     da8:	03e1                	.insn	2, 0x03e1
     daa:	0000                	.insn	2, 0x
     dac:	a401                	.insn	2, 0xa401
     dae:	22000007          	.insn	4, 0x22000007
     db2:	000c                	.insn	2, 0x000c
     db4:	0100                	.insn	2, 0x0100
     db6:	07b0                	.insn	2, 0x07b0
     db8:	0000                	.insn	2, 0x
     dba:	0c31                	.insn	2, 0x0c31
     dbc:	0000                	.insn	2, 0x
     dbe:	0900                	.insn	2, 0x0900
     dc0:	07bd                	.insn	2, 0x07bd
     dc2:	0000                	.insn	2, 0x
     dc4:	6db8                	.insn	2, 0x6db8
     dc6:	8000                	.insn	2, 0x8000
     dc8:	0014                	.insn	2, 0x0014
     dca:	0000                	.insn	2, 0x
     dcc:	03fc                	.insn	2, 0x03fc
     dce:	0000                	.insn	2, 0x
     dd0:	c201                	.insn	2, 0xc201
     dd2:	39000007          	.insn	4, 0x39000007
     dd6:	000c                	.insn	2, 0x000c
     dd8:	0000                	.insn	2, 0x
     dda:	0007cf13          	xori	x30,x15,0
     dde:	ec00                	.insn	2, 0xec00
     de0:	006d                	.insn	2, 0x006d
     de2:	c480                	.insn	2, 0xc480
     de4:	0001                	.insn	2, 0x0001
     de6:	0600                	.insn	2, 0x0600
     de8:	07d0                	.insn	2, 0x07d0
     dea:	0000                	.insn	2, 0x
     dec:	5e01                	.insn	2, 0x5e01
     dee:	db01                	.insn	2, 0xdb01
     df0:	41000007          	.insn	4, 0x41000007
     df4:	000c                	.insn	2, 0x000c
     df6:	0a00                	.insn	2, 0x0a00
     df8:	07e6                	.insn	2, 0x07e6
     dfa:	0000                	.insn	2, 0x
     dfc:	00f4                	.insn	2, 0x00f4
     dfe:	0000                	.insn	2, 0x
     e00:	049c                	.insn	2, 0x049c
     e02:	0000                	.insn	2, 0x
     e04:	eb01                	.insn	2, 0xeb01
     e06:	50000007          	.insn	4, 0x50000007
     e0a:	000c                	.insn	2, 0x000c
     e0c:	0100                	.insn	2, 0x0100
     e0e:	000007f7          	.insn	4, 0x07f7
     e12:	00000c63          	beq	x0,x0,e2a <_heap_size+0xe2a>
     e16:	0301                	.insn	2, 0x0301
     e18:	0008                	.insn	2, 0x0008
     e1a:	7800                	.insn	2, 0x7800
     e1c:	000c                	.insn	2, 0x000c
     e1e:	0100                	.insn	2, 0x0100
     e20:	0000080f          	.insn	4, 0x080f
     e24:	0c95                	.insn	2, 0x0c95
     e26:	0000                	.insn	2, 0x
     e28:	1b01                	.insn	2, 0x1b01
     e2a:	0008                	.insn	2, 0x0008
     e2c:	b200                	.insn	2, 0xb200
     e2e:	000c                	.insn	2, 0x000c
     e30:	0100                	.insn	2, 0x0100
     e32:	00000827          	.insn	4, 0x0827
     e36:	0cee                	.insn	2, 0x0cee
     e38:	0000                	.insn	2, 0x
     e3a:	3301                	.insn	2, 0x3301
     e3c:	0008                	.insn	2, 0x0008
     e3e:	2000                	.insn	2, 0x2000
     e40:	000d                	.insn	2, 0x000d
     e42:	0500                	.insn	2, 0x0500
     e44:	6e28                	.insn	2, 0x6e28
     e46:	8000                	.insn	2, 0x8000
     e48:	0942                	.insn	2, 0x0942
     e4a:	0000                	.insn	2, 0x
     e4c:	3805                	.insn	2, 0x3805
     e4e:	006e                	.insn	2, 0x006e
     e50:	4b80                	.insn	2, 0x4b80
     e52:	0009                	.insn	2, 0x0009
     e54:	0500                	.insn	2, 0x0500
     e56:	6e48                	.insn	2, 0x6e48
     e58:	8000                	.insn	2, 0x8000
     e5a:	0954                	.insn	2, 0x0954
     e5c:	0000                	.insn	2, 0x
     e5e:	8405                	.insn	2, 0x8405
     e60:	006e                	.insn	2, 0x006e
     e62:	4280                	.insn	2, 0x4280
     e64:	0009                	.insn	2, 0x0009
     e66:	0500                	.insn	2, 0x0500
     e68:	6e94                	.insn	2, 0x6e94
     e6a:	8000                	.insn	2, 0x8000
     e6c:	0000094b          	.insn	4, 0x094b
     e70:	a405                	.insn	2, 0xa405
     e72:	006e                	.insn	2, 0x006e
     e74:	5480                	.insn	2, 0x5480
     e76:	0009                	.insn	2, 0x0009
     e78:	0000                	.insn	2, 0x
     e7a:	400a                	.insn	2, 0x400a
     e7c:	0008                	.insn	2, 0x0008
     e7e:	0e00                	.insn	2, 0x0e00
     e80:	0001                	.insn	2, 0x0001
     e82:	6600                	.insn	2, 0x6600
     e84:	0005                	.insn	2, 0x0005
     e86:	0100                	.insn	2, 0x0100
     e88:	0845                	.insn	2, 0x0845
     e8a:	0000                	.insn	2, 0x
     e8c:	0d3d                	.insn	2, 0x0d3d
     e8e:	0000                	.insn	2, 0x
     e90:	5101                	.insn	2, 0x5101
     e92:	0008                	.insn	2, 0x0008
     e94:	4c00                	.insn	2, 0x4c00
     e96:	000d                	.insn	2, 0x000d
     e98:	0100                	.insn	2, 0x0100
     e9a:	085d                	.insn	2, 0x085d
     e9c:	0000                	.insn	2, 0x
     e9e:	0d62                	.insn	2, 0x0d62
     ea0:	0000                	.insn	2, 0x
     ea2:	6901                	.insn	2, 0x6901
     ea4:	0008                	.insn	2, 0x0008
     ea6:	7100                	.insn	2, 0x7100
     ea8:	000d                	.insn	2, 0x000d
     eaa:	0100                	.insn	2, 0x0100
     eac:	0875                	.insn	2, 0x0875
     eae:	0000                	.insn	2, 0x
     eb0:	0d80                	.insn	2, 0x0d80
     eb2:	0000                	.insn	2, 0x
     eb4:	8101                	.insn	2, 0x8101
     eb6:	0008                	.insn	2, 0x0008
     eb8:	8800                	.insn	2, 0x8800
     eba:	000d                	.insn	2, 0x000d
     ebc:	0600                	.insn	2, 0x0600
     ebe:	088d                	.insn	2, 0x088d
     ec0:	0000                	.insn	2, 0x
     ec2:	6301                	.insn	2, 0x6301
     ec4:	9906                	.insn	2, 0x9906
     ec6:	0008                	.insn	2, 0x0008
     ec8:	0100                	.insn	2, 0x0100
     eca:	0956                	.insn	2, 0x0956
     ecc:	08a5                	.insn	2, 0x08a5
     ece:	0000                	.insn	2, 0x
     ed0:	6ef8                	.insn	2, 0x6ef8
     ed2:	8000                	.insn	2, 0x8000
     ed4:	0010                	.insn	2, 0x0010
     ed6:	0000                	.insn	2, 0x
     ed8:	050d                	.insn	2, 0x050d
     eda:	0000                	.insn	2, 0x
     edc:	aa06                	.insn	2, 0xaa06
     ede:	0008                	.insn	2, 0x0008
     ee0:	0100                	.insn	2, 0x0100
     ee2:	065a                	.insn	2, 0x065a
     ee4:	08b6                	.insn	2, 0x08b6
     ee6:	0000                	.insn	2, 0x
     ee8:	5b01                	.insn	2, 0x5b01
     eea:	0900                	.insn	2, 0x0900
     eec:	000008c3          	.insn	4, 0x08c3
     ef0:	6f08                	.insn	2, 0x6f08
     ef2:	8000                	.insn	2, 0x8000
     ef4:	0010                	.insn	2, 0x0010
     ef6:	0000                	.insn	2, 0x
     ef8:	052d                	.insn	2, 0x052d
     efa:	0000                	.insn	2, 0x
     efc:	c806                	.insn	2, 0xc806
     efe:	0008                	.insn	2, 0x0008
     f00:	0100                	.insn	2, 0x0100
     f02:	065a                	.insn	2, 0x065a
     f04:	08d4                	.insn	2, 0x08d4
     f06:	0000                	.insn	2, 0x
     f08:	5b01                	.insn	2, 0x5b01
     f0a:	0900                	.insn	2, 0x0900
     f0c:	08e1                	.insn	2, 0x08e1
     f0e:	0000                	.insn	2, 0x
     f10:	6f18                	.insn	2, 0x6f18
     f12:	8000                	.insn	2, 0x8000
     f14:	0010                	.insn	2, 0x0010
     f16:	0000                	.insn	2, 0x
     f18:	054d                	.insn	2, 0x054d
     f1a:	0000                	.insn	2, 0x
     f1c:	e606                	.insn	2, 0xe606
     f1e:	0008                	.insn	2, 0x0008
     f20:	0100                	.insn	2, 0x0100
     f22:	065a                	.insn	2, 0x065a
     f24:	08f2                	.insn	2, 0x08f2
     f26:	0000                	.insn	2, 0x
     f28:	5b01                	.insn	2, 0x5b01
     f2a:	2200                	.insn	2, 0x2200
     f2c:	08ff 0000 011e 0000 	.insn	10, 0x00060000011e000008ff
     f34:	0006 
     f36:	0009                	.insn	2, 0x0009
     f38:	0100                	.insn	2, 0x0100
     f3a:	065a                	.insn	2, 0x065a
     f3c:	090c                	.insn	2, 0x090c
     f3e:	0000                	.insn	2, 0x
     f40:	5b01                	.insn	2, 0x5b01
     f42:	0000                	.insn	2, 0x
     f44:	1a09                	.insn	2, 0x1a09
     f46:	0009                	.insn	2, 0x0009
     f48:	7800                	.insn	2, 0x7800
     f4a:	1480006f          	jal	x0,1092 <_stack_size+0x92>
     f4e:	0000                	.insn	2, 0x
     f50:	8100                	.insn	2, 0x8100
     f52:	0005                	.insn	2, 0x0005
     f54:	0100                	.insn	2, 0x0100
     f56:	091f 0000 0da8      	.insn	6, 0x0da80000091f
     f5c:	0000                	.insn	2, 0x
     f5e:	1300                	.insn	2, 0x1300
     f60:	092c                	.insn	2, 0x092c
     f62:	0000                	.insn	2, 0x
     f64:	6f8c                	.insn	2, 0x6f8c
     f66:	8000                	.insn	2, 0x8000
     f68:	0010                	.insn	2, 0x0010
     f6a:	0000                	.insn	2, 0x
     f6c:	2d01                	.insn	2, 0x2d01
     f6e:	0009                	.insn	2, 0x0009
     f70:	b000                	.insn	2, 0xb000
     f72:	000d                	.insn	2, 0x000d
     f74:	0000                	.insn	2, 0x
     f76:	0000                	.insn	2, 0x
     f78:	0000                	.insn	2, 0x
     f7a:	0002d223          	.insn	4, 0x0002d223
     f7e:	0100                	.insn	2, 0x0100
     f80:	ab0103e3          	beq	x2,x16,a26 <_heap_size+0xa26>
     f84:	0000                	.insn	2, 0x
     f86:	0300                	.insn	2, 0x0300
     f88:	093c                	.insn	2, 0x093c
     f8a:	0000                	.insn	2, 0x
     f8c:	6e0e                	.insn	2, 0x6e0e
     f8e:	1700                	.insn	2, 0x1700
     f90:	000000ab          	.insn	4, 0x00ab
     f94:	640e                	.insn	2, 0x640e
     f96:	2200                	.insn	2, 0x2200
     f98:	000000ab          	.insn	4, 0x00ab
     f9c:	720e                	.insn	2, 0x720e
     f9e:	0070                	.insn	2, 0x0070
     fa0:	3c2e                	.insn	2, 0x3c2e
     fa2:	0009                	.insn	2, 0x0009
     fa4:	0300                	.insn	2, 0x0300
     fa6:	6e6e                	.insn	2, 0x6e6e
     fa8:	e500                	.insn	2, 0xe500
     faa:	013f1103          	lh	x2,19(x30)
     fae:	0000                	.insn	2, 0x
     fb0:	00646403          	.insn	4, 0x00646403
     fb4:	03e6                	.insn	2, 0x03e6
     fb6:	3f11                	.insn	2, 0x3f11
     fb8:	0001                	.insn	2, 0x0001
     fba:	0300                	.insn	2, 0x0300
     fbc:	7272                	.insn	2, 0x7272
     fbe:	e700                	.insn	2, 0xe700
     fc0:	01320b03          	lb	x22,19(x4) # 13 <_heap_size+0x13>
     fc4:	0000                	.insn	2, 0x
     fc6:	00306403          	.insn	4, 0x00306403
     fca:	03e8                	.insn	2, 0x03e8
     fcc:	950a                	.insn	2, 0x950a
     fce:	0000                	.insn	2, 0x
     fd0:	0300                	.insn	2, 0x0300
     fd2:	3164                	.insn	2, 0x3164
     fd4:	e800                	.insn	2, 0xe800
     fd6:	00950e03          	lb	x28,9(x10)
     fda:	0000                	.insn	2, 0x
     fdc:	00306e03          	.insn	4, 0x00306e03
     fe0:	03e8                	.insn	2, 0x03e8
     fe2:	9512                	.insn	2, 0x9512
     fe4:	0000                	.insn	2, 0x
     fe6:	0300                	.insn	2, 0x0300
     fe8:	316e                	.insn	2, 0x316e
     fea:	e800                	.insn	2, 0xe800
     fec:	00951603          	lh	x12,9(x10)
     ff0:	0000                	.insn	2, 0x
     ff2:	00326e03          	.insn	4, 0x00326e03
     ff6:	03e8                	.insn	2, 0x03e8
     ff8:	951a                	.insn	2, 0x951a
     ffa:	0000                	.insn	2, 0x
     ffc:	0300                	.insn	2, 0x0300
     ffe:	3071                	.insn	2, 0x3071
    1000:	e900                	.insn	2, 0xe900
    1002:	00950a03          	lb	x20,9(x10)
    1006:	0000                	.insn	2, 0x
    1008:	00317103          	.insn	4, 0x00317103
    100c:	03e9                	.insn	2, 0x03e9
    100e:	950e                	.insn	2, 0x950e
    1010:	0000                	.insn	2, 0x
    1012:	0300                	.insn	2, 0x0300
    1014:	0062                	.insn	2, 0x0062
    1016:	03ea                	.insn	2, 0x03ea
    1018:	950a                	.insn	2, 0x950a
    101a:	0000                	.insn	2, 0x
    101c:	0300                	.insn	2, 0x0300
    101e:	6d62                	.insn	2, 0x6d62
    1020:	ea00                	.insn	2, 0xea00
    1022:	00950d03          	lb	x26,9(x10)
    1026:	0000                	.insn	2, 0x
    1028:	00777703          	.insn	4, 0x00777703
    102c:	3f1104b3          	.insn	4, 0x3f1104b3
    1030:	0001                	.insn	2, 0x0001
    1032:	0700                	.insn	2, 0x0700
    1034:	00000673          	.insn	4, 0x0673
    1038:	fb02                	.insn	2, 0xfb02
    103a:	0002                	.insn	2, 0x0002
    103c:	1a00                	.insn	2, 0x1a00
    103e:	0404                	.insn	2, 0x0404
    1040:	0095                	.insn	2, 0x0095
    1042:	0000                	.insn	2, 0x
    1044:	615f5f03          	lhu	x30,1557(x30)
    1048:	1a00                	.insn	2, 0x1a00
    104a:	0404                	.insn	2, 0x0404
    104c:	0095                	.insn	2, 0x0095
    104e:	0000                	.insn	2, 0x
    1050:	0700                	.insn	2, 0x0700
    1052:	06cd                	.insn	2, 0x06cd
    1054:	0000                	.insn	2, 0x
    1056:	b902                	.insn	2, 0xb902
    1058:	0002                	.insn	2, 0x0002
    105a:	2600                	.insn	2, 0x2600
    105c:	0404                	.insn	2, 0x0404
    105e:	0095                	.insn	2, 0x0095
    1060:	0000                	.insn	2, 0x
    1062:	3502                	.insn	2, 0x3502
    1064:	0001                	.insn	2, 0x0001
    1066:	2600                	.insn	2, 0x2600
    1068:	0404                	.insn	2, 0x0404
    106a:	0095                	.insn	2, 0x0095
    106c:	0000                	.insn	2, 0x
    106e:	b402                	.insn	2, 0xb402
    1070:	0002                	.insn	2, 0x0002
    1072:	2600                	.insn	2, 0x2600
    1074:	0404                	.insn	2, 0x0404
    1076:	0095                	.insn	2, 0x0095
    1078:	0000                	.insn	2, 0x
    107a:	af02                	.insn	2, 0xaf02
    107c:	0002                	.insn	2, 0x0002
    107e:	2600                	.insn	2, 0x2600
    1080:	0404                	.insn	2, 0x0404
    1082:	0095                	.insn	2, 0x0095
    1084:	0000                	.insn	2, 0x
    1086:	0502                	.insn	2, 0x0502
    1088:	26000003          	lb	x0,608(x0) # 260 <_heap_size+0x260>
    108c:	0404                	.insn	2, 0x0404
    108e:	0095                	.insn	2, 0x0095
    1090:	0000                	.insn	2, 0x
    1092:	0002                	.insn	2, 0x0002
    1094:	26000003          	lb	x0,608(x0) # 260 <_heap_size+0x260>
    1098:	0404                	.insn	2, 0x0404
    109a:	0095                	.insn	2, 0x0095
    109c:	0000                	.insn	2, 0x
    109e:	6d5f5f03          	lhu	x30,1749(x30)
    10a2:	2600                	.insn	2, 0x2600
    10a4:	0404                	.insn	2, 0x0404
    10a6:	0095                	.insn	2, 0x0095
    10a8:	0000                	.insn	2, 0x
    10aa:	0700                	.insn	2, 0x0700
    10ac:	000006eb          	.insn	4, 0x06eb
    10b0:	fb02                	.insn	2, 0xfb02
    10b2:	0002                	.insn	2, 0x0002
    10b4:	3200                	.insn	2, 0x3200
    10b6:	0404                	.insn	2, 0x0404
    10b8:	0095                	.insn	2, 0x0095
    10ba:	0000                	.insn	2, 0x
    10bc:	615f5f03          	lhu	x30,1557(x30)
    10c0:	3200                	.insn	2, 0x3200
    10c2:	0404                	.insn	2, 0x0404
    10c4:	0095                	.insn	2, 0x0095
    10c6:	0000                	.insn	2, 0x
    10c8:	0700                	.insn	2, 0x0700
    10ca:	0745                	.insn	2, 0x0745
    10cc:	0000                	.insn	2, 0x
    10ce:	b902                	.insn	2, 0xb902
    10d0:	0002                	.insn	2, 0x0002
    10d2:	4b00                	.insn	2, 0x4b00
    10d4:	0804                	.insn	2, 0x0804
    10d6:	0095                	.insn	2, 0x0095
    10d8:	0000                	.insn	2, 0x
    10da:	3502                	.insn	2, 0x3502
    10dc:	0001                	.insn	2, 0x0001
    10de:	4b00                	.insn	2, 0x4b00
    10e0:	0804                	.insn	2, 0x0804
    10e2:	0095                	.insn	2, 0x0095
    10e4:	0000                	.insn	2, 0x
    10e6:	b402                	.insn	2, 0xb402
    10e8:	0002                	.insn	2, 0x0002
    10ea:	4b00                	.insn	2, 0x4b00
    10ec:	0804                	.insn	2, 0x0804
    10ee:	0095                	.insn	2, 0x0095
    10f0:	0000                	.insn	2, 0x
    10f2:	af02                	.insn	2, 0xaf02
    10f4:	0002                	.insn	2, 0x0002
    10f6:	4b00                	.insn	2, 0x4b00
    10f8:	0804                	.insn	2, 0x0804
    10fa:	0095                	.insn	2, 0x0095
    10fc:	0000                	.insn	2, 0x
    10fe:	0502                	.insn	2, 0x0502
    1100:	4b000003          	lb	x0,1200(x0) # 4b0 <_heap_size+0x4b0>
    1104:	0804                	.insn	2, 0x0804
    1106:	0095                	.insn	2, 0x0095
    1108:	0000                	.insn	2, 0x
    110a:	0002                	.insn	2, 0x0002
    110c:	4b000003          	lb	x0,1200(x0) # 4b0 <_heap_size+0x4b0>
    1110:	0804                	.insn	2, 0x0804
    1112:	0095                	.insn	2, 0x0095
    1114:	0000                	.insn	2, 0x
    1116:	6d5f5f03          	lhu	x30,1749(x30)
    111a:	4b00                	.insn	2, 0x4b00
    111c:	0804                	.insn	2, 0x0804
    111e:	0095                	.insn	2, 0x0095
    1120:	0000                	.insn	2, 0x
    1122:	0700                	.insn	2, 0x0700
    1124:	079f 0000 b902      	.insn	6, 0xb9020000079f
    112a:	0002                	.insn	2, 0x0002
    112c:	5000                	.insn	2, 0x5000
    112e:	0404                	.insn	2, 0x0404
    1130:	0095                	.insn	2, 0x0095
    1132:	0000                	.insn	2, 0x
    1134:	3502                	.insn	2, 0x3502
    1136:	0001                	.insn	2, 0x0001
    1138:	5000                	.insn	2, 0x5000
    113a:	0404                	.insn	2, 0x0404
    113c:	0095                	.insn	2, 0x0095
    113e:	0000                	.insn	2, 0x
    1140:	b402                	.insn	2, 0xb402
    1142:	0002                	.insn	2, 0x0002
    1144:	5000                	.insn	2, 0x5000
    1146:	0404                	.insn	2, 0x0404
    1148:	0095                	.insn	2, 0x0095
    114a:	0000                	.insn	2, 0x
    114c:	af02                	.insn	2, 0xaf02
    114e:	0002                	.insn	2, 0x0002
    1150:	5000                	.insn	2, 0x5000
    1152:	0404                	.insn	2, 0x0404
    1154:	0095                	.insn	2, 0x0095
    1156:	0000                	.insn	2, 0x
    1158:	0502                	.insn	2, 0x0502
    115a:	50000003          	lb	x0,1280(x0) # 500 <_heap_size+0x500>
    115e:	0404                	.insn	2, 0x0404
    1160:	0095                	.insn	2, 0x0095
    1162:	0000                	.insn	2, 0x
    1164:	0002                	.insn	2, 0x0002
    1166:	50000003          	lb	x0,1280(x0) # 500 <_heap_size+0x500>
    116a:	0404                	.insn	2, 0x0404
    116c:	0095                	.insn	2, 0x0095
    116e:	0000                	.insn	2, 0x
    1170:	6d5f5f03          	lhu	x30,1749(x30)
    1174:	5000                	.insn	2, 0x5000
    1176:	0404                	.insn	2, 0x0404
    1178:	0095                	.insn	2, 0x0095
    117a:	0000                	.insn	2, 0x
    117c:	0700                	.insn	2, 0x0700
    117e:	07bd                	.insn	2, 0x07bd
    1180:	0000                	.insn	2, 0x
    1182:	fb02                	.insn	2, 0xfb02
    1184:	0002                	.insn	2, 0x0002
    1186:	7300                	.insn	2, 0x7300
    1188:	0404                	.insn	2, 0x0404
    118a:	0095                	.insn	2, 0x0095
    118c:	0000                	.insn	2, 0x
    118e:	615f5f03          	lhu	x30,1557(x30)
    1192:	7300                	.insn	2, 0x7300
    1194:	0404                	.insn	2, 0x0404
    1196:	0095                	.insn	2, 0x0095
    1198:	0000                	.insn	2, 0x
    119a:	0700                	.insn	2, 0x0700
    119c:	000007cf          	.insn	4, 0x07cf
    11a0:	785f5f03          	lhu	x30,1925(x30)
    11a4:	8100                	.insn	2, 0x8100
    11a6:	0504                	.insn	2, 0x0504
    11a8:	0095                	.insn	2, 0x0095
    11aa:	0000                	.insn	2, 0x
    11ac:	0f00                	.insn	2, 0x0f00
    11ae:	00316d03          	.insn	4, 0x00316d03
    11b2:	0491                	.insn	2, 0x0491
    11b4:	0000950f          	.insn	4, 0x950f
    11b8:	0300                	.insn	2, 0x0300
    11ba:	306d                	.insn	2, 0x306d
    11bc:	9100                	.insn	2, 0x9100
    11be:	1304                	.insn	2, 0x1304
    11c0:	0095                	.insn	2, 0x0095
    11c2:	0000                	.insn	2, 0x
    11c4:	00084007          	.insn	4, 0x00084007
    11c8:	0200                	.insn	2, 0x0200
    11ca:	02b9                	.insn	2, 0x02b9
    11cc:	0000                	.insn	2, 0x
    11ce:	049c                	.insn	2, 0x049c
    11d0:	9508                	.insn	2, 0x9508
    11d2:	0000                	.insn	2, 0x
    11d4:	0200                	.insn	2, 0x0200
    11d6:	0135                	.insn	2, 0x0135
    11d8:	0000                	.insn	2, 0x
    11da:	049c                	.insn	2, 0x049c
    11dc:	9508                	.insn	2, 0x9508
    11de:	0000                	.insn	2, 0x
    11e0:	0200                	.insn	2, 0x0200
    11e2:	02b4                	.insn	2, 0x02b4
    11e4:	0000                	.insn	2, 0x
    11e6:	049c                	.insn	2, 0x049c
    11e8:	9508                	.insn	2, 0x9508
    11ea:	0000                	.insn	2, 0x
    11ec:	0200                	.insn	2, 0x0200
    11ee:	000002af          	.insn	4, 0x02af
    11f2:	049c                	.insn	2, 0x049c
    11f4:	9508                	.insn	2, 0x9508
    11f6:	0000                	.insn	2, 0x
    11f8:	0200                	.insn	2, 0x0200
    11fa:	0305                	.insn	2, 0x0305
    11fc:	0000                	.insn	2, 0x
    11fe:	049c                	.insn	2, 0x049c
    1200:	9508                	.insn	2, 0x9508
    1202:	0000                	.insn	2, 0x
    1204:	0200                	.insn	2, 0x0200
    1206:	0300                	.insn	2, 0x0300
    1208:	0000                	.insn	2, 0x
    120a:	049c                	.insn	2, 0x049c
    120c:	9508                	.insn	2, 0x9508
    120e:	0000                	.insn	2, 0x
    1210:	0300                	.insn	2, 0x0300
    1212:	5f5f 006d 049c      	.insn	6, 0x049c006d5f5f
    1218:	9508                	.insn	2, 0x9508
    121a:	0000                	.insn	2, 0x
    121c:	0000                	.insn	2, 0x
    121e:	00091a07          	.insn	4, 0x00091a07
    1222:	0200                	.insn	2, 0x0200
    1224:	0000026f          	jal	x4,1224 <_stack_size+0x224>
    1228:	049d                	.insn	2, 0x049d
    122a:	9508                	.insn	2, 0x9508
    122c:	0000                	.insn	2, 0x
    122e:	0200                	.insn	2, 0x0200
    1230:	0274                	.insn	2, 0x0274
    1232:	0000                	.insn	2, 0x
    1234:	049d                	.insn	2, 0x049d
    1236:	9508                	.insn	2, 0x9508
    1238:	0000                	.insn	2, 0x
    123a:	0200                	.insn	2, 0x0200
    123c:	0279                	.insn	2, 0x0279
    123e:	0000                	.insn	2, 0x
    1240:	049d                	.insn	2, 0x049d
    1242:	9508                	.insn	2, 0x9508
    1244:	0000                	.insn	2, 0x
    1246:	0200                	.insn	2, 0x0200
    1248:	027e                	.insn	2, 0x027e
    124a:	0000                	.insn	2, 0x
    124c:	049d                	.insn	2, 0x049d
    124e:	9508                	.insn	2, 0x9508
    1250:	0000                	.insn	2, 0x
    1252:	0200                	.insn	2, 0x0200
    1254:	0000030f          	.insn	4, 0x030f
    1258:	049d                	.insn	2, 0x049d
    125a:	9508                	.insn	2, 0x9508
    125c:	0000                	.insn	2, 0x
    125e:	0200                	.insn	2, 0x0200
    1260:	02cd                	.insn	2, 0x02cd
    1262:	0000                	.insn	2, 0x
    1264:	049d                	.insn	2, 0x049d
    1266:	9508                	.insn	2, 0x9508
    1268:	0000                	.insn	2, 0x
    126a:	0200                	.insn	2, 0x0200
    126c:	030a                	.insn	2, 0x030a
    126e:	0000                	.insn	2, 0x
    1270:	049d                	.insn	2, 0x049d
    1272:	9508                	.insn	2, 0x9508
    1274:	0000                	.insn	2, 0x
    1276:	0200                	.insn	2, 0x0200
    1278:	013a                	.insn	2, 0x013a
    127a:	0000                	.insn	2, 0x
    127c:	049d                	.insn	2, 0x049d
    127e:	9508                	.insn	2, 0x9508
    1280:	0000                	.insn	2, 0x
    1282:	0700                	.insn	2, 0x0700
    1284:	000008c3          	.insn	4, 0x08c3
    1288:	3f02                	.insn	2, 0x3f02
    128a:	0001                	.insn	2, 0x0001
    128c:	9d00                	.insn	2, 0x9d00
    128e:	0804                	.insn	2, 0x0804
    1290:	0095                	.insn	2, 0x0095
    1292:	0000                	.insn	2, 0x
    1294:	4502                	.insn	2, 0x4502
    1296:	0001                	.insn	2, 0x0001
    1298:	9d00                	.insn	2, 0x9d00
    129a:	0804                	.insn	2, 0x0804
    129c:	0095                	.insn	2, 0x0095
    129e:	0000                	.insn	2, 0x
    12a0:	0700                	.insn	2, 0x0700
    12a2:	08e1                	.insn	2, 0x08e1
    12a4:	0000                	.insn	2, 0x
    12a6:	3f02                	.insn	2, 0x3f02
    12a8:	0001                	.insn	2, 0x0001
    12aa:	9d00                	.insn	2, 0x9d00
    12ac:	0804                	.insn	2, 0x0804
    12ae:	0095                	.insn	2, 0x0095
    12b0:	0000                	.insn	2, 0x
    12b2:	4502                	.insn	2, 0x4502
    12b4:	0001                	.insn	2, 0x0001
    12b6:	9d00                	.insn	2, 0x9d00
    12b8:	0804                	.insn	2, 0x0804
    12ba:	0095                	.insn	2, 0x0095
    12bc:	0000                	.insn	2, 0x
    12be:	0700                	.insn	2, 0x0700
    12c0:	08ff 0000 3f02 0001 	.insn	10, 0x9d0000013f02000008ff
    12c8:	9d00 
    12ca:	0804                	.insn	2, 0x0804
    12cc:	0095                	.insn	2, 0x0095
    12ce:	0000                	.insn	2, 0x
    12d0:	4502                	.insn	2, 0x4502
    12d2:	0001                	.insn	2, 0x0001
    12d4:	9d00                	.insn	2, 0x9d00
    12d6:	0804                	.insn	2, 0x0804
    12d8:	0095                	.insn	2, 0x0095
    12da:	0000                	.insn	2, 0x
    12dc:	0f00                	.insn	2, 0x0f00
    12de:	3f02                	.insn	2, 0x3f02
    12e0:	0001                	.insn	2, 0x0001
    12e2:	9d00                	.insn	2, 0x9d00
    12e4:	0804                	.insn	2, 0x0804
    12e6:	0095                	.insn	2, 0x0095
    12e8:	0000                	.insn	2, 0x
    12ea:	4502                	.insn	2, 0x4502
    12ec:	0001                	.insn	2, 0x0001
    12ee:	9d00                	.insn	2, 0x9d00
    12f0:	0804                	.insn	2, 0x0804
    12f2:	0095                	.insn	2, 0x0095
    12f4:	0000                	.insn	2, 0x
    12f6:	0000                	.insn	2, 0x
    12f8:	00092c07          	.insn	4, 0x00092c07
    12fc:	0300                	.insn	2, 0x0300
    12fe:	5f5f 0078 04a2      	.insn	6, 0x04a200785f5f
    1304:	9505                	.insn	2, 0x9505
    1306:	0000                	.insn	2, 0x
    1308:	0000                	.insn	2, 0x
    130a:	5f5f030f          	.insn	4, 0x5f5f030f
    130e:	0078                	.insn	2, 0x0078
    1310:	04aa                	.insn	2, 0x04aa
    1312:	9505                	.insn	2, 0x9505
    1314:	0000                	.insn	2, 0x
    1316:	0000                	.insn	2, 0x
    1318:	0000                	.insn	2, 0x
    131a:	0424                	.insn	2, 0x0424
    131c:	000000ab          	.insn	4, 0x00ab
    1320:	ee10                	.insn	2, 0xee10
    1322:	0000                	.insn	2, 0x
    1324:	ee00                	.insn	2, 0xee00
    1326:	0000                	.insn	2, 0x
    1328:	1000                	.insn	2, 0x1000
    132a:	00a4                	.insn	2, 0x00a4
    132c:	0000                	.insn	2, 0x
    132e:	00a4                	.insn	2, 0x00a4
    1330:	0000                	.insn	2, 0x
    1332:	f810                	.insn	2, 0xf810
    1334:	0000                	.insn	2, 0x
    1336:	f800                	.insn	2, 0xf800
    1338:	0000                	.insn	2, 0x
    133a:	0000                	.insn	2, 0x
    133c:	00e2                	.insn	2, 0x00e2
    133e:	0000                	.insn	2, 0x
    1340:	0005                	.insn	2, 0x0005
    1342:	0401                	.insn	2, 0x0401
    1344:	03f6                	.insn	2, 0x03f6
    1346:	0000                	.insn	2, 0x
    1348:	00031e03          	lh	x28,0(x6)
    134c:	1d00                	.insn	2, 0x1d00
    134e:	009e                	.insn	2, 0x009e
    1350:	0000                	.insn	2, 0x
    1352:	0000                	.insn	2, 0x
    1354:	0000                	.insn	2, 0x
    1356:	00001467          	.insn	4, 0x1467
    135a:	0404                	.insn	2, 0x0404
    135c:	6905                	.insn	2, 0x6905
    135e:	746e                	.insn	2, 0x746e
    1360:	0100                	.insn	2, 0x0100
    1362:	0704                	.insn	2, 0x0704
    1364:	00000163          	beq	x0,x0,1366 <_stack_size+0x366>
    1368:	0801                	.insn	2, 0x0801
    136a:	4b05                	.insn	2, 0x4b05
    136c:	0001                	.insn	2, 0x0001
    136e:	0100                	.insn	2, 0x0100
    1370:	0410                	.insn	2, 0x0410
    1372:	000002e7          	jalr	x5,0(x0) # 0 <_heap_size>
    1376:	0101                	.insn	2, 0x0101
    1378:	9206                	.insn	2, 0x9206
    137a:	0001                	.insn	2, 0x0001
    137c:	0100                	.insn	2, 0x0100
    137e:	0801                	.insn	2, 0x0801
    1380:	0190                	.insn	2, 0x0190
    1382:	0000                	.insn	2, 0x
    1384:	0201                	.insn	2, 0x0201
    1386:	2b05                	.insn	2, 0x2b05
    1388:	0001                	.insn	2, 0x0001
    138a:	0100                	.insn	2, 0x0100
    138c:	0702                	.insn	2, 0x0702
    138e:	0294                	.insn	2, 0x0294
    1390:	0000                	.insn	2, 0x
    1392:	0401                	.insn	2, 0x0401
    1394:	5005                	.insn	2, 0x5005
    1396:	0001                	.insn	2, 0x0001
    1398:	0100                	.insn	2, 0x0100
    139a:	0704                	.insn	2, 0x0704
    139c:	015e                	.insn	2, 0x015e
    139e:	0000                	.insn	2, 0x
    13a0:	0801                	.insn	2, 0x0801
    13a2:	00015907          	.insn	4, 0x00015907
    13a6:	0100                	.insn	2, 0x0100
    13a8:	0801                	.insn	2, 0x0801
    13aa:	0199                	.insn	2, 0x0199
    13ac:	0000                	.insn	2, 0x
    13ae:	8305                	.insn	2, 0x8305
    13b0:	0002                	.insn	2, 0x0002
    13b2:	0100                	.insn	2, 0x0100
    13b4:	0041167b          	.insn	4, 0x0041167b
    13b8:	0000                	.insn	2, 0x
    13ba:	7202                	.insn	2, 0x7202
    13bc:	0000                	.insn	2, 0x
    13be:	0100                	.insn	2, 0x0100
    13c0:	0402                	.insn	2, 0x0402
    13c2:	00000187          	.insn	4, 0x0187
    13c6:	0401                	.insn	2, 0x0401
    13c8:	00017f03          	.insn	4, 0x00017f03
    13cc:	0100                	.insn	2, 0x0100
    13ce:	0404                	.insn	2, 0x0404
    13d0:	0125                	.insn	2, 0x0125
    13d2:	0000                	.insn	2, 0x
    13d4:	0801                	.insn	2, 0x0801
    13d6:	00011d03          	lh	x26,0(x2)
    13da:	0100                	.insn	2, 0x0100
    13dc:	0408                	.insn	2, 0x0408
    13de:	02ec                	.insn	2, 0x02ec
    13e0:	0000                	.insn	2, 0x
    13e2:	1001                	.insn	2, 0x1001
    13e4:	0002be03          	.insn	4, 0x0002be03
    13e8:	0100                	.insn	2, 0x0100
    13ea:	0320                	.insn	2, 0x0320
    13ec:	02df 0000 7e06      	.insn	6, 0x7e06000002df
    13f2:	0000                	.insn	2, 0x
    13f4:	c400                	.insn	2, 0xc400
    13f6:	0000                	.insn	2, 0x
    13f8:	0700                	.insn	2, 0x0700
    13fa:	0025                	.insn	2, 0x0025
    13fc:	0000                	.insn	2, 0x
    13fe:	00ff b402 0000 0800 	.insn	10, 0x017508000000b40200ff
    1406:	0175 
    1408:	0000                	.insn	2, 0x
    140a:	0601                	.insn	2, 0x0601
    140c:	1602                	.insn	2, 0x1602
    140e:	00c4                	.insn	2, 0x00c4
    1410:	0000                	.insn	2, 0x
    1412:	c909                	.insn	2, 0xc909
    1414:	0000                	.insn	2, 0x
    1416:	0200                	.insn	2, 0x0200
    1418:	029e                	.insn	2, 0x029e
    141a:	4003050f          	.insn	4, 0x4003050f
    141e:	101d                	.insn	2, 0x101d
    1420:	0080                	.insn	2, 0x0080

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
  4e:	0000                	.insn	2, 0x
  50:	3401                	.insn	2, 0x3401
  52:	3100                	.insn	2, 0x3100
  54:	00170213          	addi	x4,x14,1
  58:	0200                	.insn	2, 0x0200
  5a:	0034                	.insn	2, 0x0034
  5c:	213a0e03          	lb	x28,531(x20)
  60:	3b01                	.insn	2, 0x3b01
  62:	3905                	.insn	2, 0x3905
  64:	0013490b          	.insn	4, 0x0013490b
  68:	0300                	.insn	2, 0x0300
  6a:	0034                	.insn	2, 0x0034
  6c:	213a0803          	lb	x16,531(x20)
  70:	3b01                	.insn	2, 0x3b01
  72:	3905                	.insn	2, 0x3905
  74:	0013490b          	.insn	4, 0x0013490b
  78:	0400                	.insn	2, 0x0400
  7a:	0048                	.insn	2, 0x0048
  7c:	017d                	.insn	2, 0x017d
  7e:	0000137f 0b002405 	.insn	12, 0x030b3e0b0b0024050000137f
  86:	030b3e0b 
  8a:	000e                	.insn	2, 0x000e
  8c:	0600                	.insn	2, 0x0600
  8e:	1301010b          	.insn	4, 0x1301010b
  92:	0000                	.insn	2, 0x
  94:	31003407          	.insn	4, 0x31003407
  98:	00180213          	addi	x4,x16,1 # 1 <_heap_size+0x1>
  9c:	0800                	.insn	2, 0x0800
  9e:	0016                	.insn	2, 0x0016
  a0:	213a0e03          	lb	x28,531(x20)
  a4:	3b02                	.insn	2, 0x3b02
  a6:	490b390b          	.insn	4, 0x490b390b
  aa:	09000013          	addi	x0,x0,144
  ae:	1331010b          	.insn	4, 0x1331010b
  b2:	1755                	.insn	2, 0x1755
  b4:	1301                	.insn	2, 0x1301
  b6:	0000                	.insn	2, 0x
  b8:	0b0a                	.insn	2, 0x0b0a
  ba:	3101                	.insn	2, 0x3101
  bc:	12011113          	.insn	4, 0x12011113
  c0:	0106                	.insn	2, 0x0106
  c2:	0b000013          	addi	x0,x0,176
  c6:	0034                	.insn	2, 0x0034
  c8:	1331                	.insn	2, 0x1331
  ca:	0000                	.insn	2, 0x
  cc:	260c                	.insn	2, 0x260c
  ce:	4900                	.insn	2, 0x4900
  d0:	0d000013          	addi	x0,x0,208
  d4:	0005                	.insn	2, 0x0005
  d6:	1331                	.insn	2, 0x1331
  d8:	1702                	.insn	2, 0x1702
  da:	0000                	.insn	2, 0x
  dc:	0b0e                	.insn	2, 0x0b0e
  de:	3101                	.insn	2, 0x3101
  e0:	00175513          	srli	x10,x14,0x1
  e4:	0f00                	.insn	2, 0x0f00
  e6:	0005                	.insn	2, 0x0005
  e8:	213a0803          	lb	x16,531(x20)
  ec:	3b01                	.insn	2, 0x3b01
  ee:	e321                	.insn	2, 0xe321
  f0:	490b3907          	.insn	4, 0x490b3907
  f4:	10000013          	addi	x0,x0,256
  f8:	0000010b          	.insn	4, 0x010b
  fc:	2e11                	.insn	2, 0x2e11
  fe:	3f00                	.insn	2, 0x3f00
 100:	3c19                	.insn	2, 0x3c19
 102:	6e19                	.insn	2, 0x6e19
 104:	030e                	.insn	2, 0x030e
 106:	000e                	.insn	2, 0x000e
 108:	1200                	.insn	2, 0x1200
 10a:	000d                	.insn	2, 0x000d
 10c:	213a0803          	lb	x16,531(x20)
 110:	3b02                	.insn	2, 0x3b02
 112:	3905                	.insn	2, 0x3905
 114:	0013490b          	.insn	4, 0x0013490b
 118:	1300                	.insn	2, 0x1300
 11a:	0005                	.insn	2, 0x0005
 11c:	213a0803          	lb	x16,531(x20)
 120:	3b01                	.insn	2, 0x3b01
 122:	9221                	.insn	2, 0x9221
 124:	390a                	.insn	2, 0x390a
 126:	0213490b          	.insn	4, 0x0213490b
 12a:	14000017          	auipc	x0,0x14000
 12e:	0111                	.insn	2, 0x0111
 130:	0e25                	.insn	2, 0x0e25
 132:	1f030b13          	addi	x22,x6,496
 136:	01111f1b          	.insn	4, 0x01111f1b
 13a:	0612                	.insn	2, 0x0612
 13c:	1710                	.insn	2, 0x1710
 13e:	0000                	.insn	2, 0x
 140:	2415                	.insn	2, 0x2415
 142:	0b00                	.insn	2, 0x0b00
 144:	030b3e0b          	.insn	4, 0x030b3e0b
 148:	0008                	.insn	2, 0x0008
 14a:	1600                	.insn	2, 0x1600
 14c:	0e030113          	addi	x2,x6,224
 150:	0b3a0b0b          	.insn	4, 0x0b3a0b0b
 154:	0b39053b          	.insn	4, 0x0b39053b
 158:	1301                	.insn	2, 0x1301
 15a:	0000                	.insn	2, 0x
 15c:	03000d17          	auipc	x26,0x3000
 160:	3a08                	.insn	2, 0x3a08
 162:	39053b0b          	.insn	4, 0x39053b0b
 166:	3813490b          	.insn	4, 0x3813490b
 16a:	1800000b          	.insn	4, 0x1800000b
 16e:	000d                	.insn	2, 0x000d
 170:	0b3a0e03          	lb	x28,179(x20)
 174:	0b39053b          	.insn	4, 0x0b39053b
 178:	1349                	.insn	2, 0x1349
 17a:	0b38                	.insn	2, 0x0b38
 17c:	0000                	.insn	2, 0x
 17e:	1719                	.insn	2, 0x1719
 180:	0b01                	.insn	2, 0x0b01
 182:	3b0b3a0b          	.insn	4, 0x3b0b3a0b
 186:	3905                	.insn	2, 0x3905
 188:	0013010b          	.insn	4, 0x0013010b
 18c:	1a00                	.insn	2, 0x1a00
 18e:	0016                	.insn	2, 0x0016
 190:	0b3a0e03          	lb	x28,179(x20)
 194:	0b39053b          	.insn	4, 0x0b39053b
 198:	1349                	.insn	2, 0x1349
 19a:	0000                	.insn	2, 0x
 19c:	4901011b          	.insn	4, 0x4901011b
 1a0:	00130113          	addi	x2,x6,1
 1a4:	1c00                	.insn	2, 0x1c00
 1a6:	0021                	.insn	2, 0x0021
 1a8:	1349                	.insn	2, 0x1349
 1aa:	00000b2f          	.insn	4, 0x0b2f
 1ae:	341d                	.insn	2, 0x341d
 1b0:	0300                	.insn	2, 0x0300
 1b2:	3a0e                	.insn	2, 0x3a0e
 1b4:	39053b0b          	.insn	4, 0x39053b0b
 1b8:	3f13490b          	.insn	4, 0x3f13490b
 1bc:	3c19                	.insn	2, 0x3c19
 1be:	0019                	.insn	2, 0x0019
 1c0:	1e00                	.insn	2, 0x1e00
 1c2:	012e                	.insn	2, 0x012e
 1c4:	0e03193f 053b0b3a 	.insn	8, 0x053b0b3a0e03193f
 1cc:	0b39                	.insn	2, 0x0b39
 1ce:	13491927          	.insn	4, 0x13491927
 1d2:	0111                	.insn	2, 0x0111
 1d4:	0612                	.insn	2, 0x0612
 1d6:	1840                	.insn	2, 0x1840
 1d8:	197a                	.insn	2, 0x197a
 1da:	1301                	.insn	2, 0x1301
 1dc:	0000                	.insn	2, 0x
 1de:	1d1f 3101 5213      	.insn	6, 0x521331011d1f
 1e4:	5501                	.insn	2, 0x5501
 1e6:	590b5817          	auipc	x16,0x590b5
 1ea:	5705                	.insn	2, 0x5705
 1ec:	2000000b          	.insn	4, 0x2000000b
 1f0:	1755010b          	.insn	4, 0x1755010b
 1f4:	0000                	.insn	2, 0x
 1f6:	2e21                	.insn	2, 0x2e21
 1f8:	0301                	.insn	2, 0x0301
 1fa:	3a0e                	.insn	2, 0x3a0e
 1fc:	39053b0b          	.insn	4, 0x39053b0b
 200:	4919270b          	.insn	4, 0x4919270b
 204:	010b2013          	slti	x0,x22,16
 208:	22000013          	addi	x0,x0,544
 20c:	0b0b000f          	.insn	4, 0x0b0b000f
 210:	1349                	.insn	2, 0x1349
 212:	0000                	.insn	2, 0x
 214:	0100                	.insn	2, 0x0100
 216:	0034                	.insn	2, 0x0034
 218:	1331                	.insn	2, 0x1331
 21a:	1702                	.insn	2, 0x1702
 21c:	0000                	.insn	2, 0x
 21e:	3402                	.insn	2, 0x3402
 220:	0300                	.insn	2, 0x0300
 222:	3a0e                	.insn	2, 0x3a0e
 224:	0121                	.insn	2, 0x0121
 226:	0b39053b          	.insn	4, 0x0b39053b
 22a:	1349                	.insn	2, 0x1349
 22c:	0000                	.insn	2, 0x
 22e:	03003403          	.insn	4, 0x03003403
 232:	3a08                	.insn	2, 0x3a08
 234:	0121                	.insn	2, 0x0121
 236:	0b39053b          	.insn	4, 0x0b39053b
 23a:	1349                	.insn	2, 0x1349
 23c:	0000                	.insn	2, 0x
 23e:	2404                	.insn	2, 0x2404
 240:	0b00                	.insn	2, 0x0b00
 242:	030b3e0b          	.insn	4, 0x030b3e0b
 246:	000e                	.insn	2, 0x000e
 248:	0500                	.insn	2, 0x0500
 24a:	0048                	.insn	2, 0x0048
 24c:	017d                	.insn	2, 0x017d
 24e:	0000137f 31003406 	.insn	12, 0x00180213310034060000137f
 256:	00180213 
 25a:	0700                	.insn	2, 0x0700
 25c:	1301010b          	.insn	4, 0x1301010b
 260:	0000                	.insn	2, 0x
 262:	3408                	.insn	2, 0x3408
 264:	3100                	.insn	2, 0x3100
 266:	09000013          	addi	x0,x0,144
 26a:	1331010b          	.insn	4, 0x1331010b
 26e:	0111                	.insn	2, 0x0111
 270:	0612                	.insn	2, 0x0612
 272:	1301                	.insn	2, 0x1301
 274:	0000                	.insn	2, 0x
 276:	0b0a                	.insn	2, 0x0b0a
 278:	3101                	.insn	2, 0x3101
 27a:	01175513          	srli	x10,x14,0x11
 27e:	0b000013          	addi	x0,x0,176
 282:	0016                	.insn	2, 0x0016
 284:	213a0e03          	lb	x28,531(x20)
 288:	3b02                	.insn	2, 0x3b02
 28a:	490b390b          	.insn	4, 0x490b390b
 28e:	0c000013          	addi	x0,x0,192
 292:	0026                	.insn	2, 0x0026
 294:	1349                	.insn	2, 0x1349
 296:	0000                	.insn	2, 0x
 298:	050d                	.insn	2, 0x050d
 29a:	3100                	.insn	2, 0x3100
 29c:	00170213          	addi	x4,x14,1
 2a0:	0e00                	.insn	2, 0x0e00
 2a2:	0005                	.insn	2, 0x0005
 2a4:	213a0803          	lb	x16,531(x20)
 2a8:	3b01                	.insn	2, 0x3b01
 2aa:	e321                	.insn	2, 0xe321
 2ac:	490b3907          	.insn	4, 0x490b3907
 2b0:	0f000013          	addi	x0,x0,240
 2b4:	0000010b          	.insn	4, 0x010b
 2b8:	2e10                	.insn	2, 0x2e10
 2ba:	3f00                	.insn	2, 0x3f00
 2bc:	3c19                	.insn	2, 0x3c19
 2be:	6e19                	.insn	2, 0x6e19
 2c0:	030e                	.insn	2, 0x030e
 2c2:	000e                	.insn	2, 0x000e
 2c4:	1100                	.insn	2, 0x1100
 2c6:	000d                	.insn	2, 0x000d
 2c8:	213a0803          	lb	x16,531(x20)
 2cc:	3b02                	.insn	2, 0x3b02
 2ce:	3905                	.insn	2, 0x3905
 2d0:	0013490b          	.insn	4, 0x0013490b
 2d4:	1200                	.insn	2, 0x1200
 2d6:	0005                	.insn	2, 0x0005
 2d8:	213a0803          	lb	x16,531(x20)
 2dc:	3b01                	.insn	2, 0x3b01
 2de:	8621                	.insn	2, 0x8621
 2e0:	390a                	.insn	2, 0x390a
 2e2:	0213490b          	.insn	4, 0x0213490b
 2e6:	13000017          	auipc	x0,0x13000
 2ea:	1331010b          	.insn	4, 0x1331010b
 2ee:	0111                	.insn	2, 0x0111
 2f0:	0612                	.insn	2, 0x0612
 2f2:	0000                	.insn	2, 0x
 2f4:	1114                	.insn	2, 0x1114
 2f6:	2501                	.insn	2, 0x2501
 2f8:	130e                	.insn	2, 0x130e
 2fa:	1b1f030b          	.insn	4, 0x1b1f030b
 2fe:	111f 1201 1006      	.insn	6, 0x10061201111f
 304:	15000017          	auipc	x0,0x15000
 308:	0024                	.insn	2, 0x0024
 30a:	0b3e0b0b          	.insn	4, 0x0b3e0b0b
 30e:	00000803          	lb	x16,0(x0) # 0 <_heap_size>
 312:	1316                	.insn	2, 0x1316
 314:	0301                	.insn	2, 0x0301
 316:	0b0e                	.insn	2, 0x0b0e
 318:	3b0b3a0b          	.insn	4, 0x3b0b3a0b
 31c:	3905                	.insn	2, 0x3905
 31e:	0013010b          	.insn	4, 0x0013010b
 322:	1700                	.insn	2, 0x1700
 324:	000d                	.insn	2, 0x000d
 326:	0b3a0803          	lb	x16,179(x20)
 32a:	0b39053b          	.insn	4, 0x0b39053b
 32e:	1349                	.insn	2, 0x1349
 330:	0b38                	.insn	2, 0x0b38
 332:	0000                	.insn	2, 0x
 334:	0d18                	.insn	2, 0x0d18
 336:	0300                	.insn	2, 0x0300
 338:	3a0e                	.insn	2, 0x3a0e
 33a:	39053b0b          	.insn	4, 0x39053b0b
 33e:	3813490b          	.insn	4, 0x3813490b
 342:	1900000b          	.insn	4, 0x1900000b
 346:	0b0b0117          	auipc	x2,0xb0b0
 34a:	0b3a                	.insn	2, 0x0b3a
 34c:	0b39053b          	.insn	4, 0x0b39053b
 350:	1301                	.insn	2, 0x1301
 352:	0000                	.insn	2, 0x
 354:	161a                	.insn	2, 0x161a
 356:	0300                	.insn	2, 0x0300
 358:	3a0e                	.insn	2, 0x3a0e
 35a:	39053b0b          	.insn	4, 0x39053b0b
 35e:	0013490b          	.insn	4, 0x0013490b
 362:	1b00                	.insn	2, 0x1b00
 364:	0101                	.insn	2, 0x0101
 366:	1349                	.insn	2, 0x1349
 368:	1301                	.insn	2, 0x1301
 36a:	0000                	.insn	2, 0x
 36c:	211c                	.insn	2, 0x211c
 36e:	4900                	.insn	2, 0x4900
 370:	000b2f13          	slti	x30,x22,0
 374:	1d00                	.insn	2, 0x1d00
 376:	0034                	.insn	2, 0x0034
 378:	0b3a0e03          	lb	x28,179(x20)
 37c:	0b39053b          	.insn	4, 0x0b39053b
 380:	1349                	.insn	2, 0x1349
 382:	193c193f 2e1e0000 	.insn	8, 0x2e1e0000193c193f
 38a:	3f01                	.insn	2, 0x3f01
 38c:	0319                	.insn	2, 0x0319
 38e:	3a0e                	.insn	2, 0x3a0e
 390:	39053b0b          	.insn	4, 0x39053b0b
 394:	4919270b          	.insn	4, 0x4919270b
 398:	12011113          	.insn	4, 0x12011113
 39c:	4006                	.insn	2, 0x4006
 39e:	7a18                	.insn	2, 0x7a18
 3a0:	0119                	.insn	2, 0x0119
 3a2:	1f000013          	addi	x0,x0,496
 3a6:	0034                	.insn	2, 0x0034
 3a8:	0b3a0803          	lb	x16,179(x20)
 3ac:	0b39053b          	.insn	4, 0x0b39053b
 3b0:	1349                	.insn	2, 0x1349
 3b2:	1702                	.insn	2, 0x1702
 3b4:	0000                	.insn	2, 0x
 3b6:	1d20                	.insn	2, 0x1d20
 3b8:	3101                	.insn	2, 0x3101
 3ba:	55015213          	.insn	4, 0x55015213
 3be:	590b5817          	auipc	x16,0x590b5
 3c2:	5705                	.insn	2, 0x5705
 3c4:	2100000b          	.insn	4, 0x2100000b
 3c8:	1755010b          	.insn	4, 0x1755010b
 3cc:	0000                	.insn	2, 0x
 3ce:	0b22                	.insn	2, 0x0b22
 3d0:	3101                	.insn	2, 0x3101
 3d2:	00175513          	srli	x10,x14,0x1
 3d6:	2300                	.insn	2, 0x2300
 3d8:	012e                	.insn	2, 0x012e
 3da:	0b3a0e03          	lb	x28,179(x20)
 3de:	0b39053b          	.insn	4, 0x0b39053b
 3e2:	13491927          	.insn	4, 0x13491927
 3e6:	0b20                	.insn	2, 0x0b20
 3e8:	1301                	.insn	2, 0x1301
 3ea:	0000                	.insn	2, 0x
 3ec:	0f24                	.insn	2, 0x0f24
 3ee:	0b00                	.insn	2, 0x0b00
 3f0:	0013490b          	.insn	4, 0x0013490b
 3f4:	0000                	.insn	2, 0x
 3f6:	2401                	.insn	2, 0x2401
 3f8:	0b00                	.insn	2, 0x0b00
 3fa:	030b3e0b          	.insn	4, 0x030b3e0b
 3fe:	000e                	.insn	2, 0x000e
 400:	0200                	.insn	2, 0x0200
 402:	0026                	.insn	2, 0x0026
 404:	1349                	.insn	2, 0x1349
 406:	0000                	.insn	2, 0x
 408:	25011103          	lh	x2,592(x2) # b0b0596 <SYSCALL_ADDR+0x90a0596>
 40c:	130e                	.insn	2, 0x130e
 40e:	1b1f030b          	.insn	4, 0x1b1f030b
 412:	101f 0017 0400      	.insn	6, 0x04000017101f
 418:	0024                	.insn	2, 0x0024
 41a:	0b3e0b0b          	.insn	4, 0x0b3e0b0b
 41e:	00000803          	lb	x16,0(x0) # 0 <_heap_size>
 422:	1605                	.insn	2, 0x1605
 424:	0300                	.insn	2, 0x0300
 426:	3a0e                	.insn	2, 0x3a0e
 428:	390b3b0b          	.insn	4, 0x390b3b0b
 42c:	0013490b          	.insn	4, 0x0013490b
 430:	0600                	.insn	2, 0x0600
 432:	0101                	.insn	2, 0x0101
 434:	1349                	.insn	2, 0x1349
 436:	1301                	.insn	2, 0x1301
 438:	0000                	.insn	2, 0x
 43a:	49002107          	.insn	4, 0x49002107
 43e:	000b2f13          	slti	x30,x22,0
 442:	0800                	.insn	2, 0x0800
 444:	0034                	.insn	2, 0x0034
 446:	0b3a0e03          	lb	x28,179(x20)
 44a:	0b39053b          	.insn	4, 0x0b39053b
 44e:	1349                	.insn	2, 0x1349
 450:	193c193f 34090000 	.insn	8, 0x34090000193c193f
 458:	4700                	.insn	2, 0x4700
 45a:	3b0b3a13          	sltiu	x20,x22,944
 45e:	3905                	.insn	2, 0x3905
 460:	0018020b          	.insn	4, 0x0018020b
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
  10:	21f8                	.insn	2, 0x21f8
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
  30:	221c                	.insn	2, 0x221c
  32:	8000                	.insn	2, 0x8000
  34:	00b4                	.insn	2, 0x00b4
	...
  3e:	0000                	.insn	2, 0x
  40:	001c                	.insn	2, 0x001c
  42:	0000                	.insn	2, 0x
  44:	0002                	.insn	2, 0x0002
  46:	0090                	.insn	2, 0x0090
  48:	0000                	.insn	2, 0x
  4a:	0004                	.insn	2, 0x0004
  4c:	0000                	.insn	2, 0x
  4e:	0000                	.insn	2, 0x
  50:	651c                	.insn	2, 0x651c
  52:	8000                	.insn	2, 0x8000
  54:	05c4                	.insn	2, 0x05c4
	...
  5e:	0000                	.insn	2, 0x
  60:	001c                	.insn	2, 0x001c
  62:	0000                	.insn	2, 0x
  64:	0002                	.insn	2, 0x0002
  66:	09de                	.insn	2, 0x09de
  68:	0000                	.insn	2, 0x
  6a:	0004                	.insn	2, 0x0004
  6c:	0000                	.insn	2, 0x
  6e:	0000                	.insn	2, 0x
  70:	6ae0                	.insn	2, 0x6ae0
  72:	8000                	.insn	2, 0x8000
  74:	04d0                	.insn	2, 0x04d0
	...
  7e:	0000                	.insn	2, 0x
  80:	0014                	.insn	2, 0x0014
  82:	0000                	.insn	2, 0x
  84:	0002                	.insn	2, 0x0002
  86:	133c                	.insn	2, 0x133c
  88:	0000                	.insn	2, 0x
  8a:	0004                	.insn	2, 0x0004
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
 10a:	4400                	.insn	2, 0x4400
 10c:	696e7557          	.insn	4, 0x696e7557
 110:	5f006e6f          	jal	x28,6700 <_stack_size+0x5700>
 114:	755f 6964 6476      	.insn	6, 0x64766964755f
 11a:	3369                	.insn	2, 0x3369
 11c:	6300                	.insn	2, 0x6300
 11e:	6c706d6f          	jal	x26,6fe4 <_stack_size+0x5fe4>
 122:	7865                	.insn	2, 0x7865
 124:	6620                	.insn	2, 0x6620
 126:	6f6c                	.insn	2, 0x6f6c
 128:	7461                	.insn	2, 0x7461
 12a:	7300                	.insn	2, 0x7300
 12c:	6f68                	.insn	2, 0x6f68
 12e:	7472                	.insn	2, 0x7472
 130:	6920                	.insn	2, 0x6920
 132:	746e                	.insn	2, 0x746e
 134:	5f00                	.insn	2, 0x5f00
 136:	645f 0030 5f5f      	.insn	6, 0x5f5f0030645f
 13c:	6876                	.insn	2, 0x6876
 13e:	5f00                	.insn	2, 0x5f00
 140:	6f5f 3070 5f00      	.insn	6, 0x5f0030706f5f
 146:	6f5f 3170 6c00      	.insn	6, 0x6c0031706f5f
 14c:	20676e6f          	jal	x28,76352 <_stack_size+0x75352>
 150:	6f6c                	.insn	2, 0x6f6c
 152:	676e                	.insn	2, 0x676e
 154:	6920                	.insn	2, 0x6920
 156:	746e                	.insn	2, 0x746e
 158:	6c00                	.insn	2, 0x6c00
 15a:	20676e6f          	jal	x28,76360 <_stack_size+0x75360>
 15e:	6f6c                	.insn	2, 0x6f6c
 160:	676e                	.insn	2, 0x676e
 162:	7520                	.insn	2, 0x7520
 164:	736e                	.insn	2, 0x736e
 166:	6769                	.insn	2, 0x6769
 168:	656e                	.insn	2, 0x656e
 16a:	2064                	.insn	2, 0x2064
 16c:	6e69                	.insn	2, 0x6e69
 16e:	0074                	.insn	2, 0x0074
 170:	6968                	.insn	2, 0x6968
 172:	5f006867          	.insn	4, 0x5f006867
 176:	635f 7a6c 745f      	.insn	6, 0x745f7a6c635f
 17c:	6261                	.insn	2, 0x6261
 17e:	6300                	.insn	2, 0x6300
 180:	6c706d6f          	jal	x26,7046 <_stack_size+0x6046>
 184:	7865                	.insn	2, 0x7865
 186:	5f20                	.insn	2, 0x5f20
 188:	6c46                	.insn	2, 0x6c46
 18a:	3174616f          	jal	x2,46ca0 <_stack_size+0x45ca0>
 18e:	0036                	.insn	2, 0x0036
 190:	6e75                	.insn	2, 0x6e75
 192:	6e676973          	.insn	4, 0x6e676973
 196:	6465                	.insn	2, 0x6465
 198:	6320                	.insn	2, 0x6320
 19a:	6168                	.insn	2, 0x6168
 19c:	0072                	.insn	2, 0x0072
 19e:	20554e47          	.insn	4, 0x20554e47
 1a2:	20373143          	.insn	4, 0x20373143
 1a6:	3331                	.insn	2, 0x3331
 1a8:	322e                	.insn	2, 0x322e
 1aa:	302e                	.insn	2, 0x302e
 1ac:	2d20                	.insn	2, 0x2d20
 1ae:	636d                	.insn	2, 0x636d
 1b0:	6f6d                	.insn	2, 0x6f6d
 1b2:	6564                	.insn	2, 0x6564
 1b4:	3d6c                	.insn	2, 0x3d6c
 1b6:	656d                	.insn	2, 0x656d
 1b8:	6c64                	.insn	2, 0x6c64
 1ba:	2d20776f          	jal	x14,748c <_stack_size+0x648c>
 1be:	616d                	.insn	2, 0x616d
 1c0:	6962                	.insn	2, 0x6962
 1c2:	693d                	.insn	2, 0x693d
 1c4:	706c                	.insn	2, 0x706c
 1c6:	2d203233          	.insn	4, 0x2d203233
 1ca:	636d                	.insn	2, 0x636d
 1cc:	6f6d                	.insn	2, 0x6f6d
 1ce:	6564                	.insn	2, 0x6564
 1d0:	3d6c                	.insn	2, 0x3d6c
 1d2:	656d                	.insn	2, 0x656d
 1d4:	6c64                	.insn	2, 0x6c64
 1d6:	2d20776f          	jal	x14,74a8 <_stack_size+0x64a8>
 1da:	746d                	.insn	2, 0x746d
 1dc:	6e75                	.insn	2, 0x6e75
 1de:	3d65                	.insn	2, 0x3d65
 1e0:	6f72                	.insn	2, 0x6f72
 1e2:	74656b63          	bltu	x10,x6,938 <_heap_size+0x938>
 1e6:	2d20                	.insn	2, 0x2d20
 1e8:	696d                	.insn	2, 0x696d
 1ea:	732d6173          	.insn	4, 0x732d6173
 1ee:	6570                	.insn	2, 0x6570
 1f0:	30323d63          	.insn	4, 0x30323d63
 1f4:	3931                	.insn	2, 0x3931
 1f6:	3231                	.insn	2, 0x3231
 1f8:	3331                	.insn	2, 0x3331
 1fa:	2d20                	.insn	2, 0x2d20
 1fc:	616d                	.insn	2, 0x616d
 1fe:	6372                	.insn	2, 0x6372
 200:	3d68                	.insn	2, 0x3d68
 202:	7672                	.insn	2, 0x7672
 204:	20693233          	.insn	4, 0x20693233
 208:	672d                	.insn	2, 0x672d
 20a:	2d20                	.insn	2, 0x2d20
 20c:	2d20734f          	.insn	4, 0x2d20734f
 210:	2d20324f          	.insn	4, 0x2d20324f
 214:	2d20734f          	.insn	4, 0x2d20734f
 218:	6266                	.insn	2, 0x6266
 21a:	6975                	.insn	2, 0x6975
 21c:	646c                	.insn	2, 0x646c
 21e:	6e69                	.insn	2, 0x6e69
 220:	696c2d67          	.insn	4, 0x696c2d67
 224:	6762                	.insn	2, 0x6762
 226:	2d206363          	bltu	x0,x18,4ec <_heap_size+0x4ec>
 22a:	6e66                	.insn	2, 0x6e66
 22c:	74732d6f          	jal	x26,33172 <_stack_size+0x32172>
 230:	6361                	.insn	2, 0x6361
 232:	72702d6b          	.insn	4, 0x72702d6b
 236:	6365746f          	jal	x8,5786c <_stack_size+0x5686c>
 23a:	6f74                	.insn	2, 0x6f74
 23c:	2072                	.insn	2, 0x2072
 23e:	662d                	.insn	2, 0x662d
 240:	7361                	.insn	2, 0x7361
 242:	6e79                	.insn	2, 0x6e79
 244:	6f726863          	bltu	x4,x23,934 <_heap_size+0x934>
 248:	6f6e                	.insn	2, 0x6f6e
 24a:	7375                	.insn	2, 0x7375
 24c:	752d                	.insn	2, 0x752d
 24e:	776e                	.insn	2, 0x776e
 250:	6e69                	.insn	2, 0x6e69
 252:	2d64                	.insn	2, 0x2d64
 254:	6174                	.insn	2, 0x6174
 256:	6c62                	.insn	2, 0x6c62
 258:	7365                	.insn	2, 0x7365
 25a:	2d20                	.insn	2, 0x2d20
 25c:	7666                	.insn	2, 0x7666
 25e:	7369                	.insn	2, 0x7369
 260:	6269                	.insn	2, 0x6269
 262:	6c69                	.insn	2, 0x6c69
 264:	7469                	.insn	2, 0x7469
 266:	3d79                	.insn	2, 0x3d79
 268:	6968                	.insn	2, 0x6968
 26a:	6464                	.insn	2, 0x6464
 26c:	6e65                	.insn	2, 0x6e65
 26e:	5f00                	.insn	2, 0x5f00
 270:	785f 0030 5f5f      	.insn	6, 0x5f5f0030785f
 276:	3178                	.insn	2, 0x3178
 278:	5f00                	.insn	2, 0x5f00
 27a:	785f 0032 5f5f      	.insn	6, 0x5f5f0032785f
 280:	3378                	.insn	2, 0x3378
 282:	5500                	.insn	2, 0x5500
 284:	4951                	.insn	2, 0x4951
 286:	7974                	.insn	2, 0x7974
 288:	6570                	.insn	2, 0x6570
 28a:	4400                	.insn	2, 0x4400
 28c:	72747357          	.insn	4, 0x72747357
 290:	6375                	.insn	2, 0x6375
 292:	0074                	.insn	2, 0x0074
 294:	726f6873          	.insn	4, 0x726f6873
 298:	2074                	.insn	2, 0x2074
 29a:	6e75                	.insn	2, 0x6e75
 29c:	6e676973          	.insn	4, 0x6e676973
 2a0:	6465                	.insn	2, 0x6465
 2a2:	6920                	.insn	2, 0x6920
 2a4:	746e                	.insn	2, 0x746e
 2a6:	5500                	.insn	2, 0x5500
 2a8:	4944                	.insn	2, 0x4944
 2aa:	7974                	.insn	2, 0x7974
 2ac:	6570                	.insn	2, 0x6570
 2ae:	5f00                	.insn	2, 0x5f00
 2b0:	715f 0030 5f5f      	.insn	6, 0x5f5f0030715f
 2b6:	3171                	.insn	2, 0x3171
 2b8:	5f00                	.insn	2, 0x5f00
 2ba:	645f 0031 6f63      	.insn	6, 0x6f630031645f
 2c0:	706d                	.insn	2, 0x706d
 2c2:	656c                	.insn	2, 0x656c
 2c4:	2078                	.insn	2, 0x2078
 2c6:	6f64                	.insn	2, 0x6f64
 2c8:	6275                	.insn	2, 0x6275
 2ca:	656c                	.insn	2, 0x656c
 2cc:	5f00                	.insn	2, 0x5f00
 2ce:	765f 006c 5f5f      	.insn	6, 0x5f5f006c765f
 2d4:	6475                	.insn	2, 0x6475
 2d6:	7669                	.insn	2, 0x7669
 2d8:	6f6d                	.insn	2, 0x6f6d
 2da:	6464                	.insn	2, 0x6464
 2dc:	3469                	.insn	2, 0x3469
 2de:	6300                	.insn	2, 0x6300
 2e0:	6c706d6f          	jal	x26,71a6 <_stack_size+0x61a6>
 2e4:	7865                	.insn	2, 0x7865
 2e6:	6c20                	.insn	2, 0x6c20
 2e8:	20676e6f          	jal	x28,764ee <_stack_size+0x754ee>
 2ec:	6f64                	.insn	2, 0x6f64
 2ee:	6275                	.insn	2, 0x6275
 2f0:	656c                	.insn	2, 0x656c
 2f2:	5500                	.insn	2, 0x5500
 2f4:	79744953          	.insn	4, 0x79744953
 2f8:	6570                	.insn	2, 0x6570
 2fa:	5f00                	.insn	2, 0x5f00
 2fc:	785f 0072 5f5f      	.insn	6, 0x5f5f0072785f
 302:	3072                	.insn	2, 0x3072
 304:	5f00                	.insn	2, 0x5f00
 306:	725f 0031 5f5f      	.insn	6, 0x5f5f0031725f
 30c:	6875                	.insn	2, 0x6875
 30e:	5f00                	.insn	2, 0x5f00
 310:	755f 006c 5f5f      	.insn	6, 0x5f5f006c755f
 316:	6d75                	.insn	2, 0x6d75
 318:	6964646f          	jal	x8,469ae <_stack_size+0x459ae>
 31c:	4e470033          	.insn	4, 0x4e470033
 320:	2055                	.insn	2, 0x2055
 322:	20373143          	.insn	4, 0x20373143
 326:	3331                	.insn	2, 0x3331
 328:	322e                	.insn	2, 0x322e
 32a:	302e                	.insn	2, 0x302e
 32c:	2d20                	.insn	2, 0x2d20
 32e:	636d                	.insn	2, 0x636d
 330:	6f6d                	.insn	2, 0x6f6d
 332:	6564                	.insn	2, 0x6564
 334:	3d6c                	.insn	2, 0x3d6c
 336:	656d                	.insn	2, 0x656d
 338:	6c64                	.insn	2, 0x6c64
 33a:	2d20776f          	jal	x14,760c <_stack_size+0x660c>
 33e:	616d                	.insn	2, 0x616d
 340:	6962                	.insn	2, 0x6962
 342:	693d                	.insn	2, 0x693d
 344:	706c                	.insn	2, 0x706c
 346:	2d203233          	.insn	4, 0x2d203233
 34a:	636d                	.insn	2, 0x636d
 34c:	6f6d                	.insn	2, 0x6f6d
 34e:	6564                	.insn	2, 0x6564
 350:	3d6c                	.insn	2, 0x3d6c
 352:	656d                	.insn	2, 0x656d
 354:	6c64                	.insn	2, 0x6c64
 356:	2d20776f          	jal	x14,7628 <_stack_size+0x6628>
 35a:	746d                	.insn	2, 0x746d
 35c:	6e75                	.insn	2, 0x6e75
 35e:	3d65                	.insn	2, 0x3d65
 360:	6f72                	.insn	2, 0x6f72
 362:	74656b63          	bltu	x10,x6,ab8 <_heap_size+0xab8>
 366:	2d20                	.insn	2, 0x2d20
 368:	696d                	.insn	2, 0x696d
 36a:	732d6173          	.insn	4, 0x732d6173
 36e:	6570                	.insn	2, 0x6570
 370:	30323d63          	.insn	4, 0x30323d63
 374:	3931                	.insn	2, 0x3931
 376:	3231                	.insn	2, 0x3231
 378:	3331                	.insn	2, 0x3331
 37a:	2d20                	.insn	2, 0x2d20
 37c:	616d                	.insn	2, 0x616d
 37e:	6372                	.insn	2, 0x6372
 380:	3d68                	.insn	2, 0x3d68
 382:	7672                	.insn	2, 0x7672
 384:	20693233          	.insn	4, 0x20693233
 388:	672d                	.insn	2, 0x672d
 38a:	2d20                	.insn	2, 0x2d20
 38c:	2d20734f          	.insn	4, 0x2d20734f
 390:	2d20324f          	.insn	4, 0x2d20324f
 394:	2d20734f          	.insn	4, 0x2d20734f
 398:	6266                	.insn	2, 0x6266
 39a:	6975                	.insn	2, 0x6975
 39c:	646c                	.insn	2, 0x646c
 39e:	6e69                	.insn	2, 0x6e69
 3a0:	696c2d67          	.insn	4, 0x696c2d67
 3a4:	6762                	.insn	2, 0x6762
 3a6:	2d206363          	bltu	x0,x18,66c <_heap_size+0x66c>
 3aa:	6e66                	.insn	2, 0x6e66
 3ac:	74732d6f          	jal	x26,332f2 <_stack_size+0x322f2>
 3b0:	6361                	.insn	2, 0x6361
 3b2:	72702d6b          	.insn	4, 0x72702d6b
 3b6:	6365746f          	jal	x8,579ec <_stack_size+0x569ec>
 3ba:	6f74                	.insn	2, 0x6f74
 3bc:	2072                	.insn	2, 0x2072
 3be:	662d                	.insn	2, 0x662d
 3c0:	6976                	.insn	2, 0x6976
 3c2:	69626973          	.insn	4, 0x69626973
 3c6:	696c                	.insn	2, 0x696c
 3c8:	7974                	.insn	2, 0x7974
 3ca:	683d                	.insn	2, 0x683d
 3cc:	6469                	.insn	2, 0x6469
 3ce:	6564                	.insn	2, 0x6564
 3d0:	006e                	.insn	2, 0x006e

Disassembly of section .debug_loclists:

00000000 <.debug_loclists>:
   0:	0772                	.insn	2, 0x0772
   2:	0000                	.insn	2, 0x
   4:	0005                	.insn	2, 0x0005
   6:	0004                	.insn	2, 0x0004
   8:	0000                	.insn	2, 0x
   a:	0000                	.insn	2, 0x
   c:	0004                	.insn	2, 0x0004
   e:	01a0                	.insn	2, 0x01a0
  10:	5a06                	.insn	2, 0x5a06
  12:	935b0493          	addi	x9,x22,-1739
  16:	0404                	.insn	2, 0x0404
  18:	01a0                	.insn	2, 0x01a0
  1a:	02e4                	.insn	2, 0x02e4
  1c:	a306                	.insn	2, 0xa306
  1e:	260aa503          	lw	x10,608(x21)
  22:	049f 02e4 03b8      	.insn	6, 0x03b802e4049f
  28:	5a06                	.insn	2, 0x5a06
  2a:	935b0493          	addi	x9,x22,-1739
  2e:	0404                	.insn	2, 0x0404
  30:	03b8                	.insn	2, 0x03b8
  32:	05bc                	.insn	2, 0x05bc
  34:	a306                	.insn	2, 0xa306
  36:	260aa503          	lw	x10,608(x21)
  3a:	049f 05bc 05f4      	.insn	6, 0x05f405bc049f
  40:	5a06                	.insn	2, 0x5a06
  42:	935b0493          	addi	x9,x22,-1739
  46:	0404                	.insn	2, 0x0404
  48:	05f4                	.insn	2, 0x05f4
  4a:	07bc                	.insn	2, 0x07bc
  4c:	a306                	.insn	2, 0xa306
  4e:	260aa503          	lw	x10,608(x21)
  52:	049f 07bc 07dc      	.insn	6, 0x07dc07bc049f
  58:	5a06                	.insn	2, 0x5a06
  5a:	935b0493          	addi	x9,x22,-1739
  5e:	0404                	.insn	2, 0x0404
  60:	07dc                	.insn	2, 0x07dc
  62:	088c                	.insn	2, 0x088c
  64:	a306                	.insn	2, 0xa306
  66:	260aa503          	lw	x10,608(x21)
  6a:	049f 088c 08a0      	.insn	6, 0x08a0088c049f
  70:	5a06                	.insn	2, 0x5a06
  72:	935b0493          	addi	x9,x22,-1739
  76:	0404                	.insn	2, 0x0404
  78:	08a0                	.insn	2, 0x08a0
  7a:	0bb8                	.insn	2, 0x0bb8
  7c:	a306                	.insn	2, 0xa306
  7e:	260aa503          	lw	x10,608(x21)
  82:	049f 0bb8 0bc4      	.insn	6, 0x0bc40bb8049f
  88:	5a06                	.insn	2, 0x5a06
  8a:	935b0493          	addi	x9,x22,-1739
  8e:	0004                	.insn	2, 0x0004
  90:	0004                	.insn	2, 0x0004
  92:	5c0601a7          	.insn	4, 0x5c0601a7
  96:	935d0493          	addi	x9,x26,-1739 # 2fffa91 <SYSCALL_ADDR+0xfefa91>
  9a:	0404                	.insn	2, 0x0404
  9c:	02e401a7          	.insn	4, 0x02e401a7
  a0:	a306                	.insn	2, 0xa306
  a2:	260ca503          	lw	x10,608(x25)
  a6:	049f 02e4 03b8      	.insn	6, 0x03b802e4049f
  ac:	5c06                	.insn	2, 0x5c06
  ae:	935d0493          	addi	x9,x26,-1739
  b2:	0404                	.insn	2, 0x0404
  b4:	03b8                	.insn	2, 0x03b8
  b6:	05bc                	.insn	2, 0x05bc
  b8:	a306                	.insn	2, 0xa306
  ba:	260ca503          	lw	x10,608(x25)
  be:	049f 05bc 05fb      	.insn	6, 0x05fb05bc049f
  c4:	5c06                	.insn	2, 0x5c06
  c6:	935d0493          	addi	x9,x26,-1739
  ca:	0404                	.insn	2, 0x0404
  cc:	07bc05fb          	.insn	4, 0x07bc05fb
  d0:	a306                	.insn	2, 0xa306
  d2:	260ca503          	lw	x10,608(x25)
  d6:	049f 07bc 08d7      	.insn	6, 0x08d707bc049f
  dc:	5c06                	.insn	2, 0x5c06
  de:	935d0493          	addi	x9,x26,-1739
  e2:	0404                	.insn	2, 0x0404
  e4:	0bb808d7          	.insn	4, 0x0bb808d7
  e8:	a306                	.insn	2, 0xa306
  ea:	260ca503          	lw	x10,608(x25)
  ee:	049f 0bb8 0bc4      	.insn	6, 0x0bc40bb8049f
  f4:	5c06                	.insn	2, 0x5c06
  f6:	935d0493          	addi	x9,x26,-1739
  fa:	0004                	.insn	2, 0x0004
  fc:	0004                	.insn	2, 0x0004
  fe:	0580                	.insn	2, 0x0580
 100:	3002                	.insn	2, 0x3002
 102:	049f 05bc 0bc4      	.insn	6, 0x0bc405bc049f
 108:	3002                	.insn	2, 0x3002
 10a:	009f 0004 0664      	.insn	6, 0x06640004009f
 110:	935c                	.insn	2, 0x935c
 112:	5d04                	.insn	2, 0x5d04
 114:	e4040493          	addi	x9,x8,-448
 118:	e802                	.insn	2, 0xe802
 11a:	0602                	.insn	2, 0x0602
 11c:	935c                	.insn	2, 0x935c
 11e:	5d04                	.insn	2, 0x5d04
 120:	f8040493          	addi	x9,x8,-128
 124:	9402                	.insn	2, 0x9402
 126:	935c0603          	lb	x12,-1739(x24)
 12a:	5d04                	.insn	2, 0x5d04
 12c:	bc040493          	addi	x9,x8,-1088
 130:	c005                	.insn	2, 0xc005
 132:	0605                	.insn	2, 0x0605
 134:	935c                	.insn	2, 0x935c
 136:	5d04                	.insn	2, 0x5d04
 138:	bc040493          	addi	x9,x8,-1088
 13c:	0608a407          	.insn	4, 0x0608a407
 140:	935c                	.insn	2, 0x935c
 142:	5d04                	.insn	2, 0x5d04
 144:	b8040493          	addi	x9,x8,-1152
 148:	060bc40b          	.insn	4, 0x060bc40b
 14c:	935c                	.insn	2, 0x935c
 14e:	5d04                	.insn	2, 0x5d04
 150:	04000493          	addi	x9,x0,64
 154:	9c00                	.insn	2, 0x9c00
 156:	0601                	.insn	2, 0x0601
 158:	935a                	.insn	2, 0x935a
 15a:	5b04                	.insn	2, 0x5b04
 15c:	e4040493          	addi	x9,x8,-448
 160:	b802                	.insn	2, 0xb802
 162:	93590603          	lb	x12,-1739(x18)
 166:	5b04                	.insn	2, 0x5b04
 168:	bc040493          	addi	x9,x8,-1088
 16c:	e005                	.insn	2, 0xe005
 16e:	0605                	.insn	2, 0x0605
 170:	9359                	.insn	2, 0x9359
 172:	5b04                	.insn	2, 0x5b04
 174:	bc040493          	addi	x9,x8,-1088
 178:	0607dc07          	.insn	4, 0x0607dc07
 17c:	935a                	.insn	2, 0x935a
 17e:	5b04                	.insn	2, 0x5b04
 180:	dc040493          	addi	x9,x8,-576
 184:	06088c07          	.insn	4, 0x06088c07
 188:	9364                	.insn	2, 0x9364
 18a:	5b04                	.insn	2, 0x5b04
 18c:	8c040493          	addi	x9,x8,-1856
 190:	a008                	.insn	2, 0xa008
 192:	0608                	.insn	2, 0x0608
 194:	935a                	.insn	2, 0x935a
 196:	5b04                	.insn	2, 0x5b04
 198:	a0040493          	addi	x9,x8,-1536
 19c:	bc08                	.insn	2, 0xbc08
 19e:	0608                	.insn	2, 0x0608
 1a0:	9364                	.insn	2, 0x9364
 1a2:	5b04                	.insn	2, 0x5b04
 1a4:	b8040493          	addi	x9,x8,-1152
 1a8:	060bc40b          	.insn	4, 0x060bc40b
 1ac:	935a                	.insn	2, 0x935a
 1ae:	5b04                	.insn	2, 0x5b04
 1b0:	04000493          	addi	x9,x0,64
 1b4:	8000                	.insn	2, 0x8000
 1b6:	0101                	.insn	2, 0x0101
 1b8:	045c                	.insn	2, 0x045c
 1ba:	0180                	.insn	2, 0x0180
 1bc:	018c                	.insn	2, 0x018c
 1be:	7c09                	.insn	2, 0x7c09
 1c0:	7e00                	.insn	2, 0x7e00
 1c2:	0800                	.insn	2, 0x0800
 1c4:	9f241aff dc018c04 	.insn	12, 0x04630102dc018c049f241aff
 1cc:	04630102 
 1d0:	02e4                	.insn	2, 0x02e4
 1d2:	0388                	.insn	2, 0x0388
 1d4:	5c01                	.insn	2, 0x5c01
 1d6:	b804                	.insn	2, 0xb804
 1d8:	01058003          	lb	x0,16(x11)
 1dc:	05bc0463          	beq	x24,x27,224 <_heap_size+0x224>
 1e0:	05d0                	.insn	2, 0x05d0
 1e2:	5c01                	.insn	2, 0x5c01
 1e4:	d404                	.insn	2, 0xd404
 1e6:	bc05                	.insn	2, 0xbc05
 1e8:	04630107          	.insn	4, 0x04630107
 1ec:	07bc                	.insn	2, 0x07bc
 1ee:	08d0                	.insn	2, 0x08d0
 1f0:	5c01                	.insn	2, 0x5c01
 1f2:	d004                	.insn	2, 0xd004
 1f4:	a808                	.insn	2, 0xa808
 1f6:	010a                	.insn	2, 0x010a
 1f8:	0458                	.insn	2, 0x0458
 1fa:	0bb8                	.insn	2, 0x0bb8
 1fc:	0bc4                	.insn	2, 0x0bc4
 1fe:	5c01                	.insn	2, 0x5c01
 200:	0400                	.insn	2, 0x0400
 202:	6400                	.insn	2, 0x6400
 204:	5d01                	.insn	2, 0x5d01
 206:	e404                	.insn	2, 0xe404
 208:	e802                	.insn	2, 0xe802
 20a:	0102                	.insn	2, 0x0102
 20c:	045d                	.insn	2, 0x045d
 20e:	02f8                	.insn	2, 0x02f8
 210:	0394                	.insn	2, 0x0394
 212:	5d01                	.insn	2, 0x5d01
 214:	bc04                	.insn	2, 0xbc04
 216:	c005                	.insn	2, 0xc005
 218:	0105                	.insn	2, 0x0105
 21a:	045d                	.insn	2, 0x045d
 21c:	07bc                	.insn	2, 0x07bc
 21e:	08a4                	.insn	2, 0x08a4
 220:	5d01                	.insn	2, 0x5d01
 222:	ac04                	.insn	2, 0xac04
 224:	b808                	.insn	2, 0xb808
 226:	0466010b          	.insn	4, 0x0466010b
 22a:	0bb8                	.insn	2, 0x0bb8
 22c:	0bc4                	.insn	2, 0x0bc4
 22e:	5d01                	.insn	2, 0x5d01
 230:	0400                	.insn	2, 0x0400
 232:	9400                	.insn	2, 0x9400
 234:	0101                	.insn	2, 0x0101
 236:	045a                	.insn	2, 0x045a
 238:	0194                	.insn	2, 0x0194
 23a:	02ac                	.insn	2, 0x02ac
 23c:	5901                	.insn	2, 0x5901
 23e:	e404                	.insn	2, 0xe404
 240:	d002                	.insn	2, 0xd002
 242:	0104                	.insn	2, 0x0104
 244:	0459                	.insn	2, 0x0459
 246:	05bc                	.insn	2, 0x05bc
 248:	07bc                	.insn	2, 0x07bc
 24a:	5901                	.insn	2, 0x5901
 24c:	bc04                	.insn	2, 0xbc04
 24e:	0107dc07          	.insn	4, 0x0107dc07
 252:	045a                	.insn	2, 0x045a
 254:	07dc                	.insn	2, 0x07dc
 256:	088c                	.insn	2, 0x088c
 258:	6401                	.insn	2, 0x6401
 25a:	8c04                	.insn	2, 0x8c04
 25c:	a008                	.insn	2, 0xa008
 25e:	0108                	.insn	2, 0x0108
 260:	045a                	.insn	2, 0x045a
 262:	08a0                	.insn	2, 0x08a0
 264:	08d0                	.insn	2, 0x08d0
 266:	6401                	.insn	2, 0x6401
 268:	d004                	.insn	2, 0xd004
 26a:	ac08                	.insn	2, 0xac08
 26c:	0084060b          	.insn	4, 0x0084060b
 270:	0082                	.insn	2, 0x0082
 272:	9f24                	.insn	2, 0x9f24
 274:	b804                	.insn	2, 0xb804
 276:	010bc40b          	.insn	4, 0x010bc40b
 27a:	005a                	.insn	2, 0x005a
 27c:	0004                	.insn	2, 0x0004
 27e:	0190                	.insn	2, 0x0190
 280:	5b01                	.insn	2, 0x5b01
 282:	9004                	.insn	2, 0x9004
 284:	dc01                	.insn	2, 0xdc01
 286:	0101                	.insn	2, 0x0101
 288:	0462                	.insn	2, 0x0462
 28a:	02e4                	.insn	2, 0x02e4
 28c:	03b4                	.insn	2, 0x03b4
 28e:	5b01                	.insn	2, 0x5b01
 290:	b404                	.insn	2, 0xb404
 292:	01048003          	lb	x0,16(x9)
 296:	0464                	.insn	2, 0x0464
 298:	05bc                	.insn	2, 0x05bc
 29a:	05e0                	.insn	2, 0x05e0
 29c:	5b01                	.insn	2, 0x5b01
 29e:	e804                	.insn	2, 0xe804
 2a0:	b805                	.insn	2, 0xb805
 2a2:	04650107          	.insn	4, 0x04650107
 2a6:	07b8                	.insn	2, 0x07b8
 2a8:	07bc                	.insn	2, 0x07bc
 2aa:	6401                	.insn	2, 0x6401
 2ac:	bc04                	.insn	2, 0xbc04
 2ae:	0108bc07          	.insn	4, 0x0108bc07
 2b2:	08d0045b          	.insn	4, 0x08d0045b
 2b6:	0aa0                	.insn	2, 0x0aa0
 2b8:	6301                	.insn	2, 0x6301
 2ba:	a004                	.insn	2, 0xa004
 2bc:	a40a                	.insn	2, 0xa40a
 2be:	045e010b          	.insn	4, 0x045e010b
 2c2:	0bb8                	.insn	2, 0x0bb8
 2c4:	0bc4                	.insn	2, 0x0bc4
 2c6:	5b01                	.insn	2, 0x5b01
 2c8:	0400                	.insn	2, 0x0400
 2ca:	05d8                	.insn	2, 0x05d8
 2cc:	06b0                	.insn	2, 0x06b0
 2ce:	6201                	.insn	2, 0x6201
 2d0:	d004                	.insn	2, 0xd004
 2d2:	8808                	.insn	2, 0x8808
 2d4:	0109                	.insn	2, 0x0109
 2d6:	0059                	.insn	2, 0x0059
 2d8:	dc04                	.insn	2, 0xdc04
 2da:	e402                	.insn	2, 0xe402
 2dc:	0102                	.insn	2, 0x0102
 2de:	045f 0aa0 0bb8      	.insn	6, 0x0bb80aa0045f
 2e4:	5f01                	.insn	2, 0x5f01
 2e6:	0400                	.insn	2, 0x0400
 2e8:	03b4                	.insn	2, 0x03b4
 2ea:	03b8                	.insn	2, 0x03b8
 2ec:	3102                	.insn	2, 0x3102
 2ee:	049f 03b8 0580      	.insn	6, 0x058003b8049f
 2f4:	6201                	.insn	2, 0x6201
 2f6:	b804                	.insn	2, 0xb804
 2f8:	0107bc07          	.insn	4, 0x0107bc07
 2fc:	0062                	.insn	2, 0x0062
 2fe:	d004                	.insn	2, 0xd004
 300:	e405                	.insn	2, 0xe405
 302:	0105                	.insn	2, 0x0105
 304:	045f 08a0 08b8      	.insn	6, 0x08b808a0045f
 30a:	6001                	.insn	2, 0x6001
 30c:	0400                	.insn	2, 0x0400
 30e:	a77c                	.insn	2, 0xa77c
 310:	0101                	.insn	2, 0x0101
 312:	045e                	.insn	2, 0x045e
 314:	03ac                	.insn	2, 0x03ac
 316:	03b8                	.insn	2, 0x03b8
 318:	5e01                	.insn	2, 0x5e01
 31a:	d004                	.insn	2, 0xd004
 31c:	fb05                	.insn	2, 0xfb05
 31e:	0105                	.insn	2, 0x0105
 320:	045e                	.insn	2, 0x045e
 322:	07f4                	.insn	2, 0x07f4
 324:	088c                	.insn	2, 0x088c
 326:	6201                	.insn	2, 0x6201
 328:	a004                	.insn	2, 0xa004
 32a:	ac08                	.insn	2, 0xac08
 32c:	0062010b          	.insn	4, 0x0062010b
 330:	5404                	.insn	2, 0x5404
 332:	0180                	.insn	2, 0x0180
 334:	5c01                	.insn	2, 0x5c01
 336:	8004                	.insn	2, 0x8004
 338:	8c01                	.insn	2, 0x8c01
 33a:	0901                	.insn	2, 0x0901
 33c:	007c                	.insn	2, 0x007c
 33e:	007e                	.insn	2, 0x007e
 340:	ff08                	.insn	2, 0xff08
 342:	241a                	.insn	2, 0x241a
 344:	049f 018c 02dc      	.insn	6, 0x02dc018c049f
 34a:	6301                	.insn	2, 0x6301
 34c:	e404                	.insn	2, 0xe404
 34e:	f802                	.insn	2, 0xf802
 350:	0102                	.insn	2, 0x0102
 352:	005c                	.insn	2, 0x005c
 354:	6404                	.insn	2, 0x6404
 356:	017c                	.insn	2, 0x017c
 358:	005e                	.insn	2, 0x005e
 35a:	9804                	.insn	2, 0x9804
 35c:	dc01                	.insn	2, 0xdc01
 35e:	0102                	.insn	2, 0x0102
 360:	0065                	.insn	2, 0x0065
 362:	ac04                	.insn	2, 0xac04
 364:	9c01                	.insn	2, 0x9c01
 366:	0102                	.insn	2, 0x0102
 368:	0466                	.insn	2, 0x0466
 36a:	029c                	.insn	2, 0x029c
 36c:	02dc                	.insn	2, 0x02dc
 36e:	40008307          	.insn	4, 0x40008307
 372:	4024                	.insn	2, 0x4024
 374:	9f25                	.insn	2, 0x9f25
 376:	0400                	.insn	2, 0x0400
 378:	01b4                	.insn	2, 0x01b4
 37a:	01b8                	.insn	2, 0x01b8
 37c:	5a01                	.insn	2, 0x5a01
 37e:	b804                	.insn	2, 0xb804
 380:	bb01                	.insn	2, 0xbb01
 382:	0101                	.insn	2, 0x0101
 384:	01bb045b          	.insn	4, 0x01bb045b
 388:	01e8                	.insn	2, 0x01e8
 38a:	6401                	.insn	2, 0x6401
 38c:	e804                	.insn	2, 0xe804
 38e:	dc01                	.insn	2, 0xdc01
 390:	0102                	.insn	2, 0x0102
 392:	0062                	.insn	2, 0x0062
 394:	9004                	.insn	2, 0x9004
 396:	9402                	.insn	2, 0x9402
 398:	0102                	.insn	2, 0x0102
 39a:	045a                	.insn	2, 0x045a
 39c:	0294                	.insn	2, 0x0294
 39e:	5b010297          	auipc	x5,0x5b010
 3a2:	9704                	.insn	2, 0x9704
 3a4:	c802                	.insn	2, 0xc802
 3a6:	0102                	.insn	2, 0x0102
 3a8:	0464                	.insn	2, 0x0464
 3aa:	02c8                	.insn	2, 0x02c8
 3ac:	02dc                	.insn	2, 0x02dc
 3ae:	5e01                	.insn	2, 0x5e01
 3b0:	0400                	.insn	2, 0x0400
 3b2:	01ac                	.insn	2, 0x01ac
 3b4:	01d8                	.insn	2, 0x01d8
 3b6:	8206                	.insn	2, 0x8206
 3b8:	8500                	.insn	2, 0x8500
 3ba:	1d00                	.insn	2, 0x1d00
 3bc:	049f 01d8 01e4      	.insn	6, 0x01e401d8049f
 3c2:	5e01                	.insn	2, 0x5e01
 3c4:	e404                	.insn	2, 0xe404
 3c6:	e801                	.insn	2, 0xe801
 3c8:	0801                	.insn	2, 0x0801
 3ca:	0079                	.insn	2, 0x0079
 3cc:	2540                	.insn	2, 0x2540
 3ce:	007a                	.insn	2, 0x007a
 3d0:	9f21                	.insn	2, 0x9f21
 3d2:	e804                	.insn	2, 0xe804
 3d4:	fc01                	.insn	2, 0xfc01
 3d6:	0101                	.insn	2, 0x0101
 3d8:	045e                	.insn	2, 0x045e
 3da:	01fc                	.insn	2, 0x01fc
 3dc:	02dc                	.insn	2, 0x02dc
 3de:	5801                	.insn	2, 0x5801
 3e0:	0400                	.insn	2, 0x0400
 3e2:	01fc                	.insn	2, 0x01fc
 3e4:	02b8                	.insn	2, 0x02b8
 3e6:	7806                	.insn	2, 0x7806
 3e8:	8500                	.insn	2, 0x8500
 3ea:	1d00                	.insn	2, 0x1d00
 3ec:	049f 02b8 02c4      	.insn	6, 0x02c402b8049f
 3f2:	5901                	.insn	2, 0x5901
 3f4:	0400                	.insn	2, 0x0400
 3f6:	01c0                	.insn	2, 0x01c0
 3f8:	01fc                	.insn	2, 0x01fc
 3fa:	5801                	.insn	2, 0x5801
 3fc:	9c04                	.insn	2, 0x9c04
 3fe:	a402                	.insn	2, 0xa402
 400:	0102                	.insn	2, 0x0102
 402:	045a                	.insn	2, 0x045a
 404:	02a4                	.insn	2, 0x02a4
 406:	02dc                	.insn	2, 0x02dc
 408:	6601                	.insn	2, 0x6601
 40a:	0400                	.insn	2, 0x0400
 40c:	0b84                	.insn	2, 0x0b84
 40e:	0b90                	.insn	2, 0x0b90
 410:	5c01                	.insn	2, 0x5c01
 412:	0400                	.insn	2, 0x0400
 414:	0b84                	.insn	2, 0x0b84
 416:	0b98                	.insn	2, 0x0b98
 418:	8010                	.insn	2, 0x8010
 41a:	0a00                	.insn	2, 0x0a00
 41c:	ffff                	.insn	2, 0xffff
 41e:	7d1a                	.insn	2, 0x7d1a
 420:	0a00                	.insn	2, 0x0a00
 422:	ffff                	.insn	2, 0xffff
 424:	401a                	.insn	2, 0x401a
 426:	2224                	.insn	2, 0x2224
 428:	049f 0b98 0ba0      	.insn	6, 0x0ba00b98049f
 42e:	8015                	.insn	2, 0x8015
 430:	0a00                	.insn	2, 0x0a00
 432:	ffff                	.insn	2, 0xffff
 434:	801a                	.insn	2, 0x801a
 436:	4000                	.insn	2, 0x4000
 438:	8125                	.insn	2, 0x8125
 43a:	2200                	.insn	2, 0x2200
 43c:	ff0a                	.insn	2, 0xff0a
 43e:	24401aff 04009f22 	.insn	12, 0x08d708d004009f2224401aff
 446:	08d708d0 
 44a:	5b01                	.insn	2, 0x5b01
 44c:	d704                	.insn	2, 0xd704
 44e:	b808                	.insn	2, 0xb808
 450:	0068010b          	.insn	4, 0x0068010b
 454:	d404                	.insn	2, 0xd404
 456:	c808                	.insn	2, 0xc808
 458:	0109                	.insn	2, 0x0109
 45a:	09c80467          	jalr	x8,156(x16) # 590b545a <SYSCALL_ADDR+0x570a545a>
 45e:	0bb8                	.insn	2, 0x0bb8
 460:	40008607          	.insn	4, 0x40008607
 464:	4024                	.insn	2, 0x4024
 466:	9f25                	.insn	2, 0x9f25
 468:	0400                	.insn	2, 0x0400
 46a:	08e0                	.insn	2, 0x08e0
 46c:	08e4                	.insn	2, 0x08e4
 46e:	5a01                	.insn	2, 0x5a01
 470:	e404                	.insn	2, 0xe404
 472:	e708                	.insn	2, 0xe708
 474:	0108                	.insn	2, 0x0108
 476:	08e7045b          	.insn	4, 0x08e7045b
 47a:	0994                	.insn	2, 0x0994
 47c:	6901                	.insn	2, 0x6901
 47e:	9404                	.insn	2, 0x9404
 480:	b809                	.insn	2, 0xb809
 482:	0059010b          	.insn	4, 0x0059010b
 486:	bc04                	.insn	2, 0xbc04
 488:	c009                	.insn	2, 0xc009
 48a:	0109                	.insn	2, 0x0109
 48c:	045a                	.insn	2, 0x045a
 48e:	09c0                	.insn	2, 0x09c0
 490:	5b0109c3          	.insn	4, 0x5b0109c3
 494:	c304                	.insn	2, 0xc304
 496:	f409                	.insn	2, 0xf409
 498:	0109                	.insn	2, 0x0109
 49a:	0469                	.insn	2, 0x0469
 49c:	09f4                	.insn	2, 0x09f4
 49e:	0ab4                	.insn	2, 0x0ab4
 4a0:	5d01                	.insn	2, 0x5d01
 4a2:	0400                	.insn	2, 0x0400
 4a4:	08d4                	.insn	2, 0x08d4
 4a6:	790608d7          	.insn	4, 0x790608d7
 4aa:	7b00                	.insn	2, 0x7b00
 4ac:	1d00                	.insn	2, 0x1d00
 4ae:	049f 08d7 0984      	.insn	6, 0x098408d7049f
 4b4:	7906                	.insn	2, 0x7906
 4b6:	8800                	.insn	2, 0x8800
 4b8:	1d00                	.insn	2, 0x1d00
 4ba:	049f 0984 0990      	.insn	6, 0x09900984049f
 4c0:	5d01                	.insn	2, 0x5d01
 4c2:	9004                	.insn	2, 0x9004
 4c4:	9409                	.insn	2, 0x9409
 4c6:	0809                	.insn	2, 0x0809
 4c8:	25400083          	lb	x1,596(x0) # 254 <_heap_size+0x254>
 4cc:	007a                	.insn	2, 0x007a
 4ce:	9f21                	.insn	2, 0x9f21
 4d0:	9404                	.insn	2, 0x9404
 4d2:	a809                	.insn	2, 0xa809
 4d4:	0109                	.insn	2, 0x0109
 4d6:	045d                	.insn	2, 0x045d
 4d8:	09a8                	.insn	2, 0x09a8
 4da:	0bb8                	.insn	2, 0x0bb8
 4dc:	6501                	.insn	2, 0x6501
 4de:	0400                	.insn	2, 0x0400
 4e0:	09a8                	.insn	2, 0x09a8
 4e2:	09e4                	.insn	2, 0x09e4
 4e4:	8506                	.insn	2, 0x8506
 4e6:	8800                	.insn	2, 0x8800
 4e8:	1d00                	.insn	2, 0x1d00
 4ea:	049f 09e4 09f0      	.insn	6, 0x09f009e4049f
 4f0:	5e01                	.insn	2, 0x5e01
 4f2:	f004                	.insn	2, 0xf004
 4f4:	f409                	.insn	2, 0xf409
 4f6:	0a09                	.insn	2, 0x0a09
 4f8:	24400083          	lb	x1,580(x0) # 244 <_heap_size+0x244>
 4fc:	2540                	.insn	2, 0x2540
 4fe:	007a                	.insn	2, 0x007a
 500:	9f21                	.insn	2, 0x9f21
 502:	f404                	.insn	2, 0xf404
 504:	a409                	.insn	2, 0xa409
 506:	005e010b          	.insn	4, 0x005e010b
 50a:	ec04                	.insn	2, 0xec04
 50c:	f408                	.insn	2, 0xf408
 50e:	0108                	.insn	2, 0x0108
 510:	045a                	.insn	2, 0x045a
 512:	08f4                	.insn	2, 0x08f4
 514:	09a8                	.insn	2, 0x09a8
 516:	6501                	.insn	2, 0x6501
 518:	c804                	.insn	2, 0xc804
 51a:	d009                	.insn	2, 0xd009
 51c:	0109                	.insn	2, 0x0109
 51e:	045a                	.insn	2, 0x045a
 520:	09d0                	.insn	2, 0x09d0
 522:	0bb8                	.insn	2, 0x0bb8
 524:	6701                	.insn	2, 0x6701
 526:	0400                	.insn	2, 0x0400
 528:	0ab8                	.insn	2, 0x0ab8
 52a:	0ac0                	.insn	2, 0x0ac0
 52c:	5a01                	.insn	2, 0x5a01
 52e:	c004                	.insn	2, 0xc004
 530:	a00a                	.insn	2, 0xa00a
 532:	0060010b          	.insn	4, 0x0060010b
 536:	c804                	.insn	2, 0xc804
 538:	d00a                	.insn	2, 0xd00a
 53a:	010a                	.insn	2, 0x010a
 53c:	045a                	.insn	2, 0x045a
 53e:	0ad0                	.insn	2, 0x0ad0
 540:	0aec                	.insn	2, 0x0aec
 542:	6101                	.insn	2, 0x6101
 544:	f404                	.insn	2, 0xf404
 546:	980a                	.insn	2, 0x980a
 548:	045d010b          	.insn	4, 0x045d010b
 54c:	0b98                	.insn	2, 0x0b98
 54e:	0ba0                	.insn	2, 0x0ba0
 550:	8008                	.insn	2, 0x8008
 552:	4000                	.insn	2, 0x4000
 554:	8125                	.insn	2, 0x8125
 556:	2200                	.insn	2, 0x2200
 558:	009f d804 b80a      	.insn	6, 0xb80ad804009f
 55e:	0056010b          	.insn	4, 0x0056010b
 562:	f404                	.insn	2, 0xf404
 564:	fc0a                	.insn	2, 0xfc0a
 566:	010a                	.insn	2, 0x010a
 568:	045a                	.insn	2, 0x045a
 56a:	0afc                	.insn	2, 0x0afc
 56c:	0b84                	.insn	2, 0x0b84
 56e:	5c01                	.insn	2, 0x5c01
 570:	0400                	.insn	2, 0x0400
 572:	0aa0                	.insn	2, 0x0aa0
 574:	0ac8                	.insn	2, 0x0ac8
 576:	6101                	.insn	2, 0x6101
 578:	c804                	.insn	2, 0xc804
 57a:	940a                	.insn	2, 0x940a
 57c:	7f8c060b          	.insn	4, 0x7f8c060b
 580:	007f 9f1a 9404 b00b 	.insn	10, 0x060bb00b94049f1a007f
 588:	060b 
 58a:	007f 007c 9f1a b004 	.insn	10, 0xb40bb0049f1a007c007f
 592:	b40b 
 594:	7f8c060b          	.insn	4, 0x7f8c060b
 598:	007f 9f1a b404 b80b 	.insn	10, 0x060bb80bb4049f1a007f
 5a0:	060b 
 5a2:	017f 7f8c 9f1a 0400 	.insn	10, 0x0aa404009f1a7f8c017f
 5aa:	0aa4 
 5ac:	0ad8                	.insn	2, 0x0ad8
 5ae:	5601                	.insn	2, 0x5601
 5b0:	0400                	.insn	2, 0x0400
 5b2:	0aa4                	.insn	2, 0x0aa4
 5b4:	0bb8                	.insn	2, 0x0bb8
 5b6:	6d01                	.insn	2, 0x6d01
 5b8:	0400                	.insn	2, 0x0400
 5ba:	0aa8                	.insn	2, 0x0aa8
 5bc:	0bb8                	.insn	2, 0x0bb8
 5be:	5801                	.insn	2, 0x5801
 5c0:	0400                	.insn	2, 0x0400
 5c2:	0380                	.insn	2, 0x0380
 5c4:	0388                	.insn	2, 0x0388
 5c6:	5c01                	.insn	2, 0x5c01
 5c8:	bc04                	.insn	2, 0xbc04
 5ca:	d005                	.insn	2, 0xd005
 5cc:	0105                	.insn	2, 0x0105
 5ce:	005c                	.insn	2, 0x005c
 5d0:	9404                	.insn	2, 0x9404
 5d2:	0103ac03          	lw	x24,16(x7)
 5d6:	005e                	.insn	2, 0x005e
 5d8:	bc04                	.insn	2, 0xbc04
 5da:	01058003          	lb	x0,16(x11)
 5de:	0066                	.insn	2, 0x0066
 5e0:	d004                	.insn	2, 0xd004
 5e2:	0104c003          	lbu	x0,16(x9)
 5e6:	04c00467          	jalr	x8,76(x0) # 4c <_heap_size+0x4c>
 5ea:	0580                	.insn	2, 0x0580
 5ec:	40008307          	.insn	4, 0x40008307
 5f0:	4024                	.insn	2, 0x4024
 5f2:	9f25                	.insn	2, 0x9f25
 5f4:	0400                	.insn	2, 0x0400
 5f6:	03d8                	.insn	2, 0x03d8
 5f8:	03dc                	.insn	2, 0x03dc
 5fa:	5a01                	.insn	2, 0x5a01
 5fc:	dc04                	.insn	2, 0xdc04
 5fe:	0103df03          	lhu	x30,16(x7)
 602:	03df045b          	.insn	4, 0x03df045b
 606:	048c                	.insn	2, 0x048c
 608:	6801                	.insn	2, 0x6801
 60a:	8c04                	.insn	2, 0x8c04
 60c:	8004                	.insn	2, 0x8004
 60e:	0105                	.insn	2, 0x0105
 610:	0064                	.insn	2, 0x0064
 612:	b404                	.insn	2, 0xb404
 614:	b804                	.insn	2, 0xb804
 616:	0104                	.insn	2, 0x0104
 618:	045a                	.insn	2, 0x045a
 61a:	04b8                	.insn	2, 0x04b8
 61c:	5b0104bb          	.insn	4, 0x5b0104bb
 620:	bb04                	.insn	2, 0xbb04
 622:	ec04                	.insn	2, 0xec04
 624:	0104                	.insn	2, 0x0104
 626:	0465                	.insn	2, 0x0465
 628:	04ec                	.insn	2, 0x04ec
 62a:	0580                	.insn	2, 0x0580
 62c:	5e01                	.insn	2, 0x5e01
 62e:	0400                	.insn	2, 0x0400
 630:	03d0                	.insn	2, 0x03d0
 632:	03fc                	.insn	2, 0x03fc
 634:	8406                	.insn	2, 0x8406
 636:	8600                	.insn	2, 0x8600
 638:	1d00                	.insn	2, 0x1d00
 63a:	049f 03fc 0488      	.insn	6, 0x048803fc049f
 640:	5e01                	.insn	2, 0x5e01
 642:	8804                	.insn	2, 0x8804
 644:	8c04                	.insn	2, 0x8c04
 646:	0804                	.insn	2, 0x0804
 648:	0079                	.insn	2, 0x0079
 64a:	2540                	.insn	2, 0x2540
 64c:	007a                	.insn	2, 0x007a
 64e:	9f21                	.insn	2, 0x9f21
 650:	8c04                	.insn	2, 0x8c04
 652:	a004                	.insn	2, 0xa004
 654:	0104                	.insn	2, 0x0104
 656:	045e                	.insn	2, 0x045e
 658:	04a0                	.insn	2, 0x04a0
 65a:	0580                	.insn	2, 0x0580
 65c:	5801                	.insn	2, 0x5801
 65e:	0400                	.insn	2, 0x0400
 660:	04a0                	.insn	2, 0x04a0
 662:	04dc                	.insn	2, 0x04dc
 664:	7806                	.insn	2, 0x7806
 666:	8600                	.insn	2, 0x8600
 668:	1d00                	.insn	2, 0x1d00
 66a:	049f 04dc 04e8      	.insn	6, 0x04e804dc049f
 670:	5901                	.insn	2, 0x5901
 672:	0400                	.insn	2, 0x0400
 674:	03e4                	.insn	2, 0x03e4
 676:	03ec                	.insn	2, 0x03ec
 678:	5a01                	.insn	2, 0x5a01
 67a:	ec04                	.insn	2, 0xec04
 67c:	0104b403          	.insn	4, 0x0104b403
 680:	0465                	.insn	2, 0x0465
 682:	04c0                	.insn	2, 0x04c0
 684:	04c8                	.insn	2, 0x04c8
 686:	5a01                	.insn	2, 0x5a01
 688:	c804                	.insn	2, 0xc804
 68a:	8004                	.insn	2, 0x8004
 68c:	0105                	.insn	2, 0x0105
 68e:	ec040067          	jalr	x0,-320(x8)
 692:	bc05                	.insn	2, 0xbc05
 694:	00670107          	.insn	4, 0x00670107
 698:	8004                	.insn	2, 0x8004
 69a:	f006                	.insn	2, 0xf006
 69c:	0106                	.insn	2, 0x0106
 69e:	0464                	.insn	2, 0x0464
 6a0:	06f0                	.insn	2, 0x06f0
 6a2:	07bc                	.insn	2, 0x07bc
 6a4:	40008307          	.insn	4, 0x40008307
 6a8:	4024                	.insn	2, 0x4024
 6aa:	9f25                	.insn	2, 0x9f25
 6ac:	0400                	.insn	2, 0x0400
 6ae:	0688                	.insn	2, 0x0688
 6b0:	068c                	.insn	2, 0x068c
 6b2:	5a01                	.insn	2, 0x5a01
 6b4:	8c04                	.insn	2, 0x8c04
 6b6:	8f06                	.insn	2, 0x8f06
 6b8:	0106                	.insn	2, 0x0106
 6ba:	068f045b          	.insn	4, 0x068f045b
 6be:	06bc                	.insn	2, 0x06bc
 6c0:	6601                	.insn	2, 0x6601
 6c2:	bc04                	.insn	2, 0xbc04
 6c4:	b006                	.insn	2, 0xb006
 6c6:	00620107          	.insn	4, 0x00620107
 6ca:	e404                	.insn	2, 0xe404
 6cc:	e806                	.insn	2, 0xe806
 6ce:	0106                	.insn	2, 0x0106
 6d0:	045a                	.insn	2, 0x045a
 6d2:	06e8                	.insn	2, 0x06e8
 6d4:	5b0106eb          	.insn	4, 0x5b0106eb
 6d8:	eb04                	.insn	2, 0xeb04
 6da:	9c06                	.insn	2, 0x9c06
 6dc:	04660107          	.insn	4, 0x04660107
 6e0:	079c                	.insn	2, 0x079c
 6e2:	07bc                	.insn	2, 0x07bc
 6e4:	5e01                	.insn	2, 0x5e01
 6e6:	0400                	.insn	2, 0x0400
 6e8:	0680                	.insn	2, 0x0680
 6ea:	06ac                	.insn	2, 0x06ac
 6ec:	8206                	.insn	2, 0x8206
 6ee:	8700                	.insn	2, 0x8700
 6f0:	1d00                	.insn	2, 0x1d00
 6f2:	049f 06ac 06b8      	.insn	6, 0x06b806ac049f
 6f8:	5e01                	.insn	2, 0x5e01
 6fa:	b804                	.insn	2, 0xb804
 6fc:	bc06                	.insn	2, 0xbc06
 6fe:	0806                	.insn	2, 0x0806
 700:	0085                	.insn	2, 0x0085
 702:	2540                	.insn	2, 0x2540
 704:	007a                	.insn	2, 0x007a
 706:	9f21                	.insn	2, 0x9f21
 708:	bc04                	.insn	2, 0xbc04
 70a:	d006                	.insn	2, 0xd006
 70c:	0106                	.insn	2, 0x0106
 70e:	045e                	.insn	2, 0x045e
 710:	06d0                	.insn	2, 0x06d0
 712:	07bc                	.insn	2, 0x07bc
 714:	5801                	.insn	2, 0x5801
 716:	0400                	.insn	2, 0x0400
 718:	06d0                	.insn	2, 0x06d0
 71a:	078c                	.insn	2, 0x078c
 71c:	7806                	.insn	2, 0x7806
 71e:	8700                	.insn	2, 0x8700
 720:	1d00                	.insn	2, 0x1d00
 722:	049f 078c 0798      	.insn	6, 0x0798078c049f
 728:	5f01                	.insn	2, 0x5f01
 72a:	9804                	.insn	2, 0x9804
 72c:	0a079c07          	.insn	4, 0x0a079c07
 730:	0085                	.insn	2, 0x0085
 732:	2440                	.insn	2, 0x2440
 734:	2540                	.insn	2, 0x2540
 736:	007a                	.insn	2, 0x007a
 738:	9f21                	.insn	2, 0x9f21
 73a:	9c04                	.insn	2, 0x9c04
 73c:	0107b407          	.insn	4, 0x0107b407
 740:	045f 07b4 07bc      	.insn	6, 0x07bc07b4045f
 746:	6401                	.insn	2, 0x6401
 748:	0400                	.insn	2, 0x0400
 74a:	0694                	.insn	2, 0x0694
 74c:	06d0                	.insn	2, 0x06d0
 74e:	5801                	.insn	2, 0x5801
 750:	f004                	.insn	2, 0xf004
 752:	f806                	.insn	2, 0xf806
 754:	0106                	.insn	2, 0x0106
 756:	045a                	.insn	2, 0x045a
 758:	06f8                	.insn	2, 0x06f8
 75a:	07b4                	.insn	2, 0x07b4
 75c:	6401                	.insn	2, 0x6401
 75e:	0400                	.insn	2, 0x0400
 760:	07c0                	.insn	2, 0x07c0
 762:	08a4                	.insn	2, 0x08a4
 764:	5d01                	.insn	2, 0x5d01
 766:	0400                	.insn	2, 0x0400
 768:	07d4                	.insn	2, 0x07d4
 76a:	088c                	.insn	2, 0x088c
 76c:	5e01                	.insn	2, 0x5e01
 76e:	a004                	.insn	2, 0xa004
 770:	d708                	.insn	2, 0xd708
 772:	0108                	.insn	2, 0x0108
 774:	005e                	.insn	2, 0x005e
 776:	063e                	.insn	2, 0x063e
 778:	0000                	.insn	2, 0x
 77a:	0005                	.insn	2, 0x0005
 77c:	0004                	.insn	2, 0x0004
 77e:	0000                	.insn	2, 0x
 780:	0000                	.insn	2, 0x
 782:	0004                	.insn	2, 0x0004
 784:	0194                	.insn	2, 0x0194
 786:	5a06                	.insn	2, 0x5a06
 788:	935b0493          	addi	x9,x22,-1739
 78c:	0404                	.insn	2, 0x0404
 78e:	0194                	.insn	2, 0x0194
 790:	02f4                	.insn	2, 0x02f4
 792:	a306                	.insn	2, 0xa306
 794:	2d0aa503          	lw	x10,720(x21)
 798:	049f 02f4 03ec      	.insn	6, 0x03ec02f4049f
 79e:	5a06                	.insn	2, 0x5a06
 7a0:	935b0493          	addi	x9,x22,-1739
 7a4:	0404                	.insn	2, 0x0404
 7a6:	03ec                	.insn	2, 0x03ec
 7a8:	0580                	.insn	2, 0x0580
 7aa:	a306                	.insn	2, 0xa306
 7ac:	2d0aa503          	lw	x10,720(x21)
 7b0:	049f 0580 05f0      	.insn	6, 0x05f00580049f
 7b6:	5a06                	.insn	2, 0x5a06
 7b8:	935b0493          	addi	x9,x22,-1739
 7bc:	0404                	.insn	2, 0x0404
 7be:	05f0                	.insn	2, 0x05f0
 7c0:	05f8                	.insn	2, 0x05f8
 7c2:	a306                	.insn	2, 0xa306
 7c4:	2d0aa503          	lw	x10,720(x21)
 7c8:	049f 05f8 06b8      	.insn	6, 0x06b805f8049f
 7ce:	5a06                	.insn	2, 0x5a06
 7d0:	935b0493          	addi	x9,x22,-1739
 7d4:	0404                	.insn	2, 0x0404
 7d6:	06b8                	.insn	2, 0x06b8
 7d8:	09d0                	.insn	2, 0x09d0
 7da:	a306                	.insn	2, 0xa306
 7dc:	2d0aa503          	lw	x10,720(x21)
 7e0:	009f 0004 0194      	.insn	6, 0x01940004009f
 7e6:	5c06                	.insn	2, 0x5c06
 7e8:	935d0493          	addi	x9,x26,-1739
 7ec:	0404                	.insn	2, 0x0404
 7ee:	0194                	.insn	2, 0x0194
 7f0:	02f4                	.insn	2, 0x02f4
 7f2:	a306                	.insn	2, 0xa306
 7f4:	2d0ca503          	lw	x10,720(x25)
 7f8:	049f 02f4 03ef      	.insn	6, 0x03ef02f4049f
 7fe:	5c06                	.insn	2, 0x5c06
 800:	935d0493          	addi	x9,x26,-1739
 804:	0404                	.insn	2, 0x0404
 806:	058003ef          	jal	x7,85e <_heap_size+0x85e>
 80a:	a306                	.insn	2, 0xa306
 80c:	2d0ca503          	lw	x10,720(x25)
 810:	049f 0580 06c7      	.insn	6, 0x06c70580049f
 816:	5c06                	.insn	2, 0x5c06
 818:	935d0493          	addi	x9,x26,-1739
 81c:	0404                	.insn	2, 0x0404
 81e:	09d006c7          	.insn	4, 0x09d006c7
 822:	a306                	.insn	2, 0xa306
 824:	2d0ca503          	lw	x10,720(x25)
 828:	009f cc04 d009      	.insn	6, 0xd009cc04009f
 82e:	0609                	.insn	2, 0x0609
 830:	935a                	.insn	2, 0x935a
 832:	5b04                	.insn	2, 0x5b04
 834:	04000493          	addi	x9,x0,64
 838:	bc00                	.insn	2, 0xbc00
 83a:	0602                	.insn	2, 0x0602
 83c:	77a0                	.insn	2, 0x77a0
 83e:	0000000b          	.insn	4, 0x000b
 842:	f404                	.insn	2, 0xf404
 844:	d002                	.insn	2, 0xd002
 846:	0609                	.insn	2, 0x0609
 848:	77a0                	.insn	2, 0x77a0
 84a:	0000000b          	.insn	4, 0x000b
 84e:	0400                	.insn	2, 0x0400
 850:	6400                	.insn	2, 0x6400
 852:	5c06                	.insn	2, 0x5c06
 854:	935d0493          	addi	x9,x26,-1739
 858:	0404                	.insn	2, 0x0404
 85a:	02f4                	.insn	2, 0x02f4
 85c:	02f8                	.insn	2, 0x02f8
 85e:	5c06                	.insn	2, 0x5c06
 860:	935d0493          	addi	x9,x26,-1739
 864:	0404                	.insn	2, 0x0404
 866:	0388                	.insn	2, 0x0388
 868:	03a4                	.insn	2, 0x03a4
 86a:	5c06                	.insn	2, 0x5c06
 86c:	935d0493          	addi	x9,x26,-1739
 870:	0404                	.insn	2, 0x0404
 872:	0580                	.insn	2, 0x0580
 874:	0584                	.insn	2, 0x0584
 876:	5c06                	.insn	2, 0x5c06
 878:	935d0493          	addi	x9,x26,-1739
 87c:	0404                	.insn	2, 0x0404
 87e:	0594                	.insn	2, 0x0594
 880:	05e0                	.insn	2, 0x05e0
 882:	5c06                	.insn	2, 0x5c06
 884:	935d0493          	addi	x9,x26,-1739
 888:	0404                	.insn	2, 0x0404
 88a:	05f8                	.insn	2, 0x05f8
 88c:	0690                	.insn	2, 0x0690
 88e:	5c06                	.insn	2, 0x5c06
 890:	935d0493          	addi	x9,x26,-1739
 894:	0004                	.insn	2, 0x0004
 896:	0004                	.insn	2, 0x0004
 898:	0194                	.insn	2, 0x0194
 89a:	5a06                	.insn	2, 0x5a06
 89c:	935b0493          	addi	x9,x22,-1739
 8a0:	0404                	.insn	2, 0x0404
 8a2:	02f4                	.insn	2, 0x02f4
 8a4:	03b4                	.insn	2, 0x03b4
 8a6:	5806                	.insn	2, 0x5806
 8a8:	93590493          	addi	x9,x18,-1739
 8ac:	0404                	.insn	2, 0x0404
 8ae:	03b4                	.insn	2, 0x03b4
 8b0:	03d8                	.insn	2, 0x03d8
 8b2:	5806                	.insn	2, 0x5806
 8b4:	935b0493          	addi	x9,x22,-1739
 8b8:	0404                	.insn	2, 0x0404
 8ba:	0580                	.insn	2, 0x0580
 8bc:	05e4                	.insn	2, 0x05e4
 8be:	5806                	.insn	2, 0x5806
 8c0:	93590493          	addi	x9,x18,-1739
 8c4:	0404                	.insn	2, 0x0404
 8c6:	05e4                	.insn	2, 0x05e4
 8c8:	05e8                	.insn	2, 0x05e8
 8ca:	5806                	.insn	2, 0x5806
 8cc:	935b0493          	addi	x9,x22,-1739
 8d0:	0404                	.insn	2, 0x0404
 8d2:	05e8                	.insn	2, 0x05e8
 8d4:	05f0                	.insn	2, 0x05f0
 8d6:	5a06                	.insn	2, 0x5a06
 8d8:	935b0493          	addi	x9,x22,-1739
 8dc:	0404                	.insn	2, 0x0404
 8de:	05f8                	.insn	2, 0x05f8
 8e0:	06a0                	.insn	2, 0x06a0
 8e2:	5806                	.insn	2, 0x5806
 8e4:	93590493          	addi	x9,x18,-1739
 8e8:	0404                	.insn	2, 0x0404
 8ea:	06a0                	.insn	2, 0x06a0
 8ec:	06a8                	.insn	2, 0x06a8
 8ee:	5a06                	.insn	2, 0x5a06
 8f0:	93590493          	addi	x9,x18,-1739
 8f4:	0004                	.insn	2, 0x0004
 8f6:	0004                	.insn	2, 0x0004
 8f8:	018c                	.insn	2, 0x018c
 8fa:	5c01                	.insn	2, 0x5c01
 8fc:	8c04                	.insn	2, 0x8c04
 8fe:	bc01                	.insn	2, 0xbc01
 900:	0102                	.insn	2, 0x0102
 902:	02f40463          	beq	x8,x15,92a <_heap_size+0x92a>
 906:	0398                	.insn	2, 0x0398
 908:	5c01                	.insn	2, 0x5c01
 90a:	c804                	.insn	2, 0xc804
 90c:	01058003          	lb	x0,16(x11)
 910:	05800463          	beq	x0,x24,958 <_heap_size+0x958>
 914:	06c0                	.insn	2, 0x06c0
 916:	5c01                	.insn	2, 0x5c01
 918:	c004                	.insn	2, 0xc004
 91a:	9c06                	.insn	2, 0x9c06
 91c:	0109                	.insn	2, 0x0109
 91e:	0062                	.insn	2, 0x0062
 920:	0004                	.insn	2, 0x0004
 922:	0164                	.insn	2, 0x0164
 924:	045d                	.insn	2, 0x045d
 926:	02f4                	.insn	2, 0x02f4
 928:	02f8                	.insn	2, 0x02f8
 92a:	5d01                	.insn	2, 0x5d01
 92c:	8804                	.insn	2, 0x8804
 92e:	0103a403          	lw	x8,16(x7)
 932:	045d                	.insn	2, 0x045d
 934:	0580                	.insn	2, 0x0580
 936:	0584                	.insn	2, 0x0584
 938:	5d01                	.insn	2, 0x5d01
 93a:	9404                	.insn	2, 0x9404
 93c:	e005                	.insn	2, 0xe005
 93e:	0105                	.insn	2, 0x0105
 940:	045d                	.insn	2, 0x045d
 942:	05f8                	.insn	2, 0x05f8
 944:	0690                	.insn	2, 0x0690
 946:	5d01                	.insn	2, 0x5d01
 948:	9804                	.insn	2, 0x9804
 94a:	d006                	.insn	2, 0xd006
 94c:	0109                	.insn	2, 0x0109
 94e:	38040067          	jalr	x0,896(x8)
 952:	0194                	.insn	2, 0x0194
 954:	5a01                	.insn	2, 0x5a01
 956:	9404                	.insn	2, 0x9404
 958:	9001                	.insn	2, 0x9001
 95a:	0102                	.insn	2, 0x0102
 95c:	0458                	.insn	2, 0x0458
 95e:	02b4                	.insn	2, 0x02b4
 960:	02bc                	.insn	2, 0x02bc
 962:	5801                	.insn	2, 0x5801
 964:	f404                	.insn	2, 0xf404
 966:	e802                	.insn	2, 0xe802
 968:	0105                	.insn	2, 0x0105
 96a:	0458                	.insn	2, 0x0458
 96c:	05e8                	.insn	2, 0x05e8
 96e:	05ec                	.insn	2, 0x05ec
 970:	5a01                	.insn	2, 0x5a01
 972:	f804                	.insn	2, 0xf804
 974:	a005                	.insn	2, 0xa005
 976:	0106                	.insn	2, 0x0106
 978:	0458                	.insn	2, 0x0458
 97a:	06a0                	.insn	2, 0x06a0
 97c:	06b8                	.insn	2, 0x06b8
 97e:	5a01                	.insn	2, 0x5a01
 980:	c004                	.insn	2, 0xc004
 982:	b406                	.insn	2, 0xb406
 984:	0109                	.insn	2, 0x0109
 986:	0466                	.insn	2, 0x0466
 988:	09bc                	.insn	2, 0x09bc
 98a:	09c4                	.insn	2, 0x09c4
 98c:	5f01                	.insn	2, 0x5f01
 98e:	0400                	.insn	2, 0x0400
 990:	903c                	.insn	2, 0x903c
 992:	0101                	.insn	2, 0x0101
 994:	0190045b          	.insn	4, 0x0190045b
 998:	01e8                	.insn	2, 0x01e8
 99a:	5901                	.insn	2, 0x5901
 99c:	f404                	.insn	2, 0xf404
 99e:	b402                	.insn	2, 0xb402
 9a0:	04590103          	lb	x2,69(x18)
 9a4:	03b4                	.insn	2, 0x03b4
 9a6:	03d8                	.insn	2, 0x03d8
 9a8:	5b01                	.insn	2, 0x5b01
 9aa:	dc04                	.insn	2, 0xdc04
 9ac:	0104fc03          	.insn	4, 0x0104fc03
 9b0:	0464                	.insn	2, 0x0464
 9b2:	04fc                	.insn	2, 0x04fc
 9b4:	05e4                	.insn	2, 0x05e4
 9b6:	5901                	.insn	2, 0x5901
 9b8:	e404                	.insn	2, 0xe404
 9ba:	ec05                	.insn	2, 0xec05
 9bc:	0105                	.insn	2, 0x0105
 9be:	05ec045b          	.insn	4, 0x05ec045b
 9c2:	06a8                	.insn	2, 0x06a8
 9c4:	5901                	.insn	2, 0x5901
 9c6:	c004                	.insn	2, 0xc004
 9c8:	9006                	.insn	2, 0x9006
 9ca:	0108                	.insn	2, 0x0108
 9cc:	0458                	.insn	2, 0x0458
 9ce:	0890                	.insn	2, 0x0890
 9d0:	09bc                	.insn	2, 0x09bc
 9d2:	5901                	.insn	2, 0x5901
 9d4:	bc04                	.insn	2, 0xbc04
 9d6:	cc09                	.insn	2, 0xcc09
 9d8:	0109                	.insn	2, 0x0109
 9da:	09cc045b          	.insn	4, 0x09cc045b
 9de:	09d0                	.insn	2, 0x09d0
 9e0:	7909                	.insn	2, 0x7909
 9e2:	7e00                	.insn	2, 0x7e00
 9e4:	1c00                	.insn	2, 0x1c00
 9e6:	0086                	.insn	2, 0x0086
 9e8:	9f1c                	.insn	2, 0x9f1c
 9ea:	0400                	.insn	2, 0x0400
 9ec:	03cc                	.insn	2, 0x03cc
 9ee:	0580                	.insn	2, 0x0580
 9f0:	6701                	.insn	2, 0x6701
 9f2:	c004                	.insn	2, 0xc004
 9f4:	c706                	.insn	2, 0xc706
 9f6:	0106                	.insn	2, 0x0106
 9f8:	045a                	.insn	2, 0x045a
 9fa:	06f806c7          	.insn	4, 0x06f806c7
 9fe:	6301                	.insn	2, 0x6301
 a00:	0400                	.insn	2, 0x0400
 a02:	05d8                	.insn	2, 0x05d8
 a04:	05ec                	.insn	2, 0x05ec
 a06:	3102                	.insn	2, 0x3102
 a08:	009f ec04 f805      	.insn	6, 0xf805ec04009f
 a0e:	0205                	.insn	2, 0x0205
 a10:	9f30                	.insn	2, 0x9f30
 a12:	ac04                	.insn	2, 0xac04
 a14:	d009                	.insn	2, 0xd009
 a16:	0209                	.insn	2, 0x0209
 a18:	9f30                	.insn	2, 0x9f30
 a1a:	0400                	.insn	2, 0x0400
 a1c:	03c4                	.insn	2, 0x03c4
 a1e:	03d4                	.insn	2, 0x03d4
 a20:	5f01                	.insn	2, 0x5f01
 a22:	8c04                	.insn	2, 0x8c04
 a24:	c006                	.insn	2, 0xc006
 a26:	0109                	.insn	2, 0x0109
 a28:	0065                	.insn	2, 0x0065
 a2a:	7c04                	.insn	2, 0x7c04
 a2c:	02bc                	.insn	2, 0x02bc
 a2e:	6201                	.insn	2, 0x6201
 a30:	c004                	.insn	2, 0xc004
 a32:	01058003          	lb	x0,16(x11)
 a36:	0462                	.insn	2, 0x0462
 a38:	05cc                	.insn	2, 0x05cc
 a3a:	05f8                	.insn	2, 0x05f8
 a3c:	6401                	.insn	2, 0x6401
 a3e:	8c04                	.insn	2, 0x8c04
 a40:	d006                	.insn	2, 0xd006
 a42:	0109                	.insn	2, 0x0109
 a44:	0064                	.insn	2, 0x0064
 a46:	5004                	.insn	2, 0x5004
 a48:	0194                	.insn	2, 0x0194
 a4a:	5c01                	.insn	2, 0x5c01
 a4c:	f404                	.insn	2, 0xf404
 a4e:	8802                	.insn	2, 0x8802
 a50:	005c0103          	lb	x2,5(x24)
 a54:	6404                	.insn	2, 0x6404
 a56:	0178                	.insn	2, 0x0178
 a58:	005e                	.insn	2, 0x005e
 a5a:	9804                	.insn	2, 0x9804
 a5c:	bc01                	.insn	2, 0xbc01
 a5e:	0102                	.insn	2, 0x0102
 a60:	0065                	.insn	2, 0x0065
 a62:	ac04                	.insn	2, 0xac04
 a64:	bc01                	.insn	2, 0xbc01
 a66:	0102                	.insn	2, 0x0102
 a68:	0066                	.insn	2, 0x0066
 a6a:	ac04                	.insn	2, 0xac04
 a6c:	d401                	.insn	2, 0xd401
 a6e:	0c01                	.insn	2, 0x0c01
 a70:	0079                	.insn	2, 0x0079
 a72:	26a8                	.insn	2, 0x26a8
 a74:	0085                	.insn	2, 0x0085
 a76:	26a8                	.insn	2, 0x26a8
 a78:	9f00a81b          	.insn	4, 0x9f00a81b
 a7c:	d404                	.insn	2, 0xd404
 a7e:	e001                	.insn	2, 0xe001
 a80:	0e01                	.insn	2, 0x0e01
 a82:	0079                	.insn	2, 0x0079
 a84:	26a8                	.insn	2, 0x26a8
 a86:	0085                	.insn	2, 0x0085
 a88:	26a8                	.insn	2, 0x26a8
 a8a:	3100a81b          	.insn	4, 0x3100a81b
 a8e:	9f1c                	.insn	2, 0x9f1c
 a90:	e004                	.insn	2, 0xe004
 a92:	e401                	.insn	2, 0xe401
 a94:	0e01                	.insn	2, 0x0e01
 a96:	0079                	.insn	2, 0x0079
 a98:	26a8                	.insn	2, 0x26a8
 a9a:	0085                	.insn	2, 0x0085
 a9c:	26a8                	.insn	2, 0x26a8
 a9e:	3200a81b          	.insn	4, 0x3200a81b
 aa2:	9f1c                	.insn	2, 0x9f1c
 aa4:	0400                	.insn	2, 0x0400
 aa6:	01e8                	.insn	2, 0x01e8
 aa8:	02a0                	.insn	2, 0x02a0
 aaa:	790c                	.insn	2, 0x790c
 aac:	a800                	.insn	2, 0xa800
 aae:	8526                	.insn	2, 0x8526
 ab0:	a800                	.insn	2, 0xa800
 ab2:	1b26                	.insn	2, 0x1b26
 ab4:	00a8                	.insn	2, 0x00a8
 ab6:	049f 02a0 02ac      	.insn	6, 0x02ac02a0049f
 abc:	790e                	.insn	2, 0x790e
 abe:	a800                	.insn	2, 0xa800
 ac0:	8526                	.insn	2, 0x8526
 ac2:	a800                	.insn	2, 0xa800
 ac4:	1b26                	.insn	2, 0x1b26
 ac6:	00a8                	.insn	2, 0x00a8
 ac8:	1c31                	.insn	2, 0x1c31
 aca:	049f 02ac 02b0      	.insn	6, 0x02b002ac049f
 ad0:	790e                	.insn	2, 0x790e
 ad2:	a800                	.insn	2, 0xa800
 ad4:	8526                	.insn	2, 0x8526
 ad6:	a800                	.insn	2, 0xa800
 ad8:	1b26                	.insn	2, 0x1b26
 ada:	00a8                	.insn	2, 0x00a8
 adc:	1c32                	.insn	2, 0x1c32
 ade:	009f ac04 d001      	.insn	6, 0xd001ac04009f
 ae4:	0601                	.insn	2, 0x0601
 ae6:	0079                	.insn	2, 0x0079
 ae8:	0085                	.insn	2, 0x0085
 aea:	9f1d                	.insn	2, 0x9f1d
 aec:	d004                	.insn	2, 0xd004
 aee:	e801                	.insn	2, 0xe801
 af0:	0101                	.insn	2, 0x0101
 af2:	045f 01e8 02bc      	.insn	6, 0x02bc01e8045f
 af8:	5901                	.insn	2, 0x5901
 afa:	0400                	.insn	2, 0x0400
 afc:	01e8                	.insn	2, 0x01e8
 afe:	029c                	.insn	2, 0x029c
 b00:	7906                	.insn	2, 0x7906
 b02:	8500                	.insn	2, 0x8500
 b04:	1d00                	.insn	2, 0x1d00
 b06:	049f 029c 02bc      	.insn	6, 0x02bc029c049f
 b0c:	5801                	.insn	2, 0x5801
 b0e:	0400                	.insn	2, 0x0400
 b10:	01b8                	.insn	2, 0x01b8
 b12:	01c0                	.insn	2, 0x01c0
 b14:	5a01                	.insn	2, 0x5a01
 b16:	c004                	.insn	2, 0xc004
 b18:	8001                	.insn	2, 0x8001
 b1a:	0102                	.insn	2, 0x0102
 b1c:	0464                	.insn	2, 0x0464
 b1e:	0280                	.insn	2, 0x0280
 b20:	0288                	.insn	2, 0x0288
 b22:	5a01                	.insn	2, 0x5a01
 b24:	8804                	.insn	2, 0x8804
 b26:	bc02                	.insn	2, 0xbc02
 b28:	0102                	.insn	2, 0x0102
 b2a:	0064                	.insn	2, 0x0064
 b2c:	9004                	.insn	2, 0x9004
 b2e:	01039803          	lh	x16,16(x7)
 b32:	045c                	.insn	2, 0x045c
 b34:	0580                	.insn	2, 0x0580
 b36:	0594                	.insn	2, 0x0594
 b38:	5c01                	.insn	2, 0x5c01
 b3a:	0400                	.insn	2, 0x0400
 b3c:	03a4                	.insn	2, 0x03a4
 b3e:	03bc                	.insn	2, 0x03bc
 b40:	5e01                	.insn	2, 0x5e01
 b42:	0400                	.insn	2, 0x0400
 b44:	03e0                	.insn	2, 0x03e0
 b46:	0580                	.insn	2, 0x0580
 b48:	6601                	.insn	2, 0x6601
 b4a:	0400                	.insn	2, 0x0400
 b4c:	03f4                	.insn	2, 0x03f4
 b4e:	04c8                	.insn	2, 0x04c8
 b50:	6501                	.insn	2, 0x6501
 b52:	c804                	.insn	2, 0xc804
 b54:	8004                	.insn	2, 0x8004
 b56:	0705                	.insn	2, 0x0705
 b58:	24400083          	lb	x1,580(x0) # 244 <_heap_size+0x244>
 b5c:	2540                	.insn	2, 0x2540
 b5e:	009f f404 9c03      	.insn	6, 0x9c03f404009f
 b64:	0c04                	.insn	2, 0x0c04
 b66:	26a80087          	.insn	4, 0x26a80087
 b6a:	0086                	.insn	2, 0x0086
 b6c:	26a8                	.insn	2, 0x26a8
 b6e:	9f00a81b          	.insn	4, 0x9f00a81b
 b72:	9c04                	.insn	2, 0x9c04
 b74:	a804                	.insn	2, 0xa804
 b76:	0e04                	.insn	2, 0x0e04
 b78:	26a80087          	.insn	4, 0x26a80087
 b7c:	0086                	.insn	2, 0x0086
 b7e:	26a8                	.insn	2, 0x26a8
 b80:	3100a81b          	.insn	4, 0x3100a81b
 b84:	9f1c                	.insn	2, 0x9f1c
 b86:	a804                	.insn	2, 0xa804
 b88:	ac04                	.insn	2, 0xac04
 b8a:	0e04                	.insn	2, 0x0e04
 b8c:	26a80087          	.insn	4, 0x26a80087
 b90:	0086                	.insn	2, 0x0086
 b92:	26a8                	.insn	2, 0x26a8
 b94:	3200a81b          	.insn	4, 0x3200a81b
 b98:	9f1c                	.insn	2, 0x9f1c
 b9a:	0400                	.insn	2, 0x0400
 b9c:	04b0                	.insn	2, 0x04b0
 b9e:	04e8                	.insn	2, 0x04e8
 ba0:	790c                	.insn	2, 0x790c
 ba2:	a800                	.insn	2, 0xa800
 ba4:	8626                	.insn	2, 0x8626
 ba6:	a800                	.insn	2, 0xa800
 ba8:	1b26                	.insn	2, 0x1b26
 baa:	00a8                	.insn	2, 0x00a8
 bac:	049f 04e8 04f4      	.insn	6, 0x04f404e8049f
 bb2:	790e                	.insn	2, 0x790e
 bb4:	a800                	.insn	2, 0xa800
 bb6:	8626                	.insn	2, 0x8626
 bb8:	a800                	.insn	2, 0xa800
 bba:	1b26                	.insn	2, 0x1b26
 bbc:	00a8                	.insn	2, 0x00a8
 bbe:	1c31                	.insn	2, 0x1c31
 bc0:	049f 04f4 04f8      	.insn	6, 0x04f804f4049f
 bc6:	790e                	.insn	2, 0x790e
 bc8:	a800                	.insn	2, 0xa800
 bca:	8626                	.insn	2, 0x8626
 bcc:	a800                	.insn	2, 0xa800
 bce:	1b26                	.insn	2, 0x1b26
 bd0:	00a8                	.insn	2, 0x00a8
 bd2:	1c32                	.insn	2, 0x1c32
 bd4:	009f f404 9803      	.insn	6, 0x9803f404009f
 bda:	0604                	.insn	2, 0x0604
 bdc:	00860087          	.insn	4, 0x00860087
 be0:	9f1d                	.insn	2, 0x9f1d
 be2:	9804                	.insn	2, 0x9804
 be4:	b004                	.insn	2, 0xb004
 be6:	0104                	.insn	2, 0x0104
 be8:	045e                	.insn	2, 0x045e
 bea:	04b0                	.insn	2, 0x04b0
 bec:	04fc                	.insn	2, 0x04fc
 bee:	5901                	.insn	2, 0x5901
 bf0:	0400                	.insn	2, 0x0400
 bf2:	04b0                	.insn	2, 0x04b0
 bf4:	04e4                	.insn	2, 0x04e4
 bf6:	7906                	.insn	2, 0x7906
 bf8:	8600                	.insn	2, 0x8600
 bfa:	1d00                	.insn	2, 0x1d00
 bfc:	049f 04e4 04fc      	.insn	6, 0x04fc04e4049f
 c02:	5f01                	.insn	2, 0x5f01
 c04:	fc04                	.insn	2, 0xfc04
 c06:	8004                	.insn	2, 0x8004
 c08:	0105                	.insn	2, 0x0105
 c0a:	0059                	.insn	2, 0x0059
 c0c:	8004                	.insn	2, 0x8004
 c0e:	b004                	.insn	2, 0xb004
 c10:	0104                	.insn	2, 0x0104
 c12:	0459                	.insn	2, 0x0459
 c14:	04c8                	.insn	2, 0x04c8
 c16:	04d0                	.insn	2, 0x04d0
 c18:	5a01                	.insn	2, 0x5a01
 c1a:	d004                	.insn	2, 0xd004
 c1c:	8004                	.insn	2, 0x8004
 c1e:	0105                	.insn	2, 0x0105
 c20:	0065                	.insn	2, 0x0065
 c22:	9804                	.insn	2, 0x9804
 c24:	e005                	.insn	2, 0xe005
 c26:	0105                	.insn	2, 0x0105
 c28:	045d                	.insn	2, 0x045d
 c2a:	05f8                	.insn	2, 0x05f8
 c2c:	0690                	.insn	2, 0x0690
 c2e:	5d01                	.insn	2, 0x5d01
 c30:	0400                	.insn	2, 0x0400
 c32:	05ac                	.insn	2, 0x05ac
 c34:	05c8                	.insn	2, 0x05c8
 c36:	5f01                	.insn	2, 0x5f01
 c38:	0400                	.insn	2, 0x0400
 c3a:	05e8                	.insn	2, 0x05e8
 c3c:	05ec                	.insn	2, 0x05ec
 c3e:	5801                	.insn	2, 0x5801
 c40:	0400                	.insn	2, 0x0400
 c42:	098c                	.insn	2, 0x098c
 c44:	09a8                	.insn	2, 0x09a8
 c46:	5f01                	.insn	2, 0x5f01
 c48:	ac04                	.insn	2, 0xac04
 c4a:	b009                	.insn	2, 0xb009
 c4c:	0109                	.insn	2, 0x0109
 c4e:	005f c004 9006      	.insn	6, 0x9006c004005f
 c54:	0108                	.insn	2, 0x0108
 c56:	0459                	.insn	2, 0x0459
 c58:	0890                	.insn	2, 0x0890
 c5a:	09d0                	.insn	2, 0x09d0
 c5c:	8705                	.insn	2, 0x8705
 c5e:	4000                	.insn	2, 0x4000
 c60:	9f25                	.insn	2, 0x9f25
 c62:	0400                	.insn	2, 0x0400
 c64:	06c4                	.insn	2, 0x06c4
 c66:	07bc                	.insn	2, 0x07bc
 c68:	6801                	.insn	2, 0x6801
 c6a:	bc04                	.insn	2, 0xbc04
 c6c:	0709d007          	.insn	4, 0x0709d007
 c70:	24400087          	.insn	4, 0x24400087
 c74:	2540                	.insn	2, 0x2540
 c76:	009f d004 d406      	.insn	6, 0xd406d004009f
 c7c:	0106                	.insn	2, 0x0106
 c7e:	045a                	.insn	2, 0x045a
 c80:	06d4                	.insn	2, 0x06d4
 c82:	5b0106d7          	.insn	4, 0x5b0106d7
 c86:	d704                	.insn	2, 0xd704
 c88:	8406                	.insn	2, 0x8406
 c8a:	046a0107          	.insn	4, 0x046a0107
 c8e:	0784                	.insn	2, 0x0784
 c90:	07fc                	.insn	2, 0x07fc
 c92:	6301                	.insn	2, 0x6301
 c94:	0400                	.insn	2, 0x0400
 c96:	07ac                	.insn	2, 0x07ac
 c98:	07b0                	.insn	2, 0x07b0
 c9a:	5a01                	.insn	2, 0x5a01
 c9c:	b004                	.insn	2, 0xb004
 c9e:	0107b307          	.insn	4, 0x0107b307
 ca2:	07b3045b          	.insn	4, 0x07b3045b
 ca6:	07e4                	.insn	2, 0x07e4
 ca8:	6a01                	.insn	2, 0x6a01
 caa:	e404                	.insn	2, 0xe404
 cac:	01088407          	.insn	4, 0x01088407
 cb0:	005f c404 c706      	.insn	6, 0xc706c404005f
 cb6:	0606                	.insn	2, 0x0606
 cb8:	007a                	.insn	2, 0x007a
 cba:	0079                	.insn	2, 0x0079
 cbc:	9f1d                	.insn	2, 0x9f1d
 cbe:	c704                	.insn	2, 0xc704
 cc0:	f406                	.insn	2, 0xf406
 cc2:	0606                	.insn	2, 0x0606
 cc4:	00790083          	lb	x1,7(x18)
 cc8:	9f1d                	.insn	2, 0x9f1d
 cca:	f404                	.insn	2, 0xf404
 ccc:	8006                	.insn	2, 0x8006
 cce:	045f0107          	.insn	4, 0x045f0107
 cd2:	0780                	.insn	2, 0x0780
 cd4:	0784                	.insn	2, 0x0784
 cd6:	7808                	.insn	2, 0x7808
 cd8:	4000                	.insn	2, 0x4000
 cda:	7a25                	.insn	2, 0x7a25
 cdc:	2100                	.insn	2, 0x2100
 cde:	049f 0784 0798      	.insn	6, 0x07980784049f
 ce4:	5f01                	.insn	2, 0x5f01
 ce6:	9804                	.insn	2, 0x9804
 ce8:	0109d007          	.insn	4, 0x0109d007
 cec:	0069                	.insn	2, 0x0069
 cee:	9804                	.insn	2, 0x9804
 cf0:	0607d407          	.insn	4, 0x0607d407
 cf4:	0089                	.insn	2, 0x0089
 cf6:	0079                	.insn	2, 0x0079
 cf8:	9f1d                	.insn	2, 0x9f1d
 cfa:	d404                	.insn	2, 0xd404
 cfc:	0107e007          	.insn	4, 0x0107e007
 d00:	07e0045b          	.insn	4, 0x07e0045b
 d04:	07e4                	.insn	2, 0x07e4
 d06:	780a                	.insn	2, 0x780a
 d08:	4000                	.insn	2, 0x4000
 d0a:	4024                	.insn	2, 0x4024
 d0c:	7a25                	.insn	2, 0x7a25
 d0e:	2100                	.insn	2, 0x2100
 d10:	049f 07e4 0890      	.insn	6, 0x089007e4049f
 d16:	5b01                	.insn	2, 0x5b01
 d18:	9004                	.insn	2, 0x9004
 d1a:	d008                	.insn	2, 0xd008
 d1c:	0109                	.insn	2, 0x0109
 d1e:	0059                	.insn	2, 0x0059
 d20:	dc04                	.insn	2, 0xdc04
 d22:	e406                	.insn	2, 0xe406
 d24:	0106                	.insn	2, 0x0106
 d26:	045a                	.insn	2, 0x045a
 d28:	06e4                	.insn	2, 0x06e4
 d2a:	0798                	.insn	2, 0x0798
 d2c:	6901                	.insn	2, 0x6901
 d2e:	bc04                	.insn	2, 0xbc04
 d30:	0107c007          	.insn	4, 0x0107c007
 d34:	045a                	.insn	2, 0x045a
 d36:	07c0                	.insn	2, 0x07c0
 d38:	09d0                	.insn	2, 0x09d0
 d3a:	6801                	.insn	2, 0x6801
 d3c:	0400                	.insn	2, 0x0400
 d3e:	08a8                	.insn	2, 0x08a8
 d40:	08b0                	.insn	2, 0x08b0
 d42:	5a01                	.insn	2, 0x5a01
 d44:	b004                	.insn	2, 0xb004
 d46:	8808                	.insn	2, 0x8808
 d48:	0109                	.insn	2, 0x0109
 d4a:	0060                	.insn	2, 0x0060
 d4c:	b804                	.insn	2, 0xb804
 d4e:	c008                	.insn	2, 0xc008
 d50:	0108                	.insn	2, 0x0108
 d52:	045a                	.insn	2, 0x045a
 d54:	08c0                	.insn	2, 0x08c0
 d56:	08dc                	.insn	2, 0x08dc
 d58:	5e01                	.insn	2, 0x5e01
 d5a:	e404                	.insn	2, 0xe404
 d5c:	8008                	.insn	2, 0x8008
 d5e:	0109                	.insn	2, 0x0109
 d60:	005f c804 d008      	.insn	6, 0xd008c804005f
 d66:	0108                	.insn	2, 0x0108
 d68:	045a                	.insn	2, 0x045a
 d6a:	08d0                	.insn	2, 0x08d0
 d6c:	09d0                	.insn	2, 0x09d0
 d6e:	6101                	.insn	2, 0x6101
 d70:	0400                	.insn	2, 0x0400
 d72:	08e4                	.insn	2, 0x08e4
 d74:	08ec                	.insn	2, 0x08ec
 d76:	5a01                	.insn	2, 0x5a01
 d78:	ec04                	.insn	2, 0xec04
 d7a:	f808                	.insn	2, 0xf808
 d7c:	0108                	.insn	2, 0x0108
 d7e:	005d                	.insn	2, 0x005d
 d80:	9004                	.insn	2, 0x9004
 d82:	b808                	.insn	2, 0xb808
 d84:	0108                	.insn	2, 0x0108
 d86:	005e                	.insn	2, 0x005e
 d88:	9404                	.insn	2, 0x9404
 d8a:	d808                	.insn	2, 0xd808
 d8c:	0108                	.insn	2, 0x0108
 d8e:	045f 08d8 08fc      	.insn	6, 0x08fc08d8045f
 d94:	8c06                	.insn	2, 0x8c06
 d96:	827f 1a00 049f 08fc 	.insn	10, 0x099c08fc049f1a00827f
 d9e:	099c 
 da0:	8206                	.insn	2, 0x8206
 da2:	7d00                	.insn	2, 0x7d00
 da4:	1a00                	.insn	2, 0x1a00
 da6:	009f a804 ac09      	.insn	6, 0xac09a804009f
 dac:	0109                	.insn	2, 0x0109
 dae:	005f b004 c409      	.insn	6, 0xc409b004005f
 db4:	0109                	.insn	2, 0x0109
 db6:	Address 0xdb6 is out of bounds.


Disassembly of section .debug_rnglists:

00000000 <.debug_rnglists>:
   0:	000000a3          	sb	x0,1(x0) # 1 <_heap_size+0x1>
   4:	0005                	.insn	2, 0x0005
   6:	0004                	.insn	2, 0x0004
   8:	0000                	.insn	2, 0x
   a:	0000                	.insn	2, 0x
   c:	0004                	.insn	2, 0x0004
   e:	0400                	.insn	2, 0x0400
  10:	8034                	.insn	2, 0x8034
  12:	0405                	.insn	2, 0x0405
  14:	05bc                	.insn	2, 0x05bc
  16:	0bc4                	.insn	2, 0x0bc4
  18:	0400                	.insn	2, 0x0400
  1a:	0000                	.insn	2, 0x
  1c:	3404                	.insn	2, 0x3404
  1e:	0580                	.insn	2, 0x0580
  20:	bc04                	.insn	2, 0xbc04
  22:	b405                	.insn	2, 0xb405
  24:	0bb8040b          	.insn	4, 0x0bb8040b
  28:	0bc4                	.insn	2, 0x0bc4
  2a:	0400                	.insn	2, 0x0400
  2c:	544c                	.insn	2, 0x544c
  2e:	5404                	.insn	2, 0x5404
  30:	047c                	.insn	2, 0x047c
  32:	02e4                	.insn	2, 0x02e4
  34:	02f8                	.insn	2, 0x02f8
  36:	0400                	.insn	2, 0x0400
  38:	02dc                	.insn	2, 0x02dc
  3a:	02e4                	.insn	2, 0x02e4
  3c:	a004                	.insn	2, 0xa004
  3e:	b408                	.insn	2, 0xb408
  40:	b004000b          	.insn	4, 0xb004000b
  44:	b408                	.insn	2, 0xb408
  46:	0408                	.insn	2, 0x0408
  48:	08c0                	.insn	2, 0x08c0
  4a:	08cc                	.insn	2, 0x08cc
  4c:	d004                	.insn	2, 0xd004
  4e:	8808                	.insn	2, 0x8808
  50:	040a                	.insn	2, 0x040a
  52:	0a8c                	.insn	2, 0x0a8c
  54:	0a90                	.insn	2, 0x0a90
  56:	9c04                	.insn	2, 0x9c04
  58:	a00a                	.insn	2, 0xa00a
  5a:	000a                	.insn	2, 0x000a
  5c:	8804                	.insn	2, 0x8804
  5e:	8c0a                	.insn	2, 0x8c0a
  60:	040a                	.insn	2, 0x040a
  62:	0a90                	.insn	2, 0x0a90
  64:	0a9c                	.insn	2, 0x0a9c
  66:	a004                	.insn	2, 0xa004
  68:	840a                	.insn	2, 0x840a
  6a:	0b8c040b          	.insn	4, 0x0b8c040b
  6e:	0ba0                	.insn	2, 0x0ba0
  70:	a404                	.insn	2, 0xa404
  72:	000ba80b          	.insn	4, 0x000ba80b
  76:	d804                	.insn	2, 0xd804
  78:	e40a                	.insn	2, 0xe40a
  7a:	040a                	.insn	2, 0x040a
  7c:	0af0                	.insn	2, 0x0af0
  7e:	0af4                	.insn	2, 0x0af4
  80:	0400                	.insn	2, 0x0400
  82:	02f8                	.insn	2, 0x02f8
  84:	02fc                	.insn	2, 0x02fc
  86:	8004                	.insn	2, 0x8004
  88:	0403ac03          	lw	x24,64(x7)
  8c:	05bc                	.insn	2, 0x05bc
  8e:	05d0                	.insn	2, 0x05d0
  90:	0400                	.insn	2, 0x0400
  92:	05d8                	.insn	2, 0x05d8
  94:	05dc                	.insn	2, 0x05dc
  96:	ec04                	.insn	2, 0xec04
  98:	bc05                	.insn	2, 0xbc05
  9a:	c0040007          	.insn	4, 0xc0040007
  9e:	0407f407          	.insn	4, 0x0407f407
  a2:	088c                	.insn	2, 0x088c
  a4:	08a0                	.insn	2, 0x08a0
  a6:	7e00                	.insn	2, 0x7e00
  a8:	0000                	.insn	2, 0x
  aa:	0500                	.insn	2, 0x0500
  ac:	0400                	.insn	2, 0x0400
  ae:	0000                	.insn	2, 0x
  b0:	0000                	.insn	2, 0x
  b2:	0400                	.insn	2, 0x0400
  b4:	0000                	.insn	2, 0x
  b6:	3404                	.insn	2, 0x3404
  b8:	02bc                	.insn	2, 0x02bc
  ba:	f404                	.insn	2, 0xf404
  bc:	d002                	.insn	2, 0xd002
  be:	0009                	.insn	2, 0x0009
  c0:	5004                	.insn	2, 0x5004
  c2:	047c                	.insn	2, 0x047c
  c4:	02f4                	.insn	2, 0x02f4
  c6:	0388                	.insn	2, 0x0388
  c8:	0400                	.insn	2, 0x0400
  ca:	0388                	.insn	2, 0x0388
  cc:	038c                	.insn	2, 0x038c
  ce:	9004                	.insn	2, 0x9004
  d0:	0403b003          	.insn	4, 0x0403b003
  d4:	03b4                	.insn	2, 0x03b4
  d6:	03c0                	.insn	2, 0x03c0
  d8:	8004                	.insn	2, 0x8004
  da:	9405                	.insn	2, 0x9405
  dc:	0005                	.insn	2, 0x0005
  de:	cc04                	.insn	2, 0xcc04
  e0:	0403d003          	lhu	x0,64(x7)
  e4:	03e0                	.insn	2, 0x03e0
  e6:	0580                	.insn	2, 0x0580
  e8:	0400                	.insn	2, 0x0400
  ea:	0598                	.insn	2, 0x0598
  ec:	05cc                	.insn	2, 0x05cc
  ee:	f804                	.insn	2, 0xf804
  f0:	8c05                	.insn	2, 0x8c05
  f2:	0006                	.insn	2, 0x0006
  f4:	a404                	.insn	2, 0xa404
  f6:	a806                	.insn	2, 0xa806
  f8:	0406                	.insn	2, 0x0406
  fa:	06b0                	.insn	2, 0x06b0
  fc:	06bc                	.insn	2, 0x06bc
  fe:	c004                	.insn	2, 0xc004
 100:	f406                	.insn	2, 0xf406
 102:	07f80407          	.insn	4, 0x07f80407
 106:	0880                	.insn	2, 0x0880
 108:	8c04                	.insn	2, 0x8c04
 10a:	9008                	.insn	2, 0x9008
 10c:	0008                	.insn	2, 0x0008
 10e:	f404                	.insn	2, 0xf404
 110:	0407f807          	.insn	4, 0x0407f807
 114:	0880                	.insn	2, 0x0880
 116:	088c                	.insn	2, 0x088c
 118:	9004                	.insn	2, 0x9004
 11a:	8c08                	.insn	2, 0x8c08
 11c:	0009                	.insn	2, 0x0009
 11e:	c804                	.insn	2, 0xc804
 120:	d408                	.insn	2, 0xd408
 122:	0408                	.insn	2, 0x0408
 124:	08e0                	.insn	2, 0x08e0
 126:	08e4                	.insn	2, 0x08e4
	...
