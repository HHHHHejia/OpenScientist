---
name: "Distinguishing Parameter Error Vs Structural Error In Models"
memory_type: procedural
subtype: tie
domain: physics
subdomain: geophysics
contributor: ktwu01
---
## When
Model output deviates from observations; unclear if due to parameters or structure.

## Decision
Preferred:
- Test **parameter sensitivity bounds first**.
- If no parameter set resolves discrepancy → infer structural error.

Rejected:
- Immediate structural overhaul → high cost without evidence.
- Blind parameter tuning → overfitting.

Reasoning:
Parameter space is lower-dimensional; exhaust it before structural change.

## Local Verifiers
- Parameter sweep fails to reduce error below threshold.
- Error pattern remains consistent across parameter sets.

## Failure Handling
If structural fix fails:
- Re-examine data quality.
- Check boundary conditions and forcing inputs.

## Anti-exemplars
- Models with known high parameter uncertainty.
