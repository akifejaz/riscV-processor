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
    input [15:0] douta,
    
    
    output reg regMemWrite,
    output reg [7:0] regMemW,
    input wire [7:0]regMemR,     //getting read data from the registers
    
    output reg [3:0]Output,     //simple functions output/result
    output reg N,Z,C

    );


//initial begin
//          regMemWrite = 0; regMemRead = 0;
//          regMemW = 8'b00000000; regMemR = 8'b00000000;
//end
    
reg [3:0] DesReg, S1Reg,S2Reg,OpReg;

always @(posedge clk)
begin
//decode outputA the instruction and fetch the Opcode, Destination_R, Source1_R, Source2_R
// 16 bit instructions !!
OpReg = douta[15:12]; 
DesReg = douta[11:8];
S1Reg = douta[7:4];
S2Reg = douta[3:0];

//$display("OpReg =%d DesReg =%d S1Reg =%d S2Reg =%d Instruction: =%b",OpReg,DesReg,S1Reg,S2Reg,douta);
end


always @(negedge clk)
    begin
        case(OpReg)
           // add adds data from source registers and saves to destination register.
            4'b0000: begin { C, Output} = S1Reg + S2Reg; regMemWrite = 0;  end
            
            // sub subtracts source register values and saves to destination register.
            4'b0001: begin { C, Output} = S1Reg - S2Reg; regMemWrite = 0;  end

            // and compares reg1 with reg2 and saves 1 if reg1>reg2 else saves zero in the estination.
            4'b0010: begin Output = S1Reg > S2Reg; regMemWrite = 0; end

            // cat concatenates the most significant 4bits of reg1 and reg2.
            4'b0011: begin Output = {S1Reg[3:0],S2Reg[3:0]}; regMemWrite = 0; end
//Read Operations
            // load instructions move data from memory at 8-bit address to registers. load reg0, memory0
            4'b0100: begin regMemW = douta[7:0]; regMemWrite = 1; end

            // store instructions move data from registers to memory at 8-bit address. Store reg2, memory2
            4'b0101: begin regMemW = douta[7:0]; regMemWrite = 1; end
//TODO: need to update !!
            // remv stores zero to memory at 8-bit address.
            4'b0110: begin regMemW = 8'b00000000; regMemWrite = 1; end

            // ceil stores FFFF to memory at 8-bit address.
            4'b0111: begin regMemW = 8'b11111111; regMemWrite = 1; end

            // mov stores reg1 to destination register.
            4'b1000: begin regMemW = {4'b0,S1Reg}; regMemWrite = 1; end

            // clr sets destination register to zero.
            4'b1001: begin regMemW = 8'b00000000; regMemWrite = 1;  end
//Write Back Operations
            // inc increments destination register.
            4'b1010: begin  {C, regMemW} = regMemR + 1; regMemWrite = 1; end

            // dec decrements destination register.
            4'b1011: begin {C, regMemW} = regMemR - 1; regMemWrite = 1; end

            // shl left shifts the contents of the destination register by the number at reg2.
            4'b1100: begin regMemW = regMemR << S2Reg; regMemWrite = 1; end

            // shr right shifts the contents of the destination register by the number at reg2.
            4'b1101: begin regMemW = regMemR >> S2Reg; regMemWrite = 1; end

            // rol left rotates the contents of the destination register by the number at reg2.
            4'b1110: begin regMemW = {regMemR,S2Reg[3:0]}; regMemWrite = 1; end
            
            // ror right rotates the contents of the destination register by the number at reg2.
            4'b1111: begin regMemW = {S2Reg[3:0],regMemR}; regMemWrite = 1; end
            
            default: begin Output = 0; N = 0; Z = 0; C=0; end

        endcase
        
    end
    
//always @(negedge clk)
//begin
//      regMemWrite = 0; regMemRead = 0;
//      regMemW = 8'b00000000; regMemR = 8'b00000000;
      
//$display("Negative Edge : regMemWrite =%d regMemRead =%d regMemW =%d regMemR =%d",regMemWrite,regMemRead,regMemW,regMemR);
//end    
endmodule
