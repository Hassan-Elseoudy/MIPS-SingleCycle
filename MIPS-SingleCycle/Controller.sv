module controller(input logic [5:0] op, funct, 
input logic zero, 
output logic memtoreg, memwrite, 
output logic pcsrc, alusrc, 
output logic regdst, regwrite, 
output logic jump,
output logic [2:0] alucontrol,
output logic oneOrZero);
logic [1:0] aluop; 
logic [1:0] branch;
maindec md(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, oneOrZero, aluop); 
aludec ad(funct, aluop, alucontrol);
assign pcsrc = (~branch[0] & branch[1] & zero) | (branch[0] & branch[1] & ~zero); 
endmodule

