module counter(
  input clk,rst,
  output reg[29:0] count
);
  always @(posedge clk)
    begin
      if(rst)
        begin
          count<=0;
        end
      else
        begin
          count<=count+1;
        end
    end
endmodule