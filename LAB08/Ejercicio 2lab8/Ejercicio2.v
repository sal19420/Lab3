module MROM(input wire [11:0]dire, output wire [7:0]codigo);
reg [7:0] ROM [0:4095];
initial begin
  $readmemh("ejercicio2l8.list", ROM);
end
assign codigo = ROM[dire];
endmodule
