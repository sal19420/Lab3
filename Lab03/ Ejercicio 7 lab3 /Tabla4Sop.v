module Tabla4Sop();
  reg A, B, C, D;
  wire snA, snB, snC, snD, s4, s5, s6, s7, s8, s9, s10, out;
  not n1(snA, A);
  not n2(snB, B);
  not n3(snC, C);
  not n4(snD, D);
  and n5(s4, snA, snB, snC, snD);
  and n6(s5, snA, snB, C, snD);
  and n7(s6, snA, snB, C, D);
  and n8(s7, snA, B, C, snD);
  and n9(s8, snA, B, C, D);
  and n10(s9, A, snB, snC, snD);
  and n11(s10, A, snB, C, snD);
  or n12(out, s4, s5, s6, s7, s8, s9, s10);


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
          $dumpfile("Tabla4Sop_tb.vcd");
          $dumpvars(0, Tabla4Sop);
        end
    */
endmodule
