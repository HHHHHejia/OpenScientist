---
name: "Xval Continuous Number Embedding Scaling"
memory_type: semantic
subtype: frontier
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## Fact
xVal (Golkar et al., 2023, NeurIPS AI4Science) represents any real number by scaling a single dedicated embedding vector by the numeric value. This makes the model end-to-end continuous in the number rather than discrete over a vocabulary of digit-tokens. Designed for scientific ML where numeric magnitudes are informative priors. Together with Number Token Loss (NTL) — a regression-style loss that gives cross-entropy a notion of numeric proximity (CE loss alone treats "predicting 3 vs 9 given true label 2" as equally wrong) — and Singh & Strouse (arXiv 2402.14903, 2024, right-to-left tokenization boosting numeric reasoning), xVal forms one of three concrete precedents that token-level inductive bias pays off in a bounded, measurable way.

## Evidence
Web search surfaced these three together during the Kantian-priors architecture discussion.

## Expiry Signal
Replaced when a frontier model ships with a built-in continuous numeric pathway that subsumes all three approaches; until then they are independent data points.
