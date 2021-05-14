package core.microrv32.peripheral.gpiobank

import spinal.core._
import spinal.lib.slave
import spinal.lib._
import spinal.lib.io.{InOutWrapper, TriStateArray}
import core.microrv32.SimpleBus

/**
 * This GPIO  peripheral supplies a 8 bit wide I/O bank
 * The direction can be set to output through the direction register (1 = output, 0 = input, default = 0)
 * The input is read through 2 flip flops to stabilize it, yet debouncing is still required.
 * The registers are all 8 bit wide, each bit represents a pin that has a direction, output value and input value.
 * Internal memory map:
 * 
 *    internal 
 *        address | description
 *    ============+============
 *         0x0    | direction register, 1 = output pin, 0 = input pin, default value = 0
 *         0x4    | output register, 1 = HIGH, 0 = LOW, if direction[i] = 1, then output[i] is forwarded to pin[i]
 *         0x8    | input register, 1 = HIGH, 0 = LOW, if direction[i] = 0, then pin[i] is forwarded to input[i] via 2 d-ff
 * 
 */
class SBGPIOBank() extends Component{
    val io = new Bundle{
        val sb = slave(SimpleBus(32,32))
        val gpio = master(TriStateArray(8 bits))
        val sel = in(Bool)
    }
    val rdy = Reg(Bool) init(False)
    val intAddr = UInt(8 bits)
    val read = io.sb.SBvalid && io.sel && !io.sb.SBwrite
    val write = io.sb.SBvalid && io.sel && io.sb.SBwrite

    val SBGPIOLogic = new Area{
        intAddr := io.sb.SBaddress(7 downto 0)
        
        val directionReg = Reg(Bits(8 bits)) init(0)
        val outputReg = Reg(Bits(8 bits)) init(0)
        // buffer for 2 clocks to get rid of meta stability
        val inputStage = RegNext(io.gpio.read)
        val inputReg = RegNext(inputStage)
        val inputVal = inputReg & ~directionReg
        io.gpio.writeEnable := directionReg
        io.gpio.write := outputReg
        
        val sbDataOutputReg = Reg(Bits(32 bits)) init(0)
        sbDataOutputReg := 0
        
        // address mapping logic
        when(write){
            when(intAddr === 0){
                directionReg := io.sb.SBwdata(7 downto 0)
            }.elsewhen(intAddr === 4){
                outputReg := io.sb.SBwdata(7 downto 0)
            }
        }.elsewhen(read){
            when(intAddr === 0){
                sbDataOutputReg := B(directionReg, 32 bits)
            }.elsewhen(intAddr === 4){
                sbDataOutputReg := B(outputReg, 32 bits)
            }.elsewhen(intAddr === 8){
                sbDataOutputReg := B(inputVal, 32 bits)
            }
        }
        // 
    }
    // bus ready signal -- transaction must be done in one cycle!
    rdy := False
    when((read | write) & io.sel){
        rdy := True
    }
    io.sb.SBready := rdy
    io.sb.SBrdata := SBGPIOLogic.sbDataOutputReg
}

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
