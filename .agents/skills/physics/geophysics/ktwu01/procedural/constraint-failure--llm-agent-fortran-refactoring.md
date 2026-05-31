---
name: "Llm Agent Fortran Refactoring"
memory_type: procedural
subtype: constraint-failure
domain: physics
subdomain: geophysics
contributor: ktwu01
---
## When
Using a multi-agent system (Noah-Agent) to refactor legacy Fortran Earth system code; the agent suggests using modern `iso_c_binding` or complex pointers that the underlying model's Makefile/compiler (e.g., old versions of Intel Fortran or PGI) cannot resolve.

## Decision
Force the agent to use "F90-Strict" syntax: explicit loops instead of array syntax for large 3D arrays to avoid stack overflows, and avoiding `associate` blocks which confuse older static analyzers.
Rejected: "Modernization" for the sake of readability; the primary constraint is binary reproducibility with the original legacy output.

## Local Verifiers
- Compiler error: "Feature not supported in this version."
- Binary diff: bit-for-bit mismatch between original and refactored code.

## Failure Handling
If refactoring changes the output, revert to "Block-by-Block Verification": refactor a single subroutine, run a 1-day simulation, and compare NetCDF outputs.

## Anti-exemplars
- Refactoring independent Python scripts (where modern syntax is preferred).
- Green-field scientific software development.
