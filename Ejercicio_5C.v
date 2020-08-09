module gateLevelSOP(input wire W, M, S, output wire A );
  wire SNW, SNM, S1, S2, S3;

  not (SNW, W);
  not (SNM, M);
  and (S1, SNW, SNM, S);
  and (S2, SNW, M, S);
  and (S3, W, M, S);
  or (A, S1, S2, S3);
endmodule

module gateLevelPOS(input wire W, M, S, output wire A );

  wire SNW, SNM, SNS, S1, S2, S3, S4, S5;

  not (SNW, W);
  not (SNM, M);
  not (SNS, S);
  or (S1, W, M, S);
  or (S2, W, SNM, S);
  or (S3, SNW, M, S);
  or (S4, SNW, M, SNS);
  or (S5, SNW, SNM, S);
  and (A, S1, S2, S3, S4, S5);
endmodule

module gateLevelKM(input wire W, M, S, output wire A );

  wire SNW, S1, S2;

  not (SNW, W);
  and (S1, SNW, S);
  and (S2, M, S);
  or (A, S1, S2);
endmodule

module operadoresSOP(input wire W, M, S, output wire A );
  assign A = (~W & ~M & S) | (~W & M & S) | (W & M & S);
endmodule

module operadoresPOS(input wire W, M, S, output wire A);
  assign A = (W | M | S) & (W | ~M | S) & (~W | M | S) & (~W | M | ~S) & (~W | ~M | S);
endmodule

module operadoresKM(input wire W, M, S, output wire A);
  assign A = (~W & S ) | (M & S);
endmodule
