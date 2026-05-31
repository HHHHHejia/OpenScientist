---
name: phs-afternoon-psn-depression-vs-shs-enhancement
memory_type: episodic
subtype: anomalous
domain: physics
subdomain: atmospheric-and-oceanic-physics
contributor: ktwu01
source:
  type: session
  session_id: 08ef9724-5a90-4b37-8849-0dfb2f4d90d0
extracted_at: 2026-04-20
tags: [plant-hydraulics, NoahMP-PHS, photosynthesis, diurnal-cycle, drought, hydraulic-stress]
---

## Situation

Analysis of July 2012 JJA 2012 drought peak: computed the afternoon-to-morning photosynthesis ratio (PSN_afternoon / PSN_morning) across the CONUS domain, comparing PHS and SHS runs.

## Action

Sampled hourly LDASOUT PSN fields for all 744 July 2012 files, split into morning (06:00–10:00 local) and afternoon (12:00–16:00 local) bins, computed per-grid median ratio across the domain.

## Outcome

- **PHS median A/M ratio = 0.82** — afternoon PSN is 18% *lower* than morning PSN
- **SHS median A/M ratio = 1.06** — afternoon PSN is 6% *higher* than morning PSN

PHS shows afternoon depression of photosynthesis; SHS shows a small afternoon enhancement. The contrast directly fingerprints hydraulic stress: in PHS, midday stem water potential depletion restricts stomatal conductance in the afternoon, suppressing carbon fixation. SHS has no such hydraulic cost and follows the radiation-driven peak.

## Lesson

The afternoon/morning PSN ratio is a clean process-level diagnostic for distinguishing hydraulic limitation (ratio < 1) from radiation-limited growth (ratio ≥ 1). In the 2012 drought domain, PHS correctly captures the observed afternoon depression that eddy-covariance flux towers routinely show under heat/drought stress. A ratio near 0.82 indicates moderate to strong hydraulic limitation. Values below ~0.7 would indicate near-complete afternoon shutdown.

## Retrieval Cues

- Evaluating PHS vs. standard stomatal-conductance scheme on summer drought periods
- Asking whether a model captures hydraulic stress-induced midday photosynthesis suppression
- Interpreting diurnal PSN cycles from LSM output in drought years

