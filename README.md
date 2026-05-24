# 💻 Procesador MIPS 32-bits (Single-Cycle Datapath) - Proyecto Final

![Verilog](https://img.shields.io/badge/Language-Verilog-005C8A?style=for-the-badge&logo=verilog)
![ModelSim](https://img.shields.io/badge/Simulador-ModelSim-0033A0?style=for-the-badge)
![Python](https://img.shields.io/badge/Assembler-Python-3776AB?style=for-the-badge&logo=python)

Implementación completa en **Verilog** de un microprocesador MIPS de 32 bits de ciclo único (Single-Cycle Datapath). Este proyecto abarca la evolución arquitectónica desde una unidad básica para operaciones aritméticas hasta un procesador completamente funcional capaz de manejar accesos a memoria, evaluación de condiciones, bucles y llamadas a subrutinas mediante el control de flujo absoluto.

## 🧠 Características de la Arquitectura

El Datapath ha sido diseñado de manera modular para ejecutar instrucciones nativas de la arquitectura MIPS. Las características principales incluyen:
* **Arquitectura de 32 bits:** Registros, buses de datos y ALU de 32 bits de ancho.
* **Banco de Registros (BR):** 32 registros de propósito general, lectura dual asíncrona y escritura síncrona, con soporte nativo para `$ra` (Registro 31).
* **Unidad Aritmético-Lógica (ALU):** Capaz de realizar operaciones matemáticas (suma, resta) y lógicas (AND, OR, Set-on-Less-Than).
* **Memoria Harvard:** Separación lógica entre Memoria de Instrucciones (ROM) y Memoria de Datos (RAM).
* **Control de Flujo Avanzado:** Soporte de saltos incondicionales (`J`) y llamadas a subrutinas con almacenamiento de dirección de retorno `PC+4` (`JAL`).

## 📜 Instrucciones Soportadas

El procesador decodifica y ejecuta exitosamente un conjunto robusto de instrucciones divididas en los tres tipos canónicos de MIPS:

| Tipo | Instrucciones Implementadas | Descripción |
| :---: | :--- | :--- |
| **R** | `add`, `sub`, `and`, `or`, `slt` | Operaciones Aritmético-Lógicas entre registros. |
| **I** | `addi`, `lw`, `sw`, `beq`, `ori`, `andi`, `slti` | Manejo de valores inmediatos, acceso a RAM y saltos condicionales. |
| **J** | `j`, `jal` | Saltos incondicionales y llamadas a subrutinas. |

## 📁 Estructura del Proyecto

El código fuente está estrictamente modularizado, siguiendo las mejores prácticas de diseño digital (RTL):

```text
📦 Proyecto-Final-MIPS
 ┣ 📂 RTL                    # Códigos fuente en Verilog
 ┃ ┣ 📜 DPTR.v               # Módulo Principal (Top-Level Datapath)
 ┃ ┣ 📜 UnidadDeControl.v    # Decodificador principal de OpCodes
 ┃ ┣ 📜 ALU.v                # Unidad Aritmético-Lógica
 ┃ ┣ 📜 ALuControl.v         # Unidad de Control secundaria para ALU
 ┃ ┣ 📜 BR.v                 # Banco de Registros
 ┃ ┣ 📜 PC.v                 # Program Counter
 ┃ ┣ 📜 Mem.v                # Memoria de Datos (RAM)
 ┃ ┣ 📜 InstructionMemory.v  # Memoria de Instrucciones (ROM)
 ┃ ┣ 📜 Mux2_1_32.v          # Multiplexores
 ┃ ┗ 📜 soporte.v            # Adder, SignExtend, ShiftLeft2                  # Archivos de simulación
 ┃ ┣ 📜 TB_DPTR.v            # Testbench Principal
 ┃ ┣ 📜 TestAlgoritmo.mem    # Código máquina de Raíz Cuadrada
 ┃ ┗ 📜 TestF3_MemInst.mem   # Código máquina de Validación (Profesor)
 ┣ 📂 scr                    # Ensamblador automatizado
 ┃ ┣ 📜 mips_assembler.py    # Script en Python para traducir .asm a .mem
 ┃ ┗ 📜 raiz_cuadrada_j.asm  # Código fuente en ensamblador
 ┗ 📜 README.md              # Documentación
 ┣ 📂 Docs                   # Reportes
 ┃ ┣ 📜 Fase1.pdf 
 ┃ ┗ 📜 Fase2.pdf
 ┃ ┗ 📜 Fase3.pdf
