package PP_RV32I.Core

import PP_RV32I.Core.RVOpcode._ //All the content inside can be used by this file
import PP_RV32I.Core._
import PP_RV32I.Core.InstructionType._
// import PP_RV32I.Core.InstructionType

import spinal.core._
import spinal.lib._
import scala.collection.mutable.ArrayBuffer

//Configuration
case class PP_RV32CoreConfig (
    startVector : Long = 0x80000000l, //start pc value
    fifoDepth : Int = 3 //please take care that the log2up(1) would return 0 instead of 1
)


//interface of instruction memory and data memory
case class InstMemoryIF() extends Bundle {
    val address = out Bits(32 bits)
    val instruction = in Bits(32 bits)
}

case class DataMemoryIF() extends Bundle {
    val request = out Bool()
    val readWrite = out Bool()
    val address = out Bits(32 bits)
    val dataReady = in Bool()
    val ctrlBusy = in Bool() //new added
    val readData = in Bits(32 bits)
    val writeData = out Bits(32 bits)
    val size = out UInt(4 bits)
}


class PPCore(val cfg : PP_RV32CoreConfig) extends Component {
    val io = new Bundle {
        val InstMemIF = InstMemoryIF()
        val DataMemIF = DataMemoryIF()
        // sync signal, once there is a new instruction in the IF stage
        val fetchSync = out Bool()
        val wbSync = out Bool()
        // cpu halted through ecall. The 'halted' signal is true when 'halt' and 'haltErr' is True
        val halted = out Bool()
        // Shutdown halting signals(two possible methods)
        val halt = in Bool()
        val haltErr = in Bool()
        // val dbgState = out Bits(4 bits)
    }


    //Define all components
    //Stage registers' enable signals
    case class stageEna() extends Bundle {
        val ifEna, idEna, exeEna, fifoEna, memEna, wbEna = Bool()
    }
    val StageEna = new stageEna()
    //Initial value of the PC has been set up, the cpu start running once the clock is set up
    val programCounter = Reg(UInt(32 bits)) init(U(cfg.startVector, 32 bits))
    //Define fetch Unit
    val pcIncrement = new PCIncrement(4)
    val pcNextSelection = new PCNextSelection()
    //Define decoder unit. This part includes the extension of Imm
    val instDecoder = new InstDecoder()
    //Define Control Unit
    val controlUnit = new ControlUnit()
    //Define RF unit
    val registerFile = new RV32RegisterFile(5, 32, 32)
    val destDataSelection = new DestDataSelection()
    //Define ALU Unit
    //The aluSrcSelection is defined at the below connection part
    // val aluSrcSelection = new ALUSrcSelection()
    val alu = new ALU() 
    val pcTarget = new PCTarget()
    //Circular EMFifo
    class bufferEMControl() extends Component {
      val io = new Bundle {
        //Functional ports
        val push = in Bool()
        val pop = in Bool()
        val dataIn = in (emControl())
        val defaults = in (emControl())
        val dataOut = out (emControl()) //data that chosen for mem
        //Flag signals
        val Fifo = out Vec(emControl(), cfg.fifoDepth) 
        val Occupancy = out UInt(log2Up(cfg.fifoDepth + 1) bits)
        val ReadPtr = out UInt(log2Up(cfg.fifoDepth) bits)
        val Full = out Bool()
        val Empty = out Bool()
      }
      val fifo = Vec(Reg(emControl()) init(io.defaults), cfg.fifoDepth) //depth better be a exponential of 2
      io.Fifo := Vec(fifo.map(element => element))
    //   val writePtr = Reg(UInt(log2Up(cfg.fifoDepth) bits)) init(0)
    //   val readPtr = Reg(UInt(log2Up(cfg.fifoDepth) bits)) init(0)
      val writePtr = Counter(0 to (cfg.fifoDepth-1))
      val readPtr = Counter(0 to (cfg.fifoDepth-1))
      io.ReadPtr := readPtr
      val occupancy = Reg(UInt(log2Up(cfg.fifoDepth + 1) bits)) init(0) //an extra bit
      io.Occupancy := occupancy
      val full = Bool()
      io.Full := full
      val empty = Bool()
      io.Empty := empty
      full := occupancy === cfg.fifoDepth
      empty := occupancy === 0
      val tmpDataOut = Reg(emControl()) init(io.defaults)
      io.dataOut := tmpDataOut

      //read/write/occupancy
      when(io.push && io.pop) { //read and write request at the same time
        when(!empty) { //fifo is not empty (including full). Both read and write can be excuted.
            fifo(writePtr) := io.dataIn
            // writePtr := writePtr + 1
            writePtr.increment() //synthezed with clock
            tmpDataOut := fifo(readPtr)
            // readPtr := readPtr + 1
            readPtr.increment()
        }otherwise { //fifo is empty. Only write is allowed.
            fifo(writePtr) := io.dataIn
            // writePtr := writePtr + 1
            writePtr.increment()
            occupancy := occupancy + 1
        }
      }.elsewhen(io.push) { //only write request
        when(!full) { //fifo is not full, write excuted
            fifo(writePtr) := io.dataIn
            // writePtr := writePtr + 1
            writePtr.increment()
            occupancy := occupancy + 1
        }
      }.elsewhen(io.pop) { //only read request
        when(!empty) { //fifo is not empty, read excuted. Otherwise the DataOut keeps the original value.
            tmpDataOut := fifo(readPtr)
            // readPtr := readPtr + 1
            readPtr.increment()
            occupancy := occupancy - 1
        }
      }
    }
    class bufferEMOperand() extends Component {
      val io = new Bundle {
        //Functional ports
        val push = in Bool()
        val pop = in Bool()
        val dataIn = in (emData())
        val defaults = in (emData())
        val dataOut = out (emData())
        //Flag signals
        val Fifo = out Vec(emData(), cfg.fifoDepth) 
        val Occupancy = out UInt(log2Up(cfg.fifoDepth + 1) bits)
        val ReadPtr = out UInt(log2Up(cfg.fifoDepth) bits)
        val Full = out Bool()
        val Empty = out Bool() 
      }
      val fifo = Vec(Reg(emData()) init(io.defaults), cfg.fifoDepth) //depth better be a exponential of 2
      io.Fifo := Vec(fifo.map(element => element))
    //   val writePtr = Reg(UInt(log2Up(cfg.fifoDepth) bits)) init(0)
    //   val readPtr = Reg(UInt(log2Up(cfg.fifoDepth) bits)) init(0)
      val writePtr = Counter(0 to (cfg.fifoDepth-1))
      val readPtr = Counter(0 to (cfg.fifoDepth-1))
      io.ReadPtr := readPtr
      val occupancy = Reg(UInt(log2Up(cfg.fifoDepth + 1) bits)) init(0) //an extra bit
      io.Occupancy := occupancy
      val full = Bool()
      io.Full := full
      val empty = Bool()
      io.Empty := empty
      full := occupancy === cfg.fifoDepth
      empty := occupancy === 0
      val tmpDataOut = Reg(emData()) init(io.defaults)
      io.dataOut := tmpDataOut

      //read/write/occupancy
      when(io.push && io.pop) { //read and write request at the same time
        when(!empty) { //fifo is not empty (including full). Both read and write can be excuted.
            fifo(writePtr) := io.dataIn
            // writePtr := writePtr + 1
            writePtr.increment() //synthezed with clock
            tmpDataOut := fifo(readPtr)
            // readPtr := readPtr + 1
            readPtr.increment()
        }otherwise { //fifo is empty. Only write is allowed.
            fifo(writePtr) := io.dataIn
            // writePtr := writePtr + 1
            writePtr.increment() //synthezed with clock
            occupancy := occupancy + 1
        }
      }.elsewhen(io.push) { //only write request
        when(!full) { //fifo is not full, write excuted
            fifo(writePtr) := io.dataIn
            // writePtr := writePtr + 1
            writePtr.increment() //synthezed with clock
            occupancy := occupancy + 1
        }
      }.elsewhen(io.pop) { //only read request
        when(!empty) { //fifo is not empty, read excuted
            tmpDataOut := fifo(readPtr)
            // readPtr := readPtr + 1
            readPtr.increment()
            occupancy := occupancy - 1
        }
      }
    }
    val BufferEMControl = new bufferEMControl()
    val BufferEMOperand = new bufferEMOperand()
    val extMemData = Bits(32 bits) //width and sign extension module for LOAD instruction


    //Data and Control signals bundle
    //FD
    case class fdData() extends Bundle {
        val Inst = Bits(32 bits)
        val Pc = Bits(32 bits)
        val PcIncrement = Bits(32 bits)
    }
    val IFResult = new fdData()
    // val IDOperand = new fdData()
    //DE
    case class deControl() extends Bundle {
        val PCControl = pcControl() //Determine the src of nextPC
        val RFControl = rfControl()
        val ALUControl = aluControl()
        val MemDataControl = memDataControl()
    }
    val IDControl = new deControl() //Original generation of control signals. Should connect to the Decoder Unit's ports
    // val EXEControl = new deControl() 
    case class deData() extends Bundle {
        val instType = InstructionType()
        val fields = DecodeFields()
        // val Rs1Data = Bits(32 bits)
        // val Rs2Data = Bits(32 bits)
        val Pc = Bits(32 bits)
        val Rd = Bits(5 bits)
        val ImmExt = Bits(32 bits)
        val PcIncrement = Bits(32 bits)
    }
    val IDResult = new deData()
    // val EXEOperand = new deData()
    //EM
    case class emControl() extends Bundle {
        val RFControl = rfControl()
        val MemDataControl = memDataControl()
    }
    // val MEMControl = new emControl()
    case class emData() extends Bundle {
        val instType = InstructionType()
        val Pc = Bits(32 bits) //For simulation
        val fields = DecodeFields()
        val ALUResult = Bits(32 bits)
        val WriteData = Bits(32 bits) //originated from Rd2Data
        val Rd = Bits(5 bits)
        val PcIncrement = Bits(32 bits)
        val PcTarget = Bits(32 bits)
    }
    val EXEResult = new emData()
    // val MEMOperand = new emData()
    //MW
    case class mwControl() extends Bundle {
        val RFControl = rfControl()
    }
    // val WBControl = new mwControl()
    case class mwData() extends Bundle{
        val instType = InstructionType()
        val Pc = Bits(32 bits)
        val fields = DecodeFields()
        val ALUResult = Bits(32 bits)
        val ReadData = Bits(32 bits)
        val Rd = Bits(5 bits)
        val PcIncrement = Bits(32 bits)
        val PcTarget = Bits(32 bits)
    }
    val MEMResult = new mwData()
    // val WBOperand = new mwData()

    //Defaults for Bundles
    val DecodeFieldsDefaults = DecodeFields()
    DecodeFieldsDefaults.opcode := B(0, 7 bits)
    DecodeFieldsDefaults.rs1 := B(0, 5 bits)
    DecodeFieldsDefaults.rs2 := B(0, 5 bits)
    DecodeFieldsDefaults.rd := B(0, 5 bits)
    DecodeFieldsDefaults.funct3 := B(0, 3 bits)
    DecodeFieldsDefaults.funct7 := B(0, 7 bits)
    DecodeFieldsDefaults.funct12 := B(0, 12 bits)
    DecodeFieldsDefaults.shamt := B(0, 5 bits)
    val pcControlDefaults = pcControl()
    pcControlDefaults.PCSrc := pcSrc.PCIncrement //The default next PC is the increment one.
    val rfControlDefaults = rfControl()
    rfControlDefaults.WriteEna := False
    rfControlDefaults.DestDataSel := destDataSel.ALURes //Meaningless
    val aluControlDefaults = aluControl()
    aluControlDefaults.ALUSrc1 := aluSrc1.opZero
    aluControlDefaults.ALUSrc2 := aluSrc2.opZero
    val memDataControlDefaults = memDataControl()
    memDataControlDefaults.request := False
    memDataControlDefaults.MemWrite := False //Meaningless
    memDataControlDefaults.strobeSel := MemoryStrobeSelect.word
    val fdDataDefaults = fdData()
    fdDataDefaults.Inst := B(0, 32 bits)
    fdDataDefaults.Pc := B(0, 32 bits)
    fdDataDefaults.PcIncrement := B(0, 32 bits)
    val deControlDefaults = deControl()
    deControlDefaults.PCControl := pcControlDefaults
    deControlDefaults.RFControl := rfControlDefaults
    deControlDefaults.ALUControl := aluControlDefaults
    deControlDefaults.MemDataControl := memDataControlDefaults
    val deDataDefaults = deData()
    deDataDefaults.instType := isIllegal
    deDataDefaults.fields := DecodeFieldsDefaults
    // deDataDefaults.Rs1Data := B(0, 32 bits)
    // deDataDefaults.Rs2Data := B(0, 32 bits)
    deDataDefaults.Pc := B(0, 32 bits)
    deDataDefaults.Rd := B(0, 5 bits)
    deDataDefaults.ImmExt := B(0, 32 bits)
    deDataDefaults.PcIncrement := B(0, 32 bits)
    val emControlDefaults = emControl()
    emControlDefaults.RFControl := rfControlDefaults
    emControlDefaults.MemDataControl := memDataControlDefaults
    val emDataDefaults = emData()
    emDataDefaults.instType := isIllegal
    emDataDefaults.Pc := B(0, 32 bits)
    emDataDefaults.fields := DecodeFieldsDefaults
    emDataDefaults.ALUResult := B(0, 32 bits)
    emDataDefaults.WriteData := B(0, 32 bits)
    emDataDefaults.Rd := B(0, 5 bits)
    emDataDefaults.PcIncrement := B(0, 32 bits)
    emDataDefaults.PcTarget := B(0, 32 bits)
    val mwControlDefaults = mwControl()
    mwControlDefaults.RFControl := rfControlDefaults
    val mwDataDefaults = mwData()
    mwDataDefaults.instType := isIllegal
    mwDataDefaults.Pc := B(0, 32 bits)
    mwDataDefaults.fields := DecodeFieldsDefaults
    mwDataDefaults.ALUResult := B(0, 32 bits)
    mwDataDefaults.ReadData := B(0, 32 bits)
    mwDataDefaults.Rd := B(0, 5 bits)
    mwDataDefaults.PcIncrement := B(0, 32 bits)
    mwDataDefaults.PcTarget := B(0, 32 bits)


    // Define registers and fifo
    val IDOperand = Reg(fdData()) init(fdDataDefaults) 
    when(StageEna.idEna) {
        when(!pcNextSelection.io.flush) { //Jump instruction penalty: Flushing
            IDOperand := IFResult    
        } otherwise {
            IDOperand := fdDataDefaults
        }
    }

    val EXEControl = Reg(deControl()) init(deControlDefaults) 
    val EXEOperand = Reg(deData()) init(deDataDefaults)
    when(StageEna.exeEna) {
        when(!pcNextSelection.io.flush) { //Jump instruction penalty: Flushing
            EXEControl := IDControl
            EXEOperand := IDResult    
        } otherwise {
            EXEControl := deControlDefaults
            EXEOperand := deDataDefaults
        }
    }

    val MEMControl = new emControl() //The generation of MEMControl and MEMOperand is descripted in the connection part
    val MEMOperand = new emData()

    val WBControl = Reg(mwControl()) init(mwControlDefaults)
    val WBOperand = Reg(mwData()) init(mwDataDefaults)
    when(StageEna.wbEna) {
        WBControl.RFControl := MEMControl.RFControl
        WBOperand := MEMResult
    }


    //Enable signals
    //Active: control and operand signals would be transferred into the next stage.
    val StallMem = Bool() 
    StallMem := False
    val StallFifoCtrl = Bool()
    StallFifoCtrl := False
    val StallFifoOp = Bool()
    StallFifoOp := False
    val Stall = Bool()
    Stall := StallMem | StallFifoCtrl | StallFifoOp
    val flushCount = Reg(UInt(2 bits)) init(U(0))
    when(flushCount === 0) {
        when(!Stall & pcNextSelection.io.flush) {
            flushCount := U(2)
        }
    } otherwise {
        flushCount := flushCount - 1
    }
    //ifEna, idEna, exeEna
    when(!(io.halt | io.haltErr)) {
        when(flushCount === 0) {
            when(!Stall) {
                StageEna.ifEna := True
                StageEna.idEna := True
                StageEna.exeEna := True
            } otherwise {
                StageEna.ifEna := False
                StageEna.idEna := False
                StageEna.exeEna := False
            }
        } otherwise {
            StageEna.ifEna := True
            StageEna.idEna := True
            StageEna.exeEna := True
        }
    } otherwise {
        StageEna.ifEna := False
        StageEna.idEna := False
        StageEna.exeEna := False
    }
    // //ifEna
    // when(!(io.halt | io.haltErr)) {
    //     when(flushCount === 0) {
    //         when(!Stall & (EXEOperand.Pc =/= pcNextSelection.io.pcNext.asBits)) { //Normal. The condition avoid the conflict of jump inst..
    //             StageEna.ifEna := True
    //         } otherwise {
    //             StageEna.ifEna := False
    //         }
    //     } otherwise { //Flush
    //         StageEna.ifEna := True
    //     }
    // } otherwise { //Halt
    //     StageEna.ifEna := False
    // }
    // //idEna
    // when(!(io.halt | io.haltErr)) {
    //     when(flushCount === 0) {
    //         when(!Stall & (IDOperand.Pc =/= IFResult.Pc)) { //Normal
    //             StageEna.idEna := True
    //         } otherwise {
    //             StageEna.idEna := False
    //         }
    //     } otherwise { //Flush
    //         StageEna.idEna := True
    //     }
    // } otherwise { //Halt
    //     StageEna.idEna := False
    // }
    // //exeEna
    // when(!(io.halt | io.haltErr)) {
    //     when(flushCount === 0) {
    //         when(!Stall & (EXEOperand.Pc =/= IDResult.Pc)) { //Normal
    //             StageEna.exeEna := True
    //         } otherwise {
    //             StageEna.exeEna := False
    //         }
    //     } otherwise { //Flush
    //         StageEna.exeEna := True
    //     }
    // } otherwise { //Halt
    //     StageEna.exeEna := False
    // }
    //fifoEna
    when(!(io.halt | io.haltErr)) { 
        when(flushCount === 0) {
            when(!Stall & (EXEResult.Pc =/= B(0, 32 bits))) { //Normal: fifo push-in request only happened at when fifo is not full (no stall) and the instruction are valid.
                StageEna.fifoEna := True
            } otherwise {
                StageEna.fifoEna := False
            }
        } otherwise {
            StageEna.fifoEna := False
        }
    } otherwise {
        StageEna.fifoEna := False
    }
    //memEna
    //'Finish' is a flag signal to show that the mem stage is finished
    val memLSFinish = Reg(Bool()) init(False) //Deal with the LOAD/STORE instruction
    when(io.DataMemIF.request & io.DataMemIF.ctrlBusy & io.DataMemIF.dataReady) {
        memLSFinish := True
    } otherwise {
        memLSFinish := False
    }
    val memNLSFinish = Bool() //Deal with the non-LOAD/STORE instruction
    when(!io.DataMemIF.request) {
        memNLSFinish := True
    } otherwise {
        memNLSFinish := False
    }
    val memFinish = memLSFinish | memNLSFinish
    when(!(io.halt | io.haltErr)) {
        when(memFinish & !BufferEMControl.io.Empty & !BufferEMOperand.io.Empty) {
            StageEna.memEna := True
        } otherwise {
            StageEna.memEna := False
        }
    } otherwise {
        StageEna.memEna := False
    }
    //wbEna
    when(!(io.halt | io.haltErr)) {
        when(memFinish & (WBOperand.Pc =/= MEMOperand.Pc)) {
            StageEna.wbEna := True
        } otherwise {
            StageEna.wbEna := False
        }
    } otherwise {
        StageEna.wbEna := False
    }


    //connection: stage-by-stage
    //extension of read data from LOAD instruction at first.
    extMemData := B(0, 32 bits)
    switch(MEMOperand.instType) {
        is(isLOAD) {
            switch(MEMOperand.fields.funct3) {
                is(F3_LB) {
                    extMemData := S(io.DataMemIF.readData(7 downto 0), 32 bits).asBits
                }
                is(F3_LH) {
                    extMemData := S(io.DataMemIF.readData(15 downto 0), 32 bits).asBits
                }
                is(F3_LW) {
                    extMemData := io.DataMemIF.readData
                }
                is(F3_LBU) {
                    extMemData := io.DataMemIF.readData
                }
                is(F3_LHU) {
                    extMemData := io.DataMemIF.readData
                }
            }
        }
        default {
            extMemData := io.DataMemIF.readData
        }
    }
    //IF
    io.InstMemIF.address := programCounter.asBits
    pcIncrement.io.pc := programCounter
    pcNextSelection.io.pcIncrement := pcIncrement.io.pcIncrement
    IFResult.Inst := io.InstMemIF.instruction
    IFResult.Pc := programCounter.asBits
    IFResult.PcIncrement := pcNextSelection.io.pcIncrement.asBits
    //ID
    instDecoder.io.Inst:= IDOperand.Inst
    controlUnit.io.Flag.instType := instDecoder.io.instType
    controlUnit.io.Flag.instFields := instDecoder.io.fields
    // registerFile.io.rs1 := instDecoder.io.fields.rs1.asUInt
    // registerFile.io.rs2 := instDecoder.io.fields.rs2.asUInt
    IDControl.PCControl := controlUnit.io.Control.PCControl
    IDControl.RFControl := controlUnit.io.Control.RFControl
    IDControl.ALUControl := controlUnit.io.Control.ALUControl
    IDControl.MemDataControl := controlUnit.io.Control.MemDataControl
    IDResult.instType := instDecoder.io.instType
    IDResult.fields := instDecoder.io.fields
    // val ReadDataSelection = new Area {
    //     val RS1 = instDecoder.io.fields.rs1
    //     val RS2 = instDecoder.io.fields.rs2
    //     val RS1Data = Bits(32 bits)
    //     IDResult.Rs1Data := RS1Data
    //     val RS2Data = Bits(32 bits)
    //     IDResult.Rs2Data := RS2Data
    //     when((RS1 === WBOperand.Rd) & WBControl.RFControl.WriteEna & (RS1 =/= B(0, 5 bits))) {
    //         RS1Data := destDataSelection.io.writeData
    //     } otherwise {
    //         RS1Data := registerFile.io.rs1Data
    //     }
    //     when((RS2 === WBOperand.Rd) & WBControl.RFControl.WriteEna & (RS2 =/= B(0, 5 bits))) {
    //         RS2Data := destDataSelection.io.writeData
    //     } otherwise {
    //         RS2Data := registerFile.io.rs2Data
    //     }
    // }
    IDResult.Pc := IDOperand.Pc
    IDResult.Rd := instDecoder.io.fields.rd
    IDResult.ImmExt := instDecoder.io.ImmExt
    IDResult.PcIncrement := IDOperand.PcIncrement
    //EXE
    //RF is moved into EXE stage instead of ID stage.
   // The RD1 and RD2 are read in the EXE stage instead of ID stage
    registerFile.io.rs1 := EXEOperand.fields.rs1.asUInt
    registerFile.io.rs2 := EXEOperand.fields.rs2.asUInt
    //ALUSrcSelection will be completed in this file instead of ALU Unit. Due to ArrayBuffer and data hazard.
    val ALUSrcSelection = new Area {
        val Src1Sel = EXEControl.ALUControl.ALUSrc1
        val Src2Sel = EXEControl.ALUControl.ALUSrc2
        val Imm = EXEOperand.ImmExt
        val RD1 = Bits(32 bits)
        RD1 := registerFile.io.rs1Data
        val RD2 = Bits(32 bits)
        RD2 := registerFile.io.rs2Data
        val RS1 = EXEOperand.fields.rs1 //where RD1 come from
        val RS2 = EXEOperand.fields.rs2 //where RD2 come from
        val Op1 = Bits(32 bits)
        val Op2 = Bits(32 bits)

        //data hazard processing: forwarding and stallMem
        //Check the condition of forwarding the stallMem
        //Op1 selection
        when((RS1 === WBOperand.Rd) & WBControl.RFControl.WriteEna & (RS1 =/= B(0, 5 bits))) { //check WB
            RD1 := destDataSelection.io.writeData
        }
        when((RS1 === MEMOperand.Rd) & MEMControl.RFControl.WriteEna & (RS1 =/= B(0, 5 bits))) { //check MEM
            switch(MEMOperand.instType, strict = false) {
                is(isLUI, isRegImm, isRegReg) {
                    RD1 := MEMOperand.ALUResult
                }
                is(isAUIPC) {
                    RD1 := MEMOperand.PcTarget
                }
                is(isJAL, isJALR) {
                    RD1 := MEMOperand.PcIncrement
                }
                is(isLOAD) {
                    when(StageEna.memEna | StageEna.wbEna) {
                        RD1 := extMemData
                    } otherwise {
                        StallMem := True
                        RD1 := B(32 bits, default -> True) //Meaningless, set full '1' as the FLAG
                    }
                }
            }
        }
        when(!BufferEMControl.io.Empty & !BufferEMOperand.io.Empty) { //check FIFO
            for(i <- 0 until cfg.fifoDepth) { //From the earliest to latest.
                when(i < BufferEMControl.io.Occupancy) {
                    val Index = (i + BufferEMControl.io.ReadPtr) % cfg.fifoDepth
                    when((RS1 === BufferEMOperand.io.Fifo(Index).Rd) & BufferEMControl.io.Fifo(Index).RFControl.WriteEna & (RS1 =/= B(0, 5 bits))) {
                        switch(BufferEMOperand.io.Fifo(Index).instType, strict = false) {
                            is(isLUI, isRegImm, isRegReg) {
                                RD1 := BufferEMOperand.io.Fifo(Index).ALUResult
                            }
                            is(isAUIPC) {
                                RD1 := BufferEMOperand.io.Fifo(Index).PcTarget
                            }
                            is(isJAL, isJALR) {
                                RD1 := BufferEMOperand.io.Fifo(Index).PcIncrement
                            }
                            is(isLOAD) { //Stall from mem
                                StallMem := True
                                RD1 := B(32 bits, default -> True) //meaningless, set '1' as the FLAG
                            }
                        }
                    }
                }
            }
        }
        switch(Src1Sel) {
            is(aluSrc1.opReg1Data) {
                Op1 := RD1
            }
            is(aluSrc1.opZero) {
                Op1 := B(0, 32 bits)
            }
        }
        //Op2 selection
        when((RS2 === WBOperand.Rd) & WBControl.RFControl.WriteEna & (RS2 =/= B(0, 5 bits))) { //check WB
            RD2 := destDataSelection.io.writeData
        }
        when((RS2 === MEMOperand.Rd) & MEMControl.RFControl.WriteEna & (RS2 =/= B(0, 5 bits))) { //check MEM
            switch(MEMOperand.instType, strict = false) {
                is(isLUI, isRegImm, isRegReg) {
                    RD2 := MEMOperand.ALUResult
                }
                is(isAUIPC) {
                    RD2 := MEMOperand.PcTarget
                }
                is(isJAL, isJALR) {
                    RD2 := MEMOperand.PcIncrement
                }
                is(isLOAD) {
                    when(StageEna.memEna | StageEna.wbEna) {
                        RD2 := extMemData
                    } otherwise {
                        StallMem := True
                        RD2 := B(32 bits, default -> True) //Meaningless, set '1' as the FLAG
                    }
                }
            }
        }
        when(!BufferEMControl.io.Empty & !BufferEMOperand.io.Empty) { //check FIFO
            for(i <- 0 until cfg.fifoDepth) { //From the earliest to latest. No need for break{}
                when(i < BufferEMControl.io.Occupancy) {
                    val Index = (i + BufferEMControl.io.ReadPtr) % cfg.fifoDepth
                    when((RS2 === BufferEMOperand.io.Fifo(Index).Rd) & BufferEMControl.io.Fifo(Index).RFControl.WriteEna & (RS2 =/= B(0, 5 bits))) {
                        // FlagFifo := True
                        switch(BufferEMOperand.io.Fifo(Index).instType, strict = false) {
                            is(isLUI, isRegImm, isRegReg) {
                                RD2 := BufferEMOperand.io.Fifo(Index).ALUResult
                            }
                            is(isAUIPC) {
                                RD2 := BufferEMOperand.io.Fifo(Index).PcTarget
                            }
                            is(isJAL, isJALR) {
                                RD2 := BufferEMOperand.io.Fifo(Index).PcIncrement
                            }
                            is(isLOAD) { //Stall from mem
                                StallMem := True
                                RD2 := B(32 bits, default -> True) //meaningless, set '1' as the FLAG
                            }
                        }
                    }
                }
            }
        }
        switch(Src2Sel) {
            is(aluSrc2.opReg2Data) {
                Op2 := RD2
            }
            is(aluSrc2.opZero) {
                Op2 := B(0, 32 bits)
            }
            is(aluSrc2.opImm) {
                Op2 := Imm
            }
        }
    }
    alu.io.op1 := ALUSrcSelection.Op1
    alu.io.op2 := ALUSrcSelection.Op2
    alu.io.instType := EXEOperand.instType
    alu.io.funct3 := EXEOperand.fields.funct3
    alu.io.funct7 := EXEOperand.fields.funct7
    alu.io.shamt := EXEOperand.fields.shamt
    pcTarget.io.PC := EXEOperand.Pc.asUInt
    pcTarget.io.Imm := EXEOperand.ImmExt
    pcNextSelection.io.pcSel := EXEControl.PCControl.PCSrc
    pcNextSelection.io.ALUBranch := alu.io.ALUBranch
    pcNextSelection.io.aluRes := alu.io.ALUResult
    pcNextSelection.io.pcTarget := pcTarget.io.PCTarget
    //This is defined at the IF stage
    // pcNextSelection.io.pcIncrement := EXEOperand.PcIncrement.asUInt 
    when(StageEna.ifEna) {
        programCounter := pcNextSelection.io.pcNext
    }
    EXEResult.Pc := EXEOperand.Pc
    EXEResult.instType := EXEOperand.instType
    EXEResult.fields := EXEOperand.fields
    EXEResult.ALUResult := alu.io.ALUResult
    EXEResult.WriteData := ALUSrcSelection.RD2
    EXEResult.Rd := EXEOperand.Rd
    EXEResult.PcIncrement := EXEOperand.PcIncrement
    EXEResult.PcTarget := pcTarget.io.PCTarget.asBits
    //FIFO
    BufferEMControl.io.push := StageEna.fifoEna
    BufferEMControl.io.pop := StageEna.memEna
    BufferEMControl.io.dataIn.RFControl := EXEControl.RFControl
    BufferEMControl.io.dataIn.MemDataControl := EXEControl.MemDataControl
    BufferEMControl.io.defaults := emControlDefaults
    MEMControl := BufferEMControl.io.dataOut
    BufferEMOperand.io.push := StageEna.fifoEna
    BufferEMOperand.io.pop := StageEna.memEna
    BufferEMOperand.io.dataIn := EXEResult
    BufferEMOperand.io.defaults := emDataDefaults
    MEMOperand := BufferEMOperand.io.dataOut
    when(BufferEMControl.io.Full) { //Once the fifo is full, the flag signal StallFifo would be active.
        StallFifoCtrl := True
    }
    when(BufferEMOperand.io.Full) { //Once the fifo is full, the flag signal StallFifo would be active.
        StallFifoOp := True
    }
    //MEM
    io.DataMemIF.request := MEMControl.MemDataControl.request
    io.DataMemIF.readWrite := MEMControl.MemDataControl.MemWrite
    io.DataMemIF.address := MEMOperand.ALUResult
    io.DataMemIF.writeData := MEMOperand.WriteData
    io.DataMemIF.size := MEMControl.MemDataControl.strobeSel.mux(
        MemoryStrobeSelect.byte -> U(1, 4 bits),
        MemoryStrobeSelect.halfWord -> U(2, 4 bits),
        MemoryStrobeSelect.word -> U(4, 4 bits)
    )
    MEMResult.instType := MEMOperand.instType
    MEMResult.fields := MEMOperand.fields
    MEMResult.ALUResult := MEMOperand.ALUResult
    MEMResult.ReadData := extMemData
    MEMResult.Rd := MEMOperand.Rd
    MEMResult.Pc := MEMOperand.Pc
    MEMResult.PcIncrement := MEMOperand.PcIncrement
    MEMResult.PcTarget := MEMOperand.PcTarget
    //WB
    destDataSelection.io.sel := WBControl.RFControl.DestDataSel
    destDataSelection.io.aluRes := WBOperand.ALUResult
    destDataSelection.io.memRes := WBOperand.ReadData
    destDataSelection.io.pcIncrement := WBOperand.PcIncrement
    destDataSelection.io.pcTarget := WBOperand.PcTarget
    registerFile.io.wrEna := WBControl.RFControl.WriteEna
    registerFile.io.rd := WBOperand.Rd.asUInt
    registerFile.io.rdData := destDataSelection.io.writeData
    //io.halted
    io.halted := io.halt | io.haltErr
    //io.fetchSync
    io.fetchSync := RegNext(StageEna.ifEna) init(False)
    //io.wbSync
    io.wbSync := RegNext(StageEna.wbEna) init(False)
}

//Generate the Top Verilog
object PPCoreTop {
  def main(args: Array[String]) {
    SpinalConfig(
      defaultClockDomainFrequency=FixedFrequency(12 MHz)
    //   targetDirectory = "rtl"
      ).generateVerilog(new PPCore(PP_RV32CoreConfig()))
      .printPruned()
  }
}