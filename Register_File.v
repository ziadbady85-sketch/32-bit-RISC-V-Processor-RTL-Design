module Register_File #(parameter w = 32 ,
	                   parameter d = 32 )(
	input clk , rst , wr_en ,
	input [w-1:0] data_in ,
	input [4:0] wr_addr , r_addr_1 , r_addr_2 ,
	output [w-1:0] re_data_1 , re_data_2  ) ;

reg [w-1:0] FILE [d-1:0] ;

integer i ;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		for (i = 0 ; i < d ; i = i + 1) begin
			FILE[i] <= 0 ;
		end
	end
	else begin
		FILE[0] <= 0 ;
		if (wr_en && (wr_addr != 0)) begin
			FILE[wr_addr] <= data_in ;
		end
	end
end

assign re_data_1 = (r_addr_1 == 0)? 0 : FILE[r_addr_1] ;
assign re_data_2 = (r_addr_2 == 0)? 0 : FILE[r_addr_2] ;

endmodule
