# Level 2 — Task 1: Parameterized RTL Counter

## Objective
To design and simulate a reusable parameterized counter using Verilog HDL.

## Tools Used
- Icarus Verilog — compilation and simulation
- GTKWave — waveform analysis
- VS Code — code editing
- Git and GitHub — version control

## Design Description
The counter uses a configurable `WIDTH` parameter, with a default value of 4 bits. It supports an asynchronous active-high reset and an enable input. When reset is active, the counter becomes zero. When enable is high, it increments on each rising clock edge. When enable is low, it retains its previous value.

## Project Structure
- `rtl/parameterized_counter.v` — counter RTL
- `tb/parameterized_counter_tb.v` — testbench
- `waveform/parameterized_counter.vcd` — simulation waveform data
- `waveform/parameterized_counter_waveform.png` — waveform screenshot

## Simulation Commands
Run these commands from the repository root in the MSYS2 UCRT64 terminal:

```bash
iverilog -Wall -g2012 -s parameterized_counter_tb -o simulation.out Level-2/Task-1-Parameterized-Counter/rtl/parameterized_counter.v Level-2/Task-1-Parameterized-Counter/tb/parameterized_counter_tb.v

vvp simulation.out

gtkwave Level-2/Task-1-Parameterized-Counter/waveform/parameterized_counter.vcd
```

## Verification
The testbench exercises reset, enabled counting, disabled counting, and reset behavior. The waveform was inspected in GTKWave to check the clock, reset, enable, and counter output.

## Result
The parameterized counter was compiled and simulated. The waveform provides evidence of the counter's behavior under the tested input conditions.

## Additional Parameter Verification

The counter was verified using two instances of the same parameterized RTL module:

- **WIDTH = 4:** Verified counting, enable hold, and reset behavior.
- **WIDTH = 8:** Verified counting, enable hold, and reset behavior.

Both instances shared the same clock, reset, and enable signals. The testbench confirmed that both counters incremented correctly, held their values when enable was low, and cleared on reset.

### Verification Result

All testbench checks passed. The simulation ended with `ALL TESTS PASSED`.

### Updated Compile and Simulation Commands

```bash
iverilog -Wall -g2012 -s parameterized_counter_tb -o simulation.out Level-2/Task-1-Parameterized-Counter/rtl/parameterized_counter.v Level-2/Task-1-Parameterized-Counter/tb/parameterized_counter_tb.v
vvp simulation.out
```