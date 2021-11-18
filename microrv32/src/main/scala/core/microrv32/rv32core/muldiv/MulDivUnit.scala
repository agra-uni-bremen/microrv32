package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.lib._

import core.microrv32.RV32CoreConfig
import core.microrv32.MULDIVOpcode._

class MulDivUnit(cfg : RV32CoreConfig) extends Component {
    val io = new Bundle{
        val rs1Data = in Bits(32 bits)
        val rs2Data = in Bits(32 bits)
        val destinationData = out Bits(32 bits)
        val operation = in Bits(3 bits)
        val valid = in Bool()
        val ready = out Bool()
        val busy = out Bool()
    }
    val mulUnit = new MulUnit()
    val divUnit = if(cfg.generateDivide) new DivUnit() else null
    if(cfg.generateMultiply) {
        mulUnit.io.multiplicand := io.rs1Data
        mulUnit.io.multiplier := io.rs2Data
        mulUnit.io.operation := io.operation.mux(
            F3_MUL -> MulOperation.mul(),
            F3_MULH -> MulOperation.mulh(),
            F3_MULHSU -> MulOperation.mulhsu(),
            F3_MULHU -> MulOperation.mulhu(),
            default -> MulOperation.mul()
        )
        mulUnit.io.valid := (io.operation === F3_MUL_OPERATION) & io.valid
    }
    if(cfg.generateDivide) {
        divUnit.io.dividend := io.rs1Data
        divUnit.io.divisor := io.rs2Data
        divUnit.io.operation := io.operation.mux(
            F3_DIV -> DivOperation.div(),
            F3_DIVU -> DivOperation.divu(),
            F3_REM -> DivOperation.rem(),
            F3_REMU -> DivOperation.remu(),
            default -> DivOperation.div()
        )
        divUnit.io.valid := (io.operation === F3_DIV_OPERATION) & io.valid
    }
    val outputHandling = new Area{
        switch(io.operation){
            is(F3_MUL){
                io.destinationData := mulUnit.io.product(31 downto 0)
                io.ready := mulUnit.io.ready
                io.busy := mulUnit.io.busy
            }
            is(F3_MULH, F3_MULHSU, F3_MULHU){
                io.destinationData := mulUnit.io.product(63 downto 32)
                io.ready := mulUnit.io.ready
                io.busy := mulUnit.io.busy
            }
            if(cfg.generateDivide) {
            is(F3_DIV_DIVU){
                io.destinationData := divUnit.io.quotient
                io.ready := divUnit.io.ready
                io.busy := divUnit.io.busy
            }
            is(F3_REM_REMU){
                io.destinationData := divUnit.io.remainder
                io.ready := divUnit.io.ready
                io.busy := divUnit.io.busy
            }
            }
            default{
                io.busy := False
                io.ready := False
                io.destinationData := B(0, 32 bits)
            }
        }
    }
}
