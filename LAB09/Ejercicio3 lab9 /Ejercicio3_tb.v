module testbench();
reg CLK, RESET, EN, J, K;
wire Q;


flipJK fjk(CLK, RESET, EN, J, K, Q);

initial begin
#1
$display("CLOCK |  RESET | ENABLE | J | K|  Q |");
$monitor("    %b          %b        %b    %b     %b  ", CLK, RESET, EN, J, K, Q);

CLK = 0; RESET = 0; EN = 0; J = 0; K = 0;
#2 RESET = 1;
#2 RESET = 0;
#2 EN = 1; J = 1;
#2 EN = 0;
#2 EN = 1; J = 0;
#2 K = 1;
#2 J = 1; K = 0;
#2 K = 1;
end

always
  #1 CLK = ~CLK;

initial
#30 $finish;

initial begin
  $dumpfile("Ejercicio3_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
