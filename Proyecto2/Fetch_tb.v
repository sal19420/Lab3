module testbench10();

reg CLK, RESET, EN, D;
reg [0:1]D2;
reg [0:3]D4;
reg [0:7]D5;

wire Q;
wire [0:1]Q2;
wire [0:3]Q4;
wire [0:3]Q5;
wire [0:3]Q6;

flipD1_A F1(CLK, RESET, EN, D, Q);
flipD2_A F2(CLK, RESET, EN, D2, Q2);
ACCU F4(CLK, RESET, EN, D4, Q4);
flipD8_F Fetch(CLK, RESET, EN, D5, Q5, Q6);

initial begin
#4410

$display("Clok|RESET|EN |  D |  D2  |   D4  |   D5   |  Q   |   Q2   |  Q4  |  Q5  |  Q5  |");
$monitor(" %b     %b     %b   %b     %b      %b    %b     %b      %b      %b     %b      %b ", CLK, RESET, EN, D, D2, D4, D5, Q, Q2, Q4, Q5, Q6);
CLK = 0; RESET = 0; EN = 0; D = 0; D2 = 2'b00; D4 = 4'b0000; D5 = 8'b00000000;

#2 RESET = 1;
#2 RESET = 0;
#2 EN = 1;
#2 D = 1; D2 = 2'b01; D4 = 4'b0101;  D5 = 8'b10100100;
#2 D2 = 2'b10; D4 = 4'b0011;   D5 = 8'b10101100;
#2 D2 = 2'b01; D4 = 4'b0101;   D5 = 8'b11110100;
#2 D = 0;
end
always
#1 CLK = ~CLK;

initial
#4500 $finish;

initial begin
  $dumpfile("Fetch_tb.vcd");
  $dumpvars(0, testbench10);
end
endmodule