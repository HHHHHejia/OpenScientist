---
name: correct-answer-rarely-has-flawed-process-in-rl-models
memory_type: episodic
subtype: anomalous
domain: computer-science
subdomain: artificial-intelligence
contributor: tanzelin430
source:
  type: session
  session_id: c9677772-34fb-4b4a-93d6-0d5a0094548a
extracted_at: 2026-04-19
tags: [case-study-design, math-reasoning, rl-training, process-quality, qualitative-analysis]
---

## Situation

Designing qualitative case studies to compare reasoning process quality between two RL-trained math models (ORM vs process-supervised). The natural target was examples where both models answer correctly but one has a flawed reasoning process — this would cleanly illustrate that process supervision matters even when outcomes match.

## Action

Searched ~1,200 held-out math problems (MATH-500 + OlympiadBench + AIME) for the "both correct but process differs" pattern, generating 4 responses per model per problem.

## Outcome

The target pattern was extremely rare. Among 70 both-correct problem pairs, almost no cases showed one model using a valid shortcut and the other using circular or incorrect intermediate steps. Correct answers almost always arose from correct reasoning chains. The most reliable behavioral difference was *meta-cognitive habit* (self-verification rate), not process correctness.

## Lesson

For RL-trained math reasoning models, "correct outcome, flawed process" is uncommon because the correctness criterion itself filters for structurally sound reasoning. Case studies contrasting process quality should instead target: (a) problems where one model fails entirely due to a specific reasoning flaw, or (b) behavioral habit differences (verification, error-checking) that appear across many correct-answer responses as a statistical pattern rather than in individual solution steps.

## Retrieval Cues

- Designing qualitative case studies for a paper comparing outcome-supervised vs process-supervised RL
- Searching for "process quality" differences between models that achieve similar accuracy
- Trying to find "right answer, wrong reasoning" examples in math problem benchmarks

