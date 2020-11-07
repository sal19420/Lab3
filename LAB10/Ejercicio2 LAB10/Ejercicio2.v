// BUS Driver 1

module BT_4BL10_1 (input wire EN, input wire [0:3]I1, output wire [0:3]Y1);

assign Y1 = (EN) ? I1:4'bz;
endmodule

// BUS Driver 2
module BT_4BL10_2 (input wire EN, input wire [0:3]I2, output wire [0:3]Y2);

assign Y2 = (EN) ? I2:4'bz;
endmodule

// ALU
module ALUL10(input wire [3:0]A, input wire [3:0]B, input wire [2:0]COM, output wire C, Z, output reg [3:0]R, output reg [0:4]PM);


    always @ (A or B or COM)begin
// El case es como una pantalla de seleccion de comando
      case(COM)
      3'b000: begin
                  PM = 5'b00000;
                  PM = A;// deja pasar A
                  C = 1'b0;
                  Z = 1'b0;
                  R = PM[0:3];
              end

      3'b001: begin
                  PM = 5'b00000;
                  PM = A - B;// resta
                  R = PM[1:4];
                  C = PM[0];
                  Z = (PM == 5'b00000);
              end

      3'b011: begin
                  PM = 5'b00000;
                  PM = A + B;// resta
                  R = PM[1:4];
                  C = PM[0];
                  Z = (PM == 5'b00000);
              end

      3'b010: begin
                  PM = 5'b00000;
                  PM = B;// deja pasar B
                  C = 1'b0;
                  Z = 1'b0;
                  R = PM[0:3];
              end

      3'b100: begin
                  PM = 5'b00000;
                  PM = A ~| B;// Nor
                  C = 1'b0;
                  Z = 1'b0;
                  R = PM[0:3];
              end
      endcase
    end
endmodule


// ACCU
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

module ACCU(input wire CLK, RESET, EN, input wire [0:3]D4, output wire [0:3]Q4);
flipD2 F4_1(CLK, RESET, EN, D4[0:1], Q4[0:1]);
flipD2 F4_2(CLK, RESET, EN, D4[2:3], Q4[2:3]);
endmodule



module(input wire CLK, RESET, ENB1, ENB2, ENACU, input wire [0:3]BTI1, input wire [0:2]F, output wire [0:3]BTO2, output wire CC, ZC);
 wire [0:3]DB, [0:3]SALU, [0:3]SACCU;

 BT_4BL10_1 B1(ENB1, BTI1, DB);

 ALUL10 Alu(.A(SACCU), .B(DB), .COM(F), .C(CC), .Z(ZC), .R(SALU));

 ACCU acu(CLK, RESET, ENACU, SALU, SACCU);

 BT_4BL10_2(ENB2, SALU, BTO2);

endmodule
