package Peripheral

import spinal.core._
import spinal.lib._
import Bus._
import Peripheral._

case class InstMem(WordWidth:Int, InstSize:Int, ContentInst:String) extends Component {
    val io = new Bundle {
        val ib = slave(InstBus(32,32))
    }

    //Initializing ROM of the file
    val romInst = new Mem(Bits(WordWidth bits), InstSize) init(Seq.fill(InstSize)(B(0, 32 bits)))
    romInst.init(Tools.readmemh(ContentInst)) //'Tools.readmemh()' will return am Array type data
    
    //Translating the address to internal one
    //In addition to turn the byte-addressable value into "word-addressable", 
    //the 'log2Up' method also extract the concerned bit, 
    //this will exclude the 'prefix' of the memory range, achieving the translating from the external address to the internal address.
    val InternalAdd = UInt()
    InternalAdd := io.ib.IBaddress(log2Up(InstSize*4)-1 downto 0) >> 2

    //The read is asynchronous to ensure immediate read
    io.ib.IBrdata := romInst.readAsync(InternalAdd)
    
}