# Level 2 – Task 2: RTL-to-Synthesis Flow

## Objective
To synthesize a 4-bit Arithmetic Logic Unit (ALU) using Yosys, inspect the inferred logic cells, and generate a synthesized Verilog netlist and synthesis report.

## Tools Used
- **HDL:** Verilog
- **Synthesis tool:** Yosys 0.66
- **Terminal:** MSYS2 UCRT64
- **Editor:** Visual Studio Code / Nano
- **Version control:** Git and GitHub

## Design Description
The ALU accepts two 4-bit operands, `A` and `B`, and a 2-bit selection input, `sel`. It supports four operations:

| `sel` | Operation |
|---|---|
| `00` | Addition |
| `01` | Subtraction |
| `10` | Bitwise AND |
| `11` | Bitwise XOR |

The output `Y` is 4 bits wide. Arithmetic results are truncated to 4 bits.

## Synthesis Flow
1. Read the Verilog RTL using `read_verilog`.
2. Check the design hierarchy using `hierarchy -check -top alu`.
3. Convert procedural blocks using `proc`.
4. Optimize the logic using `opt`.
5. Check the design using `check`.
6. Run synthesis using `synth -top alu`.
7. Inspect inferred logic cells using `stat`.
8. Export the synthesized Verilog netlist using `write_verilog`.

## Project Structure
- `rtl/alu.v` — ALU RTL source.
- `scripts/synth.ys` — Yosys synthesis script.
- `netlist/alu_synth.v` — synthesized Verilog netlist.
- `reports/synthesis_stat.txt` — cell statistics.
- `logs/synthesis.log` — synthesis execution log.

## Commands to Reproduce

Run these commands from the repository root in the MSYS2 UCRT64 terminal:

```bash
yosys -s Level-2/Task-2-RTL-to-Synthesis/scripts/synth.ys 2>&1 | tee Level-2/Task-2-RTL-to-Synthesis/logs/synthesis.log
```

## Results
Yosys completed synthesis successfully and generated the synthesized netlist and statistics report.

The reported generic logic-cell statistics were:
- Total cells: 45
- AND cells: 6
- Multiplexer cells: 3
- XOR cells: 3
- XNOR cells: 7
- Other inferred cells included OR, NAND, ANDNOT, and ORNOT.

These counts describe the generic synthesized logic representation. They do not represent physical layout area or technology-mapped standard cells.

## Conclusion
The 4-bit ALU was successfully synthesized using Yosys. The inferred logic cells were inspected, and the synthesized netlist, statistics report, and execution log were generated for reproducibility.

## Functional Verification

The 4-bit ALU was verified using an Icarus Verilog testbench.

The testbench checks:
- Addition: 3 + 2 = 5
- Addition overflow: 15 + 1 wraps to 0
- Subtraction: 7 - 3 = 4
- Subtraction underflow: 2 - 5 wraps to 13
- Bitwise AND: 1100 & 1010 = 1000
- Bitwise XOR: 1100 ^ 1010 = 0110

**Result:** All 6 functional tests passed.

### Testbench and Waveform
- Testbench: `tb/alu_tb.v`
- Waveform: `waveform/alu_tb.vcd`
- Simulation results: `logs/alu_test_results.txt`

### Functional Verification Commands

```bash
iverilog -Wall -g2012 -s alu_tb -o simulation.out Level-2/Task-2-RTL-to-Synthesis/rtl/alu.v Level-2/Task-2-RTL-to-Synthesis/tb/alu_tb.v
vvp simulation.out
```
