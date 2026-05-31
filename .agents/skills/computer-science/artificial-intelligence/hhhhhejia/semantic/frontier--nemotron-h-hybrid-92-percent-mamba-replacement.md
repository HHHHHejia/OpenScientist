---
name: "Nemotron H Hybrid 92 Percent Mamba Replacement"
memory_type: semantic
subtype: frontier
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## Fact
NVIDIA's Nemotron-H architecture replaced ~92% of attention layers in a Transformer with Mamba2 blocks, retaining a sparse set of attention layers. Result: ~3× inference throughput vs a same-size Transformer, with matched or better performance on reasoning benchmarks. This is the empirical evidence that the post-Transformer transition is *hybrid* (Mamba + attention), not a wholesale replacement. Separately, Mamba-3 as a pure-SSM open model surpassed Transformer on language modeling by ~4% at release. Stanford HAI 2025 reported a 400% growth in non-Transformer investment over two years and 60%+ of top AI labs having dedicated alternative-architecture teams.

## Evidence
Web search during 2026 research directions discussion.

## Expiry Signal
If attention-free models close the remaining reasoning gap without any attention layers, the "hybrid is the answer" framing falls; revisit as Nemotron-H+1 and Mamba-4/5 generations ship.
