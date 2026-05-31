---
name: "Noah Mp Wood Moisture Initialization"
memory_type: semantic
subtype: correction
domain: physics
subdomain: geophysics
contributor: ktwu01
---
## Fact
In Noah-MP, "wood moisture" (often treated as part of the plant water storage) cannot be initialized at full saturation without causing a latent heat flux spike that destabilizes the surface energy balance. It must be spun up using a "ramped-saturation" approach or initialized based on the pre-dawn leaf water potential of the first simulation day.

## Evidence
Observed energy balance non-closure and $T_{veg}$ (vegetation temperature) crashing to the lower bound (200K) in early simulation phases when wood moisture was set to a constant high value to simulate wet-season onset.

## LLM Default Belief
LLMs typically suggest initializing all moisture variables at field capacity or saturation to ensure "safe" starting conditions for hydrologic models.

## Expiry Signal
Will expire if/when Noah-MP v5.0+ introduces a dedicated wood-capacitance module with its own internal equilibrium logic.
