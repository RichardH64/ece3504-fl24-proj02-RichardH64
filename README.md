# ECE 3504 Project 2: GCD in MIPS Assembly
This repository contains Project 2 for the ECE 3504: Principles of Computer Architecture course. The objective of this project is to implement the Greatest Common Divisor (GCD) algorithm in MIPS Assembly, based on a provided C implementation.

## Project Details
- **Course**: ECE 3504 - Principles of Computer Architecture  
- **Task**: Conversion of a GCD algorithm from C to MIPS Assembly.  
- **Features**:  
  - Handles edge cases for `GCD(0, b)` and `GCD(a, 0)`.  
  - Implements loops and bitwise operations in MIPS.  
  - Optimized for efficient execution in a pipelined architecture.

## MIPS Assembly Implementation
- Implements the binary GCD algorithm in MIPS assembly based on the provided C code.  
- Uses instructions like `sll`, `srl`, `beq`, and bitwise operations for efficient computation.  
- Validates the GCD algorithm using various test cases in SPIM or QtSPIM simulators.

## Verilog Datapath Extension
- Extends the provided single-cycle MIPS datapath in Verilog to execute the binary GCD algorithm for a specific input (`GCD(12, 780)`).
- Simulates the extended datapath using ModelSim to verify correct execution and result.

## Usage
- Load the assembly code into a MIPS simulator such as SPIM or QtSPIM.
- Test cases for various inputs are provided to validate functionality.
