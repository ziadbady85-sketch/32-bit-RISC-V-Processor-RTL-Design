module Control_Unit #(parameter w = 32 )(
	input [w-1:0] CON_IN ,
	output reg wr_en , ALU_scr , mem_re , mem_wr ,
	output reg mem_2_reg , branch ,
	output reg [1:0] ALU_OP ,
	output reg [1:0] Imme_Tybe) ;

localparam R_TYPE = 7'b0110011 ;
localparam I_TYPE = 7'b0010011 ;
localparam LW     = 7'b0000011 ;
localparam SW     = 7'b0100011 ;
localparam BEQ    = 7'b1100011 ;

always @(*) begin
	wr_en     = 0 ;
	ALU_scr   = 0 ;
	mem_re    = 0 ;
	mem_wr    = 0 ;
	mem_2_reg = 0 ;
	branch    = 0 ;
	ALU_OP    = 0 ;
	Imme_Tybe = 0 ;

	case (CON_IN[6:0])
	  R_TYPE : begin
	  	wr_en     = 1 ;
	  	ALU_scr   = 0 ;
	  	ALU_OP    = 2'b10 ;
	  end

	  I_TYPE : begin
	  	wr_en     = 1 ;
	  	ALU_scr   = 1 ;
	  	ALU_OP    = 2'b00 ;
	  	Imme_Tybe = 2'b01 ;
	  end

	  LW : begin
	  	wr_en     = 1 ;
	  	ALU_scr   = 1 ;
	  	mem_re    = 1 ;
	  	mem_2_reg = 1 ;
	  	ALU_OP    = 2'b00 ;
	  	Imme_Tybe = 2'b01 ;
	  end

	  SW : begin
	  	ALU_scr   = 1 ;
	  	mem_wr    = 1 ;
	  	ALU_OP    = 2'b00 ;
	  	Imme_Tybe = 2'b10 ;
	  end

	  BEQ : begin
	  	branch    = 1 ;
	  	ALU_OP    = 2'b01 ;
	  	Imme_Tybe = 2'b11 ;
	  end
	endcase
end

endmodule
