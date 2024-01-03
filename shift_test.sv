`timescale 1ns/1ps

module ShiftRegister_4bit_tb;

  reg clk, reset, shift;
  reg [3:0] data_input;
  wire [3:0] data_output;

  // Instantiate Shift Register
  ShiftRegister_4bit uut (
    .clk(clk),
    .reset(reset),
    .shift(shift),
    .data_input(data_input),
    .data_output(data_output)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Initial stimulus
  initial begin
    clk = 0;
    reset = 1;
    shift = 0;
    data_input = 4'b1101;

    // Release reset
    #10 reset = 0;

    // Test case 1
    #10 data_input = 4'b1010;
    #10 shift = 1;

    // Test case 2
    #10 data_input = 4'b0111;
    #10 shift = 1;

    // Test case 3
    #10 data_input = 4'b0011;
    #10 shift = 1;

    #50 $finish;
  end

  // Display data output values for verification
  always @(posedge clk) begin
    $display("Data Output: %b", data_output);
  end

endmodule

