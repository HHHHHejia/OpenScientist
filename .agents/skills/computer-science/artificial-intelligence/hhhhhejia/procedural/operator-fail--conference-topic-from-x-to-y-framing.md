---
name: "Conference Topic From X To Y Framing"
memory_type: procedural
subtype: operator-fail
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
Formulating a conference session title that joins two related but distinct sub-topics (e.g., "Agentic RL" and "Verified/Formal Reasoning"). A comma-joined title reads as two bolted-together topics rather than a coherent theme.

## Decision
Use **"Scaling X: From A to B"** or **"Towards X: Y of Z"** structures. The "From A to B" form implies a research trajectory (RL gives you reasoning capability; formal verification gives you reliability of that reasoning — they compose in that order). "Towards" signals "not yet achieved, this is the research agenda" — a standard academic-conference register. Examples that apply this well:
- "Scaling Agentic Reasoning: From Reinforcement Learning to Formal Verification"
- "Towards Autonomous AI Scientists: Automating the Full Cycle of Discovery"
- "Beyond Transformers: Architectures for Efficient and Scalable Intelligence"

Rejected: comma-joined titles ("Scaling Agentic RL, Verified/Formal Reasoning") — information-dense but reads as two topics hard-pasted together, no implied relationship.

Rejected: "Next-Generation X" — too vague; the reader learns nothing about what makes X next-gen. "Beyond X: Architectures for [specific value prop]" fixes this by naming the value prop.

## Local Verifiers
- Read the title aloud. Does it imply a direction/trajectory? If no, it reads as a list.
- Can you replace "From A to B" with "A + B" and lose meaning? If you *can*, the trajectory framing was doing work and is worth keeping.
- Is there a sub-title? A subtitle like "Automating the Full Cycle of Discovery" scopes "Autonomous AI Scientists" far better than the bare phrase.

## Failure Handling
If the sub-topics don't actually compose in a natural order, the attempt to use "From A to B" will feel forced — go with a broader umbrella term instead ("Continual Learning and Self-Evolving AI Agents" rather than "From Continual Learning to Self-Evolving Agents").

## Anti-exemplars
- "Multimodal, Continual, Agentic AI" — three-word salad, no organizing principle.
- "Grounding Multimodal Intelligence in the Physical World" — applies the "grounding" academic term (grounded cognition) to imply direction (digital → physical); good use of field jargon as structural signal.
