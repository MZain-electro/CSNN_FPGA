# CSNN_FPGA
Implementation of a CSNN trained for classification of MNIST handwritten datasets on a FPGA.
It consists of the following modules:
1. Register Save:
 /**
 * Module: value_save
 * Function: Saves an 8-bit value for every third positive edge of the clock signal
 *
 * Inputs:
 *   clk     : Input clock signal
 *   data_in : Input data to be saved
 *   reset   : Reset signal to clear the saved data and counter
 *
 * Outputs:
 *   saved_data : Output saved data, updated every third positive edge of the clock
 *
 * Behavior:
 *   The module saves the input data for every third positive edge of the clock signal.
 *   It uses a 2-bit counter to count up to 3, and saves the data on the third positive edge.
 *   The counter is reset and the saved data is cleared when the reset signal is high.
 *
 * Usage:
 *   1. Instantiate the module in a Verilog design:
 *
 *      value_save value_save_inst (
 *        .clk(clk),
 *        .data_in(data_in),
 *        .reset(reset),
 *        .saved_data(saved_data)
 *      );
 *
 *   2. Connect the input and output signals to the module instance:
 *
 *      clk        : Input clock signal
 *      data_in    : Input data to be saved
 *      reset      : Reset signal to clear the saved data and counter
 *      saved_data : Output saved data, updated every third positive edge of the clock
 *
 *   3. The output saved_data will contain the saved data for every third positive edge of the clock.
 */

