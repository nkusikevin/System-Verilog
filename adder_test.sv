`timescale 1ns/1ps

module FourBitAdder_tb;

  reg [3:0] A, B;
  wire [4:0] sum;

  // Instantiate Adder
  FourBitAdder uut (
    .A(A),
    .B(B),
    .sum(sum)
  );

  // Initial stimulus
  initial begin
    A = 4'b0010;
    B = 4'b1101;

    // Test case 1
    #10 A = 4'b1010;
    #10 B = 4'b0111;

    // Test case 2
    #10 A = 4'b1111;
    #10 B = 4'b0001;

    // Test case 3
    #10 A = 4'b0101;
    #10 B = 4'b0010;

    #50 $finish;
  end

  // Display sum values for verification
  always @(posedge A or posedge B) begin
    $display("Sum: %b", sum);
  end

endmodule

