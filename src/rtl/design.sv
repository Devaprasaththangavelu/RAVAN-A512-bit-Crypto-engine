module RAVAN_TOP(
  input clk, rst, enc_op_sel,mem_sel,
  input [63:0] data_in,
  input [31:0] address,
  input [511:0] key,
  output wire [31:0]addr_to_mem,
  output reg [63:0] data_out,
  output sha_error
);
  wire [63:0] enc_data_out;
  reg [63:0] dec_data_in;  
  wire [63:0] dec_data_out;
  reg  [511:0] hashkey;

  reg rd_wr;
  
  pipeline pipeline_unit( // pipe line for the hashing 
    .clk(clk),
    .rst(rst),
    .address(address),
    .opt_address(address_to_mem),
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
    .data_in(dec_data_in),
    .key(hashkey),
    .dec_data_out(dec_data_out)
  );
  
  memory memory_core(
    .clk(clk),
    .rst(rst),
    .rd_wr(rd_wr),
    .data(enc_data_out),
    .address(add),
    .out_data(dec_data_in)
  );

  key_reduction ravan_key_reduction_core(
    .clk(clk),
    .key(hashkey),
    .red_key(add)
  );
  always @(posedge clk)
  begin
    if (rst)
      data_out <= 64'd0;
    else if(mem_sel==0)
    begin
     if (enc_op_sel)
      rd_wr<=1;
    else
      rd_wr<=0;
      data_out <= dec_data_out;
      end
      else if(enc_op_sel)
      begin
      
      data_out<=enc_data_out;
      end else
      data_out<=dec_data_out;

  end
endmodule
