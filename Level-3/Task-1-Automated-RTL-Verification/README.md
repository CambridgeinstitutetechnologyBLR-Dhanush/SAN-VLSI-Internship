
# Level 3 — Task 1: Automated RTL Verification

## Objective

Automate RTL compilation and simulation using GitHub Actions so that verification runs on pushes to `main` and pull requests targeting `main`.

## Tools Used

- GitHub Actions
- Icarus Verilog (`iverilog` and `vvp`)
- Verilog/SystemVerilog
- Git and GitHub

## Workflow

The workflow configuration is located at:

`.github/workflows/rtl-verification.yml`

The workflow performs these steps:

1. Checks out the repository.
2. Installs Icarus Verilog on an Ubuntu runner.
3. Compiles and simulates the parameterized counter.
4. Compiles and simulates the ALU.
5. Compiles and simulates the FSM and datapath.

## Designs Verified

| Design | Test result |
|---|---|
| Parameterized Counter | All tests passed |
| ALU | 6/6 tests passed |
| FSM and Datapath | 6/6 tests passed |

## Verification Evidence

- `screenshots/workflow-success.png` — successful workflow overview.
- `screenshots/workflow-details.png` — successful verification steps.
- `verification-flow.md` — verification flow diagram and explanation.

## How to Run Locally

Run these commands from the repository root in an environment with Icarus Verilog installed.

### Parameterized Counter

```bash
iverilog -g2012 -o /tmp/counter_test Level-2/Task-1-Parameterized-Counter/rtl/parameterized_counter.v Level-2/Task-1-Parameterized-Counter/tb/parameterized_counter_tb.v
vvp /tmp/counter_test
```

### ALU

```bash
iverilog -g2012 -o /tmp/alu_test Level-2/Task-2-RTL-to-Synthesis/rtl/alu.v Level-2/Task-2-RTL-to-Synthesis/tb/alu_tb.v
vvp /tmp/alu_test
```

### FSM and Datapath

```bash
iverilog -g2012 -o /tmp/fsm_test Level-2/Task-3-FSM-Verification/rtl/fsm_datapath.v Level-2/Task-3-FSM-Verification/tb/fsm_datapath_tb.v
vvp /tmp/fsm_test
```

## Result

The GitHub Actions workflow completed successfully for commit `3d615f9`. All three RTL designs compiled and their testbenches completed successfully in the CI run.
