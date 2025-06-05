module RAVAN_decryption(
  input [63:0]data_in,
  input [63:0]real_data,
  input clk,rst,
  input [511:0] key,
  output reg[63:0] dec_data_out
);
  wire [63:0] sliced_key [7:0];//dynamic key slicing
  reg [63:0] temp_data;//temprovary processing data
  reg [63:0] mask;
  reg [63:0] fac_mem[0:1];
  reg [63:0] dummy0;
  reg [63:0] dummy1;
  reg [63:0] dummy2;
  wire [63:0]key0;
  wire [63:0]key1;
  wire [63:0]key2;
  wire [63:0]key3;
  wire [63:0]key4;
  wire [63:0]key5;
  wire [63:0]key6;
  wire [63:0]key7;


  
  DynamicKeySlicer key_slicing(//dynamic key slicing instance
    .key(key),
    .sliced_key1(key0),
    .sliced_key2(key1),
    .sliced_key3(key2),
    .sliced_key4(key3),
    .sliced_key5(key4),
    .sliced_key6(key5),
    .sliced_key7(key6),
    .sliced_key8(key7)
  );
assign sliced_key[0]=key0;
assign sliced_key[1]=key1;
assign sliced_key[2]=key2;
assign sliced_key[3]=key3;
assign sliced_key[4]=key4;
assign sliced_key[5]=key5;
assign sliced_key[6]=key6;
assign sliced_key[7]=key7;

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
  