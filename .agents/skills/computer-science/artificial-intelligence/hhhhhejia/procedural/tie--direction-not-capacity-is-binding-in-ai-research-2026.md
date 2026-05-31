---
name: "Direction Not Capacity Is Binding In AI Research 2026"
memory_type: procedural
subtype: tie
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
Deciding where to spend research effort in 2026 AI. Common framings: "bigger models," "more data," "better architectures," "more compute." These are all *capacity* framings.

## Decision
The 2026 binding constraints are *direction* constraints, not capacity: (a) verifiability (jagged frontier — you can't automate what you can't verify); (b) alignment triad (no single method simultaneously gives strong optimization + perfect value capture + robust generalization); (c) sample efficiency gap (~10⁴ human vs LLM); (d) retrieval-vs-computation entanglement (attention conflates two distinct cognitive functions). Each is a bounded *structural* problem; adding capacity does not solve any of them.

Preferred research bets: interventions at the level of inductive bias (Engram, typed tokenization, Kantian-category priors), verification scaffolding (formal methods, test-time RL with verifiable rewards), and interpretability-driven architecture (making features locatable before fixing them).

Rejected — "scale is all you need" as 2026 agenda: scale resolves some problems but not the four above. The 2023–2024 scaling era gave diminishing returns on reasoning reliability.

## Local Verifiers
- If you added 10× compute to your favored approach, which of the four binding constraints does it resolve? If none, the research bet is mis-targeted.
- Is there a concrete 2026 empirical signal that the direction actually matters (Willow for QC, Nemotron-H for hybrid arch, Sakana's Nature paper for autonomous science)? Directions without a 2025/2026 landmark are likely premature.

## Failure Handling
If your agenda is a capacity bet, translate it to a direction bet: "more data" → "better selection of data," "bigger model" → "better inductive biases at current size." The translation often reveals the underlying direction question.

## Anti-exemplars
- A lab roadmap whose top 5 directions all reduce to "train something bigger on something larger."
- A research proposal that claims to help "AI in general" without naming the specific binding constraint it loosens.
