---
name: phs-subtropical-degradation-28-32n
memory_type: episodic
subtype: anomalous
domain: physics
subdomain: atmospheric-and-oceanic-physics
contributor: ktwu01
source:
  type: session
  session_id: 08ef9724-5a90-4b37-8849-0dfb2f4d90d0
extracted_at: 2026-04-20
tags: [plant-hydraulics, NoahMP-PHS, zonal-profiles, model-performance, subtropical, CONUS]
---

## Situation

Zonal-mean analysis of CONUS-PHS-2012 vs. CONUS-SHS-2012 annual means. Expected PHS to improve latent heat and transpiration uniformly across latitudes (consistent with single-point Phase 2 validation over mid-latitude sites).

## Action

Computed `np.nanmean(annual, axis=1)` (longitude-mean) for each latitude band and plotted PHS minus SHS difference profiles for LH, HFX, TR, TRAD, and soil moisture.

## Outcome

PHS improves relative to SHS across most of CONUS, but at **28–32°N** (Texas/Gulf Coast/Mexico border zone) PHS shows a *negative* LH bias — i.e., PHS is *drier and less transpiring* than SHS in that latitude band, an unexpected degradation. The code was verified correct; this is a genuine physics signal, not a computational artifact.

## Lesson

PHS performance is not spatially uniform. The subtropical boundary (C4-dominated grasslands, shallow-rooted shrubs, episodic convective precipitation regime) may stress the PHS hydraulic parameterization in ways not captured by mid-latitude calibration. Any CONUS-scale PHS evaluation should explicitly stratify by vegetation/climate zone and not report a single CONUS-mean improvement as representative everywhere.

## Retrieval Cues

- Evaluating PHS CONUS runs with latitude-stratified metrics
- PHS shows unexpected drying or reduced ET at low latitudes despite being designed to improve drought response
- Comparing PHS performance in subtropical vs. temperate zones

