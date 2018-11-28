module shift28(entrada,salida);
input wire [25:0] entrada; 
output reg [31:0]salida;
reg [3:0]juntar = 4'b0000;
always@(*)
begin
salida = entrada<<2;
salida = {juntar,salida};
end
endmodule

