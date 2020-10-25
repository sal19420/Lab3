module ALU(input wire [3:0]A, input wire [3:0]B, input wire [2:0]COM, output reg [3:0]R);


    always @ (A or B or COM)begin
// El case es como una pantalla de seleccion de comando
      case(COM)
          3'b000: R = A & B;// comando para and
          3'b001: R = A | B;// comando para or
          3'b010: R = A + B;// suma
          3'b100: R = A & ~B;// Comando para a and not b
          3'b101: R = A | ~B;// comando para a or not b
          3'b110: R = A - B;// resta
          3'b111: R = (A < B) ? 1:0;// comparacion
          default: R = 3'b000;// si no se le asigna valor queda en la primera
      endcase
    end
endmodule
