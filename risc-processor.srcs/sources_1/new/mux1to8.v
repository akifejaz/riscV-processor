`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2022 02:09:31 PM
// Design Name: 
// Module Name: mux1to8
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


module mux1to8(
    input clk,
    input [3:0] In,
    input [3:0] Sel,
    wire regMemWrite,
    input wire regMemRead,
    wire [7:0] regMemW,
    
    output reg [7:0] regMemR,
    output [15:0] Out0,
    output [15:0] Out1,
    output [15:0] Out2,
    output [15:0] Out3,
    output [15:0] Out4,
    output [15:0] Out5,
    output [15:0] Out6,
    output [15:0] Out7
    );
    
reg [15:0] Out0, Out1, Out2, Out3, Out4, Out5, Out6, Out7; 

initial begin
    Out0 <= 16'h0000;
    Out1 <= 16'h0000;
    Out2 <= 16'h0000;
    Out3 <= 16'h0000;
    Out4 <= 16'h0000;
    Out5 <= 16'h0000;
    Out6 <= 16'h0000;
    Out7 <= 16'h0000;
    regMemR <= 16'h0000;
end
   
always @(posedge clk) begin
   if(regMemWrite==0) begin 
        case(Sel)
            //put the output data to the selected input and the rest to 0
            4'b0000: begin Out0 <= {12'b0,In}; end
            4'b0001: begin Out1 <= {12'b0,In}; end
            4'b0010: begin Out2 <= {12'b0,In}; end
            4'b0011: begin Out3 <= {12'b0,In}; end
            4'b0100: begin Out4 <= {12'b0,In}; end
            4'b0101: begin Out5 <= {12'b0,In}; end
            4'b0110: begin Out6 <= {12'b0,In}; end
            4'b0111: begin Out7 <= {12'b0,In}; end

            default: begin
                Out0 <= 16'h0000;
                Out1 <= 16'h0000;
                Out2 <= 16'h0000;
                Out3 <= 16'h0000;
                Out4 <= 16'h0000;
                Out5 <= 16'h0000;
                Out6 <= 16'h0000;
                Out7 <= 16'h0000;
            end     

        endcase
   end
   
   else if(regMemWrite==1) begin
        case (Sel)
            4'b0000: begin Out0 = regMemW; end 
            4'b0001: begin Out1 = regMemW; end
            4'b0010: begin Out2 = regMemW; end
            4'b0011: begin Out3 = regMemW; end
            4'b0100: begin Out4 = regMemW; end
            4'b0101: begin Out5 = regMemW; end
            4'b0110: begin Out6 = regMemW; end
            4'b0111: begin Out7 = regMemW; end
            
            default: begin
                Out0 <= 16'h0000;
                Out1 <= 16'h0000;
                Out2 <= 16'h0000;
                Out3 <= 16'h0000;
                Out4 <= 16'h0000;
                Out5 <= 16'h0000;
                Out6 <= 16'h0000;
                Out7 <= 16'h0000;
            end 
        endcase
   end
   
   else if (regMemRead == 1) begin
        case (Sel)
            4'b0000: begin regMemR <= Out0; end
            4'b0001: begin regMemR <= Out1; end
            4'b0010: begin regMemR <= Out2; end
            4'b0011: begin regMemR <= Out3; end
            4'b0100: begin regMemR <= Out4; end
            4'b0101: begin regMemR <= Out5; end
            4'b0110: begin regMemR <= Out6; end
            4'b0111: begin regMemR <= Out7; end 
            default: begin
                Out0 <= 16'h0000;
                Out1 <= 16'h0000;
                Out2 <= 16'h0000;
                Out3 <= 16'h0000;
                Out4 <= 16'h0000;
                Out5 <= 16'h0000;
                Out6 <= 16'h0000;
                Out7 <= 16'h0000;
            end 
        endcase
   end
   
 
 end
endmodule