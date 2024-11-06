package SC_RV32I.Core

import spinal.core._
import spinal.lib._

import SC_RV32I.Core.pcSrc
// import SC_RV32I.Bus._

class PCIncrement(incValue: Int) extends Component {
    val io = new Bundle {
        val pc = in UInt(32 bits)
        val pcIncrement = out UInt(32 bits)
    }

    io.pcIncrement := io.pc + incValue
}

class PCNextSelection() extends Component {
    val io = new Bundle {
        val pcSel = in (pcSrc())
        val aluRes = in (Bits(32 bits))
        val pcTarget, pcIncrement = in (UInt(32 bits))
        val pcNext = out (UInt(32 bits))
    }

    switch(io.pcSel) {
        is(pcSrc.PCTarget) {
            io.pcNext := io.pcTarget
        }
        is(pcSrc.PCIncrement) {
            io.pcNext := io.pcIncrement
        }
        is(pcSrc.ALURes) {
            io.pcNext := io.aluRes.asUInt
        }
        is(pcSrc.PCDefault) {
            io.pcNext := U(0, 32 bits)
        }
    }

}