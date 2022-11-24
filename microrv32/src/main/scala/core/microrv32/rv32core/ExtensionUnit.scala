package core.microrv32.rv32core

import spinal.core._

case class EUBundle() extends Bundle{
    val instruction = in Bits(32 bits)
    val i_imm = out Bits(32 bits)
    val j_imm = out Bits(32 bits)
    val s_imm = out Bits(32 bits)
    val b_imm = out Bits(32 bits)
    val u_imm = out Bits(32 bits)
    val csr_imm = out Bits(5 bits)
}

class ExtensionUnit() extends Component{
    val io = new EUBundle()

    // I-Type :
    io.i_imm := S(io.instruction(31), 21 bits) ## io.instruction(30 downto 25) ## io.instruction(24 downto 21) ## io.instruction(20)
    // J-Type :
    // verilog: $signed({instr[31], instr[19:12], instr[20], instr[30:21], 1'b0});
    io.j_imm := S(B(io.instruction(31) ## io.instruction(19 downto 12) ## io.instruction(20) ## io.instruction(30 downto 25) ## io.instruction(24 downto 21) ## B(0, 1 bit)),32 bits).asBits
    // S-Type :
    io.s_imm := S(io.instruction(31), 21 bits) ## io.instruction(30 downto 25) ## io.instruction(11 downto 8) ## io.instruction(7)
    // B-Type :
    io.b_imm := S(io.instruction(31), 20 bits) ## io.instruction(7) ## io.instruction(30 downto 25) ## io.instruction(11 downto 8) ## B(0,1 bit)
    // U-Type :
    io.u_imm := io.instruction(31) ## io.instruction(30 downto 20) ## io.instruction(19 downto 12) ## B(0, 12 bits)
    // CSR-Type
    io.csr_imm := io.instruction(19 downto 15)          
}