`timescale 1ns/1ps

module Multiplexer_4to1_tb;

  reg [3:0] data_inputs;
  reg [1:0] select;
  wire output;

  // Instantiate Multiplexer
  Multiplexer_4to1 uut (
    .data_inputs(data_inputs),
    .select(select),
    .output(output)
  );

  // Initial stimulus
  initial begin
    data_inputs = 4'b0000;
    select = 2'b00;

    // Test case 1
    #10 data_inputs = 4'b0101;
    #10 select = 2'b01;

    // Test case 2
    #10 data_inputs = 4'b1111;
    #10 select = 2'b10;

    // Test case 3
    #10 data_inputs = 4'b1100;
    #10 select = 2'b11;

    #50 $finish;
  end

  // Display output values for verification
  always @(posedge select) begin
    $display("Output: %b", output);
  end

endmodule

