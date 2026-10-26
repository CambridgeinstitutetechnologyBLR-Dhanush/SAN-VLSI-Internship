# Timing, Area & Power Review

## 1. Design under review
A 1-bit combinational full adder implemented with OpenLane v1.0.2,
SKY130A, and the sky130_fd_sc_hd standard-cell library.

Final run ID: RUN_2026.10.26_16.30.50

## 2. Timing observations
The final timing summary reports:
- Worst setup slack: 4.83 ns
- Worst hold slack: 4.20 ns
- Total negative slack (TNS): 0.00
- Worst negative slack (WNS): 0.00

The virtual-clock maximum report shows:
- B to Sum data arrival: approximately 2.92 ns
- B to Cout data arrival: approximately 2.74 ns

The configured input delay is 2 ns. Subtracting it gives approximate
internal path estimates of 0.92 ns for B-to-Sum and 0.74 ns for B-to-Cout.
These are estimates under the archived constraints, not independent
measurements of unconstrained gate delay.

## 3. Area observations
The final metrics CSV reports:
- Core area: 31,799.248 um^2
- DIEAREA: 0.04 mm^2
- Synthesized cell count: 4
- Final total-cell metric: 4,178

The cell-count fields refer to different flow metrics and should not be
treated as interchangeable. Use the original metrics CSV when presenting
these values and explain the metric definitions if asked.

## 4. Physical verification
- DRC report: COUNT = 0
- LVS report: Total errors = 0
- CVC/ERC: zero reported electrical errors in the final run

These results apply to the archived run and its configuration.

## 5. Power observations
The metrics CSV includes typical internal, switching, and leakage power
fields. Before quoting numerical values, confirm the units and power
estimation methodology used by this OpenLane run. This report does not
claim independently validated power measurements.

## 6. Main timing risk
The design is combinational and has no functional clock input. Virtual-clock
constraints were used to enable input-to-output timing analysis. The
reported slack therefore does not prove a real operating frequency.

## 7. Proposed improvement
Keep the SDC and its input/output delay, uncertainty, and load assumptions
with the timing report. Confirm metric units and power-estimation
assumptions before publishing power values. Re-run analysis only if the
constraints or design change.

## 8. Conclusion
The archived reports show positive setup and hold slack, zero reported
DRC violations, and zero LVS errors under the selected flow settings.
Timing interpretation is constraint-dependent; power values require
unit and methodology confirmation.
