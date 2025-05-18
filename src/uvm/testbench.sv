`timescale 1ns/1ps
`include "encryption.v"
`include "decryption.v"
`include "dynamickey.v"
`include "ravanpipeline.v"
`include "sha.v"
`include "sha_constrants.v"
`include "sha_mem.v"
`include "sha_core.v"
`include "custom32.v"



  // Make sure this has the fixed real_data logic!

module RAVAN_TB;

  // Clock and reset
  logic clk;
  logic rst;
  logic enc_op_sel;  // 1 = encryption, 0 = decryption
  logic sha_error;
  // Inputs and outputs
  logic [63:0] data_in;
  logic [511:0] key;
  logic [63:0] data_out;
  logic [63:0] enc_data_out; // store encrypted output
  logic [63:0] dec_data_out;// decrypted data output


  // Instantiate the DUT (Device Under Test)
  RAVAN_TOP dut (
    .clk(clk),
    .rst(rst),
    .enc_op_sel(enc_op_sel),
    .data_in(data_in),
    .key(key),
    .data_out(data_out),
    .sha_error(sha_error)
  );
 
  // Clock generation: 100 MHz
  initial clk = 0;
  always #5 clk = ~clk;

  // Test Procedure
  initial begin
    $display("===== RAVAN Encryption/Decryption Testbench =====");

    // Initialize
    rst = 1;
    enc_op_sel = 1;  // Start with encryption
    data_in = 64'h1234_5678_ABCD_EF01;//real data
    key = 512'hA5A5A5A5A5A5A5A5_FF00FF00FF00FF00_123456789ABCDEF0123456789ABCDEF0_99887766554433221100FFEEDDCCBBAA_00112233445566778899AABBCCDDEEFD;
    $display("Real data:%h",data_in);
    #10;
    rst = 0;
    $display("[INFO] Starting Encryption...");
    #100;

    enc_data_out = data_out; // Save the encrypted output
    $display("Encrypted Output: %h", enc_data_out);

    // Setup for Decryption
    enc_op_sel = 0;
    
    $display("[INFO] Starting Decryption...");
    #100;
    
    data_in = enc_data_out;
    dec_data_out=data_out;
    
    $display("Decrypted Output: %h", dec_data_out);

    // Validate
    if (data_out === 64'h1234_5678_ABCD_EF01) begin
      $display("✅ Decryption successful!");
    end else begin
      $display("❌ Decryption failed!");
    end
    

    $finish;
  end

endmodule
