package core.microrv32.rv32core.compressed

import spinal.core._
import core.microrv32._
import core.microrv32.rv32core
import core.microrv32.rv32core._

// Integrate Expander and Decoder to test expander unit
case class ExpanderDecoder() extends Component{
    val io = new Bundle{
        val cInstr = in(Bits(16 bits))
        val expStatus = out(ExpanderStatus())
        val fields = out(DecodedFields())
        val immediate = out Bits(32 bits)
        val csr_uimm = out Bits(5 bits)
        val decodeValid = out Bool()
        val instType = out(InstructionType())
        val csrType = out(CSRAccessType())
    }
    val exp = new ExpanderUnit()
    exp.io.compInstr := io.cInstr
    io.expStatus := exp.io.status
    val dec = new DecodeUnit(RV32CoreConfig())
    dec.io.instruction := exp.io.expInstr
    io.fields := dec.io.fields
    io.immediate := dec.io.immediate
    io.csr_uimm := dec.io.csr_uimm
    io.decodeValid := dec.io.decodeValid
    io.instType := dec.io.instType
    io.csrType := dec.io.csrType
}