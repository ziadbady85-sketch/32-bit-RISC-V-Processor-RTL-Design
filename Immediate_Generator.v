module Immediate_Generator #(parameter w = 32)(
	input [31:0] Imme_IN ,
	input [1:0] Imme_Tybe ,
	output reg [31:0] Immediate) ;

localparam I_TYPE = 2'b01 ;
localparam S_TYPE = 2'b10 ;
localparam B_TYPE = 2'b11 ; 


always @(*) begin
	case (Imme_Tybe)
	  I_TYPE : Immediate = {{20{Imme_IN[31]}} , Imme_IN[31:20]} ;
	  S_TYPE : Immediate = {{20{Imme_IN[31]}} , Imme_IN[31:25] , Imme_IN[11:7]} ;
	  B_TYPE : Immediate = {{19{Imme_IN[31]}} , Imme_IN[7] , Imme_IN[30:25] , Imme_IN[11:8], 1'b0} ;
      default: Immediate = 0 ;
    endcase
end

endmodule