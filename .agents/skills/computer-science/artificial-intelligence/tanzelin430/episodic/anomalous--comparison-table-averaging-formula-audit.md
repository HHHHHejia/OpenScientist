---
name: comparison-table-averaging-formula-audit
memory_type: episodic
subtype: anomalous
domain: computer-science
subdomain: artificial-intelligence
contributor: tanzelin430
source:
  type: session
  session_id: 7299d5b8-2507-436e-a0f3-4cdb3242110e
extracted_at: 2026-04-19
tags: [evaluation, result-tables, benchmark-coverage, paper-writing, ablation]
---

## Situation
A comparison table had a "Math average" summary column aggregating multiple benchmarks. Base (untrained) model rows and trained-model rows were evaluated at different times. While the LLM-graded evaluator was inactive, certain benchmarks (AIME 2024/2025) were not scored for base models, so their summary column silently averaged over 3 benchmarks. Trained-model rows, evaluated later with the grader active, averaged over 4 benchmarks (including MATH-500).

## Action
Row-by-row audit of the averaging formula, prompted by the user asking whether base and trained rows used the same benchmark set.

## Outcome
Base rows used a 3-benchmark average; trained rows used a 4-benchmark average. Because MATH-500 scores are generally higher than competition benchmarks, this deflated the apparent baseline and inflated the apparent improvement. Fix: standardize to the 4-benchmark formula for all rows, filling in the missing base model evaluations.

## Lesson
When evaluation coverage varies across model variants or checkpoints (e.g., due to infrastructure differences at collection time), summary/average columns can silently use inconsistent benchmark subsets. Individual cell values look plausible in isolation, making the discrepancy invisible without an explicit formula audit across all rows.

## Retrieval Cues
- Writing a comparison table where rows were evaluated under different conditions or at different times
- A summary/average column aggregating multiple benchmarks
- Some rows missing certain benchmark values
- Baseline or base-model rows evaluated with fewer active components than fine-tuned rows

