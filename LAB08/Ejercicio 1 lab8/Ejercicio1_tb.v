module testbench();
reg clk, reset, En, NBL;
reg [11:0]load;
wire [11:0]s;

cont12 c12(clk, reset, En, NBL, load, s);

always
    #1 clk = ~clk;

initial begin
  $display("---------------------------------------");
  $display("Clk | reset | Enable | Non-Blocking (o Neto Bran) |        Load      |         Salida       ");
  $monitor("  %b     %b      %b                %b                       %b                 %b", clk, reset, En, NBL, load, s);
  clk = 0; reset = 0; En = 0; NBL = 0; load= 12'b000000000000;
  #1 reset = 0;
  #1 reset = 0;
  #1 reset = 0;
  #1 reset = 0;
  #1 reset = 0;
  #1 reset = 1;
  #1 reset = 0;
  #1 NBL = 1; load = 12'b000010010010;
  #1 NBL = 1; load = 12'b001100010000;
  #1 NBL = 1; En = 1;
  #1 En = 1;
end

initial
  #200 $finish;

initial begin
   $dumpfile("Ejercicio1_tb.vcd");
   $dumpvars(0, testbench);
end
endmodule
