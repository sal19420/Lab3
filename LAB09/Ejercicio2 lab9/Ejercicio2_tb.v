module testbench();

reg CLK, RESET, EN;

wire Q;

flipT FT1(CLK, RESET, EN, Q);

initial begin
#1

$display("Clok|RESET|EN |Q  ");
$monitor(" %b   %b   %b %b ", CLK, RESET, EN,Q);
CLK = 0; RESET = 0; EN = 0;

#2 RESET = 1;
#2 RESET = 0;
#2 EN = 1;
#2 EN = 0;
end
always
#1 CLK = ~CLK;

initial
#30 $finish;

initial begin
  $dumpfile("Ejercicio2_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
