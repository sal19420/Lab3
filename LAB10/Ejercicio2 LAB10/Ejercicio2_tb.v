module testbench();

reg CLK, RESET, ENB1, ENB2, ENACU;
reg [0:3]BTI1;
reg [0:2]F;
wire [0:3]BTO2;
wire CC, ZC;

CL10_2 cl2(CLK, RESET, ENB1, ENB2, ENACU, BTI1, F, BTO2, CC, ZC);

initial begin 
#1
$display("Clk |  Reset|   Enable Buffer 1  | Enable Buffer 2  | Enable Accumulator  |  IN     |   Commands  |   Out   |   Carry  |   Zero  |");
$monitor(" %b     %b           %b                %b              %b                    %b           %b            %b        %b       %b ", CLK, RESET, ENB1, ENB2, ENACU, BTI1, F, BTO2, CC, ZC);
CLK = 0; RESET = 0; ENB1 = 0; ENB2 = 0; ENACU = 0; BTI1 = 4'b0000; F = 3'b000;

#1 RESET = 1;
#1 RESET = 0;
#1 ENB1 = 1; BTI1 = 4'b0001; F = 3'b010;
#1 ENB1 = 1; ENB2 = 1; ENACU = 1; BTI1 = 4'b1001; F = 3'b011;
#1 ENB1 = 1; ENB2 = 1; ENACU = 1; BTI1 = 4'b1101; F = 3'b001;
#1 ENB1 = 0; ENACU = 0;

end
always
#1 CLK = ~CLK;
initial
  #15 $finish;

initial begin
   $dumpfile("Ejercicio2_tb.vcd");
   $dumpvars(0, testbench);
end
endmodule
