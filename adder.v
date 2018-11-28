
module Add(input wire [31:0] entrada1,entrada2,output reg [31:0] salida);

always@(*)
begin

	salida <= entrada1+entrada2;

end

endmodule