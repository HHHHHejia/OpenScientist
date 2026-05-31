---
name: "Rock Moisture Storage Capacity Scaling"
memory_type: semantic
subtype: frontier
domain: physics
subdomain: geophysics
contributor: ktwu01
---
## Fact
Traditional Land Surface Models (LSMs) define the bottom boundary at the soil-bedrock interface (usually 2-3 meters). However, in weathered landscapes (like the Texas Hill Country), "rock moisture"—water stored in the weathered bedrock (saprolite)—can contribute up to 30-50% of transpiration during summer droughts. This storage is not a "soil layer" but a fractured porous medium with extremely high suction but low total volume.

## Evidence
Field observations and recent papers (e.g., Rempe & Dietrich) show roots penetrating 10+ meters into bedrock; existing Noah-MP soil layers fail to capture this "deep reservoir" effect, leading to premature wilting in simulations.

## LLM Default Belief
Most models treat bedrock as an impermeable or "leaky" bottom boundary with zero root-available water.

## Expiry Signal
Introduction of a "weathered bedrock" soil class in the global FAO or USDA soil datasets used by ESMs.
