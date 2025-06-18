package Peripheral

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

import Bus._
import Peripheral._

//Instantiate the byte-addressable RAM for Data memory
case class DataMem (WordWidth:Int, DataSize:Int, ContentData:String) extends Component {
    val io = new Bundle {
        val sel = in Bool()
        val db = slave(DataBus(32,32))
    }

    //ram initialization
    val ramData = new Mem(Bits(WordWidth bits), DataSize) init(Seq.fill(DataSize)(B(0, 32 bits)))
    ramData.init(Tools.readmemh(ContentData))
    
    //Translate the address for internal addressing
    val internalAddress = io.db.DBaddress(log2Up(DataSize*4)-1 downto 0) >> 2 //indicating the position of lines.
    val divider = io.db.DBaddress(1 downto 0) //0, 1, 2, 3, indicating the position inside the single line
    //The difference between the instruction address and data address is
    //For instruction address, the address must be the multiples of 4. So after the division of 4, the result is 0, 1, 2, 3...
    //However, for data address, the address may not exactly the multiples of 4. CPU may processed with the data situated in the 23rd byte.
    //Based on that, the first two LSB of received address indicates the specific position of start point of requested data.
    //And the DBsize signal gives the information about data length it may extract from the raw 32-bit value.
    //What worth the attention is that, the combination of data length and start position will not exceed the range of the rawData.
    //Here is the example: grab the data of the 5th byte, the half-word data starting at 6th byte, etc.

    //load/read memory.
    val ReadEnable = io.sel & io.db.DBvalid & (!io.db.DBwrite)
    val RawRD = Bits(32 bits)
    RawRD := ramData.readSync(
        address = internalAddress, 
        enable = ReadEnable 
    )
    val RDbyte = RawRD.subdivideIn(8 bits)(divider).resize(32 bits) //lbu
    val RDhw = RawRD.subdivideIn(16 bits)(divider(1).asUInt).resize(32 bits) //lhu
    io.db.DBrdata := io.db.DBsize.mux (
       1 -> RDbyte,
       2 -> RDhw,
       4 -> RawRD,
       default -> B(0, 32 bits) //default is necessary in every mux to cover all the possible results
    )


    //store/write memory. sw, sh, sb
    //The transmitted data is 32-bits, but the demanding bits is situated in the low endian.
    // val RawWD = Reg(Bits(32 bits))
    val RawWD = Bits(32 bits)
    RawWD := io.db.DBwdata
    // val WDbyte, WDhw = Bits(32 bits)
    val WriteEnable = io.sel & io.db.DBvalid & io.db.DBwrite
    val WbEnable, WhwEnable, WwEnable = Bool()

    val WDbyte = divider.mux[Bits](
        0 -> B(32 bits, (7 downto 0) -> RawWD(7 downto 0), default -> False),
        1 -> B(32 bits, (15 downto 8) -> RawWD(7 downto 0), default -> False),
        2 -> B(32 bits, (23 downto 16) -> RawWD(7 downto 0), default -> False),
        3 -> B(32 bits, (31 downto 24) -> RawWD(7 downto 0), default -> False)
    )

    val bMask = divider.mux[Bits](
        0 -> B(32 bits, (7 downto 0) -> B(8 bits, default -> True), default -> False),
        1 -> B(32 bits, (15 downto 8) -> B(8 bits, default -> True), default -> False),
        2 -> B(32 bits, (23 downto 16) -> B(8 bits, default -> True), default -> False),
        3 -> B(32 bits, (31 downto 24) -> B(8 bits, default -> True), default -> False)
    )

    val WDhw = divider(1).asUInt.mux[Bits](
        0 -> B(32 bits, (15 downto 0) -> RawWD(15 downto 0), default -> False),
        1 -> B(32 bits, (31 downto 16) -> RawWD(15 downto 0), default -> False)
    )

    val hwMask = divider(1).asUInt.mux[Bits](
        0 -> B(32 bits, (15 downto 0) -> B(16 bits, default -> True), default -> False),
        1 -> B(32 bits, (31 downto 16) -> B(16 bits, default -> True), default -> False)
    )

    val trueData = io.db.DBsize.mux[Bits](
        1 -> WDbyte,
        2 -> WDhw,
        4 -> RawWD,
        default -> RawWD
    )

    val trueMask = io.db.DBsize.mux[Bits](
        1 -> bMask,
        2 -> hwMask,
        4 -> B(32 bits, default -> True),
        default -> B(32 bits, default -> True)
    )

    ramData.write( //synchronously write
        enable = WriteEnable,
        address = internalAddress,
        data = trueData,
        mask = trueMask
    )

    //Ready signal. 
    when((ReadEnable | WriteEnable) & io.db.DBvalid) {
        io.db.DBready := True 
    } otherwise {
        io.db.DBready := False
    }
}