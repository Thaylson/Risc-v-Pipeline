`timescale 1ns / 1ps

module alu#(
        parameter DATA_WIDTH = 32,
        parameter OPCODE_LENGTH = 4
        )
        (
        input logic [DATA_WIDTH-1:0]    SrcA,
        input logic [DATA_WIDTH-1:0]    SrcB,

        input logic [OPCODE_LENGTH-1:0]    Operation,
        output logic[DATA_WIDTH-1:0] ALUResult
        );
    
        always_comb
        begin
             case(Operation)
                        4'b0000: ALUResult = $signed(SrcA) + $signed(SrcB); //add & addi
                        4'b0001: ALUResult = $signed(SrcA) - $signed(SrcB); //sub 
                        4'b0010: ALUResult = SrcA & SrcB; //and 
                        4'b0011: ALUResult = SrcA | SrcB; //or 
                        4'b0100: ALUResult = SrcA ^ SrcB; //xor 
                        4'b0101: ALUResult = SrcA << SrcB; // slli 
                        4'b0110: ALUResult = SrcA >> SrcB; // srli 
                        4'b0111: ALUResult = $signed(SrcA) >>> SrcB[4:0]; // srai 
                        4'b1000: ALUResult = ($signed(SrcA)< $signed(SrcB)) ? 1 : 0; // slti & slt 
                        4'b1011: ALUResult = (SrcA == SrcB) ? 1 : 0; // beq
                        4'b1100: ALUResult = (SrcA != SrcB) ? 1 : 0; // bne
                        4'b1101: ALUResult = ($signed(SrcA) < $signed(SrcB)) ? 1 : 0; // blt
                        4'b1110: ALUResult = ($signed(SrcA) >= $signed(SrcB)) ? 1 : 0; // bge
                        4'b1111: ALUResult = {SrcB, 12'b0}; // lui
                        default: begin end
                endcase
        end
endmodule
