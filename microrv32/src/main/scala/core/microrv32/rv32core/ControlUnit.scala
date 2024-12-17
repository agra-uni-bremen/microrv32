package core.microrv32.rv32core

import spinal.core._
import spinal.lib.fsm._
import core.microrv32.InstructionType
import core.microrv32.CSRAccessType
import core.microrv32.CSRAccessType._
import core.microrv32.RVOpcode._
import core.microrv32.CSROpcode._
import core.microrv32.RV32CoreConfig
import core.microrv32.MULDIVOpcode._

object PCSelect extends SpinalEnum{
    val incrementPC, jalTarget, jalrTarget, branchTarget, 
    trapEntryTarget, trapExitTarget = newElement()
}

case class PCControl() extends Bundle{
    val enablePC = out Bool()
    val pcValSel = out(PCSelect())
}

case class FetchControl() extends Bundle{
    val sample = out Bool()
}

object OpASelect extends SpinalEnum{
    val opReg1Data, opPC, opZero = newElement()
}

object OpBSelect extends SpinalEnum{
    val opReg2Data, opImmediate, opPCInc, opZero = newElement()
}

case class ALUCtrl() extends Bundle{
    val opA = out(OpASelect())
    val opB = out(OpBSelect())
    val aluBranch = in Bool()
}

case class MulDivCtrl() extends Bundle{
    val valid = out Bool()
    val ready = in Bool()
    val busy = in Bool()
}

object DestDataSelect extends SpinalEnum{
    val aluRes, aluBool, memReadData, 
    // csr
    csrReadData, 
    // mul div rem
    muldivData = newElement()
}

case class RegFileControl() extends Bundle{
    val regFileWR = out Bool()
    val regDestSel = out(DestDataSelect())
}

object CSRDataSelect extends SpinalEnum{
    val reg1Data, csrImmData = newElement()
}

object MCauseSelect extends SpinalEnum{
    val trapInstrAddrMisalign, trapIllegalInstr, trapECallMachine, trapMachineTimerIRQ = newElement()
}

case class CSRControl() extends Bundle{
    val writeSelect = out(CSRDataSelect())
    val enable = out Bool()
    val newFetch = out Bool()
    val illegalAccess = in Bool()
    val mcauseSelect = out(MCauseSelect())
}

object MemoryStrobeSelect extends SpinalEnum{
    val byte, halfWord, word = newElement()
}

case class MemoryControl() extends Bundle{
    // I-Memory
    val fetchEna = out Bool()
    val instrRdy = in Bool()
    // D-Memory
    val readWriteData = out Bool()
    val dataEna = out Bool()
    val dataRdy = in Bool()
    val strobeSelect = out(MemoryStrobeSelect())
}

case class ExceptionControl() extends Bundle{
    val misalignedJumpTarget = in Bool()
    val misalignedJumpLinkTarget = in Bool()
    val misalignedBranchTarget = in Bool()
}

case class ControlBundle(cfg : RV32CoreConfig) extends Bundle{
    // decoder
    val validDecode = in Bool()
    val instrType = in(InstructionType())
    val instrFields = in(DecodedFields())
    // program counter
    val pcCtrl = out(PCControl())
    // instruction fetch
    val fetchCtrl = out(FetchControl())
    // alu
    val aluCtrl = ALUCtrl()
    // muldiv
    val muldivCtrl = if(cfg.hasMULDIV) MulDivCtrl() else null
    // registerfile
    val regCtrl = out(RegFileControl())
    // csr
    val csrCtrl = CSRControl()
    // memory
    val memCtrl = MemoryControl()
    // exception handling
    val irqPending = in Bool()
    val trapEntry = out Bool()
    val trapExit = out Bool()
    val irqEntry = out Bool()
    val exceptions = in(ExceptionControl())
    // 
    val halt = in Bool() //It's related to Shutdown System. It's from outside(shutdown peripherals).
    val halted = out Bool() // It's true when 'halt' upward is true.
    val fetchSync = out Bool()
    // debug output
    val dbgState = out Bits(4 bits)
}

class ControlUnit(cfg : RV32CoreConfig) extends Component{
    val io = new ControlBundle(cfg)
    
    // default values
    // PC
    io.pcCtrl.enablePC := False
    io.pcCtrl.pcValSel := PCSelect.incrementPC
    // FETCH
    io.fetchCtrl.sample := False
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
    io.csrCtrl.mcauseSelect := MCauseSelect.trapECallMachine
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
    if(cfg.hasMULDIV){
        io.muldivCtrl.valid := False
    }
    
    val fsm = new StateMachine{
        import InstructionType._
        val stateInit : State = new State with EntryPoint{
            whenIsActive{
                goto(stateFetch)
            }
        }
        val stateFetch : State = new State{
            whenIsActive{
                when(io.irqPending){
                    goto(stateInterrupt)
                }.elsewhen(io.memCtrl.instrRdy){
                    io.csrCtrl.newFetch := True
                    io.fetchCtrl.sample := True
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
                    // if we just stall we lose liveness
                    //goto(stateHalt)
                    goto(stateTrap)
                }
            }
        }
        val stateExecute : State  = new State{
            whenIsActive{
                // default: we increment the program counter, if some instruction chooses a different value it be like that
                // last assignment wins anyway, lets be lazy
                io.pcCtrl.enablePC := True
                io.pcCtrl.pcValSel := PCSelect.incrementPC
                switch(io.instrType){ 
                    is(isRegReg){
                        // reg[dest] = reg[rs1] {OP} reg[rs2]
                        io.aluCtrl.opA := OpASelect.opReg1Data
                        io.aluCtrl.opB := OpBSelect.opReg2Data
                        io.regCtrl.regFileWR := True
                        io.regCtrl.regDestSel := DestDataSelect.aluRes
                        if(cfg.hasMULDIV){
                            // check for muldiv first, then for rv32i reg reg operation, then default case
                            when(io.instrFields.funct7 === F7_MULDIV){
                                io.regCtrl.regFileWR := False
                                io.regCtrl.regDestSel := DestDataSelect.muldivData
                                io.aluCtrl.opA := OpASelect.opReg1Data
                                io.aluCtrl.opB := OpBSelect.opReg2Data
                                io.muldivCtrl.valid := True
                                goto(stateWriteBack)
                            }.elsewhen(io.instrFields.funct7 === F7_Z | io.instrFields.funct7 === F7_O){
                                goto(stateFetch)
                            }.otherwise{
                                io.regCtrl.regFileWR := False
                                goto(stateTrap)
                            }
                        }else{
                            when(io.instrFields.funct7 === F7_Z | io.instrFields.funct7 === F7_O){
                                goto(stateFetch)
                            }.otherwise{
                                io.regCtrl.regFileWR := False
                                goto(stateTrap)
                            }
                        }
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
                            // reg[dest] = pc
                            io.aluCtrl.opA := OpASelect.opPC
                            io.aluCtrl.opB := OpBSelect.opPCInc
                            io.regCtrl.regDestSel := DestDataSelect.aluRes
                            // pc = pc + IMM
                            io.pcCtrl.pcValSel := PCSelect.jalTarget
                            when(io.exceptions.misalignedJumpTarget){
                                goto(stateTrap)
                            }.otherwise{
                                // enable write pc and write rd if there is no misalignment issue
                                io.pcCtrl.enablePC := True
                                io.regCtrl.regFileWR := True
                                goto(stateFetch)
                            }
                    }
                    is(isCT_JALR){
                        // reg[dest] = pc
                        io.aluCtrl.opA := OpASelect.opPC
                        io.aluCtrl.opB := OpBSelect.opPCInc
                        io.regCtrl.regDestSel := DestDataSelect.aluRes
                        // pc = (reg[rs1] + IMM) & ~0x1
                        io.pcCtrl.pcValSel := PCSelect.jalrTarget
                        when(io.exceptions.misalignedJumpLinkTarget){
                            goto(stateTrap)
                        }.otherwise{
                            // enable write pc and write rd if there is no misalignment issue
                            io.regCtrl.regFileWR := True
                            io.pcCtrl.enablePC := True
                            goto(stateFetch)
                        }
                    }
                    is(isBranch){
                        // IF opA {CMP-OP} opB THEN pc := branch-target ELSE pc := pc+4 
                        io.aluCtrl.opA := OpASelect.opReg1Data
                        io.aluCtrl.opB := OpBSelect.opReg2Data
                        // take the branch
                        when(io.aluCtrl.aluBranch){
                            io.pcCtrl.pcValSel := PCSelect.branchTarget
                            // if branch target of taken branch is misaligned, throw trap
                            when(io.exceptions.misalignedBranchTarget){
                                goto(stateTrap)
                            }.otherwise{
                                // branch target taken is ok, fetch next instruction
                                io.pcCtrl.enablePC := True
                                goto(stateFetch)
                            }
                        }.otherwise{
                            goto(stateFetch)
                        }
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
                        when(io.instrFields.funct12 === F12_ECALL & io.instrFields.src1 === 0 & io.instrFields.funct3 === 0 & io.instrFields.dest === 0){
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
                    is(isLoad){
                        io.memCtrl.dataEna := True
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
                        io.memCtrl.dataEna := True
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
                }
                if(cfg.hasMULDIV){
                when(io.muldivCtrl.ready & !io.halt){
                    io.regCtrl.regFileWR := True
                    io.regCtrl.regDestSel := DestDataSelect.muldivData
                    goto(stateFetch)
                }
                }
                when(io.halt){
                    goto(stateHalt)
                }
            }
            // onExit{
            //     io.memCtrl.dataEna := False
            // }
        }
        val stateTrap : State = new State{
            whenIsActive{
                // state is entered by exception, cause trap entry
                io.trapEntry := True
                switch(io.instrType){
                    is(isCT_JAL, isCT_JALR, isBranch){
                        io.csrCtrl.mcauseSelect := MCauseSelect.trapInstrAddrMisalign
                    }
                    is(isRegReg){
                        when(!(io.instrFields.funct7 === F7_Z | io.instrFields.funct7 === F7_O)){
                            io.csrCtrl.mcauseSelect := MCauseSelect.trapIllegalInstr
                        }
                    }
                    // difference between illegal and undefined?
                    is(isIllegal,isUndef){
                        io.csrCtrl.mcauseSelect := MCauseSelect.trapIllegalInstr
                    }
                    is(isECall){
                        io.csrCtrl.mcauseSelect := MCauseSelect.trapECallMachine
                    }
                    default{

                    }
                }
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
                io.csrCtrl.mcauseSelect := MCauseSelect.trapMachineTimerIRQ
                io.irqEntry := True
                io.pcCtrl.pcValSel := PCSelect.trapEntryTarget
                io.pcCtrl.enablePC := True
                goto(stateFetch)
            }
        }
        val stateHalt : State = new State{
            whenIsActive{
                io.halted := True
            } //Please take care that the fsm will stay at this state and won't go to fetch the next instruction.
        }
    }

    // debug logic for testing and debugging purposes on the fpga board
    val dbgLogic = (cfg.debug) generate new Area{
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