module testbench4();

reg EN;
reg [0:3]I3;
wire [0:3]Y3;

BT_4BL10_IN BuTi(EN, I3, Y3);

initial begin
#3900
$display("Enable |  IN |   Y   |");
$monitor("  %b     %b     %b   ", EN, I3, Y3);
EN = 0; I3 = 4'b0000;
#2 I3 = 4'b0001;
#2 EN = 1; I3 = 4'b0010;
#2 EN = 1; I3 = 4'b0110;
end

initial
#4000 $finish;

initial begin
  $dumpfile("BTA_tb.vcd");
  $dumpvars(0, testbench4);
end
endmodule