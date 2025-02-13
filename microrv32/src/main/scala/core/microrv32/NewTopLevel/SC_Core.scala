package SC_RV32I.Core

import SC_RV32I.Core.RVOpcode._ //All the content inside can be used by this file
import SC_RV32I.Core._

import spinal.core._
import spinal.lib._

//Define the interface of instruction memory and data memory
case class InstMemoryIF() extends Bundle {
    // val request = out Bool()
    val address = out Bits(32 bits)
    val instruction = in Bits(32 bits)
    // val instructionReady = in Bool()
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

//Configuration
case class SC_RV32CoreConfig (
    startVector : Long = 0x80000000l //start pc value
)


class SCCore(val cfg : SC_RV32CoreConfig) extends Component {
    val io = new Bundle {
        val InstMemIF = InstMemoryIF()
        val DataMemIF = DataMemoryIF()
        // sync signal, asserted when core is in fetch state
        val fetchSync = out Bool()
        // cpu halted through ecall. The 'halted' signal is true when 'halt' and 'haltErr' is True
        val halted = out Bool()
        // Shutdown halting signals
        val halt = in Bool()
        val haltErr = in Bool()
        // val dbgState = out Bits(4 bits)
    }
    
    //Define all component.
    //Define Reg between the PCNext and (current)PC
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
    val aluSrcSelection = new ALUSrcSelection()
    val alu = new ALU() //Including the regularALU and PCTarget
    val pcTarget = new PCTarget()
    //Define the extension module for signed load from DataMem
    val extMemData = Bits(32 bits)
    extMemData := B(0, 32 bits)
    switch(instDecoder.io.instType) {
        is(InstructionType.isLOAD) {
            switch(instDecoder.io.fields.funct3) {
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

    //connections. Focusing on the input of a component and the output of the bundle(interface)
    //register
    when(controlUnit.io.RegControl.sample) {
        programCounter := pcNextSelection.io.pcNext
    }
    //io.fetchSyn
    val fetchFlag = RegNext(controlUnit.io.RegControl.sample) init(False)
    io.fetchSync := fetchFlag
    //InstMemIF
    // io.InstMemIF.request := controlUnit.io.InstMemFetch.request
    io.InstMemIF.address := programCounter.asBits
    //decoder
    instDecoder.io.Inst := io.InstMemIF.instruction
    //Control Unit
    controlUnit.io.instType := instDecoder.io.instType
    controlUnit.io.instFields := instDecoder.io.fields
    controlUnit.io.ALUControl.ALUBranch := alu.io.ALUBranch
    controlUnit.io.MemDataControl.ready := io.DataMemIF.dataReady
    controlUnit.io.MemDataControl.busy := io.DataMemIF.ctrlBusy
    controlUnit.io.halt := io.halt | io.haltErr
    //RF Unit
    destDataSelection.io.sel := controlUnit.io.RFControl.DestDataSel
    destDataSelection.io.aluRes := alu.io.ALUResult
    destDataSelection.io.memRes := extMemData
    destDataSelection.io.pcIncrement := pcIncrement.io.pcIncrement.asBits
    destDataSelection.io.pcTarget := pcTarget.io.PCTarget.asBits
    registerFile.io.rs1 := instDecoder.io.fields.rs1.asUInt
    registerFile.io.rs2 := instDecoder.io.fields.rs2.asUInt
    registerFile.io.wrEna := controlUnit.io.RFControl.WriteEna
    registerFile.io.rd := instDecoder.io.fields.rd.asUInt
    registerFile.io.rdData := destDataSelection.io.writeData
    //ALU Unit
    aluSrcSelection.io.Src1Sel := controlUnit.io.ALUControl.ALUSrc1
    aluSrcSelection.io.Src2Sel := controlUnit.io.ALUControl.ALUSrc2
    aluSrcSelection.io.Imm := instDecoder.io.ImmExt
    aluSrcSelection.io.RD1 := registerFile.io.rs1Data
    aluSrcSelection.io.RD2 := registerFile.io.rs2Data
    alu.io.instType := instDecoder.io.instType
    alu.io.funct3 := instDecoder.io.fields.funct3
    alu.io.funct7 := instDecoder.io.fields.funct7
    alu.io.op1 := aluSrcSelection.io.opA
    alu.io.op2 := aluSrcSelection.io.opB
    alu.io.shamt := instDecoder.io.fields.shamt
    pcTarget.io.Imm := instDecoder.io.ImmExt
    pcTarget.io.PC := programCounter
    //DataMemIF
    io.DataMemIF.request := controlUnit.io.MemDataControl.request
    io.DataMemIF.readWrite := controlUnit.io.MemDataControl.MemWrite
    io.DataMemIF.address := alu.io.ALUResult
    io.DataMemIF.writeData := registerFile.io.rs2Data
    // io.DataMemIF.readSign := controlUnit.io.MemDataControl.readSign
    io.DataMemIF.size := controlUnit.io.MemDataControl.strobeSel.mux(
        MemoryStrobeSelect.byte -> U(1, 4 bits),
        MemoryStrobeSelect.halfWord -> U(2, 4 bits),
        MemoryStrobeSelect.word -> U(4, 4 bits)
    )
    //Fetch Unit
    pcIncrement.io.pc := programCounter
    pcNextSelection.io.pcSel := controlUnit.io.PCControl.PCSrc
    pcNextSelection.io.pcTarget := pcTarget.io.PCTarget
    pcNextSelection.io.pcIncrement := pcIncrement.io.pcIncrement
    pcNextSelection.io.aluRes := alu.io.ALUResult
    //io.halted
    io.halted := controlUnit.io.halted
}

//Generate the Top Verilog
object SCCoreTop {
  def main(args: Array[String]) {
    SpinalConfig(
      defaultClockDomainFrequency=FixedFrequency(12 MHz),
      targetDirectory = "rtl"
      ).generateVerilog(new SCCore(SC_RV32CoreConfig()))
      .printPruned()
  }
}