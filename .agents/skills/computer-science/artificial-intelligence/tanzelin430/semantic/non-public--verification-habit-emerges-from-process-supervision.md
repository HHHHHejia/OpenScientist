---
name: verification-habit-emerges-from-process-supervision
memory_type: semantic
subtype: non-public
domain: computer-science
subdomain: artificial-intelligence
contributor: tanzelin430
source:
  type: session
  session_id: c9677772-34fb-4b4a-93d6-0d5a0094548a
extracted_at: 2026-04-19
tags: [rl-training, process-reward, emergent-behavior, math-reasoning, self-verification]
---

## Fact

Process-supervised RL training (rubric-based PRM reward) causes measurably higher self-verification rates in generated math reasoning as an emergent behavioral consequence, not an explicitly trained behavior. In a direct comparison on held-out math problems (MATH-500 + OlympiadBench), PA-GRPO responses contained explicit verification steps in ~28.8% of cases vs ~19.1% for ORM baseline — roughly a 1.5× increase.

## Evidence

Keyword-based count of verification phrases ("verify", "check", "substitute back", "confirm", etc.) across 70 both-correct problem pairs sampled from MATH-500 and OlympiadBench after training on Qwen2.5-7B-Base. Both checkpoints at the same training step; 4 responses per problem sampled at temperature 0.7.

## Expiry Signal

This ratio is specific to Qwen2.5-7B-Base at ~300–1000 training steps with this rubric design. The direction (PRM > ORM) should generalize; the magnitude may shift with different model families, rubric granularity, or training duration.

