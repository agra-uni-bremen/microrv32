package PP_RV32I.Core

import spinal.core._
import PP_RV32I.Core.RVOpcode._
import PP_RV32I.Core.InstructionType._
import PP_RV32I.Core.InstructionType
import PP_RV32I.Core.DecodeFields._

import javax.swing.text.html.HTML.Tag
import scala.collection.mutable.ArrayBuffer

//SpinalEnum is used to fulfill multiplexer with method 'switch'.('mux' can't be used to SpinalEnum)
//Abstract literals is more readable then binaries to choose the signals.

//In PP control signal desgin, all the in ports are deleted. All the subsequent control signal will be delivered at core file.

//pc source
object pcSrc extends SpinalEnum {
    val PCTarget, PCIncrement, ALURes = newElement() 
}

case class pcControl() extends Bundle {
    val PCSrc = pcSrc()
}

//RegisterFile
//Control signal works on RF is the write part, functioned in the WriteBack
object destDataSel extends SpinalEnum { //The signals that writeback to registerfiles
    val ALURes, MemRes, PCIncrement, PCTarget = newElement() //In 'pcSrc', there also exist a data type named 'PCIncrement' and 'PCTarget', but actually theyhave no overrapped. 
} 

case class rfControl() extends Bundle {
    val WriteEna = Bool() 
    val DestDataSel = destDataSel()
}

//ALU: ALUToplevel includes 2 different modules.
//The regular ALU operation can't be defined now. Specific operation must defined inside the ALU according to different instructionFiled.
//Because some InstructionType may include many operations (RegReg, RegImm)

object aluSrc1 extends SpinalEnum {
    val opReg1Data, opZero = newElement //opZero is ready for the LUI and default type, which means the outcome in Regular ALU is negligible
}

object aluSrc2 extends SpinalEnum {
    val opReg2Data, opImm, opZero = newElement //opZero is ready for default type, which means the outcome in Regular ALU is negligible
}

case class aluControl() extends Bundle {
    val ALUSrc1 = aluSrc1()
    val ALUSrc2 = aluSrc2()
    // val ALUBranch = in Bool() //This signal coming from the ALU to tell ControlUnit if there are branch or not.
}

//Data Memory
object MemoryStrobeSelect extends SpinalEnum {
    val byte, halfWord, word = newElement
}

case class memDataControl() extends Bundle {
    val request = Bool() //Asking for the write and read
    val MemWrite = Bool() //Write/Read
    val strobeSel = MemoryStrobeSelect() //The side of read/write
    // val ready = in Bool()
    // val busy = in Bool() 
}

//Bundles of ControlUnit
//control signals
case class control() extends Bundle {
    val PCControl = out (pcControl()) //Determine the src of nextPC
    val RFControl = out (rfControl())
    val ALUControl = out (aluControl())
    val MemDataControl = out (memDataControl())
}
//flag signals
case class flag() extends Bundle {
    val instType = in (InstructionType())
    val instFields = in (DecodeFields()) 
    // val StageEna = out (stageEna()) //not only the enable signal for control signal registers, but also for operator registers

    // val halt = in Bool()
    // val halted = out Bool()
}
//Gross !!!!!!!Under modification!!!!!!!!!!
case class ControlUnitBundle() extends Bundle {
    val Flag = flag()
    val Control = control()
    // val EXEControl = exeControl()
    // val MEMControl = memControl()
    // val WBControl = wbControl()
    // val IFControl = ifControl()
}

class ControlUnit() extends Component {
    val io = new ControlUnitBundle()

    //Define middle variants for control signal
    val PCSrc = pcSrc()
    io.Control.PCControl.PCSrc := PCSrc
    val WriteEna = new Bool()
    io.Control.RFControl.WriteEna := WriteEna
    val DestDataSel = destDataSel()
    io.Control.RFControl.DestDataSel := DestDataSel
    val ALUSrc1 = aluSrc1()
    io.Control.ALUControl.ALUSrc1 := ALUSrc1
    val ALUSrc2 = aluSrc2()
    io.Control.ALUControl.ALUSrc2 := ALUSrc2
    val Request = Bool()
    io.Control.MemDataControl.request := Request
    val MemWrite = Bool()
    io.Control.MemDataControl.MemWrite := MemWrite
    val StrobeSel = MemoryStrobeSelect()
    io.Control.MemDataControl.strobeSel := StrobeSel

    //Control signals generation
    //!!!!NEED MODIFICATION!!!!!Branch/Load/Store!!!!!!
    switch(io.Flag.instType) {
        is(isLUI) {
            //ALU
            ALUSrc1 := aluSrc1.opZero
            ALUSrc2 := aluSrc2.opImm
            //Mem: The default state of mem
            Request := False
            MemWrite := False
            StrobeSel := MemoryStrobeSelect.word
            //RF
            WriteEna := True
            DestDataSel := destDataSel.ALURes
            //pc Source
            PCSrc := pcSrc.PCIncrement
        }
        is(isAUIPC) {
            //ALU: default state
            ALUSrc1 := aluSrc1.opZero
            ALUSrc2 := aluSrc2.opZero
            //Mem: default state
            Request := False
            MemWrite := False
            StrobeSel := MemoryStrobeSelect.word
            //RF
            WriteEna := True
            DestDataSel := destDataSel.PCTarget
            //pcSrc
            PCSrc := pcSrc.PCIncrement
        }
        is(isJAL) {
            //ALU: default state
            ALUSrc1 := aluSrc1.opZero
            ALUSrc2 := aluSrc2.opZero
            //Mem: default state
            Request := False
            MemWrite := False
            StrobeSel := MemoryStrobeSelect.word
            //RF
            WriteEna := True
            DestDataSel := destDataSel.PCIncrement
            //pcSrc
            PCSrc := pcSrc.PCTarget
        }
        is(isJALR) {
            //ALU. 
            ALUSrc1 := aluSrc1.opReg1Data
            ALUSrc2 := aluSrc2.opImm
            //Mem: default type
            Request := False
            MemWrite := False
            StrobeSel := MemoryStrobeSelect.word
            //RF
            WriteEna := True
            DestDataSel := destDataSel.PCIncrement
            //pcSrc
            PCSrc := pcSrc.ALURes //only source for ALURes
        }
        is(isBRANCH) { 
            //ALU. 
            ALUSrc1 := aluSrc1.opReg1Data
            ALUSrc2 := aluSrc2.opReg2Data
            //Mem: default type
            Request := False
            MemWrite := False
            StrobeSel := MemoryStrobeSelect.word
            //RF: default state
            WriteEna := False
            DestDataSel := destDataSel.PCIncrement //Meaningless 
            //pcSrc: 
            //The final outcome will wait until the EXE stage.
            PCSrc := pcSrc.PCIncrement //Default operation is not jumping
            // when (ALUBranch) { //Always assume the branch will happen
            //     PCSrc := pcSrc.PCTarget
            // } otherwise {
            //     PCSrc := pcSrc.PCIncrement
            // }
        }
        is(isLOAD) {
            //ALU
            ALUSrc1 := aluSrc1.opReg1Data
            ALUSrc2 := aluSrc2.opImm
            //Mem
            Request := True
            MemWrite := False
            switch(io.Flag.instFields.funct3){
                is(F3_LB, F3_LBU) {
                    StrobeSel := MemoryStrobeSelect.byte
                }
                is(F3_LH, F3_LHU) {
                    StrobeSel := MemoryStrobeSelect.halfWord
                }
                is(F3_LW) {
                    StrobeSel := MemoryStrobeSelect.word
                }
                default {
                    StrobeSel := MemoryStrobeSelect.word
                }
            }
            //pcSrc
            PCSrc := pcSrc.PCIncrement
            //RF
            WriteEna := True
            DestDataSel := destDataSel.MemRes
        }
        is(isSTORE) {
            //ALU
            ALUSrc1 := aluSrc1.opReg1Data
            ALUSrc2 := aluSrc2.opImm
            //part of the Mem: transmit the parameters' signal
            Request := True
            MemWrite := True
            switch(io.Flag.instFields.funct3){
                is(F3_SB) {
                    StrobeSel := MemoryStrobeSelect.byte
                }
                is(F3_SH) {
                    StrobeSel := MemoryStrobeSelect.halfWord
                }
                is(F3_SW) {
                    StrobeSel := MemoryStrobeSelect.word
                }
                default {
                    StrobeSel := MemoryStrobeSelect.word
                }
            }
            //RF: default state
            WriteEna := False
            DestDataSel := destDataSel.ALURes
            //pcSrc
            PCSrc := pcSrc.PCIncrement
        }                    
        is(isRegImm) {
            //ALU. 
            //Pls take care that this instruction type includes 'SLLI', 'SRLI' and 'SRAI'. 
            ALUSrc1 := aluSrc1.opReg1Data
            ALUSrc2 := aluSrc2.opImm //neglectable when instruction is 'SLLI', 'SRLI' and 'SRAI'. 
            //Mem: default state
            Request := False
            MemWrite := False
            StrobeSel := MemoryStrobeSelect.word
            //RF: default state
            WriteEna := True
            DestDataSel := destDataSel.ALURes
            //pcSrc
            PCSrc := pcSrc.PCIncrement
        }
        is(isRegReg) { 
            //ALU. 
            ALUSrc1 := aluSrc1.opReg1Data
            ALUSrc2 := aluSrc2.opReg2Data
            //Mem: default state
            Request := False
            MemWrite := False
            StrobeSel := MemoryStrobeSelect.word
            //RF
            WriteEna := True
            DestDataSel := destDataSel.ALURes
            //pc
            PCSrc := pcSrc.PCIncrement
        }
        // 'isFENCE', 'isECALL', 'isIllegal' and 'isUndef' are all treated as default, which is 'NOP'
        // Including instruction NOP. NOP consists of the 3 types above, and other NOP.
        default {
            //ALU: default state
            ALUSrc1 := aluSrc1.opZero
            ALUSrc2 := aluSrc2.opZero
            //Mem: default state
            Request := False
            MemWrite := False //meaningless
            StrobeSel := MemoryStrobeSelect.word //meaningless
            //RF: default state
            WriteEna := False 
            DestDataSel := destDataSel.ALURes //meaningless
            //pc
            PCSrc := pcSrc.PCIncrement
        }
    }

}