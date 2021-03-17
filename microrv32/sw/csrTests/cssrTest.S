.globl _start

# program entry-point
_start:

li t2, 0xffffffff
csrw mtvec, t2
csrr t3, mtvec
li t2, 0xfafaafaf
csrw mtvec, t2
csrs mtvec, t2
csrc mtvec, t2

# endless loop
end:
j end

end_fail:
j end_fail
