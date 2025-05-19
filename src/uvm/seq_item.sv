//uvm object class

class rce_seq_item extends uvm_sequence_item;
  `uvm_object_utils(rce_seq_item) // reg class to uvm factory
  
  rand logic [63:0] data_in;
  rand logic  rst;
  rand logic [511:0] key;
  rand logic         enc_op_sel;  // 0 for encryption, 1 for decryption
  logic [63:0]      data_out;
  logic              sha_error;
  
  //standard constructor
  function new(string name ="rce_seq_item");
    super.new(name);
    `uvm_info("sequence item Class", "constructor", UVM_MEDIUM)
  endfunction
  
  //no phases
  
  constraint wr_rd_c { rst != 1; }; 
 
endclass