// `define USE_POWER_PINS

module VerySimpleCPU_core(
	`ifdef USE_POWER_PINS
		inout vccd1, // VDD
		inout vssd1, // GND
	`endif

	// clock and reset interface
	input  clk,
	input  rst,
	// agent memory controller interface
	output mem_ctrl_we,
	output [13:0] mem_ctrl_addr,
	output [31:0] mem_ctrl_in,
	input  [31:0] mem_ctrl_out,
	input  mem_ctrl_vld,
	output mem_ctrl_req,

	// vscpu done bit
	output done
	);

	VerySimpleCPU inst_VerySimpleCPU(

		// clock and reset interface
		.clk(clk),
		.rst(rst),
		//debug interface
		.debug_en(1'b1),
		.debug_pc_out(),
		// agent memory controller interface
		.data_fromRAM(mem_ctrl_out),
		.wrEn(mem_ctrl_we),
		.addr_toRAM(mem_ctrl_addr),
		.data_toRAM(mem_ctrl_in),
		.mem_vld(mem_ctrl_vld),
		.mem_req(mem_ctrl_req),
		// vscpu done bit
		.done(done)

	);

endmodule
