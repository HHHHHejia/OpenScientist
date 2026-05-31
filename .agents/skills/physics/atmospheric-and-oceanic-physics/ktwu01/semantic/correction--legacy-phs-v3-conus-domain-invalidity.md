---
name: "Legacy PHS v3 CONUS domain invalidity"
memory_type: semantic
subtype: correction
domain: physics
subdomain: atmospheric-and-oceanic-physics
contributor: ktwu01
source:
  type: session
  session_id: 2ae19d9d-a047-477c-9797-528bf25bdae6
extracted_at: 2026-04-13
tags: [noah-mp, plant-hydraulics, model-evaluation, domain-validity, CONUS, NLDAS]
---

## Fact
Legacy Plant Hydraulics Scheme (PHS) v3 for Noah-MP cannot produce physically valid results when applied to CONUS/regional domains using standard NLDAS forcing. The scheme requires PHS-specific input fields (VPSIS, VPSIL, VWSS, VWSL, SPWAI, SPWVI, VEGHT, IPHTYP) that are absent from standard NLDAS setup files. Making the code run by patching missing-field reads from FATAL to NOT_FATAL and initializing unset groundwater counters (e.g., STEPWTD=0, causing a divide-by-zero that was masked) produces output that looks plausible but is scientifically invalid.

## Evidence
Scientist explicitly corrected an AI that had run Legacy PHS on CONUS after patching missing-field reads: "the legacy version itself cannot be run on CONUS… you must have done something unphysical." The scientist then directed deletion of all Legacy PHS CONUS output, removal of associated scripts from version control, and a git revert of the commit.

## LLM Default Belief
If model code can be made to compile and execute by downgrading fatal errors to warnings and initializing unset variables to reasonable defaults, the resulting output is physically valid and can be analyzed.

## Expiry Signal
Would expire if Legacy PHS v3 is formally ported with proper CONUS/NLDAS parameter files and documented input field generation procedures.

