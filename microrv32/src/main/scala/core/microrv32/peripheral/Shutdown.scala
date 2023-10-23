package core.microrv32

import spinal.core._
import spinal.lib.slave
import core.microrv32.bus._

//Hardware definition
class Shutdown() extends Component{
    val io = new Bundle{
        val sb = slave(SimpleBus(32,32))
        val sel = in(Bool())
        val halt = out Bool()
        val haltErr = out Bool()
    }
    val rdy = Reg(Bool) init(False)
    val intAddr = UInt(4 bits)
    intAddr := io.sb.SBaddress(3 downto 0)
    val read = io.sb.SBvalid && io.sel && !io.sb.SBwrite
    val write = io.sb.SBvalid && io.sel && io.sb.SBwrite
    
    val internalHalt = Reg(Bool) init(False)
    val internalHaltErr = Reg(Bool) init(False)

    val haltCnd = io.sb.SBsize === 4 & io.sb.SBwdata.asUInt === 93

    when(write){
        when(intAddr === 0 & haltCnd){
            internalHalt := True
        }.elsewhen(intAddr === 4 & haltCnd){
            internalHaltErr := True
        }
    }

    // bus ready signal
    rdy := False
    when((read | write) & io.sel){
        rdy := True
    }
    io.sb.SBready := rdy
    io.sb.SBrdata := 0
    // output signals
    io.halt := internalHalt
    io.haltErr := internalHaltErr
}