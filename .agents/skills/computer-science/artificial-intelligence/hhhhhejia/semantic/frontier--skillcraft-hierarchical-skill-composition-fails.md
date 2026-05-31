---
name: "Skillcraft Hierarchical Skill Composition Fails"
memory_type: semantic
subtype: frontier
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## Fact
SkillCraft (Chen et al., 2026) tested whether skills calling skills (hierarchical composition) improves agent performance. It does not: GPT-5.2 dropped from 90% success in flat Skill Mode to 79% in Hierarchical Mode due to error propagation through the skill stack. A concrete documented failure: a three-layer skill stack for dog-breed analysis (`dog_breed_encyclopedia` → `analyze_breed_complete` → `get_breed_profile`) cascaded-failed because the bottom skill did not null-check a `temperament` field; the middle skill ran `.split(',')` on null, threw TypeError, and the top skill collapsed. Conclusion: shallow, independently-verifiable skill libraries beat deep auto-generated hierarchies. Skill depth is a liability, not a strength.

## Evidence
Direct paper review in session (April 2026), with the dog-breed example explicitly cited in the paper's trajectory analysis.

## Expiry Signal
If future skill-composition work adds robust error boundaries (retry, fallback, type contracts) between layers and shows depth > 2 outperforms flat, this finding will need revision. Until then, treat this as a design axiom.
