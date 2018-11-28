module mux#(parameter W = 32)(input selector, input [W-1:0] entrada0, input [W-1:0] entrada1, output reg [W-1:0]salida);

always@(*)
begin	
	if(selector)begin
		salida <= entrada1;
		end
	else begin
		salida <= entrada0;
		end
end
endmodule

