module Adder_1 #(parameter w = 32)(
	input [w-1:0] PC_IN ,
	output [w-1:0] out) ;

assign out = PC_IN + 4 ;

endmodule
