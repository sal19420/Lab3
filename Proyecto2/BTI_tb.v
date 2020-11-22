module testbench5();

reg EN;
reg [0:3]I1;
wire [0:3]Y1;

BT_4BL10_IN BuTi(EN, I1, Y1);

initial begin
#4000
$display("Enable |  IN |   Y   |");
$monitor("  %b     %b     %b   ", EN, I1, Y1);
EN = 0; I1 = 4'b0000;
#2 I1 = 4'b0001;
#2 EN = 1; I1 = 4'b0010;
#2 EN = 1; I1 = 4'b0110;
end

initial
#4100 $finish;

initial begin
  $dumpfile("BTI_tb.vcd");
  $dumpvars(0, testbench5);
end
endmodule