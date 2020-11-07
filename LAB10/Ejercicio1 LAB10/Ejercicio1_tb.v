module testbench();

reg CLK, RESET, ENC, ENF, NBL10;
reg [0:11]LOADC;

wire [0:7]PRBT;
wire [0:3]INS;
wire [0:3]OPRN;

CL10 C10(CLK, RESET, ENC, ENF, NBL10, LOADC, PRBT, INS, OPRN);

initial begin
#1

$display("CLK |  Reset|   Enable Contador  | Enable Fetch  | NBL     |   LOAD         | Program byte | Instruction | Operand|");
$monitor(" %b     %b           %b                %b              %b             %b           %b            %b          %b ", CLK, RESET, ENC, ENF, NBL10, LOADC, PRBT, INS, OPRN);
CLK = 0; RESET = 0; ENC = 0; ENF = 0; NBL10 = 0; LOADC= 12'b000000000000;
#1 RESET = 1;
#1 RESET = 0;
#1 ENC = 1; ENF = 1;
#1 ENC = 0; ENF = 0;
#1 NBL10 = 1; LOADC = 12'b000000000010;
#1 NBL10 = 1; LOADC = 12'b000000000011;
#1 NBL10 = 1; LOADC = 12'b000000000100;
#1 ENC = 1; ENF = 1;
end
always
#1 CLK = ~CLK;
initial
  #15 $finish;

initial begin
   $dumpfile("Ejercicio1_tb.vcd");
   $dumpvars(0, testbench);
end
endmodule
