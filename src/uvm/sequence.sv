
//uvm object class
class rce_sequence extends uvm_sequence#(rce_seq_item);
  `uvm_object_utils(rce_sequence) // reg class to uvm factory
  
  rce_seq_item tx;
  
  //standard constructor
  function new(string name ="rce_sequence");
    super.new(name);
    `uvm_info("sequence Class", "constructor", UVM_MEDIUM)
  endfunction
  
  //no phase
  
  task body();
    repeat(5) begin
      
    tx = rce_seq_item ::type_id::create("tx");
    
    wait_for_grant();
    tx.randomize();// with (rst==1);
    send_request(tx);
    wait_for_item_done();
    
    end
  endtask
    
endclass
