module ALU(control, dato1, dato2, zero, exit);
input [2:0] control;
input [31:0] dato1,dato2;
output reg zero;
output reg [31:0] exit;
always@(*)
begin 
	case(control)
	  3'b000:
	  begin
		exit <= dato1 & dato2;
	  end
	  3'b001:
	  begin
		exit <= dato1 | dato2;
	  end
	  3'b010:
	  begin
		exit <= dato1 + dato2;
	  end
	  3'b110:
	  begin
		exit <= dato1 - dato2;
	  end
	  3'b011:
	  begin
		exit <= dato1 ~^ dato2;
	  end
	  3'b111:
	  begin
		if(dato1 < dato2)
		begin
			exit <= 1;
		  end
		else
		  begin
			exit <= 0;
		  end
	  end	  
	endcase
	$display("entrada de dato 1: %d",dato1);
	$display("entrada de dato 2: %d",dato2);
	$display("entrada de control: %b",control);
	$display("valor que sale de operacion: %d",exit);
end
endmodule

