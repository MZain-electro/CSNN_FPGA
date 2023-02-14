`timescale 1ns / 1ps
module register_save(
  input clk,
  input [7:0] data_in,
  input reset,
  output reg [7:0] saved_data
);

reg [1:0] counter;   // 2-bit counter to count up to 3

always @ (posedge clk) begin
  if (reset) begin
    counter <= 0;
    saved_data <= 0;
  end 
  
  else
   begin
   if (counter == 2'd2) begin   // save data on every third cycle
      saved_data <= data_in;
      counter<=0;
    
    end
    else
    begin
    counter <= counter + 1;
    end
  end
end

endmodule
