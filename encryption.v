module RAVAN_encryption(
  input [63:0]data_in,
  input clk,rst,
  input [511:0] key,
  output reg[63:0] enc_data_out
);
  wire [63:0] sliced_key [7:0];//dynamic key slicing
  reg [63:0] temp_data;//temprovary processing data
  
  DynamicKeySlicer key_slicing(//dynamic key slicing instance
    .key(key),
    .sliced_key(sliced_key)
  );
  
  integer i;// for sliced key 
  integer round;
  
  always @(posedge clk)
    begin
      if(rst)
        begin
          enc_data_out<=64'd0;
          temp_data<=64'd0;
        end
      else
        begin
          temp_data<=data_in;
          for (round = 0; round < 21; round = round + 1)
            begin
          
              for(i=0;i<8;i=i+1)
               begin
                 temp_data=(temp_data^sliced_key[i]);//for 8 sliced keys
                 temp_data=~temp_data;// invert temprovary data
                 temp_data=temp_data+data_in;// add temp data with real data
                 
               end
            end
          enc_data_out<=temp_data;
        end 
    end
endmodule
  