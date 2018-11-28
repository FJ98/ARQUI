module program_counter(input reg[31:0] entrada, input wire clock, output reg[31:0] salida);

reg validar;

initial begin

	salida = 0;
	validar = 0;

end

always @(posedge clock)
begin

	if(validar == 1)
	begin
	salida = entrada;
	end
	else if(validar ==0)
	begin
	salida = 0;
	validar = 1;
	end
	
end

endmodule

