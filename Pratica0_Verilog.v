/*Aluno: Lucas Gomes dos Santos
  Turma 32
*/

module circuito(
    output reg x0,
    output reg x1,
    input b0,
    input [4:0] b1,
    input b2,
    input e
);
integer i;
always @ (*) begin
    if(e == 1)begin
        for(i = 0; i < 31; i = i + 1)begin
            if(b0 == 0)begin
                x1 = 0;
                x0 = 1;
                end
            if(b0 == 1)begin
                x1 = 1;
                x0 = 0;
                end
            end
    end
end
endmodule

module teste;
    wire x0;
    wire x1;
    reg b0 = 1;
    reg [4:0] b1; 
    reg b2 = 20;
    reg e = 0;

    initial begin 
		b1 = 5'b00000;
	end
    
    circuito u0 (.x0(x0), .x1(x1), .b0(b0), .b1(b1), .b2(b2), .e(e));

    always #10 e = ~e;

    initial begin   
        $monitor ("B0 =%0b B1 = %0d B2 = %0b E = %0b X0 = %0b X1 = %0b", b0, b1, b2, e, x0, x1);  
        repeat (2);   
        repeat (8);  
        $finish;
  end  
endmodule

