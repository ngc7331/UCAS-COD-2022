
../riscv32/elf/sw_conv:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
       0:	00004137          	lui	sp,0x4
       4:	00c0006f          	j	10 <continued>
       8:	00000013          	nop

0000000c <global_result>:
       c:	ffff                	0xffff
       e:	ffff                	0xffff

00000010 <continued>:
      10:	2bc010ef          	jal	ra,12cc <main>
      14:	5c8000ef          	jal	ra,5dc <hit_good_trap>

00000018 <mini_itoa.part.0>:
      18:	ff010113          	addi	sp,sp,-16 # 3ff0 <_binary_data_result_bin_size+0x2970>
      1c:	00812623          	sw	s0,12(sp)
      20:	00000413          	li	s0,0
      24:	10054863          	bltz	a0,134 <mini_itoa.part.0+0x11c>
      28:	06100693          	li	a3,97
      2c:	00060463          	beqz	a2,34 <mini_itoa.part.0+0x1c>
      30:	04100693          	li	a3,65
      34:	00070f93          	mv	t6,a4
      38:	fff00f13          	li	t5,-1
      3c:	00100e93          	li	t4,1
      40:	00900293          	li	t0,9
      44:	ff668393          	addi	t2,a3,-10
      48:	01f55613          	srli	a2,a0,0x1f
      4c:	01f00693          	li	a3,31
      50:	00000e13          	li	t3,0
      54:	fff68693          	addi	a3,a3,-1
      58:	00de98b3          	sll	a7,t4,a3
      5c:	01157833          	and	a6,a0,a7
      60:	00161313          	slli	t1,a2,0x1
      64:	00d85833          	srl	a6,a6,a3
      68:	03e68663          	beq	a3,t5,94 <mini_itoa.part.0+0x7c>
      6c:	00686633          	or	a2,a6,t1
      70:	feb662e3          	bltu	a2,a1,54 <mini_itoa.part.0+0x3c>
      74:	fff68693          	addi	a3,a3,-1
      78:	011e6e33          	or	t3,t3,a7
      7c:	00de98b3          	sll	a7,t4,a3
      80:	40b60633          	sub	a2,a2,a1
      84:	01157833          	and	a6,a0,a7
      88:	00161313          	slli	t1,a2,0x1
      8c:	00d85833          	srl	a6,a6,a3
      90:	fde69ee3          	bne	a3,t5,6c <mini_itoa.part.0+0x54>
      94:	000e0513          	mv	a0,t3
      98:	0ff67693          	andi	a3,a2,255
      9c:	08c2e663          	bltu	t0,a2,128 <mini_itoa.part.0+0x110>
      a0:	03068693          	addi	a3,a3,48
      a4:	0ff6f693          	andi	a3,a3,255
      a8:	001f8f93          	addi	t6,t6,1
      ac:	fedf8fa3          	sb	a3,-1(t6)
      b0:	f9c04ce3          	bgtz	t3,48 <mini_itoa.part.0+0x30>
      b4:	40ef86b3          	sub	a3,t6,a4
      b8:	08f6f663          	bgeu	a3,a5,144 <mini_itoa.part.0+0x12c>
      bc:	40d787b3          	sub	a5,a5,a3
      c0:	00ff87b3          	add	a5,t6,a5
      c4:	03000693          	li	a3,48
      c8:	001f8f93          	addi	t6,t6,1
      cc:	fedf8fa3          	sb	a3,-1(t6)
      d0:	feff9ce3          	bne	t6,a5,c8 <mini_itoa.part.0+0xb0>
      d4:	00040863          	beqz	s0,e4 <mini_itoa.part.0+0xcc>
      d8:	02d00693          	li	a3,45
      dc:	00d78023          	sb	a3,0(a5)
      e0:	00178793          	addi	a5,a5,1
      e4:	40e78533          	sub	a0,a5,a4
      e8:	00078023          	sb	zero,0(a5)
      ec:	00155593          	srli	a1,a0,0x1
      f0:	02058663          	beqz	a1,11c <mini_itoa.part.0+0x104>
      f4:	fff50793          	addi	a5,a0,-1
      f8:	00f707b3          	add	a5,a4,a5
      fc:	00b705b3          	add	a1,a4,a1
     100:	0007c603          	lbu	a2,0(a5)
     104:	00074683          	lbu	a3,0(a4)
     108:	00170713          	addi	a4,a4,1
     10c:	fff78793          	addi	a5,a5,-1
     110:	fec70fa3          	sb	a2,-1(a4)
     114:	00d780a3          	sb	a3,1(a5)
     118:	fee594e3          	bne	a1,a4,100 <mini_itoa.part.0+0xe8>
     11c:	00c12403          	lw	s0,12(sp)
     120:	01010113          	addi	sp,sp,16
     124:	00008067          	ret
     128:	007686b3          	add	a3,a3,t2
     12c:	0ff6f693          	andi	a3,a3,255
     130:	f79ff06f          	j	a8 <mini_itoa.part.0+0x90>
     134:	ee069ae3          	bnez	a3,28 <mini_itoa.part.0+0x10>
     138:	40a00533          	neg	a0,a0
     13c:	00100413          	li	s0,1
     140:	ee9ff06f          	j	28 <mini_itoa.part.0+0x10>
     144:	000f8793          	mv	a5,t6
     148:	f8dff06f          	j	d4 <mini_itoa.part.0+0xbc>

0000014c <mini_vsnprintf>:
     14c:	f9010113          	addi	sp,sp,-112
     150:	06812423          	sw	s0,104(sp)
     154:	06912223          	sw	s1,100(sp)
     158:	07212023          	sw	s2,96(sp)
     15c:	05312e23          	sw	s3,92(sp)
     160:	05412c23          	sw	s4,88(sp)
     164:	05512a23          	sw	s5,84(sp)
     168:	05612823          	sw	s6,80(sp)
     16c:	05712623          	sw	s7,76(sp)
     170:	05812423          	sw	s8,72(sp)
     174:	05912223          	sw	s9,68(sp)
     178:	05a12023          	sw	s10,64(sp)
     17c:	03b12e23          	sw	s11,60(sp)
     180:	06112623          	sw	ra,108(sp)
     184:	00050a13          	mv	s4,a0
     188:	00058993          	mv	s3,a1
     18c:	00060913          	mv	s2,a2
     190:	00068813          	mv	a6,a3
     194:	00050413          	mv	s0,a0
     198:	00000493          	li	s1,0
     19c:	02500a93          	li	s5,37
     1a0:	03000b93          	li	s7,48
     1a4:	06400b13          	li	s6,100
     1a8:	fff58d93          	addi	s11,a1,-1
     1ac:	07500d13          	li	s10,117
     1b0:	07800c93          	li	s9,120
     1b4:	07300c13          	li	s8,115
     1b8:	00094783          	lbu	a5,0(s2)
     1bc:	02078663          	beqz	a5,1e8 <mini_vsnprintf+0x9c>
     1c0:	00148713          	addi	a4,s1,1
     1c4:	03377263          	bgeu	a4,s3,1e8 <mini_vsnprintf+0x9c>
     1c8:	07578063          	beq	a5,s5,228 <mini_vsnprintf+0xdc>
     1cc:	00f40023          	sb	a5,0(s0)
     1d0:	000400a3          	sb	zero,1(s0)
     1d4:	00190913          	addi	s2,s2,1
     1d8:	00094783          	lbu	a5,0(s2)
     1dc:	00140413          	addi	s0,s0,1
     1e0:	414404b3          	sub	s1,s0,s4
     1e4:	fc079ee3          	bnez	a5,1c0 <mini_vsnprintf+0x74>
     1e8:	06c12083          	lw	ra,108(sp)
     1ec:	06812403          	lw	s0,104(sp)
     1f0:	00048513          	mv	a0,s1
     1f4:	06012903          	lw	s2,96(sp)
     1f8:	06412483          	lw	s1,100(sp)
     1fc:	05c12983          	lw	s3,92(sp)
     200:	05812a03          	lw	s4,88(sp)
     204:	05412a83          	lw	s5,84(sp)
     208:	05012b03          	lw	s6,80(sp)
     20c:	04c12b83          	lw	s7,76(sp)
     210:	04812c03          	lw	s8,72(sp)
     214:	04412c83          	lw	s9,68(sp)
     218:	04012d03          	lw	s10,64(sp)
     21c:	03c12d83          	lw	s11,60(sp)
     220:	07010113          	addi	sp,sp,112
     224:	00008067          	ret
     228:	00194683          	lbu	a3,1(s2)
     22c:	0b768663          	beq	a3,s7,2d8 <mini_vsnprintf+0x18c>
     230:	00290913          	addi	s2,s2,2
     234:	00000793          	li	a5,0
     238:	0d668463          	beq	a3,s6,300 <mini_vsnprintf+0x1b4>
     23c:	02db6663          	bltu	s6,a3,268 <mini_vsnprintf+0x11c>
     240:	05800713          	li	a4,88
     244:	12e68063          	beq	a3,a4,364 <mini_vsnprintf+0x218>
     248:	06300793          	li	a5,99
     24c:	16f68c63          	beq	a3,a5,3c4 <mini_vsnprintf+0x278>
     250:	f8068ce3          	beqz	a3,1e8 <mini_vsnprintf+0x9c>
     254:	00d40023          	sb	a3,0(s0)
     258:	000400a3          	sb	zero,1(s0)
     25c:	00140413          	addi	s0,s0,1
     260:	414404b3          	sub	s1,s0,s4
     264:	f55ff06f          	j	1b8 <mini_vsnprintf+0x6c>
     268:	09a68c63          	beq	a3,s10,300 <mini_vsnprintf+0x1b4>
     26c:	0f968c63          	beq	a3,s9,364 <mini_vsnprintf+0x218>
     270:	ff8692e3          	bne	a3,s8,254 <mini_vsnprintf+0x108>
     274:	00082783          	lw	a5,0(a6)
     278:	00480813          	addi	a6,a6,4
     27c:	0007c683          	lbu	a3,0(a5)
     280:	04068863          	beqz	a3,2d0 <mini_vsnprintf+0x184>
     284:	00000713          	li	a4,0
     288:	00170713          	addi	a4,a4,1
     28c:	00e78633          	add	a2,a5,a4
     290:	00064603          	lbu	a2,0(a2)
     294:	fe061ae3          	bnez	a2,288 <mini_vsnprintf+0x13c>
     298:	409d8633          	sub	a2,s11,s1
     29c:	00c77463          	bgeu	a4,a2,2a4 <mini_vsnprintf+0x158>
     2a0:	00070613          	mv	a2,a4
     2a4:	02060663          	beqz	a2,2d0 <mini_vsnprintf+0x184>
     2a8:	00178793          	addi	a5,a5,1
     2ac:	00c40733          	add	a4,s0,a2
     2b0:	00c0006f          	j	2bc <mini_vsnprintf+0x170>
     2b4:	0007c683          	lbu	a3,0(a5)
     2b8:	00178793          	addi	a5,a5,1
     2bc:	00d40023          	sb	a3,0(s0)
     2c0:	00140413          	addi	s0,s0,1
     2c4:	fe8718e3          	bne	a4,s0,2b4 <mini_vsnprintf+0x168>
     2c8:	00070413          	mv	s0,a4
     2cc:	414704b3          	sub	s1,a4,s4
     2d0:	00040023          	sb	zero,0(s0)
     2d4:	ee5ff06f          	j	1b8 <mini_vsnprintf+0x6c>
     2d8:	00294783          	lbu	a5,2(s2)
     2dc:	f00786e3          	beqz	a5,1e8 <mini_vsnprintf+0x9c>
     2e0:	fd078793          	addi	a5,a5,-48
     2e4:	0ff7f793          	andi	a5,a5,255
     2e8:	00394683          	lbu	a3,3(s2)
     2ec:	00a7b713          	sltiu	a4,a5,10
     2f0:	40e00733          	neg	a4,a4
     2f4:	00e7f7b3          	and	a5,a5,a4
     2f8:	00490913          	addi	s2,s2,4
     2fc:	f56690e3          	bne	a3,s6,23c <mini_vsnprintf+0xf0>
     300:	00082503          	lw	a0,0(a6)
     304:	f8b68693          	addi	a3,a3,-117
     308:	00480813          	addi	a6,a6,4
     30c:	0016b693          	seqz	a3,a3
     310:	01810713          	addi	a4,sp,24
     314:	00000613          	li	a2,0
     318:	00a00593          	li	a1,10
     31c:	01012623          	sw	a6,12(sp)
     320:	cf9ff0ef          	jal	ra,18 <mini_itoa.part.0>
     324:	409d86b3          	sub	a3,s11,s1
     328:	00c12803          	lw	a6,12(sp)
     32c:	00d57463          	bgeu	a0,a3,334 <mini_vsnprintf+0x1e8>
     330:	00050693          	mv	a3,a0
     334:	f8068ee3          	beqz	a3,2d0 <mini_vsnprintf+0x184>
     338:	01810793          	addi	a5,sp,24
     33c:	00d406b3          	add	a3,s0,a3
     340:	0007c703          	lbu	a4,0(a5)
     344:	00140413          	addi	s0,s0,1
     348:	00178793          	addi	a5,a5,1
     34c:	fee40fa3          	sb	a4,-1(s0)
     350:	fe8698e3          	bne	a3,s0,340 <mini_vsnprintf+0x1f4>
     354:	00068413          	mv	s0,a3
     358:	414684b3          	sub	s1,a3,s4
     35c:	00040023          	sb	zero,0(s0)
     360:	e59ff06f          	j	1b8 <mini_vsnprintf+0x6c>
     364:	00082503          	lw	a0,0(a6)
     368:	fa868613          	addi	a2,a3,-88
     36c:	00480813          	addi	a6,a6,4
     370:	00100693          	li	a3,1
     374:	01810713          	addi	a4,sp,24
     378:	00163613          	seqz	a2,a2
     37c:	01000593          	li	a1,16
     380:	01012623          	sw	a6,12(sp)
     384:	c95ff0ef          	jal	ra,18 <mini_itoa.part.0>
     388:	409d86b3          	sub	a3,s11,s1
     38c:	00c12803          	lw	a6,12(sp)
     390:	00d57463          	bgeu	a0,a3,398 <mini_vsnprintf+0x24c>
     394:	00050693          	mv	a3,a0
     398:	f2068ce3          	beqz	a3,2d0 <mini_vsnprintf+0x184>
     39c:	01810793          	addi	a5,sp,24
     3a0:	00d406b3          	add	a3,s0,a3
     3a4:	0007c703          	lbu	a4,0(a5)
     3a8:	00140413          	addi	s0,s0,1
     3ac:	00178793          	addi	a5,a5,1
     3b0:	fee40fa3          	sb	a4,-1(s0)
     3b4:	fe8698e3          	bne	a3,s0,3a4 <mini_vsnprintf+0x258>
     3b8:	00068413          	mv	s0,a3
     3bc:	414684b3          	sub	s1,a3,s4
     3c0:	f9dff06f          	j	35c <mini_vsnprintf+0x210>
     3c4:	00082783          	lw	a5,0(a6)
     3c8:	00140413          	addi	s0,s0,1
     3cc:	00040023          	sb	zero,0(s0)
     3d0:	fef40fa3          	sb	a5,-1(s0)
     3d4:	00480813          	addi	a6,a6,4
     3d8:	414404b3          	sub	s1,s0,s4
     3dc:	dddff06f          	j	1b8 <mini_vsnprintf+0x6c>

000003e0 <mini_snprintf>:
     3e0:	fc010113          	addi	sp,sp,-64
     3e4:	02c10313          	addi	t1,sp,44
     3e8:	02d12623          	sw	a3,44(sp)
     3ec:	00030693          	mv	a3,t1
     3f0:	00112e23          	sw	ra,28(sp)
     3f4:	02e12823          	sw	a4,48(sp)
     3f8:	02f12a23          	sw	a5,52(sp)
     3fc:	03012c23          	sw	a6,56(sp)
     400:	03112e23          	sw	a7,60(sp)
     404:	00612623          	sw	t1,12(sp)
     408:	d45ff0ef          	jal	ra,14c <mini_vsnprintf>
     40c:	01c12083          	lw	ra,28(sp)
     410:	04010113          	addi	sp,sp,64
     414:	00008067          	ret

00000418 <puts>:
     418:	00054603          	lbu	a2,0(a0)
     41c:	000017b7          	lui	a5,0x1
     420:	4b07a703          	lw	a4,1200(a5) # 14b0 <uart>
     424:	00000693          	li	a3,0
     428:	02060263          	beqz	a2,44c <puts+0x34>
     42c:	00872783          	lw	a5,8(a4)
     430:	0087f793          	andi	a5,a5,8
     434:	fe079ce3          	bnez	a5,42c <puts+0x14>
     438:	00168693          	addi	a3,a3,1
     43c:	00c70223          	sb	a2,4(a4)
     440:	00d507b3          	add	a5,a0,a3
     444:	0007c603          	lbu	a2,0(a5)
     448:	fe0612e3          	bnez	a2,42c <puts+0x14>
     44c:	00068513          	mv	a0,a3
     450:	00008067          	ret

00000454 <printf>:
     454:	fc010113          	addi	sp,sp,-64
     458:	02410313          	addi	t1,sp,36
     45c:	00001e37          	lui	t3,0x1
     460:	02b12223          	sw	a1,36(sp)
     464:	02c12423          	sw	a2,40(sp)
     468:	02d12623          	sw	a3,44(sp)
     46c:	00050613          	mv	a2,a0
     470:	00030693          	mv	a3,t1
     474:	10000593          	li	a1,256
     478:	4b4e0513          	addi	a0,t3,1204 # 14b4 <outbuf>
     47c:	00812c23          	sw	s0,24(sp)
     480:	02e12823          	sw	a4,48(sp)
     484:	4b4e0413          	addi	s0,t3,1204
     488:	02f12a23          	sw	a5,52(sp)
     48c:	00112e23          	sw	ra,28(sp)
     490:	03012c23          	sw	a6,56(sp)
     494:	03112e23          	sw	a7,60(sp)
     498:	00612623          	sw	t1,12(sp)
     49c:	cb1ff0ef          	jal	ra,14c <mini_vsnprintf>
     4a0:	00044603          	lbu	a2,0(s0)
     4a4:	000017b7          	lui	a5,0x1
     4a8:	4b07a703          	lw	a4,1200(a5) # 14b0 <uart>
     4ac:	02060263          	beqz	a2,4d0 <printf+0x7c>
     4b0:	00140693          	addi	a3,s0,1
     4b4:	00872783          	lw	a5,8(a4)
     4b8:	0087f793          	andi	a5,a5,8
     4bc:	fe079ce3          	bnez	a5,4b4 <printf+0x60>
     4c0:	00c70223          	sb	a2,4(a4)
     4c4:	00168693          	addi	a3,a3,1
     4c8:	fff6c603          	lbu	a2,-1(a3)
     4cc:	fe0614e3          	bnez	a2,4b4 <printf+0x60>
     4d0:	01c12083          	lw	ra,28(sp)
     4d4:	01812403          	lw	s0,24(sp)
     4d8:	04010113          	addi	sp,sp,64
     4dc:	00008067          	ret

000004e0 <_uptime>:
     4e0:	000017b7          	lui	a5,0x1
     4e4:	4347a783          	lw	a5,1076(a5) # 1434 <perf_cnt>
     4e8:	0007a503          	lw	a0,0(a5)
     4ec:	00008067          	ret

000004f0 <_memtime>:
     4f0:	000017b7          	lui	a5,0x1
     4f4:	4387a783          	lw	a5,1080(a5) # 1438 <perf_cnt+0x4>
     4f8:	0007a503          	lw	a0,0(a5)
     4fc:	00008067          	ret

00000500 <_inst>:
     500:	000017b7          	lui	a5,0x1
     504:	43c7a783          	lw	a5,1084(a5) # 143c <perf_cnt+0x8>
     508:	0007a503          	lw	a0,0(a5)
     50c:	00008067          	ret

00000510 <_nop>:
     510:	000017b7          	lui	a5,0x1
     514:	4407a783          	lw	a5,1088(a5) # 1440 <perf_cnt+0xc>
     518:	0007a503          	lw	a0,0(a5)
     51c:	00008067          	ret

00000520 <bench_prepare>:
     520:	000017b7          	lui	a5,0x1
     524:	43478793          	addi	a5,a5,1076 # 1434 <perf_cnt>
     528:	0007a703          	lw	a4,0(a5)
     52c:	00072703          	lw	a4,0(a4)
     530:	00e52223          	sw	a4,4(a0)
     534:	0047a703          	lw	a4,4(a5)
     538:	00072703          	lw	a4,0(a4)
     53c:	00e52423          	sw	a4,8(a0)
     540:	0087a703          	lw	a4,8(a5)
     544:	00072703          	lw	a4,0(a4)
     548:	00e52623          	sw	a4,12(a0)
     54c:	00c7a783          	lw	a5,12(a5)
     550:	0007a783          	lw	a5,0(a5)
     554:	00f52823          	sw	a5,16(a0)
     558:	00008067          	ret

0000055c <bench_done>:
     55c:	000017b7          	lui	a5,0x1
     560:	43478793          	addi	a5,a5,1076 # 1434 <perf_cnt>
     564:	0007a703          	lw	a4,0(a5)
     568:	00452683          	lw	a3,4(a0)
     56c:	00c52583          	lw	a1,12(a0)
     570:	00072603          	lw	a2,0(a4)
     574:	00852703          	lw	a4,8(a0)
     578:	40d60633          	sub	a2,a2,a3
     57c:	00c52223          	sw	a2,4(a0)
     580:	0047a683          	lw	a3,4(a5)
     584:	01052603          	lw	a2,16(a0)
     588:	0006a683          	lw	a3,0(a3)
     58c:	40e686b3          	sub	a3,a3,a4
     590:	00d52423          	sw	a3,8(a0)
     594:	0087a703          	lw	a4,8(a5)
     598:	00072703          	lw	a4,0(a4)
     59c:	40b70733          	sub	a4,a4,a1
     5a0:	00e52623          	sw	a4,12(a0)
     5a4:	00c7a783          	lw	a5,12(a5)
     5a8:	0007a783          	lw	a5,0(a5)
     5ac:	40c787b3          	sub	a5,a5,a2
     5b0:	00f52823          	sw	a5,16(a0)
     5b4:	00008067          	ret

000005b8 <_halt>:
     5b8:	000007b7          	lui	a5,0x0
     5bc:	00a7a623          	sw	a0,12(a5) # c <global_result>
     5c0:	0000006f          	j	5c0 <_halt+0x8>

000005c4 <nemu_assert>:
     5c4:	00051a63          	bnez	a0,5d8 <nemu_assert+0x14>
     5c8:	000007b7          	lui	a5,0x0
     5cc:	00100713          	li	a4,1
     5d0:	00e7a623          	sw	a4,12(a5) # c <global_result>
     5d4:	0000006f          	j	5d4 <nemu_assert+0x10>
     5d8:	00008067          	ret

000005dc <hit_good_trap>:
     5dc:	000007b7          	lui	a5,0x0
     5e0:	0007a623          	sw	zero,12(a5) # c <global_result>
     5e4:	0000006f          	j	5e4 <hit_good_trap+0x8>

000005e8 <mul>:
     5e8:	41f5d793          	srai	a5,a1,0x1f
     5ec:	00050313          	mv	t1,a0
     5f0:	08079463          	bnez	a5,678 <_binary_riscv32_obj_data_sw_conv_data_bin_size+0x58>
     5f4:	00100e13          	li	t3,1
     5f8:	00000e93          	li	t4,0
     5fc:	06058e63          	beqz	a1,678 <_binary_riscv32_obj_data_sw_conv_data_bin_size+0x58>
     600:	41f7d693          	srai	a3,a5,0x1f
     604:	00b6c733          	xor	a4,a3,a1
     608:	00f6c5b3          	xor	a1,a3,a5
     60c:	40d707b3          	sub	a5,a4,a3
     610:	00f73633          	sltu	a2,a4,a5
     614:	40d585b3          	sub	a1,a1,a3
     618:	00078713          	mv	a4,a5
     61c:	40c585b3          	sub	a1,a1,a2
     620:	00000513          	li	a0,0
     624:	00000693          	li	a3,0
     628:	04000893          	li	a7,64
     62c:	fe068613          	addi	a2,a3,-32
     630:	00d317b3          	sll	a5,t1,a3
     634:	41f65613          	srai	a2,a2,0x1f
     638:	00177813          	andi	a6,a4,1
     63c:	00c7f7b3          	and	a5,a5,a2
     640:	00175713          	srli	a4,a4,0x1
     644:	01f59613          	slli	a2,a1,0x1f
     648:	00168693          	addi	a3,a3,1
     64c:	00080463          	beqz	a6,654 <_binary_riscv32_obj_data_sw_conv_data_bin_size+0x34>
     650:	00f50533          	add	a0,a0,a5
     654:	00e66733          	or	a4,a2,a4
     658:	4015d593          	srai	a1,a1,0x1
     65c:	fd1698e3          	bne	a3,a7,62c <_binary_riscv32_obj_data_sw_conv_data_bin_size+0xc>
     660:	00100793          	li	a5,1
     664:	00fe1663          	bne	t3,a5,670 <_binary_riscv32_obj_data_sw_conv_data_bin_size+0x50>
     668:	000e9463          	bnez	t4,670 <_binary_riscv32_obj_data_sw_conv_data_bin_size+0x50>
     66c:	00008067          	ret
     670:	40a00533          	neg	a0,a0
     674:	00008067          	ret
     678:	fff00e13          	li	t3,-1
     67c:	fff00e93          	li	t4,-1
     680:	f81ff06f          	j	600 <mul+0x18>

00000684 <convolution>:
     684:	f7010113          	addi	sp,sp,-144
     688:	000017b7          	lui	a5,0x1
     68c:	07612a23          	sw	s6,116(sp)
     690:	47478b13          	addi	s6,a5,1140 # 1474 <addr>
     694:	000b2683          	lw	a3,0(s6)
     698:	07712823          	sw	s7,112(sp)
     69c:	028b2783          	lw	a5,40(s6)
     6a0:	018b2b83          	lw	s7,24(s6)
     6a4:	02d12223          	sw	a3,36(sp)
     6a8:	008b2683          	lw	a3,8(s6)
     6ac:	07812623          	sw	s8,108(sp)
     6b0:	024b2f83          	lw	t6,36(s6)
     6b4:	014b2c03          	lw	s8,20(s6)
     6b8:	07912423          	sw	s9,104(sp)
     6bc:	08812623          	sw	s0,140(sp)
     6c0:	08912423          	sw	s1,136(sp)
     6c4:	09212223          	sw	s2,132(sp)
     6c8:	09312023          	sw	s3,128(sp)
     6cc:	07412e23          	sw	s4,124(sp)
     6d0:	07512c23          	sw	s5,120(sp)
     6d4:	07a12223          	sw	s10,100(sp)
     6d8:	07b12023          	sw	s11,96(sp)
     6dc:	40fb8733          	sub	a4,s7,a5
     6e0:	00d12023          	sw	a3,0(sp)
     6e4:	004b2c83          	lw	s9,4(s6)
     6e8:	41fc05b3          	sub	a1,s8,t6
     6ec:	66e05463          	blez	a4,d54 <convolution+0x6d0>
     6f0:	00170713          	addi	a4,a4,1
     6f4:	01071313          	slli	t1,a4,0x10
     6f8:	41035313          	srai	t1,t1,0x10
     6fc:	41f35613          	srai	a2,t1,0x1f
     700:	00e12223          	sw	a4,4(sp)
     704:	00664733          	xor	a4,a2,t1
     708:	40c70533          	sub	a0,a4,a2
     70c:	00a736b3          	sltu	a3,a4,a0
     710:	40c00833          	neg	a6,a2
     714:	00050713          	mv	a4,a0
     718:	40d806b3          	sub	a3,a6,a3
     71c:	64b05a63          	blez	a1,d70 <convolution+0x6ec>
     720:	00158d93          	addi	s11,a1,1
     724:	010d9f13          	slli	t5,s11,0x10
     728:	410f5f13          	srai	t5,t5,0x10
     72c:	02cb2883          	lw	a7,44(s6)
     730:	00001837          	lui	a6,0x1
     734:	5b480513          	addi	a0,a6,1460 # 15b4 <conv_size>
     738:	030b2e83          	lw	t4,48(s6)
     73c:	5b182a23          	sw	a7,1460(a6)
     740:	00412803          	lw	a6,4(sp)
     744:	010b9593          	slli	a1,s7,0x10
     748:	4105d593          	srai	a1,a1,0x10
     74c:	01d52223          	sw	t4,4(a0)
     750:	01b52423          	sw	s11,8(a0)
     754:	01052623          	sw	a6,12(a0)
     758:	010c1293          	slli	t0,s8,0x10
     75c:	41f5d513          	srai	a0,a1,0x1f
     760:	4102d293          	srai	t0,t0,0x10
     764:	5e051063          	bnez	a0,d44 <convolution+0x6c0>
     768:	00100813          	li	a6,1
     76c:	01012423          	sw	a6,8(sp)
     770:	00012623          	sw	zero,12(sp)
     774:	5c058863          	beqz	a1,d44 <convolution+0x6c0>
     778:	41f55813          	srai	a6,a0,0x1f
     77c:	00b845b3          	xor	a1,a6,a1
     780:	410588b3          	sub	a7,a1,a6
     784:	00a84533          	xor	a0,a6,a0
     788:	41050533          	sub	a0,a0,a6
     78c:	0115b5b3          	sltu	a1,a1,a7
     790:	40b50e33          	sub	t3,a0,a1
     794:	05112023          	sw	a7,64(sp)
     798:	03c12a23          	sw	t3,52(sp)
     79c:	00088813          	mv	a6,a7
     7a0:	00000593          	li	a1,0
     7a4:	00000513          	li	a0,0
     7a8:	04000493          	li	s1,64
     7ac:	fe050393          	addi	t2,a0,-32
     7b0:	00a298b3          	sll	a7,t0,a0
     7b4:	41f3d393          	srai	t2,t2,0x1f
     7b8:	00187913          	andi	s2,a6,1
     7bc:	0078f8b3          	and	a7,a7,t2
     7c0:	01fe1413          	slli	s0,t3,0x1f
     7c4:	00185393          	srli	t2,a6,0x1
     7c8:	00150513          	addi	a0,a0,1
     7cc:	00090463          	beqz	s2,7d4 <convolution+0x150>
     7d0:	011585b3          	add	a1,a1,a7
     7d4:	00746833          	or	a6,s0,t2
     7d8:	401e5e13          	srai	t3,t3,0x1
     7dc:	fc9518e3          	bne	a0,s1,7ac <convolution+0x128>
     7e0:	00812803          	lw	a6,8(sp)
     7e4:	00100513          	li	a0,1
     7e8:	54a81a63          	bne	a6,a0,d3c <convolution+0x6b8>
     7ec:	00c12503          	lw	a0,12(sp)
     7f0:	54051663          	bnez	a0,d3c <convolution+0x6b8>
     7f4:	01079793          	slli	a5,a5,0x10
     7f8:	4107d793          	srai	a5,a5,0x10
     7fc:	010f9493          	slli	s1,t6,0x10
     800:	41f7d513          	srai	a0,a5,0x1f
     804:	4104d493          	srai	s1,s1,0x10
     808:	52051463          	bnez	a0,d30 <convolution+0x6ac>
     80c:	00100293          	li	t0,1
     810:	00000f93          	li	t6,0
     814:	50078e63          	beqz	a5,d30 <convolution+0x6ac>
     818:	41f55813          	srai	a6,a0,0x1f
     81c:	00f847b3          	xor	a5,a6,a5
     820:	410788b3          	sub	a7,a5,a6
     824:	00a84533          	xor	a0,a6,a0
     828:	0117be33          	sltu	t3,a5,a7
     82c:	41050533          	sub	a0,a0,a6
     830:	00088793          	mv	a5,a7
     834:	41c50533          	sub	a0,a0,t3
     838:	00000813          	li	a6,0
     83c:	00000893          	li	a7,0
     840:	04000913          	li	s2,64
     844:	fe088393          	addi	t2,a7,-32
     848:	01149e33          	sll	t3,s1,a7
     84c:	41f3d393          	srai	t2,t2,0x1f
     850:	0017f993          	andi	s3,a5,1
     854:	007e7e33          	and	t3,t3,t2
     858:	01f51413          	slli	s0,a0,0x1f
     85c:	0017d393          	srli	t2,a5,0x1
     860:	00188893          	addi	a7,a7,1
     864:	00098463          	beqz	s3,86c <convolution+0x1e8>
     868:	01c80833          	add	a6,a6,t3
     86c:	007467b3          	or	a5,s0,t2
     870:	40155513          	srai	a0,a0,0x1
     874:	fd2898e3          	bne	a7,s2,844 <convolution+0x1c0>
     878:	00100793          	li	a5,1
     87c:	4af29663          	bne	t0,a5,d28 <convolution+0x6a4>
     880:	4a0f9463          	bnez	t6,d28 <convolution+0x6a4>
     884:	00180813          	addi	a6,a6,1
     888:	48c05663          	blez	a2,d14 <convolution+0x690>
     88c:	00100e13          	li	t3,1
     890:	00000313          	li	t1,0
     894:	00000613          	li	a2,0
     898:	00000793          	li	a5,0
     89c:	04000f93          	li	t6,64
     8a0:	fe060893          	addi	a7,a2,-32
     8a4:	00cf1533          	sll	a0,t5,a2
     8a8:	41f8d893          	srai	a7,a7,0x1f
     8ac:	00177393          	andi	t2,a4,1
     8b0:	01157533          	and	a0,a0,a7
     8b4:	01f69293          	slli	t0,a3,0x1f
     8b8:	00175893          	srli	a7,a4,0x1
     8bc:	00160613          	addi	a2,a2,1
     8c0:	00038463          	beqz	t2,8c8 <convolution+0x244>
     8c4:	00a787b3          	add	a5,a5,a0
     8c8:	0112e733          	or	a4,t0,a7
     8cc:	4016d693          	srai	a3,a3,0x1
     8d0:	fdf618e3          	bne	a2,t6,8a0 <convolution+0x21c>
     8d4:	00100713          	li	a4,1
     8d8:	42ee1a63          	bne	t3,a4,d0c <convolution+0x688>
     8dc:	42031863          	bnez	t1,d0c <convolution+0x688>
     8e0:	240e8063          	beqz	t4,b20 <convolution+0x49c>
     8e4:	01059713          	slli	a4,a1,0x10
     8e8:	41075713          	srai	a4,a4,0x10
     8ec:	41f75d13          	srai	s10,a4,0x1f
     8f0:	02e12e23          	sw	a4,60(sp)
     8f4:	00ed4733          	xor	a4,s10,a4
     8f8:	41a706b3          	sub	a3,a4,s10
     8fc:	00179793          	slli	a5,a5,0x1
     900:	00d73733          	sltu	a4,a4,a3
     904:	04d12623          	sw	a3,76(sp)
     908:	00f12e23          	sw	a5,28(sp)
     90c:	41a006b3          	neg	a3,s10
     910:	00181793          	slli	a5,a6,0x1
     914:	02f12023          	sw	a5,32(sp)
     918:	40e687b3          	sub	a5,a3,a4
     91c:	05b12a23          	sw	s11,84(sp)
     920:	05a12c23          	sw	s10,88(sp)
     924:	000c8d93          	mv	s11,s9
     928:	00012823          	sw	zero,16(sp)
     92c:	04f12823          	sw	a5,80(sp)
     930:	000b8c93          	mv	s9,s7
     934:	000c0d13          	mv	s10,s8
     938:	010b2783          	lw	a5,16(s6)
     93c:	00000b93          	li	s7,0
     940:	1a078a63          	beqz	a5,af4 <convolution+0x470>
     944:	000c8c13          	mv	s8,s9
     948:	000d0c93          	mv	s9,s10
     94c:	000b8d13          	mv	s10,s7
     950:	00012383          	lw	t2,0(sp)
     954:	010d1a13          	slli	s4,s10,0x10
     958:	00000b93          	li	s7,0
     95c:	410a5a13          	srai	s4,s4,0x10
     960:	01a12a23          	sw	s10,20(sp)
     964:	000a0993          	mv	s3,s4
     968:	00038d13          	mv	s10,t2
     96c:	000d8393          	mv	t2,s11
     970:	000b8d93          	mv	s11,s7
     974:	010d9793          	slli	a5,s11,0x10
     978:	0107d793          	srli	a5,a5,0x10
     97c:	00000b93          	li	s7,0
     980:	04f12423          	sw	a5,72(sp)
     984:	01b12c23          	sw	s11,24(sp)
     988:	01412783          	lw	a5,20(sp)
     98c:	36078263          	beqz	a5,cf0 <convolution+0x66c>
     990:	024b2783          	lw	a5,36(s6)
     994:	000d1a03          	lh	s4,0(s10)
     998:	02f12423          	sw	a5,40(sp)
     99c:	36078463          	beqz	a5,d04 <convolution+0x680>
     9a0:	028b2e03          	lw	t3,40(s6)
     9a4:	010b9293          	slli	t0,s7,0x10
     9a8:	4102d293          	srai	t0,t0,0x10
     9ac:	010e1d93          	slli	s11,t3,0x10
     9b0:	410ddd93          	srai	s11,s11,0x10
     9b4:	41fdd913          	srai	s2,s11,0x1f
     9b8:	01b947b3          	xor	a5,s2,s11
     9bc:	412786b3          	sub	a3,a5,s2
     9c0:	00d7b7b3          	sltu	a5,a5,a3
     9c4:	04d12223          	sw	a3,68(sp)
     9c8:	412006b3          	neg	a3,s2
     9cc:	40f687b3          	sub	a5,a3,a5
     9d0:	01f29713          	slli	a4,t0,0x1f
     9d4:	01811403          	lh	s0,24(sp)
     9d8:	02f12c23          	sw	a5,56(sp)
     9dc:	405707b3          	sub	a5,a4,t0
     9e0:	02f12823          	sw	a5,48(sp)
     9e4:	00000493          	li	s1,0
     9e8:	00000a93          	li	s5,0
     9ec:	05412e23          	sw	s4,92(sp)
     9f0:	04412683          	lw	a3,68(sp)
     9f4:	03812583          	lw	a1,56(sp)
     9f8:	01049313          	slli	t1,s1,0x10
     9fc:	01049893          	slli	a7,s1,0x10
     a00:	01035313          	srli	t1,t1,0x10
     a04:	4108d893          	srai	a7,a7,0x10
     a08:	00000513          	li	a0,0
     a0c:	00000713          	li	a4,0
     a10:	04000813          	li	a6,64
     a14:	fe070613          	addi	a2,a4,-32
     a18:	00e897b3          	sll	a5,a7,a4
     a1c:	41f65613          	srai	a2,a2,0x1f
     a20:	0016fe93          	andi	t4,a3,1
     a24:	00c7f7b3          	and	a5,a5,a2
     a28:	0016d693          	srli	a3,a3,0x1
     a2c:	01f59613          	slli	a2,a1,0x1f
     a30:	00170713          	addi	a4,a4,1
     a34:	000e8463          	beqz	t4,a3c <convolution+0x3b8>
     a38:	00f50533          	add	a0,a0,a5
     a3c:	00d666b3          	or	a3,a2,a3
     a40:	4015d593          	srai	a1,a1,0x1
     a44:	fd0718e3          	bne	a4,a6,a14 <convolution+0x390>
     a48:	11205863          	blez	s2,b58 <convolution+0x4d4>
     a4c:	040e0263          	beqz	t3,a90 <convolution+0x40c>
     a50:	04812783          	lw	a5,72(sp)
     a54:	00678333          	add	t1,a5,t1
     a58:	03012783          	lw	a5,48(sp)
     a5c:	01031313          	slli	t1,t1,0x10
     a60:	41035313          	srai	t1,t1,0x10
     a64:	00a787b3          	add	a5,a5,a0
     a68:	02f12623          	sw	a5,44(sp)
     a6c:	04000513          	li	a0,64
     a70:	00028793          	mv	a5,t0
     a74:	0007c863          	bltz	a5,a84 <convolution+0x400>
     a78:	0187f663          	bgeu	a5,s8,a84 <convolution+0x400>
     a7c:	00044463          	bltz	s0,a84 <convolution+0x400>
     a80:	0f946463          	bltu	s0,s9,b68 <convolution+0x4e4>
     a84:	00178793          	addi	a5,a5,1
     a88:	40578733          	sub	a4,a5,t0
     a8c:	ffc764e3          	bltu	a4,t3,a74 <convolution+0x3f0>
     a90:	02812783          	lw	a5,40(sp)
     a94:	00148493          	addi	s1,s1,1
     a98:	00140413          	addi	s0,s0,1
     a9c:	f4f49ae3          	bne	s1,a5,9f0 <convolution+0x36c>
     aa0:	40aad793          	srai	a5,s5,0xa
     aa4:	05c12a03          	lw	s4,92(sp)
     aa8:	01079793          	slli	a5,a5,0x10
     aac:	0107d793          	srli	a5,a5,0x10
     ab0:	014787b3          	add	a5,a5,s4
     ab4:	00fd1023          	sh	a5,0(s10)
     ab8:	00412783          	lw	a5,4(sp)
     abc:	001b8b93          	addi	s7,s7,1
     ac0:	002d0d13          	addi	s10,s10,2
     ac4:	ecfbe2e3          	bltu	s7,a5,988 <convolution+0x304>
     ac8:	01812d83          	lw	s11,24(sp)
     acc:	05412783          	lw	a5,84(sp)
     ad0:	001d8d93          	addi	s11,s11,1
     ad4:	eafd90e3          	bne	s11,a5,974 <convolution+0x2f0>
     ad8:	01412d03          	lw	s10,20(sp)
     adc:	010b2783          	lw	a5,16(s6)
     ae0:	00038d93          	mv	s11,t2
     ae4:	001d0d13          	addi	s10,s10,1
     ae8:	e6fd64e3          	bltu	s10,a5,950 <convolution+0x2cc>
     aec:	000c8d13          	mv	s10,s9
     af0:	000c0c93          	mv	s9,s8
     af4:	00012683          	lw	a3,0(sp)
     af8:	01c12603          	lw	a2,28(sp)
     afc:	01012703          	lw	a4,16(sp)
     b00:	030b2783          	lw	a5,48(s6)
     b04:	00c686b3          	add	a3,a3,a2
     b08:	00d12023          	sw	a3,0(sp)
     b0c:	02012683          	lw	a3,32(sp)
     b10:	00170713          	addi	a4,a4,1
     b14:	00e12823          	sw	a4,16(sp)
     b18:	00dd8db3          	add	s11,s11,a3
     b1c:	e0f76ee3          	bltu	a4,a5,938 <convolution+0x2b4>
     b20:	08c12403          	lw	s0,140(sp)
     b24:	08812483          	lw	s1,136(sp)
     b28:	08412903          	lw	s2,132(sp)
     b2c:	08012983          	lw	s3,128(sp)
     b30:	07c12a03          	lw	s4,124(sp)
     b34:	07812a83          	lw	s5,120(sp)
     b38:	07412b03          	lw	s6,116(sp)
     b3c:	07012b83          	lw	s7,112(sp)
     b40:	06c12c03          	lw	s8,108(sp)
     b44:	06812c83          	lw	s9,104(sp)
     b48:	06412d03          	lw	s10,100(sp)
     b4c:	06012d83          	lw	s11,96(sp)
     b50:	09010113          	addi	sp,sp,144
     b54:	00008067          	ret
     b58:	00091463          	bnez	s2,b60 <convolution+0x4dc>
     b5c:	ee0d98e3          	bnez	s11,a4c <convolution+0x3c8>
     b60:	40a00533          	neg	a0,a0
     b64:	ee9ff06f          	j	a4c <convolution+0x3c8>
     b68:	04c12603          	lw	a2,76(sp)
     b6c:	05012883          	lw	a7,80(sp)
     b70:	00000593          	li	a1,0
     b74:	00000693          	li	a3,0
     b78:	fe068813          	addi	a6,a3,-32
     b7c:	00d99733          	sll	a4,s3,a3
     b80:	41f85813          	srai	a6,a6,0x1f
     b84:	00167e93          	andi	t4,a2,1
     b88:	01077733          	and	a4,a4,a6
     b8c:	00165613          	srli	a2,a2,0x1
     b90:	01f89813          	slli	a6,a7,0x1f
     b94:	00168693          	addi	a3,a3,1
     b98:	000e8463          	beqz	t4,ba0 <convolution+0x51c>
     b9c:	00e585b3          	add	a1,a1,a4
     ba0:	00c86633          	or	a2,a6,a2
     ba4:	4018d893          	srai	a7,a7,0x1
     ba8:	fca698e3          	bne	a3,a0,b78 <convolution+0x4f4>
     bac:	05812703          	lw	a4,88(sp)
     bb0:	12e05663          	blez	a4,cdc <convolution+0x658>
     bb4:	04012603          	lw	a2,64(sp)
     bb8:	03412883          	lw	a7,52(sp)
     bbc:	00000e93          	li	t4,0
     bc0:	00000693          	li	a3,0
     bc4:	fe068813          	addi	a6,a3,-32
     bc8:	00d31733          	sll	a4,t1,a3
     bcc:	41f85813          	srai	a6,a6,0x1f
     bd0:	00167f13          	andi	t5,a2,1
     bd4:	01077733          	and	a4,a4,a6
     bd8:	00165613          	srli	a2,a2,0x1
     bdc:	01f89813          	slli	a6,a7,0x1f
     be0:	00168693          	addi	a3,a3,1
     be4:	000f0463          	beqz	t5,bec <convolution+0x568>
     be8:	00ee8eb3          	add	t4,t4,a4
     bec:	00c86633          	or	a2,a6,a2
     bf0:	4018d893          	srai	a7,a7,0x1
     bf4:	fca698e3          	bne	a3,a0,bc4 <convolution+0x540>
     bf8:	00812683          	lw	a3,8(sp)
     bfc:	00100713          	li	a4,1
     c00:	0ce69a63          	bne	a3,a4,cd4 <convolution+0x650>
     c04:	00c12703          	lw	a4,12(sp)
     c08:	0c071663          	bnez	a4,cd4 <convolution+0x650>
     c0c:	02c12703          	lw	a4,44(sp)
     c10:	02412603          	lw	a2,36(sp)
     c14:	00f706b3          	add	a3,a4,a5
     c18:	00169693          	slli	a3,a3,0x1
     c1c:	00d386b3          	add	a3,t2,a3
     c20:	00f58733          	add	a4,a1,a5
     c24:	00269683          	lh	a3,2(a3)
     c28:	01d70733          	add	a4,a4,t4
     c2c:	00171713          	slli	a4,a4,0x1
     c30:	00e60733          	add	a4,a2,a4
     c34:	41f6d593          	srai	a1,a3,0x1f
     c38:	00071f03          	lh	t5,0(a4)
     c3c:	08059663          	bnez	a1,cc8 <convolution+0x644>
     c40:	00100a13          	li	s4,1
     c44:	00000f93          	li	t6,0
     c48:	08068063          	beqz	a3,cc8 <convolution+0x644>
     c4c:	41f5d713          	srai	a4,a1,0x1f
     c50:	00d746b3          	xor	a3,a4,a3
     c54:	40e68633          	sub	a2,a3,a4
     c58:	00b745b3          	xor	a1,a4,a1
     c5c:	00c6b833          	sltu	a6,a3,a2
     c60:	40e585b3          	sub	a1,a1,a4
     c64:	00060693          	mv	a3,a2
     c68:	410585b3          	sub	a1,a1,a6
     c6c:	00000e93          	li	t4,0
     c70:	00000613          	li	a2,0
     c74:	fe060713          	addi	a4,a2,-32
     c78:	00cf1833          	sll	a6,t5,a2
     c7c:	41f75713          	srai	a4,a4,0x1f
     c80:	0016f893          	andi	a7,a3,1
     c84:	00e87733          	and	a4,a6,a4
     c88:	0016d693          	srli	a3,a3,0x1
     c8c:	01f59813          	slli	a6,a1,0x1f
     c90:	00160613          	addi	a2,a2,1
     c94:	00088463          	beqz	a7,c9c <convolution+0x618>
     c98:	00ee8eb3          	add	t4,t4,a4
     c9c:	00d866b3          	or	a3,a6,a3
     ca0:	4015d593          	srai	a1,a1,0x1
     ca4:	fca618e3          	bne	a2,a0,c74 <convolution+0x5f0>
     ca8:	00100713          	li	a4,1
     cac:	00ea1863          	bne	s4,a4,cbc <convolution+0x638>
     cb0:	000f9663          	bnez	t6,cbc <convolution+0x638>
     cb4:	01da8ab3          	add	s5,s5,t4
     cb8:	dcdff06f          	j	a84 <convolution+0x400>
     cbc:	41d00eb3          	neg	t4,t4
     cc0:	01da8ab3          	add	s5,s5,t4
     cc4:	dc1ff06f          	j	a84 <convolution+0x400>
     cc8:	fff00a13          	li	s4,-1
     ccc:	fff00f93          	li	t6,-1
     cd0:	f7dff06f          	j	c4c <convolution+0x5c8>
     cd4:	41d00eb3          	neg	t4,t4
     cd8:	f35ff06f          	j	c0c <convolution+0x588>
     cdc:	00071663          	bnez	a4,ce8 <convolution+0x664>
     ce0:	03c12703          	lw	a4,60(sp)
     ce4:	ec0718e3          	bnez	a4,bb4 <convolution+0x530>
     ce8:	40b005b3          	neg	a1,a1
     cec:	ec9ff06f          	j	bb4 <convolution+0x530>
     cf0:	00039a03          	lh	s4,0(t2)
     cf4:	014d1023          	sh	s4,0(s10)
     cf8:	024b2783          	lw	a5,36(s6)
     cfc:	02f12423          	sw	a5,40(sp)
     d00:	ca0790e3          	bnez	a5,9a0 <convolution+0x31c>
     d04:	00000793          	li	a5,0
     d08:	da9ff06f          	j	ab0 <convolution+0x42c>
     d0c:	40f007b3          	neg	a5,a5
     d10:	bd1ff06f          	j	8e0 <convolution+0x25c>
     d14:	00061463          	bnez	a2,d1c <convolution+0x698>
     d18:	b6031ae3          	bnez	t1,88c <convolution+0x208>
     d1c:	fff00e13          	li	t3,-1
     d20:	fff00313          	li	t1,-1
     d24:	b71ff06f          	j	894 <convolution+0x210>
     d28:	41000833          	neg	a6,a6
     d2c:	b59ff06f          	j	884 <convolution+0x200>
     d30:	fff00293          	li	t0,-1
     d34:	fff00f93          	li	t6,-1
     d38:	ae1ff06f          	j	818 <convolution+0x194>
     d3c:	40b005b3          	neg	a1,a1
     d40:	ab5ff06f          	j	7f4 <convolution+0x170>
     d44:	fff00813          	li	a6,-1
     d48:	01012423          	sw	a6,8(sp)
     d4c:	01012623          	sw	a6,12(sp)
     d50:	a29ff06f          	j	778 <convolution+0xf4>
     d54:	00100513          	li	a0,1
     d58:	00a12223          	sw	a0,4(sp)
     d5c:	00100313          	li	t1,1
     d60:	00000613          	li	a2,0
     d64:	00100713          	li	a4,1
     d68:	00000693          	li	a3,0
     d6c:	9ab04ae3          	bgtz	a1,720 <convolution+0x9c>
     d70:	00100f13          	li	t5,1
     d74:	00100d93          	li	s11,1
     d78:	9b5ff06f          	j	72c <convolution+0xa8>

00000d7c <MAX>:
     d7c:	00058793          	mv	a5,a1
     d80:	00a5d463          	bge	a1,a0,d88 <MAX+0xc>
     d84:	00050793          	mv	a5,a0
     d88:	01079513          	slli	a0,a5,0x10
     d8c:	41055513          	srai	a0,a0,0x10
     d90:	00008067          	ret

00000d94 <pooling>:
     d94:	fa010113          	addi	sp,sp,-96
     d98:	05712023          	sw	s7,64(sp)
     d9c:	000017b7          	lui	a5,0x1
     da0:	00001bb7          	lui	s7,0x1
     da4:	5b478793          	addi	a5,a5,1460 # 15b4 <conv_size>
     da8:	04812e23          	sw	s0,92(sp)
     dac:	04912c23          	sw	s1,88(sp)
     db0:	05212a23          	sw	s2,84(sp)
     db4:	05312823          	sw	s3,80(sp)
     db8:	05412623          	sw	s4,76(sp)
     dbc:	05512423          	sw	s5,72(sp)
     dc0:	05612223          	sw	s6,68(sp)
     dc4:	03812e23          	sw	s8,60(sp)
     dc8:	03912c23          	sw	s9,56(sp)
     dcc:	03a12a23          	sw	s10,52(sp)
     dd0:	03b12823          	sw	s11,48(sp)
     dd4:	474b8b93          	addi	s7,s7,1140 # 1474 <addr>
     dd8:	00c7a483          	lw	s1,12(a5)
     ddc:	008ba603          	lw	a2,8(s7)
     de0:	0087ab03          	lw	s6,8(a5)
     de4:	ffe48893          	addi	a7,s1,-2
     de8:	00100793          	li	a5,1
     dec:	00c12823          	sw	a2,16(sp)
     df0:	ffeb0813          	addi	a6,s6,-2
     df4:	4117d863          	bge	a5,a7,1204 <pooling+0x470>
     df8:	ffc48793          	addi	a5,s1,-4
     dfc:	0017d793          	srli	a5,a5,0x1
     e00:	00178793          	addi	a5,a5,1
     e04:	01079793          	slli	a5,a5,0x10
     e08:	4107d793          	srai	a5,a5,0x10
     e0c:	00000693          	li	a3,0
     e10:	00200713          	li	a4,2
     e14:	00000513          	li	a0,0
     e18:	00000313          	li	t1,0
     e1c:	04000e93          	li	t4,64
     e20:	00168693          	addi	a3,a3,1
     e24:	01f51f13          	slli	t5,a0,0x1f
     e28:	fe068593          	addi	a1,a3,-32
     e2c:	00175713          	srli	a4,a4,0x1
     e30:	41f5de13          	srai	t3,a1,0x1f
     e34:	00ef6733          	or	a4,t5,a4
     e38:	00d795b3          	sll	a1,a5,a3
     e3c:	40155513          	srai	a0,a0,0x1
     e40:	01c5f5b3          	and	a1,a1,t3
     e44:	00a76e33          	or	t3,a4,a0
     e48:	01d68863          	beq	a3,t4,e58 <pooling+0xc4>
     e4c:	fc0e0ae3          	beqz	t3,e20 <pooling+0x8c>
     e50:	00b30333          	add	t1,t1,a1
     e54:	fcdff06f          	j	e20 <pooling+0x8c>
     e58:	00100793          	li	a5,1
     e5c:	40688e33          	sub	t3,a7,t1
     e60:	3b07d663          	bge	a5,a6,120c <pooling+0x478>
     e64:	ffcb0793          	addi	a5,s6,-4
     e68:	0017d793          	srli	a5,a5,0x1
     e6c:	00178793          	addi	a5,a5,1
     e70:	01079793          	slli	a5,a5,0x10
     e74:	4107d793          	srai	a5,a5,0x10
     e78:	00000593          	li	a1,0
     e7c:	00200693          	li	a3,2
     e80:	00000313          	li	t1,0
     e84:	00000713          	li	a4,0
     e88:	04000f13          	li	t5,64
     e8c:	00158593          	addi	a1,a1,1
     e90:	01f31f93          	slli	t6,t1,0x1f
     e94:	fe058513          	addi	a0,a1,-32
     e98:	0016d693          	srli	a3,a3,0x1
     e9c:	41f55e93          	srai	t4,a0,0x1f
     ea0:	00dfe6b3          	or	a3,t6,a3
     ea4:	00b79533          	sll	a0,a5,a1
     ea8:	40135313          	srai	t1,t1,0x1
     eac:	01d57533          	and	a0,a0,t4
     eb0:	0066eeb3          	or	t4,a3,t1
     eb4:	01e58863          	beq	a1,t5,ec4 <pooling+0x130>
     eb8:	fc0e8ae3          	beqz	t4,e8c <pooling+0xf8>
     ebc:	00a70733          	add	a4,a4,a0
     ec0:	fcdff06f          	j	e8c <pooling+0xf8>
     ec4:	00100793          	li	a5,1
     ec8:	40e80733          	sub	a4,a6,a4
     ecc:	3517d463          	bge	a5,a7,1214 <pooling+0x480>
     ed0:	ffc48793          	addi	a5,s1,-4
     ed4:	0017d793          	srli	a5,a5,0x1
     ed8:	00100693          	li	a3,1
     edc:	00178593          	addi	a1,a5,1
     ee0:	00278793          	addi	a5,a5,2
     ee4:	3506d063          	bge	a3,a6,1224 <pooling+0x490>
     ee8:	ffcb0993          	addi	s3,s6,-4
     eec:	0019d993          	srli	s3,s3,0x1
     ef0:	00198693          	addi	a3,s3,1
     ef4:	00298993          	addi	s3,s3,2
     ef8:	00ee6733          	or	a4,t3,a4
     efc:	00070663          	beqz	a4,f08 <pooling+0x174>
     f00:	00258793          	addi	a5,a1,2
     f04:	00268993          	addi	s3,a3,2
     f08:	01049713          	slli	a4,s1,0x10
     f0c:	41075713          	srai	a4,a4,0x10
     f10:	010b1893          	slli	a7,s6,0x10
     f14:	41f75693          	srai	a3,a4,0x1f
     f18:	4108d893          	srai	a7,a7,0x10
     f1c:	2c069c63          	bnez	a3,11f4 <pooling+0x460>
     f20:	00100593          	li	a1,1
     f24:	00b12a23          	sw	a1,20(sp)
     f28:	00000d13          	li	s10,0
     f2c:	2c070463          	beqz	a4,11f4 <pooling+0x460>
     f30:	41f6d593          	srai	a1,a3,0x1f
     f34:	00e5c733          	xor	a4,a1,a4
     f38:	40b70db3          	sub	s11,a4,a1
     f3c:	00d5c6b3          	xor	a3,a1,a3
     f40:	40b686b3          	sub	a3,a3,a1
     f44:	01b73733          	sltu	a4,a4,s11
     f48:	40e68733          	sub	a4,a3,a4
     f4c:	02e12423          	sw	a4,40(sp)
     f50:	00070813          	mv	a6,a4
     f54:	000d8593          	mv	a1,s11
     f58:	00000713          	li	a4,0
     f5c:	00000693          	li	a3,0
     f60:	04000e13          	li	t3,64
     f64:	fe068313          	addi	t1,a3,-32
     f68:	00d89533          	sll	a0,a7,a3
     f6c:	41f35313          	srai	t1,t1,0x1f
     f70:	0015ff13          	andi	t5,a1,1
     f74:	00657533          	and	a0,a0,t1
     f78:	01f81e93          	slli	t4,a6,0x1f
     f7c:	0015d313          	srli	t1,a1,0x1
     f80:	00168693          	addi	a3,a3,1
     f84:	000f0463          	beqz	t5,f8c <pooling+0x1f8>
     f88:	00a70733          	add	a4,a4,a0
     f8c:	006ee5b3          	or	a1,t4,t1
     f90:	40185813          	srai	a6,a6,0x1
     f94:	fdc698e3          	bne	a3,t3,f64 <pooling+0x1d0>
     f98:	01412583          	lw	a1,20(sp)
     f9c:	00100693          	li	a3,1
     fa0:	24d59663          	bne	a1,a3,11ec <pooling+0x458>
     fa4:	240d1463          	bnez	s10,11ec <pooling+0x458>
     fa8:	030ba683          	lw	a3,48(s7)
     fac:	16068e63          	beqz	a3,1128 <pooling+0x394>
     fb0:	033786b3          	mul	a3,a5,s3
     fb4:	00179593          	slli	a1,a5,0x1
     fb8:	00171713          	slli	a4,a4,0x1
     fbc:	40f007b3          	neg	a5,a5
     fc0:	00e12e23          	sw	a4,28(sp)
     fc4:	00b60733          	add	a4,a2,a1
     fc8:	00179793          	slli	a5,a5,0x1
     fcc:	00e12623          	sw	a4,12(sp)
     fd0:	02f12623          	sw	a5,44(sp)
     fd4:	02b12023          	sw	a1,32(sp)
     fd8:	00169713          	slli	a4,a3,0x1
     fdc:	00012c23          	sw	zero,24(sp)
     fe0:	04000793          	li	a5,64
     fe4:	00100393          	li	t2,1
     fe8:	02e12223          	sw	a4,36(sp)
     fec:	00c12c03          	lw	s8,12(sp)
     ff0:	00000c93          	li	s9,0
     ff4:	02c12703          	lw	a4,44(sp)
     ff8:	010c9e13          	slli	t3,s9,0x10
     ffc:	410e5e13          	srai	t3,t3,0x10
    1000:	018702b3          	add	t0,a4,s8
    1004:	00000413          	li	s0,0
    1008:	01041893          	slli	a7,s0,0x10
    100c:	4108d893          	srai	a7,a7,0x10
    1010:	00000f93          	li	t6,0
    1014:	ffff8937          	lui	s2,0xffff8
    1018:	00000613          	li	a2,0
    101c:	00200693          	li	a3,2
    1020:	00000593          	li	a1,0
    1024:	00000313          	li	t1,0
    1028:	00160613          	addi	a2,a2,1
    102c:	01f59813          	slli	a6,a1,0x1f
    1030:	fe060713          	addi	a4,a2,-32
    1034:	0016d693          	srli	a3,a3,0x1
    1038:	41f75513          	srai	a0,a4,0x1f
    103c:	00d866b3          	or	a3,a6,a3
    1040:	00ce1733          	sll	a4,t3,a2
    1044:	4015d593          	srai	a1,a1,0x1
    1048:	00a77733          	and	a4,a4,a0
    104c:	00b6e533          	or	a0,a3,a1
    1050:	00f60863          	beq	a2,a5,1060 <pooling+0x2cc>
    1054:	fc050ae3          	beqz	a0,1028 <pooling+0x294>
    1058:	00e30333          	add	t1,t1,a4
    105c:	fcdff06f          	j	1028 <pooling+0x294>
    1060:	006f8333          	add	t1,t6,t1
    1064:	01031e93          	slli	t4,t1,0x10
    1068:	00000f13          	li	t5,0
    106c:	410ede93          	srai	t4,t4,0x10
    1070:	00000613          	li	a2,0
    1074:	00200693          	li	a3,2
    1078:	00000593          	li	a1,0
    107c:	00000813          	li	a6,0
    1080:	00160613          	addi	a2,a2,1
    1084:	01f59513          	slli	a0,a1,0x1f
    1088:	fe060713          	addi	a4,a2,-32
    108c:	0016d693          	srli	a3,a3,0x1
    1090:	41f75a13          	srai	s4,a4,0x1f
    1094:	00d566b3          	or	a3,a0,a3
    1098:	00c89733          	sll	a4,a7,a2
    109c:	4015d593          	srai	a1,a1,0x1
    10a0:	01477733          	and	a4,a4,s4
    10a4:	00b6e533          	or	a0,a3,a1
    10a8:	00f60863          	beq	a2,a5,10b8 <pooling+0x324>
    10ac:	fc050ae3          	beqz	a0,1080 <pooling+0x2ec>
    10b0:	00e80833          	add	a6,a6,a4
    10b4:	fcdff06f          	j	1080 <pooling+0x2ec>
    10b8:	010f0833          	add	a6,t5,a6
    10bc:	00084863          	bltz	a6,10cc <pooling+0x338>
    10c0:	00987663          	bgeu	a6,s1,10cc <pooling+0x338>
    10c4:	00034463          	bltz	t1,10cc <pooling+0x338>
    10c8:	09636c63          	bltu	t1,s6,1160 <pooling+0x3cc>
    10cc:	107f1463          	bne	t5,t2,11d4 <pooling+0x440>
    10d0:	107f9663          	bne	t6,t2,11dc <pooling+0x448>
    10d4:	01229023          	sh	s2,0(t0)
    10d8:	00228293          	addi	t0,t0,2
    10dc:	00140413          	addi	s0,s0,1
    10e0:	f38294e3          	bne	t0,s8,1008 <pooling+0x274>
    10e4:	02012703          	lw	a4,32(sp)
    10e8:	001c8c93          	addi	s9,s9,1
    10ec:	00e28c33          	add	s8,t0,a4
    10f0:	f19992e3          	bne	s3,s9,ff4 <pooling+0x260>
    10f4:	01012603          	lw	a2,16(sp)
    10f8:	01c12583          	lw	a1,28(sp)
    10fc:	01812683          	lw	a3,24(sp)
    1100:	030ba703          	lw	a4,48(s7)
    1104:	00b60633          	add	a2,a2,a1
    1108:	00c12823          	sw	a2,16(sp)
    110c:	02412583          	lw	a1,36(sp)
    1110:	00c12603          	lw	a2,12(sp)
    1114:	00168693          	addi	a3,a3,1
    1118:	00d12c23          	sw	a3,24(sp)
    111c:	00b60633          	add	a2,a2,a1
    1120:	00c12623          	sw	a2,12(sp)
    1124:	ece6e4e3          	bltu	a3,a4,fec <pooling+0x258>
    1128:	05c12403          	lw	s0,92(sp)
    112c:	05812483          	lw	s1,88(sp)
    1130:	05412903          	lw	s2,84(sp)
    1134:	05012983          	lw	s3,80(sp)
    1138:	04c12a03          	lw	s4,76(sp)
    113c:	04812a83          	lw	s5,72(sp)
    1140:	04412b03          	lw	s6,68(sp)
    1144:	04012b83          	lw	s7,64(sp)
    1148:	03c12c03          	lw	s8,60(sp)
    114c:	03812c83          	lw	s9,56(sp)
    1150:	03412d03          	lw	s10,52(sp)
    1154:	03012d83          	lw	s11,48(sp)
    1158:	06010113          	addi	sp,sp,96
    115c:	00008067          	ret
    1160:	02812583          	lw	a1,40(sp)
    1164:	000d8613          	mv	a2,s11
    1168:	00000513          	li	a0,0
    116c:	00000693          	li	a3,0
    1170:	fe068713          	addi	a4,a3,-32
    1174:	00de9a33          	sll	s4,t4,a3
    1178:	41f75713          	srai	a4,a4,0x1f
    117c:	00167a93          	andi	s5,a2,1
    1180:	00ea7733          	and	a4,s4,a4
    1184:	00165613          	srli	a2,a2,0x1
    1188:	01f59a13          	slli	s4,a1,0x1f
    118c:	00168693          	addi	a3,a3,1
    1190:	000a8463          	beqz	s5,1198 <pooling+0x404>
    1194:	00e50533          	add	a0,a0,a4
    1198:	00ca6633          	or	a2,s4,a2
    119c:	4015d593          	srai	a1,a1,0x1
    11a0:	fcf698e3          	bne	a3,a5,1170 <pooling+0x3dc>
    11a4:	01412703          	lw	a4,20(sp)
    11a8:	02771e63          	bne	a4,t2,11e4 <pooling+0x450>
    11ac:	020d1c63          	bnez	s10,11e4 <pooling+0x450>
    11b0:	01012683          	lw	a3,16(sp)
    11b4:	00a80733          	add	a4,a6,a0
    11b8:	00171713          	slli	a4,a4,0x1
    11bc:	00e68733          	add	a4,a3,a4
    11c0:	00071703          	lh	a4,0(a4)
    11c4:	01275463          	bge	a4,s2,11cc <pooling+0x438>
    11c8:	00090713          	mv	a4,s2
    11cc:	00070913          	mv	s2,a4
    11d0:	f07f00e3          	beq	t5,t2,10d0 <pooling+0x33c>
    11d4:	00100f13          	li	t5,1
    11d8:	e99ff06f          	j	1070 <pooling+0x2dc>
    11dc:	00100f93          	li	t6,1
    11e0:	e39ff06f          	j	1018 <pooling+0x284>
    11e4:	40a00533          	neg	a0,a0
    11e8:	fc9ff06f          	j	11b0 <pooling+0x41c>
    11ec:	40e00733          	neg	a4,a4
    11f0:	db9ff06f          	j	fa8 <pooling+0x214>
    11f4:	fff00593          	li	a1,-1
    11f8:	00b12a23          	sw	a1,20(sp)
    11fc:	fff00d13          	li	s10,-1
    1200:	d31ff06f          	j	f30 <pooling+0x19c>
    1204:	00000793          	li	a5,0
    1208:	c05ff06f          	j	e0c <pooling+0x78>
    120c:	00000793          	li	a5,0
    1210:	c69ff06f          	j	e78 <pooling+0xe4>
    1214:	00100693          	li	a3,1
    1218:	00100793          	li	a5,1
    121c:	00000593          	li	a1,0
    1220:	cd06c4e3          	blt	a3,a6,ee8 <pooling+0x154>
    1224:	00100993          	li	s3,1
    1228:	00000693          	li	a3,0
    122c:	ccdff06f          	j	ef8 <pooling+0x164>

00001230 <comparing>:
    1230:	ff010113          	addi	sp,sp,-16
    1234:	00001837          	lui	a6,0x1
    1238:	000017b7          	lui	a5,0x1
    123c:	00112623          	sw	ra,12(sp)
    1240:	68080813          	addi	a6,a6,1664 # 1680 <_binary_data_result_bin_size>
    1244:	47c7a583          	lw	a1,1148(a5) # 147c <addr+0x8>
    1248:	05005463          	blez	a6,1290 <comparing+0x60>
    124c:	07000537          	lui	a0,0x7000
    1250:	0005c683          	lbu	a3,0(a1)
    1254:	00054703          	lbu	a4,0(a0) # 7000000 <_binary_data_result_bin_start>
    1258:	04e69a63          	bne	a3,a4,12ac <comparing+0x7c>
    125c:	00050513          	mv	a0,a0
    1260:	070007b7          	lui	a5,0x7000
    1264:	01050833          	add	a6,a0,a6
    1268:	00178793          	addi	a5,a5,1 # 7000001 <_binary_data_result_bin_start+0x1>
    126c:	40a58533          	sub	a0,a1,a0
    1270:	0140006f          	j	1284 <comparing+0x54>
    1274:	00178793          	addi	a5,a5,1
    1278:	0005c683          	lbu	a3,0(a1)
    127c:	fff7c703          	lbu	a4,-1(a5)
    1280:	02e69863          	bne	a3,a4,12b0 <comparing+0x80>
    1284:	00f505b3          	add	a1,a0,a5
    1288:	00078613          	mv	a2,a5
    128c:	ff0794e3          	bne	a5,a6,1274 <comparing+0x44>
    1290:	00001537          	lui	a0,0x1
    1294:	3ac50513          	addi	a0,a0,940 # 13ac <main+0xe0>
    1298:	9bcff0ef          	jal	ra,454 <printf>
    129c:	00c12083          	lw	ra,12(sp)
    12a0:	00000513          	li	a0,0
    12a4:	01010113          	addi	sp,sp,16
    12a8:	00008067          	ret
    12ac:	00050613          	mv	a2,a0
    12b0:	00001537          	lui	a0,0x1
    12b4:	37850513          	addi	a0,a0,888 # 1378 <main+0xac>
    12b8:	99cff0ef          	jal	ra,454 <printf>
    12bc:	00c12083          	lw	ra,12(sp)
    12c0:	00100513          	li	a0,1
    12c4:	01010113          	addi	sp,sp,16
    12c8:	00008067          	ret

Disassembly of section .text.startup:

000012cc <main>:
    12cc:	fd010113          	addi	sp,sp,-48
    12d0:	00c10513          	addi	a0,sp,12
    12d4:	02112623          	sw	ra,44(sp)
    12d8:	02812423          	sw	s0,40(sp)
    12dc:	a44ff0ef          	jal	ra,520 <bench_prepare>
    12e0:	00001537          	lui	a0,0x1
    12e4:	3b850513          	addi	a0,a0,952 # 13b8 <main+0xec>
    12e8:	96cff0ef          	jal	ra,454 <printf>
    12ec:	b98ff0ef          	jal	ra,684 <convolution>
    12f0:	00001537          	lui	a0,0x1
    12f4:	3d050513          	addi	a0,a0,976 # 13d0 <main+0x104>
    12f8:	95cff0ef          	jal	ra,454 <printf>
    12fc:	a99ff0ef          	jal	ra,d94 <pooling>
    1300:	00c10513          	addi	a0,sp,12
    1304:	a58ff0ef          	jal	ra,55c <bench_done>
    1308:	f29ff0ef          	jal	ra,1230 <comparing>
    130c:	00050413          	mv	s0,a0
    1310:	00001537          	lui	a0,0x1
    1314:	3e450513          	addi	a0,a0,996 # 13e4 <main+0x118>
    1318:	93cff0ef          	jal	ra,454 <printf>
    131c:	01012583          	lw	a1,16(sp)
    1320:	00001537          	lui	a0,0x1
    1324:	3f850513          	addi	a0,a0,1016 # 13f8 <main+0x12c>
    1328:	92cff0ef          	jal	ra,454 <printf>
    132c:	01412583          	lw	a1,20(sp)
    1330:	00001537          	lui	a0,0x1
    1334:	40450513          	addi	a0,a0,1028 # 1404 <main+0x138>
    1338:	91cff0ef          	jal	ra,454 <printf>
    133c:	01812583          	lw	a1,24(sp)
    1340:	00001537          	lui	a0,0x1
    1344:	41c50513          	addi	a0,a0,1052 # 141c <main+0x150>
    1348:	90cff0ef          	jal	ra,454 <printf>
    134c:	00041863          	bnez	s0,135c <main+0x90>
    1350:	000007b7          	lui	a5,0x0
    1354:	0007a623          	sw	zero,12(a5) # c <global_result>
    1358:	0000006f          	j	1358 <main+0x8c>
    135c:	00000513          	li	a0,0
    1360:	a64ff0ef          	jal	ra,5c4 <nemu_assert>
    1364:	02c12083          	lw	ra,44(sp)
    1368:	02812403          	lw	s0,40(sp)
    136c:	00000513          	li	a0,0
    1370:	03010113          	addi	sp,sp,48
    1374:	00008067          	ret

Disassembly of section .rodata.str1.4:

00001378 <.rodata.str1.4>:
    1378:	6146                	flw	ft2,80(sp)
    137a:	6c69                	lui	s8,0x1a
    137c:	6465                	lui	s0,0x19
    137e:	2021                	jal	1386 <main+0xba>
    1380:	7461                	lui	s0,0xffff8
    1382:	6120                	flw	fs0,64(a0)
    1384:	6464                	flw	fs1,76(s0)
    1386:	6572                	flw	fa0,28(sp)
    1388:	25207373          	csrrci	t1,0x252,0
    138c:	2078                	fld	fa4,192(s0)
    138e:	6e61                	lui	t3,0x18
    1390:	2064                	fld	fs1,192(s0)
    1392:	7825                	lui	a6,0xfffe9
    1394:	7720                	flw	fs0,104(a4)
    1396:	7469                	lui	s0,0xffffa
    1398:	2068                	fld	fa0,192(s0)
    139a:	6164                	flw	fs1,68(a0)
    139c:	6174                	flw	fa3,68(a0)
    139e:	2520                	fld	fs0,72(a0)
    13a0:	2078                	fld	fa4,192(s0)
    13a2:	6e61                	lui	t3,0x18
    13a4:	2064                	fld	fs1,192(s0)
    13a6:	7825                	lui	a6,0xfffe9
    13a8:	000a                	c.slli	zero,0x2
    13aa:	0000                	unimp
    13ac:	6150                	flw	fa2,4(a0)
    13ae:	64657373          	csrrci	t1,0x646,10
    13b2:	0a21                	addi	s4,s4,8
    13b4:	0000                	unimp
    13b6:	0000                	unimp
    13b8:	72617473          	csrrci	s0,0x726,2
    13bc:	6974                	flw	fa3,84(a0)
    13be:	676e                	flw	fa4,216(sp)
    13c0:	6320                	flw	fs0,64(a4)
    13c2:	6f766e6f          	jal	t3,682b8 <_binary_data_result_bin_size+0x66c38>
    13c6:	756c                	flw	fa1,108(a0)
    13c8:	6974                	flw	fa3,84(a0)
    13ca:	000a6e6f          	jal	t3,a73ca <_binary_data_result_bin_size+0xa5d4a>
    13ce:	0000                	unimp
    13d0:	72617473          	csrrci	s0,0x726,2
    13d4:	6974                	flw	fa3,84(a0)
    13d6:	676e                	flw	fa4,216(sp)
    13d8:	7020                	flw	fs0,96(s0)
    13da:	696c6f6f          	jal	t5,c7a70 <_binary_data_result_bin_size+0xc63f0>
    13de:	676e                	flw	fa4,216(sp)
    13e0:	000a                	c.slli	zero,0x2
    13e2:	0000                	unimp
    13e4:	6562                	flw	fa0,24(sp)
    13e6:	636e                	flw	ft6,216(sp)
    13e8:	6d68                	flw	fa0,92(a0)
    13ea:	7261                	lui	tp,0xffff8
    13ec:	6966206b          	0x6966206b
    13f0:	696e                	flw	fs2,216(sp)
    13f2:	64656873          	csrrsi	a6,0x646,10
    13f6:	000a                	c.slli	zero,0x2
    13f8:	6c637943          	0x6c637943
    13fc:	7365                	lui	t1,0xffff9
    13fe:	203a                	fld	ft0,392(sp)
    1400:	7525                	lui	a0,0xfffe9
    1402:	000a                	c.slli	zero,0x2
    1404:	654d                	lui	a0,0x13
    1406:	206d                	jal	14b0 <uart>
    1408:	6361                	lui	t1,0x18
    140a:	73736563          	bltu	t1,s7,1b34 <_binary_data_result_bin_size+0x4b4>
    140e:	6320                	flw	fs0,64(a4)
    1410:	6379                	lui	t1,0x1e
    1412:	656c                	flw	fa1,76(a0)
    1414:	25203a73          	csrrc	s4,0x252,zero
    1418:	0a75                	addi	s4,s4,29
    141a:	0000                	unimp
    141c:	6e49                	lui	t3,0x12
    141e:	75727473          	csrrci	s0,0x757,4
    1422:	6f697463          	bgeu	s2,s6,1b0a <_binary_data_result_bin_size+0x48a>
    1426:	206e                	fld	ft0,216(sp)
    1428:	6e756f63          	bltu	a0,t2,1b26 <_binary_data_result_bin_size+0x4a6>
    142c:	3a74                	fld	fa3,240(a2)
    142e:	2520                	fld	fs0,72(a0)
    1430:	0a75                	addi	s4,s4,29
	...

Disassembly of section .data:

00001434 <perf_cnt>:
    1434:	0000                	unimp
    1436:	6001                	0x6001
    1438:	0008                	0x8
    143a:	6001                	0x6001
    143c:	1000                	addi	s0,sp,32
    143e:	6001                	0x6001
    1440:	1008                	addi	a0,sp,32
    1442:	6001                	0x6001
    1444:	2000                	fld	fs0,0(s0)
    1446:	6001                	0x6001
    1448:	2008                	fld	fa0,0(s0)
    144a:	6001                	0x6001
    144c:	3000                	fld	fs0,32(s0)
    144e:	6001                	0x6001
    1450:	3008                	fld	fa0,32(s0)
    1452:	6001                	0x6001
    1454:	4000                	lw	s0,0(s0)
    1456:	6001                	0x6001
    1458:	4008                	lw	a0,0(s0)
    145a:	6001                	0x6001
    145c:	5000                	lw	s0,32(s0)
    145e:	6001                	0x6001
    1460:	5008                	lw	a0,32(s0)
    1462:	6001                	0x6001
    1464:	6000                	flw	fs0,0(s0)
    1466:	6001                	0x6001
    1468:	6008                	flw	fa0,0(s0)
    146a:	6001                	0x6001
    146c:	7000                	flw	fs0,32(s0)
    146e:	6001                	0x6001
    1470:	7008                	flw	fa0,32(s0)
    1472:	6001                	0x6001

00001474 <addr>:
    1474:	8f90                	0x8f90
    1476:	080d                	addi	a6,a6,3
    1478:	0000                	unimp
    147a:	0800                	addi	s0,sp,16
    147c:	9690                	0x9690
    147e:	080d                	addi	a6,a6,3

00001480 <rd_size>:
    1480:	0001                	nop
    1482:	0000                	unimp
    1484:	0001                	nop
    1486:	0000                	unimp
    1488:	001c                	0x1c
    148a:	0000                	unimp
    148c:	001c                	0x1c
	...

00001490 <weight_size>:
    1490:	0014                	0x14
    1492:	0000                	unimp
    1494:	0001                	nop
    1496:	0000                	unimp
    1498:	0005                	c.nop	1
    149a:	0000                	unimp
    149c:	0005                	c.nop	1
	...

000014a0 <wr_size>:
    14a0:	0001                	nop
    14a2:	0000                	unimp
    14a4:	0014                	0x14
    14a6:	0000                	unimp
    14a8:	000c                	0xc
    14aa:	0000                	unimp
    14ac:	000c                	0xc
	...

Disassembly of section .sdata:

000014b0 <uart>:
    14b0:	0000                	unimp
    14b2:	6000                	flw	fs0,0(s0)

Disassembly of section .bss:

000014b4 <outbuf>:
	...

000015b4 <conv_size>:
	...

Disassembly of section .input.result:

07000000 <_binary_data_result_bin_start>:
 7000000:	ff73ff73          	csrrci	t5,0xff7,7
 7000004:	ff73ff73          	csrrci	t5,0xff7,7
 7000008:	000c                	0xc
 700000a:	01a6                	slli	gp,gp,0x9
 700000c:	0128                	addi	a0,sp,136
 700000e:	ff9d                	bnez	a5,6ffff4c <_binary_data_result_bin_size+0x6ffe8cc>
 7000010:	ff73ff73          	csrrci	t5,0xff7,7
 7000014:	ff73ff73          	csrrci	t5,0xff7,7
 7000018:	ff73ff73          	csrrci	t5,0xff7,7
 700001c:	0128ff73          	csrrci	t5,0x12,17
 7000020:	04b9                	addi	s1,s1,14
 7000022:	05da                	slli	a1,a1,0x16
 7000024:	064d                	addi	a2,a2,19
 7000026:	ff73018b          	0xff73018b
 700002a:	ff73ff73          	csrrci	t5,0xff7,7
 700002e:	ff73ff73          	csrrci	t5,0xff7,7
 7000032:	ffb2ff73          	csrrci	t5,0xffb,5
 7000036:	042d0337          	lui	t1,0x42d0
 700003a:	0414                	addi	a3,sp,512
 700003c:	087e                	slli	a6,a6,0x1f
 700003e:	06fe                	slli	a3,a3,0x1f
 7000040:	ff7300b7          	lui	ra,0xff730
 7000044:	ff73ff73          	csrrci	t5,0xff7,7
 7000048:	ff73ff73          	csrrci	t5,0xff7,7
 700004c:	001e                	c.slli	zero,0x7
 700004e:	01fa                	slli	gp,gp,0x1e
 7000050:	03f6                	slli	t2,t2,0x1d
 7000052:	04670097          	auipc	ra,0x4670
 7000056:	065f 02ab ff73      	0xff7302ab065f
 700005c:	ff73ff73          	csrrci	t5,0xff7,7
 7000060:	ff73ff73          	csrrci	t5,0xff7,7
 7000064:	ffb4                	fsw	fa3,120(a5)
 7000066:	ffbe                	fsw	fa5,252(sp)
 7000068:	088d                	addi	a7,a7,3
 700006a:	0476                	slli	s0,s0,0x1d
 700006c:	04fa0183          	lb	gp,79(s4)
 7000070:	ff730297          	auipc	t0,0xff730
 7000074:	ff73ff73          	csrrci	t5,0xff7,7
 7000078:	ff73ff73          	csrrci	t5,0xff7,7
 700007c:	fce9ff73          	csrrci	t5,0xfce,19
 7000080:	0960                	addi	s0,sp,156
 7000082:	0956                	slli	s2,s2,0x15
 7000084:	02ea                	slli	t0,t0,0x1a
 7000086:	0344                	addi	s1,sp,388
 7000088:	ff73006f          	j	6f3107e <_binary_data_result_bin_size+0x6f2f9fe>
 700008c:	ff73ff73          	csrrci	t5,0xff7,7
 7000090:	ff73ff73          	csrrci	t5,0xff7,7
 7000094:	ff0bff73          	csrrci	t5,0xff0,23
 7000098:	07e10193          	addi	gp,sp,126
 700009c:	03d4052f          	0x3d4052f
 70000a0:	ff5f ff73 ff73      	0xff73ff73ff5f
 70000a6:	ff73ff73          	csrrci	t5,0xff7,7
 70000aa:	ff73ff73          	csrrci	t5,0xff7,7
 70000ae:	ff90                	fsw	fa2,56(a5)
 70000b0:	0088                	addi	a0,sp,64
 70000b2:	0459                	addi	s0,s0,22
 70000b4:	061c                	addi	a5,sp,768
 70000b6:	068d                	addi	a3,a3,3
 70000b8:	ff4e                	fsw	fs3,188(sp)
 70000ba:	ff73ff73          	csrrci	t5,0xff7,7
 70000be:	ff73ff73          	csrrci	t5,0xff7,7
 70000c2:	ff73ff73          	csrrci	t5,0xff7,7
 70000c6:	0273013b          	0x273013b
 70000ca:	010c                	addi	a1,sp,128
 70000cc:	043c                	addi	a5,sp,520
 70000ce:	0745                	addi	a4,a4,17
 70000d0:	ff70                	fsw	fa2,124(a4)
 70000d2:	ff73ff73          	csrrci	t5,0xff7,7
 70000d6:	ff73ff73          	csrrci	t5,0xff7,7
 70000da:	ff73ff73          	csrrci	t5,0xff7,7
 70000de:	020d                	addi	tp,tp,3
 70000e0:	038d                	addi	t2,t2,3
 70000e2:	081e                	slli	a6,a6,0x7
 70000e4:	022a                	slli	tp,tp,0xa
 70000e6:	049f ffc9 ff73      	0xff73ffc9049f
 70000ec:	ff73ff73          	csrrci	t5,0xff7,7
 70000f0:	ff73ff73          	csrrci	t5,0xff7,7
 70000f4:	0046ff73          	csrrci	t5,uie,13
 70000f8:	0419                	addi	s0,s0,6
 70000fa:	00030823          	sb	zero,16(t1) # 42d0010 <_binary_data_result_bin_size+0x42ce990>
 70000fe:	019d                	addi	gp,gp,7
 7000100:	ff74                	fsw	fa3,124(a4)
 7000102:	ff73ff73          	csrrci	t5,0xff7,7
 7000106:	ff73ff73          	csrrci	t5,0xff7,7
 700010a:	ff73ff73          	csrrci	t5,0xff7,7
 700010e:	fe90                	fsw	fa2,56(a3)
 7000110:	fec1fd87          	0xfec1fd87
 7000114:	ff97ff2f          	0xff97ff2f
 7000118:	ff73ff73          	csrrci	t5,0xff7,7
 700011c:	ff73ff73          	csrrci	t5,0xff7,7
 7000120:	ffe9                	bnez	a5,70000fa <_binary_data_result_bin_start+0xfa>
 7000122:	ffe9                	bnez	a5,70000fc <_binary_data_result_bin_start+0xfc>
 7000124:	ffe9                	bnez	a5,70000fe <_binary_data_result_bin_start+0xfe>
 7000126:	ffe9                	bnez	a5,7000100 <_binary_data_result_bin_start+0x100>
 7000128:	0016                	c.slli	zero,0x5
 700012a:	0035                	c.nop	13
 700012c:	0045                	c.nop	17
 700012e:	ffe9007b          	0xffe9007b
 7000132:	ffe9                	bnez	a5,700010c <_binary_data_result_bin_start+0x10c>
 7000134:	ffe9                	bnez	a5,700010e <_binary_data_result_bin_start+0x10e>
 7000136:	ffe9                	bnez	a5,7000110 <_binary_data_result_bin_start+0x110>
 7000138:	ffe9                	bnez	a5,7000112 <_binary_data_result_bin_start+0x112>
 700013a:	ffe9                	bnez	a5,7000114 <_binary_data_result_bin_start+0x114>
 700013c:	ffe9                	bnez	a5,7000116 <_binary_data_result_bin_start+0x116>
 700013e:	0076                	c.slli	zero,0x1d
 7000140:	0046                	c.slli	zero,0x11
 7000142:	fec3ffc3          	fmadd.q	ft11,ft7,fa2,ft11
 7000146:	0006                	c.slli	zero,0x1
 7000148:	003a                	c.slli	zero,0xe
 700014a:	ffe9                	bnez	a5,7000124 <_binary_data_result_bin_start+0x124>
 700014c:	ffe9                	bnez	a5,7000126 <_binary_data_result_bin_start+0x126>
 700014e:	ffe9                	bnez	a5,7000128 <_binary_data_result_bin_start+0x128>
 7000150:	ffe9                	bnez	a5,700012a <_binary_data_result_bin_start+0x12a>
 7000152:	ffe9                	bnez	a5,700012c <_binary_data_result_bin_start+0x12c>
 7000154:	ffff                	0xffff
 7000156:	006c                	addi	a1,sp,12
 7000158:	fda9                	bnez	a1,70000b2 <_binary_data_result_bin_start+0xb2>
 700015a:	fb9a                	fsw	ft6,244(sp)
 700015c:	f965                	bnez	a0,700014c <_binary_data_result_bin_start+0x14c>
 700015e:	fdf6                	fsw	ft9,248(sp)
 7000160:	001f fff4 ffe9      	0xffe9fff4001f
 7000166:	ffe9                	bnez	a5,7000140 <_binary_data_result_bin_start+0x140>
 7000168:	ffe9                	bnez	a5,7000142 <_binary_data_result_bin_start+0x142>
 700016a:	ffe9                	bnez	a5,7000144 <_binary_data_result_bin_start+0x144>
 700016c:	0029                	c.nop	10
 700016e:	ffda                	fsw	fs6,252(sp)
 7000170:	fbc9                	bnez	a5,7000102 <_binary_data_result_bin_start+0x102>
 7000172:	fe4a                	fsw	fs2,60(sp)
 7000174:	f966ff03          	0xf966ff03
 7000178:	ff30                	fsw	fa2,120(a4)
 700017a:	ffe9                	bnez	a5,7000154 <_binary_data_result_bin_start+0x154>
 700017c:	ffe9                	bnez	a5,7000156 <_binary_data_result_bin_start+0x156>
 700017e:	ffe9                	bnez	a5,7000158 <_binary_data_result_bin_start+0x158>
 7000180:	ffe9                	bnez	a5,700015a <_binary_data_result_bin_start+0x15a>
 7000182:	ffe9                	bnez	a5,700015c <_binary_data_result_bin_start+0x15c>
 7000184:	001a                	c.slli	zero,0x6
 7000186:	fb9d003f 0067fefa 	0x67fefafb9d003f
 700018e:	fceafbb7          	lui	s7,0xfceaf
 7000192:	ffe9                	bnez	a5,700016c <_binary_data_result_bin_start+0x16c>
 7000194:	ffe9                	bnez	a5,700016e <_binary_data_result_bin_start+0x16e>
 7000196:	ffe9                	bnez	a5,7000170 <_binary_data_result_bin_start+0x170>
 7000198:	ffe9                	bnez	a5,7000172 <_binary_data_result_bin_start+0x172>
 700019a:	ffe9                	bnez	a5,7000174 <_binary_data_result_bin_start+0x174>
 700019c:	0046                	c.slli	zero,0x11
 700019e:	00ba                	slli	ra,ra,0xe
 70001a0:	fd39                	bnez	a0,70000fe <_binary_data_result_bin_start+0xfe>
 70001a2:	fe0efbc3          	fmadd.q	fs7,ft9,ft0,ft11
 70001a6:	fc5d                	bnez	s0,7000164 <_binary_data_result_bin_start+0x164>
 70001a8:	ffe9fdf3          	csrrci	s11,0xffe,19
 70001ac:	ffe9                	bnez	a5,7000186 <_binary_data_result_bin_start+0x186>
 70001ae:	ffe9                	bnez	a5,7000188 <_binary_data_result_bin_start+0x188>
 70001b0:	ffe9                	bnez	a5,700018a <_binary_data_result_bin_start+0x18a>
 70001b2:	ffe9                	bnez	a5,700018c <_binary_data_result_bin_start+0x18c>
 70001b4:	0024                	addi	s1,sp,8
 70001b6:	010e                	slli	sp,sp,0x3
 70001b8:	0040                	addi	s0,sp,4
 70001ba:	fbd8                	fsw	fa4,52(a5)
 70001bc:	fcd8f967          	0xfcd8f967
 70001c0:	ffc0                	fsw	fs0,60(a5)
 70001c2:	ffe9                	bnez	a5,700019c <_binary_data_result_bin_start+0x19c>
 70001c4:	ffe9                	bnez	a5,700019e <_binary_data_result_bin_start+0x19e>
 70001c6:	ffe9                	bnez	a5,70001a0 <_binary_data_result_bin_start+0x1a0>
 70001c8:	ffe9                	bnez	a5,70001a2 <_binary_data_result_bin_start+0x1a2>
 70001ca:	ffe9                	bnez	a5,70001a4 <_binary_data_result_bin_start+0x1a4>
 70001cc:	ffe9                	bnez	a5,70001a6 <_binary_data_result_bin_start+0x1a6>
 70001ce:	017c00ab          	0x17c00ab
 70001d2:	fdec                	fsw	fa1,124(a1)
 70001d4:	f8d1                	bnez	s1,7000168 <_binary_data_result_bin_start+0x168>
 70001d6:	fc7d                	bnez	s0,70001d4 <_binary_data_result_bin_start+0x1d4>
 70001d8:	fff4                	fsw	fa3,124(a5)
 70001da:	ffe9                	bnez	a5,70001b4 <_binary_data_result_bin_start+0x1b4>
 70001dc:	ffe9                	bnez	a5,70001b6 <_binary_data_result_bin_start+0x1b6>
 70001de:	ffe9                	bnez	a5,70001b8 <_binary_data_result_bin_start+0x1b8>
 70001e0:	ffe9                	bnez	a5,70001ba <_binary_data_result_bin_start+0x1ba>
 70001e2:	ffe9                	bnez	a5,70001bc <_binary_data_result_bin_start+0x1bc>
 70001e4:	ffe9                	bnez	a5,70001be <_binary_data_result_bin_start+0x1be>
 70001e6:	0064                	addi	s1,sp,12
 70001e8:	fcd0ffe3          	bgeu	ra,a3,70001c6 <_binary_data_result_bin_start+0x1c6>
 70001ec:	fc9c                	fsw	fa5,56(s1)
 70001ee:	ffb7f9bf ffe9ffe9 	0xffe9ffe9ffb7f9bf
 70001f6:	ffe9                	bnez	a5,70001d0 <_binary_data_result_bin_start+0x1d0>
 70001f8:	ffe9                	bnez	a5,70001d2 <_binary_data_result_bin_start+0x1d2>
 70001fa:	ffe9                	bnez	a5,70001d4 <_binary_data_result_bin_start+0x1d4>
 70001fc:	ffe9                	bnez	a5,70001d6 <_binary_data_result_bin_start+0x1d6>
 70001fe:	0041                	c.nop	16
 7000200:	fee5                	bnez	a3,70001f8 <_binary_data_result_bin_start+0x1f8>
 7000202:	fd82                	fsw	ft0,248(sp)
 7000204:	fc19fc97          	auipc	s9,0xfc19f
 7000208:	fe96                	fsw	ft5,124(sp)
 700020a:	ffe9                	bnez	a5,70001e4 <_binary_data_result_bin_start+0x1e4>
 700020c:	ffe9                	bnez	a5,70001e6 <_binary_data_result_bin_start+0x1e6>
 700020e:	ffe9                	bnez	a5,70001e8 <_binary_data_result_bin_start+0x1e8>
 7000210:	ffe9                	bnez	a5,70001ea <_binary_data_result_bin_start+0x1ea>
 7000212:	ffe9                	bnez	a5,70001ec <_binary_data_result_bin_start+0x1ec>
 7000214:	ffe9                	bnez	a5,70001ee <_binary_data_result_bin_start+0x1ee>
 7000216:	ffe9                	bnez	a5,70001f0 <_binary_data_result_bin_start+0x1f0>
 7000218:	fda0                	fsw	fs0,120(a1)
 700021a:	f8d8                	fsw	fa4,52(s1)
 700021c:	fac2                	fsw	fa6,116(sp)
 700021e:	ff48fdab          	0xff48fdab
 7000222:	ffe9                	bnez	a5,70001fc <_binary_data_result_bin_start+0x1fc>
 7000224:	ffe9                	bnez	a5,70001fe <_binary_data_result_bin_start+0x1fe>
 7000226:	ffe9                	bnez	a5,7000200 <_binary_data_result_bin_start+0x200>
 7000228:	ffe9                	bnez	a5,7000202 <_binary_data_result_bin_start+0x202>
 700022a:	ffe9                	bnez	a5,7000204 <_binary_data_result_bin_start+0x204>
 700022c:	ffe9                	bnez	a5,7000206 <_binary_data_result_bin_start+0x206>
 700022e:	00c100fb          	0xc100fb
 7000232:	ff25                	bnez	a4,70001aa <_binary_data_result_bin_start+0x1aa>
 7000234:	feda                	fsw	fs6,124(sp)
 7000236:	ffe9ff2b          	0xffe9ff2b
 700023a:	ffe9                	bnez	a5,7000214 <_binary_data_result_bin_start+0x214>
 700023c:	ffe9                	bnez	a5,7000216 <_binary_data_result_bin_start+0x216>
 700023e:	ffe9                	bnez	a5,7000218 <_binary_data_result_bin_start+0x218>
 7000240:	ffad                	bnez	a5,70001ba <_binary_data_result_bin_start+0x1ba>
 7000242:	ffad                	bnez	a5,70001bc <_binary_data_result_bin_start+0x1bc>
 7000244:	ffad                	bnez	a5,70001be <_binary_data_result_bin_start+0x1be>
 7000246:	ffad                	bnez	a5,70001c0 <_binary_data_result_bin_start+0x1c0>
 7000248:	ffad                	bnez	a5,70001c2 <_binary_data_result_bin_start+0x1c2>
 700024a:	0085                	addi	ra,ra,1
 700024c:	ffad0057          	0xffad0057
 7000250:	ffad                	bnez	a5,70001ca <_binary_data_result_bin_start+0x1ca>
 7000252:	ffad                	bnez	a5,70001cc <_binary_data_result_bin_start+0x1cc>
 7000254:	ffad                	bnez	a5,70001ce <_binary_data_result_bin_start+0x1ce>
 7000256:	ffad                	bnez	a5,70001d0 <_binary_data_result_bin_start+0x1d0>
 7000258:	ffad                	bnez	a5,70001d2 <_binary_data_result_bin_start+0x1d2>
 700025a:	ffad                	bnez	a5,70001d4 <_binary_data_result_bin_start+0x1d4>
 700025c:	ffad                	bnez	a5,70001d6 <_binary_data_result_bin_start+0x1d6>
 700025e:	ffad                	bnez	a5,70001d8 <_binary_data_result_bin_start+0x1d8>
 7000260:	fff5                	bnez	a5,700025c <_binary_data_result_bin_start+0x25c>
 7000262:	00b9                	addi	ra,ra,14
 7000264:	03f4                	addi	a3,sp,460
 7000266:	027a                	slli	tp,tp,0x1e
 7000268:	ffad                	bnez	a5,70001e2 <_binary_data_result_bin_start+0x1e2>
 700026a:	ffad                	bnez	a5,70001e4 <_binary_data_result_bin_start+0x1e4>
 700026c:	ffad                	bnez	a5,70001e6 <_binary_data_result_bin_start+0x1e6>
 700026e:	ffad                	bnez	a5,70001e8 <_binary_data_result_bin_start+0x1e8>
 7000270:	ffad                	bnez	a5,70001ea <_binary_data_result_bin_start+0x1ea>
 7000272:	ffad                	bnez	a5,70001ec <_binary_data_result_bin_start+0x1ec>
 7000274:	ffad                	bnez	a5,70001ee <_binary_data_result_bin_start+0x1ee>
 7000276:	ff0a                	fsw	ft2,188(sp)
 7000278:	0158                	addi	a4,sp,132
 700027a:	00e2                	slli	ra,ra,0x18
 700027c:	079c0687          	0x79c0687
 7000280:	ffad01e7          	jalr	gp,-6(s10)
 7000284:	ffad                	bnez	a5,70001fe <_binary_data_result_bin_start+0x1fe>
 7000286:	ffad                	bnez	a5,7000200 <_binary_data_result_bin_start+0x200>
 7000288:	ffad                	bnez	a5,7000202 <_binary_data_result_bin_start+0x202>
 700028a:	ffad                	bnez	a5,7000204 <_binary_data_result_bin_start+0x204>
 700028c:	ffad                	bnez	a5,7000206 <_binary_data_result_bin_start+0x206>
 700028e:	fe89                	bnez	a3,70001a8 <_binary_data_result_bin_start+0x1a8>
 7000290:	0551                	addi	a0,a0,20
 7000292:	0266054b          	fnmsub.d	fa0,fa2,ft6,ft0,rne
 7000296:	043a06cb          	0x43a06cb
 700029a:	fff8                	fsw	fa4,124(a5)
 700029c:	ffad                	bnez	a5,7000216 <_binary_data_result_bin_start+0x216>
 700029e:	ffad                	bnez	a5,7000218 <_binary_data_result_bin_start+0x218>
 70002a0:	ffad                	bnez	a5,700021a <_binary_data_result_bin_start+0x21a>
 70002a2:	ffad                	bnez	a5,700021c <_binary_data_result_bin_start+0x21c>
 70002a4:	ffad                	bnez	a5,700021e <_binary_data_result_bin_start+0x21e>
 70002a6:	fe29                	bnez	a2,7000200 <_binary_data_result_bin_start+0x200>
 70002a8:	0804                	addi	s1,sp,16
 70002aa:	0729                	addi	a4,a4,10
 70002ac:	feed                	bnez	a3,70002a6 <_binary_data_result_bin_start+0x2a6>
 70002ae:	04e2                	slli	s1,s1,0x18
 70002b0:	052c                	addi	a1,sp,648
 70002b2:	0028                	addi	a0,sp,8
 70002b4:	ffad                	bnez	a5,700022e <_binary_data_result_bin_start+0x22e>
 70002b6:	ffad                	bnez	a5,7000230 <_binary_data_result_bin_start+0x230>
 70002b8:	ffad                	bnez	a5,7000232 <_binary_data_result_bin_start+0x232>
 70002ba:	ffad                	bnez	a5,7000234 <_binary_data_result_bin_start+0x234>
 70002bc:	ffad                	bnez	a5,7000236 <_binary_data_result_bin_start+0x236>
 70002be:	fdd6                	fsw	fs5,248(sp)
 70002c0:	0700                	addi	s0,sp,896
 70002c2:	02750827          	0x2750827
 70002c6:	0540                	addi	s0,sp,644
 70002c8:	048c                	addi	a1,sp,576
 70002ca:	ffb6                	fsw	fa3,252(sp)
 70002cc:	ffad                	bnez	a5,7000246 <_binary_data_result_bin_start+0x246>
 70002ce:	ffad                	bnez	a5,7000248 <_binary_data_result_bin_start+0x248>
 70002d0:	ffad                	bnez	a5,700024a <_binary_data_result_bin_start+0x24a>
 70002d2:	ffad                	bnez	a5,700024c <_binary_data_result_bin_start+0x24c>
 70002d4:	ffad                	bnez	a5,700024e <_binary_data_result_bin_start+0x24e>
 70002d6:	ffa0                	fsw	fs0,120(a5)
 70002d8:	ffd1                	bnez	a5,7000274 <_binary_data_result_bin_start+0x274>
 70002da:	074f05eb          	0x74f05eb
 70002de:	06e6                	slli	a3,a3,0x19
 70002e0:	ffad01cf          	fnmadd.q	ft3,fs10,fs10,ft11,rne
 70002e4:	ffad                	bnez	a5,700025e <_binary_data_result_bin_start+0x25e>
 70002e6:	ffad                	bnez	a5,7000260 <_binary_data_result_bin_start+0x260>
 70002e8:	ffad                	bnez	a5,7000262 <_binary_data_result_bin_start+0x262>
 70002ea:	ffad                	bnez	a5,7000264 <_binary_data_result_bin_start+0x264>
 70002ec:	ffad                	bnez	a5,7000266 <_binary_data_result_bin_start+0x266>
 70002ee:	ffad                	bnez	a5,7000268 <_binary_data_result_bin_start+0x268>
 70002f0:	fe98                	fsw	fa4,56(a3)
 70002f2:	0212                	slli	tp,tp,0x4
 70002f4:	0838                	addi	a4,sp,24
 70002f6:	090a                	slli	s2,s2,0x2
 70002f8:	0011                	c.nop	4
 70002fa:	ffad                	bnez	a5,7000274 <_binary_data_result_bin_start+0x274>
 70002fc:	ffad                	bnez	a5,7000276 <_binary_data_result_bin_start+0x276>
 70002fe:	ffad                	bnez	a5,7000278 <_binary_data_result_bin_start+0x278>
 7000300:	ffad                	bnez	a5,700027a <_binary_data_result_bin_start+0x27a>
 7000302:	ffad                	bnez	a5,700027c <_binary_data_result_bin_start+0x27c>
 7000304:	ffad                	bnez	a5,700027e <_binary_data_result_bin_start+0x27e>
 7000306:	ffd6ffa7          	0xffd6ffa7
 700030a:	0185                	addi	gp,gp,1
 700030c:	0635                	addi	a2,a2,13
 700030e:	0844                	addi	s1,sp,20
 7000310:	0269                	addi	tp,tp,26
 7000312:	ffad                	bnez	a5,700028c <_binary_data_result_bin_start+0x28c>
 7000314:	ffad                	bnez	a5,700028e <_binary_data_result_bin_start+0x28e>
 7000316:	ffad                	bnez	a5,7000290 <_binary_data_result_bin_start+0x290>
 7000318:	ffad                	bnez	a5,7000292 <_binary_data_result_bin_start+0x292>
 700031a:	ffad                	bnez	a5,7000294 <_binary_data_result_bin_start+0x294>
 700031c:	ffad                	bnez	a5,7000296 <_binary_data_result_bin_start+0x296>
 700031e:	ff5a                	fsw	fs6,188(sp)
 7000320:	015e                	slli	sp,sp,0x17
 7000322:	05ff                	0x5ff
 7000324:	027a                	slli	tp,tp,0x1e
 7000326:	03d9051b          	0x3d9051b
 700032a:	ffad                	bnez	a5,70002a4 <_binary_data_result_bin_start+0x2a4>
 700032c:	ffad                	bnez	a5,70002a6 <_binary_data_result_bin_start+0x2a6>
 700032e:	ffad                	bnez	a5,70002a8 <_binary_data_result_bin_start+0x2a8>
 7000330:	ffad                	bnez	a5,70002aa <_binary_data_result_bin_start+0x2aa>
 7000332:	ffad                	bnez	a5,70002ac <_binary_data_result_bin_start+0x2ac>
 7000334:	ffad                	bnez	a5,70002ae <_binary_data_result_bin_start+0x2ae>
 7000336:	01b9fecf          	fnmadd.s	ft9,fs3,fs11,ft0
 700033a:	0645                	addi	a2,a2,17
 700033c:	05840433          	0x5840433
 7000340:	02f4                	addi	a3,sp,332
 7000342:	ffad                	bnez	a5,70002bc <_binary_data_result_bin_start+0x2bc>
 7000344:	ffad                	bnez	a5,70002be <_binary_data_result_bin_start+0x2be>
 7000346:	ffad                	bnez	a5,70002c0 <_binary_data_result_bin_start+0x2c0>
 7000348:	ffad                	bnez	a5,70002c2 <_binary_data_result_bin_start+0x2c2>
 700034a:	ffad                	bnez	a5,70002c4 <_binary_data_result_bin_start+0x2c4>
 700034c:	ffad                	bnez	a5,70002c6 <_binary_data_result_bin_start+0x2c6>
 700034e:	004aff3b          	0x4aff3b
 7000352:	0412                	slli	s0,s0,0x4
 7000354:	03fe                	slli	t2,t2,0x1f
 7000356:	034d                	addi	t1,t1,19
 7000358:	ffad                	bnez	a5,70002d2 <_binary_data_result_bin_start+0x2d2>
 700035a:	ffad                	bnez	a5,70002d4 <_binary_data_result_bin_start+0x2d4>
 700035c:	ffad                	bnez	a5,70002d6 <_binary_data_result_bin_start+0x2d6>
 700035e:	ffad                	bnez	a5,70002d8 <_binary_data_result_bin_start+0x2d8>
 7000360:	fee0                	fsw	fs0,124(a3)
 7000362:	fee0                	fsw	fs0,124(a3)
 7000364:	fee0                	fsw	fs0,124(a3)
 7000366:	fee0                	fsw	fs0,124(a3)
 7000368:	fee0                	fsw	fs0,124(a3)
 700036a:	fee0                	fsw	fs0,124(a3)
 700036c:	fee0                	fsw	fs0,124(a3)
 700036e:	fefd                	bnez	a3,700036c <_binary_data_result_bin_start+0x36c>
 7000370:	fee0                	fsw	fs0,124(a3)
 7000372:	fee0                	fsw	fs0,124(a3)
 7000374:	fee0                	fsw	fs0,124(a3)
 7000376:	fee0                	fsw	fs0,124(a3)
 7000378:	fee0                	fsw	fs0,124(a3)
 700037a:	fee0                	fsw	fs0,124(a3)
 700037c:	fee0                	fsw	fs0,124(a3)
 700037e:	fee0                	fsw	fs0,124(a3)
 7000380:	fe4c                	fsw	fa1,60(a2)
 7000382:	fc47f8e3          	bgeu	a5,tp,7000352 <_binary_data_result_bin_start+0x352>
 7000386:	feea                	fsw	fs10,124(sp)
 7000388:	fef2                	fsw	ft8,124(sp)
 700038a:	fee0                	fsw	fs0,124(a3)
 700038c:	fee0                	fsw	fs0,124(a3)
 700038e:	fee0                	fsw	fs0,124(a3)
 7000390:	fee0                	fsw	fs0,124(a3)
 7000392:	fee0                	fsw	fs0,124(a3)
 7000394:	fee0                	fsw	fs0,124(a3)
 7000396:	fe05                	bnez	a2,70002ce <_binary_data_result_bin_start+0x2ce>
 7000398:	fbe5                	bnez	a5,7000388 <_binary_data_result_bin_start+0x388>
 700039a:	0949                	addi	s2,s2,18
 700039c:	05c9                	addi	a1,a1,18
 700039e:	fe86                	fsw	ft1,124(sp)
 70003a0:	ff01ff37          	lui	t5,0xff01f
 70003a4:	fee0                	fsw	fs0,124(a3)
 70003a6:	fee0                	fsw	fs0,124(a3)
 70003a8:	fee0                	fsw	fs0,124(a3)
 70003aa:	fee0                	fsw	fs0,124(a3)
 70003ac:	fee0                	fsw	fs0,124(a3)
 70003ae:	057afc5b          	0x57afc5b
 70003b2:	064f0bd7          	0x64f0bd7
 70003b6:	0131                	addi	sp,sp,12
 70003b8:	0221                	addi	tp,tp,8
 70003ba:	ff9e                	fsw	ft7,252(sp)
 70003bc:	fee0                	fsw	fs0,124(a3)
 70003be:	fee0                	fsw	fs0,124(a3)
 70003c0:	fee0                	fsw	fs0,124(a3)
 70003c2:	fee0                	fsw	fs0,124(a3)
 70003c4:	fef5                	bnez	a3,70003c0 <_binary_data_result_bin_start+0x3c0>
 70003c6:	fff9                	bnez	a5,70003a4 <_binary_data_result_bin_start+0x3a4>
 70003c8:	0414                	addi	a3,sp,512
 70003ca:	0464                	addi	s1,sp,524
 70003cc:	0058                	addi	a4,sp,4
 70003ce:	068203bf fee0ff69 	0xfee0ff69068203bf
 70003d6:	fee0                	fsw	fs0,124(a3)
 70003d8:	fee0                	fsw	fs0,124(a3)
 70003da:	fee0                	fsw	fs0,124(a3)
 70003dc:	ffaa                	fsw	fa0,252(sp)
 70003de:	0348                	addi	a0,sp,388
 70003e0:	01ee                	slli	gp,gp,0x1b
 70003e2:	fd9c                	fsw	fa5,56(a1)
 70003e4:	0014                	0x14
 70003e6:	088a                	slli	a7,a7,0x2
 70003e8:	064e                	slli	a2,a2,0x13
 70003ea:	fee0                	fsw	fs0,124(a3)
 70003ec:	fee0                	fsw	fs0,124(a3)
 70003ee:	fee0                	fsw	fs0,124(a3)
 70003f0:	fee0                	fsw	fs0,124(a3)
 70003f2:	fee0                	fsw	fs0,124(a3)
 70003f4:	03c8ff47          	fmsub.d	ft10,fa7,ft8,ft0
 70003f8:	045c                	addi	a5,sp,516
 70003fa:	02ff                	0x2ff
 70003fc:	078b05d3          	fadd.q	fa1,fs6,fs8,rne
 7000400:	014c                	addi	a1,sp,132
 7000402:	fee0                	fsw	fs0,124(a3)
 7000404:	fee0                	fsw	fs0,124(a3)
 7000406:	fee0                	fsw	fs0,124(a3)
 7000408:	fee0                	fsw	fs0,124(a3)
 700040a:	fee0                	fsw	fs0,124(a3)
 700040c:	fee0                	fsw	fs0,124(a3)
 700040e:	02a0004b          	fnmsub.d	ft0,ft0,fa0,ft0,rne
 7000412:	017a                	slli	sp,sp,0x1e
 7000414:	04e5                	addi	s1,s1,25
 7000416:	022e                	slli	tp,tp,0xb
 7000418:	ff71                	bnez	a4,70003f4 <_binary_data_result_bin_start+0x3f4>
 700041a:	fee0                	fsw	fs0,124(a3)
 700041c:	fee0                	fsw	fs0,124(a3)
 700041e:	fee0                	fsw	fs0,124(a3)
 7000420:	fee0                	fsw	fs0,124(a3)
 7000422:	fee0                	fsw	fs0,124(a3)
 7000424:	fee0                	fsw	fs0,124(a3)
 7000426:	fedc                	fsw	fa5,60(a3)
 7000428:	fb66                	fsw	fs9,180(sp)
 700042a:	0a9708e7          	jalr	a7,169(a4)
 700042e:	01d60217          	auipc	tp,0x1d60
 7000432:	fee0                	fsw	fs0,124(a3)
 7000434:	fee0                	fsw	fs0,124(a3)
 7000436:	fee0                	fsw	fs0,124(a3)
 7000438:	fee0                	fsw	fs0,124(a3)
 700043a:	fee0                	fsw	fs0,124(a3)
 700043c:	fee0                	fsw	fs0,124(a3)
 700043e:	fe8a                	fsw	ft2,124(sp)
 7000440:	fd09                	bnez	a0,700035a <_binary_data_result_bin_start+0x35a>
 7000442:	067c                	addi	a5,sp,780
 7000444:	07280343          	fmadd.q	ft6,fa6,fs2,ft0,rne
 7000448:	03a9                	addi	t2,t2,10
 700044a:	fee0                	fsw	fs0,124(a3)
 700044c:	fee0                	fsw	fs0,124(a3)
 700044e:	fee0                	fsw	fs0,124(a3)
 7000450:	fee0                	fsw	fs0,124(a3)
 7000452:	fee0                	fsw	fs0,124(a3)
 7000454:	fee0                	fsw	fs0,124(a3)
 7000456:	03defeeb          	0x3defeeb
 700045a:	0879                	addi	a6,a6,30
 700045c:	0c09                	addi	s8,s8,2
 700045e:	09be                	slli	s3,s3,0xf
 7000460:	01ff                	0x1ff
 7000462:	fee0                	fsw	fs0,124(a3)
 7000464:	fee0                	fsw	fs0,124(a3)
 7000466:	fee0                	fsw	fs0,124(a3)
 7000468:	fee0                	fsw	fs0,124(a3)
 700046a:	fee0                	fsw	fs0,124(a3)
 700046c:	fee0                	fsw	fs0,124(a3)
 700046e:	0324                	addi	s1,sp,392
 7000470:	0dc009c3          	0xdc009c3
 7000474:	0c1a                	slli	s8,s8,0x6
 7000476:	0380                	addi	s0,sp,448
 7000478:	fee0                	fsw	fs0,124(a3)
 700047a:	fee0                	fsw	fs0,124(a3)
 700047c:	fee0                	fsw	fs0,124(a3)
 700047e:	fee0                	fsw	fs0,124(a3)
 7000480:	ff60                	fsw	fs0,124(a4)
 7000482:	ff60                	fsw	fs0,124(a4)
 7000484:	ff60                	fsw	fs0,124(a4)
 7000486:	ff60                	fsw	fs0,124(a4)
 7000488:	00caffd3          	fadd.s	ft11,fs5,fa2
 700048c:	0066                	c.slli	zero,0x19
 700048e:	ff60                	fsw	fs0,124(a4)
 7000490:	ff60                	fsw	fs0,124(a4)
 7000492:	ff60                	fsw	fs0,124(a4)
 7000494:	ff60                	fsw	fs0,124(a4)
 7000496:	ff60                	fsw	fs0,124(a4)
 7000498:	ff60                	fsw	fs0,124(a4)
 700049a:	ff60                	fsw	fs0,124(a4)
 700049c:	ff60                	fsw	fs0,124(a4)
 700049e:	00c4                	addi	s1,sp,68
 70004a0:	05690437          	lui	s0,0x5690
 70004a4:	ff4f03c7          	fmsub.q	ft7,ft10,fs4,ft11,rne
 70004a8:	ff60                	fsw	fs0,124(a4)
 70004aa:	ff60                	fsw	fs0,124(a4)
 70004ac:	ff60                	fsw	fs0,124(a4)
 70004ae:	ff60                	fsw	fs0,124(a4)
 70004b0:	ff60                	fsw	fs0,124(a4)
 70004b2:	ff60                	fsw	fs0,124(a4)
 70004b4:	ff96                	fsw	ft5,252(sp)
 70004b6:	0476                	slli	s0,s0,0x1d
 70004b8:	063b062b          	0x63b062b
 70004bc:	0512                	slli	a0,a0,0x4
 70004be:	013c                	addi	a5,sp,136
 70004c0:	ff0e                	fsw	ft3,188(sp)
 70004c2:	ff60                	fsw	fs0,124(a4)
 70004c4:	ff60                	fsw	fs0,124(a4)
 70004c6:	ff60                	fsw	fs0,124(a4)
 70004c8:	ff60                	fsw	fs0,124(a4)
 70004ca:	ff60                	fsw	fs0,124(a4)
 70004cc:	004e                	c.slli	zero,0x13
 70004ce:	072d                	addi	a4,a4,11
 70004d0:	0704                	addi	s1,sp,896
 70004d2:	01c8                	addi	a0,sp,196
 70004d4:	074d                	addi	a4,a4,19
 70004d6:	05a4                	addi	s1,sp,712
 70004d8:	fe05                	bnez	a2,7000410 <_binary_data_result_bin_start+0x410>
 70004da:	ff60                	fsw	fs0,124(a4)
 70004dc:	ff60                	fsw	fs0,124(a4)
 70004de:	ff60                	fsw	fs0,124(a4)
 70004e0:	ff60                	fsw	fs0,124(a4)
 70004e2:	ff60                	fsw	fs0,124(a4)
 70004e4:	0066                	c.slli	zero,0x19
 70004e6:	076a                	slli	a4,a4,0x1a
 70004e8:	075d                	addi	a4,a4,23
 70004ea:	07a3000b          	0x7a3000b
 70004ee:	0600                	addi	s0,sp,768
 70004f0:	fe2c                	fsw	fa1,120(a2)
 70004f2:	ff60                	fsw	fs0,124(a4)
 70004f4:	ff60                	fsw	fs0,124(a4)
 70004f6:	ff60                	fsw	fs0,124(a4)
 70004f8:	ff60                	fsw	fs0,124(a4)
 70004fa:	ff60                	fsw	fs0,124(a4)
 70004fc:	062dfff7          	0x62dfff7
 7000500:	0778                	addi	a4,sp,908
 7000502:	05ed053b          	0x5ed053b
 7000506:	044c                	addi	a1,sp,516
 7000508:	fed4                	fsw	fa3,60(a3)
 700050a:	ff61                	bnez	a4,70004e2 <_binary_data_result_bin_start+0x4e2>
 700050c:	ff60                	fsw	fs0,124(a4)
 700050e:	ff60                	fsw	fs0,124(a4)
 7000510:	ff60                	fsw	fs0,124(a4)
 7000512:	ff60                	fsw	fs0,124(a4)
 7000514:	ff88                	fsw	fa0,56(a5)
 7000516:	07ad01d3          	fadd.q	ft3,fs10,fs10,rne
 700051a:	06040987          	0x6040987
 700051e:	0015                	c.nop	5
 7000520:	ff5a                	fsw	fs6,188(sp)
 7000522:	ff60                	fsw	fs0,124(a4)
 7000524:	ff60                	fsw	fs0,124(a4)
 7000526:	ff60                	fsw	fs0,124(a4)
 7000528:	ff60                	fsw	fs0,124(a4)
 700052a:	ff60                	fsw	fs0,124(a4)
 700052c:	ff60                	fsw	fs0,124(a4)
 700052e:	0592ffe7          	0x592ffe7
 7000532:	09d9                	addi	s3,s3,22
 7000534:	07c9                	addi	a5,a5,18
 7000536:	0118                	addi	a4,sp,128
 7000538:	ff50                	fsw	fa2,60(a4)
 700053a:	ff60                	fsw	fs0,124(a4)
 700053c:	ff60                	fsw	fs0,124(a4)
 700053e:	ff60                	fsw	fs0,124(a4)
 7000540:	ff60                	fsw	fs0,124(a4)
 7000542:	ff60                	fsw	fs0,124(a4)
 7000544:	ff60                	fsw	fs0,124(a4)
 7000546:	0145                	addi	sp,sp,17
 7000548:	06fd                	addi	a3,a3,31
 700054a:	069f 05f3 03ea      	0x3ea05f3069f
 7000550:	ff60ff17          	auipc	t5,0xff60f
 7000554:	ff60                	fsw	fs0,124(a4)
 7000556:	ff60                	fsw	fs0,124(a4)
 7000558:	ff60                	fsw	fs0,124(a4)
 700055a:	ff60                	fsw	fs0,124(a4)
 700055c:	ff60                	fsw	fs0,124(a4)
 700055e:	03b1                	addi	t2,t2,12
 7000560:	083a                	slli	a6,a6,0xe
 7000562:	065d                	addi	a2,a2,23
 7000564:	04730593          	addi	a1,t1,71
 7000568:	ff60fe7b          	0xff60fe7b
 700056c:	ff60                	fsw	fs0,124(a4)
 700056e:	ff60                	fsw	fs0,124(a4)
 7000570:	ff60                	fsw	fs0,124(a4)
 7000572:	ff60                	fsw	fs0,124(a4)
 7000574:	ff60                	fsw	fs0,124(a4)
 7000576:	0476                	slli	s0,s0,0x1d
 7000578:	062908e7          	jalr	a7,98(s2) # ffff8062 <_binary_riscv32_obj_data_sw_conv_data_bin_end+0xf7f1eab2>
 700057c:	0349                	addi	t1,t1,18
 700057e:	00fe                	slli	ra,ra,0x1f
 7000580:	ff55                	bnez	a4,700053c <_binary_data_result_bin_start+0x53c>
 7000582:	ff60                	fsw	fs0,124(a4)
 7000584:	ff60                	fsw	fs0,124(a4)
 7000586:	ff60                	fsw	fs0,124(a4)
 7000588:	ff60                	fsw	fs0,124(a4)
 700058a:	ff60                	fsw	fs0,124(a4)
 700058c:	ff60                	fsw	fs0,124(a4)
 700058e:	043f0227          	0x43f0227
 7000592:	fffc02cb          	fnmsub.q	ft5,fs8,ft11,ft11,rne
 7000596:	ff60ff8f          	0xff60ff8f
 700059a:	ff60                	fsw	fs0,124(a4)
 700059c:	ff60                	fsw	fs0,124(a4)
 700059e:	ff60                	fsw	fs0,124(a4)
 70005a0:	0035                	c.nop	13
 70005a2:	0035                	c.nop	13
 70005a4:	0035                	c.nop	13
 70005a6:	0035                	c.nop	13
 70005a8:	00ed                	addi	ra,ra,27
 70005aa:	01d6                	slli	gp,gp,0x15
 70005ac:	018b0187          	0x18b0187
 70005b0:	0035                	c.nop	13
 70005b2:	0035                	c.nop	13
 70005b4:	0035                	c.nop	13
 70005b6:	0035                	c.nop	13
 70005b8:	0035                	c.nop	13
 70005ba:	0035                	c.nop	13
 70005bc:	0035                	c.nop	13
 70005be:	01c9                	addi	gp,gp,18
 70005c0:	0228                	addi	a0,sp,264
 70005c2:	0236                	slli	tp,tp,0xd
 70005c4:	008c                	addi	a1,sp,64
 70005c6:	00ba                	slli	ra,ra,0xe
 70005c8:	0109                	addi	sp,sp,2
 70005ca:	0035                	c.nop	13
 70005cc:	0035                	c.nop	13
 70005ce:	0035                	c.nop	13
 70005d0:	0035                	c.nop	13
 70005d2:	0035                	c.nop	13
 70005d4:	008c                	addi	a1,sp,64
 70005d6:	0224                	addi	s1,sp,264
 70005d8:	ff76008f          	0xff76008f
 70005dc:	fc61                	bnez	s0,70005b4 <_binary_data_result_bin_start+0x5b4>
 70005de:	00effe53          	fadd.s	ft8,ft11,fa4
 70005e2:	0064                	addi	s1,sp,12
 70005e4:	0035                	c.nop	13
 70005e6:	0035                	c.nop	13
 70005e8:	0035                	c.nop	13
 70005ea:	0035                	c.nop	13
 70005ec:	00b8                	addi	a4,sp,72
 70005ee:	02b9                	addi	t0,t0,14
 70005f0:	ff32ff43          	fmadd.q	ft10,ft5,fs3,ft11
 70005f4:	fcbd0243          	0xfcbd0243
 70005f8:	fed6                	fsw	fs5,124(sp)
 70005fa:	0035                	c.nop	13
 70005fc:	0035                	c.nop	13
 70005fe:	0035                	c.nop	13
 7000600:	0035                	c.nop	13
 7000602:	0035                	c.nop	13
 7000604:	00ea                	slli	ra,ra,0x1a
 7000606:	fed6033b          	0xfed6033b
 700060a:	000c                	0xc
 700060c:	fdd103d7          	0xfdd103d7
 7000610:	fd40                	fsw	fs0,60(a0)
 7000612:	0035                	c.nop	13
 7000614:	0035                	c.nop	13
 7000616:	0035                	c.nop	13
 7000618:	0035                	c.nop	13
 700061a:	0035                	c.nop	13
 700061c:	00d0                	addi	a2,sp,68
 700061e:	009f026f          	jal	tp,70f0e26 <_binary_data_result_bin_end+0xef7a6>
 7000622:	fea9                	bnez	a3,700057c <_binary_data_result_bin_start+0x57c>
 7000624:	01ba                	slli	gp,gp,0xe
 7000626:	fe8a                	fsw	ft2,124(sp)
 7000628:	fee8                	fsw	fa0,124(a3)
 700062a:	0035                	c.nop	13
 700062c:	0035                	c.nop	13
 700062e:	0035                	c.nop	13
 7000630:	0035                	c.nop	13
 7000632:	0035                	c.nop	13
 7000634:	0069                	c.nop	26
 7000636:	02b0                	addi	a2,sp,328
 7000638:	02ee                	slli	t0,t0,0x1b
 700063a:	0029                	c.nop	10
 700063c:	fce4                	fsw	fs1,124(s1)
 700063e:	fd19                	bnez	a0,700055c <_binary_data_result_bin_start+0x55c>
 7000640:	002d                	c.nop	11
 7000642:	0035                	c.nop	13
 7000644:	0035                	c.nop	13
 7000646:	0035                	c.nop	13
 7000648:	0035                	c.nop	13
 700064a:	0035                	c.nop	13
 700064c:	0035                	c.nop	13
 700064e:	00f1                	addi	ra,ra,28
 7000650:	04aa                	slli	s1,s1,0xa
 7000652:	fd8901f7          	0xfd8901f7
 7000656:	fc88                	fsw	fa0,56(s1)
 7000658:	0091                	addi	ra,ra,4
 700065a:	0035                	c.nop	13
 700065c:	0035                	c.nop	13
 700065e:	0035                	c.nop	13
 7000660:	0035                	c.nop	13
 7000662:	0035                	c.nop	13
 7000664:	0035                	c.nop	13
 7000666:	02e101bf 009f0142 	0x9f014202e101bf
 700066e:	fbb2                	fsw	fa2,244(sp)
 7000670:	ffc8                	fsw	fa0,60(a5)
 7000672:	0035                	c.nop	13
 7000674:	0035                	c.nop	13
 7000676:	0035                	c.nop	13
 7000678:	0035                	c.nop	13
 700067a:	0035                	c.nop	13
 700067c:	0035                	c.nop	13
 700067e:	02aa                	slli	t0,t0,0xa
 7000680:	008202b3          	add	t0,tp,s0
 7000684:	007f                	0x7f
 7000686:	fd28                	fsw	fa0,120(a0)
 7000688:	fedc                	fsw	fa5,60(a3)
 700068a:	0035                	c.nop	13
 700068c:	0035                	c.nop	13
 700068e:	0035                	c.nop	13
 7000690:	0035                	c.nop	13
 7000692:	0035                	c.nop	13
 7000694:	0035                	c.nop	13
 7000696:	02bd                	addi	t0,t0,15
 7000698:	0159                	addi	sp,sp,22
 700069a:	fbee                	fsw	fs11,244(sp)
 700069c:	fd5d                	bnez	a0,700065a <_binary_data_result_bin_start+0x65a>
 700069e:	fd95                	bnez	a1,70005da <_binary_data_result_bin_start+0x5da>
 70006a0:	fff0                	fsw	fa2,124(a5)
 70006a2:	0035                	c.nop	13
 70006a4:	0035                	c.nop	13
 70006a6:	0035                	c.nop	13
 70006a8:	0035                	c.nop	13
 70006aa:	0035                	c.nop	13
 70006ac:	0035                	c.nop	13
 70006ae:	0228                	addi	a0,sp,264
 70006b0:	0238                	addi	a4,sp,264
 70006b2:	0016                	c.slli	zero,0x5
 70006b4:	fea0                	fsw	fs0,120(a3)
 70006b6:	ffd4                	fsw	fa3,60(a5)
 70006b8:	0035                	c.nop	13
 70006ba:	0035                	c.nop	13
 70006bc:	0035                	c.nop	13
 70006be:	0035                	c.nop	13
 70006c0:	ff9e                	fsw	ft7,252(sp)
 70006c2:	ff9e                	fsw	ft7,252(sp)
 70006c4:	ff9e                	fsw	ft7,252(sp)
 70006c6:	ff9e                	fsw	ft7,252(sp)
 70006c8:	ff9e                	fsw	ft7,252(sp)
 70006ca:	ff9e                	fsw	ft7,252(sp)
 70006cc:	009a00af          	0x9a00af
 70006d0:	ff9e                	fsw	ft7,252(sp)
 70006d2:	ff9e                	fsw	ft7,252(sp)
 70006d4:	ff9e                	fsw	ft7,252(sp)
 70006d6:	ff9e                	fsw	ft7,252(sp)
 70006d8:	ff9e                	fsw	ft7,252(sp)
 70006da:	ff9e                	fsw	ft7,252(sp)
 70006dc:	ff9e                	fsw	ft7,252(sp)
 70006de:	ff9e                	fsw	ft7,252(sp)
 70006e0:	ffc5ff33          	0xffc5ff33
 70006e4:	01f3013b          	0x1f3013b
 70006e8:	0074                	addi	a3,sp,12
 70006ea:	ff9e                	fsw	ft7,252(sp)
 70006ec:	ff9e                	fsw	ft7,252(sp)
 70006ee:	ff9e                	fsw	ft7,252(sp)
 70006f0:	ff9e                	fsw	ft7,252(sp)
 70006f2:	ff9e                	fsw	ft7,252(sp)
 70006f4:	ff9e                	fsw	ft7,252(sp)
 70006f6:	ff5d                	bnez	a4,70006b4 <_binary_data_result_bin_start+0x6b4>
 70006f8:	043d0023          	sb	gp,64(s10)
 70006fc:	0200                	addi	s0,sp,256
 70006fe:	01a1                	addi	gp,gp,8
 7000700:	ffe301af          	0xffe301af
 7000704:	ff9e                	fsw	ft7,252(sp)
 7000706:	ff9e                	fsw	ft7,252(sp)
 7000708:	ff9e                	fsw	ft7,252(sp)
 700070a:	ff9e                	fsw	ft7,252(sp)
 700070c:	ff9e                	fsw	ft7,252(sp)
 700070e:	0393fe6f          	jal	t3,703ff46 <_binary_data_result_bin_end+0x3e8c6>
 7000712:	050e                	slli	a0,a0,0x3
 7000714:	002e                	c.slli	zero,0xb
 7000716:	0111                	addi	sp,sp,4
 7000718:	0386                	slli	t2,t2,0x1
 700071a:	ffe9                	bnez	a5,70006f4 <_binary_data_result_bin_start+0x6f4>
 700071c:	ff9e                	fsw	ft7,252(sp)
 700071e:	ff9e                	fsw	ft7,252(sp)
 7000720:	ff9e                	fsw	ft7,252(sp)
 7000722:	ff9e                	fsw	ft7,252(sp)
 7000724:	ff9e                	fsw	ft7,252(sp)
 7000726:	0210fff7          	0x210fff7
 700072a:	0276                	slli	tp,tp,0x1d
 700072c:	003e                	c.slli	zero,0xf
 700072e:	02ac                	addi	a1,sp,328
 7000730:	0278                	addi	a4,sp,268
 7000732:	ffbd                	bnez	a5,70006b0 <_binary_data_result_bin_start+0x6b0>
 7000734:	ff9e                	fsw	ft7,252(sp)
 7000736:	ff9e                	fsw	ft7,252(sp)
 7000738:	ff9e                	fsw	ft7,252(sp)
 700073a:	ff9e                	fsw	ft7,252(sp)
 700073c:	ff9e                	fsw	ft7,252(sp)
 700073e:	009c                	addi	a5,sp,64
 7000740:	0064                	addi	s1,sp,12
 7000742:	0082                	c.slli64	ra
 7000744:	044202a3          	sb	tp,69(tp) # 8d60473 <_binary_riscv32_obj_data_sw_conv_data_bin_end+0xc86ec3>
 7000748:	0141                	addi	sp,sp,16
 700074a:	ffa4                	fsw	fs1,120(a5)
 700074c:	ff9e                	fsw	ft7,252(sp)
 700074e:	ff9e                	fsw	ft7,252(sp)
 7000750:	ff9e                	fsw	ft7,252(sp)
 7000752:	ff9e                	fsw	ft7,252(sp)
 7000754:	ffeaffab          	0xffeaffab
 7000758:	0014                	0x14
 700075a:	ff21                	bnez	a4,70006b2 <_binary_data_result_bin_start+0x6b2>
 700075c:	04b9                	addi	s1,s1,14
 700075e:	040e                	slli	s0,s0,0x3
 7000760:	0078                	addi	a4,sp,12
 7000762:	ff9e                	fsw	ft7,252(sp)
 7000764:	ff9e                	fsw	ft7,252(sp)
 7000766:	ff9e                	fsw	ft7,252(sp)
 7000768:	ff9e                	fsw	ft7,252(sp)
 700076a:	ff9e                	fsw	ft7,252(sp)
 700076c:	ff9e                	fsw	ft7,252(sp)
 700076e:	ffc8                	fsw	fa0,60(a5)
 7000770:	0028ffcf          	fnmadd.s	ft11,fa7,ft2,ft0
 7000774:	02ad                	addi	t0,t0,11
 7000776:	024c                	addi	a1,sp,260
 7000778:	018d                	addi	gp,gp,3
 700077a:	ff9e                	fsw	ft7,252(sp)
 700077c:	ff9e                	fsw	ft7,252(sp)
 700077e:	ff9e                	fsw	ft7,252(sp)
 7000780:	ff9e                	fsw	ft7,252(sp)
 7000782:	ff9e                	fsw	ft7,252(sp)
 7000784:	ff9e                	fsw	ft7,252(sp)
 7000786:	ff9a                	fsw	ft6,252(sp)
 7000788:	fe6e                	fsw	fs11,60(sp)
 700078a:	03f2                	slli	t2,t2,0x1c
 700078c:	02f2                	slli	t0,t0,0x1c
 700078e:	01f1                	addi	gp,gp,28
 7000790:	0282                	c.slli64	t0
 7000792:	ff9e                	fsw	ft7,252(sp)
 7000794:	ff9e                	fsw	ft7,252(sp)
 7000796:	ff9e                	fsw	ft7,252(sp)
 7000798:	ff9e                	fsw	ft7,252(sp)
 700079a:	ff9e                	fsw	ft7,252(sp)
 700079c:	ff9e                	fsw	ft7,252(sp)
 700079e:	ff71                	bnez	a4,700077a <_binary_data_result_bin_start+0x77a>
 70007a0:	02da0057          	0x2da0057
 70007a4:	01be                	slli	gp,gp,0xf
 70007a6:	01ff030f          	0x1ff030f
 70007aa:	ff9e                	fsw	ft7,252(sp)
 70007ac:	ff9e                	fsw	ft7,252(sp)
 70007ae:	ff9e                	fsw	ft7,252(sp)
 70007b0:	ff9e                	fsw	ft7,252(sp)
 70007b2:	ff9e                	fsw	ft7,252(sp)
 70007b4:	ff9e                	fsw	ft7,252(sp)
 70007b6:	ff3c                	fsw	fa5,120(a4)
 70007b8:	00e0                	addi	s0,sp,76
 70007ba:	011c                	addi	a5,sp,128
 70007bc:	03f2                	slli	t2,t2,0x1c
 70007be:	02d4                	addi	a3,sp,324
 70007c0:	ff9effbb          	0xff9effbb
 70007c4:	ff9e                	fsw	ft7,252(sp)
 70007c6:	ff9e                	fsw	ft7,252(sp)
 70007c8:	ff9e                	fsw	ft7,252(sp)
 70007ca:	ff9e                	fsw	ft7,252(sp)
 70007cc:	ff9e                	fsw	ft7,252(sp)
 70007ce:	0016                	c.slli	zero,0x5
 70007d0:	025d0143          	fmadd.d	ft2,fs10,ft5,ft0,rne
 70007d4:	ff4602c3          	fmadd.q	ft5,fa2,fs4,ft11,rne
 70007d8:	ff9e                	fsw	ft7,252(sp)
 70007da:	ff9e                	fsw	ft7,252(sp)
 70007dc:	ff9e                	fsw	ft7,252(sp)
 70007de:	ff9e                	fsw	ft7,252(sp)
 70007e0:	0032                	c.slli	zero,0xc
 70007e2:	0032                	c.slli	zero,0xc
 70007e4:	0032                	c.slli	zero,0xc
 70007e6:	0032                	c.slli	zero,0xc
 70007e8:	007a                	c.slli	zero,0x1e
 70007ea:	01a9                	addi	gp,gp,10
 70007ec:	0148                	addi	a0,sp,132
 70007ee:	00aa                	slli	ra,ra,0xa
 70007f0:	0032                	c.slli	zero,0xc
 70007f2:	0032                	c.slli	zero,0xc
 70007f4:	0032                	c.slli	zero,0xc
 70007f6:	0032                	c.slli	zero,0xc
 70007f8:	0032                	c.slli	zero,0xc
 70007fa:	0032                	c.slli	zero,0xc
 70007fc:	0032                	c.slli	zero,0xc
 70007fe:	00df 01a7 01e1      	0x1e101a700df
 7000804:	0450                	addi	a2,sp,516
 7000806:	0452                	slli	s0,s0,0x14
 7000808:	00d8                	addi	a4,sp,68
 700080a:	0032                	c.slli	zero,0xc
 700080c:	0032                	c.slli	zero,0xc
 700080e:	0032                	c.slli	zero,0xc
 7000810:	0032                	c.slli	zero,0xc
 7000812:	0032                	c.slli	zero,0xc
 7000814:	004d                	c.nop	19
 7000816:	009c013f 043c00dc 	0x43c00dc009c013f
 700081e:	05bc                	addi	a5,sp,712
 7000820:	0359                	addi	t1,t1,22
 7000822:	00a0                	addi	s0,sp,72
 7000824:	0032                	c.slli	zero,0xc
 7000826:	0032                	c.slli	zero,0xc
 7000828:	0032                	c.slli	zero,0xc
 700082a:	0032                	c.slli	zero,0xc
 700082c:	0052                	c.slli	zero,0x14
 700082e:	0084                	addi	s1,sp,64
 7000830:	ffc2                	fsw	fa6,252(sp)
 7000832:	003e055b          	0x3e055b
 7000836:	04c5                	addi	s1,s1,17
 7000838:	05f1                	addi	a1,a1,28
 700083a:	0032012f          	0x32012f
 700083e:	0032                	c.slli	zero,0xc
 7000840:	0032                	c.slli	zero,0xc
 7000842:	0032                	c.slli	zero,0xc
 7000844:	0032                	c.slli	zero,0xc
 7000846:	feb2                	fsw	fa2,124(sp)
 7000848:	03b5                	addi	t2,t2,13
 700084a:	01ee0863          	beq	t3,t5,700085a <_binary_data_result_bin_start+0x85a>
 700084e:	0236                	slli	tp,tp,0xd
 7000850:	014706b3          	add	a3,a4,s4
 7000854:	0032                	c.slli	zero,0xc
 7000856:	0032                	c.slli	zero,0xc
 7000858:	0032                	c.slli	zero,0xc
 700085a:	0032                	c.slli	zero,0xc
 700085c:	0032                	c.slli	zero,0xc
 700085e:	fe7d                	bnez	a2,700085c <_binary_data_result_bin_start+0x85c>
 7000860:	0765022b          	0x765022b
 7000864:	0290                	addi	a2,sp,320
 7000866:	0584                	addi	s1,sp,704
 7000868:	00be06bb          	0xbe06bb
 700086c:	0032                	c.slli	zero,0xc
 700086e:	0032                	c.slli	zero,0xc
 7000870:	0032                	c.slli	zero,0xc
 7000872:	0032                	c.slli	zero,0xc
 7000874:	0032                	c.slli	zero,0xc
 7000876:	fcf80003          	lb	zero,-49(a6) # fffe8fcf <_binary_riscv32_obj_data_sw_conv_data_bin_end+0xf7f0fa1f>
 700087a:	0443036b          	0x443036b
 700087e:	0706                	slli	a4,a4,0x1
 7000880:	0509                	addi	a0,a0,2
 7000882:	0032                	c.slli	zero,0xc
 7000884:	0032                	c.slli	zero,0xc
 7000886:	0032                	c.slli	zero,0xc
 7000888:	0032                	c.slli	zero,0xc
 700088a:	0032                	c.slli	zero,0xc
 700088c:	0032                	c.slli	zero,0xc
 700088e:	003e                	c.slli	zero,0xf
 7000890:	0050                	addi	a2,sp,4
 7000892:	0613fce7          	0x613fce7
 7000896:	0404077b          	0x404077b
 700089a:	0032                	c.slli	zero,0xc
 700089c:	0032                	c.slli	zero,0xc
 700089e:	0032                	c.slli	zero,0xc
 70008a0:	0032                	c.slli	zero,0xc
 70008a2:	0032                	c.slli	zero,0xc
 70008a4:	0032                	c.slli	zero,0xc
 70008a6:	00a5                	addi	ra,ra,9
 70008a8:	00ed                	addi	ra,ra,27
 70008aa:	ffd4                	fsw	fa3,60(a5)
 70008ac:	03a0                	addi	s0,sp,456
 70008ae:	05d5                	addi	a1,a1,21
 70008b0:	003206ab          	0x3206ab
 70008b4:	0032                	c.slli	zero,0xc
 70008b6:	0032                	c.slli	zero,0xc
 70008b8:	0032                	c.slli	zero,0xc
 70008ba:	0032                	c.slli	zero,0xc
 70008bc:	0032                	c.slli	zero,0xc
 70008be:	00bd                	addi	ra,ra,15
 70008c0:	065cff13          	andi	t5,s9,101
 70008c4:	0555                	addi	a0,a0,21
 70008c6:	0559                	addi	a0,a0,22
 70008c8:	06c8                	addi	a0,sp,836
 70008ca:	0032                	c.slli	zero,0xc
 70008cc:	0032                	c.slli	zero,0xc
 70008ce:	0032                	c.slli	zero,0xc
 70008d0:	0032                	c.slli	zero,0xc
 70008d2:	0032                	c.slli	zero,0xc
 70008d4:	0032                	c.slli	zero,0xc
 70008d6:	fc6e0037          	lui	zero,0xfc6e0
 70008da:	0246046b          	0x246046b
 70008de:	0480                	addi	s0,sp,576
 70008e0:	0479                	addi	s0,s0,30
 70008e2:	0032                	c.slli	zero,0xc
 70008e4:	0032                	c.slli	zero,0xc
 70008e6:	0032                	c.slli	zero,0xc
 70008e8:	0032                	c.slli	zero,0xc
 70008ea:	0032                	c.slli	zero,0xc
 70008ec:	0032                	c.slli	zero,0xc
 70008ee:	ffc1                	bnez	a5,7000886 <_binary_data_result_bin_start+0x886>
 70008f0:	fda1                	bnez	a1,7000848 <_binary_data_result_bin_start+0x848>
 70008f2:	02a901d7          	0x2a901d7
 70008f6:	0336                	slli	t1,t1,0xd
 70008f8:	0162                	slli	sp,sp,0x18
 70008fa:	0032                	c.slli	zero,0xc
 70008fc:	0032                	c.slli	zero,0xc
 70008fe:	0032                	c.slli	zero,0xc
 7000900:	ff41                	bnez	a4,7000898 <_binary_data_result_bin_start+0x898>
 7000902:	ff41                	bnez	a4,700089a <_binary_data_result_bin_start+0x89a>
 7000904:	ff41                	bnez	a4,700089c <_binary_data_result_bin_start+0x89c>
 7000906:	ff41                	bnez	a4,700089e <_binary_data_result_bin_start+0x89e>
 7000908:	ff9c                	fsw	fa5,56(a5)
 700090a:	0112                	slli	sp,sp,0x4
 700090c:	0338                	addi	a4,sp,392
 700090e:	ff410207          	0xff410207
 7000912:	ff41                	bnez	a4,70008aa <_binary_data_result_bin_start+0x8aa>
 7000914:	ff41                	bnez	a4,70008ac <_binary_data_result_bin_start+0x8ac>
 7000916:	ff41                	bnez	a4,70008ae <_binary_data_result_bin_start+0x8ae>
 7000918:	ff41                	bnez	a4,70008b0 <_binary_data_result_bin_start+0x8b0>
 700091a:	ff41                	bnez	a4,70008b2 <_binary_data_result_bin_start+0x8b2>
 700091c:	ff41                	bnez	a4,70008b4 <_binary_data_result_bin_start+0x8b4>
 700091e:	0046                	c.slli	zero,0x11
 7000920:	0509                	addi	a0,a0,2
 7000922:	0c1a0bab          	0xc1a0bab
 7000926:	0894                	addi	a3,sp,80
 7000928:	0198                	addi	a4,sp,192
 700092a:	ff41                	bnez	a4,70008c2 <_binary_data_result_bin_start+0x8c2>
 700092c:	ff41                	bnez	a4,70008c4 <_binary_data_result_bin_start+0x8c4>
 700092e:	ff41                	bnez	a4,70008c6 <_binary_data_result_bin_start+0x8c6>
 7000930:	ff41                	bnez	a4,70008c8 <_binary_data_result_bin_start+0x8c8>
 7000932:	ff41                	bnez	a4,70008ca <_binary_data_result_bin_start+0x8ca>
 7000934:	ff6a                	fsw	fs10,188(sp)
 7000936:	02d0                	addi	a2,sp,324
 7000938:	07e9                	addi	a5,a5,26
 700093a:	09390a37          	lui	s4,0x9390
 700093e:	0a1a                	slli	s4,s4,0x6
 7000940:	000306e3          	beqz	t1,700114c <_binary_data_result_bin_start+0x114c>
 7000944:	ff41                	bnez	a4,70008dc <_binary_data_result_bin_start+0x8dc>
 7000946:	ff41                	bnez	a4,70008de <_binary_data_result_bin_start+0x8de>
 7000948:	ff41                	bnez	a4,70008e0 <_binary_data_result_bin_start+0x8e0>
 700094a:	ff41                	bnez	a4,70008e2 <_binary_data_result_bin_start+0x8e2>
 700094c:	ffa4                	fsw	fs1,120(a5)
 700094e:	05d903bb          	0x5d903bb
 7000952:	0428                	addi	a0,sp,520
 7000954:	febe                	fsw	fa5,124(sp)
 7000956:	0798                	addi	a4,sp,960
 7000958:	0785                	addi	a5,a5,1
 700095a:	ff41003f ff41ff41 	0xff41ff41ff41003f
 7000962:	ff41                	bnez	a4,70008fa <_binary_data_result_bin_start+0x8fa>
 7000964:	ffb5                	bnez	a5,70008e0 <_binary_data_result_bin_start+0x8e0>
 7000966:	01d8                	addi	a4,sp,196
 7000968:	08c8053b          	0x8c8053b
 700096c:	054c05f3          	0x54c05f3
 7000970:	0630                	addi	a2,sp,776
 7000972:	ff41ffa3          	0xff41ffa3
 7000976:	ff41                	bnez	a4,700090e <_binary_data_result_bin_start+0x90e>
 7000978:	ff41                	bnez	a4,7000910 <_binary_data_result_bin_start+0x910>
 700097a:	ff41                	bnez	a4,7000912 <_binary_data_result_bin_start+0x912>
 700097c:	ff4a                	fsw	fs2,188(sp)
 700097e:	ff0c                	fsw	fa1,56(a4)
 7000980:	0d150433          	0xd150433
 7000984:	0d91                	addi	s11,s11,4
 7000986:	01f005b3          	add	a1,zero,t6
 700098a:	ff4c                	fsw	fa1,60(a4)
 700098c:	ff41                	bnez	a4,7000924 <_binary_data_result_bin_start+0x924>
 700098e:	ff41                	bnez	a4,7000926 <_binary_data_result_bin_start+0x926>
 7000990:	ff41                	bnez	a4,7000928 <_binary_data_result_bin_start+0x928>
 7000992:	ff41                	bnez	a4,700092a <_binary_data_result_bin_start+0x92a>
 7000994:	ff41                	bnez	a4,700092c <_binary_data_result_bin_start+0x92c>
 7000996:	fdbfff23          	0xfdbfff23
 700099a:	0891                	addi	a7,a7,4
 700099c:	06e10ba7          	0x6e10ba7
 70009a0:	01ae                	slli	gp,gp,0xb
 70009a2:	ff41                	bnez	a4,700093a <_binary_data_result_bin_start+0x93a>
 70009a4:	ff41                	bnez	a4,700093c <_binary_data_result_bin_start+0x93c>
 70009a6:	ff41                	bnez	a4,700093e <_binary_data_result_bin_start+0x93e>
 70009a8:	ff41                	bnez	a4,7000940 <_binary_data_result_bin_start+0x940>
 70009aa:	ff41                	bnez	a4,7000942 <_binary_data_result_bin_start+0x942>
 70009ac:	ff41                	bnez	a4,7000944 <_binary_data_result_bin_start+0x944>
 70009ae:	019eff57          	0x19eff57
 70009b2:	03e9                	addi	t2,t2,26
 70009b4:	08cc                	addi	a1,sp,84
 70009b6:	053508bf ff41ff41 	0xff41ff41053508bf
 70009be:	ff41                	bnez	a4,7000956 <_binary_data_result_bin_start+0x956>
 70009c0:	ff41                	bnez	a4,7000958 <_binary_data_result_bin_start+0x958>
 70009c2:	ff41                	bnez	a4,700095a <_binary_data_result_bin_start+0x95a>
 70009c4:	ff41                	bnez	a4,700095c <_binary_data_result_bin_start+0x95c>
 70009c6:	0061                	c.nop	24
 70009c8:	0444                	addi	s1,sp,516
 70009ca:	051d                	addi	a0,a0,7
 70009cc:	0365                	addi	t1,t1,25
 70009ce:	062a07d7          	0x62a07d7
 70009d2:	ff41                	bnez	a4,700096a <_binary_data_result_bin_start+0x96a>
 70009d4:	ff41                	bnez	a4,700096c <_binary_data_result_bin_start+0x96c>
 70009d6:	ff41                	bnez	a4,700096e <_binary_data_result_bin_start+0x96e>
 70009d8:	ff41                	bnez	a4,7000970 <_binary_data_result_bin_start+0x970>
 70009da:	ff41                	bnez	a4,7000972 <_binary_data_result_bin_start+0x972>
 70009dc:	ff41                	bnez	a4,7000974 <_binary_data_result_bin_start+0x974>
 70009de:	01a0                	addi	s0,sp,200
 70009e0:	0579                	addi	a0,a0,30
 70009e2:	0b19                	addi	s6,s6,6
 70009e4:	0b32                	slli	s6,s6,0xc
 70009e6:	05b8                	addi	a4,sp,712
 70009e8:	0434                	addi	a3,sp,520
 70009ea:	ff41                	bnez	a4,7000982 <_binary_data_result_bin_start+0x982>
 70009ec:	ff41                	bnez	a4,7000984 <_binary_data_result_bin_start+0x984>
 70009ee:	ff41                	bnez	a4,7000986 <_binary_data_result_bin_start+0x986>
 70009f0:	ff41                	bnez	a4,7000988 <_binary_data_result_bin_start+0x988>
 70009f2:	ff41                	bnez	a4,700098a <_binary_data_result_bin_start+0x98a>
 70009f4:	ff41                	bnez	a4,700098c <_binary_data_result_bin_start+0x98c>
 70009f6:	04010193          	addi	gp,sp,64
 70009fa:	0a11                	addi	s4,s4,4
 70009fc:	0909                	addi	s2,s2,2
 70009fe:	0076                	c.slli	zero,0x1d
 7000a00:	ff62                	fsw	fs8,188(sp)
 7000a02:	ff41                	bnez	a4,700099a <_binary_data_result_bin_start+0x99a>
 7000a04:	ff41                	bnez	a4,700099c <_binary_data_result_bin_start+0x99c>
 7000a06:	ff41                	bnez	a4,700099e <_binary_data_result_bin_start+0x99e>
 7000a08:	ff41                	bnez	a4,70009a0 <_binary_data_result_bin_start+0x9a0>
 7000a0a:	ff41                	bnez	a4,70009a2 <_binary_data_result_bin_start+0x9a2>
 7000a0c:	ff41                	bnez	a4,70009a4 <_binary_data_result_bin_start+0x9a4>
 7000a0e:	fc7fff53          	0xfc7fff53
 7000a12:	fc02                	fsw	ft0,56(sp)
 7000a14:	fd4c                	fsw	fa1,60(a0)
 7000a16:	ff55                	bnez	a4,70009d2 <_binary_data_result_bin_start+0x9d2>
 7000a18:	ff59                	bnez	a4,70009b6 <_binary_data_result_bin_start+0x9b6>
 7000a1a:	ff41                	bnez	a4,70009b2 <_binary_data_result_bin_start+0x9b2>
 7000a1c:	ff41                	bnez	a4,70009b4 <_binary_data_result_bin_start+0x9b4>
 7000a1e:	ff41                	bnez	a4,70009b6 <_binary_data_result_bin_start+0x9b6>
 7000a20:	ff80                	fsw	fs0,56(a5)
 7000a22:	ff80                	fsw	fs0,56(a5)
 7000a24:	ff80                	fsw	fs0,56(a5)
 7000a26:	ff80                	fsw	fs0,56(a5)
 7000a28:	ff80                	fsw	fs0,56(a5)
 7000a2a:	ff80                	fsw	fs0,56(a5)
 7000a2c:	ff80                	fsw	fs0,56(a5)
 7000a2e:	ff80                	fsw	fs0,56(a5)
 7000a30:	ff80                	fsw	fs0,56(a5)
 7000a32:	ff80                	fsw	fs0,56(a5)
 7000a34:	ff80                	fsw	fs0,56(a5)
 7000a36:	ff80                	fsw	fs0,56(a5)
 7000a38:	ff80                	fsw	fs0,56(a5)
 7000a3a:	ff80                	fsw	fs0,56(a5)
 7000a3c:	ff80                	fsw	fs0,56(a5)
 7000a3e:	ff80                	fsw	fs0,56(a5)
 7000a40:	fe92                	fsw	ft4,124(sp)
 7000a42:	fc32                	fsw	fa2,56(sp)
 7000a44:	fc56                	fsw	fs5,56(sp)
 7000a46:	fe64                	fsw	fs1,124(a2)
 7000a48:	ff80                	fsw	fs0,56(a5)
 7000a4a:	ff80                	fsw	fs0,56(a5)
 7000a4c:	ff80                	fsw	fs0,56(a5)
 7000a4e:	ff80                	fsw	fs0,56(a5)
 7000a50:	ff80                	fsw	fs0,56(a5)
 7000a52:	ff80                	fsw	fs0,56(a5)
 7000a54:	ff80                	fsw	fs0,56(a5)
 7000a56:	fee5                	bnez	a3,7000a4e <_binary_data_result_bin_start+0xa4e>
 7000a58:	febd                	bnez	a3,70009d6 <_binary_data_result_bin_start+0x9d6>
 7000a5a:	ffa9                	bnez	a5,70009b4 <_binary_data_result_bin_start+0x9b4>
 7000a5c:	ffc8                	fsw	fa0,60(a5)
 7000a5e:	fdd1                	bnez	a1,70009fa <_binary_data_result_bin_start+0x9fa>
 7000a60:	fe81                	bnez	a3,7000978 <_binary_data_result_bin_start+0x978>
 7000a62:	ff80                	fsw	fs0,56(a5)
 7000a64:	ff80                	fsw	fs0,56(a5)
 7000a66:	ff80                	fsw	fs0,56(a5)
 7000a68:	ff80                	fsw	fs0,56(a5)
 7000a6a:	ff80                	fsw	fs0,56(a5)
 7000a6c:	ff80                	fsw	fs0,56(a5)
 7000a6e:	ff1c                	fsw	fa5,56(a4)
 7000a70:	007a                	c.slli	zero,0x1e
 7000a72:	04d2                	slli	s1,s1,0x14
 7000a74:	01ac0583          	lb	a1,26(s8) # 1a01a <_binary_data_result_bin_size+0x1899a>
 7000a78:	fea0                	fsw	fs0,120(a3)
 7000a7a:	ff80                	fsw	fs0,56(a5)
 7000a7c:	ff80                	fsw	fs0,56(a5)
 7000a7e:	ff80                	fsw	fs0,56(a5)
 7000a80:	ff80                	fsw	fs0,56(a5)
 7000a82:	ff80                	fsw	fs0,56(a5)
 7000a84:	fff5                	bnez	a5,7000a80 <_binary_data_result_bin_start+0xa80>
 7000a86:	0118                	addi	a4,sp,128
 7000a88:	ffb2                	fsw	fa2,252(sp)
 7000a8a:	0181                	addi	gp,gp,0
 7000a8c:	01cc                	addi	a1,sp,196
 7000a8e:	01d5                	addi	gp,gp,21
 7000a90:	0034                	addi	a3,sp,8
 7000a92:	ffd5                	bnez	a5,7000a4e <_binary_data_result_bin_start+0xa4e>
 7000a94:	ff80                	fsw	fs0,56(a5)
 7000a96:	ff80                	fsw	fs0,56(a5)
 7000a98:	ff80                	fsw	fs0,56(a5)
 7000a9a:	ff80                	fsw	fs0,56(a5)
 7000a9c:	026a0043          	fmadd.d	ft0,fs4,ft6,ft0,rne
 7000aa0:	01d9                	addi	gp,gp,22
 7000aa2:	fe02                	fsw	ft0,60(sp)
 7000aa4:	fe3d                	bnez	a2,7000a22 <_binary_data_result_bin_start+0xa22>
 7000aa6:	0088                	addi	a0,sp,64
 7000aa8:	01ad                	addi	gp,gp,11
 7000aaa:	fff6                	fsw	ft9,252(sp)
 7000aac:	ff80                	fsw	fs0,56(a5)
 7000aae:	ff80                	fsw	fs0,56(a5)
 7000ab0:	ff80                	fsw	fs0,56(a5)
 7000ab2:	ff80                	fsw	fs0,56(a5)
 7000ab4:	ffd2                	fsw	fs4,252(sp)
 7000ab6:	031f 0383 0368      	0x3680383031f
 7000abc:	00a1                	addi	ra,ra,8
 7000abe:	009c                	addi	a5,sp,64
 7000ac0:	012c                	addi	a1,sp,136
 7000ac2:	ff80                	fsw	fs0,56(a5)
 7000ac4:	ff80                	fsw	fs0,56(a5)
 7000ac6:	ff80                	fsw	fs0,56(a5)
 7000ac8:	ff80                	fsw	fs0,56(a5)
 7000aca:	ff80                	fsw	fs0,56(a5)
 7000acc:	ff80                	fsw	fs0,56(a5)
 7000ace:	00a5                	addi	ra,ra,9
 7000ad0:	026c                	addi	a1,sp,268
 7000ad2:	03c1                	addi	t2,t2,16
 7000ad4:	015a                	slli	sp,sp,0x16
 7000ad6:	ff59                	bnez	a4,7000a74 <_binary_data_result_bin_start+0xa74>
 7000ad8:	ff80ff53          	0xff80ff53
 7000adc:	ff80                	fsw	fs0,56(a5)
 7000ade:	ff80                	fsw	fs0,56(a5)
 7000ae0:	ff80                	fsw	fs0,56(a5)
 7000ae2:	ff80                	fsw	fs0,56(a5)
 7000ae4:	ff80                	fsw	fs0,56(a5)
 7000ae6:	ff7c                	fsw	fa5,124(a4)
 7000ae8:	ff39                	bnez	a4,7000a46 <_binary_data_result_bin_start+0xa46>
 7000aea:	01dd                	addi	gp,gp,23
 7000aec:	0224                	addi	s1,sp,264
 7000aee:	02ae                	slli	t0,t0,0xb
 7000af0:	ff80fe47          	fmsub.q	ft8,ft1,fs8,ft11
 7000af4:	ff80                	fsw	fs0,56(a5)
 7000af6:	ff80                	fsw	fs0,56(a5)
 7000af8:	ff80                	fsw	fs0,56(a5)
 7000afa:	ff80                	fsw	fs0,56(a5)
 7000afc:	ff80                	fsw	fs0,56(a5)
 7000afe:	ff39                	bnez	a4,7000a5c <_binary_data_result_bin_start+0xa5c>
 7000b00:	ff01                	bnez	a4,7000a18 <_binary_data_result_bin_start+0xa18>
 7000b02:	01baff6f          	jal	t5,70b031c <_binary_data_result_bin_end+0xaec9c>
 7000b06:	0185                	addi	gp,gp,1
 7000b08:	00e5                	addi	ra,ra,25
 7000b0a:	ff80                	fsw	fs0,56(a5)
 7000b0c:	ff80                	fsw	fs0,56(a5)
 7000b0e:	ff80                	fsw	fs0,56(a5)
 7000b10:	ff80                	fsw	fs0,56(a5)
 7000b12:	ff80                	fsw	fs0,56(a5)
 7000b14:	ff80                	fsw	fs0,56(a5)
 7000b16:	0132                	slli	sp,sp,0xc
 7000b18:	035e01fb          	0x35e01fb
 7000b1c:	02c70393          	addi	t2,a4,44
 7000b20:	01da                	slli	gp,gp,0x16
 7000b22:	ff80                	fsw	fs0,56(a5)
 7000b24:	ff80                	fsw	fs0,56(a5)
 7000b26:	ff80                	fsw	fs0,56(a5)
 7000b28:	ff80                	fsw	fs0,56(a5)
 7000b2a:	ff80                	fsw	fs0,56(a5)
 7000b2c:	ff80                	fsw	fs0,56(a5)
 7000b2e:	029d                	addi	t0,t0,7
 7000b30:	0591                	addi	a1,a1,4
 7000b32:	05c106f7          	0x5c106f7
 7000b36:	047e                	slli	s0,s0,0x1f
 7000b38:	00f4                	addi	a3,sp,76
 7000b3a:	ff80                	fsw	fs0,56(a5)
 7000b3c:	ff80                	fsw	fs0,56(a5)
 7000b3e:	ff80                	fsw	fs0,56(a5)
 7000b40:	0015                	c.nop	5
 7000b42:	0015                	c.nop	5
 7000b44:	0015                	c.nop	5
 7000b46:	0015                	c.nop	5
 7000b48:	0015                	c.nop	5
 7000b4a:	0015                	c.nop	5
 7000b4c:	016e                	slli	sp,sp,0x1b
 7000b4e:	0114                	addi	a3,sp,128
 7000b50:	0015                	c.nop	5
 7000b52:	0015                	c.nop	5
 7000b54:	0015                	c.nop	5
 7000b56:	0015                	c.nop	5
 7000b58:	0015                	c.nop	5
 7000b5a:	0015                	c.nop	5
 7000b5c:	0015                	c.nop	5
 7000b5e:	0015                	c.nop	5
 7000b60:	ff5c                	fsw	fa5,60(a4)
 7000b62:	03270223          	sb	s2,36(a4)
 7000b66:	01f4                	addi	a3,sp,204
 7000b68:	00e5                	addi	ra,ra,25
 7000b6a:	0015                	c.nop	5
 7000b6c:	0015                	c.nop	5
 7000b6e:	0015                	c.nop	5
 7000b70:	0015                	c.nop	5
 7000b72:	0015                	c.nop	5
 7000b74:	0015                	c.nop	5
 7000b76:	ff24                	fsw	fs1,120(a4)
 7000b78:	029f 01e9 00a7      	0xa701e9029f
 7000b7e:	01a7010f          	0x1a7010f
 7000b82:	0051                	c.nop	20
 7000b84:	0015                	c.nop	5
 7000b86:	0015                	c.nop	5
 7000b88:	0015                	c.nop	5
 7000b8a:	0015                	c.nop	5
 7000b8c:	0015                	c.nop	5
 7000b8e:	fdf5                	bnez	a1,7000b8a <_binary_data_result_bin_start+0xb8a>
 7000b90:	039f 012b fe04      	0xfe04012b039f
 7000b96:	00fe028b          	0xfe028b
 7000b9a:	00150027          	0x150027
 7000b9e:	0015                	c.nop	5
 7000ba0:	0015                	c.nop	5
 7000ba2:	0015                	c.nop	5
 7000ba4:	0015                	c.nop	5
 7000ba6:	fe64                	fsw	fs1,124(a2)
 7000ba8:	003f02bb          	0x3f02bb
 7000bac:	0422ffbf 001500eb 	0x1500eb0422ffbf
 7000bb4:	0015                	c.nop	5
 7000bb6:	0015                	c.nop	5
 7000bb8:	0015                	c.nop	5
 7000bba:	0015                	c.nop	5
 7000bbc:	0015                	c.nop	5
 7000bbe:	ff38                	fsw	fa4,120(a4)
 7000bc0:	00e8                	addi	a0,sp,76
 7000bc2:	ffc6                	fsw	fa7,252(sp)
 7000bc4:	03e0                	addi	s0,sp,460
 7000bc6:	044d                	addi	s0,s0,19
 7000bc8:	ff4d                	bnez	a4,7000b82 <_binary_data_result_bin_start+0xb82>
 7000bca:	0015                	c.nop	5
 7000bcc:	0015                	c.nop	5
 7000bce:	0015                	c.nop	5
 7000bd0:	0015                	c.nop	5
 7000bd2:	0015                	c.nop	5
 7000bd4:	001d                	c.nop	7
 7000bd6:	001f fe81 fefe      	0xfefefe81001f
 7000bdc:	032a                	slli	t1,t1,0xa
 7000bde:	0238                	addi	a4,sp,264
 7000be0:	0015000f          	0x15000f
 7000be4:	0015                	c.nop	5
 7000be6:	0015                	c.nop	5
 7000be8:	0015                	c.nop	5
 7000bea:	0015                	c.nop	5
 7000bec:	0015                	c.nop	5
 7000bee:	ff0c002b          	0xff0c002b
 7000bf2:	027c01f3          	0x27c01f3
 7000bf6:	0172                	slli	sp,sp,0x1c
 7000bf8:	008d                	addi	ra,ra,3
 7000bfa:	0015                	c.nop	5
 7000bfc:	0015                	c.nop	5
 7000bfe:	0015                	c.nop	5
 7000c00:	0015                	c.nop	5
 7000c02:	0015                	c.nop	5
 7000c04:	0015                	c.nop	5
 7000c06:	000d                	c.nop	3
 7000c08:	ff65                	bnez	a4,7000c00 <_binary_data_result_bin_start+0xc00>
 7000c0a:	0382                	c.slli64	t2
 7000c0c:	fefe                	fsw	ft11,124(sp)
 7000c0e:	02e4                	addi	s1,sp,332
 7000c10:	0079                	c.nop	30
 7000c12:	0015                	c.nop	5
 7000c14:	0015                	c.nop	5
 7000c16:	0015                	c.nop	5
 7000c18:	0015                	c.nop	5
 7000c1a:	0015                	c.nop	5
 7000c1c:	0015                	c.nop	5
 7000c1e:	ff96                	fsw	ft5,252(sp)
 7000c20:	019d                	addi	gp,gp,7
 7000c22:	02df 02a8 0437      	0x43702a802df
 7000c28:	ff30                	fsw	fa2,120(a4)
 7000c2a:	0015                	c.nop	5
 7000c2c:	0015                	c.nop	5
 7000c2e:	0015                	c.nop	5
 7000c30:	0015                	c.nop	5
 7000c32:	0015                	c.nop	5
 7000c34:	0015                	c.nop	5
 7000c36:	ff10                	fsw	fa2,56(a4)
 7000c38:	0179                	addi	sp,sp,30
 7000c3a:	01a6                	slli	gp,gp,0x9
 7000c3c:	007b01cb          	fnmsub.s	ft3,fs6,ft7,ft0,rne
 7000c40:	0015ffe7          	0x15ffe7
 7000c44:	0015                	c.nop	5
 7000c46:	0015                	c.nop	5
 7000c48:	0015                	c.nop	5
 7000c4a:	0015                	c.nop	5
 7000c4c:	0015                	c.nop	5
 7000c4e:	fffd                	bnez	a5,7000c4c <_binary_data_result_bin_start+0xc4c>
 7000c50:	0019                	c.nop	6
 7000c52:	ffb2ffef          	jal	t6,6f30c4c <_binary_data_result_bin_size+0x6f2f5cc>
 7000c56:	ffe8                	fsw	fa0,124(a5)
 7000c58:	0015                	c.nop	5
 7000c5a:	0015                	c.nop	5
 7000c5c:	0015                	c.nop	5
 7000c5e:	0015                	c.nop	5
 7000c60:	ff2a                	fsw	fa0,188(sp)
 7000c62:	ff2a                	fsw	fa0,188(sp)
 7000c64:	ff2a                	fsw	fa0,188(sp)
 7000c66:	ff2a                	fsw	fa0,188(sp)
 7000c68:	ff2a                	fsw	fa0,188(sp)
 7000c6a:	ff2a                	fsw	fa0,188(sp)
 7000c6c:	ff2a                	fsw	fa0,188(sp)
 7000c6e:	ff2a                	fsw	fa0,188(sp)
 7000c70:	ff2a                	fsw	fa0,188(sp)
 7000c72:	ff2a                	fsw	fa0,188(sp)
 7000c74:	ff2a                	fsw	fa0,188(sp)
 7000c76:	ff2a                	fsw	fa0,188(sp)
 7000c78:	ff2a                	fsw	fa0,188(sp)
 7000c7a:	ff2a                	fsw	fa0,188(sp)
 7000c7c:	ff2a                	fsw	fa0,188(sp)
 7000c7e:	ff2a                	fsw	fa0,188(sp)
 7000c80:	fe2c                	fsw	fa1,120(a2)
 7000c82:	fe18fdbb          	0xfe18fdbb
 7000c86:	fe66                	fsw	fs9,60(sp)
 7000c88:	ff2a                	fsw	fa0,188(sp)
 7000c8a:	ff2a                	fsw	fa0,188(sp)
 7000c8c:	ff2a                	fsw	fa0,188(sp)
 7000c8e:	ff2a                	fsw	fa0,188(sp)
 7000c90:	ff2a                	fsw	fa0,188(sp)
 7000c92:	ff2a                	fsw	fa0,188(sp)
 7000c94:	ff2a                	fsw	fa0,188(sp)
 7000c96:	fe98                	fsw	fa4,56(a3)
 7000c98:	ff59                	bnez	a4,7000c36 <_binary_data_result_bin_start+0xc36>
 7000c9a:	ffcd                	bnez	a5,7000c54 <_binary_data_result_bin_start+0xc54>
 7000c9c:	fdf2feb7          	lui	t4,0xfdf2f
 7000ca0:	fe88                	fsw	fa0,56(a3)
 7000ca2:	ff2a                	fsw	fa0,188(sp)
 7000ca4:	ff2a                	fsw	fa0,188(sp)
 7000ca6:	ff2a                	fsw	fa0,188(sp)
 7000ca8:	ff2a                	fsw	fa0,188(sp)
 7000caa:	ff2a                	fsw	fa0,188(sp)
 7000cac:	ff2a                	fsw	fa0,188(sp)
 7000cae:	febe                	fsw	fa5,124(sp)
 7000cb0:	fe05                	bnez	a2,7000be8 <_binary_data_result_bin_start+0xbe8>
 7000cb2:	fdec                	fsw	fa1,124(a1)
 7000cb4:	ff06                	fsw	ft1,188(sp)
 7000cb6:	ff32                	fsw	fa2,188(sp)
 7000cb8:	fe60                	fsw	fs0,124(a2)
 7000cba:	ff2a                	fsw	fa0,188(sp)
 7000cbc:	ff2a                	fsw	fa0,188(sp)
 7000cbe:	ff2a                	fsw	fa0,188(sp)
 7000cc0:	ff2a                	fsw	fa0,188(sp)
 7000cc2:	ff2a                	fsw	fa0,188(sp)
 7000cc4:	fe84ff43          	fmadd.q	ft10,fs1,fs0,ft11
 7000cc8:	fcaa                	fsw	fa0,120(sp)
 7000cca:	fd1dfdbb          	0xfd1dfdbb
 7000cce:	fe54                	fsw	fa3,60(a2)
 7000cd0:	ff51                	bnez	a4,7000c6c <_binary_data_result_bin_start+0xc6c>
 7000cd2:	ff4a                	fsw	fs2,188(sp)
 7000cd4:	ff2a                	fsw	fa0,188(sp)
 7000cd6:	ff2a                	fsw	fa0,188(sp)
 7000cd8:	ff2a                	fsw	fa0,188(sp)
 7000cda:	ff2a                	fsw	fa0,188(sp)
 7000cdc:	ff2a                	fsw	fa0,188(sp)
 7000cde:	fec1                	bnez	a3,7000c76 <_binary_data_result_bin_start+0xc76>
 7000ce0:	fe18                	fsw	fa4,56(a2)
 7000ce2:	fe14                	fsw	fa3,56(a2)
 7000ce4:	fcc9                	bnez	s1,7000c7e <_binary_data_result_bin_start+0xc7e>
 7000ce6:	fdc1                	bnez	a1,7000c7e <_binary_data_result_bin_start+0xc7e>
 7000ce8:	ffe1                	bnez	a5,7000cc0 <_binary_data_result_bin_start+0xcc0>
 7000cea:	ff46                	fsw	fa7,188(sp)
 7000cec:	ff2a                	fsw	fa0,188(sp)
 7000cee:	ff2a                	fsw	fa0,188(sp)
 7000cf0:	ff2a                	fsw	fa0,188(sp)
 7000cf2:	ff2a                	fsw	fa0,188(sp)
 7000cf4:	ff2a                	fsw	fa0,188(sp)
 7000cf6:	ff09febf fc75fef5 	0xfc75fef5ff09febf
 7000cfe:	ffcafebf ff2aff2a 	0xff2aff2affcafebf
 7000d06:	ff2a                	fsw	fa0,188(sp)
 7000d08:	ff2a                	fsw	fa0,188(sp)
 7000d0a:	ff2a                	fsw	fa0,188(sp)
 7000d0c:	ff2a                	fsw	fa0,188(sp)
 7000d0e:	ff2a                	fsw	fa0,188(sp)
 7000d10:	fd4bfd2b          	0xfd4bfd2b
 7000d14:	febffce7          	0xfebffce7
 7000d18:	ff14                	fsw	fa3,56(a4)
 7000d1a:	ff2a                	fsw	fa0,188(sp)
 7000d1c:	ff2a                	fsw	fa0,188(sp)
 7000d1e:	ff2a                	fsw	fa0,188(sp)
 7000d20:	ff2a                	fsw	fa0,188(sp)
 7000d22:	ff2a                	fsw	fa0,188(sp)
 7000d24:	ff2a                	fsw	fa0,188(sp)
 7000d26:	ff24                	fsw	fs1,120(a4)
 7000d28:	fdfa                	fsw	ft10,248(sp)
 7000d2a:	fd68                	fsw	fa0,124(a0)
 7000d2c:	fd92                	fsw	ft4,248(sp)
 7000d2e:	fee5fee7          	0xfee5fee7
 7000d32:	ff2a                	fsw	fa0,188(sp)
 7000d34:	ff2a                	fsw	fa0,188(sp)
 7000d36:	ff2a                	fsw	fa0,188(sp)
 7000d38:	ff2a                	fsw	fa0,188(sp)
 7000d3a:	ff2a                	fsw	fa0,188(sp)
 7000d3c:	ff2a                	fsw	fa0,188(sp)
 7000d3e:	fedf fda7 fba2      	0xfba2fda7fedf
 7000d44:	fd94                	fsw	fa3,56(a1)
 7000d46:	ff88feb7          	lui	t4,0xff88f
 7000d4a:	ff2a                	fsw	fa0,188(sp)
 7000d4c:	ff2a                	fsw	fa0,188(sp)
 7000d4e:	ff2a                	fsw	fa0,188(sp)
 7000d50:	ff2a                	fsw	fa0,188(sp)
 7000d52:	ff2a                	fsw	fa0,188(sp)
 7000d54:	ff2a                	fsw	fa0,188(sp)
 7000d56:	ff7f                	0xff7f
 7000d58:	fe4e                	fsw	fs3,60(sp)
 7000d5a:	0031                	c.nop	12
 7000d5c:	ff2d                	bnez	a4,7000cd6 <_binary_data_result_bin_start+0xcd6>
 7000d5e:	ffa2                	fsw	fs0,252(sp)
 7000d60:	0018                	0x18
 7000d62:	ff2a                	fsw	fa0,188(sp)
 7000d64:	ff2a                	fsw	fa0,188(sp)
 7000d66:	ff2a                	fsw	fa0,188(sp)
 7000d68:	ff2a                	fsw	fa0,188(sp)
 7000d6a:	ff2a                	fsw	fa0,188(sp)
 7000d6c:	ff2a                	fsw	fa0,188(sp)
 7000d6e:	fe28ff1b          	0xfe28ff1b
 7000d72:	fe29                	bnez	a2,7000ccc <_binary_data_result_bin_start+0xccc>
 7000d74:	ff51                	bnez	a4,7000d10 <_binary_data_result_bin_start+0xd10>
 7000d76:	fff8                	fsw	fa4,124(a5)
 7000d78:	ffc1                	bnez	a5,7000d10 <_binary_data_result_bin_start+0xd10>
 7000d7a:	ff2a                	fsw	fa0,188(sp)
 7000d7c:	ff2a                	fsw	fa0,188(sp)
 7000d7e:	ff2a                	fsw	fa0,188(sp)
 7000d80:	ffff                	0xffff
 7000d82:	ffff                	0xffff
 7000d84:	ffff                	0xffff
 7000d86:	ffff                	0xffff
 7000d88:	0055                	c.nop	21
 7000d8a:	009d                	addi	ra,ra,7
 7000d8c:	ffff                	0xffff
 7000d8e:	0066                	c.slli	zero,0x19
 7000d90:	ffff                	0xffff
 7000d92:	ffff                	0xffff
 7000d94:	ffff                	0xffff
 7000d96:	ffff                	0xffff
 7000d98:	ffff                	0xffff
 7000d9a:	ffff                	0xffff
 7000d9c:	ffff                	0xffff
 7000d9e:	0099                	addi	ra,ra,6
 7000da0:	00c0                	addi	s0,sp,68
 7000da2:	01b300cb          	fnmsub.s	ft1,ft6,fs11,ft0,rne
 7000da6:	00a5                	addi	ra,ra,9
 7000da8:	006a                	c.slli	zero,0x1a
 7000daa:	ffff                	0xffff
 7000dac:	ffff                	0xffff
 7000dae:	ffff                	0xffff
 7000db0:	ffff                	0xffff
 7000db2:	ffff                	0xffff
 7000db4:	012d002b          	0x12d002b
 7000db8:	009f00f3          	0x9f00f3
 7000dbc:	013e                	slli	sp,sp,0xf
 7000dbe:	00b600bb          	0xb600bb
 7000dc2:	ffff003b          	0xffff003b
 7000dc6:	ffff                	0xffff
 7000dc8:	ffff                	0xffff
 7000dca:	ffff                	0xffff
 7000dcc:	0048                	addi	a0,sp,4
 7000dce:	0106                	slli	sp,sp,0x1
 7000dd0:	fee5                	bnez	a3,7000dc8 <_binary_data_result_bin_start+0xdc8>
 7000dd2:	00e1                	addi	ra,ra,24
 7000dd4:	00a00023          	sb	a0,0(zero) # 0 <start>
 7000dd8:	00e1                	addi	ra,ra,24
 7000dda:	ffff0057          	0xffff0057
 7000dde:	ffff                	0xffff
 7000de0:	ffff                	0xffff
 7000de2:	ffff                	0xffff
 7000de4:	0022                	c.slli	zero,0x8
 7000de6:	0035009b          	0x35009b
 7000dea:	0168                	addi	a0,sp,140
 7000dec:	014d                	addi	sp,sp,19
 7000dee:	fff8                	fsw	fa4,124(a5)
 7000df0:	0011011b          	0x11011b
 7000df4:	ffff                	0xffff
 7000df6:	ffff                	0xffff
 7000df8:	ffff                	0xffff
 7000dfa:	ffff                	0xffff
 7000dfc:	0015                	c.nop	5
 7000dfe:	ffdc                	fsw	fa5,60(a5)
 7000e00:	0120                	addi	s0,sp,136
 7000e02:	0148                	addi	a0,sp,132
 7000e04:	00d8                	addi	a4,sp,68
 7000e06:	0084                	addi	s1,sp,64
 7000e08:	00fa                	slli	ra,ra,0x1e
 7000e0a:	001f ffff ffff      	0xffffffff001f
 7000e10:	ffff                	0xffff
 7000e12:	ffff                	0xffff
 7000e14:	0012                	c.slli	zero,0x4
 7000e16:	ffb00027          	0xffb00027
 7000e1a:	0142                	slli	sp,sp,0x10
 7000e1c:	ff1f 005f 010e      	0x10e005fff1f
 7000e22:	ffff                	0xffff
 7000e24:	ffff                	0xffff
 7000e26:	ffff                	0xffff
 7000e28:	ffff                	0xffff
 7000e2a:	ffff                	0xffff
 7000e2c:	ffff                	0xffff
 7000e2e:	011e0037          	lui	zero,0x11e0
 7000e32:	ff49                	bnez	a4,7000dcc <_binary_data_result_bin_start+0xdcc>
 7000e34:	0150                	addi	a2,sp,132
 7000e36:	0089                	addi	ra,ra,2
 7000e38:	013e                	slli	sp,sp,0xf
 7000e3a:	ffff                	0xffff
 7000e3c:	ffff                	0xffff
 7000e3e:	ffff                	0xffff
 7000e40:	ffff                	0xffff
 7000e42:	ffff                	0xffff
 7000e44:	ffff                	0xffff
 7000e46:	00b0                	addi	a2,sp,72
 7000e48:	0119                	addi	sp,sp,6
 7000e4a:	feff                	0xfeff
 7000e4c:	004a                	c.slli	zero,0x12
 7000e4e:	00b4                	addi	a3,sp,72
 7000e50:	00fe                	slli	ra,ra,0x1f
 7000e52:	ffff                	0xffff
 7000e54:	ffff                	0xffff
 7000e56:	ffff                	0xffff
 7000e58:	ffff                	0xffff
 7000e5a:	ffff                	0xffff
 7000e5c:	ffff                	0xffff
 7000e5e:	011c                	addi	a5,sp,128
 7000e60:	00e9                	addi	ra,ra,26
 7000e62:	0109                	addi	sp,sp,2
 7000e64:	0139                	addi	sp,sp,14
 7000e66:	00e200fb          	0xe200fb
 7000e6a:	ffff                	0xffff
 7000e6c:	ffff                	0xffff
 7000e6e:	ffff                	0xffff
 7000e70:	ffff                	0xffff
 7000e72:	ffff                	0xffff
 7000e74:	ffff                	0xffff
 7000e76:	00b5                	addi	ra,ra,13
 7000e78:	009affbf 00340078 	0x340078009affbf
 7000e80:	005a                	c.slli	zero,0x16
 7000e82:	ffff                	0xffff
 7000e84:	ffff                	0xffff
 7000e86:	ffff                	0xffff
 7000e88:	ffff                	0xffff
 7000e8a:	ffff                	0xffff
 7000e8c:	ffff                	0xffff
 7000e8e:	0018                	0x18
 7000e90:	feda                	fsw	fs6,124(sp)
 7000e92:	ff84                	fsw	fs1,56(a5)
 7000e94:	00f6005b          	0xf6005b
 7000e98:	00aa                	slli	ra,ra,0xa
 7000e9a:	ffff                	0xffff
 7000e9c:	ffff                	0xffff
 7000e9e:	ffff                	0xffff
 7000ea0:	ff70                	fsw	fa2,124(a4)
 7000ea2:	ff70                	fsw	fa2,124(a4)
 7000ea4:	ff70                	fsw	fa2,124(a4)
 7000ea6:	ff70                	fsw	fa2,124(a4)
 7000ea8:	ff92                	fsw	ft4,252(sp)
 7000eaa:	ff70                	fsw	fa2,124(a4)
 7000eac:	ff70                	fsw	fa2,124(a4)
 7000eae:	ff70                	fsw	fa2,124(a4)
 7000eb0:	ff70                	fsw	fa2,124(a4)
 7000eb2:	ff70                	fsw	fa2,124(a4)
 7000eb4:	ff70                	fsw	fa2,124(a4)
 7000eb6:	ff70                	fsw	fa2,124(a4)
 7000eb8:	ff70                	fsw	fa2,124(a4)
 7000eba:	ff70                	fsw	fa2,124(a4)
 7000ebc:	ff70                	fsw	fa2,124(a4)
 7000ebe:	ff92                	fsw	ft4,252(sp)
 7000ec0:	fde9ff73          	csrrci	t5,0xfde,19
 7000ec4:	fc75                	bnez	s0,7000ec0 <_binary_data_result_bin_start+0xec0>
 7000ec6:	fdb2                	fsw	fa2,248(sp)
 7000ec8:	ff70                	fsw	fa2,124(a4)
 7000eca:	ff70                	fsw	fa2,124(a4)
 7000ecc:	ff70                	fsw	fa2,124(a4)
 7000ece:	ff70                	fsw	fa2,124(a4)
 7000ed0:	ff70                	fsw	fa2,124(a4)
 7000ed2:	ff70                	fsw	fa2,124(a4)
 7000ed4:	ff8a                	fsw	ft2,252(sp)
 7000ed6:	ff95                	bnez	a5,7000e12 <_binary_data_result_bin_start+0xe12>
 7000ed8:	013cff13          	andi	t5,s9,19
 7000edc:	fd5ffff7          	0xfd5ffff7
 7000ee0:	fdec                	fsw	fa1,124(a1)
 7000ee2:	ff70                	fsw	fa2,124(a4)
 7000ee4:	ff70                	fsw	fa2,124(a4)
 7000ee6:	ff70                	fsw	fa2,124(a4)
 7000ee8:	ff70                	fsw	fa2,124(a4)
 7000eea:	ff70                	fsw	fa2,124(a4)
 7000eec:	ffb1                	bnez	a5,7000e48 <_binary_data_result_bin_start+0xe48>
 7000eee:	00f0                	addi	a2,sp,76
 7000ef0:	02210057          	0x2210057
 7000ef4:	01ff                	0x1ff
 7000ef6:	fdf0                	fsw	fa2,124(a1)
 7000ef8:	fe0d                	bnez	a2,7000e32 <_binary_data_result_bin_start+0xe32>
 7000efa:	ff70                	fsw	fa2,124(a4)
 7000efc:	ff70                	fsw	fa2,124(a4)
 7000efe:	ff70                	fsw	fa2,124(a4)
 7000f00:	ff70                	fsw	fa2,124(a4)
 7000f02:	ff70                	fsw	fa2,124(a4)
 7000f04:	02970033          	mul	zero,a4,s1
 7000f08:	ff95                	bnez	a5,7000e44 <_binary_data_result_bin_start+0xe44>
 7000f0a:	ff90                	fsw	fa2,56(a5)
 7000f0c:	ff28018f          	0xff28018f
 7000f10:	fec8                	fsw	fa0,60(a3)
 7000f12:	ff70ff83          	0xff70ff83
 7000f16:	ff70                	fsw	fa2,124(a4)
 7000f18:	ff70                	fsw	fa2,124(a4)
 7000f1a:	ff70                	fsw	fa2,124(a4)
 7000f1c:	0044                	addi	s1,sp,4
 7000f1e:	0375                	addi	t1,t1,29
 7000f20:	018e                	slli	gp,gp,0x3
 7000f22:	fed5fd4f          	fnmadd.q	fs10,fa1,fa3,ft11
 7000f26:	fe50                	fsw	fa2,60(a2)
 7000f28:	ff95                	bnez	a5,7000e64 <_binary_data_result_bin_start+0xe64>
 7000f2a:	ff70                	fsw	fa2,124(a4)
 7000f2c:	ff70                	fsw	fa2,124(a4)
 7000f2e:	ff70                	fsw	fa2,124(a4)
 7000f30:	ff70                	fsw	fa2,124(a4)
 7000f32:	ff70                	fsw	fa2,124(a4)
 7000f34:	ffbe                	fsw	fa5,252(sp)
 7000f36:	0391                	addi	t2,t2,4
 7000f38:	03c8                	addi	a0,sp,452
 7000f3a:	0048                	addi	a0,sp,4
 7000f3c:	007e                	c.slli	zero,0x1f
 7000f3e:	fdf1                	bnez	a1,7000f1a <_binary_data_result_bin_start+0xf1a>
 7000f40:	ff4e                	fsw	fs3,188(sp)
 7000f42:	ff70                	fsw	fa2,124(a4)
 7000f44:	ff70                	fsw	fa2,124(a4)
 7000f46:	ff70                	fsw	fa2,124(a4)
 7000f48:	ff70                	fsw	fa2,124(a4)
 7000f4a:	ff70                	fsw	fa2,124(a4)
 7000f4c:	ff70                	fsw	fa2,124(a4)
 7000f4e:	0082                	c.slli64	ra
 7000f50:	02c6                	slli	t0,t0,0x11
 7000f52:	01d2                	slli	gp,gp,0x14
 7000f54:	fdec                	fsw	fa1,124(a1)
 7000f56:	ff0bfd3b          	0xff0bfd3b
 7000f5a:	ff70                	fsw	fa2,124(a4)
 7000f5c:	ff70                	fsw	fa2,124(a4)
 7000f5e:	ff70                	fsw	fa2,124(a4)
 7000f60:	ff70                	fsw	fa2,124(a4)
 7000f62:	ff70                	fsw	fa2,124(a4)
 7000f64:	ff70                	fsw	fa2,124(a4)
 7000f66:	ffa0                	fsw	fs0,120(a5)
 7000f68:	00a2                	slli	ra,ra,0x8
 7000f6a:	0181                	addi	gp,gp,0
 7000f6c:	fdde0137          	lui	sp,0xfdde0
 7000f70:	feb9                	bnez	a3,7000ece <_binary_data_result_bin_start+0xece>
 7000f72:	ff70                	fsw	fa2,124(a4)
 7000f74:	ff70                	fsw	fa2,124(a4)
 7000f76:	ff70                	fsw	fa2,124(a4)
 7000f78:	ff70                	fsw	fa2,124(a4)
 7000f7a:	ff70                	fsw	fa2,124(a4)
 7000f7c:	ff70                	fsw	fa2,124(a4)
 7000f7e:	0070                	addi	a2,sp,12
 7000f80:	00ba                	slli	ra,ra,0xe
 7000f82:	ff56                	fsw	fs5,188(sp)
 7000f84:	ffca                	fsw	fs2,252(sp)
 7000f86:	ff84fcc7          	fmsub.q	fs9,fs1,fs8,ft11
 7000f8a:	ff70                	fsw	fa2,124(a4)
 7000f8c:	ff70                	fsw	fa2,124(a4)
 7000f8e:	ff70                	fsw	fa2,124(a4)
 7000f90:	ff70                	fsw	fa2,124(a4)
 7000f92:	ff70                	fsw	fa2,124(a4)
 7000f94:	ff70                	fsw	fa2,124(a4)
 7000f96:	01f8                	addi	a4,sp,204
 7000f98:	030c                	addi	a1,sp,384
 7000f9a:	ffdd                	bnez	a5,7000f58 <_binary_data_result_bin_start+0xf58>
 7000f9c:	00f201c3          	fmadd.s	ft3,ft4,fa5,ft0,rne
 7000fa0:	ffa1                	bnez	a5,7000ef8 <_binary_data_result_bin_start+0xef8>
 7000fa2:	ff70                	fsw	fa2,124(a4)
 7000fa4:	ff70                	fsw	fa2,124(a4)
 7000fa6:	ff70                	fsw	fa2,124(a4)
 7000fa8:	ff70                	fsw	fa2,124(a4)
 7000faa:	ff70                	fsw	fa2,124(a4)
 7000fac:	ff70                	fsw	fa2,124(a4)
 7000fae:	02f5                	addi	t0,t0,29
 7000fb0:	038c                	addi	a1,sp,448
 7000fb2:	0301                	addi	t1,t1,0
 7000fb4:	0290                	addi	a2,sp,320
 7000fb6:	ff70ff07          	0xff70ff07
 7000fba:	ff70                	fsw	fa2,124(a4)
 7000fbc:	ff70                	fsw	fa2,124(a4)
 7000fbe:	ff70                	fsw	fa2,124(a4)
 7000fc0:	ff56                	fsw	fs5,188(sp)
 7000fc2:	ff56                	fsw	fs5,188(sp)
 7000fc4:	ff56                	fsw	fs5,188(sp)
 7000fc6:	ff56                	fsw	fs5,188(sp)
 7000fc8:	ffbdff77          	0xffbdff77
 7000fcc:	ff56                	fsw	fs5,188(sp)
 7000fce:	ff59                	bnez	a4,7000f6c <_binary_data_result_bin_start+0xf6c>
 7000fd0:	ff56                	fsw	fs5,188(sp)
 7000fd2:	ff56                	fsw	fs5,188(sp)
 7000fd4:	ff56                	fsw	fs5,188(sp)
 7000fd6:	ff56                	fsw	fs5,188(sp)
 7000fd8:	ff56                	fsw	fs5,188(sp)
 7000fda:	ff56                	fsw	fs5,188(sp)
 7000fdc:	ff56                	fsw	fs5,188(sp)
 7000fde:	ffd4                	fsw	fa3,60(a5)
 7000fe0:	0058008b          	0x58008b
 7000fe4:	ff65                	bnez	a4,7000fdc <_binary_data_result_bin_start+0xfdc>
 7000fe6:	ff57fe9b          	0xff57fe9b
 7000fea:	ff56                	fsw	fs5,188(sp)
 7000fec:	ff56                	fsw	fs5,188(sp)
 7000fee:	ff56                	fsw	fs5,188(sp)
 7000ff0:	ff56                	fsw	fs5,188(sp)
 7000ff2:	ff56                	fsw	fs5,188(sp)
 7000ff4:	ff61                	bnez	a4,7000fcc <_binary_data_result_bin_start+0xfcc>
 7000ff6:	0176                	slli	sp,sp,0x1d
 7000ff8:	0111                	addi	sp,sp,4
 7000ffa:	03a5                	addi	t2,t2,9
 7000ffc:	02d904cb          	fnmsub.d	fs1,fs2,fa3,ft0,rne
 7001000:	fed5                	bnez	a3,7000fbc <_binary_data_result_bin_start+0xfbc>
 7001002:	ff56ff57          	0xff56ff57
 7001006:	ff56                	fsw	fs5,188(sp)
 7001008:	ff56                	fsw	fs5,188(sp)
 700100a:	ff56                	fsw	fs5,188(sp)
 700100c:	ffb4                	fsw	fa3,120(a5)
 700100e:	02b8                	addi	a4,sp,328
 7001010:	02e2                	slli	t0,t0,0x18
 7001012:	05c2                	slli	a1,a1,0x10
 7001014:	0676                	slli	a2,a2,0x1d
 7001016:	03a0                	addi	s0,sp,456
 7001018:	00c8                	addi	a0,sp,68
 700101a:	ff56                	fsw	fs5,188(sp)
 700101c:	ff56                	fsw	fs5,188(sp)
 700101e:	ff56                	fsw	fs5,188(sp)
 7001020:	ff56                	fsw	fs5,188(sp)
 7001022:	ff56                	fsw	fs5,188(sp)
 7001024:	001f 03c5 03fa      	0x3fa03c5001f
 700102a:	028d                	addi	t0,t0,3
 700102c:	038c056b          	0x38c056b
 7001030:	000c011b          	0xc011b
 7001034:	ff56                	fsw	fs5,188(sp)
 7001036:	ff56                	fsw	fs5,188(sp)
 7001038:	ff56                	fsw	fs5,188(sp)
 700103a:	ff56                	fsw	fs5,188(sp)
 700103c:	035efffb          	0x35efffb
 7001040:	0479                	addi	s0,s0,30
 7001042:	01b0045b          	0x1b0045b
 7001046:	01cd                	addi	gp,gp,19
 7001048:	ffdc01e3          	beq	s8,t4,700102a <_binary_data_result_bin_start+0x102a>
 700104c:	ff56                	fsw	fs5,188(sp)
 700104e:	ff56                	fsw	fs5,188(sp)
 7001050:	ff56                	fsw	fs5,188(sp)
 7001052:	ff56                	fsw	fs5,188(sp)
 7001054:	02c2ff83          	0x2c2ff83
 7001058:	071504fb          	0x71504fb
 700105c:	022a068f          	0x22a068f
 7001060:	0210                	addi	a2,sp,256
 7001062:	ff56                	fsw	fs5,188(sp)
 7001064:	ff56                	fsw	fs5,188(sp)
 7001066:	ff56                	fsw	fs5,188(sp)
 7001068:	ff56                	fsw	fs5,188(sp)
 700106a:	ff56                	fsw	fs5,188(sp)
 700106c:	ff56                	fsw	fs5,188(sp)
 700106e:	fffc                	fsw	fa5,124(a5)
 7001070:	0498                	addi	a4,sp,576
 7001072:	0708                	addi	a0,sp,896
 7001074:	071f 02f6 ff7f      	0xff7f02f6071f
 700107a:	ff56                	fsw	fs5,188(sp)
 700107c:	ff56                	fsw	fs5,188(sp)
 700107e:	ff56                	fsw	fs5,188(sp)
 7001080:	ff56                	fsw	fs5,188(sp)
 7001082:	ff56                	fsw	fs5,188(sp)
 7001084:	ff56                	fsw	fs5,188(sp)
 7001086:	fffa                	fsw	ft10,252(sp)
 7001088:	0432026f          	jal	tp,70218ca <_binary_data_result_bin_end+0x2024a>
 700108c:	0689                	addi	a3,a3,2
 700108e:	0452                	slli	s0,s0,0x14
 7001090:	0060                	addi	s0,sp,12
 7001092:	ff56                	fsw	fs5,188(sp)
 7001094:	ff56                	fsw	fs5,188(sp)
 7001096:	ff56                	fsw	fs5,188(sp)
 7001098:	ff56                	fsw	fs5,188(sp)
 700109a:	ff56                	fsw	fs5,188(sp)
 700109c:	ff56                	fsw	fs5,188(sp)
 700109e:	01b1                	addi	gp,gp,12
 70010a0:	02f1                	addi	t0,t0,28
 70010a2:	061f039b          	0x61f039b
 70010a6:	015f02d7          	0x15f02d7
 70010aa:	ff56                	fsw	fs5,188(sp)
 70010ac:	ff56                	fsw	fs5,188(sp)
 70010ae:	ff56                	fsw	fs5,188(sp)
 70010b0:	ff56                	fsw	fs5,188(sp)
 70010b2:	ff56                	fsw	fs5,188(sp)
 70010b4:	ff56                	fsw	fs5,188(sp)
 70010b6:	0230                	addi	a2,sp,264
 70010b8:	0455                	addi	s0,s0,21
 70010ba:	04430497          	auipc	s1,0x4430
 70010be:	0374                	addi	a3,sp,396
 70010c0:	ff56024b          	fnmsub.q	ft4,fa2,fs5,ft11,rne
 70010c4:	ff56                	fsw	fs5,188(sp)
 70010c6:	ff56                	fsw	fs5,188(sp)
 70010c8:	ff56                	fsw	fs5,188(sp)
 70010ca:	ff56                	fsw	fs5,188(sp)
 70010cc:	ff56                	fsw	fs5,188(sp)
 70010ce:	01cc                	addi	a1,sp,196
 70010d0:	0454                	addi	a3,sp,516
 70010d2:	0691                	addi	a3,a3,4
 70010d4:	0397060b          	0x397060b
 70010d8:	ff560083          	lb	ra,-11(a2)
 70010dc:	ff56                	fsw	fs5,188(sp)
 70010de:	ff56                	fsw	fs5,188(sp)
 70010e0:	00970097          	auipc	ra,0x970
 70010e4:	00970097          	auipc	ra,0x970
 70010e8:	00ee                	slli	ra,ra,0x1b
 70010ea:	013c                	addi	a5,sp,136
 70010ec:	016c                	addi	a1,sp,140
 70010ee:	00970097          	auipc	ra,0x970
 70010f2:	00970097          	auipc	ra,0x970
 70010f6:	00970097          	auipc	ra,0x970
 70010fa:	00970097          	auipc	ra,0x970
 70010fe:	0190                	addi	a2,sp,192
 7001100:	01c6                	slli	gp,gp,0x11
 7001102:	031d                	addi	t1,t1,7
 7001104:	01ae0267          	jalr	tp,26(t3) # 1201a <_binary_data_result_bin_size+0x1099a>
 7001108:	00970097          	auipc	ra,0x970
 700110c:	00970097          	auipc	ra,0x970
 7001110:	00970097          	auipc	ra,0x970
 7001114:	00c5                	addi	ra,ra,17
 7001116:	016601c7          	fmsub.s	ft3,fa2,fs6,ft0,rne
 700111a:	0214                	addi	a3,sp,256
 700111c:	00da                	slli	ra,ra,0x16
 700111e:	00c9                	addi	ra,ra,18
 7001120:	01a1                	addi	gp,gp,8
 7001122:	00970097          	auipc	ra,0x970
 7001126:	00970097          	auipc	ra,0x970
 700112a:	010a0097          	auipc	ra,0x10a0
 700112e:	0159                	addi	sp,sp,22
 7001130:	ff8a                	fsw	ft2,252(sp)
 7001132:	fd06                	fsw	ft1,184(sp)
 7001134:	fede                	fsw	fs7,124(sp)
 7001136:	0045                	c.nop	17
 7001138:	00aa                	slli	ra,ra,0xa
 700113a:	00970097          	auipc	ra,0x970
 700113e:	00970097          	auipc	ra,0x970
 7001142:	00b00097          	auipc	ra,0xb00
 7001146:	0081                	addi	ra,ra,0
 7001148:	fed4                	fsw	fa3,60(a3)
 700114a:	011d                	addi	sp,sp,7
 700114c:	0084                	addi	s1,sp,64
 700114e:	ff78                	fsw	fa4,124(a4)
 7001150:	ffbe                	fsw	fa5,252(sp)
 7001152:	00970097          	auipc	ra,0x970
 7001156:	00970097          	auipc	ra,0x970
 700115a:	00970097          	auipc	ra,0x970
 700115e:	ff44ff03          	0xff44ff03
 7001162:	01c2                	slli	gp,gp,0x10
 7001164:	0104                	addi	s1,sp,128
 7001166:	ff30                	fsw	fa2,120(a4)
 7001168:	ffd9                	bnez	a5,7001106 <_binary_data_result_bin_start+0x1106>
 700116a:	00970097          	auipc	ra,0x970
 700116e:	00970097          	auipc	ra,0x970
 7001172:	00970097          	auipc	ra,0x970
 7001176:	0056                	c.slli	zero,0x15
 7001178:	fe5e                	fsw	fs7,60(sp)
 700117a:	ff39                	bnez	a4,70010d8 <_binary_data_result_bin_start+0x10d8>
 700117c:	ffad                	bnez	a5,70010f6 <_binary_data_result_bin_start+0x10f6>
 700117e:	ff70                	fsw	fa2,124(a4)
 7001180:	0088                	addi	a0,sp,64
 7001182:	00970097          	auipc	ra,0x970
 7001186:	00970097          	auipc	ra,0x970
 700118a:	00970097          	auipc	ra,0x970
 700118e:	00ac                	addi	a1,sp,72
 7001190:	013d                	addi	sp,sp,15
 7001192:	fe29                	bnez	a2,70010ec <_binary_data_result_bin_start+0x10ec>
 7001194:	fe75                	bnez	a2,7001190 <_binary_data_result_bin_start+0x1190>
 7001196:	00ba                	slli	ra,ra,0xe
 7001198:	0084                	addi	s1,sp,64
 700119a:	00970097          	auipc	ra,0x970
 700119e:	00970097          	auipc	ra,0x970
 70011a2:	00970097          	auipc	ra,0x970
 70011a6:	01b4                	addi	a3,sp,200
 70011a8:	015a                	slli	sp,sp,0x16
 70011aa:	ff80                	fsw	fs0,56(a5)
 70011ac:	fd7d                	bnez	a0,70011aa <_binary_data_result_bin_start+0x11aa>
 70011ae:	0055                	c.nop	21
 70011b0:	0052                	c.slli	zero,0x14
 70011b2:	00970097          	auipc	ra,0x970
 70011b6:	00970097          	auipc	ra,0x970
 70011ba:	00970097          	auipc	ra,0x970
 70011be:	01a9                	addi	gp,gp,10
 70011c0:	0050                	addi	a2,sp,4
 70011c2:	003d                	c.nop	15
 70011c4:	fea1                	bnez	a3,700111c <_binary_data_result_bin_start+0x111c>
 70011c6:	ff80                	fsw	fs0,56(a5)
 70011c8:	ffde                	fsw	fs7,252(sp)
 70011ca:	00970097          	auipc	ra,0x970
 70011ce:	00970097          	auipc	ra,0x970
 70011d2:	00970097          	auipc	ra,0x970
 70011d6:	00e9                	addi	ra,ra,26
 70011d8:	fef4ff8b          	0xfef4ff8b
 70011dc:	fee5                	bnez	a3,70011d4 <_binary_data_result_bin_start+0x11d4>
 70011de:	fe2d                	bnez	a2,7001158 <_binary_data_result_bin_start+0x1158>
 70011e0:	0081                	addi	ra,ra,0
 70011e2:	00970097          	auipc	ra,0x970
 70011e6:	00970097          	auipc	ra,0x970
 70011ea:	00970097          	auipc	ra,0x970
 70011ee:	0022                	c.slli	zero,0x8
 70011f0:	fd91                	bnez	a1,700110c <_binary_data_result_bin_start+0x110c>
 70011f2:	fbfe                	fsw	ft11,244(sp)
 70011f4:	fed6                	fsw	fs5,124(sp)
 70011f6:	00970087          	0x970087
 70011fa:	00970097          	auipc	ra,0x970
 70011fe:	fea90097          	auipc	ra,0xfea90
 7001202:	fea9                	bnez	a3,700115c <_binary_data_result_bin_start+0x115c>
 7001204:	fea9                	bnez	a3,700115e <_binary_data_result_bin_start+0x115e>
 7001206:	fea9                	bnez	a3,7001160 <_binary_data_result_bin_start+0x1160>
 7001208:	00e3ff33          	and	t5,t2,a4
 700120c:	005e                	c.slli	zero,0x17
 700120e:	003d                	c.nop	15
 7001210:	fea9                	bnez	a3,700116a <_binary_data_result_bin_start+0x116a>
 7001212:	fea9                	bnez	a3,700116c <_binary_data_result_bin_start+0x116c>
 7001214:	fea9                	bnez	a3,700116e <_binary_data_result_bin_start+0x116e>
 7001216:	fea9                	bnez	a3,7001170 <_binary_data_result_bin_start+0x1170>
 7001218:	fea9                	bnez	a3,7001172 <_binary_data_result_bin_start+0x1172>
 700121a:	fea9                	bnez	a3,7001174 <_binary_data_result_bin_start+0x1174>
 700121c:	fea9                	bnez	a3,7001176 <_binary_data_result_bin_start+0x1176>
 700121e:	ffe8                	fsw	fa0,124(a5)
 7001220:	031e                	slli	t1,t1,0x7
 7001222:	0645                	addi	a2,a2,17
 7001224:	06dc                	addi	a5,sp,836
 7001226:	031d                	addi	t1,t1,7
 7001228:	fea9ffdb          	0xfea9ffdb
 700122c:	fea9                	bnez	a3,7001186 <_binary_data_result_bin_start+0x1186>
 700122e:	fea9                	bnez	a3,7001188 <_binary_data_result_bin_start+0x1188>
 7001230:	fea9                	bnez	a3,700118a <_binary_data_result_bin_start+0x118a>
 7001232:	fea9                	bnez	a3,700118c <_binary_data_result_bin_start+0x118c>
 7001234:	fedf 025c 0391      	0x391025cfedf
 700123a:	05f20373          	0x5f20373
 700123e:	020e062b          	0x20e062b
 7001242:	fea9fef7          	0xfea9fef7
 7001246:	fea9                	bnez	a3,70011a0 <_binary_data_result_bin_start+0x11a0>
 7001248:	fea9                	bnez	a3,70011a2 <_binary_data_result_bin_start+0x11a2>
 700124a:	fea9                	bnez	a3,70011a4 <_binary_data_result_bin_start+0x11a4>
 700124c:	fee8                	fsw	fa0,124(a3)
 700124e:	0250                	addi	a2,sp,260
 7001250:	0122                	slli	sp,sp,0x8
 7001252:	fe3d                	bnez	a2,70011d0 <_binary_data_result_bin_start+0x11d0>
 7001254:	fc5c                	fsw	fa5,60(s0)
 7001256:	034702d3          	fadd.d	ft5,fa4,fs4,rne
 700125a:	ff36                	fsw	fa3,188(sp)
 700125c:	fea9                	bnez	a3,70011b6 <_binary_data_result_bin_start+0x11b6>
 700125e:	fea9                	bnez	a3,70011b8 <_binary_data_result_bin_start+0x11b8>
 7001260:	fea9                	bnez	a3,70011ba <_binary_data_result_bin_start+0x11ba>
 7001262:	fea9                	bnez	a3,70011bc <_binary_data_result_bin_start+0x11bc>
 7001264:	feca                	fsw	fs2,124(sp)
 7001266:	ffa0                	fsw	fs0,120(a5)
 7001268:	00e9                	addi	ra,ra,26
 700126a:	024d                	addi	tp,tp,19
 700126c:	025f ff2f 0030      	0x30ff2f025f
 7001272:	fea9feeb          	0xfea9feeb
 7001276:	fea9                	bnez	a3,70011d0 <_binary_data_result_bin_start+0x11d0>
 7001278:	fea9                	bnez	a3,70011d2 <_binary_data_result_bin_start+0x11d2>
 700127a:	fea9                	bnez	a3,70011d4 <_binary_data_result_bin_start+0x11d4>
 700127c:	fea9                	bnez	a3,70011d6 <_binary_data_result_bin_start+0x11d6>
 700127e:	fcba                	fsw	fa4,120(sp)
 7001280:	017e                	slli	sp,sp,0x1f
 7001282:	06d4                	addi	a3,sp,836
 7001284:	0621                	addi	a2,a2,8
 7001286:	ff30                	fsw	fa2,120(a4)
 7001288:	feee                	fsw	fs11,124(sp)
 700128a:	fea9                	bnez	a3,70011e4 <_binary_data_result_bin_start+0x11e4>
 700128c:	fea9                	bnez	a3,70011e6 <_binary_data_result_bin_start+0x11e6>
 700128e:	fea9                	bnez	a3,70011e8 <_binary_data_result_bin_start+0x11e8>
 7001290:	fea9                	bnez	a3,70011ea <_binary_data_result_bin_start+0x11ea>
 7001292:	fea9                	bnez	a3,70011ec <_binary_data_result_bin_start+0x11ec>
 7001294:	fea9                	bnez	a3,70011ee <_binary_data_result_bin_start+0x11ee>
 7001296:	fe3d                	bnez	a2,7001214 <_binary_data_result_bin_start+0x1214>
 7001298:	fb36                	fsw	fa3,180(sp)
 700129a:	03f2                	slli	t2,t2,0x1c
 700129c:	0421                	addi	s0,s0,8
 700129e:	0078                	addi	a4,sp,12
 70012a0:	ff6e                	fsw	fs11,188(sp)
 70012a2:	fea9                	bnez	a3,70011fc <_binary_data_result_bin_start+0x11fc>
 70012a4:	fea9                	bnez	a3,70011fe <_binary_data_result_bin_start+0x11fe>
 70012a6:	fea9                	bnez	a3,7001200 <_binary_data_result_bin_start+0x1200>
 70012a8:	fea9                	bnez	a3,7001202 <_binary_data_result_bin_start+0x1202>
 70012aa:	fea9                	bnez	a3,7001204 <_binary_data_result_bin_start+0x1204>
 70012ac:	fea9                	bnez	a3,7001206 <_binary_data_result_bin_start+0x1206>
 70012ae:	febe                	fsw	fa5,124(sp)
 70012b0:	ffbc                	fsw	fa5,120(a5)
 70012b2:	fe25                	bnez	a2,700122a <_binary_data_result_bin_start+0x122a>
 70012b4:	0225                	addi	tp,tp,9
 70012b6:	01ea                	slli	gp,gp,0x1a
 70012b8:	017d                	addi	sp,sp,31
 70012ba:	fea9                	bnez	a3,7001214 <_binary_data_result_bin_start+0x1214>
 70012bc:	fea9                	bnez	a3,7001216 <_binary_data_result_bin_start+0x1216>
 70012be:	fea9                	bnez	a3,7001218 <_binary_data_result_bin_start+0x1218>
 70012c0:	fea9                	bnez	a3,700121a <_binary_data_result_bin_start+0x121a>
 70012c2:	fea9                	bnez	a3,700121c <_binary_data_result_bin_start+0x121c>
 70012c4:	fea9                	bnez	a3,700121e <_binary_data_result_bin_start+0x121e>
 70012c6:	ff9f 01c8 ff46      	0xff4601c8ff9f
 70012cc:	020aff37          	lui	t5,0x20af
 70012d0:	0229                	addi	tp,tp,10
 70012d2:	fea9                	bnez	a3,700122c <_binary_data_result_bin_start+0x122c>
 70012d4:	fea9                	bnez	a3,700122e <_binary_data_result_bin_start+0x122e>
 70012d6:	fea9                	bnez	a3,7001230 <_binary_data_result_bin_start+0x1230>
 70012d8:	fea9                	bnez	a3,7001232 <_binary_data_result_bin_start+0x1232>
 70012da:	fea9                	bnez	a3,7001234 <_binary_data_result_bin_start+0x1234>
 70012dc:	fea9                	bnez	a3,7001236 <_binary_data_result_bin_start+0x1236>
 70012de:	0085                	addi	ra,ra,1
 70012e0:	041d01c3          	0x41d01c3
 70012e4:	02f8                	addi	a4,sp,332
 70012e6:	ff5e                	fsw	fs7,188(sp)
 70012e8:	00a6                	slli	ra,ra,0x9
 70012ea:	fea9                	bnez	a3,7001244 <_binary_data_result_bin_start+0x1244>
 70012ec:	fea9                	bnez	a3,7001246 <_binary_data_result_bin_start+0x1246>
 70012ee:	fea9                	bnez	a3,7001248 <_binary_data_result_bin_start+0x1248>
 70012f0:	fea9                	bnez	a3,700124a <_binary_data_result_bin_start+0x124a>
 70012f2:	fea9                	bnez	a3,700124c <_binary_data_result_bin_start+0x124c>
 70012f4:	fea9                	bnez	a3,700124e <_binary_data_result_bin_start+0x124e>
 70012f6:	ffccffbf 01640306 	0x1640306ffccffbf
 70012fe:	fd5c                	fsw	fa5,60(a0)
 7001300:	fe71                	bnez	a2,70012dc <_binary_data_result_bin_start+0x12dc>
 7001302:	fea9                	bnez	a3,700125c <_binary_data_result_bin_start+0x125c>
 7001304:	fea9                	bnez	a3,700125e <_binary_data_result_bin_start+0x125e>
 7001306:	fea9                	bnez	a3,7001260 <_binary_data_result_bin_start+0x1260>
 7001308:	fea9                	bnez	a3,7001262 <_binary_data_result_bin_start+0x1262>
 700130a:	fea9                	bnez	a3,7001264 <_binary_data_result_bin_start+0x1264>
 700130c:	fea9                	bnez	a3,7001266 <_binary_data_result_bin_start+0x1266>
 700130e:	fe18                	fsw	fa4,56(a2)
 7001310:	fa2c                	fsw	fa1,112(a2)
 7001312:	f8f9                	bnez	s1,70012e8 <_binary_data_result_bin_start+0x12e8>
 7001314:	fb71                	bnez	a4,70012e8 <_binary_data_result_bin_start+0x12e8>
 7001316:	fde9                	bnez	a1,70012f0 <_binary_data_result_bin_start+0x12f0>
 7001318:	fea9                	bnez	a3,7001272 <_binary_data_result_bin_start+0x1272>
 700131a:	fea9                	bnez	a3,7001274 <_binary_data_result_bin_start+0x1274>
 700131c:	fea9                	bnez	a3,7001276 <_binary_data_result_bin_start+0x1276>
 700131e:	fea9                	bnez	a3,7001278 <_binary_data_result_bin_start+0x1278>
 7001320:	001f 001f 001f      	0x1f001f001f
 7001326:	001f 001f 005d      	0x5d001f001f
 700132c:	00f2                	slli	ra,ra,0x1c
 700132e:	001f 001f 001f      	0x1f001f001f
 7001334:	001f 001f 001f      	0x1f001f001f
 700133a:	001f 001f 001f      	0x1f001f001f
 7001340:	02d8                	addi	a4,sp,324
 7001342:	018c042f          	0x18c042f
 7001346:	001fffc7          	fmsub.s	ft11,ft11,ft1,ft0
 700134a:	001f 001f 001f      	0x1f001f001f
 7001350:	001f 001f 001f      	0x1f001f001f
 7001356:	05ef0343          	0x5ef0343
 700135a:	feea03db          	0xfeea03db
 700135e:	ff74                	fsw	fa3,124(a4)
 7001360:	ffe2                	fsw	fs8,252(sp)
 7001362:	001f 001f 001f      	0x1f001f001f
 7001368:	001f 001f 0065      	0x65001f001f
 700136e:	04f5                	addi	s1,s1,29
 7001370:	ffcd03cb          	fnmsub.q	ft7,fs10,ft8,ft11,rne
 7001374:	fffa                	fsw	ft10,252(sp)
 7001376:	fea6ff83          	0xfea6ff83
 700137a:	001f 001f 001f      	0x1f001f001f
 7001380:	001f 001f 00e1      	0xe1001f001f
 7001386:	0311                	addi	t1,t1,4
 7001388:	fd9d                	bnez	a1,70012c6 <_binary_data_result_bin_start+0x12c6>
 700138a:	0474002f          	0x474002f
 700138e:	00a0                	addi	s0,sp,72
 7001390:	ffc1                	bnez	a5,7001328 <_binary_data_result_bin_start+0x1328>
 7001392:	001f0053          	fadd.s	ft0,ft10,ft1,rne
 7001396:	001f 001f 001f      	0x1f001f001f
 700139c:	00ca                	slli	ra,ra,0x12
 700139e:	0252                	slli	tp,tp,0x14
 70013a0:	feec                	fsw	fa1,124(a3)
 70013a2:	04120197          	auipc	gp,0x4120
 70013a6:	fc04                	fsw	fs1,56(s0)
 70013a8:	00fe                	slli	ra,ra,0x1f
 70013aa:	0065                	c.nop	25
 70013ac:	001f 001f 001f      	0x1f001f001f
 70013b2:	001f 001f 0093      	0x93001f001f
 70013b8:	0028                	addi	a0,sp,8
 70013ba:	023d                	addi	tp,tp,15
 70013bc:	00ca                	slli	ra,ra,0x12
 70013be:	fe88                	fsw	fa0,56(a3)
 70013c0:	00e5                	addi	ra,ra,25
 70013c2:	001f 001f 001f      	0x1f001f001f
 70013c8:	001f 001f 001f      	0x1f001f001f
 70013ce:	001f 02ae 0309      	0x30902ae001f
 70013d4:	fccd                	bnez	s1,700138e <_binary_data_result_bin_start+0x138e>
 70013d6:	001dff0b          	0x1dff0b
 70013da:	001f 001f 001f      	0x1f001f001f
 70013e0:	001f 001f 001f      	0x1f001f001f
 70013e6:	054f002b          	0x54f002b
 70013ea:	ff160327          	0xff160327
 70013ee:	ff5a                	fsw	fs6,188(sp)
 70013f0:	ff8d                	bnez	a5,700132a <_binary_data_result_bin_start+0x132a>
 70013f2:	001f 001f 001f      	0x1f001f001f
 70013f8:	001f 001f 001f      	0x1f001f001f
 70013fe:	04cd02ab          	0x4cd02ab
 7001402:	fd9c                	fsw	fa5,56(a1)
 7001404:	fe8303fb          	0xfe8303fb
 7001408:	0099                	addi	ra,ra,6
 700140a:	001f 001f 001f      	0x1f001f001f
 7001410:	001f 001f 001f      	0x1f001f001f
 7001416:	03b0                	addi	a2,sp,456
 7001418:	039a                	slli	t2,t2,0x6
 700141a:	00ba                	slli	ra,ra,0xe
 700141c:	0279                	addi	tp,tp,30
 700141e:	fee9                	bnez	a3,70013f8 <_binary_data_result_bin_start+0x13f8>
 7001420:	0116                	slli	sp,sp,0x5
 7001422:	001f 001f 001f      	0x1f001f001f
 7001428:	001f 001f 001f      	0x1f001f001f
 700142e:	ffa101eb          	0xffa101eb
 7001432:	0046fcd7          	0x46fcd7
 7001436:	012e                	slli	sp,sp,0xb
 7001438:	00fc                	addi	a5,sp,76
 700143a:	001f 001f 001f      	0x1f001f001f
 7001440:	00ec                	addi	a1,sp,76
 7001442:	00ec                	addi	a1,sp,76
 7001444:	00ec                	addi	a1,sp,76
 7001446:	00ec                	addi	a1,sp,76
 7001448:	00ec                	addi	a1,sp,76
 700144a:	014b0197          	auipc	gp,0x14b0
 700144e:	00ec                	addi	a1,sp,76
 7001450:	00ec                	addi	a1,sp,76
 7001452:	00ec                	addi	a1,sp,76
 7001454:	00ec                	addi	a1,sp,76
 7001456:	00ec                	addi	a1,sp,76
 7001458:	00ec                	addi	a1,sp,76
 700145a:	00ec                	addi	a1,sp,76
 700145c:	00ec                	addi	a1,sp,76
 700145e:	00ec                	addi	a1,sp,76
 7001460:	0139                	addi	sp,sp,14
 7001462:	0129                	addi	sp,sp,10
 7001464:	002dffb7          	lui	t6,0x2df
 7001468:	00ec                	addi	a1,sp,76
 700146a:	00ec                	addi	a1,sp,76
 700146c:	00ec                	addi	a1,sp,76
 700146e:	00ec                	addi	a1,sp,76
 7001470:	00ec                	addi	a1,sp,76
 7001472:	00ec                	addi	a1,sp,76
 7001474:	00ec                	addi	a1,sp,76
 7001476:	00d8                	addi	a4,sp,68
 7001478:	002d                	c.nop	11
 700147a:	fbd6                	fsw	fs5,244(sp)
 700147c:	fc88                	fsw	fa0,56(s1)
 700147e:	fe22                	fsw	fs0,60(sp)
 7001480:	0056                	c.slli	zero,0x15
 7001482:	00ec                	addi	a1,sp,76
 7001484:	00ec                	addi	a1,sp,76
 7001486:	00ec                	addi	a1,sp,76
 7001488:	00ec                	addi	a1,sp,76
 700148a:	00ec                	addi	a1,sp,76
 700148c:	00ec                	addi	a1,sp,76
 700148e:	0066                	c.slli	zero,0x19
 7001490:	00a1fd7b          	0xa1fd7b
 7001494:	0130                	addi	a2,sp,136
 7001496:	fee5feb7          	lui	t4,0xfee5f
 700149a:	00ec                	addi	a1,sp,76
 700149c:	00ec                	addi	a1,sp,76
 700149e:	00ec                	addi	a1,sp,76
 70014a0:	00ec                	addi	a1,sp,76
 70014a2:	00ec                	addi	a1,sp,76
 70014a4:	00ec                	addi	a1,sp,76
 70014a6:	0024                	addi	s1,sp,8
 70014a8:	fda8                	fsw	fa0,120(a1)
 70014aa:	0028                	addi	a0,sp,8
 70014ac:	01b4                	addi	a3,sp,200
 70014ae:	fef5                	bnez	a3,70014aa <_binary_data_result_bin_start+0x14aa>
 70014b0:	002e                	c.slli	zero,0xb
 70014b2:	010d                	addi	sp,sp,3
 70014b4:	00ec                	addi	a1,sp,76
 70014b6:	00ec                	addi	a1,sp,76
 70014b8:	00ec                	addi	a1,sp,76
 70014ba:	00ec                	addi	a1,sp,76
 70014bc:	0101                	addi	sp,sp,0
 70014be:	0158                	addi	a4,sp,132
 70014c0:	fe88                	fsw	fa0,56(a3)
 70014c2:	fdc1                	bnez	a1,700145a <_binary_data_result_bin_start+0x145a>
 70014c4:	fe02                	fsw	ft0,60(sp)
 70014c6:	01b0fd9b          	0x1b0fd9b
 70014ca:	0128                	addi	a0,sp,136
 70014cc:	00ec                	addi	a1,sp,76
 70014ce:	00ec                	addi	a1,sp,76
 70014d0:	00ec                	addi	a1,sp,76
 70014d2:	00ec                	addi	a1,sp,76
 70014d4:	00ec                	addi	a1,sp,76
 70014d6:	01ae0213          	addi	tp,t3,26
 70014da:	fc5eff07          	0xfc5eff07
 70014de:	0161ff77          	0x161ff77
 70014e2:	00ec                	addi	a1,sp,76
 70014e4:	00ec                	addi	a1,sp,76
 70014e6:	00ec                	addi	a1,sp,76
 70014e8:	00ec                	addi	a1,sp,76
 70014ea:	00ec                	addi	a1,sp,76
 70014ec:	00ec                	addi	a1,sp,76
 70014ee:	00f1                	addi	ra,ra,28
 70014f0:	024a                	slli	tp,tp,0x12
 70014f2:	ffda                	fsw	fs6,252(sp)
 70014f4:	fcbc                	fsw	fa5,120(s1)
 70014f6:	fead                	bnez	a3,7001470 <_binary_data_result_bin_start+0x1470>
 70014f8:	00cd                	addi	ra,ra,19
 70014fa:	00ec                	addi	a1,sp,76
 70014fc:	00ec                	addi	a1,sp,76
 70014fe:	00ec                	addi	a1,sp,76
 7001500:	00ec                	addi	a1,sp,76
 7001502:	00ec                	addi	a1,sp,76
 7001504:	00ec                	addi	a1,sp,76
 7001506:	00ea                	slli	ra,ra,0x1a
 7001508:	00e0                	addi	s0,sp,76
 700150a:	fe20                	fsw	fs0,120(a2)
 700150c:	ff62                	fsw	fs8,188(sp)
 700150e:	ffbcfe27          	0xffbcfe27
 7001512:	00ec                	addi	a1,sp,76
 7001514:	00ec                	addi	a1,sp,76
 7001516:	00ec                	addi	a1,sp,76
 7001518:	00ec                	addi	a1,sp,76
 700151a:	00ec                	addi	a1,sp,76
 700151c:	00ec                	addi	a1,sp,76
 700151e:	00d1                	addi	ra,ra,20
 7001520:	0022                	c.slli	zero,0x8
 7001522:	fdda                	fsw	fs6,248(sp)
 7001524:	0080                	addi	s0,sp,64
 7001526:	0112fd77          	0x112fd77
 700152a:	00ec                	addi	a1,sp,76
 700152c:	00ec                	addi	a1,sp,76
 700152e:	00ec                	addi	a1,sp,76
 7001530:	00ec                	addi	a1,sp,76
 7001532:	00ec                	addi	a1,sp,76
 7001534:	00ec                	addi	a1,sp,76
 7001536:	00bd                	addi	ra,ra,15
 7001538:	fb55fea7          	0xfb55fea7
 700153c:	fe50                	fsw	fa2,60(a2)
 700153e:	016d                	addi	sp,sp,27
 7001540:	01dc                	addi	a5,sp,196
 7001542:	00ec                	addi	a1,sp,76
 7001544:	00ec                	addi	a1,sp,76
 7001546:	00ec                	addi	a1,sp,76
 7001548:	00ec                	addi	a1,sp,76
 700154a:	00ec                	addi	a1,sp,76
 700154c:	00ec                	addi	a1,sp,76
 700154e:	01de01ab          	0x1de01ab
 7001552:	0352                	slli	t1,t1,0x14
 7001554:	0359                	addi	t1,t1,22
 7001556:	0271                	addi	tp,tp,28
 7001558:	0169                	addi	sp,sp,26
 700155a:	00ec                	addi	a1,sp,76
 700155c:	00ec                	addi	a1,sp,76
 700155e:	00ec                	addi	a1,sp,76
 7001560:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 7001564:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 7001568:	ff91                	bnez	a5,7001484 <_binary_data_result_bin_start+0x1484>
 700156a:	00ce                	slli	ra,ra,0x13
 700156c:	00a8                	addi	a0,sp,72
 700156e:	ff9e                	fsw	ft7,252(sp)
 7001570:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 7001574:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 7001578:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 700157c:	ffdcff43          	fmadd.q	ft10,fs9,ft9,ft11
 7001580:	0261                	addi	tp,tp,24
 7001582:	0394                	addi	a3,sp,448
 7001584:	0338                	addi	a4,sp,392
 7001586:	ff99ffeb          	0xff99ffeb
 700158a:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 700158e:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 7001592:	ff63ff43          	fmadd.q	ft10,ft7,fs6,ft11
 7001596:	01a9                	addi	gp,gp,10
 7001598:	0508                	addi	a0,sp,640
 700159a:	02020337          	lui	t1,0x2020
 700159e:	ff2e                	fsw	fa1,188(sp)
 70015a0:	ffb2                	fsw	fa2,252(sp)
 70015a2:	ff6a                	fsw	fs10,188(sp)
 70015a4:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 70015a8:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 70015ac:	ff59                	bnez	a4,700154a <_binary_data_result_bin_start+0x154a>
 70015ae:	0782056f          	jal	a0,7021626 <_binary_data_result_bin_end+0x1ffa6>
 70015b2:	0353ff07          	0x353ff07
 70015b6:	fe0b01ef          	jal	gp,6fb1d96 <_binary_data_result_bin_size+0x6fb0716>
 70015ba:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 70015be:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 70015c2:	ff92ff43          	fmadd.q	ft10,ft5,fs9,ft11
 70015c6:	0650                	addi	a2,sp,772
 70015c8:	ff2206ab          	0xff2206ab
 70015cc:	05c5                	addi	a1,a1,17
 70015ce:	0538                	addi	a4,sp,648
 70015d0:	fc8c                	fsw	fa1,56(s1)
 70015d2:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 70015d6:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 70015da:	ffa4ff43          	fmadd.q	ft10,fs1,fs10,ft11
 70015de:	0432                	slli	s0,s0,0xc
 70015e0:	03e4                	addi	s1,sp,460
 70015e2:	ffbc                	fsw	fa5,120(a5)
 70015e4:	0755                	addi	a4,a4,21
 70015e6:	fe31049b          	0xfe31049b
 70015ea:	ff51                	bnez	a4,7001586 <_binary_data_result_bin_start+0x1586>
 70015ec:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 70015f0:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 70015f4:	ff86                	fsw	ft1,252(sp)
 70015f6:	01b4                	addi	a3,sp,200
 70015f8:	03230313          	addi	t1,t1,50 # 2020032 <_binary_data_result_bin_size+0x201e9b2>
 70015fc:	037a                	slli	t1,t1,0x1e
 70015fe:	fd18                	fsw	fa4,56(a0)
 7001600:	ff59                	bnez	a4,700159e <_binary_data_result_bin_start+0x159e>
 7001602:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 7001606:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 700160a:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 700160e:	0022                	c.slli	zero,0x8
 7001610:	06810377          	0x6810377
 7001614:	02d6                	slli	t0,t0,0x15
 7001616:	fc60                	fsw	fs0,124(s0)
 7001618:	ff94                	fsw	fa3,56(a5)
 700161a:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 700161e:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 7001622:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 7001626:	ffac                	fsw	fa1,120(a5)
 7001628:	06f2064b          	fnmsub.q	fa2,ft4,fa5,ft0,rne
 700162c:	00ed                	addi	ra,ra,27
 700162e:	fff0                	fsw	fa2,124(a5)
 7001630:	ff49                	bnez	a4,70015ca <_binary_data_result_bin_start+0x15ca>
 7001632:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 7001636:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 700163a:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 700163e:	00b9                	addi	ra,ra,14
 7001640:	07e1                	addi	a5,a5,24
 7001642:	0573056f          	jal	a0,7031e98 <_binary_data_result_bin_end+0x30818>
 7001646:	0288                	addi	a0,sp,320
 7001648:	fe1c                	fsw	fa5,56(a2)
 700164a:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 700164e:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 7001652:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 7001656:	065601d3          	fadd.q	ft3,fa2,ft5,rne
 700165a:	0035                	c.nop	13
 700165c:	0288                	addi	a0,sp,320
 700165e:	fe0c                	fsw	fa1,56(a2)
 7001660:	ff50                	fsw	fa2,60(a4)
 7001662:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 7001666:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 700166a:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 700166e:	01e1                	addi	gp,gp,24
 7001670:	03c4                	addi	s1,sp,452
 7001672:	fdaaff0b          	0xfdaaff0b
 7001676:	ff62                	fsw	fs8,188(sp)
 7001678:	ff4e                	fsw	fs3,188(sp)
 700167a:	ff43ff43          	fmadd.q	ft10,ft7,fs4,ft11
 700167e:	          	fmadd.s	ft10,ft1,ft0,ft0

Disassembly of section .input.weight:

08000000 <_binary_riscv32_obj_data_sw_conv_weight_bin_start>:
 8000000:	ff9eff73          	csrrci	t5,0xff9,29
 8000004:	00ad                	addi	ra,ra,11
 8000006:	fe64ff97          	auipc	t6,0xfe64f
 800000a:	fefa                	fsw	ft10,124(sp)
 800000c:	00e1ff97          	auipc	t6,0xe1f
 8000010:	0105                	addi	sp,sp,1
 8000012:	fefe                	fsw	ft11,124(sp)
 8000014:	fead                	bnez	a3,7ffff8e <_binary_data_result_bin_end+0xffe90e>
 8000016:	ffd2                	fsw	fs4,252(sp)
 8000018:	0150                	addi	a2,sp,132
 800001a:	017f                	0x17f
 800001c:	ff2d                	bnez	a4,7ffff96 <_binary_data_result_bin_end+0xffe916>
 800001e:	004c                	addi	a1,sp,4
 8000020:	ff8c                	fsw	fa1,56(a5)
 8000022:	01e6fff7          	0x1e6fff7
 8000026:	00ce                	slli	ra,ra,0x13
 8000028:	0120                	addi	s0,sp,136
 800002a:	ff98                	fsw	fa4,56(a5)
 800002c:	00730123          	sb	t2,2(t1)
 8000030:	0168                	addi	a0,sp,140
 8000032:	00f0                	addi	a2,sp,76
 8000034:	ffe9                	bnez	a5,800000e <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0xe>
 8000036:	0058fee7          	0x58fee7
 800003a:	0110                	addi	a2,sp,128
 800003c:	0113ffe7          	0x113ffe7
 8000040:	feb5                	bnez	a3,7ffffbc <_binary_data_result_bin_end+0xffe93c>
 8000042:	fea6                	fsw	fs1,124(sp)
 8000044:	fedc                	fsw	fa5,60(a3)
 8000046:	ff76                	fsw	ft9,188(sp)
 8000048:	00390043          	fmadd.s	ft0,fs2,ft3,ft0,rne
 800004c:	fe7a                	fsw	ft10,60(sp)
 800004e:	ff26                	fsw	fs1,188(sp)
 8000050:	ff26                	fsw	fs1,188(sp)
 8000052:	fef8                	fsw	fa4,124(a3)
 8000054:	ff8e                	fsw	ft3,252(sp)
 8000056:	ff5f ff56 fef2      	0xfef2ff56ff5f
 800005c:	0099                	addi	ra,ra,6
 800005e:	0036                	c.slli	zero,0xd
 8000060:	00b9                	addi	ra,ra,14
 8000062:	ff10                	fsw	fa2,56(a4)
 8000064:	0018                	0x18
 8000066:	0054                	addi	a3,sp,4
 8000068:	ffad                	bnez	a5,7ffffe2 <_binary_data_result_bin_end+0xffe962>
 800006a:	ffa0                	fsw	fs0,120(a5)
 800006c:	0135                	addi	sp,sp,13
 800006e:	00ae                	slli	ra,ra,0xb
 8000070:	fff9ff63          	bgeu	s3,t6,7fff86e <_binary_data_result_bin_end+0xffe1ee>
 8000074:	00f4                	addi	a3,sp,76
 8000076:	ffb401b3          	0xffb401b3
 800007a:	0022                	c.slli	zero,0x8
 800007c:	fe99                	bnez	a3,7ffff9a <_binary_data_result_bin_end+0xffe91a>
 800007e:	014f013f 00d00071 	0xd00071014f013f
 8000086:	ff2d                	bnez	a4,8000000 <_binary_riscv32_obj_data_sw_conv_weight_bin_start>
 8000088:	ff9c                	fsw	fa5,56(a5)
 800008a:	0130                	addi	a2,sp,136
 800008c:	0119                	addi	sp,sp,6
 800008e:	ffde                	fsw	fs7,252(sp)
 8000090:	ff7d                	bnez	a4,800008e <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x8e>
 8000092:	ff09                	bnez	a4,7ffffac <_binary_data_result_bin_end+0xffe92c>
 8000094:	ffd6                	fsw	fs5,252(sp)
 8000096:	0052                	c.slli	zero,0x14
 8000098:	ff5d0103          	lb	sp,-11(s10)
 800009c:	fee0                	fsw	fs0,124(a3)
 800009e:	fee9                	bnez	a3,8000078 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x78>
 80000a0:	00e9                	addi	ra,ra,26
 80000a2:	0186                	slli	gp,gp,0x1
 80000a4:	0214                	addi	a3,sp,256
 80000a6:	01de                	slli	gp,gp,0x17
 80000a8:	0148                	addi	a0,sp,132
 80000aa:	0261                	addi	tp,tp,24
 80000ac:	0250                	addi	a2,sp,260
 80000ae:	017e                	slli	sp,sp,0x1f
 80000b0:	0142012f          	0x142012f
 80000b4:	007701b7          	lui	gp,0x770
 80000b8:	ff6c                	fsw	fa1,124(a4)
 80000ba:	febd                	bnez	a3,8000038 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x38>
 80000bc:	0051                	c.nop	20
 80000be:	ff95                	bnez	a5,7fffffa <_binary_data_result_bin_end+0xffe97a>
 80000c0:	fe21                	bnez	a2,8000018 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x18>
 80000c2:	fdb1                	bnez	a1,800001e <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x1e>
 80000c4:	003afe2f          	0x3afe2f
 80000c8:	fe3c                	fsw	fa5,120(a2)
 80000ca:	fe1c                	fsw	fa5,56(a2)
 80000cc:	ff91ffdb          	0xff91ffdb
 80000d0:	ff60                	fsw	fs0,124(a4)
 80000d2:	0009                	c.nop	2
 80000d4:	0046                	c.slli	zero,0x11
 80000d6:	ffeb00eb          	0xffeb00eb
 80000da:	00ba                	slli	ra,ra,0xe
 80000dc:	ff5f feec 0102      	0x102feecff5f
 80000e2:	00a5                	addi	ra,ra,9
 80000e4:	fee0007b          	0xfee0007b
 80000e8:	008efff7          	0x8efff7
 80000ec:	01250133          	add	sp,a0,s2
 80000f0:	0051                	c.nop	20
 80000f2:	0060                	addi	s0,sp,12
 80000f4:	00d6                	slli	ra,ra,0x15
 80000f6:	00ad                	addi	ra,ra,11
 80000f8:	0164                	addi	s1,sp,140
 80000fa:	ff3affbb          	0xff3affbb
 80000fe:	0139                	addi	sp,sp,14
 8000100:	0072                	c.slli	zero,0x1c
 8000102:	00cd                	addi	ra,ra,19
 8000104:	0035                	c.nop	13
 8000106:	ff04ff97          	auipc	t6,0xff04f
 800010a:	002a                	c.slli	zero,0xa
 800010c:	00f5007b          	0xf5007b
 8000110:	ff2c                	fsw	fa1,120(a4)
 8000112:	003fff87          	0x3fff87
 8000116:	ffb4                	fsw	fa3,120(a5)
 8000118:	010c                	addi	a1,sp,128
 800011a:	ff2a                	fsw	fa0,188(sp)
 800011c:	ff7e                	fsw	ft11,188(sp)
 800011e:	ff30                	fsw	fa2,120(a4)
 8000120:	fef1                	bnez	a3,80000fc <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0xfc>
 8000122:	002a                	c.slli	zero,0xa
 8000124:	ff01                	bnez	a4,800003c <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x3c>
 8000126:	fec5                	bnez	a3,80000de <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0xde>
 8000128:	ff0a                	fsw	ft2,188(sp)
 800012a:	ff12                	fsw	ft4,188(sp)
 800012c:	005c                	addi	a5,sp,4
 800012e:	00e5                	addi	ra,ra,25
 8000130:	00e2                	slli	ra,ra,0x18
 8000132:	fff4                	fsw	fa3,124(a5)
 8000134:	014a00ab          	0x14a00ab
 8000138:	ff9e                	fsw	ft7,252(sp)
 800013a:	ffa5                	bnez	a5,80000b2 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0xb2>
 800013c:	fefc                	fsw	fa5,124(a3)
 800013e:	ff15                	bnez	a4,800007a <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x7a>
 8000140:	0131                	addi	sp,sp,12
 8000142:	003e                	c.slli	zero,0xf
 8000144:	00da                	slli	ra,ra,0x16
 8000146:	00dd                	addi	ra,ra,23
 8000148:	016e                	slli	sp,sp,0x1b
 800014a:	00ba                	slli	ra,ra,0xe
 800014c:	ff55                	bnez	a4,8000108 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x108>
 800014e:	ff85                	bnez	a5,8000086 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x86>
 8000150:	ffa100d3          	0xffa100d3
 8000154:	0068                	addi	a0,sp,12
 8000156:	ff44                	fsw	fs1,60(a4)
 8000158:	00a1                	addi	ra,ra,8
 800015a:	fefe00af          	0xfefe00af
 800015e:	002aff87          	0x2aff87
 8000162:	0081                	addi	ra,ra,0
 8000164:	00f6                	slli	ra,ra,0x1d
 8000166:	ffb2                	fsw	fa2,252(sp)
 8000168:	ffba                	fsw	fa4,252(sp)
 800016a:	ff9d                	bnez	a5,80000a8 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0xa8>
 800016c:	0032                	c.slli	zero,0xc
 800016e:	0120012b          	0x120012b
 8000172:	fef1                	bnez	a3,800014e <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x14e>
 8000174:	ff5d                	bnez	a4,8000132 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x132>
 8000176:	ff8e                	fsw	ft3,252(sp)
 8000178:	0176                	slli	sp,sp,0x1d
 800017a:	0014                	0x14
 800017c:	fe97006f          	j	7f71164 <_binary_data_result_bin_end+0xf6fae4>
 8000180:	ff41                	bnez	a4,8000118 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x118>
 8000182:	00d1                	addi	ra,ra,20
 8000184:	ffb60107          	0xffb60107
 8000188:	fe62                	fsw	fs8,60(sp)
 800018a:	0153ffd7          	0x153ffd7
 800018e:	00c4                	addi	s1,sp,68
 8000190:	fef0                	fsw	fa2,124(a3)
 8000192:	ffc5                	bnez	a5,800014a <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x14a>
 8000194:	000e                	c.slli	zero,0x3
 8000196:	008d                	addi	ra,ra,3
 8000198:	00a7ffd7          	0xa7ffd7
 800019c:	00f1                	addi	ra,ra,28
 800019e:	0066                	c.slli	zero,0x19
 80001a0:	ff41                	bnez	a4,8000138 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x138>
 80001a2:	0042                	c.slli	zero,0x10
 80001a4:	fee5                	bnez	a3,800019c <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x19c>
 80001a6:	fe92                	fsw	ft4,124(sp)
 80001a8:	fede                	fsw	fs7,124(sp)
 80001aa:	ffa1                	bnez	a5,8000102 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x102>
 80001ac:	ffcd                	bnez	a5,8000166 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x166>
 80001ae:	0011                	c.nop	4
 80001b0:	fe88                	fsw	fa0,56(a3)
 80001b2:	00acff47          	fmsub.s	ft10,fs9,fa0,ft0
 80001b6:	0095                	addi	ra,ra,5
 80001b8:	00fe                	slli	ra,ra,0x1f
 80001ba:	00cc                	addi	a1,sp,68
 80001bc:	0004                	0x4
 80001be:	ffb6                	fsw	fa3,252(sp)
 80001c0:	0180                	addi	s0,sp,192
 80001c2:	01bf01ef          	jal	gp,80f09dc <_binary_riscv32_obj_data_sw_conv_data_bin_end+0x1742c>
 80001c6:	01ae                	slli	gp,gp,0xb
 80001c8:	00cc                	addi	a1,sp,68
 80001ca:	025c0197          	auipc	gp,0x25c0
 80001ce:	0191                	addi	gp,gp,4
 80001d0:	0082                	c.slli64	ra
 80001d2:	009d                	addi	ra,ra,7
 80001d4:	ff80                	fsw	fs0,56(a5)
 80001d6:	019a                	slli	gp,gp,0x6
 80001d8:	01bd018b          	0x1bd018b
 80001dc:	00e2                	slli	ra,ra,0x18
 80001de:	017f                	0x17f
 80001e0:	0010                	0x10
 80001e2:	00d9                	addi	ra,ra,22
 80001e4:	ffcb0047          	fmsub.q	ft0,fs6,ft8,ft11,rne
 80001e8:	018c                	addi	a1,sp,192
 80001ea:	ff15                	bnez	a4,8000126 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x126>
 80001ec:	ff1e                	fsw	ft7,188(sp)
 80001ee:	004e                	c.slli	zero,0x13
 80001f0:	0082                	c.slli64	ra
 80001f2:	ff41                	bnez	a4,800018a <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x18a>
 80001f4:	ff4a                	fsw	fs2,188(sp)
 80001f6:	ffb2                	fsw	fa2,252(sp)
 80001f8:	fe9c                	fsw	fa5,56(a3)
 80001fa:	ff38ff87          	0xff38ff87
 80001fe:	ff5c                	fsw	fa5,60(a4)
 8000200:	ffcfff43          	fmadd.q	ft10,ft11,ft8,ft11
 8000204:	febc                	fsw	fa5,120(a3)
 8000206:	ff82                	fsw	ft0,252(sp)
 8000208:	0015                	c.nop	5
 800020a:	002affbb          	0x2affbb
 800020e:	ffdf 0063 0027      	0x270063ffdf
 8000214:	ff6e                	fsw	fs11,188(sp)
 8000216:	0051ffc3          	fmadd.s	ft11,ft3,ft5,ft0
 800021a:	ff7a                	fsw	ft10,188(sp)
 800021c:	ff76                	fsw	ft9,188(sp)
 800021e:	ff0c                	fsw	fa1,56(a4)
 8000220:	ffd4                	fsw	fa3,60(a5)
 8000222:	0105                	addi	sp,sp,1
 8000224:	0048                	addi	a0,sp,4
 8000226:	feb1                	bnez	a3,8000182 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x182>
 8000228:	0072                	c.slli	zero,0x1c
 800022a:	ffe5                	bnez	a5,8000222 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x222>
 800022c:	00da0143          	fmadd.s	ft2,fs4,fa3,ft0,rne
 8000230:	0084ff63          	bgeu	s1,s0,800024e <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x24e>
 8000234:	003d00f7          	0x3d00f7
 8000238:	ff74                	fsw	fa3,124(a4)
 800023a:	ff01                	bnez	a4,8000152 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x152>
 800023c:	ff2a                	fsw	fa0,188(sp)
 800023e:	007800bf feb2ff36 	0xfeb2ff36007800bf
 8000246:	fec8                	fsw	fa0,60(a3)
 8000248:	ff54                	fsw	fa3,60(a4)
 800024a:	0046                	c.slli	zero,0x11
 800024c:	0001                	nop
 800024e:	fffc                	fsw	fa5,124(a5)
 8000250:	00b300cf          	fnmadd.s	ft1,ft6,fa1,ft0,rne
 8000254:	0031ff13          	andi	t5,gp,3
 8000258:	00fe                	slli	ra,ra,0x1f
 800025a:	003a                	c.slli	zero,0xe
 800025c:	00a8ff33          	and	t5,a7,a0
 8000260:	ffaa                	fsw	fa0,252(sp)
 8000262:	ffbd                	bnez	a5,80001e0 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x1e0>
 8000264:	ffe6                	fsw	fs9,252(sp)
 8000266:	ffc6                	fsw	fa7,252(sp)
 8000268:	ff3a                	fsw	fa4,188(sp)
 800026a:	feea000f          	0xfeea000f
 800026e:	ff4d                	bnez	a4,8000228 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x228>
 8000270:	ffff                	0xffff
 8000272:	009200db          	0x9200db
 8000276:	ff9d                	bnez	a5,80001b4 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x1b4>
 8000278:	ffcc                	fsw	fa1,60(a5)
 800027a:	ff19005b          	0xff19005b
 800027e:	ff08                	fsw	fa0,56(a4)
 8000280:	fffe                	fsw	ft11,252(sp)
 8000282:	feff                	0xfeff
 8000284:	0079ff93          	andi	t6,s3,7
 8000288:	00de                	slli	ra,ra,0x17
 800028a:	ff2d000f          	0xff2d000f
 800028e:	007f                	0x7f
 8000290:	001c                	0x1c
 8000292:	ff8e                	fsw	ft3,252(sp)
 8000294:	0080                	addi	s0,sp,64
 8000296:	00dc                	addi	a5,sp,68
 8000298:	ffe4                	fsw	fs1,124(a5)
 800029a:	ff4900c3          	fmadd.q	ft1,fs2,fs4,ft11,rne
 800029e:	ff79                	bnez	a4,800027c <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x27c>
 80002a0:	0006                	c.slli	zero,0x1
 80002a2:	00a6                	slli	ra,ra,0x9
 80002a4:	ff70                	fsw	fa2,124(a4)
 80002a6:	ff45                	bnez	a4,800025e <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x25e>
 80002a8:	ff7e                	fsw	ft11,188(sp)
 80002aa:	ff60                	fsw	fs0,124(a4)
 80002ac:	016e018f          	0x16e018f
 80002b0:	00a2                	slli	ra,ra,0x8
 80002b2:	007e                	c.slli	zero,0x1f
 80002b4:	00ea                	slli	ra,ra,0x1a
 80002b6:	009effef          	jal	t6,80efabe <_binary_riscv32_obj_data_sw_conv_data_bin_end+0x1650e>
 80002ba:	00b1                	addi	ra,ra,12
 80002bc:	ff70                	fsw	fa2,124(a4)
 80002be:	ff95                	bnez	a5,80001fa <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x1fa>
 80002c0:	ffcd                	bnez	a5,800027a <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x27a>
 80002c2:	0121                	addi	sp,sp,8
 80002c4:	febd                	bnez	a3,8000242 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x242>
 80002c6:	ffaa                	fsw	fa0,252(sp)
 80002c8:	ff4c                	fsw	fa1,60(a4)
 80002ca:	ff86                	fsw	ft1,252(sp)
 80002cc:	ff75                	bnez	a4,80002c8 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x2c8>
 80002ce:	fedd                	bnez	a3,800028c <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x28c>
 80002d0:	ffe4                	fsw	fs1,124(a5)
 80002d2:	ffbe                	fsw	fa5,252(sp)
 80002d4:	ff30                	fsw	fa2,120(a4)
 80002d6:	0064                	addi	s1,sp,12
 80002d8:	ff56                	fsw	fs5,188(sp)
 80002da:	0139                	addi	sp,sp,14
 80002dc:	013700bf 00d20119 	0xd20119013700bf
 80002e4:	00160137          	lui	sp,0x160
 80002e8:	013e                	slli	sp,sp,0xf
 80002ea:	ffad                	bnez	a5,8000264 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x264>
 80002ec:	002e00f3          	0x2e00f3
 80002f0:	0007ffab          	0x7ffab
 80002f4:	ff96                	fsw	ft5,252(sp)
 80002f6:	00a4                	addi	s1,sp,72
 80002f8:	feb4                	fsw	fa3,120(a3)
 80002fa:	0060                	addi	s0,sp,12
 80002fc:	0031                	c.nop	12
 80002fe:	0040                	addi	s0,sp,4
 8000300:	0086                	slli	ra,ra,0x1
 8000302:	0006                	c.slli	zero,0x1
 8000304:	ff76                	fsw	ft9,188(sp)
 8000306:	ffa6                	fsw	fs1,252(sp)
 8000308:	0082                	c.slli64	ra
 800030a:	002c                	addi	a1,sp,8
 800030c:	fff80097          	auipc	ra,0xfff80
 8000310:	ff90                	fsw	fa2,56(a5)
 8000312:	fefc                	fsw	fa5,124(a3)
 8000314:	ff57fed7          	0xff57fed7
 8000318:	ffb1ff3b          	0xffb1ff3b
 800031c:	febc                	fsw	fa5,120(a3)
 800031e:	ffd4                	fsw	fa3,60(a5)
 8000320:	ff88                	fsw	fa0,56(a5)
 8000322:	ff82                	fsw	ft0,252(sp)
 8000324:	ffdf 00e9 00bd      	0xbd00e9ffdf
 800032a:	ff4d                	bnez	a4,80002e4 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x2e4>
 800032c:	0089                	addi	ra,ra,2
 800032e:	0050                	addi	a2,sp,4
 8000330:	ffce                	fsw	fs3,252(sp)
 8000332:	ff5c                	fsw	fa5,60(a4)
 8000334:	00f8                	addi	a4,sp,76
 8000336:	ff41                	bnez	a4,80002ce <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x2ce>
 8000338:	012a                	slli	sp,sp,0xa
 800033a:	001d                	c.nop	7
 800033c:	ffec                	fsw	fa1,124(a5)
 800033e:	00ad                	addi	ra,ra,11
 8000340:	fea9                	bnez	a3,800029a <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x29a>
 8000342:	ff25                	bnez	a4,80002ba <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x2ba>
 8000344:	fe60                	fsw	fs0,124(a2)
 8000346:	fe76                	fsw	ft9,60(sp)
 8000348:	febd                	bnez	a3,80002c6 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x2c6>
 800034a:	fed8                	fsw	fa4,60(a3)
 800034c:	ffdc008f          	0xffdc008f
 8000350:	feaeff33          	0xfeaeff33
 8000354:	ffe6                	fsw	fs9,252(sp)
 8000356:	0110                	addi	a2,sp,128
 8000358:	00cc                	addi	a1,sp,68
 800035a:	006a0037          	lui	zero,0x6a0
 800035e:	ffe2                	fsw	fs8,252(sp)
 8000360:	00c3ffdb          	0xc3ffdb
 8000364:	010e                	slli	sp,sp,0x3
 8000366:	019d                	addi	gp,gp,7
 8000368:	0012                	c.slli	zero,0x4
 800036a:	0130                	addi	a2,sp,136
 800036c:	00c8                	addi	a0,sp,68
 800036e:	0070                	addi	a2,sp,12
 8000370:	0189                	addi	gp,gp,2
 8000372:	00cd                	addi	ra,ra,19
 8000374:	001f 0108 005b      	0x5b0108001f
 800037a:	fedf fe9b ffd0      	0xffd0fe9bfedf
 8000380:	feebffe3          	bgeu	s7,a4,800037e <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x37e>
 8000384:	fdff                	0xfdff
 8000386:	ff1f 0195 ffa2      	0xffa20195ff1f
 800038c:	ffe9fe2f          	0xffe9fe2f
 8000390:	01410137          	lui	sp,0x1410
 8000394:	ff6a                	fsw	fs10,188(sp)
 8000396:	ffca                	fsw	fs2,252(sp)
 8000398:	0171003b          	0x171003b
 800039c:	0000                	unimp
 800039e:	fffa                	fsw	ft10,252(sp)
 80003a0:	ffdc                	fsw	fa5,60(a5)
 80003a2:	00f9                	addi	ra,ra,30
 80003a4:	ffdc                	fsw	fa5,60(a5)
 80003a6:	ffca                	fsw	fs2,252(sp)
 80003a8:	00ec                	addi	a1,sp,76
 80003aa:	008a                	slli	ra,ra,0x2
 80003ac:	fff8                	fsw	fa4,124(a5)
 80003ae:	0040                	addi	s0,sp,4
 80003b0:	0180                	addi	s0,sp,192
 80003b2:	fff0                	fsw	fa2,124(a5)
 80003b4:	0091                	addi	ra,ra,4
 80003b6:	00b8                	addi	a4,sp,72
 80003b8:	ff45                	bnez	a4,8000370 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x370>
 80003ba:	ff14                	fsw	fa3,56(a4)
 80003bc:	0078                	addi	a4,sp,12
 80003be:	fecc                	fsw	fa1,60(a3)
 80003c0:	feb4                	fsw	fa3,120(a3)
 80003c2:	fed0                	fsw	fa2,60(a3)
 80003c4:	fe88                	fsw	fa0,56(a3)
 80003c6:	ff7d                	bnez	a4,80003c4 <_binary_riscv32_obj_data_sw_conv_weight_bin_start+0x3c4>
 80003c8:	ff22                	fsw	fs0,188(sp)
 80003ca:	fe90ff67          	0xfe90ff67
 80003ce:	005a                	c.slli	zero,0x16
 80003d0:	ff92                	fsw	ft4,252(sp)
 80003d2:	ffac                	fsw	fa1,120(a5)
 80003d4:	0009                	c.nop	2
 80003d6:	00bc0003          	lb	zero,11(s8)
 80003da:	ff43ffdb          	0xff43ffdb
 80003de:	005f fe74 ff97      	0xff97fe74005f
 80003e4:	009c                	addi	a5,sp,64
 80003e6:	013a                	slli	sp,sp,0xe
 80003e8:	fe75fea7          	0xfe75fea7
 80003ec:	00c9                	addi	ra,ra,18
 80003ee:	01b9                	addi	gp,gp,14
 80003f0:	0009                	c.nop	2
 80003f2:	fee5fed7          	0xfee5fed7
 80003f6:	0042                	c.slli	zero,0x10
 80003f8:	00bd                	addi	ra,ra,15
 80003fa:	0018                	0x18
 80003fc:	002a                	c.slli	zero,0xa
 80003fe:	0005                	c.nop	1
 8000400:	00d8                	addi	a4,sp,68
 8000402:	ffbf0113          	addi	sp,t5,-5 # 20aeffb <_binary_data_result_bin_size+0x20ad97b>
 8000406:	006e                	c.slli	zero,0x1b
 8000408:	010cffdb          	0x10cffdb
 800040c:	007900c7          	fmsub.s	ft1,fs2,ft7,ft0,rne

Disassembly of section .input.data:

080d8f90 <_binary_riscv32_obj_data_sw_conv_data_bin_start>:
	...
 80d90c0:	0054                	addi	a3,sp,4
 80d90c2:	0212                	slli	tp,tp,0x4
 80d90c4:	0400                	addi	s0,sp,512
 80d90c6:	0202                	c.slli64	tp
	...
 80d90f4:	0000                	unimp
 80d90f6:	0161                	addi	sp,sp,24
 80d90f8:	03f80377          	0x3f80377
 80d90fc:	03f8                	addi	a4,sp,460
 80d90fe:	03d4                	addi	a3,sp,452
 80d9100:	00c1                	addi	ra,ra,16
	...
 80d912a:	0000                	unimp
 80d912c:	0125                	addi	sp,sp,9
 80d912e:	03ec                	addi	a1,sp,460
 80d9130:	03f8                	addi	a4,sp,460
 80d9132:	0266                	slli	tp,tp,0x19
 80d9134:	01fa                	slli	gp,gp,0x1e
 80d9136:	03f8                	addi	a4,sp,460
 80d9138:	0145034b          	fnmsub.s	ft6,fa0,fs4,ft0,rne
	...
 80d9164:	03f80313          	addi	t1,a6,63
 80d9168:	0226                	slli	tp,tp,0x9
 80d916a:	0000                	unimp
 80d916c:	010d                	addi	sp,sp,3
 80d916e:	03f4                	addi	a3,sp,460
 80d9170:	03d8036f          	jal	t1,81599ac <_binary_riscv32_obj_data_sw_conv_data_bin_end+0x803fc>
 80d9174:	00d5                	addi	ra,ra,21
	...
 80d919a:	0111                	addi	sp,sp,4
 80d919c:	03f0                	addi	a2,sp,460
 80d919e:	03f8                	addi	a4,sp,460
 80d91a0:	00a5                	addi	ra,ra,9
 80d91a2:	0000                	unimp
 80d91a4:	0000                	unimp
 80d91a6:	01a6                	slli	gp,gp,0x9
 80d91a8:	0179                	addi	sp,sp,30
 80d91aa:	03f8                	addi	a4,sp,460
 80d91ac:	0121                	addi	sp,sp,8
	...
 80d91d2:	0125                	addi	sp,sp,9
 80d91d4:	03f8                	addi	a4,sp,460
 80d91d6:	03b4                	addi	a3,sp,456
 80d91d8:	0074                	addi	a3,sp,12
 80d91da:	0000                	unimp
 80d91dc:	0000                	unimp
 80d91de:	0000                	unimp
 80d91e0:	03f80283          	lb	t0,63(a6)
 80d91e4:	0121                	addi	sp,sp,8
	...
 80d920a:	0125                	addi	sp,sp,9
 80d920c:	03f8                	addi	a4,sp,460
 80d920e:	00500373          	0x500373
 80d9212:	0000                	unimp
 80d9214:	0000                	unimp
 80d9216:	0095                	addi	ra,ra,5
 80d9218:	03dc                	addi	a5,sp,452
 80d921a:	03c0                	addi	s0,sp,452
 80d921c:	0099                	addi	ra,ra,6
	...
 80d9242:	00dd                	addi	ra,ra,23
 80d9244:	03dc                	addi	a5,sp,452
 80d9246:	03f8                	addi	a4,sp,460
 80d9248:	021e                	slli	tp,tp,0x7
 80d924a:	0064                	addi	s1,sp,12
 80d924c:	0000                	unimp
 80d924e:	01ba                	slli	gp,gp,0xe
 80d9250:	03f8                	addi	a4,sp,460
 80d9252:	00000317          	auipc	t1,0x0
	...
 80d927a:	0000                	unimp
 80d927c:	0171                	addi	sp,sp,28
 80d927e:	03f8                	addi	a4,sp,460
 80d9280:	03f8                	addi	a4,sp,460
 80d9282:	010d0297          	auipc	t0,0x10d0
 80d9286:	03ac                	addi	a1,sp,456
 80d9288:	03f8                	addi	a4,sp,460
 80d928a:	0081                	addi	ra,ra,0
	...
 80d92b4:	001c                	0x1c
 80d92b6:	03f802cb          	fnmsub.d	ft5,fa6,ft11,ft0,rne
 80d92ba:	03f8                	addi	a4,sp,460
 80d92bc:	03f8                	addi	a4,sp,460
 80d92be:	03f8                	addi	a4,sp,460
 80d92c0:	031f 0018 0000      	0x18031f
	...
 80d92ee:	0034                	addi	a3,sp,8
 80d92f0:	03f80377          	0x3f80377
 80d92f4:	03f8                	addi	a4,sp,460
 80d92f6:	03f8                	addi	a4,sp,460
 80d92f8:	014d                	addi	sp,sp,19
	...
 80d9326:	0000                	unimp
 80d9328:	0024                	addi	s1,sp,8
 80d932a:	03f8                	addi	a4,sp,460
 80d932c:	03f8                	addi	a4,sp,460
 80d932e:	03f8                	addi	a4,sp,460
 80d9330:	01ea                	slli	gp,gp,0x1a
	...
 80d935e:	0000                	unimp
 80d9360:	00a9                	addi	ra,ra,10
 80d9362:	03f8                	addi	a4,sp,460
 80d9364:	03f8                	addi	a4,sp,460
 80d9366:	03f8                	addi	a4,sp,460
 80d9368:	03a4                	addi	s1,sp,456
 80d936a:	0030                	addi	a2,sp,8
	...
 80d9398:	03f8033f 03bc02f3 	0x3bc02f303f8033f
 80d93a0:	03f8                	addi	a4,sp,460
 80d93a2:	011d                	addi	sp,sp,7
	...
 80d93cc:	0000                	unimp
 80d93ce:	00b5                	addi	ra,ra,13
 80d93d0:	03cc                	addi	a1,sp,452
 80d93d2:	003c0363          	beq	s8,gp,80d93d8 <_binary_riscv32_obj_data_sw_conv_data_bin_start+0x448>
 80d93d6:	0121                	addi	sp,sp,8
 80d93d8:	03f8                	addi	a4,sp,460
 80d93da:	00000307          	0x307
	...
 80d9402:	0000                	unimp
 80d9404:	0020                	addi	s0,sp,8
 80d9406:	0272                	slli	tp,tp,0x1c
 80d9408:	03f8                	addi	a4,sp,460
 80d940a:	01b6                	slli	gp,gp,0xd
 80d940c:	0000                	unimp
 80d940e:	00a9                	addi	ra,ra,10
 80d9410:	03f8                	addi	a4,sp,460
 80d9412:	000002af          	0x2af
	...
 80d943a:	0000                	unimp
 80d943c:	0040                	addi	s0,sp,4
 80d943e:	03f8                	addi	a4,sp,460
 80d9440:	03f8                	addi	a4,sp,460
 80d9442:	018a                	slli	gp,gp,0x2
 80d9444:	006c                	addi	a1,sp,12
 80d9446:	0232                	slli	tp,tp,0xc
 80d9448:	03f8                	addi	a4,sp,460
 80d944a:	01de                	slli	gp,gp,0x17
	...
 80d9474:	01aa                	slli	gp,gp,0xa
 80d9476:	03f8                	addi	a4,sp,460
 80d9478:	03f0                	addi	a2,sp,460
 80d947a:	0256                	slli	tp,tp,0x15
 80d947c:	03a4                	addi	s1,sp,456
 80d947e:	03f8                	addi	a4,sp,460
 80d9480:	005c0347          	fmsub.s	ft6,fs8,ft5,ft0,rne
	...
 80d94ac:	01e2                	slli	gp,gp,0x18
 80d94ae:	03f8                	addi	a4,sp,460
 80d94b0:	03f8                	addi	a4,sp,460
 80d94b2:	03f8                	addi	a4,sp,460
 80d94b4:	03a0                	addi	s0,sp,456
 80d94b6:	005c02cf          	fnmadd.s	ft5,fs8,ft5,ft0,rne
	...
 80d94e2:	0000                	unimp
 80d94e4:	0139                	addi	sp,sp,14
 80d94e6:	029b034f          	fnmadd.d	ft6,fs6,fs1,ft0,rne
 80d94ea:	0256                	slli	tp,tp,0x15
 80d94ec:	00c5                	addi	ra,ra,17
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
