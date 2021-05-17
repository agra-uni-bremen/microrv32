.globl _start
.globl main

.equ SYSCALL_ADDR, 0x02010000

.macro SYS_EXIT, exit_code
li   a7, 93
li   a0, \exit_code
li   t0, SYSCALL_ADDR
sw   a7, 0(t0)
.endm


_start:
la sp, stack_end
jal main

# call exit (SYS_EXIT=93) with exit code 0 (argument in a0)
SYS_EXIT 0

stack_begin:
.zero 2048
stack_end:
