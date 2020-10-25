module testbench();
wire [7:0]codigo;
reg [11:0]dire;

MROM MR(dire, codigo);

initial begin
#1
$display("Memoria ROM Josue Salazar ");
$display("------------------------- ");
$display("Direccion  |  Codigo    ");
$monitor("    %b      |    %b", dire, codigo);
  dire = 12'b0;
#2 dire = 12'b000000000001;
#2 dire = 12'b000000000010;
#2 dire = 12'b000000000011;
#2 dire = 12'b000000000100;
end

initial
#20 $finish;

initial begin
    $dumpfile("Ejercicio2_tb.vcd");
    $dumpvars(0, testbench);
end
endmodule
