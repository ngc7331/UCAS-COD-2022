.data
last_tail_ptr:
        .word 0

.globl intr_handler
	.align  2
	.type intr_handler, @function
	.section .exception

intr_handler:
	# TODO: Please add your own interrupt handler for DMA engine 

    # base: 0x60020000
    # tail_ptr: 0x8
    # dma_size: 0x10
    # ctrl_stat: 0x14

    # --- dma_buf_stat -= (new_tail_ptr - old_tail_ptr) / dma_size ---
    # k0: old_tail_ptr
    # k1: new_tail_ptr
    lui   $k1, 0x6002
    lw    $k1, 0x8($k1)

    # k0: new_tail_ptr - old_tail_ptr
    sub   $k0, $k1, $k0

L1: # do {
    # dma_buf_stat --;
    # k1: dma_buf_stat
    lw    $k1, 0x10($0)
    addi  $k1, $k1, -1
    sw    $k1, 0x10($0)

    # $k0 -= dma_size;
    # k1: dma_size
    lui   $k1, 0x6002
    lw    $k1, 0x10($k1)
    sub   $k0, $k1, $k0

    # } while ($k0 != 0);
    bgtz  $k0, L1

    # --- respond intr: ctrl_stat INTR = 0 ---
    # k0: base
    # k1: ctrl_stat
    lui   $k0, 0x6002
    lw    $k1, 0x14($k0)
    andi  $k1, $k1, 0x1
    sw    $k1, 0x14($k0)

    # --- record tail_ptr ---
    lui   $k0, 0x6002
    lw    $k0, 0x8($k0)

    eret
