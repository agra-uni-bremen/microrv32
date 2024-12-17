package PP_RV32I.Core

import spinal.core._
import PP_RV32I.Core.RVOpcode._ //All the content inside can be used by this file

//An abstract concept to tranfer the instruction information
//ECALL, EBREAK and FENCE can be treated as nop instruction.
object InstructionType extends SpinalEnum { 
    val isUndef, isRegReg, isRegImm, isBRANCH, isLOAD, isSTORE, 
    isJAL, isJALR, isLUI, isAUIPC, isECALL, isFENCE, isIllegal= newElement()
}  

case class DecodeFields() extends Bundle { //simply segmentation for instruction for
    val opcode = Bits(7 bits)
    val rs1 = Bits(5 bits)
    val rs2 = Bits(5 bits)
    val rd = Bits (5 bits)
    val funct3 = Bits(3 bits)
    val funct7 = Bits(7 bits)
    val funct12 = Bits(12 bits)
    val shamt = Bits(5 bits)
    // val csr = out Bits(12 bits)
}

case class DecodeBundle() extends Bundle {
    val Inst = in Bits(32 bits)
    val fields = out (DecodeFields()) 
    val instType = out (InstructionType())
    val ImmExt = out Bits(32 bits)
}

class InstDecoder() extends Component {
    val io = new DecodeBundle()   

    //Fields
    val opcode = Bits(7 bits)
    opcode := io.Inst(6 downto 0)
    val rs1 = Bits(5 bits)
    rs1 := io.Inst(19 downto 15) //5 bits
    val rs2 = Bits(5 bits)
    rs2 := io.Inst(24 downto 20)
    val rd = Bits(5 bits)
    rd := io.Inst(11 downto 7)
    val funct3 = Bits(3 bits)
    funct3 := io.Inst(14 downto 12)
    val funct7 = Bits(7 bits)
    funct7 := io.Inst(31 downto 25)
    val funct12 = Bits(12 bits)
    funct12 := io.Inst(31 downto 20)
    val shamt = Bits(5 bits)
    shamt := io.Inst(24 downto 20)
    val iType = InstructionType()
    iType := InstructionType.isUndef 
    //This initialized value must be settled, although this is a combinatorial logic

    //Immediates Generation
    //The generation of immediates is generated in a single module, instead of waiting the mux signals from ControlUnit
    val ImmExtension = new Area {
        val Iimm, Simm, Bimm, Uimm, Jimm = Bits(32 bits)
        Iimm := B(32 bits, (11 downto 0) -> io.Inst(31 downto 20), default -> io.Inst(31))
        Simm := B(32 bits, (10 downto 5) -> io.Inst(30 downto 25), (4 downto 0) -> io.Inst(11 downto 7), default -> io.Inst(31))
        Bimm := B(32 bits, 11 -> io.Inst(7), (10 downto 5) -> io.Inst(30 downto 25), (4 downto 1) -> io.Inst(11 downto 8), 0 -> False, default -> io.Inst(31))
        Uimm := B(32 bits, (31 downto 12) -> io.Inst(31 downto 12), default -> False)
        Jimm := B(32 bits, (19 downto 12) -> io.Inst(19 downto 12), 11 -> io.Inst(20), (10 downto 5) -> io.Inst(30 downto 25), (4 downto 1) -> io.Inst(24 downto 21), 0 -> False, default -> io.Inst(31))
        io.ImmExt := opcode.mux[Bits]( //'[]' means the outcome of the mux should be 'Bits' data type.
            (OP_LUI, OP_AUIPC) -> Uimm,
            OP_JAL -> Jimm,
            (OP_JALR, OP_LOAD, OP_REGIMM) -> Iimm,
            OP_BRANCH -> Bimm,
            OP_STORE -> Simm,
            default -> B(0, 32 bits)
        )
    }

    switch(opcode) {
        is(OP_LUI){
            iType := InstructionType.isLUI
        }
        is(OP_AUIPC){
            iType := InstructionType.isAUIPC
        }
        is(OP_JAL){
            iType := InstructionType.isJAL
        }
        is(OP_JALR){
            when (funct3 === F3_JALR){
                iType := InstructionType.isJALR
            }
        }
        is(OP_BRANCH){
            when (funct3 === F3_BEQ || funct3 === F3_BNE || funct3 === F3_BLT || funct3 === F3_BGE || funct3 === F3_BLTU || funct3 === F3_BGEU) {
                iType := InstructionType.isBRANCH
            }
        }
        is(OP_LOAD){
            when (funct3 === F3_LB || funct3 === F3_LH || funct3 === F3_LW || funct3 === F3_LBU || funct3 === F3_LHU) {
                iType := InstructionType.isLOAD
            }
        }
        is(OP_STORE){
            when (funct3 === F3_SB || funct3 === F3_SH || funct3 === F3_SW) {
                iType := InstructionType.isSTORE
            }
        }
        is(OP_REGIMM){
            when (((funct3 =/= B"001") && (funct3 =/= B"101")) || (((funct3 === F3_SLLI) || (funct3 === F3_SRLI)) && (funct7 === F7_Z)) || ((funct7 === F7_O) && (funct3 === F3_SRAI))) {
                iType := InstructionType.isRegImm
            }
        }

        is(OP_REGREG){
            when (((funct7 === F7_O) && ((funct3 === F3_SUB) || (funct3 === F3_SRA))) || (funct7 === F7_Z)) {
                iType := InstructionType.isRegReg
            }
        }
        is(OP_FENCE){
            when (funct3 === F3_FENCE) {
                iType := InstructionType.isFENCE
            }
        }
        //'InstructionType.isEcall' includes ECALL and EBREAK
        is(OP_ECALL){ 
            when ((funct12 === F12_ECALL) && (rs1 === 0) && (funct3 === 0) && (rd === 0)) {
                iType := InstructionType.isECALL
            }
        }
        is(OP_ZEROS){
            iType := InstructionType.isIllegal
        }
        default{ //decodeUnit classifies every instruction sent to CPU and ensure every format of different type is correct
            iType := InstructionType.isUndef
        }
    }

    io.fields.opcode := opcode
    io.fields.rs1 := rs1
    io.fields.rs2 := rs2
    io.fields.rd := rd
    io.fields.funct3 := funct3
    io.fields.funct7 := funct7
    io.fields.funct12 := funct12 
    io.fields.shamt := shamt
    // io.fields.csr := csr
    io.instType := iType
    // io.csr_uimm := csr_uimm
    // io.csrType := csr_accType

}