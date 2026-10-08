# SAN VLSI Internship - Level 1 Task 1
## Logic Gates & RTL Simulation

### 1. Objective

The objective of this task is to design and simulate basic digital logic blocks using Verilog HDL.

The following RTL blocks were implemented:

- AND gate
- OR gate
- XOR gate
- NAND gate
- 2:1 Multiplexer

The RTL was verified using a Verilog testbench and simulated using Icarus Verilog. The resulting waveform was inspected using GTKWave.

---

### 2. Tools Used

| Tool | Purpose |
|---|---|
| Verilog HDL | RTL design |
| Icarus Verilog 13.0 | Compilation and simulation |
| GTKWave 3.3.127 | Waveform analysis |
| VS Code | Source-code development |
| MSYS2 UCRT64 | Build and simulation environment |

---

### 3. Project Structure

Task-1-Logic-Gates/
├── rtl/
│   └── logic_blocks.v
├── tb/
│   └── logic_blocks_tb.v
├── waveform/
│   └── logic_blocks.vcd
└── README.md

---

### 4. RTL Design

#### AND Gate

The AND gate produces a HIGH output only when both inputs are HIGH.

Y = A & B

#### OR Gate

The OR gate produces a HIGH output when at least one input is HIGH.

Y = A | B

#### XOR Gate

The XOR gate produces a HIGH output when the two inputs are different.

Y = A ^ B

#### NAND Gate

The NAND gate produces the inverted AND result.

Y = ~(A & B)

#### 2:1 Multiplexer

The select signal determines which input is connected to the output.

S = 0 -> Y = I0
S = 1 -> Y = I1

---

### 5. Verification

The testbench applies all four possible combinations of the two 1-bit gate inputs:

00
01
10
11

The 2:1 multiplexer is tested for both select states:

S = 0
S = 1

A VCD waveform file is generated during simulation and inspected using GTKWave.

---

### 6. Simulation Commands

The following commands were used for compilation and simulation.

#### Compile the RTL and testbench

iverilog -o simulation.out rtl/logic_blocks.v tb/logic_blocks_tb.v

#### Run the simulation

vvp simulation.out

#### Open the waveform

gtkwave waveform/logic_blocks.vcd

---

### 7. Simulation Results

The simulation output was checked against the expected truth tables.

#### Gate Verification

| A | B | AND | OR | XOR | NAND |
|---|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 | 1 |
| 0 | 1 | 0 | 1 | 1 | 1 |
| 1 | 0 | 0 | 1 | 1 | 1 |
| 1 | 1 | 1 | 1 | 0 | 0 |

#### 2:1 MUX Verification

| I0 | I1 | S | Y |
|---|---|---|---|
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 1 |

The simulation completed successfully and the generated VCD waveform was inspected using GTKWave.

---

### 8. Verification Evidence

The GTKWave waveform demonstrates the expected transitions of the inputs and outputs for all tested cases.

The generated waveform file is:

waveform/logic_blocks.vcd

The waveform was inspected using GTKWave and verified against the expected logic behavior.

---

### 9. Conclusion

The AND, OR, XOR, NAND and 2:1 MUX RTL blocks were successfully designed and verified using Verilog HDL.

The testbench covered the required input combinations, the simulation completed successfully, and the generated waveforms matched the expected logic behavior.