`timescale 1ns / 1ps

// File name : TB.v
//
// Author : Lopelli Shiva Nagender Rao
//
// Description : This file contains the logic for TestBench to test Mulplixer16_9_d2 design logic

module testbench_mul_16_9_tb2;

reg [15:0] X;
reg [8:0] Y;
wire [24:0] Out;

Multiplier_16_9_d2 u_uut(X,Y,Out);

initial
begin
	$dumpfile("test2.vcd");
	$dumpvars(0,testbench_mul_16_9_tb2);

	X=16'b1010101010101010;
	Y=9'b101101011;
	#20;
	X=16'b1010010101010011;
	Y=9'b11011010;
	#20;
	X=16'd256;
	Y=9'd100;
	#20;
	X=16'd24618;
	Y=9'd500;
	#20 ;
	X=16'd8000;
	Y=9'd300;
	#20 ;
	$finish;
end

endmodule

