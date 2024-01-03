`timescale 1ns/1ps

module DataMemory_tb;

  reg [31:0] address, write_data;
  reg write_enable, read_enable;
  wire [31:0] read_data;

  // Instantiate Data Memory
  DataMemory uut (
    .address(address),
    .write_data(write_data),
    .write_enable(write_enable),
    .read_enable(read_enable),
    .read_data(read_data)
  );

  // Initial stimulus
  initial begin
    address = 0;
    write_data = 32'h00000001;
    write_enable = 1;
    read_enable = 0;

    // Write data to memory
    #10 address = 0;
    #10 write_data = 32'h00000002;
    #10 address = 1;

    // Read data from memory
    #10 write_enable = 0;
    #10 read_enable = 1;
    #10 address = 0;

    #50 $finish;
  end

  // Display read data values for verification
  always @(posedge address) begin
    $display("Data at address %0d: %h", address, read_data);
  end

endmodule

