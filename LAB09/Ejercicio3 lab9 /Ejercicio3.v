module flipfD(input wire CLK, RESET, EN, D, output reg Q);
  always @ (posedge CLK or posedge RESET)begin
    if(RESET)
      Q <= 1'b0;
    else if (EN)
      Q <= D;
  end
endmodule


module flipJK(input wire CLK, RESET, EN, J, K, output wire Q);
  wire NJ, NK, s1, s2, q;

  not(NQ, Q);
  not(NK, K);
  and(s1, J, NQ);
  and(s2, NK, Q);
  or(q, s1, s2);

  flipfD FJK(CLK, RESET, EN, q, Q);

endmodule
