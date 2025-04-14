module RAVAN_decryption(
  input [63:0]data_in,
  input [63:0]real_data,
  input clk,rst,
  input [511:0] key,
  output reg[63:0] dec_data_out
);
  wire [63:0] sliced_key [7:0];//dynamic key slicing
  reg [63:0] temp_data;//temprovary processing data
  
  
  DynamicKeySlicer key_slicing(//dynamic key slicing instance
    .key(key),
    .sliced_key(sliced_key)
  );
 
  integer i;// for sliced key 
  integer round;//for 21 rounds
  
  always @(posedge clk)
    begin
      if(rst)
        begin
          dec_data_out<=64'd0;
          temp_data<=64'd0;
        end
      else
        begin
          temp_data<=data_in;
          for (round = 0; round < 21; round = round + 1) 
            begin
              for(i = 7; i >=0; i = i - 1)
             begin
               temp_data = temp_data - real_data;//sub enc data with original data
               temp_data = ~temp_data;//invert the data
               temp_data = temp_data ^ sliced_key[i];//xor data with keys
             end
            end

          dec_data_out<=temp_data;
        end 
    end
endmodule
  