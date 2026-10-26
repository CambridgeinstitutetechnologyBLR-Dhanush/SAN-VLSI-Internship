# Level 3 — Task 3: Timing, Area & Power Review

## Objective
Review the timing, area, physical verification, and available power
metrics of the 1-bit combinational full adder implemented using OpenLane
and the SKY130A sky130_fd_sc_hd library.

## Design and source
- Design: 1-bit combinational full adder
- Inputs: A, B, Cin
- Outputs: Sum, Cout
- RTL: `../Task-2-RTL-to-GDSII/rtl/full_adder.v`

## Timing review
The final run reports worst setup slack of 4.83 ns, worst hold slack
of 4.20 ns, and TNS/WNS of 0.00 under the configured constraints.

The virtual-clock maximum timing report shows B-to-Sum arrival of
approximately 2.92 ns and B-to-Cout arrival of approximately 2.74 ns.
With the configured 2 ns input delay, the corresponding approximate
internal path estimates are 0.92 ns and 0.74 ns.

These estimates depend on the timing constraints, cell models, input
transitions, output loads, and parasitic extraction. The full adder has
no functional clock input, so these values do not establish a guaranteed
maximum operating frequency.

## Area review
The final metrics report lists a core area of 31,799.248 square micrometres
and a DIEAREA of 0.04 square millimetres. These are implementation
geometry metrics, not transistor area or die cost.

## Physical verification
- DRC: 0 violations reported in the archived final report.
- LVS: zero net, device, pin, or property mismatches.
- CVC/ERC: the final run records zero reported electrical errors.
- Timing: positive setup and hold slack under the configured constraints.

## Power review
The metrics CSV contains fields for typical internal, switching, and
leakage power, but their units and modeling assumptions must be confirmed
before quoting them as validated power measurements. This review does not
claim independently validated power results.

## Risk and improvement
Risk: timing conclusions can be misleading if virtual-clock constraints
are treated as a real operating clock specification.

Improvement: document the SDC assumptions alongside every timing result
and verify the units and analysis settings before reporting power.

## Evidence
See `reports/timing-area-power-review.md`,
`docs/implementation-note.md`, and `docs/review-checklist.md`.
Original reports remain in `../Task-2-RTL-to-GDSII/`.

## Conclusion
The archived implementation provides timing, area, DRC, and LVS evidence.
Power conclusions remain limited until the metric units and modeling
assumptions are confirmed.

## Screenshot evidence
The timing report screenshot is available at
`screenshots/timing-report.png`. The original detailed timing reports
remain in the Task 2 virtual-clock archive.
