package core.microrv32.peripheral.gpiobank

import spinal.core._
import spinal.lib.slave
import spinal.lib._
import spinal.lib.io.{InOutWrapper, TriStateArray}
import core.microrv32.bus._

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

    val busCtrl = SimpleBusSlaveFactory(io.sb, io.sel, addressBits = 8)
    
    val directionReg = Reg(Bits(8 bits)) init(0)
    val outputReg = Reg(Bits(8 bits)) init(0)
    val inputStage = RegNext(io.gpio.read)
    // in order to drive the gpio pin from output and read from input we need to tristate/mux it
    // option: adding a register for inputVal could improve stability of read inputs against glitching
    val inputVal = inputStage & ~directionReg
    io.gpio.writeEnable := directionReg
    io.gpio.write := outputReg

    busCtrl.driveAndRead(directionReg, address = 0)
    busCtrl.driveAndRead(outputReg, address = 4)
    busCtrl.read(inputVal, address = 8)
}