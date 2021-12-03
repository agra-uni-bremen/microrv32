package core.microrv32

import spinal.lib._
import spinal.core._
import spinal.core.Formal._


class Formal_Proof_Module(dataWidth : Int = 32, regLength : Int = 32, IALIGN : Int = 8, pipelineLength : Int = 5, branchDelay : Int = 3, ProofMode : Int = 0) extends Component{

  val rvfi1 = new Bundle{
    val valid = in Bits(1 bits)
    val order = in UInt(64 bits)
    val insn = in Bits(dataWidth bits)
    val trap = in Bool()
    val halt = in Bool()
    val intr = in Bits(1 bits)
    val mode = in Bits(2 bits)
    val ixl = in Bits(2 bits)

    val rs1_addr = in UInt(5 bits)
    val rs2_addr = in UInt(5 bits)
    val rs1_rdata = in Bits(dataWidth bits)
    val rs2_rdata = in Bits(dataWidth bits)

    val rd_addr = in UInt(5 bits)
    val rd_wdata = in Bits(dataWidth bits)

    val pc_rdata = in UInt(dataWidth bits)
    val pc_wdata = in UInt(dataWidth bits)

    val mem_addr = in UInt(dataWidth bits)
    val mem_rmask = in UInt(dataWidth/8 bits)
    val mem_wmask = in UInt(dataWidth/8 bits)
    val mem_rdata = in Bits(dataWidth bits)
    val mem_wdata = in Bits(dataWidth bits)
  }

  val state1 = new Bundle{
    val pc = in UInt(dataWidth bits)
    val regs = in Bits(dataWidth * regLength bits)
    // val csr = in Bits(dataWidth * regLength bits) // CSR Regs?!
    val fetch = in Bool()
  }

  val csr1 = new Bundle{
    val mtvec = in UInt(dataWidth bits) // Machine trap-handler base address
    val mepc  = in UInt(dataWidth bits) // Machine exception program counter -> Muss wohl geändert werden?!
    val mcause = in UInt(dataWidth bits) // Machine trap cause
    val mtval = in UInt(dataWidth bits) // Machine bad address or instruction -> Muss wohl geändert werden?!
  }

  val dbg = new Bundle{
    val checkPoint = out Bool()
    val check = out Bool()
    val insNr = out UInt(8 bits)
    val zeroRegError = out Bool()
    val pcMisalligned = out Bool()
    val regError = out Bool()
    val jumpError = out Bool()
    val memError = out Bool()
    val execError = out Bool()
    val trap = out Bool()
    val exception = out UInt(5 bits)
  }

  // Reset of DUT
  val ctrl = new Bundle{
    val reset1 = out Bool()
  }

  // Controls the reset of connected cores, depending on the proof-mode
  val resetCtrl = new Area{
    if(ProofMode == 0){
      ctrl.reset1 := False
    }else{
      ctrl.reset1 := clockDomain.isResetActive
    }
  }
  

  // ready when first fetch and after every finished state transition
  val checkpoint = new Area{
    val firstFetch = Reg(Bool) init(False)
    val firstCheckPoint = Reg(Bool) init(False)
    val ready = Bool
    val check = Bool

    when(!clockDomain.isResetActive){
      when(rvfi1.valid === 1 || (state1.fetch && !firstFetch)){
        firstFetch := True
        ready := True
      }.otherwise{
        ready := False
      }
      when(ready === False && firstFetch){
        firstCheckPoint := True
      }
      check := (firstCheckPoint && rvfi1.valid === 1)
    }.otherwise{
      ready := False
      check := False
    }

    dbg.checkPoint := ready
    dbg.check := check
  }

  // Suche Begrenzen?! -> nachdem einmal überprüft wurde, kann auf weitere Überprüfungen verzichtet werden

  // Instruction decoding
  val instruction = new Area{
    val opcode = Bits(7 bits)
    val f3 = Bits(3 bits)
    val f7 = Bits(7 bits)
    val f12 = Bits(12 bits)
    val rs1 = Bits(5 bits)
    val rs2 = Bits(5 bits)
    val rd = Bits(5 bits)
    val shamt = Bits(5 bits)
    val IImm = Bits(32 bits)
    val BImm = Bits(32 bits)
    val SImm = Bits(32 bits)
    val UImm = Bits(32 bits)
    val JImm = Bits(32 bits)
    val loadAddress = UInt(dataWidth bits)
    val storeAddress = UInt(dataWidth bits)

    opcode := rvfi1.insn(6 downto 0)
    f3 := rvfi1.insn(14 downto 12)
    f7 := rvfi1.insn(31 downto 25)
    f12 := rvfi1.insn(31 downto 20)
    rs1 := rvfi1.insn(19 downto 15)
    rs2 := rvfi1.insn(24 downto 20)
    rd := rvfi1.insn(11 downto 7)
    shamt := rvfi1.insn(24 downto 20)
    IImm := S(rvfi1.insn(31), 21 bits) ## rvfi1.insn(30 downto 25) ## rvfi1.insn(24 downto 21) ## rvfi1.insn(20)
    BImm := S(rvfi1.insn(31), 20 bits) ## rvfi1.insn(7) ## rvfi1.insn(30 downto 25) ## rvfi1.insn(11 downto 8) ## B(0,1 bit)
    SImm := S(rvfi1.insn(31), 21 bits) ## rvfi1.insn(30 downto 25) ## rvfi1.insn(11 downto 8) ## rvfi1.insn(7)
    UImm := rvfi1.insn(31) ## rvfi1.insn(30 downto 20) ## rvfi1.insn(19 downto 12) ## B(0, 12 bits)
    JImm := S(B(rvfi1.insn(31) ## rvfi1.insn(19 downto 12) ## rvfi1.insn(20) ## rvfi1.insn(30 downto 25) ## rvfi1.insn(24 downto 21) ## B(0, 1 bit)),32 bits).asBits
    loadAddress := rvfi1.rs1_rdata.asUInt + IImm.asUInt
    storeAddress := rvfi1.rs1_rdata.asUInt + SImm.asUInt

    /* // csr extension  
    csr := instrSwapped(31 downto 20)
    csr_uimm := instrSwapped(19 downto 15)  
    */
  }
  
  // Evaluation of valid state
  val stateEval = new Area{
    val zeroRegError = Bool
    val pcMisalligned = Bool
    val valid = Bool
    val pastValid = Reg(Bool) init(False)
    zeroRegError := !(state1.regs(dataWidth - 1 downto 0) === 0)
    dbg.zeroRegError := zeroRegError

    pcMisalligned := !(state1.pc % 4 === 0)
    dbg.pcMisalligned := pcMisalligned

    when(checkpoint.ready){
      valid := !(zeroRegError || pcMisalligned)
      pastValid := valid
    }.otherwise{
      valid := False
    }
  }

  // Evaluation of correct instruction execution
  val insDecode = new Area{
    val validExec = Bool
    val check = Bool
    
    val insType = UInt(8 bits) // Codierung: 0 Unknown, 1 RI, 2 RR
    val insNr = UInt(8 bits)
    val regWrite = Bool
    val jump = Bool
    val memActive = Bool
    val loadAddressMisaligned = Bool
    val storeAddressMisaligned = Bool
    val trap = Bool
    val exception = UInt(5 bits)  // 0: none, 1: instruction address misaligned, 2: memory-address misaligned

    trap := False
    exception := 0 

    loadAddressMisaligned := False // (instruction.loadAddress === 0)
    storeAddressMisaligned := False
    if(IALIGN == 32){
      loadAddressMisaligned := (instruction.loadAddress % 4 =/= 0)
      storeAddressMisaligned := (instruction.storeAddress % 4 =/= 0)
    }
    if(IALIGN == 16){
      loadAddressMisaligned := (instruction.loadAddress % 2 =/= 0)
      storeAddressMisaligned := (instruction.storeAddress % 2 =/= 0)
    }

    switch(instruction.opcode){
      is(B"0010011"){  // Comp RI
        insType := 1
        regWrite := !(instruction.rd.asUInt === 0)
        jump := False
        memActive := False
        switch(instruction.f3){
          is(0){ // AddI
            insNr := 1
            when(
              rvfi1.rd_addr === instruction.rd.asUInt
              && rvfi1.rs1_addr === instruction.rs1.asUInt
              // && rvfi1.rs2_addr === 0
              && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata.asUInt + instruction.IImm.asUInt).asBits)
            ){
              validExec := True
            }.otherwise{
              validExec := False
            }
          }
          is(2){ // SLTI
            insNr := 2
            when(
              rvfi1.rd_addr === instruction.rd.asUInt
              && rvfi1.rs1_addr === instruction.rs1.asUInt
              // && rvfi1.rs2_addr === 0
              && (rvfi1.rd_addr === 0 || (rvfi1.rd_wdata === B(1,32 bits) && rvfi1.rs1_rdata.asSInt < instruction.IImm.asSInt) || (rvfi1.rd_wdata === B(0,32 bits) && !(rvfi1.rs1_rdata.asSInt < instruction.IImm.asSInt)))
            ){
              validExec := True
            }.otherwise{
              validExec := False
            }
          }
          is(3){ // SLTIU
            insNr := 3
            when(
              rvfi1.rd_addr === instruction.rd.asUInt
              && rvfi1.rs1_addr === instruction.rs1.asUInt
              // && rvfi1.rs2_addr === 0
              && (rvfi1.rd_addr === 0 || (rvfi1.rd_wdata === B(1,32 bits) && rvfi1.rs1_rdata.asUInt < instruction.IImm.asUInt) || (rvfi1.rd_wdata === B(0,32 bits) && !(rvfi1.rs1_rdata.asUInt < instruction.IImm.asUInt)))
            ){
              validExec := True
            }.otherwise{
              validExec := False
            }
          }
          is(4){ // XORI
            insNr := 4
            when(
              rvfi1.rd_addr === instruction.rd.asUInt
              && rvfi1.rs1_addr === instruction.rs1.asUInt
              // && rvfi1.rs2_addr === 0
              && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata ^ instruction.IImm))
            ){
              validExec := True
            }.otherwise{
              validExec := False
            }
          }
          is(6){ // ORI
            insNr := 5
            when(
              rvfi1.rd_addr === instruction.rd.asUInt
              && rvfi1.rs1_addr === instruction.rs1.asUInt
              // && rvfi1.rs2_addr === 0
              && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata | instruction.IImm))
            ){
              validExec := True
            }.otherwise{
              validExec := False
            }
          }
          is(7){ // ANDI
            insNr := 6
            when(
              rvfi1.rd_addr === instruction.rd.asUInt
              && rvfi1.rs1_addr === instruction.rs1.asUInt
              // && rvfi1.rs2_addr === 0
              && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata & instruction.IImm))
            ){
              validExec := True
            }.otherwise{
              validExec := False
            }
          }
          is(1){ // SLLI
            when(instruction.f7 === 0){
              insNr := 7
              when(
                rvfi1.rd_addr === instruction.rd.asUInt
                && rvfi1.rs1_addr === instruction.rs1.asUInt
                // && rvfi1.rs2_addr === 0
                && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata |<< instruction.shamt.asUInt))
              ){
                validExec := True
              }.otherwise{
                validExec := False
              }
            }.otherwise{
              // unknown
              insType := 0
              insNr := 0
              regWrite := False
              validExec := True
              trap := True
            }
          }
          is(5){
            switch(instruction.f7){
              is(0){ // SRLI
                insNr := 8
                when(
                  rvfi1.rd_addr === instruction.rd.asUInt
                  && rvfi1.rs1_addr === instruction.rs1.asUInt
                  // && rvfi1.rs2_addr === 0
                  && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata |>> instruction.shamt.asUInt))
                ){
                  validExec := True
                }.otherwise{
                  validExec := False
                }
              }
              is(B"0100000"){ // 
                insNr := 9
                when(
                  rvfi1.rd_addr === instruction.rd.asUInt
                  && rvfi1.rs1_addr === instruction.rs1.asUInt
                  // && rvfi1.rs2_addr === 0
                  && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata.asSInt >> instruction.shamt.asUInt).asBits)
                ){
                  validExec := True
                }.otherwise{
                  validExec := False
                }
              }
              default{
                // unknown
                insType := 0
                insNr := 0
                regWrite := False
                validExec := True
                trap := True
              }
            }
          }
        }
      }
      is(B"0110111"){  // Comp RI - LUI
        insType := 1
        regWrite := !(instruction.rd.asUInt === 0)
        jump := False
        memActive := False
        insNr := 10
        when(
          rvfi1.rd_addr === instruction.rd.asUInt
          // && rvfi1.rs1_addr === 0
          // && rvfi1.rs2_addr === 0
          && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === instruction.UImm)
        ){
          validExec := True
        }.otherwise{
          validExec := False
        }
      }
      is(B"0010111"){  // Comp RI - AUIPC
        insType := 1
        regWrite := !(instruction.rd.asUInt === 0)
        jump := False
        memActive := False
        insNr := 11
        when(
          rvfi1.rd_addr === instruction.rd.asUInt
          // && rvfi1.rs1_addr === 0
          // && rvfi1.rs2_addr === 0
          && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (state1.pc - 4 + instruction.UImm.asUInt).asBits)
        ){
          validExec := True
        }.otherwise{
          validExec := False
        }
      }
      is(B"0110011"){  // Comp RR
        insType := 2
        regWrite := !(instruction.rd.asUInt === 0)
        jump := False
        memActive := False
        switch(instruction.f3){
          is(0){
            switch(instruction.f7){
              is(B"0000000"){ // Add
                insNr := 12
                when(
                  rvfi1.rd_addr === instruction.rd.asUInt
                  && rvfi1.rs1_addr === instruction.rs1.asUInt
                  && rvfi1.rs2_addr === instruction.rs2.asUInt
                  && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata.asSInt + rvfi1.rs2_rdata.asSInt).asBits)
                ){
                  validExec := True
                }.otherwise{
                  validExec := False
                }
              }
              is(B"0100000"){ // Sub
                insNr := 13
                when(
                  rvfi1.rd_addr === instruction.rd.asUInt
                  && rvfi1.rs1_addr === instruction.rs1.asUInt
                  && rvfi1.rs2_addr === instruction.rs2.asUInt
                  && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata.asSInt - rvfi1.rs2_rdata.asSInt).asBits)
                ){
                  validExec := True
                }.otherwise{
                  validExec := False
                }
              }
              default{
                // unknown
                insType := 0
                insNr := 0
                regWrite := False
                validExec := True
                trap := True
              }
            }
          }
          is(1){ // SLL
            when(instruction.f7 === 0){
              insNr := 14
              when(
                rvfi1.rd_addr === instruction.rd.asUInt
                && rvfi1.rs1_addr === instruction.rs1.asUInt
                && rvfi1.rs2_addr === instruction.rs2.asUInt
                && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata |<< (rvfi1.rs2_rdata(4 downto 0).asUInt)))
              ){
                validExec := True
              }.otherwise{
                validExec := False
              }
            }.otherwise{
              // unknown
              insType := 0
              insNr := 0
              regWrite := False
              validExec := True
              trap := True
            }
          }
          is(2){ // SLT
            when(instruction.f7 === 0){
              insNr := 15
              when(
                rvfi1.rd_addr === instruction.rd.asUInt
                && rvfi1.rs1_addr === instruction.rs1.asUInt
                && rvfi1.rs2_addr === instruction.rs2.asUInt
                && (rvfi1.rd_addr === 0 || (rvfi1.rd_wdata === B(1,32 bits) && rvfi1.rs1_rdata.asSInt < rvfi1.rs2_rdata.asSInt) || (rvfi1.rd_wdata === B(0,32 bits) && !(rvfi1.rs1_rdata.asSInt < rvfi1.rs2_rdata.asSInt)))
              ){
                validExec := True
              }.otherwise{
                validExec := False
              }
            }.otherwise{
              // Unknown
              insType := 0
              insNr := 0
              regWrite := False
              validExec := True
              trap := True
            }
          }
          is(3){ // SLTU
            when(instruction.f7 === 0){
              insNr := 16
              when(
                rvfi1.rd_addr === instruction.rd.asUInt
                && rvfi1.rs1_addr === instruction.rs1.asUInt
                && rvfi1.rs2_addr === instruction.rs2.asUInt
                && (rvfi1.rd_addr === 0 || (rvfi1.rd_wdata === B(1,32 bits) && rvfi1.rs1_rdata.asUInt < rvfi1.rs2_rdata.asUInt) || (rvfi1.rd_wdata === B(0,32 bits) && !(rvfi1.rs1_rdata.asUInt < rvfi1.rs2_rdata.asUInt)))
              ){
                validExec := True
              }.otherwise{
                validExec := False
              }
            }.otherwise{
              // unknown
              insType := 0
              insNr := 0
              regWrite := False
              validExec := True
              trap := True
            }
          }
          is(4){ // XOR
            when(instruction.f7 === 0){
              insNr := 17
              when(
                rvfi1.rd_addr === instruction.rd.asUInt
                && rvfi1.rs1_addr === instruction.rs1.asUInt
                && rvfi1.rs2_addr === instruction.rs2.asUInt
                && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata ^ rvfi1.rs2_rdata))
              ){
                validExec := True
              }.otherwise{
                validExec := False
              }
            }.otherwise{
              // unknown
              insType := 0
              insNr := 0
              regWrite := False
              validExec := True
              trap := True
            }
          }
          is(5){
            switch(instruction.f7){
              is(0){ // SRL
                insNr := 18
                when(
                  rvfi1.rd_addr === instruction.rd.asUInt
                  && rvfi1.rs1_addr === instruction.rs1.asUInt
                  && rvfi1.rs2_addr === instruction.rs2.asUInt
                  && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata |>> rvfi1.rs2_rdata(4 downto 0).asUInt))
                ){
                  validExec := True
                }.otherwise{
                  validExec := False
                }
              }
              is(B"0100000"){ // SRA
                insNr := 19
                when(
                  rvfi1.rd_addr === instruction.rd.asUInt
                  && rvfi1.rs1_addr === instruction.rs1.asUInt
                  && rvfi1.rs2_addr === instruction.rs2.asUInt
                  && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata.asSInt >> rvfi1.rs2_rdata(4 downto 0).asUInt).asBits)
                ){
                  validExec := True
                }.otherwise{
                  validExec := False
                }
              }
              default{
                // unknown
                insType := 0
                insNr := 0
                regWrite := False
                validExec := True
                trap := True
              }
            }
          }
          is(6){ // OR
            when(instruction.f7 === 0){
              insNr := 20
              when(
                rvfi1.rd_addr === instruction.rd.asUInt
                && rvfi1.rs1_addr === instruction.rs1.asUInt
                && rvfi1.rs2_addr === instruction.rs2.asUInt
                && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata | rvfi1.rs2_rdata))
              ){
                validExec := True
              }.otherwise{
                validExec := False
              }
            }.otherwise{
              // unknown
              insType := 0
              insNr := 0
              regWrite := False
              validExec := True
              trap := True
            }
          }
          is(7){ // AND
            when(instruction.f7 === 0){
              insNr := 21
              when(
                rvfi1.rd_addr === instruction.rd.asUInt
                && rvfi1.rs1_addr === instruction.rs1.asUInt
                && rvfi1.rs2_addr === instruction.rs2.asUInt
                && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.rs1_rdata & rvfi1.rs2_rdata))
              ){
                validExec := True
              }.otherwise{
                validExec := False
              }
            }.otherwise{
              // unknown
              insType := 0
              insNr := 0
              regWrite := False
              validExec := True
              trap := True
            }
          }
        }
      }
      is(B"1101111"){  // ContTrans - JAL
        insType := 3
        regWrite := !(instruction.rd.asUInt === 0)
        jump := True
        trap := !((rvfi1.pc_rdata + instruction.JImm.asUInt) % 4 === 0)
        when(trap){
          exception := 1
        }
        memActive := False
        insNr := 22
        when(
          // rvfi1.rs1_addr === 0
          // && rvfi1.rs2_addr === 0
          // &&
          ((trap
              && rvfi1.rd_addr === 0
              && rvfi1.trap === True
              && rvfi1.pc_wdata === U(csr1.mtvec(31 downto 2).asBits << 2, 32 bits) // Traphandler Adresse - lowest Bits determine the mode
            ) || (!trap
              && rvfi1.rd_addr === instruction.rd.asUInt
              && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.pc_rdata + 4).asBits)
              && rvfi1.pc_wdata === (rvfi1.pc_rdata + instruction.JImm.asUInt)
              ))
        ){
          validExec := True
        }.otherwise{
          validExec := False
        }
      }
      is(B"1100111"){  // ContTrans - JALR
        insType := 3
        regWrite := !(instruction.rd.asUInt === 0)
        jump := True
        trap := !(U((rvfi1.rs1_rdata.asUInt + instruction.IImm.asUInt).asBits(dataWidth - 1 downto 1) ## B(0, 1 bits)) % 4 === 0)
        when(trap){
          exception := 1
        }
        memActive := False
        when(instruction.f3 === 0){
          insNr := 23
          when(
            // rvfi1.rs2_addr === 0
            // &&
            rvfi1.rs1_addr === instruction.rs1.asUInt
            && ((trap
              && rvfi1.rd_addr === 0
              && rvfi1.trap === True
              && rvfi1.pc_wdata === U(csr1.mtvec(31 downto 2).asBits << 2, 32 bits) // Traphandler Adresse - lowest Bits determine the mode
            ) || (!trap
              && rvfi1.rd_addr === instruction.rd.asUInt
              && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === (rvfi1.pc_rdata + 4).asBits))
              && rvfi1.pc_wdata === U((rvfi1.rs1_rdata.asUInt + instruction.IImm.asUInt).asBits(dataWidth - 1 downto 1) ## B(0, 1 bits))
            )
          ){
            validExec := True
          }.otherwise{
            validExec := False
          }
        }.otherwise{
          // unknown
          insType := 0
          insNr := 0
          regWrite := False
          validExec := True
          trap := True
        }
      }
      is(B"1100011"){  // ContTrans
        insType := 3
        regWrite := False
        memActive := False

        switch(instruction.f3){
          is(0){  // BEQ
        	  insNr := 24
            jump := (rvfi1.rs1_rdata === rvfi1.rs2_rdata)
            trap := (jump && !(instruction.BImm.asUInt % 4 === 0))
            when(trap){
              exception := 1
            } 
            validExec := (
              rvfi1.rd_addr === 0 && rvfi1.rd_wdata === 0
              && rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rs2_addr === instruction.rs2.asUInt
              && (
                (
                  trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec(31 downto 2).asBits << 2, 32 bits) // Traphandler Adresse - lowest Bits determine the mode
                ) || (
                  !trap
                  && (!jump || rvfi1.pc_wdata === rvfi1.pc_rdata + instruction.BImm.asUInt)
                )
              )
            )
          }
          is(1){  // BNE
        	  insNr := 25
            jump := (rvfi1.rs1_rdata =/= rvfi1.rs2_rdata)
            trap := (jump && !(instruction.BImm.asUInt % 4 === 0))
            when(trap){
              exception := 1
            } 
            validExec := (
              rvfi1.rd_addr === 0 && rvfi1.rd_wdata === 0
              && rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rs2_addr === instruction.rs2.asUInt
              && (
                (
                  trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec(31 downto 2).asBits << 2, 32 bits) // Traphandler Adresse - lowest Bits determine the mode
                ) || (
                  !trap
                  && (!jump || rvfi1.pc_wdata === rvfi1.pc_rdata + instruction.BImm.asUInt)
                )
              )
            )
          }
          is(4){  // BLT
        	  insNr := 26
            jump := (rvfi1.rs1_rdata.asSInt < rvfi1.rs2_rdata.asSInt)
            trap := (jump && !(instruction.BImm.asUInt % 4 === 0))
            when(trap){
              exception := 1
            } 
            validExec := (
              rvfi1.rd_addr === 0 && rvfi1.rd_wdata === 0
              && rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rs2_addr === instruction.rs2.asUInt
              && (
                (
                  trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec(31 downto 2).asBits << 2, 32 bits) // Traphandler Adresse - lowest Bits determine the mode
                ) || (
                  !trap
                  && (!jump || rvfi1.pc_wdata === rvfi1.pc_rdata + instruction.BImm.asUInt)
                )
              )
            )
          }
          is(5){  // BGE
        	  insNr := 27
            jump := (rvfi1.rs1_rdata.asSInt >= rvfi1.rs2_rdata.asSInt)
            trap := (jump && !(instruction.BImm.asUInt % 4 === 0))
            when(trap){
              exception := 1
            } 
            validExec := (
              rvfi1.rd_addr === 0 && rvfi1.rd_wdata === 0
              && rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rs2_addr === instruction.rs2.asUInt
              && (
                (
                  trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec(31 downto 2).asBits << 2, 32 bits) // Traphandler Adresse - lowest Bits determine the mode
                ) || (
                  !trap
                  && (!jump || rvfi1.pc_wdata === rvfi1.pc_rdata + instruction.BImm.asUInt)
                )
              )
            )
          }
          is(6){  // BLTU
        	  insNr := 28
            jump := (rvfi1.rs1_rdata.asUInt < rvfi1.rs2_rdata.asUInt)
            trap := (jump && !(instruction.BImm.asUInt % 4 === 0))
            when(trap){
              exception := 1
            } 
            validExec := (
              rvfi1.rd_addr === 0 && rvfi1.rd_wdata === 0
              && rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rs2_addr === instruction.rs2.asUInt
              && (
                (
                  trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec(31 downto 2).asBits << 2, 32 bits) // Traphandler Adresse - lowest Bits determine the mode
                ) || (
                  !trap
                  && (!jump || rvfi1.pc_wdata === rvfi1.pc_rdata + instruction.BImm.asUInt)
                )
              )
            )
          }
          is(7){  // BGEU
        	  insNr := 29
            jump := (rvfi1.rs1_rdata.asUInt >= rvfi1.rs2_rdata.asUInt)
            trap := (jump && !(instruction.BImm.asUInt % 4 === 0))
            when(trap){
              exception := 1
            } 
            validExec := (
              rvfi1.rd_addr === 0 && rvfi1.rd_wdata === 0
              && rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rs2_addr === instruction.rs2.asUInt
              && (
                (
                  trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec(31 downto 2).asBits << 2, 32 bits) // Traphandler Adresse - lowest Bits determine the mode
                ) || (
                  !trap
                  && (!jump || rvfi1.pc_wdata === rvfi1.pc_rdata + instruction.BImm.asUInt)
                )
              )
            )
          }
          default{
            // unknown
            insType := 0
            insNr := 0
            jump := False
            regWrite := False
            validExec := True
            trap := True
          }
        }
      }
      is(B"0000011"){  // LS - Load
        insType := 4
        jump := False
        trap := loadAddressMisaligned
        when(trap){
          exception := 2
        }
        regWrite := !(instruction.rd.asUInt === 0 || trap)
        memActive := !trap
        
        switch(instruction.f3){
          is(0){  // LB
        	  insNr := 30
            validExec := (
              rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rd_addr === instruction.rd.asUInt 
              && (
                (trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec((dataWidth - 1) downto 2).asBits << 2, dataWidth bits) // Traphandler Adresse
                ) || (
                  !trap
                  && rvfi1.mem_addr === instruction.loadAddress
                  && rvfi1.mem_rmask === 1
                  && rvfi1.mem_wmask === 0
                  && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === S(rvfi1.mem_rdata(7 downto 0), dataWidth bits).asBits)
                  && rvfi1.mem_wdata === 0
                )
              )
            )
          }
          is(1){  // LH
        	  insNr := 31
            validExec := (
              rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rd_addr === instruction.rd.asUInt 
              && (
                (trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec((dataWidth - 1) downto 2).asBits << 2, dataWidth bits) // Traphandler Adresse
                ) || (
                  !trap
                  && rvfi1.mem_addr === instruction.loadAddress
                  && rvfi1.mem_rmask === 3
                  && rvfi1.mem_wmask === 0
                  && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === S(rvfi1.mem_rdata(15 downto 0), dataWidth bits).asBits)
                  && rvfi1.mem_wdata === 0
                )
              )
            )
          }
          is(2){  // LW
        	  insNr := 32
            validExec := (
              rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rd_addr === instruction.rd.asUInt 
              && (
                (trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec((dataWidth - 1) downto 2).asBits << 2, dataWidth bits) // Traphandler Adresse
                ) || (
                  !trap
                  && rvfi1.mem_addr === instruction.loadAddress
                  && rvfi1.mem_rmask === 15
                  && rvfi1.mem_wmask === 0
                  && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === B(rvfi1.mem_rdata(31 downto 0), dataWidth bits))
                  && rvfi1.mem_wdata === 0
                )
              )
            )
          }
          is(4){  // LBU
        	  insNr := 33
            validExec := (
              rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rd_addr === instruction.rd.asUInt 
              && (
                (trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec((dataWidth - 1) downto 2).asBits << 2, dataWidth bits) // Traphandler Adresse
                ) || (
                  !trap
                  && rvfi1.mem_addr === instruction.loadAddress
                  && rvfi1.mem_rmask === 1
                  && rvfi1.mem_wmask === 0
                  && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === U(rvfi1.mem_rdata(7 downto 0), dataWidth bits).asBits)
                  && rvfi1.mem_wdata === 0
                )
              )
            )
          }
          is(5){  // LHU
        	  insNr := 34
            validExec := (
              rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rd_addr === instruction.rd.asUInt 
              && (
                (trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec((dataWidth - 1) downto 2).asBits << 2, dataWidth bits) // Traphandler Adresse
                ) || (
                  !trap
                  && rvfi1.mem_addr === instruction.loadAddress
                  && rvfi1.mem_rmask === 3
                  && rvfi1.mem_wmask === 0
                  && (rvfi1.rd_addr === 0 || rvfi1.rd_wdata === U(rvfi1.mem_rdata(15 downto 0), dataWidth bits).asBits)
                  && rvfi1.mem_wdata === 0
                )
              )
            )
          }
          default{
            // unknown
            insType := 0
            insNr := 0
            jump := False
            regWrite := False
            validExec := True
            trap := True
          }
        }
      }
      is(B"0100011"){  // LS - Store
        insType := 4
        jump := False
        regWrite := False
        trap := storeAddressMisaligned
        when(trap){
          exception := 2
        }
        memActive := !trap
        
        switch(instruction.f3){
          is(0){  // SB
        	  insNr := 35
            validExec := (
              rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rs2_addr === instruction.rs2.asUInt 
              && (
                (trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec((dataWidth - 1) downto 2).asBits << 2, dataWidth bits) // Traphandler Adresse
                ) || (
                  !trap
                  && rvfi1.mem_addr === instruction.storeAddress
                  && rvfi1.mem_rmask === 0
                  && rvfi1.mem_wmask === 1
                  && rvfi1.mem_wdata === rvfi1.rs2_rdata
                )
              )
            )
          }
          is(1){  // SH
        	  insNr := 36
            validExec := (
              rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rs2_addr === instruction.rs2.asUInt 
              && (
                (trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec((dataWidth - 1) downto 2).asBits << 2, dataWidth bits) // Traphandler Adresse
                ) || (
                  !trap
                  && rvfi1.mem_addr === instruction.storeAddress
                  && rvfi1.mem_rmask === 0
                  && rvfi1.mem_wmask === 3
                  && rvfi1.mem_wdata === rvfi1.rs2_rdata
                )
              )
            )
          }
          is(2){  // SW
        	  insNr := 37
            validExec := (
              rvfi1.rs1_addr === instruction.rs1.asUInt
              && rvfi1.rs2_addr === instruction.rs2.asUInt 
              && (
                (trap
                  && rvfi1.trap === True
                  && rvfi1.pc_wdata === U(csr1.mtvec((dataWidth - 1) downto 2).asBits << 2, dataWidth bits) // Traphandler Adresse
                ) || (
                  !trap
                  && rvfi1.mem_addr === instruction.storeAddress
                  && rvfi1.mem_rmask === 0
                  && rvfi1.mem_wmask === 15
                  && rvfi1.mem_wdata === rvfi1.rs2_rdata
                )
              )
            )
          }
          default{
            // unknown
            insType := 0
            insNr := 0
            jump := False
            regWrite := False
            validExec := True
            trap := True
          }
        }
      }
      is(B"1110011"){ // System ??
        // when(instruction.f3 === 0 ){ // ?! && instruction.rs1 === 0 && instruction.rd === 0){
          insType := 5
          insNr := 38
          regWrite := False
          jump := False
          memActive := False
          validExec := True
          /*
          switch(instruction.f12){
            is(0){
              insNr := 38
              validExec := True
            }
            is(1){
              insNr := 39
              validExec := True
            }
            default{
              // unknown
              insType := 0
              insNr := 0
              regWrite := False
              jump := False
              memActive := False
              validExec := True
              // trap := True    
            }
          }
        }.otherwise{
          // unknown
          insType := 0
          insNr := 0
          regWrite := False
          jump := False
          memActive := False
          validExec := True
          trap := True  
        }
        */
      }
      is(B"0001111"){ // Fence  ??
        when(instruction.f3 === 0){
          insType := 6
          insNr := 40
          regWrite := False
          jump := False
          memActive := False
          validExec := True
        }.otherwise{
          // unknown
          insType := 0
          insNr := 0
          regWrite := False
          jump := False
          memActive := False
          validExec := True
          trap := True  
        }
      }
      default{
        // unknown
        insType := 0
        insNr := 0
        regWrite := False
        jump := False
        memActive := False
        validExec := True
        trap := True
      }
    }
    dbg.insNr := insNr
    dbg.execError := !validExec
    dbg.trap := trap
    dbg.exception := exception
  }
  // Evaluation of correct changes in register values 
  // -> Werte die sich nicht ändern sollen
  // -> Ausgelesene WErte auch checken
  val regEval = new Area{
    val pastRegs = Reg(Bits(dataWidth * regLength bits))
    val changed = Bool
    val correctWrite = Bool
    val valid = Bool
    when(checkpoint.ready){
      pastRegs := state1.regs
    }

    when(pastRegs === state1.regs){
      changed := False
    }.otherwise{
      changed := True
    }

    when(state1.regs(rvfi1.rd_addr * dataWidth, dataWidth bits) === rvfi1.rd_wdata){ // Unvollständig -> andere Register müssen konstant bleiben und es kann auch der selbe Wert erneut reingeschrieben werden
      correctWrite := True
    }.otherwise{
      correctWrite := False
    }

    when(insDecode.regWrite){
      valid := correctWrite
    }.otherwise{
      valid := !changed
    }
    dbg.regError := !valid

    // All das hier mit solver-chosen variable prüfen?
    /*
    when(state1.regs(rvfi1.rd_addr * dataWidth, dataWidth bits) === rvfi1.rd_wdata){
      // check if other registers stayed constant
      switch(rvfi1.rd_addr){
        is(0){
          when(state1.regs(dataWidth * regLength - 1 downto dataWidth) === pastRegs(dataWidth * regLength - 1 downto dataWidth)){
            correctWrite := True
          }.otherwise{
            correctWrite := False
          }
        }
        is(dataWidth * (regLength - 1)){
          when(state1.regs(dataWidth * regLength - 1 downto dataWidth * (regLength - 1)) === pastRegs(dataWidth * regLength - 1 downto dataWidth * (regLength - 1))){
            correctWrite := True
          }.otherwise{
            correctWrite := False
          }
        }
        default{
          when(state1.regs(0, (rvfi1.rd_addr * dataWidth - 1) bits)
          === pastRegs(0, (rvfi1.rd_addr * dataWidth - 1) bits)
          && state1.regs((rvfi1.rd_addr + 1) * dataWidth, ((regLength - rvfi1.rd_addr - 1) * dataWidth) bits)
          === pastRegs((rvfi1.rd_addr + 1) * dataWidth, ((regLength - rvfi1.rd_addr - 1) * dataWidth) bits)){
            correctWrite := True
          }.otherwise{
            correctWrite := False
          }
          correctWrite := False
        }
      }
    }.otherwise{
      correctWrite := False
    }
    */
  }
  // Evaluation of PC-Handling % Hier auch noch nicht jump szenario checken!
  val jumpEval = new Area{
    val pastPc = Reg(UInt(dataWidth bits))
    val valid = Bool

    when(checkpoint.ready){
      pastPc := state1.pc
    }
    when(insDecode.trap){
      // pc has to be trap andler adress
      valid := (state1.pc === U(csr1.mtvec(31 downto 2).asBits << 2, 32 bits))
      // Trappc must be prevealed?!
    }.otherwise{
      when(!insDecode.jump){
        valid := (state1.pc === pastPc + 4)
      }.otherwise{
        valid := (state1.pc === rvfi1.pc_wdata)

      }
    }
    dbg.jumpError := !valid
  }
  // Evaluation of Memory-Bus Interaction
  val dMemIOEval = new Area{ // Tatsächlich den Memory-Bus anschließen?!
    val valid = Bool
    when(!insDecode.memActive){
      valid := (rvfi1.mem_addr === 0 && rvfi1.mem_rmask === 0 && rvfi1.mem_wmask === 0 && rvfi1.mem_rdata === 0 && rvfi1.mem_wdata === 0)
    }.otherwise{
      valid := True
    }
    dbg.memError := !valid
  }
  // Evaluation of trap handling
  val trapEval = new Area{
    // val valid = Bool
  }

  // Evaluation of instruction Stream and correct branching behavior
  val instructionConsistencyEval = new Area{}

  GenerationFlags.formal {
    assumeInitial(clockDomain.isResetActive)
    // Always
    ClockDomain.current.withoutReset(){ 
      /* // Generic Register for Verification
      val f_address = UInt(5 bits)
      f_address.addAttribute("anyconst")
      val f_reg = Reg(Bits(dataWidth bits))
      assumeInitial(f_reg === 0)
      */

      val validTransition = Bool
      validTransition := regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec

      /* Configuration asserts */
      // assert(pipelineLength != 0 && branchDelay <= pipelineLength)
      
      /* Asserts */
      if(ProofMode == 0){
        when(checkpoint.check && stateEval.pastValid){ 
          when(insDecode.insNr <= 37){//instruction.opcode === B"0110011"){ // && !rvfi1.trap){ // Test
            assert(validTransition)
          }
        }
      }else{
        when(checkpoint.ready){
          assert(stateEval.valid)
        }
        when(checkpoint.check){
          assert(stateEval.pastValid)
          when(insDecode.insNr <= 37){
            assert(validTransition)
          }
        }
      }

      // Wie checken, dass valid Signal richtig?

      // Cover -Statements to check if instructions are executable
      // cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 26) && insDecode.trap && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
      if(true){
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 0) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 1) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 2) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 3) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 4) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 5) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 6) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 7) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 8) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 9) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 10) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 11) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 12) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 13) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 14) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 15) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 16) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 17) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 18) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 19) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 20) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 21) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 22) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 23) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 24) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 25) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 26) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 27) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 28) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 29) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 30) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 31) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 32) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 33) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 34) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 35) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 36) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
        cover(checkpoint.check && stateEval.pastValid && (insDecode.insNr === 37) && (regEval.valid && jumpEval.valid && dMemIOEval.valid && stateEval.valid && insDecode.validExec))
      }

      // cover reachability of any correct state?!
    }

    /* // Reset-State
    ClockDomain.current.duringReset {
    }
    */
    // Non-ResetState
    // cover statements
  }
}

//Generate the Top Verilog
object Formal_Proof_Module {
  def main(args: Array[String]) {
    SpinalConfig(
      defaultConfigForClockDomains = ClockDomainConfig(resetKind=SYNC, resetActiveLevel=HIGH),
      targetDirectory = "pm"
      ).includeFormal.generateSystemVerilog(new Formal_Proof_Module())
  }
}