package core.microrv32.peripheral

import core.microrv32.bus._
import spinal.core._
import spinal.lib.slave

/**
 * This GPIO LED peripheral only supplies output to 8 leds
 * This is handy for most FPGA dev boards that come with LEDs
 * Basically is a debugging peripheral.
 */
class SBLED extends Component{
  val io = new Bundle{
    val sb = slave(SimpleBus(32,32))
    val leds = out(Bits(8 bits))
    val sel = in(Bool)
  }
  val busCtrl = SimpleBusSlaveFactory(io.sb, io.sel, addressBits = 4)

  val ledReg = Reg(Bits(32 bits)) init(0)
  busCtrl.driveAndRead(ledReg, address = 0)
  io.leds := ledReg(7 downto 0)
  
}
