//====================================================================================
//                        ------->  Revision History  <------
//====================================================================================
//
//   Date     Who   Ver  Changes
//====================================================================================
// 26-Feb-26  DWW     1  Initial creation
//====================================================================================

/*

    Provides an orderly power-up/power-down for sensor-chip on Indy

*/


module indy_power_ctl #
(
    parameter FREQ_HZ = 250000000,

    parameter   VDDIO_RISE_MS = 10,
    parameter     VDD_RISE_MS = 10,
    parameter VDDLVDS_RISE_MS = 10,
    parameter    VDDA_RISE_MS = 10,

    parameter   VDDIO_FALL_MS = 200,
    parameter     VDD_FALL_MS = 1000,
    parameter VDDLVDS_FALL_MS = 40,
    parameter    VDDA_FALL_MS = 2500
)
(
    input clk, resetn,

    // The four power supplies for the sensor chip
    output reg chip_vddio, chip_vdd, chip_vddlvds, chip_vdda,

    // The reset pin for the sensor chip
    output reg chip_reset_n,

    // Interface to the outside world
    input       chip_power_ctl,
    output reg  chip_power_state
);


// The number of clock cycles in 1 millisecond
localparam ONE_MS = FREQ_HZ / 1000;

// Constants for driving the various chip pins
localparam POWER_OFF             = 0;
localparam POWER_ON              = 1;
localparam CHIP_RESET_ASSERTED   = 0;
localparam CHIP_RESET_DEASSERTED = 1;

reg[4:0] cpsm_state;

reg[31:0] sleep;
always @(posedge clk) begin

    // Count down timer
    if (sleep) sleep <= sleep -1;

    if (resetn == 0) begin
        chip_reset_n     <= CHIP_RESET_ASSERTED;
        chip_vddio       <= POWER_OFF;
        chip_vdd         <= POWER_OFF;
        chip_vddlvds     <= POWER_OFF;
        chip_vdda        <= POWER_OFF;
        chip_power_state <= 0;
        cpsm_state       <= 0;
        sleep            <= 0;
    end

    else case (cpsm_state)

        0:  begin
                if (chip_power_ctl == 1 && chip_power_state == 0) begin
                    chip_reset_n <= CHIP_RESET_ASSERTED;
                    sleep        <= 0;
                    cpsm_state   <= 10;
                end
                
                if (chip_power_ctl == 0 && chip_power_state == 1) begin
                    chip_reset_n <= CHIP_RESET_ASSERTED;
                    sleep        <= 10;
                    cpsm_state   <= 20;
                end
            end

        // Here we power up the chip
        10: if (sleep == 0) begin
                chip_vddio <= POWER_ON;
                sleep      <= VDDIO_RISE_MS * ONE_MS;
                cpsm_state <= cpsm_state + 1;
            end

        11: if (sleep == 0) begin
                chip_vdd   <= POWER_ON;
                sleep      <= VDD_RISE_MS * ONE_MS;
                cpsm_state <= cpsm_state + 1;
            end

        12: if (sleep == 0) begin
                chip_vddlvds <= POWER_ON;
                sleep        <= VDDLVDS_RISE_MS * ONE_MS;
                cpsm_state   <= cpsm_state + 1;
            end

        13: if (sleep == 0) begin
                chip_vdda  <= POWER_ON;
                sleep      <= VDDA_RISE_MS * ONE_MS;
                cpsm_state <= cpsm_state + 1;
            end

        14: if (sleep == 0) begin
                chip_reset_n     <= CHIP_RESET_DEASSERTED;
                chip_power_state <= 1;
                cpsm_state       <= 0;
            end


        // This is the power-down sequence
        20: if (sleep == 0) begin
                chip_vdda  <= POWER_OFF;
                sleep      <= VDDA_FALL_MS * ONE_MS;
                cpsm_state <= cpsm_state + 1;
            end

        21: if (sleep == 0) begin
                chip_vddlvds <= POWER_OFF;
                sleep        <= VDDLVDS_FALL_MS * ONE_MS;
                cpsm_state   <= cpsm_state + 1;
            end

        22: if (sleep == 0) begin
                chip_vdd   <= POWER_OFF;
                sleep      <= VDD_FALL_MS * ONE_MS;
                cpsm_state <= cpsm_state + 1;
            end

        23: if (sleep == 0) begin
                chip_vddio <= POWER_OFF;
                sleep      <= VDD_FALL_MS * ONE_MS;
                cpsm_state <= cpsm_state + 1;
            end

        24: if (sleep == 0) begin
                chip_power_state <= 0;
                cpsm_state  <= 0;
            end

    endcase

end


endmodule
