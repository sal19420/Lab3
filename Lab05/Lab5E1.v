module M2 (input wire J0, J1, m, output wire  Y);
  assign Y= m ? J1 : J0;
endmodule

module M4(input wire J0, J1, J2, J3, m0, m1, output wire Y1);

  wire s0, s1;

  M2 u0(J0, J1, m0, s0);
  M2 u1(J2, J3, m0, s1);
  M2 u2(s0, s1, m1, Y1);
endmodule

module M8 (input wire J0, J1, J2, J3, J4, J5, J6, J7, m0, m1, m2, output wire Y2 );
  wire s2, s3;

  M4 u3(J0, J1, J2, J3, m0, m1, s2);
  M4 u4(J4, J5, J6, J7, m0, m1, s3);
  M2 u5(s2, s3, m2, Y2);

endmodule

module T1M8(input wire A, B, C, output wire Y3);

  wire S, N;
  assign S = 1;
  assign N = 0;

  M8 T18(N, S, S, N, S, N, N, S, A, B, C, Y3);
endmodule


module T1M4(input wire A, B, C, output wire Y4);
  wire SC, NC;

  assign SC = C;
  assign NC = ~C;

  M4 T14(SC, NC, NC, SC, A, B, Y4);
endmodule


module T1M2(input wire A, B, C, output wire Y5);

  wire n0, n1;
  assign n0 = (B^C);
  assign n1 = ~(B^C);

  M2 T12(n0, n1, A, Y5);
endmodule

module T2M8(input wire A, B, C, output wire Y6);

  wire s, n;
  assign s = 1;
  assign n = 0;

  M8 T28(s, n, n, n, n, s, s, n, A, B, C, Y6);
endmodule

module T2M4(input wire A, B, C, output wire Y7);
  wire G, CS, CN;
  assign G = 0;
  assign CS = C;
  assign CN = ~C;

  M4 T24(CN, G, CS, CN, A, B, Y7);
endmodule

module T2M2(input wire A, B, C, output wire Y8);

  wire N0, N1;
  assign N0 = ~(B|C);
  assign N1 = (B^C);

  M2 T22(N0, N1, A, Y8);
endmodule
