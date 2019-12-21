# xlnx_axi_clock_converter
set ipName xlnx_axi_clock_converter
create_ip -name axi_clock_converter -vendor xilinx.com -library ip -module_name xlnx_axi_clock_converter
set_property -dict [list CONFIG.ADDR_WIDTH {64} CONFIG.DATA_WIDTH {64} CONFIG.ID_WIDTH {5}] [get_ips xlnx_axi_clock_converter]
generate_target all [get_files ./ariane.srcs/sources_1/ip/xlnx_axi_clock_converter/xlnx_axi_clock_converter.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./ariane.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1

# xlnx_axi_dwidth_converter
set ipName xlnx_axi_dwidth_converter
create_ip -name axi_dwidth_converter -vendor xilinx.com -library ip -module_name xlnx_axi_dwidth_converter
set_property -dict [list CONFIG.SI_DATA_WIDTH {64} CONFIG.SI_ID_WIDTH {5} CONFIG.MI_DATA_WIDTH {32}] [get_ips xlnx_axi_dwidth_converter]
generate_target all [get_files ./ariane.srcs/sources_1/ip/xlnx_axi_dwidth_converter/xlnx_axi_dwidth_converter.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./ariane.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1

# xlnx_axi_gpio
set ipName xlnx_axi_gpio
create_ip -name axi_gpio -vendor xilinx.com -library ip -module_name xlnx_axi_gpio
set_property -dict [list CONFIG.C_GPIO_WIDTH {8} CONFIG.C_GPIO2_WIDTH {8} CONFIG.C_IS_DUAL {1} CONFIG.C_ALL_INPUTS_2 {1} CONFIG.C_INTERRUPT_PRESENT {0}] [get_ips xlnx_axi_gpio]
generate_target all [get_files ./ariane.srcs/sources_1/ip/xlnx_axi_gpio/xlnx_axi_gpio.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./ariane.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1

# xlnx_axi_quad_spi
set ipName xlnx_axi_quad_spi
create_ip -name axi_quad_spi -vendor xilinx.com -library ip -module_name xlnx_axi_quad_spi
set_property -dict [list CONFIG.C_USE_STARTUP {0} CONFIG.C_SCK_RATIO {4} CONFIG.C_FIFO_DEPTH {256} CONFIG.C_TYPE_OF_AXI4_INTERFACE {1} CONFIG.C_S_AXI4_ID_WIDTH {0}] [get_ips xlnx_axi_quad_spi]
generate_target all [get_files ./ariane.srcs/sources_1/ip/xlnx_axi_quad_spi/xlnx_axi_quad_spi.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./ariane.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1

# xlnx_clk_gen
set ipName xlnx_clk_gen
create_ip -name clk_wiz -vendor xilinx.com -library ip -module_name xlnx_clk_gen
if {$::env(BOARD) ne "nexys_video"} {
    set_property -dict [list CONFIG.PRIM_IN_FREQ {200.000} \
                        CONFIG.NUM_OUT_CLKS {4} \
                        CONFIG.CLKOUT2_USED {true} \
                        CONFIG.CLKOUT3_USED {true} \
                        CONFIG.CLKOUT4_USED {true} \
                        CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50} \
                        CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {125} \
                        CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {125} \
                        CONFIG.CLKOUT3_REQUESTED_PHASE {90.000} \
                        CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {50} \
                        CONFIG.CLKIN1_JITTER_PS {50.0} \
                       ] [get_ips xlnx_clk_gen]
} else {
    # MIG on Nexys Video board can at most run at 100MHz
    # and Ariane on it cannot run at 50MHz.. only 40MHz can be achieved
    set_property -dict [list CONFIG.PRIM_IN_FREQ {100.000} \
                        CONFIG.NUM_OUT_CLKS {5} \
                        CONFIG.CLKOUT2_USED {true} \
                        CONFIG.CLKOUT3_USED {true} \
                        CONFIG.CLKOUT4_USED {true} \
                        CONFIG.CLKOUT5_USED {true} \
                        CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {40} \
                        CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {125} \
                        CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {125} \
                        CONFIG.CLKOUT3_REQUESTED_PHASE {90.000} \
                        CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {50} \
                        CONFIG.CLKOUT5_REQUESTED_OUT_FREQ {200} \
                        CONFIG.CLKIN1_JITTER_PS {50.0} \
                       ] [get_ips xlnx_clk_gen]
}
generate_target all [get_files ./ariane.srcs/sources_1/ip/xlnx_clk_gen/xlnx_clk_gen.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./ariane.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1

# xlnx_mig_7_ddr3
set ipName xlnx_mig_7_ddr3
create_ip -name mig_7series -vendor xilinx.com -library ip -module_name xlnx_mig_7_ddr3
file copy -force ./xilinx/xlnx_mig_7_ddr3/mig_$::env(BOARD).prj ./ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/mig_a.prj
set_property -dict [list CONFIG.XML_INPUT_FILE {mig_a.prj} CONFIG.RESET_BOARD_INTERFACE {Custom} CONFIG.MIG_DONT_TOUCH_PARAM {Custom} CONFIG.BOARD_MIG_PARAM {Custom}] [get_ips xlnx_mig_7_ddr3]
generate_target all [get_files ./ariane.srcs/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./ariane.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1
