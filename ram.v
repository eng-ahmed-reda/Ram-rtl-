module Ram (din,dout,wr_en,rd_en,blk_select,addr_rd,addr_wr,rst,clk);
input clk,rst,wr_en,rd_en,blk_select;
parameter MEM_WIDTH= 16;
parameter MEM_DEPTH= 1024;
parameter ADDR_SIZE= 10;
input [MEM_WIDTH-1:0]din;
input [ADDR_SIZE-1:0]addr_rd,addr_wr;
output reg [MEM_WIDTH-1:0]dout;
reg [MEM_WIDTH-1:0]mem[MEM_DEPTH-1:0];
always @(posedge clk) begin
	if (rst) begin
		dout<= 0;
	end
	else begin 
	if (blk_select) begin
		if (wr_en) begin
			mem[addr_wr]<=din;
		end
		if (rd_en) begin
			dout<=mem[addr_rd];
		end
	end
	end
end
endmodule
