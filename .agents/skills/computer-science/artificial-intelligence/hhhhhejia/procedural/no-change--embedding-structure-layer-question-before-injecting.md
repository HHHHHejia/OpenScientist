---
name: "Embedding Structure Layer Question Before Injecting"
memory_type: procedural
subtype: no-change
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
You have a hypothesis that "concept X should be injected at the embedding layer as a typed prior." You are about to run an experiment. You have access to mechanistic interpretability tools.

## Decision
**Before running the injection experiment, first use interp to ask: at which layer does concept X currently emerge in a trained model?** If X's feature direction is already present in layer 0 (embedding), then injection adds nothing that training doesn't already produce fast; it may even hurt by constraining the learned basis. If X emerges only in mid-layers (k ≥ 3), then embedding-level injection is architecturally mismatched — you're asking the embedding layer to carry a signal that the network natively expresses deeper. If X emerges only when certain upstream conditions are met (context-dependent), then X is not a per-token property and shouldn't be a per-token feature regardless of layer.

## Local Verifiers
- Probing classifier accuracy for concept X at each layer — where does it jump from near-chance to high? That's the natural emergence layer.
- Feature direction geometry in the embedding layer — is there a cluster for X? If yes, injection is redundant.
- Sample efficiency curve: without injection, when does concept X become linearly decodable? Injection only helps if the answer is "very late in training" or "never at small scale."

## Failure Handling
If interp tools aren't available yet, run the injection experiment but instrument it with layer-wise probing in parallel — the by-product interp data is often more valuable than the experiment's primary result.

## Anti-exemplars
- Running the typed-embedding experiment without layer-wise probing; getting a null result; not knowing whether the null is from "model learns this already" or "wrong layer" or "wrong concept operationalization."
- Skipping interp because "the experiment is cheap" — the interp is even cheaper and informs every subsequent iteration.
