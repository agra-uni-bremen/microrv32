.globl _start
.equ SYSCALL_ADDR, 0x02010000
.equ LED_ADDR, 0x81000000

.macro SYS_EXIT, exit_code
    li a7, 93
    li a0, \exit_code
    li t0, SYSCALL_ADDR
    sw a7, 0(t0)
.endm

.macro LED_WRITE, led_val
    li a0, \led_val
    li t0, LED_ADDR
    sw a0, 0(t0)
.endm

# program entry-point
_start:
li t0, 0
li t1, 0
led_loop:
LED_WRITE 5
li a0, 5
call wait_func
LED_WRITE 10
li a0, 5
call wait_func
LED_WRITE 0
li a0, 5
call wait_func

j led_loop

# call exit (SYS_EXIT=93) with exit code 0 (argument in a0)
#SYS_EXIT 0
#end:
#j end

wait_func:
    mv t3, a0
    li t4, 1
    wait_loop:
    beqz t3, wait_loop_end
    sub t3,t3,t4 # t3 = t3-1
    j wait_loop
    wait_loop_end:
    ret