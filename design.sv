module RAVAN_TOP(
  input clk, rst, enc_op_sel,
  input [63:0] data_in,
  input [511:0] key,
  output reg [63:0] data_out
);
  wire [63:0] enc_data_out;
  wire [63:0] dec_data_out;
 
  RAVAN_encryption encrypt_core( // encryption instance
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .key(key),
    .enc_data_out(enc_data_out)
  );

  RAVAN_decryption decryption_core( // decryption instance
    .clk(clk),
    .rst(rst),
    .real_data(data_in),
    .data_in(enc_data_out),
    .key(key),
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
