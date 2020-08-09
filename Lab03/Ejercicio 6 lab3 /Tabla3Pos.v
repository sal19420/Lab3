module Tabla3Pos();
  reg A, B, C, D;
  wire snA, snB, snC, snD, s4, s5, s6, s7, s8, s9, s10, s11, s12, out;
  not n1(snA, A);
  not n2(snB, B);
  not n3(snC, C);
  not n4(snD, D);
  or n5(s4, A, snB, C, D);
  or n6(s5, A, snB, C, snD);
  or n7(s6, A, snB, snC, D);
  or n8(s7, A, snB, snC, snD);
  or n9(s8, snA, B, C, snD);
  or n10(s9, snA, B, snC, snD);
  or n11(s10, snA, snB, C, D);
  or n12(s11, snA, snB, C, snD);
  or n13(s12, snA, snB, snC, snD);
  and n14(out, s4, s5, s6, s7, s8, s9, s10, s11, s12);

  initial begin
    $display("A B C D | Y");
    $monitor("%b %b %b %b | %b", A, B, C, D, out);
    A=0; B=0; C=0; D=0;
    #1 D=1;
    #1 C=1; D=0;
    #1 D=1;
    #1 B=1; C=0; D=0;
    #1 D=1;
    #1 C=1; D=0;
    #1 D=1;
    #1 A=1; B=0; C=0; D=0;
    #1 D=1;
    #1 C=1; D=0;
    #1 D=1;
    #1 B=1; C=0; D=0;
    #1 D=1;
    #1 C=1; D=0;
    #1 D=1;
    #1 $finish;
    end

    /*
        initial
        begin
          $dumpfile("Tabla3Sop_tb.vcd");
          $dumpvars(0, Tabla3Sop);
        end
    */
endmodule
