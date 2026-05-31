---
name: "Skillsbench Human Vs Self Generated Skill Gap"
memory_type: semantic
subtype: frontier
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## Fact
SkillsBench (Li et al., 2026) ran 84 tasks × 7 model configurations × 3 conditions (no skill / human-authored skill / self-generated skill) = 7,308 trajectories. Key quantitative findings: (1) human-authored skills yielded a +16.2 percentage-point average pass-rate lift; self-generated skills yielded −1.3 pp (essentially no benefit, slight harm). (2) Optimal granularity is 2–3 modules per skill. "Detailed" skill documents: +18.8 pp; "compact": +17.1 pp; "comprehensive": −2.9 pp (hurts). (3) Domain asymmetry: Healthcare +51.9 pp, Manufacturing +41.9 pp, Software Engineering only +4.5 pp — the pattern is that skill value scales inversely with pretraining coverage of the domain. (4) 16/84 tasks show negative transfer from skills (skills harm performance) due to conflicting instructions or unnecessary complexity on tasks models already handle.

## Evidence
Direct paper review in session (April 2026). The paper explicitly ran the 3-condition comparison and published per-domain delta tables.

## Expiry Signal
Replication attempts with newer models (e.g., post-Claude 4.7 frontier models). If self-generated skills start matching human-authored ones in follow-up work, the "skills must be human-authored" conclusion needs revision.
