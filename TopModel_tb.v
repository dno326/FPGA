`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 03:31:24 PM
// Design Name: 
// Module Name: TopModel_tb
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

//Set up test input values i0t-i4t meaning values 0-3. Cycle through selector 00,01,02,03 and check 7 segment display
//For each st value the output of selected input is passed to the BCD_7 decoder and the pattern is produced
module top_model_tb;

    //wires
    reg [3:0] i0t, i1t, i2t, i3t;
    reg [1:0] st;
    wire [6:0] segt;
    
    top_model uut (i0t,i1t,i2t,i3t,st,segt);
    
    //initialize
    initial begin
        i0t = 4'b0000;
        i1t = 4'b0001;
        i2t = 4'b0010;
        i3t = 4'b0011;
        st = 2'b00;
    
        //simulate
        #10 st = 2'b00;
        #10 st = 2'b01;
        #10 st = 2'b10;
        #10 st = 2'b11;
        //stop
        #10 $stop;
    end
endmodule
