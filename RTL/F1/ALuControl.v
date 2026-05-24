// ALuControl.v
// Control de la ALU para instrucciones MIPS Tipo R

module ALuControl (
    input  [5:0] Funct,
    input  [2:0] ALUOp,
    output reg [2:0] ALUCtrl
);

    always @* begin
        case (ALUOp)
            3'b010: begin   // Tipo R: decodificar Funct
                case (Funct)
                    6'b100000: ALUCtrl = 3'b010; // ADD
                    6'b100010: ALUCtrl = 3'b110; // SUB
                    6'b100100: ALUCtrl = 3'b000; // AND
                    6'b100101: ALUCtrl = 3'b001; // OR
                    6'b101010: ALUCtrl = 3'b111; // SLT
                    default:   ALUCtrl = 3'b010;
                endcase
            end
            default: ALUCtrl = 3'b010;
        endcase
    end

endmodule
