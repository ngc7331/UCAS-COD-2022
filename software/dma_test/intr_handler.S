.data
last_tail_ptr:
        .word 0

.globl intr_handler
	.align  2
	.type intr_handler, @function
	.section .exception

intr_handler:
	# TODO: Please add your own interrupt handler for DMA engine 
    # respond intr: ctrl_stat(0x0014) INTR = 0
    # k0: addr / data of ctrl_stat
    # k1: 0x80000000 / new data
    lui   $k0, 0x6002
    lw    $k1, 0x14($k0)
    andi  $k1, $k1, 0x1
    sw    $k1, 0x14($k0)

    # dma_buf_stat - 1
    xor   $k0, $k0, $k0
    lw    $k1, 0x10($k0)
    addi  $k1, $k1, -1
    sw    $k1, 0x10($k0)

    eret
