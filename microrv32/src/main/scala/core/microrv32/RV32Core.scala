package core.microrv32

import spinal.core._
import spinal.lib.fsm.{EntryPoint, State, StateMachine}
import spinal.lib.master
import scala.annotation.switch

/*
 * RV32I_Zicsr Implementation 
 * Interfacing with a simple memory interface with valid-ready signaling
 * Also having input for external cpu halts
 * Outputting fetch synchronization signal and halting state
 * Offering debug state output of fsm
 */
class RV32Core() extends Component{
  // IO Definition
  val io = new Bundle{
    // reset and clock implied through SpinalHDL
    // simple bus access
    val sb = master(SimpleBus(32,32))
    // cpu halted through ecall
    val halted = out Bool
    // sync signal, asserted when core is in fetch state
    val fetchSync = out Bool
    // halting signals for external, memory mapped shutdown
    val halt = in Bool
    val haltErr = in Bool
    val dbgState = out Bits(3 bits)
    // interrupt timer
    val irqTimer = in Bool
  }
  
  private final val DBG_EXT : Boolean = true
  private final val CSR_EXT : Boolean = true

  // registerfile with 32-bit datawidth
  // and 5-bit addresswidth
  val regs = new RV32RegisterFile(5, 32, 32)

  // define programcounter with enable signal
  val pcLogic = new Area{
    // data signals
    val programCounter = Reg(UInt(32 bits)) init(U"h80000000")
    // control signals
    val pcEna = Bool
    
    when(pcEna){
      programCounter := programCounter + 4
    }
  }

  // decode loaded instruction from memory by the specification of rv32 uncompressed instructions  
  val decodeLogic = new Area{
    // imports, io, defaults, in a block so its foldable when navigating code
    import Tools._
    import RVOpcode._
    import InstructionType._
    import CSSROpcode._

    // data signals
    val instruction = Reg(Bits(32 bits)) init(0)
    val instrSwapped = Bits(32 bits)
    val opcode = Bits(7 bits)
    val source1 = Bits(5 bits)
    val source2 = Bits(5 bits)
    val destination = Bits(5 bits)
    val immediate = Bits(32 bits)
    val funct3 = Bits(3 bits)
    val funct7 = Bits(7 bits)
    val funct12 = Bits(12 bits)
    val shamt = Bits(5 bits)

    // csr extension
    val csr = Bits(12 bits)
    val csr_uimm = Bits(5 bits)
    
    // control signals
    val decoded = Bool
    val iType = InstructionType()
    
    // default values
    iType := isUndef
    decoded := False
    
    // commented out for byte-alignment issue
    // instrSwapped := unswapInstruction(instruction)
    instrSwapped := unswapStub(instruction)
    
    opcode := instrSwapped(6 downto 0)
    source1 := instrSwapped(19 downto 15)
    source2 := instrSwapped(24 downto 20)
    destination := instrSwapped(11 downto 7)
    funct3 := instrSwapped(14 downto 12)
    funct7 := instrSwapped(31 downto 25)
    funct12 := instrSwapped(31 downto 20)
    immediate := B(0,32 bits)
    shamt := instrSwapped(24 downto 20)

    // csr extension  
    csr := instrSwapped(31 downto 20)
    csr_uimm := instrSwapped(19 downto 15)   

    // check for 7 bit opcode to determine type of instruction
    // for later: ensure 0 opcode is not allowed, currently its handled as illegal instruction that does not stop the fsm
    // FIXME test if making two switch statements, one for iType and one for immediate, reduces generated verilog?
   switch(opcode){
      is(OP_REGREG){
        decoded := True
        iType := isRegReg
      }
      is(OP_REGIMM){
        decoded := True
        iType := isRegImm
        // I-Type :
        immediate := S(instrSwapped(31), 21 bits) ## instrSwapped(30 downto 25) ## instrSwapped(24 downto 21) ## instrSwapped(20)
      }
      is(OP_BRANCH){
        decoded := True
        iType := isBranch
        // B-Type :
        immediate := S(instrSwapped(31), 20 bits) ## instrSwapped(7) ## instrSwapped(30 downto 25) ## instrSwapped(11 downto 8) ## B(0,1 bit)
      }
      is(OP_LOAD){
        decoded := True
        iType := isLoad
        // I-Type :
        immediate := S(instrSwapped(31), 21 bits) ## instrSwapped(30 downto 25) ## instrSwapped(24 downto 21) ## instrSwapped(20)
      }
      is(OP_STORE){
        decoded := True
        iType := isStore
        // S-Type :
        immediate := S(instrSwapped(31), 21 bits) ## instrSwapped(30 downto 25) ## instrSwapped(11 downto 8) ## instrSwapped(7)
      }
      is(OP_LUI){
        decoded := True
        iType := isLUI
        // U-Type :
        immediate := instrSwapped(31) ## instrSwapped(30 downto 20) ## instrSwapped(19 downto 12) ## B(0, 12 bits)
      }
      is(OP_AUIPC){
        decoded := True
        iType := isAUIPC
        // U-Type :
        immediate := instrSwapped(31) ## instrSwapped(30 downto 20) ## instrSwapped(19 downto 12) ## B(0, 12 bits)
      }
      is(OP_JAL){
        decoded := True
        iType := isCT_JAL
        // J-Type :
        // $signed({instr[31], instr[19:12], instr[20], instr[30:21], 1'b0});
        immediate := S(B(instrSwapped(31) ## instrSwapped(19 downto 12) ## instrSwapped(20) ## instrSwapped(30 downto 25) ## instrSwapped(24 downto 21) ## B(0, 1 bit)),32 bits).asBits

      }
      is(OP_JALR){
        decoded := True
        iType := isCT_JALR
        // I-Type :
        immediate := S(instrSwapped(31) ## instrSwapped(30 downto 25) ## instrSwapped(24 downto 21) ## instrSwapped(20),32 bits).asBits
      }
      is(OP_FENCE){
        decoded := True
        iType := isFence
      }
      is(OP_ECALL,OP_CSR){
        when(funct12 === F12_ECALL & source1 === 0 & funct3 === 0 & destination === 0){
          decoded := True 
          iType := isECall
        }.elsewhen(funct12 === F12_MRET & source1 === 0 & funct3 === 0 & destination === 0){
          decoded := True
          iType := isTrapReturn
        }
        .elsewhen(funct3 =/= F3_CSR_DECODEMASK){
          decoded := True
          iType := isCSR
          // immediate csr dont need rs1 to be loaded in decode state
          // and immediate csr have third bit of funct3 == 1
          when(funct3(2)){
            iType := isCSRImm
          }
        }
      }
      is(OP_ZEROS){
        decoded := False
        iType := isIllegal
      }
      default{
        iType := isUndef
        decoded := False
      }
    }
  }

  // 32-bit alu for riscv arithmetic operations
  val aluLogic = new Area{
    import InstructionType._
    import RVOpcode._
    // input/output
    val opA = Bits(32 bits)
    val opB = Bits(32 bits)
    val output = Bits(32 bits)
    val output_bool = Bool
    
    // results
    val add = Bits(32 bits)
    val sub = Bits(32 bits)
    val equal = Bool
    val unequal = Bool
    val lt_u = Bool
    val lt_s = Bool
    val ge_u = Bool
    val ge_s = Bool
    val bitAnd = Bits(32 bits)
    val bitOr = Bits(32 bits)
    val bitXor = Bits(32 bits)
    val shiftL = Bits(32 bits)
    val shiftR = Bits(32 bits)
    val shiftRA = Bits(32 bits)
    val shiftLI = Bits(32 bits)
    val shiftRI = Bits(32 bits)
    val shiftRAI = Bits(32 bits)

    // all calculations
    //add := (opA.asUInt + opB.asUInt).asBits
    add := (opA.asUInt + opB.asUInt).asBits
    sub := (opA.asUInt - opB.asUInt).asBits
    equal := opA === opB
    unequal := !equal
    lt_u := opA.asUInt < opB.asUInt
    lt_s := opA.asSInt < opB.asSInt
    ge_u := opA.asUInt >= opB.asUInt
    ge_s := opA.asSInt >= opB.asSInt
    bitAnd := opA & opB
    bitOr := opA | opB
    bitXor := opA ^ opB
    // if shift behaviour is bugged, it might be because the way spinalhdl generated verilog
    // https://github.com/SpinalHDL/SpinalHDL/issues/300 see issue for clarification
    shiftL := opA |<< opB(4 downto 0).asUInt
    shiftR := opA |>> opB(4 downto 0).asUInt
    shiftRA := (opA.asSInt >> opB(4 downto 0).asUInt).asBits
    shiftLI := opA |<< decodeLogic.shamt.asUInt
    shiftRI := opA |>> decodeLogic.shamt.asUInt
    shiftRAI := (opA.asSInt >> decodeLogic.shamt.asUInt).asBits

    // output mux based on funct3 and funct7 according to specification
    // default value to not infer latch
    output := 0
    output_bool := False
    switch(decodeLogic.iType){
      is(isRegReg){
        switch(decodeLogic.funct3){
          is(F3_ADD, F3_SUB){
            output := (decodeLogic.funct7 === F7_Z) ? add | sub
          }
          is(F3_SLT){
            output := (lt_s === True) ? B(1,32 bits) | B(0,32 bits)
          }
          is(F3_SLTU){
            output := (lt_u === True) ? B(1,32 bits) | B(0,32 bits)
          }
          is(F3_AND){
            output := bitAnd
          }
          is(F3_OR){
            output := bitOr
          }
          is(F3_XOR){
            output := bitXor
          }
          is(F3_SLL){
            output := shiftL
          }
          is(F3_SRL, F3_SRA){
            output := (decodeLogic.funct7 === F7_Z) ? shiftR | shiftRA
          }
        }
      }
      is(isRegImm){
        // for immediate instructions we only need to look at funct3
        switch(decodeLogic.funct3){
          is(F3_ADDI){
            output :=  add
          }
          is(F3_SLTI){
            output := (lt_s === True) ? B(1,32 bits) | B(0,32 bits)
          }
          is(F3_SLTIU){
            output := (lt_u === True) ? B(1,32 bits) | B(0,32 bits)
          }
          is(F3_ANDI){
            output := bitAnd
          }
          is(F3_ORI){
            output := bitOr
          }
          is(F3_XORI){
            output := bitXor
          }
          is(F3_SLLI){
            output := shiftLI
          }
          is(F3_SRLI, F3_SRAI){
            output := (decodeLogic.funct7 === F7_Z) ? shiftRI | shiftRAI
          }
        }
      }
      is(isBranch){
        switch(decodeLogic.funct3){
          is(F3_BEQ){
            output_bool := equal
          }
          is(F3_BNE){
            output_bool := unequal
          }
          is(F3_BLT){
            output_bool := lt_s
          }
          is(F3_BGE){
            output_bool := ge_s
          }
          is(F3_BLTU){
            output_bool := lt_u
          }
          is(F3_BGEU){
            output_bool := ge_u
          }
        }
      }
    }
  }

  // generate CSR logic only if class variable is set
  val cssrLogic = (CSR_EXT) generate new Area{
    //import controlFSM._
    import RVCSR._
    import CSSRAccessType._
    import InstructionType._

    // input/output stage of cssr logic for read/write
    val addr = UInt(12 bits)
    //val rw = Bool // true means write
    val accessType = CSSRAccessType()
    val ena = Bool // enable of cssr logic
    val wval = Bits(32 bits) // write data
    val rval = Reg(Bits(32 bits)) init(0) // read data
    val newFetch = Bool
    val isIllegalAccess = Bool

    // internal signals
    val rdX0 = Bool
    val rs1X0 = Bool
    val uimmZero = Bool
    val chooseOperand = Bool
    val wrCSRcnd = Bool

    // cssr registers
    // Machine Information Registers
    val mvendorid = Reg(Bits(32 bits)) init(0) //RO - Vendor ID 
    val marchid = Reg(Bits(32 bits)) init(0) // RO - Architecture ID
    val mimpid = Reg(Bits(32 bits)) init(0) // RO - Implementation ID
    val mhartid = Reg(Bits(32 bits)) init(0) // RO - Hardware thread ID
    // Machine Trap Setup
    val mstatus = Reg(Bits(32 bits)) init(MSTATUS_DEFAULT) // RW - Machine status retgister
    val misa = Reg(Bits(32 bits)) init(MISA_DEFAULT) // RW - ISA and extensions
    val medeleg = Reg(Bits(32 bits)) init(0) // RW - Machine exception delegation register
    val mideleg = Reg(Bits(32 bits)) init(0) // RW - Machine interrupt delegation register
    val mie = Reg(Bits(32 bits)) init(0) // RW - Machine interrupt-enable register
    val mtvec = Reg(Bits(32 bits)) init(0) // RW - Machine trap-handler base address
    // Machine Trap Handling
    val mepc  = Reg(Bits(32 bits)) init(0) // RW - Machine exception program counter
    val mcause = Reg(Bits(32 bits)) init(0) // RW - Machine trap cause
    val mtval = Reg(Bits(32 bits)) init(0) // RW - Machine bad address or instruction
    val mip = Reg(Bits(32 bits)) init(0) // RO - Machine interrupt pending
    val mtinst = Reg(Bits(32 bits)) init(0) // RW - Machine trap instruction (transformed)
    // Hardware Performance Monitor
    val minstret = Reg(Bits(64 bits)) init(0) // RW - Instructions retired
    val mcycle = Reg(Bits(64 bits)) init(0) // RW - Clock cycles executed

    /* This funciton is used for CSR bit mask operations
     * If a atmoic read+set or read+clear is happening, the given parameter
     * in RS1 is used as a bitmask in which bits that are 1 will be
     * set or cleared respectively. Bits that are 0 in the mask will
     * be unchanged in the register and keep the old value.
     */
    def maskValue(oldVal : Bits, mask : Bits, newVal : Bits) : Bits = {
      val writeValue = Bits(32 bits)
      //writeValue := 0
      writeValue := (oldVal & ~mask) | (newVal & mask)
      writeValue
    }

    /* This function is used to write access the CSR registers.
     * It covers to check for the access type (write, set, clear)
     * and applies the given mask for the set/clear operations properly
     * This function is used to give readability for the rw-logic below
     */
    def csrWriteAccess(toRegister : Bits, mask : Bits, newVal : Bits) : Unit = {
      when(accessType === CSRwrite){
        toRegister := newVal & mask
      }.elsewhen(accessType === CSRset & decodeLogic.csr_uimm =/= 0){
        toRegister := maskValue(toRegister, mask, newVal)
      }.elsewhen(accessType === CSRclear & decodeLogic.csr_uimm =/= 0){
        // TODO & FIXME check if mask or wval needs to be negated for atomic csr clear
        toRegister := maskValue(toRegister, mask, ~newVal)
      }
    }

    // determine condition whether or not to execute the write to a register
    rdX0 := decodeLogic.destination === 0
    rs1X0 := decodeLogic.source1 === 0
    uimmZero := decodeLogic.csr_uimm === 0
    chooseOperand := decodeLogic.iType === isCSR
    wrCSRcnd := ((rs1X0 & chooseOperand) | (uimmZero & ~chooseOperand))

    // RW-Logic for CSR Registers
    rval := B(0, 32 bits)
    isIllegalAccess := False
    when(ena){
      switch(addr){
        // Machine Information Registers
        is(MVENDORID_ADDR){
          // RO
          rval := mvendorid
        }
        is(MARCHID_ADDR){
          // RO
          rval := marchid
        }
        is(MIMPID_ADDR){
          // RO
          rval := mimpid
        }
        is(MHARTID_ADDR){
          // RO
          rval := mhartid
        }
        // Machine Trap Setup
        is(MSTATUS_ADDR){
          // RW
          rval := mstatus & MSTATUS_READ_MASK
          csrWriteAccess(toRegister = mstatus, mask = DEFAULT_CSR_MASK, wval)
        }
        is(MISA_ADDR){
          // RW but here its only rv32i with csr, therefore no write to misa
          rval := misa
        }
        is(MEDELEG_ADDR){
          // RW
          rval := medeleg
          csrWriteAccess(toRegister = medeleg, mask = DEFAULT_CSR_MASK, wval)
        }
        is(MIDELEG_ADDR){
          // RW
          rval := mideleg
          csrWriteAccess(toRegister = mideleg, mask = DEFAULT_CSR_MASK, wval)
        }
        is(MIE_ADDR){
          // RW
          rval := mie & MIE_RW_MASK
          csrWriteAccess(toRegister = mie, mask = MIE_RW_MASK, wval)
        }
        is(MTVEC_ADDR){
          // RW
          rval := mtvec
          csrWriteAccess(toRegister = mtvec, mask = MTVEC_WRITE_MASK, wval & MTVEC_WRITE_MASK)
        }
        // Machine Trap Handling
        is(MEPC_ADDR){
          // RW
          rval := mepc
          csrWriteAccess(toRegister = mepc, mask = DEFAULT_CSR_MASK, wval & DEFAULT_CSR_MASK)
        }
        is(MCAUSE_ADDR){
          // RW
          rval := mcause
          csrWriteAccess(toRegister = mcause, mask = DEFAULT_CSR_MASK, wval)
        }
        is(MTVAL_ADDR){
          // RW
          rval := mtval
          csrWriteAccess(toRegister = mtval, mask = DEFAULT_CSR_MASK, wval)
        }
        is(MIP_ADDR){
          // RO
          rval := mip
          // changed MIP register to be RO according to spec
          // for timer interrupt pending interrupt is cleared by rewriting mtimecmp
          //csrWriteAccess(toRegister = mip, mask = MIP_RW_MASK, wval)
        }
        // Hardware Performance Monitor / Machine Counters/Timers
        is(MCYCLE_ADDR){
          // RO 
          rval := mcycle(31 downto 0)
        }
        is(MINSTRET_ADDR){
          // RO
          rval := minstret(31 downto 0)
        }
        is(MCYCLEH_ADDR){
          // RO 
          rval := mcycle(63 downto 32)
        }
        is(MINSTRETH_ADDR){
          // RO
          rval := minstret(63 downto 32)
        }
        default{
          isIllegalAccess := True
          rval := B(0, 32 bits)
        }
      }
    }
    when(io.irqTimer){
      mip(MIP_MTIP) := True
    }.otherwise{
      mip(MIP_MTIP) := False
    }
    // increment minstret for every instruction retired
    // when(newFetch){
    //   minstret := (minstret.asUInt + 1).asBits
    // }
    // increment mcycle every clock cycle
    mcycle := (mcycle.asUInt + 1).asBits
  }

  // timer irq logic to write pending interrupt register at timer irq bit
  // val timerIRQLogic = (CSR_EXT) generate new Area{
  //   import RVCSR._
  // 
  // }

  // statemachine controling the processor state -- classic fetch-decode-execute-writeback
  val controlFSM = new StateMachine{
    import RVOpcode._
    import InstructionType._
    import RVCSR._
    // memory control signals
    val memValid = Reg(Bool) init(False)
    val memReady = Bool
    val memWrite = Reg(Bool) init(False)
    // register control
    val regWR = Bool
    // halting signal
    val halted = Bool
    val fetchSync = Bool
    // cssr counter enable
    val newFetch = Bool
    val haltCond = (io.halt | io.haltErr)
    val timerIRQPending = cssrLogic.mip(MIP_MTIP) & cssrLogic.mie(MIP_MTIP) & cssrLogic.mstatus(MSTATUS_MIE)

    //likely to get pruned but easier for readability
    memReady := io.sb.SBready
    // default behaviour
    regWR := False
    halted := False
    fetchSync := False
    newFetch := False
    io.sb.SBwrite := False

    // general initialization state, bringing everything to well defined values and behaviours
    val stateInit : State = new State with EntryPoint{
      pcLogic.pcEna := False
      whenIsActive{
        goto(stateFetch)
      }
    }

    // fetch memory from programcounter for instruction and proceed when memory response is asserted
    val stateFetch : State = new State{
      onEntry{
        if(CSR_EXT){
          /* interrupts are checked after each instruction but before fetching a new one
          * after interrupt handling the next instruction is continued
          * for now only timer-interrupts 
          * when timer interrupt pending and timer interrupt enabled
          */
          when(timerIRQPending){
            memValid := False
          }.otherwise{
            memValid := True
          }
        }else{
          memValid := True
        }
      }
      whenIsActive{
        when(timerIRQPending){
          goto(stateInterrupt)
        }.otherwise{
          memValid := True
          fetchSync := True
          //memValid := False
          when(memReady){
            pcLogic.pcEna := True
            goto(stateDecode)
          }
        }
      }
      onExit{
        memValid := False
        if(CSR_EXT){
          //newFetch := True
          // move into datapath at decode state? it would be wrong to have it here, at the moment it works tho
          cssrLogic.minstret := (cssrLogic.minstret.asUInt + 1).asBits
        }
      }
    }

    // wait for decode logic to find non illegal instruction that can be executed
    val stateDecode : State = new State{
      whenIsActive{
        pcLogic.pcEna := False
        when(decodeLogic.decoded){
          goto(stateExecute)
        }.elsewhen(!decodeLogic.decoded & decodeLogic.iType === isIllegal){
          goto(stateHalt)
        }
      }
    }

    // execute decoded instruction by setting control lines according to opcode
    val stateExecute : State = new State{
      whenIsActive{
        switch(decodeLogic.iType){
          is(isLUI, isAUIPC, isCT_JAL, isCT_JALR, isRegImm, isRegReg){
            regWR := True
            goto(stateFetch)
          }
          is(isBranch){
            goto(stateFetch)
          }
          is(isLoad){
            io.sb.SBvalid := True
            goto(stateWriteBack)
          }
          is(isStore){
            io.sb.SBwrite := True
            io.sb.SBvalid := True
            switch(decodeLogic.funct3){
              is(F3_SB, F3_SH, F3_SW){
                goto(stateWriteBack)
              }
              default{
                goto(stateHalt)
              }
            }
          }
          is(isIllegal, isECall){
            goto(stateTrap)
          }
          // only generate hardware if csr extension is active
          if(CSR_EXT){
            is(isCSR,isCSRImm){
              goto(stateCSR)
            }
            is(isTrapReturn){
              goto(stateFetch)
            }
          }
          is(isFence){
            goto(stateFetch)
          }
          default{
            goto(stateHalt)
          }
        }
      }
    }
    
    // additional state for writeback in store and load instructions
    // can stall CPU if there is no memready or haltcondition
    val stateWriteBack : State = new State{
      whenIsActive{
        switch(decodeLogic.iType){
          is(isLoad){
            regWR := True
          }
        }
        when(memReady & !haltCond){
          goto(stateFetch)
        }.elsewhen(haltCond){
          goto(stateHalt)
        }
      }
    }

    // traphandler and ecall state
    val stateTrap : State = new State{
      whenIsActive{
        goto(stateFetch)
      }
    }

    val stateCSR : State = new State{
      whenIsActive{
        switch(decodeLogic.iType){
          is(isCSR, isCSRImm){
             regWR := True
          }
        }
        goto(stateFetch)
      }
    }
    
    // interrupt received state
    val stateInterrupt : State = new State{
      whenIsActive{
        // if interrupt, let datapath load mcause, mtval, mepc and change pc to mtvec
        // On restoration out of interrupt-trap restore all values (mpie, mie)
        goto(stateFetch)
      }
    }
    
    // halting state for illegal instruction that ends in well defined behaviour
    // stall the cpu for now
    val stateHalt : State = new State{
      whenIsActive{
        halted := True
      }
    }
  }

  // datapath interconnecting decode logic, program counter, register file, alu
  // control signals from the control fsm perform operations of the instructions
  val datapathLogic = new Area{
    import controlFSM._
    import InstructionType._
    import RVOpcode._
    import CSSROpcode._
    import CSSRAccessType._
    import RVCSR._

    //io signals for datapath
    val src1 = UInt(5 bits)
    val src2 = UInt(5 bits)
    val src1Data = Reg(Bits(32 bits))
    val src2Data = Reg(Bits(32 bits))
    val dest = UInt(5 bits)
    val destData = Bits(32 bits) 

    // connect to registerfile
    src1Data := regs.io.rs1Data
    src2Data := regs.io.rs2Data

    // default behaviour to prevent unwanted latches
    src1 := 0
    src2 := 0
    dest := 0
    destData := 0
    aluLogic.opA := 0
    aluLogic.opB := 0
    io.sb.SBaddress := 0
    io.sb.SBwdata := 0
    io.sb.SBsize := 4

    // signals going to csr logic -- since they are redundant they will get pruned likely, but it helps readability
    val csr_addr = UInt(12 bits)
    val csr_accType = CSSRAccessType()
    val csr_ena = Bool
    val csr_rval = Bits(32 bits)
    val csr_wval = Bits(32 bits)
    
    // default values for mux
    csr_addr := 0
    csr_accType := CSRidle
    csr_ena := False
    csr_wval := 0

    // connect to csr logic
    cssrLogic.addr := csr_addr
    cssrLogic.accessType := csr_accType
    cssrLogic.ena := csr_ena
    csr_rval := cssrLogic.rval
    cssrLogic.wval := csr_wval

    /*
    * as regarded in https://github.com/SpinalHDL/SpinalHDL/issues/308
    * the statemachine library in spinalhdl does not support a switch-case
    * onto the states from outside the StateMachine area
    * access for the current state of the statemachine has to be done via isActive(statename)
    * this results in when-elsewhen-otherwise constructions which will result in if-else in verilog
    * if the fsm is built with a SpinalEnum in the classic style this is not the case
    */
    when(controlFSM.isActive(stateInit)){
      // do nothing in init yet
    }.elsewhen(controlFSM.isActive(stateFetch)){
      // fetch memory at programcounter address to load next instruction into decoder
      io.sb.SBaddress := pcLogic.programCounter
      decodeLogic.instruction := io.sb.SBrdata
    }.elsewhen(controlFSM.isActive(stateDecode)){
      switch(decodeLogic.iType){
        is(isRegImm, isLoad, isCT_JALR, isCSR){
          src1 := decodeLogic.source1.asUInt
        }
        is(isRegReg, isBranch, isStore){
          src1 := decodeLogic.source1.asUInt
          src2 := decodeLogic.source2.asUInt
        }
      }
    }.elsewhen(controlFSM.isActive(stateExecute)){
      switch(decodeLogic.iType){
        is(isLUI){
          dest := decodeLogic.destination.asUInt
          destData := decodeLogic.immediate
        }
        is(isAUIPC){
          dest := decodeLogic.destination.asUInt
          destData := (decodeLogic.immediate.asUInt + pcLogic.programCounter - 4).asBits
        }
        is(isCT_JAL){
          // in this state pc was incremented after fetch already (so current_pc = old_pc+4)
          pcLogic.programCounter := pcLogic.programCounter + decodeLogic.immediate.asUInt - 4
          dest := decodeLogic.destination.asUInt
          destData := (pcLogic.programCounter).asBits
        }
        is(isCT_JALR){
          // pc = (src1data + immediate) and set LSB of result to 0
          pcLogic.programCounter := ((src1Data.asUInt + decodeLogic.immediate.asUInt).asBits & ~B(1,32 bits)).asUInt
          dest := decodeLogic.destination.asUInt
          // in this state pc was incremented after fetch already (so current_pc = old_pc+4)
          destData := (pcLogic.programCounter).asBits
        }
        is(isBranch){
          aluLogic.opA := src1Data
          aluLogic.opB := src2Data
          when(aluLogic.output_bool){
            // last programcounter (before fetch -- where it gets incremented) + immediate encoded offset
            pcLogic.programCounter := pcLogic.programCounter + decodeLogic.immediate.asUInt - 4
          }
        }
        is(isLoad){
          io.sb.SBaddress := src1Data.asUInt + decodeLogic.immediate.asUInt
          switch(decodeLogic.funct3){
            is(F3_LB,F3_LBU){
              io.sb.SBsize := 1
            }
            is(F3_LH,F3_LHU){
              io.sb.SBsize := 2
            }
            is(F3_LW){
              io.sb.SBsize := 4
            }
          }
        }
        is(isStore){
          io.sb.SBaddress := src1Data.asUInt + decodeLogic.immediate.asUInt
          io.sb.SBwdata := src2Data
          switch(decodeLogic.funct3){
            is(F3_SB){
              io.sb.SBsize := 1
            }
            is(F3_SH){
              io.sb.SBsize := 2
            }
            is(F3_SW){
              io.sb.SBsize := 4
            }
          }
        }
        is(isRegImm){
          aluLogic.opA := src1Data
          aluLogic.opB := decodeLogic.immediate
          dest := decodeLogic.destination.asUInt
          destData := aluLogic.output
        }
        is(isRegReg){
          aluLogic.opA := src1Data
          aluLogic.opB := src2Data
          dest := decodeLogic.destination.asUInt
          destData := aluLogic.output
        }
        is(isECall,isCSR,isCSRImm,isTrapReturn){
          // next state is trap
          when(decodeLogic.funct12 === F12_ECALL){
            // trap values
            cssrLogic.mcause := RVCSR.TRAP_EXC_ECALL_M_MODE
            cssrLogic.mtval := (pcLogic.programCounter - 4).asBits
          }.elsewhen(decodeLogic.funct12 === F12_MRET & decodeLogic.source1 === 0 & decodeLogic.funct3 === 0 & decodeLogic.destination === 0){
            if(CSR_EXT){
              // recover from traphandler 
              cssrLogic.mstatus(MSTATUS_MIE) := cssrLogic.mstatus(MSTATUS_MPIE)
              cssrLogic.mstatus(MSTATUS_MPIE) := True
              pcLogic.programCounter := cssrLogic.mepc.asUInt
            }
          }.elsewhen(decodeLogic.funct3 =/= F3_CSR_DECODEMASK){
            // F3_CSR_DECODEMASK = -00 (dontcare, 0, 0). all other funct3 have instruction
            // is CSR instruction, do read/write
            if(CSR_EXT){
              // write to csr register given through instruction
              csr_addr := decodeLogic.csr.asUInt
              // choose between data in src1 register and immediate with bit 3 of funct3
              // src1 == x0 gets checked in cssrLogic based on AccessType Enum
              csr_wval := (decodeLogic.funct3(2)) ? B(decodeLogic.csr_uimm, 32 bits) | src1Data
              cssrLogic.ena := True
              // write old value to destination reigster, 
              // if destination is x0 register design doesnt write anyway
              dest := decodeLogic.destination.asUInt
              destData := B(csr_rval, 32 bits)
              // set AccessType enum via mux
              switch(decodeLogic.funct3){
                is(F3_CSRRW,F3_CSRRWI){
                  csr_accType := CSRwrite
                }
                is(F3_CSRRS,F3_CSRRSI){
                  csr_accType := CSRset
                }
                is(F3_CSRRC,F3_CSRRCI){
                  csr_accType := CSRclear
                }
              }
            }
          }
        }
        is(isIllegal){
          if(CSR_EXT){
            // next state is trap
            cssrLogic.mtinst := decodeLogic.instrSwapped
            cssrLogic.mcause := RVCSR.TRAP_EXC_ILLEGAL_INSTR
          }
        }
      }
    }.elsewhen(controlFSM.isActive(stateWriteBack)){
        switch(decodeLogic.iType){
          is(isLoad){
            dest := decodeLogic.destination.asUInt
            switch(decodeLogic.funct3){
              is(F3_LB){
                destData := S(io.sb.SBrdata(7 downto 0),32 bits).asBits
              }
              is(F3_LH){
                destData := S(io.sb.SBrdata(15 downto 0),32 bits).asBits
              }
              is(F3_LW){
                destData := io.sb.SBrdata
              }
              is(F3_LBU){
                destData := U(io.sb.SBrdata(7 downto 0),32 bits).asBits
              }
              is(F3_LHU){
                destData := U(io.sb.SBrdata(15 downto 0),32 bits).asBits
              }
            }
          }
        }
    }.elsewhen(controlFSM.isActive(stateCSR)){
      // csr logic gets one cycle for write operations
      if(CSR_EXT){
        //when(decodeLogic.funct3 === F3_CSRRW | decodeLogic.funct3 ===F3_CSRRWI){
          destData := csr_rval
          dest := decodeLogic.destination.asUInt
        //}
      }
    }.elsewhen(controlFSM.isActive(stateTrap)){
      if(CSR_EXT){
        // mask MSB with 0 to represent trap cause
        cssrLogic.mcause := cssrLogic.mcause & B(32 bits, 31->false, default->true)
        cssrLogic.mtval := (pcLogic.programCounter - 4).asBits
        cssrLogic.mepc := (pcLogic.programCounter - 4).asBits
        pcLogic.programCounter := U(cssrLogic.mtvec(31 downto 2) << 2, 32 bits)
      } 
    }.elsewhen(controlFSM.isActive(stateInterrupt)){
      if(CSR_EXT){
        when(controlFSM.timerIRQPending){
          cssrLogic.mstatus(MSTATUS_MPIE) := cssrLogic.mstatus(MSTATUS_MIE) // save old irq enable
          cssrLogic.mstatus(MSTATUS_MIE) := False // disable interrupts while in traphandler per default
          cssrLogic.mcause := B(32 bits, 31->true, default->false) | 7 // 7 = Machine timer interrupt
          cssrLogic.mtval := (pcLogic.programCounter - 4).asBits // last valid instruction before irq
          cssrLogic.mepc := pcLogic.programCounter.asBits // next pc to execute after irq handler
          pcLogic.programCounter := U(cssrLogic.mtvec(31 downto 2) << 2, 32 bits) // jump to traphandler
        }
      }
    }.elsewhen(controlFSM.isActive(stateHalt)){
      // nothing in halt yet
    }
  }
  
  // wire registerfile to datapath and controllogic
  regs.io.rs1 := datapathLogic.src1
  regs.io.rs2 := datapathLogic.src2
  regs.io.wrEna := controlFSM.regWR
  regs.io.rd := datapathLogic.dest
  regs.io.rdData := datapathLogic.destData

  // io signal
  io.sb.SBvalid := controlFSM.memValid
  io.halted := controlFSM.halted
  io.fetchSync := controlFSM.fetchSync

  // cssr control signal for minstret
  cssrLogic.newFetch := controlFSM.newFetch

  // debug logic for testing and debugging purposes on the fpga board
  // TODO: extend for irq state
  val dbgLogic = (DBG_EXT) generate new Area{
    import controlFSM._
    io.dbgState := B"000"
    when(controlFSM.isActive(stateInit)){
      io.dbgState := B"000"
    }.elsewhen(controlFSM.isActive(stateFetch)){
      io.dbgState := B"001"
    }.elsewhen(controlFSM.isActive(stateDecode)){
      io.dbgState := B"010"
    }.elsewhen(controlFSM.isActive(stateExecute)){
      io.dbgState := B"011"
    }.elsewhen(controlFSM.isActive(stateWriteBack)){
      io.dbgState := B"100"
    }.elsewhen(controlFSM.isActive(stateCSR)){
      io.dbgState := B"101"
    }.elsewhen(controlFSM.isActive(stateTrap)){
      io.dbgState := B"110"
    }.elsewhen(controlFSM.isActive(stateHalt)){
      io.dbgState := B"111"
    }
  }

}

// encode instruction in enum to abstract from bitvectors
object InstructionType extends SpinalEnum{
  val isUndef, isRegReg, isRegImm, isImm, isBranch, isLoad, isStore, 
  isCT_JAL, isCT_JALR, isLUI, isAUIPC, isECall, isFence, isIllegal,
  isCSR, isCSRImm, isTrapReturn = newElement()
}