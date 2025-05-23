interface rce_intf(
   input logic clk,
   input logic rst,
  input logic [63:0] data,
  input logic [511:0]key,
  input logic [15:0]address,
   output logic sha_error_out,
  output logic [63:0]data_out,
   input logic awvalid, 
   input logic wvalid, 
   input logic bready, 
   input logic arvalid, 
   input logic rready,
   output logic awready, 
   output logic wready, 
   output logic bvalid, 
   output logic arready, 
   output logic rvalid
)