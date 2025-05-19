class rce_monitor extends uvm_monitor;//uvm_monitor is the base monitor class
  `uvm_component_utils(rce_monitor) // reg class to uvm factory
  
  virtual rce_intf intf;
  uvm_analysis_port #(rce_seq_item) item_collected_port;
  rce_seq_item tx;

  //standard constructor
  function new(string name ="rce_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info("monitor Class", "constructor", UVM_MEDIUM)
  endfunction
  
    //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
        item_collected_port = new("item_collected_port", this);

    if(!uvm_config_db#(virtual rce_intf)::get(this, "", "vif", intf))
      `uvm_fatal("no_inif in driver","virtual interface get failed from config db");
  
  endfunction
  
  task run_phase(uvm_phase phase);
    tx = rce_seq_item::type_id::create("tx");
    wait(!intf.rst)
    
    //sampling the output
    @(posedge intf.clk)
    tx.rst = intf.rst;
    tx.enc_op_sel=intf.enc_op_sel;
    tx.data_in=intf.data_in;
    tx.key=intf.key;
    tx.data_out=intf.data_out;
    tx.sha_error=intf.sha_error;
    
  endtask
endclass