
module DataMemory (
  input wire [31:0] address,
  input wire [31:0] write_data,
  input wire write_enable,
  input wire read_enable,
  output reg [31:0] read_data
);

  // Define data memory content (example data)
  reg [31:0] mem [0:255]; // 256 32-bit words

  // Read and write operations
  always @(posedge address or posedge write_enable) begin
    if (write_enable)
      mem[address] <= write_data;
    if (read_enable)
      read_data <= mem[address];
  end

endmodule
