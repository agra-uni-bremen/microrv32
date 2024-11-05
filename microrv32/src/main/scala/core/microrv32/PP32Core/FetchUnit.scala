package PP_RV32I.Core

import spinal.core._
import spinal.lib._

import PP_RV32I.Core.pcSrc

class PCIncrement(incValue: Int) extends Component {
    val io = new Bundle {
        val pc = in UInt(32 bits)
        val pcIncrement = out UInt(32 bits)
    }

    io.pcIncrement := io.pc + incValue
}

class PCNextSelection() extends Component { //It will be the EXE part in PP
    val io = new Bundle {
        val pcSel = in (pcSrc())
        val ALUBranch = in Bool()
        val flush = out Bool()

        val aluRes = in (Bits(32 bits))
        val pcTarget, pcIncrement = in (UInt(32 bits))
        val pcNext = out (UInt(32 bits))
    }

    when(io.ALUBranch) { //Branch occurs
        io.pcNext := io.pcTarget
        io.flush := True
    } otherwise {
        switch(io.pcSel) {
            is(pcSrc.PCTarget) { //JAL
                io.pcNext := io.pcTarget
                io.flush := True
            }
            is(pcSrc.PCIncrement) { //No jumping instructions, Branch default(Branch doesn't occur)
                io.pcNext := io.pcIncrement
                io.flush := False
            }
            is(pcSrc.ALURes) { //JALR
                io.pcNext := io.aluRes.asUInt
                io.flush := True
            }
        }
    }
    

}