module ALU #(parameter w = 32)(
	input [w-1:0] IN_1 , IN_2 ,
	input [2:0] OP ,
	output reg [w-1:0] ALU_OUT ,
	output ZERO) ;

always @(*) begin
	case (OP) 
	  0 : ALU_OUT = IN_1 + IN_2          ;
	  1 : ALU_OUT = IN_1 - IN_2          ;
	  2 : ALU_OUT = IN_1 & IN_2          ;
	  3 : ALU_OUT = IN_1 | IN_2          ;
	  4 : ALU_OUT = IN_1 ^ IN_2          ;
	  5 : ALU_OUT = (IN_1 < IN_2)? 1 : 0 ;
	  default : ALU_OUT = 0              ;
    endcase
end 

assign ZERO = (ALU_OUT==0)? 1 : 0 ;

endmodule