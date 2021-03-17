.globl _start
.equ SYSCALL_ADDR, 0x02010000
.equ LED_ADDR, 0x81000000
.equ UART_TX_DATA_ADDR, 0x82000000
.equ UART_TX_CTRL_ADDR, 0x82000004
.equ UART_RX_DATA_ADDR, 0x82000008
.equ CLIC_MTIME_LO, 0x0200bff8
.equ CLIC_MTIME_HI, 0x0200bffc
.equ CLIC_MTIMECMP_LO, 0x02004000
.equ CLIC_MTIMECMP_HI, 0x02004004

.macro INIT_HW_PLATFORM
    and x1,x0,x0
    and x2,x0,x0
    and x3,x0,x0
    and x4,x0,x0
    and x5,x0,x0
    and x6,x0,x0
    and x7,x0,x0
    and x8,x0,x0
    and x9,x0,x0
    and x10,x0,x0
    and x11,x0,x0
    and x12,x0,x0
    and x13,x0,x0
    and x14,x0,x0
    and x15,x0,x0
    and x16,x0,x0
    and x17,x0,x0
    and x18,x0,x0
    and x19,x0,x0
    and x20,x0,x0
    and x21,x0,x0
    and x22,x0,x0
    and x23,x0,x0
    and x24,x0,x0
    and x25,x0,x0
    and x26,x0,x0
    and x27,x0,x0
    and x28,x0,x0
    and x29,x0,x0
    and x30,x0,x0
    and x31,x0,x0
.endm

.macro SYS_EXIT, exit_code
    li a7, 93
    li x10, \exit_code
    li x5, SYSCALL_ADDR
    sw a7, 0(x5)
.endm

.macro LED_WRITE, led_val
    li x10, \led_val
    li x5, LED_ADDR
    sw x10, 0(x5)
.endm

# program entry-point
_start:
INIT_HW_PLATFORM
li x18, 0 ## some random counter that is available in traphandler
li x9, 3 ## counter limit
li x10, 0
li x11, 0
la sp, stack_end
la x5, level_0_interrupt_handler
csrw mtvec, x5
# load val for timercmp -- based on r5-priv-spec
# load -1 into upper timercmp so irq is 0
li x5, -1
li x11, 0
li x10, 240
la x6, CLIC_MTIMECMP_LO
sw x5, 0(x6)
sw x5, 4(x6)
sw x10, 0(x6)
sw x11, 4(x6)
# enable interrupts, mie.mti and mstatus.mie
li x6, 0x80
csrw mie, x6 # mie.mtie = 1
li x6, 0x8
csrw mstatus, x6 # mstatus.mie = 1

LED_WRITE 10
loop:
bgt x18, x9, exit_loop # if x8 > x9 then exit_loop
j loop
exit_loop:
csrw mstatus, x0 # mstatus.mie = 0
csrw mie, x0 # mie.mtie = 0
# call exit (SYS_EXIT=93) with exit code 0 (argument in x10)
SYS_EXIT 0
end:
j end

/*
 * Interrupt handler for non-nested interrupts. Only selected registers are stored/re-stored, i.e. those not preserved on function calls.
 */
# //#define STORE    sw
# //#define LOAD     lw
.equ REGBYTES, 4

level_0_interrupt_handler:
# store execution context on the stack (register content)
addi    sp, sp, -REGBYTES * 32
sw	x1, 0x0(sp)
sw	x4, 3 * REGBYTES(sp)
sw	x5, 4 * REGBYTES(sp)
sw	x6, 5 * REGBYTES(sp)
sw	x7, 6 * REGBYTES(sp)
sw	x10, 9 * REGBYTES(sp)
sw	x11, 10 * REGBYTES(sp)
sw	x12, 11 * REGBYTES(sp)
sw	x13, 12 * REGBYTES(sp)
sw	x14, 13 * REGBYTES(sp)
sw	x15, 14 * REGBYTES(sp)
sw	x16, 15 * REGBYTES(sp)
sw	x17, 16 * REGBYTES(sp)
sw	x28, 27 * REGBYTES(sp)
sw	x29, 28 * REGBYTES(sp)
sw	x30, 29 * REGBYTES(sp)
sw	x31, 30 * REGBYTES(sp)

# todo: some more trapcause handling, technically we could end here for illegal instructions and would increase mtimecmp
#csrr    a0, mcause # a0 containing cause for trap
la x6, CLIC_MTIME_LO
li x5, -1
lw x10, 0(x6)
lw x11, 4(x6)
# techically: check x10 for overflow and increase x11 by 1, since its 64 bits, but this is experimental
# would be easier to do in C than ASM anyway
addi x10, x10, 200
addi x18, x18, 1
la x6, CLIC_MTIMECMP_LO
sw x5, 0(x6)
sw x5, 4(x6)
sw x10, 0(x6)
sw x11, 4(x6)

# re-store the saved context
lw	x1, 0x0(sp)
lw	x4, 3 * REGBYTES(sp)
lw	x5, 4 * REGBYTES(sp)
lw	x6, 5 * REGBYTES(sp)
lw	x7, 6 * REGBYTES(sp)
lw	x10, 9 * REGBYTES(sp)
lw	x11, 10 * REGBYTES(sp)
lw	x12, 11 * REGBYTES(sp)
lw	x13, 12 * REGBYTES(sp)
lw	x14, 13 * REGBYTES(sp)
lw	x15, 14 * REGBYTES(sp)
lw	x16, 15 * REGBYTES(sp)
lw	x17, 16 * REGBYTES(sp)
lw	x28, 27 * REGBYTES(sp)
lw	x29, 28 * REGBYTES(sp)
lw	x30, 29 * REGBYTES(sp)
lw	x31, 30 * REGBYTES(sp)
addi	sp, sp, REGBYTES * 32
mret

stack_begin:
.zero 2048
stack_end:
