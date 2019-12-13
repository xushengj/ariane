set partNumber $::env(XILINX_PART)
set boardName  $::env(XILINX_BOARD)

set ipName vc707_ila

create_project $ipName . -force -part $partNumber
set_property board_part $boardName [current_project]
create_ip -name ila -vendor xilinx.com -library ip -module_name $ipName

set_property -dict [list \
    CONFIG.C_PROBE0_TYPE {1} \
    CONFIG.C_PROBE1_TYPE {1} \
    CONFIG.C_PROBE2_TYPE {1} \
    CONFIG.C_PROBE3_TYPE {1} \
    CONFIG.C_PROBE4_TYPE {1} \
    CONFIG.C_PROBE5_TYPE {1} \
    CONFIG.C_PROBE6_TYPE {1} \
    CONFIG.C_PROBE7_TYPE {1} \
    CONFIG.C_PROBE8_TYPE {1} \
    CONFIG.C_PROBE9_TYPE {1} \
    CONFIG.C_PROBE10_TYPE {1} \
    CONFIG.C_PROBE11_TYPE {1} \
    CONFIG.C_PROBE12_TYPE {1} \
    CONFIG.C_PROBE13_TYPE {1} \
    CONFIG.C_PROBE14_TYPE {1} \
    CONFIG.C_PROBE15_TYPE {1} \
    CONFIG.C_PROBE16_TYPE {1} \
    CONFIG.C_PROBE17_TYPE {1} \
    CONFIG.C_PROBE18_TYPE {1} \
    CONFIG.C_PROBE19_TYPE {1} \
    CONFIG.C_PROBE20_TYPE {1} \
    CONFIG.C_PROBE21_TYPE {1} \
    CONFIG.C_PROBE22_TYPE {1} \
    CONFIG.C_PROBE23_TYPE {1} \
    CONFIG.C_PROBE24_TYPE {1} \
    CONFIG.C_PROBE25_TYPE {1} \
    CONFIG.C_PROBE26_TYPE {1} \
    CONFIG.C_PROBE27_TYPE {1} \
    CONFIG.C_PROBE0_WIDTH {5} \
    CONFIG.C_PROBE1_WIDTH {64} \
    CONFIG.C_PROBE2_WIDTH {8} \
    CONFIG.C_PROBE3_WIDTH {3} \
    CONFIG.C_PROBE4_WIDTH {1} \
    CONFIG.C_PROBE5_WIDTH {1} \
    CONFIG.C_PROBE6_WIDTH {1} \
    CONFIG.C_PROBE7_WIDTH {64} \
    CONFIG.C_PROBE8_WIDTH {1} \
    CONFIG.C_PROBE9_WIDTH {1} \
    CONFIG.C_PROBE10_WIDTH {1} \
    CONFIG.C_PROBE11_WIDTH {1} \
    CONFIG.C_PROBE12_WIDTH {1} \
    CONFIG.C_PROBE13_WIDTH {1} \
    CONFIG.C_PROBE14_WIDTH {1} \
    CONFIG.C_PROBE15_WIDTH {5} \
    CONFIG.C_PROBE16_WIDTH {64} \
    CONFIG.C_PROBE17_WIDTH {8} \
    CONFIG.C_PROBE18_WIDTH {3} \
    CONFIG.C_PROBE19_WIDTH {1} \
    CONFIG.C_PROBE20_WIDTH {1} \
    CONFIG.C_PROBE21_WIDTH {1} \
    CONFIG.C_PROBE22_WIDTH {5} \
    CONFIG.C_PROBE23_WIDTH {1} \
    CONFIG.C_PROBE24_WIDTH {1} \
    CONFIG.C_PROBE25_WIDTH {1} \
    CONFIG.C_PROBE26_WIDTH {1} \
    CONFIG.C_PROBE27_WIDTH {1} \
    CONFIG.C_DATA_DEPTH {8192} \
    CONFIG.C_NUM_OF_PROBES {28} \
    CONFIG.C_INPUT_PIPE_STAGES {6} \
] [get_ips $ipName]

generate_target {instantiation_template} [get_files ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
generate_target all [get_files  ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1
