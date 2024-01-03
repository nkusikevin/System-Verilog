`timescale 1ns/1ps

module DFlipFlop_tb;

  reg clk, rst, d;
  wire q;

  // Instantiate D Flip-Flop
  DFlipFlop uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Initial stimulus
  initial begin
    clk = 0;
    rst = 1;
    d = 0;
    #10 rst = 0;

    // Test scenario
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;

    #50 $finish;
  end

endmodule

