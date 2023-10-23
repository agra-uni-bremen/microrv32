package core.microrv32.bus

import spinal.core._
import spinal.lib.IMasterSlave
import spinal.lib.fsm._

case class SimpleBusMasterController() extends Component {
  val io = new Bundle {
    val ctrl =  new Bundle {
      val enable = in(Bool())
      val write = in(Bool())
      val busy = out(Bool())
    }
    val bus = new Bundle {
      val valid = out(Bool())
      val ready = in(Bool())
      val write = out(Bool())
      val unmapped = in(Bool())
    }
  }
  val busStateMachine = new StateMachine {
    
    val busyFlag = Reg(Bool) init(False)
    io.bus.valid := False
    io.bus.write := False

    val idle : State = new State with EntryPoint {
      whenIsActive{
        when(io.ctrl.enable) {
          goto(sendRequest)
        }
      }
      onExit{
        busyFlag := True
      }
    }

    val sendRequest : State = new State {
      // currently only send request as strobe
      whenIsActive{
        io.bus.valid := True
        io.bus.write := io.ctrl.write
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
