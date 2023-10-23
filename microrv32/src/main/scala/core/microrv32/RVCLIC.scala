package core.microrv32

import spinal.core._
import spinal.lib.slave
import core.microrv32.bus._

/*
* Implements a Core Local Interrupt Controller
* Currently serving timer interrupts to the RV32 core
* Memory mapped registers mtime and mtimecmp on local addresses 0xbff8 and 0x4000 respectively:
* 
*       local address | mode | description
*       ==============+======+============
*          0xbff8     | RO   | mtime (lo) [31:0]
*          0xbff8 + 4 | RO   | mtime (hi) [63:32]
*          0x4000     | RW   | mtimecmp (lo) [31:0]
*          0x4000 + 4 | RW   | mtimecmp (hi) [63:32]
* 
* Interrupt output irq goes high on mtime >= mtimecmp (respectively, low on mtimecmp > mtime)
* Excerpt from RISC-V privilege spec:
*       The mtime register has a 64-bit precision on all RV32 and RV64 systems. 
*       Platforms provide a 64-bit memory-mapped machine-mode timer compare 
*       register (mtimecmp), which causes a timer interrupt to be posted when 
*       the mtime register contains a value greater than or equal to the value 
*       in the mtimecmp register. The interrupt remains posted until mtimecmp 
*       becomes greater than mtime (typically as a result of writing mtimecmp).
*/
class RVCLIC() extends Component{
    val io = new Bundle{
        val irq = out Bool() // replace by bundle with timer, swirq (and external irq)?
        val sb = slave(SimpleBus(32,32))
        val sel = in Bool()
    }
    val MTIME_BASE = U"xbff8" // 0xbff8
    val MTIMECMP_BASE = U"x4000" // 0x4000
    // handling SB transactions
    val rdy = Reg(Bool) init(False)
    val intAddr = UInt(16 bits)
    val read = io.sb.SBvalid && io.sel && !io.sb.SBwrite
    val write = io.sb.SBvalid && io.sel && io.sb.SBwrite
    // custom registers/siganls
    val mtime = Reg(UInt(64 bits)) init(0) //RO
    val mtimecmp = Reg(UInt(64 bits)) init(0) //RW
    val timerIRQOut = Reg(Bool) init(False)

    val timerLogic = new Area{
        /*
        * Increment mtime on platform clock tick constantly.
        * From the RISC-V privilege spec:
        * mtime must increment at constant frequency[...]
        * The mtime register will wrap around if the count overflows.
        */
        mtime := mtime + 1
    }

    val timerIRQLogic = new Area{
        /*
        * From the RISC-V privilege spec:
        * Platforms provide a 64-bit memory-mapped machine-mode timer compare 
        * register (mtimecmp), which causes a timer interrupt to be posted when 
        * the mtime register contains a value greater than or equal to the value 
        * in the mtimecmp register. The interrupt remains posted until mtimecmp 
        * becomes greater than mtime (typically as a result of writing mtimecmp).
        */
        when(mtime >= mtimecmp){
            timerIRQOut := True
        }.otherwise{
            timerIRQOut := False
        }
    }

    val SBClicLogic = new Area{
        intAddr := io.sb.SBaddress(15 downto 0)
        val sbDataOutputReg = Reg(Bits(32 bits)) init(0)
        // default values
        sbDataOutputReg := 0 
        // address mapping logic
        /*
        *  local address | mode | description
        *  ==============+======+============
        *     0xbff8     | RO   | mtime (lo) [31:0]
        *     0xbff8 + 4 | RO   | mtime (hi) [63:32]
        *     0x4000     | RW   | mtimecmp (lo) [31:0]
        *     0x4000 + 4 | RW   | mtimecmp (hi) [63:32]
        */
        when(write){
            when(intAddr === MTIME_BASE + 0){
                // mtime [31:0] RO
            }.elsewhen(intAddr === MTIME_BASE + 4){
                // mtime [63:32] RO
            }.elsewhen(intAddr === MTIMECMP_BASE + 0){
                mtimecmp(31 downto 0) := U(io.sb.SBwdata, 32 bits)
            }.elsewhen(intAddr === MTIMECMP_BASE + 4){
                mtimecmp(63 downto 32) := U(io.sb.SBwdata, 32 bits)
            }
        }.elsewhen(read){
            when(intAddr === MTIME_BASE + 0){
                sbDataOutputReg := B(mtime(31 downto 0), 32 bits)
            }.elsewhen(intAddr === MTIME_BASE + 4){
                sbDataOutputReg := B(mtime(63 downto 32), 32 bits)
            }.elsewhen(intAddr === MTIMECMP_BASE + 0){
                sbDataOutputReg := B(mtimecmp(31 downto 0), 32 bits)
            }.elsewhen(intAddr === MTIMECMP_BASE + 4){
                sbDataOutputReg := B(mtimecmp(63 downto 32), 32 bits)
            }
        }
    }

    // bus ready signal -- transaction must be done in once cycle!
    rdy := False
    when((read | write) & io.sel){
        rdy := True
    }
    io.sb.SBready := rdy
    io.sb.SBrdata := SBClicLogic.sbDataOutputReg

    io.irq := timerIRQOut
}