package core.microrv32

import core.microrv32.peripheral.GPIOLED
import core.microrv32.peripheral.uart.SBUart
import core.microrv32.peripheral.gpiobank.SBGPIOBank
import core.microrv32.peripheral.gpiobank.SB_IO
import spinal.lib.io.{InOutWrapper, TriStateArray}
import spinal.core._
import spinal.lib._
import spinal.lib.slave
import core.microrv32.Tools._
import spinal.lib.com.uart._

/*
 * Top level of MicroRV32 platform for the Lattice Semiconductor HX8K FPGA .
 * It is a copy of the general MicroRV32 adding specific IO primitives for GPIO.
 * This is due to the primitives not being available for simulation with Verilator.
 * Memory mapping and IO mapping
 * Having a clock divider for top level clock spreading.
 * Binding cpu, memory and peripherals to memory mapped bus
 * By default builds blink-example for fpga use for code generation
 */
class MicroRV32TopHX8K(initHexfile:String) extends Component {
  val io = new Bundle {
    // clock and reset through spinalhdl
    val gpioLed = out Bits(8 bits)
    val cpuFetch = out Bool
    val cpuHalted = out Bool
    val cpuDbgState = out Bits(3 bits)
    val dbgBus = out Bits(16 bits)
    // val dbgClk = out Bool
    val uart = master(new Uart())
    //val gpioA = master(TriStateArray(8 bits))
    val gpioA = inout(Analog(Vec.fill(8)(Bool)))
  }
  // Create clock domain for divider and slow clock signal
  // val slowClk = Bool()
  // val slowCD = ClockDomain(slowClk,ClockDomain.current.readResetWire)
  // val clkDiv = new ClockDivider(ClockDomain.current,12000000, 12000000) // divide 12 mhz onboard clock to 10khz
  // slowClk := clkDiv.io.outClk
  // io.dbgClk := clkDiv.io.outClk
  val cpu = new SBRV32Core()
  /*
   * NOTE: Make word count (second parameter of Memory) passable through top class and as makefile/sbt parameter
   * REMINDER: The amount of words per hexfile is four (4) times less than that of the 
   * elf2bin parameter you have passed for generating the .hex
   * EXAMPLE: 
   * You want a memory with 0x1200 wordCount 
   * When calling elf2bin on your binary make sure to pass 4 times that wordcount to your elf2bin
   * Because elf2bin takes the numbers of BYTES not WORDS (8bit vs 32bit obviously).
   * ./sw/elf2bin.py ./sw/basic-c/main ./sw/basic-c/basic-c.hex 0x4800
   * This was more trivial when the wordcount of the 8bit wide memory was the same as the value passed to elf2bin.py
   * With that the second parameter of Memory is 0x1200 in hex or 4608 in decimal
   */
  // val ram = new Memory(Bits(32 bits),8704,initHexfile) // riscv-ui-p-tests
  //val ram = new Memory(Bits(32 bits),4104,initHexfile) // basic-led-c, basic-timerirq, crc8, benchmarks (fibo, gcd) but not freeRTOS benchmarks
  val ram = new Memory(Bits(32 bits),100,initHexfile) // basic-led-blink
  // val ram = new Memory(Bits(32 bits),393216,initHexfile) // freertos (simple-tasks, simple-queues, etc.) including benchmarks
   
  // val gpio = new GPIO()
  val gpio_led = new GPIOLED()
  val shutdown_periph = new Shutdown()
  val uartPeriph = new SBUart()
  val rvCLIC = new RVCLIC()
  val gpioBankA = new SBGPIOBank()

  // bus interconnect
  /*
   * interconnecting works fine to a certain degree
   * when interconnecting slaves to one master there must be
   * some logic that wires all the signals that drive towards the CPU
   * so this will refer to the actual memory mapping logic
   */
  val intconSBready = Bool
  val intconSBrdata = Bits(32 bits)

  cpu.io.sb <> ram.io.sb
  cpu.io.sb <> gpio_led.io.sb
  cpu.io.sb <> shutdown_periph.io.sb
  cpu.io.sb <> uartPeriph.io.sb
  cpu.io.sb <> rvCLIC.io.sb
  cpu.io.sb <> gpioBankA.io.sb
  
  cpu.io.sb.SBready.removeAssignments()
  cpu.io.sb.SBrdata.removeAssignments()
  
  cpu.io.sb.SBready := intconSBready
  cpu.io.sb.SBrdata := intconSBrdata
  
  cpu.io.halt := shutdown_periph.io.halt
  cpu.io.haltErr := shutdown_periph.io.haltErr
  cpu.io.irqTimer := rvCLIC.io.irq
  
  /*
  * IDEA since there will be some peripherals that interact with the environment 
  * it is obvious that some of the pins of the io bundles will eventually be mapped in the pcf 
  * of the synthesis for the fpga -- as this platform is meant for fpga usage 
  * outputting a proper pcf file from this toplevel design would actually be 
  * some neat addtion and eventually this is useful in spinalhdl <-> fpga 
  * development anyway actually this would be additional to the interface 
  * of spinal that will be interacting with for example yosys.
  * for now i will probably save this for the end, as it will be easier to write 
  * the pcf by hand for this project
  * for example: 
  * - create the peripheral component that has io in toplevel bundle
  * - give component some configuration for its output pins that can print pcf format 
  *   from the pin-names/numbers i give it
  * - for each generation of verilog also generate the pcf from all io-pin components 
  * the rationale would be that touching the pcf files wouldnt need any propiritary tool 
  * but it integrated in the hdl (in this case spinalhdl) and uses the capacity underlying 
  * language by its fullest
  */

  /**
   * memory mapping platform peripherals
   * peripheral | address (from-to)
   * ===========|===========
   * clic       | 0x02000000 - 0x0200FFFF
   * shutdown   | 0x02010000 - 0x020103FF
   * ram        | 0x80000000 - 0x80FFFFFF
   * gpio-leds  | 0x81000000 - 0x8100000F
   * uart       | 0x82000000 - 0x820000FF
   * gpioBankA  | 0x83000000 - 0x830000FF
   */
  val addressMapping = new Area{
    val addr = cpu.io.sb.SBaddress
    val oldAddr = RegNextWhen(addr,cpu.io.sb.SBvalid)
    val lastValid = RegNext(cpu.io.sb.SBvalid)
    val datasel = UInt(4 bits) // 2^4 = 16 address-range-selectors, nice magic numbers
    ram.io.sel := False
    gpio_led.io.sel := False
    shutdown_periph.io.sel := False
    uartPeriph.io.sel := False
    rvCLIC.io.sel := False
    gpioBankA.io.sel := False
    datasel := 0
    // TODO if this stays multiple when (instead when,elsewhen) refactor towards function use to return hw for mapping
    // this helps readablity
    // MEMORY
    when(isInRange(addr, U"h80000000", U"h80FFFFFF") | isInRange(oldAddr, U"h80000000", U"h80FFFFFF")){
      ram.io.sel := True
      gpio_led.io.sel := False
      shutdown_periph.io.sel := False
      uartPeriph.io.sel := False
      rvCLIC.io.sel := False
      gpioBankA.io.sel := False
      datasel := 1
    }
    // LED
    when(isInRange(addr, U"h81000000", U"h8100000F") | isInRange(oldAddr, U"h81000000", U"h8100000F")){
      ram.io.sel := False
      gpio_led.io.sel := True
      shutdown_periph.io.sel := False
      uartPeriph.io.sel := False
      rvCLIC.io.sel := False
      gpioBankA.io.sel := False
      datasel := 2
    }
    // UART
    when(isInRange(addr, U"h82000000", U"h820000FF") | isInRange(oldAddr, U"h82000000", U"h820000FF")){
      ram.io.sel := False
      gpio_led.io.sel := False
      shutdown_periph.io.sel := False
      uartPeriph.io.sel := True
      rvCLIC.io.sel := False
      gpioBankA.io.sel := False
      datasel := 4
    }
    // GPIO Bank A
    when(isInRange(addr, U"h83000000", U"h830000FF") | isInRange(oldAddr, U"h83000000", U"h830000FF")){
      ram.io.sel := False
      gpio_led.io.sel := False
      shutdown_periph.io.sel := False
      uartPeriph.io.sel := False
      rvCLIC.io.sel := False
      gpioBankA.io.sel := True
      datasel := 6
    }
    // CLIC - MTIME/MTIMECMP  -- #define CLINT_BASE  0x2000000
    when(isInRange(addr, U"h02000000", U"h0200ffff") | isInRange(oldAddr, U"h02000000", U"h0200ffff")){
      ram.io.sel := False
      gpio_led.io.sel := False
      shutdown_periph.io.sel := False
      uartPeriph.io.sel := False
      rvCLIC.io.sel := True
      gpioBankA.io.sel := False
      datasel := 5
    }
    // SHUTDOWN SYSCALL
    when(isInRange(addr, U"h02010000", U"h020103ff") | isInRange(oldAddr, U"h02010000", U"h020103ff")){
      ram.io.sel := False
      gpio_led.io.sel := False
      shutdown_periph.io.sel := True
      uartPeriph.io.sel := False
      rvCLIC.io.sel := False
      gpioBankA.io.sel := False
      datasel := 3
    }
    // mux bus slave signals for ready and data back towards cpu
    intconSBready := datasel.mux(
      0 -> False,
      1 -> ram.io.sb.SBready,
      2 -> gpio_led.io.sb.SBready,
      3 -> shutdown_periph.io.sb.SBready,
      4 -> uartPeriph.io.sb.SBready,
      5 -> rvCLIC.io.sb.SBready,
      6 -> gpioBankA.io.sb.SBready,
      default -> False
    )
    intconSBrdata := datasel.mux[Bits](
      0 -> 0,
      1 -> ram.io.sb.SBrdata,
      2 -> gpio_led.io.sb.SBrdata,
      3 -> shutdown_periph.io.sb.SBrdata,
      4 -> uartPeriph.io.sb.SBrdata,
      5 -> rvCLIC.io.sb.SBrdata,
      6 -> gpioBankA.io.sb.SBrdata,
      default -> 0
    )
  }
  io.cpuFetch := cpu.io.fetchSync
  io.cpuHalted := cpu.io.halted
  io.cpuDbgState := cpu.io.dbgState
  io.gpioLed := gpio_led.io.leds
  io.dbgBus := cpu.io.sb.SBaddress(15 downto 0).asBits
  io.uart <> uartPeriph.io.uart
  
  // create SB_IO primitves for each GPIO pin of bank A - instanciate, and connect
  for(i <- 0 until 8) {
    println("set_io " + gpioBankA.io.gpio.getName() + "_" + i)
    // val newIo = inout(Analog(Bool)).setWeakName(gpioBankA.io.gpio.getName() + "_" + i)
    val sbio = SB_IO("101001")
    //io.gpioA.setWeakName(gpioBankA.io.gpio.getName() + "_" + i)
    sbio.PACKAGE_PIN := io.gpioA(i)
    sbio.OUTPUT_ENABLE := gpioBankA.io.gpio.writeEnable(i)
    sbio.D_OUT_0 := gpioBankA.io.gpio.write(i)
    gpioBankA.io.gpio.read(i) := sbio.D_IN_0
    //io.gpioA(i) := sbio.PACKAGE_PIN
  }

  //io.testOut := io.testIn
  // gpioBankA.io.gpio.setAsDirectionLess.unsetName().allowDirectionLessIo
  //io.gpioA <> gpioBankA.io.gpio
  


}

//Generate the Top Verilog
object MicroRV32TopHX8KVerilog {
  def main(args: Array[String]) {
    SpinalConfig(
      defaultClockDomainFrequency=FixedFrequency(12 MHz),
      targetDirectory = "rtl"
      //).generateVerilog(new MicroRV32TopHX8K("sw/basic-led-c/led-c.hex"))
      ).generateVerilog(new MicroRV32TopHX8K(args(0)))
      .printPruned()
  }
}