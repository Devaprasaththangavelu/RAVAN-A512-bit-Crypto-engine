module memory(
  input clk,rst,rd_wr,
  input [63:0]data,
  input [15:0]address,
  output reg [63:0]out_data
);
  reg [63:0]mem[0:65535];
  
  always @(posedge clk )
    begin
      if(rst)
        begin
          mem[address]<=64'h00000000;
        end
      else if(rd_wr)//write operation
        begin
          mem[address]<=data;
        end
      else
        begin
          out_data<=mem[address];
        end
    end
endmodule