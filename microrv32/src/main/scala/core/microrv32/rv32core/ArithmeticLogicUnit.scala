package core.microrv32.rv32core

import spinal.core._
import core.microrv32.InstructionType
import core.microrv32.InstructionType._
import core.microrv32.RVOpcode._

case class ALUInstruction() extends Bundle{
    val f3 = in Bits(3 bits)
    val f7 = in Bits(7 bits)
    val shamt = in Bits(5 bits)
    val instr = InstructionType()//in(InstructionType())
}

case class ALUBundle() extends Bundle{
    val opA = in Bits(32 bits)
    val opB = in Bits(32 bits)
    val operation = in(ALUInstruction())
    val output = out Bits(32 bits)
    val output_bool = out Bool
}

class ArithmeticLogicUnit() extends Component{
  // io bundle  
  val io = new ALUBundle()
    
  // result signals
  val add = Bits(32 bits)
  val sub = Bits(32 bits)
  val equal = Bool
  val unequal = Bool
  val lt_u = Bool
  val lt_s = Bool
  val ge_u = Bool
  val ge_s = Bool
  val bitAnd = Bits(32 bits)
  val bitOr = Bits(32 bits)
  val bitXor = Bits(32 bits)
  val shiftL = Bits(32 bits)
  val shiftR = Bits(32 bits)
  val shiftRA = Bits(32 bits)
  val shiftLI = Bits(32 bits)
  val shiftRI = Bits(32 bits)
  val shiftRAI = Bits(32 bits)

  // calculate each operation every time, regardless of operation
  // OPTIMIZE : can be optimized with more sophisticated descriptions of ALU operations; can reduce area 
  add := (io.opA.asUInt + io.opB.asUInt).asBits
  sub := (io.opA.asUInt - io.opB.asUInt).asBits
  equal := io.opA === io.opB
  unequal := !equal
  lt_u := io.opA.asUInt < io.opB.asUInt
  lt_s := io.opA.asSInt < io.opB.asSInt
  ge_u := io.opA.asUInt >= io.opB.asUInt
  ge_s := io.opA.asSInt >= io.opB.asSInt
  bitAnd := io.opA & io.opB
  bitOr := io.opA | io.opB
  bitXor := io.opA ^ io.opB
  // if shift behaviour is bugged, it might be because the way spinalhdl generated verilog
  // https://github.com/SpinalHDL/SpinalHDL/issues/300 see issue for clarification
  shiftL := io.opA |<< io.opB(4 downto 0).asUInt
  shiftR := io.opA |>> io.opB(4 downto 0).asUInt
  shiftRA := (io.opA.asSInt >> io.opB(4 downto 0).asUInt).asBits
  shiftLI := io.opA |<< io.operation.shamt.asUInt
  shiftRI := io.opA |>> io.operation.shamt.asUInt
  shiftRAI := (io.opA.asSInt >> io.operation.shamt.asUInt).asBits

  // mux based on instruction, funct3 and funct7 according to specification
  // default value to not infer latch
  io.output := 0
  io.output_bool := False
  // big multiplexer based on instruction type (reg-reg, reg-immediate, branch/jump)
  switch(io.operation.instr){
    // use ALU addition for JAL, JALR, STORE, LOAD, LUI
    is(isCT_JAL,isCT_JALR,isStore,isLoad,isLUI){
      io.output := add
    }
    // AUIPC uses add result but -4 in this stage
    is(isAUIPC){
      // opA is PC (but incremented, therefore -4)
      // opB is the immediate value added to the PC for AUIPC
      io.output := (add.asUInt - 4).asBits
    }
    is(isRegReg){
      // choose result of register-register operation
      switch(io.operation.f3){
        is(F3_ADD, F3_SUB){
          io.output := (io.operation.f7 === F7_Z) ? add | sub
        }
        is(F3_SLT){
          io.output := (lt_s === True) ? B(1,32 bits) | B(0,32 bits)
        }
        is(F3_SLTU){
          io.output := (lt_u === True) ? B(1,32 bits) | B(0,32 bits)
        }
        is(F3_AND){
          io.output := bitAnd
        }
        is(F3_OR){
          io.output := bitOr
        }
        is(F3_XOR){
          io.output := bitXor
        }
        is(F3_SLL){
          io.output := shiftL
        }
        is(F3_SRL, F3_SRA){
          io.output := (io.operation.f7 === F7_Z) ? shiftR | shiftRA
        }
      }
    }
    is(isRegImm){
      // for immediate instructions we only need to look at funct3
      switch(io.operation.f3){
        is(F3_ADDI){
          io.output :=  add
        }
        is(F3_SLTI){
          io.output := (lt_s === True) ? B(1,32 bits) | B(0,32 bits)
        }
        is(F3_SLTIU){
          io.output := (lt_u === True) ? B(1,32 bits) | B(0,32 bits)
        }
        is(F3_ANDI){
          io.output := bitAnd
        }
        is(F3_ORI){
          io.output := bitOr
        }
        is(F3_XORI){
          io.output := bitXor
        }
        is(F3_SLLI){
          io.output := shiftLI
        }
        is(F3_SRLI, F3_SRAI){
          io.output := (io.operation.f7 === F7_Z) ? shiftRI | shiftRAI
        }
      }
    }
    is(isBranch){
      // compare instructions for branches result in boolean results
      switch(io.operation.f3){
        is(F3_BEQ){
          io.output_bool := equal
        }
        is(F3_BNE){
          io.output_bool := unequal
        }
        is(F3_BLT){
          io.output_bool := lt_s
        }
        is(F3_BGE){
          io.output_bool := ge_s
        }
        is(F3_BLTU){
          io.output_bool := lt_u
        }
        is(F3_BGEU){
          io.output_bool := ge_u
        }
      }
    }
  }
}
  