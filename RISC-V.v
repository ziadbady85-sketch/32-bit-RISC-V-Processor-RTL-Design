module RISC_V #(parameter w = 32 ,
	            parameter d = 64 ,
	            parameter b = 5  ,
	            parameter m = 1024)(
	input clk , rst , 
	input [w-1:0] data_in ,
	output [w-1:0] Data_Out ,
	output mem_re , mem_wr) ;

// pc
wire [w-1:0] PC_OUT ;
// instruction
wire [w-1:0] INST_OUT ;
// reg_file
wire [w-1:0] re_data_1 , re_data_2	  ;
wire wr_en ;
// alu
wire [2:0] OP ;
wire [w-1:0] ALU_OUT ;
wire ZERO ;    
// control units
wire  ALU_scr ;
wire mem_2_reg , branch ;
wire [c-1:0] ALU_OP ;
wire [1:0] Imme_Tybe ;
// data memory
wire [w-1:0] Re_data ;
// Immediate generator
wire [31:0] Immediate ;
// adders
wire [w-1:0] out_1 , out_2 ;
// muxs
wire [w-1:0] out_adder , out_reg_file ;

wire A_2_sel ;
assign A_2_sel = branch & ZERO ;

PC #(.w(w)) M1 (.clk(clk),.rst(rst),.PC_IN(out_adder),.PC_OUT(PC_OUT)) ;
Instruction_Memory #(.w(w),.d(d)) M2 (.clk(clk),.rst(rst),.INST_IN(PC_OUT),.INST_OUT(INST_OUT)) ;
Register_File #(.w(w),.d(b)) M3 (.clk(clk),.rst(rst),.data_in(Data_Out),.wr_en(wr_en),.wr_addr(INST_OUT[11:7]),.r_addr_1(INST_OUT[19:15]),.r_addr_2(INST_OUT[24:20]),.re_data_1(re_data_1),.re_data_2(re_data_2)) ;
ALU #(.w(w)) M4 (.IN_1(re_data_1),.IN_2(out_reg_file),.OP(OP),.ALU_OUT(ALU_OUT),.ZERO(ZERO)) ;
Control_Unit #(.w(w)) M5 (.CON_IN(INST_OUT),.wr_en(wr_en),.ALU_scr(ALU_scr),.mem_2_reg(mem_2_reg),.branch(branch),.ALU_OP(ALU_OP),.Imme_Tybe(Imme_Tybe),.mem_re(mem_re),.mem_wr(mem_wr)) ;
Data_Memory #(.w(w),.d(m)) M6 (.clk(clk),.rst(rst),.mem_re(mem_re),.mem_wr(mem_wr),.Address(ALU_OUT),.data_in(re_data_2),.Re_data(Re_data)) ;
Immediate_Generator #(.w(w)) M7 (.Imme_IN(INST_OUT),.Imme_Tybe(Imme_Tybe),.Immediate(Immediate)) ;
Adder_1 #(.w(w)) M8 (.PC_IN(PC_OUT),.out(out_1)) ;
Adder_2 #(.w(w)) M9 (.PC_IN(PC_OUT),.Immediate(Immediate),.out(out_2)) ;
MUX #(.w(w)) MA (.A(out_2),.B(out_1),.sel(A_2_sel),.out(out_adder)) ;
MUX #(.w(w)) MB (.A(Immediate),.B(re_data_2),.sel(ALU_scr),.out(out_reg_file)) ;
MUX #(.w(w)) MC (.A(Re_data),.B(ALU_OUT),.sel(mem_2_reg),.out(Data_Out)) ;

endmodule


