package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

/*
* Control unit of the division unit.
* This unit controls the division sequence of the division unit.
* As a shortcut (as its expected to be optimized by the synthesis) the condition R>=D
* is not passed into the control unit (as it directly would mux/choose the case for setting bits/subtracting).
* Instead the control unit can direct the datapath to calculate for 31 steps, or set the exception values for 
* overflow and division by zero. 
*/
class DivUnitControl extends Component {
  val io = new Bundle {
    val loadValues = out Bool()
    val calculate = out Bool()
    val iterationBit = out UInt(5 bits)
    val isCornerCase = in Bool()
    val setCornerValues = out Bool()
    val valid = in Bool()
    val ready = out Bool()
    val busy = out Bool()
  }
  /* 
  * state machine 
  *   waits in idle for activation, 
  *   initializes registers in initialize, 
  *   sets exception values in cornercase
  *   calculates in div 
  *   and outputs result in done
  */
  val controlFSM = new StateMachine {
    val busyFlag = Reg(Bool) init(False)
    val divCounter = Reg(UInt(5 bits)) init(31)
    // output defaults
    io.calculate := False
    io.loadValues := False
    io.ready := False
    io.busy := busyFlag
    io.iterationBit := 31
    io.setCornerValues := False
    // states
    val stateIdle : State = new State with EntryPoint {
        whenIsActive{
            when(io.valid){
                busyFlag := True
                goto(stateInitialize)
            }
        }
    }
    val stateInitialize : State = new State {
        divCounter := 31
        whenIsActive{
            when(!io.isCornerCase){
                io.loadValues := True
                goto(stateDiv)
            }.otherwise{
                goto(stateCornerCase)
            }
            
        }
    }
    val stateCornerCase : State = new State {
        whenIsActive{
            io.setCornerValues := True
            goto(stateDone)
        }
    }
    val stateDiv : State = new State {
        whenIsActive{
            io.calculate := True
            io.iterationBit := divCounter
            when(divCounter === 0){
                goto(stateDone)
            }.otherwise{
                divCounter := divCounter - 1
            }
        }
    }
    val stateDone : State = new State{
        whenIsActive{
            io.ready := True
            busyFlag := False
            goto(stateIdle)
        }
    }
  }
}