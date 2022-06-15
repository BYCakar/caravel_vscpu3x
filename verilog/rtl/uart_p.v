module uart_p(

	input clk,
	input rst,
	input wea,
	input [3:0] addra,
	input [31:0] dina,
	output reg [31:0] douta,

	// uart signals
	output rx_fifo_flush_enable,
	output rd_uart,
	output wr_uart,
	output [7:0] w_data,
	input tx_full,
	input rx_empty,
	input [7:0] r_data

	);

	reg [31:0] uart_p_r [0:15];

//	assign douta = uart_p_r[addra];

	always@(posedge clk) begin

		douta <= uart_p_r[addra];

		if(rst) begin
			uart_p_r[0] <= 0;
			uart_p_r[1] <= 0;
			uart_p_r[2] <= 0;
			uart_p_r[3] <= 0;
			uart_p_r[4] <= 0;
			uart_p_r[5] <= 0;
			uart_p_r[6] <= 0;
			uart_p_r[7] <= 0;
			uart_p_r[8] <= 0;
			uart_p_r[9] <= 0;
			uart_p_r[10] <= 0;
			uart_p_r[11] <= 0;
			uart_p_r[12] <= 0;
			uart_p_r[13] <= 0;
			uart_p_r[14] <= 0;
			uart_p_r[15] <= 0;
		end
		/*else if(wea && (addra == 0)) begin
			uart_p_r[0] <= dina;
		end
		else if(wea && (addra == 1)) begin
			uart_p_r[1] <= dina;
		end
		else if(wea && (addra == 2)) begin
			uart_p_r[2] <= dina;
		end
		else if(wea && (addra == 3)) begin
			uart_p_r[3] <= dina;
		end
		else if(wea && (addra == 4)) begin
			uart_p_r[4] <= dina;
		end
		else if(wea && (addra == 5)) begin
			uart_p_r[5] <= dina;
		end*/
		else if(wea) begin
			uart_p_r[addra] <= dina;
		end
		else begin
			uart_p_r[0] <= {31'b0,rx_empty};
			uart_p_r[1] <= 32'b0;
			uart_p_r[2] <= {24'b0,r_data};
			if(wr_uart) begin
				uart_p_r[4] <= uart_p_r[4] - 1'b1;
			end
			uart_p_r[5] <= {31'b0,tx_full};
		end

	end

	assign rx_fifo_flush_enable = 0;
	assign rd_uart = uart_p_r[1][0];
	assign wr_uart = (uart_p_r[4] > 0) && (~tx_full);
	assign w_data = uart_p_r[3][7:0];

//	assign w_data = r_data;

endmodule
