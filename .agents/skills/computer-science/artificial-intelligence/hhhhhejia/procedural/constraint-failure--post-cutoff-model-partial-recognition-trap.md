---
name: "Post Cutoff Model Partial Recognition Trap"
memory_type: procedural
subtype: constraint-failure
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
An AI researcher or reviewer is assessing a "new" AI system / paper whose name partially resembles something in training data (e.g., "Mamba-3", "xVal", "TTRL", "Engram"). The researcher thinks they recognize it.

## Decision
Short/version-like names (`v0`, `Mamba-3`, `o3`, `2.5`) are high-risk for partial recognition — you may know the concept family but not the specific iteration. Default to explicit verification (web search, arXiv) rather than responding from priors, especially when the specific version is the point ("Mamba-3 in particular beats Transformer on language modeling — is that claim correct? Or is that Mamba-2?").

Rejected — "I know the general area, I can skip verification": leads to stale-specific claims ("Mamba has X capability") when the actual current state (Mamba-3) is different.

## Local Verifiers
- Is the claim about a specific version or the general family? Version-specific claims require verification.
- Is there a benchmark number? Specific numbers (`+4%`, `3× throughput`, `211% pass@1`) are rarely from general priors; they require a source.
- Are two related papers easily confused? TTRL vs MATTRL, BitTokens vs xVal, SkillCraft vs SkillsBench — all pairs in my own notes. Pair-confusion is the most common error mode.

## Failure Handling
If verification is infeasible (no tools available), flag the uncertainty explicitly rather than stating a number with false confidence. Pair-confused papers: state which pair and confess the uncertainty.

## Anti-exemplars
- "SkillCraft's main finding is that human skills outperform AI-generated ones" — confused with SkillsBench. SkillCraft is about whether agents can discover/reuse skills autonomously; SkillsBench is about whether human vs self-generated skills work.
- "TTRL improved Qwen on AIME by 211%" stated from memory — needs verification of the specific model variant (Qwen-2.5-Math-7B, not generic Qwen).
