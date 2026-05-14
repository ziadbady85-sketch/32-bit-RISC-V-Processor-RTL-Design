module Data_Memory #(parameter w = 32 ,
	                 parameter d = 1024)(
	input clk , rst , mem_re , mem_wr ,
	input [w-1:0] Address , data_in ,
	output reg [w-1:0] Re_data) ;

reg [w-1:0] MEM [d-1:0] ;

integer i ;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		for (i = 0 ; i < d ; i = i + 1) begin
			MEM[i] <= 0 ;
		end
		
	end
	else begin
	 if (mem_re) begin
		Re_data <= MEM[Address >> 2] ;
	 end
	 if (mem_wr) begin
		MEM[Address >> 2] <= data_in ;
	 end
    end
end

endmodule
