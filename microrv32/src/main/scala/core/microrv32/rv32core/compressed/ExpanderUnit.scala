package core.microrv32.rv32core.compressed

import spinal.core._
import spinal.lib._

import core.microrv32.{RV32Fields => RV32OP}

case class ExpanderStatus() extends Bundle {
  val valid = out Bool ()
  val illegal = out Bool ()
  val isCompressed = out Bool ()
  val unsupported = out Bool ()
}

/*
 * Expands 16 bit RISC-V C-Instructions to their 32 bit equivalent
 */
class ExpanderUnit() extends Component {
  val io = new Bundle {
    val compInstr = in Bits (16 bits)
    val expInstr = out Bits (32 bits)
    val status = ExpanderStatus()
  }

  val fields = new Area {
    val inst = io.compInstr
    val quadrant = io.compInstr(1 downto 0)
    val rs1 = io.compInstr(11 downto 7)
    val rs1Small = io.compInstr(9 downto 7)
    val rs1Exp = B"01" ## io.compInstr(9 downto 7)
    val rd = io.compInstr(11 downto 7)
    val rdSmall = io.compInstr(9 downto 7)
    val rdExp = B"01" ## io.compInstr(9 downto 7)
    val rdExp_ciw = B"01" ## io.compInstr(4 downto 2)
    val rdExp_cl = B"01" ## io.compInstr(4 downto 2)
    val rs2 = io.compInstr(6 downto 2)
    val rs2Small = io.compInstr(4 downto 2)
    val rs2Exp = B"01" ## io.compInstr(4 downto 2)
    val funct3 = io.compInstr(15 downto 13)
    val compOpCode = io.compInstr(15 downto 13)
    val f2_a = io.compInstr(11 downto 10)
    val f2_b = io.compInstr(6 downto 5)
    val funct4 = io.compInstr(15 downto 12)
    val funct6 = io.compInstr(15 downto 10)
    val cjOffset = io.compInstr(12 downto 2)
    val cbOffset = io.compInstr(12 downto 2)
  }

  val cImm = new CompressedExtensionUnit()
  cImm.io.instruction := io.compInstr
  val immDecode = new Area {
    // some more concise coding, for the lazy ones
    val ci = cImm.io.CI
    val css = cImm.io.CSS
    val ciw = cImm.io.CIW
    val cl = cImm.io.CL
    val cs = cImm.io.CS
    val cb = cImm.io.CB
    val cj = cImm.io.CJ
    val addi4spn = B(ciw(5 downto 2) ## ciw(7 downto 6) ## ciw(0) ## ciw(1) ## B"00", 12 bits) // [1:0] = 0 => scaled by 4
    val lwoffset = B(cl(0) ## cl(4 downto 2) ## cl(1) ## B"00", 12 bits) // [1:0] = 0 => scaled by 4
    val swoffset = B(cl(0) ## cl(4 downto 2) ## cl(1) ## B"00", 12 bits) // [1:0] = 0 => scaled by 4
    val addi = B(S(ci(5), 6 bits) ## ci(5 downto 0), 12 bits)
    val jaloffset = B(S(cj(10), 10 bits) ## cj(6) ## cj(8 downto 7) ## cj(4) ## cj(5) ## cj(0) ## cj(9) ## cj(3 downto 1), 20 bits)
    val li = B(S(ci(5), 6 bits) ## ci(4 downto 0), 12 bits)
    val addi16sp = B(S(ci(5), 3 bits) ## ci(5) ## ci(2 downto 1) ## ci(3) ## ci(0) ## ci(4) ## B"0000",12 bits) // [3:0] = 0 => scaled by 16
    val lui = B(S(ci(5), 14 bits) ## ci(5 downto 0),20 bits)
    val shamt = cb(7) ## cb(4 downto 0)
    val srli = B(RV32OP.F7_SRLI ## shamt(4 downto 0), 12 bits)
    val srai = B(RV32OP.F7_SRAI ## shamt(4 downto 0), 12 bits)
    val andi = B(S(cb(7), 7 bits) ## cb(4 downto 0), 12 bits)
    val joffset = B(S(cj(10), 10 bits) ## cj(6) ## cj(8 downto 7) ## cj(4) ## cj(5) ## cj(0) ## cj(9) ## cj(3 downto 1), 20 bits)
    val beqz = B(S(cb(7), 4 bits) ## cb(7) ## cb(4 downto 3) ## cb(0) ## cb(6 downto 5) ## cb(2 downto 1),12 bits)
    val bnez = B(S(cb(7), 4 bits) ## cb(7) ## cb(4 downto 3) ## cb(0) ## cb(6 downto 5) ## cb(2 downto 1),12 bits)
    val slli = B(RV32OP.F7_SLLI ## shamt(4 downto 0), 12 bits)
    val lwspoffset = B(ci(1 downto 0)## ci(5 downto 2) ## B"00", 12 bits) // [1:0] = 0 => scaled by 4
    val swspoffset = B(css(1 downto 0)## css(5 downto 2) ## B"00", 12 bits) // [1:0] = 0 => scaled by 4
  }

  val compMapExpand = new Area {
    import CompressedOpcode._
    // functions to build the instructions that the RV32C map/expand to
    def regImmInstruction(imm : Bits, rs1 : Bits, funct3 : Bits, rd : Bits) : Bits = {
      val riInstr = B(imm ## rs1 ## funct3 ## rd ## RV32OP.OP_REGIMM,32 bits)
      riInstr
    }    
    def regRegInstruction(funct7: Bits, rs2: Bits, rs1 : Bits, funct3 : Bits, rd : Bits) : Bits = {
      val rrInstr = B(funct7 ## rs2 ## rs1 ## funct3 ## rd ## RV32OP.OP_REGREG,32 bits)
      rrInstr
    }
    def hintInstruction() : Bits = {
      // return NOP for replacement when a HINT is needed -- HINTs will be encoded as NOP for easy handling
      val hintInstr = regImmInstruction(B(0, 12 bits), B(0, 5 bits), RV32OP.F3_ADDI, B(0, 5 bits)) 
      hintInstr
    }
    def ldInstruction(lwoff : Bits, rs1 : Bits, funct3 : Bits, rd : Bits) : Bits = {
      val ldInstr = B(lwoff ## rs1 ## funct3 ## rd ## RV32OP.OP_LOAD, 32 bits)
      ldInstr
    }
    def swInstruction(swoff : Bits, rs2 : Bits,  rs1 : Bits, funct3 : Bits) : Bits = {
      val swInstr = B(swoff(11 downto 5)## rs2 ## rs1 ## funct3 ## swoff(4 downto 0) ## RV32OP.OP_STORE, 32 bits)
      swInstr
    }
    def jalInstruction(offset : Bits, rd : Bits) : Bits = {
      val jalOffset = offset(19) ## offset(9 downto 0) ## offset(10) ## offset(18 downto 11)
      val jalInstr = B(jalOffset ## rd ## RV32OP.OP_JAL, 32 bits)
      jalInstr
    }
    def jalrInstruction(offset : Bits, rs1 : Bits, rd : Bits) : Bits = {
      val jalrInstr = B(offset ## rs1 ## B(0, 3 bits) ## rd ## RV32OP.OP_JALR, 32 bits)
      jalrInstr
    }
    def luiInstruction(imm : Bits, rd : Bits) : Bits = {
      val luiInstr = B(imm ## rd ## RV32OP.OP_LUI, 32 bits)
      luiInstr
    }
    def branchInstruction(offset : Bits, rs1 : Bits, rs2 : Bits, funct3 : Bits) : Bits = {
      val branchInstr = B(offset(11) ## offset(9 downto 4) ## rs2 ## rs1 ## funct3 ## offset(3 downto 0) ## offset(10) ## RV32OP.OP_BRANCH, 32 bits)
      branchInstr
    }

    val compressed = fields.quadrant.asUInt < 3
    val isDefinedIllegal = io.compInstr === Q0_ILLEGAL_INSTRUCTION
    val isUnsupported = False
    val expInstruction = Bits(32 bits)
    expInstruction := 0
    switch(fields.quadrant) {
      is(Q0) {
        switch(fields.compOpCode, strict = false) {
          is(Q0_F3_ILLEGAL, Q0_F3_ADDI4SPN) {
            when(!isDefinedIllegal) { // so it has to be ADDI4SPN
              when(immDecode.addi4spn =/= 0){ // and nzuimm has to be non-zero
                // **ADDI4SPN rd, imm** expands to **addi rd', x2, nzuimm**
                expInstruction := regImmInstruction(immDecode.addi4spn,B(2, 5 bits),RV32OP.F3_ADDI,fields.rdExp_ciw)          
              }.otherwise{
                isUnsupported := True
                expInstruction := hintInstruction()
              }
            }
            // otherwise default value of 0 will apply which is the defined illegal instruction
          }
          is(Q0_F3_LW) {
            // **C.LW rd', offset(rs1')** expands to **lw rd', offset(rs1')**
            expInstruction := ldInstruction(immDecode.lwoffset,fields.rs1Exp,RV32OP.F3_LW,fields.rdExp_cl)
          }
          is(Q0_F3_SW) {
            // **C.SW rs2', offset(rs1')** expands to **sw rs2', offset(rs1')**
            expInstruction := swInstruction(immDecode.swoffset, fields.rs2Exp, fields.rs1Exp, RV32OP.F3_SW)
          }
          default {
            // unsupported instructions
            isUnsupported := True
          }
        }
      }
      is(Q1) {
        switch(fields.compOpCode, strict = false) {
          is(Q1_F3_NOP,Q1_F3_ADDI) {
            // rs1 == 0 => C.NOP
            // rs1 != 0 => C.ADDI
            when(fields.rs1 === 0){ 
              // **C.NOP** expands to **addi x0, x0, 0**
              expInstruction := regImmInstruction(immDecode.addi,B(0, 5 bits),RV32OP.F3_ADDI,B(0, 5 bits))
            }.otherwise{
              // **C.ADDI rd,nzimm** expands to **addi rd, rd, nzimm**
              expInstruction := regImmInstruction(immDecode.addi,fields.rd,RV32OP.F3_ADDI,fields.rd)
            }
          }
          is(Q1_F3_JAL) {
            // **C.JAL offset** expands to **jal x1, offset**
            expInstruction := jalInstruction(immDecode.jaloffset, B(1, 5 bits))
          }
          is(Q1_F3_LI) {
            // rd != 0 => C.LI
            // rd == 0 => HINT
            when(fields.rd =/= 0){
              // **C.LI rd, imm** expands to **addi rd, x0, imm**
              expInstruction := regImmInstruction(immDecode.addi,B(0, 5 bits),RV32OP.F3_ADDI,fields.rd)
            }.otherwise{
              expInstruction := hintInstruction()
            }
          }
          is(Q1_F3_ADDI16SP, Q1_F3_LUI) {
            // rd == 2 => ADDI16SP
            // rd != {0, 2} => LUI
            // rd == 0 => HINT
            when(fields.rd === 2){
              // ADDI16SP is only valid when nzimm != 0, nzimm == 0 is a reserved code point
              when(immDecode.addi16sp =/= 0){
                // **C.ADDI16SP x0, imm** expands to **addi x2, x2, nzimm**
                expInstruction := regImmInstruction(immDecode.addi16sp, B(2, 5 bits), RV32OP.F3_ADDI, B(2, 5 bits))
              }.otherwise{
                expInstruction := hintInstruction()
              }
            }.elsewhen(fields.rd =/= 0 & fields.rd =/= 2){
              // **C.LUI rd, imm** expands **lui rd, imm**
              expInstruction := luiInstruction(immDecode.lui, fields.rd)
            }.otherwise{
              expInstruction := hintInstruction()
            }
          }
          is(Q1_F3_SRLI, Q1_F3_SRAI, Q1_F3_ANDI, Q1_F3_SUB_XOR_OR_AND) {
            switch(fields.f2_a){
              is(Q1_F2_A_SRLI){
                //expands to **srli rd', rd', shamt**
                // shamt[5] has ot be 0 in order to be RV32 compatible
                when(immDecode.shamt(5 downto 5) === 0){
                  expInstruction := regImmInstruction(immDecode.srli, fields.rdExp, RV32OP.F3_SRLI, fields.rdExp)
                }.otherwise{
                  // dont decode/expand anything that is not RV32
                  isUnsupported := True
                }
              }
              is(Q1_F2_A_SRAI){
                //expands to **srai rd', rd', shamt**
                when(immDecode.shamt(5 downto 5) === 0){
                  expInstruction := regImmInstruction(immDecode.srai, fields.rd, RV32OP.F3_SRAI, fields.rd)
                }.otherwise{
                  // dont decode/expand anything that is not RV32
                  isUnsupported := True
                }
              }
              is(Q1_F2_A_ANDI){
                //expands to **andi rd', rd', imm**
                expInstruction := regImmInstruction(immDecode.andi, fields.rdExp, RV32OP.F3_ANDI, fields.rdExp)
              }
              is(Q1_F2_A_SUB_XOR_OR_AND){
                switch(fields.f2_b){
                  is(Q1_F2_B_SUB){
                    //expands to **sub rd', rd', rs2'** 
                    expInstruction := regRegInstruction(RV32OP.F7_SUB, fields.rs2Exp, fields.rdExp, RV32OP.F3_SUB, fields.rdExp)
                  }
                  is(Q1_F2_B_XOR){
                    //expands to **xor rd', rd', rs2'**
                    expInstruction := regRegInstruction(RV32OP.F7_XOR, fields.rs2Exp, fields.rdExp, RV32OP.F3_XOR, fields.rdExp)
                  }
                  is(Q1_F2_B_OR){
                    //expands to **or rd', rd', rs2'**
                    expInstruction := regRegInstruction(RV32OP.F7_OR, fields.rs2Exp, fields.rdExp, RV32OP.F3_OR, fields.rdExp)
                  }
                  is(Q1_F2_B_AND){
                    //expands to **and rd', rd', rs2'**
                    expInstruction := regRegInstruction(RV32OP.F7_AND, fields.rs2Exp, fields.rdExp, RV32OP.F3_AND, fields.rdExp)
                  }
                }
              }
            }
          }
          is(Q1_F3_J) {
            // expands to **jal x0, offset**
            expInstruction := jalInstruction(immDecode.joffset, B(0, 5 bits))
          }
          is(Q1_F3_BEQZ) {
            // expands to **beq rs1', x0, offset**
            expInstruction := branchInstruction(immDecode.beqz, fields.rs1Exp, B(0, 5 bits), RV32OP.F3_BEQ)
          }
          is(Q1_F3_BNEZ) {
            // expands to **bne rs1', x0, offset**
            expInstruction := branchInstruction(immDecode.beqz, fields.rs1Exp, B(0, 5 bits), RV32OP.F3_BNE)
          }
          default {
            // unsupported instructions
          }
        }
      }
      is(Q2) {
        switch(fields.compOpCode){
          is(Q2_F3_SLLI) {
            // expands to **slli rd, rd, shamt**
            // shamt[5] on RV32C must be 0 for SLLI, shamt[5] = 1 is reserved for custom instructions
            when(!immDecode.shamt(5)){
              expInstruction := regImmInstruction(immDecode.slli, fields.rd, RV32OP.F3_SLLI, fields.rd)
            }.otherwise{
              // no support for custom instructions on SLLI code points
              isUnsupported := True
            }
          }
          is(Q2_F3_LWSP) {
            // expands to **lw rd, offset(x2)**
            when(fields.rd =/= 0){
              expInstruction := ldInstruction(immDecode.lwspoffset,B(2, 5 bits),RV32OP.F3_LW,fields.rd)
            }.otherwise{
              isUnsupported := True
            }
          }
          is(Q2_F3_JR_MV_EBREAK_JALR_ADD) {
            // instr[12] = 0 => {JR, MV}
            // instr[12] = 1 => {EBREAK, JALR, ADD}
            when(fields.inst(12 downto 12) === 0){
              // case for JR and MV
              when(fields.rs2 === 0){
                // case for JR, but rs1 must be != 0
                when(fields.rs1 =/= 0){
                  // expands to **jalr x0, 0(rs1)**
                  expInstruction := jalrInstruction(B(0, 12 bits), fields.rs1, B(0, 5 bits))
                }.otherwise{
                  isUnsupported := True
                }
              }.otherwise{
                // case for MV
                // expands to **add rd, x0, rs2**
                expInstruction := regRegInstruction(RV32OP.F7_ADD, fields.rs2, B(0, 5 bits), RV32OP.F3_ADD, fields.rd)
              }
            }.otherwise{
              // case for EBREAK, JALR and ADD
              when(fields.rs2 =/= 0){
                // case for ADD
                // expands to **add rd, rd, rs2**
                expInstruction := regRegInstruction(RV32OP.F7_ADD, fields.rs2, fields.rd, RV32OP.F3_ADD, fields.rd)
              }.otherwise{
                // case for JALR and EBREAK
                when(fields.rd =/= 0){
                  // case for JALR
                  // expands to **jalr x1, 0(rs1)**
                  expInstruction := jalrInstruction(B(0, 12 bits), fields.rs1, B(1, 5 bits))
                }.otherwise{
                  // expands to **ebreak** but is not supported
                  expInstruction := hintInstruction()
                  isUnsupported := True
                }
              }
            }
          }
          is(Q2_F3_SWSP) {
            // expands to **sw rs2, offset(x2)**
            expInstruction := swInstruction(immDecode.swspoffset, fields.rs2, B(2, 5 bits), RV32OP.F3_SW)
          }
          default{
            isUnsupported := True
          }
        }
      }
      is(Q3) {
        isUnsupported := True
        // this should not happen
      }
    }
  }

  val outputs = new Area{
    io.expInstr := compMapExpand.expInstruction
    io.status.valid := !compMapExpand.isUnsupported && fields.quadrant =/= CompressedOpcode.Q3
    io.status.isCompressed := fields.quadrant =/= CompressedOpcode.Q3
    io.status.illegal := fields.quadrant === CompressedOpcode.Q3 | compMapExpand.isDefinedIllegal
    io.status.unsupported := compMapExpand.isUnsupported
  }


}
