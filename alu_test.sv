`timescale 1ns/1ps

module ALU_32bit_tb;

  reg [31:0] A, B;
  reg [3:0] opcode;
  wire [31:0] result;
  wire zero_flag, overflow_flag, carry_out;

  // Instantiate ALU
  ALU_32bit uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .zero_flag(zero_flag),
    .overflow_flag(overflow_flag),
    .carry_out(carry_out)
  );

  // Initial stimulus
  initial begin
    A = 32'h0000_0005;
    B = 32'h0000_0003;
    opcode = 4'b0000; // Addition

    // Test case 1
    #10 opcode = 4'b0001; // Subtraction
    #10 A = 32'h0000_0007;
    #10 B = 32'h0000_0003;

    // Test case 2
    #10 opcode = 4'b0010; // AND
    #10 A = 32'h0000_00F0;
    #10 B = 32'h0000_0F00;

    // Test case 3
    #10 opcode = 4'b0011; // OR
    #10 A = 32'h0000_00F0;
    #10 B = 32'h0000_0F00;

    // Test case 4
    #10 opcode = 4'b0100; // XOR
    #10 A = 32'h0000_00F0;
    #10 B = 32'h0000_0F00;

    // Test case 5
    #10 opcode = 4'b0101; // Logical left shift
    #10 A = 32'h0000_00F0;
    #10 B = 5;

    #50 $finish;
  end

  // Display results for verification
  always @(posedge A or posedge B or posedge opcode) begin
    $display("Result: %h, Zero Flag: %b, Overflow Flag: %b, Carry Out: %b",
             result, zero_flag, overflow_flag, carry_out);
  end

endmodule

