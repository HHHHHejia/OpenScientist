---
name: "Direction Negation As Skill Signal In Conversation Logs"
memory_type: procedural
subtype: no-change
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
Mining long PhD-AI conversation logs for research skills. A typical researcher's conversation with an AI might be 200 turns long; only 3–5 turns contain actual research decisions. The rest is formatting, grammar, literature lookups, code debugging — high noise, low signal. You need a filter and have no obvious place to start.

## Decision
Use **direction-negation patterns** as the primary filter. Search for turns where the researcher writes "no, that's wrong," "wait, actually," "that won't work because," "let me rethink," "换个角度," "这个思路有问题," or the equivalent in any language. These negations mark the boundary of the AI's knowledge — the AI produced a plausible-but-wrong suggestion, the researcher rejected it, and what they said next is the research skill in raw form.

Rejected: keyword search for "method" or "experiment" (too frequent and mostly generic); turn-length heuristics (long turns are often paste-dumps, not insights); researcher-expressed satisfaction (positive feedback rarely marks a pivot).

## Local Verifiers
- Within 3 turns after a negation, does the researcher write a concrete alternative? If yes, that alternative is skill material.
- Does the final paper reflect the post-negation path rather than the pre-negation path? If so, the skill was outcome-relevant.
- Do multiple researchers independently negate in similar contexts? Convergent negations localize the AI's systematic blind spots, which are the highest-value skill targets.

## Failure Handling
If direction-negation patterns are too rare in a corpus (under-prompted researchers), relax to "researcher-corrects-AI" — any turn that explicitly contradicts a prior AI claim. If still sparse, the researcher is treating AI as a typist, not a thinking partner; the corpus likely has low skill density regardless of filter.

## Anti-exemplars
- "Can you rephrase this paragraph?" — text editing, not research decision.
- "Let me paste the code and you debug it" — tool use, not research skill.
- "Wait, this p-value doesn't match what Figure 3 shows — what am I missing?" — genuine direction-negation; the resolution is likely a skill about how experienced researchers cross-check results.
