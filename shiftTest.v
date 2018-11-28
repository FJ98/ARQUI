module test_bench_shift();
reg[25:0] entrada_shift;
wire[31:0] salida_shift;
wire[31:0] salida_shift_2;
reg[31:0] entrada_shift_2;

shift #(.W(26)) jump_shifter(.entrada(entrada_shift),
			     .salida(salida_shift));
shift #(.W(32)) jump_shifter_2(.entrada(entrada_shift_2),
			     .salida(salida_shift_2));


initial
begin
entrada_shift = 26'h23;
#5 $display("%h resultado de salida",salida_shift);

entrada_shift_2 = 32'h4f;
#5 $display("%h resultado de salida",salida_shift_2);

entrada_shift_2 = 32'h1;
#5 $display("%h resultado de salida",salida_shift_2);
end

endmodule
