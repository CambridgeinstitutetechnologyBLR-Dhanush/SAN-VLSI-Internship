# RTL-to-GDSII Flow and Verification

## 1. RTL Design

The design is a combinational 1-bit full adder.

Inputs: A, B, Cin  
Outputs: Sum, Cout

```verilog
assign Sum = A ^ B ^ Cin;
assign Cout = (A & B) | (B & Cin) | (A & Cin);
```

## 2. Synthesis

Yosys synthesizes the RTL into a gate-level netlist using the selected standard-cell library.

Archived evidence: `results/full_adder.v` and `reports/metrics.csv`.

## 3. Physical Design

The archived OpenLane run includes floorplanning, placement, routing, parasitic extraction, and timing analysis.

Archived evidence: `results/full_adder.def`, `results/full_adder.lef`, and the timing reports in `reports/`.

## 4. GDSII Generation

Final layout: `results/full_adder.gds`.

The archived OpenLane log reports successful GDSII generation using Magic and KLayout.

## 5. Verification Results

The archived manufacturability report records:

- Magic DRC violations: 0
- LVS: clean
- Antenna pin violations: 0
- Antenna net violations: 0

The archived run log reports no setup or hold violations at the typical process corner.

## 6. Archived Run and Limitations

These results came from an existing OpenLane run dated 2026-05-21. This repository configuration has not been rerun as part of this task.

The original design configuration refers to `src/*.v`, whereas this repository stores the source in `rtl/full_adder.v`. A fresh run requires a matching source path, the OpenLane environment, and the SKY130 PDK.

The full adder is combinational and does not require a clock input, although the inherited configuration includes a 10 ns clock-period setting.
