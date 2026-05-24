module UnidadDeControl (
    input  [5:0] OpCode,
    output reg   RegDst,
    output reg   Branch,
    output reg   MemRead,
    output reg   MemToReg,
    output reg [2:0] ALUOp, // Bus expandido a 3 bits
    output reg   MemWrite,
    output reg   ALUSrc,
    output reg   RegWrite
);
    always @* begin
        // Valores por defecto (estado seguro)
        RegDst = 0; Branch = 0; MemRead = 0; MemToReg = 0;
        ALUOp = 3'b000; MemWrite = 0; ALUSrc = 0; RegWrite = 0;

        case (OpCode)
            6'b000000: begin // Tipo R (add, sub, and, or, slt)
                RegDst = 1'b1; ALUSrc = 1'b0; MemToReg = 1'b0; RegWrite = 1'b1;
                MemRead = 1'b0; MemWrite = 1'b0; Branch = 1'b0; ALUOp = 3'b010;
            end
            6'b100011: begin // lw (Cargar palabra)
                RegDst = 1'b0; ALUSrc = 1'b1; MemToReg = 1'b1; RegWrite = 1'b1;
                MemRead = 1'b1; MemWrite = 1'b0; Branch = 1'b0; ALUOp = 3'b000;
            end
            6'b101011: begin // sw (Guardar palabra)
                RegDst = 1'b0; ALUSrc = 1'b1; MemToReg = 1'b0; RegWrite = 1'b0;
                MemRead = 1'b0; MemWrite = 1'b1; Branch = 1'b0; ALUOp = 3'b000;
            end
            6'b000100: begin // beq (Salto condicional)
                RegDst = 1'b0; ALUSrc = 1'b0; MemToReg = 1'b0; RegWrite = 1'b0;
                MemRead = 1'b0; MemWrite = 1'b0; Branch = 1'b1; ALUOp = 3'b001;
            end
            6'b001000: begin // addi (Suma inmediata)
                RegDst = 1'b0; ALUSrc = 1'b1; MemToReg = 1'b0; RegWrite = 1'b1;
                MemRead = 1'b0; MemWrite = 1'b0; Branch = 1'b0; ALUOp = 3'b000;
            end
            6'b001010: begin // slti (Set less than inmediato)
                RegDst = 1'b0; ALUSrc = 1'b1; MemToReg = 1'b0; RegWrite = 1'b1;
                MemRead = 1'b0; MemWrite = 1'b0; Branch = 1'b0; ALUOp = 3'b011;
            end
            6'b001100: begin // andi (AND inmediato)
                RegDst = 1'b0; ALUSrc = 1'b1; MemToReg = 1'b0; RegWrite = 1'b1;
                MemRead = 1'b0; MemWrite = 1'b0; Branch = 1'b0; ALUOp = 3'b100;
            end
            6'b001101: begin // ori (OR inmediato)
                RegDst = 1'b0; ALUSrc = 1'b1; MemToReg = 1'b0; RegWrite = 1'b1;
                MemRead = 1'b0; MemWrite = 1'b0; Branch = 1'b0; ALUOp = 3'b101;
            end
        endcase
    end
endmodule