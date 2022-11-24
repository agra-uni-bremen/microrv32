package core.microrv32

import spinal.core._
import spinal.lib.slave

/*
 * Wrapper for memory on simple bus interface
 * Parameters
 * memoryWidth : Bits - bit width of memory word
 * wordCount : Int - number of words in memory
 * initFile : String - hexdump of inital values loaded into memory
 */
class Memory(memoryWidth : Bits, wordCount : Int, initFile : String) extends Component {
  val io = new Bundle {
    val sb = slave(SimpleBus(32,32))
    val sel = in Bool()
  }

  // memory primitive
  val memRam = new Mem(memoryWidth, wordCount)
  println("Memory bitwidth : " + memoryWidth.toString)
  println("Memory wordcount : " + wordCount)
  
  // ram initialization
  if(initFile.isEmpty){
    println("Init RAM with 0")
    memRam.init(List.fill(wordCount)(B(0,32 bits)))
  }
  else {
    println("Init RAM with initFile")
    println(initFile)
    memRam.init(Tools.readmemh(initFile))
  }

  val rdy = Reg(Bool) init(False)
  val read = io.sb.SBvalid && io.sel && !io.sb.SBwrite
  val write = io.sb.SBvalid && io.sel && io.sb.SBwrite

  /*
   * A short explanation of what is going on in this memory that is different from a trivial/naive memory implementation:
   * The specification of RISC-V states in section 1.4 Memory: 
   *        "A RISC-V hart has a single byte-addressable address space of 2XLEN bytes for all memory accesses."
   * This leaves a lot of space for implementation details of the memory used for a RISC-V hart.
   * We could have easily taken an existing memory implementation (in Verilog/VHDL) with a similar bus interface as the SimpleBus,
   * add and bind it to SpinalHDL for usage purpose. This way we could have had a byte-addessable memory. 
   * E.g. see the existing AGRA riscv-core (verilog) or the picorv32 + picosoc from Clifford Wolf
   * The states examples show two different approaches to implementing a memory: 8-bit width, 32-bit width memory
   * The 8-bit width shows an advantage when it comes to addressing the memory space, simply because you can 
   * directly use the asserted address from the bus. It similarly comes with a disadvantage (especially
   * when writing the memory in a language like SpinalHDL which generates HDL code for you) that it
   * is not very predictable if the memory can be synthesized or not.
   * The 32-bit width shows an advantage at first when it comes to implementing: you write it down as is.
   * One write and one read statement, some masks and the enable. It leaves you with a disadvantage aswell:
   * Making the memory byte-addressable is not trivial. You have to take care about the granularities yourself,
   * if the RISC-V hart does not take care of it (which doesnt have to be the case regarding the specification).
   * You can see this happening with Clifford Wolfs picorv32. There he uses a similar but not same memory interface,
   * having a write-strobe signal to choose which of the bytes are being written to.
   * Another way for this core would have been to take care partly in the core (aligning the bytes to the position) and partly
   * choosing the correct write/read mask.
   * 
   * In order to collect all the logic for byte-addressing granularity at one place we choose to translate the information from the bus
   * to infer where and what to write/read from the memory.
   * Basically it boils down to multiplexing additional signals to align the bytes properly.
   */
   
   /*
   * Generally the first step is to translate the address into an internal address with which we can access the mem-primitive.
   * For a read we need to buffer one clock cycle as they get applied for the read (which happens to be valid after 1 cycle).
   * We read the ram at the internal address: it is the external address, bit-extracted the log2(wordCount) bottom bits, divided by 4
   * The division with 4 causes our byte-adressing granularity to disappear (due to integer division). 
   * From the size and the lowest 2 bits we can recover the information which of the four bytes (as one word is 32-bit) we read
   * is the one that is requested by the RISC-V hart.
   * Bits 1 and 0 from the address give us the requested byte, the size tells us the granularity. 
   * With this information we choose the correct byte and put it onto the rdata of the bus when ready is asserted.
   */
  val ramAddr = io.sb.SBaddress(log2Up(wordCount)-1 downto 0)
  val internalAddress = ramAddr/4
  val tSize = Reg(UInt(4 bits)) init(0)
  tSize := io.sb.SBsize
  val alignment = Reg(UInt(2 bits)) init(0)
  alignment := ramAddr(1 downto 0)
  // READ MEMORY
  val rdVal = memRam.readSync(
    address = internalAddress,
    enable = read
  )
  val byteRD = rdVal.subdivideIn(8 bits)(alignment(1 downto 0))
  val halfRD = rdVal.subdivideIn(16 bits)(alignment(1 downto 1))
  val wordRD = rdVal
  io.sb.SBrdata := tSize.mux[Bits](
      1 -> byteRD.resized,
      2 -> halfRD.resized,
      4 -> wordRD.resized,
      default -> wordRD
  )

  // WRITE MEMORY
  /*
   * Similarly to read, if we write into the memory, we need to figure out the granularity and choose the correct byte.
   * Since we want proper SpinalHDL synthesizable memory we also need to choose the correct write-mask that gets applied.
   * Since the hart assumes a byte-addressable memory space it will align its write data from the LSB.
   * This is not the way we can write it into memory, as usually it would write into the wrong place.
   * So additionally we need to shift the data into the correct position.
   * 
   */
  import MemoryMasks._
  val bytemask = ramAddr(1 downto 0).mux[Bits](
    0 -> W_BYTEMASK_0,
    1 -> W_BYTEMASK_1,
    2 -> W_BYTEMASK_2,
    3 -> W_BYTEMASK_3
  )
  val halfmask = ramAddr(1 downto 1).mux[Bits](
    0 -> W_HALFMASK_0,
    1 -> W_HALFMASK_1
  )
  val writemask = io.sb.SBsize.mux[Bits](
    1 -> bytemask,
    2 -> halfmask,
    4 -> W_WORDMASK,
    default -> W_WORDMASK
  )
  val tmpData = io.sb.SBsize.mux[Bits](
    1 -> B(io.sb.SBwdata(7 downto 0),32 bits),
    2 -> B(io.sb.SBwdata(15 downto 0),32 bits),
    4 -> io.sb.SBwdata,
    default -> io.sb.SBwdata
  )
  val wByteShAmt = ramAddr(1 downto 0).mux[UInt](
    0 -> 0,
    1 -> 8,
    2 -> 16,
    3 -> 24
  )
  val wHalfShAmt = ramAddr(1 downto 1).mux[UInt](
    0 -> 0,
    1 -> 16
  )
  val wShift = io.sb.SBsize.mux[UInt](
    1 -> wByteShAmt,
    2 -> wHalfShAmt,
    4 -> 0,
    default -> 0
  )
  val wdata = B(tmpData,32 bits) |<< wShift
  // write ram masked
  memRam.write(
    address = internalAddress,
    data = wdata,
    enable = write,
    mask = writemask
  )
  // ready logic
  rdy := False
  when((read | write) & io.sel){
    rdy := True
  }
  io.sb.SBready := rdy
}

object MemoryMasks{
  def W_WORDMASK = B"1111"
  def W_HALFMASK_0 = B"0011"
  def W_HALFMASK_1 = B"1100"
  def W_BYTEMASK_0 = B"0001"
  def W_BYTEMASK_1 = B"0010"
  def W_BYTEMASK_2 = B"0100"
  def W_BYTEMASK_3 = B"1000"
}
