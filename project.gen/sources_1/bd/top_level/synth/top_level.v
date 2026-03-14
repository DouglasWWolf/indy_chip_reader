//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
//Date        : Sat Mar 14 14:57:17 2026
//Host        : wolf-super-server running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target top_level.bd
//Design      : top_level
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_ila_imp_1R6HT8R
   (CHIP_RESET_N,
    CHIP_SPI_CLK,
    CHIP_SPI_CSN,
    CHIP_SPI_MISO,
    CHIP_SPI_MOSI,
    chip_resetn_in,
    clk,
    free_clk,
    spi_clk,
    spi_cs_n,
    spi_miso,
    spi_mosi);
  output CHIP_RESET_N;
  output CHIP_SPI_CLK;
  output CHIP_SPI_CSN;
  input CHIP_SPI_MISO;
  output CHIP_SPI_MOSI;
  input chip_resetn_in;
  input clk;
  input free_clk;
  input spi_clk;
  input spi_cs_n;
  output spi_miso;
  input spi_mosi;

  wire CHIP_SPI_MISO_1;
  wire SPI_CSN_1;
  wire chip_resetn_in_1;
  wire free_clk_1;
  wire spi_clk_1;
  wire spi_mosi_1;
  wire sys_clks_clk_250;

  assign CHIP_RESET_N = chip_resetn_in_1;
  assign CHIP_SPI_CLK = spi_clk_1;
  assign CHIP_SPI_CSN = SPI_CSN_1;
  assign CHIP_SPI_MISO_1 = CHIP_SPI_MISO;
  assign CHIP_SPI_MOSI = spi_mosi_1;
  assign SPI_CSN_1 = spi_cs_n;
  assign chip_resetn_in_1 = chip_resetn_in;
  assign free_clk_1 = free_clk;
  assign spi_clk_1 = spi_clk;
  assign spi_miso = CHIP_SPI_MISO_1;
  assign spi_mosi_1 = spi_mosi;
  assign sys_clks_clk_250 = clk;
  top_level_system_ila_0_0 system_ila
       (.clk(sys_clks_clk_250),
        .probe0(SPI_CSN_1),
        .probe1(free_clk_1),
        .probe2(spi_clk_1),
        .probe3(spi_mosi_1),
        .probe4(CHIP_SPI_MISO_1),
        .probe5(chip_resetn_in_1));
endmodule

(* CORE_GENERATION_INFO = "top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top_level,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=1,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "top_level.hwdef" *) 
module top_level
   (CHIP_GPIO2,
    CHIP_HSI_CLK,
    CHIP_RESET_N,
    CHIP_SPI_CLK,
    CHIP_SPI_CSN,
    CHIP_SPI_MISO,
    CHIP_SPI_MOSI,
    CHIP_VDD,
    CHIP_VDDA,
    CHIP_VDDIO,
    CHIP_VDDLVDS,
    LVL_TRSL_OE_N,
    init_clk_clk_n,
    init_clk_clk_p);
  output CHIP_GPIO2;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CHIP_HSI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CHIP_HSI_CLK, CLK_DOMAIN top_level_clk_wiz_0_0_clk_250, FREQ_HZ 80000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output CHIP_HSI_CLK;
  output CHIP_RESET_N;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CHIP_SPI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CHIP_SPI_CLK, CLK_DOMAIN top_level_chip_spi_0_0_spi_clk, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output CHIP_SPI_CLK;
  output CHIP_SPI_CSN;
  input CHIP_SPI_MISO;
  output CHIP_SPI_MOSI;
  output CHIP_VDD;
  output CHIP_VDDA;
  output CHIP_VDDIO;
  output CHIP_VDDLVDS;
  output LVL_TRSL_OE_N;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 init_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME init_clk, CAN_DEBUG false, FREQ_HZ 200000000" *) input init_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 init_clk CLK_P" *) input init_clk_clk_p;

  wire CHIP_SPI_CSN_1;
  wire CHIP_SPI_MISO_1;
  wire chip_spi_busy;
  wire chip_spi_free_clk;
  wire chip_spi_spi_clk;
  wire controller_0_GPIO2;
  wire [31:0]controller_0_spi_addr;
  wire [1:0]controller_0_spi_cmd;
  wire controller_0_spi_sim_miso;
  wire controller_0_spi_sim_select;
  wire [31:0]controller_0_spi_wdata;
  wire controller_LVL_TRSL_OE_N;
  wire controller_chip_power_ctl;
  wire controller_resetn_out;
  wire indy_power_ctl_chip_power_state;
  wire indy_power_ctl_chip_reset_n;
  wire indy_power_ctl_chip_vdd;
  wire indy_power_ctl_chip_vdda;
  wire indy_power_ctl_chip_vddio;
  wire indy_power_ctl_chip_vddlvds;
  wire init_clk_1_CLK_N;
  wire init_clk_1_CLK_P;
  wire spi_mosi_1;
  wire sys_clks_clk_250;
  wire sys_clks_clk_80;
  wire system_ila_CHIP_RESET_N;
  wire system_ila_CHIP_SPI_CLK;
  wire system_ila_CHIP_SPI_MOSI;
  wire system_ila_EXT_CHIP_SPI_CSN;
  wire system_ila_spi_miso;

  assign CHIP_GPIO2 = controller_0_GPIO2;
  assign CHIP_HSI_CLK = sys_clks_clk_80;
  assign CHIP_RESET_N = system_ila_CHIP_RESET_N;
  assign CHIP_SPI_CLK = system_ila_CHIP_SPI_CLK;
  assign CHIP_SPI_CSN = system_ila_EXT_CHIP_SPI_CSN;
  assign CHIP_SPI_MISO_1 = CHIP_SPI_MISO;
  assign CHIP_SPI_MOSI = system_ila_CHIP_SPI_MOSI;
  assign CHIP_VDD = indy_power_ctl_chip_vdd;
  assign CHIP_VDDA = indy_power_ctl_chip_vdda;
  assign CHIP_VDDIO = indy_power_ctl_chip_vddio;
  assign CHIP_VDDLVDS = indy_power_ctl_chip_vddlvds;
  assign LVL_TRSL_OE_N = controller_LVL_TRSL_OE_N;
  assign init_clk_1_CLK_N = init_clk_clk_n;
  assign init_clk_1_CLK_P = init_clk_clk_p;
  top_level_chip_spi_0_0 chip_spi
       (.addr(controller_0_spi_addr),
        .busy(chip_spi_busy),
        .clk(sys_clks_clk_250),
        .free_clk(chip_spi_free_clk),
        .hsi_clk(sys_clks_clk_80),
        .resetn(controller_resetn_out),
        .sim_miso(controller_0_spi_sim_miso),
        .sim_select(controller_0_spi_sim_select),
        .spi_clk(chip_spi_spi_clk),
        .spi_cs_n(CHIP_SPI_CSN_1),
        .spi_miso(system_ila_spi_miso),
        .spi_mosi(spi_mosi_1),
        .start(controller_0_spi_cmd),
        .wdata(controller_0_spi_wdata));
  top_level_controller_0_0 controller
       (.GPIO2(controller_0_GPIO2),
        .LVL_TRSL_OE_N(controller_LVL_TRSL_OE_N),
        .chip_power_ctl(controller_chip_power_ctl),
        .chip_power_state(indy_power_ctl_chip_power_state),
        .clk(sys_clks_clk_250),
        .resetn_out(controller_resetn_out),
        .spi_addr(controller_0_spi_addr),
        .spi_busy(chip_spi_busy),
        .spi_cmd(controller_0_spi_cmd),
        .spi_sim_miso(controller_0_spi_sim_miso),
        .spi_sim_select(controller_0_spi_sim_select),
        .spi_wdata(controller_0_spi_wdata));
  top_level_indy_power_ctl_0_0 indy_power_ctl
       (.chip_power_ctl(controller_chip_power_ctl),
        .chip_power_state(indy_power_ctl_chip_power_state),
        .chip_reset_n(indy_power_ctl_chip_reset_n),
        .chip_vdd(indy_power_ctl_chip_vdd),
        .chip_vdda(indy_power_ctl_chip_vdda),
        .chip_vddio(indy_power_ctl_chip_vddio),
        .chip_vddlvds(indy_power_ctl_chip_vddlvds),
        .clk(sys_clks_clk_250),
        .resetn(controller_resetn_out));
  top_level_clk_wiz_0_0 system_clocks
       (.clk_250(sys_clks_clk_250),
        .clk_80(sys_clks_clk_80),
        .clk_in1_n(init_clk_1_CLK_N),
        .clk_in1_p(init_clk_1_CLK_P));
  system_ila_imp_1R6HT8R system_ila
       (.CHIP_RESET_N(system_ila_CHIP_RESET_N),
        .CHIP_SPI_CLK(system_ila_CHIP_SPI_CLK),
        .CHIP_SPI_CSN(system_ila_EXT_CHIP_SPI_CSN),
        .CHIP_SPI_MISO(CHIP_SPI_MISO_1),
        .CHIP_SPI_MOSI(system_ila_CHIP_SPI_MOSI),
        .chip_resetn_in(indy_power_ctl_chip_reset_n),
        .clk(sys_clks_clk_250),
        .free_clk(chip_spi_free_clk),
        .spi_clk(chip_spi_spi_clk),
        .spi_cs_n(CHIP_SPI_CSN_1),
        .spi_miso(system_ila_spi_miso),
        .spi_mosi(spi_mosi_1));
endmodule
