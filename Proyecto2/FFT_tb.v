module testbench9();

reg CLK, RESET;

wire Q;

Phase FT1(CLK, RESET, Q);

initial begin
#4300

$display("Clok|RESET|Q|~Q  ");
$monitor(" %b   %b   %b %b ", CLK, RESET, Q,);
CLK = 0; RESET = 0; 

#2 RESET = 1;
#2 RESET = 0;

end
always
#1 CLK = ~CLK;

initial
#4400 $finish;

initial begin
  $dumpfile("FFT_tb.vcd");
  $dumpvars(0, testbench9);
end
endmodule