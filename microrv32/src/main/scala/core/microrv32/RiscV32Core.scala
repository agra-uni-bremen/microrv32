package core.microrv32

import spinal.core._
import spinal.lib.master
import scala.annotation.switch
import core.microrv32.rv32core._
import core.microrv32.RVCSR._
//import core.microrv32._

// encode instruction in enum to abstract from bitvectors
object InstructionType extends SpinalEnum{
  val isUndef, isRegReg, isRegImm, isImm, isBranch, isLoad, isStore, 
  isCT_JAL, isCT_JALR, isLUI, isAUIPC, isECall, isFence, isIllegal,
  isCSR, isCSRImm, isTrapReturn = newElement()
}

case class IMemIF() extends Bundle{
  /*
  * Instruction Memory Interface:
  * Fetch a 32 bit instruction word through applied address
  * Confirm fetch by enabling fetchEnable.
  * 
  * instruction : 32 bit instruction from the memory
  * address : 32 bit address from which the instruction is fetched
  * fetchEnable : bool control signal to fetch core to memory
  * instructionReady : bool control signal from memory to core
  * 
  * NOTE: Some memory bus systems have both memories inside 
  * the same address space and only allow one memory access at once 
  */
  val instruction = in Bits(32 bits)
  val address = out Bits(32 bits)
  val fetchEnable = out Bool
  val instructionReady = in Bool
}

case class DMemIF() extends Bundle{
  /*
  * Read/Write a 32 bit word/half/byte from address space
  * 
  * address : 32 bit address of memory space to read/write from/to
  * readData : 32 bit data from memory, valid if dataReady = true
  * writeData : 32 bit data to memory, valid if readWrite = true
  * readWrite : bool indicating the transaction type (read on false, write on true)
  * enable : bool control signal to enable transaction
  * wrStrobe : 4 bit strobe to indicate the valid data bytes (see NOTE_STROBE for more)
  * dataReady : bool control signal from memory to core
  * 
  * NOTE_STROBE: valid strobes are 
  *   0001, 0010, 0100, 1000 - read byte
  *   0011, 1100 - read half
  *   1111 - read word
  * For RISC-V refer to the specification regarding the memory alignments
  * 
  * NOTE: Some memory bus systems have both memories inside 
  * the same address space and only allow one memory access at once
  */
  val address = out Bits(32 bits)
  val readData = in Bits(32 bits)
  val writeData = out Bits(32 bits)
  val readWrite = out Bool // false : read, true : write
  val enable = out Bool
  val wrStrobe = out Bits(4 bits)
  val dataReady = in Bool
}

case class MemoryIF() extends Bundle{
  /*
  * Memory interface for instruction and data memory
  * Can be combined and multiplexed for a bus containing both memories
  * Supporting havard and von-neumann architecture
  */
  val IMem = IMemIF()
  val DMem = DMemIF()
}

case class CoreIO() extends Bundle{
  // memory bus access
  val memIF = MemoryIF()
  // cpu halted through ecall
  val halted = out Bool
  // sync signal, asserted when core is in fetch state
  val fetchSync = out Bool
  // halting signals for external, memory mapped shutdown
  val halt = in Bool
  val haltErr = in Bool
  val dbgState = out Bits(4 bits)
  // interrupt timer
  val irqTimer = in Bool
}

// case class RVFI(formal : Boolean = false) extends Bundle{
//   if(formal){
//     val valid = out Bits(1 bits)
//     val order = out UInt(64 bits)
//     val insn = out Bits(32 bits)
//     val trap = out Bool 
//     val halt = out Bool
//     val intr = out Bits(1 bits)
//     val mode = out Bits(2 bits)
//     val ixl = out Bits(2 bits)

//     val rs1_addr = out UInt(5 bits)
//     val rs2_addr = out UInt(5 bits)
//     val rs1_rdata = out Bits(32 bits)
//     val rs2_rdata = out Bits(32 bits)

//     val rd_addr = out UInt(5 bits)
//     val rd_wdata = out Bits(32 bits)

//     val pc_rdata = out UInt(32 bits)
//     val pc_wdata = out UInt(32 bits)

//     val mem_addr = out UInt(32 bits)
//     val mem_rmask = out UInt(4 bits)
//     val mem_wmask = out UInt(4 bits)
//     val mem_rdata = out Bits(32 bits)
//     val mem_wdata = out Bits(32 bits)
//   }
// }

/*
 * RV32I_Zicsr Implementation 
 * Interfacing with a simple memory interface with valid-ready signaling
 * Also having input for external cpu halts
 * Outputting fetch synchronization signal and halting state
 * Offering debug state output of fsm
 */
class RiscV32Core(startVector : BigInt, formal : Boolean = false) extends Component{
  // IO Definition
  val io = new CoreIO()
  // val rvfi = new RVFI()

  // if(formal){
    // val rvfi = new RVFI()
  val rvfi = new Bundle{
    val valid = out Bits(1 bits)
    val order = out UInt(64 bits)
    val insn = out Bits(32 bits)
    val trap = out Bool 
    val halt = out Bool
    val intr = out Bits(1 bits)
    val mode = out Bits(2 bits)
    val ixl = out Bits(2 bits)

    val rs1_addr = out UInt(5 bits)
    val rs2_addr = out UInt(5 bits)
    val rs1_rdata = out Bits(32 bits)
    val rs2_rdata = out Bits(32 bits)

    val rd_addr = out UInt(5 bits)
    val rd_wdata = out Bits(32 bits)

    val pc_rdata = out Bits(32 bits)
    val pc_wdata = out Bits(32 bits)

    val mem_addr = out Bits(32 bits)
    val mem_rmask = out Bits(4 bits)
    val mem_wmask = out Bits(4 bits)
    val mem_rdata = out Bits(32 bits)
    val mem_wdata = out Bits(32 bits)
  }
  // }else{
  //   val rvfi = null
  // }
  
  private final val DBG_EXT : Boolean = true
  private final val CSR_EXT : Boolean = true

  val programCounter = Reg(UInt(32 bits)) init(U(startVector, 32 bits))
  val pcValMux = UInt(32 bits)
  val rdDataMux = Bits(32 bits)
  val csrValMux = Bits(32 bits)
  val strobeMux = Bits(4 bits)

  val ctrlLogic = new ControlUnit(dbg = DBG_EXT)
  val irqPending = Bool
  io.fetchSync := ctrlLogic.io.fetchSync
  io.halted := ctrlLogic.io.halted
  ctrlLogic.io.halt := io.halt | io.haltErr
  ctrlLogic.io.irqPending := irqPending
  io.dbgState := ctrlLogic.io.dbgState
  
  io.memIF.IMem.address := programCounter.asBits
  io.memIF.IMem.fetchEnable := ctrlLogic.io.memCtrl.fetchEna
  ctrlLogic.io.memCtrl.instrRdy := io.memIF.IMem.instructionReady

  // next pc logic
  when(ctrlLogic.io.pcCtrl.enablePC){
    programCounter := pcValMux
  }

  val instructionBuffer = Reg(Bits(32 bits)) init(0)
  // if there is a new instruciton at the instruction memory interface
  // buffer it for the decoder
  when(ctrlLogic.io.fetchCtrl.sample){
    instructionBuffer := io.memIF.IMem.instruction
  }
  val decoder = new DecodeUnit()
  decoder.io.instruction := instructionBuffer
  ctrlLogic.io.validDecode := decoder.io.decodeValid
  ctrlLogic.io.instrType := decoder.io.instType
  ctrlLogic.io.instrFields := decoder.io.fields

  // registerfile with 32-bit datawidth
  // and 5-bit addresswidth
  val regs = new RV32RegisterFile(5, 32, 32)
  regs.io.rs1 := decoder.io.fields.src1.asUInt
  regs.io.rs2 := decoder.io.fields.src2.asUInt
  regs.io.wrEna := ctrlLogic.io.regCtrl.regFileWR
  regs.io.rd := decoder.io.fields.dest.asUInt
  regs.io.rdData := rdDataMux

  // 32-bit alu for riscv arithmetic operations
  val alu = new ArithmeticLogicUnit() 
  alu.io.operation.f3 := decoder.io.fields.funct3
  alu.io.operation.f7 := decoder.io.fields.funct7
  alu.io.operation.shamt := decoder.io.fields.shamt
  alu.io.operation.instr := decoder.io.instType
  alu.io.opA := ctrlLogic.io.aluCtrl.opA.mux(
    OpASelect.opReg1Data -> regs.io.rs1Data,
    OpASelect.opPC -> programCounter.asBits,
    OpASelect.opZero -> B(0, 32 bits)
  )
  alu.io.opB := ctrlLogic.io.aluCtrl.opB.mux(
    OpBSelect.opReg2Data -> regs.io.rs2Data,
    OpBSelect.opImmediate -> decoder.io.immediate,
    OpBSelect.opZero -> B(0, 32 bits)
  )
  ctrlLogic.io.aluCtrl.aluBranch := alu.io.output_bool

  // generate CSR logic only if class variable is set
  val CSRLogic = (CSR_EXT) generate new Area{
    //import controlFSM._
    import RVCSR._
    import CSRAccessType._
    import InstructionType._

    // input/output stage of CSR logic for read/write
    val addr = UInt(12 bits)
    //val rw = Bool // true means write
    val accessType = CSRAccessType()
    val ena = Bool // enable of CSR logic
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

    // CSR registers
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
      }.elsewhen(accessType === CSRset & decoder.io.csr_uimm =/= 0){
        toRegister := maskValue(toRegister, mask, newVal)
      }.elsewhen(accessType === CSRclear & decoder.io.csr_uimm =/= 0){
        // TODO & FIXME check if mask or wval needs to be negated for atomic csr clear
        toRegister := maskValue(toRegister, mask, ~newVal)
      }
    }

    // determine condition whether or not to execute the write to a register
    rdX0 := decoder.io.fields.dest === 0
    rs1X0 := decoder.io.fields.src1 === 0
    uimmZero := decoder.io.csr_uimm === 0
    chooseOperand := decoder.io.instType === isCSR
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
          // not masking mepc[1:0] (therefore allowing non-zero values for mepc[1:0]) allows riscv-formal to find issues for branches
          // to show misbehavior use next line with default csr masks instead of the mepc masks
          //csrWriteAccess(toRegister = mepc, mask = DEFAULT_CSR_MASK, wval & DEFAULT_CSR_MASK)
          csrWriteAccess(toRegister = mepc, mask = MEPC_WRITE_MASK, wval & MEPC_WRITE_MASK)
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
    when(newFetch){
      minstret := (minstret.asUInt + 1).asBits
    }
    // increment mcycle every clock cycle
    mcycle := (mcycle.asUInt + 1).asBits
  }
  if(CSR_EXT){
    CSRLogic.addr := decoder.io.fields.csr.asUInt
    // CSRLogic.wval := // MUX : MuxCSRInstruction, rs1Data, U(CSRUImmediate, 32 bits)
    CSRLogic.accessType := decoder.io.csrType
    CSRLogic.newFetch := ctrlLogic.io.csrCtrl.newFetch
    CSRLogic.ena := ctrlLogic.io.csrCtrl.enable
    irqPending := CSRLogic.mip(MIP_MTIP) & CSRLogic.mie(MIP_MTIP) & CSRLogic.mstatus(MSTATUS_MIE)
    csrValMux := ctrlLogic.io.csrCtrl.writeSelect.mux(
      CSRDataSelect.reg1Data -> regs.io.rs1Data,
      CSRDataSelect.csrImmData -> B(decoder.io.csr_uimm, 32 bits)
    )
    CSRLogic.wval := csrValMux
    // direct RW for csr registers
    val mcauseMux = Bits(32 bits)
    mcauseMux := ctrlLogic.io.csrCtrl.mcauseSelect.mux(
      MCauseSelect.trapInstrAddrMisalign -> RVCSR.TRAP_EXC_INSTR_ADDR_MISALIGN,
      MCauseSelect.trapIllegalInstr -> RVCSR.TRAP_EXC_ILLEGAL_INSTR,
      MCauseSelect.trapECallMachine -> RVCSR.TRAP_EXC_ECALL_M_MODE,
      MCauseSelect.trapMachineTimerIRQ -> RVCSR.TRAP_MACHINE_TIMER_INTERRUPT
      // default -> B(0, 32 bits)
    )

    when(ctrlLogic.io.trapEntry){
      // CSRLogic.mcause := RVCSR.TRAP_EXC_ECALL_M_MODE
      CSRLogic.mcause := mcauseMux
      CSRLogic.mtval := (programCounter - 4).asBits
    }
    when(ctrlLogic.io.trapExit){
      CSRLogic.mstatus(MSTATUS_MIE) := CSRLogic.mstatus(MSTATUS_MPIE)
      CSRLogic.mstatus(MSTATUS_MPIE) := True
    }
    when(ctrlLogic.io.irqEntry){
      CSRLogic.mstatus(MSTATUS_MPIE) := CSRLogic.mstatus(MSTATUS_MIE) // save old irq enable
      CSRLogic.mstatus(MSTATUS_MIE) := False // disable interrupts while in traphandler per default
      // CSRLogic.mcause := B(32 bits, 31->true, default->false) | 7 // 7 = Machine timer interrupt
      CSRLogic.mcause := mcauseMux
      CSRLogic.mtval := (programCounter - 4).asBits // last valid instruction before irq
      CSRLogic.mepc := programCounter.asBits // next pc to execute after irq handler
    }
  } else{
    irqPending := False
    csrValMux := B(0, 32 bits)
  }

  /*
  * Data memory interface
  */
  io.memIF.DMem.address := alu.io.output
  io.memIF.DMem.writeData := regs.io.rs2Data
  io.memIF.DMem.readWrite := ctrlLogic.io.memCtrl.readWriteData
  io.memIF.DMem.enable := ctrlLogic.io.memCtrl.dataEna
  io.memIF.DMem.wrStrobe := ctrlLogic.io.memCtrl.strobeSelect.mux(
    // MemoryStrobeSelect.byte -> (B(1, 4 bits) |<< U(regs.io.rs1Data(1 downto 0), 2 bits)),
    MemoryStrobeSelect.byte -> B"0001",
    // MemoryStrobeSelect.halfWord -> (regs.io.rs1Data(1) ? B"1100" | B"0011"),
    // MemoryStrobeSelect.halfWord -> (alu.io.output(1) ? B"1100" | B"0011"),
    MemoryStrobeSelect.halfWord -> B"0011",
    MemoryStrobeSelect.word -> B"1111"
  )
  ctrlLogic.io.memCtrl.dataRdy := io.memIF.DMem.dataReady

  // new program counter values
  // either +4, jump-target, branch-target
  val incrPC = UInt(32 bits)
  val jalTarget = UInt(32 bits)
  // val jalTmpTarget = UInt(32 bits)
  val jalrTarget = UInt(32 bits)
  val branchTarget = UInt(32 bits)
  val trapTarget = UInt(32 bits)
  val mretTarget = UInt(32 bits)
  incrPC := programCounter + 4
  // TODO: maybe intoSInt instead asSInt here
  jalTarget := programCounter - 4 + decoder.io.immediate.asUInt // -4 because after fetch we increased PC
  //jalTmpTarget := jalTarget.asUInt
  jalrTarget := ((decoder.io.immediate.asUInt + regs.io.rs1Data.asUInt).asBits & ~B(1, 32 bits)).asUInt
  branchTarget := programCounter + decoder.io.immediate.asUInt - 4 // -4 because after fetch we increased PC
  trapTarget := U(CSRLogic.mtvec(31 downto 2) << 2, 32 bits)
  mretTarget := CSRLogic.mepc.asUInt
  pcValMux := ctrlLogic.io.pcCtrl.pcValSel.mux(
    PCSelect.incrementPC -> incrPC,
    PCSelect.jalTarget -> jalTarget,
    PCSelect.jalrTarget -> jalrTarget,
    PCSelect.branchTarget -> branchTarget,
    PCSelect.trapEntryTarget -> trapTarget,
    PCSelect.trapExitTarget -> mretTarget
  )

  val jalMisalign = (jalTarget % 4 === 0) ? False | True
  val jalrMisalign = (jalrTarget % 4 === 0) ? False | True
  val branchMisalign = (branchTarget % 4 === 0) ? False | True
  // misalign exception signals for ctrl logic
  ctrlLogic.io.exceptions.misalignedJumpTarget := jalMisalign
  ctrlLogic.io.exceptions.misalignedJumpLinkTarget := jalrMisalign
  ctrlLogic.io.exceptions.misalignedBranchTarget := branchMisalign


  // Load data sign extension for signed loads
  val extMemData = Bits(32 bits)
  switch(decoder.io.instType){
    is(InstructionType.isLoad){
      switch(decoder.io.fields.funct3){
        is(RVOpcode.F3_LB){
          extMemData := S(io.memIF.DMem.readData(7 downto 0), 32 bits).asBits
        }
        is(RVOpcode.F3_LH){
          extMemData := S(io.memIF.DMem.readData(15 downto 0), 32 bits).asBits
        }
        is(RVOpcode.F3_LBU){
          extMemData := U(io.memIF.DMem.readData(7 downto 0), 32 bits).asBits
        }
        is(RVOpcode.F3_LHU){
          extMemData := U(io.memIF.DMem.readData(15 downto 0), 32 bits).asBits
        }
        default{
          extMemData := io.memIF.DMem.readData
        }
      }
    }
    default{
      extMemData := io.memIF.DMem.readData
    }
  }

  rdDataMux := ctrlLogic.io.regCtrl.regDestSel.mux(
    DestDataSelect.aluRes -> alu.io.output,
    DestDataSelect.aluBool -> B(alu.io.output_bool,32 bits),
    DestDataSelect.memReadData -> extMemData,
    DestDataSelect.csrReadData -> CSRLogic.rval
  )

  if(formal){
    // RVF
    val rvfi_order = Reg(UInt(64 bits)) init(0)
    val rvfi_insn = Reg(Bits(32 bits)) init(0)
    val rvfi_trap = Reg(Bool) init(False)
    val rvfi_intr = Reg(Bits(1 bits)) init(0)
    val rvfi_mode = Reg(Bits(2 bits)) init(3)
    val rvfi_ixl = Reg(Bits(2 bits)) init(1)

    val rvfi_rs1_addr = Reg(UInt(5 bits)) init(0)
    val rvfi_rs2_addr = Reg(UInt(5 bits)) init(0)
    val rvfi_rs1_rdata = Reg(Bits(32 bits)) init(0)
    val rvfi_rs2_rdata = Reg(Bits(32 bits)) init(0)

    val rvfi_rd_addr = Reg(UInt(5 bits)) init(0)
    val rvfi_rd_wdata = Reg(Bits(32 bits)) init(0)

    val rvfi_pc_rdata = Reg(Bits(32 bits)) init(0)
    val rvfi_pc_Wdata = Reg(Bits(32 bits)) init(0)

    val rvfi_mem_addr = Reg(Bits(32 bits)) init(0)
    val rvfi_mem_rmask = Reg(Bits(4 bits)) init(0)
    val rvfi_mem_wmask = Reg(Bits(4 bits)) init(0)
    val rvfi_mem_rdata = Reg(Bits(32 bits)) init(0)
    val rvfi_mem_wdata = Reg(Bits(32 bits)) init(0)

    val validOnce = Reg(Bool) init(True)

    // order
    when(io.dbgState === 1 & !validOnce){
        rvfi.order := rvfi_order + 1
        rvfi_order := rvfi_order + 1
    }.otherwise{
      rvfi.order := rvfi_order
    }

    // valid + insn
    when(io.dbgState === 1){
      rvfi_mem_wdata := 0
      rvfi_mem_rdata := 0
      rvfi_mem_rmask := 0
      rvfi_mem_wmask := 0
      when(!validOnce){
        rvfi.valid := 1
        rvfi.order := rvfi_order + 1
        rvfi_order := rvfi_order + 1
        validOnce := True
      }.otherwise{
        rvfi.valid := 0
      }
      when(io.memIF.IMem.instructionReady){
        rvfi_insn := io.memIF.IMem.instruction
      }
    }.otherwise{
      when(io.dbgState === 2){
        validOnce := False
      }
      rvfi.order := rvfi_order
      rvfi.valid := 0
    }

    // Trap
    when(rvfi.valid === 1){
      rvfi_trap := False
    }
    when(io.dbgState === 6){
      rvfi_trap := True
    }
    when(io.dbgState === 7){
      rvfi_trap := True
    }

    // PC
    when(io.dbgState === 1){
      rvfi_pc_rdata := rvfi.pc_wdata
      rvfi.pc_wdata := io.memIF.IMem.address
    }otherwise{
      rvfi.pc_wdata := rvfi_pc_rdata
    }

    // Mem
    when(io.memIF.DMem.dataReady){
      rvfi_mem_addr := io.memIF.DMem.address
      // when(io.sb.SBwrite){
      when(io.memIF.DMem.readWrite){
        rvfi_mem_wdata := io.memIF.DMem.writeData
      }
      when(io.memIF.DMem.readWrite){
        rvfi_mem_wmask := io.memIF.DMem.wrStrobe
      }.otherwise{
        rvfi_mem_rmask := io.memIF.DMem.wrStrobe
      }
    }
    // Mem Writeback
    when(io.memIF.DMem.dataReady & io.dbgState === 4){
      rvfi_mem_rdata := io.memIF.DMem.readData
    }
    // Regs
    when(io.dbgState === 1){
      rvfi_rd_addr := 0
      rvfi_rd_wdata := 0
      rvfi_rs1_addr := 0
      rvfi_rs2_addr := 0
      rvfi_rs1_rdata := 0
      rvfi_rs2_rdata := 0
    }
    when(io.dbgState === 3){
      rvfi_rs1_addr := regs.io.rs1
      rvfi_rs2_addr := regs.io.rs2
      rvfi_rs1_rdata := regs.io.rs1Data
      rvfi_rs2_rdata := regs.io.rs2Data
    }
    when(regs.io.wrEna){
      rvfi_rd_addr := regs.io.rd
      when(regs.io.rd === 0){
        rvfi_rd_wdata := 0
      }.otherwise{
        rvfi_rd_wdata := regs.io.rdData
      }
    }

    // RVFI Outputs
    rvfi.insn := rvfi_insn
    rvfi.halt := io.halted
    rvfi.trap := rvfi_trap
    rvfi.intr := rvfi_intr
    rvfi.mode := rvfi_mode
    rvfi.ixl := rvfi_ixl

    rvfi.rs1_addr := rvfi_rs1_addr
    rvfi.rs2_addr := rvfi_rs2_addr
    rvfi.rs1_rdata := rvfi_rs1_rdata
    rvfi.rs2_rdata := rvfi_rs2_rdata

    rvfi.rd_addr := rvfi_rd_addr
    rvfi.rd_wdata := rvfi_rd_wdata

    rvfi.pc_rdata := rvfi_pc_rdata

    rvfi.mem_addr := rvfi_mem_addr
    rvfi.mem_rmask := rvfi_mem_rmask
    rvfi.mem_wmask := rvfi_mem_wmask
    rvfi.mem_rdata := rvfi_mem_rdata
    rvfi.mem_wdata := rvfi_mem_wdata
  }
}

//Generate the Top Verilog
object RiscV32CoreTop {
  def main(args: Array[String]) {
    SpinalConfig(
      defaultClockDomainFrequency=FixedFrequency(12 MHz),
      targetDirectory = "rtl"
      ).generateVerilog(new RiscV32Core(0x80000000l))
      .printPruned()
  }
}

//Generate the Top Verilog for RVFI Interface
object RVFICore {
  def main(args: Array[String]) {
    SpinalConfig(
      defaultClockDomainFrequency=FixedFrequency(12 MHz),
      targetDirectory = "rtl/rvfi"
      ).generateVerilog(new RiscV32Core(0x80000000l, true))
      .printPruned()
  }
}
