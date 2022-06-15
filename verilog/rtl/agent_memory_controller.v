module agent_1_memory_controller(

	// clock and reset interface
	input clk,
	input rst,

	// agent memory control interface
	input mem_ctrl_we,
	input [13:0] mem_ctrl_addr,
	input [31:0] mem_ctrl_in,
	output reg [31:0] mem_ctrl_out,
	output reg mem_ctrl_vld,
	input mem_ctrl_req,

	// agent main memory interface
	output reg main_mem_we,
	output reg [`MAIN_MEMORY_ADDR_BITS-1:0] main_mem_addr,
	output reg [31:0] main_mem_in,
	input [31:0] main_mem_out,
	output reg main_mem_req,
	input main_mem_grant,

	output sram0_csb0,
	output sram0_web0,
	input [31:0] sram0_dout0,

	output sram1_csb0,
	output sram1_web0,
	input [31:0] sram1_dout0,

	output sram2_csb0,
	output sram2_web0,
	input [31:0] sram2_dout0,

	output sram3_csb0,
	output sram3_web0,
	input [31:0] sram3_dout0,

	output sram4_csb0,
	output sram4_web0,
	input [31:0] sram4_dout0,

	output [8:0] sram_comm_addr0,
	output [31:0] sram_comm_din0
	);

	//******************************************************
	// memory map
	localparam LOCAL_MEMORY_LOW_ADDR  		= 14'h000;
	localparam LOCAL_MEMORY_HIGH_ADDR 		= 14'hFFF;
	localparam MAIN_MEMORY_LOW_ADDR  		= 14'h2000;
	localparam MAIN_MEMORY_HIGH_ADDR 		= 14'h20FF;
	//******************************************************

	// 1-cycle delay FFs
	reg mem_ctrl_we_r_current, mem_ctrl_we_r_next;
	reg [13:0] mem_ctrl_addr_r_current, mem_ctrl_addr_r_next;
	reg [31:0] mem_ctrl_in_r_current, mem_ctrl_in_r_next;

	// agent local memory interface
	reg local_mem_we;
	reg [11:0] local_mem_addr;
	reg [31:0] local_mem_in;
	wire [31:0] local_mem_out;

	// state machine interface
	reg [1:0] state_current, state_next;

	//******************************************************
	// memory controller
	always@(posedge clk) begin
		if(rst) begin
			state_current <= 0;
			mem_ctrl_we_r_current <= 0;
			mem_ctrl_addr_r_current <= 0;
			mem_ctrl_in_r_current <= 0;
		end
		else begin
			state_current <= state_next;
			mem_ctrl_we_r_current <= mem_ctrl_we_r_next;
			mem_ctrl_addr_r_current <= mem_ctrl_addr_r_next;
			mem_ctrl_in_r_current <= mem_ctrl_in_r_next;
		end
	end

	always@(*) begin
		state_next = state_current;

		mem_ctrl_we_r_next = mem_ctrl_we_r_current;
		mem_ctrl_addr_r_next = mem_ctrl_addr_r_current;
		mem_ctrl_in_r_next = mem_ctrl_in_r_current;

		local_mem_we = 0;
		local_mem_addr = 0;
		local_mem_in = 0;

		main_mem_we = 0;
		main_mem_addr = 0;
		main_mem_in = 0;

		main_mem_req = 0; // do not generate a request to access main memory

		mem_ctrl_out = 0;
		mem_ctrl_vld = 1; // either local memory or main memory is idle - access granted

		case(state_current)
			0: begin
				if(mem_ctrl_req) begin

					mem_ctrl_we_r_next = mem_ctrl_we;
					mem_ctrl_addr_r_next = mem_ctrl_addr;
					mem_ctrl_in_r_next = mem_ctrl_in;

					if((LOCAL_MEMORY_LOW_ADDR <= mem_ctrl_addr) && (mem_ctrl_addr <= LOCAL_MEMORY_HIGH_ADDR)) begin // local memory access is initiated

						// state_next = 1; // go to state 1 if it is a read access - data will be available at next cycle

						local_mem_addr = mem_ctrl_addr[`AG_MEMORY_ADDR_BITS-1:0];

						if(mem_ctrl_we == 1) begin
							local_mem_we = 1;
							local_mem_in = mem_ctrl_in;
							state_next = 0; // do not change state if it is a local memory write access - data will be written at next cycle
						end

					end
					else if((MAIN_MEMORY_LOW_ADDR <= mem_ctrl_addr) && (mem_ctrl_addr <= MAIN_MEMORY_HIGH_ADDR)) begin // main memory access is initiated

						main_mem_req = 1'b1; // generate a request to access main memory
						state_next = 1;

					end

				end

				if((LOCAL_MEMORY_LOW_ADDR <= mem_ctrl_addr_r_current) && (mem_ctrl_addr_r_current <= LOCAL_MEMORY_HIGH_ADDR)) begin // local memory access is completed

					mem_ctrl_out = local_mem_out;

				end
				else if((MAIN_MEMORY_LOW_ADDR <= mem_ctrl_addr_r_current) && (mem_ctrl_addr_r_current <= MAIN_MEMORY_HIGH_ADDR)) begin // main memory access is completed

					mem_ctrl_out = main_mem_out;

				end

			end
			1: begin

				main_mem_req = 1'b1; // continue generating a request to access main memory
				mem_ctrl_vld = 1'b0; // main memory is busy

				if(main_mem_grant) begin // if access to main memory is granted

						state_next = 0;
						main_mem_addr = mem_ctrl_addr_r_current[`MAIN_MEMORY_ADDR_BITS-1:0];

						if(mem_ctrl_we_r_current == 1'b1) begin
							main_mem_we = 1;
							main_mem_in = mem_ctrl_in_r_current;
//							state_next = 0;
						end

				end

			end
			2: begin

				mem_ctrl_vld = 1'b1; // assume that main memory is busy
				main_mem_req = 1'b0; // deassert the request to access main memory

				mem_ctrl_out = main_mem_out;

				state_next = 0;

			end
			default: begin
				state_next = 0;
			end
		endcase
	end
	//******************************************************
	//local memory interconnect area

	reg  [2:0] SRAM_dout_sel;

	assign sram0_csb0			= ~(local_mem_addr[11:9] == 3'b000);
	assign sram0_web0			= ~(local_mem_addr[11:9] == 3'b000 && local_mem_we);

	assign sram1_csb0			= ~(local_mem_addr[11:9] == 3'b001);
	assign sram1_web0			= ~(local_mem_addr[11:9] == 3'b001 && local_mem_we);

	assign sram2_csb0			= ~(local_mem_addr[11:9] == 3'b010);
	assign sram2_web0			= ~(local_mem_addr[11:9] == 3'b010 && local_mem_we);

	assign sram3_csb0			= ~(local_mem_addr[11:9] == 3'b011);
	assign sram3_web0			= ~(local_mem_addr[11:9] == 3'b011 && local_mem_we);

	assign sram4_csb0			= ~(local_mem_addr[11:9] == 3'b100);
	assign sram4_web0			= ~(local_mem_addr[11:9] == 3'b100 && local_mem_we);

	assign local_mem_out		= (SRAM_dout_sel == 3'b000) ? sram0_dout0
		                    	: (SRAM_dout_sel == 3'b001) ? sram1_dout0
		                    	: (SRAM_dout_sel == 3'b010) ? sram2_dout0
								: (SRAM_dout_sel == 3'b011) ? sram3_dout0 : sram4_dout0;

	assign sram_comm_addr0 		= local_mem_addr[8:0];
	assign sram_comm_din0 		= local_mem_in;

	always @(posedge clk) SRAM_dout_sel <= local_mem_addr[11:9];

endmodule
