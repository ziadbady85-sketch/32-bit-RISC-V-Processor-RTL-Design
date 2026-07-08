`timescale 1ns/1ps

module tb_RISC_V ;

reg clk ;
reg rst ;
reg [31:0] data_in ;

wire [31:0] Data_Out ;
wire mem_re ;
wire mem_wr ;

integer cycle ;
integer pass ;

reg [31:0] exec_pc ;
reg [31:0] exec_inst ;
reg [31:0] exec_alu ;
reg [31:0] exec_wb ;
reg [31:0] exec_mem_data ;
reg [31:0] exec_rs2_data ;
reg exec_zero ;
reg exec_wr_en ;
reg exec_mem_re ;
reg exec_mem_wr ;
reg [4:0] exec_rd ;

RISC_V DUT (
	.clk(clk),
	.rst(rst),
	.data_in(data_in),
	.Data_Out(Data_Out),
	.mem_re(mem_re),
	.mem_wr(mem_wr)
) ;

function [8*8-1:0] inst_name ;
	input [31:0] inst ;
	begin
		case (inst[6:0])
		  7'b0110011 : begin
		  	case (inst[14:12])
		  	  3'b000 : begin
		  	  	if (inst[31:25] == 7'b0100000) inst_name = "SUB" ;
		  	  	else inst_name = "ADD" ;
		  	  end
		  	  3'b111 : inst_name = "AND" ;
		  	  3'b110 : inst_name = "OR" ;
		  	  3'b100 : inst_name = "XOR" ;
		  	  3'b010 : inst_name = "SLT" ;
		  	  default : inst_name = "R_TYPE" ;
		  	endcase
		  end
		  7'b0010011 : inst_name = "ADDI" ;
		  7'b0000011 : inst_name = "LW" ;
		  7'b0100011 : inst_name = "SW" ;
		  7'b1100011 : inst_name = "BEQ" ;
		  default : inst_name = "NOP" ;
		endcase
	end
endfunction

initial begin
	clk = 0 ;
	forever #5 clk = ~clk ;
end

initial begin
	$dumpfile("dump.vcd") ;
	$dumpvars(0 , tb_RISC_V) ;
	$readmemh("program.mem" , DUT.M2.INST_MEM) ;

	rst = 1 ;
	data_in = 0 ;
	cycle = 0 ;
	pass = 1 ;

	$display("========================================") ;
	$display("RISC-V single-cycle simulation started") ;
	$display("========================================") ;

	#12 ;
	rst = 0 ;
end

always @(posedge clk) begin
	if (rst) begin
		$display("[%0t] Reset active" , $time) ;
	end
	else begin
		cycle = cycle + 1 ;
		exec_pc = DUT.PC_OUT ;
		exec_inst = DUT.INST_OUT ;
		exec_alu = DUT.ALU_OUT ;
		exec_wb = Data_Out ;
		exec_mem_data = DUT.Re_data ;
		exec_rs2_data = DUT.re_data_2 ;
		exec_zero = DUT.ZERO ;
		exec_wr_en = DUT.wr_en ;
		exec_mem_re = mem_re ;
		exec_mem_wr = mem_wr ;
		exec_rd = DUT.INST_OUT[11:7] ;
		#1 ;
		$display("[%0t] Cycle=%0d PC=%h INST=%h %-8s ALU=%h ZERO=%b WB=%h" ,
		         $time , cycle , exec_pc , exec_inst , inst_name(exec_inst) ,
		         exec_alu , exec_zero , exec_wb) ;

		if (exec_wr_en && (exec_rd != 0)) begin
			$display("         REG_WRITE  x%0d <= %h" , exec_rd , exec_wb) ;
		end

		if (exec_mem_re) begin
			$display("         MEM_READ   addr=%h data=%h" , exec_alu , exec_mem_data) ;
		end

		if (exec_mem_wr) begin
			$display("         MEM_WRITE  addr=%h data=%h" , exec_alu , exec_rs2_data) ;
		end

		if (cycle == 22) begin
			$display("========================================") ;
			$display("Checking final architectural state") ;

			if (DUT.M3.FILE[0]  !== 32'd0)  pass = 0 ;
			if (DUT.M3.FILE[1]  !== 32'd10) pass = 0 ;
			if (DUT.M3.FILE[2]  !== 32'd3)  pass = 0 ;
			if (DUT.M3.FILE[3]  !== 32'd13) pass = 0 ;
			if (DUT.M3.FILE[4]  !== 32'd7)  pass = 0 ;
			if (DUT.M3.FILE[5]  !== 32'd2)  pass = 0 ;
			if (DUT.M3.FILE[6]  !== 32'd11) pass = 0 ;
			if (DUT.M3.FILE[7]  !== 32'd9)  pass = 0 ;
			if (DUT.M3.FILE[8]  !== 32'd1)  pass = 0 ;
			if (DUT.M3.FILE[9]  !== 32'd13) pass = 0 ;
			if (DUT.M3.FILE[10] !== 32'd0)  pass = 0 ;
			if (DUT.M3.FILE[11] !== 32'd55) pass = 0 ;
			if (DUT.M3.FILE[12] !== 32'd77) pass = 0 ;
			if (DUT.M3.FILE[13] !== 32'd88) pass = 0 ;
			if (DUT.M6.MEM[0]   !== 32'd13) pass = 0 ;

			if (pass) begin
				$display("TEST PASSED") ;
			end
			else begin
				$display("TEST FAILED") ;
			end

			$display("Simulation finished") ;
			$display("========================================") ;
			$finish ;
		end
	end
end

endmodule
