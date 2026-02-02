package core.microrv32.peripheral

import spinal.core._
import spinal.lib.slave
import core.microrv32.bus._

//Hardware definition
class SBShutdown() extends Component{
    val io = new Bundle{
        val sb = slave(SimpleBus(32,32))
        val sel = in(Bool())
        val halt = out Bool()
        val haltErr = out Bool()
    }
    
    val busCtrl = SimpleBusSlaveFactory(io.sb, io.sel, addressBits = 4)
    
    val internalHalt = Reg(Bool) init(False)
    val internalHaltErr = Reg(Bool) init(False)

    val haltCnd = io.sb.SBsize === 4 & io.sb.SBwdata.asUInt === 93

    // the commented code has the same function but with one cycle delay
    // busCtrl.onWrite(0){
    //     internalHalt := haltCnd
    // }
    when(busCtrl.askWrite && busCtrl.writeAddress === 0){
        internalHalt := haltCnd
    }
    when(busCtrl.askWrite && busCtrl.writeAddress === 4){
        internalHaltErr := haltCnd
    }
    
    // output signals
    io.halt := internalHalt
    io.haltErr := internalHaltErr
}

