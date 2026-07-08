module ALU_Control(
	input [1:0] ALU_OP ,
	input [2:0] funct3 ,
	input [6:0] funct7 ,
	output reg [2:0] OP) ;

always @(*) begin
	case (ALU_OP)
	  2'b00 : OP = 3'b000 ;
	  2'b01 : OP = 3'b001 ;
	  2'b10 : begin
	  	case (funct3)
	  	  3'b000 : begin
	  	  	if (funct7 == 7'b0100000) begin
	  	  		OP = 3'b001 ;
	  	  	end
	  	  	else begin
	  	  		OP = 3'b000 ;
	  	  	end
	  	  end
	  	  3'b111 : OP = 3'b010 ;
	  	  3'b110 : OP = 3'b011 ;
	  	  3'b100 : OP = 3'b100 ;
	  	  3'b010 : OP = 3'b101 ;
	  	  default : OP = 3'b000 ;
	  	endcase
	  end
	  default : OP = 3'b000 ;
	endcase
end

endmodule
