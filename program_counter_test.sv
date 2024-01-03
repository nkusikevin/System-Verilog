
`timescale 1ns/1ps

module ProgramCounter_tb;

  reg [31:0] input_address;
  reg clk, reset;
  wire [31:0] current_address;

  // Instantiate Program Counter
  ProgramCounter uut (
    .input_address(input_address),
    .clk(clk),
    .reset(reset),
    .current_address(current_address)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Initial stimulus
  initial begin
    clk = 0;
    reset = 1;
    input_address = 32'h00000004;

    // Release reset
    #10 reset = 0;

    // Test scenario
    #10 input_address = 32'h00000008;
    #10 input_address = 32'h0000000C;

    #50 $finish;
  end

  // Display program counter values for verification
  always @(posedge clk) begin
    $display("Current Program Counter Value: %h", current_address);
  end

endmodule
