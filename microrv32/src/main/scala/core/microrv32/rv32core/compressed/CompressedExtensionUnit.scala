package core.microrv32.rv32core.compressed

import spinal.core._

case class CEUBundle() extends Bundle{
    val instruction = in Bits(16 bits)
    val CI = out Bits(6 bits)
    val CSS = out Bits(6 bits)
    val CIW = out Bits(8 bits)
    val CL = out Bits(5 bits)
    val CS = out Bits(5 bits)
    val CB = out Bits(8 bits)
    val CJ = out Bits(11 bits)
}

class CompressedExtensionUnit() extends Component{
    val io = new CEUBundle()
    io.CI  := B(io.instruction(12) ## io.instruction(6 downto 2), 6 bits)
    io.CSS := B(io.instruction(12 downto 7), 6 bits)
    io.CIW := B(io.instruction(12 downto 5), 8 bits)
    io.CL  := B(io.instruction(12 downto 10) ## io.instruction(6 downto 5), 5 bits)
    io.CS  := B(io.instruction(12 downto 10) ## io.instruction(6 downto 5), 5 bits)
    io.CB  := B(io.instruction(12 downto 10) ## io.instruction(6 downto 2), 8 bits)
    io.CJ  := B(io.instruction(12 downto 2), 11 bits)

}