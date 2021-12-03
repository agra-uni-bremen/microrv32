// Generator : SpinalHDL v1.5.1    git head : 7da68c0639112c1c2c8097d506b995e9de9feef4
// Component : Formal_Proof_Module
// Git hash  : 955fc0bb73a34adef28d52b047ffec862e5b720e



module Formal_Proof_Module (
  input      [0:0]    rvfi1_valid,
  input      [63:0]   rvfi1_order,
  input      [31:0]   rvfi1_insn,
  input               rvfi1_trap,
  input               rvfi1_halt,
  input      [0:0]    rvfi1_intr,
  input      [1:0]    rvfi1_mode,
  input      [1:0]    rvfi1_ixl,
  input      [4:0]    rvfi1_rs1_addr,
  input      [4:0]    rvfi1_rs2_addr,
  input      [31:0]   rvfi1_rs1_rdata,
  input      [31:0]   rvfi1_rs2_rdata,
  input      [4:0]    rvfi1_rd_addr,
  input      [31:0]   rvfi1_rd_wdata,
  input      [31:0]   rvfi1_pc_rdata,
  input      [31:0]   rvfi1_pc_wdata,
  input      [31:0]   rvfi1_mem_addr,
  input      [3:0]    rvfi1_mem_rmask,
  input      [3:0]    rvfi1_mem_wmask,
  input      [31:0]   rvfi1_mem_rdata,
  input      [31:0]   rvfi1_mem_wdata,
  input      [31:0]   state1_pc,
  input      [1023:0] state1_regs,
  input               state1_fetch,
  input      [31:0]   csr1_mtvec,
  input      [31:0]   csr1_mepc,
  input      [31:0]   csr1_mcause,
  input      [31:0]   csr1_mtval,
  output              dbg_checkPoint,
  output              dbg_check,
  output     [7:0]    dbg_insNr,
  output              dbg_zeroRegError,
  output              dbg_pcMisalligned,
  output              dbg_regError,
  output              dbg_jumpError,
  output              dbg_memError,
  output              dbg_execError,
  output              dbg_trap,
  output     [4:0]    dbg_exception,
  output              ctrl_reset1,
  input               reset,
  input               clk
);
  wire       [20:0]   _zz_instruction_IImm;
  wire       [0:0]    _zz_instruction_IImm_1;
  wire       [19:0]   _zz_instruction_BImm;
  wire       [0:0]    _zz_instruction_BImm_1;
  wire       [20:0]   _zz_instruction_SImm;
  wire       [0:0]    _zz_instruction_SImm_1;
  wire       [31:0]   _zz_instruction_JImm;
  wire       [20:0]   _zz_instruction_JImm_1;
  wire       [31:0]   _zz_stateEval_pcMisalligned;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l213;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l226;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l226_1;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l226_2;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l226_3;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l292;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l315;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l328;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l328_1;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l374;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l374_1;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l395;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l395_1;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l395_2;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l408;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l408_1;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l408_2;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l432;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l454;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l454_1;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l454_2;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l454_3;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l476;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l476_1;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l476_2;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l476_3;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l476_4;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l521;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l534;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l534_1;
  wire       [31:0]   _zz_insDecode_trap;
  wire       [31:0]   _zz_insDecode_trap_1;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l619;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l619_1;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l619_2;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l619_3;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l619_4;
  wire       [31:0]   _zz_insDecode_trap_2;
  wire       [31:0]   _zz_insDecode_trap_3;
  wire       [31:0]   _zz_insDecode_trap_4;
  wire       [4:0]    _zz_when_Formal_Proof_Module_l649;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l649_1;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l649_2;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l649_3;
  wire       [4:0]    _zz_when_Formal_Proof_Module_l649_4;
  wire       [4:0]    _zz_when_Formal_Proof_Module_l649_5;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l649_6;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l649_7;
  wire       [30:0]   _zz_when_Formal_Proof_Module_l649_8;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l649_9;
  wire       [31:0]   _zz_when_Formal_Proof_Module_l649_10;
  wire       [0:0]    _zz_when_Formal_Proof_Module_l649_11;
  wire       [31:0]   _zz_insDecode_trap_5;
  wire       [31:0]   _zz_insDecode_validExec;
  wire       [31:0]   _zz_insDecode_validExec_1;
  wire       [31:0]   _zz_insDecode_validExec_2;
  wire       [31:0]   _zz_insDecode_validExec_3;
  wire       [31:0]   _zz_insDecode_trap_6;
  wire       [31:0]   _zz_insDecode_validExec_4;
  wire       [31:0]   _zz_insDecode_validExec_5;
  wire       [31:0]   _zz_insDecode_validExec_6;
  wire       [31:0]   _zz_insDecode_validExec_7;
  wire       [31:0]   _zz_insDecode_jump;
  wire       [31:0]   _zz_insDecode_jump_1;
  wire       [31:0]   _zz_insDecode_trap_7;
  wire       [31:0]   _zz_insDecode_validExec_8;
  wire       [31:0]   _zz_insDecode_validExec_9;
  wire       [31:0]   _zz_insDecode_validExec_10;
  wire       [31:0]   _zz_insDecode_validExec_11;
  wire       [31:0]   _zz_insDecode_jump_2;
  wire       [31:0]   _zz_insDecode_jump_3;
  wire       [31:0]   _zz_insDecode_trap_8;
  wire       [31:0]   _zz_insDecode_validExec_12;
  wire       [31:0]   _zz_insDecode_validExec_13;
  wire       [31:0]   _zz_insDecode_validExec_14;
  wire       [31:0]   _zz_insDecode_validExec_15;
  wire       [31:0]   _zz_insDecode_trap_9;
  wire       [31:0]   _zz_insDecode_validExec_16;
  wire       [31:0]   _zz_insDecode_validExec_17;
  wire       [31:0]   _zz_insDecode_validExec_18;
  wire       [31:0]   _zz_insDecode_validExec_19;
  wire       [31:0]   _zz_insDecode_trap_10;
  wire       [31:0]   _zz_insDecode_validExec_20;
  wire       [31:0]   _zz_insDecode_validExec_21;
  wire       [31:0]   _zz_insDecode_validExec_22;
  wire       [31:0]   _zz_insDecode_validExec_23;
  wire       [31:0]   _zz_insDecode_validExec_24;
  wire       [31:0]   _zz_insDecode_validExec_25;
  wire       [31:0]   _zz_insDecode_validExec_26;
  wire                _zz_insDecode_validExec_27;
  wire                _zz_insDecode_validExec_28;
  wire       [3:0]    _zz_insDecode_validExec_29;
  wire       [4:0]    _zz_insDecode_validExec_30;
  wire       [31:0]   _zz_insDecode_validExec_31;
  wire       [31:0]   _zz_insDecode_validExec_32;
  wire       [7:0]    _zz_insDecode_validExec_33;
  wire       [31:0]   _zz_insDecode_validExec_34;
  wire       [31:0]   _zz_insDecode_validExec_35;
  wire       [31:0]   _zz_insDecode_validExec_36;
  wire                _zz_insDecode_validExec_37;
  wire                _zz_insDecode_validExec_38;
  wire       [3:0]    _zz_insDecode_validExec_39;
  wire       [31:0]   _zz_insDecode_validExec_40;
  wire       [15:0]   _zz_insDecode_validExec_41;
  wire       [31:0]   _zz_insDecode_validExec_42;
  wire       [31:0]   _zz_insDecode_validExec_43;
  wire       [31:0]   _zz_insDecode_validExec_44;
  wire                _zz_insDecode_validExec_45;
  wire                _zz_insDecode_validExec_46;
  wire       [3:0]    _zz_insDecode_validExec_47;
  wire       [31:0]   _zz_insDecode_validExec_48;
  wire       [31:0]   _zz_insDecode_validExec_49;
  wire       [31:0]   _zz_insDecode_validExec_50;
  wire       [31:0]   _zz_insDecode_validExec_51;
  wire       [31:0]   _zz_insDecode_validExec_52;
  wire                _zz_insDecode_validExec_53;
  wire                _zz_insDecode_validExec_54;
  wire       [3:0]    _zz_insDecode_validExec_55;
  wire       [31:0]   _zz_insDecode_validExec_56;
  wire       [7:0]    _zz_insDecode_validExec_57;
  wire       [31:0]   _zz_insDecode_validExec_58;
  wire       [31:0]   _zz_insDecode_validExec_59;
  wire       [31:0]   _zz_insDecode_validExec_60;
  wire                _zz_insDecode_validExec_61;
  wire                _zz_insDecode_validExec_62;
  wire       [3:0]    _zz_insDecode_validExec_63;
  wire       [31:0]   _zz_insDecode_validExec_64;
  wire       [15:0]   _zz_insDecode_validExec_65;
  wire       [31:0]   _zz_insDecode_validExec_66;
  wire       [31:0]   _zz_insDecode_validExec_67;
  wire       [31:0]   _zz_insDecode_validExec_68;
  wire       [31:0]   _zz_insDecode_validExec_69;
  wire       [31:0]   _zz_insDecode_validExec_70;
  wire       [31:0]   _zz_insDecode_validExec_71;
  wire       [31:0]   _zz_insDecode_validExec_72;
  wire       [31:0]   _zz_insDecode_validExec_73;
  wire       [31:0]   _zz_insDecode_validExec_74;
  wire       [10:0]   _zz_when_Formal_Proof_Module_l1113;
  wire       [31:0]   _zz_jumpEval_valid;
  wire       [31:0]   _zz_jumpEval_valid_1;
  wire       [31:0]   _zz_jumpEval_valid_2;
  wire       [31:0]   _zz_jumpEval_valid_3;
  reg                 checkpoint_firstFetch;
  reg                 checkpoint_firstCheckPoint;
  reg                 checkpoint_ready;
  reg                 checkpoint_check;
  wire                when_Formal_Proof_Module_l88;
  wire                when_Formal_Proof_Module_l89;
  wire                when_Formal_Proof_Module_l95;
  wire       [6:0]    instruction_opcode;
  wire       [2:0]    instruction_f3;
  wire       [6:0]    instruction_f7;
  wire       [11:0]   instruction_f12;
  wire       [4:0]    instruction_rs1;
  wire       [4:0]    instruction_rs2;
  wire       [4:0]    instruction_rd;
  wire       [4:0]    instruction_shamt;
  wire       [31:0]   instruction_IImm;
  wire       [31:0]   instruction_BImm;
  wire       [31:0]   instruction_SImm;
  wire       [31:0]   instruction_UImm;
  wire       [31:0]   instruction_JImm;
  wire       [31:0]   instruction_loadAddress;
  wire       [31:0]   instruction_storeAddress;
  wire                stateEval_zeroRegError;
  wire                stateEval_pcMisalligned;
  reg                 stateEval_valid;
  reg                 stateEval_pastValid;
  reg                 insDecode_validExec;
  wire                insDecode_check;
  reg        [7:0]    insDecode_insType;
  reg        [7:0]    insDecode_insNr;
  reg                 insDecode_regWrite;
  reg                 insDecode_jump;
  reg                 insDecode_memActive;
  wire                insDecode_loadAddressMisaligned;
  wire                insDecode_storeAddressMisaligned;
  reg                 insDecode_trap;
  reg        [4:0]    insDecode_exception;
  wire                when_Formal_Proof_Module_l213;
  wire                when_Formal_Proof_Module_l226;
  wire                when_Formal_Proof_Module_l239;
  wire                when_Formal_Proof_Module_l252;
  wire                when_Formal_Proof_Module_l265;
  wire                when_Formal_Proof_Module_l278;
  wire                when_Formal_Proof_Module_l285;
  wire                when_Formal_Proof_Module_l292;
  wire                when_Formal_Proof_Module_l315;
  wire                when_Formal_Proof_Module_l328;
  wire                when_Formal_Proof_Module_l357;
  wire                when_Formal_Proof_Module_l374;
  wire                when_Formal_Proof_Module_l395;
  wire                when_Formal_Proof_Module_l408;
  wire                when_Formal_Proof_Module_l425;
  wire                when_Formal_Proof_Module_l432;
  wire                when_Formal_Proof_Module_l447;
  wire                when_Formal_Proof_Module_l454;
  wire                when_Formal_Proof_Module_l469;
  wire                when_Formal_Proof_Module_l476;
  wire                when_Formal_Proof_Module_l491;
  wire                when_Formal_Proof_Module_l498;
  wire                when_Formal_Proof_Module_l521;
  wire                when_Formal_Proof_Module_l534;
  wire                when_Formal_Proof_Module_l551;
  wire                when_Formal_Proof_Module_l558;
  wire                when_Formal_Proof_Module_l573;
  wire                when_Formal_Proof_Module_l580;
  wire                when_Formal_Proof_Module_l619;
  wire                when_Formal_Proof_Module_l634;
  wire                when_Formal_Proof_Module_l649;
  wire                when_Formal_Proof_Module_l1061;
  reg        [1023:0] regEval_pastRegs;
  reg                 regEval_changed;
  reg                 regEval_correctWrite;
  reg                 regEval_valid;
  wire                when_Formal_Proof_Module_l1107;
  wire                when_Formal_Proof_Module_l1113;
  reg        [31:0]   jumpEval_pastPc;
  reg                 jumpEval_valid;
  wire                when_Formal_Proof_Module_l1175;
  reg                 dMemIOEval_valid;
  wire                when_Formal_Proof_Module_l1187;
  wire                when_Formal_Proof_Module_l1221;
  wire                when_Formal_Proof_Module_l1222;

  assign _zz_instruction_IImm_1 = rvfi1_insn[31];
  assign _zz_instruction_IImm = {{20{_zz_instruction_IImm_1[0]}}, _zz_instruction_IImm_1};
  assign _zz_instruction_BImm_1 = rvfi1_insn[31];
  assign _zz_instruction_BImm = {{19{_zz_instruction_BImm_1[0]}}, _zz_instruction_BImm_1};
  assign _zz_instruction_SImm_1 = rvfi1_insn[31];
  assign _zz_instruction_SImm = {{20{_zz_instruction_SImm_1[0]}}, _zz_instruction_SImm_1};
  assign _zz_instruction_JImm_1 = {{{{{rvfi1_insn[31],rvfi1_insn[19 : 12]},rvfi1_insn[20]},rvfi1_insn[30 : 25]},rvfi1_insn[24 : 21]},1'b0};
  assign _zz_instruction_JImm = {{11{_zz_instruction_JImm_1[20]}}, _zz_instruction_JImm_1};
  assign _zz_stateEval_pcMisalligned = (state1_pc % 3'b100);
  assign _zz_when_Formal_Proof_Module_l213 = (rvfi1_rs1_rdata + instruction_IImm);
  assign _zz_when_Formal_Proof_Module_l226 = rvfi1_rs1_rdata;
  assign _zz_when_Formal_Proof_Module_l226_1 = instruction_IImm;
  assign _zz_when_Formal_Proof_Module_l226_2 = rvfi1_rs1_rdata;
  assign _zz_when_Formal_Proof_Module_l226_3 = instruction_IImm;
  assign _zz_when_Formal_Proof_Module_l292 = (rvfi1_rs1_rdata <<< instruction_shamt);
  assign _zz_when_Formal_Proof_Module_l315 = (rvfi1_rs1_rdata >>> instruction_shamt);
  assign _zz_when_Formal_Proof_Module_l328 = ($signed(_zz_when_Formal_Proof_Module_l328_1) >>> instruction_shamt);
  assign _zz_when_Formal_Proof_Module_l328_1 = rvfi1_rs1_rdata;
  assign _zz_when_Formal_Proof_Module_l374 = (_zz_when_Formal_Proof_Module_l374_1 + instruction_UImm);
  assign _zz_when_Formal_Proof_Module_l374_1 = (state1_pc - 32'h00000004);
  assign _zz_when_Formal_Proof_Module_l395 = ($signed(_zz_when_Formal_Proof_Module_l395_1) + $signed(_zz_when_Formal_Proof_Module_l395_2));
  assign _zz_when_Formal_Proof_Module_l395_1 = rvfi1_rs1_rdata;
  assign _zz_when_Formal_Proof_Module_l395_2 = rvfi1_rs2_rdata;
  assign _zz_when_Formal_Proof_Module_l408 = ($signed(_zz_when_Formal_Proof_Module_l408_1) - $signed(_zz_when_Formal_Proof_Module_l408_2));
  assign _zz_when_Formal_Proof_Module_l408_1 = rvfi1_rs1_rdata;
  assign _zz_when_Formal_Proof_Module_l408_2 = rvfi1_rs2_rdata;
  assign _zz_when_Formal_Proof_Module_l432 = (rvfi1_rs1_rdata <<< rvfi1_rs2_rdata[4 : 0]);
  assign _zz_when_Formal_Proof_Module_l454 = rvfi1_rs1_rdata;
  assign _zz_when_Formal_Proof_Module_l454_1 = rvfi1_rs2_rdata;
  assign _zz_when_Formal_Proof_Module_l454_2 = rvfi1_rs1_rdata;
  assign _zz_when_Formal_Proof_Module_l454_3 = rvfi1_rs2_rdata;
  assign _zz_when_Formal_Proof_Module_l521 = (rvfi1_rs1_rdata >>> rvfi1_rs2_rdata[4 : 0]);
  assign _zz_when_Formal_Proof_Module_l534 = ($signed(_zz_when_Formal_Proof_Module_l534_1) >>> rvfi1_rs2_rdata[4 : 0]);
  assign _zz_when_Formal_Proof_Module_l534_1 = rvfi1_rs1_rdata;
  assign _zz_insDecode_trap = (_zz_insDecode_trap_1 % 3'b100);
  assign _zz_insDecode_trap_1 = (rvfi1_pc_rdata + instruction_JImm);
  assign _zz_when_Formal_Proof_Module_l619_1 = _zz_when_Formal_Proof_Module_l619_2;
  assign _zz_when_Formal_Proof_Module_l619 = _zz_when_Formal_Proof_Module_l619_1;
  assign _zz_when_Formal_Proof_Module_l619_2 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_when_Formal_Proof_Module_l619_3 = (rvfi1_pc_rdata + 32'h00000004);
  assign _zz_when_Formal_Proof_Module_l619_4 = (rvfi1_pc_rdata + instruction_JImm);
  assign _zz_insDecode_trap_2 = ({_zz_insDecode_trap_3[31 : 1],1'b0} % 3'b100);
  assign _zz_insDecode_trap_3 = _zz_insDecode_trap_4;
  assign _zz_insDecode_trap_4 = (rvfi1_rs1_rdata + instruction_IImm);
  assign _zz_when_Formal_Proof_Module_l649_2 = _zz_when_Formal_Proof_Module_l649_3;
  assign _zz_when_Formal_Proof_Module_l649_1 = _zz_when_Formal_Proof_Module_l649_2;
  assign _zz_when_Formal_Proof_Module_l649_3 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_when_Formal_Proof_Module_l649_7 = (rvfi1_pc_rdata + 32'h00000004);
  assign _zz_when_Formal_Proof_Module_l649_9 = _zz_when_Formal_Proof_Module_l649_10;
  assign _zz_when_Formal_Proof_Module_l649_10 = (rvfi1_rs1_rdata + instruction_IImm);
  assign _zz_insDecode_trap_5 = (instruction_BImm % 3'b100);
  assign _zz_insDecode_validExec_1 = _zz_insDecode_validExec_2;
  assign _zz_insDecode_validExec = _zz_insDecode_validExec_1;
  assign _zz_insDecode_validExec_2 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_3 = (rvfi1_pc_rdata + instruction_BImm);
  assign _zz_insDecode_trap_6 = (instruction_BImm % 3'b100);
  assign _zz_insDecode_validExec_5 = _zz_insDecode_validExec_6;
  assign _zz_insDecode_validExec_4 = _zz_insDecode_validExec_5;
  assign _zz_insDecode_validExec_6 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_7 = (rvfi1_pc_rdata + instruction_BImm);
  assign _zz_insDecode_jump = rvfi1_rs1_rdata;
  assign _zz_insDecode_jump_1 = rvfi1_rs2_rdata;
  assign _zz_insDecode_trap_7 = (instruction_BImm % 3'b100);
  assign _zz_insDecode_validExec_9 = _zz_insDecode_validExec_10;
  assign _zz_insDecode_validExec_8 = _zz_insDecode_validExec_9;
  assign _zz_insDecode_validExec_10 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_11 = (rvfi1_pc_rdata + instruction_BImm);
  assign _zz_insDecode_jump_2 = rvfi1_rs2_rdata;
  assign _zz_insDecode_jump_3 = rvfi1_rs1_rdata;
  assign _zz_insDecode_trap_8 = (instruction_BImm % 3'b100);
  assign _zz_insDecode_validExec_13 = _zz_insDecode_validExec_14;
  assign _zz_insDecode_validExec_12 = _zz_insDecode_validExec_13;
  assign _zz_insDecode_validExec_14 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_15 = (rvfi1_pc_rdata + instruction_BImm);
  assign _zz_insDecode_trap_9 = (instruction_BImm % 3'b100);
  assign _zz_insDecode_validExec_17 = _zz_insDecode_validExec_18;
  assign _zz_insDecode_validExec_16 = _zz_insDecode_validExec_17;
  assign _zz_insDecode_validExec_18 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_19 = (rvfi1_pc_rdata + instruction_BImm);
  assign _zz_insDecode_trap_10 = (instruction_BImm % 3'b100);
  assign _zz_insDecode_validExec_21 = _zz_insDecode_validExec_22;
  assign _zz_insDecode_validExec_20 = _zz_insDecode_validExec_21;
  assign _zz_insDecode_validExec_22 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_23 = (rvfi1_pc_rdata + instruction_BImm);
  assign _zz_insDecode_validExec_25 = _zz_insDecode_validExec_26;
  assign _zz_insDecode_validExec_24 = _zz_insDecode_validExec_25;
  assign _zz_insDecode_validExec_26 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_33 = rvfi1_mem_rdata[7 : 0];
  assign _zz_insDecode_validExec_32 = {{24{_zz_insDecode_validExec_33[7]}}, _zz_insDecode_validExec_33};
  assign _zz_insDecode_validExec_35 = _zz_insDecode_validExec_36;
  assign _zz_insDecode_validExec_34 = _zz_insDecode_validExec_35;
  assign _zz_insDecode_validExec_36 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_41 = rvfi1_mem_rdata[15 : 0];
  assign _zz_insDecode_validExec_40 = {{16{_zz_insDecode_validExec_41[15]}}, _zz_insDecode_validExec_41};
  assign _zz_insDecode_validExec_43 = _zz_insDecode_validExec_44;
  assign _zz_insDecode_validExec_42 = _zz_insDecode_validExec_43;
  assign _zz_insDecode_validExec_44 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_49 = rvfi1_mem_rdata[31 : 0];
  assign _zz_insDecode_validExec_48 = _zz_insDecode_validExec_49;
  assign _zz_insDecode_validExec_51 = _zz_insDecode_validExec_52;
  assign _zz_insDecode_validExec_50 = _zz_insDecode_validExec_51;
  assign _zz_insDecode_validExec_52 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_57 = rvfi1_mem_rdata[7 : 0];
  assign _zz_insDecode_validExec_56 = {24'd0, _zz_insDecode_validExec_57};
  assign _zz_insDecode_validExec_59 = _zz_insDecode_validExec_60;
  assign _zz_insDecode_validExec_58 = _zz_insDecode_validExec_59;
  assign _zz_insDecode_validExec_60 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_65 = rvfi1_mem_rdata[15 : 0];
  assign _zz_insDecode_validExec_64 = {16'd0, _zz_insDecode_validExec_65};
  assign _zz_insDecode_validExec_67 = _zz_insDecode_validExec_68;
  assign _zz_insDecode_validExec_66 = _zz_insDecode_validExec_67;
  assign _zz_insDecode_validExec_68 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_70 = _zz_insDecode_validExec_71;
  assign _zz_insDecode_validExec_69 = _zz_insDecode_validExec_70;
  assign _zz_insDecode_validExec_71 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_insDecode_validExec_73 = _zz_insDecode_validExec_74;
  assign _zz_insDecode_validExec_72 = _zz_insDecode_validExec_73;
  assign _zz_insDecode_validExec_74 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_when_Formal_Proof_Module_l1113 = (rvfi1_rd_addr * 6'h20);
  assign _zz_jumpEval_valid_1 = _zz_jumpEval_valid_2;
  assign _zz_jumpEval_valid = _zz_jumpEval_valid_1;
  assign _zz_jumpEval_valid_2 = ({2'd0,csr1_mtvec[31 : 2]} <<< 2);
  assign _zz_jumpEval_valid_3 = (jumpEval_pastPc + 32'h00000004);
  assign _zz_when_Formal_Proof_Module_l476 = 32'h00000001;
  assign _zz_when_Formal_Proof_Module_l476_1 = rvfi1_rs1_rdata;
  assign _zz_when_Formal_Proof_Module_l476_2 = rvfi1_rs2_rdata;
  assign _zz_when_Formal_Proof_Module_l476_3 = rvfi1_rs1_rdata;
  assign _zz_when_Formal_Proof_Module_l476_4 = rvfi1_rs2_rdata;
  assign _zz_when_Formal_Proof_Module_l649 = 5'h0;
  assign _zz_when_Formal_Proof_Module_l649_4 = instruction_rd;
  assign _zz_when_Formal_Proof_Module_l649_5 = 5'h0;
  assign _zz_when_Formal_Proof_Module_l649_6 = _zz_when_Formal_Proof_Module_l649_7;
  assign _zz_when_Formal_Proof_Module_l649_8 = _zz_when_Formal_Proof_Module_l649_9[31 : 1];
  assign _zz_when_Formal_Proof_Module_l649_11 = 1'b0;
  assign _zz_insDecode_validExec_27 = ((! insDecode_trap) && (rvfi1_mem_addr == instruction_loadAddress));
  assign _zz_insDecode_validExec_28 = (rvfi1_mem_rmask == 4'b0001);
  assign _zz_insDecode_validExec_29 = 4'b0000;
  assign _zz_insDecode_validExec_30 = 5'h0;
  assign _zz_insDecode_validExec_31 = _zz_insDecode_validExec_32;
  assign _zz_insDecode_validExec_37 = (! insDecode_trap);
  assign _zz_insDecode_validExec_38 = (rvfi1_mem_addr == instruction_loadAddress);
  assign _zz_insDecode_validExec_39 = 4'b0011;
  assign _zz_insDecode_validExec_45 = (! insDecode_trap);
  assign _zz_insDecode_validExec_46 = (rvfi1_mem_addr == instruction_loadAddress);
  assign _zz_insDecode_validExec_47 = 4'b1111;
  assign _zz_insDecode_validExec_53 = (! insDecode_trap);
  assign _zz_insDecode_validExec_54 = (rvfi1_mem_addr == instruction_loadAddress);
  assign _zz_insDecode_validExec_55 = 4'b0001;
  assign _zz_insDecode_validExec_61 = (! insDecode_trap);
  assign _zz_insDecode_validExec_62 = (rvfi1_mem_addr == instruction_loadAddress);
  assign _zz_insDecode_validExec_63 = 4'b0011;
  initial begin
    assume(reset);
  end
  assign ctrl_reset1 = 1'b0;
  assign when_Formal_Proof_Module_l88 = (! reset);
  assign when_Formal_Proof_Module_l89 = ((rvfi1_valid == 1'b1) || (state1_fetch && (! checkpoint_firstFetch)));
  always @(*) begin
    if(when_Formal_Proof_Module_l88) begin
      if(when_Formal_Proof_Module_l89) begin
        checkpoint_ready = 1'b1;
      end else begin
        checkpoint_ready = 1'b0;
      end
    end else begin
      checkpoint_ready = 1'b0;
    end
  end

  assign when_Formal_Proof_Module_l95 = ((checkpoint_ready == 1'b0) && checkpoint_firstFetch);
  always @(*) begin
    if(when_Formal_Proof_Module_l88) begin
      checkpoint_check = (checkpoint_firstCheckPoint && (rvfi1_valid == 1'b1));
    end else begin
      checkpoint_check = 1'b0;
    end
  end

  assign dbg_checkPoint = checkpoint_ready;
  assign dbg_check = checkpoint_check;
  assign instruction_opcode = rvfi1_insn[6 : 0];
  assign instruction_f3 = rvfi1_insn[14 : 12];
  assign instruction_f7 = rvfi1_insn[31 : 25];
  assign instruction_f12 = rvfi1_insn[31 : 20];
  assign instruction_rs1 = rvfi1_insn[19 : 15];
  assign instruction_rs2 = rvfi1_insn[24 : 20];
  assign instruction_rd = rvfi1_insn[11 : 7];
  assign instruction_shamt = rvfi1_insn[24 : 20];
  assign instruction_IImm = {{{_zz_instruction_IImm,rvfi1_insn[30 : 25]},rvfi1_insn[24 : 21]},rvfi1_insn[20]};
  assign instruction_BImm = {{{{_zz_instruction_BImm,rvfi1_insn[7]},rvfi1_insn[30 : 25]},rvfi1_insn[11 : 8]},1'b0};
  assign instruction_SImm = {{{_zz_instruction_SImm,rvfi1_insn[30 : 25]},rvfi1_insn[11 : 8]},rvfi1_insn[7]};
  assign instruction_UImm = {{{rvfi1_insn[31],rvfi1_insn[30 : 20]},rvfi1_insn[19 : 12]},12'h0};
  assign instruction_JImm = _zz_instruction_JImm;
  assign instruction_loadAddress = (rvfi1_rs1_rdata + instruction_IImm);
  assign instruction_storeAddress = (rvfi1_rs1_rdata + instruction_SImm);
  assign stateEval_zeroRegError = (! (state1_regs[31 : 0] == 32'h0));
  assign dbg_zeroRegError = stateEval_zeroRegError;
  assign stateEval_pcMisalligned = (! (_zz_stateEval_pcMisalligned == 32'h0));
  assign dbg_pcMisalligned = stateEval_pcMisalligned;
  always @(*) begin
    if(checkpoint_ready) begin
      stateEval_valid = (! (stateEval_zeroRegError || stateEval_pcMisalligned));
    end else begin
      stateEval_valid = 1'b0;
    end
  end

  always @(*) begin
    insDecode_trap = 1'b0;
    case(instruction_opcode)
      7'h13 : begin
        case(instruction_f3)
          3'b000 : begin
          end
          3'b010 : begin
          end
          3'b011 : begin
          end
          3'b100 : begin
          end
          3'b110 : begin
          end
          3'b111 : begin
          end
          3'b001 : begin
            if(!when_Formal_Proof_Module_l285) begin
              insDecode_trap = 1'b1;
            end
          end
          default : begin
            case(instruction_f7)
              7'h0 : begin
              end
              7'h20 : begin
              end
              default : begin
                insDecode_trap = 1'b1;
              end
            endcase
          end
        endcase
      end
      7'h37 : begin
      end
      7'h17 : begin
      end
      7'h33 : begin
        case(instruction_f3)
          3'b000 : begin
            case(instruction_f7)
              7'h0 : begin
              end
              7'h20 : begin
              end
              default : begin
                insDecode_trap = 1'b1;
              end
            endcase
          end
          3'b001 : begin
            if(!when_Formal_Proof_Module_l425) begin
              insDecode_trap = 1'b1;
            end
          end
          3'b010 : begin
            if(!when_Formal_Proof_Module_l447) begin
              insDecode_trap = 1'b1;
            end
          end
          3'b011 : begin
            if(!when_Formal_Proof_Module_l469) begin
              insDecode_trap = 1'b1;
            end
          end
          3'b100 : begin
            if(!when_Formal_Proof_Module_l491) begin
              insDecode_trap = 1'b1;
            end
          end
          3'b101 : begin
            case(instruction_f7)
              7'h0 : begin
              end
              7'h20 : begin
              end
              default : begin
                insDecode_trap = 1'b1;
              end
            endcase
          end
          3'b110 : begin
            if(!when_Formal_Proof_Module_l551) begin
              insDecode_trap = 1'b1;
            end
          end
          default : begin
            if(!when_Formal_Proof_Module_l573) begin
              insDecode_trap = 1'b1;
            end
          end
        endcase
      end
      7'h6f : begin
        insDecode_trap = (! (_zz_insDecode_trap == 32'h0));
      end
      7'h67 : begin
        insDecode_trap = (! (_zz_insDecode_trap_2 == 32'h0));
        if(!when_Formal_Proof_Module_l634) begin
          insDecode_trap = 1'b1;
        end
      end
      7'h63 : begin
        case(instruction_f3)
          3'b000 : begin
            insDecode_trap = (insDecode_jump && (! (_zz_insDecode_trap_5 == 32'h0)));
          end
          3'b001 : begin
            insDecode_trap = (insDecode_jump && (! (_zz_insDecode_trap_6 == 32'h0)));
          end
          3'b100 : begin
            insDecode_trap = (insDecode_jump && (! (_zz_insDecode_trap_7 == 32'h0)));
          end
          3'b101 : begin
            insDecode_trap = (insDecode_jump && (! (_zz_insDecode_trap_8 == 32'h0)));
          end
          3'b110 : begin
            insDecode_trap = (insDecode_jump && (! (_zz_insDecode_trap_9 == 32'h0)));
          end
          3'b111 : begin
            insDecode_trap = (insDecode_jump && (! (_zz_insDecode_trap_10 == 32'h0)));
          end
          default : begin
            insDecode_trap = 1'b1;
          end
        endcase
      end
      7'h03 : begin
        insDecode_trap = insDecode_loadAddressMisaligned;
        case(instruction_f3)
          3'b000 : begin
          end
          3'b001 : begin
          end
          3'b010 : begin
          end
          3'b100 : begin
          end
          3'b101 : begin
          end
          default : begin
            insDecode_trap = 1'b1;
          end
        endcase
      end
      7'h23 : begin
        insDecode_trap = insDecode_storeAddressMisaligned;
        case(instruction_f3)
          3'b000 : begin
          end
          3'b001 : begin
          end
          3'b010 : begin
          end
          default : begin
            insDecode_trap = 1'b1;
          end
        endcase
      end
      7'h73 : begin
      end
      7'h0f : begin
        if(!when_Formal_Proof_Module_l1061) begin
          insDecode_trap = 1'b1;
        end
      end
      default : begin
        insDecode_trap = 1'b1;
      end
    endcase
  end

  always @(*) begin
    insDecode_exception = 5'h0;
    case(instruction_opcode)
      7'h13 : begin
      end
      7'h37 : begin
      end
      7'h17 : begin
      end
      7'h33 : begin
      end
      7'h6f : begin
        if(insDecode_trap) begin
          insDecode_exception = 5'h01;
        end
      end
      7'h67 : begin
        if(insDecode_trap) begin
          insDecode_exception = 5'h01;
        end
      end
      7'h63 : begin
        case(instruction_f3)
          3'b000 : begin
            if(insDecode_trap) begin
              insDecode_exception = 5'h01;
            end
          end
          3'b001 : begin
            if(insDecode_trap) begin
              insDecode_exception = 5'h01;
            end
          end
          3'b100 : begin
            if(insDecode_trap) begin
              insDecode_exception = 5'h01;
            end
          end
          3'b101 : begin
            if(insDecode_trap) begin
              insDecode_exception = 5'h01;
            end
          end
          3'b110 : begin
            if(insDecode_trap) begin
              insDecode_exception = 5'h01;
            end
          end
          3'b111 : begin
            if(insDecode_trap) begin
              insDecode_exception = 5'h01;
            end
          end
          default : begin
          end
        endcase
      end
      7'h03 : begin
        if(insDecode_trap) begin
          insDecode_exception = 5'h02;
        end
      end
      7'h23 : begin
        if(insDecode_trap) begin
          insDecode_exception = 5'h02;
        end
      end
      7'h73 : begin
      end
      7'h0f : begin
      end
      default : begin
      end
    endcase
  end

  assign insDecode_loadAddressMisaligned = 1'b0;
  assign insDecode_storeAddressMisaligned = 1'b0;
  always @(*) begin
    case(instruction_opcode)
      7'h13 : begin
        insDecode_insType = 8'h01;
        case(instruction_f3)
          3'b000 : begin
          end
          3'b010 : begin
          end
          3'b011 : begin
          end
          3'b100 : begin
          end
          3'b110 : begin
          end
          3'b111 : begin
          end
          3'b001 : begin
            if(!when_Formal_Proof_Module_l285) begin
              insDecode_insType = 8'h0;
            end
          end
          default : begin
            case(instruction_f7)
              7'h0 : begin
              end
              7'h20 : begin
              end
              default : begin
                insDecode_insType = 8'h0;
              end
            endcase
          end
        endcase
      end
      7'h37 : begin
        insDecode_insType = 8'h01;
      end
      7'h17 : begin
        insDecode_insType = 8'h01;
      end
      7'h33 : begin
        insDecode_insType = 8'h02;
        case(instruction_f3)
          3'b000 : begin
            case(instruction_f7)
              7'h0 : begin
              end
              7'h20 : begin
              end
              default : begin
                insDecode_insType = 8'h0;
              end
            endcase
          end
          3'b001 : begin
            if(!when_Formal_Proof_Module_l425) begin
              insDecode_insType = 8'h0;
            end
          end
          3'b010 : begin
            if(!when_Formal_Proof_Module_l447) begin
              insDecode_insType = 8'h0;
            end
          end
          3'b011 : begin
            if(!when_Formal_Proof_Module_l469) begin
              insDecode_insType = 8'h0;
            end
          end
          3'b100 : begin
            if(!when_Formal_Proof_Module_l491) begin
              insDecode_insType = 8'h0;
            end
          end
          3'b101 : begin
            case(instruction_f7)
              7'h0 : begin
              end
              7'h20 : begin
              end
              default : begin
                insDecode_insType = 8'h0;
              end
            endcase
          end
          3'b110 : begin
            if(!when_Formal_Proof_Module_l551) begin
              insDecode_insType = 8'h0;
            end
          end
          default : begin
            if(!when_Formal_Proof_Module_l573) begin
              insDecode_insType = 8'h0;
            end
          end
        endcase
      end
      7'h6f : begin
        insDecode_insType = 8'h03;
      end
      7'h67 : begin
        insDecode_insType = 8'h03;
        if(!when_Formal_Proof_Module_l634) begin
          insDecode_insType = 8'h0;
        end
      end
      7'h63 : begin
        insDecode_insType = 8'h03;
        case(instruction_f3)
          3'b000 : begin
          end
          3'b001 : begin
          end
          3'b100 : begin
          end
          3'b101 : begin
          end
          3'b110 : begin
          end
          3'b111 : begin
          end
          default : begin
            insDecode_insType = 8'h0;
          end
        endcase
      end
      7'h03 : begin
        insDecode_insType = 8'h04;
        case(instruction_f3)
          3'b000 : begin
          end
          3'b001 : begin
          end
          3'b010 : begin
          end
          3'b100 : begin
          end
          3'b101 : begin
          end
          default : begin
            insDecode_insType = 8'h0;
          end
        endcase
      end
      7'h23 : begin
        insDecode_insType = 8'h04;
        case(instruction_f3)
          3'b000 : begin
          end
          3'b001 : begin
          end
          3'b010 : begin
          end
          default : begin
            insDecode_insType = 8'h0;
          end
        endcase
      end
      7'h73 : begin
        insDecode_insType = 8'h05;
      end
      7'h0f : begin
        if(when_Formal_Proof_Module_l1061) begin
          insDecode_insType = 8'h06;
        end else begin
          insDecode_insType = 8'h0;
        end
      end
      default : begin
        insDecode_insType = 8'h0;
      end
    endcase
  end

  always @(*) begin
    case(instruction_opcode)
      7'h13 : begin
        insDecode_regWrite = (! (instruction_rd == 5'h0));
        case(instruction_f3)
          3'b000 : begin
          end
          3'b010 : begin
          end
          3'b011 : begin
          end
          3'b100 : begin
          end
          3'b110 : begin
          end
          3'b111 : begin
          end
          3'b001 : begin
            if(!when_Formal_Proof_Module_l285) begin
              insDecode_regWrite = 1'b0;
            end
          end
          default : begin
            case(instruction_f7)
              7'h0 : begin
              end
              7'h20 : begin
              end
              default : begin
                insDecode_regWrite = 1'b0;
              end
            endcase
          end
        endcase
      end
      7'h37 : begin
        insDecode_regWrite = (! (instruction_rd == 5'h0));
      end
      7'h17 : begin
        insDecode_regWrite = (! (instruction_rd == 5'h0));
      end
      7'h33 : begin
        insDecode_regWrite = (! (instruction_rd == 5'h0));
        case(instruction_f3)
          3'b000 : begin
            case(instruction_f7)
              7'h0 : begin
              end
              7'h20 : begin
              end
              default : begin
                insDecode_regWrite = 1'b0;
              end
            endcase
          end
          3'b001 : begin
            if(!when_Formal_Proof_Module_l425) begin
              insDecode_regWrite = 1'b0;
            end
          end
          3'b010 : begin
            if(!when_Formal_Proof_Module_l447) begin
              insDecode_regWrite = 1'b0;
            end
          end
          3'b011 : begin
            if(!when_Formal_Proof_Module_l469) begin
              insDecode_regWrite = 1'b0;
            end
          end
          3'b100 : begin
            if(!when_Formal_Proof_Module_l491) begin
              insDecode_regWrite = 1'b0;
            end
          end
          3'b101 : begin
            case(instruction_f7)
              7'h0 : begin
              end
              7'h20 : begin
              end
              default : begin
                insDecode_regWrite = 1'b0;
              end
            endcase
          end
          3'b110 : begin
            if(!when_Formal_Proof_Module_l551) begin
              insDecode_regWrite = 1'b0;
            end
          end
          default : begin
            if(!when_Formal_Proof_Module_l573) begin
              insDecode_regWrite = 1'b0;
            end
          end
        endcase
      end
      7'h6f : begin
        insDecode_regWrite = (! (instruction_rd == 5'h0));
      end
      7'h67 : begin
        insDecode_regWrite = (! (instruction_rd == 5'h0));
        if(!when_Formal_Proof_Module_l634) begin
          insDecode_regWrite = 1'b0;
        end
      end
      7'h63 : begin
        insDecode_regWrite = 1'b0;
        case(instruction_f3)
          3'b000 : begin
          end
          3'b001 : begin
          end
          3'b100 : begin
          end
          3'b101 : begin
          end
          3'b110 : begin
          end
          3'b111 : begin
          end
          default : begin
            insDecode_regWrite = 1'b0;
          end
        endcase
      end
      7'h03 : begin
        insDecode_regWrite = (! ((instruction_rd == 5'h0) || insDecode_trap));
        case(instruction_f3)
          3'b000 : begin
          end
          3'b001 : begin
          end
          3'b010 : begin
          end
          3'b100 : begin
          end
          3'b101 : begin
          end
          default : begin
            insDecode_regWrite = 1'b0;
          end
        endcase
      end
      7'h23 : begin
        insDecode_regWrite = 1'b0;
        case(instruction_f3)
          3'b000 : begin
          end
          3'b001 : begin
          end
          3'b010 : begin
          end
          default : begin
            insDecode_regWrite = 1'b0;
          end
        endcase
      end
      7'h73 : begin
        insDecode_regWrite = 1'b0;
      end
      7'h0f : begin
        if(when_Formal_Proof_Module_l1061) begin
          insDecode_regWrite = 1'b0;
        end else begin
          insDecode_regWrite = 1'b0;
        end
      end
      default : begin
        insDecode_regWrite = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(instruction_opcode)
      7'h13 : begin
        insDecode_jump = 1'b0;
      end
      7'h37 : begin
        insDecode_jump = 1'b0;
      end
      7'h17 : begin
        insDecode_jump = 1'b0;
      end
      7'h33 : begin
        insDecode_jump = 1'b0;
      end
      7'h6f : begin
        insDecode_jump = 1'b1;
      end
      7'h67 : begin
        insDecode_jump = 1'b1;
      end
      7'h63 : begin
        case(instruction_f3)
          3'b000 : begin
            insDecode_jump = (rvfi1_rs1_rdata == rvfi1_rs2_rdata);
          end
          3'b001 : begin
            insDecode_jump = (rvfi1_rs1_rdata != rvfi1_rs2_rdata);
          end
          3'b100 : begin
            insDecode_jump = ($signed(_zz_insDecode_jump) < $signed(_zz_insDecode_jump_1));
          end
          3'b101 : begin
            insDecode_jump = ($signed(_zz_insDecode_jump_2) <= $signed(_zz_insDecode_jump_3));
          end
          3'b110 : begin
            insDecode_jump = (rvfi1_rs1_rdata < rvfi1_rs2_rdata);
          end
          3'b111 : begin
            insDecode_jump = (rvfi1_rs2_rdata <= rvfi1_rs1_rdata);
          end
          default : begin
            insDecode_jump = 1'b0;
          end
        endcase
      end
      7'h03 : begin
        insDecode_jump = 1'b0;
        case(instruction_f3)
          3'b000 : begin
          end
          3'b001 : begin
          end
          3'b010 : begin
          end
          3'b100 : begin
          end
          3'b101 : begin
          end
          default : begin
            insDecode_jump = 1'b0;
          end
        endcase
      end
      7'h23 : begin
        insDecode_jump = 1'b0;
        case(instruction_f3)
          3'b000 : begin
          end
          3'b001 : begin
          end
          3'b010 : begin
          end
          default : begin
            insDecode_jump = 1'b0;
          end
        endcase
      end
      7'h73 : begin
        insDecode_jump = 1'b0;
      end
      7'h0f : begin
        if(when_Formal_Proof_Module_l1061) begin
          insDecode_jump = 1'b0;
        end else begin
          insDecode_jump = 1'b0;
        end
      end
      default : begin
        insDecode_jump = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(instruction_opcode)
      7'h13 : begin
        insDecode_memActive = 1'b0;
      end
      7'h37 : begin
        insDecode_memActive = 1'b0;
      end
      7'h17 : begin
        insDecode_memActive = 1'b0;
      end
      7'h33 : begin
        insDecode_memActive = 1'b0;
      end
      7'h6f : begin
        insDecode_memActive = 1'b0;
      end
      7'h67 : begin
        insDecode_memActive = 1'b0;
      end
      7'h63 : begin
        insDecode_memActive = 1'b0;
      end
      7'h03 : begin
        insDecode_memActive = (! insDecode_trap);
      end
      7'h23 : begin
        insDecode_memActive = (! insDecode_trap);
      end
      7'h73 : begin
        insDecode_memActive = 1'b0;
      end
      7'h0f : begin
        if(when_Formal_Proof_Module_l1061) begin
          insDecode_memActive = 1'b0;
        end else begin
          insDecode_memActive = 1'b0;
        end
      end
      default : begin
        insDecode_memActive = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(instruction_opcode)
      7'h13 : begin
        case(instruction_f3)
          3'b000 : begin
            insDecode_insNr = 8'h01;
          end
          3'b010 : begin
            insDecode_insNr = 8'h02;
          end
          3'b011 : begin
            insDecode_insNr = 8'h03;
          end
          3'b100 : begin
            insDecode_insNr = 8'h04;
          end
          3'b110 : begin
            insDecode_insNr = 8'h05;
          end
          3'b111 : begin
            insDecode_insNr = 8'h06;
          end
          3'b001 : begin
            if(when_Formal_Proof_Module_l285) begin
              insDecode_insNr = 8'h07;
            end else begin
              insDecode_insNr = 8'h0;
            end
          end
          default : begin
            case(instruction_f7)
              7'h0 : begin
                insDecode_insNr = 8'h08;
              end
              7'h20 : begin
                insDecode_insNr = 8'h09;
              end
              default : begin
                insDecode_insNr = 8'h0;
              end
            endcase
          end
        endcase
      end
      7'h37 : begin
        insDecode_insNr = 8'h0a;
      end
      7'h17 : begin
        insDecode_insNr = 8'h0b;
      end
      7'h33 : begin
        case(instruction_f3)
          3'b000 : begin
            case(instruction_f7)
              7'h0 : begin
                insDecode_insNr = 8'h0c;
              end
              7'h20 : begin
                insDecode_insNr = 8'h0d;
              end
              default : begin
                insDecode_insNr = 8'h0;
              end
            endcase
          end
          3'b001 : begin
            if(when_Formal_Proof_Module_l425) begin
              insDecode_insNr = 8'h0e;
            end else begin
              insDecode_insNr = 8'h0;
            end
          end
          3'b010 : begin
            if(when_Formal_Proof_Module_l447) begin
              insDecode_insNr = 8'h0f;
            end else begin
              insDecode_insNr = 8'h0;
            end
          end
          3'b011 : begin
            if(when_Formal_Proof_Module_l469) begin
              insDecode_insNr = 8'h10;
            end else begin
              insDecode_insNr = 8'h0;
            end
          end
          3'b100 : begin
            if(when_Formal_Proof_Module_l491) begin
              insDecode_insNr = 8'h11;
            end else begin
              insDecode_insNr = 8'h0;
            end
          end
          3'b101 : begin
            case(instruction_f7)
              7'h0 : begin
                insDecode_insNr = 8'h12;
              end
              7'h20 : begin
                insDecode_insNr = 8'h13;
              end
              default : begin
                insDecode_insNr = 8'h0;
              end
            endcase
          end
          3'b110 : begin
            if(when_Formal_Proof_Module_l551) begin
              insDecode_insNr = 8'h14;
            end else begin
              insDecode_insNr = 8'h0;
            end
          end
          default : begin
            if(when_Formal_Proof_Module_l573) begin
              insDecode_insNr = 8'h15;
            end else begin
              insDecode_insNr = 8'h0;
            end
          end
        endcase
      end
      7'h6f : begin
        insDecode_insNr = 8'h16;
      end
      7'h67 : begin
        if(when_Formal_Proof_Module_l634) begin
          insDecode_insNr = 8'h17;
        end else begin
          insDecode_insNr = 8'h0;
        end
      end
      7'h63 : begin
        case(instruction_f3)
          3'b000 : begin
            insDecode_insNr = 8'h18;
          end
          3'b001 : begin
            insDecode_insNr = 8'h19;
          end
          3'b100 : begin
            insDecode_insNr = 8'h1a;
          end
          3'b101 : begin
            insDecode_insNr = 8'h1b;
          end
          3'b110 : begin
            insDecode_insNr = 8'h1c;
          end
          3'b111 : begin
            insDecode_insNr = 8'h1d;
          end
          default : begin
            insDecode_insNr = 8'h0;
          end
        endcase
      end
      7'h03 : begin
        case(instruction_f3)
          3'b000 : begin
            insDecode_insNr = 8'h1e;
          end
          3'b001 : begin
            insDecode_insNr = 8'h1f;
          end
          3'b010 : begin
            insDecode_insNr = 8'h20;
          end
          3'b100 : begin
            insDecode_insNr = 8'h21;
          end
          3'b101 : begin
            insDecode_insNr = 8'h22;
          end
          default : begin
            insDecode_insNr = 8'h0;
          end
        endcase
      end
      7'h23 : begin
        case(instruction_f3)
          3'b000 : begin
            insDecode_insNr = 8'h23;
          end
          3'b001 : begin
            insDecode_insNr = 8'h24;
          end
          3'b010 : begin
            insDecode_insNr = 8'h25;
          end
          default : begin
            insDecode_insNr = 8'h0;
          end
        endcase
      end
      7'h73 : begin
        insDecode_insNr = 8'h26;
      end
      7'h0f : begin
        if(when_Formal_Proof_Module_l1061) begin
          insDecode_insNr = 8'h28;
        end else begin
          insDecode_insNr = 8'h0;
        end
      end
      default : begin
        insDecode_insNr = 8'h0;
      end
    endcase
  end

  assign when_Formal_Proof_Module_l213 = (((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l213)));
  always @(*) begin
    case(instruction_opcode)
      7'h13 : begin
        case(instruction_f3)
          3'b000 : begin
            if(when_Formal_Proof_Module_l213) begin
              insDecode_validExec = 1'b1;
            end else begin
              insDecode_validExec = 1'b0;
            end
          end
          3'b010 : begin
            if(when_Formal_Proof_Module_l226) begin
              insDecode_validExec = 1'b1;
            end else begin
              insDecode_validExec = 1'b0;
            end
          end
          3'b011 : begin
            if(when_Formal_Proof_Module_l239) begin
              insDecode_validExec = 1'b1;
            end else begin
              insDecode_validExec = 1'b0;
            end
          end
          3'b100 : begin
            if(when_Formal_Proof_Module_l252) begin
              insDecode_validExec = 1'b1;
            end else begin
              insDecode_validExec = 1'b0;
            end
          end
          3'b110 : begin
            if(when_Formal_Proof_Module_l265) begin
              insDecode_validExec = 1'b1;
            end else begin
              insDecode_validExec = 1'b0;
            end
          end
          3'b111 : begin
            if(when_Formal_Proof_Module_l278) begin
              insDecode_validExec = 1'b1;
            end else begin
              insDecode_validExec = 1'b0;
            end
          end
          3'b001 : begin
            if(when_Formal_Proof_Module_l285) begin
              if(when_Formal_Proof_Module_l292) begin
                insDecode_validExec = 1'b1;
              end else begin
                insDecode_validExec = 1'b0;
              end
            end else begin
              insDecode_validExec = 1'b1;
            end
          end
          default : begin
            case(instruction_f7)
              7'h0 : begin
                if(when_Formal_Proof_Module_l315) begin
                  insDecode_validExec = 1'b1;
                end else begin
                  insDecode_validExec = 1'b0;
                end
              end
              7'h20 : begin
                if(when_Formal_Proof_Module_l328) begin
                  insDecode_validExec = 1'b1;
                end else begin
                  insDecode_validExec = 1'b0;
                end
              end
              default : begin
                insDecode_validExec = 1'b1;
              end
            endcase
          end
        endcase
      end
      7'h37 : begin
        if(when_Formal_Proof_Module_l357) begin
          insDecode_validExec = 1'b1;
        end else begin
          insDecode_validExec = 1'b0;
        end
      end
      7'h17 : begin
        if(when_Formal_Proof_Module_l374) begin
          insDecode_validExec = 1'b1;
        end else begin
          insDecode_validExec = 1'b0;
        end
      end
      7'h33 : begin
        case(instruction_f3)
          3'b000 : begin
            case(instruction_f7)
              7'h0 : begin
                if(when_Formal_Proof_Module_l395) begin
                  insDecode_validExec = 1'b1;
                end else begin
                  insDecode_validExec = 1'b0;
                end
              end
              7'h20 : begin
                if(when_Formal_Proof_Module_l408) begin
                  insDecode_validExec = 1'b1;
                end else begin
                  insDecode_validExec = 1'b0;
                end
              end
              default : begin
                insDecode_validExec = 1'b1;
              end
            endcase
          end
          3'b001 : begin
            if(when_Formal_Proof_Module_l425) begin
              if(when_Formal_Proof_Module_l432) begin
                insDecode_validExec = 1'b1;
              end else begin
                insDecode_validExec = 1'b0;
              end
            end else begin
              insDecode_validExec = 1'b1;
            end
          end
          3'b010 : begin
            if(when_Formal_Proof_Module_l447) begin
              if(when_Formal_Proof_Module_l454) begin
                insDecode_validExec = 1'b1;
              end else begin
                insDecode_validExec = 1'b0;
              end
            end else begin
              insDecode_validExec = 1'b1;
            end
          end
          3'b011 : begin
            if(when_Formal_Proof_Module_l469) begin
              if(when_Formal_Proof_Module_l476) begin
                insDecode_validExec = 1'b1;
              end else begin
                insDecode_validExec = 1'b0;
              end
            end else begin
              insDecode_validExec = 1'b1;
            end
          end
          3'b100 : begin
            if(when_Formal_Proof_Module_l491) begin
              if(when_Formal_Proof_Module_l498) begin
                insDecode_validExec = 1'b1;
              end else begin
                insDecode_validExec = 1'b0;
              end
            end else begin
              insDecode_validExec = 1'b1;
            end
          end
          3'b101 : begin
            case(instruction_f7)
              7'h0 : begin
                if(when_Formal_Proof_Module_l521) begin
                  insDecode_validExec = 1'b1;
                end else begin
                  insDecode_validExec = 1'b0;
                end
              end
              7'h20 : begin
                if(when_Formal_Proof_Module_l534) begin
                  insDecode_validExec = 1'b1;
                end else begin
                  insDecode_validExec = 1'b0;
                end
              end
              default : begin
                insDecode_validExec = 1'b1;
              end
            endcase
          end
          3'b110 : begin
            if(when_Formal_Proof_Module_l551) begin
              if(when_Formal_Proof_Module_l558) begin
                insDecode_validExec = 1'b1;
              end else begin
                insDecode_validExec = 1'b0;
              end
            end else begin
              insDecode_validExec = 1'b1;
            end
          end
          default : begin
            if(when_Formal_Proof_Module_l573) begin
              if(when_Formal_Proof_Module_l580) begin
                insDecode_validExec = 1'b1;
              end else begin
                insDecode_validExec = 1'b0;
              end
            end else begin
              insDecode_validExec = 1'b1;
            end
          end
        endcase
      end
      7'h6f : begin
        if(when_Formal_Proof_Module_l619) begin
          insDecode_validExec = 1'b1;
        end else begin
          insDecode_validExec = 1'b0;
        end
      end
      7'h67 : begin
        if(when_Formal_Proof_Module_l634) begin
          if(when_Formal_Proof_Module_l649) begin
            insDecode_validExec = 1'b1;
          end else begin
            insDecode_validExec = 1'b0;
          end
        end else begin
          insDecode_validExec = 1'b1;
        end
      end
      7'h63 : begin
        case(instruction_f3)
          3'b000 : begin
            insDecode_validExec = (((((rvfi1_rd_addr == 5'h0) && (rvfi1_rd_wdata == 32'h0)) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec)) || ((! insDecode_trap) && ((! insDecode_jump) || (rvfi1_pc_wdata == _zz_insDecode_validExec_3)))));
          end
          3'b001 : begin
            insDecode_validExec = (((((rvfi1_rd_addr == 5'h0) && (rvfi1_rd_wdata == 32'h0)) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_4)) || ((! insDecode_trap) && ((! insDecode_jump) || (rvfi1_pc_wdata == _zz_insDecode_validExec_7)))));
          end
          3'b100 : begin
            insDecode_validExec = (((((rvfi1_rd_addr == 5'h0) && (rvfi1_rd_wdata == 32'h0)) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_8)) || ((! insDecode_trap) && ((! insDecode_jump) || (rvfi1_pc_wdata == _zz_insDecode_validExec_11)))));
          end
          3'b101 : begin
            insDecode_validExec = (((((rvfi1_rd_addr == 5'h0) && (rvfi1_rd_wdata == 32'h0)) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_12)) || ((! insDecode_trap) && ((! insDecode_jump) || (rvfi1_pc_wdata == _zz_insDecode_validExec_15)))));
          end
          3'b110 : begin
            insDecode_validExec = (((((rvfi1_rd_addr == 5'h0) && (rvfi1_rd_wdata == 32'h0)) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_16)) || ((! insDecode_trap) && ((! insDecode_jump) || (rvfi1_pc_wdata == _zz_insDecode_validExec_19)))));
          end
          3'b111 : begin
            insDecode_validExec = (((((rvfi1_rd_addr == 5'h0) && (rvfi1_rd_wdata == 32'h0)) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_20)) || ((! insDecode_trap) && ((! insDecode_jump) || (rvfi1_pc_wdata == _zz_insDecode_validExec_23)))));
          end
          default : begin
            insDecode_validExec = 1'b1;
          end
        endcase
      end
      7'h03 : begin
        case(instruction_f3)
          3'b000 : begin
            insDecode_validExec = (((rvfi1_rs1_addr == instruction_rs1) && (rvfi1_rd_addr == instruction_rd)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_24)) || ((((_zz_insDecode_validExec_27 && _zz_insDecode_validExec_28) && (rvfi1_mem_wmask == _zz_insDecode_validExec_29)) && ((rvfi1_rd_addr == _zz_insDecode_validExec_30) || (rvfi1_rd_wdata == _zz_insDecode_validExec_31))) && (rvfi1_mem_wdata == 32'h0))));
          end
          3'b001 : begin
            insDecode_validExec = (((rvfi1_rs1_addr == instruction_rs1) && (rvfi1_rd_addr == instruction_rd)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_34)) || (((((_zz_insDecode_validExec_37 && _zz_insDecode_validExec_38) && (rvfi1_mem_rmask == _zz_insDecode_validExec_39)) && (rvfi1_mem_wmask == 4'b0000)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_insDecode_validExec_40))) && (rvfi1_mem_wdata == 32'h0))));
          end
          3'b010 : begin
            insDecode_validExec = (((rvfi1_rs1_addr == instruction_rs1) && (rvfi1_rd_addr == instruction_rd)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_42)) || (((((_zz_insDecode_validExec_45 && _zz_insDecode_validExec_46) && (rvfi1_mem_rmask == _zz_insDecode_validExec_47)) && (rvfi1_mem_wmask == 4'b0000)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_insDecode_validExec_48))) && (rvfi1_mem_wdata == 32'h0))));
          end
          3'b100 : begin
            insDecode_validExec = (((rvfi1_rs1_addr == instruction_rs1) && (rvfi1_rd_addr == instruction_rd)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_50)) || (((((_zz_insDecode_validExec_53 && _zz_insDecode_validExec_54) && (rvfi1_mem_rmask == _zz_insDecode_validExec_55)) && (rvfi1_mem_wmask == 4'b0000)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_insDecode_validExec_56))) && (rvfi1_mem_wdata == 32'h0))));
          end
          3'b101 : begin
            insDecode_validExec = (((rvfi1_rs1_addr == instruction_rs1) && (rvfi1_rd_addr == instruction_rd)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_58)) || (((((_zz_insDecode_validExec_61 && _zz_insDecode_validExec_62) && (rvfi1_mem_rmask == _zz_insDecode_validExec_63)) && (rvfi1_mem_wmask == 4'b0000)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_insDecode_validExec_64))) && (rvfi1_mem_wdata == 32'h0))));
          end
          default : begin
            insDecode_validExec = 1'b1;
          end
        endcase
      end
      7'h23 : begin
        case(instruction_f3)
          3'b000 : begin
            insDecode_validExec = (((rvfi1_rs1_addr == instruction_rs1) && (rvfi1_rs2_addr == instruction_rs2)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_66)) || (((((! insDecode_trap) && (rvfi1_mem_addr == instruction_storeAddress)) && (rvfi1_mem_rmask == 4'b0000)) && (rvfi1_mem_wmask == 4'b0001)) && (rvfi1_mem_wdata == rvfi1_rs2_rdata))));
          end
          3'b001 : begin
            insDecode_validExec = (((rvfi1_rs1_addr == instruction_rs1) && (rvfi1_rs2_addr == instruction_rs2)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_69)) || (((((! insDecode_trap) && (rvfi1_mem_addr == instruction_storeAddress)) && (rvfi1_mem_rmask == 4'b0000)) && (rvfi1_mem_wmask == 4'b0011)) && (rvfi1_mem_wdata == rvfi1_rs2_rdata))));
          end
          3'b010 : begin
            insDecode_validExec = (((rvfi1_rs1_addr == instruction_rs1) && (rvfi1_rs2_addr == instruction_rs2)) && (((insDecode_trap && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_insDecode_validExec_72)) || (((((! insDecode_trap) && (rvfi1_mem_addr == instruction_storeAddress)) && (rvfi1_mem_rmask == 4'b0000)) && (rvfi1_mem_wmask == 4'b1111)) && (rvfi1_mem_wdata == rvfi1_rs2_rdata))));
          end
          default : begin
            insDecode_validExec = 1'b1;
          end
        endcase
      end
      7'h73 : begin
        insDecode_validExec = 1'b1;
      end
      7'h0f : begin
        if(when_Formal_Proof_Module_l1061) begin
          insDecode_validExec = 1'b1;
        end else begin
          insDecode_validExec = 1'b1;
        end
      end
      default : begin
        insDecode_validExec = 1'b1;
      end
    endcase
  end

  assign when_Formal_Proof_Module_l226 = (((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && (((rvfi1_rd_addr == 5'h0) || ((rvfi1_rd_wdata == 32'h00000001) && ($signed(_zz_when_Formal_Proof_Module_l226) < $signed(_zz_when_Formal_Proof_Module_l226_1)))) || ((rvfi1_rd_wdata == 32'h0) && (! ($signed(_zz_when_Formal_Proof_Module_l226_2) < $signed(_zz_when_Formal_Proof_Module_l226_3))))));
  assign when_Formal_Proof_Module_l239 = (((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && (((rvfi1_rd_addr == 5'h0) || ((rvfi1_rd_wdata == 32'h00000001) && (rvfi1_rs1_rdata < instruction_IImm))) || ((rvfi1_rd_wdata == 32'h0) && (! (rvfi1_rs1_rdata < instruction_IImm)))));
  assign when_Formal_Proof_Module_l252 = (((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == (rvfi1_rs1_rdata ^ instruction_IImm))));
  assign when_Formal_Proof_Module_l265 = (((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == (rvfi1_rs1_rdata | instruction_IImm))));
  assign when_Formal_Proof_Module_l278 = (((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == (rvfi1_rs1_rdata & instruction_IImm))));
  assign when_Formal_Proof_Module_l285 = (instruction_f7 == 7'h0);
  assign when_Formal_Proof_Module_l292 = (((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l292)));
  assign when_Formal_Proof_Module_l315 = (((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l315)));
  assign when_Formal_Proof_Module_l328 = (((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l328)));
  assign when_Formal_Proof_Module_l357 = ((rvfi1_rd_addr == instruction_rd) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == instruction_UImm)));
  assign when_Formal_Proof_Module_l374 = ((rvfi1_rd_addr == instruction_rd) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l374)));
  assign when_Formal_Proof_Module_l395 = ((((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l395)));
  assign when_Formal_Proof_Module_l408 = ((((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l408)));
  assign when_Formal_Proof_Module_l425 = (instruction_f7 == 7'h0);
  assign when_Formal_Proof_Module_l432 = ((((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l432)));
  assign when_Formal_Proof_Module_l447 = (instruction_f7 == 7'h0);
  assign when_Formal_Proof_Module_l454 = ((((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && (((rvfi1_rd_addr == 5'h0) || ((rvfi1_rd_wdata == 32'h00000001) && ($signed(_zz_when_Formal_Proof_Module_l454) < $signed(_zz_when_Formal_Proof_Module_l454_1)))) || ((rvfi1_rd_wdata == 32'h0) && (! ($signed(_zz_when_Formal_Proof_Module_l454_2) < $signed(_zz_when_Formal_Proof_Module_l454_3))))));
  assign when_Formal_Proof_Module_l469 = (instruction_f7 == 7'h0);
  assign when_Formal_Proof_Module_l476 = ((((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && (((rvfi1_rd_addr == 5'h0) || ((rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l476) && (_zz_when_Formal_Proof_Module_l476_1 < _zz_when_Formal_Proof_Module_l476_2))) || ((rvfi1_rd_wdata == 32'h0) && (! (_zz_when_Formal_Proof_Module_l476_3 < _zz_when_Formal_Proof_Module_l476_4)))));
  assign when_Formal_Proof_Module_l491 = (instruction_f7 == 7'h0);
  assign when_Formal_Proof_Module_l498 = ((((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == (rvfi1_rs1_rdata ^ rvfi1_rs2_rdata))));
  assign when_Formal_Proof_Module_l521 = ((((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l521)));
  assign when_Formal_Proof_Module_l534 = ((((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l534)));
  assign when_Formal_Proof_Module_l551 = (instruction_f7 == 7'h0);
  assign when_Formal_Proof_Module_l558 = ((((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == (rvfi1_rs1_rdata | rvfi1_rs2_rdata))));
  assign when_Formal_Proof_Module_l573 = (instruction_f7 == 7'h0);
  assign when_Formal_Proof_Module_l580 = ((((rvfi1_rd_addr == instruction_rd) && (rvfi1_rs1_addr == instruction_rs1)) && (rvfi1_rs2_addr == instruction_rs2)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == (rvfi1_rs1_rdata & rvfi1_rs2_rdata))));
  assign when_Formal_Proof_Module_l619 = ((((insDecode_trap && (rvfi1_rd_addr == 5'h0)) && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_when_Formal_Proof_Module_l619)) || ((((! insDecode_trap) && (rvfi1_rd_addr == instruction_rd)) && ((rvfi1_rd_addr == 5'h0) || (rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l619_3))) && (rvfi1_pc_wdata == _zz_when_Formal_Proof_Module_l619_4)));
  assign when_Formal_Proof_Module_l634 = (instruction_f3 == 3'b000);
  assign when_Formal_Proof_Module_l649 = ((rvfi1_rs1_addr == instruction_rs1) && ((((insDecode_trap && (rvfi1_rd_addr == _zz_when_Formal_Proof_Module_l649)) && (rvfi1_trap == 1'b1)) && (rvfi1_pc_wdata == _zz_when_Formal_Proof_Module_l649_1)) || ((((! insDecode_trap) && (rvfi1_rd_addr == _zz_when_Formal_Proof_Module_l649_4)) && ((rvfi1_rd_addr == _zz_when_Formal_Proof_Module_l649_5) || (rvfi1_rd_wdata == _zz_when_Formal_Proof_Module_l649_6))) && (rvfi1_pc_wdata == {_zz_when_Formal_Proof_Module_l649_8,_zz_when_Formal_Proof_Module_l649_11}))));
  assign when_Formal_Proof_Module_l1061 = ((instruction_f3 == 3'b000) || (instruction_f3 == 3'b001));
  assign dbg_insNr = insDecode_insNr;
  assign dbg_execError = (! insDecode_validExec);
  assign dbg_trap = insDecode_trap;
  assign dbg_exception = insDecode_exception;
  assign when_Formal_Proof_Module_l1107 = (regEval_pastRegs == state1_regs);
  always @(*) begin
    if(when_Formal_Proof_Module_l1107) begin
      regEval_changed = 1'b0;
    end else begin
      regEval_changed = 1'b1;
    end
  end

  assign when_Formal_Proof_Module_l1113 = (state1_regs[_zz_when_Formal_Proof_Module_l1113 +: 32] == rvfi1_rd_wdata);
  always @(*) begin
    if(when_Formal_Proof_Module_l1113) begin
      regEval_correctWrite = 1'b1;
    end else begin
      regEval_correctWrite = 1'b0;
    end
  end

  always @(*) begin
    if(insDecode_regWrite) begin
      regEval_valid = regEval_correctWrite;
    end else begin
      regEval_valid = (! regEval_changed);
    end
  end

  assign dbg_regError = (! regEval_valid);
  always @(*) begin
    if(insDecode_trap) begin
      jumpEval_valid = (state1_pc == _zz_jumpEval_valid);
    end else begin
      if(when_Formal_Proof_Module_l1175) begin
        jumpEval_valid = (state1_pc == _zz_jumpEval_valid_3);
      end else begin
        jumpEval_valid = (state1_pc == rvfi1_pc_wdata);
      end
    end
  end

  assign when_Formal_Proof_Module_l1175 = (! insDecode_jump);
  assign dbg_jumpError = (! jumpEval_valid);
  assign when_Formal_Proof_Module_l1187 = (! insDecode_memActive);
  always @(*) begin
    if(when_Formal_Proof_Module_l1187) begin
      dMemIOEval_valid = (((((rvfi1_mem_addr == 32'h0) && (rvfi1_mem_rmask == 4'b0000)) && (rvfi1_mem_wmask == 4'b0000)) && (rvfi1_mem_rdata == 32'h0)) && (rvfi1_mem_wdata == 32'h0));
    end else begin
      dMemIOEval_valid = 1'b1;
    end
  end

  assign dbg_memError = (! dMemIOEval_valid);
  assign when_Formal_Proof_Module_l1221 = (checkpoint_check && stateEval_pastValid);
  assign when_Formal_Proof_Module_l1222 = (insDecode_insNr <= 8'h25);
  always @(posedge clk) begin
    if(reset) begin
      checkpoint_firstFetch <= 1'b0;
      checkpoint_firstCheckPoint <= 1'b0;
      stateEval_pastValid <= 1'b0;
    end else begin
      if(when_Formal_Proof_Module_l88) begin
        if(when_Formal_Proof_Module_l89) begin
          checkpoint_firstFetch <= 1'b1;
        end
        if(when_Formal_Proof_Module_l95) begin
          checkpoint_firstCheckPoint <= 1'b1;
        end
      end
      if(checkpoint_ready) begin
        stateEval_pastValid <= stateEval_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(checkpoint_ready) begin
      regEval_pastRegs <= state1_regs;
    end
    if(checkpoint_ready) begin
      jumpEval_pastPc <= state1_pc;
    end
  end

  always @(posedge clk) begin
    if(when_Formal_Proof_Module_l1221) begin
      if(when_Formal_Proof_Module_l1222) begin
        assert(((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec));
      end
    end
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h0)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h01)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h02)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h03)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h04)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h05)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h06)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h07)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h08)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h09)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h0a)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h0b)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h0c)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h0d)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h0e)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h0f)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h10)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h11)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h12)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h13)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h14)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h15)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h16)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h17)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h18)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h19)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h1a)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h1b)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h1c)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h1d)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h1e)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h1f)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h20)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h21)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h22)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h23)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h24)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
    cover((((checkpoint_check && stateEval_pastValid) && (insDecode_insNr == 8'h25)) && ((((regEval_valid && jumpEval_valid) && dMemIOEval_valid) && stateEval_valid) && insDecode_validExec)));
  end


endmodule
