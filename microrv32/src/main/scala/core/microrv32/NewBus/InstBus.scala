package Bus

import spinal.core._
import spinal.lib.IMasterSlave

//The bus is byte-addressable to memory, the value is the multiples of 4.
//Every btye is addressable, but in normal circumstance, we read a whole word, so the presented number will be 0, 4, 8, 12...
case class InstBus(DataWidth : Int, AddressWidth : Int) extends Bundle with IMasterSlave {
    // val IBvalid = Bool()
    val IBaddress = UInt(AddressWidth bits) //Address of bus is UInt, counting multiples of 4
    val IBrdata = Bits(DataWidth bits)
    // val IBready = Bool()

    override def asMaster(): Unit = {
        out (IBaddress)
        in (IBrdata)
    }
}
