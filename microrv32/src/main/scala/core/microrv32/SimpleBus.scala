
package core.microrv32

import spinal.core._
import spinal.lib.IMasterSlave
  /*
   * Simple Bus implementation for MicroRV32
   * Assume the processing unit is the only master on this bus
   * CPU asserts valid when address is valid for read,
   * for writes respectivly write, wdata and size are valid additionally on asserting valid.
   * All slaves assert ready in the clock cycle rdata is valid
   * Top level should take care of memory mapping and peripheral specific wiring-
   */
case class SimpleBus(dataWidth:Int, addressWidth:Int) extends Bundle with IMasterSlave {
  // master signals
  val SBaddress = UInt(addressWidth bits)
  val SBvalid = Bool
  val SBwdata = Bits(dataWidth bits)
  val SBwrite = Bool
  val SBsize = UInt(4 bits)
  // slave signals
  val SBready = Bool
  val SBrdata = Bits(dataWidth bits)

  // how should <> connect operator work for master of bus
  // remember to take care of slave bus connection as there are many slaves driving the same signals
  override def asMaster(): Unit = {
    out(SBvalid, SBaddress, SBwdata, SBwrite, SBsize)
    in(SBready, SBrdata)
  }
}
