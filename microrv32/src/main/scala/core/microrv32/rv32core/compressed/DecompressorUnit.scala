package core.microrv32.rv32core.compressed

import spinal.core._
import spinal.lib._

import core.microrv32.RV32CoreConfig

/*
 * Decompress Unit
 */
class DecompressUnit() extends Component {
  val io = new Bundle {
    val data = in Bits (32 bits)
    val sample = in Bool ()
    val instruction = out Bits (32 bits)
    val pc = in UInt(32 bits)
  }

  // expander.io.compInstr := something
  // somethingElse := expInstr
  
}
