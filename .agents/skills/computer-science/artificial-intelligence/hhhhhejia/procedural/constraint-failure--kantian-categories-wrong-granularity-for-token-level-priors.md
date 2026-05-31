---
name: "Kantian Categories Wrong Granularity For Token Level Priors"
memory_type: procedural
subtype: constraint-failure
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
Considering injecting philosophical/cognitive categories (e.g., Kant's 12 categories: quantity, causality, relation, modality, etc.) as token-level features or a type embedding added to the base embedding. Trigger: proposal of the form "give token X a feature Y encoding category Z at the input layer."

## Exclusions
Does NOT apply to feature injection at middle/upper transformer layers, to architectural changes, or to data-level augmentation.

## Decision
**Preferred:** Redesign tokenizer granularity and boundaries so different semantic types occupy disjoint subspaces (e.g., numbers tokenized with numeric-aware schemes like xVal or BitTokens, entity/relation tokens carved out at tokenizer time). This gives typed tokens *by construction* rather than as a flag on top of a shared embedding.

**Rejected — flat category feature on token embeddings:** Most Kantian categories (causality, modality, relation) are sentence- or paragraph-level phenomena. "because" expresses causality sometimes and not others; a single token can't carry the category robustly. Categories emerge at mid-to-high layers, not at the vocabulary layer.

**Rejected — trusting the "zero prior" framing:** Post-training embeddings are not zero-prior; a lot of the structure you want to inject is already learned implicitly in the first few training steps. Manual injection risks *constraining* better representations the model would otherwise discover.

## Local Verifiers
- Can the category be assigned to a single token deterministically in context? If no, it's not a token-level feature.
- Does the category map to a subspace already present in a trained model's embedding geometry? If interp shows it only forms in layer ≥ k, injecting at layer 0 wastes the signal.
- Is there a numeric/typed precedent (BitTokens for numbers, POS for syntax)? Dimensions with existing precedent are the only ones worth starting with.

## Failure Handling
If a category is genuinely sentence-scope, operationalize it as a learned structural bias (attention prior, positional modulation) rather than a per-token feature. If pilot ablations show no sample-efficiency gain from the typed embedding, the hypothesis that "the model already learns this for free" is likely correct — pivot to testing on lower-resource/cold-start regimes where the prior should matter most.

## Anti-exemplars
- BERT segment embedding (worked — but only because "which of two segments" is genuinely a per-token property, not a semantic category).
- xVal / BitTokens for numbers (worked — quantity is genuinely a per-token property of digits/number tokens).
- POS injection in ELECTRA_POS (worked for a syntactic category; does not generalize to epistemic categories).
