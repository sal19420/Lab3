module Tabla1Sop();
  reg A, B, C;
  wire s1, s2 ,s3 ,s4 ,s5 ,s6 ,s7 ,s8 , out;
  not N1(s1, A);
  not N2(s2, B);
  not N3(s3, C);
  and N4(s4, s1, s2, s3);
  and N5(s5, s1, B, s3);
  and N6(s6, A, s2, s3);
  and N7(s7, A, s2, C);
  and N8(s8, A, B, C);
  or N9(out, s4, s5, s6, s7, s8);


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
      $dumpfile("Tabla1Sop_tb.vcd");
      $dumpvars(0, Tabla1Sop);
    end
*/
endmodule
