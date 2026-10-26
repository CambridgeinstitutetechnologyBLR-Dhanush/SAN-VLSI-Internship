# Implementation Note — Full-Adder Review

The reviewed design is a 1-bit combinational full adder with inputs A, B,
and Cin, and outputs Sum and Cout. It was implemented using OpenLane
v1.0.2 and the SKY130A sky130_fd_sc_hd library.

The final archived run reports a core area of 31,799.248 um^2. Its timing
summary reports 4.83 ns worst setup slack, 4.20 ns worst hold slack, and
zero TNS/WNS. In the virtual-clock maximum report, B-to-Sum arrival is
approximately 2.92 ns and B-to-Cout arrival is approximately 2.74 ns.
After subtracting the configured 2 ns input delay, the approximate
internal path estimates are 0.92 ns and 0.74 ns respectively.

The DRC report records zero violations, and the LVS report records zero
mismatches. These are results of the archived run and configuration.

The main limitation is that the full adder has no functional clock input.
The timing values rely on virtual-clock constraints and do not guarantee
a maximum operating frequency. The metrics CSV contains power fields,
but their units and estimation assumptions must be verified before
treating them as validated power measurements.

A useful improvement is to preserve the SDC and report assumptions
together and verify power metric units before making design comparisons.
