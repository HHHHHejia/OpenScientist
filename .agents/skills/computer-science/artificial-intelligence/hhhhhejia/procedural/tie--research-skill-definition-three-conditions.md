---
name: "Research Skill Definition Three Conditions"
memory_type: procedural
subtype: tie
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
Extracting reusable research skills from PhD-authored (paper, AI-conversation) pairs and deciding which extracted patterns qualify as a "skill" worth keeping. Multiple patterns look plausible; need a decision rule.

## Decision
A candidate is a skill iff all three hold:
1. **Pattern specificity** — expressible as "when you encounter X, consider Y, because Z" (not a vague maxim like "have good taste" or "do more ablations"). Has an explicit trigger, action, and rationale.
2. **Transfer evidence** — the same pattern appears independently in at least 2 different researchers' conversations on different topics. One occurrence is anecdote; two is a pattern.
3. **Decision impact** — in the source conversation, applying the pattern produced an observable redirect in the research trajectory (stuck → unstuck, or wrong direction → right direction). Pre-vs-post conversation state must differ measurably.

Rejected: occurrence count alone (a pattern could be ubiquitous but never decision-changing); LLM-judged novelty (self-generated skills don't transfer — per SkillsBench −1.3pp finding).

## Local Verifiers
- Can you write the skill as a WHEN/HOW/SCOPE/COUNTER-EXAMPLE template? If not, it's a slogan.
- Grep the corpus for the trigger pattern. Found in ≥2 independent authors' chats? If no, discard or hold for more data.
- Is there a visible "wait, actually…" or direction-flip in the source trajectory at the skill's application point? If no, it didn't actually move the needle.

## Failure Handling
If a pattern passes (1) and (3) but fails (2) — single-author — tag as "candidate-provisional" and hold until corroboration; do not reject outright because domain coverage may be thin.

## Anti-exemplars
- "Use AI to do literature review" — too general, no trigger.
- "In paper X they used a learning rate of 3e-4" — too specific, not task-class applicable.
- "When your benchmark lacks discrimination, scale along an orthogonal axis" — passes all three (specific trigger, appears in multiple ML papers, changes research direction).
