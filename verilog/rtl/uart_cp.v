module uart_cp(
    input clk,
	input rst,
    input enable,

	output reg mem_wea,
	output [13:0] mem_addra,
	output reg [31:0] mem_dina,
	input [31:0] mem_douta,

	// uart signals
	output rx_fifo_flush_enable,
	output reg rd_uart,
	output reg wr_uart,
	output reg [7:0] w_data,
	input tx_full,
	input rx_empty,
	input [7:0] r_data
    );

    localparam STATE_WAIT_RX = 2'b00;
    localparam STATE_READ_RX = 2'b01;
    localparam STATE_WRITE_TX = 2'b10;
    localparam STATE_READ_MEM = 2'b11;

    localparam CHAR_W = 8'h57;
    localparam CHAR_R = 8'h52;
    localparam CHAR_0 = 8'h30;
    localparam CHAR_9 = 8'h39;
    localparam CHAR_A = 8'h41;
    localparam CHAR_F = 8'h46;

    reg [1:0] state;

    reg command_read;
    reg command_write;

    reg obtained_mem_data;

    reg [3:0] byte_count;

    reg [15:0] addr_pointer;

    reg [31:0] data_to_send;

    assign rx_fifo_flush_enable = 1'b0;

    assign mem_addra = addr_pointer[13:0];

    always @(posedge clk) begin
        if (rst) begin
            mem_wea <= 1'b0;
            mem_dina <= 0;

            rd_uart <= 1'b0;
            wr_uart <= 1'b0;
            w_data <= 8'b0;

            state <= STATE_WAIT_RX;

            command_read <= 1'b0;
            command_write <= 1'b0;

            obtained_mem_data <= 1'b0;

            byte_count <= 4'b0;

            addr_pointer <= 0;

            data_to_send <= 0;
        end
        else begin
            if (enable) begin
                rd_uart <= 1'b0;
                wr_uart <= 1'b0;

                mem_wea <= 1'b0;

                if (mem_wea) addr_pointer <= addr_pointer + 1;

                case (state)
                    STATE_WAIT_RX: begin
                        if (~rx_empty) begin
                            rd_uart <= 1'b1;

                            state <= STATE_READ_RX;
                        end
                    end
                    STATE_READ_RX: begin
                        state <= STATE_WAIT_RX;

                        if (r_data == CHAR_W) begin
                            command_read <= 1'b0;
                            command_write <= 1'b1;

                            byte_count <= 4'h0;
                        end
                        else if (r_data == CHAR_R) begin
                            command_read <= 1'b1;
                            command_write <= 1'b0;

                            byte_count <= 4'h0;
                        end
                        else if ((r_data >= CHAR_0 && r_data <= CHAR_9) || (r_data >= CHAR_A && r_data <= CHAR_F)) begin
                            if (command_read) begin
                                case (byte_count)
                                    4'h0: addr_pointer[15:12] <= (r_data >= CHAR_0 && r_data <= CHAR_9) ? r_data - CHAR_0 : r_data - CHAR_A + 10;
                                    4'h1: addr_pointer[11:8] <= (r_data >= CHAR_0 && r_data <= CHAR_9) ? r_data - CHAR_0 : r_data - CHAR_A + 10;
                                    4'h2: addr_pointer[7:4] <= (r_data >= CHAR_0 && r_data <= CHAR_9) ? r_data - CHAR_0 : r_data - CHAR_A + 10;
                                    4'h3: addr_pointer[3:0] <= (r_data >= CHAR_0 && r_data <= CHAR_9) ? r_data - CHAR_0 : r_data - CHAR_A + 10;
                                endcase

                                if (byte_count == 4'h3) begin
                                    command_read <= 1'b0;
                                    command_write <= 1'b0;

                                    byte_count <= 4'h0;

                                    state <= STATE_READ_MEM;
                                end
                                else byte_count <= byte_count + 1;
                            end
                            else if (command_write) begin
                                case (byte_count)
                                    4'h0: mem_dina[31:28] <= (r_data >= CHAR_0 && r_data <= CHAR_9) ? r_data - CHAR_0 : r_data - CHAR_A + 10;
                                    4'h1: mem_dina[27:24] <= (r_data >= CHAR_0 && r_data <= CHAR_9) ? r_data - CHAR_0 : r_data - CHAR_A + 10;
                                    4'h2: mem_dina[23:20] <= (r_data >= CHAR_0 && r_data <= CHAR_9) ? r_data - CHAR_0 : r_data - CHAR_A + 10;
                                    4'h3: mem_dina[19:16] <= (r_data >= CHAR_0 && r_data <= CHAR_9) ? r_data - CHAR_0 : r_data - CHAR_A + 10;
                                    4'h4: mem_dina[15:12] <= (r_data >= CHAR_0 && r_data <= CHAR_9) ? r_data - CHAR_0 : r_data - CHAR_A + 10;
                                    4'h5: mem_dina[11:8] <= (r_data >= CHAR_0 && r_data <= CHAR_9) ? r_data - CHAR_0 : r_data - CHAR_A + 10;
                                    4'h6: mem_dina[7:4] <= (r_data >= CHAR_0 && r_data <= CHAR_9) ? r_data - CHAR_0 : r_data - CHAR_A + 10;
                                    4'h7: mem_dina[3:0] <= (r_data >= CHAR_0 && r_data <= CHAR_9) ? r_data - CHAR_0 : r_data - CHAR_A + 10;
                                endcase

                                if (byte_count == 4'h7) begin
                                    command_read <= 1'b0;
                                    command_write <= 1'b0;

                                    byte_count <= 4'h0;

                                    mem_wea <= 1'b1;
                                end
                                else byte_count <= byte_count + 1;
                            end
                        end
                        else begin
                            command_read <= 1'b0;
                            command_write <= 1'b0;

                            byte_count <= 4'h0;
                        end
                    end
                    STATE_WRITE_TX: begin
                        if (~tx_full) begin
                            case (byte_count)
                                4'h0: w_data <= (data_to_send[31:28] < 10) ? data_to_send[31:28] + CHAR_0 : data_to_send[31:28] + CHAR_A - 10;
                                4'h1: w_data <= (data_to_send[27:24] < 10) ? data_to_send[27:24] + CHAR_0 : data_to_send[27:24] + CHAR_A - 10;
                                4'h2: w_data <= (data_to_send[23:20] < 10) ? data_to_send[23:20] + CHAR_0 : data_to_send[23:20] + CHAR_A - 10;
                                4'h3: w_data <= (data_to_send[19:16] < 10) ? data_to_send[19:16] + CHAR_0 : data_to_send[19:16] + CHAR_A - 10;
                                4'h4: w_data <= (data_to_send[15:12] < 10) ? data_to_send[15:12] + CHAR_0 : data_to_send[15:12] + CHAR_A - 10;
                                4'h5: w_data <= (data_to_send[11:8] < 10) ? data_to_send[11:8] + CHAR_0 : data_to_send[11:8] + CHAR_A - 10;
                                4'h6: w_data <= (data_to_send[7:4] < 10) ? data_to_send[7:4] + CHAR_0 : data_to_send[7:4] + CHAR_A - 10;
                                4'h7: w_data <= (data_to_send[3:0] < 10) ? data_to_send[3:0] + CHAR_0 : data_to_send[3:0] + CHAR_A - 10;
                            endcase

                            wr_uart <= 1'b1;

                            if (byte_count == 4'h7) begin
                                byte_count <= 4'h0;

                                state <= STATE_WAIT_RX;
                            end
                            else byte_count <= byte_count + 1;
                        end
                    end
                    STATE_READ_MEM: begin
                        if (~obtained_mem_data) obtained_mem_data <= 1'b1;
                        else begin
                        data_to_send <= mem_douta;

                        obtained_mem_data <= 1'b0;

                        state <= STATE_WRITE_TX;
                        end
                    end

                endcase
            end
        end
    end
endmodule
