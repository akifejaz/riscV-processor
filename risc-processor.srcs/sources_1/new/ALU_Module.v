`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2022 05:18:36 AM
// Design Name: 
// Module Name: ALU_Module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_Module(
    input clk,
    input [3:0]A,
    input [3:0]B,
    input [3:0]Opcode,
    
    output reg [3:0]Output,
    output reg N,Z,C
//    output wire [15:0] R0,R1,R2,R3,R4,R5,R6,R7
    );

always @(negedge clk)
    begin
    $display("Opcode =%d A =%d B =%d Output =%d",Opcode,A,B,Output);
        case(Opcode)
           // add adds data from source registers and saves to destination register.
            4'b0000: begin { C, Output} = A + B; end
            
            // sub subtracts source register values and saves to destination register.
            4'b0001: begin { C, Output} = A - B; end

            // and compares reg1 with reg2 and saves 1 if reg1>reg2 else saves zero in the estination.
            4'b0010: begin Output = A > B; end

            // cat concatenates the most significant 4bits of reg1 and reg2.
            4'b0011: begin Output = {A[3:0],B[3:0]}; end

            // load instructions move data from memory at 8-bit address to registers.
            4'b0100: begin Output = A; end

            // store instructions move data from registers to memory at 8-bit address.
            4'b0101: begin Output = A; end

            // remv stores zero to memory at 8-bit address.
            4'b0110: begin Output = 0; end

            // ceil stores FFFF to memory at 8-bit address.
            4'b0111: begin Output = 16'b1111111111111111; end

            // mov stores reg1 to destination register.
            4'b1000: begin Output = A; end

            // clr sets destination register to zero.
            4'b1001: begin Output = 0; end

            // inc increments destination register.
            4'b1010: begin Output = A + 1; end

            // dec decrements destination register.
            4'b1011: begin Output = A - 1; end

            // shl left shifts the contents of the destination register by the number at reg2.
            4'b1100: begin Output = A << B; end

            // shr right shifts the contents of the destination register by the number at reg2.
            4'b1101: begin Output = A >> B; end

            // rol left rotates the contents of the destination register by the number at reg2.
            4'b1110: begin Output = {A[3:0],B[3:0]}; end

            // ror right rotates the contents of the destination register by the number at reg2.
            4'b1111: begin Output = {A[3:0],B[3:0]}; end
            
            default: begin Output = 0; N = 0; Z = 0; C=0; end

        endcase
    end    
    
endmodule
