module main_controller(
	`ifdef USE_POWER_PINS
		inout vccd1, // VDD
		inout vssd1, // GND
	`endif
	// clock and reset interface
	input clk,
	input rst,
	output rst_asserted,

	// program select bits
	input [1:0] program_sel,

	// codemaker memory control interface
	input cm_mem_ctrl_we,
	input [13:0] cm_mem_ctrl_addr,
	input [31:0] cm_mem_ctrl_in,
	output [31:0] cm_mem_ctrl_out,
	output cm_mem_ctrl_vld,
	input cm_mem_ctrl_req,

	// codemaker local memory interface
	output cm_sram0_csb0,
	output cm_sram0_web0,
	input [31:0] cm_sram0_dout0,

	output cm_sram1_csb0,
	output cm_sram1_web0,
	input [31:0] cm_sram1_dout0,

	output cm_sram2_csb0,
	output cm_sram2_web0,
	input [31:0] cm_sram2_dout0,

	output cm_sram3_csb0,
	output cm_sram3_web0,
	input [31:0] cm_sram3_dout0,

	/* output cm_sram4_csb0,
	output cm_sram4_web0,
	input [31:0] cm_sram4_dout0,

	output cm_sram5_csb0,
	output cm_sram5_web0,
	input [31:0] cm_sram5_dout0, */

	output [8:0] cm_sram_comm_addr0,
	output [31:0] cm_sram_comm_din0,

	// control tower memory control interface
	input ct_mem_ctrl_we,
	input [13:0] ct_mem_ctrl_addr,
	input [31:0] ct_mem_ctrl_in,
	output [31:0] ct_mem_ctrl_out,
	output ct_mem_ctrl_vld,
	input ct_mem_ctrl_req,

	// control tower local memory ct_interface
	output ct_sram0_csb0,
	output ct_sram0_web0,
	input [31:0] ct_sram0_dout0,

	output ct_sram1_csb0,
	output ct_sram1_web0,
	input [31:0] ct_sram1_dout0,

	output ct_sram2_csb0,
	output ct_sram2_web0,
	input [31:0] ct_sram2_dout0,

	output ct_sram3_csb0,
	output ct_sram3_web0,
	input [31:0] ct_sram3_dout0,

	output ct_sram4_csb0,
	output ct_sram4_web0,
	input [31:0] ct_sram4_dout0,

	/* output ct_sram5_csb0,
	output ct_sram5_web0,
	input [31:0] ct_sram5_dout0,

	output ct_sram6_csb0,
	output ct_sram6_web0,
	input [31:0] ct_sram6_dout0, */

	output [8:0] ct_sram_comm_addr0,
	output [31:0] ct_sram_comm_din0,

	// agent 1 memory control interface
	input agent_1_mem_ctrl_we,
	input [13:0] agent_1_mem_ctrl_addr,
	input [31:0] agent_1_mem_ctrl_in,
	output [31:0] agent_1_mem_ctrl_out,
	output agent_1_mem_ctrl_vld,
	input agent_1_mem_ctrl_req,

	// agent 1 local memory interface
	output agent_1_sram0_csb0,
	output agent_1_sram0_web0,
	input [31:0] agent_1_sram0_dout0,

	output agent_1_sram1_csb0,
	output agent_1_sram1_web0,
	input [31:0] agent_1_sram1_dout0,

	output agent_1_sram2_csb0,
	output agent_1_sram2_web0,
	input [31:0] agent_1_sram2_dout0,

	/* output agent_1_sram3_csb0,
	output agent_1_sram3_web0,
	input [31:0] agent_1_sram3_dout0,

	output agent_1_sram4_csb0,
	output agent_1_sram4_web0,
	input [31:0] agent_1_sram4_dout0, */

	output [8:0] agent_1_sram_comm_addr0,
	output [31:0] agent_1_sram_comm_din0,

	output [3:0] sram_const_wmask0,
	output sram_const_csb1,
	output [8:0] sram_const_addr1,

	// main memory interface signals
	output main_mem_we,
	output [5:0] main_mem_addr,
	output [31:0] main_mem_in,
	input [31:0] main_mem_out,

	// uart signals
	output rx_fifo_flush_enable,
    output rd_uart,
	output wr_uart,
    output [7:0] w_data,
    input tx_full,
	input rx_empty,
    input [7:0] r_data
    );

	// multicore memory controller pins
	wire mmc_cm_mem_ctrl_we;
	wire [13:0] mmc_cm_mem_ctrl_addr;
	wire [31:0] mmc_cm_mem_ctrl_in;
	wire [31:0] mmc_cm_mem_ctrl_out;
	wire mmc_cm_mem_ctrl_vld;
	wire mmc_cm_mem_ctrl_req;
	wire mmc_cm_sram0_csb0;
	wire mmc_cm_sram0_web0;
	wire [31:0] mmc_cm_sram0_dout0;
	wire mmc_cm_sram1_csb0;
	wire mmc_cm_sram1_web0;
	wire [31:0] mmc_cm_sram1_dout0;
	wire mmc_cm_sram2_csb0;
	wire mmc_cm_sram2_web0;
	wire [31:0] mmc_cm_sram2_dout0;
	wire mmc_cm_sram3_csb0;
	wire mmc_cm_sram3_web0;
	wire [31:0] mmc_cm_sram3_dout0;
	wire mmc_cm_sram4_csb0;
	wire mmc_cm_sram4_web0;
	wire [31:0] mmc_cm_sram4_dout0;
	wire mmc_cm_sram5_csb0;
	wire mmc_cm_sram5_web0;
	wire [31:0] mmc_cm_sram5_dout0;
	wire [8:0] mmc_cm_sram_comm_addr0;
	wire [31:0] mmc_cm_sram_comm_din0;
	wire mmc_ct_mem_ctrl_we;
	wire [13:0] mmc_ct_mem_ctrl_addr;
	wire [31:0] mmc_ct_mem_ctrl_in;
	wire [31:0] mmc_ct_mem_ctrl_out;
	wire mmc_ct_mem_ctrl_vld;
	wire mmc_ct_mem_ctrl_req;
	wire mmc_ct_sram0_csb0;
	wire mmc_ct_sram0_web0;
	wire [31:0] mmc_ct_sram0_dout0;
	wire mmc_ct_sram1_csb0;
	wire mmc_ct_sram1_web0;
	wire [31:0] mmc_ct_sram1_dout0;
	wire mmc_ct_sram2_csb0;
	wire mmc_ct_sram2_web0;
	wire [31:0] mmc_ct_sram2_dout0;
	wire mmc_ct_sram3_csb0;
	wire mmc_ct_sram3_web0;
	wire [31:0] mmc_ct_sram3_dout0;
	wire mmc_ct_sram4_csb0;
	wire mmc_ct_sram4_web0;
	wire [31:0] mmc_ct_sram4_dout0;
	wire mmc_ct_sram5_csb0;
	wire mmc_ct_sram5_web0;
	wire [31:0] mmc_ct_sram5_dout0;
	wire mmc_ct_sram6_csb0;
	wire mmc_ct_sram6_web0;
	wire [31:0] mmc_ct_sram6_dout0;
	wire [8:0] mmc_ct_sram_comm_addr0;
	wire [31:0] mmc_ct_sram_comm_din0;
	wire mmc_agent_1_mem_ctrl_we;
	wire [13:0] mmc_agent_1_mem_ctrl_addr;
	wire [31:0] mmc_agent_1_mem_ctrl_in;
	wire [31:0] mmc_agent_1_mem_ctrl_out;
	wire mmc_agent_1_mem_ctrl_vld;
	wire mmc_agent_1_mem_ctrl_req;
	wire mmc_agent_1_sram0_csb0;
	wire mmc_agent_1_sram0_web0;
	wire [31:0] mmc_agent_1_sram0_dout0;
	wire mmc_agent_1_sram1_csb0;
	wire mmc_agent_1_sram1_web0;
	wire [31:0] mmc_agent_1_sram1_dout0;
	wire mmc_agent_1_sram2_csb0;
	wire mmc_agent_1_sram2_web0;
	wire [31:0] mmc_agent_1_sram2_dout0;
	wire mmc_agent_1_sram3_csb0;
	wire mmc_agent_1_sram3_web0;
	wire [31:0] mmc_agent_1_sram3_dout0;
	wire mmc_agent_1_sram4_csb0;
	wire mmc_agent_1_sram4_web0;
	wire [31:0] mmc_agent_1_sram4_dout0;
	wire [8:0] mmc_agent_1_sram_comm_addr0;
	wire [31:0] mmc_agent_1_sram_comm_din0;
	wire mmc_main_mem_we;
	wire [5:0] mmc_main_mem_addr;
	wire [31:0] mmc_main_mem_in;
	wire [31:0] mmc_main_mem_out;
	wire mmc_rd_uart;
	wire mmc_wr_uart;
	wire [7:0] mmc_w_data;
	wire mmc_tx_full;
	wire mmc_rx_empty;
	wire [7:0] mmc_r_data;

	// command processor memory controller pins
	wire cpmc_cp_mem_ctrl_we;
	wire [13:0] cpmc_cp_mem_ctrl_addr;
	wire [31:0] cpmc_cp_mem_ctrl_in;
	wire [31:0] cpmc_cp_mem_ctrl_out;
	wire cpmc_cm_sram0_csb0;
	wire cpmc_cm_sram0_web0;
	wire [31:0] cpmc_cm_sram0_dout0;
	wire cpmc_cm_sram1_csb0;
	wire cpmc_cm_sram1_web0;
	wire [31:0] cpmc_cm_sram1_dout0;
	wire cpmc_cm_sram2_csb0;
	wire cpmc_cm_sram2_web0;
	wire [31:0] cpmc_cm_sram2_dout0;
	wire cpmc_cm_sram3_csb0;
	wire cpmc_cm_sram3_web0;
	wire [31:0] cpmc_cm_sram3_dout0;
	wire cpmc_cm_sram4_csb0;
	wire cpmc_cm_sram4_web0;
	wire [31:0] cpmc_cm_sram4_dout0;
	wire cpmc_cm_sram5_csb0;
	wire cpmc_cm_sram5_web0;
	wire [31:0] cpmc_cm_sram5_dout0;
	wire cpmc_ct_sram0_csb0;
	wire cpmc_ct_sram0_web0;
	wire [31:0] cpmc_ct_sram0_dout0;
	wire cpmc_ct_sram1_csb0;
	wire cpmc_ct_sram1_web0;
	wire [31:0] cpmc_ct_sram1_dout0;
	wire cpmc_ct_sram2_csb0;
	wire cpmc_ct_sram2_web0;
	wire [31:0] cpmc_ct_sram2_dout0;
	wire cpmc_ct_sram3_csb0;
	wire cpmc_ct_sram3_web0;
	wire [31:0] cpmc_ct_sram3_dout0;
	wire cpmc_ct_sram4_csb0;
	wire cpmc_ct_sram4_web0;
	wire [31:0] cpmc_ct_sram4_dout0;
	wire cpmc_ct_sram5_csb0;
	wire cpmc_ct_sram5_web0;
	wire [31:0] cpmc_ct_sram5_dout0;
	wire cpmc_ct_sram6_csb0;
	wire cpmc_ct_sram6_web0;
	wire [31:0] cpmc_ct_sram6_dout0;
	wire cpmc_agent_1_sram0_csb0;
	wire cpmc_agent_1_sram0_web0;
	wire [31:0] cpmc_agent_1_sram0_dout0;
	wire cpmc_agent_1_sram1_csb0;
	wire cpmc_agent_1_sram1_web0;
	wire [31:0] cpmc_agent_1_sram1_dout0;
	wire cpmc_agent_1_sram2_csb0;
	wire cpmc_agent_1_sram2_web0;
	wire [31:0] cpmc_agent_1_sram2_dout0;
	wire cpmc_agent_1_sram3_csb0;
	wire cpmc_agent_1_sram3_web0;
	wire [31:0] cpmc_agent_1_sram3_dout0;
	wire cpmc_agent_1_sram4_csb0;
	wire cpmc_agent_1_sram4_web0;
	wire [31:0] cpmc_agent_1_sram4_dout0;
	wire [8:0] cpmc_sram_comm_addr0;
	wire [31:0] cpmc_sram_comm_din0;
	wire cpmc_main_mem_we;
	wire [5:0] cpmc_main_mem_addr;
	wire [31:0] cpmc_main_mem_in;
	wire [31:0] cpmc_main_mem_out;

	// command processor uart pins
	wire cp_rd_uart;
	wire cp_wr_uart;
	wire [7:0] cp_w_data;
	wire cp_tx_full;
	wire cp_rx_empty;
	wire [7:0] cp_r_data;

	assign cm_mem_ctrl_out = (program_sel == 2'b00) ? mmc_cm_mem_ctrl_out : 0;
	assign cm_mem_ctrl_vld = (program_sel == 2'b00) ? mmc_cm_mem_ctrl_vld : 1'b0;

	// codemaker local memory interface
	assign cm_sram0_csb0 = (program_sel == 2'b00) ? mmc_cm_sram0_csb0 : cpmc_cm_sram0_csb0;
	assign cm_sram0_web0 = (program_sel == 2'b00) ? mmc_cm_sram0_web0 : cpmc_cm_sram0_web0;

	assign cm_sram1_csb0 = (program_sel == 2'b00) ? mmc_cm_sram1_csb0 : cpmc_cm_sram1_csb0;
	assign cm_sram1_web0 = (program_sel == 2'b00) ? mmc_cm_sram1_web0 : cpmc_cm_sram1_web0;

	assign cm_sram2_csb0 = (program_sel == 2'b00) ? mmc_cm_sram2_csb0 : cpmc_cm_sram2_csb0;
	assign cm_sram2_web0 = (program_sel == 2'b00) ? mmc_cm_sram2_web0 : cpmc_cm_sram2_web0;

	assign cm_sram3_csb0 = (program_sel == 2'b00) ? mmc_cm_sram3_csb0 : cpmc_cm_sram3_csb0;
	assign cm_sram3_web0 = (program_sel == 2'b00) ? mmc_cm_sram3_web0 : cpmc_cm_sram3_web0;

	/* assign cm_sram4_csb0 = (program_sel == 2'b00) ? mmc_cm_sram4_csb0 : cpmc_cm_sram4_csb0;
	assign cm_sram4_web0 = (program_sel == 2'b00) ? mmc_cm_sram4_web0 : cpmc_cm_sram4_web0;

	assign cm_sram5_csb0 = (program_sel == 2'b00) ? mmc_cm_sram5_csb0 : cpmc_cm_sram5_csb0;
	assign cm_sram5_web0 = (program_sel == 2'b00) ? mmc_cm_sram5_web0 : cpmc_cm_sram5_web0; */

	assign cm_sram_comm_addr0 = (program_sel == 2'b00) ? mmc_cm_sram_comm_addr0 : cpmc_sram_comm_addr0;
	assign cm_sram_comm_din0 = (program_sel == 2'b00) ? mmc_cm_sram_comm_din0 : cpmc_sram_comm_din0;

	// control tower memory control interface
	assign ct_mem_ctrl_out = (program_sel == 2'b00) ? mmc_ct_mem_ctrl_out : 0;
	assign ct_mem_ctrl_vld = (program_sel == 2'b00) ? mmc_ct_mem_ctrl_vld : 1'b0;

	// control tower local memory ct_interface
	assign ct_sram0_csb0 = (program_sel == 2'b00) ? mmc_ct_sram0_csb0 : cpmc_ct_sram0_csb0;
	assign ct_sram0_web0 = (program_sel == 2'b00) ? mmc_ct_sram0_web0 : cpmc_ct_sram0_web0;

	assign ct_sram1_csb0 = (program_sel == 2'b00) ? mmc_ct_sram1_csb0 : cpmc_ct_sram1_csb0;
	assign ct_sram1_web0 = (program_sel == 2'b00) ? mmc_ct_sram1_web0 : cpmc_ct_sram1_web0;

	assign ct_sram2_csb0 = (program_sel == 2'b00) ? mmc_ct_sram2_csb0 : cpmc_ct_sram2_csb0;
	assign ct_sram2_web0 = (program_sel == 2'b00) ? mmc_ct_sram2_web0 : cpmc_ct_sram2_web0;

	assign ct_sram3_csb0 = (program_sel == 2'b00) ? mmc_ct_sram3_csb0 : cpmc_ct_sram3_csb0;
	assign ct_sram3_web0 = (program_sel == 2'b00) ? mmc_ct_sram3_web0 : cpmc_ct_sram3_web0;

	assign ct_sram4_csb0 = (program_sel == 2'b00) ? mmc_ct_sram4_csb0 : cpmc_ct_sram4_csb0;
	assign ct_sram4_web0 = (program_sel == 2'b00) ? mmc_ct_sram4_web0 : cpmc_ct_sram4_web0;

	/* assign ct_sram5_csb0 = (program_sel == 2'b00) ? mmc_ct_sram5_csb0 : cpmc_ct_sram5_csb0;
	assign ct_sram5_web0 = (program_sel == 2'b00) ? mmc_ct_sram5_web0 : cpmc_ct_sram5_web0;

	assign ct_sram6_csb0 = (program_sel == 2'b00) ? mmc_ct_sram6_csb0 : cpmc_ct_sram6_csb0;
	assign ct_sram6_web0 = (program_sel == 2'b00) ? mmc_ct_sram6_web0 : cpmc_ct_sram6_web0; */

	assign ct_sram_comm_addr0 = (program_sel == 2'b00) ? mmc_ct_sram_comm_addr0 : cpmc_sram_comm_addr0;
	assign ct_sram_comm_din0 = (program_sel == 2'b00) ? mmc_ct_sram_comm_din0 : cpmc_sram_comm_din0;

	// agent 1 memory control interface
	assign agent_1_mem_ctrl_out = (program_sel == 2'b00) ? mmc_agent_1_mem_ctrl_out : 0;
	assign agent_1_mem_ctrl_vld = (program_sel == 2'b00) ? mmc_agent_1_mem_ctrl_vld : 1'b0;

	// agent 1 local memory interface
	assign agent_1_sram0_csb0 = (program_sel == 2'b00) ? mmc_agent_1_sram0_csb0 : cpmc_agent_1_sram0_csb0;
	assign agent_1_sram0_web0 = (program_sel == 2'b00) ? mmc_agent_1_sram0_web0 : cpmc_agent_1_sram0_web0;

	assign agent_1_sram1_csb0 = (program_sel == 2'b00) ? mmc_agent_1_sram1_csb0 : cpmc_agent_1_sram1_csb0;
	assign agent_1_sram1_web0 = (program_sel == 2'b00) ? mmc_agent_1_sram1_web0 : cpmc_agent_1_sram1_web0;

	assign agent_1_sram2_csb0 = (program_sel == 2'b00) ? mmc_agent_1_sram2_csb0 : cpmc_agent_1_sram2_csb0;
	assign agent_1_sram2_web0 = (program_sel == 2'b00) ? mmc_agent_1_sram2_web0 : cpmc_agent_1_sram2_web0;

	/* assign agent_1_sram3_csb0 = (program_sel == 2'b00) ? mmc_agent_1_sram3_csb0 : cpmc_agent_1_sram3_csb0;
	assign agent_1_sram3_web0 = (program_sel == 2'b00) ? mmc_agent_1_sram3_web0 : cpmc_agent_1_sram3_web0;

	assign agent_1_sram4_csb0 = (program_sel == 2'b00) ? mmc_agent_1_sram4_csb0 : cpmc_agent_1_sram4_csb0;
	assign agent_1_sram4_web0 = (program_sel == 2'b00) ? mmc_agent_1_sram4_web0 : cpmc_agent_1_sram4_web0; */

	assign agent_1_sram_comm_addr0 = (program_sel == 2'b00) ? mmc_agent_1_sram_comm_addr0 : cpmc_sram_comm_addr0;
	assign agent_1_sram_comm_din0 = (program_sel == 2'b00) ? mmc_agent_1_sram_comm_din0 : cpmc_sram_comm_din0;

	assign sram_const_wmask0	= 4'hf;
	assign sram_const_csb1		= 1'b1;
	assign sram_const_addr1		= 0;

	// main memory interface signals
	assign main_mem_we = (program_sel == 2'b00) ? mmc_main_mem_we : cpmc_main_mem_we;
	assign main_mem_addr = (program_sel == 2'b00) ? mmc_main_mem_addr : cpmc_main_mem_addr;
	assign main_mem_in = (program_sel == 2'b00) ? mmc_main_mem_in : cpmc_main_mem_in;

	// uart signals
	assign rx_fifo_flush_enable = 0;
    assign rd_uart = (program_sel == 2'b00) ? mmc_rd_uart : cp_rd_uart;
	assign wr_uart = (program_sel == 2'b00) ? mmc_wr_uart : cp_wr_uart;
    assign w_data = (program_sel == 2'b00) ? mmc_w_data : cp_w_data;

	// multicore memory controller codemaker memory control interface
	assign mmc_cm_mem_ctrl_we = (program_sel == 2'b00) ? cm_mem_ctrl_we : 0;
	assign mmc_cm_mem_ctrl_addr = (program_sel == 2'b00) ? cm_mem_ctrl_addr : 0;
	assign mmc_cm_mem_ctrl_in = (program_sel == 2'b00) ? cm_mem_ctrl_in : 0;
	assign mmc_cm_mem_ctrl_req = (program_sel == 2'b00) ? cm_mem_ctrl_req : 0;

	// multicore memory controller codemaker local memory interface
	assign mmc_cm_sram0_dout0 = (program_sel == 2'b00) ? cm_sram0_dout0 : 0;
	assign mmc_cm_sram1_dout0 = (program_sel == 2'b00) ? cm_sram1_dout0 : 0;
	assign mmc_cm_sram2_dout0 = (program_sel == 2'b00) ? cm_sram2_dout0 : 0;
	assign mmc_cm_sram3_dout0 = (program_sel == 2'b00) ? cm_sram3_dout0 : 0;
	/* assign mmc_cm_sram4_dout0 = (program_sel == 2'b00) ? cm_sram4_dout0 : 0;
	assign mmc_cm_sram5_dout0 = (program_sel == 2'b00) ? cm_sram5_dout0 : 0; */

	// multicore memory controller control tower memory control interface
	assign mmc_ct_mem_ctrl_we = (program_sel == 2'b00) ? ct_mem_ctrl_we : 0;
	assign mmc_ct_mem_ctrl_addr = (program_sel == 2'b00) ? ct_mem_ctrl_addr : 0;
	assign mmc_ct_mem_ctrl_in = (program_sel == 2'b00) ? ct_mem_ctrl_in : 0;
	assign mmc_ct_mem_ctrl_req = (program_sel == 2'b00) ? ct_mem_ctrl_req : 0;

	// multicore memory controller control tower local memory ct_interface
	assign mmc_ct_sram0_dout0 = (program_sel == 2'b00) ? ct_sram0_dout0 : 0;
	assign mmc_ct_sram1_dout0 = (program_sel == 2'b00) ? ct_sram1_dout0 : 0;
	assign mmc_ct_sram2_dout0 = (program_sel == 2'b00) ? ct_sram2_dout0 : 0;
	assign mmc_ct_sram3_dout0 = (program_sel == 2'b00) ? ct_sram3_dout0 : 0;
	assign mmc_ct_sram4_dout0 = (program_sel == 2'b00) ? ct_sram4_dout0 : 0;
	/* assign mmc_ct_sram5_dout0 = (program_sel == 2'b00) ? ct_sram5_dout0 : 0;
	assign mmc_ct_sram6_dout0 = (program_sel == 2'b00) ? ct_sram6_dout0 : 0; */

	// multicore memory controller agent 1 memory control interface
	assign mmc_agent_1_mem_ctrl_we = (program_sel == 2'b00) ? agent_1_mem_ctrl_we : 0;
	assign mmc_agent_1_mem_ctrl_addr = (program_sel == 2'b00) ? agent_1_mem_ctrl_addr : 0;
	assign mmc_agent_1_mem_ctrl_in = (program_sel == 2'b00) ? agent_1_mem_ctrl_in : 0;
	assign mmc_agent_1_mem_ctrl_req = (program_sel == 2'b00) ? agent_1_mem_ctrl_req : 0;

	// multicore memory controller agent 1 local memory interface
	assign mmc_agent_1_sram0_dout0 = (program_sel == 2'b00) ? agent_1_sram0_dout0 : 0;
	assign mmc_agent_1_sram1_dout0 = (program_sel == 2'b00) ? agent_1_sram1_dout0 : 0;
	assign mmc_agent_1_sram2_dout0 = (program_sel == 2'b00) ? agent_1_sram2_dout0 : 0;
	/* assign mmc_agent_1_sram3_dout0 = (program_sel == 2'b00) ? agent_1_sram3_dout0 : 0;
	assign mmc_agent_1_sram4_dout0 = (program_sel == 2'b00) ? agent_1_sram4_dout0 : 0; */

	// multicore memory controller main memory interface signals
	assign mmc_main_mem_out = (program_sel == 2'b00) ? main_mem_out : 0;

	// multicore memory controller uart signals
    assign mmc_tx_full = (program_sel == 2'b00) ? tx_full : 0;
	assign mmc_rx_empty = (program_sel == 2'b00) ? rx_empty : 0;
    assign mmc_r_data = (program_sel == 2'b00) ? r_data : 0;

	// command processor memory controller codemaker local memory interface
	assign cpmc_cm_sram0_dout0 = (program_sel == 2'b00) ? 0 : cm_sram0_dout0;
	assign cpmc_cm_sram1_dout0 = (program_sel == 2'b00) ? 0 : cm_sram1_dout0;
	assign cpmc_cm_sram2_dout0 = (program_sel == 2'b00) ? 0 : cm_sram2_dout0;
	assign cpmc_cm_sram3_dout0 = (program_sel == 2'b00) ? 0 : cm_sram3_dout0;
	/* assign cpmc_cm_sram4_dout0 = (program_sel == 2'b00) ? 0 : cm_sram4_dout0;
	assign cpmc_cm_sram5_dout0 = (program_sel == 2'b00) ? 0 : cm_sram5_dout0; */

	// command processor memory controller control tower local memory ct_interface
	assign cpmc_ct_sram0_dout0 = (program_sel == 2'b00) ? 0 : ct_sram0_dout0;
	assign cpmc_ct_sram1_dout0 = (program_sel == 2'b00) ? 0 : ct_sram1_dout0;
	assign cpmc_ct_sram2_dout0 = (program_sel == 2'b00) ? 0 : ct_sram2_dout0;
	assign cpmc_ct_sram3_dout0 = (program_sel == 2'b00) ? 0 : ct_sram3_dout0;
	assign cpmc_ct_sram4_dout0 = (program_sel == 2'b00) ? 0 : ct_sram4_dout0;
	/* assign cpmc_ct_sram5_dout0 = (program_sel == 2'b00) ? 0 : ct_sram5_dout0;
	assign cpmc_ct_sram6_dout0 = (program_sel == 2'b00) ? 0 : ct_sram6_dout0; */

	// command processor memory controller agent 1 local memory interface
	assign cpmc_agent_1_sram0_dout0 = (program_sel == 2'b00) ? 0 : agent_1_sram0_dout0;
	assign cpmc_agent_1_sram1_dout0 = (program_sel == 2'b00) ? 0 : agent_1_sram1_dout0;
	assign cpmc_agent_1_sram2_dout0 = (program_sel == 2'b00) ? 0 : agent_1_sram2_dout0;
	/* assign cpmc_agent_1_sram3_dout0 = (program_sel == 2'b00) ? 0 : agent_1_sram3_dout0;
	assign cpmc_agent_1_sram4_dout0 = (program_sel == 2'b00) ? 0 : agent_1_sram4_dout0; */

	// command processor memory controller main memory interface signals
	assign cpmc_main_mem_out = (program_sel == 2'b00) ? 0 : main_mem_out;

	// multicore memory controller uart signals
    assign cp_tx_full = (program_sel == 2'b00) ? 0 : tx_full;
	assign cp_rx_empty = (program_sel == 2'b00) ? 0 : rx_empty;
    assign cp_r_data = (program_sel == 2'b00) ? 0 : r_data;
    
    reset_circuit inst_reset_circuit(
	
	.clk(clk),
	.rst(rst),
	.rst_asserted(rst_asserted)
	
	);

	// codemaker memory controller
	multicore_mem_controller inst_multicore_mem_controller(

		// clock and reset interface
		.clk(clk),
		.rst(rst_asserted),

		// codemaker memory control interface
		.cm_mem_ctrl_we(mmc_cm_mem_ctrl_we),
		.cm_mem_ctrl_addr(mmc_cm_mem_ctrl_addr),
		.cm_mem_ctrl_in(mmc_cm_mem_ctrl_in),
		.cm_mem_ctrl_out(mmc_cm_mem_ctrl_out),
		.cm_mem_ctrl_vld(mmc_cm_mem_ctrl_vld),
		.cm_mem_ctrl_req(mmc_cm_mem_ctrl_req),

		// codemaker local memory interface
		.cm_sram0_csb0(mmc_cm_sram0_csb0),
		.cm_sram0_web0(mmc_cm_sram0_web0),
		.cm_sram0_dout0(mmc_cm_sram0_dout0),

		.cm_sram1_csb0(mmc_cm_sram1_csb0),
		.cm_sram1_web0(mmc_cm_sram1_web0),
		.cm_sram1_dout0(mmc_cm_sram1_dout0),

		.cm_sram2_csb0(mmc_cm_sram2_csb0),
		.cm_sram2_web0(mmc_cm_sram2_web0),
		.cm_sram2_dout0(mmc_cm_sram2_dout0),

		.cm_sram3_csb0(mmc_cm_sram3_csb0),
		.cm_sram3_web0(mmc_cm_sram3_web0),
		.cm_sram3_dout0(mmc_cm_sram3_dout0),

		.cm_sram4_csb0(mmc_cm_sram4_csb0),
		.cm_sram4_web0(mmc_cm_sram4_web0),
		.cm_sram4_dout0(mmc_cm_sram4_dout0),

		.cm_sram5_csb0(mmc_cm_sram5_csb0),
		.cm_sram5_web0(mmc_cm_sram5_web0),
		.cm_sram5_dout0(mmc_cm_sram5_dout0),

		.cm_sram_comm_addr0(mmc_cm_sram_comm_addr0),
		.cm_sram_comm_din0(mmc_cm_sram_comm_din0),

		// control tower memory control interface
		.ct_mem_ctrl_we(mmc_ct_mem_ctrl_we),
		.ct_mem_ctrl_addr(mmc_ct_mem_ctrl_addr),
		.ct_mem_ctrl_in(mmc_ct_mem_ctrl_in),
		.ct_mem_ctrl_out(mmc_ct_mem_ctrl_out),
		.ct_mem_ctrl_vld(mmc_ct_mem_ctrl_vld),
		.ct_mem_ctrl_req(mmc_ct_mem_ctrl_req),

		// control tower local memory ct_interface
		.ct_sram0_csb0(mmc_ct_sram0_csb0),
		.ct_sram0_web0(mmc_ct_sram0_web0),
		.ct_sram0_dout0(mmc_ct_sram0_dout0),

		.ct_sram1_csb0(mmc_ct_sram1_csb0),
		.ct_sram1_web0(mmc_ct_sram1_web0),
		.ct_sram1_dout0(mmc_ct_sram1_dout0),

		.ct_sram2_csb0(mmc_ct_sram2_csb0),
		.ct_sram2_web0(mmc_ct_sram2_web0),
		.ct_sram2_dout0(mmc_ct_sram2_dout0),

		.ct_sram3_csb0(mmc_ct_sram3_csb0),
		.ct_sram3_web0(mmc_ct_sram3_web0),
		.ct_sram3_dout0(mmc_ct_sram3_dout0),

		.ct_sram4_csb0(mmc_ct_sram4_csb0),
		.ct_sram4_web0(mmc_ct_sram4_web0),
		.ct_sram4_dout0(mmc_ct_sram4_dout0),

		.ct_sram5_csb0(mmc_ct_sram5_csb0),
		.ct_sram5_web0(mmc_ct_sram5_web0),
		.ct_sram5_dout0(mmc_ct_sram5_dout0),

		.ct_sram6_csb0(mmc_ct_sram6_csb0),
		.ct_sram6_web0(mmc_ct_sram6_web0),
		.ct_sram6_dout0(mmc_ct_sram6_dout0),

		.ct_sram_comm_addr0(mmc_ct_sram_comm_addr0),
		.ct_sram_comm_din0(mmc_ct_sram_comm_din0),

		// agent 1 memory control interface
		.agent_1_mem_ctrl_we(mmc_agent_1_mem_ctrl_we),
		.agent_1_mem_ctrl_addr(mmc_agent_1_mem_ctrl_addr),
		.agent_1_mem_ctrl_in(mmc_agent_1_mem_ctrl_in),
		.agent_1_mem_ctrl_out(mmc_agent_1_mem_ctrl_out),
		.agent_1_mem_ctrl_vld(mmc_agent_1_mem_ctrl_vld),
		.agent_1_mem_ctrl_req(mmc_agent_1_mem_ctrl_req),

		// agent 1 local memory interface
		.agent_1_sram0_csb0(mmc_agent_1_sram0_csb0),
		.agent_1_sram0_web0(mmc_agent_1_sram0_web0),
		.agent_1_sram0_dout0(mmc_agent_1_sram0_dout0),

		.agent_1_sram1_csb0(mmc_agent_1_sram1_csb0),
		.agent_1_sram1_web0(mmc_agent_1_sram1_web0),
		.agent_1_sram1_dout0(mmc_agent_1_sram1_dout0),

		.agent_1_sram2_csb0(mmc_agent_1_sram2_csb0),
		.agent_1_sram2_web0(mmc_agent_1_sram2_web0),
		.agent_1_sram2_dout0(mmc_agent_1_sram2_dout0),

		.agent_1_sram3_csb0(mmc_agent_1_sram3_csb0),
		.agent_1_sram3_web0(mmc_agent_1_sram3_web0),
		.agent_1_sram3_dout0(mmc_agent_1_sram3_dout0),

		.agent_1_sram4_csb0(mmc_agent_1_sram4_csb0),
		.agent_1_sram4_web0(mmc_agent_1_sram4_web0),
		.agent_1_sram4_dout0(mmc_agent_1_sram4_dout0),

		.agent_1_sram_comm_addr0(mmc_agent_1_sram_comm_addr0),
		.agent_1_sram_comm_din0(mmc_agent_1_sram_comm_din0),

		// main memory interface signals
		.main_mem_we(mmc_main_mem_we),
		.main_mem_addr(mmc_main_mem_addr),
		.main_mem_in(mmc_main_mem_in),
		.main_mem_out(mmc_main_mem_out),

		// uart signals
		.rx_fifo_flush_enable(),
		.rd_uart(mmc_rd_uart),
		.wr_uart(mmc_wr_uart),
		.w_data(mmc_w_data),
		.tx_full(mmc_tx_full),
		.rx_empty(mmc_rx_empty),
		.r_data(mmc_r_data)
	);

	command_processor_mem_controller inst_command_processor_mem_controller(
		// clock and reset interface
		.clk(clk),
		.rst(rst_asserted),

		// program select bits
		.program_sel(program_sel),

		// command processor memory control interface
		.cp_mem_ctrl_we(cpmc_cp_mem_ctrl_we),
		.cp_mem_ctrl_addr(cpmc_cp_mem_ctrl_addr),
		.cp_mem_ctrl_in(cpmc_cp_mem_ctrl_in),
		.cp_mem_ctrl_out(cpmc_cp_mem_ctrl_out),

		// codemaker local memory interface
		.cm_sram0_csb0(cpmc_cm_sram0_csb0),
		.cm_sram0_web0(cpmc_cm_sram0_web0),
		.cm_sram0_dout0(cpmc_cm_sram0_dout0),

		.cm_sram1_csb0(cpmc_cm_sram1_csb0),
		.cm_sram1_web0(cpmc_cm_sram1_web0),
		.cm_sram1_dout0(cpmc_cm_sram1_dout0),

		.cm_sram2_csb0(cpmc_cm_sram2_csb0),
		.cm_sram2_web0(cpmc_cm_sram2_web0),
		.cm_sram2_dout0(cpmc_cm_sram2_dout0),

		.cm_sram3_csb0(cpmc_cm_sram3_csb0),
		.cm_sram3_web0(cpmc_cm_sram3_web0),
		.cm_sram3_dout0(cpmc_cm_sram3_dout0),

		.cm_sram4_csb0(cpmc_cm_sram4_csb0),
		.cm_sram4_web0(cpmc_cm_sram4_web0),
		.cm_sram4_dout0(cpmc_cm_sram4_dout0),

		.cm_sram5_csb0(cpmc_cm_sram5_csb0),
		.cm_sram5_web0(cpmc_cm_sram5_web0),
		.cm_sram5_dout0(cpmc_cm_sram5_dout0),

		// control tower local memory ct_interface
		.ct_sram0_csb0(cpmc_ct_sram0_csb0),
		.ct_sram0_web0(cpmc_ct_sram0_web0),
		.ct_sram0_dout0(cpmc_ct_sram0_dout0),

		.ct_sram1_csb0(cpmc_ct_sram1_csb0),
		.ct_sram1_web0(cpmc_ct_sram1_web0),
		.ct_sram1_dout0(cpmc_ct_sram1_dout0),

		.ct_sram2_csb0(cpmc_ct_sram2_csb0),
		.ct_sram2_web0(cpmc_ct_sram2_web0),
		.ct_sram2_dout0(cpmc_ct_sram2_dout0),

		.ct_sram3_csb0(cpmc_ct_sram3_csb0),
		.ct_sram3_web0(cpmc_ct_sram3_web0),
		.ct_sram3_dout0(cpmc_ct_sram3_dout0),

		.ct_sram4_csb0(cpmc_ct_sram4_csb0),
		.ct_sram4_web0(cpmc_ct_sram4_web0),
		.ct_sram4_dout0(cpmc_ct_sram4_dout0),

		.ct_sram5_csb0(cpmc_ct_sram5_csb0),
		.ct_sram5_web0(cpmc_ct_sram5_web0),
		.ct_sram5_dout0(cpmc_ct_sram5_dout0),

		.ct_sram6_csb0(cpmc_ct_sram6_csb0),
		.ct_sram6_web0(cpmc_ct_sram6_web0),
		.ct_sram6_dout0(cpmc_ct_sram6_dout0),

		// agent 1 local memory interface
		.agent_1_sram0_csb0(cpmc_agent_1_sram0_csb0),
		.agent_1_sram0_web0(cpmc_agent_1_sram0_web0),
		.agent_1_sram0_dout0(cpmc_agent_1_sram0_dout0),

		.agent_1_sram1_csb0(cpmc_agent_1_sram1_csb0),
		.agent_1_sram1_web0(cpmc_agent_1_sram1_web0),
		.agent_1_sram1_dout0(cpmc_agent_1_sram1_dout0),

		.agent_1_sram2_csb0(cpmc_agent_1_sram2_csb0),
		.agent_1_sram2_web0(cpmc_agent_1_sram2_web0),
		.agent_1_sram2_dout0(cpmc_agent_1_sram2_dout0),

		.agent_1_sram3_csb0(cpmc_agent_1_sram3_csb0),
		.agent_1_sram3_web0(cpmc_agent_1_sram3_web0),
		.agent_1_sram3_dout0(cpmc_agent_1_sram3_dout0),

		.agent_1_sram4_csb0(cpmc_agent_1_sram4_csb0),
		.agent_1_sram4_web0(cpmc_agent_1_sram4_web0),
		.agent_1_sram4_dout0(cpmc_agent_1_sram4_dout0),

		.sram_comm_addr0(cpmc_sram_comm_addr0),
		.sram_comm_din0(cpmc_sram_comm_din0),

		// main memory interface signals
		.main_mem_we(cpmc_main_mem_we),
		.main_mem_addr(cpmc_main_mem_addr),
		.main_mem_in(cpmc_main_mem_in),
		.main_mem_out(cpmc_main_mem_out)
	    );

	uart_cp inst_uart_cp(
	    .clk(clk),
		.rst(rst_asserted),
	    .enable(|program_sel),
	
		.mem_wea(cpmc_cp_mem_ctrl_we),
		.mem_addra(cpmc_cp_mem_ctrl_addr),
		.mem_dina(cpmc_cp_mem_ctrl_in),
		.mem_douta(cpmc_cp_mem_ctrl_out),

		// uart signals
		.rx_fifo_flush_enable(),
		.rd_uart(cp_rd_uart),
		.wr_uart(cp_wr_uart),
		.w_data(cp_w_data),
		.tx_full(cp_tx_full),
		.rx_empty(cp_rx_empty),
		.r_data(cp_r_data)
	);
endmodule
