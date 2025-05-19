//interface between DUT and Testbench

interface rce_intf (input logic clk);

  logic rst;
  logic enc_op_sel;
  logic [63:0] data_in;
  logic [511:0] key;
  logic [63:0] data_out;
  logic sha_error;
  
endinterface