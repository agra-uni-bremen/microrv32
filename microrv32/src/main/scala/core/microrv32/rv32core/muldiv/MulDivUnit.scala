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
        val valid = in Bool
        val ready = out Bool
        val busy = out Bool
    }
    if(cfg.generateMultiply) {
        val mulUnit = new MulUnit()
        // val mulOperation = MulOperation()
        // switch(io.operation){
        //     is(F3_MUL){
        //         mulOperation := MulOperation.mul
        //     }
        //     is(F3_MULH){
        //         mulOperation := MulOperation.mul
        //     }
        //     is(F3_MULHSU){
        //         mulOperation := MulOperation.mulhsu
        //     }
        //     is(F3_MULHU){
        //         mulOperation := MulOperation.mulhu
        //     }
        //     default{
        //         mulOperation := MulOperation.mul
        //     }
        // }
        mulUnit.io.multiplier := io.rs1Data
        mulUnit.io.multiplicand := io.rs2Data
        // change later, gotta multiplex/demux result based on operations
        io.destinationData := io.operation.mux(
            F3_MUL -> mulUnit.io.product(31 downto 0),
            F3_MULH -> mulUnit.io.product(63 downto 32),
            F3_MULHSU -> mulUnit.io.product(63 downto 32),
            F3_MULHU -> mulUnit.io.product(63 downto 32),
            default -> B(0, 32 bits)
        )        
        mulUnit.io.operation := io.operation.mux(
            F3_MUL -> MulOperation.mul(),
            F3_MULH -> MulOperation.mulh(),
            F3_MULHSU -> MulOperation.mulhsu(),
            F3_MULHU -> MulOperation.mulhu(),
            default -> MulOperation.mul()
        )
        // mulUnit.io.operation := mulOperation
        mulUnit.io.valid := io.valid
        io.ready := mulUnit.io.ready   
    }
    // if(cfg.generateDivide) {

    // }
}
