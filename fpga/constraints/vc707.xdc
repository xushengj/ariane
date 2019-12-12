## Buttons
set_property -dict {PACKAGE_PIN AV40 IOSTANDARD LVCMOS18} [get_ports cpu_reset]

## To use FTDI FT2232 JTAG
set_property -dict { PACKAGE_PIN AV39 IOSTANDARD LVCMOS18 } [get_ports trst];
set_property -dict { PACKAGE_PIN M32 IOSTANDARD LVCMOS18 } [get_ports tck ];
set_property -dict { PACKAGE_PIN V29 IOSTANDARD LVCMOS18 } [get_ports tdi ];
set_property -dict { PACKAGE_PIN M28 IOSTANDARD LVCMOS18 } [get_ports tdo ];
set_property -dict { PACKAGE_PIN U31 IOSTANDARD LVCMOS18 } [get_ports tms ];

## UART
set_property -dict {PACKAGE_PIN AU36 IOSTANDARD LVCMOS18} [get_ports tx]
set_property -dict {PACKAGE_PIN AU33 IOSTANDARD LVCMOS18} [get_ports rx]


## LEDs
set_property -dict {PACKAGE_PIN AM39 IOSTANDARD LVCMOS18} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN AN39 IOSTANDARD LVCMOS18} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN AR37 IOSTANDARD LVCMOS18} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN AT37 IOSTANDARD LVCMOS18} [get_ports {led[3]}]
set_property -dict {PACKAGE_PIN AR35 IOSTANDARD LVCMOS18} [get_ports {led[4]}]
set_property -dict {PACKAGE_PIN AP41 IOSTANDARD LVCMOS18} [get_ports {led[5]}]
set_property -dict {PACKAGE_PIN AP42 IOSTANDARD LVCMOS18} [get_ports {led[6]}]
set_property -dict {PACKAGE_PIN AU39 IOSTANDARD LVCMOS18} [get_ports {led[7]}]

## Switches
set_property -dict {PACKAGE_PIN AV30 IOSTANDARD LVCMOS18} [get_ports {sw[0]}]
set_property -dict {PACKAGE_PIN AY33 IOSTANDARD LVCMOS18} [get_ports {sw[1]}]
set_property -dict {PACKAGE_PIN BA31 IOSTANDARD LVCMOS18} [get_ports {sw[2]}]
set_property -dict {PACKAGE_PIN BA32 IOSTANDARD LVCMOS18} [get_ports {sw[3]}]
set_property -dict {PACKAGE_PIN AW30 IOSTANDARD LVCMOS18} [get_ports {sw[4]}]
set_property -dict {PACKAGE_PIN AY30 IOSTANDARD LVCMOS18} [get_ports {sw[5]}]
set_property -dict {PACKAGE_PIN BA30 IOSTANDARD LVCMOS18} [get_ports {sw[6]}]
set_property -dict {PACKAGE_PIN BB31 IOSTANDARD LVCMOS18} [get_ports {sw[7]}]

## Fan Control
set_property -dict {PACKAGE_PIN BA37 IOSTANDARD LVCMOS18} [get_ports fan_pwm]
#set_property -dict { PACKAGE_PIN V21   IOSTANDARD LVCMOS18 } [get_ports { FAN_TACH }]; #IO_L22P_T3_A05_D21_14 Sch=fan_tac

## Ethernet
set_property -dict {PACKAGE_PIN N26 IOSTANDARD LVCMOS18} [get_ports eth_rst_n]; #IO_L14N_T2_SRCC_12 Sch=eth_phyrst_n
set_property -dict {PACKAGE_PIN N25 IOSTANDARD LVCMOS18} [get_ports eth_txck]; #IO_L14P_T2_SRCC_33 Sch=eth_tx_clk
set_property -dict {PACKAGE_PIN P23 IOSTANDARD LVCMOS18} [get_ports eth_txctl]; #IO_L20P_T3_33 Sch=eth_tx_en
set_property -dict {PACKAGE_PIN M26 IOSTANDARD LVCMOS18} [get_ports { eth_txd[0] }]; #IO_L22N_T3_33 Sch=eth_tx_d[0]
set_property -dict {PACKAGE_PIN L27 IOSTANDARD LVCMOS18} [get_ports { eth_txd[1] }]; #IO_L17P_T2_33 Sch=eth_tx_d[1]
set_property -dict {PACKAGE_PIN M27 IOSTANDARD LVCMOS18} [get_ports { eth_txd[2] }]; #IO_L18N_T2_33 Sch=eth_tx_d[2]
set_property -dict {PACKAGE_PIN N24 IOSTANDARD LVCMOS18} [get_ports { eth_txd[3] }]; #IO_L17N_T2_33 Sch=eth_tx_d[3]
set_property -dict {PACKAGE_PIN M21 IOSTANDARD LVCMOS18} [get_ports { eth_rxd[0] }]; #IO_L21N_T3_DQS_33 Sch=eth_rx_d[0]
set_property -dict {PACKAGE_PIN M24 IOSTANDARD LVCMOS18} [get_ports eth_rxck]; #IO_L13P_T2_MRCC_33 Sch=eth_rx_clk
set_property -dict {PACKAGE_PIN L25 IOSTANDARD LVCMOS18} [get_ports eth_rxctl]; #IO_L18P_T2_33 Sch=eth_rx_ctl
set_property -dict {PACKAGE_PIN J22 IOSTANDARD LVCMOS18} [get_ports { eth_rxd[1] }]; #IO_L21P_T3_DQS_33 Sch=eth_rx_d[1]
set_property -dict {PACKAGE_PIN K22 IOSTANDARD LVCMOS18} [get_ports { eth_rxd[2] }]; #IO_L20N_T3_33 Sch=eth_rx_d[2]
set_property -dict {PACKAGE_PIN L26 IOSTANDARD LVCMOS18} [get_ports { eth_rxd[3] }]; #IO_L22P_T3_33 Sch=eth_rx_d[3]
set_property -dict {PACKAGE_PIN N23 IOSTANDARD LVCMOS18} [get_ports eth_mdc ]; #IO_L23P_T3_33 Sch=eth_mdc
set_property -dict {PACKAGE_PIN L21 IOSTANDARD LVCMOS18} [get_ports eth_mdio]; #IO_L23N_T3_33 Sch=eth_mdio

# set_property -dict {PACKAGE_PIN AK15  IOSTANDARD LVCMOS18} [get_ports { eth_pme_b }]; #IO_L1N_T0_32 Sch=eth_pmeb
# set_property -dict {PACKAGE_PIN AK16  IOSTANDARD LVCMOS18} [get_ports { eth_int_b }]; #IO_L1P_T0_32 Sch=eth_intb

#############################################
# Ethernet Constraints for 1Gb/s
#############################################
# Modified for 125MHz receive clock
create_clock -period 8.000 -name eth_rxck [get_ports eth_rxck]

set_clock_groups -asynchronous -group [get_clocks eth_rxck -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks clk_out2_xlnx_clk_gen]

#############################################
## SD Card
#############################################
set_property -dict {PACKAGE_PIN AN30 IOSTANDARD LVCMOS18} [get_ports spi_clk_o]
set_property -dict {PACKAGE_PIN AT30 IOSTANDARD LVCMOS18} [get_ports spi_ss]
set_property -dict {PACKAGE_PIN AR30 IOSTANDARD LVCMOS18} [get_ports spi_miso]
set_property -dict {PACKAGE_PIN AP30 IOSTANDARD LVCMOS18} [get_ports spi_mosi]
# set_property -dict { PACKAGE_PIN P28   IOSTANDARD LVCMOS18 } [get_ports { sd_cd }]; #IO_L8N_T1_D12_14 Sch=sd_cd
# set_property -dict { PACKAGE_PIN R29   IOSTANDARD LVCMOS18 } [get_ports { sd_cmd }]; #IO_L7N_T1_D10_14 Sch=sd_cmd
# set_property -dict { PACKAGE_PIN R26   IOSTANDARD LVCMOS18 } [get_ports { sd_dat[0] }]; #IO_L10N_T1_D15_14 Sch=sd_dat[0]
# set_property -dict { PACKAGE_PIN R30   IOSTANDARD LVCMOS18 } [get_ports { sd_dat[1] }]; #IO_L9P_T1_DQS_14 Sch=sd_dat[1]
# set_property -dict { PACKAGE_PIN P29   IOSTANDARD LVCMOS18 } [get_ports { sd_dat[2] }]; #IO_L7P_T1_D09_14 Sch=sd_dat[2]
# set_property -dict { PACKAGE_PIN T30   IOSTANDARD LVCMOS18 } [get_ports { sd_dat[3] }]; #IO_L9N_T1_DQS_D13_14 Sch=sd_dat[3]
# set_property -dict { PACKAGE_PIN AE24  IOSTANDARD LVCMOS18 } [get_ports { sd_reset }]; #IO_L12N_T1_MRCC_12 Sch=sd_reset
# set_property -dict { PACKAGE_PIN R28   IOSTANDARD LVCMOS18 } [get_ports { sd_clk }]; #IO_L11P_T1_SRCC_14 Sch=sd_sclk

# create_generated_clock -name sd_fast_clk -source [get_pins clk_mmcm/sd_sys_clk] -divide_by 2 [get_pins chipset_impl/piton_sd_top/sdc_controller/clock_divider0/fast_clk_reg/Q]
# create_generated_clock -name sd_slow_clk -source [get_pins clk_mmcm/sd_sys_clk] -divide_by 200 [get_pins chipset_impl/piton_sd_top/sdc_controller/clock_divider0/slow_clk_reg/Q]
# create_generated_clock -name sd_clk_out -source [get_pins sd_clk_oddr/C] -divide_by 1 -add -master_clock sd_fast_clk [get_ports sd_clk_out]
# create_generated_clock -name sd_clk_out_1 -source [get_pins sd_clk_oddr/C] -divide_by 1 -add -master_clock sd_slow_clk [get_ports sd_clk_out]

# create_clock -period 40.000 -name VIRTUAL_sd_fast_clk -waveform {0.000 20.000}
# create_clock -period 4000.000 -name VIRTUAL_sd_slow_clk -waveform {0.000 2000.000}

# set_output_delay -clock [get_clocks sd_clk_out] -min -add_delay 5.000 [get_ports {sd_dat[*]}]
# set_output_delay -clock [get_clocks sd_clk_out] -max -add_delay 15.000 [get_ports {sd_dat[*]}]
# set_output_delay -clock [get_clocks sd_clk_out_1] -min -add_delay 5.000 [get_ports {sd_dat[*]}]
# set_output_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 1500.000 [get_ports {sd_dat[*]}]
# set_output_delay -clock [get_clocks sd_clk_out] -min -add_delay 5.000 [get_ports sd_cmd]
# set_output_delay -clock [get_clocks sd_clk_out] -max -add_delay 15.000 [get_ports sd_cmd]
# set_output_delay -clock [get_clocks sd_clk_out_1] -min -add_delay 5.000 [get_ports sd_cmd]
# set_output_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 1500.000 [get_ports sd_cmd]
# set_input_delay -clock [get_clocks VIRTUAL_sd_fast_clk] -min -add_delay 20.000 [get_ports {sd_dat[*]}]
# set_input_delay -clock [get_clocks VIRTUAL_sd_fast_clk] -max -add_delay 35.000 [get_ports {sd_dat[*]}]
# set_input_delay -clock [get_clocks VIRTUAL_sd_slow_clk] -min -add_delay 2000.000 [get_ports {sd_dat[*]}]
# set_input_delay -clock [get_clocks VIRTUAL_sd_slow_clk] -max -add_delay 3500.000 [get_ports {sd_dat[*]}]
# set_input_delay -clock [get_clocks VIRTUAL_sd_fast_clk] -min -add_delay 20.000 [get_ports sd_cmd]
# set_input_delay -clock [get_clocks VIRTUAL_sd_fast_clk] -max -add_delay 35.000 [get_ports sd_cmd]
# set_input_delay -clock [get_clocks VIRTUAL_sd_slow_clk] -min -add_delay 2000.000 [get_ports sd_cmd]
# set_input_delay -clock [get_clocks VIRTUAL_sd_slow_clk] -max -add_delay 3500.000 [get_ports sd_cmd]
# set_clock_groups -physically_exclusive -group [get_clocks -include_generated_clocks sd_clk_out] -group [get_clocks -include_generated_clocks sd_clk_out_1]
# set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks {VIRTUAL_sd_fast_clk sd_fast_clk}] -group [get_clocks -include_generated_clocks {sd_slow_clk VIRTUAL_sd_slow_clk}]
# set_clock_groups -asynchronous -group [get_clocks [list [get_clocks -of_objects [get_pins clk_mmcm/chipset_clk]]]] -group [get_clocks -filter { NAME =~  "*sd*" }]


# Genesys 2 has a quad SPI flash
# set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

## bpi flash
set_property -dict { PACKAGE_PIN AM36 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[0]}]; # FLASH_D0
set_property -dict { PACKAGE_PIN AN36 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[1]}]; # FLASH_D1
set_property -dict { PACKAGE_PIN AJ36 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[2]}]; # FLASH_D2
set_property -dict { PACKAGE_PIN AJ37 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[3]}]; # FLASH_D3
set_property -dict { PACKAGE_PIN AK37 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[4]}]; # FLASH_D4
set_property -dict { PACKAGE_PIN AL37 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[5]}]; # FLASH_D5
set_property -dict { PACKAGE_PIN AN35 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[6]}]; # FLASH_D6
set_property -dict { PACKAGE_PIN AP35 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[7]}]; # FLASH_D7
set_property -dict { PACKAGE_PIN AM37 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[8]}]; # FLASH_D8
set_property -dict { PACKAGE_PIN AG33 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[9]}]; # FLASH_D9
set_property -dict { PACKAGE_PIN AH33 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[10]}]; # FLASH_D10
set_property -dict { PACKAGE_PIN AK35 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[11]}]; # FLASH_D11
set_property -dict { PACKAGE_PIN AL35 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[12]}]; # FLASH_D12
set_property -dict { PACKAGE_PIN AJ31 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[13]}]; # FLASH_D13
set_property -dict { PACKAGE_PIN AH34 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[14]}]; # FLASH_D14
set_property -dict { PACKAGE_PIN AJ35 IOSTANDARD LVCMOS18}    [get_ports {flash_dq[15]}]; # FLASH_D15

set_property -dict { PACKAGE_PIN AW41 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[25]}]; # FLASH_A25
set_property -dict { PACKAGE_PIN AW42 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[24]}]; # FLASH_A24
set_property -dict { PACKAGE_PIN BB39 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[23]}]; # FLASH_A23
set_property -dict { PACKAGE_PIN BA39 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[22]}]; # FLASH_A22
set_property -dict { PACKAGE_PIN BA40 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[21]}]; # FLASH_A21
set_property -dict { PACKAGE_PIN AT41 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[20]}]; # FLASH_A20
set_property -dict { PACKAGE_PIN AU42 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[19]}]; # FLASH_A19
set_property -dict { PACKAGE_PIN BA42 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[18]}]; # FLASH_A18
set_property -dict { PACKAGE_PIN AU41 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[17]}]; # FLASH_A17
set_property -dict { PACKAGE_PIN AV41 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[16]}]; # FLASH_A16
set_property -dict { PACKAGE_PIN AM32 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[15]}]; # FLASH_A15
set_property -dict { PACKAGE_PIN AM33 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[14]}]; # FLASH_A14
set_property -dict { PACKAGE_PIN AN33 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[13]}]; # FLASH_A13
set_property -dict { PACKAGE_PIN AL29 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[12]}]; # FLASH_A12
set_property -dict { PACKAGE_PIN AL30 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[11]}]; # FLASH_A11
set_property -dict { PACKAGE_PIN AH29 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[10]}]; # FLASH_A10
set_property -dict { PACKAGE_PIN AH30 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[9]}]; # FLASH_A9
set_property -dict { PACKAGE_PIN AJ30 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[8]}]; # FLASH_A8
set_property -dict { PACKAGE_PIN AK30 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[7]}]; # FLASH_A7
set_property -dict { PACKAGE_PIN AG29 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[6]}]; # FLASH_A6
set_property -dict { PACKAGE_PIN AK28 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[5]}]; # FLASH_A5
set_property -dict { PACKAGE_PIN AK29 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[4]}]; # FLASH_A4
set_property -dict { PACKAGE_PIN AF30 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[3]}]; # FLASH_A3
set_property -dict { PACKAGE_PIN AG31 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[2]}]; # FLASH_A2
set_property -dict { PACKAGE_PIN AH28 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[1]}]; # FLASH_A1
set_property -dict { PACKAGE_PIN AJ28 IOSTANDARD LVCMOS18}    [get_ports {flash_addr[0]}]; # FLASH_A0

#set_property -dict { PACKAGE_PIN AM34 IOSTANDARD LVCMOS18}    [get_ports flash_wait]; # FLASH_WAIT
set_property -dict { PACKAGE_PIN BB41 IOSTANDARD LVCMOS18}    [get_ports flash_we_b]; # FLASH_FWE_B
set_property -dict { PACKAGE_PIN BA41 IOSTANDARD LVCMOS18}    [get_ports flash_oe_b]; # FLASH_OE_B
set_property -dict { PACKAGE_PIN AL36 IOSTANDARD LVCMOS18}    [get_ports flash_ce_b]; # FLASH_CE_B
set_property -dict { PACKAGE_PIN AY37 IOSTANDARD LVCMOS18}    [get_ports flash_adv_b]; # FLASH_ADV_B
#set_property -dict { PACKAGE_PIN AG11 IOSTANDARD LVCMOS18}    [get_ports flash_rst_b]; # FPGA_INIT_B

# not used
#set_property -dict { PACKAGE_PIN AP37 IOSTANDARD LVCMOS18}    [get_ports FPGA_EMCCLK];

set_property BITSTREAM.CONFIG.BPI_SYNC_MODE DISABLE     [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN DISABLE  [current_design]
# constraints from BIST example
#set_property BITSTREAM.CONFIG.BPI_SYNC_MODE Type1       [current_design]
#set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-1    [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE            [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup          [current_design]
set_property CONFIG_MODE BPI16                          [current_design]
set_property CFGBVS GND                                 [current_design]
set_property CONFIG_VOLTAGE 1.8                         [current_design]

## JTAG
# minimize routing delay

set_max_delay -to   [get_ports tdo ] 20
set_max_delay -from [get_ports tms ] 20
set_max_delay -from [get_ports tdi ] 20
set_max_delay -from [get_ports trst ] 20

# reset signal
# set_false_path -from [get_ports { trst } ]
# set_false_path -from [get_pins i_ddr/u_xlnx_mig_7_ddr3_mig/u_ddr3_infrastructure/rstdiv0_sync_r1_reg_rep/C]
