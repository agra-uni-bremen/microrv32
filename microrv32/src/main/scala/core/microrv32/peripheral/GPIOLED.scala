package core.microrv32.peripheral

import core.microrv32.bus._
import spinal.core._
import spinal.lib.slave

/**
 * This GPIO LED peripheral only supplies output to 8 leds
 * This is handy for most FPGA dev boards that come with LEDs
 * Basically is a debugging peripheral.
 */
class GPIOLED extends Component{
  val io = new Bundle{
    val sb = slave(SimpleBus(32,32))
    val leds = out(Bits(8 bits))
    // necessary?
    val sel = in(Bool)
  }
  val rdy = Reg(Bool) init(False)
  // config & exec registers
  val led_out_val = Reg(Bits(32 bits)) init(0) // RW

  val intAddr = UInt(4 bits)
  intAddr := io.sb.SBaddress(3 downto 0)
  val read = io.sb.SBvalid && io.sel && !io.sb.SBwrite
  val write = io.sb.SBvalid && io.sel && io.sb.SBwrite

  // register logic
  io.sb.SBrdata := 0 // default value
  when(write){
    when(intAddr === 0){
      led_out_val := io.sb.SBwdata
    }
  }.elsewhen(read){
    when(intAddr === 0){
      io.sb.SBrdata := led_out_val
    }
  }

  // output stage
  io.leds := led_out_val(7 downto 0)

  // bus ready signal
  rdy := False
  when((read | write) & io.sel){
    rdy := True
  }
  io.sb.SBready := rdy
}
