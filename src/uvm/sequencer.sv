class rce_sequencer extends uvm_sequencer#(rce_seq_item);
  `uvm_component_utils(rce_sequencer) // reg class to uvm factory
  
  //standard constructor
  function new(string name ="rce_sequencer", uvm_component parent);
    super.new(name, parent);
    `uvm_info("sequencer Class", "constructor", UVM_MEDIUM)
  endfunction
  
  
endclass