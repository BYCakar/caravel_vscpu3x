// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

`timescale 1 ns / 1 ps

module gpio_test_tb;
	reg clock;
	reg RSTB;
	reg CSB;
	reg power1, power2;
	reg power3, power4;

	wire gpio;
	wire [37:0] mprj_io;

	assign mprj_io[3] = 1'b1;

	// External clock is used by default.  Make this artificially fast for the
	// simulation.  Normally this would be a slow clock and the digital PLL
	// would be the fast clock.

	always #10 clock <= (clock === 1'b0);

	initial begin
		clock = 0;
	end

	initial begin
		$dumpfile("gpio_test.vcd");
		$dumpvars(0, gpio_test_tb);

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (300) begin
			repeat (1000) @(posedge clock);
			// $display("+1000 cycles");
		end
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Timeout, GPIO Test (GL) Failed");
		`else
			$display ("Monitor: Timeout, GPIO Test (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	initial begin
		RSTB <= 1'b0;
		CSB  <= 1'b1;		// Force CSB high
		#2000;
		RSTB <= 1'b1;	    	// Release reset
		#100000;
		CSB = 1'b0;		// CSB can be released
	end

	initial begin		// Power-up sequence
		power1 <= 1'b0;
		power2 <= 1'b0;
		#200;
		power1 <= 1'b1;
		#200;
		power2 <= 1'b1;
	end

	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;

	wire VDD3V3 = power1;
	wire VDD1V8 = power2;
	wire USER_VDD3V3 = power3;
	wire USER_VDD1V8 = power4;
	wire VSS = 1'b0;

	caravel uut (
		.vddio	  (VDD3V3),
		.vddio_2  (VDD3V3),
		.vssio	  (VSS),
		.vssio_2  (VSS),
		.vdda	  (VDD3V3),
		.vssa	  (VSS),
		.vccd	  (VDD1V8),
		.vssd	  (VSS),
		.vdda1    (VDD3V3),
		.vdda1_2  (VDD3V3),
		.vdda2    (VDD3V3),
		.vssa1	  (VSS),
		.vssa1_2  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (VDD1V8),
		.vccd2	  (VDD1V8),
		.vssd1	  (VSS),
		.vssd2	  (VSS),
		.clock    (clock),
		.gpio     (gpio),
		.mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash #(
		.FILENAME("gpio_test.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);

	/*---------------------------*/
	/* User test code added here */
	/*---------------------------*/

	// Top module ports

	reg rst;

	reg [1:0] program_sel;
	
	wire cm_done;
	wire ct_done;
	wire agent_1_done;

	wire tx;
	wire rx;

	reg [10:0] gpio_in;
	wire [10:0] gpio_out;

	assign mprj_io[8]		= rst;

    // program select pins
    assign mprj_io[10:9]	= program_sel;

    // gpio pins
    assign mprj_io[26:16]	= gpio_in;
    assign gpio_out			= mprj_io[37:27];

    // uart peripheral interface
    assign mprj_io[11]		= rx;
    assign tx				= mprj_io[12];

    // vscpu done pins
    assign cm_done			= mprj_io[13];
    assign ct_done			= mprj_io[14];
    assign agent_1_done		= mprj_io[15];

    // signals used for tb
    integer i; 

	reg uart_check_err;

    reg rd_uart;
	reg wr_uart;
    reg [7:0] w_data;
    wire tx_full;
	wire rx_empty;
    wire [7:0] r_data;

    // uart module instantiation
    uart inst_uart (
		.clk(clock),
		.reset(rst),
		.dvsr(8'h1b),
		.rx_fifo_flush_enable(1'b0),
		.rd_uart(rd_uart),
		.wr_uart(wr_uart),
		.rx(tx),
		.w_data(w_data),
		.tx_full(tx_full),
		.rx_empty(rx_empty),
		.tx(rx),
		.r_data(r_data)
	);

    // Initialize RAM's to avoid errors due to X values
	initial begin
	   for (i = 0; i < 2**6; i = i + 1) uut.mprj.inst_main_memory.mem[i] = 0;
	   uut.mprj.inst_main_memory.douta = 0;
	   uut.mprj.inst_main_memory.gpio_out = 0;

	   $readmemh("memfiles/gpio_agent_1_part0.mem", uut.mprj.agent_1_sram2k_inst0.mem);
	   $readmemh("memfiles/gpio_codemaker_part0.mem", uut.mprj.codemaker_sram2k_inst0.mem);
	   $readmemh("memfiles/gpio_control_tower_part0.mem", uut.mprj.control_tower_sram2k_inst0.mem);
	end

	initial begin
		// Initialize Inputs
		rst = 1;
		program_sel = 2'b00;
		rd_uart = 1'b0;
		wr_uart = 1'b0;
		w_data = 8'h00;

		uart_check_err = 1'b0;

		// Wait 1 ms for flash spi to finish
		// 100;
		#1000000 rst = 0;

		gpio_in = 11'h001;

		wait(gpio_out == 11'h007);

		#50 program_sel = 2'b01;

		send_uart_data ("R203E", 5);
		receive_uart_data("00000007", 8, 1);

		if (uart_check_err) begin
			$display("Monitor: UART read error!");
			$finish;
		end

		send_uart_data ("W00000000", 9);

		wait (gpio_out == 11'h000);
		$display("Monitor: GPIO test successfull!");
		$finish;
	end

	task send_uart_data ( input [71:0] str, input [3:0] length);
		begin
			str = str << (9 - length) * 8;
			for (i = 0; i < length; i = i + 1) begin
				wait(~clock);
				wait(clock);
				wait(~tx_full);
				w_data = str[71:64];
				wr_uart = 1'b1;
				wait(~clock);
				wait(clock);
				wr_uart = 1'b0;
				str = str << 8;
				wait(~clock);
				wait(clock);
			end
		end
	endtask

	task receive_uart_data ( input [71:0] ref_str, input [3:0] length, input compare);
		begin
			ref_str = ref_str << (9 - length) * 8;
			for (i = 0; i < length; i = i + 1) begin
				wait(~clock);
				wait(clock);
				wait(~rx_empty);
				if (compare) uart_check_err = (r_data != ref_str[71:64]) ? 1'b1 : uart_check_err;
				rd_uart = 1'b1;
				wait(~clock);
				wait(clock);
				rd_uart = 1'b0;
				ref_str = ref_str << 8;
				wait(~clock);
				wait(clock);
			end
		end
	endtask


endmodule
`default_nettype wire