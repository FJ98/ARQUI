module signExtended(entrada,salida);
input wire[15:0]entrada;
output reg [31:0]salida;
always @(*)
begin
	salida[0]<=entrada[0];
	salida[1]<=entrada[1];
	salida[2]<=entrada[2];
	salida[3]<=entrada[3];
	salida[4]<=entrada[4];
	salida[5]<=entrada[5];
	salida[6]<=entrada[6];
	salida[7]<=entrada[7];
	salida[8]<=entrada[8];
	salida[9]<=entrada[9];	
	salida[10]<=entrada[10];
	salida[11]<=entrada[11];
	salida[12]<=entrada[12];
	salida[13]<=entrada[13];
	salida[14]<=entrada[14];
	salida[15]<=entrada[15];
	
	if(entrada[15]==1)begin
		salida[16]<=1;	
		salida[17]<=1;
		salida[18]<=1;
		salida[19]<=1;
		salida[20]<=1;
		salida[21]<=1;
		salida[22]<=1;
		salida[23]<=1;
		salida[24]<=1;
		salida[25]<=1;
		salida[26]<=1;
		salida[27]<=1;
		salida[28]<=1;
		salida[29]<=1;
		salida[30]<=1;
		salida[31]<=1;
	end
	else begin
		salida[16]<=0;	
		salida[17]<=0;
		salida[18]<=0;
		salida[19]<=0;
		salida[20]<=0;
		salida[21]<=0;
		salida[22]<=0;
		salida[23]<=0;
		salida[24]<=0;
		salida[25]<=0;
		salida[26]<=0;
		salida[27]<=0;
		salida[28]<=0;
		salida[29]<=0;
		salida[30]<=0;
		salida[31]<=0;
	end
end
endmodule