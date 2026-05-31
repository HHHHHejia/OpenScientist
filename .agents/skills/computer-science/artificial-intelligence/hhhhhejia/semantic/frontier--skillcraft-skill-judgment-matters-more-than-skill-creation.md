---
name: "Skillcraft Skill Judgment Matters More Than Skill Creation"
memory_type: semantic
subtype: frontier
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## Fact
SkillCraft trajectory analysis showed behavioral divergence between Claude and DeepSeek as agents. Concrete case — the "cat encyclopedia" task requires 9 API calls for 3 breeds. Claude judged 9 calls too few to amortize skill creation and ran direct API calls (9 steps, 762K tokens). DeepSeek mechanically followed the prompt's "create a skill" instruction, produced a skill missing two fields, then needed 8 repair steps for a total of 15 steps and 1.5M tokens — nearly 2× worse than no skill. Knowing *when not to create a skill* is more valuable than knowing how to create one. For the "cocktail menu" task (25 calls, worth abstracting), the same pattern held: Claude built the skill right once; DeepSeek hit syntax errors, "return outside function" errors, retry loops, and ultimately failed in 19 steps at 1.14M tokens.

## Evidence
Direct trajectory analysis in the SkillCraft paper, reviewed in session.

## Expiry Signal
Once agent frameworks add explicit cost-benefit gating before skill creation, this behavioral gap should narrow.
