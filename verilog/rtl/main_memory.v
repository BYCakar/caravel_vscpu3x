//`define USE_POWER_PINS

module main_memory(
	`ifdef USE_POWER_PINS
		inout vccd1, // VDD
		inout vssd1, // GND
	`endif
	input clk,
	input wea,
	input [5:0] addra,
	input [31:0] dina,
	input [10:0] gpio_in,
	output reg [31:0] douta,
	output reg [10:0] gpio_out
	);

	localparam ADDR_GPIO_OUT = 6'h3e;
	localparam ADDR_GPIO_IN  = 6'h3f;

	reg [31:0] mem [0:2**6-3];

	reg [10:0] gpio_in_reg;
	reg [10:0] gpio_in_reg_q0;
	reg [10:0] gpio_in_reg_q1;

	always @(posedge clk) begin
		if (addra < ADDR_GPIO_OUT) begin
			if (wea) begin
				mem[addra] <= dina;
				douta <= dina;
			end
			else douta <= mem[addra];
		end
		else if (addra == ADDR_GPIO_OUT) begin
			// dina[31]: Byte select enable. Active high
			// dina[26:16]: Byte select bits. Active high
			// dina[10:0]: GPIO output bits
			if (wea) begin
				gpio_out <= (~dina[31]) ? dina[10:0] : (~dina[26:16] & gpio_out) | (dina[26:16] & dina[10:0]);
				douta <= (dina[31]) ? dina[10:0] : (~dina[26:16] & gpio_out) | (dina[26:16] & dina[10:0]);
			end
			else douta <= gpio_out;
		end
		else if (addra == ADDR_GPIO_IN) douta <= gpio_in_reg;
	end

	always @(posedge clk) begin
	   gpio_in_reg <= gpio_in_reg_q1;
	   gpio_in_reg_q1 <= gpio_in_reg_q0;
	   gpio_in_reg_q0 <= gpio_in;
	end

endmodule
