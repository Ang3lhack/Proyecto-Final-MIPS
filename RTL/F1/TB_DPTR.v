`timescale 1ns/1ps

module TB_DPTR;

    reg clk;
    reg reset;

    // Instancia del DataPath Principal (MIPS Completo)
    DPTR dut (
        .clk(clk),
        .reset(reset)
    );

    // Generador de Reloj (Periodo de 10ns)
    always #5 clk = ~clk;

    initial begin
        // Condición inicial: Reset activado
        clk = 0;
        reset = 1;

        $display("=================================================================================================");
        $display("                                TESTBENCH - MIPS SINGLE DATAPATH");
        $display("=================================================================================================");
        $display("Time | PC   | Instruccion                      | RS (Dato 1) | RT (Dato 2) | ALU Result | RegWrite");
        $display("-------------------------------------------------------------------------------------------------");

        // Soltar el reset después de 10ns
        #10 reset = 0;

        // Dejar correr la simulación por el tiempo suficiente para ejecutar tu archivo .mem
        // 80ns son 8 ciclos de reloj (suficiente para las instrucciones pre-cargadas)
        #80;

        $display("=================================================================================================");
        $finish;
    end

    // Monitor: Imprime los valores internos en el flanco de bajada (cuando las señales ya son estables)
    always @(negedge clk) begin
        if (!reset) begin
            $display("%4t | %-4d | %b | %-11d | %-11d | %-10d | %-8b",
                     $time,
                     dut.pc_out,            // El valor actual del Program Counter
                     dut.instruction,       // La instrucción leída de la memoria
                     $signed(dut.read_data_1), // Valor leído del registro RS
                     $signed(dut.read_data_2), // Valor leído del registro RT
                     $signed(dut.alu_result),  // El cálculo final de la ALU
                     dut.RegWrite);         // Si se va a guardar el resultado en el banco
        end
    end

endmodule