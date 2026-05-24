`timescale 1ns/1ps

module TB_DPTR;
    reg clk;
    reg reset;

    // Instancia del Datapath principal
    DPTR dut (
       .clk(clk),
       .reset(reset)
    );

    // Generador de reloj (Periodo de 10ns)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        // Cabecera gráfica de la consola
        $display("==========================================================================================================");
        $display("TESTBENCH - MIPS DATAPATH FASE 2 (Algoritmo Raiz Cuadrada)");
        $display("Time | PC   | Instruccion                      | RS (D1) | RT (D2) | ALU Res | MemW | MemR | DataOut | RegW");
        $display("----------------------------------------------------------------------------------------------------------");

        // Liberar reset después de 1 ciclo
        #10 reset = 0;

        // Se aumentó el tiempo a 1500ns (150 ciclos) para asegurar que el bucle iterativo termine completamente
        #1500; 

        $display("====================================== FIN LOGICO DE LA SIMULACION =======================================");
        $finish;
    end

    // Monitor de señales en el flanco de bajada (cuando las señales ya se estabilizaron)
    always @(negedge clk) begin
        if (!reset) begin
            $display("%4t | %-4d | %b | %-7d | %-7d | %-7d |  %b   |  %b   | %-7d |  %b", 
                     $time, 
                     dut.pc_out, 
                     dut.instruction, 
                     $signed(dut.read_data_1), 
                     $signed(dut.read_data_2), 
                     $signed(dut.alu_result), 
                     dut.MemWrite,         // Monitoreo de escritura en RAM
                     dut.MemRead,          // Monitoreo de lectura en RAM
                     $signed(dut.mem_read_data), // Bus de salida de la RAM
                     dut.RegWrite);
        end
    end
endmodule