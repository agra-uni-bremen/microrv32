package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

//Hardware definition
class MulUnitControl extends Component {
  val io = new Bundle {
    val multiplierLSB = in Bits(1 bits)
    val addMultiplicand = out Bool
    val loadValues = out Bool
    val calculate = out Bool
    val valid = in Bool
    val ready = out Bool
    val busy = out Bool
  }

  val controlFSM = new StateMachine{
    val mulCounter = Counter(0 to 31)
    val busyFlag = Reg(Bool) init(False)
    // output defaults
    io.addMultiplicand := False
    io.calculate := False
    io.loadValues := False
    io.ready := False
    io.busy := busyFlag
    // states
    val stateIdle : State = new State with EntryPoint{
        whenIsActive{
            when(io.valid){
                busyFlag := True
                goto(stateInitialize)
            }
        }
    }
    val stateInitialize : State = new State{
        whenIsActive{
            mulCounter.clear()
            io.loadValues := True
            goto(stateMul)
        }
    }
    val stateMul : State = new State{
        whenIsActive{
            mulCounter.increment()
            io.calculate := True
            when(io.multiplierLSB === M"1"){
                io.addMultiplicand := True
            }
            when(mulCounter.willOverflow){
                busyFlag := False
                goto(stateDone)
            }
        }
    }
    val stateDone : State = new State{
        whenIsActive{
            io.ready := True
            goto(stateIdle)
        }
    }
  }
}