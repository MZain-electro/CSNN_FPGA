`timescale 1ns / 1ps
module register_save_tb;
integer i;
  reg clk;
  reg [7:0] data_in;
  reg reset;
  wire [7:0] saved_data;

  // Instantiate the module to be tested
  register_save dut (
    .clk(clk),
    .data_in(data_in),
    .reset(reset),
    .saved_data(saved_data)
  );

  // Clock generator
  always #5 clk = ~clk;

  initial begin
    // Initialize inputs
    clk = 0;
    reset = 0;
    data_in = 8'd0;  // Test input data

    // Wait for a few cycles
    #10;

    // Test case 1: Save data on every third cycle
    // Reset the module
    reset = 1;
    #20;
    reset = 0;
    #5;

    // Verify that saved data is 0
    if (saved_data !== 0) $display("Test 1: Saved data is not 0");

    // Apply data on every clock cycle
    for ( i = 0; i < 9; i=i+1) begin
      data_in = i + 1;
      #5;
    end

    // Verify that saved data is the last data input
    if (saved_data !== 9) $display("Test 1: Saved data is incorrect");

    // Test case 2: Reset and save data again
    reset = 1;
    #5;
    reset = 0;
    #5;

    // Verify that saved data is 0 again
    if (saved_data !== 0) $display("Test 2: Saved data is not 0");

    // Apply data on every clock cycle
    for ( i = 0; i < 12; i=i+1) begin
      data_in = i + 1;
      #5;
    end

    // Verify that saved data is the 9th data input (the third on a positive edge)
    if (saved_data !== 9) $display("Test 2: Saved data is incorrect");
    
    $display("All tests passed!");
    $finish;
  end

endmodule

