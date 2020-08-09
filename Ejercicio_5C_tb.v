module testbench5();

  reg W1, M1, S1, W2, M2, S2, W3, M3, S3, W4, M4, S4, W5, M5, S5, W6, M6, S6;
  wire A1, A2, A3, A4, A5, A6;

  gateLevelSOP GSOP(W1, M1, S1, A1);
  gateLevelPOS GPOS(W2, M2, S2, A2);
  gateLevelKM GKM(W3, M3, S3, A3);
  operadoresSOP OPSOP(W4, M4, S4, A4);
  operadoresPOS OPPOS(W5, M5, S5, A5);
  operadoresKM OPKM(W6, M6, S6, A6);


  initial begin
  #1
  $display("W M S | A");
  $display("------|--");
  $monitor("%b %b %b | %b", W1, M1, S1, A1);
    W1 = 0; M1 = 0; S1 = 0;
  #1 S1 = 1;
  #1 M1 = 1; S1 = 0;
  #1 S1 = 1;
  #1 W1 = 1; M1 = 0; S1 = 0;
  #1 S1 = 1;
  #1 M1 = 1; S1 = 0;
  #1 S1 = 1;

  end
  initial begin
  #9
  $display("W M S | A");
  $display("------|--");
  $monitor("%b %b %b | %b", W2, M2, S2, A2);
    W2 = 0; M2 = 0; S2 = 0;
  #1 S2 = 1;
  #1 M2 = 1; S2 = 0;
  #1 S2 = 1;
  #1 W2 = 1; M2 = 0; S2 = 0;
  #1 S2 = 1;
  #1 M2 = 1; S2 = 0;
  #1 S2 = 1;

  end
  initial begin
  #17
  $display("W M S | A");
  $display("------|--");
  $monitor("%b %b %b | %b", W3, M3, S3, A3);
    W3 = 0; M3 = 0; S3 = 0;
  #1 S3 = 1;
  #1 M3 = 1; S3 = 0;
  #1 S3 = 1;
  #1 W3 = 1; M3 = 0; S3 = 0;
  #1 S3 = 1;
  #1 M3 = 1; S3 = 0;
  #1 S3 = 1;

  end
  initial begin
  #26
  $display("W M S | A");
  $display("------|--");
  $monitor("%b %b %b | %b", W4, M4, S4, A4);
    W4 = 0; M4 = 0; S4 = 0;
  #1 S4 = 1;
  #1 M4 = 1; S4 = 0;
  #1 S4 = 1;
  #1 W4 = 1; M4 = 0; S4 = 0;
  #1 S4 = 1;
  #1 M4 = 1; S4 = 0;
  #1 S4 = 1;

  end

  initial begin
  #33
  $display("W M S | A");
  $display("------|--");
  $monitor("%b %b %b | %b", W5, M5, S5, A5);
    W5 = 0; M5 = 0; S5 = 0;
  #1 S5 = 1;
  #1 M5 = 1; S5 = 0;
  #1 S5 = 1;
  #1 W5 = 1; M5 = 0; S5 = 0;
  #1 S5 = 1;
  #1 M5 = 1; S5 = 0;
  #1 S5 = 1;

  end
  initial begin
  #42
  $display("W M S | A");
  $display("------|--");
  $monitor("%b %b %b | %b", W6, M6, S6, A6);
    W6 = 0; M6 = 0; S6 = 0;
  #1 S6 = 1;
  #1 M6 = 1; S6 = 0;
  #1 S6 = 1;
  #1 W6 = 1; M6 = 0; S6 = 0;
  #1 S6 = 1;
  #1 M6 = 1; S6 = 0;
  #1 S6 = 1;

  end
  initial
  #55 $finish;
  initial begin
    $dumpfile("Ejercicio5C_tb.vcd");
    $dumpvars(0, testbench5);
  end
endmodule
