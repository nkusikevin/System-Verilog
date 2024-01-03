
module ProgramCounter (
  input wire [31:0] input_address,
  input wire clk,
  input wire reset,
  output reg [31:0] current_address
);

  // Register for the program counter
  always @(posedge clk or posedge reset) begin
    if (reset)
      current_address <= 32'h00000000;
    else
      current_address <= input_address;
  end

endmodule
