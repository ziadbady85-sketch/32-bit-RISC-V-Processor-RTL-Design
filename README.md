# 32-bit-RISC-V-Processor-RTL-Design
A modular single-cycle 32-bit RISC-V processor designed and implemented in Verilog HDL with a clean datapath/control-path architecture suitable for FPGA prototyping and SoC integration.

Features
32-bit Single-Cycle RISC-V CPU
Modular Verilog Design
Arithmetic & Logic Operations
Instruction Fetch & Decode
Register File Architecture
Immediate Generation
Branching Support
Data & Instruction Memory
Scalable and FPGA-Friendly Architecture
Implemented Modules
Program Counter (PC)

Handles instruction flow and updates the next instruction address.

Instruction Memory

Stores and fetches instructions based on the current PC value.

Control Unit

Decodes instructions and generates all processor control signals.

Register File

Implements 32 general-purpose registers with dual-read and single-write ports.

ALU

Performs arithmetic and logical operations such as:

ADD
SUB
AND
OR
XOR
SLT
Immediate Generator

Extracts and sign-extends immediate fields for different instruction types.

Data Memory

Handles load/store memory operations.

Adders
PC + 4 Adder
Branch Address Adder
Multiplexers (MUXes)

Control datapath selection between:

Register/Immediate
ALU/Memory
Sequential/Branch PC
Supported Instruction Types
R-Type
I-Type
S-Type
B-Type
Architecture Overview
PC → Instruction Memory → Control Unit
                ↓
         Register File
                ↓
              ALU
                ↓
          Data Memory
                ↓
             Write Back
Tools & Technologies
Verilog HDL
FPGA-Oriented RTL Design
Digital Design Concepts
RISC-V ISA Basics
Future Improvements
Pipeline Architecture
Hazard Detection
Cache Memory
UART/SPI Interfaces
BLE / PCIe Integration
Interrupt Handling
Author

Ziad Mohamed
Digital IC Design & FPGA Enthusiast
