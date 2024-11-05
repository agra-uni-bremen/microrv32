package SC_RV32I.Core

import spinal.core._

// import SC_RV32I.Core.destDataSel
import SC_RV32I.Core._

case class RegFileIO(addressWidth : Int, dataWidth : Int) extends Bundle{
    val rs1 = in UInt(addressWidth bits)
    val rs2 = in UInt(addressWidth bits)
    val rs1Data = out Bits(dataWidth bits)
    val rs2Data = out Bits(dataWidth bits)
    val wrEna = in Bool()
    val rd = in UInt(addressWidth bits)
    val rdData = in Bits(dataWidth bits)
}

//Due to the SC architecture, the RegisterFile must be able to be read at any time, and write at least in the rising edge of next cycle
class RV32RegisterFile(addressWidth : Int, dataWidth : Int, wordCount : Int) extends Component{ 
    val io = new RegFileIO(addressWidth, dataWidth)

    //Define and initialize 
    val RegisterArray = Vec.fill(wordCount)(Reg(Bits(dataWidth bits)) init(B(0, dataWidth bits)))

    //Read: Anytime
    io.rs1Data := RegisterArray(io.rs1)
    io.rs2Data := RegisterArray(io.rs2)

    //Synchromously write 
    //when x0 is chosen, the write won't be executed. 
    when(io.rd =/= 0 && io.wrEna) {
        RegisterArray(io.rd) := io.rdData        
    }
    // } otherwise { //Including 'rd = 0', '(rd =/= 0) and (wrEna = False)'
        // RegisterArray(0) := B(0, dataWidth bits)
    // }
}

//Mux of WriteBack Source
class DestDataSelection() extends Component{
    val io = new Bundle {
        val sel = in (destDataSel())
        val aluRes, memRes, pcIncrement, pcTarget = in Bits(32 bits)
        val writeData = out (Bits(32 bits))
    }

    switch(io.sel) {
        is(destDataSel.ALURes) {
            io.writeData := io.aluRes
        }
        is(destDataSel.MemRes) {
            io.writeData := io.memRes
        }
        is(destDataSel.PCIncrement) {
            io.writeData := io.pcIncrement
        }
        is(destDataSel.PCTarget) {
            io.writeData := io.pcTarget
        }
    }
}