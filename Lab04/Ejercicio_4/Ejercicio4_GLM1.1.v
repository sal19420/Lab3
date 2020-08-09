module gateLevel1(input wire A, B, C, output wire Y );

  wire SNA, SNB, SNC, S4, S5, S6;

  not (SNA, A);
  not (SNB, B);
  not (SNC, C);
  and (S4, SNA, SNC);
  and (S5, A, C);
  and (S6, A, SNB);
  or (Y, S4, S5, S6);
endmodule

module gateLevel2(input wire A, B, C, output wire Y );


  not(Y, B);
endmodule


module gateLevel3(input wire A, B, C, D, output wire Y );

  wire SNA, SNB, SNC, SND, S4, S5, S6, S7, S8, S9, S10, S11;

  not (SNA, A);
  not (SNB, B);
  not (SNC, C);
  not (SND, D);
  and (S4, SNA, SNB, SNC, SND);
  and (S5, A, B, SNC, SND);
  and (S6, SNA, B, SNC, D);
  and (S7, A, SNB, SNC, D);
  and (S8, SNA, SNB, C, D);
  and (S9, A, B, C, D);
  and (S10, SNA, B, C, SND);
  and (S11, A, SNB, C, SND);
  or (Y, S4, S5, S6, S7, S8, S9, S10, S11);
endmodule

module gateLevel4(input wire A, B, C, D, output wire Y );
  wire SNB, SND, S4, S5, S6;

  not (SNB, B);
  not (SND, D);
  and (S4, A, C);
  and (S5, A, B);
  and (S6, SNB, SND);
  or (Y, S4, S5, S6);
endmodule

module operadores1(input wire A, B, C, D, output wire Y);

  assign Y = (~B & ~C & ~D ) | (A & ~C) | (A & ~B) | (A & ~D);
endmodule

module operadores2 (input wire A, B, C, output wire Y);
  assign Y = (C | ~B);
endmodule

module operadores3 (input wire A, B, C, D, output wire Y);
  assign Y = B | (~C & D ) | (A & D);
endmodule

module operadores4 (input wire A, B, C, output wire Y);
  assign Y = (~A & ~C) | B;
endmodule
