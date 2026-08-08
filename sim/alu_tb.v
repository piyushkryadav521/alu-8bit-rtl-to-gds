`timescale 1ns/1ps

module alu_tb;

reg  [7:0] A;
reg  [7:0] B;
reg  [2:0] opcode;

wire [7:0] result;
wire       carry;
wire       zero;

alu_8bit uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry),
    .zero(zero)
);

initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    // ADD
    A = 8'd10;
    B = 8'd5;
    opcode = 3'b000;
    #10;

    // SUB
    A = 8'd10;
    B = 8'd5;
    opcode = 3'b001;
    #10;

    // AND
    A = 8'b10101010;
    B = 8'b11001100;
    opcode = 3'b010;
    #10;

    // OR
    opcode = 3'b011;
    #10;

    // XOR
    opcode = 3'b100;
    #10;

    // NOT
    opcode = 3'b101;
    #10;

    // SHIFT LEFT
    A = 8'b00001111;
    opcode = 3'b110;
    #10;

    // SHIFT RIGHT
    A = 8'b11110000;
    opcode = 3'b111;
    #10;

    $finish;

end

endmodule
