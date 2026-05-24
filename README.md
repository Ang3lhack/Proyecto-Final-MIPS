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
 ┃ ┗ 📜 soporte.v            # Adder, SignExtend, ShiftLeft2
 ┣ 📂 tests                  # Archivos de simulación
 ┃ ┣ 📜 TB_DPTR.v            # Testbench Principal
 ┃ ┣ 📜 TestAlgoritmo.mem    # Código máquina de Raíz Cuadrada
 ┃ ┗ 📜 TestF3_MemInst.mem   # Código máquina de Validación (Profesor)
 ┣ 📂 scr                    # Ensamblador automatizado
 ┃ ┣ 📜 mips_assembler.py    # Script en Python para traducir .asm a .mem
 ┃ ┗ 📜 raiz_cuadrada_j.asm  # Código fuente en ensamblador
 ┣ 📂 Docs                   # Reportes
 ┃ ┣ 📜 Fase1.pdf 
 ┃ ┣ 📜 Fase2.pdf
 ┃ ┗ 📜 Fase3.pdf
 ┗ 📜 README.md              # Documentación
```

---

## 🚀 Algoritmos de Validación

### 🔢 Cálculo de Raíz Cuadrada (Matemática Pura)

Algoritmo iterativo diseñado en ensamblador que calcula la raíz cuadrada exacta de un número mediante resta sucesiva de números impares.

**Características evaluadas:**
- Uso de subrutinas (`JAL` / `$ra`)
- Bucles infinitos (`J`)
- Manipulación de registros
- Operaciones aritméticas iterativas

---

### 🧩 Obstacle Course (Control de Flujo)

Código de estrés diseñado para validar el correcto funcionamiento de:
- Saltos condicionales (`BEQ`)
- Saltos absolutos (`J`)
- Direccionamiento de Branch Target
- Jump Address
- Control del flujo de ejecución

---

## 🛠️ Herramientas y Requisitos

| Herramienta | Uso |
| :--- | :--- |
| **ModelSim** | Simulación y validación del hardware |
| **Verilog HDL** | Diseño RTL del procesador |
| **Python 3.x** | Assembler personalizado (.asm → .mem) |

**Requisitos recomendados:**
- ModelSim Intel FPGA Starter Edition 10.5b o superior
- Python 3.x instalado
- Editor HDL (VSCode, Quartus, etc.)

---

## ⚙️ Cómo Simular el Procesador

### 1️⃣ Clonar el repositorio
```bash
git clone [https://github.com/Ang3lhack/Proyecto-Final-MIPS.git](https://github.com/Ang3lhack/Proyecto-Final-MIPS.git)
```

### 2️⃣ Abrir ModelSim
Crear un nuevo proyecto y agregar:
- Todos los archivos `.v` de `RTL/`
- Todos los archivos `.v` y `.mem` de `tests/`

### 3️⃣ Configurar memoria de instrucciones
Abrir el archivo `InstructionMemory.v` y modificar la ruta absoluta del archivo `.mem` que deseas ejecutar. Ejemplo:
```text
TestAlgoritmo.mem
```

### 4️⃣ Compilar el proyecto
En ModelSim ve a: `Compile → Compile All`

### 5️⃣ Ejecutar simulación
Seleccionar el módulo `TB_DPTR`. En la ventana **Transcript** ejecutar:
```text
run -all
```

### 6️⃣ Visualizar señales
Utilizar la herramienta `Wave → Zoom Full`.
> **Recomendaciones:** Cambiar la señal `pc_out` a formato **Unsigned** y la señal `instruction` a formato **Hexadecimal** para facilitar la lectura.

---

## 👨‍💻 Autores

- **Angel Gael García Ramos** - [@Ang3lhack](https://github.com/Ang3lhack)
- **Andrea Valeria Torres Figueroa** - [@andreatorres4898](https://github.com/andreatorres4898)
- **Estefania Navarro Mendoza** - [@fanny-nav](https://github.com/fanny-nav)

**Estudiantes de Ingeniería en Computación** Universidad de Guadalajara (CUCEI)
