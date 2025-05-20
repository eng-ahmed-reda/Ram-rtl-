module Ram_tb();
reg clk,rst,wr_en,rd_en,blk_select;
reg [15:0]din;
reg [9:0]addr_rd,addr_wr;
wire [15:0]dout;
Ram m1(.clk(clk),.rst(rst),.wr_en(wr_en),.rd_en(rd_en),.blk_select(blk_select),.din(din),.dout(dout),.addr_rd(addr_rd),.addr_wr(addr_wr));
initial
begin
	clk=0;
	forever
	#1 clk= ~clk;
end
integer i;
initial 
begin
rst=1;
@(negedge clk);
rst=0;
	$readmemh ("mem.dat",m1.mem);
	rd_en=0;
	addr_rd=0;
	blk_select= 1;
	wr_en= 1;
	for (i=0; i<1024; i=i+1)
	begin
		din= i;
		addr_wr= i;
		@(negedge clk);
	end
	wr_en=0;
	addr_wr=0;
	rd_en=1;
	blk_select=1;
	for (i=0; i<1024; i=i+1)
	begin
		din= i;
		addr_rd= i;
		@(negedge clk);
	end
	$stop;
end
endmodule