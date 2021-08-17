package core.microrv32.rv32core

import spinal.core._
import spinal.lib.fsm._
import core.microrv32.InstructionType
// import core.microrv32.InstructionType._
import core.microrv32.CSRAccessType
import core.microrv32.CSRAccessType._
import core.microrv32.RVOpcode._
import core.microrv32.CSROpcode._
import javax.net.ssl.TrustManager
// import core.microrv32.rv32core.DecodeUnit
//import core.microrv32.rv32core.DecodeUnit._

object PCSelect extends SpinalEnum{
  val incrementPC, jalTarget, jalrTarget, branchTarget, 
  trapEntryTarget, trapExitTarget = newElement()
}

case class PCControl() extends Bundle{
    val enablePC = out Bool
    val pcValSel = out(PCSelect())
}

object OpASelect extends SpinalEnum{
    val opReg1Data, opPC, opZero = newElement()
}

object OpBSelect extends SpinalEnum{
    val opReg2Data, opImmediate, opZero = newElement()
}

case class ALUCtrl() extends Bundle{
    val opA = out(OpASelect())
    val opB = out(OpBSelect())
    val aluBranch = in Bool
}

object DestDataSelect extends SpinalEnum{
    val aluRes, aluBool, memReadData, csrReadData = newElement()
}

case class RegFileControl() extends Bundle{
    val regFileWR = out Bool
    val regDestSel = out(DestDataSelect())
}

object CSRDataSelect extends SpinalEnum{
    val reg1Data, csrImmData = newElement()
}

case class CSRControl() extends Bundle{
    val writeSelect = out(CSRDataSelect())
    val enable = out Bool
    val newFetch = out Bool
    val illegalAccess = in Bool
}

object MemoryStrobeSelect extends SpinalEnum{
    val byte, halfWord, word = newElement()
}

case class MemoryControl() extends Bundle{
    // I-Memory
    val fetchEna = out Bool
    val instrRdy = in Bool
    // D-Memory
    val readWriteData = out Bool
    val dataEna = out Bool
    val dataRdy = in Bool
    val strobeSelect = out(MemoryStrobeSelect())
}

case class ControlBundle() extends Bundle{
    // decoder
    val validDecode = in Bool
    val instrType = in(InstructionType())
    val instrFields = in(DecodedFields())
    // program counter
    val pcCtrl = out(PCControl())
    // alu
    val aluCtrl = ALUCtrl()
    // registerfile
    val regCtrl = out(RegFileControl())
    // csr
    val csrCtrl = CSRControl()
    // memory
    val memCtrl = MemoryControl()
    // exception handling
    val irqPending = in Bool
    val trapEntry = out Bool
    val trapExit = out Bool
    val irqEntry = out Bool
    // 
    val halt = in Bool
    val halted = out Bool
    val fetchSync = out Bool
    // debug output
    val dbgState = out Bits(4 bits)
}

class ControlUnit(dbg : Boolean) extends Component{
    val io = new ControlBundle()
    
    // default values
    // PC
    io.pcCtrl.enablePC := False
    io.pcCtrl.pcValSel := PCSelect.incrementPC
    // ALU
    io.aluCtrl.opA := OpASelect.opReg1Data
    io.aluCtrl.opB := OpBSelect.opReg2Data
    // REGFILE
    io.regCtrl.regFileWR := False
    io.regCtrl.regDestSel := DestDataSelect.aluRes
    // CSR
    io.csrCtrl.enable := False
    io.csrCtrl.writeSelect := CSRDataSelect.reg1Data
    io.csrCtrl.newFetch := False
    // MEMORY
    io.memCtrl.fetchEna := False
    io.memCtrl.readWriteData := False
    io.memCtrl.dataEna := False
    io.memCtrl.strobeSelect := MemoryStrobeSelect.word
    // EXCEPTIONS
    io.trapEntry := False
    io.trapExit := False 
    io.irqEntry := False
    // IO
    io.halted := False
    io.fetchSync := False
    
    val fsm = new StateMachine{
        import InstructionType._
        val stateInit : State = new State with EntryPoint{
            whenIsActive{
                goto(stateFetch)
            }
        }
        val stateFetch : State = new State{
            // onEntry{
            //     when(io.irqPending){
            //         // dont fetch
            //     }.otherwise{
            //         //io.memCtrl.fetchEna := True
            //     }
            // }
            whenIsActive{
                when(io.irqPending){
                    goto(stateInterrupt)
                }.elsewhen(io.memCtrl.instrRdy){
                    io.csrCtrl.newFetch := True
                    io.pcCtrl.enablePC := True
                    io.pcCtrl.pcValSel := PCSelect.incrementPC
                    goto(stateDecode)
                }.otherwise{
                    io.fetchSync := True
                    io.memCtrl.fetchEna := True
                }
            }
            onExit{
                io.memCtrl.fetchEna := False
            }
        }
        val stateDecode : State = new State{
            whenIsActive{
                when(io.validDecode){
                    goto(stateExecute)
                }.otherwise{
                    goto(stateHalt)
                }
            }
        }
        val stateExecute : State  = new State{
            whenIsActive{
                switch(io.instrType){ 
                    is(isRegReg){
                        // reg[dest] = reg[rs1] {OP} reg[rs2]
                        io.aluCtrl.opA := OpASelect.opReg1Data
                        io.aluCtrl.opB := OpBSelect.opReg2Data
                        io.regCtrl.regFileWR := True
                        io.regCtrl.regDestSel := DestDataSelect.aluRes
                        goto(stateFetch)
                    }
                    is(isRegImm){
                        // reg[dest] = reg[rs1] {OP} IMM
                        io.aluCtrl.opA := OpASelect.opReg1Data
                        io.aluCtrl.opB := OpBSelect.opImmediate
                        io.regCtrl.regFileWR := True
                        io.regCtrl.regDestSel := DestDataSelect.aluRes
                        goto(stateFetch)
                    }
                    is(isAUIPC){
                        // reg[dest] = pc + IMM
                        io.aluCtrl.opA := OpASelect.opPC
                        io.aluCtrl.opB := OpBSelect.opImmediate
                        io.regCtrl.regFileWR := True
                        io.regCtrl.regDestSel := DestDataSelect.aluRes
                        goto(stateFetch)
                    }
                    is(isLUI){
                        // reg[dest] = IMM (+ 0)
                        io.aluCtrl.opA := OpASelect.opZero
                        io.aluCtrl.opB := OpBSelect.opImmediate
                        io.regCtrl.regFileWR := True
                        io.regCtrl.regDestSel := DestDataSelect.aluRes
                        goto(stateFetch)
                    }
                    is(isCT_JAL){
                        // TODO: check for misalignment and jump to other state
                        // reg[dest] = pc
                        io.aluCtrl.opA := OpASelect.opPC
                        io.aluCtrl.opB := OpBSelect.opZero
                        io.regCtrl.regFileWR := True
                        io.regCtrl.regDestSel := DestDataSelect.aluRes
                        // pc = pc + IMM
                        io.pcCtrl.pcValSel := PCSelect.jalTarget
                        io.pcCtrl.enablePC := True
                        goto(stateFetch)
                    }
                    is(isCT_JALR){
                        // TODO: check for misalignment and jump to other state
                        // reg[dest] = pc
                        io.aluCtrl.opA := OpASelect.opPC
                        io.aluCtrl.opB := OpBSelect.opZero
                        io.regCtrl.regFileWR := True
                        io.regCtrl.regDestSel := DestDataSelect.aluRes
                        // pc = (reg[rs1] + IMM) & ~0x1
                        io.pcCtrl.pcValSel := PCSelect.jalrTarget
                        io.pcCtrl.enablePC := True
                        goto(stateFetch)
                    }
                    is(isBranch){
                        // IF opA {CMP-OP} opB THEN pc := branch-target ELSE pc := pc+4 
                        io.aluCtrl.opA := OpASelect.opReg1Data
                        io.aluCtrl.opB := OpBSelect.opReg2Data
                        when(io.aluCtrl.aluBranch){
                            io.pcCtrl.pcValSel := PCSelect.branchTarget
                            io.pcCtrl.enablePC := True
                        }
                        goto(stateFetch)
                    }
                    is(isLoad){
                        io.aluCtrl.opA := OpASelect.opReg1Data
                        io.aluCtrl.opB := OpBSelect.opImmediate
                        io.memCtrl.dataEna := True
                        io.memCtrl.readWriteData := False
                        switch(io.instrFields.funct3){
                            is(F3_LB, F3_LBU){ 
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.byte
                            }
                            is(F3_LH,F3_LHU){
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.halfWord
                            }
                            is(F3_LW){
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.word
                            }
                            default{
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.word
                            }
                        }
                        goto(stateWriteBack)
                    }
                    is(isStore){
                        // memory I/F address is connected to ALU output
                        // address = rs1 + IMM
                        // store rs2 into mem[address]
                        io.aluCtrl.opA := OpASelect.opReg1Data
                        io.aluCtrl.opB := OpBSelect.opImmediate
                        io.memCtrl.dataEna := True
                        io.memCtrl.readWriteData := True
                        switch(io.instrFields.funct3){
                            is(F3_SB){ 
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.byte
                            }
                            is(F3_SH){
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.halfWord
                            }
                            is(F3_SW){
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.word
                            }
                            default{
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.word
                            }
                        }
                        goto(stateWriteBack)
                    }
                    is(isECall,isCSR,isCSRImm,isTrapReturn){
                        when(io.instrFields.funct12 === F12_ECALL){
                            // enter traphandler
                            // load mcause and mtval accordingly for trap entry
                            io.trapEntry := True
                            io.pcCtrl.pcValSel := PCSelect.trapEntryTarget
                            io.pcCtrl.enablePC := True
                            goto(stateFetch)
                        }.elsewhen(io.instrFields.funct12 === F12_MRET & io.instrFields.src1 === 0 & io.instrFields.funct3 === 0 & io.instrFields.dest === 0){
                            // recover from traphandler
                            // set MSTATUS_MIE back to MSTATUS_MPIE
                            // set MSTATUS_MPIE := 1
                            // set PC := MEPC
                            io.trapExit := True
                            io.pcCtrl.pcValSel := PCSelect.trapExitTarget
                            io.pcCtrl.enablePC := True
                            goto(stateFetch)
                        }.elsewhen(io.instrFields.funct3 =/= F3_CSR_DECODEMASK){
                            // F3_CSR_DECODEMASK = -00 (dontcare, 0, 0). all other funct3 have instruction
                            // therefore here its a CSR instruction, do read/write
                            // SET CSR CONTROL SIGNALS
                            io.csrCtrl.enable := True
                            io.regCtrl.regDestSel := DestDataSelect.csrReadData
                            switch(io.instrType){
                                is(InstructionType.isCSR){
                                    io.csrCtrl.writeSelect := CSRDataSelect.reg1Data
                                }
                                is(InstructionType.isCSRImm){
                                    io.csrCtrl.writeSelect := CSRDataSelect.csrImmData
                                }
                            }
                            goto(stateCSR)
                        }
                    }
                    is(isFence){
                        goto(stateFetch)
                    }
                    is(isIllegal){
                        goto(stateTrap)
                    }
                    default{
                        goto(stateHalt)
                    }
                }
            }
        }
        val stateWriteBack : State = new State{
            whenIsActive{
                switch(io.instrType){
                    io.aluCtrl.opA := OpASelect.opReg1Data
                    io.aluCtrl.opB := OpBSelect.opImmediate
                    io.memCtrl.dataEna := True
                    is(isLoad){
                        switch(io.instrFields.funct3){
                            is(F3_LB, F3_LBU){ 
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.byte
                            }
                            is(F3_LH,F3_LHU){
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.halfWord
                            }
                            is(F3_LW){
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.word
                            }
                            default{
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.word
                            }
                        }
                    }
                    is(isStore){
                        io.memCtrl.readWriteData := True
                        switch(io.instrFields.funct3){
                            is(F3_SB){ 
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.byte
                            }
                            is(F3_SH){
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.halfWord
                            }
                            is(F3_SW){
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.word
                            }
                            default{
                                io.memCtrl.strobeSelect := MemoryStrobeSelect.word
                            }
                        }
                    }
                }
                when(io.memCtrl.dataRdy & !io.halt){
                    switch(io.instrType){
                        is(isLoad){
                            io.regCtrl.regFileWR := True
                            io.regCtrl.regDestSel := DestDataSelect.memReadData
                        }
                    }
                    goto(stateFetch)
                }.elsewhen(io.halt){
                    goto(stateHalt)
                }
            }
        }
        val stateTrap : State = new State{
            whenIsActive{
                // state is entered by exception, cause trap entry
                io.trapEntry := True
                io.pcCtrl.pcValSel := PCSelect.trapEntryTarget
                io.pcCtrl.enablePC := True
                goto(stateFetch)
            }
        }
        val stateCSR : State = new State{
            whenIsActive{
                io.regCtrl.regDestSel := DestDataSelect.csrReadData
                io.regCtrl.regFileWR := True
                goto(stateFetch)
            }
        }
        val stateInterrupt : State = new State{
            whenIsActive{
                // state is entered by interrupt, cause trap entry
                io.irqEntry := True
                io.pcCtrl.pcValSel := PCSelect.trapEntryTarget
                io.pcCtrl.enablePC := True
                goto(stateFetch)
            }
        }
        val stateHalt : State = new State{
            whenIsActive{
                io.halted := True
            }
        }
    }

    // debug logic for testing and debugging purposes on the fpga board
    // TODO: extend for irq state
    val dbgLogic = (dbg) generate new Area{
        // import ControlUnit.fsm._
        io.dbgState := B"0000"
        when(fsm.isActive(fsm.stateInit)){
        io.dbgState := B"0000"
        }.elsewhen(fsm.isActive(fsm.stateFetch)){
          io.dbgState := B"0001"
        }.elsewhen(fsm.isActive(fsm.stateDecode)){
          io.dbgState := B"0010"
        }.elsewhen(fsm.isActive(fsm.stateExecute)){
          io.dbgState := B"0011"
        }.elsewhen(fsm.isActive(fsm.stateWriteBack)){
          io.dbgState := B"0100"
        }.elsewhen(fsm.isActive(fsm.stateCSR)){
          io.dbgState := B"0101"
        }.elsewhen(fsm.isActive(fsm.stateTrap)){
          io.dbgState := B"0110"
        }.elsewhen(fsm.isActive(fsm.stateHalt)){
          io.dbgState := B"0111"
        }.elsewhen(fsm.isActive(fsm.stateInterrupt)){
          io.dbgState := B"1001"
        }
  }
}