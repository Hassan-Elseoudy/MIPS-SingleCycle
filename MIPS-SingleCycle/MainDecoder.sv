module maindec(input logic [5:0] op, 
output logic memtoreg, memwrite, 
output logic [1:0] branch, 
output logic alusrc, 
output logic regdst, regwrite, jump, oneOrZero,
output logic [1:0] aluop);

logic [10:0] controls;
assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop, oneOrZero} = controls;
always_comb 
case(op) 
6'b000000: controls <= 11'b11000000100; // RTYPE 
6'b100011: controls <= 11'b10100010000; // LW 
6'b101011: controls <= 11'b00100100000; // SW 
6'b000100: controls <= 11'b00010000010; // BEQ 
6'b001000: controls <= 11'b10100000000; // ADDI 
6'b000010: controls <= 11'b00000001000; // J 
6'b001101: controls <= 11'b10100000111; // ORI
6'b000101: controls <= 11'b00011000010;  // BNE
default:   controls <= 11'bxxxxxxxxxxx; // illegal op 
endcase 
endmodule
