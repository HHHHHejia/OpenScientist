---
name: "Research Direction Closed Loop Ordering"
memory_type: procedural
subtype: tie
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
Ordering a curated list of research directions (e.g., 5 conference session themes) where the directions are independently valid but the ordering communicates a worldview. Default reading order will influence audience interpretation.

## Decision
Order the directions to form a **capability closed loop** — perception → learning → reasoning → application → safety — and place infrastructure/tooling directions *below* the loop as enabling conditions rather than inside it. Example ordering used:
1. Multimodal Intelligence in the Physical World (perception)
2. Continual Learning and Self-Evolving Agents (learning)
3. Agentic RL + Verified/Formal Reasoning (reasoning)
4. Autonomous AI Scientists (application)
5. [dividing line]
6. Post-Transformer Architectures (infrastructure)

This communicates "these four produce capabilities, the fifth underlies them." Alignment/Safety can be slotted as the 5th capability-level direction ("keeps the loop bounded") or omitted when the audience is purely capability-focused.

Rejected — alphabetical / chronological ordering: communicates no worldview.

Rejected — "rank by hype": creates a list that ages badly as hype shifts.

## Local Verifiers
- Does removing one item break the loop? If no, the loop isn't tight; consider consolidating.
- Is every item at the same level of abstraction? If one is "a technique" and another is "a product goal", the list is category-mixed and will read as incoherent.
- Does the infrastructure item feel demoted? If it does, the dividing line is doing its job.

## Failure Handling
If the audience pushes back on the capability/infrastructure split ("why is Post-Transformer not #1 — it's the most important"), reframe: the split is about *level*, not importance. Infrastructure is often the most important direction but it's not commensurable with the capability directions.

## Anti-exemplars
- A flat 5-item list with no internal ordering logic — wastes the opportunity to communicate structure.
- A list that puts Mechanistic Interpretability as a peer of Multimodal — category mismatch; MI is a tool, Multimodal is a capability.
