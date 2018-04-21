module signext(	input logic [15:0] a,
		input logic oneOrZero,
		output logic [31:0] y);
	assign y = oneOrZero? {{16'b0},a} : {{16{a[15]}},a}; 
endmodule
