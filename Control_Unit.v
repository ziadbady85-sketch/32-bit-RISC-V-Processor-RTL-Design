module Control_Unit #(parameter w = 32 )(
	input [w-1:0] CON_IN ,
	output reg wr_en , ALU_scr , mem_re , mem_wr ,
	output reg mem_2_reg , branch ,
	output [6:0] ALU_OP ,
	output reg [2:0] OP ,
	output reg [1:0] Imme_Tybe) ;


localparam ADD = 7'b0000000 ;
localparam SUB = 7'b0000001 ;
localparam LW  = 7'b0000010 ;
localparam SW  = 7'b0000011 ;

assign ALU_OP = CON_IN[6:0] ;

always @(*) begin
	case (ALU_OP)
	  ADD : begin
	  	wr_en     = 1 ;
	  	OP        = 0 ;
	  	ALU_scr   = 0 ;
	  	mem_re    = 0 ;
	  	mem_wr    = 0 ;
	  	mem_2_reg = 0 ;
	  	branch    = 0 ;
	  	Imme_Tybe = 0 ;
	  end

	  SUB : begin
	  	wr_en     = 1 ;
	  	OP        = 1 ;
	  	ALU_scr   = 0 ;
	  	mem_re    = 0 ;
	  	mem_wr    = 0 ;
	  	mem_2_reg = 0 ;
	  	branch    = 0 ;
	  	Imme_Tybe = 1 ;
	  end

	  LW : begin
	  	wr_en     = 1 ;
	  	OP        = 0 ;
	  	ALU_scr   = 1 ;
	  	mem_re    = 1 ;
	  	mem_wr    = 0 ;
	  	mem_2_reg = 1 ;
	  	branch    = 0 ;
	  	Imme_Tybe = 2 ;
	  end

	  SW : begin
	  	wr_en     = 0 ;
	  	OP        = 1 ;
	  	ALU_scr   = 1 ;
	  	mem_re    = 0 ;
	  	mem_wr    = 1 ;
	  	branch    = 0 ;
	  	Imme_Tybe = 3 ;
	  end

	  default : begin
	  	wr_en     = 0 ;
	  	OP        = 0 ;
	  	ALU_scr   = 0 ;
	  	mem_re    = 0 ;
	  	mem_wr    = 0 ;
	  	mem_2_reg = 0 ;
	  	branch    = 0 ;
	  	Imme_Tybe = 0 ;
	  end
	endcase
end
endmodule