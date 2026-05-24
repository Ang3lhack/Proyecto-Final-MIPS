module InstructionMemory (
    input [31:0] address,
    output [31:0] instruction
);
    reg [31:0] mem [0:63]; 
    initial begin
        $readmemb("TestF1_MemInst_32.mem", mem);
    end
    assign instruction = mem[address[7:2]];
endmodule