module Multiplexer_4to1 (
  input wire [3:0] data_inputs,
  input wire [1:0] select,
  output reg output
);

  always @* begin
    case (select)
      2'b00: output = data_inputs[0];
      2'b01: output = data_inputs[1];
      2'b10: output = data_inputs[2];
      2'b11: output = data_inputs[3];
      default: output = 1'b0; // Default case, for safety
    endcase
  end

endmodule

