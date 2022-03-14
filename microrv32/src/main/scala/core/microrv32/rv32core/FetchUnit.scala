package core.microrv32.rv32core

import spinal.core._
import spinal.lib._

import core.microrv32.RV32CoreConfig

/*
* Fetch Unit
*/
class FetchUnit(cfg : RV32CoreConfig) extends Component {
    val io = new Bundle{
        val data = in Bits(32 bits)
        val sample = in Bool()
        val instruction = out Bits(32 bits)
    }
    val instructionBuffer = Reg(Bits(32 bits)) init(0)
    // if there is a new instruciton at the instruction memory interface
    // buffer it for the decoder
    when(io.sample){
        instructionBuffer := io.data
    }
    io.instruction := instructionBuffer
}