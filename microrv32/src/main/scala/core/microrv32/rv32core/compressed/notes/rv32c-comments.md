# Instruction Formats & Register Mapping

Instruction Formats occuring in RV32C

Formatname | Meaning    | Fields
-----------|------------|--------
CR         | Register   | [funct4, rd/rs1, rs2, op]
CI         | Immediate  | [funct3, imm, rd/rs1, imm, op]
CSS        | Stack-relative Store | [funct3, imm, rs2, op]
CIW        | Wide Immediate | [funct3, imm, rd', op]
CL         | Load       | [funct3, imm, rs1', imm, rd', op]
CS         | Store      | [funct3, imm, rs1', imm, rs2', op]
CA         | Arithmetic | [funct6, rd'/rs1', funct2, rs2', op]
CB         | Branch/Arithmetic | [funct3, offset, rd'/rs1', offset, op]
CJ         | Jump       | [funct3, jump target, op]


Short Register Descriptions rs1', rs2' and rd' (with a dash) are mapped to the register file 
For the instruction formats CIW, CL, CS, CA and CB

Description               |    |    |    |    |    |    |    |    | 
--------------------------|----|----|----|----|----|----|----|----|
RVC Register Number       | 000| 001| 010| 011| 100| 101| 110| 111|
Integer Register Number   | x8 | x9 | x10| x11| x12| x13| x14| x15|
Integer Register ABI Name | s0 | s1 | a0 | a1 | a2 | a3 | a4 | a5 |

Compressed instruction expand and map directly to RV32I instructions. 
The C-extension to support only RV32I maps 26 RV32C instructions to 16.
The set of corresponding RV32I instructions are: 
* ADDI
* ADD
* LD/LW
* JAL
* LUI
* SRLI
* SRAI
* ANDI
* SUB
* XOR
* OR
* AND
* BEQ
* BNE
* SLLI
* JALR

## Comments on Instructions
In the order of quadrants they appear in sorted by the instruction set listing

<-- Q0 -->
### C.ADDI4SPN

* CIW Format
* zero-extended, non-zero immediate with 8 bits
* "scaled by 4" => resulting immediate is "0" at [1:0], and built at [9:2]
* instr[12:5] = imm[7:0] => decodes to nzuimm[5:4|9:6|2|3]
* rd'[2:0] maps to proper rd[4:0] by {1 | rd'} 
* Stack pointer (x2) based
* expands to **addi rd', x2, nzuimm**

### C.LW

* CL Format
* zero-extended immediate, with 5 bits 
* "scaled by 4" => resulting immediate is "0" at [1:0], and built at [6:2]
* instr[12:10|6:5] => imm[5:3|2|6] => offset[4:0] therefore {instr[5, 12:10, 4], 00} or {imm[0, 4:2, 1], 00}
* expands to **lw rd', offset(rs1')**

### C.SW

* CS Format
* zero-extended immediate, with 5 bits 
* "scaled by 4" => resulting immediate is "0" at [1:0], and built at [6:2]
* instr[12:10|6:5] => imm[5:3|2|6] => offset[6:0]
* expands to **sw rs2', offset(rs1')**

<-- Q1 -->
### C.NOP

* CI Format
* only valid iff imm == 0
* code points with imm != 0 encode HINTs
* expands to **nop** which is **addi x0, x0, 0**

### C.ADDI

* CI Format
* sign-extended, non-zero immediate with 6 bits 
* only valid iff rd != x0 && nzimm != 0
* code points with rd == x0 ( && nzimm != 0) encode NOP
* expands to **addi rd, rd, nzimm**

### C.JAL

* CJ Format
* sign-extended immediate, with 11 bits 
* "scaled by 2" => resulting immediate is "0" at [0] and built at [11:1]
* all offsets/immediates in RVC control transfer instructions are multiples of 2 bytes
* expands to **jal x1, offset**

### C.LI

* CI Format
* sign-extended immediate, with 6 bits
* only valid iff rd != x0
* code points with rd == x0 encode HINTs
* expands to **addi rd, x0, imm**

### C.ADDI16SP

* CI Format
* sign-extended, non-zero immediate, with 6 bits
* Stack pointer (x2) based
* rd is always x2(sp)
* "scaled to represent multiples of 16 in range (-512, 496)" ("sp is always 16-byte aligned")
* expands to **addi x2, x2, nzimm**

### C.LUI

* CI Format
* sign-extended, non-zero immediate, with 6 bits
* "loads immediate into bits 17-12 of destination register, clears bottom 12 bits and sign extends bit 17 into all higher bits"
* instr[12|6:2] => imm[5|4:0] => nzimm[17|16:12], clear [11:0], sign-extend [17] into [31:17]
* only valid iff rd != {x0, x2}
* code points with nzimm == 0 are reserved
* code points with rd == x0 encode HINTs
* code points with rd == x2 correspond to the C.ADDI16SP instruction
* expands to **lui rd, nzimm**

### C.SRLI

* CB Format
* For RV32C shamt[5] must be "0" and shamt[4:0] != 0
* code points with shamt[5] != 0 are for custom extensions
* code points with shamt[4:0] == 0 are HINTs
* expands to **srli rd', rd', shamt**

### C.SRAI

* CB Format
* analogous to C.SRLI
* expands to **srai rd', rd', shamt**

### C.ANDI

* CB Format
* sign-extended immediate, with 6 bits
* expands to **andi rd', rd', imm**

### C.SUB

* CA Format
* expands to **sub rd', rd', rs2'** 

### C.XOR

* CA Format
* expands to **xor rd', rd', rs2'**

### C.OR

* CA Format
* expands to **or rd', rd', rs2'**

### C.AND

* CA Format
* expands to **and rd', rd', rs2'**

### C.J

* CJ Format
* sign-extended immediate, with 11 bits 
* "scaled by 2" => resulting immediate is "0" at [0] and built at [11:1]
* all offsets/immediates in RVC control transfer instructions are multiples of 2 bytes
* expands to **jal x0, offset**

### C.BEQZ

* CB Format
* sign-extended immediate, with 8 bits
* ! instr[12:10|6:2] => offset[8|4:3|7:6|2:1|5] 
* offset[0] == 0?
* all offsets/immediates in RVC control transfer instructions are multiples of 2 bytes
* expands to **beq rs1', x0, offset**

### C.BNEZ

* CB Format
* analogous to BEQZ
* all offsets/immediates in RVC control transfer instructions are multiples of 2 bytes
* expands to **bne rs1', x0, offset**

<-- Q2 -->
### C.SLLI

* CI Format
* For RV32C shamt[5] must be "0", and shamt[4:0] != 0
* code points with shamt == 0 are HINTs
* code points with rd = x0 are HINTs except RV32C with shamt[5]=1
* code point with rd = x0 and shamt[5]=1 is reserved for custom in RV32C
* expands to **slli rd, rd, shamt**

### C.LWSP

* CI Format
* zero-extended immediate, with 6 bits
* "scaled by 4" => resulting immediate is "0" at [1:0], and built at [7:2]
* Stack pointer (x2) based
* only valid iff rd != x0
* code points with rd == x0 are reserved
* expands to **lw rd, offset(x2)**

### C.JR

* CR Format
* only valid iff rs1 != x0
* code point with rs1 == x0 is reserved
* all offsets/immediates in RVC control transfer instructions are multiples of 2 bytes
* expands to **jalr x0, 0(rs1)**

### C.MV

* CR Format
* only valid iff rs2 != x0
* code points with rs2 == x0 correspond to C.JR instruction
* code points with rs2 != x0 and rd == x0 are HINTs
* expands to **add rd, x0, rs2**

### C.JALR

* CJ Format
* writes back (pc+2) to x1
* only valid iff rs1 != x0
* code point with rs1 == x0 correspond to C.EBREAK
* expands to **jalr x1, 0(rs1)**

### C.ADD

* CA Format
* only valid iff rs2 != x0
* code points with rs2 == x0 correspond to C.JALR and C.EBREAK
* code points with rs2 != x0 and rd == x0 are HINTs
* expands to **add rd, rd, rs2**

### C.SWSP

* CSS Format
* zero-extended immediate, with 6 bits
* "scaled by 4" => resulting immediate is "0" at [1:0], and built at [7:2]
* Stack pointer (x2) based
* expands to **sw rs2, offset(x2)**
