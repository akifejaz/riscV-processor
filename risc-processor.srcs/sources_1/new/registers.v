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
//    input [1:0] Desflag,
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
//    output reg N,
//    output reg Z,
//    output reg C
    );

// 8 16 bit registers
wire [15:0] R0,R1,R2,R3,R4,R5,R6,R7;
//create mux for registers
mux1to8 m1(clk,result, DesReg, R0, R1, R2, R3, R4, R5, R6, R7);

//always @(posedge clk) begin
//    case (Desflag)
//        3'b00: N <= flagResult;
//        3'b01: Z <= flagResult;
//        3'b10: C <= flagResult;
//    endcase
//end

    
endmodule
