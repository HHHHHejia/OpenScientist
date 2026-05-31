---
name: "Paper Trajectory Is Higher Signal Than Final Paper"
memory_type: procedural
subtype: no-change
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
Building a training corpus for AI-assisted scientific discovery from PhD-authored work. You have access to final papers AND the conversation logs that produced them. Which signal do you mine?

## Decision
**Conversation logs dominate final papers** for skill extraction. Final papers show the optimized path taken; conversations reveal (a) rejected alternatives, (b) moments the researcher was stuck, (c) the specific AI suggestions that unstuck them, (d) the heuristics the researcher applied under uncertainty that were elided from the Methods section. All four are the raw material of research skills; none survive into the paper.

Rejected — final-paper-only corpus: encodes outcomes without process. SkillsBench's result that model-self-generated skills are useless (-1.3pp vs human-authored +16.2pp) is consistent with the conjecture that models can already imitate final-paper *style* but cannot synthesize the tacit procedural knowledge that gets a researcher from stuck to unstuck. That knowledge lives in the conversation.

Rejected — paper + abstract-only: throws out the bulk of the tacit signal.

## Local Verifiers
- In the conversation log, can you find a turn where the researcher rejects an AI suggestion? That rejection is skill material. Absence of such turns = low-yield corpus.
- Does the final paper's method section mention an alternative that was considered and abandoned? Almost never — if you only have the paper, you can't recover the abandoned alternatives. Confirms process asymmetry.
- Retrospective interview / researcher self-narration: good, if available; treat as a complement to the conversation log rather than a substitute (retrospective accounts are heavily edited).

## Failure Handling
If conversation logs are unavailable (most published work), the alternative is (a) recruiting researchers to self-narrate their process, (b) using git commit histories of the experimental code as a weaker process-proxy, (c) using review rebuttals where authors explicitly discuss paths not taken.

## Anti-exemplars
- "Train on arXiv" — yields paper-style continuations, not research-skill continuations. Explains why fine-tuning on arXiv is a poor path to autonomous research.
- "Train on (paper, first-author's full Claude chat history)" — the right corpus; rare and privacy-sensitive, but the only direct route.
