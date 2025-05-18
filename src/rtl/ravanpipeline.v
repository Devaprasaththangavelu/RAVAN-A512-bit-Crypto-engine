module pipeline(
  input clk,rst,
  input [511:0]key,
  output reg [511:0]hashkey,
  output sha_error
);
  reg cs,we;
  reg [7:0]addr;
  reg [31:0] wr_data;
  reg [31:0] rd_data;
  reg [31:0] mk[15:0];
  reg [31:0] hk[15:0];
  reg [3:0] key_4;
  reg [31:0]custkey;

  
  assign key_4=key[3:0];
    
  sha256 hash_unit (
    .clk(clk),
    .reset_n(rst),
    .cs(cs),
    .we(we),
    .address(addr),
    .write_data(wr_data),
    .read_data(rd_data),
    .error(sha_error)
  );
  
  custom32 u5dut(
    .clk(clk),
    .key(key_4),
    .custkey(custkey)
  );
  
  reg [3:0] sel;         // 0 to 15
  reg [2:0] state;

localparam IDLE  = 3'b000;
localparam WRITE = 3'b001;
localparam WAIT  = 3'b010;
localparam READ  = 3'b011;
localparam DONE  = 3'b100;
  reg [1:0] wait_count;
  
  assign mk[15]=custkey;
  integer i;

 always @(posedge clk or posedge rst) begin
  if (rst) begin
    sel      <= 0;
    cs       <= 0;
    we       <= 0;
    addr     <= 0;
    state    <= IDLE;
    wait_count <= 0;
  end else begin
    case (state)
      IDLE: begin
        cs <= 1;
        we <= 1;
        addr <= sel;
        wr_data <= mk[sel];
        state <= WRITE;
      end

      WRITE: begin
        we <= 0;
        wait_count <= 2; // e.g., 2-cycle wait for SHA to respond
        state <= WAIT;
      end

      WAIT: begin
        if (wait_count == 0) begin
          state <= READ;
        end else begin
          wait_count <= wait_count - 1;
        end
      end

      READ: begin
        hk[sel] <= rd_data;
        if (sel == 4'd15) begin
          state <= DONE;
        end else begin
          sel <= sel + 1;
          state <= IDLE;
        end
      end

      DONE: begin
        cs <= 0;
        // Do nothing or raise a 'done' signal
      end
    endcase
  end
   if (state == DONE) begin
    for (i = 0; i < 16; i = i + 1) begin
      hashkey[i*32 +: 32] = hk[i];
    end
  end else begin
    hashkey = 512'd0;
  end
end
endmodule
  
            
  