module testbench8();

reg [6:0]I;
wire [12:0]O;

DECODE MROM(I, O);

initial begin
#4200
$display("      IN      | Funcion de la ROM ");
$monitor("      %b               %b", I, O);
I = 7'b??????0;
#2 I = 7'b00001?1;
#2 I = 7'b00000?1;
#2 I = 7'b00011?1;
#2 I = 7'b00010?1;
#2 I = 7'b0010??1;
#2 I = 7'b0011??1;
#2 I = 7'b0100??1;
#2 I = 7'b0101??1;
#2 I = 7'b0110??1;
#2 I = 7'b0111??1;
#2 I = 7'b1000?11;
#2 I = 7'b1000?01;
#2 I = 7'b1001?11;
#2 I = 7'b1001?01;
#2 I = 7'b1010??1;
#2 I = 7'b1011??1;
#2 I = 7'b1100??1;
#2 I = 7'b1101??1;
#2 I = 7'b1110??1;
#2 I = 7'b1111??1;
#2 I = 7'b10110?1;
#2 I = 7'b00111?1;
#2 I = 7'b0110?01;
#2 I = 7'b01110?1;
#2 I = 7'b1010101;

end
initial
  #4300 $finish;

initial begin
  $dumpfile("DECODER_tb.vcd");
  $dumpvars(0, testbench8);
end
endmodule