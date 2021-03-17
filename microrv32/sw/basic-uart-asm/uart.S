.globl _start
.equ SYSCALL_ADDR, 0x02010000
.equ LED_ADDR, 0x81000000
.equ UART_TX_DATA_ADDR, 0x82000000
.equ UART_TX_CTRL_ADDR, 0x82000004
.equ UART_RX_DATA_ADDR, 0x82000008

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

# .macro UART_WRITE, chr_val
#     # load up x10 with character, write x10 to tx register
#     li x10, \chr_val
#     li x5, UART_TX_DATA_ADDR
#     sw x10, 0(x5)
#     # load up x10 with 1, write x10 to tx ctrl register
#     li x10, 1
#     li x5, UART_TX_CTRL_ADDR
#     sw x10, 0(x5)
# .endm

# program entry-point
_start:
li x5, 0
li x6, 0
li x7, 0

LED_WRITE 10

# load x6 with address of hello string label
la x6, hello 
hello_loop:
# load up x10 with character from string 
lb x10, 0(x6)
beqz x10, end_hello_loop
# load x5 with address of uart tx data register
li x5, UART_TX_DATA_ADDR
# store character (loaded in x10) at tx data register (x5)
sw x10, 0(x5)
# load up x10 with 1, write x10 to tx ctrl register
li x28, 1
li x5, UART_TX_CTRL_ADDR
sw x28, 0(x5)
# increment string label pointer +1
addi x6,x6,1
# read transmit status from uart and wait until character is sent
wait_chr_send:
li x5, UART_TX_CTRL_ADDR
lw x7, 0(x5)
beqz x7, wait_chr_send
# string is NUL terminated, if x10 not 0x0(\NUL) then continue sending characters, else terminate program
j hello_loop
end_hello_loop:

# call exit (SYS_EXIT=93) with exit code 0 (argument in x10)
SYS_EXIT 0
end:
j end

#.data
hello: .string "hello"
