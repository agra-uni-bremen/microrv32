package PP_RV32I

import PP_RV32I._
import PP_RV32I.Core._
import Bus._
import Peripheral._

import spinal.core._
import spinal.lib._
import spinal.lib.com.uart._
import spinal.lib.bus.misc._
import spinal.lib.slave

import scala.collection.mutable.ArrayBuffer
import scala.io.Source

// class SC_MicroRV32Top(InitHexFile:String, HexFileSize:Int, rv32config:SC_RV32CoreConfig = SC_RV32CoreConfig()) extends Component {
class PP_MicroRV32Top(InitInstHexFile:String, InstHexFileSize:Int, InitDataHexFile:String, DataHexFileSize:Int, rv32config:PP_RV32CoreConfig = PP_RV32CoreConfig()) extends Component {
    val io = new Bundle {
        // val gpioLed = out Bits(8 bits)
        // val gpioA = inout(Analog(Vec.fill(8)(Bool)))
        val cpuFetch = out Bool()
        val cpuWb = out Bool()
        val cpuHalted = out Bool()
        // val numInst = out UInt()
        // val numClk = out UInt()
        val uart = master(new Uart())
    }

    // val ROM_SIZE = 256
    // val RAM_SIZE = 256

    // Definition of different components
    //cpu core
    val cpu = new PP_SBCore(rv32config)

    //InstMem: not included in the peripherals
    // val InstRom = new InstMem(32, HexFileSize, InitHexFile)
    val InstRom = new InstMem(32, InstHexFileSize, InitInstHexFile)

    //peripherals
    val busMappings = new ArrayBuffer[(DataBus,(Bool, MaskMapping))]
    /**
   * memory mapping platform peripherals
   * peripheral | address (from-to)
   * ===========|===========
   * clic       | 0x02000000 - 0x0200FFFF
   * shutdown   | 0x02010000 - 0x020103FF
   * ram        | 0x80000000 - 0x80FFFFFF 
   * split version: 
    // instruction memory | 0x80000000 - 0x800FFFFF
    // data memory | 0x80100000 - 0x801FFFFF
   * gpio-leds  | 0x81000000 - 0x8100000F
   * uart       | 0x82000000 - 0x820000FF
   * gpioBankA  | 0x83000000 - 0x830000FF ## not for simulation only platform
   */
    
    val shutdown_periph = new Shutdown()
    busMappings += shutdown_periph.io.db -> (shutdown_periph.io.sel, MaskMapping(0x02010000l,0xFFFFFC00l)) // 0x02010000 - 0x020103FF
    
    // val DataRam = new DataMem(32, HexFileSize, InitHexFile)
    val DataRam = new DataMem(32, DataHexFileSize, InitDataHexFile)
    // busMappings += DataRam.io.db -> (DataRam.io.sel, MaskMapping(0x80000000l, 0xFF000000l))
    busMappings += DataRam.io.db -> (DataRam.io.sel, MaskMapping(0x80100000l, 0xFFF00000l)) //0x80100000 - 0x801FFFFF

    val uartPeriph = new DBUart()
    busMappings += uartPeriph.io.db -> (uartPeriph.io.sel, MaskMapping(0x82000000l,0xFFFFFF00l)) // 0x82000000 - 0x820000FF

    //master-peripheral bus interconnect
    val DataBusDec = DataLineDecoder (
        CPUmasterDF = cpu.io.DB,
        decodings = busMappings.toSeq
    )
    DataBusDec.io.unmapped.clear := True

    //Internal connection: the trick is look for the input of different module
    //cpu
    cpu.io.IB <> InstRom.io.ib
    // InstRom.io.db.DBaddress := cpu.io.IB.IBaddress
    // cpu.io.IB.IBrdata := InstRom.io.db.DBrdata
    cpu.io.unmapped := DataBusDec.io.unmapped.fired
    cpu.io.halt := shutdown_periph.io.halt
    cpu.io.haltErr := shutdown_periph.io.haltErr

    //output
    //io
    io.cpuFetch := cpu.io.fetchSync
    io.cpuWb := cpu.io.wbSync
    io.cpuHalted := cpu.io.halted
    io.uart <> uartPeriph.io.uart
    //the counter for #instruction and #clk
    // val NumInst, NumClk = Reg(UInt(32 bits)) init(U(0))
    // when(io.cpuFetch) {
    //   NumInst := NumInst + 1
    // }
    // when(!io.cpuHalted) {
    //   NumClk := NumClk + 1
    // }
    // io.numInst := NumInst
    // io.numClk := NumClk

}

//Generate the Verilog, instead of simulating
object PP_MicroRV32TopVerilog {
  def main(args: Array[String]) {
    var InsthexFilePath = args(0)
    var DatahexFilePath = args(1)
    var InstmemSize = Source.fromFile(InsthexFilePath).getLines.size
    var DatamemSize = Source.fromFile(DatahexFilePath).getLines.size
    println("Argument passed: /n" + "Inst:" + InsthexFilePath + ";Data:" + DatahexFilePath)
    println("Argument passed: /n" + "Inst:" + InstmemSize + ";Data:" + DatamemSize)

    SpinalConfig(
      defaultConfigForClockDomains = ClockDomainConfig(
        resetKind = spinal.core.ASYNC,
        resetActiveLevel = spinal.core.HIGH
      ),
      defaultClockDomainFrequency=FixedFrequency(12 MHz),
        targetDirectory = "rtl"
      //).generateVerilog(new MicroRV32Top("sw/basic-led-c/led-c.hex"))
      ).generateVerilog(new PP_MicroRV32Top(InsthexFilePath, InstmemSize, DatahexFilePath, DatamemSize, PP_RV32CoreConfig()))
      .printPruned()
  }
}