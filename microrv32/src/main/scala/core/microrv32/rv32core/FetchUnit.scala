package core.microrv32.rv32core

import spinal.core._
import spinal.lib._

import core.microrv32.RV32CoreConfig

import core.microrv32.rv32core.compressed._

case class CompressedFlags() extends Bundle{
    val quadrant = out(Bits(2 bits))
    val expanderFlags = ExpanderStatus()
}

/*
* Fetch Unit
* With support for compressed instructions
*/
class FetchUnit(cfg : RV32CoreConfig) extends Component {
    val io = new Bundle{
        val data = in Bits(32 bits)
        val sample = in Bool()
        val instruction = out Bits(32 bits)
        val pc = in(UInt(32 bits))
        val fetchAddr = out(UInt(32 bits))
        val pcIncrement = out(UInt(3 bits))
        val compressedFlags = cfg.supportCompressed generate(CompressedFlags())
    }
    // need 32 bit instruction buffer in any configuration
    val instructionBuffer = Reg(Bits(32 bits)) init(0)

    val quadrant = cfg.supportCompressed generate instructionBuffer(1 downto 0)
    val expander = cfg.supportCompressed generate (new ExpanderUnit())
    val outMux = cfg.supportCompressed generate Bits(32 bits)

    if(!cfg.supportCompressed){
        when(io.sample){
            instructionBuffer := io.data
        }   
        // if there is a new instruction at the instruction memory interface
        // buffer it for the decoder
        io.instruction := instructionBuffer
        io.pcIncrement := 4
    } else {
        import CompressedOpcode._
        when(io.sample){
            instructionBuffer := io.data
        }
        switch(quadrant){
            is(CompressedOpcode.Q0, CompressedOpcode.Q1, CompressedOpcode.Q2){
                io.pcIncrement := 2
                outMux := expander.io.expInstr
            }
            is(CompressedOpcode.Q3){
                io.pcIncrement := 4
                outMux := instructionBuffer
            }
            default{
                io.pcIncrement := 4
                outMux := instructionBuffer
            }
        }
        expander.io.compInstr := instructionBuffer(15 downto 0)
        io.compressedFlags.expanderFlags := expander.io.status
        io.compressedFlags.quadrant := quadrant
        io.instruction := outMux
    }   
}