//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
//Date        : Fri Mar 13 11:47:18 2026
//Host        : wolf-super-server running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target top_level_wrapper.bd
//Design      : top_level_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module top_level_wrapper
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
  output CHIP_HSI_CLK;
  output CHIP_RESET_N;
  output CHIP_SPI_CLK;
  output CHIP_SPI_CSN;
  input CHIP_SPI_MISO;
  output CHIP_SPI_MOSI;
  output CHIP_VDD;
  output CHIP_VDDA;
  output CHIP_VDDIO;
  output CHIP_VDDLVDS;
  output LVL_TRSL_OE_N;
  input init_clk_clk_n;
  input init_clk_clk_p;

  wire CHIP_GPIO2;
  wire CHIP_HSI_CLK;
  wire CHIP_RESET_N;
  wire CHIP_SPI_CLK;
  wire CHIP_SPI_CSN;
  wire CHIP_SPI_MISO;
  wire CHIP_SPI_MOSI;
  wire CHIP_VDD;
  wire CHIP_VDDA;
  wire CHIP_VDDIO;
  wire CHIP_VDDLVDS;
  wire LVL_TRSL_OE_N;
  wire init_clk_clk_n;
  wire init_clk_clk_p;

  top_level top_level_i
       (.CHIP_GPIO2(CHIP_GPIO2),
        .CHIP_HSI_CLK(CHIP_HSI_CLK),
        .CHIP_RESET_N(CHIP_RESET_N),
        .CHIP_SPI_CLK(CHIP_SPI_CLK),
        .CHIP_SPI_CSN(CHIP_SPI_CSN),
        .CHIP_SPI_MISO(CHIP_SPI_MISO),
        .CHIP_SPI_MOSI(CHIP_SPI_MOSI),
        .CHIP_VDD(CHIP_VDD),
        .CHIP_VDDA(CHIP_VDDA),
        .CHIP_VDDIO(CHIP_VDDIO),
        .CHIP_VDDLVDS(CHIP_VDDLVDS),
        .LVL_TRSL_OE_N(LVL_TRSL_OE_N),
        .init_clk_clk_n(init_clk_clk_n),
        .init_clk_clk_p(init_clk_clk_p));
endmodule
