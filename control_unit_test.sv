`timescale 1ns/1ps

module ControlUnit_tb;

  reg [5:0] opcode;
  wire regWrite, memWrite, memRead;
  wire [1:0] aluOp;

  // Instantiate Control Unit
  ControlUnit uut (
    .opcode(opcode),
    .regWrite(regWrite),
    .memWrite(memWrite),
    .memRead(memRead),
    .aluOp(aluOp)
  );

  // Initial stimulus
  initial begin
    opcode = 6'b000000; // Test case for ADD instruction

    // Test case 1
    #10 opcode = 6'b000001; // Test case for SUB instruction

    // Test case 2
    #10 opcode = 6'b000010; // Test case for an undefined opcode

    // Test case 3
    #10 opcode = 6'b011111; // Test case for another undefined opcode

    #50 $finish;
  end

  // Display control signals for verification
  always @(posedge opcode) begin
    $display("Control Signals - regWrite: %b, memWrite: %b, memRead: %b, aluOp: %b", regWrite, memWrite, memRead, aluOp);
  end

endmodule

