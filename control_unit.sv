module ControlUnit (
  input wire [5:0] opcode,
  output reg regWrite,
  output reg memWrite,
  output reg memRead,
  output reg [1:0] aluOp
);

  // Control signals mapping based on opcode (hypothetical example)
  always @(opcode) begin
    case (opcode)
      6'b000000: begin // Example: opcode for ADD instruction
        regWrite = 1;
        memWrite = 0;
        memRead = 0;
        aluOp = 2'b00; // ALU operation for addition
      end
      6'b000001: begin // Example: opcode for SUB instruction
        regWrite = 1;
        memWrite = 0;
        memRead = 0;
        aluOp = 2'b01; // ALU operation for subtraction
      end
      // Add more cases as needed
      default: begin
        regWrite = 0;
        memWrite = 0;
        memRead = 0;
        aluOp = 2'b00;
      end
    endcase
  end

endmodule

