module BT_4B (input wire EN, input wire [0:3]I, output wire [0:3]Y);

assign Y = (EN) ? I:4'bz;
endmodule
