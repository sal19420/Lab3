module testbench3();

reg EN;
reg [0:3]I2;
wire [0:3]Y2;

BT_4BL10_O BuTi(EN, I2, Y2);

initial begin
#3800
$display("Enable |  IN |   Y   |");
$monitor("  %b     %b     %b   ", EN, I2, Y2);
EN = 0; I2 = 4'b0000;
#2 I2 = 4'b0001;
#2 EN = 1; I2 = 4'b0010;
#2 EN = 1; I2 = 4'b0110;
end

initial
#3900 $finish;

initial begin
  $dumpfile("BTO_tb.vcd");
  $dumpvars(0, testbench3);
end
endmodule