package core.microrv32.peripheral.gpiobank

import spinal.core._
import spinal.lib._
import spinal.lib.io.{InOutWrapper, TriStateArray}

/**
*   This black box model encapsulates the Lattice Semiconductor FPGA 
*   Technology Library for the SB_IO primitive - 
*   Used to interconnect the IO Pad with the FPGA design
*   
*/
case class SB_IO(pinType : String) extends BlackBox{
  addGeneric("PIN_TYPE", B(pinType))
  val PACKAGE_PIN = inout(Analog(Bool))
  val OUTPUT_ENABLE = in(Bool)
  val D_OUT_0 = in(Bool)
  val D_IN_0 = out(Bool)
  setDefinitionName("SB_IO")
}
