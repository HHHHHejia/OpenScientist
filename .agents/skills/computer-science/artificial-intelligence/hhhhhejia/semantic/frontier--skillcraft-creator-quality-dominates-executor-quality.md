---
name: "Skillcraft Creator Quality Dominates Executor Quality"
memory_type: semantic
subtype: frontier
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## Fact
SkillCraft cross-model transfer experiment: skills were authored by Claude, Gemini, GLM, and Minimax, then executed on all four. Claude-authored skills achieved 100% success on all executors with 54–80% token savings. Minimax-authored skills caused a 48% *increase* in tokens when executed by GLM — i.e., a bad skill is worse than no skill. The determining factor is the quality of the skill author, not the capability of the executor. Corollary (also in the paper): Haiku 4.5 + good skill (27.7%) outperforms Opus 4.5 with no skill (22.0%) — skills compress expert judgment in a way smaller models can use. Design consequence: in multi-agent systems, spend compute on skill creation by the strongest available model; executors can be cheaper.

## Evidence
Direct paper review in session; cross-model matrix reported in paper's transfer section.

## Expiry Signal
If future models show convergence (all creators produce equally-usable skills), this asymmetry disappears.
