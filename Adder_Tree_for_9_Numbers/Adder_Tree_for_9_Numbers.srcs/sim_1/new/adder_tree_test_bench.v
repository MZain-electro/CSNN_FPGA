module tb_adder_tree;
    // Define signed 13-bit inputs a1-a9 and a reset signal
    reg signed [12:0] a1, a2, a3, a4, a5, a6, a7, a8, a9;
    reg reset;

    // Define signed 13-bit output sum
    wire signed [12:0] sum;

    // Define a scaling factor SF for Q6.7 format, which has 1 sign bit, 5 integer bits, and 7 fractional bits
    localparam SF = 2.0**-7.0;

    // Initialize input values and reset signal
    initial begin
        reset = 1;
        // Initialize a1 with -0.5 in Q6.7 format
        a1 = 13'b111111_1000000;
        // Initialize a2-a9 with 0.5 in Q1.7 format
        a2 = $signed({6'b0, 7'b1000_000});
        a3 = $signed({6'b0, 7'b1000_000});
        a4 = $signed({6'b0, 7'b1000_000});
        a5 = $signed({6'b0, 7'b1000_000});
        a6 = $signed({6'b0, 7'b1000_000});
        a7 = $signed({6'b0, 7'b1000_000});
        a8 = $signed({6'b0, 7'b1000_000});
        a9 = $signed({6'b0, 7'b1000_000});

        // Wait for 10 time units and then de-assert the reset signal
        #10
        reset = 0;

        // End the simulation after 20 time units
        #20 $finish;
    end

    // Instantiate the adder tree module with the input and output signals
    adder_tree dut(
        .a1(a1),
        .a2(a2),
        .a3(a3),
        .a4(a4),
        .a5(a5),
        .a6(a6),
        .a7(a7),
        .a8(a8),
        .a9(a9),
        .sum(sum),
        .rst(reset)
    );

    // Display the input and output values in decimal and binary formats
    initial begin
        #10
        $display("a1 = %f, binary = %b", $itor(a1*SF), a1);
        $display("a2 = %f, binary = %b", $itor(a2*SF), a2);
        $display("a3 = %f, binary = %b", $itor(a3*SF), a3);
        $display("a4 = %f, binary = %b", $itor(a4*SF), a4);
        $display("a5 = %f, binary = %b", $itor(a5*SF), a5);
        $display("a6 = %f, binary = %b", $itor(a6*SF), a6);
        $display("a7 = %f, binary = %b", $itor(a7*SF), a7);
        $display("a8 = %f, binary = %b", $itor(a8*SF), a8);
        $display("a9 = %f, binary = %b", $itor(a9*SF), a9);
        #10
        $display("sum = %f, binary = %b",  $itor(sum*SF), sum);
    end
endmodule
