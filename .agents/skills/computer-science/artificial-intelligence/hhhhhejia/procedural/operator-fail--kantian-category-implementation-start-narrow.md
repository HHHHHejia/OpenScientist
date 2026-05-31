---
name: "Kantian Category Implementation Start Narrow"
memory_type: procedural
subtype: operator-fail
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
The research idea is "embed Kantian-style cognitive categories as priors in an LLM." You're convinced of the philosophical framing but have no concrete experiment.

## Decision
Do NOT attempt all 12 categories simultaneously; pick the 1–2 most operationalizable as a pilot. Ranked by existing precedent and feasibility:
1. **Quantity** — tokenizer-level (BitTokens / xVal / NTL all work here). Highest-confidence starting point.
2. **Causality** — requires identifying a concrete trigger (e.g., causal-connective tokens), then comparing token-type embedding vs no-prior on tasks that specifically stress causal chains (counterfactual QA, causal-attribution benchmarks).
3. Everything else (modality, relation, substance, etc.) — operationalization unclear; skip in pilot.

Target metric: **pretraining convergence speed** on a small model (not final accuracy — the prior should show up first as a sample-efficiency effect, consistent with the ~10⁴ human-vs-LLM gap). Specifically: at what number of tokens seen does the model with the prior reach the no-prior model's final loss?

Rejected — "implement all 12 Kantian categories as a type embedding and see what happens": no single experiment will succeed or fail cleanly, so no learning.

Rejected — "swap out attention for causal-specific machinery": too ambitious as first step; attention is load-bearing.

## Local Verifiers
- Does the chosen category have at least one existing paper showing a measurable effect (xVal, ELECTRA_POS, BERT segment embeddings)? If not, the category is likely too abstract to operationalize this pilot.
- Is the target metric sample efficiency (tokens-to-reach-loss) rather than final loss? Sample efficiency is where the prior should show.
- Will a negative result be interpretable? If you can't tell "no effect" from "wrong category choice," redesign.

## Failure Handling
If neither quantity nor causality shows a sample-efficiency gain with the type embedding, fall back to tokenizer-level redesign (different subspaces per type) before concluding the whole research program is flawed. The Kantian-categories-on-top-of-shared-embedding design is the weakest form of the idea.

## Anti-exemplars
- Starting with causality and choosing "because" as the trigger token — "because" is ambiguous out of context; evaluation will be dominated by context effects, not the prior.
- Testing on final downstream task accuracy rather than convergence speed — even if the prior helps, you won't see it at the scale the prior is measurable.
