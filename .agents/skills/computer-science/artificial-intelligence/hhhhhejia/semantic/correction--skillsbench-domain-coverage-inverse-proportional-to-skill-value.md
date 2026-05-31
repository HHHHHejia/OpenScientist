---
name: "Skillsbench Domain Coverage Inverse Proportional To Skill Value"
memory_type: semantic
subtype: correction
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## Fact
SkillsBench's most counterintuitive finding: skill value is *inversely* proportional to the pretraining coverage of the target domain. Healthcare skills yielded +51.9pp; Manufacturing +41.9pp; Software Engineering only +4.5pp. Interpretation: when a model already has high-quality procedural knowledge from its training data (as for coding), adding a skill is at best redundant and at worst conflicting. When the domain is under-represented in pretraining (healthcare, manufacturing, domain-specific research methodology), the skill provides what the model lacks.

## LLM Default Belief
An LLM asked "which domains benefit most from skills?" will default-predict that AI/ML or software engineering do — the domains it is strongest in. This is backwards. The correct answer is domains where the model is *weakest* (due to low pretraining coverage, not low task complexity).

## Evidence
SkillsBench pass-rate tables (paper reviewed in session, April 2026).

## Expiry Signal
If future models train on proportionally more healthcare/manufacturing data, the delta should narrow. Test on new frontier models before assuming the 2026 result still holds.
