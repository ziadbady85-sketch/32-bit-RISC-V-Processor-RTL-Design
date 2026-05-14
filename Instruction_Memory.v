module Instruction_Memory #(parameter w = 32 ,
	                        parameter d = 64) (
	input clk , rst ,
	input [w-1:0] INST_IN ,
	output reg [w-1:0] INST_OUT) ;

reg [w-1:0] INST_MEM [d-1:0] ;

integer i ;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		for (i = 0 ; i < d ; i = i + 1) begin
			INST_MEM[i] <= 0 ;
		end
		
	end
	else  begin
		INST_OUT <= INST_MEM[INST_IN >> 2] ;
	end
end

endmodule
