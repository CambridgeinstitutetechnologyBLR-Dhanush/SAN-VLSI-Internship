# SAN VLSI Internship — Level 1 Task 2

## RTL & Testbench Practice: Counter and Register

### Objective

Design and simulate a 4-bit counter and a 4-bit register using Verilog. Verify clock, reset, enable, data capture, hold behavior, and counter wraparound using Icarus Verilog and GTKWave.

### Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code
- MSYS2 UCRT64 terminal

### Project Structure

- `rtl/counter.v` — 4-bit clocked counter
- `rtl/register.v` — 4-bit register
- `tb/counter_register_tb.v` — simulation testbench
- `waveform/counter_register.vcd` — waveform data
- `waveform/counter_register_waveform.png` — waveform screenshot
- `logs/command_log.txt` — simulation command log

### Design Description

**Counter:** The 4-bit counter increments on each rising clock edge when enable is high. When reset is asserted, the counter clears to zero. When enable is low, it holds its current value. It wraps from 15 to 0.

**Register:** The 4-bit register captures input data `d` on a rising clock edge when enable is high. When reset is asserted, it clears to zero. When enable is low, it retains its previous value.

### Simulation Commands

Run these commands from the `Task-2-Counter-Register` directory.

**Compile:**
```bash
iverilog -Wall -o simulation.out rtl/counter.v rtl/register.v tb/counter_register_tb.v
```

**Run:**
```bash
vvp simulation.out
```

**Open waveform:**
```bash
gtkwave waveform/counter_register.vcd
```

### Expected Simulation Output

- Reset clears the counter and register outputs to `0`.
- The counter increments when enable is high.
- The counter holds its value when enable is low.
- The register captures input data when enabled and holds its value when disabled.
- The counter reaches `15` (hexadecimal `F`) and wraps around to `0`.
- The simulation terminates automatically using `$finish`.

*Note: Exact output values and timestamps depend on the testbench sequence.*

### Verification

- Reset behavior checked.
- Counter increment and hold behavior checked.
- Register data capture and hold behavior checked.
- Natural 4-bit counter wraparound checked.
- Signal transitions inspected using GTKWave.
- Automatic simulation termination verified.

### Result

The counter and register were simulated using Icarus Verilog, and their behavior was inspected through simulation output and waveform analysis.

### Evidence

See `waveform/counter_register_waveform.png` for the waveform screenshot and `logs/command_log.txt` for the simulation command explanations.