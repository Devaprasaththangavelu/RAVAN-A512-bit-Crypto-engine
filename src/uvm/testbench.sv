`timescale 1ns/1ns

`include "uvm_macros.svh" // contains all uvm macros
import uvm_pkg::*; // contains all uvm base classes

//include classes in order
`include "interface.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"
//include design files
`include "encryption.v"
`include "decryption.v"
`include "dynamickey.v"
`include "ravanpipeline.v"
`include "sha.v"
`include "sha_constrants.v"
`include "sha_mem.v"
`include "sha_core.v"
`include "custom32.v"

module top;
  
  logic clk;
  
  //..instantiation of lower modules.. Mainly DUT,Interface
  
  rce_intf intf(.clk(clk)); //(.interface clk(topmodule clk))
  
  RAVAN_TOP dut (
    .clk (intf.clk),
    .rst(intf.rst),
    .enc_op_sel(intf.enc_op_sel),
    .data_in(intf.data_in),
    .key(intf.key),
    .data_out(intf.data_out),
    .sha_error(intf.sha_error)
  );
  

  
  initial begin 
    uvm_config_db#(virtual rce_intf)::set(null,"*","vif",intf);
  end
  
  initial  begin
    clk = 0;
    //rst = 1;
    //#20 rst = 0;
  end
    always #10 clk = ~clk;
   
  initial begin
    $monitor($time, "clk = %d", clk);
     //enable wave dump
    $dumpfile("dump.vcd"); 
    $dumpvars;
    //#100 $finish;
  end
   
  initial begin 
    run_test("rce_test");
  end
  
endmodule