---
name: "Evaluate Research Skills Without Benchmark"
memory_type: procedural
subtype: no-change
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
Validating extracted research skills as "good" or "bad" without a proper benchmark (because research has no clean pass/fail ground truth, unlike code execution). You deliberately are NOT building a benchmark.

## Decision
Use three proxy signals, each necessary:
1. **Recurrence across independent researchers** — does the pattern appear in ≥2 (ideally ≥5) researchers working on different problems? High recurrence argues against domain-specific flukes.
2. **Class-level applicability** — does it solve a *class* of problems ("when your loss explodes after epoch 3–5, check LR first") or a *specific* instance ("set LR=3e-4 for this model")? Only the former transfers.
3. **Observable behavior change on a new AI** — when you inject the skill into a different agent doing a related task, does the trajectory visibly shift (fewer wrong turns, shorter path, different abandonment points)? If the trajectory is unchanged, the skill is inert — it may match the agent's existing priors.

Rejected — "paper got accepted" as the validation metric: too noisy (acceptance confounds many factors beyond the skill); too slow (months to years); and subject to survivorship bias.

Rejected — "peer review score" as the metric: same issues plus high variance.

Rejected — self-judged LLM quality rating of the skill: prone to stylistic bias, doesn't capture transfer.

## Local Verifiers
- Recurrence check: mechanical text search across the corpus for the trigger pattern. If the same pattern re-appears in disjoint author clusters, strong signal.
- Class applicability check: rewrite the skill with different nouns — does it still read as a skill? If yes, it's class-level.
- Behavior-change check: A/B the skill on a held-out research task; compare trajectories (not just final answers).

## Failure Handling
If behavior-change is null but recurrence is high, the skill may be capturing a pattern the AI already knows implicitly — useful for human readers but not for AI injection. Downgrade to "human-training material" rather than "AI-injectable skill."

## Anti-exemplars
- Validating a research skill by asking the AI "is this a good skill?" — maps to SkillsBench's failure mode where self-generated skills do nothing.
- Validating a research skill by measuring how often a random researcher finds it "interesting" — captures novelty, not utility.
