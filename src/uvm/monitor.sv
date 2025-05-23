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
    tx.data=intf.data;
    tx.address=intf.address;
    tx.key=intf.key;
    tx.data_out=intf.data_out;
    tx.sha_error_out=intf.sha_error_out;
    tx.awvalid =intf.awvalid;
    tx.wvalid =intf.wvalid;
    tx.bready =intf.bready;
    tx.arvalid =intf.arvalid;
    tx.rready=intf.rready;
    tx.awready=intf.awready; 
    tx.wready =intf.wready;
    tx.bvalid =intf.bvalid;
    tx.arready  =intf.arready;
    tx.rvalid=intf.rvalid;
  
  endtask
endclass