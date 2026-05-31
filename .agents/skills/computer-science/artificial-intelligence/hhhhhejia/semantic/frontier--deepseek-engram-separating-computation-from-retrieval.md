---
name: "Deepseek Engram Separating Computation From Retrieval"
memory_type: semantic
subtype: frontier
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## Fact
DeepSeek's Engram architecture explicitly separates *computation* from *retrieval* — attention is no longer the sole mechanism for both looking up information and transforming it. This is cited by the user (and corroborated in the session's broader discussion) as the cleanest existing example of a post-Transformer design principle: different cognitive functions deserve different architectural primitives, rather than forcing everything through attention. This is the architectural analog of the Kantian-categories argument at the *structural* level: attention as a universal inductive bias is too permissive; some capabilities (retrieval, causal inference, quantity) warrant dedicated machinery.

## Evidence
User-provided reference to DeepSeek Engram in the pretraining-paradigm conversation (April 2026).

## Expiry Signal
If later benchmarking shows Engram's separation underperforms pure-attention at matched scale, the "separate the functions" heuristic weakens; otherwise, this stands as the reference design for architectural function-specialization.
