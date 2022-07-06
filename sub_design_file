`timescale 1ns / 1ps

// File name : sub_design_file.v
//
// Author : Lopelli Shiva Nagender Rao
//
// Description : This file also contains definations
//               of ParialProductGenerator,PartialProductReduction,CarrySaveAdder and CarryPropagateArray
//

module PartialProductGenerator (A,B,P0,P1,P2,P3,P4,P5,P6,P7,P8);
input [15:0] A;
input [8:0] B;
output reg [15:0] P0,P1,P2,P3,P4,P5,P6,P7,P8;

always @*
begin
	P0= A & {16{B[0]}};
	P1= A & {16{B[1]}};
	P2= A & {16{B[2]}};
	P3= A & {16{B[3]}};
	P4= A & {16{B[4]}};
	P5= A & {16{B[5]}};
	P6= A & {16{B[6]}};
	P7= A & {16{B[7]}};
	P8= A & {16{B[8]}};
end

endmodule

module PartialProductReduction(X0,X1,X2,X3,X4,X5,X6,X7,X8,S,C);
input [15:0] X0;
input [15:0] X1;
input [15:0] X2;
input [15:0] X3;
input [15:0] X4;
input [15:0] X5;
input [15:0] X6;
input [15:0] X7;
input [15:0] X8;
output [24:0] S;
output [24:0] C;

reg [24:0]  pp0=25'd0,pp1=25'd0,pp2=25'd0,pp3=25'd0,pp4=25'd0,pp5=25'd0,pp6=25'd0,pp7=25'd0,pp8=25'd0;
wire [24:0] S1,S2,S3,S4,S5,S6;
wire [24:0] C1,C2,C3,C4,C5,C6;

assign C1[0]=0,C2[0]=0,C3[0]=0,C4[0]=0,C5[0]=0,C6[0]=0,C[0]=0;

always @*
begin
 	pp0=X0;
	pp1=X1<<1;
	pp2=X2<<2;
	pp3=X3<<3;
	pp4=X4<<4;
	pp5=X5<<5;
	pp6=X6<<6;
	pp7=X7<<7;
	pp8=X8<<8;
end

CarrySaveAdder CSA_lvl1_1 (pp0,pp1,pp2,S1,C1);
CarrySaveAdder CSA_lvl1_2 (pp3,pp4,pp5,S2,C2);
CarrySaveAdder CSA_lvl1_3 (pp6,pp7,pp8,S3,C3);

CarrySaveAdder CSA_lvl2_1 (S1,C1,S2,S4,C4);
CarrySaveAdder CSA_lvl2_2 (C2,S3,C3,S5,C5);

CarrySaveAdder CSA_lvl3 (S4,C4,S5,S6,C6);

CarrySaveAdder CSA_lvl4 (S6,C6,C5,S,C);

endmodule

module CarrySaveAdder (X,Y,Z,S,C);
input [24:0] X;
input [24:0] Y;
input [24:0] Z;
output [24:0] S;
output [24:0] C;

wire Cout;

assign C[0] = 0;

genvar i;
generate
	for (i=0;i<24;i=i+1)
	begin: full_addr_inst
		full_adder F_i (X[i],Y[i],Z[i],S[i],C[i+1]);
	end
endgenerate

full_adder F_out (X[24],Y[24],Z[24],S[24],Cout);

endmodule

module CarryPropgateArray (X,Y,Out);
input [24:0] X,Y;
output [24:0] Out;

wire [25:0] a;

assign a[0]=0;

genvar i;
generate
	for (i=0;i<25;i=i+1)
	begin:CPA
		full_adder F1 (X[i],Y[i],a[i],Out[i],a[i+1]);
	end
endgenerate

endmodule

module full_adder (A,B,C,Sum,Carry);
input A,B,C;
output reg Sum,Carry;

always @ (A,B,C)
begin
	Sum=A ^ B ^ C;
	Carry= (A&B) | (B&C) | (C&A);
end

endmodule
