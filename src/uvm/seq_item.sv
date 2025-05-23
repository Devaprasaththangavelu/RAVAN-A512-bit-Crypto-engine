
//uvm object class

class rce_seq_item extends uvm_sequence_item;
  `uvm_object_utils(rce_seq_item) // reg class to uvm factory
  
  rand logic [63:0] data;
  rand logic  rst;
  rand logic [511:0] key;
  rand logic [15:0]address;
  rand logic awvalid;
  rand logic wvalid;
  rand logic bready;
  rand logic arvalid;
  rand logic rready;
  logic [63:0] data_out;
  logic sha_error_out;
  logic awready; 
  logic wready;
  logic bvalid; 
  logic arready; 
  logic rvalid;
  
  
 
  //standard constructor
  function new(string name ="rce_seq_item");
    super.new(name);
    `uvm_info("sequence item Class", "constructor", UVM_MEDIUM)
  endfunction
  
  //no phases
  
  constraint wr_rd_c { rst != 1; }; 
 
endclass
