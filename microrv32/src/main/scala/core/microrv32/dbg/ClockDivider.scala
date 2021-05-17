package core.microrv32

import spinal.core._
import spinal.lib._
/*
* ClockDivider
* Purpose: this component takes a clock from inCd clock domain and divides it from
* inFrequencyHz to outFrequencyHz. The output clock with outFrequencyHz is available on
* io.outClk
*/
class ClockDivider(inCd : ClockDomain, inFrequencyHz : BigInt, outFrequencyHz : BigInt) extends Component {
    val io = new Bundle {
        val outClk = out Bool
    }
    // apply passed clockdomain object to clock divider logic
    val onInClk = inCd on new Area{
        // since f_out = f_in / N  <=>  N = f_in / f_out (TODO fix value cause of willOverflowIfInc)
        val dividerN : Int = ((inFrequencyHz / outFrequencyHz).toInt -1)/2
        // spinalhdl provides counter component with everything
        val divCounter = Counter(0 to dividerN)
        // buffer for the clock
        val genClock = Reg(Bool) init(False)
        // divider logic
        divCounter.increment()
        when(divCounter.willOverflow) {
            genClock := !genClock
        }
        // output logic
        io.outClk := genClock
    }
}