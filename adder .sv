
module FourBitAdder (
  input wire [3:0] A,
  input wire [3:0] B,
  output reg [4:0] sum
);

  always @(A or B) begin
    sum = A + B;
  end

endmodule
