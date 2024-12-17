package core.microrv32.rv32core

import spinal.core._
import core.microrv32.InstructionType
import core.microrv32.InstructionType._
import core.microrv32.CSRAccessType
import core.microrv32.CSRAccessType._
import core.microrv32.RVOpcode._
import core.microrv32.CSROpcode._
import core.microrv32.CSRAccessType
import core.microrv32.MULDIVOpcode._
import core.microrv32.RV32CoreConfig

case class DecodedFields() extends Bundle{
    val opcode = out Bits(7 bits)
    val src1 = out Bits(5 bits)
    val src2 = out Bits(5 bits)
    val dest = out Bits(5 bits)
    val funct3 = out Bits(3 bits)
    val funct7 = out Bits(7 bits)
    val funct12 = out Bits(12 bits)
    val shamt = out Bits(5 bits)
    val csr = out Bits(12 bits)
}

case class DecodeBundle() extends Bundle{
    // fetched instruction
    val instruction = in Bits(32 bits)
    // fields from the instruction, rs1, rs2, dest, opcode, etc.
    val fields = out(DecodedFields())
    // sign extended immediate values
    // val extendedImms = in(EUtoDec())
    // sign extened immediate from fetched instruction 
    val immediate = out Bits(32 bits)
    val csr_uimm = out Bits(5 bits)
    // valid decoding?
    val decodeValid = out Bool()
    // instruction enum
    val instType = out(InstructionType())
    val csrType = out(CSRAccessType())
}

class DecodeUnit(val cfg : RV32CoreConfig) extends Component{
    val io = new DecodeBundle()

    val extender = new ExtensionUnit()
    
    // data signals and registers
    // val instruction = Reg(Bits(32 bits)) init(0)
    val instruction = Bits(32 bits)
    val opcode = Bits(7 bits)
    val source1 = Bits(5 bits)
    val source2 = Bits(5 bits)
    val destination = Bits(5 bits)
    val immediate = Bits(32 bits)
    val funct3 = Bits(3 bits)
    val funct7 = Bits(7 bits)
    val funct12 = Bits(12 bits)
    val shamt = Bits(5 bits)

    // csr extension
    val csr = Bits(12 bits)
    val csr_uimm = Bits(5 bits)
    
    // control signals
    val decoded = Bool
    val iType = InstructionType()
    val csr_accType = CSRAccessType()
    
    // default values
    iType := InstructionType.isUndef
    csr_accType := CSRidle
    decoded := False
    
    instruction := io.instruction
    extender.io.instruction := instruction

    // instruction fields
    opcode := instruction(6 downto 0)
    source1 := instruction(19 downto 15)
    source2 := instruction(24 downto 20)
    destination := instruction(11 downto 7)
    immediate := B(0, 32 bits)
    funct3 := instruction(14 downto 12)
    funct7 := instruction(31 downto 25)
    funct12 := instruction(31 downto 20)
    shamt := instruction(24 downto 20)
    // csr extension  
    csr := instruction(31 downto 20)
    csr_uimm := instruction(19 downto 15)

    // check for 7 bit opcode to determine type of instruction
    // for later: ensure 0 opcode is not allowed, currently its handled as illegal instruction that does not stop the fsm
    // FIXME test if making two switch statements, one for iType and one for immediate, reduces generated verilog?
    switch(opcode, strict = false){
        is(OP_REGREG){
            when((funct7 === F7_Z) | (funct7 === F7_O && (funct3 === F3_SUB || funct3 === F3_SRA))){
                decoded := True
                iType := InstructionType.isRegReg
            }
            if(cfg.hasMULDIV){
                    when(funct7 === F7_MULDIV){
                        decoded := True
                        iType := InstructionType.isRegReg
                    }
            }
            
        }
        is(OP_REGIMM){
            // TODO: refactor numeric constants into masks in RV32Opcode.scla (i.e funct3 =/= "-01" --> 001=1, 101=5)
            when((funct3 =/= 1  && funct3 =/= 5) || (funct3 === 1 && funct7 === F7_Z) || (funct3 === 5 && (funct7 === F7_Z || funct7 === F7_O))){
                decoded := True
                iType := InstructionType.isRegImm        
                immediate := extender.io.i_imm
            }
        }
        is(OP_BRANCH){
            when(funct3 === F3_BEQ || funct3 === F3_BNE || funct3 === F3_BLT || funct3 === F3_BGE || funct3 === F3_BLTU || funct3 === F3_BGEU){
                decoded := True
                iType := InstructionType.isBranch
                immediate := extender.io.b_imm
            }
        }
        is(OP_LOAD){
            when(funct3 === F3_LB || funct3 === F3_LH || funct3 === F3_LW || funct3 === F3_LBU || funct3 === F3_LHU){
                decoded := True
                iType := InstructionType.isLoad
                immediate := extender.io.i_imm
            }
        }
        is(OP_STORE){
            when(funct3 === F3_SB || funct3 === F3_SH || funct3 === F3_SW){
                decoded := True
                iType := InstructionType.isStore
                immediate := extender.io.s_imm
            }
        }
        is(OP_LUI){
            decoded := True
            iType := InstructionType.isLUI
            immediate := extender.io.u_imm
        }
        is(OP_AUIPC){
            decoded := True
            iType := InstructionType.isAUIPC
            immediate := extender.io.u_imm
        }
        is(OP_JAL){
            decoded := True
            iType := InstructionType.isCT_JAL
            immediate := extender.io.j_imm
        }
        is(OP_JALR){
            when(funct3 === F3_JALR){
                decoded := True
                iType := InstructionType.isCT_JALR
                immediate := extender.io.i_imm
            }
        }
        is(OP_FENCE){
            when(funct3 === F3_FENCE | funct3 === F3_FENCE_I){
                decoded := True
                iType := InstructionType.isFence
            }
        }
        is(OP_ECALL,OP_CSR){
            when(funct12 === F12_ECALL & source1 === 0 & funct3 === 0 & destination === 0){
                decoded := True 
                iType := InstructionType.isECall
            }.elsewhen(funct12 === F12_MRET & source1 === 0 & funct3 === 0 & destination === 0){
                decoded := True
                iType := InstructionType.isTrapReturn
            }.elsewhen(funct3 =/= F3_CSR_DECODEMASK){
                decoded := True
                iType := InstructionType.isCSR
                // immediate csr dont need rs1 to be loaded in decode state
                // and immediate csr have third bit of funct3 == 1
                when(funct3(2)){
                    iType := InstructionType.isCSRImm
                }
                switch(funct3){
                    is(F3_CSRRW,F3_CSRRWI){
                        csr_accType := CSRwrite
                    }
                    is(F3_CSRRS,F3_CSRRSI){
                        csr_accType := CSRset
                    }
                    is(F3_CSRRC,F3_CSRRCI){
                        csr_accType := CSRclear
                    }
              }
            }
        }
        // 'OP_ZEROS' refers to the instruction in which the opcode field is all 0. 
        // This should be treated as illegal instruction
        is(OP_ZEROS){ 
            decoded := False
            iType := InstructionType.isIllegal
        }
        default{
            iType := InstructionType.isUndef
            decoded := False
        }
    }
    
    io.fields.opcode := opcode
    io.fields.src1 := source1
    io.fields.src2 := source2
    io.fields.dest := destination
    io.fields.funct3 := funct3
    io.fields.funct7 := funct7
    io.fields.funct12 := funct12
    io.fields.shamt := shamt
    io.fields.csr := csr
    io.instType := iType
    io.immediate := immediate
    io.csr_uimm := csr_uimm
    io.decodeValid := decoded
    io.csrType := csr_accType
}