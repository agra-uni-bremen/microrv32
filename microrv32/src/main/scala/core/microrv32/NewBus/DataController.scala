package Bus

import spinal.core._
import spinal.lib.IMasterSlave
import spinal.lib.fsm._
import javax.net.ssl.TrustManager

class DataController() extends Component {
    val io = new Bundle {
        //communicate with attaching hardware
        val ctrl =  new Bundle {
            //the hardware the interface attached that commands controller to send the signal 
            val request = in(Bool())  
            val write = in(Bool())
            //controller need to tell the attaching hardware or just display that it is busy
            val busy = out(Bool())
        }
       //communicate with the bus
        val bus = new Bundle {
            val valid = out(Bool())
            val ready = in(Bool())
            val write = out(Bool()) //The signal that mem will received
            //'unmapped' signal is designed to tell if the address is out of the bound
            val unmapped = in(Bool()) 
        }
    }

    //Haven't consider about the unmapped situation...

    val busStateMachine = new StateMachine {
        io.bus.write := False
        io.ctrl.busy := False
        io.bus.valid := False
        
        val idleAndRequest : State = new State with EntryPoint{
            whenIsActive{
                when (io.ctrl.request) {
                    io.ctrl.busy := True
                    io.bus.valid := True
                    io.bus.write := io.ctrl.write
                }
                when (io.bus.ready | io.bus.unmapped) {
                    goto(operationComplete)
                }
            }
        }
    
        //Forced rest for 1 clock cycle, the actual operation is delivered at this cycle.
        val operationComplete : State = new State { 
            whenIsActive{
                io.ctrl.busy := False
                io.bus.valid := False
                io.bus.write := False 
                goto (idleAndRequest)
            }
        }
    }
}