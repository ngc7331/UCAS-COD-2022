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
	lb	$5,0($4)
	beq	$5,$0,$L5
	lw	$6,%lo(uart)($2)

	lw	$3,8($6)
	move	$2,$0
	andi	$3,$3,0x8
$L3:
	bne	$3,$0,$L3
	nop

$L8:
	addiu	$2,$2,1
	sb	$5,4($6)
	addu	$3,$4,$2
	lb	$5,0($3)
	bne	$5,$0,$L8
	nop

	jr	$31
	nop

$L5:
	jr	$31
	move	$2,$0

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
