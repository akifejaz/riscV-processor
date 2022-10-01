`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2022 03:18:21 AM
// Design Name: 
// Module Name: processor
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


module processor( //clk,writeEn,addres,inputA,outputA
    input clk,
    input [3:0]wea,
    input [7:0]addra,
    input [15:0]dina,
    
    output [15:0]douta,
    output wire [3:0] Output,
    output wire N,Z,C,
    output wire [15:0] R0,R1,R2,R3,R4,R5,R6,R7
    );

//calling RAM instance for data
blk_mem ram(clk ,wea ,addra ,dina, douta );    

reg [3:0] DesReg, S1Reg,S2Reg,OpReg;
//wire [15:0] Output;

//at every postedge clock cycle
always @(posedge clk)
begin
//decode outputA the instruction and fetch the Opcode, Destination_R, Source1_R, Source2_R
// 16 bit instructions !!
OpReg = douta[15:12]; 
DesReg = douta[11:8];
S1Reg = douta[7:4];
S2Reg = douta[3:0];

$display("OpReg =%d DesReg =%d S1Reg =%d S2Reg =%d",OpReg,DesReg,S1Reg,S2Reg);
end

////calling the alu instance for computation
ALU_Module alu(clk,S1Reg,S2Reg,OpReg,Output,N,Z,C);
//ALU_Module alu(clk,douta[7:4],douta[3:0],douta[15:12],douta[11:8]);

// Instantiate the Unit Under Test (UUT)
registers r(
    clk,Output,douta[11:8],
    R0,R1,R2,R3,R4,R5,R6,R7
);
    
endmodule
