package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

object SummandVal extends SpinalEnum{
    val normal, tcompl = newElement()
}

//Hardware definition
class MulUnitControl extends Component {
  val io = new Bundle {
    val multiplierLSB = in Bits(2 bits)
    val writeAddition = out Bool
    val shiftProduct = out Bool
    val loadValues = out Bool
    val mcandSummand = out(SummandVal())
    val valid = in Bool
    val ready = out Bool
  }

  val controlFSM = new StateMachine{
    val mulCounter = Counter(0 to 31)
    // output defaults
    io.writeAddition := False
    io.shiftProduct := False
    io.loadValues := False
    io.ready := False
    io.mcandSummand := SummandVal.normal
    // states
    val stateIdle : State = new State with EntryPoint{
        whenIsActive{
            when(io.valid){
                goto(stateInitialize)
            }
        }
    }
    val stateInitialize : State = new State{
        whenIsActive{
            mulCounter.clear()
            io.loadValues := True
            goto(stateAdd)
        }
    }
    val stateAdd : State = new State{
        whenIsActive{
            when(io.multiplierLSB === B"10" | io.multiplierLSB === B"01"){
                io.writeAddition := True
            }
            switch(io.multiplierLSB){
                is(B"10"){
                    io.mcandSummand := SummandVal.tcompl
                }
                default{
                    io.mcandSummand := SummandVal.normal
                }
            }
            goto(stateShift)
        }
    }
    val stateShift : State = new State{
        whenIsActive{
            io.shiftProduct := True
            mulCounter.increment()
            when(mulCounter.willOverflow){
                goto(stateDone)
            }.otherwise{
                goto(stateAdd)
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