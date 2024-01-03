module ALU_32bit (
  input wire [31:0] A,
  input wire [31:0] B,
  input wire [3:0] opcode,  // Operation code: 4-bit opcode
  output reg [31:0] result,
  output reg zero_flag,      // Zero flag
  output reg overflow_flag,  // Overflow flag (for addition/subtraction)
  output reg carry_out       // Carry out flag (for addition)
);

  // Internal signals
  reg [31:0] temp_result;
  reg [32:0] extended_A;

  // ALU operations
  always @* begin
    // Sign extension for subtraction
    extended_A = {1'b0, A};

    // ALU operations based on opcode
    case (opcode)
      4'b0000: result = A + B;           // Addition
      4'b0001: result = A - B;           // Subtraction
      4'b0010: result = A & B;           // AND
      4'b0011: result = A | B;           // OR
      4'b0100: result = A ^ B;           // XOR
      4'b0101: result = A << B[4:0];     // Logical left shift
      default: result = 32'hxxxx_xxxx;   // Undefined operation
    endcase

    // Zero flag
    zero_flag = (result == 0);

    // Overflow flag (for addition/subtraction)
    overflow_flag = (opcode[3] == 1) ? (result[31] != A[31]) : 1'b0;

    // Carry out flag (for addition)
    carry_out = (result < A);
  end

endmodule

