---
name: rank-ordering-guarantee-dual-advantage-rl
memory_type: episodic
subtype: anomalous
domain: computer-science
subdomain: artificial-intelligence
contributor: tanzelin430
source:
  type: session
  session_id: 9f606a10-1c9c-4e3b-b41f-26a5a34f84be
extracted_at: 2026-04-19
tags: [reinforcement-learning, reward-design, advantage-estimation, mathematical-verification, grpo]
---

## Situation
A dual-advantage RL method combines an outcome reward advantage (ORM, binary 0/1) with a process reward advantage (PRM, 3-tier: 0/0.5/1.0), normalized only among correct responses (correct-subset normalization). A community reviewer raised the concern that unlike standard GRPO — where binary normalization guarantees correct samples always outrank wrong ones — the combined A_total = A_out + A_proc might allow a wrong sample to outrank a correct one.

## Action
Derived the bound mathematically: wrong samples receive A_proc = 0 by design, so their total advantage equals A_out_wrong alone. Correct samples receive A_out_correct + A_proc_correct. Checked whether the minimum total advantage among correct samples exceeded the maximum advantage among wrong samples for group size G=8 and PRM ∈ {0, 0.5, 1.0}.

## Outcome
Rank reversal was proven impossible under these specific parameter constraints. The correct-subset normalization is both the anti-hacking mechanism and the formal guarantor of the ranking property.

## Lesson
When combining binary ORM with ordinal PRM in dual-advantage RL, correct-subset normalization (forcing A_proc = 0 for wrong answers) preserves the ranking guarantee — but this is parameter-dependent, not automatic. Before claiming the guarantee, explicitly verify it for the target group size G and PRM value range. Reviewers will ask.

## Retrieval Cues
- Designing ORM + PRM advantage combination in GRPO-style policy gradient
- Reviewer asks whether correct > wrong ranking is still guaranteed after adding process reward
- Choosing PRM normalization scope (all samples vs. correct-only)

