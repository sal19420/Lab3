module testbench();
  reg pb1, pb2, pb3, pb4, pb5, pb6, pb7, pb8, pb9, PB1, PB2, PB3, PB4, PB5, PB6, PB7, PB8, PB9;
  wire led1, led2, led3, LED1, LED2, LED3;
  T1M8 T18(pb1, pb2, pb3, led1);
  T1M4 T14(pb4, pb5, pb6, led2);
  T1M2 T12(pb7, pb8, pb9, led3);
  T2M8 T28(PB1, PB2, PB3, LED1);
  T2M4 T24(PB4, PB5, PB6, LED2);
  T2M2 T22(PB7, PB8, PB9, LED3);

  initial begin
  #1
    $display (" Mux 8:1 T1");
    $display("A B C | Y");
    $monitor("%b %b %b | %b", pb1, pb2, pb3, led1);
    pb1 = 0; pb2 = 0; pb3 = 0;
  #1 pb3 = 1;
  #1 pb2 = 1; pb3 = 0;
  #1 pb3 = 1;
  #1 pb1 = 1; pb2 = 0; pb3 = 0;
  #1 pb3 = 1;
  #1 pb2 = 1; pb3 = 0;
  #1 pb3 = 1;

  end

  initial begin
  #9
    $display (" Mux 4:1 T1");
    $display("A B C | Y");
    $monitor("%b %b %b | %b", pb4, pb5, pb6, led2);
    pb4 = 0; pb5 = 0; pb6 = 0;
  #1 pb6 = 1;
  #1 pb5 = 1; pb6 = 0;
  #1 pb6 = 1;
  #1 pb4 = 1; pb5 = 0; pb6 = 0;
  #1 pb6 = 1;
  #1 pb5 = 1; pb6 = 0;
  #1 pb6 = 1;

  end

  initial begin
  #19
    $display (" Mux 2:1 T1");
    $display("A B C | Y");
    $monitor("%b %b %b | %b", pb7, pb8, pb9, led3);
    pb7 = 0; pb8 = 0; pb9 = 0;
  #1 pb9 = 1;
  #1 pb8 = 1; pb9 = 0;
  #1 pb9 = 1;
  #1 pb7 = 1; pb8 = 0; pb9 = 0;
  #1 pb9 = 1;
  #1 pb8 = 1; pb9 = 0;
  #1 pb9 = 1;
  end

  initial begin
  #29
    $display (" Mux 8:1 T2");
    $display("A B C | Y");
    $monitor("%b %b %b | %b", PB1, PB2, PB3, LED1);
    PB1 = 0; PB2 = 0; PB3 = 0;
  #1 PB3 = 1;
  #1 PB2 = 1; PB3 = 0;
  #1 PB3 = 1;
  #1 PB1 = 1; PB2 = 0; PB3 = 0;
  #1 PB3 = 1;
  #1 PB2 = 1; PB3 = 0;
  #1 PB3 = 1;
  end
  initial begin
  #39
    $display (" Mux 4:1 T2");
    $display("A B C | Y");
    $monitor("%b %b %b | %b", PB4, PB5, PB6, LED2);
    PB4 = 0; PB5 = 0; PB6 = 0;
  #1 PB6 = 1;
  #1 PB5 = 1; PB6 = 0;
  #1 PB6 = 1;
  #1 PB4 = 1; PB5 = 0; PB6 = 0;
  #1 PB6 = 1;
  #1 PB5 = 1; PB6 = 0;
  #1 PB6 = 1;

  end
  initial begin
  #49
    $display (" Mux 2:1 T2");
    $display("A B C | Y");
    $monitor("%b %b %b | %b", PB7, PB8, PB9, LED3);
    PB7 = 0; PB8 = 0; PB9 = 0;
  #1 PB9 = 1;
  #1 PB8 = 1; PB9 = 0;
  #1 PB9 = 1;
  #1 PB7 = 1; PB8 = 0; PB9 = 0;
  #1 PB9 = 1;
  #1 PB8 = 1; PB9 = 0;
  #1 PB9 = 1;

  end

  initial
  #200 $finish;
  initial begin
    $dumpfile("Lab5E1_tb.vcd");
    $dumpvars(0, testbench);
  end
endmodule
