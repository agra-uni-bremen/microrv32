// package SC_RV32I.Core

// import spinal.core._
// import SC_RV32I.Core.RVOpcode._
// import SC_RV32I.Core.InstructionType._
// import SC_RV32I.Core.InstructionType
// import SC_RV32I.Core.DecodeFields._
// import javax.swing.text.html.HTML.Tag

// //SpinalEnum is used to fulfill multiplexer with method 'switch'.('mux' can't be used to SpinalEnum)
// //Abstract literals is more readable then binaries to choose the signals.

// //pc source
// object pcSrc extends SpinalEnum {
//     val PCTarget, PCIncrement, ALURes, PCDefault = newElement() 
// }

// case class pcControl() extends Bundle {
//     val PCSrc = out (pcSrc())
// }

// //Control signal of register between NextPC and PC
// //There should implement a mux to choose the outside address(initial pc) or the outcome of the pcSrc
// case class regControl() extends Bundle {
//     //'sample' is used as the enable signal to the reg (built in the TopLevel)
//     val sample = out Bool()
// }

// //instruction memory fetch
// //'request' presents the enable signal for Instruction Memory
// // case class instMemFetch() extends Bundle {
// //     val request = out Bool() 
// // }

// //RegisterFile
// //Control signal works on RF is the write part, functioned in the WriteBack
// object destDataSel extends SpinalEnum { //The signals that writeback to registerfiles
//     val ALURes, MemRes, PCIncrement, PCTarget = newElement() //In 'pcSrc', there also exist a data type named 'PCIncrement' and 'PCTarget', but actually theyhave no overrapped. 
// } 

// case class rfControl() extends Bundle {
//     val WriteEna = out Bool() 
//     val DestDataSel = out (destDataSel())
// }

// //ALU: ALUToplevel includes 2 different modules.
// //The regular ALU operation can't be defined now. Specific operation must defined inside the ALU according to different instructionFiled.
// //Because some InstructionType may include many operations (RegReg, RegImm)

// object aluSrc1 extends SpinalEnum {
//     val opReg1Data, opZero = newElement //opZero is ready for the LUI and default type, which means the outcome in Regular ALU is negligible
// }

// object aluSrc2 extends SpinalEnum {
//     val opReg2Data, opImm, opZero = newElement //opZero is ready for default type, which means the outcome in Regular ALU is negligible
// }

// case class aluControl() extends Bundle {
//     val ALUSrc1 = out (aluSrc1())
//     val ALUSrc2 = out (aluSrc2())
//     val ALUBranch = in Bool() //This signal coming from the ALU to tell ControlUnit if there are branch or not.
// }

// //Data Memory
// object MemoryStrobeSelect extends SpinalEnum {
//     val byte, halfWord, word = newElement
// }

// case class memDataControl() extends Bundle {
//     val request = out Bool() //Asking for the write and read
//     val MemWrite = out Bool() //Write/Read
//     val strobeSel = out (MemoryStrobeSelect()) //The side of read/write
//     // val readSign = out Bool() //New added, To distinguish the LB/LBU and LH/LHU, then delivered the signal to SBRV32Core
//     val ready = in Bool()
//     val busy = in Bool() //New added
// }

// //Bundles of ControlUnit
// case class ControlUnitBundle() extends Bundle {
//     val instType = in (InstructionType())
//     val instFields = in (DecodeFields()) 
//     val PCControl = out (pcControl())
//     val RFControl = out (rfControl())
//     val ALUControl = aluControl()
//     val MemDataControl = memDataControl()
//     val RegControl = out (regControl())

//     val halt = in Bool()
//     val halted = out Bool()
// }

// class ControlUnit() extends Component {
//     val io = new ControlUnitBundle()

//     switch(io.instType) {
//         is(isLUI) {
//             //ALU
//             io.ALUControl.ALUSrc1 := aluSrc1.opZero
//             io.ALUControl.ALUSrc2 := aluSrc2.opImm
//             //Mem: The default state of mem
//             io.MemDataControl.request := False
//             io.MemDataControl.MemWrite := False
//             io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//             // io.MemDataControl.readSign := False
//             //RF
//             io.RFControl.WriteEna := True
//             io.RFControl.DestDataSel := destDataSel.ALURes
//             //pc Source
//             io.PCControl.PCSrc := pcSrc.PCIncrement
//             //reg Control
//             // io.RegControl.sample := True
//             //io.halted: invalid
//             // io.halted := False
//         }
//         is(isAUIPC) {
//             //ALU: default state
//             io.ALUControl.ALUSrc1 := aluSrc1.opZero
//             io.ALUControl.ALUSrc2 := aluSrc2.opZero
//             //Mem: default state
//             io.MemDataControl.request := False
//             io.MemDataControl.MemWrite := False
//             io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//             // io.MemDataControl.readSign := False
//             //RF
//             io.RFControl.WriteEna := True
//             io.RFControl.DestDataSel := destDataSel.PCTarget
//             //pcSrc
//             io.PCControl.PCSrc := pcSrc.PCIncrement
//             //reg Control
//             // io.RegControl.sample := True
//             //io.halted: invalid
//             // io.halted := False
//         }
//         is(isJAL) {
//             //ALU: default state
//             io.ALUControl.ALUSrc1 := aluSrc1.opZero
//             io.ALUControl.ALUSrc2 := aluSrc2.opZero
//             //Mem: default state
//             io.MemDataControl.request := False
//             io.MemDataControl.MemWrite := False
//             io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//             // io.MemDataControl.readSign := False
//             //RF
//             io.RFControl.WriteEna := True
//             io.RFControl.DestDataSel := destDataSel.PCIncrement
//             //pcSrc
//             io.PCControl.PCSrc := pcSrc.PCTarget
//             //reg Control
//             // io.RegControl.sample := True
//             //io.halted: invalid
//             // io.halted := False
//         }
//         is(isJALR) {
//             //ALU. 
//             io.ALUControl.ALUSrc1 := aluSrc1.opReg1Data
//             io.ALUControl.ALUSrc2 := aluSrc2.opImm
//             //Mem: default type
//             io.MemDataControl.request := False
//             io.MemDataControl.MemWrite := False
//             io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//             // io.MemDataControl.readSign := False
//             //RF
//             io.RFControl.WriteEna := True
//             io.RFControl.DestDataSel := destDataSel.PCIncrement
//             //pcSrc
//             io.PCControl.PCSrc := pcSrc.ALURes //only source for ALURes
//             //reg Control
//             // io.RegControl.sample := True
//             //io.halted: invalid
//             // io.halted := False
//         }
//         is(isBRANCH) { 
//             //ALU. 
//             io.ALUControl.ALUSrc1 := aluSrc1.opReg1Data
//             io.ALUControl.ALUSrc2 := aluSrc2.opReg2Data
//             //Mem: default type
//             io.MemDataControl.request := False
//             io.MemDataControl.MemWrite := False
//             io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//             // io.MemDataControl.readSign := False
//             //RF: default state
//             io.RFControl.WriteEna := False
//             io.RFControl.DestDataSel := destDataSel.ALURes
//             //pcSrc: pc value should be waited until the outcome of alu
//             when (io.ALUControl.ALUBranch) { //Always assume the branch will happen
//                 io.PCControl.PCSrc := pcSrc.PCTarget
//             } otherwise {
//                 io.PCControl.PCSrc := pcSrc.PCIncrement
//             }
//             //reg Control
//             // io.RegControl.sample := True
//             //io.halted: invalid
//             // io.halted := False
//         }
//         is(isLOAD) {
//             //ALU
//             io.ALUControl.ALUSrc1 := aluSrc1.opReg1Data
//             io.ALUControl.ALUSrc2 := aluSrc2.opImm
//             //part of the Mem: transmit the parameters' signal
//             // io.MemDataControl.request := True
//             io.MemDataControl.MemWrite := False
//             switch(io.instFields.funct3){
//                 is(F3_LB, F3_LBU) {
//                     io.MemDataControl.strobeSel := MemoryStrobeSelect.byte
//                 }
//                 is(F3_LH, F3_LHU) {
//                     io.MemDataControl.strobeSel := MemoryStrobeSelect.halfWord
//                 }
//                 is(F3_LW) {
//                     io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//                 }
//                 default {
//                     io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//                 }
//             }
//             //pcSrc
//             io.PCControl.PCSrc := pcSrc.PCIncrement
//             //RF, pcSrc, and regControl
//             val opFinish = RegNext(io.MemDataControl.busy & io.MemDataControl.ready) //'opFinish' is a flag to show mem access is finished
//             when (opFinish) { //have received the completed signal
//                 //'request' of Mem: Stopped
//                 io.MemDataControl.request := False //Once the operation is performed, the requesting is set inactive immediately.
//                 //RF: 
//                 io.RFControl.WriteEna := True //immediately enter the read value to RF
//                 io.RFControl.DestDataSel := destDataSel.MemRes //Must take care that LH and LB must be procesed from raw value
//                 //regControl:
//                 // io.RegControl.sample := True
//             } otherwise { //haven't received the complete related signal.
//                 //'request' of Mem
//                 io.MemDataControl.request := True
//                 //RF: invalid state
//                 io.RFControl.WriteEna := False
//                 io.RFControl.DestDataSel := destDataSel.MemRes //Must take care that LH and LB must be procesed from raw value
//                 //regControl: invalid state
//                 // io.RegControl.sample := False
//             }
//             //io.halted: invalid
//             // io.halted := False
//         }
//         is(isSTORE) {
//             //ALU
//             io.ALUControl.ALUSrc1 := aluSrc1.opReg1Data
//             io.ALUControl.ALUSrc2 := aluSrc2.opImm
//             //part of the Mem: transmit the parameters' signal
//             // io.MemDataControl.request := True
//             io.MemDataControl.MemWrite := True
//             switch(io.instFields.funct3){
//                 is(F3_SB) {
//                     io.MemDataControl.strobeSel := MemoryStrobeSelect.byte
//                 }
//                 is(F3_SH) {
//                     io.MemDataControl.strobeSel := MemoryStrobeSelect.halfWord
//                 }
//                 is(F3_SW) {
//                     io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//                 }
//                 default {
//                     io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//                 }
//             }
//             //RF: default state
//             io.RFControl.WriteEna := False
//             io.RFControl.DestDataSel := destDataSel.ALURes
//             //pcSrc
//             io.PCControl.PCSrc := pcSrc.PCIncrement
//             //regControl, 'request' of Mem
//             val opFinish = RegNext(io.MemDataControl.busy & io.MemDataControl.ready) // The cycle closely after the success of processing data
//             when (opFinish) {
//                 // switch(io.halt) {
//                 //     is(True) { //The immediate moment of shutdown 
//                 //         //'request' of Mem: When this request completed, the request signal is set invalid
//                 //         io.MemDataControl.request := False
//                 //         //regControl: invalid
//                 //         io.RegControl.sample := False
//                 //         //io.halted: invalid
//                 //         io.halted := True
//                 //     }
//                     // is(False) { //Mem, or the Shutdown is incorrect
//                         //'request' of Mem: When this request completed, the request signal is set invalid
//                         io.MemDataControl.request := False
//                         //regControl
//                         // io.RegControl.sample := True
//                         //io.halted: invalid
//                         // io.halted := False
//                     // }
//                 // }
//             } otherwise { 
//                 // switch(io.halt) {
//                 //     is(True) { //Shutdown: The Control Unit will forever stuck into this state. Same as the 'opFinish' active state alive
//                 //         //'request' of Mem: invalid
//                 //         io.MemDataControl.request := False
//                 //         //regControl : invalid state
//                 //         io.RegControl.sample := False
//                 //         //io.halted: invalid
//                 //         io.halted := True
//                 //     }
//                     // is(False) { //Sending request to Shutdown or Mem
//                         //'request' of Mem
//                         io.MemDataControl.request := True
//                         //regControl : invalid state
//                         // io.RegControl.sample := False
//                         //io.halted: invalid
//                         // io.halted := False
//                     // }
//                 // }
//             }
//         }                    
//         is(isRegImm) {
//             //ALU. 
//             //Pls take care that this instruction type includes 'SLLI', 'SRLI' and 'SRAI'. 
//             io.ALUControl.ALUSrc1 := aluSrc1.opReg1Data
//             io.ALUControl.ALUSrc2 := aluSrc2.opImm //neglectable when instruction is 'SLLI', 'SRLI' and 'SRAI'. 
//             //Mem: default state
//             io.MemDataControl.request := False
//             io.MemDataControl.MemWrite := False
//             io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//             // io.MemDataControl.readSign := False
//             //RF: default state
//             io.RFControl.WriteEna := True
//             io.RFControl.DestDataSel := destDataSel.ALURes
//             //pcSrc
//             io.PCControl.PCSrc := pcSrc.PCIncrement
//             //reg Control
//             // io.RegControl.sample := True
//             //io.halted: invalid
//             // io.halted := False
//         }
//         is(isRegReg) { 
//             //ALU. 
//             io.ALUControl.ALUSrc1 := aluSrc1.opReg1Data
//             io.ALUControl.ALUSrc2 := aluSrc2.opReg2Data
//             //Mem: default state
//             io.MemDataControl.request := False
//             io.MemDataControl.MemWrite := False
//             io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//             // io.MemDataControl.readSign := False
//             //RF
//             io.RFControl.WriteEna := True
//             io.RFControl.DestDataSel := destDataSel.ALURes
//             //pc
//             io.PCControl.PCSrc := pcSrc.PCIncrement
//             //reg Control
//             // io.RegControl.sample := True
//             //io.halted: invalid
//             // io.halted := False
//         }
//         // 'isFENCE', 'isECALL' and 'isUndef' are all treated as default, which is 'NOP'
//         // Including instruction NOP. NOP consists of the 3 types above, and other NOP.
//         default {
//             //ALU: default state
//             io.ALUControl.ALUSrc1 := aluSrc1.opZero
//             io.ALUControl.ALUSrc2 := aluSrc2.opZero
//             //Mem: default state
//             io.MemDataControl.request := False
//             io.MemDataControl.MemWrite := False
//             io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//             // io.MemDataControl.readSign := False
//             //RF: default state
//             io.RFControl.WriteEna := False
//             io.RFControl.DestDataSel := destDataSel.ALURes
//             //pc
//             io.PCControl.PCSrc := pcSrc.PCIncrement
//             //reg Control: 
//             // io.RegControl.sample := True
//             //io.halted: invalid
//             // io.halted := False
//         }
//     }

//     io.halted := io.halt

//     //reg control
//     val RegCondition = (!io.halt & !io.MemDataControl.request).setName("RegCondition")
//     when(RegCondition) {
//         io.RegControl.sample := True
//     } otherwise {
//         io.RegControl.sample := False
//     }

// }