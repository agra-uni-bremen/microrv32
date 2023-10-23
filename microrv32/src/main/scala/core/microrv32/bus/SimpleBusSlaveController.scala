package core.microrv32.bus

import spinal.core._
import spinal.lib.IMasterSlave
import spinal.lib.fsm._

case class SimpleBusSlaveController() extends Component {
  val io = new Bundle {
    val valid = in(Bool())
    val ready = out(Bool())
    val select = in(Bool())
  }
  val busStateMachine = new StateMachine {
    
    val readyFlag = Reg(Bool()) init(False)
    io.ready := readyFlag

    val idle : State = new State with EntryPoint {
      whenIsActive{
        // .rise on a bool makes this a one-shot generation no matter how long sbValid will be available here
        // i.e. when(io.select & io.valid){ should work aswell, but will allow a constant valid being asserted to loop between the states (not necessarily wanted)
        when(io.select && io.valid.rise){
          readyFlag := True
          goto(handleRequest)
        }
      }
    }

    val handleRequest : State = new State {
      whenIsActive{
        // NOTE: currently the ready signal is only generated for one cycle to answer the incomming valid-request
        readyFlag := False
        goto(idle)
      }
    }
  }
}
