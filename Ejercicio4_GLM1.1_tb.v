module testbench();

  reg e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14;
  wire Y1, Y2, Y3, Y4, y1, y2, y3, y4;

  gateLevel1 G1 (e1, e2, e3, Y1);
  gateLevel2 G2 (e4, e5, e6, Y2);
  gateLevel3 G3 (e7, e8, e9, e10, Y3);
  gateLevel4 G4 (e11, e12, e13, e14, Y4);
  operadores1 OP1(E1, E2, E3, E4, y1);
  operadores2 OP2(E5, E6, E7, y2);
  operadores3 OP3(E8, E9, E10,E11, y3);
  operadores4 OP4(E12, E13, E14, y4);


  initial begin
  #1
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", e1, e2, e3, Y1);
      e1 = 0; e2 = 0; e3 = 0;
    #1 e3 = 1;
    #1 e2 = 1; e3 = 0;
    #1 e3 = 1;
    #1 e1 = 1; e2 = 0; e3 = 0;
    #1 e3 = 1;
    #1 e2 = 1; e3 = 0;
    #1 e3 = 1;

  end

  initial begin
  #9
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", e4, e5, e6, Y2);
      e4 = 0; e5 = 0; e6 = 0;
    #1 e6 = 1;
    #1 e5 = 1; e6 = 0;
    #1 e6 = 1;
    #1 e4 = 1; e5 = 0; e6 = 0;
    #1 e6 = 1;
    #1 e5 = 1; e6 = 0;
    #1 e6 = 1;
  end
  initial begin
  #17
    $display("A B C D | Y");
    $display("------|--");
    $monitor("%b %b %b %b | %b", e7, e8, e9, e10, Y3);
      e7 = 0; e8 = 0; e9 = 0; e10 = 0;
      #1 e10 = 1;
      #1 e9 = 1; e10 = 0;
      #1 e10 = 1;
      #1 e8 = 1; e9 = 0; e10 = 0;
      #1 e10 = 1;
      #1 e9 = 1; e10 = 0;
      #1 e10 = 1;
      #1 e7 = 1; e8 = 0; e9 = 0; e10 = 0;
      #1 e10 = 1;
      #1 e9 = 1; e10 = 0;
      #1 e10 = 1;
      #1 e8 = 1; e9 = 0; e10 = 0;
      #1 e10 = 1;
      #1 e9 = 1; e10 = 0;
      #1 e10 = 1;
  end

  initial begin
  #33
    $display("A B C D | Y");
    $display("------|--");
    $monitor("%b %b %b %b | %b", e11, e12, e13, e14, Y4);
      e11 = 0; e12 = 0; e13 = 0; e14 = 0;
      #1 e14 = 1;
      #1 e13 = 1; e14 = 0;
      #1 e14 = 1;
      #1 e12 = 1; e13 = 0; e14 = 0;
      #1 e14 = 1;
      #1 e13 = 1; e14 = 0;
      #1 e14 = 1;
      #1 e11 = 1; e12 = 0; e13 = 0; e14 = 0;
      #1 e14 = 1;
      #1 e13 = 1; e14 = 0;
      #1 e14 = 1;
      #1 e12 = 1; e13 = 0; e14 = 0;
      #1 e14 = 1;
      #1 e13 = 1; e14 = 0;
      #1 e14 = 1;
  end
  initial begin
  #50
    $display("A B C D | Y");
    $display("------|--");
    $monitor("%b %b %b %b | %b", E1, E2, E3, E4, y1);
      E1 = 0; E2 = 0; E3 = 0; E4 = 0;
      #1 E4 = 1;
      #1 E3 = 1; E4 = 0;
      #1 E4 = 1;
      #1 E2 = 1; E3 = 0; E4 = 0;
      #1 E4 = 1;
      #1 E3 = 1; E4 = 0;
      #1 E4 = 1;
      #1 E1 = 1; E2 = 0; E3 = 0; E4 = 0;
      #1 E4 = 1;
      #1 E3 = 1; E4 = 0;
      #1 E4 = 1;
      #1 E2 = 1; E3 = 0; E4 = 0;
      #1 E4 = 1;
      #1 E3 = 1; E4 = 0;
      #1 E4 = 1;
  end

  initial begin
  #68
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", E5, E6, E7, y2);
      E5 = 0; E6 = 0; E7 = 0;
    #1 E7 = 1;
    #1 E6 = 1; E7 = 0;
    #1 E7 = 1;
    #1 E5 = 1; E6 = 0; E7 = 0;
    #1 E7 = 1;
    #1 E6 = 1; E7 = 0;
    #1 E7 = 1;
  end

  initial begin
  #76
    $display("A B C D | Y");
    $display("------|--");
    $monitor("%b %b %b %b | %b", E8, E9, E10, E11, y3);
      E8 = 0; E9 = 0; E10 = 0; E11 = 0;
      #1 E11 = 1;
      #1 E10 = 1; E11 = 0;
      #1 E11 = 1;
      #1 E9 = 1; E10 = 0; E11 = 0;
      #1 E11 = 1;
      #1 E10 = 1; E11 = 0;
      #1 E11 = 1;
      #1 E8 = 1; E9 = 0; E10 = 0; E11 = 0;
      #1 E11 = 1;
      #1 E10 = 1; E11 = 0;
      #1 E11 = 1;
      #1 E9 = 1; E10 = 0; E11 = 0;
      #1 E11 = 1;
      #1 E10 = 1; E11 = 0;
      #1 E11 = 1;
  end
  initial begin
  #93
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", E12, E13, E14, y4);
      E12 = 0; E13 = 0; E14 = 0;
    #1 E14 = 1;
    #1 E13 = 1; E14 = 0;
    #1 E14 = 1;
    #1 E12 = 1; E13 = 0; E14 = 0;
    #1 E14 = 1;
    #1 E13 = 1; E14 = 0;
    #1 E14 = 1;
  end

  initial
  #120 $finish;
  initial begin
    $dumpfile("Ejercicio4_GLM1.1_tb.vcd");
    $dumpvars(0, testbench);
  end
endmodule
