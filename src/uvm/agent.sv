class rce_agent extends uvm_agent;
  `uvm_component_utils(rce_agent) // reg class to uvm factory
  
  rce_driver drv;
  rce_monitor mon;
  rce_sequencer seqr;  
  
  //standard constructor
  function new(string name ="rce_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info("Agent Class", "constructor", UVM_MEDIUM)
  endfunction
  
    //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //create the lower components
    
    drv = rce_driver ::type_id::create("rce_driver", this);
    mon = rce_monitor ::type_id::create("rce_monitor", this);
    seqr = rce_sequencer ::type_id::create("rce_sequencer", this);
    
  endfunction
  
  //connect phase
   function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("agent Class", "connect phase", UVM_MEDIUM)
     
    drv.seq_item_port.connect(seqr.seq_item_export);

  endfunction
  
endclass