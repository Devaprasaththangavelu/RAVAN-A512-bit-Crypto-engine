module RAVAN_decryption(
  input [63:0]data_in,
  input [63:0]real_data,
  input clk,rst,
  input [511:0] key,
  output reg[63:0] dec_data_out
);
  reg [63:0] sliced_key [7:0];//dynamic key slicing
  reg [63:0] temp_data;//temprovary processing data
  reg [63:0] mask;
  reg [63:0] fac_mem[0:1];
  reg [63:0] dummy0;
  reg [63:0] dummy1;
  reg [63:0] dummy2;
  
  
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
          dummy0<=64'd0;
          dummy1<=64'd0;
          dummy2<=64'd0;
          mask<=64'hffda_1234_daae_a339;
        end
      else
        begin
          mask <= {mask[62:0], mask[63] ^ mask[61]};
          temp_data<=data_in^mask;
          for (round = 0; round < 21; round = round + 1) 
            begin
              dummy0<=mask+dummy1;
              dummy1<=dummy2^dummy0;
              dummy2<=dummy1*temp_data;
              
              dummy2<=fac_mem[dummy2];
              fac_mem[dummy1]<=dummy0;
              
              
              for(i = 7; i >=0; i = i - 1)
             begin
               temp_data = temp_data - real_data;//sub enc data with original data
               temp_data = ~temp_data;//invert the data
               temp_data = temp_data ^ sliced_key[i];//xor data with keys
             end
            end

          dec_data_out<=temp_data^mask;
        end 
    end
endmodule
  