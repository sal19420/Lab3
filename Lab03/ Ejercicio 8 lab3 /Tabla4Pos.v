module Tabla4Pos();
  reg A, B, C, D;
  wire snA, snB, snC, snD, s4, s5, s6, s7, s8, s9, s10, s11, s12, out;
  not n1(snA, A);
  not n2(snB, B);
  not n3(snC, C);
  not n4(snD, D);
  or n5(s4, A, B, C, snD);
  or n6(s5, A, snB, C, D);
  or n7(s6, A, snB, C, snD);
  or n8(s7, snA, B, C, snD);
  or n9(s8, snA, B, snC, snD);
  or n10(s9, snA, snB, C, D);
  or n11(s10, snA, snB, C, snD);
  or n12(s11, snA, snB, snC, D);
  or n13(s12, snA, snB, snC, snD);
  and n14(out, s4, s5, s6, s7, s8, s9, s10, s11, s12);


  initial begin
    $display("A B C D| Y");
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
          $dumpfile("Tabla4Pos_tb.vcd");
          $dumpvars(0, Tabla4Pos);
        end
    */
endmodule
