module RAVAN_TOP(
  input clk, rst, enc_op_sel,
  input [63:0] data_in,
  input [511:0] key,
  output reg [63:0] data_out,
  output sha_error
);
  wire [63:0] enc_data_out;
  wire [63:0] dec_data_out;
  reg  [511:0] hashkey;
  
  pipeline pipeline_unit( // pipe line for the hashing 
    .clk(clk),
    .rst(rst),
    .key(key),
    .hashkey(hashkey),
    .sha_error(sha_error)
  );
  
 
  RAVAN_encryption encrypt_core( // encryption instance
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .key(hashkey),
    .enc_data_out(enc_data_out)
  );

  RAVAN_decryption decryption_core( // decryption instance
    .clk(clk),
    .rst(rst),
    .real_data(data_in),
    .data_in(enc_data_out),
    .key(hashkey),
    .dec_data_out(dec_data_out)
  );
  

  always @(posedge clk)
  begin
    if (rst)
      data_out <= 64'd0;
    else if (enc_op_sel)
      data_out <= enc_data_out;
    else
      data_out <= dec_data_out;
  end
endmodule
