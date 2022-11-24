package core.microrv32.rv32core

import spinal.core._
import spinal.lib._
import core.microrv32.CSRAccessType
import core.microrv32.RVCSR._

import core.microrv32.RV32CoreConfig

class CSRUnit(val cfg : RV32CoreConfig) extends Area {
    import core.microrv32.RVCSR._
    import core.microrv32.CSRAccessType._
    import core.microrv32.InstructionType._

    // input/output stage of CSR logic for read/write
    val addr = UInt(12 bits)
    //val rw = Bool // true means write
    val accessType = CSRAccessType()
    val ena = Bool // enable of CSR logic
    val wval = Bits(32 bits) // write data
    val rval = Reg(Bits(32 bits)) init(0) // read data
    val newFetch = Bool
    val isIllegalAccess = Bool
    // additional input signals / conditions of the instruction
    val newTimerIRQ = Bool // io.irqTimer
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
    val misa = Reg(Bits(32 bits)) init(generateMISAValue(cfg.hasMULDIV, cfg.supportCompressed)) // RW - ISA and extensions
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
      }.elsewhen(accessType === CSRset & !uimmZero){ //decoder.io.csr_uimm =/= 0
        toRegister := maskValue(toRegister, mask, newVal)
      }.elsewhen(accessType === CSRclear & !uimmZero){ //decoder.io.csr_uimm =/= 0
        // TODO & FIXME check if mask or wval needs to be negated for atomic csr clear
        toRegister := maskValue(toRegister, mask, ~newVal)
      }
    }

    // determine condition whether or not to execute the write to a register
    // rdX0 := decoder.io.fields.dest === 0
    // rs1X0 := decoder.io.fields.src1 === 0
    // uimmZero := decoder.io.csr_uimm === 0
    // chooseOperand := decoder.io.instType === isCSR
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
          // RW but dont support any runtime changes to the ISA therefore RO
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

          // when using IALIGN=16 (e.g. RV32IC) then this mask is also not quite valid
          // csrWriteAccess(toRegister = mepc, mask = MEPC_WRITE_MASK, wval & MEPC_WRITE_MASK)
          if(!cfg.supportCompressed){
            csrWriteAccess(toRegister = mepc, mask = MEPC_WRITE_MASK_32, wval & MEPC_WRITE_MASK_32)
          } else {
            csrWriteAccess(toRegister = mepc, mask = MEPC_WRITE_MASK_16, wval & MEPC_WRITE_MASK_16)
          }

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
    when(newTimerIRQ){//io.irqTimer
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