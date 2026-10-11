# Level 2 – Task 3: FSM Verification and Data Flow

## Objective
Design and verify a finite-state machine (FSM) with a small datapath using Verilog. Test reset behavior, state transitions, data processing, completion signaling, and invalid-state recovery.

## Tools Used
- Verilog HDL
- Icarus Verilog
- GTKWave
- MSYS2 UCRT64
- Git and GitHub

## Design Description
The design contains a four-state FSM:

| State | Encoding | Function |
|---|---|---|
| IDLE | `00` | Wait for `start` |
| LOAD | `01` | Load `data_in` into `data_out` |
| PROCESS | `10` | Increment `data_out` |
| DONE | `11` | Assert `done` and return to IDLE |

The datapath uses a 4-bit output register. The FSM has an asynchronous active-high reset that clears the state and output.

## Verification
The testbench checks:
1. Reset initializes the FSM and datapath.
2. The transaction proceeds through LOAD, PROCESS, and DONE.
3. An input value of 5 is loaded and incremented to 6.
4. The `done` signal is asserted in the DONE state.
5. The FSM returns to IDLE and clears the output when the testbench injects an unknown state value.

## Simulation Result
All testbench checks passed:
- Reset, LOAD, PROCESS, and DONE tests
- Invalid-state recovery test

The testbench uses Icarus Verilog. Simulation output is saved in `logs/simulation_results.txt`, and the VCD waveform is saved in `waveform/fsm_datapath.vcd`.

## Project Structure
- `rtl/fsm_datapath.v` — FSM and datapath RTL
- `tb/fsm_datapath_tb.v` — verification testbench
- `waveform/fsm_datapath.vcd` — simulation waveform
- `waveform/fsm_datapath_waveform.png` — waveform screenshot, if captured
- `logs/simulation_results.txt` — simulation output
- `docs/state_data_flow.md` — state transition and datapath documentation

## Reproduction Commands
Run from the repository root:

```bash
iverilog -Wall -g2012 -s fsm_datapath_tb -o simulation.out Level-2/Task-3-FSM-Verification/rtl/fsm_datapath.v Level-2/Task-3-FSM-Verification/tb/fsm_datapath_tb.v
vvp simulation.out | tee Level-2/Task-3-FSM-Verification/logs/simulation_results.txt
gtkwave Level-2/Task-3-FSM-Verification/waveform/fsm_datapath.vcd
```

## Conclusion
The FSM and datapath were simulated successfully. The testbench verified reset behavior, normal state transitions, datapath processing, completion signaling, and recovery from an injected unknown state in simulation.


## Verification Results

The FSM and datapath were verified using an Icarus Verilog testbench with SystemVerilog assertions.

### Tests Performed

| Test | Expected Result | Status |
|---|---|---|
| Reset | State returns to IDLE; outputs clear | PASS |
| IDLE to LOAD | FSM enters LOAD when start is asserted | PASS |
| LOAD | Captures data_in into data_out | PASS |
| PROCESS | Increments data_out by one | PASS |
| DONE | Asserts done and returns to IDLE | PASS |
| Invalid-state recovery | Recovers from state 3'b111 to IDLE | PASS |

**Result: 6/6 tests passed.**

### Tools Used

- Icarus Verilog — RTL compilation and simulation
- GTKWave — waveform inspection
- Verilog/SystemVerilog assertions — checking expected behavior

### Compile and Run

Run these commands from the repository root in MSYS2 UCRT64:

```bash
iverilog -g2012 -o /tmp/fsm_test Level-2/Task-3-FSM-Verification/rtl/fsm_datapath.v Level-2/Task-3-FSM-Verification/tb/fsm_datapath_tb.v

vvp /tmp/fsm_test
```

### Waveform

The simulation generates:

`waveform/fsm_datapath.vcd`

Open the waveform using GTKWave to inspect the clock, reset, start, state, data_in, data_out, and done signals.
