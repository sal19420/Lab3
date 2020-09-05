module fliflopd(input logic clk, reset, en, [3:0]d, output logic [3:0]q);

  always @(posedge clk, posedge reset)
    if (reset) q <= 4 'b0;
    else if (en) q <= d;
endmodule
