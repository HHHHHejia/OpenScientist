---
name: "Prioritizing Seasonal Patterns Over Pointwise Fit In Geoscience"
memory_type: procedural
subtype: tie
domain: physics
subdomain: geophysics
contributor: ktwu01
---
## When
Model evaluation shows good pointwise agreement but poor overall behavior.

## Decision
Preferred: Evaluate **seasonal and temporal structure** first.

Rejected:
- RMSE-focused optimization → ignores dynamics.
- Snapshot comparisons → misleading.

Reasoning:
Geophysical systems are **process-driven**, not point-driven.

## Local Verifiers
- Phase shift between modeled and observed cycles.
- Amplitude mismatch across seasons.

## Failure Handling
If temporal structure matches but error persists:
- Investigate spatial heterogeneity.
- Check forcing data resolution.

## Anti-exemplars
- Static systems without temporal dynamics.
