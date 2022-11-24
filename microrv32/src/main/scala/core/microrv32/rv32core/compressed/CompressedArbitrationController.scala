package core.microrv32.rv32core

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

import core.microrv32.rv32core.compressed._

case class FetchUnitIF() extends Bundle{
    val qHi = in(Bits(2 bits)) // quadrant of halves
    val qLo = in(Bits(2 bits)) // quadrant of halves
    val qSh = in(Bits(2 bits)) // quadrant of halves
    val iBufEna = out(Bool())
    val sBufEna = out(Bool())
    val upMux = out(UInt(1 bits))
    val lowMux = out(UInt(2 bits))
    val outMux = out(UInt(1 bits))
}

class CompressedArbitrationController() extends Component {
    val io = new Bundle{
        val fuif = FetchUnitIF()
        val pcIncrement = out(UInt(32 bits))
        val stallDecode = out(Bool())
        val sampleInstr = in(Bool())

    }

    val fsm = new StateMachine{
        val idle : State = new State with EntryPoint {
            whenIsActive{
                goto(idle)
            }
        }
        /* 
        * Note on the state naming scheme: 
        * state name refers to the combination of half words visible in fetched
        * instruction. 
        * C - rv32c instruction
        * L - lower half of rv32i instruction
        * U - upper half of rv32i instruction
        * 
        * if we assume a 32 bit word from the instruction memory
        * [MSB half , LSB half]
        * it can take various fragmentations
        * examples:
        *    UL = standard rv32i instruction not fragmented
        *    CC = rv32c instruction followed up by another rv32c instruction
        *    LC = rv32c instruction followed up by lower half rv32i instruction, causing fragmentation
        *    CU = upper half rv32i instruction followed up by rv32c instruction, resolving fragmentation
        */
        val UL : State = new State {
            whenIsActive{
                goto(idle)
            }
        }
        val CC : State = new State {
            whenIsActive{
                goto(idle)
            }
        }
        val LC_1 : State = new State {
            whenIsActive{
                goto(idle)
            }
        }
        val CX : State = new State {
            whenIsActive{
                goto(idle)
            }
        }
        val LC_2 : State = new State {
            whenIsActive{
                goto(idle)
            }
        }
        val XU : State = new State {
            whenIsActive{
                goto(idle)
            }
        }
        val LU : State = new State {
            whenIsActive{
                goto(idle)
            }
        }
    }
}