.globl _start

# program entry-point
_start:

# test nop, should result in addi x0,x0,0
nop

# load some constants
li x4,0x01
li x5,0xAA
li x6,0x55

# write to x0 should never work
li x0, 0xff

## register register integer instructions

# add and subtract
# add should result 0xFF
# sub should result 0x55
add x7, x5, x6
sub x8, x5, x6

# and or xor
# and should result 0x00
and x9, x5, x6
# or should result 0xFF
or x10, x5, x6
# xor should result 0xFF
xor x11, x5, x6
# shift left of 0x55 by 1 result in 0xAA
sll x12, x6, x4
# shift right of 0xAA by 1 result in 0x55
srl x13, x5, x4

## register immediate integer instructions
# add immediate of x5 = 0xAA and immediate 0x55 result in 0xFF
addi x14, x5, 0x55
# load upper immediate
lui x15, 0xefe
# and
andi x16, x5, 0x55
# or
ori x17, x6, 0xAA
# xor 
xori x18, x5, 0x55
# shift left of 0x55 by immediate 0x01 result in 0xAA
slli x19, x6, 0x01
# shift right of 0xAA by immediate 0x01 result in 0x55
srli x20, x5, 0x01

# store and load tests
# load some constants to registers
li x2, 0xDE
li x3, 0xAD
li x3, 0xBE
li x4, 0xEF
li x5, 0x00
# try storing a register value to some offset that should be far enough away in ram
# this can change once this test gets bigger!
sw x2, 250(x5)
lw x6, 250(x0)
# build some 32 bit constant in x4 by hand 
lui x2, 0xDEAD
slli x2,x2, 4
lui x3, 0xBEEF
srli x3,x3,12
add x4,x2,x3
# try store and load operations of 32 bit values and see how it behaves
sw x4, 250(x5)
lw x6, 250(x0)
sh x4, 260(x5)
lh x7, 260(x0)
lhu x7, 260(x0)
sb x4, 260(x5)
lb x8, 260(x0)
lbu x8, 260(x0)

auipc x9, 0x1
auipc x9, 0xFFFFF

# branch and jump tests
li x1, 0x30
li x2, 0x2F
li x3, 0x30
# branch will get stuck in endless loop if instruction doesnt work properly
br1:
beq x1,x2,br1 # x1 == x2 : 0x30 == 0x2F is false
br2:
bne x1,x3,br2 # x1 != x3 : 0x30 != 0x30 is false
br3:
blt x1,x2,br3 # x1 < x2 : 0x30 < 0x2F is false
br4:
bge x2,x1,br4 # x2 >= x1 : 0x2F >= 0x30 is false
br5:
bltu x1,x2,br5 # x1 < x2 : 0x30 < 0x2F is false
br6:
bgeu x2,x1,br6 # x2 >= x1 : 0x2F >= 0x30 is false

jalr x20,x0,0x04 # should skip next instruction, if not this causes an endless loop
j br6
nop

# endless loop
end:
j end
