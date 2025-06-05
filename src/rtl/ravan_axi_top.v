module ravan_axi_top(
  input clk,
  input rst,
  input mem_sel,
  input [63:0] data,
  input [511:0] key,
  input [15:0] address,			
  output sha_error_out,
  output wire [15:0]addr_to_mem,
  output reg [63:0] data_out,
  input awvalid, wvalid, bready, arvalid, rready,
  output reg awready, wready, bvalid, arready, rvalid
);

  reg sel;
  reg [1:0] wait_count;
  reg [15:0] addr;
  reg [63:0] data_in;
  wire [63:0] out_data;
  reg [511:0] key_m;
  

  RAVAN_TOP core (
    .clk(clk),
    .rst(rst),
    .mem_sel(mem_sel),
    .enc_op_sel(sel),
    .data_in(data_in),
    .key(key_m),
    .data_out(out_data),
    .sha_error(sha_error),
    .addr_to_mem(addr_to_mem)
  );

  reg [1:0] state;
  localparam IDEAL = 2'b00,
             WRITE = 2'b01,
             WAIT  = 2'b10,
             READ  = 2'b11;

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      sel <= 0;
      state <= IDEAL;
      awready <= 0;
      wready <= 0;
      bvalid <= 0;
      arready <= 0;
      rvalid <= 0;
      wait_count <= 0;
    end else begin
      // default deasserts
      awready <= 0;
      wready <= 0;
      arready <= 0;

      case (state)
        IDEAL: begin
          if (awvalid) awready <= 1;
          if (awvalid && awready) state <= WRITE;
        end

        WRITE: begin
          if (wvalid) wready <= 1;
          if (wvalid && wready) begin
            addr <= address;
            data_in <= data;
            key_m <= key;
            sel <= 1;
            bvalid <= 1;
            wait_count <= 2;
          end
          if (bready) begin
            bvalid <= 0;
            state <= WAIT;
          end
        end

        WAIT: begin
          if (wait_count == 0)
            state <= READ;
          else
            wait_count <= wait_count - 1;
        end

        READ: begin
          if (arvalid) arready <= 1;
          if (arvalid && arready) rvalid <= 1;

          if (rready) begin
            sel <= 0;
            data_out <= out_data;
            rvalid <= 0;
            state <= IDEAL;

          end
        end
      endcase
    end
  end

endmodule
