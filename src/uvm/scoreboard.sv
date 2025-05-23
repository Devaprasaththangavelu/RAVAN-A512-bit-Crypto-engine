
// UVM component class
class rce_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(rce_scoreboard)

  // TLM analysis port
  uvm_analysis_imp#(rce_seq_item, rce_scoreboard) item_collected_export;

  // Queue to store incoming transactions
  rce_seq_item tx_data_out[$];

  // Standard constructor
  function new(string name = "rce_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("scoreboard Class", "constructor", UVM_MEDIUM)
  endfunction

  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export", this);
  endfunction

  // Reference encryption function (simple dummy logic — replace with real RAVAN model)
 function logic [63:0] reference_model(logic [63:0] data, logic [511:0] key, logic [2:0] enc_op_sel);
  logic [63:0] result;

  case (enc_op_sel)
    3'b000: result = data ^ key[63:0];          // XOR
    3'b001: result = ~(data ^ key[63:0]);       // NXOR
    3'b010: result = (data & key[63:0]) | (~data);  // Complex op
    3'b011: result = data + key[63:0];          // Add
    3'b100: result = data - key[63:0];          // Sub
    default: result = 64'hDEADBEEF_DEADBEEF;    // Fallback
  endcase

  return result;
endfunction

    logic  [63:0] expected_data;
    
  // Write task - receives from monitor and validates
  virtual function void write(rce_seq_item tx);
    tx_data_out.push_back(tx);
  

    expected_data = reference_model(tx.data, tx.key, tx.enc_op_sel);

    // Logging for debug
    `uvm_info("SCOREBOARD", $sformatf(
      "TX - data_in: %h | key: %h | enc_op_sel: %b | DUT_out: %h | Expected: %h",
      tx.data_in, tx.key, tx.enc_op_sel, tx.data_out, expected_data), UVM_MEDIUM)

    // Compare outputs
    if (tx.data_out !== expected_data) begin
      `uvm_error("SCOREBOARD", $sformatf(
        "Mismatch! DUT Output: %h, Expected: %h", tx.data_out, expected_data))
    end else begin
      `uvm_info("SCOREBOARD", "Output matched expected result.", UVM_LOW)
    end

    // SHA error check
    if (tx.sha_error) begin
      `uvm_error("SCOREBOARD", "SHA error flag was asserted!")
    end
  endfunction

endclass
