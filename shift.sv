module ShiftRegister_4bit (
  input wire clk,
  input wire reset,
  input wire shift,
  input wire [3:0] data_input,
  output reg [3:0] data_output
);

  reg [3:0] shift_reg;

  always @(posedge clk or posedge reset) begin
    if (reset)
      shift_reg <= 4'b0000;
    else if (shift)
      shift_reg <= {1'b0, shift_reg[3:1]};
    else
      shift_reg <= data_input;
  end

  assign data_output = shift_reg;

endmodule

