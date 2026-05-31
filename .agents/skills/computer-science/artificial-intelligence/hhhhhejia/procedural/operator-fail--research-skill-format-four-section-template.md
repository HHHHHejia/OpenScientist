---
name: "Research Skill Format Four Section Template"
memory_type: procedural
subtype: operator-fail
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
Writing a research skill up for a skill library or benchmark. The skill author faces the choice of free-form vs structured documentation. Free-form is underspecified; fully structured may be too rigid. SkillsBench finding: detailed (+18.8pp) and compact (+17.1pp) forms both work; comprehensive form (-2.9pp) hurts.

## Decision
Use a 4-section template:
1. **When (trigger condition)** — "When you encounter ___..." — must have an explicit, observable trigger, not a mood ("when you're stuck").
2. **How (operation steps)** — concrete steps 1–3, each ideally verifiable. Not more than ~5 steps (comprehensive documents hurt).
3. **Scope (applicable / not applicable)** — explicit boundaries. This is what distinguishes a skill from a slogan.
4. **Counter-examples** — documented cases where applying this skill made things worse. Research skills are heuristic, not deterministic; counter-examples are mandatory, not optional.

Plus evidence provenance (which conversations/papers the pattern was extracted from). Do NOT include: literature-review content (factual, not procedural); tool-specific tutorials (not portable); paper-writing templates (structural, not decisional).

## Local Verifiers
- Word count check: keep the whole SKILL.md under ~500 words to stay in "compact/detailed" zone. Over ~1500 words = comprehensive = negative-transfer risk.
- Each section answers exactly one question? If two sections answer the same question, collapse.
- Could a reader apply the skill on a new task after reading only the When/How sections? If not, you're missing a step.

## Failure Handling
If the skill seems to require more than 5 steps, it's two skills; split and cross-link.

## Anti-exemplars
- "Have good research taste" — no trigger, no steps, no scope.
- "When doing ML research, always ablate each component" — trigger too broad; no scope; no counter-examples (there are tasks where ablation is wasteful).
- "When your benchmark saturates (>90% on all baselines), scale the benchmark along an orthogonal axis before scaling models" — passes all 4 sections cleanly.
