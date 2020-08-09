module Tabla2Pos();
  reg A, B, C;
  wire snA, snB, snC, s4, s5, s6, s7, s8, out;
  not N1(snA, A);
  not N2(snB, B);
  not N3(snC, C);
  or N4(s4, A, B, C);
  or N5(s5, A, snB, C);
  or N6(s6, A, snB, snC);
  or N7(s7, snA, B, C);
  or N8(s8, snA, B, snC);
  and N9(out, s4, s5, s6, s7, s8);



  initial begin
    $display("A B C | Y");
    $monitor("%b %b %b | %b", A, B, C, out);
    A=0; B=0; C=0;
    #1 C=1;
    #1 B=1; C=0;
    #1 C=1;
    #1 A=1; B=0; C=0;
    #1 C=1;
    #1 B=1; C=0;
    #1 C=1;
    #1 $finish;
    end

    /*
        initial
        begin
          $dumpfile("Tabla2Pos_tb.vcd");
          $dumpvars(0, Tabla2Pos);
        end
    */
endmodule
