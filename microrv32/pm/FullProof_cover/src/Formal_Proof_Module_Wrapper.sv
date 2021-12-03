`include "Formal_Proof_Module.sv"
`include "RiscV32Core.v"

module Formal_Proof_Module_Wrapper (
	input         clock,
	input         reset,
);
	(* keep *) wire trap;

	(* keep *) rand reg mem_ready;
	(* keep *) rand reg [31:0] mem_rdata;

	(* keep *) wire [31:0] mem_addr;
	(* keep *) wire        mem_valid;
	(* keep *) wire [31:0] mem_wdata;
	(* keep *) wire        mem_write;
	(* keep *) wire [3:0]  mem_size;


	wire      [0:0]    rvfi1_valid;
	wire      [63:0]   rvfi1_order;
	wire      [31:0]   rvfi1_insn;
	wire               rvfi1_trap;
	wire               rvfi1_halt;
	wire      [0:0]    rvfi1_intr;
	wire      [1:0]    rvfi1_mode;
	wire      [1:0]    rvfi1_ixl;
	wire      [4:0]    rvfi1_rs1_addr;
	wire      [4:0]    rvfi1_rs2_addr;
	wire      [31:0]   rvfi1_rs1_rdata;
	wire      [31:0]   rvfi1_rs2_rdata;
	wire      [4:0]    rvfi1_rd_addr;
	wire      [31:0]   rvfi1_rd_wdata;
	wire      [31:0]   rvfi1_pc_rdata;
	wire      [31:0]   rvfi1_pc_wdata;
	wire      [31:0]   rvfi1_mem_addr;
	wire      [3:0]    rvfi1_mem_rmask;
	wire      [3:0]    rvfi1_mem_wmask;
	wire      [31:0]   rvfi1_mem_rdata;
	wire      [31:0]   rvfi1_mem_wdata;

	wire reset1;
	wire [31:0] pc1;
	wire [(32*32 - 1):0] regs1;
	wire fetch1;

	wire [31:0] mtvec1;
  	wire [31:0] mepc1;
  	wire [31:0] mcause1;
  	wire [31:0] mtval1;

	Formal_Proof_Module pm(
		.clk       (clock),
		.reset    (reset),
		.rvfi1_valid     (rvfi1_valid),
		.rvfi1_order     (rvfi1_order),
		.rvfi1_insn      (rvfi1_insn),
		.rvfi1_trap      (rvfi1_trap),
		.rvfi1_halt      (rvfi1_halt),
		.rvfi1_intr      (rvfi1_intr),
		.rvfi1_mode      (rvfi1_mode),
		.rvfi1_ixl       (rvfi1_ixl),

		.rvfi1_rs1_addr  (rvfi1_rs1_addr),
		.rvfi1_rs2_addr  (rvfi1_rs2_addr),
		.rvfi1_rs1_rdata (rvfi1_rs1_rdata),
		.rvfi1_rs2_rdata (rvfi1_rs2_rdata),
		.rvfi1_rd_addr   (rvfi1_rd_addr),
		.rvfi1_rd_wdata  (rvfi1_rd_wdata),

		.rvfi1_pc_rdata  (rvfi1_pc_rdata),
		.rvfi1_pc_wdata  (rvfi1_pc_wdata),

		.rvfi1_mem_addr  (rvfi1_mem_addr),
		.rvfi1_mem_rmask (rvfi1_mem_rmask),
		.rvfi1_mem_wmask (rvfi1_mem_wmask),
		.rvfi1_mem_rdata (rvfi1_mem_rdata),
		.rvfi1_mem_wdata (rvfi1_mem_wdata),
		.state1_pc(rvfi1_pc_wdata),
		.state1_regs(regs1),
		.state1_fetch(fetch1),
		.ctrl_reset1(reset1),
		.csr1_mtvec(mtvec1),
		.csr1_mepc(mepc1),
		.csr1_mcause(mcause1),
		.csr1_mtval(mtval1),
	);


	RiscV32Core uut1 (
		.clk       (clock),
		.reset    (reset1),

		.io_memIF_IMem_instruction(mem_rdata),
		.io_memIF_IMem_instructionReady(mem_ready),
		.io_memIF_DMem_readData(mem_rdata),
		.io_memIF_DMem_dataReady(mem_ready),

		.io_halt(1'b0),
		.io_haltErr(1'b0),
		.io_irqTimer(1'b0),

		.rvfi_valid     (rvfi1_valid),
		.rvfi_order     (rvfi1_order),
		.rvfi_insn      (rvfi1_insn),
		.rvfi_trap      (rvfi1_trap),
		.rvfi_halt      (rvfi1_halt),
		.rvfi_intr      (rvfi1_intr),
		.rvfi_mode      (rvfi1_mode),
		.rvfi_ixl       (rvfi1_ixl),

		.rvfi_rs1_addr  (rvfi1_rs1_addr),
		.rvfi_rs2_addr  (rvfi1_rs2_addr),
		.rvfi_rs1_rdata (rvfi1_rs1_rdata),
		.rvfi_rs2_rdata (rvfi1_rs2_rdata),
		.rvfi_rd_addr   (rvfi1_rd_addr),
		.rvfi_rd_wdata  (rvfi1_rd_wdata),

		.rvfi_pc_rdata  (rvfi1_pc_rdata),
		.rvfi_pc_wdata  (rvfi1_pc_wdata),

		.rvfi_mem_addr  (rvfi1_mem_addr),
		.rvfi_mem_rmask (rvfi1_mem_rmask),
		.rvfi_mem_wmask (rvfi1_mem_wmask),
		.rvfi_mem_rdata (rvfi1_mem_rdata),
		.rvfi_mem_wdata (rvfi1_mem_wdata),

		.state_pc(pc1),
		.state_regs(regs1),
		.state_fetch(fetch1),

		.csr_mtvec(mtvec1),
  		.csr_mepc(mepc1),
  		.csr_mcause(mcause1),
  		.csr_mtval(mtval1)
	);

endmodule

