module AND(branch,zero,salida);
input wire branch, zero;
output wire salida; 
assign salida=branch & zero;
endmodule
