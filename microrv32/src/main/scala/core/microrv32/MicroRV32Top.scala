package core.microrv32

import core.microrv32.peripheral.GPIOLED
import core.microrv32.peripheral.uart.SBUart
import core.microrv32.peripheral.gpiobank.SBGPIOBank
import core.microrv32.peripheral.gpiobank.SB_IO
import spinal.lib.io.{InOutWrapper, TriStateArray}
import spinal.core._
import spinal.lib._
import spinal.lib.bus.misc._
import spinal.lib.slave
import core.microrv32.Tools._
import spinal.lib.com.uart._
import core.microrv32.bus._

import scala.collection.mutable.ArrayBuffer
import scala.io.Source

/*
 * Top level of MicroRV32 platform.
 * Memory mapping and IO mapping
 * Having a clock divider for top level clock spreading.
 * Binding cpu, memory and peripherals to memory mapped bus
 * By default builds blink-example for fpga use for code generation
 */
class MicroRV32Top(initHexfile:String, sizeHexfile:Int, rv32config : RV32CoreConfig = RV32CoreConfig()) extends Component {
  val io = new Bundle {
    // clock and reset through spinalhdl
    val gpioLed = out Bits(8 bits)
    val cpuFetch = out Bool()
    val cpuHalted = out Bool()
    val cpuDbgState = out Bits(4 bits)
    val dbgBus = out Bits(16 bits)
    // val dbgClk = out Bool
    val uart = master(new Uart())
    //val gpioA = master(TriStateArray(8 bits))
    val gpioA = inout(Analog(Vec.fill(8)(Bool)))
  }
  
  // ******** CPU CORE *********
  val cpu = new SBRV32Core(rv32config)
  io.cpuFetch := cpu.io.fetchSync
  io.cpuHalted := cpu.io.halted
  io.cpuDbgState := cpu.io.dbgState
  io.dbgBus := cpu.io.sb.SBaddress(15 downto 0).asBits
  
  // ******** Peripherals *********
  val busMappings = new ArrayBuffer[(SimpleBus,(Bool, MaskMapping))]
  /**
   * memory mapping platform peripherals
   * peripheral | address (from-to)
   * ===========|===========
   * clic       | 0x02000000 - 0x0200FFFF
   * shutdown   | 0x02010000 - 0x020103FF
   * ram        | 0x80000000 - 0x80FFFFFF
   * gpio-leds  | 0x81000000 - 0x8100000F
   * uart       | 0x82000000 - 0x820000FF
   * gpioBankA  | 0x83000000 - 0x830000FF ## not for simulation only platform
   */

  val rvCLIC = new RVCLIC()
  busMappings += rvCLIC.io.sb -> (rvCLIC.io.sel, MaskMapping(0x02000000l,0xFFFF0000l)) // 0x02000000 - 0x0200FFFF
  cpu.io.irqTimer := rvCLIC.io.irq

  val shutdown_periph = new Shutdown()
  busMappings += shutdown_periph.io.sb -> (shutdown_periph.io.sel, MaskMapping(0x02010000l,0xFFFFFC00l)) // 0x02010000 - 0x020103FF
  cpu.io.halt := shutdown_periph.io.halt
  cpu.io.haltErr := shutdown_periph.io.haltErr

  val ram = new ByteAddressableMemory(sizeHexfile,initHexfile)
  busMappings += ram.io.sb -> (ram.io.sel, MaskMapping(0x80000000l,0xFF000000l)) // 0x80000000 - 0x80FFFFFF

  val gpio_led = new GPIOLED()
  busMappings += gpio_led.io.sb -> (gpio_led.io.sel, MaskMapping(0x81000000l,0xFFFFFFF0l)) // 0x81000000 - 0x8100000F
  io.gpioLed := gpio_led.io.leds
  
  val uartPeriph = new SBUart()
  busMappings += uartPeriph.io.sb -> (uartPeriph.io.sel, MaskMapping(0x82000000l,0xFFFFFF00l)) // 0x82000000 - 0x820000FF
  io.uart <> uartPeriph.io.uart
  
  // ******** Master-Peripheral Bus Interconnect *********
  val busDecoder = SimpleBusDecoder(
      master = cpu.io.sb,
      decodings = busMappings.toSeq
  )
  cpu.io.unmapped := busDecoder.io.unmapped.fired
  busDecoder.io.unmapped.clear := True // TODO: change this and add support in the core to handle error on bus - i.e. cause a trap with custom reason?

}

//Generate the Top Verilog
object MicroRV32TopVerilog {
  def main(args: Array[String]) {
    var memSize = Source.fromFile(args(0)).getLines.size
    
    var enaMul = false
    var enaDiv = false
    var enaComp = false
    if (args.length > 1) {
      args(1) match {
        case "rv32i"   => { enaMul = false; enaDiv = false; enaComp = false }
        case "rv32im"  => { enaMul = true; enaDiv = true; enaComp = false }
        case "rv32ic"  => { enaMul = false; enaDiv = false; enaComp = true }
        case "rv32imc" => { enaMul = true; enaDiv = true; enaComp = true }
        case _         => { enaMul = false; enaDiv = false; enaComp = false }
      }
      println("enaMul " + enaMul)
      println("enaDiv " + enaDiv)
      println("enaComp " + enaComp)
    }

    SpinalConfig(
      defaultConfigForClockDomains = ClockDomainConfig(
        resetKind = spinal.core.ASYNC,
        resetActiveLevel = spinal.core.HIGH
      ),
      defaultClockDomainFrequency=FixedFrequency(12 MHz),
      targetDirectory = "rtl"
      //).generateVerilog(new MicroRV32Top("sw/basic-led-c/led-c.hex"))
      ).generateVerilog(new MicroRV32Top(args(0), memSize, RV32CoreConfig(
          generateMultiply = enaMul,
          generateDivide = enaDiv,
          generateCompressed = enaComp
      )))
      .printPruned()
  }
}

//Generate the Top Verilog
object MicroRV32VariantsVerilog {
  def main(args: Array[String]) {

    var memSize = Source.fromFile(args(0)).getLines.size
    SpinalConfig(
      defaultClockDomainFrequency=FixedFrequency(12 MHz),
      targetDirectory = "rtl/jsa-exp/rv32i"
      ).generateVerilog(new MicroRV32Top(args(0), memSize, RV32CoreConfig(
        generateMultiply   = false,
        generateDivide     = false,
        generateCompressed = false
      )))
      .printPruned()
    SpinalConfig(
      defaultClockDomainFrequency=FixedFrequency(12 MHz),
      targetDirectory = "rtl/jsa-exp/rv32im"
      ).generateVerilog(new MicroRV32Top(args(0), memSize, RV32CoreConfig(
        generateMultiply   = true,
        generateDivide     = true,
        generateCompressed = false
      )))
      .printPruned()
    SpinalConfig(
      defaultClockDomainFrequency=FixedFrequency(12 MHz),
      targetDirectory = "rtl/jsa-exp/rv32ic"
      //).generateVerilog(new MicroRV32Top("sw/basic-led-c/led-c.hex"))
      ).generateVerilog(new MicroRV32Top(args(0), memSize, RV32CoreConfig(
        generateMultiply   = false,
        generateDivide     = false,
        generateCompressed = true
      )))
      .printPruned()
    SpinalConfig(
      defaultClockDomainFrequency=FixedFrequency(12 MHz),
      targetDirectory = "rtl/jsa-exp/rv32imc"
      //).generateVerilog(new MicroRV32Top("sw/basic-led-c/led-c.hex"))
      ).generateVerilog(new MicroRV32Top(args(0), memSize, RV32CoreConfig(
        generateMultiply   = true,
        generateDivide     = true,
        generateCompressed = true
      )))
      .printPruned()
  }
}
