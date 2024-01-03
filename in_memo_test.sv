`timescale 1ns/1ps

module InstructionMemory_tb;

  reg [31:0] address;
  wire [31:0] instruction;

  // Instantiate Instruction Memory
  InstructionMemory uut (
    .address(address),
    .instruction(instruction)
  );

  // Initial stimulus
  initial begin
    address = 0;
    #10 address = 1;
    #10 address = 2;

    // Add more test cases as needed

    #50 $finish;
  end

  // Display instruction
  always @(posedge address) begin
    $display("Instruction at address %0d: %h", address, instruction);
  end

endmodule

