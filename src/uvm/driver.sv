//uvm component
//uvm component
class rce_driver extends uvm_driver#(rce_seq_item);
  `uvm_component_utils(rce_driver) // reg class to uvm factory
  
  virtual rce_intf intf;
  rce_seq_item tx;
  
  //standard constructor
  function new(string name ="rce_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info("driver Class", "constructor", UVM_MEDIUM)
  endfunction
  
    //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db#(virtual rce_intf)::get(this, "", "vif", intf))
      `uvm_fatal("no_inif in driver","virtual interface get failed from config db");
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      `uvm_info("driver Class", "run_phase", UVM_MEDIUM)

      seq_item_port.get_next_item(tx);
      drive(tx);
      seq_item_port.item_done();
    end
  endtask
  
  task drive(rce_seq_item tx);
    @(posedge intf.clk)
    intf.rst <= tx.rst;
    intf.enc_op_sel<=tx.enc_op_sel;
    intf.data_in<=tx.data_in;
    intf.key<=tx.key;
    intf.data_out<=tx.data_out;
    intf.sha_error<=tx.sha_error;
    
  endtask
endclass