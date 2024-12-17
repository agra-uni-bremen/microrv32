package Peripheral

import spinal.core._

import scala.collection.mutable.ArrayBuffer
import scala.io.Source

object Tools {
  /*
   * this is used, if memory content is saved as described in risc-v isa specification
   * instruction is saved in memory as 16-bit parcels as little endian bytes
   * such outputs the risc-v-gcc compiler
   */
  def unswapInstruction(instr: Bits): Bits = {
    instr(7 downto 0) ## instr(15 downto 8) ## instr(23 downto 16) ## instr(31 downto 24)
  }

  def unswapStub(word: Bits): Bits = {
    //word(7 downto 0) ## word(15 downto 8) ## word(23 downto 16) ## word(31 downto 24)
    word
  }

  //From https://github.com/SpinalHDL/SpinalHDL/issues/160#issuecomment-445445201
  //Until there is a spinalhdl built-in method for binding memory content like readmemh in verilog
  def readmemh(path: String): Array[Bits] = {
    val buffer = new ArrayBuffer[Bits]
    for (line <- Source.fromFile(path).getLines) {
      val tokens: Array[String] = line.split("(//)").map(_.trim)
      if (tokens.length > 0 && tokens(0) != "") {
        val i = BigInt(tokens(0).slice(6,8)+tokens(0).slice(4,6)+tokens(0).slice(2,4)+tokens(0).slice(0,2), 16)
        buffer.append(B(i))
      }
    }
    buffer.toArray
  }

  def readmemhHalf(path: String, upper: Boolean): Array[Bits] = {
    val buffer = new ArrayBuffer[Bits]
    var i : BigInt = 0
    for (line <- Source.fromFile(path).getLines) {
      val tokens: Array[String] = line.split("(//)").map(_.trim)
      if (tokens.length > 0 && tokens(0) != "") {
        if(!upper){
          i = BigInt(tokens(0).slice(2,4)+tokens(0).slice(0,2), 16)
        } else{
          i = BigInt(tokens(0).slice(6,8)+tokens(0).slice(4,6), 16)
        }
        buffer.append(B(i))
      }
    }
    buffer.toArray
  }
  // def readmemhHalf(path: String, upper: Boolean, targetSize: Int): Array[Bits] = {
  //   val buffer = new ArrayBuffer[Bits]
  //   var i : BigInt = 0
  //   var indexCount : Int = 0
  //   for (line <- Source.fromFile(path).getLines) {
  //     val tokens: Array[String] = line.split("(//)").map(_.trim)
  //     if (tokens.length > 0 && tokens(0) != "") {
  //       if(!upper){
  //         i = BigInt(tokens(0).slice(2,4)+tokens(0).slice(0,2), 16)
  //       } else{
  //         i = BigInt(tokens(0).slice(6,8)+tokens(0).slice(4,6), 16)
  //       }
  //       buffer.append(B(i))
  //       indexCount += 1
  //     }
  //   }
  //   //buffer.addAll(List.fill((targetSize-indexCount)(BigInt(0))))
  //   List.fill((targetSize-indexCount))(BigInt(0)).foreach(buffer.append(_))
  //   buffer.toArray
  // }

  def readBytesFromTxt(path: String): Array[Bits] = {
    val buffer = new ArrayBuffer[Bits]
    for(line <- Source.fromFile(path).getLines){
      val bytes : Array[String] = line.split(" ").map(_.trim)
      val parsedWord : BigInt = 0
      for(byte <- bytes){
        buffer.append(B(Integer.parseUnsignedInt(byte,32)))
      }
    }
    println(buffer.toString())
    buffer.toArray
  }

  // Check if given address is in range of addr_begin and addr_end
  // takes and returns spinalhdl datatypes for hw-generation
  def isInRange(addr: UInt, addr_begin: UInt, addr_end: UInt): Bool = {
    (addr >= addr_begin && addr <= addr_end)
  }
}