---
name: "Hydrology Model Integration Of Rock Moisture"
memory_type: procedural
subtype: constraint-failure
domain: physics
subdomain: geophysics
contributor: ktwu01
---
## When
Standard land surface models (e.g., Noah-MP) fail to capture observed water storage dynamics in semi-arid or mountainous systems.

## Decision
Preferred: Introduce **rock moisture as an explicit storage term** alongside soil moisture, using conceptual separation rather than forcing parameter tweaks.

Rejected:
- Tuning soil hydraulic parameters to absorb mismatch → masks missing physics.
- Increasing soil depth arbitrarily → violates geological realism.

Reasoning:
Observed discrepancies are structural, not parametric. Rock moisture introduces a physically distinct reservoir supported by field evidence.

## Local Verifiers
- Model underestimates dry-season baseflow despite correct precipitation input.
- Soil moisture saturates too quickly compared to observations.
- Observed evapotranspiration persists despite modeled soil depletion.

## Failure Handling
If adding rock moisture does not improve dynamics:
- Check coupling with root uptake (roots accessing fractured rock).
- Re-evaluate permeability assumptions between soil and bedrock layers.

## Anti-exemplars
- Systems dominated by shallow soils with impermeable bedrock.
- Regions with negligible fracture porosity.
