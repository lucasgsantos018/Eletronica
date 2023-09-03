/*Aluno: Lucas Gomes dos Santos
  Turma 32
*/

module teste;
	reg T_CLARO, T_HUMIDADE, T_A, T_F;
	wire T_FECHAR, T_ABRIR;

	initial begin
		T_CLARO = 0;
		T_HUMIDADE = 0;
		T_A = 0;
		T_F = 0;
	end

	initial begin
		#16 $stop;
	end

	initial begin
		$display("\t \t TEMPO  F  A  CLARO   HUMIDADE  FECHAR ABRIR");
		$monitor("%d   %b   %b   %b   %b   %b   %b", $time, T_CLARO, T_A, T_CLARO, T_HUMIDADE, T_FECHAR, T_ABRIR);
	end

	always begin
		#1 {T_F, T_A, T_CLARO, T_HUMIDADE} = {T_F, T_A, T_CLARO, T_HUMIDADE} + 1;
	end

	funcionando variaveis(.CLARO(T_CLARO), .HUMIDADE(T_HUMIDADE), .A(T_A), .F(T_F), .FECHAR(T_FECHAR), .ABRIR(T_ABRIR));

endmodule


module funcionando(CLARO, HUMIDADE, A, F, FECHAR, ABRIR);

	input CLARO, HUMIDADE, A, F;
	output FECHAR, ABRIR;
	reg FECHAR, ABRIR;

	always@(*) begin 
		ABRIR = ~A&~CLARO&~HUMIDADE;
		FECHAR = ~F&HUMIDADE | ~A&CLARO;
	end
	
endmodule
