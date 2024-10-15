`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 04:08:16 PM
// Design Name: 
// Module Name: top_model
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


module top_model(i0t,i1t,i2t,i3t,st,segt);
 input [1:0]i0t,i1t,i2t,i3t;
 input[1:0]st;
 output [6:0]segt;

wire [1:0] yt;
wire [3:0] ytt;

assign ytt = {2'b00,yt};

 BCD_7 uut1(.i(ytt), .seg(segt));
 Mux_4to1_struc uut2(yt,i0t,i1t,i2t,i3t,st);
endmodule

module BCD_7(i,seg);
input[3:0]i;
output reg [6:0] seg;

always @(i)
begin
   case (i)
   4'b0000: seg = 7'b1000000;
   4'b0001: seg = 7'b1111001;
   4'b0010: seg = 7'b0100100;
   4'b0011: seg = 7'b0110000;
   4'b0100: seg = 7'b0011001;
   4'b0101: seg = 7'b0010010;
   4'b0110: seg = 7'b0000010;
   4'b0111: seg = 7'b1111000;
   4'b1000: seg = 7'b0000000;
   4'b1001: seg = 7'b0010000;
   default: seg = 7'bxxxxxx;
 endcase
end
endmodule



module Mux_4to1_struc(o,i0,i1,i2,i3,s);

 input [1:0]i0,i1,i2,i3;
 input[1:0]s;
 output [1:0]o;

wire NS0, NS1;
wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

not N1(NS0, s[0]);
not N2(NS1, s[1]);

    and A1(Y0, i0[0], NS1, NS0);//yp0[0]
    and A2(Y1, i0[1], NS1, NS0);//yp0[1]
    
    and A3(Y2, i1[0], NS1, s[0]);//yp1[0]
    and A4(Y3, i1[1], NS1, s[0]);//yp1[1]
    
    and A5(Y4, i2[0], s[1], NS0);//yp2[0]
    and A6(Y5, i2[1], s[1], NS0);//yp2[1]
    
    and A7(Y6, i3[0], s[1], s[0]);//yp3[0]
    and A8(Y7, i3[1], s[1], s[0]);//yp3[1]

    or O1(o[0], Y0, Y2, Y4, Y6);
    or O2(o[1], Y1, Y3, Y5, Y7);
    

endmodule