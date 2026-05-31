---
name: phs-vpsis-physical-clamp-at-minus-9000mm
memory_type: semantic
subtype: correction
domain: physics
subdomain: atmospheric-and-oceanic-physics
contributor: ktwu01
source:
  type: session
  session_id: 08ef9724-5a90-4b37-8849-0dfb2f4d90d0
extracted_at: 2026-04-20
tags: [plant-hydraulics, NoahMP-PHS, stem-water-potential, fill-values, masking]
---

## Fact

In the NoahMP Plant Hydraulic Stress (PHS) scheme, the stem water potential variable VPSIS physically clamps at **−9000 mm H₂O** (≈ −88 MPa) under extreme drought. This is a physics limit baked into the PHS solver, not a NetCDF fill or flag value. The identically named VPSIS variable in LDASOUT output files can therefore hold −9000 mm as a *valid, physically meaningful* value in the driest grid cells.

## Evidence

During CONUS JJA 2012 analysis, a code review agent flagged that masking `arr > -9000` (i.e., rejecting values ≤ −9000) silently excluded the most hydraulically stressed cells across the southwestern US. Correcting the mask to `arr > -9500` recovered those cells and slightly shifted spatial statistics drier (VPSIS mean −0.0486 MPa vs. −0.0468 MPa before fix).

## LLM Default Belief

LLMs almost universally treat a round, extreme-negative value like −9000 in a geophysical field as a fill/flag sentinel and mask it out. For VPSIS in NoahMP-PHS the opposite is true: −9000 mm is the physically realized lower bound, and masking it introduces a systematic warm bias in drought-stress diagnostics.

## Expiry Signal

Expires if the NoahMP-PHS solver is updated to use a different internal clamp or if VPSIS is renamed/reformatted in future output conventions.

