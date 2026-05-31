---
name: "Tokenization Right To Left For Arithmetic"
memory_type: semantic
subtype: frontier
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## Fact
Singh & Strouse (arXiv 2402.14903, 2024) showed that **tokenization direction** materially affects arithmetic: right-to-left digit tokenization significantly outperforms left-to-right on numeric reasoning. The mechanism is that arithmetic naturally proceeds from least-significant to most-significant digit (carry propagation), and right-to-left tokenization aligns token order with computation order. A purely syntactic tokenizer choice moves accuracy — no architectural change needed. This is the cleanest existing demonstration that tokenization itself is an inductive bias, not a neutral preprocessing step.

## Evidence
Web search during the Kantian-priors architecture discussion; paper cited alongside BitTokens, xVal, and NTL as the four main pieces of evidence that token-level priors matter.

## Expiry Signal
If a future model achieves the same numeric accuracy with left-to-right tokenization at matched scale (through RL or data changes), the structural story weakens. Until then, tokenizer direction is a free knob.
