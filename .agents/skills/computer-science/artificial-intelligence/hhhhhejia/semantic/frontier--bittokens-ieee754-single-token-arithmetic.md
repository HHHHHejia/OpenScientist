---
name: "Bittokens Ieee754 Single Token Arithmetic"
memory_type: semantic
subtype: frontier
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## Fact
BitTokens (arXiv 2510.06824, 2025) encodes arbitrary numbers as a *single* token using IEEE 754 binary floating-point representation. Small models achieve near-perfect accuracy on basic arithmetic when trained with this scheme. The paper argues that tool use and chain-of-thought reasoning are "crutches" compensating for poor numeric tokenization; the right intervention is at the tokenizer, not the decoding strategy.

## Evidence
Web search during Kantian-priors discussion (April 2026).

## Expiry Signal
If subsequent work shows frontier models with standard BPE/digit tokenization close the arithmetic gap through scale alone, BitTokens stops being the best argument for typed tokenization. Until then, it is the strongest known proof-of-concept that a token-level prior produces outsized sample efficiency gains on numeracy tasks.
