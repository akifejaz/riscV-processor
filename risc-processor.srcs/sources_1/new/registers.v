`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2022 01:46:53 PM
// Design Name: 
// Module Name: registers
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


module registers(
 input clk,
    input [3:0] result,
//    input flagResult,

    input [3:0] DesReg,
    wire regMemWrite,
    input wire regMemRead,
    wire [7:0] regMemW,
    
    output wire [7:0] regMemR,
    //Eight 16-bit integer registers (R0, R1, R2, R3, R4, R5, R6, R7)
    // Flags Register (N, Z, C)
    output [15:0]R0,
    output [15:0]R1,
    output [15:0]R2,
    output [15:0]R3,
    output [15:0]R4,
    output [15:0]R5,
    output [15:0]R6,
    output [15:0]R7
    );

// 8 16 bit registers
wire [15:0] R0,R1,R2,R3,R4,R5,R6,R7;
//create mux for registers
mux1to8 m1(clk,result,DesReg,regMemWrite, regMemRead,regMemW,regMemR, R0, R1, R2, R3, R4, R5, R6, R7);


endmodule
