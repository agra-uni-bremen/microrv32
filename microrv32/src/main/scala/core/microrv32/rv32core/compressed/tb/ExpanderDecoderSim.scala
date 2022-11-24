package core.microrv32.rv32core.compressed

import spinal.core._
import spinal.sim._
import spinal.core.sim._

import scala.util.Random

import core.microrv32.rv32core
import core.microrv32.rv32core._

// Testbench generates (unconstrained) random numbers and applies them to the unit for each available operation
// Using N as the test count. Simulate without wavetrace generation for faster simulation speeds.
object ExpanderDecoderSim {
    def main(args: Array[String]) : Unit = {
        val DEBUG = true;
        def crInstr(funct4 : Int, rdrs1 : Int, rs2 : Int, op : Int) : Int = {
            var inst = 0
            inst = (0x0F & funct4) << 12 | (0x1F & rdrs1) << 7 | (0x1F & rs2) << 2 | (0x3 & op) << 0
            if(DEBUG) printf("CR:\t%H\t"+inst.toBinaryString+"\n", inst)
            inst
        }    
        def ciInstr(funct3 : Int, immTop : Int, rdrs1 : Int, immBot : Int, op : Int) : Int = {
            var inst = 0
            inst = (0x07 & funct3) << 13 | (0x01 & immTop) << 12 | (0x1F & rdrs1) << 7 | (0x1F & immBot) << 2 | (0x3 & op) << 0
            printf("CI:\t%4H\t"+inst.toBinaryString+"\n", inst)
            inst
        }    
        def cssInstr(funct3 : Int, imm : Int, rs2 : Int, op : Int) : Int = {
            var inst = 0
            inst = (0x07 & funct3) << 13 | (0x3F & imm) << 7 | (0x1F & rs2) << 2 |  (0x3 & op) << 0
            printf("CSS:\t%4H\t"+inst.toBinaryString+"\n", inst)
            inst
        }    
        def ciwInstr(funct3 : Int, imm : Int, rd : Int, op : Int) : Int = {
            var inst = 0
            inst = (0x07 & funct3) << 13 | (0xFF & imm) << 5 | (0x07 & rd) << 2 |  (0x3 & op) << 0
            printf("CIW:\t%4H\t"+inst.toBinaryString+"\n", inst)
            inst
        }
        def clInstr(funct3 : Int, immTop : Int, rs1 : Int, immBot : Int, rd : Int, op : Int) : Int = {
            var inst = 0
            inst = (0x07 & funct3) << 13 | (0x07 & immTop) << 10 | (0x07 & rs1) << 7 | (0x03 & immBot) << 5 | (0x07 & rd) << 2 | (0x3 & op) << 0
            printf("CL:\t%4H\t"+inst.toBinaryString+"\n", inst)
            inst
        }
        def csInstr(funct3 : Int, immTop : Int, rs1 : Int, immBot : Int, rd : Int, op : Int) : Int = {
            var inst = 0
            inst = (0x07 & funct3) << 13 | (0x07 & immTop) << 10 | (0x07 & rs1) << 7 | (0x03 & immBot) << 5 | (0x07 & rd) << 2 | (0x3 & op) << 0
            printf("CS:\t%4H\t"+inst.toBinaryString+"\n", inst)
            inst
        }
        def caInstr(funct6 : Int, rs1 : Int, funct2 : Int, rs2 : Int, op : Int) : Int = {
            var inst = 0
            inst = (0x3F & funct6) << 10 | (0x07 & rs1) << 7 | (0x03 & funct2) << 5 | (0x07 & rs2) << 2 | (0x3 & op) << 0
            printf("CA:\t%4H\t"+inst.toBinaryString+"\n", inst)
            inst
        }
        def cbInstr(funct3 : Int, offTop : Int, rdrs1 : Int, offBot : Int, op : Int) : Int = {
            var inst = 0
            inst = (0x07 & funct3) << 13 | (0x07 & offTop) << 10 | (0x07 & rdrs1) << 7 | (0x1F & offBot) << 2 | (0x3 & op) << 0
            printf("CB:\t%4H\t"+inst.toBinaryString+"\n", inst)
            inst
        }
        def cjInstr(funct3 : Int, jumptarget : Int, op : Int) : Int = {
            var inst = 0
            inst = (0x3F & funct3) << 13 | (0x3FF & jumptarget) << 2 | (0x3 & op) << 0
            printf("CJ:\t%4H\t"+inst.toBinaryString+"\n", inst)
            inst
        }
        SimConfig.withWave.doSim(new ExpanderDecoder) { dut =>
            def applyInstruction(inst : Int, duration : Int = 2) : Unit = {
                dut.io.cInstr #= (0xffff & inst)
                sleep(duration)
            }   
            dut.io.cInstr #= 0
            applyInstruction(ciwInstr(0, 10, 3, 0)) // ADDI4SPN with imm != 0 => addi rd, x2, imm
            applyInstruction(ciwInstr(0, 0, 3, 0)) // ADDI4SPN with imm == 0 => unsupported
            for(i <- 0 until 8){
                applyInstruction(ciwInstr(0, 250, i, 0)) // cycle rd [expect expanded and decoded rd to go from x8 to x15]
            }
            applyInstruction(ciwInstr(0, 0, 3, 3)) // quadrant 3 garbage op

            applyInstruction(0x0429) // c.addi x8, 10 => addi x8, x8, 10
            applyInstruction(0x97ba) // c.add x15,x14 => add x15, x15, x14
            applyInstruction(0x4472) // c.mv x10,x15 => add x10, x15, x0
            applyInstruction(0x8082) // c.jr x1 => jalr x0, x1, 0
            applyInstruction(0x67d1) // c.lui => lui x15, 0x14
            simSuccess()
        }
    }
}
