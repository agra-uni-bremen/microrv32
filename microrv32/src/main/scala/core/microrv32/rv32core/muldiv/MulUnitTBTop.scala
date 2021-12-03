package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.lib._

/*
* An additional top level unit is needed for the multiplication unit
* to input signed and unsigned numbers independently (but not in parallel)
* to the unit from the simulaiton front end (as its using Scala there for the types)
* As the transformation between the typing systems (especially with signed/unsigned -> bits)
* is annoying to deal with. A top level with seperate input types is easier for the simulation.
*/ 
class MulUnitTBTop extends Component{
  val io = new Bundle {
    val multiplicand = in SInt(32 bits)
    val multiplier = in SInt(32 bits)
    val multiplicandU = in UInt(32 bits)
    val multiplierU = in UInt(32 bits)
    val product = out SInt(64 bits)
    val valid = in Bool()
    val ready = out Bool()
    val operation = in(MulOperation())
  }
  val mulUnit = new MulUnit()
  mulUnit.io.multiplicand := io.operation.mux(
    MulOperation.mul -> io.multiplicand.asBits,
    MulOperation.mulh -> io.multiplicand.asBits,
    MulOperation.mulhsu -> io.multiplicand.asBits,
    MulOperation.mulhu -> io.multiplicandU.asBits
  )

  mulUnit.io.multiplier := io.operation.mux(
    MulOperation.mul -> io.multiplier.asBits,
    MulOperation.mulh -> io.multiplier.asBits,
    MulOperation.mulhsu -> io.multiplierU.asBits,
    MulOperation.mulhu -> io.multiplierU.asBits
  )
  io.product := mulUnit.io.product.asSInt
  mulUnit.io.valid := io.valid
  io.ready := mulUnit.io.ready
  mulUnit.io.operation := io.operation
}