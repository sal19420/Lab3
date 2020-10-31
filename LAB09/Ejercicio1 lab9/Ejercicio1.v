
//Flip FLop de 1 bit
module flipD1(input wire CLK, RESET, EN, D, output reg Q);
  always @ (posedge CLK or posedge RESET)begin
    if(RESET)
      Q <= 1'b0;
    else if (EN)
      Q <= D;
  end
endmodule


//Flip FLop de 2 bits
module flipD2(input wire CLK, RESET, EN, input wire [0:1]D2, output wire [0:1]Q2);

flipD1 F2_1(CLK, RESET, EN, D2[0], Q2[0]);
flipD1 F2_2(CLK, RESET, EN, D2[1], Q2[1]);
endmodule

//Flip FLop de 4 bits
module flipD4(input wire CLK, RESET, EN, input wire [0:3]D4, output wire [0:3]Q4);
flipD2 F4_1(CLK, RESET, EN, D4[0:1], Q4[0:1]);
flipD2 F4_2(CLK, RESET, EN, D4[2:3], Q4[2:3]);
endmodule
