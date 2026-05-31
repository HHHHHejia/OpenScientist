---
name: "Skillsbench Negative Transfer Mechanism"
memory_type: semantic
subtype: correction
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## Fact
SkillsBench found 16 of 84 tasks (~19%) where adding a human-authored skill *degraded* performance vs no-skill. Two documented mechanisms: (a) skill instructions **conflict** with the model's correct default behavior on tasks the model already handles well; (b) skills add **unnecessary complexity** and cognitive overhead that drowns out signal the model would otherwise use. Implication: every skill needs not just a "when to apply" scope but also an explicit "when NOT to apply" scope, and skill libraries should include a gating layer that decides whether to invoke any skill at all for a given task.

## LLM Default Belief
An LLM asked "does adding relevant-looking procedural guidance help?" will default-predict yes. The SkillsBench evidence is that the answer is yes *on average* (+16.2 pp) but is often no (16/84 = ~19%) on individual tasks.

## Evidence
SkillsBench negative-transfer tables (paper reviewed in session, April 2026).

## Expiry Signal
If skill-gating research produces reliable invoke/don't-invoke classifiers, the 16/84 rate should drop. Track this metric as a headline indicator of skill-library maturity.
