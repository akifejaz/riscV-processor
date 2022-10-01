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

always @(posedge clk) begin
    case (Sel)
        //put the Input data to the selected output and the rest to 0
        4'b0000: begin
            //since input is 4 bits append 12 zeros to the right
            Out0 <= {12'b0, In};
            Out1 <= 16'h0000;
            Out2 <= 16'h0000;
            Out3 <= 16'h0000;
            Out4 <= 16'h0000;
            Out5 <= 16'h0000;
            Out6 <= 16'h0000;
            Out7 <= 16'h0000;
        end
        4'b0001: begin
            Out0 <= 16'h0000;
            Out1 <= {12'b0, In};
            Out2 <= 16'h0000;
            Out3 <= 16'h0000;
            Out4 <= 16'h0000;
            Out5 <= 16'h0000;
            Out6 <= 16'h0000;
            Out7 <= 16'h0000;
        end
        4'b0010: begin
            Out0 <= 16'h0000;
            Out1 <= 16'h0000;
            Out2 <= {12'b0, In};
            Out3 <= 16'h0000;
            Out4 <= 16'h0000;
            Out5 <= 16'h0000;
            Out6 <= 16'h0000;
            Out7 <= 16'h0000;
        end
        4'b0011: begin
            Out0 <= 16'h0000;
            Out1 <= 16'h0000;
            Out2 <= 16'h0000;
            Out3 <= {12'b0, In};
            Out4 <= 16'h0000;
            Out5 <= 16'h0000;
            Out6 <= 16'h0000;
            Out7 <= 16'h0000;
        end
        4'b0100: begin
            Out0 <= 16'h0000;
            Out1 <= 16'h0000;
            Out2 <= 16'h0000;
            Out3 <= 16'h0000;
            Out4 <= {12'b0, In};
            Out5 <= 16'h0000;
            Out6 <= 16'h0000;
            Out7 <= 16'h0000;
        end
        4'b0101: begin
            Out0 <= 16'h0000;
            Out1 <= 16'h0000;
            Out2 <= 16'h0000;
            Out3 <= 16'h0000;
            Out4 <= 16'h0000;
            Out5 <= {12'b0, In};
            Out6 <= 16'h0000;
            Out7 <= 16'h0000;
        end
        4'b0110: begin
            Out0 <= 16'h0000;
            Out1 <= 16'h0000;
            Out2 <= 16'h0000;
            Out3 <= 16'h0000;
            Out4 <= 16'h0000;
            Out5 <= 16'h0000;
            Out6 <= {12'b0, In};
            Out7 <= 16'h0000;
        end
        4'b0111: begin
            Out0 <= 16'h0000;
            Out1 <= 16'h0000;
            Out2 <= 16'h0000;
            Out3 <= 16'h0000;
            Out4 <= 16'h0000;
            Out5 <= 16'h0000;
            Out6 <= 16'h0000;
            Out7 <= {12'b0, In};
        end
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

endmodule