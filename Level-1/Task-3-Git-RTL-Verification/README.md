# SAN VLSI Internship — Level 1 Task 3

## Git-to-RTL Verification Flow

### Objective
Demonstrate a repeatable workflow for modifying Verilog RTL, compiling and simulating the design, inspecting waveform evidence, and tracking changes using Git.

### Tools Used
- Verilog HDL
- Icarus Verilog
- GTKWave
- Git and GitHub
- Visual Studio Code
- MSYS2 UCRT64 terminal

### Project Structure
- `rtl/counter.v` — 4-bit counter RTL
- `tb/counter_tb.v` — simulation testbench
- `logs/baseline_output.txt` — baseline simulation output
- `logs/clear_change_output.txt` — output after adding synchronous clear
- `logs/load_change_output.txt` — output after adding parallel load
- `waveform/counter.vcd` — waveform data
- `waveform/baseline_waveform.png` — baseline waveform screenshot
- `waveform/load_change_waveform.png` — waveform screenshot after parallel load
- `rtl_verification_workflow.md` — workflow diagram

### RTL Changes
1. **Baseline:** Implemented a 4-bit counter with asynchronous reset and enable-controlled counting.
2. **Change 1:** Added synchronous clear to reset the counter on a rising clock edge.
3. **Change 2:** Added parallel loading to load a 4-bit value into the counter.

### Verification
- Checked reset behavior.
- Checked counting and hold behavior.
- Verified synchronous clear.
- Verified parallel load and resumed counting.
- Inspected signal transitions using GTKWave.
- Recorded changes through Git commits.

### Simulation Commands
Run from this directory:

```bash
iverilog -Wall -o simulation.out rtl/counter.v tb/counter_tb.v
vvp simulation.out
gtkwave waveform/counter.vcd
```

### Result
The counter's baseline behavior and two subsequent RTL changes were simulated. The output and waveform were inspected to verify counting, hold, clear, and parallel-load behavior.

### Evidence
See the `logs/` directory for simulation outputs and the `waveform/` directory for waveform data and screenshots.