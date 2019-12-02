set partNumber $::env(XILINX_PART)
set boardName  $::env(XILINX_BOARD)

set ipName nexys_video_axi_quad_spi_flash

create_project $ipName . -part $partNumber
set_property board_part $boardName [current_project]

create_ip -name axi_quad_spi -vendor xilinx.com -library ip -module_name $ipName

set_property -dict [list CONFIG.C_SPI_MEMORY {3} \
                         CONFIG.C_SPI_MODE {2}   \
                         CONFIG.C_SCK_RATIO {2}  \
                         CONFIG.C_XIP_MODE {1}   \
                         CONFIG.C_SPI_MEM_ADDR_BITS {32} \
                         CONFIG.C_TYPE_OF_AXI4_INTERFACE {1} \
                         CONFIG.QSPI_BOARD_INTERFACE {qspi_flash} \
                         CONFIG.C_S_AXI4_ID_WIDTH {0} \
                    ] [get_ips nexys_video_axi_quad_spi_flash]

generate_target {instantiation_template} [get_files ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
generate_target all [get_files  ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1
