# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# Base Configurations. Don't Touch
# section begin

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

# YOU ARE NOT ALLOWED TO CHANGE ANY VARIABLES DEFINED IN THE FIXED WRAPPER CFGS 
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/fixed_wrapper_cfgs.tcl

# YOU CAN CHANGE ANY VARIABLES DEFINED IN THE DEFAULT WRAPPER CFGS BY OVERRIDING THEM IN THIS CONFIG.TCL
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/default_wrapper_cfgs.tcl

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_project_wrapper
#section end

# User Configurations

## Source Verilog Files
set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/user_project_wrapper.v"

## Clock configurations
set ::env(CLOCK_PORT) "wb_clk_i"
# set ::env(CLOCK_NET) "mprj.clk"

set ::env(CLOCK_PERIOD) "25"

## Internal Macros
### Macro PDN Connections
 set ::env(FP_PDN_MACRO_HOOKS) "\
 	agent1_sram2k_inst0 vccd1 vssd1 \
 	agent1_sram2k_inst1 vccd1 vssd1 \
 	agent1_sram2k_inst2 vccd1 vssd1 \
 	ct_sram2k_inst0 vccd1 vssd1 \
 	ct_sram2k_inst1 vccd1 vssd1 \
 	ct_sram2k_inst2 vccd1 vssd1 \
 	ct_sram2k_inst3 vccd1 vssd1 \
 	ct_sram2k_inst4 vccd1 vssd1 \
 	cm_sram2k_inst0 vccd1 vssd1 \
 	cm_sram2k_inst1 vccd1 vssd1 \
 	cm_sram2k_inst2 vccd1 vssd1 \
 	cm_sram2k_inst3 vccd1 vssd1 \
 	inst_main_controller vccd1 vssd1 \
 	inst_agent_1 vccd1 vssd1 \
 	inst_control_tower vccd1 vssd1 \
 	inst_codemaker vccd1 vssd1 \
 	inst_main_memory vccd1 vssd1 \
 	inst_uart vccd1 vssd1 "

### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg
## set ::env(BASE_SDC_FILE) "$script_dir/../../sdc/user_project_wrapper_base.sdc"

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/parameters.v \
	$script_dir/../../verilog/rtl/main_memory.v \
	$script_dir/../../verilog/rtl/sky130_sram_2kbyte_1rw1r_32x512_8.v \
	$script_dir/../../verilog/rtl/list_ch08_04_uart.v \
	$script_dir/../../verilog/rtl/VerySimpleCPU_core.v \
	$script_dir/../../verilog/rtl/main_controller.v "

set ::env(EXTRA_LEFS) "\
	$script_dir/../../lef/main_memory.lef \
	$script_dir/../../lef/sky130_sram_2kbyte_1rw1r_32x512_8.lef \
	$script_dir/../../lef/uart.lef \
	$script_dir/../../lef/VerySimpleCPU_core.lef \
	$script_dir/../../lef/main_controller.lef"

set ::env(EXTRA_GDS_FILES) "\
	$script_dir/../../gds/main_memory.gds \
	$script_dir/../../gds/sky130_sram_2kbyte_1rw1r_32x512_8.gds \
	$script_dir/../../gds/uart.gds \
	$script_dir/../../gds/VerySimpleCPU_core.gds \
	$script_dir/../../gds/main_controller.gds"

# set ::env(GLB_RT_MAXLAYER) 5
set ::env(RT_MAX_LAYER) {met4}
# set ::env(GLB_RT_OBS) "\
# 	met5 0 0 2920 3520 \ 
# 	met4 300 725 1800 775 \
# 	met4 300 1225 1800 1275 \
# 	met4 300 1725 1800 1775 \
# 	met4 300 2025 1800 2075"

set ::env(PL_MACRO_CHANNEL) {30 30}
set ::env(PL_MACRO_HALO) {10 10}

set ::env(FP_PDN_VPITCH) 120
set ::env(FP_PDN_HPITCH) $::env(FP_PDN_VPITCH)

# set ::env(FP_PDN_VOFFSET) 30
# set ::env(FP_PDN_HOFFSET) $::env(FP_PDN_VOFFSET)

# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
set ::env(FP_PDN_CHECK_NODES) 0
set ::env(LVS_CONNECT_BY_LABEL) 1
set ::env(RUN_MAGIC_DRC) 0
set ::env(RUN_KLAYOUT_XOR) 0
# The following is because there are no std cells in the example wrapper project.
set ::env(SYNTH_TOP_LEVEL) 1
set ::env(PL_RANDOM_GLB_PLACEMENT) 1

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

set ::env(FP_PDN_ENABLE_RAILS) 0

set ::env(DIODE_INSERTION_STRATEGY) 0
set ::env(FILL_INSERTION) 0
set ::env(TAP_DECAP_INSERTION) 0
set ::env(CLOCK_TREE_SYNTH) 0
