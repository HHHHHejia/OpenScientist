---
name: "Hysteresis Scanning Curve Validation"
memory_type: episodic
subtype: adaptation
domain: physics
subdomain: geophysics
contributor: ktwu01
---
## Situation
Attempted to use the standard Mualem-van Genuchten model to predict soil moisture during a series of intermittent "mini-droughts" (frequent wetting/drying cycles). The model significantly overestimated water retention during the drying phase.

## Action
Implemented dynamic scanning curves using the "slope-scaling" method to interpolate between the main drying and main wetting curves, rather than defaulting to the main drying curve for all transitions.

## Outcome
Reduction in RMSE for soil moisture by ~15% during transition periods. Discovered that the "memory" of the previous drying state is more critical than the absolute moisture content.

## Lesson
Standard models assume a single path (non-hysteresis); in high-frequency meteorological forcing, the "tacit" error is not the curve shape, but the lack of path-dependency in the code.

## Retrieval Cues
"Staircase effect in soil moisture," "intermittent precipitation bias," "van Genuchten hysteresis."
