
//Counter de 12 bits
module cont12(input wire clk, reset, En, NBL, input wire [11:0]load, output reg [11:0]s);

  always @ (posedge clk or posedge reset or NBL or load or En)begin
      if(reset) // Se resetea a 0
          s <= 12'b000000000000;


      else if(NBL == 1)// Mientras NBL este en 1 se carga la salida anterior
          s <= load;

      else if (En == 1)// Se activa contador de 1 en 1
          s <= s + 1;
  end

endmodule


//Program rom
module PROM(input wire [11:0]dire, output wire [7:0]codigo);
reg [7:0] ROM [0:4095];
initial begin
  $readmemb("PROML10.list", ROM);
end
assign codigo = ROM[dire];
endmodule


//FFD 8 bits
module flipD1(input wire CLK, RESET, EN, D, output reg Q);
  always @ (posedge CLK or posedge RESET)begin
    if(RESET)
      Q <= 1'b0;
    else if (EN)
      Q <= D;
  end
endmodule

module flipD2(input wire CLK, RESET, EN, input wire [0:1]D2, output wire [0:1]Q2);

flipD1 F2_1(CLK, RESET, EN, D2[0], Q2[0]);
flipD1 F2_2(CLK, RESET, EN, D2[1], Q2[1]);
endmodule

module flipD4(input wire CLK, RESET, EN, input wire [0:3]D4, output wire [0:3]Q4);
flipD2 F4_1(CLK, RESET, EN, D4[0:1], Q4[0:1]);
flipD2 F4_2(CLK, RESET, EN, D4[2:3], Q4[2:3]);
endmodule

module flipD8(input wire CLK, RESET, EN, input wire [0:7]D5, output wire [0:3]Q5, output wire [0:3]Q6);
flipD4 F8_1(CLK, RESET, EN, D5[0:3], Q5);
flipD4 F8_2(CLK, RESET, EN, D5[4:7], Q6);
endmodule


// Parte del procesador
module CL10(input wire CLK, RESET, ENC, ENF, NBL10, input wire [0:11]LOADC, output wire [0:7]PRBT, output wire [0:3]INS, output wire [0:3]OPRN);

wire [0:11]PC;

cont12 C12B(.clk(CLK), .reset(RESET), .En(ENC), .NBL(NBL10), .load(LOADC), .s(PC));

PROM PR(.dire(PC), .codigo(PRBT));

flipD8 FETCH_1(.CLK(CLK), .RESET(RESET), .EN(ENF), .D5(PRBT[0:7]), .Q5(INS), .Q6(OPRN));


endmodule
