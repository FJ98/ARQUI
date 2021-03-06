module DataMemory(Address,WriteData,tipols,MemRead,MemWrite,clock,ReadData);
input wire[31:0]Address,WriteData;
input wire[1:0] tipols;
input wire MemRead,MemWrite,clock; 
output reg [31:0]ReadData;
reg [7:0] memo [0:255];
reg [3:0] cuatros;
integer index;
initial begin
$readmemh("memo.txt",memo);
cuatros = 4'b000;
end
always@(posedge clock)
begin
	if(MemRead==1'b1 && MemWrite == 1'b0)
	begin
		if(tipols==2'b00)
		begin
		assign ReadData = {memo[Address],memo[Address+1],memo[Address+2],memo[Address+3]};
		end
		else if(tipols==2'b01)
		begin
		assign ReadData = {cuatros,cuatros,cuatros,memo[Address]};
		end
		
	end
	if(MemWrite==1'b1 && MemRead == 1'b0)begin
		if(tipols==2'b00)begin
		memo[Address] <= WriteData[31:24];
		memo[Address+1] <= WriteData[23:16];
		memo[Address+2] <= WriteData[15:8];
		memo[Address+3] <= WriteData[7:0];
		end
	end
	for(index =0; index<40;index=index+4)begin
		$display("%h, %h, %h, %h",memo[index],memo[index+1],memo[index+2],memo[index+3]);
	end
	$display("%h%h%h%h",memo[16],memo[17],memo[18],memo[19]);
	$display("%b",tipols);
	$display("La data que sale es: %h",ReadData);
	$display("La direccion que se tiene que sacar es: %h",Address);
end
endmodule