# Single-Cycle RISC-V Processor (RV32I) in Verilog HDL

A parameterized **32-bit Single-Cycle RISC-V Processor** implemented in **Verilog HDL**, following the **RV32I Base Integer Instruction Set**. The processor is designed using a modular architecture and synthesized on a **Xilinx Artix-7 FPGA (Basys 3)** using **Vivado**.

The project demonstrates the complete datapath of a single-cycle RISC-V CPU including instruction fetch, decode, execute, memory access, and write-back stages.

---

## Features

- 32-bit RV32I Single-Cycle Architecture
- Modular RTL Design
- Parameterized Modules
- Instruction Memory with `$readmemh()` Support
- Register File with x0 Hardwired to Zero
- ALU Supporting Arithmetic and Logical Operations
- Immediate Generator
- ALU Control Unit
- Data Memory
- Branch Decision Logic
- Synthesizable RTL
- FPGA Ready (Basys 3)
- Vivado Compatible

---

# Supported Instructions

| Instruction | Description |
|-------------|-------------|
| ADD | Integer Addition |
| SUB | Integer Subtraction |
| ADDI | Immediate Addition |
| AND | Bitwise AND |
| OR | Bitwise OR |
| XOR | Bitwise XOR |
| SLT | Set Less Than (Signed) |
| LW | Load Word |
| SW | Store Word |
| BEQ | Branch if Equal |

---

# Processor Datapath

<img width="1080" height="841" alt="WhatsApp Image 2026-07-07 at 4 26 01 PM" src="https://github.com/user-attachments/assets/9e9a77d5-bff7-4c1e-9a06-2848e51fcd95" />


---

# Architecture Overview

The processor follows the standard **Single-Cycle RISC-V Datapath**, where every instruction completes in a single clock cycle.

The execution flow is:

1. Instruction Fetch (IF)
2. Instruction Decode (ID)
3. Register Read
4. Immediate Generation
5. Execute (ALU)
6. Data Memory Access
7. Register Write Back
8. PC Update


---

# Project Structure

```
RISC_V/
│
├── RTL/
│   ├── PC.v
│   ├── Instruction_Memory.v
│   ├── Register_File.v
│   ├── Control_Unit.v
│   ├── ALU_Control.v
│   ├── ALU.v
│   ├── Immediate_Generator.v
│   ├── Data_Memory.v
│   ├── Adder_1.v
│   ├── Adder_2.v
│   ├── MUX.v
│   └── RISC_V.v
│
├── TB/
│   ├── tb_RISC_V.v
│   └── program.mem
│
├── Constraints/
│   └── Basys3_Master.xdc
│
├── docs/
│   └── images/
│       ├── riscv_datapath.png
│       ├── rtl_schematic.png
│       ├── synthesized_schematic.png
│       ├── simulation_waveform.png
│       └── resource_utilization.png
│
└── README.md
```

---

# Module Description

| Module | Function |
|----------|----------|
| PC | Program Counter Register |
| Instruction_Memory | Stores Program Instructions |
| Control_Unit | Generates Main Control Signals |
| ALU_Control | Decodes ALU Operation |
| Register_File | 32×32 Register Bank |
| Immediate_Generator | Generates Immediate Values |
| ALU | Executes Arithmetic and Logical Operations |
| Data_Memory | Load/Store Memory |
| Adder_1 | Computes PC + 4 |
| Adder_2 | Computes Branch Target Address |
| MUX | Datapath Selection Logic |
| RISC_V | Top-Level Processor |

---

# ALU Operations

| ALU Control | Operation |
|-------------|-----------|
| 000 | ADD |
| 001 | SUB |
| 010 | AND |
| 011 | OR |
| 100 | XOR |
| 101 | SLT |

---

# Simulation

The design is verified using a dedicated Verilog Testbench.

Simulation verifies:

- Reset Operation
- Program Counter Update
- Register File Write
- ALU Operations
- Immediate Generation
- Load Word (LW)
- Store Word (SW)
- Branch Equal (BEQ)
- Memory Read
- Memory Write

---

## Simulation Waveform

<img width="1804" height="418" alt="Screenshot 2026-07-07 171121" src="https://github.com/user-attachments/assets/b264d593-d020-4b00-a4b0-e1e741152c67" />


---

# RTL Schematic

<img width="1546" height="428" alt="Screenshot 2026-07-07 175957" src="https://github.com/user-attachments/assets/3b26aa0b-4cd6-48c7-bb20-bdc715df430c" />


---

# Synthesized Design

<img width="1920" height="1080" alt="Screenshot 2026-07-07 181220" src="https://github.com/user-attachments/assets/aefd964a-2cae-4960-9e9f-2fcc4f495134" />


---

# implementation Design

<img width="1518" height="762" alt="Screenshot 2026-07-07 185635" src="https://github.com/user-attachments/assets/74ad4f06-5eb2-4941-83a7-0b5243aea213" />


# FPGA Target

| Item | Value |
|------|-------|
| FPGA Board | Digilent Basys 3 |
| FPGA Device | XC7A35T-1CPG236C |
| Tool | Xilinx Vivado |
| Language | Verilog HDL |

---



# Verification Flow

```
RTL Design
      │
      ▼
Functional Simulation
      │
      ▼
RTL Elaboration
      │
      ▼
Synthesis
      │
      ▼
Implementation
      │
      ▼
Bitstream Generation
      │
      ▼
FPGA Validation
```

---

# Tools Used

- Verilog HDL
- Xilinx Vivado
- Xilinx Artix-7 FPGA
- Basys 3 Development Board

---

# Future Improvements

- Pipeline Architecture
- Hazard Detection Unit
- Forwarding Unit
- Instruction Cache
- Data Cache
- AXI4 Interface
- CSR Support
- Interrupt Controller
- UART Peripheral
- GPIO Peripheral
- Timer Peripheral
- Full RV32I ISA Support

---

# Author

**Ziad Mohamed**

Electrical Engineering Student  
Higher Technological Institute (HTI)  
Electronics and Communication Engineering

Interested in:

- Digital IC Design
- RTL Design
- Digital Verification
- Computer Architecture
- FPGA Design
- RISC-V Processor Design

---
