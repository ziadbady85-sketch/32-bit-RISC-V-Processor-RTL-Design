module Instruction_Memory #(parameter w = 32 ,
	                        parameter d = 64) (
	input clk , rst ,
	input [w-1:0] INST_IN ,
	output [w-1:0] INST_OUT) ;

reg [w-1:0] INST_MEM [d-1:0] ;

integer i ;

initial begin
	for (i = 0 ; i < d ; i = i + 1) begin
		INST_MEM[i] = 0 ;
	end
	$readmemh("program.mem" , INST_MEM) ;
end

assign INST_OUT = INST_MEM[INST_IN >> 2] ;

endmodule
