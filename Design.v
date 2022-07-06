timescale 1ns / 1ps
`include "sub_design_file.v"
// File name : Design.v
//
// Author : Lopelli Shiva Nagender Rao
//
// Description : This file contains the logic for Mulplixer16_9_d2 design. 
//
module Multiplier_16_9_d2 (M,N,Result);
input [15:0] M;
input [8:0] N;
output [24:0] Result;

wire [15:0] PP0,PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8;
wire [24:0] S0,C0;

PartialProductGenerator PPG (M,N,PP0,PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8);
PartialProductReduction PPR (PP0,PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8,S0,C0);
CarryPropgateArray      CPA (S0,C0,Result);

endmodule
