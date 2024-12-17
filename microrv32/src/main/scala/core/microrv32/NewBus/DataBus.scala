package Bus

import spinal.core._
import spinal.lib.IMasterSlave

case class DataBus(DataWidth:Int, AddressWidth:Int) extends Bundle with IMasterSlave {
    val DBaddress = UInt(AddressWidth bits)
    val DBvalid = Bool()
    val DBwdata = Bits(DataWidth bits)
    val DBrdata = Bits(DataWidth bits)
    val DBwrite = Bool()
    val DBready = Bool()
    //load or store may focusing on byte-wide, halfword-wide and word-wide
    val DBsize = UInt(4 bits) //1, 2, 4
    //The sign extension for lb, lh will be solved in CPU, memory only fulfill the function of extracting hw or byte.

    override def asMaster(): Unit = {
        out(DBvalid, DBaddress, DBwdata, DBwrite, DBsize)
        in(DBready, DBrdata)
    }
}