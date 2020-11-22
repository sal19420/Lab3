module testbench11();

reg CLK, RESET, EN, D;
reg [0:1]D2;


wire Q;
wire Q2C;
wire Q2Z;



flipD1_flags F1(CLK, RESET, EN, D, Q);
flipD2_fl F2(CLK, RESET, EN, D2, Q2C, Q2Z);


initial begin
#4500

$display("Clok|RESET|EN |  D |  D2  |  Q2C   |   Q2Z   |");
$monitor(" %b     %b     %b   %b     %b       %b      %b   ", CLK, RESET, EN, D, D2, Q2C, Q2Z);
CLK = 0; RESET = 0; EN = 0; D = 0; D2 = 2'b00; 

#2 RESET = 1;
#2 RESET = 0;
#2 EN = 1;
#2 D = 1; D2 = 2'b01; 
#2 D2 = 2'b10; 
#2 D2 = 2'b01; 
#2 D = 0;
end
always
#1 CLK = ~CLK;

initial
#4600 $finish;

initial begin
  $dumpfile("Flags_tb.vcd");
  $dumpvars(0, testbench11);
end
endmodule