module Tabla2Sop();
  reg A, B, C;
  wire snA, snB, snC, s4, s5, s6, out;
  not n1(snA, A);
  not n2(snB, B);
  not n3(snC, C);
  and n4(s4, snA, snB, C);
  and n5(s5, A, B, snC);
  and n6(s6, A, B, C);
  or n7(out, s4, s5, s6);


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
          $dumpfile("Tabla2Sop_tb.vcd");
          $dumpvars(0, Tabla2Sop);
        end
    */
endmodule
