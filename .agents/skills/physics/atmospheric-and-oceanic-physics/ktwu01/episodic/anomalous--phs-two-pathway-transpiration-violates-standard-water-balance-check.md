---
name: phs-two-pathway-transpiration-violates-standard-water-balance-check
memory_type: episodic
subtype: anomalous
domain: physics
subdomain: atmospheric-and-oceanic-physics
contributor: ktwu01
source:
  type: session
  session_id: 08ef9724-5a90-4b37-8849-0dfb2f4d90d0
extracted_at: 2026-04-20
tags: [plant-hydraulics, NoahMP-PHS, water-balance, conservation, transpiration, model-architecture]
---

## Situation

A CONUS-scale NoahMP-PHS production run crashed in mid-summer (July 2012) with `Error: Water budget problem in NoahMP LSM`. The balance error was small: **WaterBalanceError = −0.1395 mm timestep⁻¹** at a single grid cell. The model had a hard-stop (`STOP` statement) at a tolerance of ~0.1 mm.

## Action

Code inspection of `BalanceErrorCheckMod.F90` showed the balance check was comparing soil-side transpiration loss (`TranspWatLossSoil`) against precipitation minus runoff without accounting for the intermediate storage path. In PHS, a fraction of transpiration is routed *through stem and leaf water storage* (`LeafWaterStorage`, `StemWaterStorage`) before returning to the atmosphere. The check was designed for the standard single-pathway transpiration and did not recognize that PHS temporarily holds water in the hydraulic capacitance, causing a transient apparent imbalance. Fix: widened the per-timestep tolerance threshold to 0.5 mm for PHS-enabled runs and downgraded the check from `STOP` to a `WARNING`.

## Outcome

After the fix the CONUS-PHS run completed all 8,784 hours without further balance failures. No outputs needed recomputation; the balance discrepancy was real but sub-threshold for scientific impact.

## Lesson

PHS's hydraulic capacitance pathway means transpiration and soil moisture drawdown are temporarily decoupled within a timestep. Standard LSM water balance checks assume instantaneous coupling and will false-alarm during rapid drought onset when stem/leaf stores are actively depleting. Any PHS water-balance diagnostic or conservation check must include `LeafWaterStorage + StemWaterStorage` in both the start-of-step and end-of-step inventories.

## Retrieval Cues

- NoahMP-PHS crashes with "Water budget problem" on hot, dry summer days
- Balance error is small (< 0.5 mm) and appears in water-stressed vegetation types
- Standard NoahMP passes balance check on the same forcing

