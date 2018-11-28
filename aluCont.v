module ALUCONTROL(clk, ALUOP, Funct, Alucontrol);
input clk;
input [2:0] ALUOP;
input [5:0] Funct;
output reg [2:0] Alucontrol;
  always@(ALUOP)
  begin
	  begin
	  Alucontrol = 3'bxxx;
	  end
      case(ALUOP)
	    3'b000:
		  begin
		    Alucontrol <= 3'b010;
	      end
        3'b001:
          begin
            Alucontrol <= 3'b110;
          end
		 3'b010:
          begin
            Alucontrol <= 3'b000;
          end
		  3'b011:
          begin
            Alucontrol <= 3'b001;
          end
		  3'b111:
          begin
            Alucontrol <= 3'b111;
          end
		  
		3'b1xx:
          begin
            if(Funct == 6'b100000)
              begin
                Alucontrol <= 3'b010;			  
	          end
			else if(Funct == 6'b100010)
	          begin
	            Alucontrol <= 3'b110;
			  end
			else if(Funct == 6'b100100)
			  begin
			    Alucontrol <= 3'b000;
			  end
			else if(Funct == 6'b100101)
			  begin
			    Alucontrol <= 3'b001;
			  end
			else if(Funct == 6'b101010)
			  begin
			    Alucontrol <= 3'b111;
			  end
			else if(Funct == 6'b100111)
			  begin
				Alucontrol <= 3'b011;
			  end
		   end
	  endcase
  end 
endmodule
