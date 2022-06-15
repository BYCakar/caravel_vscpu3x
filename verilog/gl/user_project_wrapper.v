module user_project_wrapper (user_clock2,
    vccd1,
    vccd2,
    vdda1,
    vdda2,
    vssa1,
    vssa2,
    vssd1,
    vssd2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    analog_io,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input vccd1;
 input vccd2;
 input vdda1;
 input vdda2;
 input vssa1;
 input vssa2;
 input vssd1;
 input vssd2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 inout [28:0] analog_io;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [127:0] la_data_in;
 output [127:0] la_data_out;
 input [127:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;

 wire tx;
 wire cm_done;
 wire ct_done;
 wire agent_1_done;
 wire \agent_1_mem_ctrl_addr[0] ;
 wire \agent_1_mem_ctrl_addr[10] ;
 wire \agent_1_mem_ctrl_addr[11] ;
 wire \agent_1_mem_ctrl_addr[12] ;
 wire \agent_1_mem_ctrl_addr[13] ;
 wire \agent_1_mem_ctrl_addr[1] ;
 wire \agent_1_mem_ctrl_addr[2] ;
 wire \agent_1_mem_ctrl_addr[3] ;
 wire \agent_1_mem_ctrl_addr[4] ;
 wire \agent_1_mem_ctrl_addr[5] ;
 wire \agent_1_mem_ctrl_addr[6] ;
 wire \agent_1_mem_ctrl_addr[7] ;
 wire \agent_1_mem_ctrl_addr[8] ;
 wire \agent_1_mem_ctrl_addr[9] ;
 wire \agent_1_mem_ctrl_in[0] ;
 wire \agent_1_mem_ctrl_in[10] ;
 wire \agent_1_mem_ctrl_in[11] ;
 wire \agent_1_mem_ctrl_in[12] ;
 wire \agent_1_mem_ctrl_in[13] ;
 wire \agent_1_mem_ctrl_in[14] ;
 wire \agent_1_mem_ctrl_in[15] ;
 wire \agent_1_mem_ctrl_in[16] ;
 wire \agent_1_mem_ctrl_in[17] ;
 wire \agent_1_mem_ctrl_in[18] ;
 wire \agent_1_mem_ctrl_in[19] ;
 wire \agent_1_mem_ctrl_in[1] ;
 wire \agent_1_mem_ctrl_in[20] ;
 wire \agent_1_mem_ctrl_in[21] ;
 wire \agent_1_mem_ctrl_in[22] ;
 wire \agent_1_mem_ctrl_in[23] ;
 wire \agent_1_mem_ctrl_in[24] ;
 wire \agent_1_mem_ctrl_in[25] ;
 wire \agent_1_mem_ctrl_in[26] ;
 wire \agent_1_mem_ctrl_in[27] ;
 wire \agent_1_mem_ctrl_in[28] ;
 wire \agent_1_mem_ctrl_in[29] ;
 wire \agent_1_mem_ctrl_in[2] ;
 wire \agent_1_mem_ctrl_in[30] ;
 wire \agent_1_mem_ctrl_in[31] ;
 wire \agent_1_mem_ctrl_in[3] ;
 wire \agent_1_mem_ctrl_in[4] ;
 wire \agent_1_mem_ctrl_in[5] ;
 wire \agent_1_mem_ctrl_in[6] ;
 wire \agent_1_mem_ctrl_in[7] ;
 wire \agent_1_mem_ctrl_in[8] ;
 wire \agent_1_mem_ctrl_in[9] ;
 wire \agent_1_mem_ctrl_out[0] ;
 wire \agent_1_mem_ctrl_out[10] ;
 wire \agent_1_mem_ctrl_out[11] ;
 wire \agent_1_mem_ctrl_out[12] ;
 wire \agent_1_mem_ctrl_out[13] ;
 wire \agent_1_mem_ctrl_out[14] ;
 wire \agent_1_mem_ctrl_out[15] ;
 wire \agent_1_mem_ctrl_out[16] ;
 wire \agent_1_mem_ctrl_out[17] ;
 wire \agent_1_mem_ctrl_out[18] ;
 wire \agent_1_mem_ctrl_out[19] ;
 wire \agent_1_mem_ctrl_out[1] ;
 wire \agent_1_mem_ctrl_out[20] ;
 wire \agent_1_mem_ctrl_out[21] ;
 wire \agent_1_mem_ctrl_out[22] ;
 wire \agent_1_mem_ctrl_out[23] ;
 wire \agent_1_mem_ctrl_out[24] ;
 wire \agent_1_mem_ctrl_out[25] ;
 wire \agent_1_mem_ctrl_out[26] ;
 wire \agent_1_mem_ctrl_out[27] ;
 wire \agent_1_mem_ctrl_out[28] ;
 wire \agent_1_mem_ctrl_out[29] ;
 wire \agent_1_mem_ctrl_out[2] ;
 wire \agent_1_mem_ctrl_out[30] ;
 wire \agent_1_mem_ctrl_out[31] ;
 wire \agent_1_mem_ctrl_out[3] ;
 wire \agent_1_mem_ctrl_out[4] ;
 wire \agent_1_mem_ctrl_out[5] ;
 wire \agent_1_mem_ctrl_out[6] ;
 wire \agent_1_mem_ctrl_out[7] ;
 wire \agent_1_mem_ctrl_out[8] ;
 wire \agent_1_mem_ctrl_out[9] ;
 wire agent_1_mem_ctrl_req;
 wire agent_1_mem_ctrl_vld;
 wire agent_1_mem_ctrl_we;
 wire agent_1_sram0_csb0;
 wire \agent_1_sram0_dout0[0] ;
 wire \agent_1_sram0_dout0[10] ;
 wire \agent_1_sram0_dout0[11] ;
 wire \agent_1_sram0_dout0[12] ;
 wire \agent_1_sram0_dout0[13] ;
 wire \agent_1_sram0_dout0[14] ;
 wire \agent_1_sram0_dout0[15] ;
 wire \agent_1_sram0_dout0[16] ;
 wire \agent_1_sram0_dout0[17] ;
 wire \agent_1_sram0_dout0[18] ;
 wire \agent_1_sram0_dout0[19] ;
 wire \agent_1_sram0_dout0[1] ;
 wire \agent_1_sram0_dout0[20] ;
 wire \agent_1_sram0_dout0[21] ;
 wire \agent_1_sram0_dout0[22] ;
 wire \agent_1_sram0_dout0[23] ;
 wire \agent_1_sram0_dout0[24] ;
 wire \agent_1_sram0_dout0[25] ;
 wire \agent_1_sram0_dout0[26] ;
 wire \agent_1_sram0_dout0[27] ;
 wire \agent_1_sram0_dout0[28] ;
 wire \agent_1_sram0_dout0[29] ;
 wire \agent_1_sram0_dout0[2] ;
 wire \agent_1_sram0_dout0[30] ;
 wire \agent_1_sram0_dout0[31] ;
 wire \agent_1_sram0_dout0[3] ;
 wire \agent_1_sram0_dout0[4] ;
 wire \agent_1_sram0_dout0[5] ;
 wire \agent_1_sram0_dout0[6] ;
 wire \agent_1_sram0_dout0[7] ;
 wire \agent_1_sram0_dout0[8] ;
 wire \agent_1_sram0_dout0[9] ;
 wire agent_1_sram0_web0;
 wire agent_1_sram1_csb0;
 wire \agent_1_sram1_dout0[0] ;
 wire \agent_1_sram1_dout0[10] ;
 wire \agent_1_sram1_dout0[11] ;
 wire \agent_1_sram1_dout0[12] ;
 wire \agent_1_sram1_dout0[13] ;
 wire \agent_1_sram1_dout0[14] ;
 wire \agent_1_sram1_dout0[15] ;
 wire \agent_1_sram1_dout0[16] ;
 wire \agent_1_sram1_dout0[17] ;
 wire \agent_1_sram1_dout0[18] ;
 wire \agent_1_sram1_dout0[19] ;
 wire \agent_1_sram1_dout0[1] ;
 wire \agent_1_sram1_dout0[20] ;
 wire \agent_1_sram1_dout0[21] ;
 wire \agent_1_sram1_dout0[22] ;
 wire \agent_1_sram1_dout0[23] ;
 wire \agent_1_sram1_dout0[24] ;
 wire \agent_1_sram1_dout0[25] ;
 wire \agent_1_sram1_dout0[26] ;
 wire \agent_1_sram1_dout0[27] ;
 wire \agent_1_sram1_dout0[28] ;
 wire \agent_1_sram1_dout0[29] ;
 wire \agent_1_sram1_dout0[2] ;
 wire \agent_1_sram1_dout0[30] ;
 wire \agent_1_sram1_dout0[31] ;
 wire \agent_1_sram1_dout0[3] ;
 wire \agent_1_sram1_dout0[4] ;
 wire \agent_1_sram1_dout0[5] ;
 wire \agent_1_sram1_dout0[6] ;
 wire \agent_1_sram1_dout0[7] ;
 wire \agent_1_sram1_dout0[8] ;
 wire \agent_1_sram1_dout0[9] ;
 wire agent_1_sram1_web0;
 wire agent_1_sram2_csb0;
 wire \agent_1_sram2_dout0[0] ;
 wire \agent_1_sram2_dout0[10] ;
 wire \agent_1_sram2_dout0[11] ;
 wire \agent_1_sram2_dout0[12] ;
 wire \agent_1_sram2_dout0[13] ;
 wire \agent_1_sram2_dout0[14] ;
 wire \agent_1_sram2_dout0[15] ;
 wire \agent_1_sram2_dout0[16] ;
 wire \agent_1_sram2_dout0[17] ;
 wire \agent_1_sram2_dout0[18] ;
 wire \agent_1_sram2_dout0[19] ;
 wire \agent_1_sram2_dout0[1] ;
 wire \agent_1_sram2_dout0[20] ;
 wire \agent_1_sram2_dout0[21] ;
 wire \agent_1_sram2_dout0[22] ;
 wire \agent_1_sram2_dout0[23] ;
 wire \agent_1_sram2_dout0[24] ;
 wire \agent_1_sram2_dout0[25] ;
 wire \agent_1_sram2_dout0[26] ;
 wire \agent_1_sram2_dout0[27] ;
 wire \agent_1_sram2_dout0[28] ;
 wire \agent_1_sram2_dout0[29] ;
 wire \agent_1_sram2_dout0[2] ;
 wire \agent_1_sram2_dout0[30] ;
 wire \agent_1_sram2_dout0[31] ;
 wire \agent_1_sram2_dout0[3] ;
 wire \agent_1_sram2_dout0[4] ;
 wire \agent_1_sram2_dout0[5] ;
 wire \agent_1_sram2_dout0[6] ;
 wire \agent_1_sram2_dout0[7] ;
 wire \agent_1_sram2_dout0[8] ;
 wire \agent_1_sram2_dout0[9] ;
 wire agent_1_sram2_web0;
 wire \agent_1_sram_comm_addr0[0] ;
 wire \agent_1_sram_comm_addr0[1] ;
 wire \agent_1_sram_comm_addr0[2] ;
 wire \agent_1_sram_comm_addr0[3] ;
 wire \agent_1_sram_comm_addr0[4] ;
 wire \agent_1_sram_comm_addr0[5] ;
 wire \agent_1_sram_comm_addr0[6] ;
 wire \agent_1_sram_comm_addr0[7] ;
 wire \agent_1_sram_comm_addr0[8] ;
 wire \agent_1_sram_comm_din0[0] ;
 wire \agent_1_sram_comm_din0[10] ;
 wire \agent_1_sram_comm_din0[11] ;
 wire \agent_1_sram_comm_din0[12] ;
 wire \agent_1_sram_comm_din0[13] ;
 wire \agent_1_sram_comm_din0[14] ;
 wire \agent_1_sram_comm_din0[15] ;
 wire \agent_1_sram_comm_din0[16] ;
 wire \agent_1_sram_comm_din0[17] ;
 wire \agent_1_sram_comm_din0[18] ;
 wire \agent_1_sram_comm_din0[19] ;
 wire \agent_1_sram_comm_din0[1] ;
 wire \agent_1_sram_comm_din0[20] ;
 wire \agent_1_sram_comm_din0[21] ;
 wire \agent_1_sram_comm_din0[22] ;
 wire \agent_1_sram_comm_din0[23] ;
 wire \agent_1_sram_comm_din0[24] ;
 wire \agent_1_sram_comm_din0[25] ;
 wire \agent_1_sram_comm_din0[26] ;
 wire \agent_1_sram_comm_din0[27] ;
 wire \agent_1_sram_comm_din0[28] ;
 wire \agent_1_sram_comm_din0[29] ;
 wire \agent_1_sram_comm_din0[2] ;
 wire \agent_1_sram_comm_din0[30] ;
 wire \agent_1_sram_comm_din0[31] ;
 wire \agent_1_sram_comm_din0[3] ;
 wire \agent_1_sram_comm_din0[4] ;
 wire \agent_1_sram_comm_din0[5] ;
 wire \agent_1_sram_comm_din0[6] ;
 wire \agent_1_sram_comm_din0[7] ;
 wire \agent_1_sram_comm_din0[8] ;
 wire \agent_1_sram_comm_din0[9] ;
 wire \cm_mem_ctrl_addr[0] ;
 wire \cm_mem_ctrl_addr[10] ;
 wire \cm_mem_ctrl_addr[11] ;
 wire \cm_mem_ctrl_addr[12] ;
 wire \cm_mem_ctrl_addr[13] ;
 wire \cm_mem_ctrl_addr[1] ;
 wire \cm_mem_ctrl_addr[2] ;
 wire \cm_mem_ctrl_addr[3] ;
 wire \cm_mem_ctrl_addr[4] ;
 wire \cm_mem_ctrl_addr[5] ;
 wire \cm_mem_ctrl_addr[6] ;
 wire \cm_mem_ctrl_addr[7] ;
 wire \cm_mem_ctrl_addr[8] ;
 wire \cm_mem_ctrl_addr[9] ;
 wire \cm_mem_ctrl_in[0] ;
 wire \cm_mem_ctrl_in[10] ;
 wire \cm_mem_ctrl_in[11] ;
 wire \cm_mem_ctrl_in[12] ;
 wire \cm_mem_ctrl_in[13] ;
 wire \cm_mem_ctrl_in[14] ;
 wire \cm_mem_ctrl_in[15] ;
 wire \cm_mem_ctrl_in[16] ;
 wire \cm_mem_ctrl_in[17] ;
 wire \cm_mem_ctrl_in[18] ;
 wire \cm_mem_ctrl_in[19] ;
 wire \cm_mem_ctrl_in[1] ;
 wire \cm_mem_ctrl_in[20] ;
 wire \cm_mem_ctrl_in[21] ;
 wire \cm_mem_ctrl_in[22] ;
 wire \cm_mem_ctrl_in[23] ;
 wire \cm_mem_ctrl_in[24] ;
 wire \cm_mem_ctrl_in[25] ;
 wire \cm_mem_ctrl_in[26] ;
 wire \cm_mem_ctrl_in[27] ;
 wire \cm_mem_ctrl_in[28] ;
 wire \cm_mem_ctrl_in[29] ;
 wire \cm_mem_ctrl_in[2] ;
 wire \cm_mem_ctrl_in[30] ;
 wire \cm_mem_ctrl_in[31] ;
 wire \cm_mem_ctrl_in[3] ;
 wire \cm_mem_ctrl_in[4] ;
 wire \cm_mem_ctrl_in[5] ;
 wire \cm_mem_ctrl_in[6] ;
 wire \cm_mem_ctrl_in[7] ;
 wire \cm_mem_ctrl_in[8] ;
 wire \cm_mem_ctrl_in[9] ;
 wire \cm_mem_ctrl_out[0] ;
 wire \cm_mem_ctrl_out[10] ;
 wire \cm_mem_ctrl_out[11] ;
 wire \cm_mem_ctrl_out[12] ;
 wire \cm_mem_ctrl_out[13] ;
 wire \cm_mem_ctrl_out[14] ;
 wire \cm_mem_ctrl_out[15] ;
 wire \cm_mem_ctrl_out[16] ;
 wire \cm_mem_ctrl_out[17] ;
 wire \cm_mem_ctrl_out[18] ;
 wire \cm_mem_ctrl_out[19] ;
 wire \cm_mem_ctrl_out[1] ;
 wire \cm_mem_ctrl_out[20] ;
 wire \cm_mem_ctrl_out[21] ;
 wire \cm_mem_ctrl_out[22] ;
 wire \cm_mem_ctrl_out[23] ;
 wire \cm_mem_ctrl_out[24] ;
 wire \cm_mem_ctrl_out[25] ;
 wire \cm_mem_ctrl_out[26] ;
 wire \cm_mem_ctrl_out[27] ;
 wire \cm_mem_ctrl_out[28] ;
 wire \cm_mem_ctrl_out[29] ;
 wire \cm_mem_ctrl_out[2] ;
 wire \cm_mem_ctrl_out[30] ;
 wire \cm_mem_ctrl_out[31] ;
 wire \cm_mem_ctrl_out[3] ;
 wire \cm_mem_ctrl_out[4] ;
 wire \cm_mem_ctrl_out[5] ;
 wire \cm_mem_ctrl_out[6] ;
 wire \cm_mem_ctrl_out[7] ;
 wire \cm_mem_ctrl_out[8] ;
 wire \cm_mem_ctrl_out[9] ;
 wire cm_mem_ctrl_req;
 wire cm_mem_ctrl_vld;
 wire cm_mem_ctrl_we;
 wire cm_sram0_csb0;
 wire \cm_sram0_dout0[0] ;
 wire \cm_sram0_dout0[10] ;
 wire \cm_sram0_dout0[11] ;
 wire \cm_sram0_dout0[12] ;
 wire \cm_sram0_dout0[13] ;
 wire \cm_sram0_dout0[14] ;
 wire \cm_sram0_dout0[15] ;
 wire \cm_sram0_dout0[16] ;
 wire \cm_sram0_dout0[17] ;
 wire \cm_sram0_dout0[18] ;
 wire \cm_sram0_dout0[19] ;
 wire \cm_sram0_dout0[1] ;
 wire \cm_sram0_dout0[20] ;
 wire \cm_sram0_dout0[21] ;
 wire \cm_sram0_dout0[22] ;
 wire \cm_sram0_dout0[23] ;
 wire \cm_sram0_dout0[24] ;
 wire \cm_sram0_dout0[25] ;
 wire \cm_sram0_dout0[26] ;
 wire \cm_sram0_dout0[27] ;
 wire \cm_sram0_dout0[28] ;
 wire \cm_sram0_dout0[29] ;
 wire \cm_sram0_dout0[2] ;
 wire \cm_sram0_dout0[30] ;
 wire \cm_sram0_dout0[31] ;
 wire \cm_sram0_dout0[3] ;
 wire \cm_sram0_dout0[4] ;
 wire \cm_sram0_dout0[5] ;
 wire \cm_sram0_dout0[6] ;
 wire \cm_sram0_dout0[7] ;
 wire \cm_sram0_dout0[8] ;
 wire \cm_sram0_dout0[9] ;
 wire cm_sram0_web0;
 wire cm_sram1_csb0;
 wire \cm_sram1_dout0[0] ;
 wire \cm_sram1_dout0[10] ;
 wire \cm_sram1_dout0[11] ;
 wire \cm_sram1_dout0[12] ;
 wire \cm_sram1_dout0[13] ;
 wire \cm_sram1_dout0[14] ;
 wire \cm_sram1_dout0[15] ;
 wire \cm_sram1_dout0[16] ;
 wire \cm_sram1_dout0[17] ;
 wire \cm_sram1_dout0[18] ;
 wire \cm_sram1_dout0[19] ;
 wire \cm_sram1_dout0[1] ;
 wire \cm_sram1_dout0[20] ;
 wire \cm_sram1_dout0[21] ;
 wire \cm_sram1_dout0[22] ;
 wire \cm_sram1_dout0[23] ;
 wire \cm_sram1_dout0[24] ;
 wire \cm_sram1_dout0[25] ;
 wire \cm_sram1_dout0[26] ;
 wire \cm_sram1_dout0[27] ;
 wire \cm_sram1_dout0[28] ;
 wire \cm_sram1_dout0[29] ;
 wire \cm_sram1_dout0[2] ;
 wire \cm_sram1_dout0[30] ;
 wire \cm_sram1_dout0[31] ;
 wire \cm_sram1_dout0[3] ;
 wire \cm_sram1_dout0[4] ;
 wire \cm_sram1_dout0[5] ;
 wire \cm_sram1_dout0[6] ;
 wire \cm_sram1_dout0[7] ;
 wire \cm_sram1_dout0[8] ;
 wire \cm_sram1_dout0[9] ;
 wire cm_sram1_web0;
 wire cm_sram2_csb0;
 wire \cm_sram2_dout0[0] ;
 wire \cm_sram2_dout0[10] ;
 wire \cm_sram2_dout0[11] ;
 wire \cm_sram2_dout0[12] ;
 wire \cm_sram2_dout0[13] ;
 wire \cm_sram2_dout0[14] ;
 wire \cm_sram2_dout0[15] ;
 wire \cm_sram2_dout0[16] ;
 wire \cm_sram2_dout0[17] ;
 wire \cm_sram2_dout0[18] ;
 wire \cm_sram2_dout0[19] ;
 wire \cm_sram2_dout0[1] ;
 wire \cm_sram2_dout0[20] ;
 wire \cm_sram2_dout0[21] ;
 wire \cm_sram2_dout0[22] ;
 wire \cm_sram2_dout0[23] ;
 wire \cm_sram2_dout0[24] ;
 wire \cm_sram2_dout0[25] ;
 wire \cm_sram2_dout0[26] ;
 wire \cm_sram2_dout0[27] ;
 wire \cm_sram2_dout0[28] ;
 wire \cm_sram2_dout0[29] ;
 wire \cm_sram2_dout0[2] ;
 wire \cm_sram2_dout0[30] ;
 wire \cm_sram2_dout0[31] ;
 wire \cm_sram2_dout0[3] ;
 wire \cm_sram2_dout0[4] ;
 wire \cm_sram2_dout0[5] ;
 wire \cm_sram2_dout0[6] ;
 wire \cm_sram2_dout0[7] ;
 wire \cm_sram2_dout0[8] ;
 wire \cm_sram2_dout0[9] ;
 wire cm_sram2_web0;
 wire cm_sram3_csb0;
 wire \cm_sram3_dout0[0] ;
 wire \cm_sram3_dout0[10] ;
 wire \cm_sram3_dout0[11] ;
 wire \cm_sram3_dout0[12] ;
 wire \cm_sram3_dout0[13] ;
 wire \cm_sram3_dout0[14] ;
 wire \cm_sram3_dout0[15] ;
 wire \cm_sram3_dout0[16] ;
 wire \cm_sram3_dout0[17] ;
 wire \cm_sram3_dout0[18] ;
 wire \cm_sram3_dout0[19] ;
 wire \cm_sram3_dout0[1] ;
 wire \cm_sram3_dout0[20] ;
 wire \cm_sram3_dout0[21] ;
 wire \cm_sram3_dout0[22] ;
 wire \cm_sram3_dout0[23] ;
 wire \cm_sram3_dout0[24] ;
 wire \cm_sram3_dout0[25] ;
 wire \cm_sram3_dout0[26] ;
 wire \cm_sram3_dout0[27] ;
 wire \cm_sram3_dout0[28] ;
 wire \cm_sram3_dout0[29] ;
 wire \cm_sram3_dout0[2] ;
 wire \cm_sram3_dout0[30] ;
 wire \cm_sram3_dout0[31] ;
 wire \cm_sram3_dout0[3] ;
 wire \cm_sram3_dout0[4] ;
 wire \cm_sram3_dout0[5] ;
 wire \cm_sram3_dout0[6] ;
 wire \cm_sram3_dout0[7] ;
 wire \cm_sram3_dout0[8] ;
 wire \cm_sram3_dout0[9] ;
 wire cm_sram3_web0;
 wire \cm_sram_comm_addr0[0] ;
 wire \cm_sram_comm_addr0[1] ;
 wire \cm_sram_comm_addr0[2] ;
 wire \cm_sram_comm_addr0[3] ;
 wire \cm_sram_comm_addr0[4] ;
 wire \cm_sram_comm_addr0[5] ;
 wire \cm_sram_comm_addr0[6] ;
 wire \cm_sram_comm_addr0[7] ;
 wire \cm_sram_comm_addr0[8] ;
 wire \cm_sram_comm_din0[0] ;
 wire \cm_sram_comm_din0[10] ;
 wire \cm_sram_comm_din0[11] ;
 wire \cm_sram_comm_din0[12] ;
 wire \cm_sram_comm_din0[13] ;
 wire \cm_sram_comm_din0[14] ;
 wire \cm_sram_comm_din0[15] ;
 wire \cm_sram_comm_din0[16] ;
 wire \cm_sram_comm_din0[17] ;
 wire \cm_sram_comm_din0[18] ;
 wire \cm_sram_comm_din0[19] ;
 wire \cm_sram_comm_din0[1] ;
 wire \cm_sram_comm_din0[20] ;
 wire \cm_sram_comm_din0[21] ;
 wire \cm_sram_comm_din0[22] ;
 wire \cm_sram_comm_din0[23] ;
 wire \cm_sram_comm_din0[24] ;
 wire \cm_sram_comm_din0[25] ;
 wire \cm_sram_comm_din0[26] ;
 wire \cm_sram_comm_din0[27] ;
 wire \cm_sram_comm_din0[28] ;
 wire \cm_sram_comm_din0[29] ;
 wire \cm_sram_comm_din0[2] ;
 wire \cm_sram_comm_din0[30] ;
 wire \cm_sram_comm_din0[31] ;
 wire \cm_sram_comm_din0[3] ;
 wire \cm_sram_comm_din0[4] ;
 wire \cm_sram_comm_din0[5] ;
 wire \cm_sram_comm_din0[6] ;
 wire \cm_sram_comm_din0[7] ;
 wire \cm_sram_comm_din0[8] ;
 wire \cm_sram_comm_din0[9] ;
 wire \ct_mem_ctrl_addr[0] ;
 wire \ct_mem_ctrl_addr[10] ;
 wire \ct_mem_ctrl_addr[11] ;
 wire \ct_mem_ctrl_addr[12] ;
 wire \ct_mem_ctrl_addr[13] ;
 wire \ct_mem_ctrl_addr[1] ;
 wire \ct_mem_ctrl_addr[2] ;
 wire \ct_mem_ctrl_addr[3] ;
 wire \ct_mem_ctrl_addr[4] ;
 wire \ct_mem_ctrl_addr[5] ;
 wire \ct_mem_ctrl_addr[6] ;
 wire \ct_mem_ctrl_addr[7] ;
 wire \ct_mem_ctrl_addr[8] ;
 wire \ct_mem_ctrl_addr[9] ;
 wire \ct_mem_ctrl_in[0] ;
 wire \ct_mem_ctrl_in[10] ;
 wire \ct_mem_ctrl_in[11] ;
 wire \ct_mem_ctrl_in[12] ;
 wire \ct_mem_ctrl_in[13] ;
 wire \ct_mem_ctrl_in[14] ;
 wire \ct_mem_ctrl_in[15] ;
 wire \ct_mem_ctrl_in[16] ;
 wire \ct_mem_ctrl_in[17] ;
 wire \ct_mem_ctrl_in[18] ;
 wire \ct_mem_ctrl_in[19] ;
 wire \ct_mem_ctrl_in[1] ;
 wire \ct_mem_ctrl_in[20] ;
 wire \ct_mem_ctrl_in[21] ;
 wire \ct_mem_ctrl_in[22] ;
 wire \ct_mem_ctrl_in[23] ;
 wire \ct_mem_ctrl_in[24] ;
 wire \ct_mem_ctrl_in[25] ;
 wire \ct_mem_ctrl_in[26] ;
 wire \ct_mem_ctrl_in[27] ;
 wire \ct_mem_ctrl_in[28] ;
 wire \ct_mem_ctrl_in[29] ;
 wire \ct_mem_ctrl_in[2] ;
 wire \ct_mem_ctrl_in[30] ;
 wire \ct_mem_ctrl_in[31] ;
 wire \ct_mem_ctrl_in[3] ;
 wire \ct_mem_ctrl_in[4] ;
 wire \ct_mem_ctrl_in[5] ;
 wire \ct_mem_ctrl_in[6] ;
 wire \ct_mem_ctrl_in[7] ;
 wire \ct_mem_ctrl_in[8] ;
 wire \ct_mem_ctrl_in[9] ;
 wire \ct_mem_ctrl_out[0] ;
 wire \ct_mem_ctrl_out[10] ;
 wire \ct_mem_ctrl_out[11] ;
 wire \ct_mem_ctrl_out[12] ;
 wire \ct_mem_ctrl_out[13] ;
 wire \ct_mem_ctrl_out[14] ;
 wire \ct_mem_ctrl_out[15] ;
 wire \ct_mem_ctrl_out[16] ;
 wire \ct_mem_ctrl_out[17] ;
 wire \ct_mem_ctrl_out[18] ;
 wire \ct_mem_ctrl_out[19] ;
 wire \ct_mem_ctrl_out[1] ;
 wire \ct_mem_ctrl_out[20] ;
 wire \ct_mem_ctrl_out[21] ;
 wire \ct_mem_ctrl_out[22] ;
 wire \ct_mem_ctrl_out[23] ;
 wire \ct_mem_ctrl_out[24] ;
 wire \ct_mem_ctrl_out[25] ;
 wire \ct_mem_ctrl_out[26] ;
 wire \ct_mem_ctrl_out[27] ;
 wire \ct_mem_ctrl_out[28] ;
 wire \ct_mem_ctrl_out[29] ;
 wire \ct_mem_ctrl_out[2] ;
 wire \ct_mem_ctrl_out[30] ;
 wire \ct_mem_ctrl_out[31] ;
 wire \ct_mem_ctrl_out[3] ;
 wire \ct_mem_ctrl_out[4] ;
 wire \ct_mem_ctrl_out[5] ;
 wire \ct_mem_ctrl_out[6] ;
 wire \ct_mem_ctrl_out[7] ;
 wire \ct_mem_ctrl_out[8] ;
 wire \ct_mem_ctrl_out[9] ;
 wire ct_mem_ctrl_req;
 wire ct_mem_ctrl_vld;
 wire ct_mem_ctrl_we;
 wire ct_sram0_csb0;
 wire \ct_sram0_dout0[0] ;
 wire \ct_sram0_dout0[10] ;
 wire \ct_sram0_dout0[11] ;
 wire \ct_sram0_dout0[12] ;
 wire \ct_sram0_dout0[13] ;
 wire \ct_sram0_dout0[14] ;
 wire \ct_sram0_dout0[15] ;
 wire \ct_sram0_dout0[16] ;
 wire \ct_sram0_dout0[17] ;
 wire \ct_sram0_dout0[18] ;
 wire \ct_sram0_dout0[19] ;
 wire \ct_sram0_dout0[1] ;
 wire \ct_sram0_dout0[20] ;
 wire \ct_sram0_dout0[21] ;
 wire \ct_sram0_dout0[22] ;
 wire \ct_sram0_dout0[23] ;
 wire \ct_sram0_dout0[24] ;
 wire \ct_sram0_dout0[25] ;
 wire \ct_sram0_dout0[26] ;
 wire \ct_sram0_dout0[27] ;
 wire \ct_sram0_dout0[28] ;
 wire \ct_sram0_dout0[29] ;
 wire \ct_sram0_dout0[2] ;
 wire \ct_sram0_dout0[30] ;
 wire \ct_sram0_dout0[31] ;
 wire \ct_sram0_dout0[3] ;
 wire \ct_sram0_dout0[4] ;
 wire \ct_sram0_dout0[5] ;
 wire \ct_sram0_dout0[6] ;
 wire \ct_sram0_dout0[7] ;
 wire \ct_sram0_dout0[8] ;
 wire \ct_sram0_dout0[9] ;
 wire ct_sram0_web0;
 wire ct_sram1_csb0;
 wire \ct_sram1_dout0[0] ;
 wire \ct_sram1_dout0[10] ;
 wire \ct_sram1_dout0[11] ;
 wire \ct_sram1_dout0[12] ;
 wire \ct_sram1_dout0[13] ;
 wire \ct_sram1_dout0[14] ;
 wire \ct_sram1_dout0[15] ;
 wire \ct_sram1_dout0[16] ;
 wire \ct_sram1_dout0[17] ;
 wire \ct_sram1_dout0[18] ;
 wire \ct_sram1_dout0[19] ;
 wire \ct_sram1_dout0[1] ;
 wire \ct_sram1_dout0[20] ;
 wire \ct_sram1_dout0[21] ;
 wire \ct_sram1_dout0[22] ;
 wire \ct_sram1_dout0[23] ;
 wire \ct_sram1_dout0[24] ;
 wire \ct_sram1_dout0[25] ;
 wire \ct_sram1_dout0[26] ;
 wire \ct_sram1_dout0[27] ;
 wire \ct_sram1_dout0[28] ;
 wire \ct_sram1_dout0[29] ;
 wire \ct_sram1_dout0[2] ;
 wire \ct_sram1_dout0[30] ;
 wire \ct_sram1_dout0[31] ;
 wire \ct_sram1_dout0[3] ;
 wire \ct_sram1_dout0[4] ;
 wire \ct_sram1_dout0[5] ;
 wire \ct_sram1_dout0[6] ;
 wire \ct_sram1_dout0[7] ;
 wire \ct_sram1_dout0[8] ;
 wire \ct_sram1_dout0[9] ;
 wire ct_sram1_web0;
 wire ct_sram2_csb0;
 wire \ct_sram2_dout0[0] ;
 wire \ct_sram2_dout0[10] ;
 wire \ct_sram2_dout0[11] ;
 wire \ct_sram2_dout0[12] ;
 wire \ct_sram2_dout0[13] ;
 wire \ct_sram2_dout0[14] ;
 wire \ct_sram2_dout0[15] ;
 wire \ct_sram2_dout0[16] ;
 wire \ct_sram2_dout0[17] ;
 wire \ct_sram2_dout0[18] ;
 wire \ct_sram2_dout0[19] ;
 wire \ct_sram2_dout0[1] ;
 wire \ct_sram2_dout0[20] ;
 wire \ct_sram2_dout0[21] ;
 wire \ct_sram2_dout0[22] ;
 wire \ct_sram2_dout0[23] ;
 wire \ct_sram2_dout0[24] ;
 wire \ct_sram2_dout0[25] ;
 wire \ct_sram2_dout0[26] ;
 wire \ct_sram2_dout0[27] ;
 wire \ct_sram2_dout0[28] ;
 wire \ct_sram2_dout0[29] ;
 wire \ct_sram2_dout0[2] ;
 wire \ct_sram2_dout0[30] ;
 wire \ct_sram2_dout0[31] ;
 wire \ct_sram2_dout0[3] ;
 wire \ct_sram2_dout0[4] ;
 wire \ct_sram2_dout0[5] ;
 wire \ct_sram2_dout0[6] ;
 wire \ct_sram2_dout0[7] ;
 wire \ct_sram2_dout0[8] ;
 wire \ct_sram2_dout0[9] ;
 wire ct_sram2_web0;
 wire ct_sram3_csb0;
 wire \ct_sram3_dout0[0] ;
 wire \ct_sram3_dout0[10] ;
 wire \ct_sram3_dout0[11] ;
 wire \ct_sram3_dout0[12] ;
 wire \ct_sram3_dout0[13] ;
 wire \ct_sram3_dout0[14] ;
 wire \ct_sram3_dout0[15] ;
 wire \ct_sram3_dout0[16] ;
 wire \ct_sram3_dout0[17] ;
 wire \ct_sram3_dout0[18] ;
 wire \ct_sram3_dout0[19] ;
 wire \ct_sram3_dout0[1] ;
 wire \ct_sram3_dout0[20] ;
 wire \ct_sram3_dout0[21] ;
 wire \ct_sram3_dout0[22] ;
 wire \ct_sram3_dout0[23] ;
 wire \ct_sram3_dout0[24] ;
 wire \ct_sram3_dout0[25] ;
 wire \ct_sram3_dout0[26] ;
 wire \ct_sram3_dout0[27] ;
 wire \ct_sram3_dout0[28] ;
 wire \ct_sram3_dout0[29] ;
 wire \ct_sram3_dout0[2] ;
 wire \ct_sram3_dout0[30] ;
 wire \ct_sram3_dout0[31] ;
 wire \ct_sram3_dout0[3] ;
 wire \ct_sram3_dout0[4] ;
 wire \ct_sram3_dout0[5] ;
 wire \ct_sram3_dout0[6] ;
 wire \ct_sram3_dout0[7] ;
 wire \ct_sram3_dout0[8] ;
 wire \ct_sram3_dout0[9] ;
 wire ct_sram3_web0;
 wire ct_sram4_csb0;
 wire \ct_sram4_dout0[0] ;
 wire \ct_sram4_dout0[10] ;
 wire \ct_sram4_dout0[11] ;
 wire \ct_sram4_dout0[12] ;
 wire \ct_sram4_dout0[13] ;
 wire \ct_sram4_dout0[14] ;
 wire \ct_sram4_dout0[15] ;
 wire \ct_sram4_dout0[16] ;
 wire \ct_sram4_dout0[17] ;
 wire \ct_sram4_dout0[18] ;
 wire \ct_sram4_dout0[19] ;
 wire \ct_sram4_dout0[1] ;
 wire \ct_sram4_dout0[20] ;
 wire \ct_sram4_dout0[21] ;
 wire \ct_sram4_dout0[22] ;
 wire \ct_sram4_dout0[23] ;
 wire \ct_sram4_dout0[24] ;
 wire \ct_sram4_dout0[25] ;
 wire \ct_sram4_dout0[26] ;
 wire \ct_sram4_dout0[27] ;
 wire \ct_sram4_dout0[28] ;
 wire \ct_sram4_dout0[29] ;
 wire \ct_sram4_dout0[2] ;
 wire \ct_sram4_dout0[30] ;
 wire \ct_sram4_dout0[31] ;
 wire \ct_sram4_dout0[3] ;
 wire \ct_sram4_dout0[4] ;
 wire \ct_sram4_dout0[5] ;
 wire \ct_sram4_dout0[6] ;
 wire \ct_sram4_dout0[7] ;
 wire \ct_sram4_dout0[8] ;
 wire \ct_sram4_dout0[9] ;
 wire ct_sram4_web0;
 wire \ct_sram_comm_addr0[0] ;
 wire \ct_sram_comm_addr0[1] ;
 wire \ct_sram_comm_addr0[2] ;
 wire \ct_sram_comm_addr0[3] ;
 wire \ct_sram_comm_addr0[4] ;
 wire \ct_sram_comm_addr0[5] ;
 wire \ct_sram_comm_addr0[6] ;
 wire \ct_sram_comm_addr0[7] ;
 wire \ct_sram_comm_addr0[8] ;
 wire \ct_sram_comm_din0[0] ;
 wire \ct_sram_comm_din0[10] ;
 wire \ct_sram_comm_din0[11] ;
 wire \ct_sram_comm_din0[12] ;
 wire \ct_sram_comm_din0[13] ;
 wire \ct_sram_comm_din0[14] ;
 wire \ct_sram_comm_din0[15] ;
 wire \ct_sram_comm_din0[16] ;
 wire \ct_sram_comm_din0[17] ;
 wire \ct_sram_comm_din0[18] ;
 wire \ct_sram_comm_din0[19] ;
 wire \ct_sram_comm_din0[1] ;
 wire \ct_sram_comm_din0[20] ;
 wire \ct_sram_comm_din0[21] ;
 wire \ct_sram_comm_din0[22] ;
 wire \ct_sram_comm_din0[23] ;
 wire \ct_sram_comm_din0[24] ;
 wire \ct_sram_comm_din0[25] ;
 wire \ct_sram_comm_din0[26] ;
 wire \ct_sram_comm_din0[27] ;
 wire \ct_sram_comm_din0[28] ;
 wire \ct_sram_comm_din0[29] ;
 wire \ct_sram_comm_din0[2] ;
 wire \ct_sram_comm_din0[30] ;
 wire \ct_sram_comm_din0[31] ;
 wire \ct_sram_comm_din0[3] ;
 wire \ct_sram_comm_din0[4] ;
 wire \ct_sram_comm_din0[5] ;
 wire \ct_sram_comm_din0[6] ;
 wire \ct_sram_comm_din0[7] ;
 wire \ct_sram_comm_din0[8] ;
 wire \ct_sram_comm_din0[9] ;
 wire \main_mem_addr[0] ;
 wire \main_mem_addr[1] ;
 wire \main_mem_addr[2] ;
 wire \main_mem_addr[3] ;
 wire \main_mem_addr[4] ;
 wire \main_mem_addr[5] ;
 wire \main_mem_in[0] ;
 wire \main_mem_in[10] ;
 wire \main_mem_in[11] ;
 wire \main_mem_in[12] ;
 wire \main_mem_in[13] ;
 wire \main_mem_in[14] ;
 wire \main_mem_in[15] ;
 wire \main_mem_in[16] ;
 wire \main_mem_in[17] ;
 wire \main_mem_in[18] ;
 wire \main_mem_in[19] ;
 wire \main_mem_in[1] ;
 wire \main_mem_in[20] ;
 wire \main_mem_in[21] ;
 wire \main_mem_in[22] ;
 wire \main_mem_in[23] ;
 wire \main_mem_in[24] ;
 wire \main_mem_in[25] ;
 wire \main_mem_in[26] ;
 wire \main_mem_in[27] ;
 wire \main_mem_in[28] ;
 wire \main_mem_in[29] ;
 wire \main_mem_in[2] ;
 wire \main_mem_in[30] ;
 wire \main_mem_in[31] ;
 wire \main_mem_in[3] ;
 wire \main_mem_in[4] ;
 wire \main_mem_in[5] ;
 wire \main_mem_in[6] ;
 wire \main_mem_in[7] ;
 wire \main_mem_in[8] ;
 wire \main_mem_in[9] ;
 wire \main_mem_out[0] ;
 wire \main_mem_out[10] ;
 wire \main_mem_out[11] ;
 wire \main_mem_out[12] ;
 wire \main_mem_out[13] ;
 wire \main_mem_out[14] ;
 wire \main_mem_out[15] ;
 wire \main_mem_out[16] ;
 wire \main_mem_out[17] ;
 wire \main_mem_out[18] ;
 wire \main_mem_out[19] ;
 wire \main_mem_out[1] ;
 wire \main_mem_out[20] ;
 wire \main_mem_out[21] ;
 wire \main_mem_out[22] ;
 wire \main_mem_out[23] ;
 wire \main_mem_out[24] ;
 wire \main_mem_out[25] ;
 wire \main_mem_out[26] ;
 wire \main_mem_out[27] ;
 wire \main_mem_out[28] ;
 wire \main_mem_out[29] ;
 wire \main_mem_out[2] ;
 wire \main_mem_out[30] ;
 wire \main_mem_out[31] ;
 wire \main_mem_out[3] ;
 wire \main_mem_out[4] ;
 wire \main_mem_out[5] ;
 wire \main_mem_out[6] ;
 wire \main_mem_out[7] ;
 wire \main_mem_out[8] ;
 wire \main_mem_out[9] ;
 wire main_mem_we;
 wire \r_data[0] ;
 wire \r_data[1] ;
 wire \r_data[2] ;
 wire \r_data[3] ;
 wire \r_data[4] ;
 wire \r_data[5] ;
 wire \r_data[6] ;
 wire \r_data[7] ;
 wire rd_uart;
 wire rst_asserted;
 wire rx_empty;
 wire rx_fifo_flush_enable;
 wire \sram_const_addr1[0] ;
 wire \sram_const_addr1[1] ;
 wire \sram_const_addr1[2] ;
 wire \sram_const_addr1[3] ;
 wire \sram_const_addr1[4] ;
 wire \sram_const_addr1[5] ;
 wire \sram_const_addr1[6] ;
 wire \sram_const_addr1[7] ;
 wire \sram_const_addr1[8] ;
 wire sram_const_csb1;
 wire \sram_const_wmask0[0] ;
 wire \sram_const_wmask0[1] ;
 wire \sram_const_wmask0[2] ;
 wire \sram_const_wmask0[3] ;
 wire tx_full;
 wire \w_data[0] ;
 wire \w_data[1] ;
 wire \w_data[2] ;
 wire \w_data[3] ;
 wire \w_data[4] ;
 wire \w_data[5] ;
 wire \w_data[6] ;
 wire \w_data[7] ;
 wire wr_uart;

 sky130_sram_2kbyte_1rw1r_32x512_8 agent_1_sram2k_inst0 (.csb0(agent_1_sram0_csb0),
    .csb1(sram_const_csb1),
    .web0(agent_1_sram0_web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\agent_1_sram_comm_addr0[8] ,
    \agent_1_sram_comm_addr0[7] ,
    \agent_1_sram_comm_addr0[6] ,
    \agent_1_sram_comm_addr0[5] ,
    \agent_1_sram_comm_addr0[4] ,
    \agent_1_sram_comm_addr0[3] ,
    \agent_1_sram_comm_addr0[2] ,
    \agent_1_sram_comm_addr0[1] ,
    \agent_1_sram_comm_addr0[0] }),
    .addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .din0({\agent_1_sram_comm_din0[31] ,
    \agent_1_sram_comm_din0[30] ,
    \agent_1_sram_comm_din0[29] ,
    \agent_1_sram_comm_din0[28] ,
    \agent_1_sram_comm_din0[27] ,
    \agent_1_sram_comm_din0[26] ,
    \agent_1_sram_comm_din0[25] ,
    \agent_1_sram_comm_din0[24] ,
    \agent_1_sram_comm_din0[23] ,
    \agent_1_sram_comm_din0[22] ,
    \agent_1_sram_comm_din0[21] ,
    \agent_1_sram_comm_din0[20] ,
    \agent_1_sram_comm_din0[19] ,
    \agent_1_sram_comm_din0[18] ,
    \agent_1_sram_comm_din0[17] ,
    \agent_1_sram_comm_din0[16] ,
    \agent_1_sram_comm_din0[15] ,
    \agent_1_sram_comm_din0[14] ,
    \agent_1_sram_comm_din0[13] ,
    \agent_1_sram_comm_din0[12] ,
    \agent_1_sram_comm_din0[11] ,
    \agent_1_sram_comm_din0[10] ,
    \agent_1_sram_comm_din0[9] ,
    \agent_1_sram_comm_din0[8] ,
    \agent_1_sram_comm_din0[7] ,
    \agent_1_sram_comm_din0[6] ,
    \agent_1_sram_comm_din0[5] ,
    \agent_1_sram_comm_din0[4] ,
    \agent_1_sram_comm_din0[3] ,
    \agent_1_sram_comm_din0[2] ,
    \agent_1_sram_comm_din0[1] ,
    \agent_1_sram_comm_din0[0] }),
    .dout0({\agent_1_sram0_dout0[31] ,
    \agent_1_sram0_dout0[30] ,
    \agent_1_sram0_dout0[29] ,
    \agent_1_sram0_dout0[28] ,
    \agent_1_sram0_dout0[27] ,
    \agent_1_sram0_dout0[26] ,
    \agent_1_sram0_dout0[25] ,
    \agent_1_sram0_dout0[24] ,
    \agent_1_sram0_dout0[23] ,
    \agent_1_sram0_dout0[22] ,
    \agent_1_sram0_dout0[21] ,
    \agent_1_sram0_dout0[20] ,
    \agent_1_sram0_dout0[19] ,
    \agent_1_sram0_dout0[18] ,
    \agent_1_sram0_dout0[17] ,
    \agent_1_sram0_dout0[16] ,
    \agent_1_sram0_dout0[15] ,
    \agent_1_sram0_dout0[14] ,
    \agent_1_sram0_dout0[13] ,
    \agent_1_sram0_dout0[12] ,
    \agent_1_sram0_dout0[11] ,
    \agent_1_sram0_dout0[10] ,
    \agent_1_sram0_dout0[9] ,
    \agent_1_sram0_dout0[8] ,
    \agent_1_sram0_dout0[7] ,
    \agent_1_sram0_dout0[6] ,
    \agent_1_sram0_dout0[5] ,
    \agent_1_sram0_dout0[4] ,
    \agent_1_sram0_dout0[3] ,
    \agent_1_sram0_dout0[2] ,
    \agent_1_sram0_dout0[1] ,
    \agent_1_sram0_dout0[0] }),
    .dout1({_NC1,
    _NC2,
    _NC3,
    _NC4,
    _NC5,
    _NC6,
    _NC7,
    _NC8,
    _NC9,
    _NC10,
    _NC11,
    _NC12,
    _NC13,
    _NC14,
    _NC15,
    _NC16,
    _NC17,
    _NC18,
    _NC19,
    _NC20,
    _NC21,
    _NC22,
    _NC23,
    _NC24,
    _NC25,
    _NC26,
    _NC27,
    _NC28,
    _NC29,
    _NC30,
    _NC31,
    _NC32}),
    .wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 agent_1_sram2k_inst1 (.csb0(agent_1_sram1_csb0),
    .csb1(sram_const_csb1),
    .web0(agent_1_sram1_web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\agent_1_sram_comm_addr0[8] ,
    \agent_1_sram_comm_addr0[7] ,
    \agent_1_sram_comm_addr0[6] ,
    \agent_1_sram_comm_addr0[5] ,
    \agent_1_sram_comm_addr0[4] ,
    \agent_1_sram_comm_addr0[3] ,
    \agent_1_sram_comm_addr0[2] ,
    \agent_1_sram_comm_addr0[1] ,
    \agent_1_sram_comm_addr0[0] }),
    .addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .din0({\agent_1_sram_comm_din0[31] ,
    \agent_1_sram_comm_din0[30] ,
    \agent_1_sram_comm_din0[29] ,
    \agent_1_sram_comm_din0[28] ,
    \agent_1_sram_comm_din0[27] ,
    \agent_1_sram_comm_din0[26] ,
    \agent_1_sram_comm_din0[25] ,
    \agent_1_sram_comm_din0[24] ,
    \agent_1_sram_comm_din0[23] ,
    \agent_1_sram_comm_din0[22] ,
    \agent_1_sram_comm_din0[21] ,
    \agent_1_sram_comm_din0[20] ,
    \agent_1_sram_comm_din0[19] ,
    \agent_1_sram_comm_din0[18] ,
    \agent_1_sram_comm_din0[17] ,
    \agent_1_sram_comm_din0[16] ,
    \agent_1_sram_comm_din0[15] ,
    \agent_1_sram_comm_din0[14] ,
    \agent_1_sram_comm_din0[13] ,
    \agent_1_sram_comm_din0[12] ,
    \agent_1_sram_comm_din0[11] ,
    \agent_1_sram_comm_din0[10] ,
    \agent_1_sram_comm_din0[9] ,
    \agent_1_sram_comm_din0[8] ,
    \agent_1_sram_comm_din0[7] ,
    \agent_1_sram_comm_din0[6] ,
    \agent_1_sram_comm_din0[5] ,
    \agent_1_sram_comm_din0[4] ,
    \agent_1_sram_comm_din0[3] ,
    \agent_1_sram_comm_din0[2] ,
    \agent_1_sram_comm_din0[1] ,
    \agent_1_sram_comm_din0[0] }),
    .dout0({\agent_1_sram1_dout0[31] ,
    \agent_1_sram1_dout0[30] ,
    \agent_1_sram1_dout0[29] ,
    \agent_1_sram1_dout0[28] ,
    \agent_1_sram1_dout0[27] ,
    \agent_1_sram1_dout0[26] ,
    \agent_1_sram1_dout0[25] ,
    \agent_1_sram1_dout0[24] ,
    \agent_1_sram1_dout0[23] ,
    \agent_1_sram1_dout0[22] ,
    \agent_1_sram1_dout0[21] ,
    \agent_1_sram1_dout0[20] ,
    \agent_1_sram1_dout0[19] ,
    \agent_1_sram1_dout0[18] ,
    \agent_1_sram1_dout0[17] ,
    \agent_1_sram1_dout0[16] ,
    \agent_1_sram1_dout0[15] ,
    \agent_1_sram1_dout0[14] ,
    \agent_1_sram1_dout0[13] ,
    \agent_1_sram1_dout0[12] ,
    \agent_1_sram1_dout0[11] ,
    \agent_1_sram1_dout0[10] ,
    \agent_1_sram1_dout0[9] ,
    \agent_1_sram1_dout0[8] ,
    \agent_1_sram1_dout0[7] ,
    \agent_1_sram1_dout0[6] ,
    \agent_1_sram1_dout0[5] ,
    \agent_1_sram1_dout0[4] ,
    \agent_1_sram1_dout0[3] ,
    \agent_1_sram1_dout0[2] ,
    \agent_1_sram1_dout0[1] ,
    \agent_1_sram1_dout0[0] }),
    .dout1({_NC33,
    _NC34,
    _NC35,
    _NC36,
    _NC37,
    _NC38,
    _NC39,
    _NC40,
    _NC41,
    _NC42,
    _NC43,
    _NC44,
    _NC45,
    _NC46,
    _NC47,
    _NC48,
    _NC49,
    _NC50,
    _NC51,
    _NC52,
    _NC53,
    _NC54,
    _NC55,
    _NC56,
    _NC57,
    _NC58,
    _NC59,
    _NC60,
    _NC61,
    _NC62,
    _NC63,
    _NC64}),
    .wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 agent_1_sram2k_inst2 (.csb0(agent_1_sram2_csb0),
    .csb1(sram_const_csb1),
    .web0(agent_1_sram2_web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\agent_1_sram_comm_addr0[8] ,
    \agent_1_sram_comm_addr0[7] ,
    \agent_1_sram_comm_addr0[6] ,
    \agent_1_sram_comm_addr0[5] ,
    \agent_1_sram_comm_addr0[4] ,
    \agent_1_sram_comm_addr0[3] ,
    \agent_1_sram_comm_addr0[2] ,
    \agent_1_sram_comm_addr0[1] ,
    \agent_1_sram_comm_addr0[0] }),
    .addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .din0({\agent_1_sram_comm_din0[31] ,
    \agent_1_sram_comm_din0[30] ,
    \agent_1_sram_comm_din0[29] ,
    \agent_1_sram_comm_din0[28] ,
    \agent_1_sram_comm_din0[27] ,
    \agent_1_sram_comm_din0[26] ,
    \agent_1_sram_comm_din0[25] ,
    \agent_1_sram_comm_din0[24] ,
    \agent_1_sram_comm_din0[23] ,
    \agent_1_sram_comm_din0[22] ,
    \agent_1_sram_comm_din0[21] ,
    \agent_1_sram_comm_din0[20] ,
    \agent_1_sram_comm_din0[19] ,
    \agent_1_sram_comm_din0[18] ,
    \agent_1_sram_comm_din0[17] ,
    \agent_1_sram_comm_din0[16] ,
    \agent_1_sram_comm_din0[15] ,
    \agent_1_sram_comm_din0[14] ,
    \agent_1_sram_comm_din0[13] ,
    \agent_1_sram_comm_din0[12] ,
    \agent_1_sram_comm_din0[11] ,
    \agent_1_sram_comm_din0[10] ,
    \agent_1_sram_comm_din0[9] ,
    \agent_1_sram_comm_din0[8] ,
    \agent_1_sram_comm_din0[7] ,
    \agent_1_sram_comm_din0[6] ,
    \agent_1_sram_comm_din0[5] ,
    \agent_1_sram_comm_din0[4] ,
    \agent_1_sram_comm_din0[3] ,
    \agent_1_sram_comm_din0[2] ,
    \agent_1_sram_comm_din0[1] ,
    \agent_1_sram_comm_din0[0] }),
    .dout0({\agent_1_sram2_dout0[31] ,
    \agent_1_sram2_dout0[30] ,
    \agent_1_sram2_dout0[29] ,
    \agent_1_sram2_dout0[28] ,
    \agent_1_sram2_dout0[27] ,
    \agent_1_sram2_dout0[26] ,
    \agent_1_sram2_dout0[25] ,
    \agent_1_sram2_dout0[24] ,
    \agent_1_sram2_dout0[23] ,
    \agent_1_sram2_dout0[22] ,
    \agent_1_sram2_dout0[21] ,
    \agent_1_sram2_dout0[20] ,
    \agent_1_sram2_dout0[19] ,
    \agent_1_sram2_dout0[18] ,
    \agent_1_sram2_dout0[17] ,
    \agent_1_sram2_dout0[16] ,
    \agent_1_sram2_dout0[15] ,
    \agent_1_sram2_dout0[14] ,
    \agent_1_sram2_dout0[13] ,
    \agent_1_sram2_dout0[12] ,
    \agent_1_sram2_dout0[11] ,
    \agent_1_sram2_dout0[10] ,
    \agent_1_sram2_dout0[9] ,
    \agent_1_sram2_dout0[8] ,
    \agent_1_sram2_dout0[7] ,
    \agent_1_sram2_dout0[6] ,
    \agent_1_sram2_dout0[5] ,
    \agent_1_sram2_dout0[4] ,
    \agent_1_sram2_dout0[3] ,
    \agent_1_sram2_dout0[2] ,
    \agent_1_sram2_dout0[1] ,
    \agent_1_sram2_dout0[0] }),
    .dout1({_NC65,
    _NC66,
    _NC67,
    _NC68,
    _NC69,
    _NC70,
    _NC71,
    _NC72,
    _NC73,
    _NC74,
    _NC75,
    _NC76,
    _NC77,
    _NC78,
    _NC79,
    _NC80,
    _NC81,
    _NC82,
    _NC83,
    _NC84,
    _NC85,
    _NC86,
    _NC87,
    _NC88,
    _NC89,
    _NC90,
    _NC91,
    _NC92,
    _NC93,
    _NC94,
    _NC95,
    _NC96}),
    .wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 codemaker_sram2k_inst0 (.csb0(cm_sram0_csb0),
    .csb1(sram_const_csb1),
    .web0(cm_sram0_web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\cm_sram_comm_addr0[8] ,
    \cm_sram_comm_addr0[7] ,
    \cm_sram_comm_addr0[6] ,
    \cm_sram_comm_addr0[5] ,
    \cm_sram_comm_addr0[4] ,
    \cm_sram_comm_addr0[3] ,
    \cm_sram_comm_addr0[2] ,
    \cm_sram_comm_addr0[1] ,
    \cm_sram_comm_addr0[0] }),
    .addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .din0({\cm_sram_comm_din0[31] ,
    \cm_sram_comm_din0[30] ,
    \cm_sram_comm_din0[29] ,
    \cm_sram_comm_din0[28] ,
    \cm_sram_comm_din0[27] ,
    \cm_sram_comm_din0[26] ,
    \cm_sram_comm_din0[25] ,
    \cm_sram_comm_din0[24] ,
    \cm_sram_comm_din0[23] ,
    \cm_sram_comm_din0[22] ,
    \cm_sram_comm_din0[21] ,
    \cm_sram_comm_din0[20] ,
    \cm_sram_comm_din0[19] ,
    \cm_sram_comm_din0[18] ,
    \cm_sram_comm_din0[17] ,
    \cm_sram_comm_din0[16] ,
    \cm_sram_comm_din0[15] ,
    \cm_sram_comm_din0[14] ,
    \cm_sram_comm_din0[13] ,
    \cm_sram_comm_din0[12] ,
    \cm_sram_comm_din0[11] ,
    \cm_sram_comm_din0[10] ,
    \cm_sram_comm_din0[9] ,
    \cm_sram_comm_din0[8] ,
    \cm_sram_comm_din0[7] ,
    \cm_sram_comm_din0[6] ,
    \cm_sram_comm_din0[5] ,
    \cm_sram_comm_din0[4] ,
    \cm_sram_comm_din0[3] ,
    \cm_sram_comm_din0[2] ,
    \cm_sram_comm_din0[1] ,
    \cm_sram_comm_din0[0] }),
    .dout0({\cm_sram0_dout0[31] ,
    \cm_sram0_dout0[30] ,
    \cm_sram0_dout0[29] ,
    \cm_sram0_dout0[28] ,
    \cm_sram0_dout0[27] ,
    \cm_sram0_dout0[26] ,
    \cm_sram0_dout0[25] ,
    \cm_sram0_dout0[24] ,
    \cm_sram0_dout0[23] ,
    \cm_sram0_dout0[22] ,
    \cm_sram0_dout0[21] ,
    \cm_sram0_dout0[20] ,
    \cm_sram0_dout0[19] ,
    \cm_sram0_dout0[18] ,
    \cm_sram0_dout0[17] ,
    \cm_sram0_dout0[16] ,
    \cm_sram0_dout0[15] ,
    \cm_sram0_dout0[14] ,
    \cm_sram0_dout0[13] ,
    \cm_sram0_dout0[12] ,
    \cm_sram0_dout0[11] ,
    \cm_sram0_dout0[10] ,
    \cm_sram0_dout0[9] ,
    \cm_sram0_dout0[8] ,
    \cm_sram0_dout0[7] ,
    \cm_sram0_dout0[6] ,
    \cm_sram0_dout0[5] ,
    \cm_sram0_dout0[4] ,
    \cm_sram0_dout0[3] ,
    \cm_sram0_dout0[2] ,
    \cm_sram0_dout0[1] ,
    \cm_sram0_dout0[0] }),
    .dout1({_NC97,
    _NC98,
    _NC99,
    _NC100,
    _NC101,
    _NC102,
    _NC103,
    _NC104,
    _NC105,
    _NC106,
    _NC107,
    _NC108,
    _NC109,
    _NC110,
    _NC111,
    _NC112,
    _NC113,
    _NC114,
    _NC115,
    _NC116,
    _NC117,
    _NC118,
    _NC119,
    _NC120,
    _NC121,
    _NC122,
    _NC123,
    _NC124,
    _NC125,
    _NC126,
    _NC127,
    _NC128}),
    .wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 codemaker_sram2k_inst1 (.csb0(cm_sram1_csb0),
    .csb1(sram_const_csb1),
    .web0(cm_sram1_web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\cm_sram_comm_addr0[8] ,
    \cm_sram_comm_addr0[7] ,
    \cm_sram_comm_addr0[6] ,
    \cm_sram_comm_addr0[5] ,
    \cm_sram_comm_addr0[4] ,
    \cm_sram_comm_addr0[3] ,
    \cm_sram_comm_addr0[2] ,
    \cm_sram_comm_addr0[1] ,
    \cm_sram_comm_addr0[0] }),
    .addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .din0({\cm_sram_comm_din0[31] ,
    \cm_sram_comm_din0[30] ,
    \cm_sram_comm_din0[29] ,
    \cm_sram_comm_din0[28] ,
    \cm_sram_comm_din0[27] ,
    \cm_sram_comm_din0[26] ,
    \cm_sram_comm_din0[25] ,
    \cm_sram_comm_din0[24] ,
    \cm_sram_comm_din0[23] ,
    \cm_sram_comm_din0[22] ,
    \cm_sram_comm_din0[21] ,
    \cm_sram_comm_din0[20] ,
    \cm_sram_comm_din0[19] ,
    \cm_sram_comm_din0[18] ,
    \cm_sram_comm_din0[17] ,
    \cm_sram_comm_din0[16] ,
    \cm_sram_comm_din0[15] ,
    \cm_sram_comm_din0[14] ,
    \cm_sram_comm_din0[13] ,
    \cm_sram_comm_din0[12] ,
    \cm_sram_comm_din0[11] ,
    \cm_sram_comm_din0[10] ,
    \cm_sram_comm_din0[9] ,
    \cm_sram_comm_din0[8] ,
    \cm_sram_comm_din0[7] ,
    \cm_sram_comm_din0[6] ,
    \cm_sram_comm_din0[5] ,
    \cm_sram_comm_din0[4] ,
    \cm_sram_comm_din0[3] ,
    \cm_sram_comm_din0[2] ,
    \cm_sram_comm_din0[1] ,
    \cm_sram_comm_din0[0] }),
    .dout0({\cm_sram1_dout0[31] ,
    \cm_sram1_dout0[30] ,
    \cm_sram1_dout0[29] ,
    \cm_sram1_dout0[28] ,
    \cm_sram1_dout0[27] ,
    \cm_sram1_dout0[26] ,
    \cm_sram1_dout0[25] ,
    \cm_sram1_dout0[24] ,
    \cm_sram1_dout0[23] ,
    \cm_sram1_dout0[22] ,
    \cm_sram1_dout0[21] ,
    \cm_sram1_dout0[20] ,
    \cm_sram1_dout0[19] ,
    \cm_sram1_dout0[18] ,
    \cm_sram1_dout0[17] ,
    \cm_sram1_dout0[16] ,
    \cm_sram1_dout0[15] ,
    \cm_sram1_dout0[14] ,
    \cm_sram1_dout0[13] ,
    \cm_sram1_dout0[12] ,
    \cm_sram1_dout0[11] ,
    \cm_sram1_dout0[10] ,
    \cm_sram1_dout0[9] ,
    \cm_sram1_dout0[8] ,
    \cm_sram1_dout0[7] ,
    \cm_sram1_dout0[6] ,
    \cm_sram1_dout0[5] ,
    \cm_sram1_dout0[4] ,
    \cm_sram1_dout0[3] ,
    \cm_sram1_dout0[2] ,
    \cm_sram1_dout0[1] ,
    \cm_sram1_dout0[0] }),
    .dout1({_NC129,
    _NC130,
    _NC131,
    _NC132,
    _NC133,
    _NC134,
    _NC135,
    _NC136,
    _NC137,
    _NC138,
    _NC139,
    _NC140,
    _NC141,
    _NC142,
    _NC143,
    _NC144,
    _NC145,
    _NC146,
    _NC147,
    _NC148,
    _NC149,
    _NC150,
    _NC151,
    _NC152,
    _NC153,
    _NC154,
    _NC155,
    _NC156,
    _NC157,
    _NC158,
    _NC159,
    _NC160}),
    .wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 codemaker_sram2k_inst2 (.csb0(cm_sram2_csb0),
    .csb1(sram_const_csb1),
    .web0(cm_sram2_web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\cm_sram_comm_addr0[8] ,
    \cm_sram_comm_addr0[7] ,
    \cm_sram_comm_addr0[6] ,
    \cm_sram_comm_addr0[5] ,
    \cm_sram_comm_addr0[4] ,
    \cm_sram_comm_addr0[3] ,
    \cm_sram_comm_addr0[2] ,
    \cm_sram_comm_addr0[1] ,
    \cm_sram_comm_addr0[0] }),
    .addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .din0({\cm_sram_comm_din0[31] ,
    \cm_sram_comm_din0[30] ,
    \cm_sram_comm_din0[29] ,
    \cm_sram_comm_din0[28] ,
    \cm_sram_comm_din0[27] ,
    \cm_sram_comm_din0[26] ,
    \cm_sram_comm_din0[25] ,
    \cm_sram_comm_din0[24] ,
    \cm_sram_comm_din0[23] ,
    \cm_sram_comm_din0[22] ,
    \cm_sram_comm_din0[21] ,
    \cm_sram_comm_din0[20] ,
    \cm_sram_comm_din0[19] ,
    \cm_sram_comm_din0[18] ,
    \cm_sram_comm_din0[17] ,
    \cm_sram_comm_din0[16] ,
    \cm_sram_comm_din0[15] ,
    \cm_sram_comm_din0[14] ,
    \cm_sram_comm_din0[13] ,
    \cm_sram_comm_din0[12] ,
    \cm_sram_comm_din0[11] ,
    \cm_sram_comm_din0[10] ,
    \cm_sram_comm_din0[9] ,
    \cm_sram_comm_din0[8] ,
    \cm_sram_comm_din0[7] ,
    \cm_sram_comm_din0[6] ,
    \cm_sram_comm_din0[5] ,
    \cm_sram_comm_din0[4] ,
    \cm_sram_comm_din0[3] ,
    \cm_sram_comm_din0[2] ,
    \cm_sram_comm_din0[1] ,
    \cm_sram_comm_din0[0] }),
    .dout0({\cm_sram2_dout0[31] ,
    \cm_sram2_dout0[30] ,
    \cm_sram2_dout0[29] ,
    \cm_sram2_dout0[28] ,
    \cm_sram2_dout0[27] ,
    \cm_sram2_dout0[26] ,
    \cm_sram2_dout0[25] ,
    \cm_sram2_dout0[24] ,
    \cm_sram2_dout0[23] ,
    \cm_sram2_dout0[22] ,
    \cm_sram2_dout0[21] ,
    \cm_sram2_dout0[20] ,
    \cm_sram2_dout0[19] ,
    \cm_sram2_dout0[18] ,
    \cm_sram2_dout0[17] ,
    \cm_sram2_dout0[16] ,
    \cm_sram2_dout0[15] ,
    \cm_sram2_dout0[14] ,
    \cm_sram2_dout0[13] ,
    \cm_sram2_dout0[12] ,
    \cm_sram2_dout0[11] ,
    \cm_sram2_dout0[10] ,
    \cm_sram2_dout0[9] ,
    \cm_sram2_dout0[8] ,
    \cm_sram2_dout0[7] ,
    \cm_sram2_dout0[6] ,
    \cm_sram2_dout0[5] ,
    \cm_sram2_dout0[4] ,
    \cm_sram2_dout0[3] ,
    \cm_sram2_dout0[2] ,
    \cm_sram2_dout0[1] ,
    \cm_sram2_dout0[0] }),
    .dout1({_NC161,
    _NC162,
    _NC163,
    _NC164,
    _NC165,
    _NC166,
    _NC167,
    _NC168,
    _NC169,
    _NC170,
    _NC171,
    _NC172,
    _NC173,
    _NC174,
    _NC175,
    _NC176,
    _NC177,
    _NC178,
    _NC179,
    _NC180,
    _NC181,
    _NC182,
    _NC183,
    _NC184,
    _NC185,
    _NC186,
    _NC187,
    _NC188,
    _NC189,
    _NC190,
    _NC191,
    _NC192}),
    .wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 codemaker_sram2k_inst3 (.csb0(cm_sram3_csb0),
    .csb1(sram_const_csb1),
    .web0(cm_sram3_web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\cm_sram_comm_addr0[8] ,
    \cm_sram_comm_addr0[7] ,
    \cm_sram_comm_addr0[6] ,
    \cm_sram_comm_addr0[5] ,
    \cm_sram_comm_addr0[4] ,
    \cm_sram_comm_addr0[3] ,
    \cm_sram_comm_addr0[2] ,
    \cm_sram_comm_addr0[1] ,
    \cm_sram_comm_addr0[0] }),
    .addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .din0({\cm_sram_comm_din0[31] ,
    \cm_sram_comm_din0[30] ,
    \cm_sram_comm_din0[29] ,
    \cm_sram_comm_din0[28] ,
    \cm_sram_comm_din0[27] ,
    \cm_sram_comm_din0[26] ,
    \cm_sram_comm_din0[25] ,
    \cm_sram_comm_din0[24] ,
    \cm_sram_comm_din0[23] ,
    \cm_sram_comm_din0[22] ,
    \cm_sram_comm_din0[21] ,
    \cm_sram_comm_din0[20] ,
    \cm_sram_comm_din0[19] ,
    \cm_sram_comm_din0[18] ,
    \cm_sram_comm_din0[17] ,
    \cm_sram_comm_din0[16] ,
    \cm_sram_comm_din0[15] ,
    \cm_sram_comm_din0[14] ,
    \cm_sram_comm_din0[13] ,
    \cm_sram_comm_din0[12] ,
    \cm_sram_comm_din0[11] ,
    \cm_sram_comm_din0[10] ,
    \cm_sram_comm_din0[9] ,
    \cm_sram_comm_din0[8] ,
    \cm_sram_comm_din0[7] ,
    \cm_sram_comm_din0[6] ,
    \cm_sram_comm_din0[5] ,
    \cm_sram_comm_din0[4] ,
    \cm_sram_comm_din0[3] ,
    \cm_sram_comm_din0[2] ,
    \cm_sram_comm_din0[1] ,
    \cm_sram_comm_din0[0] }),
    .dout0({\cm_sram3_dout0[31] ,
    \cm_sram3_dout0[30] ,
    \cm_sram3_dout0[29] ,
    \cm_sram3_dout0[28] ,
    \cm_sram3_dout0[27] ,
    \cm_sram3_dout0[26] ,
    \cm_sram3_dout0[25] ,
    \cm_sram3_dout0[24] ,
    \cm_sram3_dout0[23] ,
    \cm_sram3_dout0[22] ,
    \cm_sram3_dout0[21] ,
    \cm_sram3_dout0[20] ,
    \cm_sram3_dout0[19] ,
    \cm_sram3_dout0[18] ,
    \cm_sram3_dout0[17] ,
    \cm_sram3_dout0[16] ,
    \cm_sram3_dout0[15] ,
    \cm_sram3_dout0[14] ,
    \cm_sram3_dout0[13] ,
    \cm_sram3_dout0[12] ,
    \cm_sram3_dout0[11] ,
    \cm_sram3_dout0[10] ,
    \cm_sram3_dout0[9] ,
    \cm_sram3_dout0[8] ,
    \cm_sram3_dout0[7] ,
    \cm_sram3_dout0[6] ,
    \cm_sram3_dout0[5] ,
    \cm_sram3_dout0[4] ,
    \cm_sram3_dout0[3] ,
    \cm_sram3_dout0[2] ,
    \cm_sram3_dout0[1] ,
    \cm_sram3_dout0[0] }),
    .dout1({_NC193,
    _NC194,
    _NC195,
    _NC196,
    _NC197,
    _NC198,
    _NC199,
    _NC200,
    _NC201,
    _NC202,
    _NC203,
    _NC204,
    _NC205,
    _NC206,
    _NC207,
    _NC208,
    _NC209,
    _NC210,
    _NC211,
    _NC212,
    _NC213,
    _NC214,
    _NC215,
    _NC216,
    _NC217,
    _NC218,
    _NC219,
    _NC220,
    _NC221,
    _NC222,
    _NC223,
    _NC224}),
    .wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 control_tower_sram2k_inst0 (.csb0(ct_sram0_csb0),
    .csb1(sram_const_csb1),
    .web0(ct_sram0_web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\ct_sram_comm_addr0[8] ,
    \ct_sram_comm_addr0[7] ,
    \ct_sram_comm_addr0[6] ,
    \ct_sram_comm_addr0[5] ,
    \ct_sram_comm_addr0[4] ,
    \ct_sram_comm_addr0[3] ,
    \ct_sram_comm_addr0[2] ,
    \ct_sram_comm_addr0[1] ,
    \ct_sram_comm_addr0[0] }),
    .addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .din0({\ct_sram_comm_din0[31] ,
    \ct_sram_comm_din0[30] ,
    \ct_sram_comm_din0[29] ,
    \ct_sram_comm_din0[28] ,
    \ct_sram_comm_din0[27] ,
    \ct_sram_comm_din0[26] ,
    \ct_sram_comm_din0[25] ,
    \ct_sram_comm_din0[24] ,
    \ct_sram_comm_din0[23] ,
    \ct_sram_comm_din0[22] ,
    \ct_sram_comm_din0[21] ,
    \ct_sram_comm_din0[20] ,
    \ct_sram_comm_din0[19] ,
    \ct_sram_comm_din0[18] ,
    \ct_sram_comm_din0[17] ,
    \ct_sram_comm_din0[16] ,
    \ct_sram_comm_din0[15] ,
    \ct_sram_comm_din0[14] ,
    \ct_sram_comm_din0[13] ,
    \ct_sram_comm_din0[12] ,
    \ct_sram_comm_din0[11] ,
    \ct_sram_comm_din0[10] ,
    \ct_sram_comm_din0[9] ,
    \ct_sram_comm_din0[8] ,
    \ct_sram_comm_din0[7] ,
    \ct_sram_comm_din0[6] ,
    \ct_sram_comm_din0[5] ,
    \ct_sram_comm_din0[4] ,
    \ct_sram_comm_din0[3] ,
    \ct_sram_comm_din0[2] ,
    \ct_sram_comm_din0[1] ,
    \ct_sram_comm_din0[0] }),
    .dout0({\ct_sram0_dout0[31] ,
    \ct_sram0_dout0[30] ,
    \ct_sram0_dout0[29] ,
    \ct_sram0_dout0[28] ,
    \ct_sram0_dout0[27] ,
    \ct_sram0_dout0[26] ,
    \ct_sram0_dout0[25] ,
    \ct_sram0_dout0[24] ,
    \ct_sram0_dout0[23] ,
    \ct_sram0_dout0[22] ,
    \ct_sram0_dout0[21] ,
    \ct_sram0_dout0[20] ,
    \ct_sram0_dout0[19] ,
    \ct_sram0_dout0[18] ,
    \ct_sram0_dout0[17] ,
    \ct_sram0_dout0[16] ,
    \ct_sram0_dout0[15] ,
    \ct_sram0_dout0[14] ,
    \ct_sram0_dout0[13] ,
    \ct_sram0_dout0[12] ,
    \ct_sram0_dout0[11] ,
    \ct_sram0_dout0[10] ,
    \ct_sram0_dout0[9] ,
    \ct_sram0_dout0[8] ,
    \ct_sram0_dout0[7] ,
    \ct_sram0_dout0[6] ,
    \ct_sram0_dout0[5] ,
    \ct_sram0_dout0[4] ,
    \ct_sram0_dout0[3] ,
    \ct_sram0_dout0[2] ,
    \ct_sram0_dout0[1] ,
    \ct_sram0_dout0[0] }),
    .dout1({_NC225,
    _NC226,
    _NC227,
    _NC228,
    _NC229,
    _NC230,
    _NC231,
    _NC232,
    _NC233,
    _NC234,
    _NC235,
    _NC236,
    _NC237,
    _NC238,
    _NC239,
    _NC240,
    _NC241,
    _NC242,
    _NC243,
    _NC244,
    _NC245,
    _NC246,
    _NC247,
    _NC248,
    _NC249,
    _NC250,
    _NC251,
    _NC252,
    _NC253,
    _NC254,
    _NC255,
    _NC256}),
    .wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 control_tower_sram2k_inst1 (.csb0(ct_sram1_csb0),
    .csb1(sram_const_csb1),
    .web0(ct_sram1_web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\ct_sram_comm_addr0[8] ,
    \ct_sram_comm_addr0[7] ,
    \ct_sram_comm_addr0[6] ,
    \ct_sram_comm_addr0[5] ,
    \ct_sram_comm_addr0[4] ,
    \ct_sram_comm_addr0[3] ,
    \ct_sram_comm_addr0[2] ,
    \ct_sram_comm_addr0[1] ,
    \ct_sram_comm_addr0[0] }),
    .addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .din0({\ct_sram_comm_din0[31] ,
    \ct_sram_comm_din0[30] ,
    \ct_sram_comm_din0[29] ,
    \ct_sram_comm_din0[28] ,
    \ct_sram_comm_din0[27] ,
    \ct_sram_comm_din0[26] ,
    \ct_sram_comm_din0[25] ,
    \ct_sram_comm_din0[24] ,
    \ct_sram_comm_din0[23] ,
    \ct_sram_comm_din0[22] ,
    \ct_sram_comm_din0[21] ,
    \ct_sram_comm_din0[20] ,
    \ct_sram_comm_din0[19] ,
    \ct_sram_comm_din0[18] ,
    \ct_sram_comm_din0[17] ,
    \ct_sram_comm_din0[16] ,
    \ct_sram_comm_din0[15] ,
    \ct_sram_comm_din0[14] ,
    \ct_sram_comm_din0[13] ,
    \ct_sram_comm_din0[12] ,
    \ct_sram_comm_din0[11] ,
    \ct_sram_comm_din0[10] ,
    \ct_sram_comm_din0[9] ,
    \ct_sram_comm_din0[8] ,
    \ct_sram_comm_din0[7] ,
    \ct_sram_comm_din0[6] ,
    \ct_sram_comm_din0[5] ,
    \ct_sram_comm_din0[4] ,
    \ct_sram_comm_din0[3] ,
    \ct_sram_comm_din0[2] ,
    \ct_sram_comm_din0[1] ,
    \ct_sram_comm_din0[0] }),
    .dout0({\ct_sram1_dout0[31] ,
    \ct_sram1_dout0[30] ,
    \ct_sram1_dout0[29] ,
    \ct_sram1_dout0[28] ,
    \ct_sram1_dout0[27] ,
    \ct_sram1_dout0[26] ,
    \ct_sram1_dout0[25] ,
    \ct_sram1_dout0[24] ,
    \ct_sram1_dout0[23] ,
    \ct_sram1_dout0[22] ,
    \ct_sram1_dout0[21] ,
    \ct_sram1_dout0[20] ,
    \ct_sram1_dout0[19] ,
    \ct_sram1_dout0[18] ,
    \ct_sram1_dout0[17] ,
    \ct_sram1_dout0[16] ,
    \ct_sram1_dout0[15] ,
    \ct_sram1_dout0[14] ,
    \ct_sram1_dout0[13] ,
    \ct_sram1_dout0[12] ,
    \ct_sram1_dout0[11] ,
    \ct_sram1_dout0[10] ,
    \ct_sram1_dout0[9] ,
    \ct_sram1_dout0[8] ,
    \ct_sram1_dout0[7] ,
    \ct_sram1_dout0[6] ,
    \ct_sram1_dout0[5] ,
    \ct_sram1_dout0[4] ,
    \ct_sram1_dout0[3] ,
    \ct_sram1_dout0[2] ,
    \ct_sram1_dout0[1] ,
    \ct_sram1_dout0[0] }),
    .dout1({_NC257,
    _NC258,
    _NC259,
    _NC260,
    _NC261,
    _NC262,
    _NC263,
    _NC264,
    _NC265,
    _NC266,
    _NC267,
    _NC268,
    _NC269,
    _NC270,
    _NC271,
    _NC272,
    _NC273,
    _NC274,
    _NC275,
    _NC276,
    _NC277,
    _NC278,
    _NC279,
    _NC280,
    _NC281,
    _NC282,
    _NC283,
    _NC284,
    _NC285,
    _NC286,
    _NC287,
    _NC288}),
    .wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 control_tower_sram2k_inst2 (.csb0(ct_sram2_csb0),
    .csb1(sram_const_csb1),
    .web0(ct_sram2_web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\ct_sram_comm_addr0[8] ,
    \ct_sram_comm_addr0[7] ,
    \ct_sram_comm_addr0[6] ,
    \ct_sram_comm_addr0[5] ,
    \ct_sram_comm_addr0[4] ,
    \ct_sram_comm_addr0[3] ,
    \ct_sram_comm_addr0[2] ,
    \ct_sram_comm_addr0[1] ,
    \ct_sram_comm_addr0[0] }),
    .addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .din0({\ct_sram_comm_din0[31] ,
    \ct_sram_comm_din0[30] ,
    \ct_sram_comm_din0[29] ,
    \ct_sram_comm_din0[28] ,
    \ct_sram_comm_din0[27] ,
    \ct_sram_comm_din0[26] ,
    \ct_sram_comm_din0[25] ,
    \ct_sram_comm_din0[24] ,
    \ct_sram_comm_din0[23] ,
    \ct_sram_comm_din0[22] ,
    \ct_sram_comm_din0[21] ,
    \ct_sram_comm_din0[20] ,
    \ct_sram_comm_din0[19] ,
    \ct_sram_comm_din0[18] ,
    \ct_sram_comm_din0[17] ,
    \ct_sram_comm_din0[16] ,
    \ct_sram_comm_din0[15] ,
    \ct_sram_comm_din0[14] ,
    \ct_sram_comm_din0[13] ,
    \ct_sram_comm_din0[12] ,
    \ct_sram_comm_din0[11] ,
    \ct_sram_comm_din0[10] ,
    \ct_sram_comm_din0[9] ,
    \ct_sram_comm_din0[8] ,
    \ct_sram_comm_din0[7] ,
    \ct_sram_comm_din0[6] ,
    \ct_sram_comm_din0[5] ,
    \ct_sram_comm_din0[4] ,
    \ct_sram_comm_din0[3] ,
    \ct_sram_comm_din0[2] ,
    \ct_sram_comm_din0[1] ,
    \ct_sram_comm_din0[0] }),
    .dout0({\ct_sram2_dout0[31] ,
    \ct_sram2_dout0[30] ,
    \ct_sram2_dout0[29] ,
    \ct_sram2_dout0[28] ,
    \ct_sram2_dout0[27] ,
    \ct_sram2_dout0[26] ,
    \ct_sram2_dout0[25] ,
    \ct_sram2_dout0[24] ,
    \ct_sram2_dout0[23] ,
    \ct_sram2_dout0[22] ,
    \ct_sram2_dout0[21] ,
    \ct_sram2_dout0[20] ,
    \ct_sram2_dout0[19] ,
    \ct_sram2_dout0[18] ,
    \ct_sram2_dout0[17] ,
    \ct_sram2_dout0[16] ,
    \ct_sram2_dout0[15] ,
    \ct_sram2_dout0[14] ,
    \ct_sram2_dout0[13] ,
    \ct_sram2_dout0[12] ,
    \ct_sram2_dout0[11] ,
    \ct_sram2_dout0[10] ,
    \ct_sram2_dout0[9] ,
    \ct_sram2_dout0[8] ,
    \ct_sram2_dout0[7] ,
    \ct_sram2_dout0[6] ,
    \ct_sram2_dout0[5] ,
    \ct_sram2_dout0[4] ,
    \ct_sram2_dout0[3] ,
    \ct_sram2_dout0[2] ,
    \ct_sram2_dout0[1] ,
    \ct_sram2_dout0[0] }),
    .dout1({_NC289,
    _NC290,
    _NC291,
    _NC292,
    _NC293,
    _NC294,
    _NC295,
    _NC296,
    _NC297,
    _NC298,
    _NC299,
    _NC300,
    _NC301,
    _NC302,
    _NC303,
    _NC304,
    _NC305,
    _NC306,
    _NC307,
    _NC308,
    _NC309,
    _NC310,
    _NC311,
    _NC312,
    _NC313,
    _NC314,
    _NC315,
    _NC316,
    _NC317,
    _NC318,
    _NC319,
    _NC320}),
    .wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 control_tower_sram2k_inst3 (.csb0(ct_sram3_csb0),
    .csb1(sram_const_csb1),
    .web0(ct_sram3_web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\ct_sram_comm_addr0[8] ,
    \ct_sram_comm_addr0[7] ,
    \ct_sram_comm_addr0[6] ,
    \ct_sram_comm_addr0[5] ,
    \ct_sram_comm_addr0[4] ,
    \ct_sram_comm_addr0[3] ,
    \ct_sram_comm_addr0[2] ,
    \ct_sram_comm_addr0[1] ,
    \ct_sram_comm_addr0[0] }),
    .addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .din0({\ct_sram_comm_din0[31] ,
    \ct_sram_comm_din0[30] ,
    \ct_sram_comm_din0[29] ,
    \ct_sram_comm_din0[28] ,
    \ct_sram_comm_din0[27] ,
    \ct_sram_comm_din0[26] ,
    \ct_sram_comm_din0[25] ,
    \ct_sram_comm_din0[24] ,
    \ct_sram_comm_din0[23] ,
    \ct_sram_comm_din0[22] ,
    \ct_sram_comm_din0[21] ,
    \ct_sram_comm_din0[20] ,
    \ct_sram_comm_din0[19] ,
    \ct_sram_comm_din0[18] ,
    \ct_sram_comm_din0[17] ,
    \ct_sram_comm_din0[16] ,
    \ct_sram_comm_din0[15] ,
    \ct_sram_comm_din0[14] ,
    \ct_sram_comm_din0[13] ,
    \ct_sram_comm_din0[12] ,
    \ct_sram_comm_din0[11] ,
    \ct_sram_comm_din0[10] ,
    \ct_sram_comm_din0[9] ,
    \ct_sram_comm_din0[8] ,
    \ct_sram_comm_din0[7] ,
    \ct_sram_comm_din0[6] ,
    \ct_sram_comm_din0[5] ,
    \ct_sram_comm_din0[4] ,
    \ct_sram_comm_din0[3] ,
    \ct_sram_comm_din0[2] ,
    \ct_sram_comm_din0[1] ,
    \ct_sram_comm_din0[0] }),
    .dout0({\ct_sram3_dout0[31] ,
    \ct_sram3_dout0[30] ,
    \ct_sram3_dout0[29] ,
    \ct_sram3_dout0[28] ,
    \ct_sram3_dout0[27] ,
    \ct_sram3_dout0[26] ,
    \ct_sram3_dout0[25] ,
    \ct_sram3_dout0[24] ,
    \ct_sram3_dout0[23] ,
    \ct_sram3_dout0[22] ,
    \ct_sram3_dout0[21] ,
    \ct_sram3_dout0[20] ,
    \ct_sram3_dout0[19] ,
    \ct_sram3_dout0[18] ,
    \ct_sram3_dout0[17] ,
    \ct_sram3_dout0[16] ,
    \ct_sram3_dout0[15] ,
    \ct_sram3_dout0[14] ,
    \ct_sram3_dout0[13] ,
    \ct_sram3_dout0[12] ,
    \ct_sram3_dout0[11] ,
    \ct_sram3_dout0[10] ,
    \ct_sram3_dout0[9] ,
    \ct_sram3_dout0[8] ,
    \ct_sram3_dout0[7] ,
    \ct_sram3_dout0[6] ,
    \ct_sram3_dout0[5] ,
    \ct_sram3_dout0[4] ,
    \ct_sram3_dout0[3] ,
    \ct_sram3_dout0[2] ,
    \ct_sram3_dout0[1] ,
    \ct_sram3_dout0[0] }),
    .dout1({_NC321,
    _NC322,
    _NC323,
    _NC324,
    _NC325,
    _NC326,
    _NC327,
    _NC328,
    _NC329,
    _NC330,
    _NC331,
    _NC332,
    _NC333,
    _NC334,
    _NC335,
    _NC336,
    _NC337,
    _NC338,
    _NC339,
    _NC340,
    _NC341,
    _NC342,
    _NC343,
    _NC344,
    _NC345,
    _NC346,
    _NC347,
    _NC348,
    _NC349,
    _NC350,
    _NC351,
    _NC352}),
    .wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }));
 sky130_sram_2kbyte_1rw1r_32x512_8 control_tower_sram2k_inst4 (.csb0(ct_sram4_csb0),
    .csb1(sram_const_csb1),
    .web0(ct_sram4_web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\ct_sram_comm_addr0[8] ,
    \ct_sram_comm_addr0[7] ,
    \ct_sram_comm_addr0[6] ,
    \ct_sram_comm_addr0[5] ,
    \ct_sram_comm_addr0[4] ,
    \ct_sram_comm_addr0[3] ,
    \ct_sram_comm_addr0[2] ,
    \ct_sram_comm_addr0[1] ,
    \ct_sram_comm_addr0[0] }),
    .addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .din0({\ct_sram_comm_din0[31] ,
    \ct_sram_comm_din0[30] ,
    \ct_sram_comm_din0[29] ,
    \ct_sram_comm_din0[28] ,
    \ct_sram_comm_din0[27] ,
    \ct_sram_comm_din0[26] ,
    \ct_sram_comm_din0[25] ,
    \ct_sram_comm_din0[24] ,
    \ct_sram_comm_din0[23] ,
    \ct_sram_comm_din0[22] ,
    \ct_sram_comm_din0[21] ,
    \ct_sram_comm_din0[20] ,
    \ct_sram_comm_din0[19] ,
    \ct_sram_comm_din0[18] ,
    \ct_sram_comm_din0[17] ,
    \ct_sram_comm_din0[16] ,
    \ct_sram_comm_din0[15] ,
    \ct_sram_comm_din0[14] ,
    \ct_sram_comm_din0[13] ,
    \ct_sram_comm_din0[12] ,
    \ct_sram_comm_din0[11] ,
    \ct_sram_comm_din0[10] ,
    \ct_sram_comm_din0[9] ,
    \ct_sram_comm_din0[8] ,
    \ct_sram_comm_din0[7] ,
    \ct_sram_comm_din0[6] ,
    \ct_sram_comm_din0[5] ,
    \ct_sram_comm_din0[4] ,
    \ct_sram_comm_din0[3] ,
    \ct_sram_comm_din0[2] ,
    \ct_sram_comm_din0[1] ,
    \ct_sram_comm_din0[0] }),
    .dout0({\ct_sram4_dout0[31] ,
    \ct_sram4_dout0[30] ,
    \ct_sram4_dout0[29] ,
    \ct_sram4_dout0[28] ,
    \ct_sram4_dout0[27] ,
    \ct_sram4_dout0[26] ,
    \ct_sram4_dout0[25] ,
    \ct_sram4_dout0[24] ,
    \ct_sram4_dout0[23] ,
    \ct_sram4_dout0[22] ,
    \ct_sram4_dout0[21] ,
    \ct_sram4_dout0[20] ,
    \ct_sram4_dout0[19] ,
    \ct_sram4_dout0[18] ,
    \ct_sram4_dout0[17] ,
    \ct_sram4_dout0[16] ,
    \ct_sram4_dout0[15] ,
    \ct_sram4_dout0[14] ,
    \ct_sram4_dout0[13] ,
    \ct_sram4_dout0[12] ,
    \ct_sram4_dout0[11] ,
    \ct_sram4_dout0[10] ,
    \ct_sram4_dout0[9] ,
    \ct_sram4_dout0[8] ,
    \ct_sram4_dout0[7] ,
    \ct_sram4_dout0[6] ,
    \ct_sram4_dout0[5] ,
    \ct_sram4_dout0[4] ,
    \ct_sram4_dout0[3] ,
    \ct_sram4_dout0[2] ,
    \ct_sram4_dout0[1] ,
    \ct_sram4_dout0[0] }),
    .dout1({_NC353,
    _NC354,
    _NC355,
    _NC356,
    _NC357,
    _NC358,
    _NC359,
    _NC360,
    _NC361,
    _NC362,
    _NC363,
    _NC364,
    _NC365,
    _NC366,
    _NC367,
    _NC368,
    _NC369,
    _NC370,
    _NC371,
    _NC372,
    _NC373,
    _NC374,
    _NC375,
    _NC376,
    _NC377,
    _NC378,
    _NC379,
    _NC380,
    _NC381,
    _NC382,
    _NC383,
    _NC384}),
    .wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }));
 VerySimpleCPU_core inst_agent_1 (.clk(wb_clk_i),
    .done(agent_1_done),
    .mem_ctrl_req(agent_1_mem_ctrl_req),
    .mem_ctrl_vld(agent_1_mem_ctrl_vld),
    .mem_ctrl_we(agent_1_mem_ctrl_we),
    .rst(rst_asserted),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .mem_ctrl_addr({\agent_1_mem_ctrl_addr[13] ,
    \agent_1_mem_ctrl_addr[12] ,
    \agent_1_mem_ctrl_addr[11] ,
    \agent_1_mem_ctrl_addr[10] ,
    \agent_1_mem_ctrl_addr[9] ,
    \agent_1_mem_ctrl_addr[8] ,
    \agent_1_mem_ctrl_addr[7] ,
    \agent_1_mem_ctrl_addr[6] ,
    \agent_1_mem_ctrl_addr[5] ,
    \agent_1_mem_ctrl_addr[4] ,
    \agent_1_mem_ctrl_addr[3] ,
    \agent_1_mem_ctrl_addr[2] ,
    \agent_1_mem_ctrl_addr[1] ,
    \agent_1_mem_ctrl_addr[0] }),
    .mem_ctrl_in({\agent_1_mem_ctrl_in[31] ,
    \agent_1_mem_ctrl_in[30] ,
    \agent_1_mem_ctrl_in[29] ,
    \agent_1_mem_ctrl_in[28] ,
    \agent_1_mem_ctrl_in[27] ,
    \agent_1_mem_ctrl_in[26] ,
    \agent_1_mem_ctrl_in[25] ,
    \agent_1_mem_ctrl_in[24] ,
    \agent_1_mem_ctrl_in[23] ,
    \agent_1_mem_ctrl_in[22] ,
    \agent_1_mem_ctrl_in[21] ,
    \agent_1_mem_ctrl_in[20] ,
    \agent_1_mem_ctrl_in[19] ,
    \agent_1_mem_ctrl_in[18] ,
    \agent_1_mem_ctrl_in[17] ,
    \agent_1_mem_ctrl_in[16] ,
    \agent_1_mem_ctrl_in[15] ,
    \agent_1_mem_ctrl_in[14] ,
    \agent_1_mem_ctrl_in[13] ,
    \agent_1_mem_ctrl_in[12] ,
    \agent_1_mem_ctrl_in[11] ,
    \agent_1_mem_ctrl_in[10] ,
    \agent_1_mem_ctrl_in[9] ,
    \agent_1_mem_ctrl_in[8] ,
    \agent_1_mem_ctrl_in[7] ,
    \agent_1_mem_ctrl_in[6] ,
    \agent_1_mem_ctrl_in[5] ,
    \agent_1_mem_ctrl_in[4] ,
    \agent_1_mem_ctrl_in[3] ,
    \agent_1_mem_ctrl_in[2] ,
    \agent_1_mem_ctrl_in[1] ,
    \agent_1_mem_ctrl_in[0] }),
    .mem_ctrl_out({\agent_1_mem_ctrl_out[31] ,
    \agent_1_mem_ctrl_out[30] ,
    \agent_1_mem_ctrl_out[29] ,
    \agent_1_mem_ctrl_out[28] ,
    \agent_1_mem_ctrl_out[27] ,
    \agent_1_mem_ctrl_out[26] ,
    \agent_1_mem_ctrl_out[25] ,
    \agent_1_mem_ctrl_out[24] ,
    \agent_1_mem_ctrl_out[23] ,
    \agent_1_mem_ctrl_out[22] ,
    \agent_1_mem_ctrl_out[21] ,
    \agent_1_mem_ctrl_out[20] ,
    \agent_1_mem_ctrl_out[19] ,
    \agent_1_mem_ctrl_out[18] ,
    \agent_1_mem_ctrl_out[17] ,
    \agent_1_mem_ctrl_out[16] ,
    \agent_1_mem_ctrl_out[15] ,
    \agent_1_mem_ctrl_out[14] ,
    \agent_1_mem_ctrl_out[13] ,
    \agent_1_mem_ctrl_out[12] ,
    \agent_1_mem_ctrl_out[11] ,
    \agent_1_mem_ctrl_out[10] ,
    \agent_1_mem_ctrl_out[9] ,
    \agent_1_mem_ctrl_out[8] ,
    \agent_1_mem_ctrl_out[7] ,
    \agent_1_mem_ctrl_out[6] ,
    \agent_1_mem_ctrl_out[5] ,
    \agent_1_mem_ctrl_out[4] ,
    \agent_1_mem_ctrl_out[3] ,
    \agent_1_mem_ctrl_out[2] ,
    \agent_1_mem_ctrl_out[1] ,
    \agent_1_mem_ctrl_out[0] }));
 VerySimpleCPU_core inst_codemaker (.clk(wb_clk_i),
    .done(cm_done),
    .mem_ctrl_req(cm_mem_ctrl_req),
    .mem_ctrl_vld(cm_mem_ctrl_vld),
    .mem_ctrl_we(cm_mem_ctrl_we),
    .rst(rst_asserted),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .mem_ctrl_addr({\cm_mem_ctrl_addr[13] ,
    \cm_mem_ctrl_addr[12] ,
    \cm_mem_ctrl_addr[11] ,
    \cm_mem_ctrl_addr[10] ,
    \cm_mem_ctrl_addr[9] ,
    \cm_mem_ctrl_addr[8] ,
    \cm_mem_ctrl_addr[7] ,
    \cm_mem_ctrl_addr[6] ,
    \cm_mem_ctrl_addr[5] ,
    \cm_mem_ctrl_addr[4] ,
    \cm_mem_ctrl_addr[3] ,
    \cm_mem_ctrl_addr[2] ,
    \cm_mem_ctrl_addr[1] ,
    \cm_mem_ctrl_addr[0] }),
    .mem_ctrl_in({\cm_mem_ctrl_in[31] ,
    \cm_mem_ctrl_in[30] ,
    \cm_mem_ctrl_in[29] ,
    \cm_mem_ctrl_in[28] ,
    \cm_mem_ctrl_in[27] ,
    \cm_mem_ctrl_in[26] ,
    \cm_mem_ctrl_in[25] ,
    \cm_mem_ctrl_in[24] ,
    \cm_mem_ctrl_in[23] ,
    \cm_mem_ctrl_in[22] ,
    \cm_mem_ctrl_in[21] ,
    \cm_mem_ctrl_in[20] ,
    \cm_mem_ctrl_in[19] ,
    \cm_mem_ctrl_in[18] ,
    \cm_mem_ctrl_in[17] ,
    \cm_mem_ctrl_in[16] ,
    \cm_mem_ctrl_in[15] ,
    \cm_mem_ctrl_in[14] ,
    \cm_mem_ctrl_in[13] ,
    \cm_mem_ctrl_in[12] ,
    \cm_mem_ctrl_in[11] ,
    \cm_mem_ctrl_in[10] ,
    \cm_mem_ctrl_in[9] ,
    \cm_mem_ctrl_in[8] ,
    \cm_mem_ctrl_in[7] ,
    \cm_mem_ctrl_in[6] ,
    \cm_mem_ctrl_in[5] ,
    \cm_mem_ctrl_in[4] ,
    \cm_mem_ctrl_in[3] ,
    \cm_mem_ctrl_in[2] ,
    \cm_mem_ctrl_in[1] ,
    \cm_mem_ctrl_in[0] }),
    .mem_ctrl_out({\cm_mem_ctrl_out[31] ,
    \cm_mem_ctrl_out[30] ,
    \cm_mem_ctrl_out[29] ,
    \cm_mem_ctrl_out[28] ,
    \cm_mem_ctrl_out[27] ,
    \cm_mem_ctrl_out[26] ,
    \cm_mem_ctrl_out[25] ,
    \cm_mem_ctrl_out[24] ,
    \cm_mem_ctrl_out[23] ,
    \cm_mem_ctrl_out[22] ,
    \cm_mem_ctrl_out[21] ,
    \cm_mem_ctrl_out[20] ,
    \cm_mem_ctrl_out[19] ,
    \cm_mem_ctrl_out[18] ,
    \cm_mem_ctrl_out[17] ,
    \cm_mem_ctrl_out[16] ,
    \cm_mem_ctrl_out[15] ,
    \cm_mem_ctrl_out[14] ,
    \cm_mem_ctrl_out[13] ,
    \cm_mem_ctrl_out[12] ,
    \cm_mem_ctrl_out[11] ,
    \cm_mem_ctrl_out[10] ,
    \cm_mem_ctrl_out[9] ,
    \cm_mem_ctrl_out[8] ,
    \cm_mem_ctrl_out[7] ,
    \cm_mem_ctrl_out[6] ,
    \cm_mem_ctrl_out[5] ,
    \cm_mem_ctrl_out[4] ,
    \cm_mem_ctrl_out[3] ,
    \cm_mem_ctrl_out[2] ,
    \cm_mem_ctrl_out[1] ,
    \cm_mem_ctrl_out[0] }));
 VerySimpleCPU_core inst_control_tower (.clk(wb_clk_i),
    .done(ct_done),
    .mem_ctrl_req(ct_mem_ctrl_req),
    .mem_ctrl_vld(ct_mem_ctrl_vld),
    .mem_ctrl_we(ct_mem_ctrl_we),
    .rst(rst_asserted),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .mem_ctrl_addr({\ct_mem_ctrl_addr[13] ,
    \ct_mem_ctrl_addr[12] ,
    \ct_mem_ctrl_addr[11] ,
    \ct_mem_ctrl_addr[10] ,
    \ct_mem_ctrl_addr[9] ,
    \ct_mem_ctrl_addr[8] ,
    \ct_mem_ctrl_addr[7] ,
    \ct_mem_ctrl_addr[6] ,
    \ct_mem_ctrl_addr[5] ,
    \ct_mem_ctrl_addr[4] ,
    \ct_mem_ctrl_addr[3] ,
    \ct_mem_ctrl_addr[2] ,
    \ct_mem_ctrl_addr[1] ,
    \ct_mem_ctrl_addr[0] }),
    .mem_ctrl_in({\ct_mem_ctrl_in[31] ,
    \ct_mem_ctrl_in[30] ,
    \ct_mem_ctrl_in[29] ,
    \ct_mem_ctrl_in[28] ,
    \ct_mem_ctrl_in[27] ,
    \ct_mem_ctrl_in[26] ,
    \ct_mem_ctrl_in[25] ,
    \ct_mem_ctrl_in[24] ,
    \ct_mem_ctrl_in[23] ,
    \ct_mem_ctrl_in[22] ,
    \ct_mem_ctrl_in[21] ,
    \ct_mem_ctrl_in[20] ,
    \ct_mem_ctrl_in[19] ,
    \ct_mem_ctrl_in[18] ,
    \ct_mem_ctrl_in[17] ,
    \ct_mem_ctrl_in[16] ,
    \ct_mem_ctrl_in[15] ,
    \ct_mem_ctrl_in[14] ,
    \ct_mem_ctrl_in[13] ,
    \ct_mem_ctrl_in[12] ,
    \ct_mem_ctrl_in[11] ,
    \ct_mem_ctrl_in[10] ,
    \ct_mem_ctrl_in[9] ,
    \ct_mem_ctrl_in[8] ,
    \ct_mem_ctrl_in[7] ,
    \ct_mem_ctrl_in[6] ,
    \ct_mem_ctrl_in[5] ,
    \ct_mem_ctrl_in[4] ,
    \ct_mem_ctrl_in[3] ,
    \ct_mem_ctrl_in[2] ,
    \ct_mem_ctrl_in[1] ,
    \ct_mem_ctrl_in[0] }),
    .mem_ctrl_out({\ct_mem_ctrl_out[31] ,
    \ct_mem_ctrl_out[30] ,
    \ct_mem_ctrl_out[29] ,
    \ct_mem_ctrl_out[28] ,
    \ct_mem_ctrl_out[27] ,
    \ct_mem_ctrl_out[26] ,
    \ct_mem_ctrl_out[25] ,
    \ct_mem_ctrl_out[24] ,
    \ct_mem_ctrl_out[23] ,
    \ct_mem_ctrl_out[22] ,
    \ct_mem_ctrl_out[21] ,
    \ct_mem_ctrl_out[20] ,
    \ct_mem_ctrl_out[19] ,
    \ct_mem_ctrl_out[18] ,
    \ct_mem_ctrl_out[17] ,
    \ct_mem_ctrl_out[16] ,
    \ct_mem_ctrl_out[15] ,
    \ct_mem_ctrl_out[14] ,
    \ct_mem_ctrl_out[13] ,
    \ct_mem_ctrl_out[12] ,
    \ct_mem_ctrl_out[11] ,
    \ct_mem_ctrl_out[10] ,
    \ct_mem_ctrl_out[9] ,
    \ct_mem_ctrl_out[8] ,
    \ct_mem_ctrl_out[7] ,
    \ct_mem_ctrl_out[6] ,
    \ct_mem_ctrl_out[5] ,
    \ct_mem_ctrl_out[4] ,
    \ct_mem_ctrl_out[3] ,
    \ct_mem_ctrl_out[2] ,
    \ct_mem_ctrl_out[1] ,
    \ct_mem_ctrl_out[0] }));
 main_controller inst_main_controller (.agent_1_mem_ctrl_req(agent_1_mem_ctrl_req),
    .agent_1_mem_ctrl_vld(agent_1_mem_ctrl_vld),
    .agent_1_mem_ctrl_we(agent_1_mem_ctrl_we),
    .agent_1_sram0_csb0(agent_1_sram0_csb0),
    .agent_1_sram0_web0(agent_1_sram0_web0),
    .agent_1_sram1_csb0(agent_1_sram1_csb0),
    .agent_1_sram1_web0(agent_1_sram1_web0),
    .agent_1_sram2_csb0(agent_1_sram2_csb0),
    .agent_1_sram2_web0(agent_1_sram2_web0),
    .clk(wb_clk_i),
    .cm_mem_ctrl_req(cm_mem_ctrl_req),
    .cm_mem_ctrl_vld(cm_mem_ctrl_vld),
    .cm_mem_ctrl_we(cm_mem_ctrl_we),
    .cm_sram0_csb0(cm_sram0_csb0),
    .cm_sram0_web0(cm_sram0_web0),
    .cm_sram1_csb0(cm_sram1_csb0),
    .cm_sram1_web0(cm_sram1_web0),
    .cm_sram2_csb0(cm_sram2_csb0),
    .cm_sram2_web0(cm_sram2_web0),
    .cm_sram3_csb0(cm_sram3_csb0),
    .cm_sram3_web0(cm_sram3_web0),
    .ct_mem_ctrl_req(ct_mem_ctrl_req),
    .ct_mem_ctrl_vld(ct_mem_ctrl_vld),
    .ct_mem_ctrl_we(ct_mem_ctrl_we),
    .ct_sram0_csb0(ct_sram0_csb0),
    .ct_sram0_web0(ct_sram0_web0),
    .ct_sram1_csb0(ct_sram1_csb0),
    .ct_sram1_web0(ct_sram1_web0),
    .ct_sram2_csb0(ct_sram2_csb0),
    .ct_sram2_web0(ct_sram2_web0),
    .ct_sram3_csb0(ct_sram3_csb0),
    .ct_sram3_web0(ct_sram3_web0),
    .ct_sram4_csb0(ct_sram4_csb0),
    .ct_sram4_web0(ct_sram4_web0),
    .main_mem_we(main_mem_we),
    .rd_uart(rd_uart),
    .rst(io_in[8]),
    .rst_asserted(rst_asserted),
    .rx_empty(rx_empty),
    .rx_fifo_flush_enable(rx_fifo_flush_enable),
    .sram_const_csb1(sram_const_csb1),
    .tx_full(tx_full),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .wr_uart(wr_uart),
    .agent_1_mem_ctrl_addr({\agent_1_mem_ctrl_addr[13] ,
    \agent_1_mem_ctrl_addr[12] ,
    \agent_1_mem_ctrl_addr[11] ,
    \agent_1_mem_ctrl_addr[10] ,
    \agent_1_mem_ctrl_addr[9] ,
    \agent_1_mem_ctrl_addr[8] ,
    \agent_1_mem_ctrl_addr[7] ,
    \agent_1_mem_ctrl_addr[6] ,
    \agent_1_mem_ctrl_addr[5] ,
    \agent_1_mem_ctrl_addr[4] ,
    \agent_1_mem_ctrl_addr[3] ,
    \agent_1_mem_ctrl_addr[2] ,
    \agent_1_mem_ctrl_addr[1] ,
    \agent_1_mem_ctrl_addr[0] }),
    .agent_1_mem_ctrl_in({\agent_1_mem_ctrl_in[31] ,
    \agent_1_mem_ctrl_in[30] ,
    \agent_1_mem_ctrl_in[29] ,
    \agent_1_mem_ctrl_in[28] ,
    \agent_1_mem_ctrl_in[27] ,
    \agent_1_mem_ctrl_in[26] ,
    \agent_1_mem_ctrl_in[25] ,
    \agent_1_mem_ctrl_in[24] ,
    \agent_1_mem_ctrl_in[23] ,
    \agent_1_mem_ctrl_in[22] ,
    \agent_1_mem_ctrl_in[21] ,
    \agent_1_mem_ctrl_in[20] ,
    \agent_1_mem_ctrl_in[19] ,
    \agent_1_mem_ctrl_in[18] ,
    \agent_1_mem_ctrl_in[17] ,
    \agent_1_mem_ctrl_in[16] ,
    \agent_1_mem_ctrl_in[15] ,
    \agent_1_mem_ctrl_in[14] ,
    \agent_1_mem_ctrl_in[13] ,
    \agent_1_mem_ctrl_in[12] ,
    \agent_1_mem_ctrl_in[11] ,
    \agent_1_mem_ctrl_in[10] ,
    \agent_1_mem_ctrl_in[9] ,
    \agent_1_mem_ctrl_in[8] ,
    \agent_1_mem_ctrl_in[7] ,
    \agent_1_mem_ctrl_in[6] ,
    \agent_1_mem_ctrl_in[5] ,
    \agent_1_mem_ctrl_in[4] ,
    \agent_1_mem_ctrl_in[3] ,
    \agent_1_mem_ctrl_in[2] ,
    \agent_1_mem_ctrl_in[1] ,
    \agent_1_mem_ctrl_in[0] }),
    .agent_1_mem_ctrl_out({\agent_1_mem_ctrl_out[31] ,
    \agent_1_mem_ctrl_out[30] ,
    \agent_1_mem_ctrl_out[29] ,
    \agent_1_mem_ctrl_out[28] ,
    \agent_1_mem_ctrl_out[27] ,
    \agent_1_mem_ctrl_out[26] ,
    \agent_1_mem_ctrl_out[25] ,
    \agent_1_mem_ctrl_out[24] ,
    \agent_1_mem_ctrl_out[23] ,
    \agent_1_mem_ctrl_out[22] ,
    \agent_1_mem_ctrl_out[21] ,
    \agent_1_mem_ctrl_out[20] ,
    \agent_1_mem_ctrl_out[19] ,
    \agent_1_mem_ctrl_out[18] ,
    \agent_1_mem_ctrl_out[17] ,
    \agent_1_mem_ctrl_out[16] ,
    \agent_1_mem_ctrl_out[15] ,
    \agent_1_mem_ctrl_out[14] ,
    \agent_1_mem_ctrl_out[13] ,
    \agent_1_mem_ctrl_out[12] ,
    \agent_1_mem_ctrl_out[11] ,
    \agent_1_mem_ctrl_out[10] ,
    \agent_1_mem_ctrl_out[9] ,
    \agent_1_mem_ctrl_out[8] ,
    \agent_1_mem_ctrl_out[7] ,
    \agent_1_mem_ctrl_out[6] ,
    \agent_1_mem_ctrl_out[5] ,
    \agent_1_mem_ctrl_out[4] ,
    \agent_1_mem_ctrl_out[3] ,
    \agent_1_mem_ctrl_out[2] ,
    \agent_1_mem_ctrl_out[1] ,
    \agent_1_mem_ctrl_out[0] }),
    .agent_1_sram0_dout0({\agent_1_sram0_dout0[31] ,
    \agent_1_sram0_dout0[30] ,
    \agent_1_sram0_dout0[29] ,
    \agent_1_sram0_dout0[28] ,
    \agent_1_sram0_dout0[27] ,
    \agent_1_sram0_dout0[26] ,
    \agent_1_sram0_dout0[25] ,
    \agent_1_sram0_dout0[24] ,
    \agent_1_sram0_dout0[23] ,
    \agent_1_sram0_dout0[22] ,
    \agent_1_sram0_dout0[21] ,
    \agent_1_sram0_dout0[20] ,
    \agent_1_sram0_dout0[19] ,
    \agent_1_sram0_dout0[18] ,
    \agent_1_sram0_dout0[17] ,
    \agent_1_sram0_dout0[16] ,
    \agent_1_sram0_dout0[15] ,
    \agent_1_sram0_dout0[14] ,
    \agent_1_sram0_dout0[13] ,
    \agent_1_sram0_dout0[12] ,
    \agent_1_sram0_dout0[11] ,
    \agent_1_sram0_dout0[10] ,
    \agent_1_sram0_dout0[9] ,
    \agent_1_sram0_dout0[8] ,
    \agent_1_sram0_dout0[7] ,
    \agent_1_sram0_dout0[6] ,
    \agent_1_sram0_dout0[5] ,
    \agent_1_sram0_dout0[4] ,
    \agent_1_sram0_dout0[3] ,
    \agent_1_sram0_dout0[2] ,
    \agent_1_sram0_dout0[1] ,
    \agent_1_sram0_dout0[0] }),
    .agent_1_sram1_dout0({\agent_1_sram1_dout0[31] ,
    \agent_1_sram1_dout0[30] ,
    \agent_1_sram1_dout0[29] ,
    \agent_1_sram1_dout0[28] ,
    \agent_1_sram1_dout0[27] ,
    \agent_1_sram1_dout0[26] ,
    \agent_1_sram1_dout0[25] ,
    \agent_1_sram1_dout0[24] ,
    \agent_1_sram1_dout0[23] ,
    \agent_1_sram1_dout0[22] ,
    \agent_1_sram1_dout0[21] ,
    \agent_1_sram1_dout0[20] ,
    \agent_1_sram1_dout0[19] ,
    \agent_1_sram1_dout0[18] ,
    \agent_1_sram1_dout0[17] ,
    \agent_1_sram1_dout0[16] ,
    \agent_1_sram1_dout0[15] ,
    \agent_1_sram1_dout0[14] ,
    \agent_1_sram1_dout0[13] ,
    \agent_1_sram1_dout0[12] ,
    \agent_1_sram1_dout0[11] ,
    \agent_1_sram1_dout0[10] ,
    \agent_1_sram1_dout0[9] ,
    \agent_1_sram1_dout0[8] ,
    \agent_1_sram1_dout0[7] ,
    \agent_1_sram1_dout0[6] ,
    \agent_1_sram1_dout0[5] ,
    \agent_1_sram1_dout0[4] ,
    \agent_1_sram1_dout0[3] ,
    \agent_1_sram1_dout0[2] ,
    \agent_1_sram1_dout0[1] ,
    \agent_1_sram1_dout0[0] }),
    .agent_1_sram2_dout0({\agent_1_sram2_dout0[31] ,
    \agent_1_sram2_dout0[30] ,
    \agent_1_sram2_dout0[29] ,
    \agent_1_sram2_dout0[28] ,
    \agent_1_sram2_dout0[27] ,
    \agent_1_sram2_dout0[26] ,
    \agent_1_sram2_dout0[25] ,
    \agent_1_sram2_dout0[24] ,
    \agent_1_sram2_dout0[23] ,
    \agent_1_sram2_dout0[22] ,
    \agent_1_sram2_dout0[21] ,
    \agent_1_sram2_dout0[20] ,
    \agent_1_sram2_dout0[19] ,
    \agent_1_sram2_dout0[18] ,
    \agent_1_sram2_dout0[17] ,
    \agent_1_sram2_dout0[16] ,
    \agent_1_sram2_dout0[15] ,
    \agent_1_sram2_dout0[14] ,
    \agent_1_sram2_dout0[13] ,
    \agent_1_sram2_dout0[12] ,
    \agent_1_sram2_dout0[11] ,
    \agent_1_sram2_dout0[10] ,
    \agent_1_sram2_dout0[9] ,
    \agent_1_sram2_dout0[8] ,
    \agent_1_sram2_dout0[7] ,
    \agent_1_sram2_dout0[6] ,
    \agent_1_sram2_dout0[5] ,
    \agent_1_sram2_dout0[4] ,
    \agent_1_sram2_dout0[3] ,
    \agent_1_sram2_dout0[2] ,
    \agent_1_sram2_dout0[1] ,
    \agent_1_sram2_dout0[0] }),
    .agent_1_sram_comm_addr0({\agent_1_sram_comm_addr0[8] ,
    \agent_1_sram_comm_addr0[7] ,
    \agent_1_sram_comm_addr0[6] ,
    \agent_1_sram_comm_addr0[5] ,
    \agent_1_sram_comm_addr0[4] ,
    \agent_1_sram_comm_addr0[3] ,
    \agent_1_sram_comm_addr0[2] ,
    \agent_1_sram_comm_addr0[1] ,
    \agent_1_sram_comm_addr0[0] }),
    .agent_1_sram_comm_din0({\agent_1_sram_comm_din0[31] ,
    \agent_1_sram_comm_din0[30] ,
    \agent_1_sram_comm_din0[29] ,
    \agent_1_sram_comm_din0[28] ,
    \agent_1_sram_comm_din0[27] ,
    \agent_1_sram_comm_din0[26] ,
    \agent_1_sram_comm_din0[25] ,
    \agent_1_sram_comm_din0[24] ,
    \agent_1_sram_comm_din0[23] ,
    \agent_1_sram_comm_din0[22] ,
    \agent_1_sram_comm_din0[21] ,
    \agent_1_sram_comm_din0[20] ,
    \agent_1_sram_comm_din0[19] ,
    \agent_1_sram_comm_din0[18] ,
    \agent_1_sram_comm_din0[17] ,
    \agent_1_sram_comm_din0[16] ,
    \agent_1_sram_comm_din0[15] ,
    \agent_1_sram_comm_din0[14] ,
    \agent_1_sram_comm_din0[13] ,
    \agent_1_sram_comm_din0[12] ,
    \agent_1_sram_comm_din0[11] ,
    \agent_1_sram_comm_din0[10] ,
    \agent_1_sram_comm_din0[9] ,
    \agent_1_sram_comm_din0[8] ,
    \agent_1_sram_comm_din0[7] ,
    \agent_1_sram_comm_din0[6] ,
    \agent_1_sram_comm_din0[5] ,
    \agent_1_sram_comm_din0[4] ,
    \agent_1_sram_comm_din0[3] ,
    \agent_1_sram_comm_din0[2] ,
    \agent_1_sram_comm_din0[1] ,
    \agent_1_sram_comm_din0[0] }),
    .cm_mem_ctrl_addr({\cm_mem_ctrl_addr[13] ,
    \cm_mem_ctrl_addr[12] ,
    \cm_mem_ctrl_addr[11] ,
    \cm_mem_ctrl_addr[10] ,
    \cm_mem_ctrl_addr[9] ,
    \cm_mem_ctrl_addr[8] ,
    \cm_mem_ctrl_addr[7] ,
    \cm_mem_ctrl_addr[6] ,
    \cm_mem_ctrl_addr[5] ,
    \cm_mem_ctrl_addr[4] ,
    \cm_mem_ctrl_addr[3] ,
    \cm_mem_ctrl_addr[2] ,
    \cm_mem_ctrl_addr[1] ,
    \cm_mem_ctrl_addr[0] }),
    .cm_mem_ctrl_in({\cm_mem_ctrl_in[31] ,
    \cm_mem_ctrl_in[30] ,
    \cm_mem_ctrl_in[29] ,
    \cm_mem_ctrl_in[28] ,
    \cm_mem_ctrl_in[27] ,
    \cm_mem_ctrl_in[26] ,
    \cm_mem_ctrl_in[25] ,
    \cm_mem_ctrl_in[24] ,
    \cm_mem_ctrl_in[23] ,
    \cm_mem_ctrl_in[22] ,
    \cm_mem_ctrl_in[21] ,
    \cm_mem_ctrl_in[20] ,
    \cm_mem_ctrl_in[19] ,
    \cm_mem_ctrl_in[18] ,
    \cm_mem_ctrl_in[17] ,
    \cm_mem_ctrl_in[16] ,
    \cm_mem_ctrl_in[15] ,
    \cm_mem_ctrl_in[14] ,
    \cm_mem_ctrl_in[13] ,
    \cm_mem_ctrl_in[12] ,
    \cm_mem_ctrl_in[11] ,
    \cm_mem_ctrl_in[10] ,
    \cm_mem_ctrl_in[9] ,
    \cm_mem_ctrl_in[8] ,
    \cm_mem_ctrl_in[7] ,
    \cm_mem_ctrl_in[6] ,
    \cm_mem_ctrl_in[5] ,
    \cm_mem_ctrl_in[4] ,
    \cm_mem_ctrl_in[3] ,
    \cm_mem_ctrl_in[2] ,
    \cm_mem_ctrl_in[1] ,
    \cm_mem_ctrl_in[0] }),
    .cm_mem_ctrl_out({\cm_mem_ctrl_out[31] ,
    \cm_mem_ctrl_out[30] ,
    \cm_mem_ctrl_out[29] ,
    \cm_mem_ctrl_out[28] ,
    \cm_mem_ctrl_out[27] ,
    \cm_mem_ctrl_out[26] ,
    \cm_mem_ctrl_out[25] ,
    \cm_mem_ctrl_out[24] ,
    \cm_mem_ctrl_out[23] ,
    \cm_mem_ctrl_out[22] ,
    \cm_mem_ctrl_out[21] ,
    \cm_mem_ctrl_out[20] ,
    \cm_mem_ctrl_out[19] ,
    \cm_mem_ctrl_out[18] ,
    \cm_mem_ctrl_out[17] ,
    \cm_mem_ctrl_out[16] ,
    \cm_mem_ctrl_out[15] ,
    \cm_mem_ctrl_out[14] ,
    \cm_mem_ctrl_out[13] ,
    \cm_mem_ctrl_out[12] ,
    \cm_mem_ctrl_out[11] ,
    \cm_mem_ctrl_out[10] ,
    \cm_mem_ctrl_out[9] ,
    \cm_mem_ctrl_out[8] ,
    \cm_mem_ctrl_out[7] ,
    \cm_mem_ctrl_out[6] ,
    \cm_mem_ctrl_out[5] ,
    \cm_mem_ctrl_out[4] ,
    \cm_mem_ctrl_out[3] ,
    \cm_mem_ctrl_out[2] ,
    \cm_mem_ctrl_out[1] ,
    \cm_mem_ctrl_out[0] }),
    .cm_sram0_dout0({\cm_sram0_dout0[31] ,
    \cm_sram0_dout0[30] ,
    \cm_sram0_dout0[29] ,
    \cm_sram0_dout0[28] ,
    \cm_sram0_dout0[27] ,
    \cm_sram0_dout0[26] ,
    \cm_sram0_dout0[25] ,
    \cm_sram0_dout0[24] ,
    \cm_sram0_dout0[23] ,
    \cm_sram0_dout0[22] ,
    \cm_sram0_dout0[21] ,
    \cm_sram0_dout0[20] ,
    \cm_sram0_dout0[19] ,
    \cm_sram0_dout0[18] ,
    \cm_sram0_dout0[17] ,
    \cm_sram0_dout0[16] ,
    \cm_sram0_dout0[15] ,
    \cm_sram0_dout0[14] ,
    \cm_sram0_dout0[13] ,
    \cm_sram0_dout0[12] ,
    \cm_sram0_dout0[11] ,
    \cm_sram0_dout0[10] ,
    \cm_sram0_dout0[9] ,
    \cm_sram0_dout0[8] ,
    \cm_sram0_dout0[7] ,
    \cm_sram0_dout0[6] ,
    \cm_sram0_dout0[5] ,
    \cm_sram0_dout0[4] ,
    \cm_sram0_dout0[3] ,
    \cm_sram0_dout0[2] ,
    \cm_sram0_dout0[1] ,
    \cm_sram0_dout0[0] }),
    .cm_sram1_dout0({\cm_sram1_dout0[31] ,
    \cm_sram1_dout0[30] ,
    \cm_sram1_dout0[29] ,
    \cm_sram1_dout0[28] ,
    \cm_sram1_dout0[27] ,
    \cm_sram1_dout0[26] ,
    \cm_sram1_dout0[25] ,
    \cm_sram1_dout0[24] ,
    \cm_sram1_dout0[23] ,
    \cm_sram1_dout0[22] ,
    \cm_sram1_dout0[21] ,
    \cm_sram1_dout0[20] ,
    \cm_sram1_dout0[19] ,
    \cm_sram1_dout0[18] ,
    \cm_sram1_dout0[17] ,
    \cm_sram1_dout0[16] ,
    \cm_sram1_dout0[15] ,
    \cm_sram1_dout0[14] ,
    \cm_sram1_dout0[13] ,
    \cm_sram1_dout0[12] ,
    \cm_sram1_dout0[11] ,
    \cm_sram1_dout0[10] ,
    \cm_sram1_dout0[9] ,
    \cm_sram1_dout0[8] ,
    \cm_sram1_dout0[7] ,
    \cm_sram1_dout0[6] ,
    \cm_sram1_dout0[5] ,
    \cm_sram1_dout0[4] ,
    \cm_sram1_dout0[3] ,
    \cm_sram1_dout0[2] ,
    \cm_sram1_dout0[1] ,
    \cm_sram1_dout0[0] }),
    .cm_sram2_dout0({\cm_sram2_dout0[31] ,
    \cm_sram2_dout0[30] ,
    \cm_sram2_dout0[29] ,
    \cm_sram2_dout0[28] ,
    \cm_sram2_dout0[27] ,
    \cm_sram2_dout0[26] ,
    \cm_sram2_dout0[25] ,
    \cm_sram2_dout0[24] ,
    \cm_sram2_dout0[23] ,
    \cm_sram2_dout0[22] ,
    \cm_sram2_dout0[21] ,
    \cm_sram2_dout0[20] ,
    \cm_sram2_dout0[19] ,
    \cm_sram2_dout0[18] ,
    \cm_sram2_dout0[17] ,
    \cm_sram2_dout0[16] ,
    \cm_sram2_dout0[15] ,
    \cm_sram2_dout0[14] ,
    \cm_sram2_dout0[13] ,
    \cm_sram2_dout0[12] ,
    \cm_sram2_dout0[11] ,
    \cm_sram2_dout0[10] ,
    \cm_sram2_dout0[9] ,
    \cm_sram2_dout0[8] ,
    \cm_sram2_dout0[7] ,
    \cm_sram2_dout0[6] ,
    \cm_sram2_dout0[5] ,
    \cm_sram2_dout0[4] ,
    \cm_sram2_dout0[3] ,
    \cm_sram2_dout0[2] ,
    \cm_sram2_dout0[1] ,
    \cm_sram2_dout0[0] }),
    .cm_sram3_dout0({\cm_sram3_dout0[31] ,
    \cm_sram3_dout0[30] ,
    \cm_sram3_dout0[29] ,
    \cm_sram3_dout0[28] ,
    \cm_sram3_dout0[27] ,
    \cm_sram3_dout0[26] ,
    \cm_sram3_dout0[25] ,
    \cm_sram3_dout0[24] ,
    \cm_sram3_dout0[23] ,
    \cm_sram3_dout0[22] ,
    \cm_sram3_dout0[21] ,
    \cm_sram3_dout0[20] ,
    \cm_sram3_dout0[19] ,
    \cm_sram3_dout0[18] ,
    \cm_sram3_dout0[17] ,
    \cm_sram3_dout0[16] ,
    \cm_sram3_dout0[15] ,
    \cm_sram3_dout0[14] ,
    \cm_sram3_dout0[13] ,
    \cm_sram3_dout0[12] ,
    \cm_sram3_dout0[11] ,
    \cm_sram3_dout0[10] ,
    \cm_sram3_dout0[9] ,
    \cm_sram3_dout0[8] ,
    \cm_sram3_dout0[7] ,
    \cm_sram3_dout0[6] ,
    \cm_sram3_dout0[5] ,
    \cm_sram3_dout0[4] ,
    \cm_sram3_dout0[3] ,
    \cm_sram3_dout0[2] ,
    \cm_sram3_dout0[1] ,
    \cm_sram3_dout0[0] }),
    .cm_sram_comm_addr0({\cm_sram_comm_addr0[8] ,
    \cm_sram_comm_addr0[7] ,
    \cm_sram_comm_addr0[6] ,
    \cm_sram_comm_addr0[5] ,
    \cm_sram_comm_addr0[4] ,
    \cm_sram_comm_addr0[3] ,
    \cm_sram_comm_addr0[2] ,
    \cm_sram_comm_addr0[1] ,
    \cm_sram_comm_addr0[0] }),
    .cm_sram_comm_din0({\cm_sram_comm_din0[31] ,
    \cm_sram_comm_din0[30] ,
    \cm_sram_comm_din0[29] ,
    \cm_sram_comm_din0[28] ,
    \cm_sram_comm_din0[27] ,
    \cm_sram_comm_din0[26] ,
    \cm_sram_comm_din0[25] ,
    \cm_sram_comm_din0[24] ,
    \cm_sram_comm_din0[23] ,
    \cm_sram_comm_din0[22] ,
    \cm_sram_comm_din0[21] ,
    \cm_sram_comm_din0[20] ,
    \cm_sram_comm_din0[19] ,
    \cm_sram_comm_din0[18] ,
    \cm_sram_comm_din0[17] ,
    \cm_sram_comm_din0[16] ,
    \cm_sram_comm_din0[15] ,
    \cm_sram_comm_din0[14] ,
    \cm_sram_comm_din0[13] ,
    \cm_sram_comm_din0[12] ,
    \cm_sram_comm_din0[11] ,
    \cm_sram_comm_din0[10] ,
    \cm_sram_comm_din0[9] ,
    \cm_sram_comm_din0[8] ,
    \cm_sram_comm_din0[7] ,
    \cm_sram_comm_din0[6] ,
    \cm_sram_comm_din0[5] ,
    \cm_sram_comm_din0[4] ,
    \cm_sram_comm_din0[3] ,
    \cm_sram_comm_din0[2] ,
    \cm_sram_comm_din0[1] ,
    \cm_sram_comm_din0[0] }),
    .ct_mem_ctrl_addr({\ct_mem_ctrl_addr[13] ,
    \ct_mem_ctrl_addr[12] ,
    \ct_mem_ctrl_addr[11] ,
    \ct_mem_ctrl_addr[10] ,
    \ct_mem_ctrl_addr[9] ,
    \ct_mem_ctrl_addr[8] ,
    \ct_mem_ctrl_addr[7] ,
    \ct_mem_ctrl_addr[6] ,
    \ct_mem_ctrl_addr[5] ,
    \ct_mem_ctrl_addr[4] ,
    \ct_mem_ctrl_addr[3] ,
    \ct_mem_ctrl_addr[2] ,
    \ct_mem_ctrl_addr[1] ,
    \ct_mem_ctrl_addr[0] }),
    .ct_mem_ctrl_in({\ct_mem_ctrl_in[31] ,
    \ct_mem_ctrl_in[30] ,
    \ct_mem_ctrl_in[29] ,
    \ct_mem_ctrl_in[28] ,
    \ct_mem_ctrl_in[27] ,
    \ct_mem_ctrl_in[26] ,
    \ct_mem_ctrl_in[25] ,
    \ct_mem_ctrl_in[24] ,
    \ct_mem_ctrl_in[23] ,
    \ct_mem_ctrl_in[22] ,
    \ct_mem_ctrl_in[21] ,
    \ct_mem_ctrl_in[20] ,
    \ct_mem_ctrl_in[19] ,
    \ct_mem_ctrl_in[18] ,
    \ct_mem_ctrl_in[17] ,
    \ct_mem_ctrl_in[16] ,
    \ct_mem_ctrl_in[15] ,
    \ct_mem_ctrl_in[14] ,
    \ct_mem_ctrl_in[13] ,
    \ct_mem_ctrl_in[12] ,
    \ct_mem_ctrl_in[11] ,
    \ct_mem_ctrl_in[10] ,
    \ct_mem_ctrl_in[9] ,
    \ct_mem_ctrl_in[8] ,
    \ct_mem_ctrl_in[7] ,
    \ct_mem_ctrl_in[6] ,
    \ct_mem_ctrl_in[5] ,
    \ct_mem_ctrl_in[4] ,
    \ct_mem_ctrl_in[3] ,
    \ct_mem_ctrl_in[2] ,
    \ct_mem_ctrl_in[1] ,
    \ct_mem_ctrl_in[0] }),
    .ct_mem_ctrl_out({\ct_mem_ctrl_out[31] ,
    \ct_mem_ctrl_out[30] ,
    \ct_mem_ctrl_out[29] ,
    \ct_mem_ctrl_out[28] ,
    \ct_mem_ctrl_out[27] ,
    \ct_mem_ctrl_out[26] ,
    \ct_mem_ctrl_out[25] ,
    \ct_mem_ctrl_out[24] ,
    \ct_mem_ctrl_out[23] ,
    \ct_mem_ctrl_out[22] ,
    \ct_mem_ctrl_out[21] ,
    \ct_mem_ctrl_out[20] ,
    \ct_mem_ctrl_out[19] ,
    \ct_mem_ctrl_out[18] ,
    \ct_mem_ctrl_out[17] ,
    \ct_mem_ctrl_out[16] ,
    \ct_mem_ctrl_out[15] ,
    \ct_mem_ctrl_out[14] ,
    \ct_mem_ctrl_out[13] ,
    \ct_mem_ctrl_out[12] ,
    \ct_mem_ctrl_out[11] ,
    \ct_mem_ctrl_out[10] ,
    \ct_mem_ctrl_out[9] ,
    \ct_mem_ctrl_out[8] ,
    \ct_mem_ctrl_out[7] ,
    \ct_mem_ctrl_out[6] ,
    \ct_mem_ctrl_out[5] ,
    \ct_mem_ctrl_out[4] ,
    \ct_mem_ctrl_out[3] ,
    \ct_mem_ctrl_out[2] ,
    \ct_mem_ctrl_out[1] ,
    \ct_mem_ctrl_out[0] }),
    .ct_sram0_dout0({\ct_sram0_dout0[31] ,
    \ct_sram0_dout0[30] ,
    \ct_sram0_dout0[29] ,
    \ct_sram0_dout0[28] ,
    \ct_sram0_dout0[27] ,
    \ct_sram0_dout0[26] ,
    \ct_sram0_dout0[25] ,
    \ct_sram0_dout0[24] ,
    \ct_sram0_dout0[23] ,
    \ct_sram0_dout0[22] ,
    \ct_sram0_dout0[21] ,
    \ct_sram0_dout0[20] ,
    \ct_sram0_dout0[19] ,
    \ct_sram0_dout0[18] ,
    \ct_sram0_dout0[17] ,
    \ct_sram0_dout0[16] ,
    \ct_sram0_dout0[15] ,
    \ct_sram0_dout0[14] ,
    \ct_sram0_dout0[13] ,
    \ct_sram0_dout0[12] ,
    \ct_sram0_dout0[11] ,
    \ct_sram0_dout0[10] ,
    \ct_sram0_dout0[9] ,
    \ct_sram0_dout0[8] ,
    \ct_sram0_dout0[7] ,
    \ct_sram0_dout0[6] ,
    \ct_sram0_dout0[5] ,
    \ct_sram0_dout0[4] ,
    \ct_sram0_dout0[3] ,
    \ct_sram0_dout0[2] ,
    \ct_sram0_dout0[1] ,
    \ct_sram0_dout0[0] }),
    .ct_sram1_dout0({\ct_sram1_dout0[31] ,
    \ct_sram1_dout0[30] ,
    \ct_sram1_dout0[29] ,
    \ct_sram1_dout0[28] ,
    \ct_sram1_dout0[27] ,
    \ct_sram1_dout0[26] ,
    \ct_sram1_dout0[25] ,
    \ct_sram1_dout0[24] ,
    \ct_sram1_dout0[23] ,
    \ct_sram1_dout0[22] ,
    \ct_sram1_dout0[21] ,
    \ct_sram1_dout0[20] ,
    \ct_sram1_dout0[19] ,
    \ct_sram1_dout0[18] ,
    \ct_sram1_dout0[17] ,
    \ct_sram1_dout0[16] ,
    \ct_sram1_dout0[15] ,
    \ct_sram1_dout0[14] ,
    \ct_sram1_dout0[13] ,
    \ct_sram1_dout0[12] ,
    \ct_sram1_dout0[11] ,
    \ct_sram1_dout0[10] ,
    \ct_sram1_dout0[9] ,
    \ct_sram1_dout0[8] ,
    \ct_sram1_dout0[7] ,
    \ct_sram1_dout0[6] ,
    \ct_sram1_dout0[5] ,
    \ct_sram1_dout0[4] ,
    \ct_sram1_dout0[3] ,
    \ct_sram1_dout0[2] ,
    \ct_sram1_dout0[1] ,
    \ct_sram1_dout0[0] }),
    .ct_sram2_dout0({\ct_sram2_dout0[31] ,
    \ct_sram2_dout0[30] ,
    \ct_sram2_dout0[29] ,
    \ct_sram2_dout0[28] ,
    \ct_sram2_dout0[27] ,
    \ct_sram2_dout0[26] ,
    \ct_sram2_dout0[25] ,
    \ct_sram2_dout0[24] ,
    \ct_sram2_dout0[23] ,
    \ct_sram2_dout0[22] ,
    \ct_sram2_dout0[21] ,
    \ct_sram2_dout0[20] ,
    \ct_sram2_dout0[19] ,
    \ct_sram2_dout0[18] ,
    \ct_sram2_dout0[17] ,
    \ct_sram2_dout0[16] ,
    \ct_sram2_dout0[15] ,
    \ct_sram2_dout0[14] ,
    \ct_sram2_dout0[13] ,
    \ct_sram2_dout0[12] ,
    \ct_sram2_dout0[11] ,
    \ct_sram2_dout0[10] ,
    \ct_sram2_dout0[9] ,
    \ct_sram2_dout0[8] ,
    \ct_sram2_dout0[7] ,
    \ct_sram2_dout0[6] ,
    \ct_sram2_dout0[5] ,
    \ct_sram2_dout0[4] ,
    \ct_sram2_dout0[3] ,
    \ct_sram2_dout0[2] ,
    \ct_sram2_dout0[1] ,
    \ct_sram2_dout0[0] }),
    .ct_sram3_dout0({\ct_sram3_dout0[31] ,
    \ct_sram3_dout0[30] ,
    \ct_sram3_dout0[29] ,
    \ct_sram3_dout0[28] ,
    \ct_sram3_dout0[27] ,
    \ct_sram3_dout0[26] ,
    \ct_sram3_dout0[25] ,
    \ct_sram3_dout0[24] ,
    \ct_sram3_dout0[23] ,
    \ct_sram3_dout0[22] ,
    \ct_sram3_dout0[21] ,
    \ct_sram3_dout0[20] ,
    \ct_sram3_dout0[19] ,
    \ct_sram3_dout0[18] ,
    \ct_sram3_dout0[17] ,
    \ct_sram3_dout0[16] ,
    \ct_sram3_dout0[15] ,
    \ct_sram3_dout0[14] ,
    \ct_sram3_dout0[13] ,
    \ct_sram3_dout0[12] ,
    \ct_sram3_dout0[11] ,
    \ct_sram3_dout0[10] ,
    \ct_sram3_dout0[9] ,
    \ct_sram3_dout0[8] ,
    \ct_sram3_dout0[7] ,
    \ct_sram3_dout0[6] ,
    \ct_sram3_dout0[5] ,
    \ct_sram3_dout0[4] ,
    \ct_sram3_dout0[3] ,
    \ct_sram3_dout0[2] ,
    \ct_sram3_dout0[1] ,
    \ct_sram3_dout0[0] }),
    .ct_sram4_dout0({\ct_sram4_dout0[31] ,
    \ct_sram4_dout0[30] ,
    \ct_sram4_dout0[29] ,
    \ct_sram4_dout0[28] ,
    \ct_sram4_dout0[27] ,
    \ct_sram4_dout0[26] ,
    \ct_sram4_dout0[25] ,
    \ct_sram4_dout0[24] ,
    \ct_sram4_dout0[23] ,
    \ct_sram4_dout0[22] ,
    \ct_sram4_dout0[21] ,
    \ct_sram4_dout0[20] ,
    \ct_sram4_dout0[19] ,
    \ct_sram4_dout0[18] ,
    \ct_sram4_dout0[17] ,
    \ct_sram4_dout0[16] ,
    \ct_sram4_dout0[15] ,
    \ct_sram4_dout0[14] ,
    \ct_sram4_dout0[13] ,
    \ct_sram4_dout0[12] ,
    \ct_sram4_dout0[11] ,
    \ct_sram4_dout0[10] ,
    \ct_sram4_dout0[9] ,
    \ct_sram4_dout0[8] ,
    \ct_sram4_dout0[7] ,
    \ct_sram4_dout0[6] ,
    \ct_sram4_dout0[5] ,
    \ct_sram4_dout0[4] ,
    \ct_sram4_dout0[3] ,
    \ct_sram4_dout0[2] ,
    \ct_sram4_dout0[1] ,
    \ct_sram4_dout0[0] }),
    .ct_sram_comm_addr0({\ct_sram_comm_addr0[8] ,
    \ct_sram_comm_addr0[7] ,
    \ct_sram_comm_addr0[6] ,
    \ct_sram_comm_addr0[5] ,
    \ct_sram_comm_addr0[4] ,
    \ct_sram_comm_addr0[3] ,
    \ct_sram_comm_addr0[2] ,
    \ct_sram_comm_addr0[1] ,
    \ct_sram_comm_addr0[0] }),
    .ct_sram_comm_din0({\ct_sram_comm_din0[31] ,
    \ct_sram_comm_din0[30] ,
    \ct_sram_comm_din0[29] ,
    \ct_sram_comm_din0[28] ,
    \ct_sram_comm_din0[27] ,
    \ct_sram_comm_din0[26] ,
    \ct_sram_comm_din0[25] ,
    \ct_sram_comm_din0[24] ,
    \ct_sram_comm_din0[23] ,
    \ct_sram_comm_din0[22] ,
    \ct_sram_comm_din0[21] ,
    \ct_sram_comm_din0[20] ,
    \ct_sram_comm_din0[19] ,
    \ct_sram_comm_din0[18] ,
    \ct_sram_comm_din0[17] ,
    \ct_sram_comm_din0[16] ,
    \ct_sram_comm_din0[15] ,
    \ct_sram_comm_din0[14] ,
    \ct_sram_comm_din0[13] ,
    \ct_sram_comm_din0[12] ,
    \ct_sram_comm_din0[11] ,
    \ct_sram_comm_din0[10] ,
    \ct_sram_comm_din0[9] ,
    \ct_sram_comm_din0[8] ,
    \ct_sram_comm_din0[7] ,
    \ct_sram_comm_din0[6] ,
    \ct_sram_comm_din0[5] ,
    \ct_sram_comm_din0[4] ,
    \ct_sram_comm_din0[3] ,
    \ct_sram_comm_din0[2] ,
    \ct_sram_comm_din0[1] ,
    \ct_sram_comm_din0[0] }),
    .main_mem_addr({\main_mem_addr[5] ,
    \main_mem_addr[4] ,
    \main_mem_addr[3] ,
    \main_mem_addr[2] ,
    \main_mem_addr[1] ,
    \main_mem_addr[0] }),
    .main_mem_in({\main_mem_in[31] ,
    \main_mem_in[30] ,
    \main_mem_in[29] ,
    \main_mem_in[28] ,
    \main_mem_in[27] ,
    \main_mem_in[26] ,
    \main_mem_in[25] ,
    \main_mem_in[24] ,
    \main_mem_in[23] ,
    \main_mem_in[22] ,
    \main_mem_in[21] ,
    \main_mem_in[20] ,
    \main_mem_in[19] ,
    \main_mem_in[18] ,
    \main_mem_in[17] ,
    \main_mem_in[16] ,
    \main_mem_in[15] ,
    \main_mem_in[14] ,
    \main_mem_in[13] ,
    \main_mem_in[12] ,
    \main_mem_in[11] ,
    \main_mem_in[10] ,
    \main_mem_in[9] ,
    \main_mem_in[8] ,
    \main_mem_in[7] ,
    \main_mem_in[6] ,
    \main_mem_in[5] ,
    \main_mem_in[4] ,
    \main_mem_in[3] ,
    \main_mem_in[2] ,
    \main_mem_in[1] ,
    \main_mem_in[0] }),
    .main_mem_out({\main_mem_out[31] ,
    \main_mem_out[30] ,
    \main_mem_out[29] ,
    \main_mem_out[28] ,
    \main_mem_out[27] ,
    \main_mem_out[26] ,
    \main_mem_out[25] ,
    \main_mem_out[24] ,
    \main_mem_out[23] ,
    \main_mem_out[22] ,
    \main_mem_out[21] ,
    \main_mem_out[20] ,
    \main_mem_out[19] ,
    \main_mem_out[18] ,
    \main_mem_out[17] ,
    \main_mem_out[16] ,
    \main_mem_out[15] ,
    \main_mem_out[14] ,
    \main_mem_out[13] ,
    \main_mem_out[12] ,
    \main_mem_out[11] ,
    \main_mem_out[10] ,
    \main_mem_out[9] ,
    \main_mem_out[8] ,
    \main_mem_out[7] ,
    \main_mem_out[6] ,
    \main_mem_out[5] ,
    \main_mem_out[4] ,
    \main_mem_out[3] ,
    \main_mem_out[2] ,
    \main_mem_out[1] ,
    \main_mem_out[0] }),
    .program_sel({io_in[10],
    io_in[9]}),
    .r_data({\r_data[7] ,
    \r_data[6] ,
    \r_data[5] ,
    \r_data[4] ,
    \r_data[3] ,
    \r_data[2] ,
    \r_data[1] ,
    \r_data[0] }),
    .sram_const_addr1({\sram_const_addr1[8] ,
    \sram_const_addr1[7] ,
    \sram_const_addr1[6] ,
    \sram_const_addr1[5] ,
    \sram_const_addr1[4] ,
    \sram_const_addr1[3] ,
    \sram_const_addr1[2] ,
    \sram_const_addr1[1] ,
    \sram_const_addr1[0] }),
    .sram_const_wmask0({\sram_const_wmask0[3] ,
    \sram_const_wmask0[2] ,
    \sram_const_wmask0[1] ,
    \sram_const_wmask0[0] }),
    .w_data({\w_data[7] ,
    \w_data[6] ,
    \w_data[5] ,
    \w_data[4] ,
    \w_data[3] ,
    \w_data[2] ,
    \w_data[1] ,
    \w_data[0] }));
 main_memory inst_main_memory (.clk(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .wea(main_mem_we),
    .addra({\main_mem_addr[5] ,
    \main_mem_addr[4] ,
    \main_mem_addr[3] ,
    \main_mem_addr[2] ,
    \main_mem_addr[1] ,
    \main_mem_addr[0] }),
    .dina({\main_mem_in[31] ,
    \main_mem_in[30] ,
    \main_mem_in[29] ,
    \main_mem_in[28] ,
    \main_mem_in[27] ,
    \main_mem_in[26] ,
    \main_mem_in[25] ,
    \main_mem_in[24] ,
    \main_mem_in[23] ,
    \main_mem_in[22] ,
    \main_mem_in[21] ,
    \main_mem_in[20] ,
    \main_mem_in[19] ,
    \main_mem_in[18] ,
    \main_mem_in[17] ,
    \main_mem_in[16] ,
    \main_mem_in[15] ,
    \main_mem_in[14] ,
    \main_mem_in[13] ,
    \main_mem_in[12] ,
    \main_mem_in[11] ,
    \main_mem_in[10] ,
    \main_mem_in[9] ,
    \main_mem_in[8] ,
    \main_mem_in[7] ,
    \main_mem_in[6] ,
    \main_mem_in[5] ,
    \main_mem_in[4] ,
    \main_mem_in[3] ,
    \main_mem_in[2] ,
    \main_mem_in[1] ,
    \main_mem_in[0] }),
    .douta({\main_mem_out[31] ,
    \main_mem_out[30] ,
    \main_mem_out[29] ,
    \main_mem_out[28] ,
    \main_mem_out[27] ,
    \main_mem_out[26] ,
    \main_mem_out[25] ,
    \main_mem_out[24] ,
    \main_mem_out[23] ,
    \main_mem_out[22] ,
    \main_mem_out[21] ,
    \main_mem_out[20] ,
    \main_mem_out[19] ,
    \main_mem_out[18] ,
    \main_mem_out[17] ,
    \main_mem_out[16] ,
    \main_mem_out[15] ,
    \main_mem_out[14] ,
    \main_mem_out[13] ,
    \main_mem_out[12] ,
    \main_mem_out[11] ,
    \main_mem_out[10] ,
    \main_mem_out[9] ,
    \main_mem_out[8] ,
    \main_mem_out[7] ,
    \main_mem_out[6] ,
    \main_mem_out[5] ,
    \main_mem_out[4] ,
    \main_mem_out[3] ,
    \main_mem_out[2] ,
    \main_mem_out[1] ,
    \main_mem_out[0] }),
    .gpio_in({io_in[26],
    io_in[25],
    io_in[24],
    io_in[23],
    io_in[22],
    io_in[21],
    io_in[20],
    io_in[19],
    io_in[18],
    io_in[17],
    io_in[16]}),
    .gpio_out({io_out[37],
    io_out[36],
    io_out[35],
    io_out[34],
    io_out[33],
    io_out[32],
    io_out[31],
    io_out[30],
    io_out[29],
    io_out[28],
    io_out[27]}));
 uart inst_uart (.clk(wb_clk_i),
    .rd_uart(rd_uart),
    .reset(rst_asserted),
    .rx(io_in[11]),
    .rx_empty(rx_empty),
    .rx_fifo_flush_enable(rx_fifo_flush_enable),
    .tx(tx),
    .tx_full(tx_full),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .wr_uart(wr_uart),
    .r_data({\r_data[7] ,
    \r_data[6] ,
    \r_data[5] ,
    \r_data[4] ,
    \r_data[3] ,
    \r_data[2] ,
    \r_data[1] ,
    \r_data[0] }),
    .w_data({\w_data[7] ,
    \w_data[6] ,
    \w_data[5] ,
    \w_data[4] ,
    \w_data[3] ,
    \w_data[2] ,
    \w_data[1] ,
    \w_data[0] }));
 assign io_oeb[0] = wb_rst_i;
 assign io_oeb[10] = wb_rst_i;
 assign io_oeb[11] = wb_rst_i;
 assign io_oeb[12] = wb_rst_i;
 assign io_oeb[13] = wb_rst_i;
 assign io_oeb[14] = wb_rst_i;
 assign io_oeb[15] = wb_rst_i;
 assign io_oeb[16] = wb_rst_i;
 assign io_oeb[17] = wb_rst_i;
 assign io_oeb[18] = wb_rst_i;
 assign io_oeb[19] = wb_rst_i;
 assign io_oeb[1] = wb_rst_i;
 assign io_oeb[20] = wb_rst_i;
 assign io_oeb[21] = wb_rst_i;
 assign io_oeb[22] = wb_rst_i;
 assign io_oeb[23] = wb_rst_i;
 assign io_oeb[24] = wb_rst_i;
 assign io_oeb[25] = wb_rst_i;
 assign io_oeb[26] = wb_rst_i;
 assign io_oeb[27] = wb_rst_i;
 assign io_oeb[28] = wb_rst_i;
 assign io_oeb[29] = wb_rst_i;
 assign io_oeb[2] = wb_rst_i;
 assign io_oeb[30] = wb_rst_i;
 assign io_oeb[31] = wb_rst_i;
 assign io_oeb[32] = wb_rst_i;
 assign io_oeb[33] = wb_rst_i;
 assign io_oeb[34] = wb_rst_i;
 assign io_oeb[35] = wb_rst_i;
 assign io_oeb[36] = wb_rst_i;
 assign io_oeb[37] = wb_rst_i;
 assign io_oeb[3] = wb_rst_i;
 assign io_oeb[4] = wb_rst_i;
 assign io_oeb[5] = wb_rst_i;
 assign io_oeb[6] = wb_rst_i;
 assign io_oeb[7] = wb_rst_i;
 assign io_oeb[8] = wb_rst_i;
 assign io_oeb[9] = wb_rst_i;
 assign io_out[12] = tx;
 assign io_out[13] = cm_done;
 assign io_out[14] = ct_done;
 assign io_out[15] = agent_1_done;
endmodule
