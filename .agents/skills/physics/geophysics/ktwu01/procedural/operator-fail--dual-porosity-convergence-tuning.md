---
name: "Dual Porosity Convergence Tuning"
memory_type: procedural
subtype: operator-fail
domain: physics
subdomain: geophysics
contributor: ktwu01
---
## When
Simulating water flux in fractured bedrock using dual-porosity models (e.g., Gerke & van Genuchten); the model fails to converge or produces unphysical "staircase" pressure heads during rapid infiltration events.

## Decision
Prioritize the coupling term coefficient ($\alpha_w$) over the hydraulic conductivity of the matrix. 
Rejected: Increasing spatial resolution of the fracture domain (often leads to further numerical oscillation); reducing global time-steps (inefficient).
Reasoning: Numerical instability in dual-porosity models often stems from the lag in the mass exchange term between the macropore (fracture) and micropore (matrix) systems, not the flow within the domains themselves.

## Local Verifiers
- Mass balance error > 1% in the first 10 time-steps.
- Pressure head divergence between domains exceeding 100m in < 1 hour of simulation time.

## Failure Handling
If $\alpha_w$ tuning fails, check for "numerical capillary barriers" where the matrix suction is so high it prevents the transfer of water from saturated fractures, requiring a smoothing function for the transfer term.

## Anti-exemplars
- Standard soil column models (single porosity).
- Equilibrium flow assumptions where fracture and matrix are assumed to have equal pressure instantly.
