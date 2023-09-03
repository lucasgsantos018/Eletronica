/*Aluno: Lucas Gomes dos Santos
  Turma 32
*/

module sensorLDR (ld, u, saida);

    input ld, u;
    output saida;
    reg saida;

    always@(*) begin
        saida = ld | u;
    end

endmodule

module linhaA(sensor, botaoE, antHorario);

    input sensor, botaoE;
    output antHorario;
    reg antHorario;

    always@(*) begin
        antHorario = (~sensor) & (~botaoE);
    end

endmodule

module linhaB(sensor, botaoD, horario);

    input sensor, botaoD;
    output horario;
    reg horario;

    always@(*) begin
        horario = sensor & (~botaoD);
    end

endmodule

module top;

    reg ld, u, d , e;
    wire fio, A, B;
	

    initial begin
        ld = 0;
        u = 0;
        d = 0;
        e = 0;
    end

    initial begin
        #16 $stop;
    end

    initial begin
		$display("\t \t TEMPO  Ld   U   D   E   A   B");	
		$monitor(" %d    %b   %b   %b   %b   %b   %b", $time, ld, u, d , e, A, B);
	end

    always begin
        #1 {ld, u, d , e} = {ld, u, d , e} + 1;
	end	


    sensorLDR LDR(ld, u, fio);
    linhaA fioA(fio, e, A);
    linhaB fioB(fio, d, B);

endmodule