module VerySimpleCPU(clk, rst, debug_en, debug_pc_out, data_fromRAM, wrEn, addr_toRAM, data_toRAM, mem_req, mem_vld, done);

	parameter SIZE = 14;

	input clk, rst;

	input debug_en;
	output [SIZE-1:0] debug_pc_out;

	input wire [31:0] data_fromRAM;
	output reg wrEn;
	output reg [13:0] addr_toRAM;
	output reg [31:0] data_toRAM;
	input mem_vld;
	output reg mem_req;
	output done;

	`define reset 0
	`define fetch 1
	`define decode_0 2
	`define decode_1 3
	`define decode_2 4
	`define decode_3 5
	`define execute 6

	reg [6:0] state_current, state_next;
	reg [SIZE-1:0] pc_current, pc_next, pc_last; // pc_current: program counter
	reg [31:0] iw_current, iw_next;
	reg [31:0] r1_current, r1_next;
	reg [31:0] r2_current, r2_next;

	assign done = (pc_current == pc_last) ? 1'b1 : 1'b0;

	// controller state machine
	always@(posedge clk) begin
		if(rst) begin
			state_current	<= `reset;
			pc_current 		<= 10'b0;
			iw_current 		<= 32'b0;
			r1_current 		<= 32'b0;
			r2_current 		<= 32'b0;
		end
		else begin
			state_current 	<= state_next;
			pc_current 		<= pc_next;
			pc_last 		<= (state_current == `execute) ? pc_current : pc_last;
			iw_current 		<= iw_next;
			r1_current 		<= r1_next;
			r2_current 		<= r2_next;
		end
	end

	always@(*) begin
		state_next = state_current;
		pc_next = pc_current;
		iw_next = iw_current;
		r1_next = r1_current;
		r2_next = r2_current;
		wrEn = 0;
		addr_toRAM = 0;
		data_toRAM = 0;
		mem_req = 0;
		case(state_current)
			// state: reset
			`reset: begin
				pc_next = 0;
				iw_next = 0;
				r1_next = 0;
				r2_next = 0;
				state_next = `fetch;
			end
			// state: fetch
			`fetch: begin // are we sure that memory is valid for every fetch operation?
				if(mem_vld) begin
					mem_req = 1'b1;
					addr_toRAM = pc_current;
					if(debug_en) begin
						state_next = `decode_0;
					end
				end
			end
			// state: decode_0
			`decode_0: begin // if mem_vld, store coming data from memory as instruction into instruction word
				if(mem_vld) begin
					iw_next = data_fromRAM;
					if(data_fromRAM[31:29] == 3'b100) begin
						state_next = `decode_2;
					end
					else begin
						state_next = `decode_1;
					end
				end
			end
			// state: decode_1
			`decode_1: begin
				mem_req = 1;
				if(iw_current[31:28] == 4'b1010) begin
					addr_toRAM = iw_current[13:0]; // address of B
				end
				else begin
					addr_toRAM = iw_current[27:14]; // address of A
				end
				state_next = `decode_2;
			end
			// state: decode_2
			`decode_2: begin
				if(mem_vld) begin // if mem_vld, decode instruction and initiate read access to memory to request data from memory
					if((iw_current[31:29] != 3'b101) && iw_current[28]) begin // not CPIi but immediate
						r1_next = data_fromRAM;
						r2_next = iw_current[13:0];
						state_next = `execute;
					end
					else begin
						mem_req = 1;
						if(iw_current[31:28] == 4'b1010) begin // CPI
							addr_toRAM = data_fromRAM[13:0];
						end
						else begin // others
							r1_next = data_fromRAM;
							addr_toRAM = iw_current[13:0]; // address of B
						end
						state_next = `decode_3;
					end
				end
			end
			`decode_3: begin
				if(mem_vld) begin // if mem_vld, store coming data from memory as data into r2 register
					r2_next = data_fromRAM;
					state_next = `execute;
				end
			end
			// state: execute
			`execute: begin
				if(mem_vld) begin // if mem_vld, initiate write access to memory to write the result into it(except BZJ and BZJi instructions. i.e., they implicitly wait for mem_vld)
					casex(iw_current[31:28])
						{3'b000,1'bx}: begin // ADD & ADDi
							wrEn 			= 1'b1;
							mem_req 		= 1'b1;
							pc_next 		= pc_current + 1;
							addr_toRAM 	= iw_current[27:14];
							data_toRAM 	= (r1_current + r2_current);
						end
						{3'b001,1'bx}: begin // NAND & NANDi
							wrEn 			= 1'b1;
							mem_req 		= 1'b1;
							pc_next 		= pc_current + 1;
							addr_toRAM 	= iw_current[27:14];
							data_toRAM 	= ~(r1_current & r2_current);
						end
						{3'b010,1'bx}: begin // SRL & SRLi
							wrEn 			= 1'b1;
							mem_req 		= 1'b1;
							pc_next 		= pc_current + 1;
							addr_toRAM 	= iw_current[27:14];
							data_toRAM 	= (r2_current < 32) ? (r1_current >> r2_current) : (r1_current << (r2_current-32));
						end
						{3'b011,1'bx}: begin // LT & LTi
							wrEn 			= 1'b1;
							mem_req 		= 1'b1;
							pc_next 		= pc_current + 1;
							addr_toRAM 	= iw_current[27:14];
							data_toRAM 	= (r1_current < r2_current) ? 1 : 0;
						end
						{3'b111,1'bx}: begin // MUL & MULi
							wrEn 			= 1'b1;
							mem_req 		= 1'b1;
							pc_next 		= pc_current + 1;
							addr_toRAM 	= iw_current[27:14];
							data_toRAM 	= (r1_current * r2_current);
						end
						{3'b100,1'bx}: begin // CP & CPi
							wrEn 			= 1'b1;
							mem_req 		= 1'b1;
							pc_next 		= pc_current + 1;
							addr_toRAM 	= iw_current[27:14];
							data_toRAM 	= r2_current;
						end
						{3'b101,1'b0}: begin // CPI
							wrEn			= 1'b1;
							mem_req 		= 1'b1;
							pc_next 		= pc_current + 1;
							addr_toRAM 	= iw_current[27:14];
							data_toRAM 	= r2_current;
						end
						{3'b101,1'b1}: begin // CPIi
							wrEn			= 1'b1;
							mem_req 		= 1'b1;
							pc_next 		= pc_current + 1;
							addr_toRAM 	= r1_current[13:0];
							data_toRAM 	= r2_current;
						end
						{3'b110,1'b0}: begin // BZJ
							pc_next 		= (r2_current == 0) ? r1_current[13:0] : (pc_current + 1'b1);
						end
						{3'b110,1'b1}: begin // BZJi
							pc_next 		= r1_current + r2_current;
						end
					endcase
					state_next = `fetch;
				end
			end
		endcase
	end

	assign debug_pc_out = pc_current;

endmodule
