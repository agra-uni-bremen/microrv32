//Hardware definition
//The logic on how the halt request signal is activated.

package Peripheral

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

import Bus._

class Shutdown() extends Component{
    val io = new Bundle{
        val db = slave(DataBus(32,32))
        val sel = in(Bool())
        val halt = out Bool()
        val haltErr = out Bool()
    }
    val rdy = Reg(Bool) init(False)
    val intAddr = UInt(4 bits)
    intAddr := io.db.DBaddress(3 downto 0)
    val read = io.db.DBvalid && io.sel && !io.db.DBwrite
    val write = io.db.DBvalid && io.sel && io.db.DBwrite
    
    val internalHalt = Reg(Bool) init(False)
    val internalHaltErr = Reg(Bool) init(False) //Halt for debugging??(system instruction)

    val haltCnd = (io.db.DBsize === 4) & (io.db.DBwdata.asUInt === 93) //The request to access the whole data and the wdata is 93

    when(write){
        when(intAddr === 0 & haltCnd){
            internalHalt := True
        }.elsewhen(intAddr === 4 & haltCnd){
            internalHaltErr := True 
        }
    }

    io.db.DBready := (read | write) & io.sel

    // output signals 
    io.db.DBrdata := 0
    io.halt := internalHalt
    io.haltErr := internalHaltErr
}