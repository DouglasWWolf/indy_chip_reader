
# ---------------------------------------------------------------------------
# Pin definitions
# ---------------------------------------------------------------------------


#===============================================================================
#                            Clocks & system signals
#===============================================================================


#
# 200 Mhz init clock
#
set_property -dict {PACKAGE_PIN G16  IOSTANDARD LVDS}   [get_ports init_clk_clk_n]
set_property -dict {PACKAGE_PIN G17  IOSTANDARD LVDS}   [get_ports init_clk_clk_p]
create_clock -period 5.000 -name sysclk200              [get_ports init_clk_clk_p]
#set_clock_groups -name group_sysclk200 -asynchronous -group [get_clocks sysclk200]



# 
#  Sensor chip SPI bus
# 
set_property -dict {PACKAGE_PIN B14   IOSTANDARD LVCMOS18  SLEW SLOW}  [get_ports CHIP_SPI_CSN ]            ;  # IO Bank 94
set_property -dict {PACKAGE_PIN AV11  IOSTANDARD LVCMOS18           }  [get_ports CHIP_SPI_MISO]            ;  # IO Bank 65
set_property -dict {PACKAGE_PIN L14   IOSTANDARD LVCMOS18  SLEW SLOW}  [get_ports CHIP_SPI_MOSI]            ;  # IO Bank 93
set_property -dict {PACKAGE_PIN A13   IOSTANDARD LVCMOS18  SLEW SLOW}  [get_ports CHIP_SPI_CLK ]            ;  # IO Bank 94
                                                                                                                                                           

#
# 80 MHz HSI clock
#
set_property -dict {PACKAGE_PIN F3    IOSTANDARD LVCMOS18  SLEW SLOW}  [get_ports CHIP_HSI_CLK     ];  # IO Bank 90


#
#  Sensor chip reset
#
set_property -dict {PACKAGE_PIN AW10  IOSTANDARD LVCMOS18           } [get_ports CHIP_RESET_N];  # IO Bank 65


#
# Sensor chip power rails
#
set_property -dict {PACKAGE_PIN B9    IOSTANDARD LVCMOS18  SLEW SLOW} [get_ports CHIP_VDDIO  ];  # IO Bank 91
set_property -dict {PACKAGE_PIN B10   IOSTANDARD LVCMOS18  SLEW SLOW} [get_ports CHIP_VDDA   ];  # IO Bank 91 
set_property -dict {PACKAGE_PIN B11   IOSTANDARD LVCMOS18  SLEW SLOW} [get_ports CHIP_VDDLVDS];  # IO Bank 91 
set_property -dict {PACKAGE_PIN A18   IOSTANDARD LVCMOS18  SLEW SLOW} [get_ports CHIP_VDD    ];  # IO Bank 71


#
# LVDS input clock output to sensor-chip. 768 MHz
#
set_property -dict {PACKAGE_PIN F22  IOSTANDARD LVDS  DATA_RATE DDR  LVDS_PRE_EMPHASIS FALSE } [get_ports LVDS_CLK_clk_n];  # IO Bank 70     Board signal name: CLK512_N
set_property -dict {PACKAGE_PIN G22  IOSTANDARD LVDS  DATA_RATE DDR  LVDS_PRE_EMPHASIS FALSE } [get_ports LVDS_CLK_clk_p];  # IO Bank 70     Board signal name: CLK512_P



#
# FPGA outputs to control the sensor chip GPIO inputs
#
#set_property -dict {PACKAGE_PIN H12    IOSTANDARD LVCMOS18   SLEW SLOW } [get_ports CHIP_GPIO[0]];  # IO Bank 94
#set_property -dict {PACKAGE_PIN H10    IOSTANDARD LVCMOS18   SLEW SLOW } [get_ports CHIP_GPIO[1]];  # IO Bank 94
set_property -dict {PACKAGE_PIN G11    IOSTANDARD LVCMOS18   SLEW SLOW } [get_ports CHIP_GPIO2];  # IO Bank 94
#set_property -dict {PACKAGE_PIN G10    IOSTANDARD LVCMOS18   SLEW SLOW } [get_ports CHIP_GPIO[3]];  # IO Bank 94
#set_property -dict {PACKAGE_PIN G12    IOSTANDARD LVCMOS18   SLEW SLOW } [get_ports CHIP_GPIO[4]];  # IO Bank 94


#
#  This enables a level translator for SPI pins on the sensor-chip
#
set_property -dict {PACKAGE_PIN A4     IOSTANDARD LVCMOS18   SLEW SLOW } [get_ports LVL_TRSL_OE_N];  # IO Bank 90
