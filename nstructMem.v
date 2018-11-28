module instruction_memory(clock,direccion,salida);
input wire clock;
input [31:0]direccion;
output wire[31:0]salida;
reg [7:0] memo [0:255];
initial begin
$readmemh("instructLw.txt",memo);
end
assign salida = {memo[direccion],memo[direccion+1],memo[direccion+2],memo[direccion+3]};	
always@(posedge clock)
begin
	$display("%d",direccion);	
	$display("Salida -> %b ",salida);
end
endmodule
