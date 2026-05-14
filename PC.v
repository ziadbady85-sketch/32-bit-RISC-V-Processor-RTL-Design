module PC #(parameter w = 32)(
	input clk , rst , 
	input [w-1:0] PC_IN ,
	output reg [w-1:0] PC_OUT);

always @(posedge clk or posedge rst) begin
	if (rst) begin
		PC_OUT <= 0 ;
		
	end
	else begin
		PC_OUT <= PC_IN ;
	end
end

endmodule
