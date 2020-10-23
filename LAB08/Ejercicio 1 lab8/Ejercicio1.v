//Contador de 12 bits
// Se declaran las variables de entradas y salidas

module cont12(input wire clk, reset, En, NBL, input wire [11:0]load, output reg [11:0]s);

  always @ (posedge clk or posedge reset or NBL or load)begin
      if(reset) // Se resetea a 0
          s <= 12'b000000000000;


      else if(NBL == 1)// Mientras NBL este en 1 se carga la salida anterior
          s <= load;

      else if (En == 1)// Se activa contador de 1 en 1
          s <= s + 1;
  end

endmodule
