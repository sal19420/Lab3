module testbench();

reg [3:0]A;
reg [3:0]B;
reg [2:0]COM;
wire [3:0]R;

ALU calc(A, B, COM, R);


initial begin
  #2
  $display("   A   |    B    |    COM    |   R    ");
  $display("--------------------------------------");
  $monitor("   %b       %b        %b         %b", A, B, COM, R);
      A = 4'b0000; B = 4'b0000; COM = 3'b000;
  #1 A = 4'b0001; B = 4'b0111; COM = 3'b000;
  #1 A = 4'b0010; B = 4'b0101; COM = 3'b001;
  #1 A = 4'b0011; B = 4'b0100; COM = 3'b010;
  #1 A = 4'b0100; B = 4'b0001; COM = 3'b100;
  #1 A = 4'b0101; B = 4'b0011; COM = 3'b101;
  #1 A = 4'b0110; B = 4'b0010; COM = 3'b110;
  #1 A = 4'b0111; B = 4'b0001; COM = 3'b111;

end
initial
#20 $finish;

initial begin
  $dumpfile("Ejercicio3_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
