module shiftLeft2(entrada,salida);
input wire [31:0] entrada; output reg [31:0]salida;
always@(*)
begin
salida <= entrada<<2;
end
endmodule
