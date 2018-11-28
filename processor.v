module testProcessorR();
reg [31:0]adder_pc_in = 32'h00000004;
wire [31:0]pc_in;
wire [31:0] pc_out;
wire [31:0]instruction_out;
wire RegDst,Jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
wire [1:0]tipols;
wire [2:0]ALUOp;
wire [4:0]mux_reg;
wire [31:0]Reg_out1,Reg_out2;
wire [31:0]Sign_out;
wire [31:0]mux_alu_out;
wire [2:0]Alu_control_out;
wire alu_zero;
reg clock;
wire [31:0]Alu_out;
wire [31:0]memory_out;
wire [31:0]mux_mem_out;
wire [31:0]adder_pc_out;
wire [31:0]shift_adder_out;
wire [31:0]shift_sign_out;
wire [31:0]adder_alu_out;
wire and_branch_zero;
wire [31:0]mux_adder_out;

program_counter pc(.entrada(pc_in),.clock(clock),.salida(pc_out));

instruction_memory ins_mem(.clock(clock),.direccion(pc_out),.salida(instruction_out));



Control cont(.entrada(instruction_out[31:26]),.tipols(tipols),.RegDst(RegDst),.Jump(Jump),.Branch(Branch),
			 .MemRead(MemRead),.ALUOp(ALUOp),.MemtoReg(MemtoReg),.MemWrite(MemWrite),.AluSrc(ALUSrc),
			 .RegWrite(RegWrite));

mux #(.W(5)) mux_regis(.selector(RegDst),.in_0(instruction_out[20:16]),.in_1(instruction_out[15:11]),
						 .out(mux_reg)); 
			 
			 
register registro(.read_reg1(instruction_out[25:21]),.read_reg2(instruction_out[20:16]),.write_reg(mux_reg),
				  .write_data(mux_mem_out),.RegWrite(RegWrite),.clock(clock),.read_data1(Reg_out1),.read_data2(Reg_out2));



				  
signExtended extender(.entrada(instruction_out[15:0]),.salida(Sign_out));

ALUCONTROL al_control(.clk(clock),.ALUOP(ALUOp),.Funct(instruction_out[5:0]),.Alucontrol(Alu_control_out));

mux #(.W(32)) mux_alu (.selector(ALUSrc),.in_0(Reg_out2),.in_1(Sign_out),.out(mux_alu_out));

ALU alu (.control(Alu_control_out),.dato1(Reg_out1),.dato2(mux_alu_out),.exit(Alu_out),.zero(alu_zero));

DataMemory memory(.Address(Alu_out),.WriteData(Reg_out2),.tipols(tipols),.MemRead(MemRead),.MemWrite(MemWrite),.clock(clock),.ReadData(memory_out));

mux #(.W(32)) mux_mem (.selector(MemtoReg),.in_0(Alu_out),.in_1(memory_out),.out(mux_mem_out));

Add adder_pc(.entrada1(pc_out),.entrada2(adder_pc_in),.salida(adder_pc_out));

shift_28 shift_adder(.entrada(instruction_out[25:0]),.salida(shift_adder_out));

assign shift_adder_out = {adder_pc_out[31:28],shift_adder_out[27:0]};

shift_32 shift_left(.entrada(Sign_out),.salida(shift_sign_out));

Add Alu_result (.entrada1(adder_pc_out),.entrada2(shift_sign_out),.salida(adder_alu_out));

assign and_branch_zero = Branch & alu_zero;

mux #(.W(32)) mux_adder (.selector(and_branch_zero),.in_0(adder_pc_out),.in_1(adder_alu_out),.out(mux_adder_out));

mux #(.W(32)) mux_jump (.selector(Jump),.in_0(mux_adder_out),.in_1(shift_adder_out),.out(pc_in));

initial begin
	#10 clock = 1;
	$display("1ERA INSTRUT 11111111\n\n\n\n");	
	#10 clock = 0;
	$display("2DA INSTRUCT 22222222\n\n\n\n");
	#10 clock = 1;
	     
	#10 clock = 0;
		$display("3ERA INSTRUCT 333333333\n\n\n\n");
	#10 clock = 1;

	#10 clock = 0;
		$display("4TA INSTRUCT 4444444444\n\n\n\n");
	#10 clock = 1;

	#10 clock = 0;
	$display("5TA INSTRUCT 555555555\n\n\n\n");
	#10 clock = 1;
	
	#10 clock = 0;
	$display("6TA INSTRUCT 666666666666\n\n\n\n");
	#10 clock = 1;
	
	#10 clock = 0;
		$display("7MA INSTRUCT 7777777777\n\n\n\n");
	#10 clock = 1;

	#10 clock = 0;
	$display("8VA INSTRUCT 8888888888\n\n\n\n");
	#10 clock = 1;
	
	#10 clock = 0;
		$display("9NA INSTRUCT 999999999999\n\n\n\n");
	#10 clock = 1;

	#10 clock = 0;
		$display("10MA INSTRUCT AAAAAAAAAAAAAA\n\n\n\n");
	#10 clock = 1;

	#10 clock = 0;
		$display("ONCEAVAAAAA INSTRUCCION BBBBBBBBBBBBBB\n\n\n\n");
		#10 clock = 1;

	#10 clock = 0;
		$display("DECIMOSEGUNDA INSTRUCCION CCCCCCCCCCCCC\n\n\n\n");
	#10 clock = 1;
		
	#10 clock = 0;
		$display("ONCEAVAAAAA INSTRUCCION BBBBBBBBBBBBBB\n\n\n\n");
		#10 clock = 1;

	#10 clock = 0;
		$display("DECIMOSEGUNDA INSTRUCCION CCCCCCCCCCCCC\n\n\n\n");
	#10 clock = 1;
		
	#10 clock = 0;
	$display("DECIMO TERCERAAAAAAAA INSTRUCCION DDDDDDDDDDD\n\n\n\n");
		#10 clock = 1;

	#10 clock = 0;
		$display("DECIMO CUARTA INSTRUCCION EEEEEEEEEEE\n\n\n\n");
	#10 clock = 1;
		
	#10 clock = 0;	
end
endmodule

