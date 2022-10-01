`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: BY: AKIFEJAZ
// 
// Create Date: 09/28/2022 03:40:37 AM
// Design Name: TEST BENCH FOR PROCESSOR
// Module Name: processor_Test
// Project Name: RISC-V BASED PROCESSOR
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


module processor_Test();
    reg clk;
    reg [3:0] wea;                  // write enable signal
    reg [31:0] addra;               // address
    reg [31:0] dina;         // data in

    // Outputs
    wire [31:0] douta;               // data out
    wire [3:0] Output;               //ALU Result
    wire N,Z,C;                      //Flags, Zero, Negtive, Carry
    wire [15:0] R0,R1,R2,R3,R4,R5,R6,R7;

// --------------------------- UUT -----------------------------    
    // Instantiate the Unit Under Test (UUT)
    
    processor uut( //clk,writeEn,addres,inputA,outputA
    clk,wea,addra,dina,douta,Output,N,Z,C,
        R0,R1,R2,R3,R4,R5,R6,R7
    );
    
// --------------------------- UUT -----------------------------
    


// INSTRUCTIONS FOR READING WRITING

//READ !! For reading wen = 0, give address of memory location that you want to write in 'addra',
// after 2 CLK cycle Value will be available in 'douta' reg

//WRITE !!
//


// ----------------------- CLK ---------------------------
    always begin
        #15 clk =~clk;
    end

// ---------------------- Saparate Tasks For Reading Writing ------------------------------------

    task write;    
        begin
            addra <= addra + 1;        //address Where to Write
            dina <= dina+1;            //Data To Write
        end
    endtask

    task read; 
        begin
            addra <= addra + 1;         //Adress of Data to Read
        end
    endtask


// ----------------------------- Initial Begin That runs @

reg [1:0] writing;
integer counter;
    
    initial begin
//        // Initialize Inputs
        clk = 0;
        addra = 0;
        dina = 666;       //not used in case of reading : temp value 
        
        counter = 0;     //Tacking Record Of Values from the OCE File
        wea <=0;         // stop writing
        
        writing = 2'b00; //CHANGE STATE HERE : 0 = reading , 1 = writing , 2 = nothing/IDLE
        
//        // Wait 'NTime' ns for global reset to finish : Where NTime is the Execution of Read Operations
//        #100;
//        wea <= 4'b1111;
//        writing <=2'b01;
    end

// -------------------------- ALWAYS BLOCKS ------------------- 

    always @(posedge clk)begin
        case(writing)
//            1: if(counter<10) begin
//                    write;
//                    counter <=counter+1;
//                end else begin
//                    writing <=0;    // change state to reading
//                    counter <=0;
//                    addra <= 0;
//                    wea <=0;    // stop writing
//                end
            0:  if(counter<16) begin   //because i only have 16 valid values in my OCE File
                    read;
                    counter <=counter+1;
                end else begin // change addra to zero and do nothing
                    addra <= 0;
                    writing <=2'b10; //goto idle state
                end
            2: if(1) begin
                    //do nothing
                end
        endcase
    end
    
endmodule
