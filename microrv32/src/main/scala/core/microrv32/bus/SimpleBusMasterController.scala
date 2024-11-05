package core.microrv32.bus

import spinal.core._
import spinal.lib.IMasterSlave
import spinal.lib.fsm._

case class SimpleBusMasterController() extends Component {
  val io = new Bundle {
    //communicate with attaching hardware
    val ctrl =  new Bundle {
      //the hardware the interface attached that commands controller to send the signal 
      val enable = in(Bool())  
      val write = in(Bool())
      //controller need to tell the attaching hardware or just display that it is busy
      val busy = out(Bool())
    }
    //communicate with the bus
    val bus = new Bundle {
      val valid = out(Bool())
      val ready = in(Bool())
      val write = out(Bool())
      val unmapped = in(Bool()) 
  }
}
  val busStateMachine = new StateMachine {
    
    val busyFlag = Reg(Bool) init(False)
    io.bus.valid := False //default state
    io.bus.write := False //default state

    val idle : State = new State with EntryPoint {
      whenIsActive{
        when(io.ctrl.enable) {
          goto(sendRequest)
        }
      }
      onExit{
        busyFlag := True //illustrating now the instruction bus is busy
      }
    }

    val sendRequest : State = new State {
      // currently only send request as strobe
      whenIsActive{
        io.bus.valid := True
        io.bus.write := io.ctrl.write //transmitting the write signal
        goto(waitResponse)
      }
    }

    val waitResponse : State = new State {
      whenIsActive{
        io.bus.valid := True
        when(io.bus.ready | io.bus.unmapped){
          goto(idle)
        }
      }
      onExit{
        busyFlag := False
      }
    }
  }
  io.ctrl.busy := busStateMachine.busyFlag
}
