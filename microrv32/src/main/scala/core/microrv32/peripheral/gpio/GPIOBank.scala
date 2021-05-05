package core.microrv32.peripheral.gpiobank

import spinal.core._
import spinal.lib.slave
import spinal.lib._
import spinal.lib.io.{InOutWrapper, TriStateArray}
import core.microrv32.SimpleBus

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
                sbDataOutputReg := B(inputReg, 32 bits)
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