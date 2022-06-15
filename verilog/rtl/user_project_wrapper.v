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
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

    assign io_oeb = {`MPRJ_IO_PADS{wb_rst_i}};

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

    // top module pins
    // clock and rst pins
    wire clk;
    wire rst;

    // program select pins
    wire [1:0] program_sel;

    // gpio pins
    wire [10:0] gpio_in;
    wire [10:0] gpio_out;

    // uart peripheral interface
    wire rx;
    wire tx;

    // vscpu done pins
    wire cm_done;
    wire ct_done;
    wire agent_1_done;

    // assign top module pins
    // clock and rst pins
    assign clk              = wb_clk_i;
    assign rst              = io_in[8];

    // program select pins
    assign program_sel      = io_in[10:9];

    // gpio pins
    assign gpio_in          = io_in[26:16];
    assign io_out[37:27]    = gpio_out;

    // uart peripheral interface
    assign rx               = io_in[11];
    assign io_out[12]       = tx;

    // vscpu done pins
    assign io_out[13]       = cm_done;
    assign io_out[14]       = ct_done;
    assign io_out[15]       = agent_1_done;

/*--------------------------------------*/
/*         Top module definition        */
/*--------------------------------------*/

    wire rst_asserted;

    // agent 1's memory control interface signals
    wire agent_1_mem_ctrl_we;
    wire [13:0] agent_1_mem_ctrl_addr;
    wire [31:0] agent_1_mem_ctrl_in;
    wire [31:0] agent_1_mem_ctrl_out;
    wire agent_1_mem_ctrl_req;
    wire agent_1_mem_ctrl_vld;

    // agent 1's local memory interface signals
    wire agent_1_sram0_csb0;
    wire agent_1_sram0_web0;
    wire [31:0] agent_1_sram0_dout0;

    wire agent_1_sram1_csb0;
    wire agent_1_sram1_web0;
    wire [31:0] agent_1_sram1_dout0;

    wire agent_1_sram2_csb0;
    wire agent_1_sram2_web0;
    wire [31:0] agent_1_sram2_dout0;

    wire agent_1_sram3_csb0;
    wire agent_1_sram3_web0;
    wire [31:0] agent_1_sram3_dout0;

    wire agent_1_sram4_csb0;
    wire agent_1_sram4_web0;
    wire [31:0] agent_1_sram4_dout0;

    wire [8:0] agent_1_sram_comm_addr0;
    wire [31:0] agent_1_sram_comm_din0;

    // codemaker's memory control interface signals
    wire cm_mem_ctrl_we;
    wire [13:0] cm_mem_ctrl_addr;
    wire [31:0] cm_mem_ctrl_in;
    wire [31:0] cm_mem_ctrl_out;
    wire cm_mem_ctrl_req;
    wire cm_mem_ctrl_vld;

    // codemaker's local memory interface signals
    wire cm_sram0_csb0;
    wire cm_sram0_web0;
    wire [31:0] cm_sram0_dout0;

    wire cm_sram1_csb0;
    wire cm_sram1_web0;
    wire [31:0] cm_sram1_dout0;

    wire cm_sram2_csb0;
    wire cm_sram2_web0;
    wire [31:0] cm_sram2_dout0;

    wire cm_sram3_csb0;
    wire cm_sram3_web0;
    wire [31:0] cm_sram3_dout0;

    wire cm_sram4_csb0;
    wire cm_sram4_web0;
    wire [31:0] cm_sram4_dout0;

    wire cm_sram5_csb0;
    wire cm_sram5_web0;
    wire [31:0] cm_sram5_dout0;

    wire [8:0] cm_sram_comm_addr0;
    wire [31:0] cm_sram_comm_din0;

    // control tower's memory control interface signals
    wire ct_mem_ctrl_we;
    wire [13:0] ct_mem_ctrl_addr;
    wire [31:0] ct_mem_ctrl_in;
    wire [31:0] ct_mem_ctrl_out;
    wire ct_mem_ctrl_req;
    wire ct_mem_ctrl_vld;

    // control tower's local memory interface signals
    wire ct_sram0_csb0;
    wire ct_sram0_web0;
    wire [31:0] ct_sram0_dout0;

    wire ct_sram1_csb0;
    wire ct_sram1_web0;
    wire [31:0] ct_sram1_dout0;

    wire ct_sram2_csb0;
    wire ct_sram2_web0;
    wire [31:0] ct_sram2_dout0;

    wire ct_sram3_csb0;
    wire ct_sram3_web0;
    wire [31:0] ct_sram3_dout0;

    wire ct_sram4_csb0;
    wire ct_sram4_web0;
    wire [31:0] ct_sram4_dout0;

    wire ct_sram5_csb0;
    wire ct_sram5_web0;
    wire [31:0] ct_sram5_dout0;

    wire ct_sram6_csb0;
    wire ct_sram6_web0;
    wire [31:0] ct_sram6_dout0;

    wire [8:0] ct_sram_comm_addr0;
    wire [31:0] ct_sram_comm_din0;

    // sram constant signals
    wire [3:0] sram_const_wmask0;
    wire sram_const_csb1;
    wire [8:0] sram_const_addr1;

    // main memory interface signals
    wire main_mem_we;
    wire [5:0] main_mem_addr;
    wire [31:0] main_mem_in;
    wire [31:0] main_mem_out;

    // uart signals
    wire rx_fifo_flush_enable;
    wire rd_uart;
    wire wr_uart;
    wire [7:0] w_data;
    wire tx_full;
    wire rx_empty;
    wire [7:0] r_data;

    // codemaker
    VerySimpleCPU_core inst_codemaker(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

        // clock and reset interface
        .clk(clk),
        .rst(rst_asserted),

        // codemaker main memory interface
        .mem_ctrl_we(cm_mem_ctrl_we),
        .mem_ctrl_addr(cm_mem_ctrl_addr),
        .mem_ctrl_in(cm_mem_ctrl_in),
        .mem_ctrl_out(cm_mem_ctrl_out),
        .mem_ctrl_vld(cm_mem_ctrl_vld),
        .mem_ctrl_req(cm_mem_ctrl_req),

        // done bit
        .done(cm_done)

    );

    // control tower
    VerySimpleCPU_core inst_control_tower(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

        // clock and reset interface
        .clk(clk),
        .rst(rst_asserted),

        // control tower main memory interface
        .mem_ctrl_we(ct_mem_ctrl_we),
        .mem_ctrl_addr(ct_mem_ctrl_addr),
        .mem_ctrl_in(ct_mem_ctrl_in),
        .mem_ctrl_out(ct_mem_ctrl_out),
        .mem_ctrl_vld(ct_mem_ctrl_vld),
        .mem_ctrl_req(ct_mem_ctrl_req),

        // done bit
        .done(ct_done)

    );

    // agent 1
    VerySimpleCPU_core inst_agent_1(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

        // clock and reset interface
        .clk(clk),
        .rst(rst_asserted),

        // agent 1 memory control interface
        .mem_ctrl_we(agent_1_mem_ctrl_we),
        .mem_ctrl_addr(agent_1_mem_ctrl_addr),
        .mem_ctrl_in(agent_1_mem_ctrl_in),
        .mem_ctrl_out(agent_1_mem_ctrl_out),
        .mem_ctrl_req(agent_1_mem_ctrl_req),
        .mem_ctrl_vld(agent_1_mem_ctrl_vld),

        // done bit
        .done(agent_1_done)
    );

    main_controller inst_main_controller(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

        // clock and reset interface
        .clk(clk),
        .rst(rst),
        .rst_asserted(rst_asserted),

        .program_sel(program_sel),

        // codemaker memory control interface
        .cm_mem_ctrl_we(cm_mem_ctrl_we),
        .cm_mem_ctrl_addr(cm_mem_ctrl_addr),
        .cm_mem_ctrl_in(cm_mem_ctrl_in),
        .cm_mem_ctrl_out(cm_mem_ctrl_out),
        .cm_mem_ctrl_vld(cm_mem_ctrl_vld),
        .cm_mem_ctrl_req(cm_mem_ctrl_req),

        // codemaker local memory interface
        .cm_sram0_csb0(cm_sram0_csb0),
        .cm_sram0_web0(cm_sram0_web0),
        .cm_sram0_dout0(cm_sram0_dout0),

        .cm_sram1_csb0(cm_sram1_csb0),
        .cm_sram1_web0(cm_sram1_web0),
        .cm_sram1_dout0(cm_sram1_dout0),

        .cm_sram2_csb0(cm_sram2_csb0),
        .cm_sram2_web0(cm_sram2_web0),
        .cm_sram2_dout0(cm_sram2_dout0),

        .cm_sram3_csb0(cm_sram3_csb0),
        .cm_sram3_web0(cm_sram3_web0),
        .cm_sram3_dout0(cm_sram3_dout0),

        /* .cm_sram4_csb0(cm_sram4_csb0),
        .cm_sram4_web0(cm_sram4_web0),
        .cm_sram4_dout0(cm_sram4_dout0),

        .cm_sram5_csb0(cm_sram5_csb0),
        .cm_sram5_web0(cm_sram5_web0),
        .cm_sram5_dout0(cm_sram5_dout0), */

        .cm_sram_comm_addr0(cm_sram_comm_addr0),
        .cm_sram_comm_din0(cm_sram_comm_din0),

        // control tower memory control interface
        .ct_mem_ctrl_we(ct_mem_ctrl_we),
        .ct_mem_ctrl_addr(ct_mem_ctrl_addr),
        .ct_mem_ctrl_in(ct_mem_ctrl_in),
        .ct_mem_ctrl_out(ct_mem_ctrl_out),
        .ct_mem_ctrl_vld(ct_mem_ctrl_vld),
        .ct_mem_ctrl_req(ct_mem_ctrl_req),

        // control tower local memory ct_interface
        .ct_sram0_csb0(ct_sram0_csb0),
        .ct_sram0_web0(ct_sram0_web0),
        .ct_sram0_dout0(ct_sram0_dout0),

        .ct_sram1_csb0(ct_sram1_csb0),
        .ct_sram1_web0(ct_sram1_web0),
        .ct_sram1_dout0(ct_sram1_dout0),

        .ct_sram2_csb0(ct_sram2_csb0),
        .ct_sram2_web0(ct_sram2_web0),
        .ct_sram2_dout0(ct_sram2_dout0),

        .ct_sram3_csb0(ct_sram3_csb0),
        .ct_sram3_web0(ct_sram3_web0),
        .ct_sram3_dout0(ct_sram3_dout0),

        .ct_sram4_csb0(ct_sram4_csb0),
        .ct_sram4_web0(ct_sram4_web0),
        .ct_sram4_dout0(ct_sram4_dout0),

        /* .ct_sram5_csb0(ct_sram5_csb0),
        .ct_sram5_web0(ct_sram5_web0),
        .ct_sram5_dout0(ct_sram5_dout0),

        .ct_sram6_csb0(ct_sram6_csb0),
        .ct_sram6_web0(ct_sram6_web0),
        .ct_sram6_dout0(ct_sram6_dout0), */

        .ct_sram_comm_addr0(ct_sram_comm_addr0),
        .ct_sram_comm_din0(ct_sram_comm_din0),

        // agent 1 memory control interface
        .agent_1_mem_ctrl_we(agent_1_mem_ctrl_we),
        .agent_1_mem_ctrl_addr(agent_1_mem_ctrl_addr),
        .agent_1_mem_ctrl_in(agent_1_mem_ctrl_in),
        .agent_1_mem_ctrl_out(agent_1_mem_ctrl_out),
        .agent_1_mem_ctrl_vld(agent_1_mem_ctrl_vld),
        .agent_1_mem_ctrl_req(agent_1_mem_ctrl_req),

        // agent 1 local memory interface
        .agent_1_sram0_csb0(agent_1_sram0_csb0),
        .agent_1_sram0_web0(agent_1_sram0_web0),
        .agent_1_sram0_dout0(agent_1_sram0_dout0),

        .agent_1_sram1_csb0(agent_1_sram1_csb0),
        .agent_1_sram1_web0(agent_1_sram1_web0),
        .agent_1_sram1_dout0(agent_1_sram1_dout0),

        .agent_1_sram2_csb0(agent_1_sram2_csb0),
        .agent_1_sram2_web0(agent_1_sram2_web0),
        .agent_1_sram2_dout0(agent_1_sram2_dout0),

        /* .agent_1_sram3_csb0(agent_1_sram3_csb0),
        .agent_1_sram3_web0(agent_1_sram3_web0),
        .agent_1_sram3_dout0(agent_1_sram3_dout0),

        .agent_1_sram4_csb0(agent_1_sram4_csb0),
        .agent_1_sram4_web0(agent_1_sram4_web0),
        .agent_1_sram4_dout0(agent_1_sram4_dout0), */

        .agent_1_sram_comm_addr0(agent_1_sram_comm_addr0),
        .agent_1_sram_comm_din0(agent_1_sram_comm_din0),

        // sram constant signals
        .sram_const_wmask0(sram_const_wmask0),
        .sram_const_csb1(sram_const_csb1),
        .sram_const_addr1(sram_const_addr1),

        // main memory interface signals
        .main_mem_we(main_mem_we),
        .main_mem_addr(main_mem_addr),
        .main_mem_in(main_mem_in),
        .main_mem_out(main_mem_out),

        // uart peripheral interface
        .rx_fifo_flush_enable(rx_fifo_flush_enable),
        .rd_uart(rd_uart),
        .wr_uart(wr_uart),
        .w_data(w_data),
        .tx_full(tx_full),
        .rx_empty(rx_empty),
        .r_data(r_data)

        );

    // codemaker local memory
    sky130_sram_2kbyte_1rw1r_32x512_8 codemaker_sram2k_inst0(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

         .clk0(clk),
         .csb0(cm_sram0_csb0),
         .web0(cm_sram0_web0),
         .wmask0(sram_const_wmask0),
         .addr0(cm_sram_comm_addr0),
         .din0(cm_sram_comm_din0),
         .dout0(cm_sram0_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    sky130_sram_2kbyte_1rw1r_32x512_8 codemaker_sram2k_inst1(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

         .clk0(clk),
         .csb0(cm_sram1_csb0),
         .web0(cm_sram1_web0),
         .wmask0(sram_const_wmask0),
         .addr0(cm_sram_comm_addr0),
         .din0(cm_sram_comm_din0),
         .dout0(cm_sram1_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    sky130_sram_2kbyte_1rw1r_32x512_8 codemaker_sram2k_inst2(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

         .clk0(clk),
         .csb0(cm_sram2_csb0),
         .web0(cm_sram2_web0),
         .wmask0(sram_const_wmask0),
         .addr0(cm_sram_comm_addr0),
         .din0(cm_sram_comm_din0),
         .dout0(cm_sram2_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    sky130_sram_2kbyte_1rw1r_32x512_8 codemaker_sram2k_inst3(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

         .clk0(clk),
         .csb0(cm_sram3_csb0),
         .web0(cm_sram3_web0),
         .wmask0(sram_const_wmask0),
         .addr0(cm_sram_comm_addr0),
         .din0(cm_sram_comm_din0),
         .dout0(cm_sram3_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    /* sky130_sram_2kbyte_1rw1r_32x512_8 #(
     "memfiles/codemaker_part4.mem"
        )
        codemaker_sram2k_inst4(
         .clk0(clk),
         .csb0(cm_sram4_csb0),
         .web0(cm_sram4_web0),
         .wmask0(sram_const_wmask0),
         .addr0(cm_sram_comm_addr0),
         .din0(cm_sram_comm_din0),
         .dout0(cm_sram4_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    sky130_sram_2kbyte_1rw1r_32x512_8 #(
     "memfiles/codemaker_part5.mem"
        )
        codemaker_sram2k_inst5(
         .clk0(clk),
         .csb0(cm_sram5_csb0),
         .web0(cm_sram5_web0),
         .wmask0(sram_const_wmask0),
         .addr0(cm_sram_comm_addr0),
         .din0(cm_sram_comm_din0),
         .dout0(cm_sram5_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        ); */

    // control tower local memory
    sky130_sram_2kbyte_1rw1r_32x512_8 control_tower_sram2k_inst0(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

         .clk0(clk),
         .csb0(ct_sram0_csb0),
         .web0(ct_sram0_web0),
         .wmask0(sram_const_wmask0),
         .addr0(ct_sram_comm_addr0),
         .din0(ct_sram_comm_din0),
         .dout0(ct_sram0_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    sky130_sram_2kbyte_1rw1r_32x512_8 control_tower_sram2k_inst1(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

         .clk0(clk),
         .csb0(ct_sram1_csb0),
         .web0(ct_sram1_web0),
         .wmask0(sram_const_wmask0),
         .addr0(ct_sram_comm_addr0),
         .din0(ct_sram_comm_din0),
         .dout0(ct_sram1_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    sky130_sram_2kbyte_1rw1r_32x512_8 control_tower_sram2k_inst2(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

         .clk0(clk),
         .csb0(ct_sram2_csb0),
         .web0(ct_sram2_web0),
         .wmask0(sram_const_wmask0),
         .addr0(ct_sram_comm_addr0),
         .din0(ct_sram_comm_din0),
         .dout0(ct_sram2_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    sky130_sram_2kbyte_1rw1r_32x512_8 control_tower_sram2k_inst3(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

         .clk0(clk),
         .csb0(ct_sram3_csb0),
         .web0(ct_sram3_web0),
         .wmask0(sram_const_wmask0),
         .addr0(ct_sram_comm_addr0),
         .din0(ct_sram_comm_din0),
         .dout0(ct_sram3_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    sky130_sram_2kbyte_1rw1r_32x512_8 control_tower_sram2k_inst4(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

         .clk0(clk),
         .csb0(ct_sram4_csb0),
         .web0(ct_sram4_web0),
         .wmask0(sram_const_wmask0),
         .addr0(ct_sram_comm_addr0),
         .din0(ct_sram_comm_din0),
         .dout0(ct_sram4_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    /* sky130_sram_2kbyte_1rw1r_32x512_8 #(
     "memfiles/control_tower_part5.mem"
        )
        control_tower_sram2k_inst5(
         .clk0(clk),
         .csb0(ct_sram5_csb0),
         .web0(ct_sram5_web0),
         .wmask0(sram_const_wmask0),
         .addr0(ct_sram_comm_addr0),
         .din0(ct_sram_comm_din0),
         .dout0(ct_sram5_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    sky130_sram_2kbyte_1rw1r_32x512_8 #(
     "memfiles/control_tower_part6.mem"
        )
        control_tower_sram2k_inst6(
         .clk0(clk),
         .csb0(ct_sram6_csb0),
         .web0(ct_sram6_web0),
         .wmask0(sram_const_wmask0),
         .addr0(ct_sram_comm_addr0),
         .din0(ct_sram_comm_din0),
         .dout0(ct_sram6_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        ); */

    // agent_1 local memory
    sky130_sram_2kbyte_1rw1r_32x512_8 agent_1_sram2k_inst0(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

         .clk0(clk),
         .csb0(agent_1_sram0_csb0),
         .web0(agent_1_sram0_web0),
         .wmask0(sram_const_wmask0),
         .addr0(agent_1_sram_comm_addr0),
         .din0(agent_1_sram_comm_din0),
         .dout0(agent_1_sram0_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    sky130_sram_2kbyte_1rw1r_32x512_8 agent_1_sram2k_inst1(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

         .clk0(clk),
         .csb0(agent_1_sram1_csb0),
         .web0(agent_1_sram1_web0),
         .wmask0(sram_const_wmask0),
         .addr0(agent_1_sram_comm_addr0),
         .din0(agent_1_sram_comm_din0),
         .dout0(agent_1_sram1_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    sky130_sram_2kbyte_1rw1r_32x512_8 agent_1_sram2k_inst2(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

         .clk0(clk),
         .csb0(agent_1_sram2_csb0),
         .web0(agent_1_sram2_web0),
         .wmask0(sram_const_wmask0),
         .addr0(agent_1_sram_comm_addr0),
         .din0(agent_1_sram_comm_din0),
         .dout0(agent_1_sram2_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    /* sky130_sram_2kbyte_1rw1r_32x512_8 #(
     "memfiles/agent_1_part3.mem"
        )
        agent_1_sram2k_inst3(
         .clk0(clk),
         .csb0(agent_1_sram3_csb0),
         .web0(agent_1_sram3_web0),
         .wmask0(sram_const_wmask0),
         .addr0(agent_1_sram_comm_addr0),
         .din0(agent_1_sram_comm_din0),
         .dout0(agent_1_sram3_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        );

    sky130_sram_2kbyte_1rw1r_32x512_8 #(
     "memfiles/agent_1_part4.mem"
        )
        agent_1_sram2k_inst4(
         .clk0(clk),
         .csb0(agent_1_sram4_csb0),
         .web0(agent_1_sram4_web0),
         .wmask0(sram_const_wmask0),
         .addr0(agent_1_sram_comm_addr0),
         .din0(agent_1_sram_comm_din0),
         .dout0(agent_1_sram4_dout0),
         .clk1(clk),
         .csb1(sram_const_csb1),
         .addr1(sram_const_addr1),
         .dout1()
        ); */

    // main memory
    main_memory inst_main_memory(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

        .clk(clk),
        .wea(main_mem_we),
        .addra(main_mem_addr),
        .dina(main_mem_in),
        .douta(main_mem_out),
        .gpio_in(gpio_in),
        .gpio_out(gpio_out)

    );

    // uart
    uart inst_uart(
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),    // User area 1 1.8V supply
            .vssd1(vssd1),    // User area 1 digital ground
        `endif

        .clk(clk),
        .reset(rst_asserted),
        .rx_fifo_flush_enable(rx_fifo_flush_enable),
        .rd_uart(rd_uart),
        .wr_uart(wr_uart),
        .rx(rx),
        .w_data(w_data),
        .tx_full(tx_full),
        .rx_empty(rx_empty),
        .tx(tx),
        .r_data(r_data)

    );

endmodule // user_project_wrapper

`default_nettype wire
