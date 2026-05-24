module UnidadDeControl (
    input  [5:0] OpCode,
    output reg   RegDst,
    output reg   Branch,
    output reg   MemRead,
    output reg   MemToReg,
    output reg [1:0] ALUOp,
    output reg   MemWrite,
    output reg   ALUSrc,
    output reg   RegWrite
);
    always @* begin
        case (OpCode)
            6'b000000: begin   // Tipo R
                RegDst   = 1'b1;
                ALUSrc   = 1'b0;
                MemToReg = 1'b0;
                RegWrite = 1'b1;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b10;
            end
            // Plantilla extra sugerida por el diagrama (ej. lw, sw, beq)
            default: begin
                RegDst   = 1'b0;
                ALUSrc   = 1'b0;
                MemToReg = 1'b0;
                RegWrite = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
            end
        endcase
    end
endmodule
