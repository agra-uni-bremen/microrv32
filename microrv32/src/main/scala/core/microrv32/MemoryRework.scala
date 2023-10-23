package core.microrv32

import spinal.core._
import spinal.lib.slave
import spinal.lib._
import core.microrv32.bus._

/*
 * Wrapper for byte addressable memory on simple bus interface
 * Parameters
 * wordCount : Int - number of words in memory
 * initFile : String - hexdump of inital values loaded into memory
 */
class ByteAddressableMemory(wordCount : Int, initFile : String) extends Component {
  val io = new Bundle {
    val sb = slave(SimpleBus(32,32))
    val sel = in Bool()
  }

  // NOTE: are these assertions too strict?
  assert(
    assertion = (wordCount >= 4),
    message = "Need to pass wordcount greater or equal than 1 word ( word count >= 1)."
  )
  // assert(
  //   assertion = (wordCount % 4 == 0),
  //   message = "Wordcount (" + wordCount + ") needs to be divisible by 4 (word count mod 4 == 0). wordCount % 4 : " + (wordCount % 4) + "\n"
  // )

  // memory primitive
  val memBank0 = new Mem(Bits(16 bits), wordCount)
  val memBank1 = new Mem(Bits(16 bits), wordCount)
  println("Memory wordcount : " + wordCount)
  println("Bytes: " + wordCount*4)
  println("log_2(wordcount) : " + log2Up(wordCount))
  
  // ram initialization
  if(initFile.isEmpty){
    println("Init RAM with 0")
    memBank0.init(List.fill(wordCount)(B(0,8 bits)))
    memBank1.init(List.fill(wordCount)(B(0,8 bits)))
  }
  else {
    println("Init RAM with initFile")
    println(initFile)
    memBank0.init(Tools.readmemhHalf(initFile, false))
    memBank1.init(Tools.readmemhHalf(initFile, true))
  }

  val rdy = Reg(Bool) init(False)
  val read = io.sb.SBvalid && io.sel && !io.sb.SBwrite
  val write = io.sb.SBvalid && io.sel && io.sb.SBwrite

  val rdVal = Bits(32 bits)
  val sizeByte = io.sb.SBsize === 1
  val sizeHalf = io.sb.SBsize === 2
  val sizeWord = io.sb.SBsize === 4
  val memAddr = io.sb.SBaddress(log2Up(wordCount)+1 downto 0)  
  val tSize = Reg(UInt(4 bits)) init(0)
  tSize := io.sb.SBsize
  val alignment = Reg(UInt(2 bits)) init(0)
  alignment := memAddr(1 downto 0)
  val alignSel = memAddr(1 downto 0) === 2 | memAddr(1 downto 0) === 3 // 1:0 counts from 0 to 3, 0, 1 is in bank0, 2,3 in bank 1
  val bankAddr = memAddr(log2Up(wordCount)+1 downto 2)
  val b0addr = alignSel.mux(
    False -> bankAddr,
    True -> (bankAddr + 1)
  )
  val b1addr = bankAddr
  val bank0Read = memBank0.readSync(address = b0addr, enable = read) 
  val bank1Read = memBank1.readSync(address = b1addr, enable = read)
  rdVal := B(bank1Read ## bank0Read, 32 bits)
  val byteRD = rdVal.subdivideIn(8 bits)(alignment(1 downto 0))
  val halfRD = rdVal.subdivideIn(16 bits)(alignment(1 downto 1))
  val wordRD = Bits(32 bits)
  when(b0addr =/= b1addr){
    wordRD := rdVal(15 downto 0) ## rdVal(31 downto 16)
  }.otherwise{
    wordRD := rdVal
  }

  io.sb.SBrdata := tSize.mux[Bits](
    1 -> byteRD.resized,
    2 -> halfRD.resized,
    4 -> wordRD.resized,
    default -> wordRD
  )

  import MemoryMasks._
  val bytemask = memAddr(1 downto 0).mux[Bits](
    0 -> W_BYTEMASK_0,
    1 -> W_BYTEMASK_1,
    2 -> W_BYTEMASK_2,
    3 -> W_BYTEMASK_3
  )
  val halfmask = memAddr(1 downto 1).mux[Bits](
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
  val wByteShAmt = memAddr(1 downto 0).mux[UInt](
    0 -> 0,
    1 -> 8,
    2 -> 16,
    3 -> 24
  )
  val wHalfShAmt = memAddr(1 downto 1).mux[UInt](
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
  val b0mask = Bits(2 bits)
  val b1mask = Bits(2 bits)
  val b0writeEna = Bool()
  val b1writeEna = Bool()
  def assignBankMasksAndEna(b0m : Bits, b1m : Bits, b0Ena : Bool, b1Ena : Bool) : Unit = {
    b0mask := b0m
    b1mask := b1m
    b0writeEna := b0Ena
    b1writeEna := b1Ena
  }
  switch(io.sb.SBsize){
    is(1){
      switch(memAddr(1 downto 0)){
        is(0){
          assignBankMasksAndEna(B"01", B"00", True, False)
        }
        is(1){
          assignBankMasksAndEna(B"10", B"00", True, False)
        }
        is(2){
          assignBankMasksAndEna(B"00", B"01", False, True)
        }
        is(3){
          assignBankMasksAndEna(B"00", B"10", False, True)
        }
      }
    }
    is(2){
      when(memAddr(1 downto 1) === 0){
        assignBankMasksAndEna(B"11", B"00", True, False)
      }.otherwise{
        assignBankMasksAndEna(B"00", B"11", False, True)
      }
    }
    is(4){
      assignBankMasksAndEna(B"11", B"11", True, True)
    }
    default{
      // 
      assignBankMasksAndEna(B"00", B"00", False, False)
    }
  }
  
  // write ram masked
  memBank0.write(
    address = bankAddr,
    data = wdata(15 downto 0),
    enable = b0writeEna & write,
    mask = b0mask
  )  
  memBank1.write(
    address = bankAddr,
    data = wdata(31 downto 16),
    enable = b1writeEna & write,
    mask = b1mask 
  )

  // ready logic
  rdy := False
  when((read | write) & io.sel){
    rdy := True
  }
  io.sb.SBready := rdy
}

//Generate the Top Verilog
object BAMVerilog {
  def main(args: Array[String]) {
    SpinalConfig(
      defaultClockDomainFrequency=FixedFrequency(12 MHz),
      targetDirectory = "rtl"
      ).generateVerilog(new ByteAddressableMemory(100,""))
      .printPruned()
  }
}
// object MemoryMasks{
//   def W_WORDMASK = B"1111"
//   def W_HALFMASK_0 = B"0011"
//   def W_HALFMASK_1 = B"1100"
//   def W_BYTEMASK_0 = B"0001"
//   def W_BYTEMASK_1 = B"0010"
//   def W_BYTEMASK_2 = B"0100"
//   def W_BYTEMASK_3 = B"1000"
// }
