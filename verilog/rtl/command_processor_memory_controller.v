module command_processor_mem_controller(
	// clock and reset interface
	input clk,
	input rst,

	// program select bits
	input [1:0] program_sel,

	// command processor memory control interface
	input cp_mem_ctrl_we,
	input [13:0] cp_mem_ctrl_addr,
	input [31:0] cp_mem_ctrl_in,
	output [31:0] cp_mem_ctrl_out,

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

	output cm_sram4_csb0,
	output cm_sram4_web0,
	input [31:0] cm_sram4_dout0,

	output cm_sram5_csb0,
	output cm_sram5_web0,
	input [31:0] cm_sram5_dout0,

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

	output ct_sram5_csb0,
	output ct_sram5_web0,
	input [31:0] ct_sram5_dout0,

	output ct_sram6_csb0,
	output ct_sram6_web0,
	input [31:0] ct_sram6_dout0,

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

	output agent_1_sram3_csb0,
	output agent_1_sram3_web0,
	input [31:0] agent_1_sram3_dout0,

	output agent_1_sram4_csb0,
	output agent_1_sram4_web0,
	input [31:0] agent_1_sram4_dout0,

	output [8:0] sram_comm_addr0,
	output [31:0] sram_comm_din0,

	// main memory interface signals
	output main_mem_we,
	output [5:0] main_mem_addr,
	output [31:0] main_mem_in,
	input [31:0] main_mem_out
    );

	reg  [5:0] SRAM_dout_sel;
	reg  [1:0] VSCPU_dout_sel;

	assign cm_sram0_csb0		= ~(program_sel == 2'b01 && cp_mem_ctrl_addr[13:9] == 5'b00000);
	assign cm_sram0_web0		= ~(program_sel == 2'b01 && cp_mem_ctrl_addr[13:9] == 5'b00000 && cp_mem_ctrl_we);

	assign cm_sram1_csb0		= ~(program_sel == 2'b01 && cp_mem_ctrl_addr[13:9] == 5'b00001);
	assign cm_sram1_web0		= ~(program_sel == 2'b01 && cp_mem_ctrl_addr[13:9] == 5'b00001 && cp_mem_ctrl_we);

	assign cm_sram2_csb0		= ~(program_sel == 2'b01 && cp_mem_ctrl_addr[13:9] == 5'b00010);
	assign cm_sram2_web0		= ~(program_sel == 2'b01 && cp_mem_ctrl_addr[13:9] == 5'b00010 && cp_mem_ctrl_we);

	assign cm_sram3_csb0		= ~(program_sel == 2'b01 && cp_mem_ctrl_addr[13:9] == 5'b00011);
	assign cm_sram3_web0		= ~(program_sel == 2'b01 && cp_mem_ctrl_addr[13:9] == 5'b00011 && cp_mem_ctrl_we);

	assign cm_sram4_csb0		= ~(program_sel == 2'b01 && cp_mem_ctrl_addr[13:9] == 5'b00100);
	assign cm_sram4_web0		= ~(program_sel == 2'b01 && cp_mem_ctrl_addr[13:9] == 5'b00100 && cp_mem_ctrl_we);

	assign cm_sram5_csb0		= ~(program_sel == 2'b01 && cp_mem_ctrl_addr[13:9] == 5'b00101);
	assign cm_sram5_web0		= ~(program_sel == 2'b01 && cp_mem_ctrl_addr[13:9] == 5'b00101 && cp_mem_ctrl_we);

	assign ct_sram0_csb0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00000);
	assign ct_sram0_web0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00000 && cp_mem_ctrl_we);

	assign ct_sram1_csb0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00001);
	assign ct_sram1_web0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00001 && cp_mem_ctrl_we);

	assign ct_sram2_csb0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00010);
	assign ct_sram2_web0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00010 && cp_mem_ctrl_we);

	assign ct_sram3_csb0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00011);
	assign ct_sram3_web0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00011 && cp_mem_ctrl_we);

	assign ct_sram4_csb0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00100);
	assign ct_sram4_web0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00100 && cp_mem_ctrl_we);

	assign ct_sram5_csb0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00101);
	assign ct_sram5_web0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00101 && cp_mem_ctrl_we);

	assign ct_sram6_csb0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00110);
	assign ct_sram6_web0		= ~(program_sel == 2'b10 && cp_mem_ctrl_addr[13:9] == 5'b00110 && cp_mem_ctrl_we);

	assign agent_1_sram0_csb0	= ~(program_sel == 2'b11 && cp_mem_ctrl_addr[13:9] == 5'b00000);
	assign agent_1_sram0_web0	= ~(program_sel == 2'b11 && cp_mem_ctrl_addr[13:9] == 5'b00000 && cp_mem_ctrl_we);

	assign agent_1_sram1_csb0	= ~(program_sel == 2'b11 && cp_mem_ctrl_addr[13:9] == 5'b00001);
	assign agent_1_sram1_web0	= ~(program_sel == 2'b11 && cp_mem_ctrl_addr[13:9] == 5'b00001 && cp_mem_ctrl_we);

	assign agent_1_sram2_csb0	= ~(program_sel == 2'b11 && cp_mem_ctrl_addr[13:9] == 5'b00010);
	assign agent_1_sram2_web0	= ~(program_sel == 2'b11 && cp_mem_ctrl_addr[13:9] == 5'b00010 && cp_mem_ctrl_we);

	assign agent_1_sram3_csb0	= ~(program_sel == 2'b11 && cp_mem_ctrl_addr[13:9] == 5'b00011);
	assign agent_1_sram3_web0	= ~(program_sel == 2'b11 && cp_mem_ctrl_addr[13:9] == 5'b00011 && cp_mem_ctrl_we);

	assign agent_1_sram4_csb0	= ~(program_sel == 2'b11 && cp_mem_ctrl_addr[13:9] == 5'b00100);
	assign agent_1_sram4_web0	= ~(program_sel == 2'b11 && cp_mem_ctrl_addr[13:9] == 5'b00100 && cp_mem_ctrl_we);

	assign main_mem_we			= program_sel != 2'b00 && cp_mem_ctrl_addr[13:8] == 6'b100000 && cp_mem_ctrl_we;

	assign cp_mem_ctrl_out		= (VSCPU_dout_sel == 2'b01 && SRAM_dout_sel[5:1] == 5'b00000) ? cm_sram0_dout0
								: (VSCPU_dout_sel == 2'b01 && SRAM_dout_sel[5:1] == 5'b00001) ? cm_sram1_dout0
								: (VSCPU_dout_sel == 2'b01 && SRAM_dout_sel[5:1] == 5'b00010) ? cm_sram2_dout0
								: (VSCPU_dout_sel == 2'b01 && SRAM_dout_sel[5:1] == 5'b00011) ? cm_sram3_dout0
								: (VSCPU_dout_sel == 2'b01 && SRAM_dout_sel[5:1] == 5'b00100) ? cm_sram4_dout0
								: (VSCPU_dout_sel == 2'b01 && SRAM_dout_sel[5:1] == 5'b00101) ? cm_sram5_dout0
								: (VSCPU_dout_sel == 2'b10 && SRAM_dout_sel[5:1] == 5'b00000) ? ct_sram0_dout0
								: (VSCPU_dout_sel == 2'b10 && SRAM_dout_sel[5:1] == 5'b00001) ? ct_sram1_dout0
								: (VSCPU_dout_sel == 2'b10 && SRAM_dout_sel[5:1] == 5'b00010) ? ct_sram2_dout0
								: (VSCPU_dout_sel == 2'b10 && SRAM_dout_sel[5:1] == 5'b00011) ? ct_sram3_dout0
								: (VSCPU_dout_sel == 2'b10 && SRAM_dout_sel[5:1] == 5'b00100) ? ct_sram4_dout0
								: (VSCPU_dout_sel == 2'b10 && SRAM_dout_sel[5:1] == 5'b00101) ? ct_sram5_dout0
								: (VSCPU_dout_sel == 2'b10 && SRAM_dout_sel[5:1] == 5'b00110) ? ct_sram6_dout0
								: (VSCPU_dout_sel == 2'b11 && SRAM_dout_sel[5:1] == 5'b00000) ? agent_1_sram0_dout0
								: (VSCPU_dout_sel == 2'b11 && SRAM_dout_sel[5:1] == 5'b00001) ? agent_1_sram1_dout0
								: (VSCPU_dout_sel == 2'b11 && SRAM_dout_sel[5:1] == 5'b00010) ? agent_1_sram2_dout0
								: (VSCPU_dout_sel == 2'b11 && SRAM_dout_sel[5:1] == 5'b00011) ? agent_1_sram3_dout0
								: (VSCPU_dout_sel == 2'b11 && SRAM_dout_sel[5:1] == 5'b00100) ? agent_1_sram4_dout0
								: (VSCPU_dout_sel != 2'b00 && SRAM_dout_sel == 6'b100000) ? main_mem_out : 0;

	assign sram_comm_addr0 		= cp_mem_ctrl_addr[8:0];
	assign sram_comm_din0 		= cp_mem_ctrl_in;

	assign main_mem_addr		= cp_mem_ctrl_addr[5:0];
	assign main_mem_in			= cp_mem_ctrl_in;

	always @(posedge clk) SRAM_dout_sel <= cp_mem_ctrl_addr[13:8];
	always @(posedge clk) VSCPU_dout_sel <= program_sel;

endmodule
