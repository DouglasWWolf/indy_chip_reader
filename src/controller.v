module controller
(
    input clk,

    // Here we are providing a reset signal to other modules
    output reg resetn_out,

    // These drive the SPI module
    output reg [ 1:0] spi_cmd,
    output     [31:0] spi_addr,
    output     [31:0] spi_wdata,
    output            spi_sim_select,
    output            spi_sim_miso,
    input             spi_busy,

    // Used for controlling chip power
    output reg chip_power_ctl,
    input      chip_power_state,


    // Drives the chip's GPIO2 pin
    output GPIO2,

    // Enable line for level-translator between the FPGA and the sensor-chip
    output LVL_TRSL_OE_N     
);

// This probably isn't neccessary any more
assign GPIO2          = 1;

// Enable the level-shifter between the FPGA and the sensor-chip
assign LVL_TRSL_OE_N  = 0;

// We will always be reading register 0
assign spi_addr       = 0;

// We're not writing to the chip so this is irrelevant
assign spi_wdata      = 0;

// We don't have a chip-simulator attached to the chip_spi
assign spi_sim_select = 0;
assign spi_sim_miso   = 0;

// The state of our state machine
reg[2:0] fsm_state = 0;

// This is a countdown timer
reg[31:0] sleep = 0;

always @(posedge clk) begin

    // Countdown our countdown timer
    if (sleep) sleep <= sleep - 1;

    // This strobes high for a single clock cycle at a time
    spi_cmd <= 0;

    case (fsm_state)

        // Waste a little time after power up just to ensure we're stable
        0:  begin
                resetn_out     <= 0;
                chip_power_ctl <= 0;
                sleep          <= 10000;
                fsm_state      <= 1;
            end

        // Turn the chip power on
        1:  if (sleep == 0) begin
                resetn_out     <= 1;
                chip_power_ctl <= 1;
                fsm_state      <= 2;
            end

        // Once the power comes on, waste a little time
        2:  if (chip_power_state == 1) begin
                sleep      <= 100000;
                fsm_state  <= 3;
            end

        // Start a register read on the SPI
        3:  if (sleep == 0) begin
                spi_cmd   <= 1;
                fsm_state <= 4;
            end

        // When the register read completes, do it again, forever
        4:  if (spi_busy == 0) begin
                sleep     <= 250000;
                fsm_state <= 3;
            end

    endcase
end

endmodule