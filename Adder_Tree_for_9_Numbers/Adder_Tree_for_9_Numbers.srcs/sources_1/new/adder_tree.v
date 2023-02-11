module adder_tree (
    input [12:0] a1,
    input [12:0] a2,
    input [12:0] a3,
    input [12:0] a4,
    input [12:0] a5,
    input [12:0] a6,
    input [12:0] a7,
    input [12:0] a8,
    input [12:0] a9,
    input rst, // Reset input
    output reg [12:0] sum
);

wire [12:0] s1, s2, s3, s4;
wire [12:0] s5, s6;

// First level of adders
assign s1 = a1 + a2;
assign s2 = a3 + a4;
assign s3 = a5 + a6;
assign s4 = a7 + a8;

// Second level of adders
assign s5 = s1 + s2;
assign s6 = s3 + s4;

// Third level of adders
always @(*) begin
    if (rst) begin
        sum <= 0;
    end else begin
        sum <= s5 + s6 + a9;
    end
end

endmodule
