set partNumber $::env(XILINX_PART)
set boardName  $::env(XILINX_BOARD)

set ipName vc709_axi_emc

create_project $ipName . -force -part $partNumber
set_property board_part $boardName [current_project]

create_ip -name axi_emc -vendor xilinx.com -library ip -module_name $ipName

set_property -dict [list CONFIG.EMC_BOARD_INTERFACE {linear_flash} \
                         CONFIG.C_AXI_CLK_PERIOD_PS {20000} \
                         CONFIG.C_S_AXI_MEM_DATA_WIDTH {64} \
                         CONFIG.C_S_AXI_MEM_ID_WIDTH {5} \
                         CONFIG.C_S_AXI_MEM0_BASEADDR {0x60000000} \
                         CONFIG.C_S_AXI_MEM0_HIGHADDR {0x67FFFFFF} \
                         CONFIG.C_MEM0_TYPE {2} \
                         CONFIG.C_NUM_BANKS_MEM {1} \
                         CONFIG.C_TAVDV_PS_MEM_0 {96000} \
                         CONFIG.C_TCEDV_PS_MEM_0 {96000} \
                         CONFIG.C_THZCE_PS_MEM_0 {7000} \
                         CONFIG.C_THZOE_PS_MEM_0 {7000} \
                         CONFIG.C_TLZWE_PS_MEM_0 {0} \
                         CONFIG.C_TPACC_PS_FLASH_0 {15000} \
                         CONFIG.C_TWC_PS_MEM_0 {15000} \
                         CONFIG.C_TWPH_PS_MEM_0 {20000} \
                         CONFIG.C_TWP_PS_MEM_0 {40000} \
                         CONFIG.C_WR_REC_TIME_MEM_0 {0} \
                         CONFIG.EMC_BOARD_INTERFACE {linear_flash} \
                       ] [get_ips $ipName]

generate_target {instantiation_template} [get_files ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
generate_target all [get_files  ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1
