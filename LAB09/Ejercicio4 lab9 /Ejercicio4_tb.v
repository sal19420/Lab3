module testbench();

reg EN;
reg [0:3]I;
wire [0:3]Y;

BT_4B BuTi(EN, I, Y);

initial begin
#1
$display("Enable |  IN |   Y   |");
$monitor("  %b     %b     %b   ", EN, I, Y);
EN = 0; I = 4'b0000;
#2 I = 4'b0001;
#2 EN = 1; I = 4'b0010;
#2 EN = 1; I = 4'b0110;
end

initial
#30 $finish;

initial begin
  $dumpfile("Ejercicio4_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
