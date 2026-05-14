module MUX #(parameter w =32)(
	input [w-1:0] A , B ,
	input sel ,
	output [w-1:0] out) ;

assign out = (sel)? A : B ;

endmodule
