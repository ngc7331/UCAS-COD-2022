	.file	1 "printf.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	puts
	.set	nomips16
	.set	nomicromips
	.ent	puts
	.type	puts, @function
puts:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(uart)
	lb	$6,0($4)
	lw	$5,%lo(uart)($2)
	beq	$6,$0,$L10
	move	$2,$0

$L3:
	lw	$3,8($5)
	andi	$3,$3,0x8
	bne	$3,$0,$L3
	nop

	addiu	$2,$2,1
	andi	$6,$6,0x00ff
	addu	$3,$4,$2
	sb	$6,4($5)
	lb	$6,0($3)
	bne	$6,$0,$L3
	nop

$L10:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	puts
	.size	puts, .-puts
	.globl	uart
	.data
	.align	2
	.type	uart, @object
	.size	uart, 4
uart:
	.word	1610612736
	.ident	"GCC: (Ubuntu 10.3.0-1ubuntu1) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
