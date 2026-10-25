# Level 3 — Task 2: RTL-to-GDSII Flow

## Objective
Document the RTL-to-GDSII physical-design flow using OpenLane for a
1-bit combinational full-adder design.

## Design
Inputs: A, B, Cin
Outputs: Sum, Cout

Boolean equations:
- Sum = A XOR B XOR Cin
- Cout = (A AND B) OR (B AND Cin) OR (A AND Cin)

## Tools and technology
- OpenLane classic flow
- Yosys for synthesis
- OpenROAD for physical implementation
- Magic and KLayout for layout and verification
- SkyWater SKY130 high-density standard-cell library
  (sky130_fd_sc_hd)

## Flow stages
1. Read and synthesize the Verilog RTL.
2. Perform floorplanning and power-distribution planning.
3. Place standard cells and perform clock-tree/routing stages as configured.
4. Extract parasitics and perform timing analysis.
5. Generate GDSII and other final physical-design views.
6. Review DRC, LVS, antenna, and timing reports.

## Archived run
The files in `results/` and `reports/` were copied from an existing
OpenLane run dated 2026-05-21. They are archived results, not the output
of a new run launched from this repository.

The archived run log reports:
- Flow status: completed successfully
- Final GDSII: results/full_adder.gds
- Magic DRC violations: 0
- LVS: clean
- Antenna pin violations: 0
- Antenna net violations: 0
- Setup and hold violations: none reported at the typical corner
- Reported critical path: approximately 0.92 ns
- Configured clock period: 10 ns

The design is combinational. The inherited OpenLane configuration contains
a clock setting, but the full adder itself has no clock input.

## Folder contents
- `rtl/full_adder.v`: Verilog source
- `config/config.json`: copied design configuration
- `results/`: GDSII, DEF, LEF, and gate-level Verilog
- `reports/`: timing, metrics, and manufacturability reports
- `logs/openlane.log`: archived flow log
- `docs/`: flow notes and reproducibility information
- `screenshots/`: reserved for evidence screenshots

## Reproducibility note
The archived configuration refers to `src/*.v`, while this submission stores
the RTL under `rtl/`. To rerun the flow, place the source under a `src/`
directory inside the OpenLane design directory, or update `VERILOG_FILES`
to point to the actual source location. Run the flow in an environment with
the required OpenLane dependencies and SKY130 PDK installed.

The archived results demonstrate a successful prior run; they do not by
themselves prove that this repository configuration has been rerun.
