// import spinal.core._
// import spinal.lib._
// import spinal.lib.fsm._

// class SynchronousAdder(val N: Int) extends Component {
//   val io = new Bundle {
//     val enable = in Bool()
//     val dataIn = in UInt(N bits)
//     val result = out UInt(N bits)
//   }

//   // Register to hold the accumulated value
//   val accumulator = Reg(UInt(N bits)) init(0)
//   io.result := accumulator

//   // Define the states of the state machine
//   val fsm = new StateMachine {
//     val IDLE : State = new State with EntryPoint {
//       whenIsActive {
//         when(io.enable) {
//           goto(ADD)
//         }
//       }
//     }
//     val ADD : State = new State {
//       whenIsActive {
//         accumulator := accumulator + io.dataIn
//         goto(IDLE) // Return to IDLE after performing the addition
//       }
//     }
//   }
// }

// // Generate the Verilog code for the SynchronousAdder hardware design
// object SynchronousAdderVerilog {
//   def main(args: Array[String]): Unit = {
//     SpinalConfig(
//       defaultClockDomainFrequency = FixedFrequency(50 MHz), // Example clock frequency
//       targetDirectory = "rtl" // Directory to save the generated Verilog
//     )
//     .generateVerilog(new SynchronousAdder(16)) // Generate Verilog for 16-bit SynchronousAdder
//     .printPruned() // Print the pruned signals for debugging and optimization insights
//   }
// }


// case class SimpleBus(dataWidth:Int, addressWidth:Int) extends Bundle with IMasterSlave {
//   val SBaddress = UInt(addressWidth bits) 
//   val SBvalid = Bool
//   val SBwdata = Bits(dataWidth bits) 
//   val SBwrite = Bool
//   val SBsize = UInt(4 bits) 
//   val SBready = Bool
//   val SBrdata = Bits(dataWidth bits) 

//   override def asMaster(): Unit = {
//     out(SBvalid, SBaddress, SBwdata, SBwrite, SBsize)
//     in(SBready, SBrdata)
//   }
// }




// class Memory(memoryWidth : Bits, wordCount : Int, initFile : String) extends Component {
//   val io = new Bundle {
//     val sb = slave(SimpleBus(32,32))
//     val sel = in Bool()
//   }

//   // memory initiative
//   val memRam = new Mem(memoryWidth, wordCount)
//   if(initFile.isEmpty){
//     //…
//   }
//   else {
//     //…
//     memRam.init(Tools.readmemh(initFile))
//   }

//   //…
//   // READ MEMORY
//   val rdVal = memRam.readSync(
//     address = internalAddress,
//     enable = read
//   )
  
//   //WRITE MEMORY
//   //…
//   memRam.write(
//     address = internalAddress,
//     data = wdata,
//     enable = write,
//     mask = writemask
//   )
//   //…
// }


// //…
// val programCounter = Reg(UInt(32 bits)) init(U(cfg.startVector, 32 bits))
// //…

// io.memIF.IMem.address := programCounter.asBits
// //…

//   when(ctrlLogic.io.pcCtrl.enablePC){
//     programCounter := pcValMux
//   }
// //…

// class DecodeUnit(val cfg : RV32CoreConfig) extends Component{
//   //…
//   val opcode = Bits(7 bits)
//   val source1 = Bits(5 bits)
//   val source2 = Bits(5 bits)
//   val destination = Bits(5 bits)
//   val immediate = Bits(32 bits)
//   val funct3 = Bits(3 bits)
//   val funct7 = Bits(7 bits)
//   val funct12 = Bits(12 bits)
//   val shamt = Bits(5 bits)
//   //…
//   // instruction fields assignment
//   opcode := instruction(6 downto 0)
//   source1 := instruction(19 downto 15)
//   source2 := instruction(24 downto 20)
//   destination := instruction(11 downto 7)
//   immediate := B(0, 32 bits)
//   funct3 := instruction(14 downto 12)
//   funct7 := instruction(31 downto 25)
//   funct12 := instruction(31 downto 20)
//   shamt := instruction(24 downto 20)
//   //…
  
//   switch(opcode, strict = false){
//     //…
//     is(OP_JALR){
//         when(funct3 === F3_JALR){
//             decoded := True
//             iType := InstructionType.isCT_JALR
//             //…
//         }
//     }
//     //…
//   }
// }




// class ArithmeticLogicUnit() extends Component{
//   // io bundle  
//   val io = new ALUBundle()
  
//   //...
//   val equal = Bool
//   val shiftL = Bits(32 bits)
//   //…
//   equal := io.opA === io.opB
//   shiftL := io.opA |<< io.opB(4 downto 0).asUInt 
//   //…

//   io.output := 0
//   io.output_bool := False
  
//   switch(io.operation.instr, strict = false) {
//     is(isRegReg){
//         switch(io.operation.f3, strict = false){
//           is(F3_SLL){
//               io.output := shiftL
//           }
//           //…
//         }
//     }
//     //…
//     is(isBranch){
//       switch(io.operation.f3){
//           is(F3_BEQ){
//               io.output_bool := equal
//           }
//       //…
//       }
//     }
//   }
// }

// case class InstMem(WordWidth:Int, InstSize:Int, ContentInst:String) extends Component {
//     val io = new Bundle {
//         val ib = slave(InstBus(32,32))
//     }

//     //Initializing ROM
//     val romInst = new Mem(Bits(WordWidth bits), InstSize) init(Seq.fill(InstSize)(B(0, 32 bits)))
//     romInst.init(Tools.readmemh(ContentInst)) 
    
//     val InternalAdd = UInt()
//     InternalAdd := io.ib.IBaddress(log2Up(InstSize*4)-1 downto 0) >> 2

//     //Asynchronous read.
//     io.ib.IBrdata := romInst.readAsync(InternalAdd)
// }


// val busStateMachine = new StateMachine {
//   io.bus.valid := False
//   //…
  
//   val idleAndRequest : State = new State with EntryPoint{
//     whenIsActive{
//       when (io.ctrl.request) {
//         io.bus.valid := True
//         //…
//       }
//       when (io.bus.ready | io.bus.unmapped) {
//         goto(operation complete)
//       }
//     }
//   }
  
//   val operationComplete : State = new State { 
//     whenIsActive{
//       io.bus.valid := False
//       //… 
//       goto (idleAndRequest)
//     }
//   }
// }


// //…
// val ReadEnable = io.sel & io.db.DBvalid & (!io.db.DBwrite)
// val WriteEnable = io.sel & io.db.DBvalid & io.db.DBwrite

// //Access enabling
// when(ReadEnable | WriteEnable) {
//     io.db.DBready := True 
// } otherwise {
//     io.db.DBready := False
// }
// //…



// class RV32RegisterFile(addressWidth : Int, dataWidth : Int, wordCount : Int) extends Component{ 
//   val io = new RegFileIO(addressWidth, dataWidth)

//   val RegisterArray = Vec.fill(wordCount)(Reg(Bits(dataWidth bits)) init(B(0, dataWidth bits)))

//   //Read
//   io.rs1Data := RegisterArray(io.rs1)
//   io.rs2Data := RegisterArray(io.rs2)

//   //Write 
//   when(io.rd =/= 0 && io.wrEna) {
//     RegisterArray(io.rd) := io.rdData
//   }
// }

// object InstructionType extends SpinalEnum { 
//   val isUndef, isRegReg, isRegImm, isBRANCH, isLOAD, isSTORE, 
//   isJAL, isJALR, isLUI, isAUIPC, isECALL, isFENCE= newElement()
// }  

// switch(io.instType) {
//   is(isRegImm) {
//     //ALU
//     io.ALUControl.ALUSrc1 := aluSrc1.opReg1Data
//     io.ALUControl.ALUSrc2 := aluSrc2.opImm 
//     //Mem: Inactivated
//     io.MemDataControl.request := False
//     io.MemDataControl.MemWrite := False
//     io.MemDataControl.strobeSel := MemoryStrobeSelect.word
//     //Register File
//     io.RFControl.WriteEna := True
//     io.RFControl.DestDataSel := destDataSel.ALURes
//     //PCControl
//     io.PCControl.PCSrc := pcSrc.PCIncrement
//     //RegControl
//     io.RegControl.sample := True
//     //io.halted: invalid
//     io.halted := False
//   }
//   //…
// }

// switch(io.instType) {
//   //…
//   is(isLOAD) {
//     //…
//     val opFinish = RegNext(io.MemDataControl.busy & io.MemDataControl.ready) 
//     when (opFinish) { //The first phase
//       //Mem
//       io.MemDataControl.request := False 
//       //RF:
//       io.RFControl.WriteEna := True 
//       io.RFControl.DestDataSel := destDataSel.MemRes 
//       //regControl
//       io.RegControl.sample := True
//     } otherwise { //The second phase
//       //Mem
//       io.MemDataControl.request := True
//       //RF: invalid state
//       io.RFControl.WriteEna := False
//       io.RFControl.DestDataSel := destDataSel.MemRes 
//       //regControl: invalid state
//       io.RegControl.sample := False
//     }
//     //…
//   }
// }

// val flushCount = Reg(UInt(2 bits)) init(U(0))
// when(flushCount === 0) {
//   when(!Stall & pcNextSelection.io.flush) {
//   flushCount := U(2)
//   }
// } otherwise {
//   flushCount := flushCount - 1
// }

// when(flushCount === 0) {
//   when(!Stall) {
//     StageEna.ifEna := True
//     StageEna.idEna := True
//     StageEna.exeEna := True
//   } otherwise {
//     StageEna.ifEna := False
//     StageEna.idEna := False
//     StageEna.exeEna := False
//   }
// } otherwise {
//   StageEna.ifEna := True
//   StageEna.idEna := True
//   StageEna.exeEna := True
// }

// when(!(io.halt | io.haltErr)) { 
//   when(flushCount === 0) {
//     when(!Stall & (EXEResult.Pc =/= B(0, 32 bits))) {
//         StageEna.fifoEna := True
//     } otherwise {
//         StageEna.fifoEna := False
//     }
//   } otherwise {
//     StageEna.fifoEna := False
//   }
// } otherwise {
//   StageEna.fifoEna := False
// }


// when(!(io.halt | io.haltErr)) {
//   when(memFinish & !BufferEMControl.io.Empty & !BufferEMOperand.io.Empty) {
//     StageEna.memEna := True
//   } otherwise {
//     StageEna.memEna := False
//   }
// } otherwise {
//   StageEna.memEna := False
// }

// when(!(io.halt | io.haltErr)) {
//   when(memFinish & (WBOperand.Pc =/= MEMOperand.Pc)) {
//     StageEna.wbEna := True
//   } otherwise {
//     StageEna.wbEna := False
//   }
// } otherwise {
//   StageEna.wbEna := False
// }

