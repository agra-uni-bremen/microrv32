Memorymodel


        <---
     +2       +0        pc
+---------|---------+-----+   |
| I_{0,L} | I_{0,U} |   0 |   |  +4
| I_{2,C} | I_{1,C} |   4 |   v  
| I_{0,L} | I_{3,U} |   8 |     
| I_{0,L} | I_{0,U} |   c |     
| I_{0,L} | I_{0,U} |  10 |     
+-------------------------+
 MSB             LSB


-----------


Input     : [Instruction(32)_instr, pc(32)]

Registers : [IBuf(32), SBuf(16), CompressedRetired(1)_cr, pc_last(32), ...]

Output    : [Instruction(32)_instr, pc-increment{2,4,0}, ExpanderStatus(Enum)] 


Behavioral cases :

// outside of fetch unit: fetch instruction from pc
0. buffer fetched instruction
    1. if `cr == 0 && in.instr.quadrant != RV32I` then only use IBuf
        => buffer both the lower and upper into IBuf, nothing into SBuf
    2. if `cr == 0 && in.instr.quadrant == RV32I` then only use IBuf
        => buffer the whole instruction into IBuf
    3. if `cr == 1 && in.instr.quadrant != RV32I` 
    4. if `cr == 1 && in.instr.quadrant == RV32I` 
1. 


* 
