module multicore_mem_controller(
	// clock and reset interface
	input clk,
	input rst,

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

	output cm_sram4_csb0,
	output cm_sram4_web0,
	input [31:0] cm_sram4_dout0,

	output cm_sram5_csb0,
	output cm_sram5_web0,
	input [31:0] cm_sram5_dout0,

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

	output ct_sram5_csb0,
	output ct_sram5_web0,
	input [31:0] ct_sram5_dout0,

	output ct_sram6_csb0,
	output ct_sram6_web0,
	input [31:0] ct_sram6_dout0,

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

	output agent_1_sram3_csb0,
	output agent_1_sram3_web0,
	input [31:0] agent_1_sram3_dout0,

	output agent_1_sram4_csb0,
	output agent_1_sram4_web0,
	input [31:0] agent_1_sram4_dout0,

	output [8:0] agent_1_sram_comm_addr0,
	output [31:0] agent_1_sram_comm_din0,

	// main memory interface signals
	output reg main_mem_we,
	output reg [5:0] main_mem_addr,
	output reg [31:0] main_mem_in,
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

	// codemaker's main memory interface signals
	wire cm_main_mem_we;
	wire [`MAIN_MEMORY_ADDR_BITS-1:0] cm_main_mem_addr;
	wire [31:0] cm_main_mem_in;
	reg [31:0] cm_main_mem_out;
	wire cm_main_mem_req;
	wire cm_main_mem_grant;

	// control tower's memory control interface signals
	wire ct_main_mem_we;
	wire [`MAIN_MEMORY_ADDR_BITS-1:0] ct_main_mem_addr;
	wire [31:0] ct_main_mem_in;
	reg [31:0] ct_main_mem_out;
	wire ct_main_mem_req;
	wire ct_main_mem_grant;

	// agent 1's main memory interface signals
	wire agent_1_main_mem_we;
	wire [`MAIN_MEMORY_ADDR_BITS-1:0] agent_1_main_mem_addr;
	wire [31:0] agent_1_main_mem_in;
	reg [31:0] agent_1_main_mem_out;
	wire agent_1_main_mem_req;
	wire agent_1_main_mem_grant;

	// round-robin arbiter interface signals
	wire [(`NUMBER_OF_AGENTS+2)-1:0] requests;
	wire [(`NUMBER_OF_AGENTS+2)-1:0] grant;

	// arrange arbiter request and grant signals
	assign requests = {cm_main_mem_req, ct_main_mem_req, agent_1_main_mem_req};
	assign {cm_main_mem_grant, ct_main_mem_grant, agent_1_main_mem_grant} = grant;

	// codemaker memory controller
	codemaker_memory_controller inst_codemaker_memory_controller(

		// clock and reset interface
		.clk(clk),
		.rst(rst),

		// codemaker memory controller interface
		.mem_ctrl_we(cm_mem_ctrl_we),
		.mem_ctrl_addr(cm_mem_ctrl_addr),
		.mem_ctrl_in(cm_mem_ctrl_in),
		.mem_ctrl_out(cm_mem_ctrl_out),
		.mem_ctrl_vld(cm_mem_ctrl_vld),
		.mem_ctrl_req(cm_mem_ctrl_req),

		// codemaker main memory interface
		.main_mem_we(cm_main_mem_we),
		.main_mem_addr(cm_main_mem_addr),
		.main_mem_in(cm_main_mem_in),
		.main_mem_out(cm_main_mem_out),
		.main_mem_req(cm_main_mem_req),
		.main_mem_grant(cm_main_mem_grant),

		// codemaker local memory interface
		.sram0_csb0(cm_sram0_csb0),
		.sram0_web0(cm_sram0_web0),
		.sram0_dout0(cm_sram0_dout0),
		.sram1_csb0(cm_sram1_csb0),
		.sram1_web0(cm_sram1_web0),
		.sram1_dout0(cm_sram1_dout0),
		.sram2_csb0(cm_sram2_csb0),
		.sram2_web0(cm_sram2_web0),
		.sram2_dout0(cm_sram2_dout0),
		.sram3_csb0(cm_sram3_csb0),
		.sram3_web0(cm_sram3_web0),
		.sram3_dout0(cm_sram3_dout0),
		.sram4_csb0(cm_sram4_csb0),
		.sram4_web0(cm_sram4_web0),
		.sram4_dout0(cm_sram4_dout0),
		.sram5_csb0(cm_sram5_csb0),
		.sram5_web0(cm_sram5_web0),
		.sram5_dout0(cm_sram5_dout0),
		.sram_comm_addr0(cm_sram_comm_addr0),
		.sram_comm_din0(cm_sram_comm_din0),

		// uart signals
		.rx_fifo_flush_enable(rx_fifo_flush_enable),
		.rd_uart(rd_uart),
		.wr_uart(wr_uart),
		.w_data(w_data),
		.tx_full(tx_full),
		.rx_empty(rx_empty),
		.r_data(r_data)

	);

	// control tower memory controller
	control_tower_memory_controller inst_control_tower_memory_controller(

		// clock and reset interface
		.clk(clk),
		.rst(rst),

		// control tower memory controller interface
		.mem_ctrl_we(ct_mem_ctrl_we),
		.mem_ctrl_addr(ct_mem_ctrl_addr),
		.mem_ctrl_in(ct_mem_ctrl_in),
		.mem_ctrl_out(ct_mem_ctrl_out),
		.mem_ctrl_vld(ct_mem_ctrl_vld),
		.mem_ctrl_req(ct_mem_ctrl_req),

		// control tower main memory interface
		.main_mem_we(ct_main_mem_we),
		.main_mem_addr(ct_main_mem_addr),
		.main_mem_in(ct_main_mem_in),
		.main_mem_out(ct_main_mem_out),
		.main_mem_req(ct_main_mem_req),
		.main_mem_grant(ct_main_mem_grant),

		// control tower local memory interface
		.sram0_csb0(ct_sram0_csb0),
		.sram0_web0(ct_sram0_web0),
		.sram0_dout0(ct_sram0_dout0),
		.sram1_csb0(ct_sram1_csb0),
		.sram1_web0(ct_sram1_web0),
		.sram1_dout0(ct_sram1_dout0),
		.sram2_csb0(ct_sram2_csb0),
		.sram2_web0(ct_sram2_web0),
		.sram2_dout0(ct_sram2_dout0),
		.sram3_csb0(ct_sram3_csb0),
		.sram3_web0(ct_sram3_web0),
		.sram3_dout0(ct_sram3_dout0),
		.sram4_csb0(ct_sram4_csb0),
		.sram4_web0(ct_sram4_web0),
		.sram4_dout0(ct_sram4_dout0),
		.sram5_csb0(ct_sram5_csb0),
		.sram5_web0(ct_sram5_web0),
		.sram5_dout0(ct_sram5_dout0),
		.sram6_csb0(ct_sram6_csb0),
		.sram6_web0(ct_sram6_web0),
		.sram6_dout0(ct_sram6_dout0),
		.sram_comm_addr0(ct_sram_comm_addr0),
		.sram_comm_din0(ct_sram_comm_din0)

	);

	// agent 1 memory controller
	agent_1_memory_controller inst_agent_1_memory_controller(
		// clock and reset
		.clk(clk),
		.rst(rst),

		// agent 1 memory control interface
		.mem_ctrl_we(agent_1_mem_ctrl_we),
		.mem_ctrl_addr(agent_1_mem_ctrl_addr),
		.mem_ctrl_in(agent_1_mem_ctrl_in),
		.mem_ctrl_out(agent_1_mem_ctrl_out),
		.mem_ctrl_vld(agent_1_mem_ctrl_vld),
		.mem_ctrl_req(agent_1_mem_ctrl_req),

		// agent 1 main memory interface
		.main_mem_we(agent_1_main_mem_we),
		.main_mem_addr(agent_1_main_mem_addr),
		.main_mem_in(agent_1_main_mem_in),
		.main_mem_out(agent_1_main_mem_out),
		.main_mem_req(agent_1_main_mem_req),
		.main_mem_grant(agent_1_main_mem_grant),

		// agent 1 local memory interface
		.sram0_csb0(agent_1_sram0_csb0),
		.sram0_web0(agent_1_sram0_web0),
		.sram0_dout0(agent_1_sram0_dout0),
		.sram1_csb0(agent_1_sram1_csb0),
		.sram1_web0(agent_1_sram1_web0),
		.sram1_dout0(agent_1_sram1_dout0),
		.sram2_csb0(agent_1_sram2_csb0),
		.sram2_web0(agent_1_sram2_web0),
		.sram2_dout0(agent_1_sram2_dout0),
		.sram3_csb0(agent_1_sram3_csb0),
		.sram3_web0(agent_1_sram3_web0),
		.sram3_dout0(agent_1_sram3_dout0),
		.sram4_csb0(agent_1_sram4_csb0),
		.sram4_web0(agent_1_sram4_web0),
		.sram4_dout0(agent_1_sram4_dout0),
		.sram_comm_addr0(agent_1_sram_comm_addr0),
		.sram_comm_din0(agent_1_sram_comm_din0)
	);

	// arbiter to access main memory
	Round_Robin_Arbiter #(.WORD_WIDTH(`NUMBER_OF_AGENTS+2)) inst_Round_Robin_Arbiter (
		.clock(clk),
		.requests(requests),
		.grant(grant)
	);

	// grant control logic
	always@(*) begin
		main_mem_we = 0;
		main_mem_addr = 0;
		main_mem_in = 0;

		cm_main_mem_out = 0;
		ct_main_mem_out = 0;

		agent_1_main_mem_out = 0;

		if(grant[2]) begin
			main_mem_we = cm_main_mem_we;
			main_mem_addr = cm_main_mem_addr;
			main_mem_in = cm_main_mem_in;
			cm_main_mem_out = main_mem_out;
		end
		else if(grant[1]) begin
			main_mem_we = ct_main_mem_we;
			main_mem_addr = ct_main_mem_addr;
			main_mem_in = ct_main_mem_in;
			ct_main_mem_out = main_mem_out;
		end
		else if(grant[0]) begin
			main_mem_we = agent_1_main_mem_we;
			main_mem_addr = agent_1_main_mem_addr;
			main_mem_in = agent_1_main_mem_in;
			agent_1_main_mem_out = main_mem_out;
		end
	end
endmodule
