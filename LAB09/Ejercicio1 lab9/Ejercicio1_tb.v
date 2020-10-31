module testbench();

reg CLK, RESET, EN, D;
reg [0:1]D2;
reg [0:3]D4;

wire Q;
wire [0:1]Q2;
wire [0:3]Q4;

flipD1 F1(CLK, RESET, EN, D, Q);
flipD2 F2(CLK, RESET, EN, D2, Q2);
flipD4 F4(CLK, RESET, EN, D4, Q4);

initial begin
#1

$display("Clok|RESET|EN |  D |  D2  |   D4  |  Q   |   Q2   |  Q4  |");
$monitor(" %b     %b     %b   %b     %b      %b    %b      %b      %b ", CLK, RESET, EN, D, D2, D4, Q, Q2, Q4);
CLK = 0; RESET = 0; EN = 0; D = 0; D2 = 2'b00; D4 = 4'b0000;

#2 RESET = 1;
#2 RESET = 0;
#2 EN = 1;
#2 D = 1; D2 = 2'b01; D4 = 4'b0101;
#2 D2 = 2'b10; D4 = 4'b0011;
#2 D2 = 2'b01; D4 = 4'b0101;
#2 D = 0;
end
always
#1 CLK = ~CLK;

initial
#30 $finish;

initial begin
  $dumpfile("Ejercicio1_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
