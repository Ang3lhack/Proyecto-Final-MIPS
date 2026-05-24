// UnidadDeControl.v
// Unidad de Control Principal para MIPS de 32 bits
// Soporta instrucciones Tipo R, Tipo I y Tipo J (Fase 3)
// Instrucciones: add, sub, and, or, slt, nop | lw, sw, addi, ori, andi, slti, beq | j, jal

module UnidadDeControl (
    input  [5:0] OpCode,
    output reg   RegDst,
    output reg   Branch,
    output reg   MemRead,
    output reg   MemToReg,
    output reg [2:0] ALUOp,
    output reg   MemWrite,
    output reg   ALUSrc,
    output reg   RegWrite,
    output reg   Jump,       // FASE 3: Activa salto incondicional (j / jal)
    output reg   JumpLink    // FASE 3: Activa escritura PC+4 en $ra=31 (solo jal)
);

    always @* begin
        // Valores por defecto (NOP / instrucción desconocida)
        RegDst   = 1'b0;
        Branch   = 1'b0;
        MemRead  = 1'b0;
        MemToReg = 1'b0;
        ALUOp    = 3'b000;
        MemWrite = 1'b0;
        ALUSrc   = 1'b0;
        RegWrite = 1'b0;
        Jump     = 1'b0;
        JumpLink = 1'b0;

        case (OpCode)
            // ──────────── TIPO R ────────────
            6'b000000: begin   // add, sub, and, or, slt, nop
                RegDst   = 1'b1;
                ALUOp    = 3'b010;
                RegWrite = 1'b1;
            end

            // ──────────── TIPO I ────────────
            6'b100011: begin   // lw
                ALUSrc   = 1'b1;
                MemToReg = 1'b1;
                RegWrite = 1'b1;
                MemRead  = 1'b1;
                ALUOp    = 3'b000;
            end
            6'b101011: begin   // sw
                ALUSrc   = 1'b1;
                MemWrite = 1'b1;
                ALUOp    = 3'b000;
            end
            6'b001000: begin   // addi
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
                ALUOp    = 3'b000;
            end
            6'b001101: begin   // ori
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
                ALUOp    = 3'b101;
            end
            6'b001100: begin   // andi
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
                ALUOp    = 3'b100;
            end
            6'b001010: begin   // slti
                ALUSrc   = 1'b1;
                RegWrite = 1'b1;
                ALUOp    = 3'b011;
            end
            6'b000100: begin   // beq
                Branch   = 1'b1;
                ALUOp    = 3'b001;
            end

            // ──────────── TIPO J (FASE 3) ────────────
            6'b000010: begin   // j  (Jump)
                Jump     = 1'b1;
            end
            6'b000011: begin   // jal (Jump and Link)
                Jump     = 1'b1;
                JumpLink = 1'b1;
                RegWrite = 1'b1; // Escribe PC+4 en $ra (reg 31)
            end

            default: ; // NOP – todos los controles quedan en 0
        endcase
    end

endmodule
