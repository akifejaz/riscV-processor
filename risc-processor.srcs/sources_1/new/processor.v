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
    output wire [15:0] R0,R1,R2,R3,R4,R5,R6,R7,
    
    output wire regMemWrite,
    output reg regMemRead,
    output wire [7:0] regMemW,regMemR
    );

//calling RAM instance for data
blk_mem ram(clk ,wea ,addra ,dina, douta );    
reg [3:0] tempReg;

always @(posedge clk) begin
 tempReg = douta[15:12];
    case(tempReg)
        4'b1010: begin regMemRead = 1; end
        4'b1011: begin regMemRead = 1; end
        default: regMemRead = 0; 
    endcase
end

//calling the alu instance for computation
ALU_Module alu(clk,douta,regMemWrite,regMemW,regMemR,Output,N,Z,C);
//ALU_Module alu(clk,douta[7:4],douta[3:0],douta[15:12],douta[11:8]);

// Instantiate the Unit Under Test (UUT)
registers r(
    clk,Output,douta[11:8],regMemWrite,regMemRead,regMemW,regMemR,
    R0,R1,R2,R3,R4,R5,R6,R7
);
    
endmodule
