// Colocar los modulos de todos los FFD

// Fetch 8b
module flipD1_F(input wire CLK, RESET, EN, D, output reg Q);
  always @ (posedge CLK or posedge RESET)begin
    if(RESET)
      Q <= 1'b0;
    else if (EN)
      Q <= D;
  end
endmodule

module flipD2_F(input wire CLK, RESET, EN, input wire [0:1]D2, output wire [0:1]Q2);

  flipD1_F F2_1(CLK, RESET, EN, D2[0], Q2[0]);
  flipD1_F F2_2(CLK, RESET, EN, D2[1], Q2[1]);
endmodule

module flipD4_F(input wire CLK, RESET, EN, input wire [0:3]D4, output wire [0:3]Q4);
  flipD2_F F4_1(CLK, RESET, EN, D4[0:1], Q4[0:1]);
  flipD2_F F4_2(CLK, RESET, EN, D4[2:3], Q4[2:3]);
endmodule

module flipD8_F(input wire CLK, RESET, EN, input wire [0:7]D5, output wire [0:3]Q5, output wire [0:3]Q6);
  flipD4_F F8_1(CLK, RESET, EN, D5[0:3], Q5);
  flipD4_F F8_2(CLK, RESET, EN, D5[4:7], Q6);
endmodule

// Flags 2b
module flipD1_flags(input wire CLK, RESET, EN, D, output reg Q);
  always @ (posedge CLK or posedge RESET)begin
    if(RESET)
      Q <= 1'b0;
    else if (EN)
      Q <= D;
  end
endmodule

module flipD2_fl(input wire CLK, RESET, EN, input wire [1:0]D2, output wire Q2C, Q2Z);

  flipD1_flags F2_1(CLK, RESET, EN, D2[1], Q2C);
  flipD1_flags F2_2(CLK, RESET, EN, D2[0], Q2Z);
endmodule

// Accu 4b
module flipD1_A(input wire CLK, RESET, EN, D, output reg Q);
  always @ (posedge CLK or posedge RESET)begin
    if(RESET)
      Q <= 1'b0;
    else if (EN)
      Q <= D;
  end
endmodule

module flipD2_A(input wire CLK, RESET, EN, input wire [0:1]D2, output wire [0:1]Q2);      

  flipD1_A F2_1(CLK, RESET, EN, D2[0], Q2[0]);
  flipD1_A F2_2(CLK, RESET, EN, D2[1], Q2[1]);
endmodule

module ACCU(input wire CLK, RESET, EN, input wire [0:3]D4, output wire [0:3]Q4);
  flipD2_A F4_1(CLK, RESET, EN, D4[0:1], Q4[0:1]);
  flipD2_A F4_2(CLK, RESET, EN, D4[2:3], Q4[2:3]);
endmodule

// Outs 4b
module flipD1_O(input wire CLK, RESET, EN, D, output reg Q);
  always @ (posedge CLK or posedge RESET)begin
    if(RESET)
      Q <= 1'b0;
    else if (EN)
      Q <= D;
  end
endmodule

module flipD2_O(input wire CLK, RESET, EN, input wire [0:1]D2, output wire [0:1]Q2);

  flipD1_O F2_1(CLK, RESET, EN, D2[0], Q2[0]);
  flipD1_O F2_2(CLK, RESET, EN, D2[1], Q2[1]);
endmodule

module OUT(input wire CLK, RESET, EN, input wire [0:3]D4, output wire [0:3]Q4);
  flipD2_O F4_1(CLK, RESET, EN, D4[0:1], Q4[0:1]);
  flipD2_O F4_2(CLK, RESET, EN, D4[2:3], Q4[2:3]);
endmodule

// Colocar el FFT de Phase

// Phase 1b
module flipD_T(input wire CLK, RESET, D, output reg Q);
  always @ (posedge CLK or posedge RESET)begin
    if(RESET)
      Q <= 1'b0;
    else
      Q <= D;
  end
endmodule

module Phase(input wire CLK, RESET, output wire Q);
  flipD_T FT(CLK, RESET, ~Q, Q);
endmodule

// Program Counter 12b

module cont12_uP(input wire clk, reset, En, NBL, input wire [11:0]load, output reg [11:0]s);

  always @ (posedge clk or posedge reset)begin
      if(reset) // Se resetea a 0
          s <= 12'b000000000000;


      else if(NBL)// Mientras NBL este en 1 se carga la salida anterior
          s <= load;

      else if (En)// Se activa contador de 1 en 1
          s <= s + 1;
  end

endmodule


// ROM procesador
module PROM_uP(input wire [11:0]dire, output wire [7:0]codigo);
  reg [7:0] ROM [0:4095];
  initial begin
    $readmemh("memory.list", ROM);
  end
  assign codigo = ROM[dire];
endmodule


//Decode
module DECODE(input [6:0] I, output [12:0] O);
    
    reg [12:0] s;
    
    always @ (I)
        casez(I)
            // any
            7'b????_??0: s<= 13'b1000_000_001000;
            // JC
            7'b0000_1?1: s <= 13'b0100_000_001000;
            7'b0000_0?1: s <= 13'b1000_000_001000;
            // JNC
            7'b0001_1?1: s <= 13'b1000_000_001000;
            7'b0001_0?1: s <= 13'b0100_000_001000;
            // CMPI
            7'b0010_??1: s <= 13'b0001_001_000010;
            // CMPM
            7'b0011_??1: s <= 13'b1001_001_100000;
            // LIT
            7'b0100_??1: s <= 13'b0011_010_000010;
            // IN
            7'b0101_??1: s <= 13'b0011_010_000100;
            // LD
            7'b0110_??1: s <= 13'b1011_010_100000;
            // ST
            7'b0111_??1: s <= 13'b1000_000_111000;
            // JZ
            7'b1000_?11: s<= 13'b0100_000_001000;
            7'b1000_?01: s <= 13'b1000_000_001000;
            // JNZ
            7'b1001_?11: s<= 13'b1000_000_001000;
            7'b1001_?01: s <= 13'b0100_000_001000;
            // ADDI
            7'b1010_??1: s <= 13'b0011_011_000010;
            // ADDM
            7'b1011_??1: s <= 13'b1011_011_100000;
            // JMP
            7'b1100_??1: s <= 13'b0100_000_001000;
            // OUT
            7'b1101_??1: s <= 13'b0000_000_001001;
            // NANDI
            7'b1110_??1: s <= 13'b0011_100_000010;
            // NANDM
            7'b1111_??1: s <= 13'b1011_100_100000;
            default: s <= 13'b1111111111111;
        endcase
        
    assign O = s;
endmodule


// Bus driver 3 en total
// BUS Driver 1

module BT_4BL10_IN(input wire EN, input wire [0:3]I1, output wire [0:3]Y1);

  assign Y1 = (EN) ? I1:4'bz;
endmodule

// BUS Driver 2
module BT_4BL10_O(input wire EN, input wire [0:3]I2, output wire [0:3]Y2);

  assign Y2 = (EN) ? I2:4'bz;
endmodule

// BUS Driver 3
module BT_4BL10_A(input wire EN, input wire [0:3]I3, output wire [0:3]Y3);

  assign Y3 = (EN) ? I3:4'bz;
endmodule

// RAM

module RAM (input wire [0:11]address, input wire cs, we, output wire [0:3]data);
      reg [0:3]dataout;
      reg [0:3] mem[0:4095];

      assign data = (cs && ~we) ? dataout : 4'bzzzz;
      always @(address, data, cs, we)begin 

       if (cs && ~we)
            dataout = mem[address];
        if (cs && we)
            mem[address] = data; 
      end

endmodule

// ALU procesador
module ALUL10_up(
    input wire [3:0] A, B,
    input [2:0] COM,
    output carry, zero,
    output [3:0] R);
    
    reg [4:0] PM;
    
    always @ (A, B, COM)
        case (COM)
            3'b000: PM = A; // Dejar pasar A
            3'b001: PM = A - B; // resta
            3'b010: PM = B; // Dejar pasar B
            3'b011: PM = A + B; // Sumar
            3'b100: PM = {1'b0, ~(A & B)}; // Comparador
            default: PM = 5'b10101;
        endcase
    
    assign R = PM[3:0];
    assign carry = PM[4];
    assign zero = ~(PM[3] | PM[2] | PM[1] | PM[0]);
    
endmodule


// Circuito completo

module uP(input wire clock, reset, input wire [3:0]pushbuttons, output wire phase, c_flag, z_flag, output wire [3:0]instr, output wire [3:0]oprnd, output wire [3:0]data_bus, output wire [3:0]FF_out, output wire [3:0]accu, output wire [7:0]program_byte, output wire [11:0]PC, output wire [11:0]address_RAM);
  wire [12:0]dec;
  wire ZE;
  wire C;
  wire [3:0]SALU;
  wire [6:0]J;
  assign J = {instr, c_flag, z_flag, phase};
  assign address_RAM = {oprnd, program_byte};



  flipD8_F Fetch(.CLK(clock), .RESET(reset), .EN(~phase), .D5(program_byte), .Q5(instr), .Q6(oprnd));
  flipD2_fl flags(.CLK(clock), .RESET(reset), .EN(dec[9]), .D2({C, ZE}), .Q2C(c_flag), .Q2Z(z_flag));
  ACCU aaaacccuuuu(.CLK(clock), .RESET(reset), .EN(dec[10]), .D4(SALU), .Q4(accu));
  OUT out(.CLK(clock), .RESET(reset), .EN(dec[0]), .D4(data_bus), .Q4(FF_out));
  Phase fase(.CLK(clock), .RESET(reset), .Q(phase));
  cont12_uP contador(.clk(clock), .reset(reset), .En(dec[12]), .NBL(dec[11]), .load(address_RAM), .s(PC));
  PROM_uP prom(.dire(PC), .codigo(program_byte));
  DECODE code(.I(J), .O(dec));
  BT_4BL10_IN BT1(.EN(dec[2]), .I1(pushbuttons), .Y1(data_bus));
  BT_4BL10_O BT2(.EN(dec[1]), .I2(oprnd), .Y2(data_bus));
  BT_4BL10_A BT3(.EN(dec[3]), .I3(SALU), .Y3(data_bus));
  RAM ram(.address(address_RAM), .cs(dec[5]), .we(dec[4]), .data(data_bus));
  ALUL10_up alu(.A(accu), .B(data_bus), .COM(dec[8:6]), .carry(C), .zero(ZE), .R(SALU));

endmodule
