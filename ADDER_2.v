module Adder_2 #(parameter w = 32)(
	input [w-1:0] PC_IN ,
	input [w-1:0] immediate ,
	output [w-1:0] out) ;

assign out = PC_IN + immediate ;

endmodule

