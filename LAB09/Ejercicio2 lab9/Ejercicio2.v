module flipD(input wire CLK, RESET, EN, D, output reg Q);
  always @ (posedge CLK or posedge RESET)begin
    if(RESET)
      Q <= 1'b0;
    else if (EN)
      Q <= D;
  end
endmodule

module flipT(input wire CLK, RESET, EN, output wire Q);
flipD FT(CLK, RESET, EN, ~Q, Q);
endmodule
