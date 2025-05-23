`timescale 1ns/1ns
import uvm_pkg::*;
`include "uvm_macros.svh"

//uvm files
`include "interface.sv"
`include "agent.sv"
`include "monitor.sv"
`include "driver.sv"
`include "sequencer.sv"
`include "sequence.sv"
`include "seq_item.sv"
`include "scoreboard.sv"
`include "test.sv"
`include "env.sv"
//design files
`include "design.sv"
`include "encryption.v'
`include "decryption.v"
`include "dynamickey.v"
`include "sha_mem.v"
`include "sha_core.v";
`include "sha.v"
`include "sha_constrants.v"
`include "ravanpipeline.v"
`include "custom32.v"
`include "memory.v"
`include "key_reduction.v"

module top(
  logic clk,
  logic rst
);
   
  initial 
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial 
    begin
      rst=0;
      #2 rst=1;
    end
  
  rce_intf intf(clk,rst);
  
  ravan_axi_top dut(
    .clk(in.clk),
    .rst(in.rst),
    .data(in.data),
    .key(in.key),
    .address(in.address),
    .sha_error_out(in.sha_error_out),
    .data_out(in.data_out),
    .awvalid(in.awvalid), 
    .wvalid(in.wvalid), 
    .bready(in.bready), 
    .arvalid(in.arvaild), 
    .rready(in.rready),
    .awready(in.awready), 
    .wready(in.wready), 
    .bvalid(in.bvalid), 
    .arready(in.arready), 
    .rvalid(in.rvalid)
  );
  
  initial
    begin
      uvm_config_db#(virtual rce_intf)::set(null,"*","vif",intf);
    end
  initial
    begin
      run_test(ra_test);
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule