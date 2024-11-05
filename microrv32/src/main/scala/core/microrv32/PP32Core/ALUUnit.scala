package PP_RV32I.Core

import spinal.core._
import spinal.lib._
import PP_RV32I.Core.InstructionType._
import PP_RV32I.Core.RVOpcode._
import PP_RV32I.Core.aluSrc1
import PP_RV32I.Core.aluSrc2

//ALU Source Selection Unit
// class ALUSrcSelection() extends Component {
//     val io = new Bundle {
//         val Src1Sel = in (aluSrc1())
//         val Src2Sel = in (aluSrc2())
//         val Imm, RD1, RD2 = in (Bits(32 bits))
//         val opA, opB = out (Bits(32 bits))
//     }

//     switch(io.Src1Sel) {
//         is(aluSrc1.opReg1Data) {
//             io.opA := io.RD1
//         }
//         is(aluSrc1.opZero) {
//             io.opA := B(0, 32 bits)
//         }
//     }

//     switch(io.Src2Sel) {
//         is(aluSrc2.opReg2Data) {
//             io.opB := io.RD2
//         }
//         is(aluSrc2.opImm) {
//             io.opB := io.Imm
//         }
//         is(aluSrc2.opZero) {
//             io.opB := B(0, 32 bits)
//         }
//     }
// }

// PCIncrement is edited in other component. This would be better to 
class PCTarget() extends Component {
    val io = new Bundle {
        val PC = in UInt(32 bits)
        val Imm = in Bits(32 bits)
        val PCTarget = out UInt(32 bits) 
    }

    io.PCTarget := (io.PC.asSInt + io.Imm.asSInt).asUInt
    
}

class ALU() extends Component {
    val io = new Bundle {
        val instType = in (InstructionType())
        // val   = in (DecodeFields()) //Please don't use this, because 'DecodeFields' is a Bundle instead of SpinalEnum
        val funct3 = in Bits(3 bits)
        val funct7 = in Bits(7 bits)

        val op1, op2 = in Bits(32 bits)//Will connect to 'opA' and 'opB' above.
        val shamt = in Bits(5 bits) //shamt has a single port

        val ALUResult = out Bits(32 bits) //These are outcomes from 3 different architectures.
        val ALUBranch = out (Bool())
    }

    //Calculation Unit: Including the RegularALU and PCTarget.
    val opA = io.op1
    val opB = io.op2

    //RegularALU
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
    val shiftLL = Bits(32 bits)
    val shiftRL = Bits(32 bits)
    val shiftRA = Bits(32 bits)
    val shiftLLI = Bits(32 bits)
    val shiftRLI = Bits(32 bits)
    val shiftRAI = Bits(32 bits)

    add := (opA.asUInt + opB.asUInt).asBits //Bits data type
    sub := (opA.asUInt - opB.asUInt).asBits
    equal := opA === opB //Bool data type
    unequal := !equal
    lt_u := opA.asUInt < opB.asUInt
    lt_s := opA.asSInt < opB.asSInt
    ge_u := opA.asUInt >= opB.asUInt
    ge_s := opA.asSInt >= opB.asSInt
    bitAnd := opA & opB
    bitOr := opA | opB
    bitXor := opA ^ opB
    shiftLL := opA |<< (opB(4 downto 0).asUInt) //'|<<' means logically shift left 
    shiftRL := opA |>> (opB(4 downto 0).asUInt) //'|>>' means logically shift right 
    shiftRA := (opA.asSInt >> opB(4 downto 0).asUInt).asBits
    shiftLLI := opA |<< io.shamt.asUInt
    shiftRLI := opA |>> io.shamt.asUInt
    shiftRAI := (opA.asSInt >> io.shamt.asUInt).asBits

    //initial value for output
    io.ALUResult := B(0, 32 bits)
    io.ALUBranch := False

    switch (io.instType, strict = false) {
        is(isLUI, isAUIPC, isJAL, isLOAD, isSTORE, isUndef, isECALL, isFENCE, isIllegal) {
            io.ALUResult := add
            io.ALUBranch := False
        }
        is(isJALR) { //JALR instruction will set the LSB of add result into 0 compulsorily
            io.ALUResult := B(32 bits, (31 downto 1) -> add(31 downto 1), 0 -> False)
            io.ALUBranch := False
        }
        is(isBRANCH) {
            switch(io.funct3) {
                is(F3_BEQ) {
                    io.ALUResult := sub //Careless data
                    io.ALUBranch := equal
                }
                is(F3_BNE) {
                    io.ALUResult := sub
                    io.ALUBranch := unequal
                }
                is(F3_BLT) {
                    io.ALUResult := sub
                    io.ALUBranch := lt_s
                }
                is(F3_BGE) {
                    io.ALUResult := sub
                    io.ALUBranch := ge_s
                }
                is(F3_BLTU) {
                    io.ALUResult := sub
                    io.ALUBranch := lt_u
                }
                is(F3_BGEU) {
                    io.ALUResult := sub
                    io.ALUBranch := ge_u
                }
            }
        }
        is(isRegImm) {
            switch(io.funct3, strict = false) {
                is(F3_ADDI) {
                    io.ALUResult := add
                    io.ALUBranch := False
                }
                is(F3_SLTI) {
                    val sel = Bool()
                    sel := lt_s
                    when(sel) {
                        io.ALUResult := B(1, 32 bits)
                    } otherwise { 
                        io.ALUResult := B(0, 32 bits)
                    }
                    io.ALUBranch := False
                }
                is(F3_SLTIU) {
                    when(lt_u) {
                        io.ALUResult := B(1, 32 bits)
                    } otherwise { 
                        io.ALUResult := B(0, 32 bits)
                    }
                    io.ALUBranch := False
                }
                is(F3_XORI) {
                    io.ALUResult := bitXor
                    io.ALUBranch := False
                }
                is(F3_ORI) {
                    io.ALUResult := bitOr
                    io.ALUBranch := False
                }
                is(F3_ANDI) {
                    io.ALUResult := bitAnd
                    io.ALUBranch := False
                }
                is(F3_SLLI) {
                    io.ALUResult := shiftLLI
                    io.ALUBranch := False
                }
                is(F3_SRLI, F3_SRAI) {
                    io.ALUResult := (io.funct7 === F7_Z) ? shiftRLI | shiftRAI
                    io.ALUBranch := False
                }
            }
        }
        is(isRegReg) {
            switch(io.funct3, strict = false) {
                is(F3_ADD, F3_SUB) {
                    io.ALUResult := (io.funct7 === F7_Z) ? add | sub
                    io.ALUBranch := False
                }
                is(F3_SLL) {
                    io.ALUResult := shiftLL
                    io.ALUBranch := False
                }
                is(F3_SLT) {
                    when(lt_s) {
                        io.ALUResult := B(1, 32 bits)
                    } otherwise {
                        io.ALUResult := B(0, 32 bits)
                    }
                    io.ALUBranch := False
                }
                is(F3_SLTU) {
                    when(lt_u) {
                        io.ALUResult := B(1, 32 bits)
                    } otherwise {
                        io.ALUResult := B(0, 32 bits)
                    }
                    io.ALUBranch := False
                }
                is(F3_XOR) {
                    io.ALUResult := bitXor
                    io.ALUBranch := False
                }
                is(F3_SRL, F3_SRA) {
                    io.ALUResult := (io.funct7 === F7_Z) ? shiftRL | shiftRA
                    io.ALUBranch := False
                }
                is(F3_OR) {
                    io.ALUResult := bitOr
                    io.ALUBranch := False
                }
                is(F3_AND) {
                    io.ALUResult := bitAnd
                    io.ALUBranch := False
                }
            }
        }
    }
}